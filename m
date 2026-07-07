Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EFF39A801;
	Tue,  7 Jul 2026 09:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783417864; cv=none; b=S4zelqdUek9xm4kjUmoZwqdcqHLfzivtHdpzIlzaddRc56Gtn+sBjwBM2z+ae2bHKGDzTbkxLJt/SxHNbHRQnpjYUPcHA/k4Fj0s7SyXvDq+UD5vlEo1O5zA2Hq/LLo/CniRx8Jzvl3RPW5BdhCmMJIkQ2fqeknigmrozJLvkqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783417864; c=relaxed/simple;
	bh=kvvc/nSPndfkTUbKLIow2biHzRLPGY2+JRbsIcwSkQE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BxmjyUxhfh8XPBfY1o+68yUaul7pdvWW1HlzWkPuBL9LV5slkanUauv2Wst2IiltPErSoIh/Nb4hlsy/6lrRSjVn+r4NABJaQGG5RxFWKFsVEt67QbXsB9waAAhpskzuzRZ1GoeIzcxG+jUoJ7FevaK0g2uKQbltBQJ/RFIbFPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Dm7aVc3u; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Dm7aVc3u"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=3Hg/UtyOFE2XM0kVP7XbzUzpvw8tF4yZt/+RLGcUafU=; b=Dm7aVc3us4GiTs9GzwS8SuMAGV
	7X9v84iFU58/HIQ0LeBgJ+BAhZeXanwQW7dNchk7SMPRlgiAsIVrFH+Vf3N2qahdVByDOWK59xEMS
	WfPaxchi2V7yDV1PiIuZWG1xiGt/tVI8sl6R023YIFSl+mxc2TME8pL2+SvLD/ePuGsOwhoP7LCrJ
	OuQXa6rKMj0kXgvoBq3M7uXcv4aJt2kSf5CKN0uLLZDkRYorcqtDGXa8SKMYDWS0LB4fevemRwuUr
	q5Mun1xikNq3WyRID4hZwe17BCNmoq00x0IdzhrdnaDbY4lMzRoCz5FGA026oYwhq0RCmpc2zAeOk
	zC6TPfxw==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh2SC-000PUk-2d;
	Tue, 07 Jul 2026 11:51:01 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh2SC-000Ck1-0b;
	Tue, 07 Jul 2026 11:51:00 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH v2 0/8] TQMLX2160A-MBLS2160A DT fixes/updates
Date: Tue,  7 Jul 2026 11:50:47 +0200
Message-ID: <20260707095057.1745867-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28053/Tue Jul  7 08:24:37 2026)

Hi,

this series adds small fixes and improvements for TQMLX2160A DTs.
The DT overlays address specific hardware behaviour when serdes is
configured differently.

Best regards,
Alexander

Changes in v2:
* Updated recipient list
* Added patch 8 to the series

Alexander Stein (2):
  arm64: dts: fsl-lx2160a-tqmlx2160a: Remove deprecated properties
  arm64: dts: fsl-lx2160a: Add vcc-supply for SPI-NOR flashes

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
 .../dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi |  33 +-
 4 files changed, 367 insertions(+), 12 deletions(-)

-- 
2.54.0

