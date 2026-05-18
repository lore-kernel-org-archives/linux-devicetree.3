Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D6D3FBB46
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114742; cv=none; b=XDVZLO+pWkjdxV0IRUm86nmKWnv5FIDqXZZz57Aeb6/a8RygarDH2JY4Vv8Yph9FceL7KwMUXnvLszU/uun+jpPbACid0pQjIckGk0vjxdZEdsDrQOxX8sZUx7Z9nUm84bOP9wMRl9HcdD0iG1sAlSpHSEA8pmJ/iHfzjoMap7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114742; c=relaxed/simple;
	bh=0DsXZbMBuY/wI29KyP08kjB6y74UYiinNf2f7mMr7pM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mPV+xucl8Ov9nw2KmcPdBhKgz9lwOA6gVHsR1CjTadU2FekJOTtG85o+xeImbpiXpR+dHIsWvgO+1mGHqN3evBLdJpez5snbIlA8Tp6ozVZ5n4q/zjpgvKhWH9oJXA7JpR43ucVOfFG76TdOZnr1wueOckmp5+t7wsaU58aX47k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=VSMuhxrC; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="VSMuhxrC"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44ccbd3290aso2163552f8f.2
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1779114734; x=1779719534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yoBfkEc3j9+rJ1je+ryUB6XrPniOs4Aeeb5/gWWWZ7A=;
        b=VSMuhxrCgKeZDqaBKfdjQHN528p8uycnOOyjtLUyTyVjx1D+HjN90kHpqGh1mgZry4
         ggV++fj6ufs8y8BY7qyUyW8M0UoBUPpvT3JJ+x2gXuFntgCx7xL2dVniLxnaamxejF52
         GE8qhwRLbIkoBokGeEpoQ5dwjs609yiuttsZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114734; x=1779719534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yoBfkEc3j9+rJ1je+ryUB6XrPniOs4Aeeb5/gWWWZ7A=;
        b=pTlMmxTIL4JdaN4jdc20ujWk5w9hNNhClWcGdVlbHZdQV0K6hps8BRrljLKPqIQB3o
         8vPV5VH7gstGz2LVvn4sYWlQpijLJv214V6RDHi250WNgSgJaWmN9Kj4sc005qsNbiAI
         Kj3FWUFubVEVi6XsS9z9y5my0jCjPAjwb/f2CrmInooNzwBz9RVGwdADWo5aDvck/nml
         2//41dvIK1WWHWqneZ2C/gdwKKyiZc9iIe6KelIUl7vC44nJj7Dx612m19SK20m1HaS2
         SOFjFE9RJq+1t9xlAaFRRwBrIhUmapm/I/j90i6LWHJpsFR+IxFdZpPCJf4TmXBnYQcx
         TLEQ==
X-Forwarded-Encrypted: i=1; AFNElJ8iYgu9IYL9VR8L4vz2nXzBIvqiSsV8grqbqtLTZvHRZzWrnJnExy0O9IFU5/u0aPqTbWgjuYUGMPq3@vger.kernel.org
X-Gm-Message-State: AOJu0YwUFi5mbZ9DnwP5syPs6UBDBc0ShH01tZFyVz8eINvK+x7lOHQo
	r1G5fc3cogh+79F3mdfg2xDOVpYWWOYZyvn2wfvXWrcRg3um5d1+GtMwtlMYxhbWT4c=
X-Gm-Gg: Acq92OHil5VnNSn2F4tR4AKkxy7EGiTc9Rs22NTgnfkotQ3/QH5B7JIwE+oUyyYO35Z
	mXUXTExwAMKjD3wnZY2hxL79hm0e7nMIgc1pp/Kgkf3HZIedQfclOsGuBHW8K3m7PhhzO4G+wf3
	tWHAPl/j7RUxlIUCAwmw8w+SBVCy6Kr+EdzzAOgNZJ9KYdwwZUe0vS4mxxWZ8xECc9Z4NVVvF0Z
	dJyES1rJkdBSHTSGw8kyMaRmTrLqSqVaD9uibPPeOJ218tokyPyZhf3j0DAxhKcwBm3XVfOSOgv
	pPl35cG7JE25pSIb5LCFP1pp4llzsfAcQ2faaxi3jxqPSXYnIxNq+55KxOF6vEbjEh1SluWEMqO
	90mSdHTIEKR3EGCJeIwxDKPHTkIqpC8d9Ogka5t2DaJZtllY1TwlEnjtJNQinQH/NXx1Lewkdbf
	fg6WBdTKVeuzDm5CtFQNHL3z0JEPfbyAFWYyushm1Cr6OTLnoIfzftVDBdNSACRRTgBGPkcQs3D
	qOUtaHdZwe8+dMj18irCb3hTML/oJJSrO0/A2vq7g2TUbBR
X-Received: by 2002:a05:6000:18a4:b0:441:1df5:480c with SMTP id ffacd0b85a97d-45e5c5a8f0amr24773510f8f.42.1779114734167;
        Mon, 18 May 2026 07:32:14 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm39564572f8f.23.2026.05.18.07.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:32:13 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 08/15] arm64: dts: st: add sai1 pins for stm32mp25
Date: Mon, 18 May 2026 16:31:23 +0200
Message-ID: <20260518143150.3138712-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
References: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the sai1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index eab8ebe71660..ab1e62cf2bfc 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -520,6 +520,51 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	sai1a_pins_a: sai1a-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('D', 9, AF3)>, /* SAI1_SD_A */
+				 <STM32_PINMUX('D', 8, AF3)>, /* SAI1_FS_A */
+				 <STM32_PINMUX('D', 10, AF3)>; /* SAI1_SCK_A */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('D', 11, AF3)>; /* SAI1_MCLK_A */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <2>;
+		};
+	};
+
+	/omit-if-no-ref/
+	sai1a_sleep_pins_a: sai1a-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 9, ANALOG)>, /* SAI1_SD_A */
+				 <STM32_PINMUX('D', 8, ANALOG)>, /* SAI1_FS_A */
+				 <STM32_PINMUX('D', 10, ANALOG)>, /* SAI1_SCK_A */
+				 <STM32_PINMUX('D', 11, ANALOG)>; /* SAI1_MCLK_A */
+		};
+	};
+
+	/omit-if-no-ref/
+	sai1b_pins_a: sai1b-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 4, AF4)>; /* SAI1_SD_B */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	sai1b_sleep_pins_a: sai1b-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 4, ANALOG)>; /* SAI1_SD_B */
+		};
+	};
+
 	/omit-if-no-ref/
 	sdmmc1_b4_pins_a: sdmmc1-b4-0 {
 		pins1 {
-- 
2.43.0

