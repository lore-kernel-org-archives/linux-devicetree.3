Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E7124E4AF
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 14:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787236590; cv=none; b=ojDHThIyYp45A7TzGdaxIDzZwBwmASFniceZgqGvUa4re2Iu0fJUUeVoR1pOXxUZgofK//4Jlv90gZM3gWR2LVwHb4rSy+xqODx1wJv/Xa+5FvzrVPBR65GUQYb3T/Xpc12zfniSQ8PTEwdS1bXPWEkhejVbiUS4jguBz5WQKUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787236590; c=relaxed/simple;
	bh=4XsrTEhO3DdWNKhwnEICI4r4xv9X2uft91iOxdsXk2Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fvftL5tTpIOJWrUcESd6n39gIOaoSa3oPM8q3qAL5rLJC8Bfs4dplmI2V5x59n/RCX255g0fx0NRaFIsXRn6bM5rKd8pb2xvvm9UOoG6upfitl+P4XJfe/qtj9/3k988NXRMwCOhvNeyQYEJSJkSbtNfMMa0qWWqnlRXHOloCew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TqD2mQMe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TqD2mQMe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60E581F000E9;
	Thu, 20 Aug 2026 14:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787236588;
	bh=0uREgUYOEaKxR+A1apaQIZBJ2VMULLDQW24odLs+5NA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TqD2mQMeyemxs1lqTQzJ4CdoQ3zKKtfyvj3zciqMbvAFlLJmCsakzLyGApfOe55pV
	 J7o1X4CvrD5QJRN7AD/c/B5MJs8UwdphG+oo+GATb0pxa7XeyHZfaUxjn6MXY37uOY
	 JgxHl/jJ6lm2w/4uMEKIKjThKGypoRoLVpkb/1Smqbb1ZpaFPpClcDMG9e4yqmw9jS
	 w+CobCNilXLt2tcHN0r+IfPrgpoTAwh8MVKwmLQDL92GknowLzYTyhHwak+uNQziem
	 aLn7tJGfddz/HHba/NNlTzsi0j52w8rhP2rL5Ms0fHumu7kQQgK0zXzZHcD6Vg4ntI
	 FJvXRy3Lj544g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: phy: qcom,qmp-usb3-dp: Extend X1E
 description for USB4
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: olteanv@gmail.com, vkoul@kernel.org, robh@kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260820-topic-usb4phy-v4-1-aec9d2cb31f6@oss.qualcomm.com>
References: <20260820-topic-usb4phy-v4-0-aec9d2cb31f6@oss.qualcomm.com>
 <20260820-topic-usb4phy-v4-1-aec9d2cb31f6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 14:36:27 +0000
Message-Id: <20260820143628.60E581F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `allOf` conditionals for `x1e80100` and `sc7180`/`sdm845` un=
intentionally make the 5th clock mandatory, breaking schema backward compat=
ibility for device trees that only provide 4 clocks.
--

--- Patch [1]: [PATCH v4 1/5] dt-bindings: phy: qcom,qmp-usb3-dp: Extend X1=
E description for USB4 ---
commit 16b464b2f16cdfe9906295a8ca043c6c92f8b970
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

dt-bindings: phy: qcom,qmp-usb3-dp: Extend X1E description for USB4

This commit adds a new USB4 clock to the X1E QMP combo PHY binding
to enable USB4 mode. It restructures the schema's allOf conditionals to
apply specific clock lists based on the compatible string.

> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb4=
3dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb4=
3dp-phy.yaml
> index 8adfc78108fef..94a4fbff428f4 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy=
.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy=
.yaml

[ ... ]

> @@ -189,21 +184,59 @@ allOf:
>    - if:
>        properties:
>          compatible:
> -          enum:
> -            - qcom,sc7180-qmp-usb3-dp-phy
> -            - qcom,sdm845-qmp-usb3-dp-phy
> +          contains:
> +            enum:
> +              - qcom,x1e80100-qmp-usb3-dp-phy
>      then:
>        properties:
>          clocks:
>            maxItems: 5
>          clock-names:
> +          items:
> +            - const: aux
> +            - const: ref
> +            - const: com_aux
> +            - const: usb3_pipe
> +            - const: p2rr2p_pipe

[Severity: Medium]
Does this inadvertently make the 5th clock mandatory for x1e80100?

Looking at the allOf conditional for qcom,x1e80100-qmp-usb3-dp-phy in
Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml,
since this items array defines 5 elements, dt-schema automatically injects
a minimum item count of 5 locally for this conditional block.

This overrides the global minimum item count of 4, which would cause schema
validation to fail for existing older device trees that only provide 4 cloc=
ks.

Should an explicit minimum item count of 4 be added here to maintain backwa=
rd
compatibility?

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc7180-qmp-usb3-dp-phy
> +              - qcom,sdm845-qmp-usb3-dp-phy
> +    then:
> +      properties:
> +        clocks:
>            maxItems: 5
> -    else:
> +        clock-names:
> +          items:
> +            - const: aux
> +            - const: ref
> +            - const: com_aux
> +            - const: usb3_pipe
> +            - const: cfg_ahb

[Severity: Medium]
Similarly, does this break backward compatibility for sc7180 and sdm845?

Looking at the allOf conditional for qcom,sc7180-qmp-usb3-dp-phy, without
an explicit minimum item count of 4 in this block, older device trees that
omit cfg_ahb will fail validation. The dt-schema tool will enforce exactly
5 items based on the array length.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-topic-usb4=
phy-v4-0-aec9d2cb31f6@oss.qualcomm.com?part=3D1
