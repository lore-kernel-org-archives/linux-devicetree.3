Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8775A484255
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932492; cv=none; b=sXVS6U+imUq4LZIY2KEhDJ9k/NupWKdaoyoE3vIZbYEgLGQyX/m0eKVhMJfhEqu+kAJiscf8lZfKkKK0dZ2/vkxUOrf6Mn2gWWdJyozg2ApI4G431/Fry1v2HLJ7+M3cTJtdJaqTZgoJQybFiccoXq+eYOYpBwk6DIWB8lWj3Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932492; c=relaxed/simple;
	bh=cltgOaMvnXlRT+wm5O6nk8TR1T31qJFTibMDOMsLEDw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hjUlwNKWgBVsNR09ZLvtsSvVUDY1EkqU9LphgBn1OdXVv9Hwbd/4zBZFU2uHdKtq48oElT7P3NtKbx8txHvOuFfznFK1Nk9FSSmrPbuWyhepY4FrB+sePE6jGzGllEHb9wunowJ+bXE1icahEC3x4PytpAG1FJNrRUU/iwjO9DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gs4bFKEX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gs4bFKEX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1476A1F000FF;
	Fri,  2 Oct 2026 09:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932491;
	bh=D6s7V2OlxjlDvQ1O7VZTxgkTrvI7PZuA9qx6SWniQso=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gs4bFKEXQJD2KXGHfHLvZJCYyGI2fHfkpGAoue0bkGyXvardgxqqgHctGisDyyYRL
	 A0J7nDMunNn3U9bP2PGsN0Ae2sMetDk2JDhcTZAQ9QeEfZu8M5eOqwSgCgGKC+aDLo
	 Ae1RSOcGP8++7tdylNQt4+bv+gTDRmh2S+sFKw37Ql4XBr/SIL95WuFbxZUFOpBmA2
	 4L31swonDxlFpnaBEiSYamXAkYORYgQ6Lz3kSAX1qYTMbHXCgp5u59HCoLB5kRXli9
	 PFA6ee+SzF5kQ8DpGjvDbpdRid9XC5XznGqemIyPogYVN4wsnP3PvnjchRUv2fAeLA
	 e1QU6ugZBVSTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/3] media: i2c: Add Sony IMX681 sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sergey Lebedev" <lsa.uz@pm.me>
Cc: devicetree@vger.kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261002082537.74084-3-lsa.uz@pm.me>
References: <20261002082537.74084-1-lsa.uz@pm.me>
 <20261002082537.74084-3-lsa.uz@pm.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 09:14:50 +0000
Message-Id: <20261002091451.1476A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] media: imx681: data race when reading controls in TRY state
--

commit a33b99a3eba0fc3b30bb7afedc0eb847da781102
Author: Andre Gilerson <andre.gilerson@gmail.com>

media: i2c: Add Sony IMX681 sensor driver

This commit adds a V4L2 sub-device driver for the Sony IMX681 sensor. It
supports 10-bit Bayer formats over a two-lane CSI-2 bus with a single
3844x2640 mode at 30 fps, along with various controls including flips.

> diff --git a/drivers/media/i2c/imx681.c b/drivers/media/i2c/imx681.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/media/i2c/imx681.c
[ ... ]
> +static u32 imx681_get_format_code(struct imx681 *imx681)
> +{
> +	return imx681_mbus_codes[(imx681->vflip->val ? 2 : 0) |
> +				 (imx681->hflip->val ? 1 : 0)];
> +}

[Severity: Medium]
Is there a potential data race here when reading the control values
during TRY state operations?

When a userspace process calls VIDIOC_SUBDEV_ENUM_MBUS_CODE or
VIDIOC_SUBDEV_S_FMT with V4L2_SUBDEV_FORMAT_TRY, the V4L2 core locks the
file handle's TRY state, but not the control handler. Concurrently, if
another thread calls VIDIOC_S_CTRL to modify V4L2_CID_HFLIP or
V4L2_CID_VFLIP, it locks the control handler and mutates ctrl->val.

Because this code reads imx681->vflip->val and imx681->hflip->val without
acquiring imx681->ctrl_handler.lock, this can lead to KCSAN warnings and
incorrect media bus code reporting due to stale reads.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002082537.7408=
4-1-lsa.uz@pm.me?part=3D2
