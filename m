Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794793967;
	b=zEII9qJw7J/eUyquvdx++E5Dw7x1+t8fEKa2OGXguzBSZNMizQMvW/zHxAJdktd409q+
	 4uED3HZXOHa+fHDdshjqBfiiXdo+nd3i8UdtUs0VrQrEv/agaK8Neww5A8rXfarh0CWnH
	 32qP++N3/x59TtifSLJkifyGRO+Z8MDXzFg6JyksClNHC9d/GgKgNzfh39hLoBMDEJsrE
	 IXGgZnVFg5t1HlxWiOM5iqjApCeaFkHvbLdrMiPWMvv9cl8e6aG7IyeQliE+xULndWb3t
	 eg2TEAw5pjd8PUs4fbOb9VMPF26pGU6Nd4AUmYmx8Q/FjYnzYLQ4GYu49eimiWHr5jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794793967;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fd5ArnhWW7OyFDj1V1cyXNFvyKkWTjtf+VggIouCJSg=;
	b=S3PXgJlPDnIv1HGd87X8r3UbMi2MtXgWiFgruOJMLOgvMg6HlQ5XNfb1u9yInw3WpC03
	 0veaEwwRESliCNlDTtx3LdBIHgW/yNBVDnSX/IGaSgOZxn/zMLoCrP+HGa0HJ18l7puB0
	 Mto42YfcnBK/OqMt834hP0blo3eQFdWOZ/CwdgHwLLIbx9iFgZq5v/ohXKJHfAxhivEqM
	 0yNgStcz/2bJuCncg9DOxT3JopaCoreGaRYdBDVPgwOiSCSZcSLOu2rRlPh73z+wbTEhj
	 /xjfalNejPn/HLjirbrxkOayC0RSTPA/4JfvnpBiTU5c/rUzo50S5L3oyAUsOmCkgoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ftU1uEeA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A58606A31F
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 01:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ftU1uEeA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C0B91F000C4;
	Mon, 16 Nov 2026 01:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794793966;
	bh=fd5ArnhWW7OyFDj1V1cyXNFvyKkWTjtf+VggIouCJSg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ftU1uEeAiRmaozjebnqd7u3HADNLsMBDJN6kPSzwMDECNLEaZbii56Cj4AkgD+r/H
	 vwS2eaGFRXVNuTH2u8XzGpwoWVhy81QU773ITh9cZEIR/raurVGgwurqjQtUdAlaE5
	 0hobPeFHgsobQIh9XN9Exm7F58JuISvwWCIeDMibCbH9yquLEgefaWhhXww/CEETsB
	 APxdq62JHx2QhaCBAMyz/ElXVxd2lvqfj93/PWRIHUacBnJgvn4AAqvsd35iDtUuae
	 qWtXlpu6gPVW2ptQLe2s23sE/eh9rOwjRUcFQ7uGCmq6kDCWocCsCjWAUNLo97AE7B
	 bqUOGxv1nQd3Q==
Message-ID: <sashiko-outbox-216016@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 09/13] dt-bindings: soc: mediatek: Add MT8196 JPEG
 SMMU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261116013402.1273016-10-kyrie.wu@mediatek.com>
References: <20261116013402.1273016-1-kyrie.wu@mediatek.com>
 <20261116013402.1273016-10-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 01:52:45 +0000
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
- [Low] dt-bindings: soc: mediatek: unused label jpeg_smmu in example
--

commit 518e0e8d206746ff03eb3b640f89c00e57b40210
Author: Kyrie Wu <kyrie.wu@mediatek.com>

dt-bindings: soc: mediatek: Add MT8196 JPEG SMMU

This commit documents the DT binding for the MediaTek MT8196 JPEG SMMU
configuration syscon and updates MAINTAINERS.

> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt81=
96-jpeg-smmu.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek=
,mt8196-jpeg-smmu.yaml
> new file mode 100644
> index 0000000000000..2bc67a2af1d2a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-jpeg=
-smmu.yaml
> @@ -0,0 +1,41 @@

[ ... ]

> +examples:
> +  - |
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        jpeg_smmu: syscon@38d0000 {
> +            compatible =3D "mediatek,mt8196-jpeg-smmu", "syscon";
> +            reg =3D <0 0x38d0000 0 0x1000>;
> +        };
> +    };

[Severity: Low]
Should the jpeg_smmu node label be dropped from the example?  It is not
referenced in the example, which causes scripts/dtc/dt-check-style in
strict mode to warn about an unused label.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116013402.1273=
016-1-kyrie.wu@mediatek.com?part=3D9
