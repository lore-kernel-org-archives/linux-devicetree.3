Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C203B439015
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066051; cv=none; b=N/g4GRx0I5e5a7jhkybKbPN1l+IB9oEB9pwO39pFvaxjx8/caCKY5Obdv2/stq1tNsceSfw+371ccvUwoVmZNbMnxbIOCZhcYXSh7hO0mx5oFA6cCfN/kHvD/jXWjOtiynyzvGfJqKu2vFhuGAMbGDxAUJ473xleRK/2HFJt4Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066051; c=relaxed/simple;
	bh=6zuYDkkbdS7/04DL+lA+SktZDCLWIJ6OBZecU/rAVa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=spC2SPkOZ1Cbi578yL1gUTvenGrVXijU87Fp0rau2FAxeS3tXYUKQVztUynV/p/jhh5rSJ6LDNJtLam2i71FChdrs16LDaNXPzi4aRU2KRfC5g8aCJCXlVTfoeUgEb9RQxCb0imn9OHulVQTLVpxvGPwIwBwFhSxxCraVfyKU/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=YK3ouKUw; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="YK3ouKUw"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49048e043e5so61932225e9.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780066048; x=1780670848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQ9iUdpaW/UgRLg2/BpFwjAvwsUvVTg65Q7BjB387tg=;
        b=YK3ouKUwhiogQbg+JEfSLda+T1IeoAcz0rfsKNklW09m4eRp79v70cMnY+dMb8QL0d
         Iq4zD9TXOIAU29m9YvvfjU+MD5xZoQw6cBAG+S/UIhiBPE9HzjuZ/NRfR+carxNj0Mt2
         eGOHy1gCZWDNyMELCwR1ZUlWuWOpIppBjInpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066048; x=1780670848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RQ9iUdpaW/UgRLg2/BpFwjAvwsUvVTg65Q7BjB387tg=;
        b=eKIWgPk9fUBrz96bIZuXaMLkZiV2dO6tAljoE6V20yEUtg/iGfoX/E7ZojLbazzfBO
         V9cyTbL/SRsC4jI/2Ig6x8QUd0PKDZDn7kSkz8LPNSRjks10PHEtKmZood+jX44+gOXy
         KoUeBH9XbKMUKZ8S2P1LJ32j6kaJ75zFxZHHvGY4zz5jcqrDx9XpkR1BnL+IJRQ0hORy
         /WnjBZO06EX/vn6OwMJg6yhPzj8bLWnv4xUnozjFpi82VZynd/0aPt1LTkG27NYXqix8
         bRzbKu/Ihv4d3sRw6EXQG91WEq9K+F5jFizyzKkf9t0w0nxpOt6iCnn7gtT4F1m/HgAB
         TIsg==
X-Forwarded-Encrypted: i=1; AFNElJ9IONPokrbpjTpidrDH5EP5HHlbKh9f8grniqnlZqkMBLJkGBho1OCkk5FTOtjUy9ROkzyYOp9JymqT@vger.kernel.org
X-Gm-Message-State: AOJu0YykQdK/6dmjzpDg5lGuQ5xCxuHAI/ljzLoPCQCPeY8cN2mGXh6H
	o/++jdEF8eYsPO1mcm86+mVnffoUW+411FtfVUn6d1mIClmi07E8e8nXw4wGJ51BGZo=
X-Gm-Gg: Acq92OHQi93wbTLMu02ix0WuPGGq2SGZteT/5p60eJoAc8DvZ2FBmFhxDE7KMvlWyl1
	vjrQPwJGUecUE7EyYttpGpkJFNGqyz2GeDZybpz+jtGWnl2n8iJ+SwKh1hOQPl8tRjlS+nkW+j/
	WdkUElNy7WVPQEMxNPOAa8LLZhzR3ZZakir1EpsmtkRZez/jJRaa7LKsQ8VSpdwdPdJlxb0lIKV
	9DBtRA/PrE33+Qw5uaf+2yUMIhFmqWUqGkVgstad36uwRgnlVOsvxvvf39aK1p7yg9lyui+b0zW
	5X0orm40Yj4UhwpZ08PofZwV2rWzefSFZOXnhnouKDgpQPw9CINEv6Z9ZgdryjzBu6cxf5kxUoF
	i9Jfm3t/q/yt3AhZjU11mB71fyjdUSaM8QJ+mIReKk9ep3LRK6o0XMroOZtBfU1jm2pLl4YpbWM
	brJSxPcmvSniiut9FtQ47AC0TzqNJEG4sdxTnf5guNu4GL+I2RxNUzRLvh91k4hjAz0FIKh19Dk
	IMyJTAtPOWdZiHmd49v60yab3t23Q+BkVSOGrCnjIzaEn5Yxb5xScRefm0=
X-Received: by 2002:a05:600c:8582:b0:490:51e9:deba with SMTP id 5b1f17b1804b1-4909c0bb2e7mr48377025e9.27.1780066048216;
        Fri, 29 May 2026 07:47:28 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6eb470sm38694785e9.10.2026.05.29.07.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:47:27 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2 07/15] arm64: dts: st: add pwm2/pwm4 pins for stm32mp25
Date: Fri, 29 May 2026 16:46:21 +0200
Message-ID: <20260529144707.3931919-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
References: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the pwm2 and pwm4 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 4be01a6574c7..eab8ebe71660 100644
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

