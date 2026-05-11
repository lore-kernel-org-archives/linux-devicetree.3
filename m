Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EC9466B49
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 17:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778521481; cv=none; b=N4oRkyCQLXXUfJJGxgSDGStZHt2F4vs6Ql1KzSS0w/4NoDWL4/2ft2QcOTYiieeXQrcVUXpvWMLq5D8PiRONwsTQv/YJPIJNy0kNYap2WsY/WDLt7tQMiziCHa51spa2hqFbqUC66iPU7/vsgOkgEJwMXii55h4XkOYbsCL18SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778521481; c=relaxed/simple;
	bh=E6aqh8+T12bRYg/I7oKlm+pFeDSPhmjn3uy2gMkP4v8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tFC0uo7Q8FkomA9L0lBk3R+QW++8nAhc6BYG5ZvRml+0g7jm+amgPTnZsy0YUjVnDWFCsYrTc6v/Pi4pAhRA0XUufjOx6CdiStEJbDplqpQPMetFrLRTMSaDXc2eO8GJuAP5rhyhM6EpnUGRUvWqmBRRshIUzQP8e/gx4QCI86Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXlQQ0gI; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXlQQ0gI"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b4583f0a1aso29680075ad.3
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778521478; x=1779126278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+cPMvGUMQLb7n51EIv7e2LMS6MgRiFBSfjF2HeBPNI=;
        b=BXlQQ0gImDdlq7oBfZ5XKwWaRdN3KOrPjVqdiP2IoFf3Ckz2C5/Qhb1VdZqPeFNR63
         JhUI74jl9T6VQwBcENLHc/+tGG47E1LHaNwSB11YIH3pHCM/nsqv6nHlAy8ftNnZxzC8
         QScUPLnRAe+/Q76rgpJUeQzwTY+1icNLn5dOiBz3yrjhvEe7PrfsRzv/VyCIXmeVTBM7
         HR7YYduq2J1/U2QcqgQruLgoTKuKvlH8NL27qXnXuntG48BPsAUJfr3esxYiBMzsxj/e
         r6IuRnxT56cvoG/wtgcWB6yJglK6ogaX3NjZkkNfRYHYx3CGdiTTcmhxNgyz8hCr2Q81
         MMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778521478; x=1779126278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W+cPMvGUMQLb7n51EIv7e2LMS6MgRiFBSfjF2HeBPNI=;
        b=V0UYTuqIo8JuVOaeG44W2E0xImqkXxYmPdLbrZQcVfA75UmFN50mzlMvIqFmeoXAJ+
         /nGZt8LOiSt7WqzHh9sA01Jc6bcUi72GiJRGyF5OzSSkYXtDymCMnecObT2s7us7wXZl
         n3cThG8KtDlmW4KQ+reYMkUExYEhfxMoU9JPctB8015LZDZ3Iyty8eDD43e8G+ydmBVp
         wqomRxJ9/RSrz9Qzy2uX+fqa/ICyUfxvBwhuniJM0dLw/DU2wfK3As3j/AqTjaB+dFbC
         z1vdbiTaJZEY+/EKexJRnM+R7Ln/DEw825EOuqOEIxMP8eclkETWC9nmvOiIAbD3kBAh
         hXRQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Qaw0WdnYIyvgTgIOj8NaE1La9NJMnZ5dp9jo6Eg0cR2Ny0wGCOntxGmjwIfFKGz5ZhtwzwcAZ64Gy@vger.kernel.org
X-Gm-Message-State: AOJu0YzNPB7Ge8/G7Kka0StIn9C6clAenLX9b+0z9ukWl4jz0x084+fR
	riKgiwHDRSizKpuQm6QKURmobRB5KuFrKQS4AAr6poezqMvgbvbx1dbD
X-Gm-Gg: Acq92OHSRMF3vTDWe1gUkNR2daGhhn866eeuEuJ8zioRnQjHkGmZW1CxyQJnVrE6/PW
	Htc3MY9xSY0DR1DLdZKsYHRb2W/i667K2oYfOfYsXjAuCwfrE16tBqDD/Bi+wBALWKA46pUDivR
	Py6Nx8sVcH4D3Cq1e1BuB38CZ78N7Qpe/VLns3eq7DxlhOfqJtoFc9uR9Ze/5PwK8K/gTwhBr93
	CFhAVw8fW0sw8xuKHnwz5x/FOoeZoZ9HjncK9cJbJZVb0tAn4HQcivCRdoaKpTTV00Tj0FzdDfQ
	eGTDUAXZp7LVbqlkiYJXjyadubT5HH5snErH0No+awfKb26Wy/268nj7HDPla1E/PXgDm5a/BTg
	gBRmY+FOa19UlLm3Pgwx6MSoPym1agwH/la8Bj6klOFr5F65UqFXcZuygGCF23lW4oesL5bX40j
	3XHEZ69NT4wbxzdIKC/kEHgITcjvJA39dKIQByrV5HHemr8z5KPtu38peHGSwUKymUY5ARn1fAU
	rZJ0oit4hQ34/d7ZrL1s2KkNFw59v1ih1UbpMo0aZXdlsywKeTyC2tnRmsD
X-Received: by 2002:a17:903:283:b0:2b2:4b4e:e4d2 with SMTP id d9443c01a7336-2bc7a9c7762mr106560255ad.15.1778521478295;
        Mon, 11 May 2026 10:44:38 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e365a1sm106838425ad.44.2026.05.11.10.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:44:37 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: jic23@kernel.org
Cc: ak@it-klinger.de,
	andriy.shevchenko@linux.intel.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 v8 03/11] dt-bindings: iio: adc: hx711: add RATE GPIO property
Date: Mon, 11 May 2026 23:13:28 +0530
Message-ID: <20260511174342.123820-4-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511174342.123820-1-piyushpatle228@gmail.com>
References: <20260511174342.123820-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the optional RATE pin GPIO used to select the HX711 output
data rate.

Update the example to show the property in use.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
index a8eaa1f18de5..9134bbe41379 100644
--- a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
@@ -37,6 +37,13 @@ properties:
     description:
       Supply voltage for the on-chip regulator (VSUP).
 
+  rate-gpios:
+    description:
+      GPIO connected to the RATE pin. When driven low the output data
+      rate is 10 SPS; when driven high it is 80 SPS. If omitted the
+      RATE pin state is determined by the board wiring.
+    maxItems: 1
+
   clock-frequency:
     description:
       Controls the SCK bit-bang timing. The value is used to derive the
@@ -61,6 +68,7 @@ examples:
         compatible = "avia,hx711";
         sck-gpios = <&gpio3 10 GPIO_ACTIVE_HIGH>;
         dout-gpios = <&gpio0 7 GPIO_ACTIVE_HIGH>;
+        rate-gpios = <&gpio0 9 GPIO_ACTIVE_HIGH>;
         avdd-supply = <&avdd>;
         clock-frequency = <100000>;
     };
-- 
2.43.0

