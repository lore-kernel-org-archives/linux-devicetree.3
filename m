Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D914C3A9629
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 21:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780435672; cv=none; b=ZZ2t5PO/9iVZRgrnqKSDar0nSbmutYk6GPNOjqM95PptUNFdcbe4mBHeTlT20FuKV7xAyY8xGgJ/E2P3v0J0f/dZ9jLg/wxc1z03Unu8TZ4rmycss2CLr1xTqaTHpO1hRpas2ULMQpejemcWMC/VGFVmCChEYifOVK9nxE5rBZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780435672; c=relaxed/simple;
	bh=dQnacLOtfh1x/EVTAVwP8evevCXXsKE9KJDE9DiR4UA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qvANRoQjnXKBQkbB1+HFX+cPA1aAWtlQWUjD206+BlWdq9mHzSd9BaJPU5mqdHukztNeJRKVC/qUVmnuyUDNnpGEB6c1VwKbLeuRnusxFIEWeNMqeEqNHqHm6s1EX4q4VqEcp19lBEhVX8Wrq/3q47dZTZBL8lMw1wEFvIGjG3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=empjmpKM; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="empjmpKM"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4863eae453eso785933b6e.1
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 14:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780435670; x=1781040470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgs1gTYKZ+euqFobW4W1LJ9utvsV9nn5CKlGcDBeRcM=;
        b=empjmpKMambJad+JK09TLMXfPsNaG/J5STo7VGDzIW5FmcBfRlDUO9DwhMq3Q5YUfs
         UMHt5ztwoaNmbQoQa9SRWA1faqNuD0Mdszt4quVtjalKTCZcmiIgjvAMvzZi0tar7JGg
         SkkbB7k45elnN+u+2aoHxG/Na5dr635pRgeFNwC7DjvrH50yVPz/+NXxoE/lXQIVEIDF
         hzy8v8v4VQy7rWc3MQ1wCiaW7I7nccLIdDht4tmcm6NFTkqB9HiQ6dlLVhvYElXieKaD
         S/wkoh0cTR6qmPR3TKMfsl2X68RFSGSF7ZITkDybsFDI8DZ5ZMaqqNmr31+xZLcKLcXF
         7N+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780435670; x=1781040470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kgs1gTYKZ+euqFobW4W1LJ9utvsV9nn5CKlGcDBeRcM=;
        b=XBCJGni0C/sZMKLxnf/GpgtbDfzveuqVtc4SckG5L/GgG//G9gntSP3At9UxRdypgC
         m3Pp8uhYFkDFO+1beP/LqE8pakEbSOt61gxiLEBlq7RRiSmENhUH0bVgoct9CunykKJy
         qHmbFxhrGNkvhoIY1RJe45mWssKQUVMceWqu2scl3ErNgjSqFdbrNzmgifow9grbQK7A
         75Omje478mBWz+eVcBk2YSmQ6ADV8U/1gJBY3TqNRWe6fj4PP3GtHbSuiPMGWYxrMacS
         zX/qT00yF5nSKDI/Bf9N7T+TRrMpCLkY6S5A5otKjLXg6AKtigrR140idblUGjrpx9Rg
         Ur0g==
X-Gm-Message-State: AOJu0YwB0SUiNR6QYcucvzZ9rbVDoIkkeYpZ39gcu5scQ/hBOD30E2ap
	5/nlI063iBXYPZo+0HT0p8Zam3Ea6+7KI9WDZ5bjp2tAinirqCkQlDMs
X-Gm-Gg: Acq92OFmZjLrgedjX50w2HLhkwGZZ9ge8r+jwtfN+eiDeuc3uWbAlHIjn4KjtxC4hKs
	kG9BuTH7rlhK9K4s5QZvMds+8QfAl3SZzYLnZpfLaXpuuk0OkLDVtl1ZrhA3nFCLvd2WgAgOqsi
	xg1S6B37QvNAhLWIFtAHziZxN5fT92ry6kwqZRLl+T+PvH6JXDTAUNFAwYprxIgKKgplgxPHOW+
	JVNfZvXS42NGx+TSdNySyrcGJypgF9yClU/LcQ4AyjOYA/iBMkGuEy2Ep7fOu3hYc0RILTdzysu
	fAx/4BLT9ODUJVb9JNsadJjeF8ZL6KiFtm5F8gNF3UW+2BMQ7XpgCCAI7RxyhSNwA+q5SVDMTfs
	iN8ZAlz5Cv68jg8F4KTVVvhXZiaAafGAJkCP3ULfufZAfgHl+j4g6kpMv07ncXMLJg87ypCUrVo
	9+AhxITppYaxStHJ9T7UJWhtpxITJM8tM=
X-Received: by 2002:a05:6808:13c8:b0:47b:c2a2:1c89 with SMTP id 5614622812f47-4865aad5524mr450201b6e.21.1780435669969;
        Tue, 02 Jun 2026 14:27:49 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b5a53bcsm216722b6e.3.2026.06.02.14.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 14:27:49 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	xsf@rock-chips.com,
	sre@kernel.org,
	simona@ffwll.ch,
	airlied@gmail.com,
	tzimmermann@suse.de,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	jesszhan0024@gmail.com,
	neil.armstrong@linaro.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH V4 5/6] dt-bindings: arm: rockchip: Add Anbernic RG Vita-Pro
Date: Tue,  2 Jun 2026 16:25:11 -0500
Message-ID: <20260602212512.418166-6-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602212512.418166-1-macroalpha82@gmail.com>
References: <20260602212512.418166-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add compatible string for the Anbernic RG Vita-Pro.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..b8babe9d3a26 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -66,6 +66,12 @@ properties:
               - anbernic,rg-ds
           - const: rockchip,rk3568
 
+      - description: Anbernic RK3576 Handheld Gaming Console
+        items:
+          - enum:
+              - anbernic,rg-vita-pro
+          - const: rockchip,rk3576
+
       - description: Ariaboard Photonicat
         items:
           - const: ariaboard,photonicat
-- 
2.43.0

