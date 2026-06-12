Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8677D3806C6
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781257013; cv=none; b=nxWTmoeWyGwiy3O7ioyxLSCjB7uvD+r0vtQjQ5YGohjQVTS/IBHPOr+t/RCmUslbprdbEgqwHnWvfOyrWKbbE2sssuzvZ9Q304BbaQQq6w6IlqXeDRfMibE1jkP5hjH/muVTi12a4ZFoHiUORAfEItwAklbM4Id+ZOCpV6ROsc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781257013; c=relaxed/simple;
	bh=lTd4PkkQZKbkdbT7If/X1emPeZ6C+Iszf1tx9Bz2r4Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UABzN6qbNLHHPnRR2aKnZm48TMBR8i/EeBPmVhPlCeytZveGfNu/jO5oIJFiuC2FoJ3sd0+faWQ/5cURgu9HuuB4HsLcXD00XTsTaBy90nmWrExE6T+TdbuZgWKegwij9tza0Hr2nvrqTF5ZButFhgUK861vUZw810YOW2RmDv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B7g86kGR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B7g86kGR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8105F1F000E9;
	Fri, 12 Jun 2026 09:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781257009;
	bh=SasMNM7f6Ljfea4JniuN6TzvqB5fUsOz6e33s/ItI3s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B7g86kGRJp6SG1aPl9qQtNrzAV/MWpANrRWHkr1NG5VYc1eoNYh37eFPiciwEIn2H
	 8Esf6o/Hti7trRQ7Uv8Gqlfh+s7ULE48PYk0ri9SFJD/j9pku6y0L4tNNvojxg9WtY
	 lWZGRI20LKzqa8oXKUM41mamq692QCMmozTIY8g7BpHYxILx34v96MfNk0Qn+D86lK
	 nlNpCRNN03FUTN92TGcE3ucdMHKOJpOgxWYo6yVypzRpT+G7ywdYcn8RBPsO3xXQzA
	 oV5oCe6d4Tq7ivzqOEUgFP5ni2pDEBgsVPIOkCZaFn9Luezkx5QWrl1qOwQh22wueA
	 dnQ7EhjEu+2QA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 02/16] media: iris: Filter UBWC raw formats based on
 hardware capabilities
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260612-iris-ar50lt-v4-2-0abfb74d5b3c@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-2-0abfb74d5b3c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 09:36:49 +0000
Message-Id: <20260612093649.8105F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The logic to dynamically filter out UBWC raw formats in the video =
decoder is incomplete and fails to omit the 8-bit UBWC format (QC08C).
- [Medium] Incorrect use of the encoder UBWC version field to validate deco=
der capabilities.
--

commit a8db7d07b5e1a7229c20919b2735cd3483c3c3ab
Author: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

media: iris: Filter UBWC raw formats based on hardware capabilities

The raw formats supported by Iris were previously advertised unconditionall=
y,
assuming UBWC support on all platforms. Use the UBWC configuration provided
by the platform to dynamically filter raw formats at runtime. If UBWC is
not supported, UBWC-based formats are omitted from the advertised capability
list.

> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media=
/platform/qcom/iris/iris_vdec.c
> index 9e228b70420e4..7da43f312ba98 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
[ ... ]
> @@ -82,6 +84,9 @@ static bool check_format(struct iris_inst *inst, u32 pi=
xfmt, u32 type)
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>  		fmt =3D iris_vdec_formats_cap;
>  		size =3D ARRAY_SIZE(iris_vdec_formats_cap);
> +		/* Last format is UBWC; drop it if UBWC is unsupported */
> +		if (!ubwc->ubwc_enc_version)
> +			size--;

[Severity: High]
Does this logic successfully drop all UBWC formats?

Looking at the definition of iris_vdec_formats_cap, it appears there are
multiple UBWC formats interspersed:

static const u32 iris_vdec_formats_cap[] =3D {
	[IRIS_FMT_NV12] =3D V4L2_PIX_FMT_NV12,
	[IRIS_FMT_QC08C] =3D V4L2_PIX_FMT_QC08C,
	[IRIS_FMT_TP10] =3D V4L2_PIX_FMT_P010,
	[IRIS_FMT_QC10C] =3D V4L2_PIX_FMT_QC10C,
};

By just decrementing the size, it seems we only omit the last format
(QC10C), but QC08C would remain within the array bounds. Could this
cause QC08C to be incorrectly accepted by check_format() on platforms
without UBWC support?

[Severity: Medium]
Should this check use the decoder version instead?

Since this is the video decoder implementation in iris_vdec.c, checking
ubwc->ubwc_enc_version might lead to incorrect filtering on future hardware
platforms where UBWC support differs between the encoder and decoder. Would
ubwc->ubwc_dec_version be more appropriate here?

>  		break;
>  	default:
>  		return false;
> @@ -121,6 +127,9 @@ static u32 find_format_by_index(struct iris_inst *ins=
t, u32 index, u32 type)
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>  		fmt =3D iris_vdec_formats_cap;
>  		size =3D ARRAY_SIZE(iris_vdec_formats_cap);
> +		/* Last format is UBWC; drop it if UBWC is unsupported */
> +		if (!ubwc->ubwc_enc_version)
> +			size--;

[Severity: High]
Does this also result in find_format_by_index() returning a UBWC format?

Because QC08C remains within the decremented array bounds, would querying
index 1 still return V4L2_PIX_FMT_QC08C to userspace even when UBWC is
unsupported?

[Severity: Medium]
Similar to the issue above, should this use ubwc->ubwc_dec_version instead
of ubwc->ubwc_enc_version to properly validate decoder capabilities?

>  		break;
>  	default:
>  		return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612-iris-ar50l=
t-v4-0-0abfb74d5b3c@oss.qualcomm.com?part=3D2
