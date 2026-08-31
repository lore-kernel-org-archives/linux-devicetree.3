Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AC83AFCE5
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788146114; cv=none; b=cWM7Sv1cHvCZLrs/5O5kOT5JKmYWNyBrlYpMaMHBDDMY84kbCE0WE8LrqF5L+KvjTG4Km+L4aUuIpyMF9lteYr1mlyxROQ3VH5nGUDiQ558rPiqXiJIyxViFLQMujc+YGfzPq11FUttd0KlA+zIejvs5xHTVhHPrukzeqsC07Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788146114; c=relaxed/simple;
	bh=iCd5aGbiC6cNU2qvX0yFi/bAprFwQjHVjso5Q0zzMcQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pBL8rrb9RoGGVQOqNL+GjfGUo6/bHyIjmPHtQDTd6TX2QZsdsZTQcg0DdIxtZpgs62dJFXhGqHenlOiWgv5YthgYwwWOwqC8DIs7ro+67GSo8SUwAVAU9K184mjniJVxA29mga8IYROMfMcJd34gMNKk/EAv3uIui8r/ZFCeLg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IbilKXVn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IbilKXVn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68B361F000E9;
	Mon, 31 Aug 2026 03:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788146111;
	bh=xmEDkdEQW8X3tNefPkG9dwgmRXoLstOn5QaK57WbqJs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IbilKXVnaXbosZsb5bniwg6/S8aS/0/b48dZiP3FIZAsAO+DGlOHct9gucNp14DTg
	 eibx3XrCLLSEVh73OU83A9SscPjNMFANCzZlHtywh/jMiaFqBLi0f8V1HRuz+bx0OG
	 cqdMTtBH8I1WnBw6PfzLbN4sOj+LKTLkd2HtVwfmBKNO+btZ7N7dY4kdYaE+An4CEe
	 jHHk4wwlsGgwCThfeuxI++Qbgx9XlCIQfINbOe2UCxIrbCjSAtOsxwBzmkcBzUlrpk
	 jJOkx3wNvcs9U9ibT0D9Yo3IAmrtUUI64Vy8gA7zLfMvHmCfV8XmlDJdhJWS3qZHQU
	 g9fQowAdgEotQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/8] usb: misc: qcom_eud: add per-path High-Speed PHY
 control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elson Serrao" <elson.serrao@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260831030147.1500616-4-elson.serrao@oss.qualcomm.com>
References: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
 <20260831030147.1500616-4-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 03:15:10 +0000
Message-Id: <20260831031511.68B361F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing locking in sysfs store handlers leads to concurrent access=
es that corrupt EUD state, unbalance PHY reference counts, and cause resour=
ce leaks.
--

commit 87088f50e77f42d71f8d902e8100685841983454
Author: Elson Serrao <elson.serrao@oss.qualcomm.com>

usb: misc: qcom_eud: add per-path High-Speed PHY control

This commit introduces per-path High-Speed PHY management for the EUD
hardware. It restructures the driver to dynamically initialize and power
the PHY associated with the currently selected active path.

> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index 25a6a8f110ec8..03d1c200658c8 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c

[ ... ]

> @@ -130,6 +192,10 @@ static ssize_t port_store(struct device *dev, struct=
 device_attribute *attr,
>  	if (port < 0)
>  		return port;
> =20
> +	/* Check if the corresponding path is available */
> +	if (!chip->paths[port])
> +		return -EOPNOTSUPP;
> +
>  	/* Port selection must be done before enabling EUD */
>  	if (chip->enabled)
>  		return -EBUSY;

[Severity: High]
Does this locklessly check chip->enabled and subsequently modify chip->port=
_idx,
creating a race condition with concurrent writes to the enable attribute?

If a privileged user concurrently writes to both the enable and port sysfs
attributes, the following sequence appears possible:

Thread A executes enable_store(true), reads chip->enabled as false, and sta=
rts
enable_eud(). It successfully powers on the PHY for the current port (e.g.,
port 0).

Before Thread A sets chip->enabled to true, Thread B executes port_store(1).

Because chip->enabled is still false, Thread B bypasses the EBUSY check abo=
ve
and changes chip->port_idx to 1.

When EUD is later disabled, disable_eud() will read the new chip->port_idx
and power off the PHY for port 1. This would cause a reference count underf=
low
on the uninitialized PHY for port 1, while leaving the PHY for port 0
permanently powered on, leaking the resource.

While later patches in this series might add a state lock to enable_store(),
port_store() appears to remain completely lockless, leaving this race unres=
olved.
Should port_store() also be synchronized against concurrent modifications?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831030147.1500=
616-1-elson.serrao@oss.qualcomm.com?part=3D3
