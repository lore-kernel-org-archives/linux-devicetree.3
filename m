Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBA83F86E7
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066050; cv=none; b=o+9NTJGS+wHLiqqbueucNdzYnsyqdA2hWL/I8q1nYVUOi3dxudOpkw6BQ/Cs84/SPpNmSRCC0jGcj1O8TcqhxcKLY6EOLODjajPJJrednoHvW930gC+67NYF0jCUKZZ62QtAfZy+C2e7nogYL4ZDZ/1NaV7lLwHp81+fEKmcUEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066050; c=relaxed/simple;
	bh=97KY9yD7aJyeFaO9lx3/aKKgODbzwtq99a/1TuTW0pI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iD2OqN0ONm0A5wLvY86oMmRloFmalA+p4iiP/F5YLqriyeeei9pDvr2U+yR+VN8MyfO6UaxWOb3rtbVJX4NlFkCnnJ/uxSypGC8RhzXRboAIzhnI9yF3+8IAFa9xRxl0cnxejzNMWrmWRTx6JKR7i2/bySCylrQ6C/KVGEqPCDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=SMILtfdE; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="SMILtfdE"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso121433215e9.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780066043; x=1780670843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=;
        b=SMILtfdE+uYMDg9exdhyeCwqzjUfmiFZFf5VQmtzcSbgZ6Jbo94Zm3O8F/VdjcHTWX
         A6hnpZAhGkElAwl20uYJbjx4SF/4YMm9afyRv2smTk+8QNJceglnDfHSPjuXEVXT7bu/
         hb/WgiQV/Ou/il+bPxWCGeSQ9I7IDMjyGoCcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066043; x=1780670843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=;
        b=sV9yscjDzvLSXx82bJyYgEZ8BspT2b+I6qovXMBDk4UPpKFmsDtfRH23zUWca+Qkhi
         LOYHpdRobJMSOfGIEyS/6eIoILQYVkk18sHM6PSrHnH6w8igG0czDt+2n8YydpmagCdo
         8EzTMfgmesUEgriFw3j9nz+AU7fRbkpl7R9wJcqF6Pc/GgEvox0nzAWyv3n1EFMDtXS0
         agKDBpDYm9Jt65wlMyB1g6d4Xd46XX7CC6LSbEbw0pBayvEpCAX18oIjYrb+cfYfqUCA
         mm93n7IPAYGpuFW1UtnTApn2Fvouwsh5waYGB7vuJn3NrjLHTfRHMuIbN77NCqMSEeAx
         lvtg==
X-Forwarded-Encrypted: i=1; AFNElJ8DotOfRpb6dbRyp9jYWPtXMUrzXzBCQ6iZEk0I88ZPZRfyWqe6EAfEN8tUR7hQOZXZs3SBOTUV1YxV@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq/m0d2hON5hvZ5OALEsS1EJE7LeeDD+N9vYa9lrRIBhhVc+dX
	hVD5TrFzP5TI2vaW3Y7Rp+zM4vc2xa1BKDlwizuFSLWMF1UxIj+ZtxaqpQ24ckVmmng=
X-Gm-Gg: Acq92OFu13upbFfYvawG6+nvfDIFY+KZTd4xD4lKr08jPFODTnLP+RapQ6H2Q+BbhJL
	nf0HmsL7ZDbgLM1bqDn/cVWsiVrwGTKiuW13YOPAHpu3G3BW9Ayy76DTK2UBraCzlWVEOAylsuE
	XgBchD1UDP/deWsOjR8g7nGWfA+ZkMteGlQL28aoh4ImQjpSGz24+qTPI2V/jgI69dvzrtDkaoU
	tJE0GI3QUS5mcxPQ6pIcgNpv01kou0ME5fxKr2LJe72EtdlyH7qG2gFOvomNDqVNA7T1q1BU4bN
	l6zAdaVmQ+HYUG/DwAaDeJcAvdwI1o693vohaA81lYpbMiUISlLRIR8E1NYz48mAXZDRQAHcNV/
	qMjWqQnImNO27TMuALSgU3Y5AtT4zUnFluWG0jspD6rQFLgIT5a5eVvxY6CiRjfh0ZradmRmbHr
	mALRou1TaEGFZVyA22zjnG4wwtRFYSzmg2B1KsitVl+dridQ2Vp+eVe0RhUcEg/kgls9dDgj102
	NWWe6SISl66CCqIVvnUNzABbtW340C67DFXKnIq+xpmzLVSkpcDYyhXmp+3vzHibhLLWg==
X-Received: by 2002:a05:600d:6414:20b0:48f:e245:394e with SMTP id 5b1f17b1804b1-4909c0c8cc0mr44542145e9.27.1780066042883;
        Fri, 29 May 2026 07:47:22 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6eb470sm38694785e9.10.2026.05.29.07.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:47:22 -0700 (PDT)
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
Subject: [PATCH v2 04/15] arm64: dts: st: add i2c1 pins for stm32mp25
Date: Fri, 29 May 2026 16:46:18 +0200
Message-ID: <20260529144707.3931919-5-dario.binacchi@amarulasolutions.com>
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

Add the i2c1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 456ece7f8ebc..db485b9ed904 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -203,6 +203,25 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	i2c1_pins_a: i2c1-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 13, AF9)>, /* I2C1_SCL */
+				 <STM32_PINMUX('A', 2, AF10)>; /* I2C1_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	i2c1_sleep_pins_a: i2c1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 13, ANALOG)>, /* I2C1_SCL */
+				 <STM32_PINMUX('A', 2, ANALOG)>; /* I2C1_SDA */
+		};
+	};
+
 	/omit-if-no-ref/
 	i2c2_pins_a: i2c2-0 {
 		pins {
-- 
2.43.0

