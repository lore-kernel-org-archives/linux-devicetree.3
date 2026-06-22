Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD673A544D
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 10:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782123601; cv=none; b=n2+o7bpX7/Kb6qY+8Mh44kpMkQUH16Tj4lv4mifaS9No1TbqtJ36PoSmBWfo2s6ACIZBjQ9nqAs8Z9Yfc4ef2q9EAN0mxuh6M7uAnjBFe7J7Wg55Bt9R1ImOpeRPI2OvR3GuHub1eCzD2pdFNfnag5H+TCeRNwNYeTqrUtwrpZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782123601; c=relaxed/simple;
	bh=cGuoPEgPmIGyT46+4a9UY5nxCwKHlQIJAS86/TXOmk8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Yadmapree2xtOTQMLLPYJpWSn1BacGPE/Kq1nIZ5TJg7DbydQ8fvwPOVl41okwm6viccCf9K7nyr1LvVX29fDww8TZq7NS+OuZfu4Mz/mAG3j3wy4aF2GfbT3oOQML/+5LmR68xJzWdguEbzm5SJ0CW7/JhYHaKeqF7xzVxqpYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d0P3xeOV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d0P3xeOV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37DB41F00A3D;
	Mon, 22 Jun 2026 10:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782123599;
	bh=uB+8/xYtKs/zpkIS0ggeBKEZwfZ03BQcDIPMLSVgWLI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d0P3xeOVRrLhAms83k3Yr+cnZZk7fbdt/9E1yzW3v4RNTYnDjGbC3AkOv/ojKKR3I
	 G6xFhX+4BD5vdXJJUqK/oEzv7coDHGfo7/1WKkCYsCjLTobpIKZckWPQI5eCjAlEg9
	 zeFxuzKQtT2oNXCx1YUBRX6FicFPInSSTv7xyG+lNY5G8swQxuu/kVEoYQvwISNEJN
	 cQEf11YWKEIhnhD+fWFkx5wFQdGg6sG6Nm7AI5krAweLbIb16Z3z4EJ5g0mJJMkl1W
	 wMgP8rKu1+OPe14h1M8Oci3cU14qb3WTRoCe8tFG+fInGw+HLVizCTsiHF5LbOpzVw
	 FkdYObqda67Kw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: Drop incorrect usage of double '::'
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: neil.armstrong@linaro.org, vkoul@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260622101606.485961-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260622101606.485961-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260622101606.485961-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Jun 2026 10:19:58 +0000
Message-Id: <20260622101959.37DB41F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Unintended replacement of BNF notation `::=3D` with `:=3D`.
--

commit a9fdd0b065eb5b6394a9c33ffba0fd5194e80115
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dt-bindings: Drop incorrect usage of double '::'

This commit cleans up device tree binding schemas by removing the redundant
double colons at the end of descriptions inside YAML literal style blocks.

Link: https://yaml.org/spec/1.2.2/#literal-style [1]

> diff --git a/Documentation/devicetree/bindings/mux/mux-consumer.yaml b/Do=
cumentation/devicetree/bindings/mux/mux-consumer.yaml
> index 9e2d78a78e409..769243a2bf046 100644
> --- a/Documentation/devicetree/bindings/mux/mux-consumer.yaml
> +++ b/Documentation/devicetree/bindings/mux/mux-consumer.yaml
> @@ -13,8 +13,8 @@ description: |
>    Mux controller consumers should specify a list of mux controllers that=
 they
>    want to use with a property containing a 'mux-ctrl-list':
> =20
> -    mux-ctrl-list ::=3D <single-mux-ctrl> [mux-ctrl-list]
> -    single-mux-ctrl ::=3D <mux-ctrl-phandle> [mux-ctrl-specifier]
> +    mux-ctrl-list :=3D <single-mux-ctrl> [mux-ctrl-list]
> +    single-mux-ctrl :=3D <mux-ctrl-phandle> [mux-ctrl-specifier]

[Severity: Low]
Does this unintentionally change the standard Backus-Naur Form (BNF) ::=3D
operator to :=3D? It looks like a global search-and-replace for :: might
have accidentally caught these BNF production rules.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260622101606.4859=
61-3-krzysztof.kozlowski@oss.qualcomm.com?part=3D2
