Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830411;
	b=npq1VIZiq4RWW97FD7dtjrrTtv2KiGIsjPYR10+AY+m8gaeV3lsgR7rZIn+YHVCdUuu+
	 UcFCFuM/SN5RtueSveHnI9SKNmuFhoB58eaThumc2N12XRCOVafRR8mBCD+EqCrDHNt3p
	 4nViUR8iAF/Jliy64dcfWoG06MlCfaJyKjM8k+VYkob/6GYs2z767q1lc/cPmPXvHLShB
	 nv+rXclWgg/KqxBlzZYC8DvmLhvIEs8PH60b+EKhdhyoQvNYJwGOtUcTmCADzPyYzEmEO
	 98bniCYpTrlROw0N3OxUviOZtGPFjfgk3d/aixkC9UhkECSCdG2RaGO4feS/IaAyqGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830411;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YX9FBeJhdF2yIOAZUujuinCPpS1WalQ+zwpREND6wuQ=;
	b=CIE91g7LIl8I4u1P/6ao9m9GWNK4D9XI/W2Ucg9m+tUX7HGq7Cfgp2cl3osmlhuTZ0t5
	 mO+udtj2V7dK6Zx9QmCfj5ryZHGkhX5c50l4TiGlNBOpKT7ZJV81mwc/IPkNr8CaAkP2d
	 TNQTmfJab9sKlNBtw2+mRgryyRwJtIo/r1MNVw2Ggf1EDHLQHPUoCYZ4BFpnSruh6PoOa
	 ji9kFbCEwC9yDsqO+OgUJrQKBYi5wS2BjL5vxBVVyI+EU5OWJeaxyWN0uptv6eqlor7OX
	 u4pdr/Ay6dG4QjrbXmQixpJmx59KSEbin3KBpN05GoCyDYAaYR9lJ3KEqeUgPD02ThQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=DevN2MCk;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEE8606A31C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 12:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFEE8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=DevN2MCk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=YX9FBeJhdF2yIO
	AZUujuinCPpS1WalQ+zwpREND6wuQ=; b=DevN2MCknXa4YIYL3gu+B63l7kMknv
	AQ7Fv1s72gzb4qHVkw//DYBXskeVMFja7Ee9JXCalPjb262ONUm/QGklFcsXFtmi
	28kqSpe3BqkFXEHAN8+tf1QcwEJqypbnt03IuMYL3JwTuTEpGGulnzG+Uf9pTym9
	s3XUnIULVn2qBOTMxp1cdEqKcx/XD+08iu41yLo37WKh3/Z20oV9CluI0WIoP9nx
	1JHhuPhhD4ex4MH7ZmIgimgx4zF4OiTJF3GfmNevvrWMlYysDKAueExF7HLtKjtE
	gzbCGINW397TaLIYJGhW0dzCOKeFmgEr5hwd2P66cibDm4qDds+SHq9A==
Received: (qmail 1271540 invoked from network); 16 Nov 2026 13:00:02 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Nov 2026 13:00:02 +0100
X-UD-Smtp-Session: l3s3148p1@sC2QhGNgeusujnv5
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Adam Ford <aford173@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2] arm64: dts: renesas: beacon: Increase sdhi2 speed
Date: Mon, 16 Nov 2026 12:59:24 +0100
Message-ID: <20261116115958.175376-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.53.0
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

From: Adam Ford <aford173@gmail.com>

The WiFi chip can run at sdr104. Set the respective flags to push the
sdhi faster.

Signed-off-by: Adam Ford <aford173@gmail.com>
[wsa: rebased]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Change since v1:
* drop HS400 hunk because of unclear SoC-ES dependencies

 arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
index 882513149042..873ffb106333 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
@@ -288,8 +288,9 @@ &scif2 {
 };
 
 &sdhi2 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&sdhi2_pins>;
+	pinctrl-1 = <&sdhi2_pins>;
+	pinctrl-names = "default", "state_uhs";
 	bus-width = <4>;
 	vmmc-supply = <&reg_3p3v>;
 	vqmmc-supply = <&reg_1p8v>;
@@ -297,6 +298,8 @@ &sdhi2 {
 	cap-power-off-card;
 	keep-power-in-suspend;
 	mmc-pwrseq = <&wlan_pwrseq>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
 	status = "okay";
 	#address-cells = <1>;
 	#size-cells = <0>;
-- 
2.53.0

