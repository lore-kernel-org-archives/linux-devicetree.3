Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578333DA7CB;
	Tue, 31 Mar 2026 14:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774966768; cv=none; b=P32X/P6rrMkxPI16LuJD+FzovlpmYmnt/43sAHy1GuqJs4fhUpd35Jxkp7/wUtZl1xGv5ZF7YJyVroz0avzj86uIxoGVvwcuVJPgbP6DuzfJjBBKGplkssRA8zO6I/OBYuvL0UA39aVJcAmEStvYsWRYn7qToQatWR644R/Hi+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774966768; c=relaxed/simple;
	bh=Fy5bAnFY09ly/n2yPqyP4ArKAmUCpbo0PegCQMwS+U0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=igAwr1VKlLzJ+IgMyi65ZnwLwawcXV0YQQ1tYUcwCic/2FNn5szgfsW6ALuybUuIAisPn/BkqADi4UQ7hto1HdnV74GF76VZVUpaIV6p+86++qr6f1ZV9fU7tGszkrKy6hEH+iAqODEZFERGrS7Ej3QlbkzRducKlGTjZ0DxhZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=X/RsBCWE; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="X/RsBCWE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=AO1TMipeF3x9ONXKLaFScjDsJmSbpvvwIZ+aASe0uAU=; b=X/RsBCWE/CPb59IHU8JBpkOj8F
	H5xADYQj7WN7hRlDFe8S++xS9hGlJhhyXfVjj860NoJzNpSR+8fa9i8RZGP8X2INQ6nbyhGeIqjcP
	uMxH/o+nOgpzSAfScvNnSHpPfYTbie3epZdkv4c/qw8qrZ6IIf8cL5a3QXSER0WekdTDVksCfdc6D
	+5nX3M3/j+2QuyHJdEjPWHkjzN3y8uZqqBI+UVwMAoL4JzUJEescxn2MMemxXW1LNMF5avcciHYJn
	826b3L3cWYWhUkyCRkr+Fcc0jPeTYW0HpVYSBLrmxtfxPK81gpVOfvgfPjeJW/stlid7iCmkJV0Np
	j26121ZQ==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w7ZwC-000Jro-18;
	Tue, 31 Mar 2026 16:19:24 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w7ZwB-000Mdz-23;
	Tue, 31 Mar 2026 16:19:23 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH 0/7] TQMLX2160A-MBLS2160A DT fixes/updates
Date: Tue, 31 Mar 2026 16:19:01 +0200
Message-ID: <20260331141915.2918927-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27957/Tue Mar 31 08:24:30 2026)

Hi,

this series adds small fixes and improvements for TQMLX2160A DTs.
The DT overlays address specific hardware behaviour when serdes is configured
differently.

Best regards,
Alexander

Alexander Stein (1):
  arm64: dts: fsl-lx2160a-tqmlx2160a: Remove deprecated properties

Nora Schiffer (6):
  arm64: dts: fsl-lx2160a-tqmlx2160a: fix LED polarity
  arm64: dts: fsl-lx2160a-tqmlx2160a-mblx2160a: use DPMAC 17 and 18 for
    SGMII in SERDES2 configs 7 and 11
  arm64: dts: fsl-lx2160a-tqmlx2160a: add aliases for all 18 DPMAC
    instances
  arm64: dts: fsl-lx2160a-tqmlx2160a-mbls2160a: add various GPIO hogs
  arm64: dts: fsl-lx2160a-tqmlx2160a-mbls2160a: enable pcs_mdio17 and
    pcs_mdio18 in appropriate overlays
  arm64: dts: fsl-lx2160a-tqmlx2160a-mbls2160a: specify Ethernet PHY
    reset GPIOs

 .../fsl-lx2160a-tqmlx2160a-mblx2160a.dts      | 306 +++++++++++++++++-
 ...l-lx2160a-tqmlx2160a-mblx2160a_x_11_x.dtso |  20 ++
 ...sl-lx2160a-tqmlx2160a-mblx2160a_x_7_x.dtso |  20 ++
 .../dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi |  23 +-
 4 files changed, 357 insertions(+), 12 deletions(-)

-- 
2.43.0

