Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635D04EB844
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890376; cv=none; b=IlyskvFy0+3Mow269iQkl4pE3/H53BBdQFNnqi8viMmCoBXcjElczBUxs5GtLwKv6GPgHFaYgCoxUhh8nP3KW9t7AMkSR7jzEpjdlrcYgVGvj6Ii8AqgLQLocCyPB5qIE/zdTWHKVclFOLvJSFtj+7PzGFAZ8gc21n55In3/55c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890376; c=relaxed/simple;
	bh=96sNeMI4SP31iYT5iolmBq7vtM9iKYSKcQ6yUNtNKOA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=EZbBr8484xQfnDGUeq+N2Tz/kWUJKrR24gBgwLQ/Parp1KIy0SgWLoVHBaDhlxYnN461oYgJ2dH+rJjfbvMh7bdY9ZytRm6LXojL/h+in7j9/ZWzwO/BcQPm3ouZ+Nu20vTdK4mD3JUlyPzmidu0+3AwF7xg+ieQP7kyteRw9V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aMkgdSqi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aMkgdSqi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F071F000FF;
	Tue, 13 Oct 2026 11:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791890375;
	bh=wlSQFeKqqorcKsXMeHTMB202B8crFkNp892yruGdboY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aMkgdSqiDjj1e51hUTNpUuvoge3LVlxWCm0/YTCXw46OlLRkx5AcEil8X0ifoZmFC
	 riHpF0sakboMAud9BsHSag/rot7lBWdyxynVjDoyar21d3LOqscAB5OQQ3aVi0RnCK
	 tnz0cisDf+DPdGISp28WOQA2XLFvqjWASSjoeux2Z1G9m6GbBWjo754S9sUlHl3pEB
	 tDPtbhY3n3lIQXtvLcfcfcFskG47Apvqf6kPuuS7bmxDoZ4+jdVBoDZwg/oj+whrse
	 RCWv/QlUtj7qcrLidSHRgmAqVF9ebSa1p5aR0OtCNy7ilYMGqL9j8e6PjOFkU72XHY
	 BPr9G+sV3dD1w==
Message-ID: <sashiko-outbox-169606@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/8] dt-bindings: media: Add CAMSS device for Hawi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nihal Kumar Gupta" <nihal.gupta@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261013-hawi-maili-camss-v2-3-fc93222da89c@oss.qualcomm.com>
References: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com>
 <20261013-hawi-maili-camss-v2-3-fc93222da89c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 11:19:33 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: media: missing data-lanes required property in CAMS=
S endpoint schema
--

commit 18094c7169d82b9037445f511f9e26e4a55cc448
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

dt-bindings: media: Add CAMSS device for Hawi

This patch adds bindings for the Camera Subsystem (CAMSS) on the Qualcomm H=
awi
platform. The CAMSS IP includes various components like CSIPHY, TPG, CSID,
and VFE.

> diff --git a/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml=
 b/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml
> new file mode 100644
> index 0000000000000..5bf0dca3d2462
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml
[ ... ]
> +    patternProperties:
> +      "^port@[0-5]$":
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input ports for receiving CSI data on CSIPHY 0-5.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY

[Severity: Medium]
Should data-lanes be added to a required array for this endpoint?

Device tree configurations missing the data-lanes property will silently pa=
ss
schema validation but fail at runtime. The V4L2 CAMSS driver relies on the
data-lanes property to properly program the CSID hardware for lane extracti=
on.

Omitting it from a required array defeats the purpose of the YAML schema
constraints.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-hawi-maili=
-camss-v2-0-fc93222da89c@oss.qualcomm.com?part=3D3
