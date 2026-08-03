Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576FF3ACA6C
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 07:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785742988; cv=none; b=B/0Y7VyM7aLrr1ZHyTvgAvJpqJmqkQPmFtMta5HvcBjPXxSKSawvVT7xCg2qfV7cL7tiJZ+g3DI0us0B98QMVqUVgsO4KvwYuiuWmatIMv9pdbeJHF+APYMrrLhe5f+UOJmQ2vt7qckIWPWZQgNUFkfGzxczIIyM0lHz5QsKGw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785742988; c=relaxed/simple;
	bh=rnWLEFiDlBBvcqgAYzjKZ4XFL5fis/NEoP1Gp9rYwhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=njN9tlg6w2r74bzm+a6sI5Qx3i3WU3zT94Vu19jbt3OOEEZABLIO8v2OScqKzIZLBO8bnEzrvQDky5iaC0n0vhVObgW+9qPsO+Pc4b/RdzawXuQ+FJmkzL5sa6ltrySF7uMO8N+mY3yWHY4/+1Rf4y8JpraFwS8/24yCbgBs578=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=euDBtZ6N; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="euDBtZ6N"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f904e80eeso2812330f8f.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 00:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1785742985; x=1786347785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FfOZA6iVrDUHFVdgseSiT/wEZUNJjAsJQt2ibv2Z8NQ=;
        b=euDBtZ6NpuAlXkewWz+L8SNtBi/pw3+E5s7WqVX8Qu8oHrK4fgJVc8qt2G7ZueYgtq
         K/304qR3o5bpS4wZdKBpadPgyyeHOfoH+04D6eH6kZIINk2M342rUusQySU1xEsdVDkg
         7Mq5xa8jCKSArgyI+V3vxQvwmeH0t7S0Ug2MU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742985; x=1786347785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FfOZA6iVrDUHFVdgseSiT/wEZUNJjAsJQt2ibv2Z8NQ=;
        b=W1+59ea5tAoXVyYNMkxkOIVDAVnwTt3HdIVcd7ryrLlw4Gkc7Zax/Nr0IVkxLao6CC
         Z7rsOINGLT5FZdE2Mb8ynHyL8lqRYnmZ+lmQFSavaEr1mlRKzANnCnZdxV9NHkMckQTm
         Ci52jd2UxKZMTVatElWXe+EuZl+u6ejnq0Ww5oS3Tjt3xVI+ecylBlIY0hugb8GX/ZEw
         7GIhFcC8hEWPZy6lRoh1FNcPr/3C62GiAoUNIDhsdZoQ3INHcz0NTQ2e8LZMzbz9EFrX
         saRoWRB0jSpA3PJySznK1rjzAqimcFUd+u7HSjDJuUVI9j2ElrEGu4PlRMi6I7tlD4YL
         ACPQ==
X-Forwarded-Encrypted: i=1; AHgh+RrPkuYoPzdupm1ztCV1Ivemb+NdSEZ05om8H+WCU5m7vqvs5/BsUhGTvNwhlAwwHMmD2Q6ru9nqXDjU@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0+dBVCNrjvmow+LgU3a1foQ4kTkduzk88TznHsIQTTAXPe3+n
	yD77EMCdesuNwvdjCgTP3LF4gcBZHXuz1IPppUrKVNnpkJMqOPFZRuBqvePsDpqrjww=
X-Gm-Gg: AR+sD13nSApA4T94qSxgpwu9T7nbjdBn1eNcooCIB46dT2vOj1UReLxn+iQvy0SEaMf
	0Tr3uoJeXoXErZlJ3LhQvOp3wj64VkKiUonjOmH7I3CAoLKuC53bfTNCQ5GnGzpRIicOdEIcnc3
	nLmje9S7ceCcO0ni0wGnv5ySAhxfSb6/68NohJ+Cg9jytCwb3pGUcCv+82Nq8bd8jrhreGBsgU6
	IsSiffjT+Z1taBYTI7oghxwMuEKEQveeSmDyOHFACmCRacGantN5LjnAsrUiW/QOYV3X0zmJhmm
	+y6YHOl2ozhMN1RM/iEG3qwQbHX/vk2QCePSPx36RCwm8keefEyCr9DIbTDqmL53aCz3PNBxmZ/
	6jrdpDlmWjH48c3haO5R3gwh+ozAelC10GkpIZORI5qwcXBQSyNzozey6J0cMnYHViZEtznPoCc
	Jjii2eYC0vSv6669mDZXUo2udAWHn5bglgExbJVdDSL8sYI9OrnbPF8CyCOoHo7SNWgndYLqZyU
	AFbSi/hjVyzbrjAT6C5zucsjGMuP4DQX46zl049EktxakLp5CyViL+v4o4NWkzywXJtEohtJKuS
	x35OM2InxfjfnH2MEFzzM6zvQ3iqp2ATuPt+B3nFoEu4Uik8VNG1IKVxRVSHS1QM
X-Received: by 2002:a05:6000:c90:b0:47f:d0fb:ea40 with SMTP id ffacd0b85a97d-47fd72db353mr18775887f8f.21.1785742985580;
        Mon, 03 Aug 2026 00:43:05 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm30370503f8f.7.2026.08.03.00.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:43:05 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	francesco.utel@engicam.com,
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
Subject: [RESEND PATCH v7 10/16] arm64: dts: st: add sai1 pins for stm32mp25
Date: Mon,  3 Aug 2026 09:26:05 +0200
Message-ID: <20260803074224.3821911-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
References: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
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

