Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794898335;
	b=KH86KfugD5cdKujjPzJD5GyIm8+XuiOpDMnCLvPzCRIPrgmcOqHeHDgyasHmoNV/YlrL
	 aFUbK0IXXDPmrbgFlQizAWq7ZU9n+DKaxDPWtCU72modzy5BlNWOMpPGPFcSEP7FF3HXT
	 dmi9itkjOd9CmYJSS7vO9kOdDSZ+X2LUaJBM6mGu+0yCoSjqMYfJTYhkyr2ro+SP/Ge8M
	 qwdiSUg8e7fxY66p+uvCOF/GSrmIhVtvLKNrSqByWNIjxRvCdFTISWxcdwhADyF79tL6p
	 2kBRnOo0mGQErfrHrmi2+DQv+ZtpA7l0jYbrLutopNrBjrBZlLX5md2T6fk8MCHMLQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794898335;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5NZ3XEgrs0JaKpU6uuTYivkYyZ9SQrxsqyQV/m+pDvY=;
	b=2J6iaiiUJ1zokA8UucVyczOwPyUsp/H+yr4r3mLJAFKXVDDmmjTpfq6BdirJg+i1qs1F
	 IKDSc3Y0coqJKHfZAkK4tgYMmD25YPSbLd7GcdGQLdwMF3FQvvtidElu3GFjTsGAsBM5v
	 54m2MOI+6pgoMum2BPOJR+nj2o8yBAI5dc9xPFoAbhLHRCnetqgIzACmrIgYhvF4iAUIy
	 v+8+TUbZn1tpB88MyWI+rHQp6yZDXH7HUr5mo7050uV0RY2MdUk+91fy8NfJA+HqhWtHp
	 BHZoedjPAsi42Gq8Gj2g5MMY2vErYztGsDpQq/+gipiHTXnMUMrrlS+SPFZxKD25o0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TJpWXT1K;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D5F606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TJpWXT1K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B6E91F000C4;
	Tue, 17 Nov 2026 06:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794898334;
	bh=5NZ3XEgrs0JaKpU6uuTYivkYyZ9SQrxsqyQV/m+pDvY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TJpWXT1K1pcAPWZefPH28GaTDwXWIxQ3dmuNteLy+Iwrr7q0/9i9kTlCAL0NTd+Fj
	 muZKuEABbG3XzEz86Vy8mhLHKoqKlGLTlR5U7x6GEOZG1FULC1tlBSILzQKeJfBNWI
	 lmYP3dpyEjxk9PqWbPmiQuWOIpgZ3J0hA5OmQCqdI/ZNJEmoE+YL2+IKUf3aOjqObw
	 +BeBEf+GZ01c31I2zyO0Lp1AqoVxzbZhiIman5Py2VH/r9sSibF07OoYfsTSKMc8ov
	 tWOyaGZwY+jc0VQKcG1slTko2QfA8uoqXr+FwHOSqza4cXtGNypwJCzaHs3CNb3TZr
	 jxU4FAcfUn8BA==
Message-ID: <sashiko-outbox-218281@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: eliza-mtp: Enable iris video
 codec
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wangao Wang" <wangao.wang@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261117-add_iris_for_eliza-v3-4-02a55a9272ef@oss.qualcomm.com>
References: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
 <20261117-add_iris_for_eliza-v3-4-02a55a9272ef@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 06:52:14 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] arm64: dts: qcom: eliza-mtp: iris_probe() fails due to
  child-node iommus
- [High] media: iris: NULL deref in iris_set_slice_count() from
  incomplete eliza_data
--

commit 0429ecb16555afb36c6bba89f407a14fa28f8a19
Author: Wangao Wang <wangao.wang@oss.qualcomm.com>

arm64: dts: qcom: eliza-mtp: Enable iris video codec

This commit enables the iris video codec device tree node on the Eliza MTP
board.

> diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts=
/qcom/eliza-mtp.dts
> index ee05192adcfb9..e5a698602dfc7 100644
> --- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> @@ -430,6 +430,10 @@ &gpu_zap_shader {
>  	firmware-name =3D "qcom/eliza/gen71700_zap.mbn";
>  };
> =20
> +&iris {
> +	status =3D "okay";
> +};

[Severity: High]
Does enabling &iris cause iris_probe() to fail with -ENOMEM?

In commit "arm64: dts: qcom: eliza: Add iris video codec node", the
video-codec@aa00000 node places its iommus phandles inside non-pixel and
pixel child nodes rather than on the video-codec node itself:

arch/arm64/boot/dts/qcom/eliza.dtsi {
    ...
		iris: video-codec@aa00000 {
    ...
			non-pixel {
				iommus =3D <&apps_smmu 0x1940 0x0>;
				iommu-ranges =3D <0x25800000 0xba800000>;
			};

			pixel {
				iommus =3D <&apps_smmu 0x1947 0x0>;
			};
		};
}

The upstream iris driver does not parse those child nodes and instead
operates directly on the top-level platform device.  Because the parent
node has no iommus property, pdev->dev is not attached to apps_smmu and
use_dma_iommu(dev) is false, so iris_probe() -> iris_reserve_iova_region()
-> dma_iova_try_alloc() fails immediately.  This layout also fails
dtbs_check against Documentation/devicetree/bindings/media/qcom,sm8550-iris=
.yaml,
which requires iommus on the video-codec node and sets
unevaluatedProperties: false.

[Severity: High]
Can enabling &iris lead to a NULL pointer dereference in
iris_set_slice_count() when encoding with multiple slices?

Enabling this node binds the device to eliza_data (added in commit "media:
iris: Add support for Eliza" in
drivers/media/platform/qcom/iris/iris_platform_vpu3x.c), which omits
.slice_caps, .wd_intr_mask, and .icc_ib_multiplier unlike the other VPU3x
platform descriptors.  When a user configures multi-slice mode
(V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB or
V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES), iris_set_slice_count()
dereferences inst->core->iris_platform_data->slice_caps unconditionally:

drivers/media/platform/qcom/iris/iris_ctrls.c:iris_set_slice_count() {
    ...
	slice_caps =3D inst->core->iris_platform_data->slice_caps;
    ...
	if (fps > slice_caps->max_slice_frame_rate ||
	    (rc_type !=3D HFI_RC_OFF && rc_type !=3D HFI_RC_CBR_CFR &&
    ...
}

Leaving .wd_intr_mask and .icc_ib_multiplier zero-initialized in
eliza_data also causes iris_vpu_clear_interrupt() and iris_vpu_watchdog()
to ignore hardware watchdog interrupts, and causes iris_set_icc_bw() to
vote 0 peak bandwidth on the video-mem interconnect path.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-add_iris_f=
or_eliza-v3-0-02a55a9272ef@oss.qualcomm.com?part=3D4
