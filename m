Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C10448394
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 11:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125481; cv=none; b=XVmFlgOb0HsYWKauSqiyPeV83r+MnfueUoQQ35OBJ/yh5HqUyk6uiyKt/sPpSk/TlcJbmHGAmYvwhxtLOTnV/Wy71ZEXMKXGlcz3JK8JdoUWJvU64jext8ShomNr9cbWcjrVg8XqlE2NprbkGbLrvcNmiDQ3r9cQf2/7pYaz380=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125481; c=relaxed/simple;
	bh=poHAk1iRSPkkWec7SAiFOpPgNT8Qb8coRxeZh15oi9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qHsfFO2JcjxYA+9bBR4Y2qnQqmwjE3jGmWwRAW9981K6l+GrfyI4cBqSlUuPwpB1WTc+jXnjRzYDigrrqygjiG1f4TYPC5dBFvjvrzsWvnyfwRK1LTSf1HgvHvFirRMvUR02MY4025+m+bpx1AtXzSYABBzv9NoIeJgcjk5q/J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q6HveQpq; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q6HveQpq"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-486e70f2457so363873f8f.2
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 04:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789125468; x=1789730268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DfnV8b6AfEbN3w+t4mx2Du5Ole8Wgoa6AgZfitPXjMg=;
        b=Q6HveQpqJH0GGeri5qaeS1Zegh/Rg8a5oqcldnM7NHkB/YE6sK/c8zO3kBdc7/HD5l
         nglevh2+glLXKTQkg7FoGg7h5dy19g/ReTCjjUlB/T65yDe/IMuctxwa3K5G2MRzEEkU
         QRVvdmZQw25ZNqpXQJkpnGTnKGAL65iwEaOe8xyrvr9p9EkNVCHaaMTVFiKhd2xNypTf
         VQRQMNkFWOgFFSTURpeRwZaO1LOb/wwaTiul5lC619PEyqkw/HDqG55ld+dRQT2J5O/o
         8sIOBQe4+G0FTdetirra9kBdeSX+fPGHrOm4ew3MY38b3XZs5hkLLfII5jqYPpjYnFUE
         Vp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789125468; x=1789730268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DfnV8b6AfEbN3w+t4mx2Du5Ole8Wgoa6AgZfitPXjMg=;
        b=PJngGbpegdR0/VXFjMfm8u9TMUmT1AV/TxgdVqjGOsyAqDVnCqSCGH2KR2aIIG258N
         tOIzZxnQOPpKuetiJLw4xI3B2rfelEuxuoOsfTVCPcqDkXQ32fmDpPZto8M6UzX1eugY
         BRO8cVElcVbTEVAGV8oIXTILnVcx27iy4G+TGyhVhFRLlp1u7e8LagUzXtCJ/iJbp+sN
         e9UmAAUVbFyDCX7WzAgpm53YrLmDEQpZCrfw2CQC6GRHZv14JpV2H5/gnVotjjw6/6Ty
         ksOf6/X+sG9g8Om16/jvwkUYCAMHIhkxKpWHa8p8nvt2sFA+AaPKXg2AhNtJXu+cta43
         /kdw==
X-Forwarded-Encrypted: i=1; AKwUvBzad2tzzToKn2p40QD/+gvm0ABTi6fLevE4uoYZIiNfue1mzPCLASG4R0od/5zqwpVzdEbhngcjCAVA@vger.kernel.org
X-Gm-Message-State: AFuF++mbhS2+f8q19opWXESzsp9Lhs4h7EBZSj1HVTXXCQ7Zf/G3uqch
	Ztkzg8gzuRo5NX9a0joXzGplnhKFzKQMnVMSIunjeTdmGTkT84Z2es5P
X-Gm-Gg: AYBFou2INpINujP//5Kfg8qAZX3C9aen2ILb9gktk9ATzsQ3ydaaIusHwVcbi+kpkyq
	18iwTQl+P/mxOmb+Kzc4pn0lSTJoLdaP9w6Bu8oUxGwHHgjJNU02rIX4Kelq+B72cXt6yZGaFfh
	IM52TKHM7IbusUUq3sq5NGxO9wLbIvGVFlbT1QjSH1yEyBqTQTJvsL0RCeTPbHZd/CYPGAo8Zga
	Gh+QrpLq0+i94A24wvOh2T9ihScDhdF/ZxEzYk+HgbRnf++BS7D5R3kcY2SOkaQcouJ8gFN8vuy
	6xbfOmDf9lFRxCfsh8yHDYeG67Wl1L8N1E5A8HVHZms0X7WiDqJW0gmqjY3n/NBzmDzLc1DYuZi
	OBQPfQME++ePxpbBYjvEnG/EKcJDZcsd7s808q+5Ys7i+vubVdHnvjT6CRn1ZUUQKAzzcMXV7/k
	b+sLPqy5Y8oHWwHq/JRJfCrNT+w6RgaNeFg8xVoYIZhcBP6EB2AKpUNKY5pcs+OkU3KxNrPhNdf
	U18491SVmtswW1h2wS/Xsdss3pI7SHQJzg8MzETFVSHDXZLZ9Z5jsCmkok4q54eu3rDe/Kc3p5J
	hqrBabdDNyejnxb4YKE=
X-Received: by 2002:a05:6000:2c10:b0:486:e37d:c57d with SMTP id ffacd0b85a97d-486eb345e9dmr4546787f8f.43.1789125467738;
        Fri, 11 Sep 2026 04:17:47 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3de1:9f21:e874:3931])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecf23sm5438182f8f.5.2026.09.11.04.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 04:17:47 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 4/8] watchdog: rzv2h: Use pm_runtime_put_sync()
Date: Fri, 11 Sep 2026 12:17:27 +0100
Message-ID: <20260911111731.3404308-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
- New patch
---
 drivers/watchdog/rzv2h_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index cbf414e0c9a3..4a5a856060e9 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -270,7 +270,7 @@ static int rzt2h_wdt_wdtdcr_init(struct platform_device *pdev,
 
 	ret = rzt2h_wdt_wdtdcr_count_stop(priv);
 
-	pm_runtime_put(&pdev->dev);
+	pm_runtime_put_sync(&pdev->dev);
 
 	return ret;
 }
-- 
2.55.0

