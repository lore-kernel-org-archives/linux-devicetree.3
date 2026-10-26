Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010123;
	b=2YExblQibmsAxxU+qAQ2d+GH6BlvQFRaygdrPLuqKGKgmdfM8h+z9PQYicE83shTJjU3
	 dFuztQ5EUYhsEMLBSCABvzxskAXtTMSRuXXwEnyeHhi70HKRxatpaNaZzpwjmVGXYFq7s
	 mQXILrbUYMLE7EqMaw/IJ9ZHgpQGbto3AijubnHh3+aVfs0zraZ/j6jNGbGHcsaFqGJc8
	 VyLrGHXydOVmKOWpQvbkp6RNI7uZghTxNL0Jp6km6Zntc2WZ/qExJcIK0WY/+jlmY8ncQ
	 yUiWJzsfonaLGt7jR/01WVAKrkTX6hG6SUIDyIljVkdyDLIwI19k3DArSmCw/6/N31Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ssGW1Dqn9NQO094E/8Ttr3abz77jsGgzbaDPU8z6CLQ=;
	b=PJOa8fhJfoPkNbVs+cXmlqn2o+JxaYqohwEUju9RJ3VoHhCsdnpDoCvyftCxj08RI9pX
	 y1ZHNM5MOzovEkK3DGeYJ35g5Kkh2WuoOp33yuf0MfQq/VGPvUULc6+UH5wLkhWnsvYg3
	 Fhlfsy26RLp7yY8kuioh4796VeKEyz7rEEO2lFKkk5nVWE6rT890/2AR6gNDR6Geqyz/f
	 rqlZdR5SQnRv9I8A2Vw8vA0jhv74ah65TsBvO84Ov+rKMkAArQejNm4w3lkEoMz9706uo
	 jBq3gW6daPDsqcF4ERiDtrpEP74Wh91TjdKTCh/kmFpUIA86gQriYNKJcDkXwtNyVcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=epHsHRrR;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80A560A2619
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B80A560A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=epHsHRrR
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso12315235e9.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 03:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793010121; x=1793614921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ssGW1Dqn9NQO094E/8Ttr3abz77jsGgzbaDPU8z6CLQ=;
        b=epHsHRrR8/hmeF2wr+cmt9qhWoqEkZ1CMgUbwk/MnyKYJqP8qKurKP+o/4atOs4UW1
         EJmH1OcLpSRd5duXo7dazvYHTfmd8gwuy36g73vqfA67vMnAOq0+k1zc7gFFKx1ODIlz
         KaXWjZErAXtxuqgLGMcO5BF6nx6b31J7+EUl4giMzY9wJE8fr4WDoV0yIQzhR2Ngw2Ki
         E53reSsyOafeBU+dXft9Ymbi0OOI3wcnQ9B44AQFUEjY5VEdsWwYGXqpmpBebnjHI688
         qUvm7gOP0XfX73+PPKy2hSJO7Z+1cTOw20+kqkauYMWAUcDszabSzDkfbBIJgxE+K1i0
         F8qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010121; x=1793614921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ssGW1Dqn9NQO094E/8Ttr3abz77jsGgzbaDPU8z6CLQ=;
        b=iG7O8+BtAX9ePp8+G8zm+ZVDejcNkFuujBWm5YIixLZjVTUXplbVJVvZywd3TVjARK
         JfwxZ1iNX50WK+a+fZ5EffVprUrWnQBvTcq9QTfdx5OI+6oD/Ngzs4lpGQgzC4FkRRoD
         7zcyDSLttyDY98xXz8kAc5o2v7X2sJvvmejbiDZpzRXPnqsjU3HTztbULttSyPp1qwSK
         Z8HkiwI0uEHmImPBLoiUnvTGkkg35y/aImchIPetG84rdgTgU7D5/tprQixyHAlOHslO
         K1iBTJO4+tNhTAZKaRyBhaoObQ71nnQjiuVBnWMVmkxYNo8MOe9GQHDpTu3jtiEJRFX+
         eRYg==
X-Forwarded-Encrypted: i=1; AKwUvByiigDuMfvU94V/cK0cGrsM+aEYZFBzwEIZ6XZUDG06c1MEaNIXumFxmBNayC18dJlS3n4excTSn/08@vger.kernel.org
X-Gm-Message-State: AFq9FYJ76KxK2AJDgnDqXPKhtLRIHIsrzRCLshEwa2rd4Tb8emZY3BmV
	IHYqylqyezzofdPVxndmoyICdXFJXTvBCh/4DHOYjwcGXnn61VAdGBDw
X-Gm-Gg: AYBFou0LB9yEsjQX/Arp6B/QaqrxIsVsudUT20akDOUtDLsWcmNULk8QrMisbwYKw4r
	cqNc7DlpNkQihm1NYAqTbOwl5luURjxMs0B5UP7WgZNrBnlUSKhsAdWY7vvCVM/CJRjAiLUf7bD
	303J0lW3na6q0bgUnENK9Up+PCVvRQ8uQkeuAtQBxkHEmQA7dB36EBOrWYaD13s7ulFc3icNn/T
	KBn0D7dkCTCojHC+WVeuGL/k4/euxJi9plDfcxf9E30ADPUk3CoxHb6nXCq0ZG30AeZcCZfyrx0
	YCD/NELBa/UKlRyeAzFFHKNp2mIgpqrlsnAcQm6TzPOyocItKsjQceqXMllvWVuR0EfxZjN+sKM
	z+XPI/IWvNJDG78+xgyHdPCC6QGSx4pMFaNxAcdOcGTm0rd83ff/tTlkVmhxHo0v4TEY3Bpbsso
	yrRXzHr28wuBknEzK7Qo2OdnC3azMPFMIvXVD/ry3iLAtatKVMyVsrIWzphaEYcnaE1DTxevGp/
	jHLHgqyOw4YHIxggAUB5YLFxkqYEvN2uvVpv/nZjOFt7MdEnPgBt+tD9CD4gTmjtYYhfD/gGqCA
	A3hGViIxkvuMeYTXeGKYaKkKGOIG08H+CerrZtO+Nut+G2nNwSwu89W5DE79
X-Received: by 2002:a05:600c:a106:b0:4a3:5aea:21e5 with SMTP id 5b1f17b1804b1-4a35aea23edmr84243625e9.9.1793010121069;
        Mon, 26 Oct 2026 03:22:01 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3932sm16762876f8f.18.2026.10.26.03.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:22:00 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wenbin Mei <wenbin.mei@mediatek.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 2/2] mmc: mtk-sd: Add Airoha AN7581 MMC compatible
Date: Mon, 26 Oct 2026 11:21:37 +0100
Message-ID: <20261026102138.36786-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026102138.36786-1-ansuelsmth@gmail.com>
References: <20261026102138.36786-1-ansuelsmth@gmail.com>
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

Add dedicated compatible for Airoha AN7581 SoC that implement a dedicated
MMC controller based on MT7988 with the difference of having a single clock
controlling it.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/mmc/host/mtk-sd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 5b160fdad3f0..736cff2783e2 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -713,6 +713,7 @@ static const struct mtk_mmc_compatible mt8196_compat = {
 };
 
 static const struct of_device_id msdc_of_ids[] = {
+	{ .compatible = "airoha,an7581-mmc", .data = &mt7986_compat},
 	{ .compatible = "mediatek,mt2701-mmc", .data = &mt2701_compat},
 	{ .compatible = "mediatek,mt2712-mmc", .data = &mt2712_compat},
 	{ .compatible = "mediatek,mt6779-mmc", .data = &mt6779_compat},
-- 
2.55.0

