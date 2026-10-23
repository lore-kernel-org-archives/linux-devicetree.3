Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792773844;
	b=ekTyIzh54+uvjIRugZvvhESr6fp3vnlCSONmnJtEmbfXQg3WXj5QEjVAf3oLiH9MhuHR
	 LZCmqsmsvPKYzJ1XvyY5cBDj9mbs/LGIKMFAXHtuBvZ/mCycg5c5hokDrFE4prl+w+fQm
	 8oypVLecX2/q3SruTlDkmoIE2qgpMqaCoF2KLHhVZ03iUxBFpKcczgYfsxMek7m9BHVlA
	 JlzRwFTVvdKuI+gsmmhUFiH64ayDWvNWlpSHRO8yUZmQtwdpqC/BkaYGmcGLbobEu3Rw+
	 pv4yDyW0slEEQZeB4GnUwQlwdwZZXNA8E/qcAx0ZHYI8qkqJ1M7pyRs2eJsNXgCiKHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792773844;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jZo+7rNyUddNOYgHPFN5ZX4fN8cJXMiqHtaxhcSCpfA=;
	b=y4AkJBAFA30tz1ShaVPZMRfi0xVvpazVry4J6HpL+wexHxeVjB1sYYM/afYET5sfuXG4
	 8X8YYBo/OaYkVVc2HGvU1LH+ahxXcF7UTtKe97o40S58UGknUcfBbOgHjrMJ330n5JYK4
	 V/kf7LQCaOPK7nJZP28/Tz5QthOXB8WUaL6cm1eGFooY/wlKQDBbBrRv0lwhsAHr46ImG
	 0u7KnHOWIYReqRmR+o30hMKNtAr263spfE+vtBphzPYeEqWHCFIanLmkvEbOkjSo5VwME
	 +eNPdoG0p/2M0jyvSX+iPPv2mcik6/ibw276BhaskCxKeo10EbRTjXp2EUp+dQZ/rwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LyraaoKt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80E160A262F
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 16:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LyraaoKt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D2411F031E1;
	Fri, 23 Oct 2026 16:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792773843;
	bh=jZo+7rNyUddNOYgHPFN5ZX4fN8cJXMiqHtaxhcSCpfA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LyraaoKtd2mseO/RKKL+n/bbRMcpgcsw53zEMWM74hdz6/dJacVipJwnRjhIyjA8+
	 dFhVQe6Pu94umYp6GgQt5GRprSmPKhXzO7NnkIfR6w1Tb6l8FnX8xlHD+vfZfXPzRI
	 wOY6sQhBITutgNJodjtxDkWD0vH2+7F6zlVplibP/wuAFZpTYYp7R2INF8tgcDx9qB
	 Rj2pZdytUFGLjghQcaKjFcC5limRPcIz7yMWWn1C8i1f3N2vUyARBkm/+JYGMerJa+
	 CCweH3b2Gug0Cy3Pkf8izLaQ95SMGCUEXVJmRDCqPvEd3BZj5qZnSx/eOMC8HA9lRa
	 NuKSDeVzWWmbA==
Message-ID: <sashiko-outbox-182965@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Waipio compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladimir Zapolskiy" <vz@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261023163057.775917-2-vz@kernel.org>
References: <20261023163057.775917-1-vz@kernel.org>
 <20261023163057.775917-2-vz@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 16:44:02 +0000
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
- [Low] dt-bindings: phy: qcom,x1e80100-csi2-phy: use sm8450 instead of wai=
pio
--

commit 9073ae477c0f915b568e424d2c24c3320e9b118f
Author: Vladimir Zapolskiy <vz@kernel.org>

dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Waipio compatible

This patch adds the qcom,waipio-csi2-phy compatible string to the
qcom,x1e80100-csi2-phy Devicetree binding schema.

> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy=
.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> index 1f1e2a4993b2a..2a11ca7c7d112 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -19,7 +19,9 @@ properties:
>      oneOf:
>        - const: qcom,x1e80100-csi2-phy
>        - items:
> -          - const: qcom,glymur-csi2-phy
> +          - enum:
> +              - qcom,glymur-csi2-phy
> +              - qcom,waipio-csi2-phy

[Severity: Low]
Should this compatible string be qcom,sm8450-csi2-phy instead of
qcom,waipio-csi2-phy?

Waipio is the internal codename for the Snapdragon 8 Gen 1 (SM8450) SoC, mu=
ch
like Hamoa is the codename for X1E80100. In upstream Devicetree bindings,
this platform is established under qcom,sm8450:

Documentation/devicetree/bindings/arm/qcom.yaml:
      - items:
          - enum:
              - qcom,sm8450-hdk
              - qcom,sm8450-qrd
              - samsung,r0q
              - sony,pdx223
              - sony,pdx224
          - const: qcom,sm8450

Documentation/devicetree/bindings/arm/qcom-soc.yaml also defines the allowed
naming patterns for SoC IP block compatibles and does not include waipio in
the list of permitted codename prefixes:

        # Preferred naming style for compatibles of SoC components:
        - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|=
x1[ep])[0-9]+(pro)?-.*$"
        - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
        - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
        - pattern: "^qcom,(eliza|kaanapali|glymur|hawi|mahua|maili|milos|no=
rd|shikra)-.+$"

Other SM8450 camera and PHY bindings, such as qcom,sm8450-camcc in
Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml, use the
qcom,sm8450-* prefix.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023163057.7759=
17-1-vz@kernel.org?part=3D1
