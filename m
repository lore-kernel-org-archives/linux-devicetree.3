Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8410647ECDD
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 16:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783529986; cv=none; b=S0Ha5u3zVhKTEh1b4+0ou5j2nUMsPWRyJgpkgaw3fOWDsx7wwb7aW+PqdVb+ae4lwxJeY8Av1jekdrEIsyd2rwHIRcai3WBE5x27jg5G5DNBH9h8y1k7FSxIirkJK8+htnMl2sjzAvdazPSCl0Pl6bezR51dJE0l9KrBPznrXU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783529986; c=relaxed/simple;
	bh=S31RcA/iT73E2rlScRcBB8K94r3tzTju+wWFc1ueh9E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K48KciMHhlbcwZuM+iM/kFGRz8hC2MFFUareFu9p9gSGOCqoKk5s6doIObVFcJCfZ7lXWAUa+WFjG5iYgOmI79OfoIqIbA0q47/fO6MMCREIk3Yi3Yde0+SDcvV1ByLBEuWMdgpve+uSypS2v+hUJVio3Wk0lK2BNEQyfFfVhy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qeRMhRVo; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qeRMhRVo"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493c55d5c7aso9554655e9.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 09:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783529981; x=1784134781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k9A30rq3ztTZA8NjaSTuX8appAKxji9QAPEQZArsTJ4=;
        b=qeRMhRVo/teoJeqqjn37JVi+LfmACCEoj1BtW/6RROk3XzRy4TiJk/yNa9JogEcvAg
         3BnuMMwT0VmiGlJmntVDpq1E7ur7Es2J4IBaTPDicE71CUySufRlL/7Q29VJ/UnI8Obg
         mjNV7xKirEBavU+zjcr3mDLr2bnNqrPgC5vqGi9P4vRzvyeZVs7d5LViH5b108KfQ2jR
         rg3/7Zs5Rs5B0lxyNeXIVT0HTK1QtWkdz8sePQpgxPP5wDR7mxp+ARIy3Y0ZzJQIHuHx
         Lb8dL1fQgm6ZRTB7HwViV7joaJKTIlCZz2+qSsofXvLRxveSuo8gkcxl6bj2GabiG7mQ
         98pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783529981; x=1784134781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k9A30rq3ztTZA8NjaSTuX8appAKxji9QAPEQZArsTJ4=;
        b=YMeoswL7sPNhKPbENXKWbbe/PJMlWMPqSIz8lkfPzVNqiOtGEa/xQbBOm3JnCq6QMc
         1E5P6hhS5SgAJL4gSHlqU8+xCy0F+Vn6eG/1jTF6QYA6ok8GxUGqybXqZ5TR+gK/mNkn
         z541N2ZYphwpgMtWBGLN+y3ARjeGEEBuQNiJrjcIo8L9NHox9OpqPis20ZHIHwW8CWPa
         vDzxQXHPL0e+g/5tp4WPV50tkHDfWxWjER0VoSqHoUAdQmGhQENsv4Q6BpQO8YclBRqV
         Me1wRxs9ynK2ccqyixvpejJr2W4BtN++EoEGfvgDosp1Y2PzlEABJ46b+UDfLqsmTnCl
         yKcA==
X-Forwarded-Encrypted: i=1; AHgh+RoKlt7FAn1fE96Mz5KgM5PAqi3tgCs7WMKBeWS2dPXLAp4hFrFjiUgYnLhpA9IlJs/xebhSgqD8VgiA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9LJZcCL9MjwMQODhS8nEJTmKprjxBzw7ix9GGuJaJt+3M5WIA
	ld53VBVllv/rrp4KQ2GUDnD1H4nW6o5qOJmipwj77xQY1mmUZPnPAMUn
X-Gm-Gg: AfdE7cn6EiiKKjFHpeYwzbd1lgqw4uqiAUXxXL5G0vJ1G2H2F1bEJjjmkhdwL0GGaes
	mOePjXA95YDYmPnU/yZRIXQUP7+fKq7Qe7qrjF7Sn8XmlzAKXTUpOJIcu1KDP4fkyLD3eDcjkhN
	FoCk3FcUsXcOrDQtBjvEOGmKljCcMIW+haO4uGLqF6Ou6RF1xPnshkG7qZUMb76qSwzm0VuXHA9
	8ZReoZLCWjWnYeaeOJVHmzpq+NffehINhIqj7VBN/Qy5Fsp7nDbTQwEH5X+xEm+yJeTbA0ZAb+E
	xERfKtcg8Go7yOySM24F1hhiGLWJY1tmK6jUuzETlI5YDDSUzaht9wcl/Bpzbw7byArhCXDU9jI
	fKb/1KaG1nvO0aw47XVu8PQJd4uqF54Ct1mjWtCKbG2TnrVvcjvn9wS1XHaaFpvO7RH/yD75WJJ
	SweHeJ1DkoI920leJdjKMGdsco6zpsVkXB1w==
X-Received: by 2002:a05:600c:c1c8:10b0:493:c3c9:218c with SMTP id 5b1f17b1804b1-493e68cebf6mr29135245e9.30.1783529981380;
        Wed, 08 Jul 2026 09:59:41 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0faed92sm141201035e9.9.2026.07.08.09.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 09:59:40 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v8 1/4] arm64: dts: nuvoton: npcm845: Drop redundant timer clock-names
Date: Wed,  8 Jul 2026 19:59:26 +0300
Message-Id: <20260708165929.2233934-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260708165929.2233934-1-tmaimon77@gmail.com>
References: <20260708165929.2233934-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NPCM845 timer0 node references a single clock, but its
clock-names property is not described by the timer binding. Drop the
undocumented name so the DTS matches the binding.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index c781190b4..9e4fa2669 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -73,7 +73,6 @@ timer0: timer@8000 {
 				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x8000 0x1C>;
 				clocks = <&refclk>;
-				clock-names = "refclk";
 			};
 
 			serial0: serial@0 {
-- 
2.34.1

