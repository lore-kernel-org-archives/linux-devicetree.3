Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794973986;
	b=GUXO1Z5TGacPx7AQ298wTQiMbUbtU8dJNPYeNl3PPRvlK3lOtkBWi8UyfFHLc5/D8Hfz
	 wNGg3VlEvUY0Qzz03stFI48x2VNX5LxM9R0zc4KF+ypaqFDkFkMLE1qf5y42YobDtdMFP
	 sz3K1IpRdeSWHk5BBmXUl1T58fMJcd5Gs3imCzit/aHokJ8UKeJgyvDXTBmcrvqDX+Wlp
	 uXhUp63wyOiSdBCPappKn08PF+CneHcXsmkp8aHAk2iRDsUxeq1p+qE5fSJklxJZ4w3Qu
	 9IBRLmf8Eb7lmhaTqBIQyJ4ih4vqJx67QsaEe2fZIm9zhf02tiX+wvxDnguR5WqQtmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794973986;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ErXbuiDNooUM7gaKd5/4LvbXLH0aJojlLHXdIKwBRj4=;
	b=joXk0dZUgeYDTB9q5Cabd994XTNkGIaHXDQqqdlqDHnAr9gpqD7/lxDc729oIxfnRiob
	 eVNBaP4JJWdKzW5JTiE9NBUUt0joBs3/UqzKKi7iLN9A9DEBN2Od0C33R2I0z/wkROwLo
	 BgNgHTrdN7C8LLZFLZprFIDq3cGSylOdjHd7TUzchQmMTNtrGN0u49MyX8jeDrMm0EISM
	 uf9GUN8beJSLHGLhUPtSWZhKVe4Tq58KMqhtGEkutc8yi15V1ivH2kKJcKC3sBkidFRnO
	 wD+PgD+L0Z/eVFyTNpCWC8Ec88cXuUihc1CHpAeR1qzZ359HUJ1KF3ztnATZG2wNv+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DtljT4xy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7978606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 03:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DtljT4xy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EAD21F000C6;
	Wed, 18 Nov 2026 03:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794973986;
	bh=ErXbuiDNooUM7gaKd5/4LvbXLH0aJojlLHXdIKwBRj4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DtljT4xyQkj5oCvbG8C+Hk3+na+SOPhelXZb0ZlgGkS7TDiE7IQnsnEizWwRzHRSP
	 daEe+hxJkGd+7D3BeBM0FRSSn5LtY+IzaBQEYkiVlv81JXYSO/oGTyMXjZ7xI3iOQb
	 tiZljeHFvs8YZVVFsr3sSOsj3InsIjOPRTVvHhHBUAkbC4ZKikT2tnWzSuG8pC/uPk
	 v18mjlSTGrBxDNWdHbakt2TBt7zICNQ83ySEanePecwF7l3161mAQXwmSe5MZn6qfA
	 YE2av1RmCp4CJxXCt+doReyjXOx2VRB0EpIQ+BUvZ35NzuOG6qG2+2HhPhCsIQ3y9+
	 cCO6s0ypZgeng==
Message-ID: <sashiko-outbox-220055@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: maili-mtp: Add WCN7850 WLAN
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yijie Yang" <yijie.yang@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118-wlan-bt-v1-1-18bb1b059a17@oss.qualcomm.com>
References: <20261118-wlan-bt-v1-0-18bb1b059a17@oss.qualcomm.com>
 <20261118-wlan-bt-v1-1-18bb1b059a17@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 03:53:05 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] arm64: dts: qcom: maili-mtp: wrong vddrfa supplies in
  wcn7850-pmu
--

commit 0117df6375848f6603dc465badcac7a530d4ecbc
Author: Yijie Yang <yijie.yang@oss.qualcomm.com>

arm64: dts: qcom: maili-mtp: Add WCN7850 WLAN support

This commit adds the WCN7850 PMU node, PCIe Wi-Fi node, and associated
pinctrl configuration to enable WLAN on the Maili MTP board.

> diff --git a/arch/arm64/boot/dts/qcom/maili-mtp.dts b/arch/arm64/boot/dts=
/qcom/maili-mtp.dts
> index 5409d0a7ec2e0..a3c2016eb9053 100644
> --- a/arch/arm64/boot/dts/qcom/maili-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/maili-mtp.dts
> @@ -142,6 +142,63 @@ sdcard_vdd_3p0: sdcard-vdd-3p0 {
> =20
>  		vin-supply =3D <&vreg_bob1>;
>  	};
> +
> +	wcn7850-pmu {
> +		compatible =3D "qcom,wcn7850-pmu";
> +
> +		pinctrl-0 =3D <&wlan_en>, <&sw_ctrl_default>;
> +		pinctrl-names =3D "default";
> +
> +		wlan-enable-gpios =3D <&pmh0104_c_e0_gpios 7 GPIO_ACTIVE_HIGH>;
> +
> +		vdd-supply =3D <&vreg_s1j_0p8>;
> +		vddio-supply =3D <&vreg_l2d_1p8>;
> +		vddio1p2-supply =3D <&vreg_l4g_1p2>;
> +		vddaon-supply =3D <&vreg_s9d_1p0>;
> +		vdddig-supply =3D <&vreg_s3c_1p2>;
> +		vddrfa1p2-supply =3D <&vreg_s9d_1p0>;
> +		vddrfa1p8-supply =3D <&vreg_s7g_1p2>;

[Severity: High]
Are vddrfa1p2-supply and vddrfa1p8-supply shifted off by one rail here?

vddrfa1p2-supply is wired to the 1.0V vreg_s9d_1p0 rail (duplicating
vddaon-supply) instead of the 1.2V vreg_s7g_1p2 rail, while vddrfa1p8-supply
is wired to the 1.2V vreg_s7g_1p2 rail instead of the 1.8V vreg_s4c_1p8 rail
defined on pmh0104_c_e0:

arch/arm64/boot/dts/qcom/maili-mtp.dts:
		vreg_s4c_1p8: smps4 {
			regulator-name =3D "vreg_s4c_1p8";
			regulator-min-microvolt =3D <1808000>;
			regulator-max-microvolt =3D <2040000>;
			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
		};

Because pwrseq_qcom_wcn_vregs_enable() only calls regulator_bulk_enable()
without setting voltages, the mismatch is not caught at probe time; instead,
vreg_s4c_1p8 is never enabled when powering on WCN7850 and can be disabled
as an unused rail by regulator_late_cleanup(), breaking WCN7850 bring-up.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-wlan-bt-v1=
-0-18bb1b059a17@oss.qualcomm.com?part=3D1
