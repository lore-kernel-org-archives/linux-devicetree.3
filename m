Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CED38BF62
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 06:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783061520; cv=none; b=QSxEPydOzCxmR22YfXqQElW5Nct3hbuMkdKmElifKPp6BW2qPho/IESRrFIN9Z22xUAYRoZ3H+BXusYXECRx0/HimnhiqjL6rC9J/i8jPyJJYANCwzLYQYuIhN/BtgXWG3rntvC4I3h3Vl9kLs3qEIj3iH2HTPmJ7/1aP7yWang=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783061520; c=relaxed/simple;
	bh=rnWLEFiDlBBvcqgAYzjKZ4XFL5fis/NEoP1Gp9rYwhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PvP2EdifxVyBc2pEcmPmxWklgjSEKy+iT0TiX9/nO9pSMti1CkLVCOG4dExoqpzCZ2HNGlracpxE0d6PV+KdtyvJdTMeQw7mzkh/5SLKlA5htEbhXAokr6mE48l7I/GrtJ6ovW7Tbmicz8w7yUF+7P4ETNht+qLkkbiu/v03m1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=kMlBXHGu; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="kMlBXHGu"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c0c15bd6b8fso16547666b.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 23:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1783061517; x=1783666317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FfOZA6iVrDUHFVdgseSiT/wEZUNJjAsJQt2ibv2Z8NQ=;
        b=kMlBXHGu/uRDSsGtGDEWgepZwUci0BH95rXjnb2e2mQy4ffNkwwR0go1/fUwg8zILL
         QZAMz45BB2HYpU1F9q4qztWs4H8Pqo3oNb4QAcYObN75GQHtcIl5AChFAgYlvi+8kmnO
         /O4TPOWAAxeefOo1xa5mfwjbEzgE10TXha7+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783061517; x=1783666317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FfOZA6iVrDUHFVdgseSiT/wEZUNJjAsJQt2ibv2Z8NQ=;
        b=CkWut3b45Agw/NMDFrxW9xANvOltYZrEA5I3aKHqlfA8swRWUr+KCkyhysNNsT4WJA
         vsIEyj3HtkGD1TAD3vtB8Hv4u3aXJW+5Z7LUGDXxopLxQSHUDLnJun/SQltu445umSNk
         7dC7VNgfqdWDqGa8m+p4OXi+Wv/qLfD1YAtSRUuaFWv2s188EmdJzFUnzlvNpT4F07mr
         bmyWpAvAsBzLMfdqD//C8mgXL9UffJDOBER4e+z4ZpS08FsFFeUi8+EXQKP9VlDd3VnC
         aHeukf6gaMwN5J9NyPQjPzSzDycEjJ/oA2LbBhtDbCASUNy0WaHrHp5JZuCL7qSczjXP
         tFkw==
X-Forwarded-Encrypted: i=1; AHgh+RqTWki6lcFvXzB76AjKLD07/J61YnMtf2bzuJY9Z4gtnQMFX/DH93kH9XIjmBzleyLqm2+4xXFYdN2X@vger.kernel.org
X-Gm-Message-State: AOJu0YyOQfjI/lPCFNbuhwv4ge//CFZ2FAqPt1zvoYi6zG28I1wruOGr
	Ss5+LMciybk5SzVH5O+PosypfG8F2aFFVf8V+sn+ZuJwd+lULDRe+4cZVi0gBcw6zF8=
X-Gm-Gg: AfdE7ckvwl41SFw05LlBLP69rxjuNC3blY+VoP8yuzmAohaGRlXG7FG2OCd+DablZxo
	r/FCrrQyKfHM/+bu1Q+Y5wxntEXCWV6L5sJ0dy36eHUmwUErd/H59V8fpWDLuKY+waSu5i4cRky
	w0dCgxoEF9ZmGLI1J/OlloB6s0LSmfKJa5iEo/lebY4zXpoAwyFo5B+UMUODoJMT1ITRdQtmGAX
	zA1+Twxm6QVc4osr61c58quuTsHQK+A5U13uS07g1Tc8d5glS0UWU0H7fmYREyWDoxcI6HzLIV0
	Ic4CHS4m58VGKOfeM03/AlRdF9zVi5NvrXxv8JcIyFpWNKvIQWj7Oiy5x/dY/18wR4Kbhrk0lph
	pbEtaNTgpLKgiJNVvhup9XeLtPqKNRid4cf6twRdpwgLp/GSGTP/zAjl778iumajKayra0NZFzI
	0kGkiBfJmkDjDQ2z65Ea+UACin3Bc8aaOQC1kiBtfKFh5rK6rINURq/Se2dyY1nCda6ZgIO8Hf7
	9uCkeNxuZ0=
X-Received: by 2002:a17:907:84e:b0:c11:725c:49d0 with SMTP id a640c23a62f3a-c12ae7e317fmr362216266b.41.1783061517026;
        Thu, 02 Jul 2026 23:51:57 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.43.95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4695sm235462866b.44.2026.07.02.23.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 23:51:55 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	domenico.acri@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v7 10/16] arm64: dts: st: add sai1 pins for stm32mp25
Date: Fri,  3 Jul 2026 08:49:00 +0200
Message-ID: <20260703065110.1433283-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
References: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the sai1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Olivier Moysan <olivier.moysan@foss.st.com>

---

Changes in v7:
- Add Reviewed-by tag of Olivier Moysan

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 695c9d771853..002fbc724b9d 100644
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

