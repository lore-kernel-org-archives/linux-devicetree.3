Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A38D3EAC74
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217452; cv=none; b=bOC8ROpzWzuSad/2PHDXz3Chi5r2Kj27zubJLl/0+EfM3qO9Ds3YZteRArOmJQL4BM0cvLYZ0388MewyznF/y/8urEAnCNqy7Mg/2SdDi4xoH+8W0psQUhVozeatdiO1mpqxwFoMwhkYMwH61CIRP1ZhAZVRVcHt4QnT71iQzEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217452; c=relaxed/simple;
	bh=MtKzcmOSo2GEzm0+yWsoxNO3YqGtGM+Iggv6eC7Ihwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nnSzvsLsdEoqeNTdnVlIwR06EkincPB96CWRHQMrcfQCunBzVEwe4uEsMtaCYLUSYfsn8YtURV7wRqq3jX/AElwxf+U7G5HrZ5sNtEXNP5HvV82gnWMB2+pv8IBIm/w2tGJVkc7T0rf7pvDglv52xuK86vJV2BWwQ+0ZQLzDwU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=qiWtRmzc; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="qiWtRmzc"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so18419615e9.1
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787217449; x=1787822249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6h0iP47hxJiFX0M4Y3bh38tt/2SOm7+bK6VAzYbbRwY=;
        b=qiWtRmzcS83s+L9Gh4pETWhO8owdSfHR3kDy3zmkft9DOV8+15PhW7AxrwProurJ/h
         1j3mrdwei3t9JQLAzhrxtkn4qP2jVliWx7Wg/wMsnAYFaLSfAty73nABce+9GNNk+JFZ
         cJVEfGY34KbOFzBLdOEHHNkpfxMbq87HwMESg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217449; x=1787822249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6h0iP47hxJiFX0M4Y3bh38tt/2SOm7+bK6VAzYbbRwY=;
        b=Cd/yXXN1E/v565p1czZT4wywkQooo/70sse4fIxfpaQy5Xlm6Dek3yDyGLhOHSmEgO
         3tSjYr8hLCCtzN+Rx/tZm718OiaTc9e8PLYCTDpMIJdCIIiPXgGnVo8y/zahcjw22jsj
         tsLtUx3TAE6Nej9npJmA+XxEmioZ5iu+yl29U+fEBn+0WWhm6fIFJYiwmaEXmg7WsGUc
         AI2ScwiofZVcplktkLS+K8ivIv/R+7Is/ysrP7t2A3ZXqc7b9cvpenbp0GwKrlk0frl/
         OLZK04f01W+5W/NeqJVfMr0phqArwzwAIzGNAc0rNiXeC00+n1iDC8G01VlDHnS4uuu0
         pIsg==
X-Forwarded-Encrypted: i=1; AHgh+RoVMS4L0LwbA3QN1ceanJiiotWCC2gBtX+/80AqkLUiKdegdLxRC5NzHxb+TGIPwCPmpi+y8D6viWaj@vger.kernel.org
X-Gm-Message-State: AOJu0YwjFzttYoMDyfiUqrgaPiMGoPkpP46NrM+853WZy6Jxd57GyGAf
	pdLizkYQITtg0ZSeSjERJAtYJgJKYes4a2pX+YYu6txBasoJ8KXtXJ3ft7RxcYlzrkc=
X-Gm-Gg: AR+sD106dV/J56QhsrV5FrM5F1pNZkytr79LKunrgIceaAYvMilW9+1jMRDNjGVM3Vj
	YicODtrXUm+U91cfCmD5TrLmRts8rTP1i3qts0FM9Y7ChtdTQQNpqpk9/ivhVN7csBPykt9zSRJ
	fywO3Xt8L6ggrzyVcmVPt6jhkesxRaRi+2O/aS3v2+/MrX2iow3Oma9jaRRjfWCdMQJ8yHMimlF
	3MHN3VbVXa9zxaYsez5+B3Cy74s9O23pjck3KChBK3Ky0zrEC0GxpGwMPJoUFcbdZaIu4qAcPNI
	PkfGesq50b0Vw7lN/JvXyifN4lK/AYBomAb6wV1qlLQq8YB+xti7LloaudPIhnkhthTdBnmz4O/
	TF+B5qjiSRLSU0zIW9a9pVsZ32ysOWqVEFE5WQEeWTHsJI/5WITI7+IWwIEcYwUAzf5x3II5hU9
	F8WcioieR81tdMYUQ0ZuBQPSYfTw35/rHCaJ0oDBP4oFjeGG/eBApHkSnexCRVYQ58hD7UBTaln
	eLVWKZaawQ3PK8Wm4NlbPInkxpXzV95CLto/QZMl9xyRYhkKK5HAKPs4XkG6+uHZ1k9jZUNVukK
	/oEyXWdAIX2vk40ah3TH/iGTnDzR8JIFCyC/z1VUH2hU2gKeSrhkN6m1P7Gzhg==
X-Received: by 2002:a05:600c:34d1:b0:499:49f3:77b1 with SMTP id 5b1f17b1804b1-499aa14a6a6mr194346575e9.3.1787217448818;
        Thu, 20 Aug 2026 02:17:28 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-86-139.retail.telecomitalia.it. [79.54.86.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm10021606f8f.26.2026.08.20.02.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:17:28 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: alexandre.torgue@foss.st.com,
	francesco.utel@engicam.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v8 09/16] arm64: dts: st: add pwm2/pwm4 pins for stm32mp25
Date: Thu, 20 Aug 2026 11:12:17 +0200
Message-ID: <20260820091652.43541-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
References: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the pwm2 and pwm4 pins used on MicroGEA-STM32MP257D-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 6482dd47e977..695c9d771853 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -433,6 +433,23 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	pwm2_pins_a: pwm2-0 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 7, AF7)>; /* TIM2_CH1 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm2_sleep_pins_a: pwm2-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 7, ANALOG)>; /* TIM2_CH1 */
+		};
+	};
+
 	/omit-if-no-ref/
 	pwm3_pins_a: pwm3-0 {
 		pins {
@@ -450,6 +467,23 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	pwm4_pins_a: pwm4-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 12, AF7)>; /* TIM4_CH1 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm4_sleep_pins_a: pwm4-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 12, ANALOG)>; /* TIM4_CH1 */
+		};
+	};
+
 	/omit-if-no-ref/
 	pwm8_pins_a: pwm8-0 {
 		pins {
-- 
2.43.0

