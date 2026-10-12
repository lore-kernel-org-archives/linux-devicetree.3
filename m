Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107DA3AA4F9
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791788240; cv=none; b=WaoPAnDQFpKf1zM6WWj+TZ/A33ZTZyRy8bxJWnY9OVz1z/vipdTWoJnkWTCjIGu+mWmgVCzDA0eBghvWAgHg0vkYoTVF8EkECogsUV6TrL0cPUtLGl7Yn7HYKxzR0TngAli3imPSEq6R/K1j0CP3MRlF8GuHu5uGaes8IRhmvos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791788240; c=relaxed/simple;
	bh=N9+XNzZY/dLLUIL8MRhEeChamyFUmJTZnlChIbG0o3E=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=kvUeWHzUQJlmAIKqkzDUaEroWy3tPW+K0XcEgrPiMIvsqh6bTZUdF5ugIII6QSKdtfcLcaEo+Pgd3bMzzzT8TK2rcvsem8THgT72qx7euYDHHPkHGKFiffReIFHNbjTTDSq6cJirWweYWM+BL5yYvcGDtqiENwTm/2ruynuyfIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MpaZJQXB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MpaZJQXB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 537C51F0089B;
	Mon, 12 Oct 2026 06:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791788238;
	bh=kIm7lHumSzCOPmYIyrS8Wh8tCWT3Tgo5yalZRvy8W84=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MpaZJQXBgyKSsvLmlkgYcOIv9gDQEVQFVQpvXsZzrWlPzwAnv29OPF9UaocvcNtK1
	 DYEIccVF8S9q+0Yx40j36yENPC9RfPhDbwlMHg8sgz0pAUiXUajNa/STrz6XJdVZ5x
	 IM/Hg0hxtrX01yQHfC9zshmXH3ZfwzGPQduea+w74G5+wPq0kJzJpbCB0mMBkBBL3n
	 yXNpZFYzU9treGejfOi3PeIA8bao8bzvhaS8GAWITSKXCm+boaLgkjhpxtKWYzRXC9
	 dyx9a1G2D6+tAHwkDLcd0THPuSGT2iHpTyCD8T6mqi6mwvBR0JjDWUfSzipOj3TkCb
	 okwElTY78fMuA==
Message-ID: <sashiko-outbox-167757@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v21 14/14] arm64: dts: qcom:
 kaanapali-mtp-camera-s5kjn5: Add DT overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: vkoul@kernel.org, media-ci@linuxtv.org, robh@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261011-kaanapali-camss-v21-14-04fd28d815c6@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-14-04fd28d815c6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 06:57:17 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dts: qcom: missing vddm-supply in s5kjn5 camera node
--

commit c1df83521b79d78bdf83d4c496be4b0e82a9f05c
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5: Add DT overlay

This commit enables the S5KJN5 image sensor via CCI on the Kaanapali MTP
board. It adds a device tree overlay for the camera module connected to
the CSIPHY2 interface in four lane mode.

> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso b/=
arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso
> new file mode 100644
> index 0000000000000..d0e39855e0e62
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso
[ ... ]
> +&cci0_i2c1 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
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

[Severity: High]
Does this device tree node omit the vddm-supply property?

Looking at the s5kjn5 driver in drivers/media/i2c/s5kjn5.c, it
unconditionally requires the "vddm" regulator during probe:

static const char * const s5kjn5_supply_names[] =3D {
	"vddio",
	"vddd",
	"vddm",
	"vdda",
	"vddio1p2",
	"afvdd",
};

Missing this property in the DT overlay will cause the driver probe to
fail with -ENODEV, or if the regulator core substitutes a dummy regulator,
the physical MIPI PHY power domain may remain unpowered, causing the sensor
to fail to stream.

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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011-kaanapali-=
camss-v21-0-04fd28d815c6@oss.qualcomm.com?part=3D14
