Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220828;
	b=bZUD+ohWfVdt3cMDARnscSYljPECahSHSxT/OXW1BCYJ4FWIr25QnVx4vBXTi5yjxHdV
	 dM2ILsFZMmpNSbSBQRA5ItgaiQItQYH7obXIuv9bAu4v185UiKhDM18X14RtHSUNtBtdt
	 drW22K6A9RkjJuRY37X2mPbX72uN1ax1pZVGbqML9q2Xb+lV6eoubqJGUriOh6JmEIjsv
	 YVM5rl8kMIrgmvHEBIlz57Pd/vE0r/t/ZeeYvg2S4D3VLBsc7IFs6h1GM/QVgA4328pkM
	 RwKJqNuBjfkTYW94G9eX3F3g4x6njWK9U5c4+whZNSPXnkZsG36kNOtwQ5Dpr/Fbg+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kDbXLI9DgQaCA4gzZ0m8IWlB2sfH6Qhl9SMwK6MwX/w=;
	b=TQajo3Ii4IUjb5mNuegFje14Mae/lakGmFnohhReppvBmJ1ZAGYu2SLKSD+4m6QYk74I
	 WQKJjuIRg2wJT5D1KgcIo1UZm5eka2BIMXJr2rlEWR01Wxjt7tbzDieqqsNu+Be1e8IZC
	 WdQpPOAYPB/vHB6tdSXPwh4mvy/Ocvwr1C8F8jWU+RCLaA/220PVWHvBNF2Fgbd1zO6/g
	 AxzHT9Hh/cQcSze9vGGznVe0k6/FJqmbDXs2Eo+ombNBjzwqIOfTyVUXlYu2IvW30WgQg
	 B4vBEyngkvyBW5BArSFG1AUwoJDdDtv5vEKbsScSchZ6lR3VfpDzqHYjBN/PIC9G6Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bWFNkgKi;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E630606A6B3
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 00:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E630606A6B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bWFNkgKi
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so1488533a12.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 16:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220826; x=1795825626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kDbXLI9DgQaCA4gzZ0m8IWlB2sfH6Qhl9SMwK6MwX/w=;
        b=bWFNkgKiS6lx877mqxcv+N0Y0zc7B7GliZcCRZkWr7h0aH4YBShGmvH2z7AwOwekK/
         LfkgQZJcWA5o/p4HmcfEVTPx/RJ0FROi59PYAAwuG48M3AVPB4mPes8xXmcXalyex79/
         M6F7dv5/rxKnZAs61TsxHI47csJwg7Nw3QxkaHOjFdXCabEQkGygm6ewuw22PrPNtvGT
         M116vJB0kU0cQVgyPUODmV1xebQ1i85iNoHh2EcUZa3Ac+JAjO6DvyjjwamKUTNIcRgr
         r7BUa05/8auPFufbZZzdIebqmhaiZBkK7Y0PN74+L4Lx0Gp2HZf4CJeXesuOrPWnsA4L
         UdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220826; x=1795825626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kDbXLI9DgQaCA4gzZ0m8IWlB2sfH6Qhl9SMwK6MwX/w=;
        b=mJS2/8WcyWuLaZ08gwBeZsxq3NDm64HqTXG1Q1OUcwVElUSGkZTqcotZFKwbXXiSV+
         vPzFAQxC+65ZzJGQTuLA4G5c06BJU47HO9Qsi6slAJDosFoXHJFb9Kgn3UI9ieJEruo9
         RDqacmnjObmCwHNkdES4h5OqPREFHpN/3Rxx2h6oXJVFWpmyXIoigfPfkinEQgYH446d
         k1rck27YT02I6CrbfBuHlYdatEAl+fzfgZqcO4CWa0QygF8dgF57YrAwnGgRFsUKtcHE
         y9FvYduMR7MNFdfOqabRFGQX88DMZAB8Outxp/N1DJ3+H6YZZbPVy5syEpEnIsySTCSK
         Lk5w==
X-Forwarded-Encrypted: i=1; AL+hErGBTe/hteoLi/2VrorjgquEDdbFFWU8p0K0Oh3byk7wbvkLUEq0SF6+DuQWG7jX+K2aldSetSIwL4v6@vger.kernel.org
X-Gm-Message-State: APuU4Z/LPJTidMbfWdmOdjBHngcVxvXW8kuLdr4H3wx8HQW3PVCpWmXo
	1D35bO2gJAbTrK1J9TOcdggUSpC8V+0Nbf/4SXb3hsal+C9wG87wQzNRYcVUUQ==
X-Gm-Gg: AYBFou0PMBDiq9ntumVP14+4Q/chOy4iIfIkNl6YieY4oo78iOSUiQBqzhdS0gpUudU
	+9W2drF9ArySSR4FMplXIV+InrgF9CnogB/jTw6l1C3Wsb1VhIwE7gKqx+sUUe7Yq0/VKU3/Agt
	PH1x8oBABaoNkTukiHFn0A1XR0gBEvy4m0WRyahiQCuATVwGjiSscS0x+NZZtk+wv4wjV0Gs4yV
	kgWWDMnMrTZjU8374/+appJKnyofEymZdymNAMVgaGEEGaqnrXkIDUYnfWg0o/VSRmx94STwxo0
	P8UDFt5CcIdP+Qa9aYoi3hC6ffRl0oASjd85tDSpThQzt/zh0Ubkf01ZWj9wN3vWh0Je/YgEb9v
	qhD3Jt6wST/ywlJnZWInDHQnrH+US2IwBqap3TiFp3WA170NrG5MW16VTPvgF0dIITtU0dGWMWQ
	2kvDBEDVy1hvySJViQEhQRFrgTicVXiSlx1hUGAVlUVozSEaKKvqD90IqppQm9dXc0KUj4AY3Ka
	bmVrkxi0r4roYUABr5P4QhTTTH/afTXxZxtRJeEjI0Aca8Fn3lEjvMIA+YiFyQ7fgkloW2ss1Hq
	Wc47BlK0gDS0QF1b4/G7A27VeVhnK6X4HOXbG/zbndVb6eg2ECKALAD5/9g1bIfXfPc1H+qOQ7n
	5IMaJwC+0UwhTjmymcnt7fSLA4TEQP+IjaZXwDF2mrz4WTl4vwSCCqP1Xxx0jl7byiqVPqzkPOB
	/y8PfJ9JQu4tboRVBye4pcp3Q=
X-Received: by 2002:a05:6a20:b40a:b0:3e3:37ff:3797 with SMTP id adf61e73a8af0-4014bc4bcddmr4111361637.45.1795220825532;
        Fri, 20 Nov 2026 16:27:05 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:27:05 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 22/22] ARM: dts: BCM5301X: enable GMACs in boards that use them
Date: Fri, 20 Nov 2026 16:26:02 -0800
Message-ID: <20261121002603.25254-23-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121002603.25254-1-rosenp@gmail.com>
References: <20261121002603.25254-1-rosenp@gmail.com>
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

bcm-ns.dtsi enables all four GMACs, so every board probes and registers
network interfaces for GMACs that are not connected to anything.

Disable them by default and enable them per board:

- Boards with a switch node enable the GMACs connected to the switch's
  enabled CPU ports (port 5: gmac0, port 7: gmac1, port 8: gmac2).
- Boards without a switch node keep gmac0, gmac1 and gmac2. Without the
  switch node, b53 does not configure the switch and it stays as the
  bootloader left it, so which GMAC carries the traffic is unknown.

gmac3 has no fixed-link and no board describes what it connects to, so
it stays disabled everywhere.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm-ns.dtsi               |  8 ++++++++
 arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts |  2 ++
 arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts |  2 ++
 .../dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts     | 12 ++++++++++++
 .../broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi |  4 ++++
 .../dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts     |  4 ++++
 .../boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts  |  2 ++
 .../boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts  |  2 ++
 .../arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts |  2 ++
 .../arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts |  2 ++
 arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts |  2 ++
 .../boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts   |  2 ++
 .../boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts    |  2 ++
 arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts |  2 ++
 .../dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dts    |  4 ++++
 .../dts/broadcom/bcm47081-buffalo-wzr-900dhp.dts     |  4 ++++
 .../boot/dts/broadcom/bcm47081-luxul-xap-1410.dts    |  2 ++
 .../boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts    |  2 ++
 .../dts/broadcom/bcm47081-tplink-archer-c5-v2.dts    |  4 ++++
 .../arm/boot/dts/broadcom/bcm4709-asus-rt-ac3200.dts |  6 ++++++
 arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts |  2 ++
 .../dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dts     |  4 ++++
 .../arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts |  2 ++
 arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts |  2 ++
 arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts |  4 ++++
 .../dts/broadcom/bcm4709-tplink-archer-c9-v1.dts     |  4 ++++
 .../boot/dts/broadcom/bcm47094-asus-rt-ac3100.dts    |  6 ++++++
 .../boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts    |  6 ++++++
 .../arm/boot/dts/broadcom/bcm47094-asus-rt-ac88u.dts |  8 ++++----
 .../boot/dts/broadcom/bcm47094-dlink-dir-885l.dts    |  2 ++
 .../boot/dts/broadcom/bcm47094-dlink-dir-890l.dts    |  2 ++
 .../boot/dts/broadcom/bcm47094-linksys-panamera.dts  |  4 ++++
 .../boot/dts/broadcom/bcm47094-luxul-abr-4500.dts    |  2 ++
 .../boot/dts/broadcom/bcm47094-luxul-xap-1610.dts    |  2 ++
 .../boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts    |  2 ++
 .../boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts    |  2 ++
 .../boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts    |  2 ++
 .../boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts |  2 ++
 .../arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts |  2 ++
 arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts   |  2 ++
 arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts  | 10 ----------
 .../boot/dts/broadcom/bcm53016-dlink-dwl-8610ap.dts  |  8 ++++++++
 arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts  | 12 ++----------
 arch/arm/boot/dts/broadcom/bcm94708.dts              | 12 ++++++++++++
 arch/arm/boot/dts/broadcom/bcm94709.dts              | 12 ++++++++++++
 arch/arm/boot/dts/broadcom/bcm953012er.dts           |  4 ++++
 arch/arm/boot/dts/broadcom/bcm953012hr.dts           | 12 ++++++++++++
 arch/arm/boot/dts/broadcom/bcm953012k.dts            | 12 ++++++++++++
 48 files changed, 190 insertions(+), 24 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi b/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
index 707c8693b282..850b74a0fe6a 100644
--- a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
@@ -335,6 +335,8 @@ gmac0: ethernet@24000 {
 			reg = <0x24000 0x800>;
 			phy-mode = "internal";
 
+			status = "disabled";
+
 			fixed-link {
 				speed = <1000>;
 				full-duplex;
@@ -345,6 +347,8 @@ gmac1: ethernet@25000 {
 			reg = <0x25000 0x800>;
 			phy-mode = "internal";
 
+			status = "disabled";
+
 			fixed-link {
 				speed = <1000>;
 				full-duplex;
@@ -355,6 +359,8 @@ gmac2: ethernet@26000 {
 			reg = <0x26000 0x800>;
 			phy-mode = "internal";
 
+			status = "disabled";
+
 			fixed-link {
 				speed = <1000>;
 				full-duplex;
@@ -363,6 +369,8 @@ fixed-link {
 
 		gmac3: ethernet@27000 {
 			reg = <0x27000 0x800>;
+
+			status = "disabled";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
index 574fc4f76e75..433e3719cab6 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
@@ -103,6 +103,8 @@ &usb3_phy {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
index 0f369c5d6a5c..9b741a402de5 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
@@ -94,6 +94,8 @@ &usb3_phy {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts
index f5c95c9a712e..62b028c0fb1e 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts
@@ -136,3 +136,15 @@ &usb3 {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac0 {
+	status = "okay";
+};
+
+&gmac1 {
+	status = "okay";
+};
+
+&gmac2 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi
index 9f9084269ef5..698685b889e7 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi
@@ -191,3 +191,7 @@ port@8 {
 		};
 	};
 };
+
+&gmac0 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts
index 459ed246030b..25a5abb42b67 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts
@@ -187,3 +187,7 @@ port@8 {
 		};
 	};
 };
+
+&gmac0 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
index bca4c440a499..5d5f6bb4fdda 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
@@ -56,6 +56,8 @@ &usb3 {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
index 8b3074684e78..5746dd9b7ae4 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
@@ -58,6 +58,8 @@ &usb3 {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts b/arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts
index 3375b234fc9b..4c3feb950d5e 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts
@@ -62,6 +62,8 @@ button-restart {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts b/arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts
index 26ac2f2ed5a3..9f884f11f8fb 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts
@@ -69,6 +69,8 @@ button-restart {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
index 81c2e6652a27..7bbcb9e735ff 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
@@ -93,6 +93,8 @@ button-restart {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
index 2d7bbc4ded60..a17cc4e8f0ab 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
@@ -101,6 +101,8 @@ &usb3 {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts b/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts
index 60661dde8ca5..23d39c9e07d2 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts
@@ -129,6 +129,8 @@ &spi_nor {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts b/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
index 4ae4e2d00b7c..059c32126427 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
@@ -88,6 +88,8 @@ &usb3_phy {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dts b/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dts
index 192b8db5a89c..6f466a584ee8 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dts
@@ -155,3 +155,7 @@ port@8 {
 		};
 	};
 };
+
+&gmac0 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-900dhp.dts b/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-900dhp.dts
index 6cb27ea2dd94..1f4b7bb1b29c 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-900dhp.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-900dhp.dts
@@ -145,3 +145,7 @@ port@8 {
 		};
 	};
 };
+
+&gmac0 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dts b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dts
index 2b152115d03e..7eda4acc11b3 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dts
@@ -62,6 +62,8 @@ button-restart {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts
index b5664216dcef..64f56a320099 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts
@@ -111,6 +111,8 @@ &usb2 {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dts b/arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dts
index 54898849b87f..b06a5935bea9 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dts
@@ -149,3 +149,7 @@ port@8 {
 		};
 	};
 };
+
+&gmac0 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac3200.dts b/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac3200.dts
index 3da2daee0c84..1b285996e422 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac3200.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac3200.dts
@@ -76,16 +76,22 @@ led-wps {
 };
 
 &gmac0 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
 
 &gmac1 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 1>;
 	nvmem-cell-names = "mac-address";
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 2>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts b/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts
index 4114c6eda1ac..101123158e8b 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts
@@ -72,6 +72,8 @@ button-restart {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et1macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dts b/arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dts
index 6543eb8aa9f5..c72c76015aaa 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dts
@@ -168,3 +168,7 @@ port@8 {
 		};
 	};
 };
+
+&gmac0 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
index 37593e7582ba..df926ee77a1c 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
@@ -163,6 +163,8 @@ &usb3 {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et2macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
index 65affe615bb8..dcedd0129e2f 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
@@ -115,6 +115,8 @@ &usb3_phy {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
index a4b135d37659..3d48b2a6d160 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
@@ -248,3 +248,7 @@ port@8 {
 		};
 	};
 };
+
+&gmac2 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dts b/arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dts
index c38396ac1288..7a9b7895dc05 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dts
@@ -158,3 +158,7 @@ port@8 {
 		};
 	};
 };
+
+&gmac0 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dts b/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dts
index 1655ac95769c..e6dfda3e00ab 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dts
@@ -19,16 +19,22 @@ et0macaddr: et0macaddr {
 };
 
 &gmac0 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
 
 &gmac1 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 1>;
 	nvmem-cell-names = "mac-address";
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 2>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts b/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts
index 8bf623c67de0..79b089f1dd26 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts
@@ -82,16 +82,22 @@ led-wps {
 };
 
 &gmac0 {
+	status = "okay";
+
 	nvmem-cells = <&et1macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
 
 &gmac1 {
+	status = "okay";
+
 	nvmem-cells = <&et1macaddr 1>;
 	nvmem-cell-names = "mac-address";
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et1macaddr 2>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac88u.dts b/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac88u.dts
index a197f447fd97..a4c8928646d1 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac88u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac88u.dts
@@ -93,16 +93,16 @@ fixed-link {
 	};
 };
 
-&gmac0 {
-	status = "disabled";
-};
-
 &gmac1 {
+	status = "okay";
+
 	nvmem-cells = <&et1macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et1macaddr 1>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts
index b64ba9afa736..7137bf2452a7 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts
@@ -122,6 +122,8 @@ &usb3 {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et2macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts
index 944d592dee2c..9029257fe1f2 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts
@@ -120,6 +120,8 @@ et0macaddr: et0macaddr {
 };
 
 &gmac2 {
+	status = "okay";
+
 	/*
 	 * The NVRAM curiously does not contain a MAC address
 	 * for et2 so since that is the only ethernet interface
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
index bdbd0f097925..1fc92eaf74ea 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
@@ -307,3 +307,7 @@ partition@5200000 {
 		};
 	};
 };
+
+&gmac2 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts
index 00aa28a2e70e..393a3994c3f3 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts
@@ -66,6 +66,8 @@ &usb3 {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts
index 04420ebf056a..ff05766d5171 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts
@@ -60,6 +60,8 @@ button-restart {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts
index 765b74919fcd..947424406bf2 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts
@@ -66,6 +66,8 @@ &usb3 {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts
index eb4bdf8c9c7e..59b6b03d9683 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts
@@ -56,6 +56,8 @@ &uart1 {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts
index d5436d70ecbf..f7f6d045b5f3 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts
@@ -106,6 +106,8 @@ &usb3 {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
index 64d3634d130c..c83c063270e6 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
@@ -77,6 +77,8 @@ button-restart {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts b/arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts
index 2518f25b0eaa..dff5891f6c38 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts
@@ -105,6 +105,8 @@ &usb3_phy {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et2macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts b/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
index 018faf90fd4d..72138fced325 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
@@ -48,6 +48,8 @@ &usb3_phy {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts b/arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts
index 890945a5690b..fba1074b7c9e 100644
--- a/arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts
+++ b/arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts
@@ -57,22 +57,12 @@ &uart1 {
 	status = "disabled";
 };
 
-&gmac0 {
-	status = "disabled";
-};
-
-&gmac1 {
-	status = "disabled";
-};
 &gmac2 {
 	status = "okay";
 
 	nvmem-cells = <&macaddr_board_config_66>;
 	nvmem-cell-names = "mac-address";
 };
-&gmac3 {
-	status = "disabled";
-};
 
 &nandcs {
 	partitions {
diff --git a/arch/arm/boot/dts/broadcom/bcm53016-dlink-dwl-8610ap.dts b/arch/arm/boot/dts/broadcom/bcm53016-dlink-dwl-8610ap.dts
index c1f54391746f..6f1e0c77cdef 100644
--- a/arch/arm/boot/dts/broadcom/bcm53016-dlink-dwl-8610ap.dts
+++ b/arch/arm/boot/dts/broadcom/bcm53016-dlink-dwl-8610ap.dts
@@ -80,15 +80,23 @@ et1macaddr: et1macaddr {
 };
 
 &gmac0 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr>;
 	nvmem-cell-names = "mac-address";
 };
 
 &gmac1 {
+	status = "okay";
+
 	nvmem-cells = <&et1macaddr>;
 	nvmem-cell-names = "mac-address";
 };
 
+&gmac2 {
+	status = "okay";
+};
+
 &spi_nor {
 	/* Serial SPI NOR Flash MX 25L1606E */
 	status = "okay";
diff --git a/arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts b/arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts
index d6dc448b2849..8c1d94a5b546 100644
--- a/arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts
+++ b/arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts
@@ -103,20 +103,12 @@ &uart2 {
 	 */
 };
 
-&gmac0 {
-	status = "disabled";
-};
-
-&gmac1 {
-	status = "disabled";
-};
 &gmac2 {
+	status = "okay";
+
 	nvmem-cell-names = "mac-address";
 	nvmem-cells = <&mac_address>;
 };
-&gmac3 {
-	status = "disabled";
-};
 
 &pwm {
 	status = "okay";
diff --git a/arch/arm/boot/dts/broadcom/bcm94708.dts b/arch/arm/boot/dts/broadcom/bcm94708.dts
index d9eb2040b963..0ae0c4bd76ef 100644
--- a/arch/arm/boot/dts/broadcom/bcm94708.dts
+++ b/arch/arm/boot/dts/broadcom/bcm94708.dts
@@ -47,3 +47,15 @@ memory@0 {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac0 {
+	status = "okay";
+};
+
+&gmac1 {
+	status = "okay";
+};
+
+&gmac2 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm94709.dts b/arch/arm/boot/dts/broadcom/bcm94709.dts
index 618c812eef73..e569cdadebbc 100644
--- a/arch/arm/boot/dts/broadcom/bcm94709.dts
+++ b/arch/arm/boot/dts/broadcom/bcm94709.dts
@@ -47,3 +47,15 @@ memory@0 {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac0 {
+	status = "okay";
+};
+
+&gmac1 {
+	status = "okay";
+};
+
+&gmac2 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm953012er.dts b/arch/arm/boot/dts/broadcom/bcm953012er.dts
index d939ec9f4a9e..9819bc429c76 100644
--- a/arch/arm/boot/dts/broadcom/bcm953012er.dts
+++ b/arch/arm/boot/dts/broadcom/bcm953012er.dts
@@ -65,6 +65,10 @@ &spi_nor {
 	status = "okay";
 };
 
+&gmac0 {
+	status = "okay";
+};
+
 &srab {
 	status = "okay";
 
diff --git a/arch/arm/boot/dts/broadcom/bcm953012hr.dts b/arch/arm/boot/dts/broadcom/bcm953012hr.dts
index b728cd54715e..23e54d77ad38 100644
--- a/arch/arm/boot/dts/broadcom/bcm953012hr.dts
+++ b/arch/arm/boot/dts/broadcom/bcm953012hr.dts
@@ -51,6 +51,18 @@ memory@80000000 {
 	};
 };
 
+&gmac0 {
+	status = "okay";
+};
+
+&gmac1 {
+	status = "okay";
+};
+
+&gmac2 {
+	status = "okay";
+};
+
 &nandcs {
 	partition@0 {
 		label = "nboot";
diff --git a/arch/arm/boot/dts/broadcom/bcm953012k.dts b/arch/arm/boot/dts/broadcom/bcm953012k.dts
index 27c0992f1855..59ee5aa74498 100644
--- a/arch/arm/boot/dts/broadcom/bcm953012k.dts
+++ b/arch/arm/boot/dts/broadcom/bcm953012k.dts
@@ -117,3 +117,15 @@ &uart1 {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac0 {
+	status = "okay";
+};
+
+&gmac1 {
+	status = "okay";
+};
+
+&gmac2 {
+	status = "okay";
+};
-- 
2.56.1

