Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E03D2DCF74
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783674694; cv=none; b=RbXELNQLl5JAynmFhobU1/LkK5tCkvGLqw6blUQnMtlnnnB4gvERdDUmZVt8Y3uLdeVsvKLZ0ap6m0Ya+pLCEAVPKP3uuZTNTG5oWJOBAFye7O+hCc+w9s5LKD3LThLTlsB3ic5yhp/QpMzKg1leFw2UmjHyenqQUY3vcrpwYYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783674694; c=relaxed/simple;
	bh=3Xaft/Teh2oRxmKiBVH+xyCq9ODNKbP0ooOcqHX07QU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cXUflGDpKR68rwUpV7StFABG4hSEw7xZhsYOHw+4MJJbfpprBbTAQgkNyAm6IotZbgLag83igNVXVSQ9wZX/7CGjAmKHzwkxdFBgDMMkRKXUxtvDJmUDFBxybE8Dq5SeInm/eYyj3WfOVG0ZJs8ongj1YWtkvkT9jl9z4kPI2V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kc/Onadb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kc/Onadb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC661F000E9;
	Fri, 10 Jul 2026 09:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783674692;
	bh=/p5g85+b002/OkpMpPL15/D/dGh+mLo4nAaoluyWLBw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kc/OnadbMp3fHyJnOpImCQvBFTqQ+uIy1obnMc09l99knCbC7LP7b5eWUfTK3+azF
	 qdwB2hgGTDbG2RXbDZXtMnmcm6MUru143t+gTtJetWOrcHlmNQLxW8+ohagCY9UYPB
	 /U1GibltGgra1HuQveG6Ni1m+qRqx48HhNjHTH4/ejbrun3Q8o3/y4MAOHTdCvWkAW
	 CEDGhzrJAwL4x4oYHYb1Oc/gY27/KFCNQ3yC8sSjaedpo+lb/Hu0uqe5TXvPCTjpy8
	 fUGbQGC2nU7xPwFwJrni7TcHg0vC7V6MLjyb+9nqS++XpPuMbQwLvB6OekUuRRAD3S
	 w3w6Q3KuF6CAA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/7] media: qcom: camss: Add V4L2 meta format for
 CAMSS ISP parameters
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260710-camss-isp-ope-v4-3-51207a0319d8@oss.qualcomm.com>
References: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
 <20260710-camss-isp-ope-v4-3-51207a0319d8@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 09:11:32 +0000
Message-Id: <20260710091132.8AC661F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The patch series introduces a new V4L2 meta format `V4L2_META_FMT_Q=
COM_ISP_PARAMS` but fails to include the required UAPI header (`include/uap=
i/linux/camss-config.h`).
- [Low] The newly introduced V4L2 meta format `V4L2_META_FMT_QCOM_ISP_PARAM=
S` lacks required UAPI documentation.
--

--- Patch [3]: [PATCH v4 3/7] media: qcom: camss: Add V4L2 meta format for =
CAMSS ISP parameters ---
commit 83fc58abbbf229c34d9df1193ba64e7a8a63b269
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

media: qcom: camss: Add V4L2 meta format for CAMSS ISP parameters

This commit adds a V4L2 meta format code (V4L2_META_FMT_QCOM_ISP_PARAMS)
for the Qualcomm CAMSS ISP parameter buffer. It allows carrying per-frame
ISP tuning data such as white balance, color correction, and chroma
enhancement settings.

> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index eda4492e40dc1..ee3a56f379d40 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -889,6 +889,9 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_MALI_C55_PARAMS	v4l2_fourcc('C', '5', '5', 'P') /*=
 ARM Mali-C55 Parameters */
>  #define V4L2_META_FMT_MALI_C55_STATS	v4l2_fourcc('C', '5', '5', 'S') /* =
ARM Mali-C55 3A Statistics */
> =20
> +/* Vendor specific - used for Qualcomm CAMSS offline ISP */
> +#define V4L2_META_FMT_QCOM_ISP_PARAMS	v4l2_fourcc('Q', 'C', 'I', 'P') /*=
 Qualcomm CAMSS ISP */

[Severity: Low]
Is the UAPI header defining the payload for this format missing from the pa=
tch
series?

The driver code appears to rely on structs like camss_params_wb_gain that
would normally be defined in include/uapi/linux/camss-config.h. Without this
header, including the definitions in camss-params.h will lead to undefined
type errors during compilation.

[Severity: Low]
Should this new format be accompanied by V4L2 UAPI documentation?

The V4L2 subsystem requires new formats to have their purpose, layout, and
semantics documented, but there doesn't appear to be an update to the media
documentation for V4L2_META_FMT_QCOM_ISP_PARAMS.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-camss-isp-=
ope-v4-0-51207a0319d8@oss.qualcomm.com?part=3D3
