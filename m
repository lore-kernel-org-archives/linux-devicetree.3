Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4616E3396EE
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 11:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784546448; cv=none; b=pIShJ6TCBv58zS5aNwi+3LuQJeRLpbWi5YiCROIdgxjr1pvSEGER9jle5fHqA1ezJATpa9e97f/3crbTkp018gqZoJM4CkT5Xgvfcb1EMzahsYBalsjGvoLWgCf2gOvhr0qWRffzaP5g5dljiUI/E5k7WO0CxPvfWcLDaLu/LQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784546448; c=relaxed/simple;
	bh=Jo3R2o9/Tnmp5FshmLaLSUQe0IPLv37pQ7a5x0AQ+Ao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WJPERFpqRVouCVYq0yjz+M9S5/yEeG/mo7iutYg7+XyqlxxYS4DaV5r+LXLYiRCM6Mts8fnIBbv4Ja6IWYGbE3Wxz4N0JhADav2D45TcWmNmazseFzyTllhF/Gs4AaX7WauDl3N0F1CB1yIhx7kPPc3qcvvbTg0wiJiiLkbWpWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=MTjwykVQ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="MTjwykVQ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so76575295e9.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 04:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784546445; x=1785151245; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kvVoV3t9T4UO6MI6QVPWj93aCOdJhDbhrgyYg5VNsyA=;
        b=MTjwykVQgAhokFSybuXbFXZcX0XTdz5oOMpD5SeWlEMummS6H48TctvndnfDOWGr3s
         CL7BAzqau4r+FJE5w8zHdgWSpelKbkqX8tXi+fCkkFjMHZlvIcHGKVNYy1FvIJ3XgTFI
         4dnnPTACULlTdWiiLGT2lh3fG0c6P5/CnyhStwRFkuqhOcb4YblLbVhqZz6nESde/cfU
         wkYD+VDJCL9zIAlUn2Qm1NagprC0F2Ta4jtfA0EHJLMmkiuzc5lJpV7EOMBkA1TasFZM
         opPt5Bvdy4ygKOzu3da4A1b044dXxhelXIseqDLQuyNjmovlrsUMeeZ2gUFKexMuvr+Q
         UolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784546445; x=1785151245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kvVoV3t9T4UO6MI6QVPWj93aCOdJhDbhrgyYg5VNsyA=;
        b=VTIwQdiFFohl7SczZJQfSCB+d8XBxdPq87mLBWel2shmK0Fw4fLBQwueJbbg1zHBZG
         lxkESIiC0AvyZCov+bYIIM5NVuLKu47RqXIAMrr49p3DyUBS7rT3C7VJMPnfmIaACT4f
         BC3PtaMQ227B+2vMGVsS9HDQTf26Ny9AlAfA68oJg06WpB9eMA7+1Ysajx9eJXGmzEhh
         n5hutUug/ZF7RSLZHsZIgXnJqKHxEamBVcXKMdx7eLULWJqp8dXejDo7f3Tb1b/7EkN0
         gWeOf+h4IxbBeY038L1bIRRniyr/fGw/NZMIjcfUrx99H8p0wiWfTk76yf2+F+CsOp1j
         fNhg==
X-Gm-Message-State: AOJu0Yw9OKzempwPh/Hd5TxttcAJ8zx4XE36U2+cuDjfwynCdmm4JV78
	Ny0qOw7FV00nt0X7d13Q63qF8+Gh5mG5SG4Sis54iLJyL0N2Ml++UelxAbeDVcT77lw=
X-Gm-Gg: AfdE7cm/RR7QXTiJ9qlEkEvuFWJ/SCfnU8imURXaybn7Hd00keHIgJ/vCLx/pn3MYPm
	S3y0ltRhrcrQuF/XYOA5Pq+mJMxWZBl7psWQC9ZHniZLM8i0+Rtq2klo10wCSUk57YTT8eHx4EV
	nBoA+o8XRKZyd5BR8TMWT2BeYbmpbIfDXqlBdkHTNGENL/Q6BRmNtW2bmSfPvJ7yEiXbkv5a2aL
	aTFvkcs+/ye0K/szqFQeAsMJv2IA7otxP7PVURi3upMUjvo6Kw9Ccq+aU04BPlryCgaPtvkbztA
	34gxb0JXEGT0BFHqK4kUT+aB5WmifYOSZThKv4Lx9WUXlTC13ubZnAeuRHNKG5iQjiE9RBVzmbN
	USrZ3txOKEfNh3Rld893eFRrxwVfR6zZCDEHYqn/KQ2KZLOcwhOdjnSAnQinfFgK3ASfignYT1G
	unU/EEJg6HLqI=
X-Received: by 2002:a05:600c:1906:b0:495:58fc:ec0e with SMTP id 5b1f17b1804b1-49558fcf831mr69599285e9.23.1784546444980;
        Mon, 20 Jul 2026 04:20:44 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:f341:e28f:dde9:3687])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f63ee0086sm31384218f8f.30.2026.07.20.04.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 04:20:44 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 20 Jul 2026 13:20:28 +0200
Subject: [PATCH v5 1/5] mfd: axp20x: Constify axp313 and axp717 cells
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-axp318-regulator-v5-1-a1afa7ee24f9@baylibre.com>
References: <20260720-axp318-regulator-v5-0-a1afa7ee24f9@baylibre.com>
In-Reply-To: <20260720-axp318-regulator-v5-0-a1afa7ee24f9@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1118; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Jo3R2o9/Tnmp5FshmLaLSUQe0IPLv37pQ7a5x0AQ+Ao=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqXgSE4rHFGsiEJPqcuzjdUv6Ve0f143KQcVKxA
 6NziW/1nd6JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCal4EhAAKCRDm/A8cN/La
 hY59D/9ZUb9UHzWFmyX11oaQ5IsN38sGXK76v6+9Ghlm/H9peJ2uvIrpdI2F5kxkRM5+jV0qSYJ
 ZOH4gBhAqkr9Bo4fvKnLA46gfF+2c5iCXFAV5Vce741FltPUrGTxvxq1gPAgavJ6KPO9iF6JE/F
 WvfEYxND4QfonLsLiFwC88fT1kGlW4g/c00LC6GYvK9WKvVq0YKjcvnQctEjVgYExhjMhIurnFs
 D9oECVeiyFbtMO3Iaz8JcfzYEtQZqpPzXFxn2Ql97apGoC/yuy8sEUuxj9WN0yz+TkTsl9wMmy/
 vf3rQRXtGbmMkZ/2NWvzQUv8ReZr7MVlvIJGp5CRTdgRcA710/4h8yYdUvxVzxmacT52Sshk0hT
 MFb6HdexEOzfGtfEMv2iYVwe+zdttB31lbNHAt3Ua9EAAwRBYRltYVWxBhC9HWXhfQKtCL7MoBS
 CYCgqQfNwDVvZNwfaJt11Mjax2BSd2FzCRYyWWISTVRf9tlqG7AnjsLCdtMFWRhtt4TJBzytVK7
 K4mGhFVjV6ZNcXPFJXStJisMoz+LcHoqZVwAnU+OS3F1GwvjI+/NDuQbI/TyXLAM82/diHbEDjf
 rNRc/UNhSCWJ3V7iPaC4PREAD2Y7zmCrHK6lDqfyBcvZJjIlBE0zdqTtpxS3kTd3d94cl/+0hW/
 LouChJvuc5ul7Vg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

mfd_cells array should generally be const and there does not seem to be
anything against it for the axp313 and axp717.

Constify the mfd_cells array for the axp313 and axp717 to be consitent
with the other supported chips

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/mfd/axp20x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 679364189ea5..22baab6e10fa 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -1055,13 +1055,13 @@ static const struct mfd_cell axp152_cells[] = {
 	},
 };
 
-static struct mfd_cell axp313a_cells[] = {
+static const struct mfd_cell axp313a_cells[] = {
 	/* AXP323 is sometimes paired with AXP717 as sub-PMIC */
 	MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),
 	MFD_CELL_RES("axp313a-pek", axp313a_pek_resources),
 };
 
-static struct mfd_cell axp717_cells[] = {
+static const struct mfd_cell axp717_cells[] = {
 	MFD_CELL_NAME("axp20x-regulator"),
 	MFD_CELL_RES("axp20x-pek", axp717_pek_resources),
 	MFD_CELL_OF("axp717-adc",

-- 
2.47.3

