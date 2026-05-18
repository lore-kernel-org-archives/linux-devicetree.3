Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085B9399000
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 22:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779141766; cv=none; b=mC2V6EvmNKfMWBnHSuIZ4wKOZz60YYwy5LsttWk7gkVSrg3sCSB8oKmqFV7voyd+h+15VF3/FpgKG2euXLZ3XoCalef2mz7dVDYr7a2ngAO+X05aZ/H2tyg+A/Gx5N9vjn8R0gs7Ql41MEez1FhAlphHonClRf/C9hmBx6NS4c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779141766; c=relaxed/simple;
	bh=Z5CmtTG5nugdJKWxji3kQim9emZIMVZ3uEpEgfiinmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eAQQehRXPWDj5CMx1LclNd1UIlYBSztfZR7qURaUSxVssP+6iKYXeOTImwGFpT+OPeD9EHApTdmPFOwJbeDxJrNM3DW/g0Jfhn4pPYCptOABX2QTayh23P88iFTXOZrmS76H0X0GNvE7+9RsTrN4bJ1Dz1czlhlVfpSpKG970GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ksiSqaxg; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ksiSqaxg"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82fbdd60b64so2310246b3a.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 15:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779141764; x=1779746564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mr8yQH7e/wAhaKceJuwttlGCTuxK+V52TPcaq/q0rs8=;
        b=ksiSqaxghg2d8hnZJhdK0yRp8RKIDe+zjwuJVMDiAD3vRirFw6tjq5ovtQ8rTOiqAf
         aDSuRaU69yGOSOEXiAFX4s0yIKbo2/zb5JoRIgbVWbYEdz5CDBSPDH/z/IXA1WmNmdQT
         sr1NFOlIfLr8Ebs2SnF+CdCXLBbGRAdJInHHkOsTxkSQ465t7aakqtlHuzj0SeJ+cs+T
         0cdYn5tyX54PGdeHIs8LbnMwroAQyyGiaCrJGi6sYQ6IAPgoiGmcO5Nnzw8p/TwoLMM7
         FwOcdg0LoDEheFvpnV/jDn7ypKv6+f3xkBvlIXk1KRaBHudb7eMGYoaNYdE5o0A/o3o0
         P9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779141764; x=1779746564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mr8yQH7e/wAhaKceJuwttlGCTuxK+V52TPcaq/q0rs8=;
        b=IXHkjWoucsL55hFBh9EmaltVvaMeiEHmTlPWmnTwtJMMVNNx6l7sHMzUuemMs+fxe4
         WoRvbBlhM+0M57tvjsE3zKdUTAAS8Ws3t9a0GBLAZyVCBNsFGrfGEaM/1QSlHt+rbPjr
         jevTuXygWp+J9BDDl9vFuElyV2OJon7+HfaUjTWcDj4WPUN7eRlf61obtmdHuxM8fb2L
         Yvf2+N/jp7kdlE36yTAJy0IE5lcj07e1FfSSwiTvPQbyoeDZ36O6LtVn7XjJ4AryYFD5
         qBIpjEg+52GwYF3rhACR/O8/euH1IpMBTW8xLgaXPzhOe5udYAsax6vCY09tXn9PW3ms
         aevQ==
X-Forwarded-Encrypted: i=1; AFNElJ8NXbPy0yxdMQ3uXF8hMsyEOfSiF0YwNBQ6pMPz6QbA4vr5RvVSEd9TjKiz4wv85mcUZLbdFJatwore@vger.kernel.org
X-Gm-Message-State: AOJu0YyC6v83S0sVUI/vkeuB86yE0qCVEEbeNy1j4zZ5tIrD4tQ0slxN
	nhcSqTL8IyjaCpHOM7jmshjq1ZNoehXk3unzGHDFc5XEMYpGRfyxxu6v
X-Gm-Gg: Acq92OEI2hk3GnQe6rzfwtl9MLmZqxTtr6MIlkxVS/ZGOdTwgISMKxljJWiTrU+cIWS
	gINBplldms+7EfS19eE09L05X98P9THliYAjIFwb3x7hwne30hacY/w4UCmY/hcfrxreM0nuWLG
	v0VwVxcfEBIuF/jfu531Ayb7m+mJ5ztSG+1l6hpnCUPiuazf9zaEt7qa5uoOJATxx6zrVlDN1BO
	3Kidc2jHgFYJqrSL+dPILuW6MgRhaj3OUCXw5beRmHjAPwRE5W8LElJUCTnqmktqifqx9oWCY6W
	KeihxNTSS8t8Qtu1ePh7GRNRcWgRy8q/EiiIa6T5me6x5MEq4NPorOkkexJWDDY6lVQn/1ITA7s
	+s5PiVoTTz6HFFcjtcjBCPiwX/aROreqUNRUfM6T/PsUps9ZhbpfoQtvchqlpQnuYFsSDmj88wM
	D/7MlpnLO64O4lrSbfaOqVypYJbc8mkgj+fb6bt/V1Zn+V9FN9vHdcZNNlQ18VXnWfF9aRIdkFI
	B4y/GkehCPvHYNTGJU9+mn8uf6asY5kYA0giYxvAO70l8lv9GRZEbTJH/GEixWruDZHuns=
X-Received: by 2002:a05:6a00:3e22:b0:839:dd77:3501 with SMTP id d2e1a72fcca58-83f33c33546mr16660661b3a.1.1779141764388;
        Mon, 18 May 2026 15:02:44 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f1977b128sm15772960b3a.22.2026.05.18.15.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 15:02:43 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andreas Klinger <ak@it-klinger.de>,
	Andy Shevchenko <andy@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v9 02/11] dt-bindings: iio: adc: hx711: add VSUP supply property
Date: Tue, 19 May 2026 03:32:18 +0530
Message-ID: <20260518220228.63322-3-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518220228.63322-1-piyushpatle228@gmail.com>
References: <20260518220228.63322-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the optional VSUP supply used by the HX711 on-chip regulator.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
No change from v8. Already applied to iio.git testing branch.
 Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
index 1ea60dff98d5..a8eaa1f18de5 100644
--- a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
@@ -33,6 +33,10 @@ properties:
     description:
       Analog supply voltage (AVDD).
 
+  vsup-supply:
+    description:
+      Supply voltage for the on-chip regulator (VSUP).
+
   clock-frequency:
     description:
       Controls the SCK bit-bang timing. The value is used to derive the
-- 
2.43.0

