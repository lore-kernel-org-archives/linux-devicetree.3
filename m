Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FC84279EA
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 14:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785509026; cv=none; b=imuXfqwbZVpP7GbaDd9UWEK8Ir0Z1+MCj81BIEgAERNaVfYLY+5kUUvEAHb6ZiZNmY8VG5Q4uCfnrnWdKaI1tSZr7r2TztkfK7ehv6YTpVgNd4/Rdu7JTfbTzP109jT2tviH435HgHpmhWlnfzjSZ4al0Ok+eBSRrICMqKSGLZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785509026; c=relaxed/simple;
	bh=ZauFLZdTU+txgWmmv356NEPEzXfMT8LD2hrE87LiP44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s1EbQ7ixtmGc0oVGeIXx8p+JXVskRQmejks4FhhmxvWDPENBYt7f98Pogn0DZtYj3isZHxI873PT9r8yV4RSmaavUJyHm3ffiXYkvafrvLWs0IyzuNLKPpYHisfeSIhko/rOOK0DuQyayQWVFTk5Ij3qMMjtWrT0pFGaP4DSrOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=IR64gQhM; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="IR64gQhM"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4758bd3731bso1104174f8f.0
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 07:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785509022; x=1786113822; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OefaEnBP+Xtfr9MuFwvtjIyVzZPHMg8J6vmP5uhECmY=;
        b=IR64gQhMA1KYsxRCrRkgdwlR3sn+Q2axq56ejrhnQHh6u0CJE0VEdUX10IWeaVEaLo
         yIYDOKLYoD0xWCmLpa2eXy7kIUqjTIaFaZ5qrNt5v0mNC0YZl2j3D0i5NyGZCmHU4Vas
         jCuxIp6koN3YY1SlRshUzx2yioIzyW1YAPxLfikb3rOm2GgdEQj1fqWX2cjkh4XCDkBh
         Ac2pCK4UPYogEXQozYvDxlczPtk6PemUoNuAgD+S+104L32XR9RgIeBiUMusS+kbF544
         Mpm0TXfDPfzmWpe/eo67P9OYZdg0WqZ3UXkBMjsRJ5bMVSh7Vk6Tfha0CTQet3g0VT48
         y5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785509022; x=1786113822;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OefaEnBP+Xtfr9MuFwvtjIyVzZPHMg8J6vmP5uhECmY=;
        b=o1c66EJwFQJzm5nnPMN0D1q8ZNZWP1xT3OBPaxmD8zXcKGcZ9aZgnV0GTaDCuKBrZE
         bOg6HIfG0ATSf8mO99oJKo0PNp0EpcL1rINs1zUMVEXLzfnHXjxnPYh0de4xaxjbXi+7
         k8h7RcX8FTL8JfDq5rBE5v7fCAvjGAwClNBpaVrLfiACWvqHQxjkbo+M+ioL3uBiZrVY
         iX2FXZaYTv078RAxqBZOD4cBKS4ULUwQUEDXqnf4SkdST/K41E3rD1eULfl+j3LtVWW8
         p94SK5zIyeXTx0TPBnxUIkS7OPUbdYo5hf1oAzEfyc5eTdu68qs4ctm3oKplCeOiHs0Q
         +57Q==
X-Gm-Message-State: AOJu0YzYmo/KJNhvRgbm+YTlxIQTEGYT/zNrVsplLh7i+io64Apo3Y9U
	k9BK3G1s9UNcbEbvbT69zpwZJVHDWgaYj1pca0AM5iJP+xseP6xRj/ooFvOb0/Ss7Mk=
X-Gm-Gg: AR+sD11tCdX+aNAe6VEsZTRVQ8+Xuuia3uRzhWuxzE6V5XrDsH1EcZeCMxvO3+HME4n
	QXGYxAyT3ImLeNYomq4a2K96K1TqCZfCQH/bI2NR222efWSr4Iwdk9WXeX9h12heiWmMH8b837B
	WX8Qq2/Kmopmn430FiEx9BcPWKOZ05lRDy2AE1KpMJmZE8cTrxgevrFlVUD9W3H23MOKp+CtIUG
	B4ZwiiEohneOcyiV1G63nKOmTyXe5atTV0qDDTU7EmhorqnokNmnECKsHUJCdmR+I5TQZIqszSX
	Eh+pZJHJexhpTOWuKFhpSgBvC5avy+spEvci1f3wE3zxl+0aE154IjV8l6b+iXViwLU+fh7n26x
	XUr/cKcghlrl8LpvWOSMIzU1m7HpdssFja4wf6mc7Q1FyrfzAxn4QS2NFjCc9SOy6Dpyb1f33Eo
	L9UD1qX8gIQHM9GzYUbP0WxWumxFVrOfjw2CWcIdlcsHurCg7pycr1eh7JBw==
X-Received: by 2002:adf:e006:0:20b0:47f:8cd3:4bed with SMTP id ffacd0b85a97d-47fd337a59amr3716572f8f.5.1785509022076;
        Fri, 31 Jul 2026 07:43:42 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:d00b:bc94:65a:a73d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47fd4562a38sm5230093f8f.21.2026.07.31.07.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 07:43:41 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 31 Jul 2026 16:43:26 +0200
Subject: [PATCH v6 1/5] mfd: axp20x: Constify axp313 and axp717 cells
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-axp318-regulator-v6-1-b4e745552a35@baylibre.com>
References: <20260731-axp318-regulator-v6-0-b4e745552a35@baylibre.com>
In-Reply-To: <20260731-axp318-regulator-v6-0-b4e745552a35@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=ZauFLZdTU+txgWmmv356NEPEzXfMT8LD2hrE87LiP44=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqbLSUbXC0AUQN/9QPDC4hIYb2pS/L+7N5ZlogK
 OLb4t0VYy+JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamy0lAAKCRDm/A8cN/La
 haFHD/0cD2X9T4BHAot9eA06cC2su429uKwQy2ssCgVeEJgwvQRDelI2C38FOppJK/frqh7fY2p
 pUUrWcBslpcrd4Y5EDyThWeaVTiNSryW+4wr2IhArooglHYO53weobOl+sBRYo3/4Bmgy7uRcmd
 xfLZ5knvcSrYQHa2gyhvfA6CmHAM0hpoNmqgleV2jP56mNWcxwL3qEvOf7bD3aSFFij5L2AUxRp
 8rh6aeiV/bn1p5z7EQspcs9T6tOtWniff0LqX9FZE0f5Pb05YysL74/wVEB6osMSDUlsxmvegbr
 TX4i8GsJBruhbuhZP9B+tiy2H3rRL2tTNTxJ520WmfF1aID31jGsySfxYtFd3ArLRSaXzppUrno
 d3JIGPgA7QDURGzYJWNX5smnCY/K3W1ArtSyBB++UhTEtit0SiUDP6vyCup3lBYGBdZRIfZgffj
 /W3uD/waFoYRbPWBfBkWjgBRu0YeNFtY7OS7Xu6pluswLjYzH/k1fGPYkzGetR82KHCg2nkPbbn
 kPp5KdgIJJpMsiu6Jb1RvpX0cm0CuK9d3hpAOoWVTlUDQalBmFnigFq10X3UFkgdwPCpATC5pxW
 wGde2gJQdjXF09NVqclZ6b44YF5OzRFgOCYe07FRgoZAJRUIdlejsMuCOT1WLtWevUjDkhf8nmn
 wF8jBUj3eXP9JlA==
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

