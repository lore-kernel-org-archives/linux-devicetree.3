Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945199;
	b=TGc/OzzSOPnuH0bSCGm8sbz0dBnnStD/3WvOsv4X8i64poJtHj7xtr47kcymQOSd2DWi
	 OBET5DKIhLgQDuK9rWUobDtlaQLLexGjOQSzH5VCn+9YLWIj+svHCBLc3ZCdtx1H0jM3a
	 QU0Ikhyaqo9HfnXMdqQaY9ESDgSJNJCs3n5v7/77ZNBaAV7dQIcavCf4aAOyDzsuBik26
	 /A4MkafsH2CeRILB/8wNwFyP4n7CgF0DETaGI5aIDTAsb9El2wX/VgfZ2KMWz/mQK/px1
	 kTJYraAAwbQWe4oOuh1oSUnpi2Jk6155E8/aCF9w53wx/zX6OpUk6cJ4+Z837h70KUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pi8xQTHmN8oIR3u41XpUTeacQqSw+crTxhinHNCStKw=;
	b=w8Bw3igHzS9yk4254lQLuuqrHr/uAVQ7JISguvXcTkaiDZ3bokMAL8imkcA3f5lxasOg
	 SBMPmrX/c/FW8m7SMc/w1A0Np0bJP10agKKAbm4n4wdaDx1UnRkctyscaFXUuM9S9c3Tt
	 rO4eM4A/G/wQwp6hPe6xl/th+HzIfAyeDqpQwV1XJSwdcy+FznjU9+Unm0X4ywtpfS+tk
	 wPYqgFqR1oXp3rs6bNN7RwX6wPkhcKxJj6Frl0xvCZeDwpEuQLmWxv+RYag14r1Tyvggj
	 rpjyXRh8HoebrnEbXu5IunfMz8v1ao75GdZr6BlXHPaZtfwmOBDFbB0ss+/LAc3Hgug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VX3ZTlIi;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5225B606A328
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 06:06:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5225B606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VX3ZTlIi
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so97605eec.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 22:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793945198; x=1794549998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pi8xQTHmN8oIR3u41XpUTeacQqSw+crTxhinHNCStKw=;
        b=VX3ZTlIioNgt/mZ+/4GsXHAGBnZipBJkSnww4ORBKN13EorWo537X8ERCGsVkzToIr
         z7WjG+l74ATpZTGzXG0vN1TRZf3+cSdhb+8VoathmbR4Bhltn3sRfB6VdqNjOuXTyNBd
         xqpYlta3oM8kWL/O5XCf2zW1jglrV6lNiysgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945198; x=1794549998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pi8xQTHmN8oIR3u41XpUTeacQqSw+crTxhinHNCStKw=;
        b=BejFILoErzSCkfw7awykbBfC+YmaW67Z22vF7PtnlztxwUHNQ6eFCJZjpPP1+uKQgY
         9UGeAFq9t88Mqyq2roaUzyMg17MqYVbhU1sGWbTIkstv9/jXBHdKQZGxt5LcB5fcVyLT
         2SqHEzTSHHqa1+SGArfi8q3bvYZXnO4hoyl8ra4gAqLSt2ojFmwgxq2rYgTRoo81Yv7D
         8g+UJCicubE6DHjl7vKjRKr7UW0FEe0XUKrJAtVUXJZOuCjiRwJ6nWx1gl49T5AlnR7u
         Ch8E219U/43MSG1UJ079I6yoA0gpB0D5mVAx9O2VF75atq3n1/SGODSZ2EcFLIspwN5N
         sQVA==
X-Forwarded-Encrypted: i=1; AL+hErGX9l1AAOjfGhFjl5NSsb2EhzDch8dRZ2VK6UMY4y5vIgjpjkiqgXCIg3jLeHLyhHTJ0CmU34mjqQ4i@vger.kernel.org
X-Gm-Message-State: APuU4Z+F2+7wX6F2X35+I9fOmHSdNqB9u0PNPEfxLI9LTES/RlBBH9Y7
	lHjiotibs6smv/7qHEF/wduzmsu3tn+W83GB+kzfcZcXgCcwLgBIC6ibRqNpwI4WTg==
X-Gm-Gg: AYBFou3K74C3zhuBCp15TLHxcjkKqLpPvrL60xdpoCHJgtMd9H/ssMO0dN90DpincXE
	7ill5ZYchmdR8Rcl1607NnuiL5+ojt1HWdV/5i4oiB5SSFAFhoN/GGThAtxOSGHo/86n9d5l1D6
	hixsxFR4fOq0oD+dCcRkxj3nmt86WonWqH8dbgKB/cJezUCWpGSElAgQhdMfW4blln2NdEBzRuR
	3/VhNBgiKetQiGXqdKvURkuKb2nZM+lCexK9tGynX9lQ/oPqQ2CtcSXjU2khWAzJ/zQ0B17LN6U
	WdL3t7ZJXAucY9MaCqI4hN5SvGZtPM+lxqciS+Z2MiVdGfn0Tvsc8TBVIRuwdptZ6ftKlHUuXDI
	zmaK100VlwrB0xH6OUXvunr05ozWk1qGIcoD3HVjL35YRKe+Msklb2q/ZbxZvDbsr1GKe8/yTBP
	5uO9gU5AsugeHCjuXIYINzc/KbNx/+Z5GbnJS81FDnuGakD2aVYCdFr6bMWlGBtstqv105CWS52
	jSajuHB1S4Pe1G6RZyv2bdV6ehkCyXXML9pTaG1PfAUDkDLL1lagYDzvrTNqsxC4EqAGKFf1/n2
	nO6DjX/9Xvr6T9TdGsY7OSQEqAi7Hm8FdIk9oaPqNiqe4P9SMpfpoBMy/xQ2FXdXokLbzb81Ax6
	iwnISivBxgIST
X-Received: by 2002:a05:7301:4249:b0:36a:22c8:ac57 with SMTP id 5a478bee46e88-36f776f1f8emr2009226eec.33.1793945198326;
        Thu, 05 Nov 2026 22:06:38 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:f73e:d73b:c0da:5b05])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm3821809eec.6.2026.11.05.22.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:06:37 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: mediatek: mt8390-genio-common: Fix swapped USB hub labels
Date: Fri,  6 Nov 2026 14:06:20 +0800
Message-ID: <20261106060621.2706658-4-wenst@chromium.org>
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

The TI TUSB8020B USB 3.0 hub on the Genio 510 / 700 EVKs presents
itself as two USB hubs, a USB 3.0 hub with the default PID 0x8025 and
a USB 2.0 hub with PID 0x8027 (the USB 3.0 PID XOR 0x2), as described
in the datasheet.

The hub nodes have the correct compatible strings, and are attached to
the correct XHCI ports (port 1 being SuperSpeed and port 2 being
HighSpeed), but the labels are swapped: the USB 3.0 hub (usb451,8025)
is labeled "hub_2_0", and the USB 2.0 hub (usb451,8027) is labeled
"hub_3_0".

Swap the labels so they match the hubs they are attached to. This
change has no functional impact.

Fixes: 20d959fa6fd0 ("arm64: dts: mediatek: mt8390-genio-700-evk: add keys and USB HUB")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- New patch

Compile tested only.

This patch, including the commit message, was written by an LLM coding
assistant at my request, based on the PID scheme described in the TI
USB8020B datasheet. The PIDs in the datasheet were checked by hand.
---
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 63b4af476959..e5c7608dca6b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -1539,10 +1539,10 @@ &xhci1 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	hub_2_0: hub@1 {
+	hub_3_0: hub@1 {
 		compatible = "usb451,8025";
 		reg = <1>;
-		peer-hub = <&hub_3_0>;
+		peer-hub = <&hub_2_0>;
 		reset-gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
 		vdd-supply = <&usb_hub_fixed_3v3>;
 
@@ -1560,10 +1560,10 @@ usb_3_0_p2: endpoint {
 		};
 	};
 
-	hub_3_0: hub@2 {
+	hub_2_0: hub@2 {
 		compatible = "usb451,8027";
 		reg = <2>;
-		peer-hub = <&hub_2_0>;
+		peer-hub = <&hub_3_0>;
 		reset-gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
 		vdd-supply = <&usb_hub_fixed_3v3>;
 
-- 
2.56.0.455.g6c5a503b38-goog

