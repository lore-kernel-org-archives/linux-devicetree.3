Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C883C0A06
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 09:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789032707; cv=none; b=m1gQAyig2d44BGIpjl01T4hE2r4+IArjBhJNHMqWethkMzgVlT20Ot1qQXOuQyx9NFEd6z9b0ZbAiK4CWJz3Q7VmLumSVfUbNF9T+czPYGLWAKZeZKp38hTNTBWPT53dB2NTifCMJxW+oKroMojioZoKg3Y0+gijMt5YqgJrz6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789032707; c=relaxed/simple;
	bh=6WS2gG4eQGvXIRMEkRovIFW0AaWwhRZ2tj+ICuFq6Q8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l/uztKqe06Jfrfosp1OMtS8Ee6/PD1CIKO8okgq08BhOOkHdhFfxfF15nK+AK9em7EesP1nLtQ5TMvNwkUeOCAZpKiRqilg46vuL8bPrSm1uDqenLmhhlGqIG92IybV7royb8oeVifKu/1JHAnSyUiAogyYC9cSfkn+n2g4ZBc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=PlKqjpk1; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="PlKqjpk1"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48441fa5c37so4848505f8f.3
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 02:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789032698; x=1789637498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eC2Iu7WVN9Kv8E55jimB5I9lAFW6apWINO+cxwm+DSo=;
        b=PlKqjpk1n5h7yzEQwty/xB9VYAUshz6v0YPGI2B17P1+pDTs2vdB/6UYLbsxEzU0e7
         T6y0FWeAF44lLxlwJSpEBs2RRPYZZM5FUlLVVIiaSACFW2yhIn7V4ZADj/FZnUQ1hJqo
         a/5aYJRRABFAyJgI68PFhNf/rcBmjhdwyx24yKmR1L8kUYkUYGS33Ifn03lgKWwAs10E
         NL+YFMfrFLusEIhqXMrDbJe1MnaltHt5hziFAVJTxOWesuhtxoo6acTgnHissbzMsFj/
         L3h4O306Kh/zThoYE+M6PUas4bzmA1TlZ2/zi62kiYZGF1tdf/OCHQ9Is0QY0snMNhIO
         c1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789032698; x=1789637498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eC2Iu7WVN9Kv8E55jimB5I9lAFW6apWINO+cxwm+DSo=;
        b=R/NfalTH5draHSdSVDz2GyopctSMCLqnAThDE1jsmyQX3ku/KHI7BNAGujgd4j1xla
         0c+WPZb1Ff+vaE5O0PPYCyWSrqw2S+QMA7UsFuezyiqEmpHHKhGsL5K0Xlp72pFyVBij
         jFwV5wKEzafPOUcDIXMyk52/9VNt6xQHq5THCeu3Ko57fLqm4jmjHT2FpShEstdojTsi
         VHvEjr7IUv3ZpQrg6AWA4pDtVxElQqB7ZfRcGaX50hf0wmT9yOrHhl2Ngbdiv8CtzKyo
         Pd1UXKDRvUvoqS7FEaBXGYqMQaOWYEy+V3idcTugygzLrM8YgdS6bnO5qnoJYXvvKndt
         iuZw==
X-Gm-Message-State: AFuF++lSbLCHS3Xau9ctHSE45bDAaOQlM3d42PiAL89bdC12+9m6xdug
	k0N2nsppZ/4OBCDlLUiKDxl1a9OEo69SPW5zrGUGJPWGYOCkb0pWZZwkZl/3x1dggkc=
X-Gm-Gg: AYBFou1HTI26bNC44u/7lfkSwQJgYmyPcg7GBJFndx78/4ce77YIIcDiItoZLs1ovMS
	ZxkNEoB+uuNSqNNxhIfx2WSIM41v2c3tawAS8K2QtBtuU2ObTSMZrzZ4A3mkT69Tt1oyKiyMXgE
	umODSUZ8daesO2I5ktKAfVZ28wcGPXYBrIeL9QBkNLMulXs4PLq6HPM/1xDUBH2XxvXODsBbGeT
	7qi4iaPygbT4AVbg4EjmEx6onhSzUk4bvJCajk6Bju0JUbZyVl/AX2rbN6G0XddFISaynakmgEs
	oPKoNcicULsDwwyVPbbLlhwlJ2meL/yBNzz1KUyar9wXg1QgwIime6sQMuGDQES+8Yws7b5dBB/
	/1InaiVS90Umbl38+F1xyQQaQ8HAWBhGizaeRPpL31i1pX76X4giU2EXlYxIheSQRz+b/tnb66S
	J/xxYPS+w2cSk14kqsEWa5meN1s5oleUdkglsAVcSuaBlqD7nnw7/EvsbFv6lo1XVZVmKuS77ji
	iC01aYB+HTXjAltKzSn08hvGW3f
X-Received: by 2002:a05:6000:491c:b0:486:e727:d4a9 with SMTP id ffacd0b85a97d-486e727d4bamr267531f8f.55.1789032698493;
        Thu, 10 Sep 2026 02:31:38 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858dd90e1fsm54098918f8f.28.2026.09.10.02.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:31:37 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 10 Sep 2026 11:31:08 +0200
Subject: [PATCH v7 1/5] mfd: axp20x: Constify axp313 and axp717 cells
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-axp318-regulator-v7-1-de720ceb9bac@baylibre.com>
References: <20260910-axp318-regulator-v7-0-de720ceb9bac@baylibre.com>
In-Reply-To: <20260910-axp318-regulator-v7-0-de720ceb9bac@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mfd@lists.linux.dev, linux-sunxi@lists.linux.dev, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=6WS2gG4eQGvXIRMEkRovIFW0AaWwhRZ2tj+ICuFq6Q8=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqonjuqKxu8UNJHq0DCQAWeUf5/7Y3PNX51fj8j
 RwHioty2leJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaqJ47gAKCRDm/A8cN/La
 hfhdD/9PQSp8YB79F9eYZ31MRivxo7VTk8yHo2WHgTfXaGtRTfjp9JvsSb/KXSnXm1mkXgSDKF/
 1qKGGwWOg2SDh+0/gc195UoHaT7SBPOGUOS7WuyIuXdLAIEURQpsUjuNlmK2aKITGtlSXu7IlfK
 6EZZapEDo5HMn7h07BKKCdaraVW0Dnkw3Q29VHrnU4Vt+2Y1fL4IhwK+mVvjYtrzmwL+Cj89hcn
 8BziLEW2Id7SUD3TNpb/t+kfqdQ507IKS3Zh4y1Sx2zmS/R7MggQQjm5jVmL5KHLM4DTTKIJnLK
 GcdngZL14h1BzQRc6VyJjoD4iJnShD7BkcnFE9LnFq4HdHxP83iC0ki1E28iApVmmD843/Pr+ud
 XyNn5mTkpyjSvMFsUdpJwu/S8/5FpSiHTbHqxM4AXEtmsvHYvraEj0GsTBrUtmduGL2w6ncFW6I
 5gMOWdniEQXZRDBNUR74eBZG5yJKAjHdzl7YWazuo8IyVtcRVgFpKQmZxI7UgLK0MONTR2RSDrE
 q/U03CaNG7XBfU2Y/p+vZWek4zxBiATbJksSPsb6I2bOlURjlc2BPa7YUAD7woYaGVIR8qfxue5
 o2TYBOrh6ODPkxuTU+VwqGvFc3h6K7iq9HL2NdzIFs4SPtpgwW42j/OF5vhkjLuOpjufjyR4Ume
 LVznEVirXAmuMUg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

mfd_cells array should generally be const and there does not seem to be
anything against it for the axp313 and axp717.

Constify the mfd_cells array for the axp313 and axp717 to be consistent
with the other supported chips

Acked-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/mfd/axp20x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 50df66de24e0..4d770e718716 100644
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
2.53.0

