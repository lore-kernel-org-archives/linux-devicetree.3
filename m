Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E313E51F7;
	Tue, 31 Mar 2026 14:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774966768; cv=none; b=eBvYAE0/IgpDJOnOZ+/dp/XFSPBsAEKf+aiOldw0GTgjnC6i299rYn7YAPlHfrSRn6tcRLQDbDQrJir11Jqq3/GIIScegp3qXRia6BC684zldMvNH4GqreinIws8sy+ZVe2S00DtICsOchn8NpWyyOoNZPMpSXXaMODotfjlzPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774966768; c=relaxed/simple;
	bh=bwDXjj74FbxP/3IczpfsDu93/bk/4V78s0N4/NmWCa4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dlCKLczmdw25evrhG7CZ9uRXLpffAWwzIlgEpnUqwJcfaMoDnjn71rWMZ60Zz600fSKUFO5z7VjZm6mwMyhc+2RHN6AatDaK4bSfkdqxIMbdhnb4Erp/YhTD4w8IeGHI+TqTeA0vFWM/f/pSVxiSPrshLrxsHmi5EWA4j/52v6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=qNy4j9T8; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="qNy4j9T8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=fQEqfHwkrC3naEM0/BXP+vns+m8HcWwDA6Ogc9xcWQ4=; b=qNy4j9T8JUC9PoFmMaulR/KEAk
	bu3lIBdRejXSuPeYnrkR5s+Ntn3xaLGVfBaabmYs1E5scJwng/Nt5qgDs17ZGIyGVFgH/Mv2cCUdG
	rw2YJThe8X0/5Ighhv5K0Q5Sq2xEQDb+19njY8uTmUQNI6S/+0NpxNhuxgpjfg2/6ARnJcEapT374
	rS6DmGVtg/Ye2B4TWEScGaCWwIHXseJ4D9NvfreuAAVpc6ClTbwCOoo/mbztX9Lb6gndeDM1IfpLv
	jkIYYljgcT/AjKBZ3ow9+Druutz+9IOnR4mIVbBmF5+ReqmtLkntdZnhxKMxW25r7/G6myxniKLHj
	ASHUpbwA==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w7ZwE-000Jso-07;
	Tue, 31 Mar 2026 16:19:26 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w7ZwD-000Mdz-11;
	Tue, 31 Mar 2026 16:19:25 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Nora Schiffer <nora.schiffer@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] arm64: dts: fsl-lx2160a-tqmlx2160a-mbls2160a: enable pcs_mdio17 and pcs_mdio18 in appropriate overlays
Date: Tue, 31 Mar 2026 16:19:06 +0200
Message-ID: <20260331141915.2918927-6-alexander.stein@ew.tq-group.com>
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

From: Nora Schiffer <nora.schiffer@ew.tq-group.com>

The pcs_mdio* instances are only needed with phy-connection-type =
"sgmii" and managed = "in-band-status". Move setting status = "okay" for
pcs_mdio17 and pcs_mdio18 to the appropriate overlays, for consistency
with the other pcs_mdio* instances.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts    | 8 --------
 .../fsl-lx2160a-tqmlx2160a-mblx2160a_x_11_x.dtso          | 8 ++++++++
 .../freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_7_x.dtso | 8 ++++++++
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts
index 431e4ed2a8b86..46a9fdc92bb56 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts
@@ -545,14 +545,6 @@ i2c@3 {
 	};
 };
 
-&pcs_mdio17 {
-	status = "okay";
-};
-
-&pcs_mdio18 {
-	status = "okay";
-};
-
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_11_x.dtso b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_11_x.dtso
index 0847c786dc1ca..497ea4ddef3e6 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_11_x.dtso
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_11_x.dtso
@@ -59,3 +59,11 @@ &pcs_mdio14 {
 &pcs_mdio16 {
 	status = "okay";
 };
+
+&pcs_mdio17 {
+	status = "okay";
+};
+
+&pcs_mdio18 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_7_x.dtso b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_7_x.dtso
index 7520f105d5d8c..a51edef83317f 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_7_x.dtso
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_7_x.dtso
@@ -58,6 +58,14 @@ &pcs_mdio16 {
 	status = "okay";
 };
 
+&pcs_mdio17 {
+	status = "okay";
+};
+
+&pcs_mdio18 {
+	status = "okay";
+};
+
 &sfp_xfi1 {
 	status = "okay";
 };
-- 
2.43.0

