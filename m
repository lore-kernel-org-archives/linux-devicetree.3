Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9762937DEA8
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 15:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792335634; cv=none; b=s129vIkqJbSWMBIxIouKu+MR2hy1k2zZt9iQFg35VNyuEpLNIK+hAHx5rA3Y5tvFpr25HLwqBD7p8AofOjqoanP5K4e+nHS01+ooXyT2eWO8FouG0Y6DJ9wdlFmBu8+9UM1zUZNhBD+xcfwyp0nvbQ8Big1Mb6votoaxBjll69Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792335634; c=relaxed/simple;
	bh=ORYIe/QxPViQ/7ybfElXZkv9izz1FVsJ4GctpV5r41k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iSx+A21ud5UwAicogb0wmKaQxrjuWf5uYqhbSzKaoZ5CO/JbxJwih2lglVkVLMK+jdjd8g0/yu+hCmcQoh4dPpXQYToBBnO7Gyy1L9QyjF2Vi4hH0PYV3bQp2AQyDBmg7//As/V2tD/bRmzLP99X6gDjKvP+i8w80XKCG8ZLpZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IROAdDmq; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IROAdDmq"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49e73611928so13948005e9.1
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 08:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792335632; x=1792940432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IibueGhEEmNd2+d81oLiHRI9L7xBk11xjq6MNbG7ers=;
        b=IROAdDmq2vTbFHvoLxt+T8c4XlsxhMaYDAmPF07EdowMHs9jKzn8j81PQEN4nkhap/
         rrbrP360Sdl2DT0CW15dhBTSzCWSQeBbhO/smFbeYnOkpNfk64enoubybHLcwYn7+/T/
         31Br2DtBA7C/6OkoAijuyRPm3A21y4i0XhhdSRo4OiYzqai6D/C6YYz0p2yhYOJAy32N
         yFyY8yUSMSPMi8eGmY967spoi4SlSnylyApusM0uypbToNFd0qyV+5jQlAfdc1/b+Cbf
         yVcVJfQpWY5Egq+OkqrWAnXJJgWno1ArPtJwl+YL0u6KH+z2OSsCyKQVPaU7z7+lFDxl
         GxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792335632; x=1792940432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IibueGhEEmNd2+d81oLiHRI9L7xBk11xjq6MNbG7ers=;
        b=n7+yV37TPuGtWoTjbbEyiF5xN3qgghzFa0KBjaF91MQCc9TXn7sVrWEqwHKSMBv1Ck
         +C9ZfyIayx43uGwBPmQMoArDrye3Qd4VZHsyy/0ovgg7yNfuENEBVWTZaeOEgR2SEpOG
         SRJbLXACvk2MZt9culAuz4AUrZISe45yypZRXBoXffx7Fa2rZyYUlLdA9rV81BjKeJVL
         QZHJMcu6IVtQJDaROxFlhaEfVPrnGhY5gxCHEoQwDr7NNIl5Ei2rCPIglxhkGUkKqlkw
         lfFW+sh4wNSVaXEVD8FsH7HuQ0yq6A3Wdj4hiuBtqMYEbipKd9RoIfADWSITl/KmmRlO
         QShQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOxEo9SF1Z0T8pmJNjIWtUZrzgvFu1ZjGDNUZmI+tyMvf9CYjdKUMnQOp2mo2DVITHboUIKya5MEFH@vger.kernel.org
X-Gm-Message-State: AFq9FYLuBSkjFZSZFIpEXOZcadUkkQKNxmCGsF/ZG94XqNUlpsQaN6XP
	dnM8+bMXXr1VlJCIOplPGXgyFYhSiXCUNGPJYP1MMesbRGdNs3tqN32V
X-Gm-Gg: AYBFou2TcoNSlD625O+r+cSRMUA/C2BxaYYqvCbrsn3xsKNZB0QYH3HLPOa+7MKP9y6
	N0302Q7+aV1NTEwWbRNgvPEXppdIDha+UjKNCw7ZIF6pDacblL1M2pgtbL0YcCIPPwsgWh9omf1
	9gl8ypplojk47ntj/N4S2mQhGwV5JIgOtjUDgudyo4AFXKWEcUX/Nf+ouUjIpVoG6VvcZ4SgS39
	MODtZpKk9LZk2ZicWxAFopDaeUslrwjWkkKujgJQ851HjG/gNDt1aRm1JGk6dyW8Nzw6y9I+9DW
	frJM0PkHdYjbAdJz/NWU/ERzvWG0mdosPUNJAHDaCjfiirb/RK9S6AZIocFKRjoaCuoq1CG9Fcm
	clTN4sKI5+V2SbkSLXHeO+yM7tc6Hu7xXswUywTfCTgetE/50vo2Ieb+bvRTvvvmbO7IXzeUvIk
	oejoIHIxe+v/awKIwSBD/YKE0QaQZNjZMB9njXFrct3Pn0dnkT2tdGZnFG1oCP+/w23qZcBPu71
	YvLZNARvhqXtaADlrtoodYlNO4c9IqGssWs1u+4qZVfLA==
X-Received: by 2002:a05:600c:5254:b0:4a1:e57b:667e with SMTP id 5b1f17b1804b1-4a1e57b68c7mr27470435e9.4.1792335631733;
        Sun, 18 Oct 2026 08:00:31 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ad6245sm212868925e9.3.2026.10.18.08.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 08:00:30 -0700 (PDT)
From: Sander Speetjens <sander.speetjens@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	sander.speetjens@gmail.com,
	pbrobinson@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v13 1/3] dt-bindings: rtc: Add missing type to trickle-voltage-millivolt
Date: Sun, 18 Oct 2026 17:00:26 +0200
Message-ID: <20261018150028.1047172-2-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018150028.1047172-1-sander.speetjens@gmail.com>
References: <20261018150028.1047172-1-sander.speetjens@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The trickle-voltage-millivolt property had no associated type.
-millivolt is not a default property unit suffix, so the schema does
not automatically infer uint32. Explicitly reference the uint32
definition so the type is correctly declared.

Suggested-by: Rob Herring <robh@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
V12 -> V13: No changes

V12: https://lore.kernel.org/linux-rtc/20261018143712.1040152-1-sander.speetjens@gmail.com

 Documentation/devicetree/bindings/rtc/rtc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rtc/rtc.yaml b/Documentation/devicetree/bindings/rtc/rtc.yaml
index efb66df82782..e46d50b1063e 100644
--- a/Documentation/devicetree/bindings/rtc/rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/rtc.yaml
@@ -51,6 +51,7 @@ properties:
       if trickle charger should be enabled.
 
   trickle-voltage-millivolt:
+    $ref: /schemas/types.yaml#/definitions/uint32
     description:
       Selected voltage for trickle charger. Should be given
       if trickle charger should be enabled and the trickle voltage is different
-- 
2.56.0

