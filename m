Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7FF4657DC
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 17:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778521476; cv=none; b=QDmV7tO3iuyEfw887Z87OrgvgIioLRcG3wQkEKj5q4ZaZsjBX5l7cYoSj2q90CLn6CpiVQVoXePQeW6wcdRZN2czbZkmWi5UTYCkt9XtfB6Xp8NTCtXaSUm75Uw+oakkBdy78tXQqfl30xWGTBQB6yKsPGBUCouDLi8mQS0gIE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778521476; c=relaxed/simple;
	bh=IVD+qBGZZ/GjO6g2hTpEXXLZnv5N5xqfsYWehpQZHzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=THf7lQZHpNb3Z/yeT1wrQRWdHKsx8z91Hg/E2al14xdwtHnC3wd8wFOJVn6Yk300LgY8jSO7y8bdFhUjRHs0ckNFbmjW8CkZuZDqR8GEYT5GxaNtac3N8qo3xP5lf5Vi/hWQ0pKIItHJM6oF2GwaCnkH1qKgtUdAi/2uhq8KbMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/PrB2Q6; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/PrB2Q6"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ba0714574fso25441525ad.2
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778521472; x=1779126272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/3wTFv2d2fAYJFYqZwFfZcPNj/IS/kHh6I2keoXaaw=;
        b=J/PrB2Q66jKKeMpvA5OO5OctCURTFS9gcCjig1iMjVjVk/ZT3fc+0RPgrdPhMpI3XT
         kUlaH1MEuhhttPkNL3C9hU7ACxm7mk17LkRcYsSng1fcjjBB97POFBx08Lq/IIXLbKsE
         pw+U5w6onZS5r7/GtXFYg7voMxVCcVxfIBztZ9Cy+n3wLfgtWfH24GENQdXp+8nmuJ3K
         /5f9HPNbRa5lyrcA8BVaafRKMjL3Y2RPys3LIQpA4MfXH5lEsSd4ogmMToD5YRRiitVP
         XeY9G2CJxj5ENpadt8eMU/gE3PfBsD9kynA23JG0eaQB3M2Y8EBVw30qBVbiGvehGqrL
         KiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778521472; x=1779126272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h/3wTFv2d2fAYJFYqZwFfZcPNj/IS/kHh6I2keoXaaw=;
        b=X64xIh9yNifAbakdxRFFxMB8//GQOd7jVE15ECpSOvZZPwF1RJn5VDcrhpcAZ0qkqR
         8SZsVOFbwDgQg/Tyws07QN1mG3nLRJknCugtc5aCfLAxBlQMeaNO3up/nShjv+BPZtmb
         ZDeIjXBowq8UqUu2sDOn4YfABrszkwuBhxufIpTsp6vJe1eyMQNiHcKq27TTDaAYvtLN
         /tpaNznQKL2QWWdAgzyqrWitFlwgAu8ehwnO7dCTTR1S82BiJr5FkxgPf0QPU8QXLGqG
         fVGYrdOyT1G6pagHhj38m4YAPqqm0fDwk/VVcWtAyvTcJEIZc/2GUZd1teQpWTRBHQhq
         dPYQ==
X-Forwarded-Encrypted: i=1; AFNElJ9n5bAC4QOS1J+a7oA87ONxgD4kp9kOogyfbNwUMjwZ2lb1VDMB7r2UfjYXMLm9iCXa1T7B76SNaRjq@vger.kernel.org
X-Gm-Message-State: AOJu0YzkauSZSgJVtz35GrpZp120lL63nHrpfCeHRxAbNvgH4eybLAHx
	ekJGJn8zY6LG+2jQjalKHCy90Ri0mab+zP57TfLNgq6UMUzd+AiNjCfI
X-Gm-Gg: Acq92OGByWXUHqMcgma7a6E6jBjplcW8UQUPtAWUDRRJixNinSPDkeZbZV3EprBPT5D
	bmTahN1SNcrEe9sI3ZVhWx9aMKjVqipGeALwdiAr5paph7nkfcnuOeWbFpYQuKXBkqSrroyNxhC
	t8C4wMcjzTiBFVoIEsvBDv3sBGonw/9mMDtQkTD/yCvppQbuahKZqKCpsYnZs+hSNFVXN0cTpAM
	syYJAwJ7uZKvzcH+Tcsg0NOFpv0u68J2pZN4QCzEFn5pKMuKQc6eb5EiPYiMnTY1SPMkScr7wNO
	w7kwGir5rwVYUDCh0A9IUwrLu6Vjd0+MQQXND2NMUcMWhGdEQZul6EyRbuh3uBzOEnPyVGzeoi5
	QXFoAizHifA7KZbYAL6cpEINNKtaF3wK4bsgE/MAd4DpnoRmxP8l0Rk25O+aKTLSKc6MFI1k7/A
	4ki0HIS5lX1JbSZLlleV92mASRhhRXU3LkOXXvIPXnYi1jMQc/NBrrubtIW/vs2Q6kEqL4ZErfT
	7hN7XnyiGHazCxcJ7pBM5cDSew4GeLOkgtwVb2gi4wxgeDwdZTIqzjm469M
X-Received: by 2002:a17:902:f78a:b0:2b2:4cd2:e16c with SMTP id d9443c01a7336-2ba798c165fmr245635655ad.20.1778521471926;
        Mon, 11 May 2026 10:44:31 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e365a1sm106838425ad.44.2026.05.11.10.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:44:31 -0700 (PDT)
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
Subject: [PATCH v8 v8 02/11] dt-bindings: iio: adc: hx711: add VSUP supply property
Date: Mon, 11 May 2026 23:13:27 +0530
Message-ID: <20260511174342.123820-3-piyushpatle228@gmail.com>
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

Document the optional VSUP supply used by the HX711 on-chip regulator.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
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

