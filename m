Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C153876A9
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 15:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777477516; cv=none; b=J/gNZsrv4XScqw1+095c8Xxzwnp6suBH50kUCdPogKJKPVt2cHFo/279qfm7XinFcn06F99tYg/U0uw/iJpbaE/55lSrpXgyVphvZJ7W9SKgRnzXrGvBVThzT8mWDqADMln+nIUX+Gc5F0L2FogBaBZ7eYomWBjKAUw389dHgRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777477516; c=relaxed/simple;
	bh=l8kRD5ODG3u9dxSb5dB9FFcWoeVxlb9OPaO2ROEPky0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fzbr8UUoKj/i+cXBPr3gozXRo4prd9P0PgkzZ7kZn1ysFN2f9cfTTurXwJBfgERF0tLJVhJZBxbERsZbwVvcODzptzIiQDQiy66oAkcUqJLgUceXcpj0Y7OFryd+7v7QXwL3tO/SpgOhcpmufKDFUXlSih111jwcU/lD6595Aqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GcRkYRbk; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GcRkYRbk"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12c8ccc7755so14016646c88.0
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 08:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777477515; x=1778082315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jduzi5OLB2O31wf93QrKoK394/ZZvQgqWTgaFnSSbog=;
        b=GcRkYRbkt4lTurrGXbFWrfVd/NrJenUtdyYnF3F/6OfPTajC+QF/c3A3TIrNM+/pJn
         /5HSkjqsPJEt8tvvICJy3OcOb31XVVwdVEYYASp3FTHZaZkTDz4PjoTIp/6G2lpalqz5
         KUyKTb1KvFuZRpEvv81lpLG1A6+CVtzrRHVWtmXILF+Elas3pSPJl22fwAO9NDIg5bTx
         geBl5wrtx98G0WPbVIIHUeL2HzIOwPxTqCBP5n3dAqsujLgrxdc+/KmrKm5JuxR0T9Fj
         cOPEIKuktV4Mwz/LQ7QW9Ks9/8q4GHw2epChCu1yVe/wOKOxcEH9ESGplPgmZofeCa93
         3hHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777477515; x=1778082315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jduzi5OLB2O31wf93QrKoK394/ZZvQgqWTgaFnSSbog=;
        b=jTcC6aLidVZGFRLRLOVnEAaiHcvmEtB86+tcpR/n6UAU5lPkM3wY5KyGbVBxq4QgsM
         qiPxo/D8MPwkvDYrXQIW9iEMPAqS/nFwhc6sZh9aLMbg9UOYC4gB9v1EYjzvL0sOdJ8F
         8/sCQMkybU8CQXsZaFD9QHUUVDX1H3oMihxZf37GDWfIWqp6sxx/IQz6XTl9IDLdbBNZ
         NI3v5VpAx2PduqgBAGTgFEDiTWoOXANNYAwrbXu+YfBHCUE3+m102AH04mtkf9f+6A/m
         9Sp4GeJABas2d3aCzYuJFbhGzYhSmZjdZSuQNc6HfTZGyemEdLYNB65l80o+pJWdrgjA
         gOmQ==
X-Forwarded-Encrypted: i=1; AFNElJ/RBbu/BlRYSi+Fk59DvpuiEvpOJb1gGxJGGGep2mPR2rcNRy6eVWJcME2Y3+6Y9GUj8nj2TM3uABXm@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9cNY54mgJNTlQNswFLxTe6Ai9rqn7XjQriqP/nVIlM24lpWTf
	ar1vxLuLtI4THamWixbsT/vlH0clE8ZjSv1Xu00l5HcCm3Az1CzZyQJy
X-Gm-Gg: AeBDietmbEbDjrLkv05sRzRNwYgCO8V9QYyn3N3bNgvoY6uxYzgkrFqTnxZ4wMqWAVI
	5H6qq14SJMksnxT0oJP7TZMwxYITfxN+7p8jtgpV8KsL0trvuZ4KDzTmFGVvXWLyn9Dl+azM2m4
	93cnQd7GUYqXyi1j9Qk9Nekg5ZosiYZROIIaVyY4aftj2ZdtGI1bHF/lix6+BwEmOF7sq1PCCen
	bh/VoN/ka5c1+ITEyZRqEYfScIQG+y99r7kGV5NFkf6i3c63fir5zkwYrFl34S6jDYRHD/Eujxp
	grIKwpPHfbNbQxx22AzpT3k/I1HhCUm8N0zfLo1R3rRQEGnDOjxGgWnSlZvp92cTxAeIIqBokt6
	moOq5H20XQr4NH7+Rdz3xKvTJ1fcPH28LXePLUoLtXyMQnBb2VqqDX1bsdPyGVoRvwGZZTDQ2sd
	Mo1Io4xnaZouACQkRo2C+dUcAHMmzmrsWGQC5jTBp0nw==
X-Received: by 2002:a05:7022:e18:b0:119:e56c:18ae with SMTP id a92af1059eb24-12ddd98841fmr3417106c88.22.1777477514813;
        Wed, 29 Apr 2026 08:45:14 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12de320ecf9sm3610166c88.2.2026.04.29.08.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 08:45:14 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	daniel@zonque.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v3 5/5] leds: is31f132xx: Fix missing brightness_steps for is31f13236
Date: Wed, 29 Apr 2026 23:44:49 +0800
Message-ID: <20260429154449.730880-6-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260429154449.730880-1-jerrysteve1101@gmail.com>
References: <20260429154449.730880-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing brightness_steps for is31fl3236 to fix brightness control.

Fixes: a18983b95a61 ("leds: is31f132xx: Add support for is31fl3293")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/leds/leds-is31fl32xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 801caf2b2e71..353451da72ad 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -487,6 +487,7 @@ static const struct is31fl32xx_chipdef is31fl3236_cdef = {
 	.pwm_register_base			= 0x01,
 	.led_control_register_base		= 0x26,
 	.enable_bits_per_led_control_register	= 1,
+	.brightness_steps			= 256,
 };
 
 static const struct is31fl32xx_chipdef is31fl3236a_cdef = {
-- 
2.53.0

