Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945196;
	b=cUwdGF1axpUD/YZiqzEsVi/k8SRSDY/bmjfCDS16ANj8uT379OwnLXVGOkGzrdVJdGBW
	 LuBPFVuaWMkf4a5I+wVBreuo6DZ+7S6tQUkV9cbRZ0A1Nz0GYvPykewgU/CDzjUtgv0X8
	 ibARInez+go9cc2sc7MQCihy4xskfEDIKpRhMlor7wjOrnO2NkP/oPWhw4GcPq2ZPNoGI
	 RqcREpGhq/nx3wkSyEzO5947AwfAoeI9GU69aSDMY95+8jb4RvjyKgAjIJ/dQUE639a3N
	 E6ECqBUthzhnTqo6DkavFd4GEX4EyXXxsmnqTnVIU03MczoMcSNIyVR9eHQDj4TAf4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7EJsMCWEqKKGcSspnc55D/y+wcj1XBvUuvUKTfXAjUw=;
	b=eMaXFZM+dVZ/N6OumVLS2jJkOEN/aykOj/Pzly0iGin7yQ5vsZ7JMbOtgDqJkiq2HkNs
	 RxOTNtm628ciDp54oy4pv69pUxsMK/T4eb8IFky+NTua7F99iPedSOFNueOVRo4TiH2XE
	 HttOvkRUJUpmO+o6LJp45FqB2gF8xabDrBnJyaTCEgP8uZKaBzbPEYL3OVlosqBBVYC55
	 eb77jW8b/NOPJNdPrEcp3R4x5PkWvMU0DnVQojnniyFU2WKdbPjsSb90DVj1NJmNrA0AW
	 1QxCZZKcHzmE7RtUaW5wmmJbV+O7SkxTV4xkaelYPpEvvP3fbZotH8ovra4FkWICLWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DzkSXLzB;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42F8606A326
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 06:06:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C42F8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DzkSXLzB
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1438d9363fbso293726c88.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 22:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793945195; x=1794549995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7EJsMCWEqKKGcSspnc55D/y+wcj1XBvUuvUKTfXAjUw=;
        b=DzkSXLzBR74blt5mdRrSAyaYHHNFLWLkviwiLiX+x78SkSBTUyx2g0Xe0Nwlv/iRoE
         csiF0cRSjS+OoADVIL1tqz7Q0b9TiJtBHjKmFKx0H8ylANmgh6ke7UhX+4nlupu0qY05
         O6fWZCUFHF/FzQTApWMoUjJRP4FZgSC1W3LY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945195; x=1794549995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7EJsMCWEqKKGcSspnc55D/y+wcj1XBvUuvUKTfXAjUw=;
        b=x7WYvqosCNGxZr3tukAwZU/byZZx9xKMpKacfGGu7KdOa9lBNQ3TEFCODvOSl1tMmE
         coUJ9hi37BjN2JaM1I0gfcGDQAw9oNPdnGNNrZQn2LYKHPpaS2dQxdVjnBcKg9WRdXE4
         SpLINe9NEIfjUi78mSTf081etzmbmZ3lTjeuGT/er9aPZnBiVGjNHugNpRUhaBKEjk0d
         GvKDbh07iEIux47VPkTKTAE6c2EhPZx1m3HmzpFe8md03eX1ac/nFsniMqc3uOWZ6kWs
         GNGOzp0122uGfAFYNsc6yjkZKVsS8RFelLs2rAgO8EXSU0pW/mbSVBV6A/oA/V+1KpiD
         BDrw==
X-Forwarded-Encrypted: i=1; AKwUvBw2H9s2WKFUzNs9vR1yMpyqg+L4iWR4YyQNjHHt0pQ+jCsabts2CvlCDznGCFPSr4ftLOwoRkjL3ZIB@vger.kernel.org
X-Gm-Message-State: APuU4Z9aEB3c3BKQ6hS9IQSevL673F6gUH4tD5RY6A+cGNkPDdI7qbgt
	kBHM65IgQmGKRttr3YolQS8vAwMcqU2jGRhk3AdNBj5n8aqZNhMPGTO/y8OD/jQNtA==
X-Gm-Gg: AYBFou397k8U4TuXiijV4arX03IXDXdBEqo4iOLcIgxLbxtpebp+v+E9cg+AYNZWJT9
	GDgV2xj1jPqesNveuOajKG2OcwWCGStzZ9EJYqHvFJG65oMkoRjXE52RItitR0psFHHw7B/PFX0
	JPJxcC4+MCols0v/HM6UQvtbVuPGs0LFnGvwu8czTLxd2TC7SMRp/eycY696ruS7SnazG+J452a
	v4PaORd3x2KU3yhqensT22jBu6lN1th9FyYmv2GwB01v6wjE85lO59FPMQRJ6+KcmyOIPLuAsuh
	5H59HUQaIQtAWaGDS1SJxDbK+oEgBavsvKyQIg7xJAcETn5EW3HunzgjOv3qnVUrZeJuElfgth4
	WPSctv0ajlfnNSpuLwuCvem1nN3nlqyyquO86oqnSpCi3uvj411N0+oaliFyYfLqTmaar3yMZEr
	YvHjS4v1mPZ1kjU8DAh+DunmxEI7L+lUa9te8mWmw+lPNkavVYLZMJSUpi+mMDdEBzauBMnGoRL
	EtJrnQfOgq004AY3uCHbBoWLDibvkhXrt2UaKrUXmzym3XqT/2u5G22w1mveQcFRW9n6Cqu6oiO
	23EvJ9EXyWHXhCDEl/8QVnl1517DQI0Bedu1lf8tHUDy6Xx3Y1MedRYMWc/gGHUsT3/hqYbkSiO
	NuNFllxEWA0pg
X-Received: by 2002:a05:7022:29c:20b0:148:ece:8cc3 with SMTP id a92af1059eb24-1b24f4e2176mr6321128c88.24.1793945194629;
        Thu, 05 Nov 2026 22:06:34 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:f73e:d73b:c0da:5b05])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm3821809eec.6.2026.11.05.22.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:06:34 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/3] arm64: dts: mediatek: mt8390-genio-common: Fix type C port mode and connection
Date: Fri,  6 Nov 2026 14:06:18 +0800
Message-ID: <20261106060621.2706658-2-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
In-Reply-To: <20261106060621.2706658-1-wenst@chromium.org>
References: <20261106060621.2706658-1-wenst@chromium.org>
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

The USB controller complex ssusb1 and xhci1 operate in host mode only,
as it is immediately connected to a USB hub. The user manual has a block
diagram showing this, and a USB usage table showing port 1 as "host
only".

The block diagrams for both the Genio 700 EVK and the Genio 510 EVK
show that the type C port's USB 2.0 data lines are connected to the
USB hub's second downstream port directly, while its USB 3.x data lines
go through the USB 3.1 / DP mux to the same hub port. The type C port's
VBUS is supplied by a 5V 1A boost converter and current limiter. The
port cannot sink power; the charger input is on a separate type C
connector.

Change the controller's operating mode to "host", and drop the USB role
switch property. Fix the USB type C port data line connections to go
through the USB hub. The TI TUSB8020B's USB 3.0 hub uses PID 0x8025,
and the USB 2.0 hub uses PID 0x8027, so the SuperSpeed lines connect to
the former and the HighSpeed lines to the latter.

Change the type C port to a source-only, host-only port. Drop the sink
related properties, and limit the source PDO to 5V 1A, matching the
hardware. Also drop the dual role and data swap flags from the source
PDO, since the port supports neither.

Fixes: 1afaeca17238 ("arm64: dts: mediatek: mt8390-genio-700: Add USB, TypeC Controller, MUX")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Switched type C port to source-only, and dropped sink related
  properties (Sashiko)
- Limited source PDO to 5V 1A, matching the hardware, and dropped dual
  role and data swap flags
- Fixed swapped SuperSpeed / HighSpeed connections to the USB hubs
- Expanded commit message with details from the Genio 700 / 510 EVK
  block diagrams

Compile tested only.

The v2 changes were done with the help of an LLM coding assistant:
the source-only connector and PDO changes, the swapped hub endpoint
fix, most of the expanded commit message, and these notes. The input
was Sashiko's review, the TI USB8020B datasheet and the Genio 510 / 700
EVK block diagrams. The PIDs in the datasheet and the block diagrams
were checked by hand.

This patch depends on "dt-bindings: usb: ti,usb8041: Fold in TI
USB8020B" [1] to allow graph ports under the TI USB8020B hub nodes.

The downstream port number of the USB hub is based on the order shown
in the block diagram. I don't have a board or the schematics to confirm
this.

The hub_2_0 and hub_3_0 labels are swapped relative to the actual hubs
(usb451,8025 is the USB 3.0 hub). This is fixed in a separate patch.

[1] https://lore.kernel.org/all/20261103095425.3097720-1-wenst@chromium.org/
---
 .../dts/mediatek/mt8390-genio-common.dtsi     | 54 ++++++++++---------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 669eaec662f3..d10ee1603103 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -512,18 +512,11 @@ rt1715@4e {
 		connector {
 			compatible = "usb-c-connector";
 			label = "USB-C";
-			data-role = "dual";
-			op-sink-microwatt = <10000000>;
-			power-role = "dual";
-			try-power-role  = "sink";
+			data-role = "host";
+			power-role = "source";
 			pd-revision = /bits/ 8 <0x03 0x00 0x01 0x08>;
 
-			sink-pdos = <PDO_FIXED(5000, 2000,
-					       PDO_FIXED_DUAL_ROLE |
-					       PDO_FIXED_DATA_SWAP)>;
-			source-pdos = <PDO_FIXED(5000, 2000,
-						 PDO_FIXED_DUAL_ROLE |
-						 PDO_FIXED_DATA_SWAP)>;
+			source-pdos = <PDO_FIXED(5000, 1000, 0)>;
 
 			altmodes {
 				displayport {
@@ -539,14 +532,14 @@ ports {
 				port@0 {
 					reg = <0>;
 					typec_con_hs: endpoint {
-						remote-endpoint = <&mtu3_hs1_role_sw>;
+						remote-endpoint = <&usb_2_0_p2>;
 					};
 				};
 
 				port@1 {
 					reg = <1>;
 					typec_con_ss: endpoint {
-						remote-endpoint = <&xhci_ss_ep>;
+						remote-endpoint = <&usb_3_0_p2>;
 					};
 				};
 
@@ -1528,19 +1521,12 @@ &xhci0 {
 };
 
 &ssusb1 {
-	dr_mode = "otg";
-	usb-role-switch;
+	dr_mode = "host";
 	wakeup-source;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	pinctrl-0 = <&usb1_default_pins>;
 	pinctrl-names = "default";
 	status = "okay";
-
-	port {
-		mtu3_hs1_role_sw: endpoint {
-			remote-endpoint = <&typec_con_hs>;
-		};
-	};
 };
 
 &xhci1 {
@@ -1555,6 +1541,19 @@ hub_2_0: hub@1 {
 		peer-hub = <&hub_3_0>;
 		reset-gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
 		vdd-supply = <&usb_hub_fixed_3v3>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@2 {
+				reg = <2>;
+
+				usb_3_0_p2: endpoint {
+					remote-endpoint = <&typec_con_ss>;
+				};
+			};
+		};
 	};
 
 	hub_3_0: hub@2 {
@@ -1563,11 +1562,18 @@ hub_3_0: hub@2 {
 		peer-hub = <&hub_2_0>;
 		reset-gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
 		vdd-supply = <&usb_hub_fixed_3v3>;
-	};
 
-	port {
-		xhci_ss_ep: endpoint {
-			remote-endpoint = <&typec_con_ss>;
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@2 {
+				reg = <2>;
+
+				usb_2_0_p2: endpoint {
+					remote-endpoint = <&typec_con_hs>;
+				};
+			};
 		};
 	};
 };
-- 
2.56.0.455.g6c5a503b38-goog

