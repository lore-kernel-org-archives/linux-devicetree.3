Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795512159;
	b=nO5M6Jhep4oDCsztr0BzuuuFD5hzaMznlxitDtvvSL6rB7y/NH2+pLlWzEY9K3+fBk+/
	 5IQZ0vfVER4byXW6XuGubpygKJki1zeIB3tnTg6xuM4EOIDDMnmVKAAWVp2G3WM4W1xp2
	 1HC+KfFLuFNOp8gZEk6XtQyk8Nyt8tHy+IfeIfAhnr2YDnxpyYG0MZLJoXyeX3C76ggHk
	 PgjvPsifUUZHqLSCnFrWrM6ICGiT86bfRoNYggaHVV0PtRk+++i9XDbBwUyZDLY9hmLNi
	 zeWvx9qx0TLvO+md/AnYtUcJbd61oOk05nAqcsRTE6BEvS1VdNEfp7qK2b3ZSOaWINg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795512159;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=I5qSiNcIsEcHp7iihPHbK+BDEIoe5qSb7MWuD7HUBp8=;
	b=jcjeconreDmsB1REYTpifg2Vozzadk9vHXcxVjr5ypyq4jplA6VrQqOrkvT+y7lgszYN
	 81mTqqfQoJYZu5dQm4j8paC8j+7d/f1PdqLjOVo0uRx/0gNyzoQhW9mD/Vwal8fhAJs5C
	 vBkfecaMQnognIPU+ySq0dVEZUqzxYTGUKkL0iq4DG+bGI3SiFHp0l/eYT3O11CXDi/xC
	 yQ9wDXG4A2uUEQpkYHY/uDBISLH8nYMhVxBDC4ZTwhV6VAsyzvjXQqdrfrVmrFKnRtQnb
	 C9UMRXfaCX0hXz3Vlg7UdZ2U6FBjb4EUjlt9njeXGbhOV61ckZftyf9bX5doboTtQkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GlOkrtTL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EF0606A692
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GlOkrtTL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EAC41F000D8;
	Tue, 24 Nov 2026 09:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795512158;
	bh=I5qSiNcIsEcHp7iihPHbK+BDEIoe5qSb7MWuD7HUBp8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GlOkrtTL5ygSjmHWLjTY7r36RIzyv3LCMwlxmFKtuQTqGVcgETseUGPe3Twx0l3Uz
	 OoDFofNltGeAhWd0Q4ciqVQafv1coqVdOeWpg7VYxRN/efG9fGYt4dhcTvbgiVWP79
	 WFKX9q8VKoaIMAhAKejxQbJEW+a5/aiNSPrLw6hXhZ4812bCsFR1xx3g2UqjbQBdk7
	 PLtTZDgAOyxiRhBsO6uewvI+BV0qeQN/XZrhklzSoQkiXWE2/rxWb8FWqR0T3R148E
	 ra2a0SlWhMFXLBKUQ3S8NUgwkVaqBvcSdjcpA7z87Uz5mrdb7K/+a1xmsIfsKKUZFA
	 3+hWMqlUbjhvg==
Message-ID: <sashiko-outbox-230826@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: lemans: Enable the Inline Crypto
 Engine for SDHC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abhinaba Rakshit" <abhinaba.rakshit@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-enable-ice-sdhc-for-lemans-v2-1-0bfa9ed6b4bb@oss.qualcomm.com>
References: <20261124-enable-ice-sdhc-for-lemans-v2-1-0bfa9ed6b4bb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 09:22:37 +0000
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

commit a0ea4743f5f8f7228cdfec72ff2a38085407ac93
Author: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>

arm64: dts: qcom: lemans: Enable the Inline Crypto Engine for SDHC

This commit adds the sdhc_ice node to lemans-embedded.dtsi and links it to
the SDHC controller via qcom,ice.

> diff --git a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi b/arch/arm64/b=
oot/dts/qcom/lemans-embedded.dtsi
> index 0be39bb9de1e1..4cb3af416a3fc 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
> @@ -1651,6 +1651,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  	power-domains =3D <&rpmhpd SA8775P_CX>;
>  	resets =3D <&gcc GCC_SDCC1_BCR>;
> =20
> +	qcom,ice =3D <&sdhc_ice>;
> +

[Severity: High]
Does &sdhc also need supports-cqe and the cqhci register range in
lemans.dtsi for sdhc_ice to be initialized?

sdhci_msm_probe() only calls sdhci_msm_cqe_add_host() ->
sdhci_msm_ice_init() when supports-cqe is present, and
sdhci_msm_cqe_add_host() calls cqhci_pltfm_init(), which requires a memory
resource named "cqhci" to map the CQHCI crypto registers:

drivers/mmc/host/sdhci-msm.c:sdhci_msm_probe() {
    ...
	if (of_property_read_bool(node, "supports-cqe"))
		ret =3D sdhci_msm_cqe_add_host(host, pdev);
	else
		ret =3D sdhci_add_host(host);
    ...
}

Because sdhc: mmc@87c4000 in arch/arm64/boot/dts/qcom/lemans.dtsi only
defines the hc register range (<0x0 0x087c4000 0x0 0x1000>) without the
cqhci range (<0x0 0x087c5000 0x0 0x1000>), reg-names =3D "hc", "cqhci", or
supports-cqe, sdhci_msm_ice_init() is never reached and inline encryption is
never enabled. Meanwhile, qcom_ice_probe() enables GCC_SDCC1_ICE_CORE_CLK a=
nd
GCC_SDCC1_AHB_CLK and sdhci_msm_ice_suspend() never gates them because
MMC_CAP2_CRYPTO is not set, and enabling supports-cqe on a board DT or
overlay will make cqhci_pltfm_init() fail with -EINVAL.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-enable-ice=
-sdhc-for-lemans-v2-1-0bfa9ed6b4bb@oss.qualcomm.com?part=3D1
