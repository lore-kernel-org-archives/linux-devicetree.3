Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AB33655D5
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 18:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783015572; cv=none; b=HCV/3IvyuG90B0/xu0g6vCIj/xCqs1sI50LIpJJmTrnWnNOcoRo9xlwQdRcbxfRkiw2rY84zVOCRTti42e9k5RchtktNYbrN8dqowSeUlehz7CO0LDbcqBaRwE+4I5p/aJtLO7uvBFU3J8nt59nCX4nPmRjYzfDZzpTCjftl9lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783015572; c=relaxed/simple;
	bh=JFVoFQMInL5A4xzoE0ZEkMJ778LNhqsKPHzj+WXkBRQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q9nxVQhRgLfC2QPVoVbiPBPYp3TbEAzNJv76lag/0DjLuWFvBCPDpm1BpHdU0UHWn9EF8bk7sIQam08fGWxMNL9aEhd5JxAkSevicWVE3guRaqGas6BTt1NWMuN53zt4EiF+u/DaAa0gKddJFm6HP7Z/kucchis9bl7ILCIpmF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nh1Be7E6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nh1Be7E6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFCC01F000E9;
	Thu,  2 Jul 2026 18:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783015571;
	bh=7xLS6YlyL3vpDbNbKjcLcxUrHNlpZe2kbA6R79G+bHc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nh1Be7E65IhfoDHo8ymxNH/2aeNPdh9yRpKU/HgFvkPh3F4bTq3pKQS1UE8mLg2S1
	 6nN9GyIv2EV51WxDJJtDwb/yNKUpE9z1RJLp/8q3SMtqgaDbpjN/2QKOCtih+oIz3k
	 5Yf1VQtvEG+s4xw2wTC2dqFc7rR2ZfJv/JP9f9QBlFLQpHKuxqfrdOpY47DRh0qU8c
	 4cjvb2mhgeSFlVGpqQ5k6BN8Kl0YYDVbWTyhkWT0N575rfG31eEY/0gGcK0govEEpp
	 m5WjfLKxtzVO4WK+GnwfqG0gjfR4eV72dYYoaPO5wr/g+UaXcPG3d+yJKnN0dsbNHo
	 epbPoFFI9Yhlw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/15] dt-bindings: clock: mediatek: regroup MT8195
 dt-bindings into MT8186
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260701-mt8189-clocks-system-base-v1-4-2b048feea50a@collabora.com>
References: <20260701-mt8189-clocks-system-base-v1-0-2b048feea50a@collabora.com>
 <20260701-mt8189-clocks-system-base-v1-4-2b048feea50a@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 18:06:10 +0000
Message-Id: <20260702180610.AFCC01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The DT binding schema incorrectly uses `enum` instead of `contai=
ns: enum` to match `compatible` strings inside conditional blocks, neutrali=
zing the constraints.
- [Medium] The `else` block restricting reset capabilities incorrectly targ=
ets the nonexistent property `reset-cells` instead of `#reset-cells`.
--

commit 5c3ff57e342863b74b59fdf9d908f09394d8d10f
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

dt-bindings: clock: mediatek: regroup MT8195 dt-bindings into MT8186
   =20
This commit regroups the MT8195 clock and system clock device tree bindings
into the MT8186 binding files. It adds the MT8195 compatible strings to
mediatek,mt8186-clock.yaml and mediatek,mt8186-sys-clock.yaml, removing the
original MT8195-specific binding files to ease maintainability.

> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8186-cloc=
k.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
> index 3b543c810f18d..84e602c7d3266 100644
> --- a/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
[ ... ]

[Severity: Medium]
While reviewing this file, I noticed an issue in the allOf block introduced
earlier in this series:

allOf:
  - if:
      properties:
        compatible:
          enum:
            - mediatek,mt8188-adsp-audio26m

Does this incorrectly use enum instead of contains: enum?

The schema validation tool treats the compatible property as a string array.
Because enum strictly expects a single string, it will never match an array,
causing the if condition to always evaluate to false.

As a result, the then clauses are skipped entirely, allowing device trees
missing the required #clock-cells and #reset-cells properties to silently
pass schema validation for MT8188 and MT8189 compatibles, which defeats the
purpose of the conditional checks.


[Severity: Medium]
Further down in the same allOf section:

    then:
      required:
        - '#reset-cells'
    else:
      properties:
        reset-cells: false

Does this else block restrict the wrong property name?

It targets the nonexistent property reset-cells (without quotes) instead of
the standard dt-binding property '#reset-cells'.

This allows compatibles that do not support reset capabilities to erroneous=
ly
include the #reset-cells property without causing a schema validation failu=
re.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701-mt8189-clo=
cks-system-base-v1-0-2b048feea50a@collabora.com?part=3D4
