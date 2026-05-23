Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAC72D1F44
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 17:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779557602; cv=none; b=QwcoubaKfZbOV4Sh3la67XkKp0gYa2JTT40oL/qgm8t5TndZxsv4KUi43aRCQvGS73QDMnH7ReKIfmKiNw8jw6+zjYuhaBrA8ZtIt/8525Yizsv1j/2yjlU0Kejy/JhzUpvO7/3EdbV6ptgJteYOTCh5Luc4dCUtcabRZbKOta0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779557602; c=relaxed/simple;
	bh=WFHJB0zVU9aeCuRj8HDI9lHMmorAHtWcYiuIgtuUY9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bwLfDCFUyAnecJ9pTBUKSHS97Dd3BUAIy8DRoothSKn2e/solgOdG7txTJ56wZ3R3JWELed03pMwSVCQ8iXyrydpOtbRlgfZ0Bqb4MV40VN0uH8iXMJYWlE/cGHV+jbQ3cpSnWsmM5HdyU/ZGzx5PVuFNwslJ1/Ni98fpkMc0go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JhMA0BMT; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JhMA0BMT"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8383fb7143aso3752205b3a.3
        for <devicetree@vger.kernel.org>; Sat, 23 May 2026 10:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779557600; x=1780162400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3F79MqG9jAX2CXiKWut0k15rC5yK9KJ27umq50B/zo=;
        b=JhMA0BMTJSsce+livwjHUt8JWOv5n0h9Crt/89w4uPRQ3CzwZgf/0ttitRAoskd+F0
         EKVVy9Ilnt5DpUGUoNY/kGfXA23LyPmsnakowR22NOJCUKZ7rYfydsqwt0zUkja/q/eY
         /X2h1mo5YsPSU6Aogm66LL/qF2OjANtT7HWSz/oDXtw2+fbssBm8LrToVQ3fsMF0deLw
         U0OwvZN9Pzl01hSPmApZWJJbbjlVN0wr5HpL1gZrpONdvD0qPhFL/zvHefgt7dkcaJYz
         Y4hjVNSDbR+ZBnNQ3SbGHxh3NkTEzFte/labaR51TdBGuyKkWzmLzfGJ9wi7bn4h+lC9
         u0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779557600; x=1780162400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t3F79MqG9jAX2CXiKWut0k15rC5yK9KJ27umq50B/zo=;
        b=ZRbMmv+KiJnnjtGwdJabaQF7pk9W8uCoYSCGR6SmsNtFnj5D3cOlF0MQAkTF2huVa0
         fisT5bPjXFiq9SV4KPUXSxHIMQ9LZSCb8RgKGtf8hIu4zZ3lsUYbAizFZWLRtpnAD+g/
         cWbfGgzqdgML3VDabcU5cqB8tF5mr0Drpqgz+MsFkAiH2UWyl7p19aEo6c18MZM1TM5d
         Nt3/vuoqdgPfO2zX9WQoVB2qZnvJCfyNQKkDurgVxftF4xOt/SJbL1u3seFvd5O9a33z
         P3KJdgus0cfHJ7JLAb9X8eBuby9QdqhOMsRXDiRa4dWyHTESaDSHIPmb9xhAPjpixWHo
         nkHA==
X-Forwarded-Encrypted: i=1; AFNElJ+mchHOu9S+ZFcFlOCBAg8h8dZlAVueS7ItHJyBpdmDIQqyXRCwG/oXS0LqW44E0XwPLCVsD9Q41vQA@vger.kernel.org
X-Gm-Message-State: AOJu0YzPqZYBgf+C44/3bDmHmgTqwkjhH9x+ks5Js7J0SbqHW2WleV6s
	ZRxMbqpgZMUc32m7/zcIB9jK1UVQ7WtW2FZnkVMMzjRI6/XHNqAFZK9o
X-Gm-Gg: Acq92OHBHs6iA7V3itbwd9r+gwk5BM/JmBgBbK0jU4nD+MbkG5MSSqcNH/emabCZ+Ja
	I3bnXgWFcHgtEBFyW0EvTWzUI5k1tOZEjXL1mvHj1Az5HWB4meeHHrtSk0OakyyFtIIjjxy7MkP
	salNmPzKu794LNx4YphkGZMJeNUOOcJc0d2iARqDxKRXjpTjpW/h/7PdXgEx3IV77pF8fxmVTt8
	nxrz5dCvZkroDJWdhJ5UCkwrW+O2Z+tG22yJTQgmfTgCX7spJiJ4khQT8zarUmah0HC5GtfqkcB
	j5u39iN4RFtCQ//JfPUtveoK4tb5a1RsFqIlWBKAz/t9NSM+Xfaq0E+4mgoIkduP23prSXEMIYM
	Vy/a8o+Pk9iSedEYb2Q4tzhAtHTvG2KsTtQQkPi/oYciRDZW+R+4u8s1WNK2PUkNLhp2ynPdFq/
	e7/D7rpM8EpOuc9fDmpMGMTxW3cNRiAS4MybgM1yJHxMbrZvE48cZnG9/isUogdJ5FTg==
X-Received: by 2002:a05:6a00:4483:b0:82a:780f:a187 with SMTP id d2e1a72fcca58-8415f5e6690mr8305636b3a.36.1779557600057;
        Sat, 23 May 2026 10:33:20 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.12])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fc646bsm5162945b3a.46.2026.05.23.10.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 10:33:19 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: lee@kernel.org,
	ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linusw@kernel.org
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	manishbaing2789@gmail.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 2/2] dt-bindings: pwm: stmpe: drop legacy binding
Date: Sat, 23 May 2026 17:32:51 +0000
Message-ID: <20260523173251.72540-3-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260523173251.72540-1-manishbaing2789@gmail.com>
References: <20260523173251.72540-1-manishbaing2789@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The st,stmpe-pwm binding is already covered by the MFD schema
Documentation/devicetree/bindings/mfd/st,stmpe.yaml. Remove the
obsolete and redundant text binding file.

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Uwe Kleine-König <ukleinek@kernel.org>
---
 .../devicetree/bindings/pwm/st,stmpe-pwm.txt   | 18 ------------------
 1 file changed, 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pwm/st,stmpe-pwm.txt

diff --git a/Documentation/devicetree/bindings/pwm/st,stmpe-pwm.txt b/Documentation/devicetree/bindings/pwm/st,stmpe-pwm.txt
deleted file mode 100644
index f401316e0248..000000000000
--- a/Documentation/devicetree/bindings/pwm/st,stmpe-pwm.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-== ST STMPE PWM controller ==
-
-This is a PWM block embedded in the ST Microelectronics STMPE
-(ST Multi-Purpose Expander) chips. The PWM is registered as a
-subdevices of the STMPE MFD device.
-
-Required properties:
-- compatible: should be:
-  - "st,stmpe-pwm"
-- #pwm-cells: should be 2. See pwm.yaml in this directory for a description of
-  the cells format.
-
-Example:
-
-pwm0: pwm {
-	compatible = "st,stmpe-pwm";
-	#pwm-cells = <2>;
-};
-- 
2.43.0

