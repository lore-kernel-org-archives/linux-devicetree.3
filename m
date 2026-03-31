Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFA23EE1E4;
	Tue, 31 Mar 2026 14:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774966769; cv=none; b=qEyoX8SBgwxFhxV3EplSqC0ylhlh2kx03bRpTcZCt0FpszzVnBGixlHC2OVOOeVBaVVhkCW0rQzlxAxBl98l9Uq/VP3WRcPU9CmgcszJ6v76Bwp97ePjmWLMaHpVSq4+aTKvcAluep6pNxPd44Ys57alEpNX5VB7yP4yaUkLD2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774966769; c=relaxed/simple;
	bh=UM06OKiS5HiGrfOQZU/Upa4d59Jk2omnNvQUVGefMjw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XhzMt3J+wiVeAkT/kibDWTQ064YwSiJQOBa4Z0G1oe4x40mX2PKuxxI+y8OAH6rmmf8gL0AgIFLfEkuEvhdr4qg+jPc2Y7H+HzypxaVhd2RAjk2Og+r3FvV5wcbuAGUNKIM6ujwQON1bprXOyiMJo1Ql5FBu5k25bdKWMr+CD98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=LrFZMSSD; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="LrFZMSSD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=K2vXEyzRwq8XFnMfv1noGMutc4dR8xtcHqaxGghsk7U=; b=LrFZMSSDz6tOn7NWo7tbHOV0kb
	NKGL+fKaOaykGDv1XiZ5qC+IGJhnWrjGdMg4tugLg0Llx27IgVHxQNJ3ZKTi7wdkT9scS+bLzNb2p
	1NzCWGyOe4cnUxWWyQiqgnP5IHPCTAW3qE8Qr930vagJ95DeN3bplKed+QC2kQ+qkg7nHVl3T0uvu
	wS9uvmn5xjfa19UkGHEvZMv4h8swKhYVSQZ+47Fu1yOl4OFL/NDqhLnWAXrwNVM9V4/0ESsoS7Uw/
	79fQbeCuBtvniHG4zM1U77ZfexVkTWd6vDZycENL6lwn6RevPCK/fC2aS9LojimM4bc5RjKAsZBKL
	eZGE3u2w==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w7ZwE-000Jta-2G;
	Tue, 31 Mar 2026 16:19:26 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w7ZwE-000Mdz-02;
	Tue, 31 Mar 2026 16:19:26 +0200
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
Subject: [PATCH 7/7] arm64: dts: fsl-lx2160a-tqmlx2160a: Remove deprecated properties
Date: Tue, 31 Mar 2026 16:19:08 +0200
Message-ID: <20260331141915.2918927-8-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260331141915.2918927-1-alexander.stein@ew.tq-group.com>
References: <20260331141915.2918927-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27957/Tue Mar 31 08:24:30 2026)

Setting #size-cells in MTD nodes itself is deprecated by mtd.yaml.
Remove the deprecated properties. Fixes the warning:
fsl-lx2160a-tqmlx2160a.dtsi:62.18-76.4: Warning
 (avoid_unnecessary_addr_size): /soc/spi@20c0000/flash@0: unnecessary
 #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
 or "ranges" property

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
index 5ca950ff908e7..d64879ee5e54a 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
@@ -62,8 +62,6 @@ &fspi {
 	flash0: flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
-		#address-cells = <1>;
-		#size-cells = <1>;
 		spi-max-frequency = <10000000>;
 		spi-rx-bus-width = <1>;
 		spi-tx-bus-width = <1>;
-- 
2.43.0

