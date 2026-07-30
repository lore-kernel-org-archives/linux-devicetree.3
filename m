Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1153CB577
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405931; cv=none; b=KGklMX4JStEoVezR4R8BbRfl5VpePfn2FBXOc4bNYhjRhI+UwIdgd9L/seRXP4U6v5IiI4SPScmnSxEkBcR52pclSgzjWDU93GFz6M4LLMJOxeyBpel0gWrv2QLEzBe76vILom8fbufZdehwjfJjds6jVPnln5OPrRyp8VGGlno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405931; c=relaxed/simple;
	bh=eqpmE8i5X+JggYu/ehDKQ6iW8CvPshc24RWH35njXbE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=vB2EnjKYRA4XPB4lQSmAjJIHTOVbdbiDOobUWK83Wuu8iUVj4aiGdxsgXG0oa4oPCtiEDfn+Mz2I3E7llO1oKoM3vLxk7xgHcdTs3TMWep90j1RdCUxnYu/0NlaoCDEJiTg/rERph7BM9TwSER4idluu1NKo6b3QQB8qdJOo66I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DQO/Ewtr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DQO/Ewtr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C083F1F00A3D;
	Thu, 30 Jul 2026 10:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785405930;
	bh=qKLmi/hmYCNUVAJIf8euRiNM2rOFGc/7mdjm69eJDgo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DQO/Ewtr60+1jNo4IF8ulirEWE4ReAYWVVlf8ne4Qfb2jxX/83A4mK0sFbSrSVodK
	 DI3yaG5W6JqhwzUw6FoYqKNWjkxgQHPZANzOW9qChlqFlOkAg3epul53HXZwLYxVOe
	 AbYt4dKQhsouxsvq2E78Wl5YCC84tUx7jqrf+f6wATz8/K20CpR3xw0SrLr37ObV3V
	 glFEg2uizXXqbMV7N7SvMiFF6NNWlQMmrBgijKgEIsk4Tc/0LXxmbk2PdhnmZIjRHp
	 lhtFmajst7tZf3Z66OKxPbxKNS0JN0CO5oOnXnOnIKBuap0l6fsS4es1/tCD4nRldC
	 SAua8+9tbnIrw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 06/24] dt-bindings: clock: mediatek: regroup MT8192
 dt-bindings into MT8186
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260729-mt8189-clocks-system-base-v4-6-e356b813a64c@collabora.com>
References: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
 <20260729-mt8189-clocks-system-base-v4-6-e356b813a64c@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 10:05:29 +0000
Message-Id: <20260730100529.C083F1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `allOf` `if-then` block incorrectly uses `enum` directly und=
er `compatible`, failing to match device tree array values.
--

--- Patch [6]: [PATCH v4 06/24] dt-bindings: clock: mediatek: regroup MT819=
2 dt-bindings into MT8186 ---
commit f258fa892abdda9fb25c70a8dc0f201865aac7ab
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

dt-bindings: clock: mediatek: regroup MT8192 dt-bindings into MT8186

This commit consolidates the MT8192 functional clock and system clock devic=
e tree bindings into the existing MT8186 bindings to ease maintainability. =
The dedicated MT8192 YAML files are removed, and their compatible strings a=
re added to the MT8186 schema properties.

> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8186-cloc=
k.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
> index 0bc2da60a6016..b5988d122e4dd 100644
> --- a/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
> @@ -58,6 +58,26 @@ properties:
>            - mediatek,mt8188-vencsys
>            - mediatek,mt8188-wpesys
>            - mediatek,mt8188-wpesys-vpp0
> +          - mediatek,mt8192-camsys
> +          - mediatek,mt8192-camsys_rawa
> +          - mediatek,mt8192-camsys_rawb
> +          - mediatek,mt8192-camsys_rawc
> +          - mediatek,mt8192-imgsys
> +          - mediatek,mt8192-imgsys2
> +          - mediatek,mt8192-imp_iic_wrap_c
> +          - mediatek,mt8192-imp_iic_wrap_e
> +          - mediatek,mt8192-imp_iic_wrap_s
> +          - mediatek,mt8192-imp_iic_wrap_ws
> +          - mediatek,mt8192-imp_iic_wrap_w
> +          - mediatek,mt8192-imp_iic_wrap_n
> +          - mediatek,mt8192-ipesys
> +          - mediatek,mt8192-mdpsys
> +          - mediatek,mt8192-mfgcfg
> +          - mediatek,mt8192-msdc_top
> +          - mediatek,mt8192-scp_adsp
> +          - mediatek,mt8192-vdecsys_soc
> +          - mediatek,mt8192-vdecsys
> +          - mediatek,mt8192-vencsys
> =20
>    reg:
>      maxItems: 1

[Severity: Medium]
In the same file under the allOf if-then block, the compatible match uses e=
num directly instead of contains:

allOf:
  - if:
      properties:
        compatible:
          enum:
            - mediatek,mt8188-camsys-rawa

Because the compatible property evaluates as an array in device tree schema=
, applying JSON schema's enum directly against the array will fail to match=
 the string scalar values.

Should this be updated to use contains: enum: so that the constraints corre=
ctly apply to these compatible strings during validation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-mt8189-clo=
cks-system-base-v4-0-e356b813a64c@collabora.com?part=3D6
