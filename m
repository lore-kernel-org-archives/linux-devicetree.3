Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F22B3126DA
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 22:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780611031; cv=none; b=TsoBNAVABe93qCwiacK16kBQqRMZAKwJWHYpWl2uNwXnPuKzwBtmLXYpbxRnCnOFzRvuWgFE77aoSfPccnCNA91tc+B4G+5mLG4Zu105VXyOFlznRCFFFPIdauVknd3PGn+x5QQTGzQdi1WAvgF3CMuJiOw9s689kXlJomqBRsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780611031; c=relaxed/simple;
	bh=dQnacLOtfh1x/EVTAVwP8evevCXXsKE9KJDE9DiR4UA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t98ALYOriAk4na5Cad8aCC9fNrMRUMiyuiZmfnnI1DeTuHe+ldPDeNVYfFfEX1v3fKnhQXxmOivHHBTWr7PH0ZPmZ1eWbqILLTIPH+e+0V7hqZWrHBFP+nsUNGCR9X1zVuojvHsgM/a7x3H0y3XDdP6WCph37XscmJU8siUz5mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h9thcaLd; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h9thcaLd"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-43d2ff651f2so1185430fac.2
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 15:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780611029; x=1781215829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgs1gTYKZ+euqFobW4W1LJ9utvsV9nn5CKlGcDBeRcM=;
        b=h9thcaLdjf2sYq51uLO5/5tlOecMIQHtWEfeSOIRDO1vzxunzdtN2977lDrcmOc94b
         C5EUv8/WoBIWsVncNvxx1AKC6G/S5IzfUWDBNEIFPxDq88/6/M9FvktZae16GqO2ySYO
         4VCbF9ftPWqEe1TDGigfZuBABvwy37jscC5XmpUJjVs/OkyNFqY/aXb491sFZirrRKuV
         MkTaQsR2eX7GsQ3mKckohkGo8nbSM51vhMI/Xxfhd4KbCmVyD/PycYFXbYSZb+tuU8/v
         ocyRPM4RSNeGSrtNGE/cC+8GcB1zWBxEnw05SjI/bYiZYtRYbdZawJhMQ9LxJ65aCLew
         EZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780611029; x=1781215829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kgs1gTYKZ+euqFobW4W1LJ9utvsV9nn5CKlGcDBeRcM=;
        b=MO9Qr92UvzsUX+W8eyPj4zkczXUrzdfiGbQ2KczVgannIIefBvmdPaNmUXJ5C59WST
         FM8cDdiyDxk/1j8i1pFjMQdEOMmD0/j2ll3lARiL9ZCMhChms135hQV1RzhVmXK2RJl3
         rCTqagpD73qusj8HmppqYrlL/ZseSXehjWp3xyQ7icFFzoMIf10e88/mfHhOz50NGMJJ
         Aqdt9fD8LTDe5SxFZjstaP6AM8JXNrxJuywqzv+sYGVEQQGAMQlMtc7jRFcC8uuv2QZZ
         14oGzdFfHtfnv4GGejxl99dXSsOplphdetn5euUmKlC5BzIlhREJ6l77qS1Ly6ilbVrx
         dxJg==
X-Gm-Message-State: AOJu0YyY9lnC+ecq3dSUXx0M2P6Qv9Auui6yEHBLtyZDcQYoTznl/O9F
	xwhERG/lFjoqftp5FoakVSpBgjjwuKdzEE/SuGXnthB/F+o6gypOSJX9jFzn1OUr
X-Gm-Gg: Acq92OHaOfREkQvNAHzALBYVwNZVMnBVR1BYl1AZuACRpO3Rd29wMGj6vuAkQjXX9/+
	IRYP/F60PBKP9uViyeJckpjVVpKPNUNPqaohnicHrdRhTXGW4ipKvVIml8Snpvc2IgKKj6BINmN
	XAcjAf9EPPtn9SkFPArLL1aOLAEsEzKNXdrTXVqlPUUVC+5Il6BfUxra8CdrGSJPDpJM+Xab09C
	Avce1FvRU+XIsRpeaYuZPTdJDYty5rmG/xUXAet5lUk5+OxnEk8LVTXkrB5GfDb0LntPKFnUBx3
	F8hwCqKrW1FQVJJaPjEyRQtG6Z+bK3j+FPql9O8WBYA7/D9iEqZX2IMlZWtg0gQDTb55ZX1cyXN
	O2dj4vlEVI1sfpYacoEWnC0MINWMsdKMcnnAROVs46GuR7iEByVNh5kMKb/J2SxmZiEbQsc90ej
	Sb884ftDh2lK7xn4ZA670ihnUZz14kMe4=
X-Received: by 2002:a05:6870:f613:b0:439:b1e8:8a57 with SMTP id 586e51a60fabf-4413d95311cmr504827fac.28.1780611029293;
        Thu, 04 Jun 2026 15:10:29 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-440d84c0ce2sm6802987fac.16.2026.06.04.15.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 15:10:28 -0700 (PDT)
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
Subject: [PATCH V5 5/6] dt-bindings: arm: rockchip: Add Anbernic RG Vita-Pro
Date: Thu,  4 Jun 2026 17:08:00 -0500
Message-ID: <20260604220802.119107-6-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604220802.119107-1-macroalpha82@gmail.com>
References: <20260604220802.119107-1-macroalpha82@gmail.com>
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

