Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424D6285CAA
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 15:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783696149; cv=none; b=UNkbTpi3qaKMj610xf1x5omlCHWhxkSJBpSCcMANQ6DSbdlPDUHmzbGEkZx+eeXt02Qu2iIVErhK6ea3IhpS6PtxILq+nZ3pmjewbz1IuZ3rdiNBUPu+Z1feFGVIDc+FZ3Z7fq/3cJvmDCCJhG+qkY8KXHePlu4KJprBaGin8WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783696149; c=relaxed/simple;
	bh=5FOPalQYQUuBPnwSf9FziF/S5T9BGTxiInZ92FxN+b8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DMZYyRB1OG60sEld2RTaRseXm3SF8dFZCgRq/NMvryUYp1RZ/bfXc4nl3bazj+M42qEDbfqDSUidqkKhoP73qz70m621faDsZqj98aXXO7VCpUZeFojB4snfzuXM6bW2XfY2WvKLFEyBEhsPFFLrGdCI0EC8v6k7d5ohZ9Lt/WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lWGOjFhd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lWGOjFhd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B14BE1F00A3D;
	Fri, 10 Jul 2026 15:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783696147;
	bh=QW0Z+bCsRsr5RVPh9Rg8/b6x7ml6ZkYeVLHLUAwEET0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lWGOjFhd8QT+mAvmOLvb4I9pgO1ooxxIZ3jC1DpbI4J3gblA7B5LiWbBeOgh5m9K3
	 oyCaTTBLihVtVIIlxX3kGaWS7eemBfD9EN9wah2mQc7S7dLus8MfbeNlS/TA0vjT3n
	 9M4oVnYMSDGIeYQXppuLqzs0BfNPq4mWq2slNSbv5YveJlYcsnr2VbbZ1GaJ9ZaaUD
	 shIu6aYk2JhojuIgJeA8hDvtGmHp077JK8+1Gay1shLq1CHC/kOK33hH1jpebXfSxO
	 1t0TZJzKfGeie/nRIUmsRVUB7d+eycpefA0Lr+ZuP5sZ1T2FvchOWIAjckRL2n59hd
	 kYsVyo/SQkANQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/18] dt-bindings: clock: mediatek: regroup MT8192
 dt-bindings into MT8186
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260709-mt8189-clocks-system-base-v2-6-2926da3db6cf@collabora.com>
References: <20260709-mt8189-clocks-system-base-v2-0-2926da3db6cf@collabora.com>
 <20260709-mt8189-clocks-system-base-v2-6-2926da3db6cf@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 15:09:07 +0000
Message-Id: <20260710150907.B14BE1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The if-then block conditionally requiring `#reset-cells` for MT8=
188 devices incorrectly uses `enum` instead of `contains: enum` to match th=
e compatible array.
--

--- Patch [6]: [PATCH v2 06/18] dt-bindings: clock: mediatek: regroup MT819=
2 dt-bindings into MT8186 ---
commit 788afe3e2a2b9eb892a1f9b88e225e3204455c7a
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

dt-bindings: clock: mediatek: regroup MT8192 dt-bindings into MT8186
   =20
Regroup the MT8192 clock and system clock dt-bindings into MT8186 ones
to ease maintainability and have common files for several currently
supported SoC or new future ones, that have the same kind of clock
controller design.

> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8186-cloc=
k.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
> index 0bc2da60a6016..b5988d122e4dd 100644
> --- a/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml

[ ... ]

[Severity: Medium]
Looking at the schema validation in this file, there is a regression
introduced in the prior patch of this series (dt-bindings: clock: mediatek:
regroup MT8188 dt-bindings into MT8186) where the if-then block evaluates
the compatible array against a scalar string enum:

Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml:allOf.if
  allOf:
    - if:
        properties:
          compatible:
            enum:
              - mediatek,mt8188-camsys-rawa

Is this evaluation correct for an array property?

Comparing the compatible array directly against an enum always fails.
Consequently, valid device trees with MT8188 blocks and the required
#reset-cells property fall into the else block (which enforces
#reset-cells: false), leading to spurious schema validation failures
when running make dtbs_check.

Could this be updated to use contains: enum to correctly match the
compatible array?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-mt8189-clo=
cks-system-base-v2-0-2926da3db6cf@collabora.com?part=3D6
