Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCD13845CB
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 14:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787667374; cv=none; b=GtLe9wO8W4f2+2CQWkPRqY4AWqU0Q0CEuCNtG8hyrZQJJvAJtyhLCrIV2lqCiDOM9vbd8wfZmweQxeuHtWfE5Ucio7fZe7PQttjMmJtuQCKO+6jYfgD5rJrA4Xf+CyZJuADWcxChqlRz2qrl18DLnIRq/UkYWllFRJBjC0b2WmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787667374; c=relaxed/simple;
	bh=Tttoy+pwrqVuGWRXgN1xqFdvLUo1FLwGLXWuJthNbzc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oxdY4fHFNCeT8re81RdHCO4KeeuJwNpg4vx7sajSPSdk0/hjsSadKdbehBUsvhqTw5SwD2Ixp9c2Y69J/JtgCQg5uJE28Onb+QlPyduAWDK63FQnztNquSK1kUVO31xNgoMIWtPA6l2XK0JAbh065x0Wcf2WYCRHpl+Me32RJeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fWgWSGcE; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fWgWSGcE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=2OfUDfIvGiOYAf
	w48NfUsS0nLcidY8wo/4xe/9l/MIQ=; b=fWgWSGcESAQXvEzG12vQSbtAf+1kO3
	Fgg4IYSLgC5YrjqBhEv0ou0w8daSnXxiJ/RqbagUeypHFa5DovfNSsPHc3CNAFaN
	tgUpPKbMTZ7jnX9TKbuYNxVv7hdY1HI2TtMiGdcH58gjvZWzINmuyYe2FF8OVYg1
	CKoQSnlcgacE9SIiIrtOJxvm7UEcZCYiMe4yfNT3yNpKp4REDiN+mj9t/0Q12vkq
	GF6gLj9fqb+LjTVZ9fL+ApW7qLcTtxisKpF97cLiSUDxYp5F2MhLqP7oihhuaDap
	alxxLpP/RPjRo+zzYFjCD3gEUR0M04tV/txuMoKc6y0XhwhinBKgVwmQ==
Received: (qmail 534226 invoked from network); 25 Aug 2026 16:16:01 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Aug 2026 16:16:01 +0200
X-UD-Smtp-Session: l3s3148p1@7TUCvt9ZHOIujnus
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/4] dmaengine: sh: rcar-dmac: add R-Car Gen5 X5H support
Date: Tue, 25 Aug 2026 16:15:42 +0200
Message-ID: <20260825141542.30901-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here is a small series with the needed driver updates to support R-Car
Gen5 and X5H for the SYSC-DMAC. Details are in the patch descriptions,
but it is all small stuff.

It has been tested on an Ironhide board (X5H) and a SparrowHawk (V4H)
for regression testing. The testing branch can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/x5h/i2c-experimental

The patches here are based on linux-next as of 20260825. DT checks have
also been passed.

Looking forward to comments or approval!


Wolfram Sang (4):
  dmaengine: sh: rcar-dmac: fix style in struct initialization
  dmaengine: sh: rcar-dmac: SMMU doesn't need IPMMU workaround
  dt-bindings: renesas,rcar-dmac: Add support for R-Car X5H SoC
  dmaengine: sh: rcar-dmac: Add support for R-Car Gen5 SoCs

 .../bindings/dma/renesas,rcar-dmac.yaml       |  6 +++++
 drivers/dma/sh/rcar-dmac.c                    | 25 ++++++++++++++-----
 2 files changed, 25 insertions(+), 6 deletions(-)

-- 
2.47.3

