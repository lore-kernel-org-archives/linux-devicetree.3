Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A54485952
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 23:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790033672; cv=none; b=jl8ORWXEMiyXFL0TvUxOVQVUWrT/3XnGXW+RaDlmvqpmqXqID9BFrYmWB40donQYq+8e5b1T4bVjBobaqRP3+siWg+KEj5c8/nDBA7Rfff03XLIHW+mKZHe9E6NScEe1vt6KvtV5ux8PJHfeV3PdNAQu3WTKkhqOhi7n0TcEULk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790033672; c=relaxed/simple;
	bh=4xrCG453x0+YccHbwlWx1Q3JacwjoJTxM6GsiPnhtmY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=paelsSvCZy3dec/RguVGe1GSrbeo91YnHJyd0zBeF92fD36/ZijkvLR/vv5gu+uTvhm+lPDrC7ciJISd7YSHCETwktH867UqBhPwMWM9+ohgITzOWqWlxb+A25gRwqUm1sNp1tf+w745ESW8vvnUxaPSf4zlvy+iU3VcULjFnls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JARiEQjQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JARiEQjQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B0D1F000FF;
	Mon, 21 Sep 2026 23:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033663;
	bh=0QO+kK+ZKQJBV2p701Uaz+sFd3B2ISZSh+P+u32nJNE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JARiEQjQ1lVcqX+xLXO9Qw74QVqSUFwcaPyMMTJ3Up5rtz4cCRMkZfU6he+/n7Yib
	 s6e0a2sbPVnv8Hg/Cr+lgo7uOl/2poMdKWZay1JXM9ln6Q8kr5TwSCHhaXhimuc/d9
	 yf8nbrSOoa0jgfBwVfV4yDTkMb26prjgCUZ8JBW0EwLN2D2bkeAp/5fdG6+QbWyiHI
	 Yapm/lfbyw8foc7RMkSnd51dLvVTgynH04nxZRVrXs5mMwj/vlcFZVfo2Up1QQVyq8
	 VilLxbZTqYPJ0ohKdVYG8RQDFv4+NYnrIVWQEduLCXgs9At/Cs1dSxrmE8zUazZ8Ox
	 R6eX2yt6lwQDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: phy: qcom: Relax required supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: robh@kernel.org, vkoul@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com, conor+dt@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org
In-Reply-To: <20260921232603.3129898-1-robh@kernel.org>
References: <20260921232603.3129898-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 23:34:22 +0000
Message-Id: <20260921233422.E6B0D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: unintended schema relaxation for qcom,ipq5210-qusb2=
-phy
--

commit 69ee638f4004f6e325a963f3b804b3c1cac5c6fb
Author: Rob Herring (Arm) <robh@kernel.org>

dt-bindings: phy: qcom: Relax required supplies

This commit relaxes the requirement for three regulator supplies in the QUS=
B2
PHY binding for legacy IPQ6018 nodes that do not describe board rails.

> diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/=
Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> index 001fd0ccc9852..2516eab7f6d32 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
[ ... ]
>  allOf:
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:=20
> +                - qcom,ipq6018-qusb2-phy
> +                - qcom,ipq8074-qusb2-phy

[Severity: Medium]
Does this unintentionally relax the schema requirements for IPQ5210?

Since qcom,ipq5210-qusb2-phy falls back to qcom,ipq6018-qusb2-phy, an IPQ52=
10
device tree node's compatible array will contain qcom,ipq6018-qusb2-phy.

The 'contains: enum' logic matches this fallback, which seems like it might
incorrectly apply this legacy IPQ6018 exemption to IPQ5210 nodes, allowing
them to silently pass schema validation without the required regulator
supplies.

> +    then:
> +      required:
> +        - vdd-supply
> +        - vdda-pll-supply
> +        - vdda-phy-dpdm-supply

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921232603.3129=
898-1-robh@kernel.org?part=3D1
