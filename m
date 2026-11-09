Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215502;
	b=3fuwjxH47vCopqmd/EIA7JfR/5yAE+PuTjvCehn5s4Zo3V9nED0/ONRDsNjK4DlmOq5W
	 LwqxPePOK7tqK12JeFp9+jcSzVbC5zb2PfngiHUr+x7CZvjYrlIRKfiibSAPzrXv+ZF26
	 ZlYVUfJF3b3XdsUzZ0R43x7vx1m7w4OAt1D0tF2mxL8h4R44fty9UupiDrf+het4niPaK
	 278t+82A+5Ryw8hRuEa6ESsdRJ5RnP/txSwtHVB3CQ/rNtkA+W3VYIES794Q+93kBgtjQ
	 hWsmMK0HdpHcTqUyzpzFQfkPiYEC/2a6NkZvxVIOtiB8mr3j+VudQETx08ZqtlWd6RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215502;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Cu1fNTAX+dVzj97WogMrCFPRZNCgkcB+1RUP2lhIjEQ=;
	b=ARsiUeCatWvnZFktDWjDuIF7p65FJYUrxP2s/1TTOgPnU+hl4xxNWZMKyRFoqpam0Czl
	 LUJEVYA86qnlJ4vevAnLidn0jkv6ZwofVXJC/oCUNW7qnywOA6kVA3ae01/0PQj+6FZ+Q
	 mL6bqRLSivJBXAcfban3kkZsivyaWdblpr/IrUitTmyqjicjR2APxWDAGX1nVs7+IL2kj
	 aO0C2EBSlp2sOvRGnjsorov3Pnw1Enmfx9fpyD70uOfYaCtawe4lpyB+NB4yPp7EoAfEP
	 3HSV4BZvlwLa0CWvb9i/wMu1Oe/iRlCsIQAKATCelfjMkk1GGUbnJgSdmBTPoQ4m0UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HyKqVb4n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E667606A331
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 09:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HyKqVb4n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CED8A1F008A2;
	Mon,  9 Nov 2026 09:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794215502;
	bh=Cu1fNTAX+dVzj97WogMrCFPRZNCgkcB+1RUP2lhIjEQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HyKqVb4nGVuJY0tNzbxF690KJKIhr56BxusKDd207P219c0w4/xSjyXSymxzjldw6
	 vDmMfDzy4ZkBStbuyn6XHA70yENUFJwCbqgTCA/Is7SgTRaiov1fLKvfOu8R6xqn4/
	 Z4vD3NX05mbxYCqSAzRuJ6CGJnjtN9soZApXg2oH5wRHIJjzNOJJFTzunCKP61zgN9
	 QWv8pnEeEG6V4YrmTTypBar9G1/XZkjJe3GYUVBu+R+3rmgxd0wpoycxgzz4/haG9G
	 k2pqj91VuHgyuA7JNQNCbf2gBxVGEDvPRhDSd/XbJtlme1e9tVPF3NzfNeiow5z0K1
	 OUsk/HCclSdjA==
Message-ID: <sashiko-outbox-204677@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: lemans: Enable the Inline Crypto
 Engine for SDHC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abhinaba Rakshit" <abhinaba.rakshit@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261109-enable-ice-sdcc-for-lemans-v1-1-1f25debeea49@oss.qualcomm.com>
References: <20261109-enable-ice-sdcc-for-lemans-v1-1-1f25debeea49@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 09:11:41 +0000
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
- [High] arm64: dts: qcom: lemans: sdhc missing cqhci reg and
  supports-cqe for ICE
--

commit 62d5171c9cf52cc6dbe10886df2218e5f14f803c
Author: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>

arm64: dts: qcom: lemans: Enable the Inline Crypto Engine for SDHC

This commit adds the sdhc_ice node to lemans.dtsi and references it from
the sdhc node via qcom,ice.

> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/q=
com/lemans.dtsi
> index 1fdb72fa55184..dfd41b613523f 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -4327,6 +4327,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  			qcom,dll-config =3D <0x0007642c>;
>  			qcom,ddr-config =3D <0x80040868>;
> =20
> +			qcom,ice =3D <&sdhc_ice>;

[Severity: High]
Does the sdhc node also need the cqhci register range, reg-names =3D "hc",
"cqhci", and supports-cqe for sdhc_ice to be used?

sdhci_msm_probe() only calls sdhci_msm_cqe_add_host() ->
sdhci_msm_ice_init() when supports-cqe is present, and
sdhci_msm_cqe_add_host() first calls cqhci_pltfm_init(), which requires a
"cqhci" memory resource:

drivers/mmc/host/sdhci-msm.c:sdhci_msm_probe() {
	...
	if (of_property_read_bool(node, "supports-cqe"))
		ret =3D sdhci_msm_cqe_add_host(host, pdev);
	else
		ret =3D sdhci_add_host(host);
	...
}

Because the sdhc node only defines reg =3D <0x0 0x087c4000 0x0 0x1000>
without supports-cqe or the cqhci region at 0x087c5000,
sdhci_msm_ice_init() is never called: inline crypto remains disabled,
and GCC_SDCC1_ICE_CORE_CLK and GCC_SDCC1_AHB_CLK enabled by
qcom_ice_probe() are never gated during runtime suspend.  Adding
supports-cqe on a board DT without the cqhci reg entry also causes
cqhci_pltfm_init() to fail sdhci_msm_probe() with -EINVAL.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-enable-ice=
-sdcc-for-lemans-v1-1-1f25debeea49@oss.qualcomm.com?part=3D1
