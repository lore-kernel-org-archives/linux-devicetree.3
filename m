Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F088402420
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811613; cv=none; b=gbhpKnQ8cD1jQ3LIuo2vtSoLl3QdBBGcOkVEyrRTck1AMxdu+K00uH7Q30Zhd+fxY5LktBGGSHE8ZzTQxK2cyP7jOsP3PtVAhnbFMgz9YGYDwEqUddiJJ1Y6std5mpGQKbAtIf0GxUsCj7xB4akdD+sdHIY24sU87TwG0UGkL94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811613; c=relaxed/simple;
	bh=H2YwgLpeEoUgwkXMc0nAyFKniAzF3scYINRPengKJHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O/cEe94HXPlzh4CKqQS8C3K0YFY0fJFECSFfZQtYA7f20XLL71nd907VTPFF5wMsSk14KZThHEx0VkTCM9HBOew8LfS4NoT8hb6VWEqQcHByL3/VIzexounPI0cdFIxopulxHZcYb/X4F+1KKmPyOttqNzAAKGv5UKyeWWICoIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=WJbuM+zj; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="WJbuM+zj"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-471eeac43bfso2704524f8f.3
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 02:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1782811609; x=1783416409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mf08+e18iQyaBCmXia6is7dzqtiU26q8LvKBSudwg7A=;
        b=WJbuM+zju30pbybr5Mz2Ph8tS2VtyiaHmce4OMn0iDA0nViGstwAV5zsWDLjuZjCDH
         Az39gAvnmSHh+PwXRDNo9FmsYZp9C24hMwabKdkOwZWjooHpAKR3MM8M+h67TVljKcwu
         BBx9aCUrIXW+jJfYL/amaUsy2NBiRQFlg5Uno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811609; x=1783416409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mf08+e18iQyaBCmXia6is7dzqtiU26q8LvKBSudwg7A=;
        b=JoyQNnj2zW1SQlW3RJ9FEiZ9N5935xBvYRdETsC/1I1RWmZB7XJTDzjMhDcHsKZfhT
         +HcRE8k9K3hPWL1agRinzl7mnA2q3N1ymHDrBkUxN2oUj/S5bXAMErnMC/+90hS2OL4y
         qiHKUVTS4HUqmV2TBLHr9v2+DwkrjTZQOgnSvnzI8eHCmDAWJB7Cpq8FKlEbSViA2c9+
         Cwg4ItlSL2BFRz7xOH44z3POygO+dnNfvREg6xmNzotQkqJoV6fdbcxGxmDcrGJpb1lX
         dsqokXaiE+uuMDNYyj4RuLMhL+VjuLmXrsc22Wrtmwvivf7xpkeHONg2JOBA6IQOLdel
         aa6w==
X-Forwarded-Encrypted: i=1; AHgh+RrLvMxQCPBBb3MaaumrkPAjFmxAdwp6I0oIFlSZ/WG8ZI4d6P+39gu0FcU3ujptNaV0ewPyfArp2+R6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8PUQW9rMVqOqHhgb2y1l5UUMFkVpgLWLid9F2u5xUUXJejtjm
	oaR/3m0JbBmUpUqZLM6gXY8M7h2HZhEJPsi7+OFw+6TuSFuUjweTeZhYOUb5Q0VtckU=
X-Gm-Gg: AfdE7cnOLqGtW9JDgdkCIE5vKWbHJh6ugHyKK1GwYDXjmy+UqiNHOIqb/l3LDQEl2dY
	mehbzpO2HI8NyB0ukyoNdIBVncLLssg/KtwEHCXyHNqzzQWCGoGOsZPCY9JdOthT6rfNYj4bxHf
	c+h/xCSlb8+0YkKul+IOkV4PqEkLh8y8mEeQ34nfxKt2by4cymxb781I3q0vNDXGW1d5XoN2t7l
	1QFKm8KVTNJTmXWh/gXbL1Xo0xHCD3NIpX3J+uPoIlwurMYUR2PndF6UU1OXFyI48a3ALG1BM1m
	2Dy3Rek1WGnVCmYihHI9YeZnsJnZrmBHU7DpmZP0R/lRZ1bVZJsmMMINY84RRsp5Qo0f2t0QIn2
	Ub6fKieANOUCw1KS7xsc7/wZ1C1bKWqMeA4HhnhP6rJf32qabTue8211FEIyDGicOFgDSqVpp7Y
	5TBO2CU2yIIZq5jKC+D7upADXLmPzK4w5io6HGS/uMqxRiYVOfJfZktuBZBWmzpglRZMGT/ILUI
	jRkbdDarI51ku3ovq9TA9CVoP9lNf94kT366J/aUHMpV+GqYRp97ZJ1ddMTmVQRq9qRL0wN8UpH
	WxeY0Rd4aVhrPQ==
X-Received: by 2002:a05:6000:41d2:b0:475:a05c:c642 with SMTP id ffacd0b85a97d-475a05cc8d4mr2460726f8f.19.1782811609470;
        Tue, 30 Jun 2026 02:26:49 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47567a6f0ddsm5669083f8f.37.2026.06.30.02.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:26:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	domenico.acri@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v6 08/16] arm64: dts: st: add can1 pins for stm32mp25
Date: Tue, 30 Jun 2026 11:24:37 +0200
Message-ID: <20260630092628.1695560-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
References: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the can1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 50f454630cf2..6482dd47e977 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -331,6 +331,28 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	m_can1_pins_a: m-can1-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 9, AF7)>; /* CAN1_TX */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 11, AF7)>; /* CAN1_RX */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	m_can1_sleep_pins_a: m-can1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 9, ANALOG)>, /* CAN1_TX */
+				 <STM32_PINMUX('B', 11, ANALOG)>; /* CAN1_RX */
+		};
+	};
+
 	/omit-if-no-ref/
 	ospi_port1_clk_pins_a: ospi-port1-clk-0 {
 		pins {
-- 
2.43.0

