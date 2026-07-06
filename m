Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBBF3C1090
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 17:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360312; cv=none; b=sp+8iRRUJCL+rHdIoF9UKyUpP2/LajQHS8jsaK1mm2Wm1RGCZKEuUpvjsTgV27bUhXjSslpvAR+a9+Cu51Z9COOF51SY0ih8ZaOZWrBRMzsxB4mVNw6pu9YCxH33CeERnsS1Ds30A0yOhrH2nuWZgMOFOAV+pAsOHGBZ2Ejs2WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360312; c=relaxed/simple;
	bh=YQQ0swAPlNYOtdSZVBJo7dYA9mdh1pilQAEGfbWdZX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dmvQER8jdEHJBCwK3zFJ4q5Z785istKrGGRMNQeArJmCGcaTfLTpzgMx5itQlNCSzwoJs7HHObQzcGEBP9SGYEP2MEo15A5YY93AHVmtKiKLUsuT1rzLxo+KepUsATh619m5AOnVw+6NkmAAre8mXgyQC5npv9oyrqjrVRjBgqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ANT1YiiB; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANT1YiiB"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so16468245e9.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783360309; x=1783965109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HmxkW83CI8zC2ie0tepZoqWs3zkGn93Bzp7pmV6Q/wI=;
        b=ANT1YiiB7h5Lev2+khVHRrYkZnBrcNOFPSYPOPl5cjasSdfYe9QdMD0ZqDqiYZeIk7
         0Fu5FyBVkLhfLlM/JvfgHkbrd+yQr02ek2I5Fkftaaxkdbweiu14ttOOymHbUyiymX1M
         6Ee4lyvaGNFRcU0uUL1bk4Kdl+hgCpwQoJZBRWtMUVm49zU5x5OkPJUZ4XnmQzHJ7F/J
         11+7cOh/QoT9Te9RvUHlv5+ilYEUXzVl8kkPJZ5BfUW25h1YKuAt4Mkj6mSEKAt6deAQ
         eiyXIidGjEpQxw4ex8upbWm2DVb5wQHFcYZMKGLJ38G6DD0yx6S9wMp+DmbEt+CFf7cO
         R2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360309; x=1783965109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HmxkW83CI8zC2ie0tepZoqWs3zkGn93Bzp7pmV6Q/wI=;
        b=Xs0XsDeZsHVLw3tNlarhaUfflQGyI1plYuLMOx9vajGaNpvjDrcuWXLhk7wPimEcjk
         Jfz7DrKgORfVTaOpvBkDxh5EtM6lO3p+3cNUTuqs5kI0o8kKF4LupztgMEKCZoxQw5p6
         8y6m9s/l6GKIxC5R+4QACA50e+gzPOEUnxTpjhODtrdPgjQ848x4xbA+j5XYE7Avst8B
         KzkShtyLSOZJK8LcOIqZb13k4YQ1FCZ8/6wAGC7LK5108dgzufv8EoXkofz7UHZmDaUe
         WT9sc51lr+WsFDjpdIu7+jsfar6hT5ChyaUOZSByzkfP/dj54LXFrHupiK2RqwxcM8ev
         StHw==
X-Forwarded-Encrypted: i=1; AHgh+RrgedRdepHHbJ8bNKRG3gxnZ2+hVpIw+nPQovTyJN5DQy9O0VUD4G1FaKLzbNHEMPFO/doeSO1dCV68@vger.kernel.org
X-Gm-Message-State: AOJu0YyyyBUhMvIFvIxlba292XlfAe2DrvrzMORmg+tmxNSDsym0Smto
	f1ZKodKH0l6O/jv2QYvCO1Vr3c9obvUIfg+GT0GP6VqM1pCLwYK6UxFe
X-Gm-Gg: AfdE7cl28UVjJFPMfu9lZ2Y7z1Y3fgOoVBQi4VxFPNtwPEs6DACj2U+7Oa0HLNiLjUw
	xaqhwxU4n5nil/hEPyYZnHFvLiCwrIwiu75QjdY5c6H7UEqp5lyEahVE1J9SDZcCcxwvPHcUVGq
	Ir64JxXILF//J1kaySMCWADKsYyCTmS8DYz5CGAXZ6m1Bjt2+Q6sJgw3Kkbxpp/PLegjFj8ih/R
	3WQEVaeHNZLfr98mYwoFploO/JtcMASgqCuFHGXcbXbPFVCkJbgdaz1f+0P1Q4p4JEmILRZTJ10
	9Mu77iWJ1nmjkQr0+g7MYW7WT+aeijW8LWcRg7p6AwAsg4d9MHkFLFsFNvo/JrYVEI7vlgLJ7TM
	aWqGh+VOpdMo9WTauUuNENQosRemvdaYC6ZcmJ2IoXjBR9kr7MaNBit/46sCGHDrxoyiO5cEK92
	/qQzWp1t2yjPwEJr3XlWafQXdN+XG0kQVeh+O2hmVPfyHFxeFedQtn+uMLMfWqVSAdI0r1wo1fP
	r8BDcXejCs5ps0nMBuxs9EJWVnwoZhSEWblZw==
X-Received: by 2002:a05:600c:a011:b0:493:a8eb:5145 with SMTP id 5b1f17b1804b1-493df063da1mr19180125e9.4.1783360308698;
        Mon, 06 Jul 2026 10:51:48 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8e02:886d:c345:c5e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0078d49sm1263145e9.0.2026.07.06.10.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:51:48 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 02/12] rtc: rzn1: Handle EPROBE_DEFER for optional pps interrupt
Date: Mon,  6 Jul 2026 18:51:28 +0100
Message-ID: <20260706175138.12587-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Check for -EPROBE_DEFER from platform_get_irq_byname_optional() and handle
the deferred probe request properly.

Although the "pps" interrupt is optional, an error code of -EPROBE_DEFER
indicates that the interrupt subsystem is not yet ready. Intercept this
specific error condition, assign it to the return value, and jump to the
dis_runtime_pm label to avoid ignoring a valid probe deferral.

Fixes: eea7791e00f33 ("rtc: rzn1: implement one-second accuracy for alarms")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- No changes

v1->v2:
- No changes
---
 drivers/rtc/rtc-rzn1.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 305f10a8a85b..aa27ad7f5941 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -464,6 +464,10 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq_byname_optional(pdev, "pps");
+	if (irq == -EPROBE_DEFER) {
+		ret = irq;
+		goto dis_runtime_pm;
+	}
 	if (irq >= 0)
 		ret = devm_request_irq(&pdev->dev, irq, rzn1_rtc_1s_irq, 0, "RZN1 RTC 1s", rtc);
 
-- 
2.54.0

