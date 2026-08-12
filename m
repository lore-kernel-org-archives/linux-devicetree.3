Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523A140B0F9
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 23:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786577017; cv=none; b=ST3J23vcWspWMwY5e+kJI8oBCYKJoToCL2qxCdKsV76R/TvUFfEoCq5EqdvBF2HIi84pnJmhi++MYkwcyf7hBa68O4FbB0oi/dkg3F1vsEoUkfdVAUbJinlURCCJuf6ZS+sGgCzVxCP4MaiHWJzK2XyDITjaMk99Ln5cXsnJunM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786577017; c=relaxed/simple;
	bh=bvBGNQ3g72F135xcF3eT36xAJdheAfFPH+vdljqw24A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=slXiQmGoC+xQiX2yHlffaLbvAJr+roZNQzGjYI7bK/3hQMWP+arThRKqOr9EIF5S3x/zPo/gnCGgDLm/VF5NVB7mso10VfUElo5GPTHe3vnoi+dMpK6ORvzvHEpY53kIi0sSnAaREvUwv3iZFnULs4IXB3y2oI10og39G7TNjKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hol1N3dJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hol1N3dJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF0A11F000E9;
	Wed, 12 Aug 2026 23:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786577016;
	bh=bvBGNQ3g72F135xcF3eT36xAJdheAfFPH+vdljqw24A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hol1N3dJ8Fn/wN6V2jEWm3K9U1zAi3qdfL01qoupVZAihqZWMbGITRP6LE65DLwCl
	 3yUNJtO9c+6s4TbQilTLNmsyE5bpYaEuucgvRfBJLhoxR69nxvx7p6xakYBhDq2Xi8
	 jTxq0OKIlZyKWR9vpWprUn5WlxRh3vafuxen67r0TE5VIcQpgjJG6EUfvqKr1oyKQ+
	 z11cT2735HK6sE54ugn9gmyvHHM75dozfBtJ1NpokD01CHiHiFIKZpoBZrr1zsP19P
	 +plBmxzs6Y2wU6s/HX5sm0mWQKI3FpW9E4K9Ab7/5fnoJUrasYIrkLmCg+Imn6GQtQ
	 nrBUQdoievHPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: dt-bindings: ti,da850-vpif: Convert to dt-schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260813-ti-da850-vpif-v1-1-7779b1e4d6af@gmail.com>
References: <20260813-ti-da850-vpif-v1-1-7779b1e4d6af@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 23:23:35 +0000
Message-Id: <20260812232335.DF0A11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incomplete device tree binding conversion: the old text binding fil=
e was not removed.
--

--- Patch [1]: [PATCH] media: dt-bindings: ti,da850-vpif: Convert to dt-sch=
ema ---
commit 74502dfb55363f0cb7f1ff05a7d4febcf64ff608
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

media: dt-bindings: ti,da850-vpif: Convert to dt-schema

This commit introduces a new YAML device tree schema for the TI DA850/AM18x
VPIF, intended to replace the legacy text binding. It also adds a missing
power-domains property to the schema.

> Convert the Texas Instruments DA850/AM18x Video Port Interface (VPIF)
> device tree binding from text format to YAML dt-schema.

[Severity: Low]
Does this patch miss removing the original text binding file?

The commit message indicates a conversion from text format to YAML schema, =
but
the patch only adds the new ti,da850-vpif.yaml file and does not remove
Documentation/devicetree/bindings/media/ti,da850-vpif.txt.

Should the legacy text file be deleted in this patch to prevent duplicate
documentation in the tree?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-ti-da850-v=
pif-v1-1-7779b1e4d6af@gmail.com?part=3D1
