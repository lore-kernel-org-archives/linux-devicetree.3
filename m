Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FED43E9D1
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835767; cv=none; b=DAEgXGKdlKF8Di2/5UYMSy0JZCQaaiZ17s6NnCLSXsY7Y8AmXEiy7GFqhT74ptqJeenMWijZsMV0wYU82vZ1CtvjYEIoqjW3cMALm3Sp2r/ihF5S0sEKBEiRCK+tTgju7Kfpbt8UFmdFDmfBgwInOL07tBErvVMaNa+Bnja7wkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835767; c=relaxed/simple;
	bh=Gz1BdO2CNIH1WVRh/auvzptyTOFoc+CyHx9t/Lizdxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EyvTJuGrWT8mwVSLEPehS6WIkCKuP49fAzDxAVWNQDK5J5ACzPX1y1dI5urpGPjI2zDs2FK0Cw75RO90JgpYpSKBIb68C/rON8povYfjhOyh5gO5Vo5LZ3bCVD7G8hKATRhf0VRQmPtvhQVb8bJ2jDE3e5eaCCz+GVQ/3CyQAYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=M2v0VpvA; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M2v0VpvA"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36627a0ea23so3731755a91.0
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 02:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778835765; x=1779440565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2ZaGVux29bB4QztqEVTUE9+3m9wph3XttnIMDbQw7w=;
        b=M2v0VpvAjlya9oG55Sn6CgaBBDHW5/dZHaKggREN3ATYa9+fAnANphMS+zRZapskTf
         BeOm2v1MqsAB/2o+441GRo1sjw/VMgch7S0wG5Cd/BpGFDY1wktLy70KpArBtgdORpR7
         6X5jlTdwuJ02fwq2KqwgyRhZ3WJpS1tU3Wu+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835765; x=1779440565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T2ZaGVux29bB4QztqEVTUE9+3m9wph3XttnIMDbQw7w=;
        b=XNyYSKsZKB1aW0qcOWmRVawzscWwPCimHo84Blw4u+qXQMiTWjfbc3y0xHk5ZcPLOo
         1xT1PIvbOFzUCksf1Y6V4VHH6rX1gXHOZNpyQguU8d312DnFG8yHnlzw/A6yeE7BOpa4
         pNpy8u9GuLzCw0qhptaciIW3kwgFvClFzf1lxCKgAWAPy6McZNWIKdM+X1au9GxFfxQx
         wjAvm3H280KVyi2ukhvwWO9rP0zqLHlUcX9tpdXzyjXRHxikJ7QOggLHIDzT0GNLKr7+
         L6X9+cKVfvfew5KiIQcZW2OWA97j9/3CknGQh8leROMMf3+wkY4iDBD8yW1RokgCcv6j
         aUGQ==
X-Forwarded-Encrypted: i=1; AFNElJ8MtafZjMv9uHS4F2xdmc/V0cORKQ5vL1rjviIWYhN/DDWYc2t0M7hc7owOy8+qKbKxlHojF24h77F9@vger.kernel.org
X-Gm-Message-State: AOJu0YyWLr+r3O/xXWQCQ+Na5uQ+tPta36wbHc7J6rB/pi0zFT6vgE/3
	dRxT2kzc/1v6W5MLUq0bxFfkGO6oOCmDDg3RuPodlY5cPmzRuCG4zIOhDW6yvmPiwQ==
X-Gm-Gg: Acq92OE+bh8sKh440mP/5Kbbx2Iv+ICBIRjlnQ2V/Y68St6LSV93KNxrlrC934mtaPc
	mMHRVPvyEDdyVkAFd3SUxGWIgSWvjROv39L1dY+dXjq09ldoVZtmZLpyKSYEfQHVY4GPtQbNHgP
	Wet5I1ZCOqGZeRYd2C5XW7ITz1VbseAl/U/vL152d52p03z40tlgLn+EMzEyvPIQLpms2G9E4Yt
	CSQjurohN1N+kZv3aMoGtdHpzQQHjFUqJgslKQk6IaJHN5NUM8qw1eGzfc1SVeyLelxmZ3rjsHY
	xTHMvwR6ka1L1ppmVEzVEZJKUpVwD0WuntOEdbXrnJfMafXTQ/TcwzsMmXDtG+uPfZkyuc+982e
	GswW8ZsFkni0eqvtSPfis7Vg50FUhevGcLAymHA1ELFIO6iASO6uxmF/2XsvwAjyN4Hykpdta43
	gBn2Ne0bgeaGuNjOAbE/lPDK08ryDAdMPLEbzYu40dVPZejWDSODbZbRgged9qu5kFRIUR9ZOp6
	48K/AgoDadW4IlhSW4=
X-Received: by 2002:a17:90b:53cf:b0:366:16d1:6a25 with SMTP id 98e67ed59e1d1-369518b206cmr3162750a91.5.1778835765371;
        Fri, 15 May 2026 02:02:45 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b3d8:e32e:c2fc:c31e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2076537a91.7.2026.05.15.02.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:02:44 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH RFC 11/12] arm64: dts: mediatek: mt8195-cherry: Add USB type-A connector
Date: Fri, 15 May 2026 17:01:47 +0800
Message-ID: <20260515090149.3169406-12-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260515090149.3169406-1-wenst@chromium.org>
References: <20260515090149.3169406-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MT8195 Cherry design features a USB type-A connector for external
devices.

Add a proper representation for it with a node for the connector and
OF graph connection to the USB hub behind it.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 72 ++++++++++++++++++-
 1 file changed, 70 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index c95a54de3567..b21cbe918c1f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -153,7 +153,6 @@ usb_vbus: regulator-5v0-usb-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "usb-vbus";
 		enable-active-high;
-		regulator-always-on;
 		vin-supply = <&pp5000_s5>;
 	};
 
@@ -267,6 +266,32 @@ tboard_thermistor2: thermal-sensor-t2 {
 						125000 44>;
 	};
 
+	usb-a-connector {
+		compatible = "usb-a-connector";
+		vbus-supply = <&usb_vbus>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				usb_a_u2_ep: endpoint {
+					remote-endpoint = <&usb2_hub_p3_ep>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				usb_a_u3_ep: endpoint {
+					remote-endpoint = <&usb3_hub_p3_ep>;
+				};
+			};
+		};
+	};
+
 	wifi-bt-connector {
 		compatible = "pcie-m2-e-connector";
 		pinctrl-names = "default";
@@ -1672,9 +1697,52 @@ vdosys1_ep_ext: endpoint@1 {
 
 &xhci0 {
 	rx-fifo-depth = <3072>;
-	vbus-supply = <&usb_vbus>;
+	#address-cells = <1>;
+	#size-cells = <0>;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	status = "okay";
+
+	usb3_hub: usb-hub@1 {
+		compatible = "usb5e3,620";
+		reg = <1>;
+		reset-gpios = <&pio 84 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&pp5000_s5>;
+		peer-hub = <&usb2_hub>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@3 {
+				reg = <3>;
+
+				usb3_hub_p3_ep: endpoint {
+					remote-endpoint = <&usb_a_u3_ep>;
+				};
+			};
+		};
+	};
+
+	usb2_hub: usb-hub@2 {
+		compatible = "usb5e3,610";
+		reg = <2>;
+		reset-gpios = <&pio 84 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&pp5000_s5>;
+		peer-hub = <&usb3_hub>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@3 {
+				reg = <3>;
+
+				usb2_hub_p3_ep: endpoint {
+					remote-endpoint = <&usb_a_u2_ep>;
+				};
+			};
+		};
+	};
 };
 
 &xhci2 {
-- 
2.54.0.563.g4f69b47b94-goog

