Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498BE3EC68E
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217448; cv=none; b=sslryY8HLhRcuj5mTQsLdOxYuYJVo5LSxsPZ3Rxs5PYCCiq18T8bpvS+RotEnjWZXzksrmIFc1jUKT6GshsF+0uhv4a9SCXGWi4xP8h6+cjCtAP+sT2VvV1yaRByDC7XMGoBm/oaQgyAqyVAZdyegXmiXxTvLdIzWiWtVmFyiDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217448; c=relaxed/simple;
	bh=XbjHIRfhFSS9VseMDZcUEEsJXoukILxTF65Ch2WinpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lSN5EeOVRP+0NKtMwetWwDV86EQvYDacYmu2ZfDAvTbVeWRoUg1HF4W/8cu9s+g7bHtOMAOhfKbG4jxOYEeqWiUlwaXOYB5i8RJkYOjY4kqGJ9zAmHvoV8TZaS6rioh5dyL+wY34w4d7PUzmAbw2r0CwRoE9+P+uHJgjaUMRG3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=doaTgMGO; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="doaTgMGO"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so4911355e9.1
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787217445; x=1787822245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a/2GgcNYkOiYojFQ72oTmVxvuHHu3lXCYixOz90bVko=;
        b=doaTgMGOoqoPoEVBf9vmOhH3eE6ZUDXj5pggX22BwZPi8IhQpB7cZUhMqxJJzu9hGW
         SSo+DLltm4kvVIL5fbwpSKd02Tzov6Yk0ukoIce/AncbVmsbfsvFVv3O4ZuCf++bABms
         YGpqFbvSJsay3IDLDxLJ+RluSIT6qZvHpgFxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217445; x=1787822245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a/2GgcNYkOiYojFQ72oTmVxvuHHu3lXCYixOz90bVko=;
        b=gLuo9ei0/NHxR3QqLkeQAmfojVm/urYBsocwST/dM4vblVqeTL0N6kaEQkoiooIazW
         QOuF+wySlOXovk8OndzLcXk9pCQr1cVKlt2mF6Onmqi3T6N8zfHp2dHAcVm/STXyf+tA
         nRwvqaq+GAQjHhH/OIp45Tp6uVbMxsY64vXXtyFFFYgdcADw1ZEIoCSFWPdPLvgfwF/I
         v8txbPaMTcy1506M7FSFgJzDtInC91FyjXU0A2UuhM+qyONsC789fX0/73E8KdHmPMFf
         rbFIWnGXg1iR3wn2hxz84D+MPu2krNDOHFzy1OmqowJ58GHjNdzalEc/OyOVesDOY49U
         lGPw==
X-Forwarded-Encrypted: i=1; AHgh+RrRAtOqfAjJeX+S1azGIabyMm1H68ULW7nEGmYZYdOPKy8ncnYD+XqRt9YOjGPB0glR56Hr9t9CTwSH@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcq0YiSMPZUijw1Dw3lB5hMzE2OxS/bLT8kzPvx6GUo7WWsI4C
	RB/S11Qpl3T5Ol12qp+vLxf1vH4nmgNvsWzpgQGNdELTxzBy8wQHaKjNNzYackRdf8M=
X-Gm-Gg: AR+sD12ATfZQjkOQ0pHccPck7iVrfK0KRxK9RLQW1+1EFampD7fUTNlm5eRqXB3zVN0
	Mii3Vj+pMG6eP06WltfpU9F4Fuxwegn7XhOwvZVg7WmzL1t3kpfljS6gENPsnP6/mrI/v8Upnee
	P/o/xqCb3niGP8/DZsJsVGws6nWBt0sTMmSLtiR65pv8hLG+dZOR3qRg9hHu7EAKSRygX40M+lc
	0CXiRMY6bazgHZ0YusluuUG+wafjLB7ark4B3V0ckHoIf/JWCIFxROexJtr9ZrRi/gMw23zWaKZ
	MHjQjp3IeNEqEj30ZJgfhNcqbOU01n8EVCQI2LVOL2MwobkeGZNVpXMteTYPygZjoCwiXYZGRfZ
	lnVe0yG7TzWMr6rdMsTJgj4P0hmH+kngK/HZ9EQDwYQJK2bA+AOa+0ZS+pVProL5JAsB8vmkF58
	jC/DY9wQpl/g8cYT89LcHFvW2zQI737tpNm0f4DJgE+qy/fatqNG3+35DYVC6BBjBAcSFj8z0wA
	cvWajWw4ld/gFa/lCjyopAwjFY6KIiTnl+LWjbQ/wjHSYIBfj9S3xk2qCyf4AW2uSrdyeWAuPbp
	E+UAnWs4NPhOHUPFOZ3ibruyByepjd/Qr1ueSXcpnkLWfw0f9anBhI9goRhNeg==
X-Received: by 2002:a05:600c:3e06:b0:499:8d9b:832c with SMTP id 5b1f17b1804b1-499b06adf9amr45860805e9.4.1787217445426;
        Thu, 20 Aug 2026 02:17:25 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-86-139.retail.telecomitalia.it. [79.54.86.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm10021606f8f.26.2026.08.20.02.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:17:24 -0700 (PDT)
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
Subject: [PATCH v8 08/16] arm64: dts: st: add can1 pins for stm32mp25
Date: Thu, 20 Aug 2026 11:12:16 +0200
Message-ID: <20260820091652.43541-9-dario.binacchi@amarulasolutions.com>
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

Add the can1 pins used on MicroGEA-STM32MP257D-RMM board.

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

