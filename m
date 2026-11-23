Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446170;
	b=BJqf/xACyuGBFBg94avVkOa3wbra+WK1LCtwof0v5O9IJSN11okHhapLrNiUM9gv6B/Y
	 eb9snvH/xIEOIfShhI/afYkhgIuDrwv4hh0X3fMJW9hYe8vOkZEXtgfuP0NZ9aseCkv00
	 +DNdkHifAQ1lW8a89bF4ThjPDjPP8E/a1jTp2uKwmesVRQzQFiBBM01aU8CPCaEpSS+7B
	 qK+w+NvySSrKU0nmA4P5CSyzU4TQEtuiw1RA6wG+2qX0+GQuyXMvSpfVjrtq8LLPFkrF3
	 iJ/1KQ9Lzo/u8gUmCZ3VYNyC/BetIaziZ/CZu5etgLJ/FXzOrRExtB8+Vjk3nYg6kxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446170;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8eOO1ST0aXmtMw3eaUAkBoh7IoqMZEQ2tzDQbbldbdY=;
	b=q/F5VFRjgJT5tKE728fOS/UjqX4qNNvWp2+7wRrFps5rxM0AI6+CNTy23CpscgOOKNfk
	 zmbhAv36Ax7+mD3ESDdsagJgQWKIpixmNf5qQzp7jjI8VZxF8aoxEvkHWd1LKWVsgt/KZ
	 Ef5BnPBs38oSZgaeCQ2cGwqCFb+U8eAKbDWx5xLTxpSh1VePoEBeznB/tPJ3OyeKpuv9a
	 b3HRJhyz3KDnzQ6sUVe5u9AToyQT0wauxUSPVElLFh4GE0xLzH+AIk/cBIeuF+UH/bBy/
	 dCL1j1iq8qGVFIr4el4gE2bSkM1WDMu67Kl/W1ruiKA9U81vSU1oNeT/WL9hcNgcRQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R9VCKGmZ;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50204606A332
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50204606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R9VCKGmZ
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so647161866b.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 07:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795446169; x=1796050969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8eOO1ST0aXmtMw3eaUAkBoh7IoqMZEQ2tzDQbbldbdY=;
        b=R9VCKGmZjXElTN978wMjwwQYnx5I3az4MVwEXqa2cMGX/vK9eQ3tPEy1qlmAM+drpy
         sS4AadhMZTUT/4y8UkVGcJv4nG3BlVkhL5y8k1qitKB66wj2Nw9vux1Pn+BNwQxvf655
         RtgrKDQshzOw7abDecJB+mbSgbK/uyGAlsKIpSMZh40/Kt0wrGT3e/h4wn6W24ck8zq9
         bW7YzR5ifW+DKzce1sIufsCnNIqTI17bKyuj4xnWPfWbArLuajGI1WAKFUCj0MM3gb6I
         KvNfoF14JtalU0MS2PSzsSdQMaGYXqLNKRFGta9K2eFYnB3HletSaLWUK1W4SxUbjxFk
         +Sxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446169; x=1796050969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8eOO1ST0aXmtMw3eaUAkBoh7IoqMZEQ2tzDQbbldbdY=;
        b=h1PSa0vwggvFRaBQL5CNViPmrHekK28YvAr+pPNELCt5DLMjpWY5cTkAr8YyiArFPl
         HPdMZhLelBe2+cg2sBm2wer71qzk+F5uq45nNsBhoyN20dIv8sq6v26GfMN0awia7h04
         wHD+mk4exX3sMzeJJOyUtOUkco4NCfYGU9zyIlGcwxNvZrjzBSFAluH+Go1N7iqM7DwY
         xwHK7Ht4lgVIVJS2vKPkS0NiPm+A/lb1UKLuPFobfT6hH8nYbZa7GIvQfc3FQ5E9dqri
         FCyPsVo87NQqFxi3bMT4gMTuoel/D7ERyEMHz6U4dc8q8vKVGvhGBN9uPs4GUD7C64mA
         TNgw==
X-Forwarded-Encrypted: i=1; AL+hErEVRCaK5++iEBGMfrbbU+8Hs/qN1TYXotmJrNQLQKCYcm8b46dOixkE/5YaNDlvi9eKpPxmhUne6zps@vger.kernel.org
X-Gm-Message-State: APuU4Z+ncXUVWNWs2G2PTnJwY3Ssedb1h5Vd9KQq7oXMtkqkmLf7dM0O
	96HHNqIkqMR8OlEtdHJqkdQedKxwyhz8XI+Rc4SOGt9o1837IlMcYpXS
X-Gm-Gg: AZFdTZeDzwGK8c2wNuLoAFmCFOJnAFsxCid50qlq3fab+UjLjGh/Ig5uLmP5Uoia2r/
	BrK8mVzTHv/x+uNpQP1Rg4V8rxqYahawaJ86Fr2UVyAGX7pGXwGrOebPgnOH5tbcLZTEIMlqAxh
	cyje3RecSZcKHZgFkg6Qg7XMNoc4zvvX885QAWU4KI4PhWID8sd+XtBDU8Z8rAh3E7Wzv2IOe2o
	zErX+wLFiljDZjU0znGoGhpD2Pz36BBrPI1yTGrf9EipfTk/lRbFBDKv5AhLIVJwYLLMvpe5pJ5
	6bny1dy2kdmDuyE1rUoJ9NOSfIrTHPCN0rM3uyOnvOAQ0hNhWwyivdsPyaeJHzrBzAj+wwfqIRI
	DU+7RAciOM8aLPl5J9sb1UIc5+49WoTmZWBz1Shrcr9ROlB9rFEYE99bztJd7c+vhLHb8tEp3NI
	zQ1XXnKh9/DqXogZg8pS+YZDLlGKmA50bFTtKaB4wxdReYmc2dGRy+mzqRIpvnaGNApbRdhEIbp
	fJgGHy4wU/klaifNJOSUe082j2rIQXzDp1+9iHxC/rU2ZFDBPRkNfWPjbDmr91AVJPZbcJBfdRk
	6AEjmatjEihNEIu1HWEJdLp8e410qB3B0YxtVB/CYTe/Ii7oP9QeCYDLtl1BP7LriZjW8ZqL+jo
	PDSk4NaUvmBs=
X-Received: by 2002:a17:907:6e89:b0:c51:59c8:a4ec with SMTP id a640c23a62f3a-c5159c8dc3bmr574859566b.1.1795446168301;
        Mon, 23 Nov 2026 07:02:48 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe3b0sm418484866b.8.2026.11.23.07.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:02:47 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v6 4/5] mfd: max8907: Convert to use device managed poweroff handler
Date: Mon, 23 Nov 2026 17:02:23 +0200
Message-ID: <20261123150224.199601-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123150224.199601-1-clamor95@gmail.com>
References: <20261123150224.199601-1-clamor95@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace devm_register_sys_off_handler() function with the dedicated
devm_register_power_off_handler() helper.

There are no in-kernel users of maxim,system-power-controller property and
all new users will use generic system-power-controller so check for the
legacy property can be removed.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index f1cabb666d8ed..5d17971a8e9ab 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -189,8 +189,6 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 	struct device *dev = &i2c->dev;
 	struct max8907 *max8907;
 	int ret;
-	bool pm_off = of_property_read_bool(dev->of_node,
-					"maxim,system-power-controller");
 
 	max8907 = devm_kzalloc_obj(dev, struct max8907);
 	if (!max8907)
@@ -241,12 +239,10 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add MFD devices\n");
 
-	if (pm_off) {
-		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF,
-						    SYS_OFF_PRIO_DEFAULT,
-						    max8907_power_off, max8907);
+	if (of_device_is_system_power_controller(dev->of_node)) {
+		ret = devm_register_power_off_handler(dev, max8907_power_off, max8907);
 		if (ret)
-			return dev_err_probe(dev, ret, "failed to register sys-off handler\n");
+			return dev_err_probe(dev, ret, "failed to register power-off handler\n");
 	}
 
 	return 0;
-- 
2.53.0

