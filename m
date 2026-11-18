Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009913;
	b=MvSRaxA1PqyRC9LNJmjdXqSBN8+6SIDVwrAhnVgp2CgVqdlOw2Rq3WKmltoYJIEA99b6
	 PKcChUEaD29pUD6uk8qQ2cok/Kat2UlqDxVxGbZqGXb4xbyMGEmySm6pr1f+PWUXcE3HC
	 XHDxd81A9zd7BqqGbWFCIBoYlPCXNJjpdK+0S7Fdc3X2TK8kwC/Oq6KDzxgjhaE/NTdAj
	 8x2ugZmlZhnW0ObpYO2NinNuqCOLnUYbqoOs+2TdUHxf5261XmibBKcxlMMiWT8v2gu87
	 RNAATRNmCObNAXraDaU1smhC6D4V5L6clyWBG16FW8IAKNv1BcTbfI0Md4XPK+eOt+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=GdYjun+ir64EdXqcZidFlUVCp8VDFd3V0EbMViH7Z2M=;
	b=LfMgZWZeshbKI54ssXLEF4jrbiKozJMc9cO6lHXcL6TDGmLeFsWZ+Ekbo5BoPZnoPUzC
	 ZPOSFK11mWTVgLCJw3R31EC45HCAGfm9pLvJgdpvrMt2lPiu4l0npxxg8bwv59iQublag
	 iOES+ojRv4QCJsoLHfZM2hBgDmso0GuV4sMSJc5Nw0iy/jGRUsvocvnAG+G321bjlcTKJ
	 abR3oj+OD0LlJScEnAdgpfgP5Lhi0hiF3PGqJ6h1fCeCW81WujEvzDOn3pI6EWCO1dpJw
	 3DHOmRr528XV50nS4rJl8UkKFhM540eF7zNbQ6Kk6duGdrTfwqabdLcKPAqqd4KFBjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FhSimmKQ;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49970606A337
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 13:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49970606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FhSimmKQ
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so14377065e9.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795009911; x=1795614711; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GdYjun+ir64EdXqcZidFlUVCp8VDFd3V0EbMViH7Z2M=;
        b=FhSimmKQk+9xaAJLsGe6wweNZgJKEn20mxhnNmEZ2n1WzVfq6fxpNehYKmyXCMIQP+
         ISIXYUSMtttMUZhi16+tqYXiViPcMYK7L8UfPfbikWkPPiOvMC0BiMjCJPMmyxChAtQ4
         Zb9qbyVHeAaPiD1PjpPTB0J1sSuOzjg027w+KsIC2QPh6duB/VEBUxegSTPJXV0YFpBM
         jlK/RqpCt8h60BFHaaRtTmH3i54NNhPeBK39u4EJ9thKoAuRl//AYCm/JPGrD7F9b2/3
         t5Ne66aeFMDetOwiHzJzK8CBQIc14bj9fs7TWdOXrVvw90n+KY+SDA368Bv6lrahVQ2F
         /xDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009911; x=1795614711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GdYjun+ir64EdXqcZidFlUVCp8VDFd3V0EbMViH7Z2M=;
        b=IPLXxoskzAUqDxJ8SNwZ0cIli7/XrGr62aZ9v7bTpD5JI3Ut9j34fP9ztugP72MEGU
         vvdiS051rEUiucScUl/bBs69hMhYUKC4lnkF9LMY/nBE6vQffETcnJzj2UAYQxwyZA8j
         5FvOu+46bncErR+Z8QDdkS5syPQyN2lvGQx/0M58ZbXC+A1UQe9VgA+fC61whUFNXRFz
         hD9sVzXGT3HnsjSfoEiqXoekJXUFVZphz9Py3jDhC2Lu3LknEvgPEse/TAAANQctj2Zz
         /Fko/iX1OS6a2M15uMui6WenbpasSsf35M9xrvfVLnwOqvqcY7sIrAV+sWHrKMqWglu+
         YHpg==
X-Forwarded-Encrypted: i=1; AL+hErFUyefCsTqzCAwsR5KOXhbNv/D3N7vbAWHZy3wZgs2P9GhNA6bfHNGpFy0L+XoGomxx2Wzmjlvd1a/N@vger.kernel.org
X-Gm-Message-State: APuU4Z/CwxZhMPO5/836BaWDUXbRpGwItPyzwN3qeD9LC5qd5me+IpyC
	XRXaszBfD5BvxILOj/Quy+8LTKOC+9WCaIV9zuG3ufK+saLSQC/giogWveRmNnYfrmI=
X-Gm-Gg: AYBFou3AAPNoBQYvDEExS0lHmERPtskxkJHxj2MkV1zXeHHCLjxY6E0aNyLCxiwU/Mm
	Ugc02KJf2BWyYNE/1OvF5RLjiSuUAk942XvGF9rFkkl05snB9WxSka+0oL0Rt3Oi8BLVayCqKpF
	yXob+WUBTYue4FK79a8oqs7yEzUh4X5rtqxRod2RKm8kLVxv0r8JeaNPxGgxLI+NFH9pKIh4Ie1
	pW3qf2WU94zTEEi0BLRrG2m8fu+wEucNq0/62weuIlkohF5zhrrI3STrUW5LnxkPjj+D0c2wLwj
	5K3WEZ5d5MLnroFD9PfRRnGpcZIuTsCIN/dhQYtNGSqhrgv2CD0rsqIOMT4PDONnMw3WpHSAeo8
	MFd1awtBVdN7RqYbSVWTQpCfV3Dj5QJ0ftp3NerhU0bZtbt1TEwwhMocdOw+M3E4YyGrby/8IUW
	4/oy2rgp95FuwhICZJ/FPSgDorWZBSG5CCrUbr2KoyR4x31rGxFpI7p6RbkQD+rH2qoPPsU0HYY
	ekcX89iLY2ElcgUdmx1gj6DpMx52yuEw+LJh9/qyt1ODMEuKia3h+H0v+ppdrnznzjhbRsTaCPG
	MxljK8zTWO93Dovx/wKNgKXIcR7C20C/o+HO/LYuNDqNzneC9Ja+FVsaZeRp1AjiJTI0pXpJnhP
	3cWRgd6k1RkKHSV70WxYqwQQ=
X-Received: by 2002:a05:600d:82e8:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4bb7da18d83mr47018785e9.9.1795009910482;
        Wed, 18 Nov 2026 05:51:50 -0800 (PST)
Received: from [127.0.1.1] ([2a02:c7c:5e34:8000:80a3:e955:3785:90b3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78422d2dsm208544775e9.10.2026.11.18.05.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:51:50 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 18 Nov 2026 13:51:45 +0000
Subject: [PATCH v2 1/3] dt-bindings: thermal: gs101-tmu: add Exynos850
 compatible
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-acpm-tmu-e850-support-v2-1-19848c0d97e5@linaro.org>
References: <20261118-acpm-tmu-e850-support-v2-0-19848c0d97e5@linaro.org>
In-Reply-To: <20261118-acpm-tmu-e850-support-v2-0-19848c0d97e5@linaro.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mateusz Majewski <m.majewski2@samsung.com>, 
 Thomas Turner <tturner@lineageos.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Document the `samsung,exynos850-tmu-top` compatible string for the
Exynos850 SoC.

Unlike the GS101, where the ACPM firmware handles most of the TMU
initialization and threshold configuration, the Exynos850 firmware
implements a significantly smaller subset of TMU IPC commands.
Consequently, the Application Processor requires broader direct
MMIO access to initialize the thermal unit, configure thresholds,
clear interrupts and collect calibration data.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../bindings/thermal/google,gs101-tmu-top.yaml     | 26 +++++++++++++++-------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
index 75560ebca48d..bea208cd4619 100644
--- a/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
+++ b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
@@ -15,17 +15,27 @@ description:
   both direct register-level access and firmware-mediated management
   via the ACPM (Alive Clock and Power Manager) firmware.
 
-  On these platforms, the hardware is managed in a hybrid fashion. The
-  Application Processor (AP) maintains direct memory-mapped access
-  exclusively to the interrupt pending registers to identify thermal
-  events. All other functional aspects - including sensor
-  initialization, threshold configuration, and temperature acquisition
-  - are handled by the ACPM firmware. The AP coordinates these
-  operations through the ACPM IPC protocol.
+  On these platforms, the hardware is managed in a hybrid fashion, though
+  the distribution of responsibilities between the Application Processor
+  (AP) and the ACPM firmware varies by SoC.
+
+  On the GS101, the AP maintains direct memory-mapped access exclusively
+  to the interrupt pending registers to identify thermal events. All other
+  functional aspects - including sensor initialization, threshold
+  configuration, and temperature acquisition - are handled by the ACPM
+  firmware. The AP coordinates these operations through the ACPM IPC protocol.
+
+  On the Exynos850, the ACPM firmware implements a smaller subset of TMU IPC
+  commands (mainly temperature querying, basic TMU initialization, and power
+  state management). Consequently, the AP is responsible for register-level
+  access to initialize the thermal unit, configure thresholds and handle
+  interrupts via MMIO.
 
 properties:
   compatible:
-    const: google,gs101-tmu-top
+    enum:
+      - google,gs101-tmu-top
+      - samsung,exynos850-tmu-top
 
   reg:
     maxItems: 1

-- 
2.53.0

