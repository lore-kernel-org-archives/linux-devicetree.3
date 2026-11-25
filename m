Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.40.3.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591747;
	b=sQP2fsmGaRLT8WlKLD/HVhIub9n6Ps8r9Y0E5mx0m5aP8MDLJ2j85CWC2vmyIgxb5aex
	 Gf7uahuyEMZ7FkgmF3QbPKzdT+5qqT0bmD3CndId3mKVUJkf8YemxrDpFWJxnhbZq1vux
	 W7BrA0t7zY54vs4GncZ3ny+txINIGNPnmpwKIIoFywzKEZ3hKNv3EwuSFtBjoYq1+3owd
	 /GXepNp39p0DVJL6icbkf3lakAgKptwaARPTzrIVexsguHNstD+BMaNXtwX4N2FS7jeb6
	 lTYXAwNDdhme+YnAQY2fLh9/TfGzk9Cr9596j8agvy+e5rzEGqewvo7qpNUeVWnffog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591747;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Virus-Scanned;
	bh=wewVApk8kLH/N2Oq6lHNMYCeahDe14E98GxLMwFlc9g=;
	b=XE/bPEvI95b0FwogAXS6axtJUJ0NEkn0HRLJG9yFg1LilW5iEDUFnR1BaSvAK8qERt9g
	 idELUT3kJx0o6ZCiXv4bIkxczeKUiX8KRczaEyqhUFwDU3aAMKZddOOzPPrEarBUzh9iF
	 L073vLuTxOmsweJR37o+AaSrL7MRYe98Y4Fp78QeQhHogNZwli5M01woL62Bh4dPeIkJB
	 FlGR9gonn50hMogkBTW39AwNliMWtkgcoVR+mk+06ju5bSJ0L9VRF43YvWfEhmwHLa/nf
	 RtVQlq/E/N01irRwGAe5ceWP0MssinFHtoR5uwURIe/eXv46Y50oAJLWyjaDFTRdUCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ew.tq-group.com;
	spf=pass smtp.mailfrom=ew.tq-group.com;
	dkim=pass header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=EyakkHDt;
	arc=none smtp.remote-ip=188.40.3.216
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390B1606A68F;
	Wed, 25 Nov 2026 07:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 390B1606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=EyakkHDt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=wewVApk8kLH/N2Oq6lHNMYCeahDe14E98GxLMwFlc9g=; b=EyakkHDt9B4Bunpj9ctU/ImjO9
	lZNlUbrXKXBmQlktslU32fViJf8tyMAnD/sUIce/1OOEx6484qgwjxDFPzxW4L2vYWyH2mWSFVVI5
	jc/00il/AaAlQE6R+hIOwg++7/t/I12PFmi4Hgs9CS0xxLcq9DOmVIOmgCN+vrboPdHh25NBxUvMo
	tRKDUC2Qc0HVj4bkbZ6L3sCn1eP0mTSec3uykokLXJRX0/F3AlBzAG3IQRIlzgzru+EZu3NANp8ER
	VgMgRYAtbWAiwE8hJ7RrB5dNNfgk7QK0tjv0n1djdMPFXRtuKl7RGP4U+rsyMqkIRMoW2PKGbb4D3
	Jdt9wuCA==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xW7R4-000Fi7-2O;
	Wed, 25 Nov 2026 08:28:58 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xW7R4-0007YA-2Z;
	Wed, 25 Nov 2026 08:28:58 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Nora Schiffer <nora.schiffer@ew.tq-group.com>,
	linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/7] arm64: dts: fsl-lx2160a-tqmlx2160a-mbls2160a: enable pcs_mdio17 and pcs_mdio18 in appropriate overlays
Date: Wed, 25 Nov 2026 08:28:48 +0100
Message-ID: <20261125072851.3379079-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261125072851.3379079-1-alexander.stein@ew.tq-group.com>
References: <20261125072851.3379079-1-alexander.stein@ew.tq-group.com>
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
2.55.0

