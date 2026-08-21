Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C83139A815
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 13:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787320649; cv=none; b=q3GMJw1NNvQAQo+Cj47OPPpUmA2E606avTgj48DKulZqv25ZzCDYEJdhiJKzeqycDLsH+ubLLmL99x3g0W0CPeI/cL0FMROk8CxCPdsy0rxPp00EiBgwDjNhO+2mGCtchLKMOOQulCyY1dNvbqxUXiuCdPpVbWujff+vfljTR6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787320649; c=relaxed/simple;
	bh=gBBs6/Ia6sSV95Cqo1e4c2MfPAgzo8DPkk69LA9oeJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nVF992LDFMiYxJXKW0F/WyuTfEI7iTnDzNW3MA1WZVvFFUU0tlKT5D5Vbn/hXlSQSz6A36qfcLVXmMiSlY3Dq1J6vLo3CX5fWqG1H40nvuT8eIwYs1YQn8FdszxYYdTij3yllNHPc2sz4jnvg+9B7DBcgLm5hreFHklayNTVsxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k0DBEXGs; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k0DBEXGs"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so1061755a12.3
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 06:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787320648; x=1787925448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2YJ6zhi/Ow6W3tSjF84cEQa+6scy6/f5V+3PwsGj9A4=;
        b=k0DBEXGsNvnzXh4ighT4wkhQELGDx5KC/Z4omO7zYMxWP4ssSt4ZatUjqpS08Lol57
         O/kd5mUm9iAmpBQvhL863tqvahR2xEVsJMvKOtguGe70pFLob7vuhbpgIZrPEqR0dbwr
         5CsDBljk9VnAiorMrK98DA4anaDD5kRHskHiqj3W6NJ1hOYOtSs6e3lUZrGdLoI23KJw
         VLu3bQmBMulNLLmdIF471xa4t+MBeImCY9UlE2+kp3EK8uLamDZ0vOhsCpXbxWnNtycu
         2dMPcA0imK64YIReNHi0fhm98757ogczBq6QQqpdrqaMtqLp+UqZAsWbvsefQIUIZGYn
         A/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320648; x=1787925448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2YJ6zhi/Ow6W3tSjF84cEQa+6scy6/f5V+3PwsGj9A4=;
        b=hJZmyKogOcxGm+oh1mSiojOPdsJ9AhwKETM5nPCvHlnSFkxdYN5mUKTSxQR7rswsKH
         OhCwkugBXGOmQGNSoMSAH7En0vZZXalFTiG0anFqZzMApIHOe0uGHFzIbvUzCzG41vfv
         TcTwUyabcy2z+F9GfWzdsmHhBuIpiaBqaeKBQcJMZTVg85um81V6z9YmRdoXiy92AlXV
         srg2GRCnVf6BYyne96Tdij8Narc7BPEVi30GCWrdtDZApWN6Z7pIBSR3/f43VHZD7MVk
         x8iaM9kJ1YwkwXts+SCpFpzjBi7M3khtFOcvh9MtbMEh5VZXPkt4ee6YGy3Kh22zMWMj
         iXhw==
X-Forwarded-Encrypted: i=1; AHgh+RpA2KeLbvrP4uMYM/YC7mW8wYgow0/2GGGRFHB5p/4CxISbn6R21ED0brdXMjRyrOZuh6x452uNHl0F@vger.kernel.org
X-Gm-Message-State: AFuF++ntXgDFg3AE74ycK+i3RYtzpQKDD5z8nkmv1JlQ5TQqry/uYTg2
	LlT4GDVN/q8/TT5TXfuONHiGfhdTphWKp6MF9Kr0WrCsLPoG+T4RBEjZ
X-Gm-Gg: AR+sD12iMnzRIHEXA4iehGGUXztDbHv7WdPq9T54EDj1IHJjDIuzTcd8n/mfgDaJg4k
	qpLDa8YyqUSs1CD8EztWkqN8g3VYBt4Tv9GnavCcTbK3WUsr8aat19EA951AYnRtYlpaCQgIMW9
	MkbP588OtvrTEWjPFimAQ4BwUHIoOaz1vow7rahJQwBUJtty7cpo6ZOzFoBeRteJc+yGReTufoB
	4UygdLNLX7mvq/nzrjgS+atoU9MOUJkM0VcBjxdJmTfQk3xATc7nX6S+ZJ9r1DWLCRxDC6C2jbD
	JHqsB0mojSGTH/xLA/TQxhbnxAwGc7Cw69WaFww9i4ugaxbGf+moRj05Pv1eb9IwvzvKA3dSWqK
	hqmd/xqmhD6u23Yssp+wZBLtNtlsOx4oaO/J20HCGBv+75PqnNcndWLeulLToTyixVkz64dv5+z
	EeGSTvNfPc2KBam+sbTqFzWG68p238lfQ2bvq74KUFFxp0cjN94Ppy+20TKsgnRw7aAXR2rjRBu
	lrbxOD1nzgWYKF+N2OjBJdTTuuAEbne0lXlAihWdim7za9+o2+dapRF6acmWokbIigkOBlP+pPl
	A7VABRI+hA==
X-Received: by 2002:a17:90b:2687:b0:38f:26c7:165e with SMTP id 98e67ed59e1d1-395c383cae0mr13124474a91.9.1787320647529;
        Fri, 21 Aug 2026 06:57:27 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:773c:1c8c:24ea:eff6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327d01ff056sm19972277eec.19.2026.08.21.06.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 06:57:27 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 09/17] rtc: rzn1: Use pm_runtime_put_sync()
Date: Fri, 21 Aug 2026 14:56:00 +0100
Message-ID: <20260821135608.275233-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821135608.275233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260821135608.275233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

pm_runtime_put() may trigger the idle check after pm_runtime_disable()
is run as part of devm_pm_runtime_enable()'s cleanup action, leaving
runtime PM active.

Use pm_runtime_put_sync() to ensure the idle check runs synchronously.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- Updated commit message
- Moved the patch prior to the patch that replaces the .remove() callback
  with devm_add_action_or_reset() 

v3->v4:
- New patch
---
 drivers/rtc/rtc-rzn1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index a7f22a491d61..6a434cb418cd 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -492,7 +492,7 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	return 0;
 
 dis_runtime_pm:
-	pm_runtime_put(&pdev->dev);
+	pm_runtime_put_sync(&pdev->dev);
 
 	return ret;
 }
@@ -504,7 +504,7 @@ static void rzn1_rtc_remove(struct platform_device *pdev)
 	/* Disable all interrupts */
 	writel(0, rtc->base + RZN1_RTC_CTL1);
 
-	pm_runtime_put(&pdev->dev);
+	pm_runtime_put_sync(&pdev->dev);
 }
 
 static const struct of_device_id rzn1_rtc_of_match[] = {
-- 
2.43.0

