Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.40.3.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591745;
	b=Zw8lTl02Is4FVf+SLbCS4pmgC4tAC2Won4IzrwYP5JgRr8PEhoqvohMdjftjIztUNsIP
	 KYDQE0n+W9j5bQWoJcqdewZ3fiHCIf+DW/s8PkXJS7WF9Ojv4lYiYs+o+eihT0/mm+fsP
	 LxumzbhDGxQjEIoyzyID5FcIX2S0O1Oqx7X8pxNdGhMW65+uRScGqHZzfHIjti4pZji9H
	 JJbIabrHXG9ssZnRucL10RQsl8OgKyeEjsXqAiuD7PfUrgDSpOC3ON4ebFTQp6yYYfujW
	 23/zFPfHOf9ed2Gq+FnU/+UoapPxbtjcIIaZokIXLviocGOX2D61Qw7s/8LYPZ7A6Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591745;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Virus-Scanned;
	bh=3HyuKh27/G4JZBpNZlckB4ma2dQJGc9ony6yGR3bQaM=;
	b=VzI06MZuaCjL2I0u5JTzf1iEYhVtD2nF70+v0XVOK6G6vLR0f7+abd0594ByaOj0BINc
	 G4VOaG9k8GvrTY4OUNMLvDXKwAH1Em9Fqov1kfKiVsuGKeb49BJ+bKaNQrCj8124e3o10
	 0+pYOCqV4aoRuY5ah1HIvI3O4QsrNJA7S7CBI7I4nC/Z0AbjnFTT0noxvj8g2qMMThdRZ
	 SFJswJcLCq/BOLDToPq0EnxyxN8XPn3fzrOYg5QHb28FJ0XhQN0jj6Irshvk3uNxFgz8z
	 /JPLHTV31Po/mPEWBD+RfGSTGEUoLZfjDn1u/XVCw4VamhKe9MzkPf7nTf1N73y9UJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ew.tq-group.com;
	spf=pass smtp.mailfrom=ew.tq-group.com;
	dkim=pass header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=atSQHejU;
	arc=none smtp.remote-ip=188.40.3.216
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554D1606A326;
	Wed, 25 Nov 2026 07:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 554D1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=atSQHejU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=3HyuKh27/G4JZBpNZlckB4ma2dQJGc9ony6yGR3bQaM=; b=atSQHejUgMOakjuUp/OkrsqBF2
	LxUlF8yQimKQBDbRXGRol5IQrLD+z2ee+83SxCctzshxrzle3kQZx0tmsZwUKif1s5bmJSmy8VOGt
	w0bJVfdF990dXowg45jWmCvfo6t0x/XGGavxZJR8vfSw+w5hqG2WoWwkSl2qh7zTIw3liqQ6YsgFN
	GNJpP+zLexGCladnDzGrlrtoRZw3uMgSd041P20SHFAUKjImVWtehbQ+DPX4Aeokr+DHVyp3ju3pg
	dIrBnhyt0Xoz6CFzJsmlavO4400yfhjYcQUG2bFll5ASsPY3JgdslAMg2WBTi93Cotv2kTk3fDeqO
	ja/Ma0ew==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xW7R3-000FhX-0m;
	Wed, 25 Nov 2026 08:28:57 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xW7R3-0007YA-12;
	Wed, 25 Nov 2026 08:28:56 +0100
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
Subject: [PATCH v3 2/7] arm64: dts: fsl-lx2160a-tqmlx2160a-mblx2160a: use DPMAC 17 and 18 for SGMII in SERDES2 configs 7 and 11
Date: Wed, 25 Nov 2026 08:28:45 +0100
Message-ID: <20261125072851.3379079-3-alexander.stein@ew.tq-group.com>
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
2.55.0

