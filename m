Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0CB194A6C
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 15:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785425558; cv=none; b=SoZ36Lsn8n2dS5SgGXpXyKaG5LrD4vSwVZWECr+CiG/zEZ5D9b2wpvrlOAxEBl6Cr/TCpCyO4REMT9QOvRZYlrIH5i9b5yU4eBjKAgXFY3pT9FMDJDWjLBvIJPa0Du6hdu08+HKKHI0kdekCkAEg9snw8lJD5mkkJkx2OOkmT/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785425558; c=relaxed/simple;
	bh=iD3Kkh4N8tnCOaKueSda+XrpsP3WNDlW85HnawW4O8I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UrbeNzzK9SWMVLwwxVzv4OZnaJuvKR43O8JlrS5KofMllC4Imc2XrVGRYeiPbpHzH1ysrg8ac8TN/vPxdTxemKF8PfK2u6rhw8dDa0XouywoJR0dCNIs/Ld51xH4k2u9EYoD6tjP+IOtvj9nWU4a0e3SPHQ1dbLJxZEoBIigaa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jxwtz2f+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jxwtz2f+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 773A01F000E9;
	Thu, 30 Jul 2026 15:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785425556;
	bh=Wag7+XaRq8gXmkBnBAZP5dr0WAuUBdkwCXmOoK7uV8Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jxwtz2f+FXQzHjkvpq0irVzdjUflZgWgLyM5ibYA6rs8MRIrjtR2CyUjn2nMqTM5w
	 z9J7topeDdMqxpPmigvuLqVU1BxNPKyaymNGNH365FF5YXZ1Cec6uDJ2yjVL/Gg16U
	 Mk1bHK0YuQrR8vdVxnlTEXOeqZ4RJNn6TwR9Ae3BIf1xjv4plyFeg9RQ5O8BqrhL1T
	 UG2f4nqXn6KFHGG4NO7DpYizjNkE2b1ViM90Qs0PvVTxqn/50WDTc5ncxpWGuUXGdu
	 tkmemuLt5MZJAyATDbf5OnUyFrzYvMtufnmOf+sDCLV89EEvXCRAZO50GEHZtuMkue
	 MUMAngAi8+xWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 02/18] media: iris: Skip UBWC configuration when not
 supported
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: robh@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260730-iris-ar50lt-v8-2-6597c08cea6f@oss.qualcomm.com>
References: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
 <20260730-iris-ar50lt-v8-2-6597c08cea6f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 15:32:36 +0000
Message-Id: <20260730153236.773A01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] UBWC system initialization is skipped on unsupported platforms, bu=
t UBWC V4L2 pixel formats are still unconditionally exposed and accepted, l=
eading to invalid session configurations.
--

--- Patch [2]: [PATCH v8 02/18] media: iris: Skip UBWC configuration when n=
ot supported ---
commit 2c20085257ddd4d7a77928a6e07815a827326525
Author: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

media: iris: Skip UBWC configuration when not supported

This commit skips Universal Bandwidth Compression (UBWC) configuration
during system initialization on unsupported platforms. It achieves this
by checking if the UBWC encoder version is non-zero before sending UBWC
properties to the firmware.

> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/dr=
ivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> index 0d05dd2afc07d..6e04175eb904b 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> @@ -140,6 +140,9 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *=
core, struct iris_hfi_heade
>  				    &payload,
>  				    sizeof(u32));
> =20
> +	if (!ubwc->ubwc_enc_version)
> +		return;
> +

[Severity: High]
This is a pre-existing issue, but while this patch prevents UBWC system
initialization on unsupported SoCs, are UBWC V4L2 pixel formats still
unconditionally exposed and accepted by the driver?

In drivers/media/platform/qcom/iris/iris_vdec.c:check_format(), the request=
ed
format is validated against a static array without checking for UBWC suppor=
t:

    case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
        fmt =3D iris_vdec_formats_cap;
        size =3D ARRAY_SIZE(iris_vdec_formats_cap);
        break;

If userspace selects a UBWC format (like V4L2_PIX_FMT_QC08C) on an unsuppor=
ted
SoC, it appears drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c:
iris_hfi_gen2_set_colorformat() will still send UBWC session properties to =
the
firmware:

        switch (pixelformat) {
        ...
        case V4L2_PIX_FMT_QC08C:
            hfi_colorformat =3D HFI_COLOR_FMT_NV12_UBWC;
            break;

Since system-level UBWC configuration is now skipped, will sending these UB=
WC
session properties cause firmware errors or stream failures? Should the dri=
ver
also filter out UBWC formats during enumeration and validation on these
platforms?

>  	payload =3D qcom_ubwc_macrotile_mode(ubwc) ? 8 : 4;
>  	iris_hfi_gen2_create_packet(hdr,
>  				    HFI_PROP_UBWC_MAX_CHANNELS,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-iris-ar50l=
t-v8-0-6597c08cea6f@oss.qualcomm.com?part=3D2
