Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EC63546EB
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 16:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780246603; cv=none; b=C/V09XxQe/igoOcYL8+4uY5DRvbiu2OQ7+OB2lIIMEwrXqAZZQ57nL5Ma3bIIcCvs24888iyx/NebsXy6Zb94xLRussduR8G5+G8cxK0UGsoj2XTt++3XUrCCjNhxLjkBDgMGFpczMLz3PihzVbSbFkEj0sZ0E43E/6UvM9bGyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780246603; c=relaxed/simple;
	bh=wMgstDTG3Htg8sV956v99iFXbhtolrOjZNrDTHpa1gg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cY4T3NPWN7boWL4OVq2Nzz35evYDIBvu7i2/ZNYTehHxv4BMRXUhsxvGFYgs+da9qUUAv+7LPi7xY2n0y5jT/an1rrmeUluEGg5KL+OYW3J5QH3t2F0VQheNIuu/+BOTOwbdCD8d6Sj4jqmWFHcbc8wgIQ1lMKj4D0JlcX4lBtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fRT12y15; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fRT12y15"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49039a8851fso96000625e9.2
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 09:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780246601; x=1780851401; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=auC75XiHji4m/5c8v8bWvJiaMsYrhK57f/6mbMWrQHo=;
        b=fRT12y15D9Kn0f95ggEpQSeMdUGzISfZ2O6KefSGnyQOISv1e3IhfgXIhmIwAec5gO
         dUTRHRb4648Syss++faNrKwTE8JuIRmte6PqHH9nsM0q/fvZDnIjPDaj8CLraksEIe9J
         3aw8meNGTUfjNWbw5VeV47rbLytsp5jInoEYgrsCxu081TFipDJlYP3rZX/fbHEm+3aT
         3bvCznBUyOMsDSzCca0bLAHIbz8dKsWsjbg/JqHhDn9hUJSnatfuZmcAxT753Ljfl4ez
         E7ngxmgkEwlOv7ojFMg7rWmMns1YFlQMtwnStVOI3aDsqGedkwrwX7oRJVfoTTxBz4wd
         LVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780246601; x=1780851401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=auC75XiHji4m/5c8v8bWvJiaMsYrhK57f/6mbMWrQHo=;
        b=DRhBtVd94xycbibfs0K+HDHgpN4THoZvBpUkJgs8oYh1Cv7jd+q1zjWwGaOUGebt6x
         pTIVbC78O1o5RYcvlducoBkEhBJm2cVu32kKguBONzAByeb/l6pYGOGSoTpMAcCv0z/R
         Csa8iGdawndwr9aeLdGaPijOJpy9gsmhNd3M3/USZAXqCS+f70Sn395tnwseyrRgMHXe
         34vhmR0J9a37XXxOLGVz3molqFcrXOXWfqGgGueqi0Q4QYlHLLoTNmX8C0MJ46TpsldF
         CnJiXGNN+GW23GxbV9m8/BdMvAwd9VqIsN/1MhXq9PT7YzhNMFWcQVdZrnAB6KSctQGm
         ka6g==
X-Forwarded-Encrypted: i=1; AFNElJ+A+ik7uLb7ThGZQwo+fflk7IFAe/uVcf9CBYyMatEBnVBhedOhaPmbE5s7QnaG6d7BnPLWbICM9h5t@vger.kernel.org
X-Gm-Message-State: AOJu0Yxiuvb0qQt5YxJAuESQLljNVn836TRS5139K9WuJMeogrHhdhUS
	e76j5uF7UdeMrpBp2p2wWm9Gqp7yr0+IepHChTeqLy3+uyskbOVTsU5J
X-Gm-Gg: Acq92OFsoLTrRPvaoODULJ8DkiM0nqxrQlXihKnLkQDBOYE2vVrJ9HJTrWWWagfK072
	Cu5c4/MUf0gJhmJHhCMHMBM3kNsBKsKUOjhfbdgZuUnR02gbzxwXQAUP67gudm7h3URp8+dovMd
	6oD/0hFtSRIYoOYxG1pfwVlRm+8pAMgCnKBG4MsrTPoJtS2g4EH/Ovho0e+tJ3J2HjtmZ9w3781
	FCRxi8TgwiH8mNfLxgFueeL2R6qftpfmRcmQQ9PlAHFLUanvXx879nS85NTCk6q9EbgkvpVK1uI
	aHllnTezp0cC77SY8nNT3QaGnfKqAsAlHrYOohtsCKVpCXwVz0ROZjOnP4s+SUTbPRE0pTXBdsP
	zkk7Ii5JBFSzIjcM+uItbJB7nPcZc6R3AyDU1rbO/PtXGZT/MMxbFGa+K+frtWWLlxv+leokm/1
	k+4M/7VxqUtRqZ8m3GyiuPQ12vPoZgcYM2xgh5+siwnOFQxKJPIxgpy5eqkAkckWOF5hHLxLd3i
	+zBlyfW0O9xlaKKYxOYgQuehW+CgJ4ItjVYyBdkwsRJVlW+7pYA5DFxDJfNctNxd5eLMverAymm
	rZyQRpSW6SQdeldozhAnCJNXqk2FIdpJtP1+uQ604z3a2nT2uETaGALPJ8VHVg==
X-Received: by 2002:a05:600c:3b8f:b0:490:688b:f9f8 with SMTP id 5b1f17b1804b1-490a29513efmr171988305e9.27.1780246600387;
        Sun, 31 May 2026 09:56:40 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0:c287:187e:fb7a:66a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c09acd3sm57648445e9.4.2026.05.31.09.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 09:56:40 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Sun, 31 May 2026 18:56:35 +0200
Subject: [PATCH v4 1/2] dt-bindings: iio: light: veml6030: add veml3328
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-veml3328-v4-1-f9b65d71d917@gmail.com>
References: <20260531-veml3328-v4-0-f9b65d71d917@gmail.com>
In-Reply-To: <20260531-veml3328-v4-0-f9b65d71d917@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rishi Gupta <gupt21@gmail.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joshua Crofts <joshua.crofts1@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780246598; l=1857;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=wMgstDTG3Htg8sV956v99iFXbhtolrOjZNrDTHpa1gg=;
 b=erugobMBDiWIWTtcOd5ctWM5yy/wrv4C2WzYpqns7UQHsWsK6m9H1HFgHDxpU8NbQ5GnGs75s
 zx9hdDduGhpCE4ixB/TrLwc1GJ0Dv/qpVRvXd3/pJsm1hZ8kjSrp3kh
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

The Vishay VEML3328 is an RGBCIR light sensor that shares similar
devicetree properties as other existing VEMLxxxx sensors in the
kernel.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml b/Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml
index 4ea69f1fdd63..0041e1db6838 100644
--- a/Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml
+++ b/Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/iio/light/vishay,veml6030.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: VEML3235, VEML6030, VEML6035 and VEML7700 Ambient Light Sensors (ALS)
+title: VEML3235, VEML3328, VEML6030, VEML6035 and VEML7700 Ambient Light Sensors (ALS)
 
 maintainers:
   - Rishi Gupta <gupt21@gmail.com>
@@ -21,6 +21,7 @@ description: |
 
   Specifications about the sensors can be found at:
     https://www.vishay.com/docs/80131/veml3235.pdf
+    https://www.vishay.com/docs/84968/veml3328.pdf
     https://www.vishay.com/docs/84366/veml6030.pdf
     https://www.vishay.com/docs/84889/veml6035.pdf
     https://www.vishay.com/docs/84286/veml7700.pdf
@@ -29,6 +30,7 @@ properties:
   compatible:
     enum:
       - vishay,veml3235
+      - vishay,veml3328
       - vishay,veml6030
       - vishay,veml6035
       - vishay,veml7700
@@ -79,6 +81,7 @@ allOf:
         compatible:
           enum:
             - vishay,veml3235
+            - vishay,veml3328
             - vishay,veml7700
     then:
       properties:

-- 
2.54.0

