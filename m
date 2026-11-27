Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791711;
	b=YZ63lBx+xgDmkYDTExdTSdc/4Hdao1m0wZoy/NCId69bFKlYA/I6Ocri7KRK3oHOo0eT
	 sQR1xNzLmWCyMMgx1fQa4ChgGCelFV8cYPzigaiCpc5KZP3bQTcMetL8x7D7Wz016i9eZ
	 PL4VCeAJCgznfj523gqZSgtU7dG2hf9LKcefGwQusczvAz36cOx2z5m8G1EldHuWXP/nI
	 pTW+A7y4GeXCB9diiEfP3MlTJ0URGTNFOs2jAsKqA3Jq8OtGLxUItzd96pz8mEvnIz3fU
	 kKNWB1R4Vu5vDrLVi8dVJmfo25S+EM6WOROq4E6CiPTptLt23arN+ASUFCP6pOqVXbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791711;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=165byr1M0l/CeIEcaE8a3IYPkA/L/GtUZnNCwNGI1gs=;
	b=AJ2R+vYon6KOm4YNYMelImVF7svUYFUkQu2OjWukSqJg2k+S+Te1I6yIN/LuCb+8wjdv
	 0BYWjAVgFqn3E/s+IIYjJLkLLM7aL2Zf0WiOUkzTdgCLo60qbvyhw6VdmCh5hRGvoxixW
	 e5RldDOcL5Lkbzt+oBbxwcmnVDdfhqNnpWDQIKol8fWeSzFlCbnKE0/HDh8xETIkHZLkf
	 WEHGgvurseeZcm1FJn+UfoFyf8WPQpDzx1BfYzs1nTkL4pyjn70daNSQYK+l+wHJ9ac+s
	 0vcridwp/UM1Z8RIbRR2CkGJ5UBC6w0zOS6ICCnsPu55a9VZkw72eS9q9Yequ7Z2gmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MBbHMQfT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8CC606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 15:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MBbHMQfT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C965D1F00893;
	Fri, 27 Nov 2026 15:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795791711;
	bh=165byr1M0l/CeIEcaE8a3IYPkA/L/GtUZnNCwNGI1gs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MBbHMQfTaF6sKHmSbh8YWC7ACD9QyETYqZ34Wt7A1dkNn4BCTaa36LHyQJhNGKfex
	 38Yn85f2B7bz8cFzDqKPoiDHG3n6EA43+ZJyQe4EWFU2KClyeEnK6oWmUlb6nYX34j
	 0a1p380hf/95QQAXKV4kQZaudsX8suPUjbq8ZXWXkihPK85dLBLmQwbI4kftJthZmu
	 +LUg8CTHtu5ohQHeRmbBfPyn8xQ/3ZtCI29MSE+Wd9CDlqKuC8c4lRMrSSWDjBcv+d
	 wl+KDQaDcyK6ILA5KFtaxsNk7XZUgvf6QW4laQUlCbDYMbyiMRU0vPlIdvK9sreYBv
	 CBuI3I/JkWo1Q==
Message-ID: <sashiko-outbox-237660@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 04/10] arm64: dts: qcom: x1e80100-crd: Add ov08x40
 RGB sensor on CSIPHY4
Reply-To: sashiko-reviews@lists.linux.dev
To: bod@kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261127-x1e-camss-csi2-phy-dtsi-v8-4-2793b8e5138c@kernel.org>
References: <20261127-x1e-camss-csi2-phy-dtsi-v8-0-2793b8e5138c@kernel.org>
 <20261127-x1e-camss-csi2-phy-dtsi-v8-4-2793b8e5138c@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 15:01:50 +0000
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
- [Medium] arm64: dts: qcom: x1-crd: enabling camss breaks probe on
  x1p42100-crd
- [Low] arm64: dts: qcom: x1-crd: camss, cci1, and csiphy4 nodes out of
  order
--

commit 098c8f2639f0b304989a093be6403952d3f9f1a6
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB sensor on CSIPHY4

This commit enables camss, cci1, and csiphy4 in x1-crd.dtsi and defines
the ov08x40 RGB camera sensor node on cci1_i2c1.

> diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/q=
com/x1-crd.dtsi
> index 71c819aa2d43c..5f66e23e694db 100644
> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
[ ... ]
> @@ -933,6 +935,70 @@ &gpu {
>  	status =3D "okay";
>  };
> =20
> +&camss {
> +	status =3D "okay";
> +};

[Severity: Medium]
Does enabling &camss in x1-crd.dtsi break camss_probe() on x1p42100-crd?

x1p42100-crd.dts includes both purwa.dtsi and x1-crd.dtsi.  purwa.dtsi
switches &camcc to "qcom,x1p42100-camcc" while keeping the hamoa.dtsi
&camss node ("qcom,x1e80100-camss"), which references CAM_CC_IFE_1_GDSC
and the IFE1 clocks.  Because drivers/clk/qcom/camcc-x1p42100.c leaves
CAM_CC_IFE_1_GDSC and the IFE1 clocks unpopulated, msm_vfe_subdev_init()
for vfe1 fails when attaching the "ife1" power domain and clocks on
x1p42100-crd.

> +
> +&camss_csiphy4_in_port {
> +	camss_csiphy4_inep: endpoint {
> +		data-lanes =3D <1 2 3 4>;
> +		remote-endpoint =3D <&csiphy4_out_ep>;
> +	};
> +};
> +
> +&cci1 {
> +	status =3D "okay";
> +};
[ ... ]
> +&csiphy4_out_port {
> +	csiphy4_out_ep: endpoint {
> +		remote-endpoint =3D <&camss_csiphy4_inep>;
> +	};
> +};

[Severity: Low]
This isn't a bug, but the top-level label references in x1-crd.dtsi are
sorted alphabetically, so &camss through &csiphy4_out_port should sit
before &gpu (after &apps_rsc).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-x1e-camss-=
csi2-phy-dtsi-v8-0-2793b8e5138c@kernel.org?part=3D4
