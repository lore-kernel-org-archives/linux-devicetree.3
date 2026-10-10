Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDB93B0AC3
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 16:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791649319; cv=none; b=j47i8A3DqZ29xzZ1bHOLMgBXEaX9scxWZVjPovFQouV+NI3kmcffdMTy7/X94jJXh0hAMVhD11XYrI696XyG88Cz/25KUKY4nTw071Te33hfGixeIafnz51LMb7f7Zn84CzEstNvIvrrnOKg5LVIxIIiqgTTxN1/KRYxW73tGzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791649319; c=relaxed/simple;
	bh=4pJUIO4P//MRzFfNZlebGIpaa+4EW6mJhKGkWdMjtbg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=QcFw+jHsAa+SnJp5n+uOSWx4/1Yzg6edWuGSgfMVyo6QdcHyjvlMb2J9NyYUKJcVkkotU1TsD2YgFFYb6me1b9CAdCElKrMgxY/hpMSn1fMbxyaOIgdoI1/Wi7xsjXbfuI+TCufKq1x98Ax2gwF8cnUFwp/YgY3Ods+H3Fkx/8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UY+W7Bxl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UY+W7Bxl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEF3F1F000FF;
	Sat, 10 Oct 2026 16:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791649318;
	bh=SPc0/Y6iXNR/DIEa8D4WXg5MQpzuCuz1GeqRFvKKh9I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UY+W7BxlfuScPOq238MIzgEyc1sk4XMFih63d7K121fcPpuvghIsRc4CqWocf2Z0c
	 i0hLZueMIoQLPgkiaASHQlNTnr6zztf0xehdwyot7eZZwCsEaLqDT39+0HXBdrQei0
	 JVGcMVe6PGCG+ZwUbfl6BcWWv5xzmLg0GMyDOQQXrOpf1/FACBObR0NF8GBioOm3OV
	 6610ZHw5jyy7qv1+1iQUZypf+fTPVbnys4SJ0oM1aS2y1mZEkF57NhCnjaqEAgIXM9
	 Cy49zA3KOe/9Hj+J/rx31imvuTj6NjDFuyd8+PWWrX0J81Hg3tcQjAk2Ja4UIdSL9d
	 mY/6Jop8TMR/A==
Message-ID: <sashiko-outbox-166732@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 13/13] arm64: dts: qcom:
 kaanapali-mtp-camera-s5kjn5: Add DT overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: vkoul@kernel.org, robh@kernel.org, media-ci@linuxtv.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org
In-Reply-To: <20261010-kaanapali-camss-v20-13-63e98ce9ac0c@oss.qualcomm.com>
References: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
 <20261010-kaanapali-camss-v20-13-63e98ce9ac0c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 16:21:57 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: qcom: missing vddm-supply in s5kjn5 camera node
--

commit 0aa98e9fff565e6ca9fb3ef259881330ddffce3c
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5: Add DT overlay

This commit enables the S5KJN5 image sensor via CCI on the Kaanapali MTP bo=
ard.
It creates a DTBO that configures the sensor on the CCI-0 interface.

> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso b/=
arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso
> new file mode 100644
> index 0000000000000..7b574e2ed3732
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso
[ ... ]
> +&cci0_i2c1 {
> +	camera@10 {
> +		compatible =3D "samsung,s5kjn5";
> +		reg =3D <0x10>;
> +
> +		reset-gpios =3D <&tlmm 3 GPIO_ACTIVE_LOW>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&cam_mclk2_default &cam_reset2_default>;
> +
> +		clocks =3D <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
> +		assigned-clocks =3D <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
> +		assigned-clock-rates =3D <19200000>;
> +
> +		vddio-supply =3D <&vreg_l4n_1p8>;
> +		vddd-supply =3D <&vreg_l1m_1p0>;
> +		vdda-supply =3D <&vreg_l4m_2p2>;
> +		vddio1p2-supply =3D <&vreg_l2n_1p2>;
> +		afvdd-supply =3D <&vreg_l7m_2p8>;

[Severity: Medium]
Is the vddm-supply property missing for the camera@10 node?

The s5kjn5 driver unconditionally requests 6 regulators, including "vddm",
via devm_regulator_bulk_get(). Because the device tree overlay omits
vddm-supply, the regulator core will print a warning and return a dummy
regulator, or fail with -EPROBE_DEFER if full constraints aren't applied.

If the vddm pin is not physically tied to another active supply, the sensor=
's
MIPI PHY will not receive power, breaking camera streaming.

> +
> +		port {
> +			s5kjn5_out_ep: endpoint {
> +				data-lanes =3D <1 2 3 4>;
> +				link-frequencies =3D /bits/ 64 <1248000000>;
> +				remote-endpoint =3D <&csiphy2_in_ep>;
> +			};
> +		};
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010-kaanapali-=
camss-v20-0-63e98ce9ac0c@oss.qualcomm.com?part=3D13
