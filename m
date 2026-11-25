Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.40.3.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591744;
	b=KajDK5adIvmab2px5K4yVj5CCZ3Mb/NoCiDpyUHyiJb9YL4HTf3HSBAUlQv4EJT5+CjQ
	 hrSotZxwVnbXdU9vTQ6aV7awTk3lbFt9ZLekLOG4dBs7jBGYbRTRW3aHKzyqNrCozD6jl
	 h7t9vTvEaWzr3Hte0fgmLgTLsg0dauO+uHML8jWcGresasqV/bOJIWI22xsmg+rC1DktC
	 AlJHt9WOl1FJUXY6Bk9ltbEf9e/3kjYbclAofM/NR3ikRhyqRUNCnouKReOK9wFLn2f4E
	 Soi8j/KxH0DSLzk9u23f+PUemg4P2Bng4tSOoigaqrCReZU/e8MXTeA31xCIXX5uhHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591744;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Virus-Scanned;
	bh=lI79yVcuwlWNNmqWKJMamTv4DBtZCc31yF8jhwybto8=;
	b=LdpVkmxnNXVxssGbIKTUuOe2yePpX5TvLk8Gx6CBQhV7QvBHX3QFc/f6sSTjyi0wsG5P
	 zyyOm4HUi576t47jyLAH6PPiq6Xq9qfR4e+Zc6qY5DvNWD80DExzOHIo3er1hYfeaN17r
	 1QMFSQ1/19hgF2b3uRj6L6OhPESl71ejaserziPjrkVnB//+BEazUQL+O8bHmaAFijU8c
	 SNMEKdGFzOX2Mm3Lhi+L4hhfUncUcpGi2wVg21bwtsseqV0yp1PgFVzfU715SVfAsv7K9
	 cndIOjqNvAeT0MS9mHMUBgocrYwfsvLeYaOVGiUTMGjly3tyMgBTKNbhAMJSuf9uetw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ew.tq-group.com;
	spf=pass smtp.mailfrom=ew.tq-group.com;
	dkim=pass header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b="C4/4RymZ";
	arc=none smtp.remote-ip=188.40.3.216
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554B5606A323;
	Wed, 25 Nov 2026 07:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 554B5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=C4/4RymZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=lI79yVcuwlWNNmqWKJMamTv4DBtZCc31yF8jhwybto8=; b=C4/4RymZ3Rx9j1EeSHtOBAARtX
	uJmedBRiy9r9zrjYCDOwzFNpCxiRwYgT8193VTauZKvubaBEEkpiUjkG+CMP5SFnRJwhhqpkPyJpO
	QGJgTNQ1al0PrHKi1tIkG0TED4Z8klMjmDaHWmAiF4288rBlRWO4ebBr4Z4h3daBvDaEqbGEz/3GC
	7/vuHPBWPFTHq9Nxfpf//ip8lnkeByPrIqayjp4S7txQ0k06bakOiGk7UJasydbZFFyXKScUotl1J
	yAXTuNpopamm+YNjeaymLFFapmatPeIvm0EHRk1VgvGguiaxapIn/kg+2Qhp6CKcFBYKk7sX/2X9d
	SldI3cFA==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xW7R2-000Fh3-0y;
	Wed, 25 Nov 2026 08:28:56 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xW7R2-0007YA-13;
	Wed, 25 Nov 2026 08:28:55 +0100
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
Subject: [PATCH v3 0/7] TQMLX2160A-MBLS2160A DT fixes/updates
Date: Wed, 25 Nov 2026 08:28:43 +0100
Message-ID: <20261125072851.3379079-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.6/28193/Tue Nov 24 07:27:44 2026)

Hi,

this series adds small fixes and improvements for TQMLX2160A DTs.
The DT overlays address specific hardware behaviour when serdes is
configured differently.

Best regards,
Alexander

Changes in v3:
* Rebase to next-20261124
* Drop patch 7, already merged as commit 1c896b0b996a8 ("arm64: dts: imx:
  remove unnecessary #address-cells and #size-cells")

Changes in v2:
* Updated recipient list
* Added patch 8 to the series

Alexander Stein (1):
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
 .../dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi |  31 ++
 4 files changed, 367 insertions(+), 10 deletions(-)

-- 
2.55.0

