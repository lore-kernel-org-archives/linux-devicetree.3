Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060859;
	b=ashH0lB2yrBzqesn8NabdDT+syU1hA/4GWtgWKfL13aT3kjkW+XWpLIVvrNBV1zNxPO8
	 oGulXPFC3TOf8AmDHZYQskNzTVyVud5NnmaXTimKFxnguAle68fR50AISY5VWVB1iUyTy
	 WwytzQ1qW88UUR9GNypOrhwt+lLbrZxlfj6gANH5hHl/EHKjR/VZ69XAuZea7btE+lW96
	 6y0RvfOvQEFGhK8hZiFwno3bRSPs4xXlMKXpx1zWyYtM16TVVRVXWaotQW/FCEgsNBJmV
	 QjptPtdeqFvs8vrxxlJSyuDtvdWhmpbTuG3A1VPtILJuS9ptEpOR+EB496COeFdf9sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=J0t2KdflhR1USZ5uSPDHpmPQ6LbU6AJD684om9GpEew=;
	b=rJWIAk907in1MG7jrSSyBsfDv3WNHCR0TpbgfXVUeGRE7GntuAtWI+099+lHu92BS22V
	 T7eqDpo0YmPHfzUEbO27HNjnftWxlD0R3aRrcjnOkCF3UaG2FZp9HanaSphy6MfGi90ck
	 T3wAamtQ2oHInUpFmSwiM4iKkQoyJIrvnRVw1pL/gwR9INsgADpnhuSKk3waAYaSnvR8s
	 4jlRFgA2A8G2REO8dGeRmxRaxdFP+XAwGQ6YQBLyfm5rbqrARi9mHz4JRhe+tGngbkmDE
	 3tOhAfRCacnF4Wlcua4liTBvuzLuxlm+loQ/t/rC5jpjsOabFWlOs/Lk59Tk210cvgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=MAWJYyL0;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD75C606D80C
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 14:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD75C606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=MAWJYyL0
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so16934575e9.2
        for <devicetree@vger.kernel.org>; Sat, 07 Nov 2026 06:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1794060857; x=1794665657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J0t2KdflhR1USZ5uSPDHpmPQ6LbU6AJD684om9GpEew=;
        b=MAWJYyL0rpMUeh50MqLVtyVAh4JKfnKvk2lMaNL2hXmBXl2PGzhPKq8W654wuqAvDz
         /XqP4Jq0OedV/xAHm3U8YbNIc/WSxem2c3Aq1xT8LspWNvjrAz79bo/PddfOqfDf1/cc
         FUH0evqobXt/P2jy1R1Gv/lrPnFJOr/7eZRkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794060857; x=1794665657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J0t2KdflhR1USZ5uSPDHpmPQ6LbU6AJD684om9GpEew=;
        b=SBQeVIYDaM3vn+aePm1/L+EH2qa0yafwYwtNBGDE6BhzSLRMwZ9OrJjA4dcJs6lhOm
         Fyh9Q8R5awmVvbgZsWzTOSW4sDNyLkQ/YrbkZVUqPA5a0WqEW0LyuiDvNo9BtWT/tCII
         1ry7e4yCaO/D4uFzhrrNRnkr6FJUb30wd0OW3rGhecmNPVBvKAtHkZhtUgIAS9tkEvo5
         PZe1fkib8am86u3YqeRrXaRJmhjT8U/tDpOHRx+6jeWlRZmO+4AOr6iJJo/SMRLVqJl+
         Ri40gGbI8IKc5yS+JbwFB4eZh8XhA3Op4vipTMsVbgoPCVBo84MInVTOskRdWt2mBA39
         Hm4A==
X-Forwarded-Encrypted: i=1; AL+hErFansfsw52BbITNDkB0A2khogH1F1v8cFupjymy9DfK/82nTTX3JEXYmygAnz+PrlcONlydvfex5zc+@vger.kernel.org
X-Gm-Message-State: APuU4Z9iSa7CR/B6dUnNlE+GQ0WjVIHq6hMdeKUAtnFqyno0OwUGq/Rs
	Sb2lITTl618QtB6Bp8cBUcAvq/+5FiC2b2psS2dgTanR4UbnlwF78K9qIHmPiwAGGx/DB407Jev
	ga4rh
X-Gm-Gg: AYBFou0Nzc/jzmCWOfWj5snCjrK74ugcUGWoMWgItSnXkI1v6coxU/r2kPjcZVVfNaY
	48vm4NHS9VX+JNUXkZfFLtuzoIWNu9eVRcu5DAS8BRPXSrIGRvfTDS4spgShs8ehC2OqOczKjrV
	tefUPu2qMPwhKyaOE9nAx5owZ0pp/ebCtry2q2VBPYajnj29M/kPKGbKyaj0PdEC32SCKFVyGrp
	AgCH1pR/+9dsF0mcJ/ECw8eWzBreLsumxVlHqTp9UsCxvrtUQvUOledSwpDPr5oQlrvFKi43BBO
	9v3qZdnjYzVu3YE1gfeIPdso1OFzEptzpzumE2st4fDTxuwFcNFeCP7HVkQzdKtfpPI4PueZ0a5
	+KPqY97Z7npa7ZtW9LG4LeWadbO5uABOlqYeFa2Ubk6Ab1e1Od7uH8WWdczuzUJGe0dKBacA5p8
	TrUR+9jBpSFFgxisjfkTxNmYJZGWUFRH+unKHfTt1dkDmOmQn6KpcGmKuaSsoGrKHFSCQDrZgRO
	oSomrMywFQMGQTHqLRbNztW3HuHpMz2VLDrWneBr6cMIMSSBVP63r7ARxWZcF1O7xO/X0WN9aKr
	7B0EtSur+aGGwgmvBbL2FoN3xkDyhAomYsbwlXaKE4fvR7qmSICCHB36Lebt8g3EuVCLG+Qp5c6
	UKvcqO5JzAiknLeRsvwzxONIcE8IZSq9Db2wjRS2+OqcvopWtAgaPRRqArqTnfjW4P82R+oc7M6
	5k77jcWz3Ztj0WYDNeEQCUl0IEQw==
X-Received: by 2002:a05:6000:178d:b0:48e:5550:c64c with SMTP id ffacd0b85a97d-492753739f8mr11843574f8f.14.1794060856956;
        Sat, 07 Nov 2026 06:14:16 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d809df21sm9757531f8f.54.2026.11.07.06.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 06:14:15 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] arm64: dts: st: add boot phase tags for Engicam MicroGEA-STM32MP257D-RMM
Date: Sat,  7 Nov 2026 15:13:48 +0100
Message-ID: <20261107141353.2228391-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
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

Add the bootph-all tag to the nodes used by the bootloader during the
early stages of bootup.

This includes the console UART with its pins and the display controller,
used for the splash screen.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 .../dts/st/stm32mp257d-engicam-microgea-rmm.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts
index 96b7cb6b5bc1..4495b168fdaf 100644
--- a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts
@@ -163,6 +163,10 @@ sgtl5000_rx_endpoint: endpoint@1 {
 	};
 };
 
+&ltdc {
+	bootph-all;
+};
+
 &m_can1 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&m_can1_pins_a>;
@@ -269,7 +273,20 @@ &usart2 {
 	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-1 = <&usart2_idle_pins_a>;
 	pinctrl-2 = <&usart2_sleep_pins_a>;
+	bootph-all;
 	/delete-property/ dmas;
 	/delete-property/ dma-names;
 	status = "okay";
 };
+
+&usart2_pins_a {
+	bootph-all;
+
+	pins1 {
+		bootph-all;
+	};
+
+	pins2 {
+		bootph-all;
+	};
+};
---
base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
branch: stm32mp257d-rmm-bootph

-- 
2.43.0

