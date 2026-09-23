Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3098E442B06
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 07:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790148557; cv=none; b=BoaOZgQqrDxN1IpuudOB6ceJzLf01/vL0R7YLcUvu7ipXtO0h87c3o3ZaAEEuVhPZfvuAPa+BMQg8S48NOaUZsFAQk8UtwNRmYzkYu9oZLHLnqFV1o8nSTyHDHq1AkUPe9Ns0v4sMhpLSuJMsHKnIR4AQlIFMyxqJAKYsbiLV/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790148557; c=relaxed/simple;
	bh=WBC4rnjX+6NR+YOFuO0K/PB01jA2PC26gX+/l5hAVBQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LsRDSvM7lzX5ym9lHKS57JyvlXuZ+6rV/QJgmtIFlRy1/digbauQ2QXCueg5LNqtEt8e++MgO+VE5qQgVJtf+iwwwwDpiczqtQcP2a5tDfWlz1SLKHsvzJiue1iHCucvhnQma9KwFtVXvg7PLJVVaBRtUzgnW1QTUd0nzQ8a8uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MfIwlPye; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MfIwlPye"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C33A1F000FF;
	Wed, 23 Sep 2026 07:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790148555;
	bh=7nsgTZulnMUPuwYurf+Sq8KnT33grXPn9vQzr0CKYec=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MfIwlPyejGBKomlajYve+SfaDMI3MoC9AIUhe4ILrT0J6Bl+1Nj5s22HxGbrNULB3
	 Ak3jBY/Y8VlMYazfnh+d0Hm0ZUdPgieqmOd3hZMVt2KN2WTGNP2pEpduzh3wjfvFr0
	 i3UXnxiM4bUhaEhvmUwNYdoqeJss5uCRNDlS/Rf+ysvKMzPb1yt5gLPvy/gY+UDj4m
	 +K4cIbbl5F9knRlXaxoGJHuXdRHDNrmSo/+EjXHf8BV3auDW6Rqo6oCkJerCuG0Gfm
	 LXZWdKH1CcBID1O/Ujbr8yIms9P/JY9uaFc7ETz2tk+caRb+0OLd3X6xDyvgcaMGpc
	 Ph/gX/yJCJUvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] regulator: Add RPMI voltage service
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Yeong" <joshua.yeong@starfivetech.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260923070014.1340761-3-joshua.yeong@starfivetech.com>
References: <20260923070014.1340761-1-joshua.yeong@starfivetech.com>
 <20260923070014.1340761-3-joshua.yeong@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 07:29:15 +0000
Message-Id: <20260923072915.9C33A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Build Failure
--

commit 6effdf04903f1a405d2def7e8745701a7d1522d8
Author: Joshua Yeong <joshua.yeong@starfivetech.com>

regulator: Add RPMI voltage service

This commit adds a mailbox client based regulator driver for the RISC-V RPMI
voltage service group. The driver enumerates the voltage domains advertised
by the platform microcontroller and registers each of them as a regulator.

> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index 7d151433747be..8ad4159a8bcfe 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -1274,6 +1274,19 @@ config REGULATOR_RC5T583
>  	  through regulator interface. The device supports multiple DCDC/LDO
>  	  outputs which can be controlled by i2c communication.
> =20
> +config REGULATOR_RISCV_RPMI
> +	tristate "RISC-V RPMI based regulator driver"
> +	depends on MAILBOX || COMPILE_TEST

[Severity: Medium]
Will this cause a build failure when COMPILE_TEST is enabled but MAILBOX is
disabled?

The driver directly calls mailbox subsystem functions like
mbox_request_channel(), mbox_send_message(), and mbox_free_channel(). Since
include/linux/mailbox_client.h does not provide dummy stubs for these
functions when CONFIG_MAILBOX is disabled, compiling this driver without
the mailbox subsystem results in undefined reference linker errors.

Should the dependency be strictly depends on MAILBOX, or perhaps conditional
based on architecture but retaining the strict mailbox dependency?

> +	default RISCV
> +	help

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923070014.1340=
761-2-joshua.yeong@starfivetech.com?part=3D2
