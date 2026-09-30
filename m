Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238D623D2B1
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 05:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790745644; cv=none; b=Rs5NPLeSwYq6qFrqhlDYo5lIERnG33T3YEV26YGJtoUiuGGFR1ncLYk6Q4fRhgoAwW3I0E4xgJ8eLLDbqhoWkthpvcFponm0LispwXQYB6yeox0lTVOyosNbnc/IWPKRiiGYLln8GeVpnbZzh986D2rBKavw9K/fLpjrSDCL/mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790745644; c=relaxed/simple;
	bh=/GHQ35whMawzNTN0jp8sG7GOtJUCcUAtZxRdzu/+Kys=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h7qN4br1r33fmgWh3ZWdogJFm5zI9MVileXczGfIs5SAqnqaRG3xpGiA02EN9zsV4IsSmMvdAfXg9S6Yzs7Iu57KE4NwadVuwmEssyPK5Ott7V2cx3WXjAxHdGatesP2HO2eyI/4hBsziNKvobwgi/UfBqshsVp4FKgxb0Avjb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MyYMwx/s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MyYMwx/s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E81D1F000FF;
	Wed, 30 Sep 2026 05:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790745642;
	bh=cnBzHz9DPUt7mIaN6ddS6+ml1MuLNmIYoyYrO1p5Leg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MyYMwx/sV9dZdBUPw8vUUSac/rZ4GnymJVdxWIEDH4i5BOudT1eByg499QgMEt3em
	 HGf4OWNViN5LtgQY/c/ixBSwsTCwhEM0kjApCqSszP+5H0BQl7o9S+dyb2TF6Uqhza
	 zyGCbKtPcGdUM3IDHBteq6jgpcZH/N/cPJBTBe3sTzRtBmRTxPuOcdDkmQu43SyB2Q
	 WqkFtZUer3Rq+YL80Opwh9lxU+iRbeFPtTyEvWk0HoJEB1TBZoiZZ+UEx6xFXSon8+
	 iXrxUeNFCt1iLalDTAhTdQkhiqXLO3Ae/B+La89+4dC1lDrXiUom+QCkDWq7Xu2D6J
	 tF8BMeg54TG/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 9/9] MAINTAINERS: Step down as Aspeed AST2500 EDAC
 driver maintainer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Chen" <ryan_chen@aspeedtech.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260930-edac-v4-9-c2e526f3ed79@aspeedtech.com>
References: <20260930-edac-v4-0-c2e526f3ed79@aspeedtech.com>
 <20260930-edac-v4-9-c2e526f3ed79@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 05:20:41 +0000
Message-Id: <20260930052042.6E81D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: edac: incomplete maintainer step-down in yaml file
--

commit 62cc943c15805204002d63eaa041815c7d089e62
Author: Stefan M Schaeckeler <sschaeck@cisco.com>

MAINTAINERS: Step down as Aspeed AST2500 EDAC driver maintainer

This commit moves the original author from MAINTAINERS to CREDITS for the
AST2500 EDAC driver. It also retains the EDAC-AST2500 entry but updates it
to list a reviewer instead.

Link: https://lore.kernel.org/r/20260920225846.4039017-1-sschaeck@cisco.com

> I am stepping down as a maintainer for drivers/edac/aspeed_edac.c and
> Documentation/devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml

[Severity: Medium]
The commit message states a step-down from maintaining
Documentation/devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml,
but the maintainers list embedded inside the YAML file was not updated.

Currently, the unmodified YAML file still contains:

Documentation/devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml:
maintainers:
  - Stefan Schaeckeler <sschaeck@cisco.com>

When a developer modifies the AST2500 EDAC binding, patch management
scripts like get_maintainer.pl will still extract this email address
from the unmodified YAML field. Should the maintainers field in the
YAML file be updated to match the commit message?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-edac-v4-0-=
c2e526f3ed79@aspeedtech.com?part=3D9
