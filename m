Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E37C2D7DC8
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 13:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781789638; cv=none; b=RIbwupD2TosqIEF2emmDJP9HogliftWjGH27TSgmKDRUpUc5OX/Jk8sYzUevntVsWdttthlHRnB78x8izE+bq7lw4cbjN6mIGhYsnq1SCoxgzUFBTFMh5X3WpQ5MIsobSUKIhkadlo6JRaCpmb5MyVv81HbdGE79fcQcJM7zFvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781789638; c=relaxed/simple;
	bh=P6ATCTrFrhVdRDoJllGsvp3uHPUPE4vhEOPykxdba9Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WIJ3HconKyuwdSVoFDqJ6F+qbgCvkW7k+unxCnUZMz542WA/LHp8XG//ySFlAChfIqlhlCamZQoW1CghbyXIDPW55zsqb39QFCbMtpQUguW8R5lpwQYoTbDFnYMkxHjeNqG/N136DdPNN7O0B/o0M/OZWPV1qJvszoiOwP7R41Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N7hHwa/p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N7hHwa/p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEDF01F000E9;
	Thu, 18 Jun 2026 13:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781789637;
	bh=ENDPzBBNS+2Sr+55wY+ITTjbxjs/Ncd+ECFADZnmPWM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N7hHwa/pzpM0lsUA7I+oZPRa2Gxr7HTOdcjXdTulleHrTkqaEOo6hXRI5r0MMw5CI
	 K/y+XHIOcemVOolwVEe1WBL3FGbp2d7VdBMxY1pedFBdwaCH408dVvfAWjO8xASiAn
	 PujHr93041GThuuv6u06Lf292dGBg8iffGlCAiiwhLOJ7hxai0Y4zTyZ2z0qmsi0QC
	 9fVpA0phShnEhjTxnY/C97SdO0M6+fH8NCjeboRyNWR1mrX90fIL+3PDtsF/bpfZfX
	 GGrXIkfnfaWuDUk5UZP2YxZYrfUixBZb7kmocozR7UA4sjolfs/bKvfQsiHvGEVx0J
	 DZ4C2xN6fAjvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 07/16] iio: core: add hierarchical channel
 relationships
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260618-ad9910-iio-driver-v6-7-79125ffbe430@analog.com>
References: <20260618-ad9910-iio-driver-v6-0-79125ffbe430@analog.com>
 <20260618-ad9910-iio-driver-v6-7-79125ffbe430@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 13:33:56 +0000
Message-Id: <20260618133356.DEDF01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message claims the new attribute returns the 'parent =
channel label', but the implementation actually returns the parent channel'=
s sysfs prefix.
--

commit 1d085ae0a672cb964aa54dcb759867393a24b06b
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: core: add hierarchical channel relationships

This commit adds a parent-child relationship between IIO channels. It
introduces a parent pointer field in the iio_chan_spec struct and exposes a
sysfs attribute for userspace to read the parent channel information.

>     Add parent-child relationship between iio channels by creating a pare=
nt
>     pointer field in iio_chan_spec struct and exposing a sysfs attribute =
that
>     returns the parent channel label.
>
> Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>

> diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-c=
ore.c
> index 9373006235c87..3d12269f26f4a 100644
> --- a/drivers/iio/industrialio-core.c
> +++ b/drivers/iio/industrialio-core.c
> @@ -854,6 +854,21 @@ static ssize_t iio_read_channel_label(struct device =
*dev,
>  					 to_iio_dev_attr(attr)->c, buf);
>  }
> =20
> +static ssize_t iio_read_channel_parent(struct device *dev,
> +				       struct device_attribute *attr,
> +				       char *buf)
> +{
> +	const struct iio_chan_spec *parent =3D to_iio_dev_attr(attr)->c->parent;
> +	int len;
> +
> +	len =3D __iio_chan_prefix_emit(parent, IIO_SEPARATE, buf, PAGE_SIZE - 1=
);

[Severity: Medium]
Is the commit description accurate regarding what this attribute returns?

The commit message states it returns the parent channel label. However,
looking at iio_read_channel_parent() in drivers/iio/industrialio-core.c,
this implementation uses __iio_chan_prefix_emit() to return the parent
channel's sysfs prefix instead (e.g., in_voltage0).

While returning the sysfs prefix makes sense for userspace to locate the
parent channel, using the term label in the commit message breaks IIO API
terminology. Could the commit message be updated to state that it returns
the sysfs prefix rather than the label?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618-ad9910-iio=
-driver-v6-0-79125ffbe430@analog.com?part=3D7
