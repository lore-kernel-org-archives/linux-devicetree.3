Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792774654;
	b=2hZQklOG3jtUxFmmF+fXndktX+yL8hBb8xnXkosDfDiQvVvL+0HIxlFubZlYq5QwxBt4
	 uGUeUki7DoG6z2DGisSRGGysnRe42FNiWP9H+nyzPbz77XeTb6Cz9h6WwQNUuIItrRGyM
	 JFqFvaY9pna6a3STwj9cQpfUUm66BNzb9GOQpkCQGvOv3wgGW1YoxBq2B4w36m+5D+mNK
	 uRoAhp/q353ir/LTf67OyWWU6ODjsqjQ6zGKXSlJS15f8cy6Fi477d7eSTm9SVJM2EJCZ
	 6KhQhELDyZngA159w4/l+6Z5QQ+co/wyQJGXHIPSQLV8G/rfiMx+7BfkapMP5O+fBqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792774654;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XMTCkRB6/oZCpA/BF1LpraKM3Sr+19d1vEnhPR1DA+8=;
	b=htbWcYQnoofWpsBZl4D2nXiY8M5WudodmJj1N2cOE37D4Dg8EwlAvtJY0Bcj0VJIq6tG
	 HgAcWKziFLoh7CwV+Z9Xw+RLjMPKK8aMFbnjd7jkPYmrCDrWaaLeWE9WoH8WmpjWa4vrP
	 wrUFWnBYq0kmHcqNHDd5Ri8yiml4jRLI0fxSDXQbWt2kZ0HljEVDVFyVOETP5Y5Qhyjce
	 sSFWdn45lezrjqhyDzRSc8/I9H5b55+EG0yRyaWYmtc/IbBOIqp+BFDl4G4l2Wx4Uo3e6
	 8c9VmLemO9/pIXbmz0e9Rrx2mX8zkwE8a3JU2zUSPKvVR6UgviFF7ZL9bEpTIzu2WYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PdHFQmJf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92283606A31B
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 16:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PdHFQmJf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6D981F01828;
	Fri, 23 Oct 2026 16:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792774654;
	bh=XMTCkRB6/oZCpA/BF1LpraKM3Sr+19d1vEnhPR1DA+8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PdHFQmJfF5RNKaWU/QqGgCX5mbCoa6OiGUERHFyzp5q/jZ7UXFahzet/C690DJwap
	 JnQof5G3MCgFKN3YU3zmw95nw5Balrm+qecO5oecxE3KMB/ue1Z1miV21OdBj2xmiK
	 fwF4VnYtKSLdkcnlv3sdMqZPTVokCHxM9mm38crrVpaGrwUMgnQ6fKOujtjS9kWliu
	 ygIF3Egmksb2VdSL8p1Y5Hj6qAzENP1zgS7FIIDTkiD++/f8NIoE1mpzIO7KXenxwp
	 25OaJjWON2S5q//QODHoDoeIgKn8VJWGJ7nEsbksEUZvB2Ify5fC/vlCdLezGvOpH0
	 yUGRCMYsNM94A==
Message-ID: <sashiko-outbox-182975@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/7] arm64: dts: qcom: sm8450: Add CSI2 PHY device tree
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladimir Zapolskiy" <vz@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261023163057.775917-3-vz@kernel.org>
References: <20261023163057.775917-1-vz@kernel.org>
 <20261023163057.775917-3-vz@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 16:57:33 +0000
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
- [Low] arm64: dts: qcom: sm8450: codename compatible used for csiphy nodes
--

commit 0c7c977d6500322c8d06815e06e46862092f3fc5
Author: Vladimir Zapolskiy <vz@kernel.org>

arm64: dts: qcom: sm8450: Add CSI2 PHY device tree nodes

This commit adds six CAMSS CSIPHY device tree nodes and a shared CSIPHY OPP
table for the Qualcomm SM8450 (Waipio) SoC.

> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/q=
com/sm8450.dtsi
> index b8793482b1815..b70a8635c6be8 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi

[ ... ]

> @@ -3298,6 +3314,270 @@ cci1_i2c1: i2c-bus@1 {
>  			};
>  		};
> =20
> +		csiphy0: phy@ace4000 {
> +			compatible =3D "qcom,waipio-csi2-phy", "qcom,x1e80100-csi2-phy";

[Severity: Low]
Should csiphy0 through csiphy5 in arch/arm64/boot/dts/qcom/sm8450.dtsi (and
the corresponding binding in
Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml) use the
SoC model-number compatible "qcom,sm8450-csi2-phy" instead of the internal
codename "qcom,waipio-csi2-phy"?

In Documentation/devicetree/bindings/arm/qcom.yaml, the canonical SoC
compatible for Waipio is "qcom,sm8450", and
Documentation/devicetree/bindings/arm/qcom-soc.yaml specifies that SoCs
numbered with sm[0-9]+ use "qcom,sm<number>-*" for component compatibles,
while codename-based compatibles are reserved for the newer codename-only
SoCs:

        # Preferred naming style for compatibles of SoC components:
        - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|=
x1[ep])[0-9]+(pro)?-.*$"
        - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
        - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
        - pattern: "^qcom,(eliza|kaanapali|glymur|hawi|mahua|maili|milos|no=
rd|shikra)-.+$"

All other SoC-specific blocks in arch/arm64/boot/dts/qcom/sm8450.dtsi,
including the camera subsystem nodes camcc ("qcom,sm8450-camcc") and
cci0/cci1 ("qcom,sm8450-cci") as well as all other PHY nodes, follow the
"qcom,sm8450-*" naming convention.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023163057.7759=
17-1-vz@kernel.org?part=3D2
