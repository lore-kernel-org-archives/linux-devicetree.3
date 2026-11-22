Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795341155;
	b=Y/nPepC+MTx7FFp04mJuHA4LCFyV8V4n0VWEr3WcXU2JKo+msOXBw8e+E2JXy23WxRsT
	 80fb3/NC8QYuQOh9JRWr3dn0pSEVH0VjUjsD9Rjps0Y61fP4Zhqu1rZU0PU5UpcIFIyon
	 0KjbIGwmihRGwT/2Q9sUjQsDP9ferVjCUnf8da2sC8uPA2TfPLS7Og8yjU82+EgwdqmJH
	 1l8xLgVOHaaASDu+FGY/GVjFUSXQowZVfYt5O3o9jLDHiQ3AGuU289b9JqCO5lWk5Q9ka
	 sE3SCecOXaIGtgwnPhYRNIUIjAVSWTt4mh3N8ky0yBek8iycsItCehNkHJueNrniB/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795341155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yUikuj1FyLUCHY3Zwx8GuKGSSsj8GL2KV6hgZCKg5AY=;
	b=XNnZJnGUI+nR4Lr5D3v/owisA9Z+CJFiLJzLN71nSPzcIAtFEQvhHg/6+yc7FoXi/gH+
	 Ja2mEJHAh02jN+ExR7NWKXJZqSeXALitb3pmIPpuphet/x3WpuD8UwLTcEHssVl9a/hvo
	 BEIuQ2xfd6K4pABJ468LlNFQEM9FfecR1LMb5xuknzBpBf26NbbO4S9YSI8pEDgabB0d2
	 h/plEqujl+bj5DrITJCmrIjIl6SZk8MqWVGnOOh9rGYIXEIeCQoOkAkeyL6OVue2gqI8p
	 yc+5jhl06brWOYWNRlYiXnuiBwcZic2wmzF9I19pkRoRZLdfW6XeTNOqM2rIG5Ulfbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E8NwQ8Fi;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD54B606A335
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 09:52:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD54B606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E8NwQ8Fi
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so1142627a91.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 01:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795341154; x=1795945954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yUikuj1FyLUCHY3Zwx8GuKGSSsj8GL2KV6hgZCKg5AY=;
        b=E8NwQ8Fi5brarFkGitZhc8iH7r45vLLYIwTM9DyYINAIo6knoOmb5W7E7hCtKZgnye
         ZgFZ7wDHB+ka0F8XU+UwJgv/cMN0P9/JUEZf8c7waa88M4FSVVWgBC7HHC1pPv6bOu4F
         BstKVbsOhOxl17ZQzEGWyskOhPzitNksUrqsV2hFdrfSPdfmPcDl+wVwZ19fLzzWh04t
         WZ2Q3kD0+LsolWTwsxENjlw/So8C9loCw6PyQKkUsKl7o6/fDgT46TZgDwiMvIldzYcQ
         THSfMqaxKytmAQ7tHtbiKMo9FQc2TjSWuTktBY3CbI4SGWRq8xkCli7hSi91vZQ1RGIY
         HDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795341154; x=1795945954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yUikuj1FyLUCHY3Zwx8GuKGSSsj8GL2KV6hgZCKg5AY=;
        b=vh7XqW3STTw/JgxqRI9NJw2KSqONjgSAB1ac488pznPMuR9lBKjCbhF0got3rOHpqN
         iKgkmDO7C9dVn/H9DhGx2Qwhh1iHRSgHMH9hdTJOnCoHqpT5JOUIwK0ZWsyOWhrzjGMy
         /K694iW9PDo2Pgj+7NuyWrgcARueqmFryEqcWhbqMhP9fe7XXi8yQ+NNjXl3iV6bJwfG
         JDsU3+9I4AZCFwscj6qfqejGewsF6h0PbYECAiMetK5MW8Psq7N344grupxiT7HAo5XV
         00gqHVe7Q1oJeqcJF16taQclwoK1BtPK7PfZrvua+LxxPiLLqx7qzV9ruoORbTbrVBN0
         ykRA==
X-Forwarded-Encrypted: i=1; AL+hErEAYZs0ZrzlO2hw0Eq67q8u79bYyrlakI3BlPLFuoPyvKajTh0JEWB5TKkrj86ruT7qokEVvRtp2DaQ@vger.kernel.org
X-Gm-Message-State: APuU4Z8dfXWIBB94r4hDGTau5vDhjzsDWZuyl+5+PNoYk+Pjjn62FeiZ
	zM29HqrxVtOXhaxUuV7OlaMGiWF8AOuwA8S1/hKPmqtYP5cMUuvP912l
X-Gm-Gg: AZFdTZcOUEkCTDWpS8TR1bFaAC9RWsrTqNrubaF1V6oTR8Qo1XwPmgSoZQyOZClOGhE
	3nMTlprmUXekPWMNKISwNtZRdJNPhQEUsgdljp9or7Z1mNGRAQsZWx7c4cbCcMJ3uek/7r5tuIo
	hNCvpAeooOlPbnW0VI6gm1a4EaiYjwdgnXG302rGOPtbZA3RvP7H5LKnrofsU+bhAWGm9fQocvy
	FIIqi0gYHxkU93rsrGaSV6XRKwCraFiUCS2vYL/PXcI5m9MUqFZpADpN8tDkTuIxImPvqsMh7Vi
	XczBRSGJxXH2ucf33BApNg+C/EtB3driEgXgOriR1Ue0wCGWltYmVWr0HcVEJ01SasIP6eVG8PE
	Dfj0Vmh+vhbhSXESFT8fe9XRZ97robhTE2rzGs2KG73j90wFHCEFwK5eQqrPbOlgaDj1XEMjF21
	911x8bfDKBGOT+jh/IPGnhx2jppsFNDeL8lptven+I0ka5HkH5UIUOfn61yoOnUem58qzVLpyFT
	574MlbgjafzxfMuDLGjOjMjHMaJXXa1DEBG30lOuLd32OaVisFhTiKE8+SPjYsrKewHo97loN2I
	q2TFiaJwPHszIS/O0A9/bl/+JK0vwv8/kuY0yfvdc+6BxoLXEGM=
X-Received: by 2002:a17:90b:3e48:b0:3ac:adce:60ad with SMTP id 98e67ed59e1d1-3b41c98a343mr6261954a91.22.1795341153927;
        Sun, 22 Nov 2026 01:52:33 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([134.82.71.171])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d028a54sm3289722a12.18.2026.11.22.01.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:52:33 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	robh@kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH 1/2] ARM: dts: bcm2835: replace deprecated LED fragment on Raspberry Pi Zero
Date: Sun, 22 Nov 2026 03:52:24 -0600
Message-ID: <20261122095225.200916-2-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122095225.200916-1-artem122novak@gmail.com>
References: <20261122095225.200916-1-artem122novak@gmail.com>
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

Replace the deprecated LED fragment with a board-local gpio-leds
node, preserving the ACT LED GPIO assignment and configuration.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts b/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts
index 539c19c10946..9364695055b4 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts
@@ -7,7 +7,6 @@
 #include "bcm2835.dtsi"
 #include "bcm2835-rpi.dtsi"
 #include "bcm2835-rpi-common.dtsi"
-#include "bcm283x-rpi-led-deprecated.dtsi"
 #include "bcm283x-rpi-usb-otg.dtsi"
 
 / {
@@ -101,8 +100,17 @@ &hdmi {
 	status = "okay";
 };
 
-&led_act {
-	gpios = <&gpio 47 GPIO_ACTIVE_HIGH>;
+/ {
+	leds {
+		compatible = "gpio-leds";
+
+		led-act {
+			label = "ACT";
+			gpios = <&gpio 47 GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
+			linux,default-trigger = "heartbeat";
+		};
+	};
 };
 
 &sdhost {
-- 
2.56.1

