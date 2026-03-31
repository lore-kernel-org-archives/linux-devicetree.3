Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BFA3E3D80;
	Tue, 31 Mar 2026 14:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774966768; cv=none; b=mMFG2n6Ge+oI1T1Dj2p/l/Uzi4o8Oe5CplG64+y5LRoUN874clUHG0a6qOMtcjVInVxtxPBDkzseQtlkJnoOVE5QNMmZ6WwmBG5FC1aloLfdqvGD/FNvp0i7N5KYrF1EfZbyIEj3pVvy2Ul87fU+0GelH70tAF+jO6Es6Bvg0Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774966768; c=relaxed/simple;
	bh=x57Rt/uirDtZJjGeDQoVEvv/mYls3svAvYRpPbPfLiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Spi4OkivG6YypKp/gHD3R9By93Cwb+Fkfuwa1fPk2tT7pkw4cKAHzP12Olm81lzHg2u5PFCGatvgH/FLMeUpBfS6WPQZd5dmbllqGg3aPC2SQi9kH9GcQ4JkZ7RVkNzvePFMDsib91U33c1rdSeFjzujIa4XNpEMdFPw2W9bOKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=mapNTqhO; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="mapNTqhO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=vUvf/YUOB4AwlFTFHGNktNzrfp9dJgm/1DL3JSVn+fg=; b=mapNTqhOtiTJbE+5kJqUHByDgi
	1+mHPax+I/MvzywUcHl8nIcbkxzPKWkRSXgHbpEzENzmpg/sseT00UW6SOsEiX1Y+KDMx/NU037OL
	YGzGaHgGPLzgu9I1pJIRnP0EybJ0sN5hGgA+VmhXsxxUSXWTXCAovEMQViXcHxRsNlGGZj2P2+3FS
	byY5jWqh51LWAaG8uXF6zwgO9NHu6qpbDNXlKmazN6FcdiWw8rU2ETkLKg5XtcG74/XT+s/H6N5Mm
	/wVFLK85n4TmAefsiOO29xOI7snFhbACxqWwWY89JOD67gxzSL3OkoWVdD4jVS2F0GOHYe8N3+zJl
	KMJT3DIg==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w7ZwD-000Js2-04;
	Tue, 31 Mar 2026 16:19:25 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w7ZwC-000Mdz-10;
	Tue, 31 Mar 2026 16:19:24 +0200
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
Subject: [PATCH 2/7] arm64: dts: fsl-lx2160a-tqmlx2160a-mblx2160a: use DPMAC 17 and 18 for SGMII in SERDES2 configs 7 and 11
Date: Tue, 31 Mar 2026 16:19:03 +0200
Message-ID: <20260331141915.2918927-3-alexander.stein@ew.tq-group.com>
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

We have been informed that using DPMAC 17 and 18 for RGMII when SERDES2
is configured to provide SGMII lanes for these MACs is unsupported and
will cause errors in certain DPAA2 configurations. Update these
configurations to use SGMII instead.

The total number of available Gbit Ethernet ports does not change, but
the PHYs and physical ports corresponding to DPMAC 17 and 18 do.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../fsl-lx2160a-tqmlx2160a-mblx2160a_x_11_x.dtso     | 12 ++++++++++++
 .../fsl-lx2160a-tqmlx2160a-mblx2160a_x_7_x.dtso      | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_11_x.dtso b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_11_x.dtso
index 6d0c808cd840f..0847c786dc1ca 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_11_x.dtso
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_11_x.dtso
@@ -32,6 +32,18 @@ &dpmac16 {
 	managed = "in-band-status";
 };
 
+&dpmac17 {
+	phy-handle = <&dp83867_1_2>;
+	phy-connection-type = "sgmii";
+	managed = "in-band-status";
+};
+
+&dpmac18 {
+	phy-handle = <&dp83867_1_3>;
+	phy-connection-type = "sgmii";
+	managed = "in-band-status";
+};
+
 &pcs_mdio12 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_7_x.dtso b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_7_x.dtso
index db88a86ff69cd..7520f105d5d8c 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_7_x.dtso
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_7_x.dtso
@@ -30,6 +30,18 @@ &dpmac16 {
 	managed = "in-band-status";
 };
 
+&dpmac17 {
+	phy-handle = <&dp83867_1_2>;
+	phy-connection-type = "sgmii";
+	managed = "in-band-status";
+};
+
+&dpmac18 {
+	phy-handle = <&dp83867_1_3>;
+	phy-connection-type = "sgmii";
+	managed = "in-band-status";
+};
+
 &pcs_mdio12 {
 	status = "okay";
 };
-- 
2.43.0

