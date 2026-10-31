Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793430073;
	b=m3JpcWoledhT+RZObc713L1Ya+/D4GsqttwBKOMSPRX31jaSYQcikvdhaSoP1VTrusUX
	 78zVZldBtlg/+wNVy78ppWwHHEITe7vrWamJ2CZr1B8nGqNHIeB9Fw3dDh/wlgnKqWjas
	 NHB18oeMr4uS75lzY6E6XF3JQ4heQXAGhsZKeA5eaIG64PZsSzJPoeVZX/DxXpIjfRMVt
	 lLGnBqaLdu/tbf6kknUsk+Vb6C232Q+lSOZEQHl3oSe1smYIp0byBHMiRN9ExrdVej71l
	 eNn3DvnvM1JbTUR6VhxoOmPw1s5oQ/y0kI7ayOKQWTXbbvnGmXxTx2Kw/w4jmc4kxIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793430073;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vAVsUMdZmRtDfebEMNo5cUwTjosXeJUnibINp2nB3KI=;
	b=P+RklE7yA41cUM2JYDfPpw0qbT01ATr0051zUZCZU5Bbq0yXUmLrmeMFL0myIUkmv1dG
	 zZu62+Nyk2Jei5Vbq4Q5Au6pniiBHzodiqD4kKn62/4WVFkXcqKbGeo8Ri2kwWwO/nwgD
	 +rK7AlAH0nj3YG7+bG/p/WI1JiPgUl35VTW0+Ge1jzJ3FWIozRrSC5YI054mFrwQ3NfSB
	 izxllSzkPabhcnJQ5Lh4YLC9I/yWcoSc52IR7Y8X1jSso3WIlbs2xC7j1xbrgY7S+WZad
	 s8fmHe59bGCGEob77mPfRpN3KMkV5rryOq3qq0m5551eO/me+IBbdZkoXZ4/vIcjN/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SaujgDvY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131D8606A31C
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 07:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SaujgDvY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C3031F000C1;
	Sat, 31 Oct 2026 07:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793430072;
	bh=vAVsUMdZmRtDfebEMNo5cUwTjosXeJUnibINp2nB3KI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SaujgDvY5Un7d8z3FpRsL3u4GwzRoty2te5j4XlZ03kwo+tcbhBezrf1fSOz2GST9
	 pjyZj4CzV1EAPIeWu6g36HiNUtVWeWZXeCU3fJPQQY8V/26ajOSyODhI2wb/PI73NN
	 WTIalEQOKMeU+1IMOMpTFxd3yV6HvKxbiGO+i58cRBBR7hZW+mTqNUed0vNBNCi/0M
	 A344J/fQ2++CY4b4/kpN0WMO4e0yPTr2AI35r+QfJqAEPthFi28zZYfZRFKtVYjAkv
	 UvGjuzSxSvhJ0Bkc2XABG2GqmYJhDceqbWVN7Qe0rK6V+OWXjm5UasdEsIOsmNVrPQ
	 s8Qn+QZDjBhlA==
Message-ID: <sashiko-outbox-191791@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/4] regulator: dt-bindings: willsemi,wl2868c: add
 the WL2868C camera PMIC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <7f2062a377f701fbaa649f31c954edcce15b4d12.1793427040.git.xiaqinghuan@mail.ustc.edu.cn>
References: <cover.1793427040.git.xiaqinghuan@mail.ustc.edu.cn>
 <7f2062a377f701fbaa649f31c954edcce15b4d12.1793427040.git.xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 07:01:11 +0000
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
- [Low] dt-bindings: regulator: unrelated qcom.yaml change in wl2868c commit
--

commit d44859d04307b0410c0a5a81166a61fd6f065d00
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

regulator: dt-bindings: willsemi,wl2868c: add the WL2868C camera PMIC

This commit adds the device tree binding schema for the Will Semiconductor
WL2868C I2C-controlled camera power management IC with seven programmable
LDOs.

> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentat=
ion/devicetree/bindings/arm/qcom.yaml
> index ff8a35df7862d..41d5e65c4eea5 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -1168,6 +1168,7 @@ properties:
> =20
>        - items:
>            - enum:
> +              - lenovo,elden
>                - qcom,sm8750-mtp
>                - qcom,sm8750-qrd
>            - const: qcom,sm8750

[Severity: Low]
Was this addition of lenovo,elden to properties.compatible in
Documentation/devicetree/bindings/arm/qcom.yaml included here by mistake?

This patch adds the regulator binding schema in
Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml, and
neither the commit title nor the changelog mentions adding a top-level
qcom,sm8750 board compatible string.

Should the lenovo,elden compatible addition in
Documentation/devicetree/bindings/arm/qcom.yaml be split into a separate
dt-bindings: arm: qcom: patch so it can be routed through the Qualcomm SoC
tree independently of the regulator binding?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793427040.gi=
t.xiaqinghuan@mail.ustc.edu.cn?part=3D1
