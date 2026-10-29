Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793291143;
	b=fPhjbysp6AQIOPUOjzzq3IWQI8wgAJ3zUB1hLFVrM0uIw7cBcy7Y0LMfWd4ERCCWUrMb
	 x6nU3SiU+/UMfkNY3bsu6H3Ph4GuvskLBort0k6y476fFbXPdlFNEo0SEx/h1VhLgD21J
	 VWLHdOr6d7WKk5NhtyVyzutFP6bcOajlOC9zute5OjQeCUXHUUVHHMlnrz5YzPXxZoEX6
	 ZOYvp07AcnVs/Ez0mIJSRc2pELIMr380U61Fj6SEcBF5gOEIlW8y28oXHe+XI4QfefMa6
	 i7g/JC+ZsX55uQbZIdB09+dn2l9RroMwtUVPjCF7Tw9jVMnYcni5tlRsu8xvx3HNU3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793291143;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=A9nk1q/CZrH0mj6aQ3R4+Y9Exe1hNG2n8A9f1lszg0c=;
	b=m/L5deIIaSPAqk1+Aj3d1RLVkHaUa/0Onz9VSCAUYLAYANFn27pRXFoD5Gafutijarja
	 jXZ8WUL+nPZlms7S+lZsdGYuAL0G5AdXMe/+wj8BYdsGgs1MMZtxnoc8i5Ukh+ovCYozt
	 5DxAuq4KkY8CUilq0B/pzKEw/Lx1fAxLE3rwkSke1sU6ruAdWR4eBL/9xgmA3JEyKNcYe
	 lXMx/+gukcVpp5jc8W6nBCOvtl0kUqsQPnmpKp2Zn42CrTks1UPYiC3CTv5DLlynahp5x
	 k1neCvtuiMjK+mQhazO2K0B7QOt45EYl+p3iKV86vliR4LBnUt8ssWmLGOz7kBM4xjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BiddHSph;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F71606A31A
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 16:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BiddHSph
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 323CE1F01816;
	Thu, 29 Oct 2026 16:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793291142;
	bh=A9nk1q/CZrH0mj6aQ3R4+Y9Exe1hNG2n8A9f1lszg0c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BiddHSphEcxmSjL/V3j3NlAbytXSPtZzyFcE+6WiZR3+p7Gj4AkoO3VAfaN2J/+NR
	 u/xHgaJrH10PVeHGY+iOe2craU2DN1VW8gfK9zdw73SRxfXjsNSIvb90ykMHC973xr
	 4VfKYtNoK3ye6N/D+tDhgFOr83/YWEIC+iKAq5Cb3OnPmtWxArE2yP7kNDdUq+HeJO
	 naNraLSv1lBEKqJ97XfiXv97nSnFiD+IyEmPghhQDipIopk3vbouaZI490dcZpcMxP
	 3KB1SPpP7Zw5r33ALaSzF6Cw4dnWccw2n+2JXk7zrPP4o0Z6f6Qob96KvD9+4LS57f
	 NpYSZJV2HR7LQ==
Message-ID: <sashiko-outbox-189658@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: add missing Iris IOMMU SID
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xilin Wu" <sophon@radxa.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261030-sc8280xp-iris-iommu-v1-1-1e3fb8562b3d@radxa.com>
References: <20261030-sc8280xp-iris-iommu-v1-1-1e3fb8562b3d@radxa.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 16:25:41 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] arm64: dts: qcom: sc8280xp iris iommus exceeds sm8250-venus schema =
maxItems
--

commit 6441bb3f503ae341ba67b0bfcbe9378b5b24f71b
Author: Xilin Wu <sophon@radxa.com>

arm64: dts: qcom: sc8280xp: add missing Iris IOMMU SID

This commit adds the missing 0x2a07 IOMMU stream ID to the Iris VPU node
on SC8280XP so that both access paths are mapped by the SMMU during video
decode.

> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts=
/qcom/sc8280xp.dtsi
> index d17475c3e66c9..4ab01ef9ac053 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -4268,7 +4268,8 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONL=
Y>,
>  					     "video-mem";
> =20
>  			operating-points-v2 =3D <&iris_opp_table>;
> -			iommus =3D <&apps_smmu 0x2a00 0x400>;
> +			iommus =3D <&apps_smmu 0x2a00 0x400>,
> +				 <&apps_smmu 0x2a07 0x400>;

[Severity: Low]
Does Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml also
need an update for this change?

In arch/arm64/boot/dts/qcom/sc8280xp.dtsi, the iris (video-codec@aa00000)
node matches Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml:

  properties:
    compatible:
      oneOf:
        - const: qcom,sm8250-venus
        - items:
            - enum:
                - qcom,sc8280xp-iris
                - qcom,sm8350-iris
            - const: qcom,sm8250-venus
  ...
    iommus:
      maxItems: 1

Adding a second entry to iommus without updating maxItems in the binding
schema causes dtbs_check to fail on SC8280XP and SA8540P device trees.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-sc8280xp-i=
ris-iommu-v1-1-1e3fb8562b3d@radxa.com?part=3D1
