Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2E03515D1
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 10:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787136085; cv=none; b=oaf73YUG5w8zrfKjeGNao24zCCDrV0p/PYODcw64m71pe8LlFhcTFoitX4kz92iGWVCXVoD3I+XdKGHP4tYhxxBoxUsJE8IOwVFMHv9IaquCa430y5+C1iJeZk8CkBDbrJen1ojTiviPNQo9bJoytJXT6nGZeQDj/DbLz0GnsQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787136085; c=relaxed/simple;
	bh=uQI3XAHDTn8+KY5L4ouP+6SB6FMgV+T6fRXQElDCkUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m+wvQ+m5zB2Cu3xEsgrYswA+q+DZtx4icNNR8co3i72H96KiwJbfz3xvsaeirUALe/D0ZAnEAFKBpzMuArG3VXVGiHl789YOKvIHhCMDGpuWD4RLdMyGlfaNxAqo5ytmNPIyR5IMaUDAsjAsDImcvu8DCbEE9iTp82V4aZWQBdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4h/52IU; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4h/52IU"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ceab75934dso9438375ad.2
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 03:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787136084; x=1787740884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G8E97ZQvAGrXyZ8ICqBm9FXVCnTnFkg/F1lMXTTvhqA=;
        b=E4h/52IUWYsnudlN910qJUAk9yRyhIbW+pVWWMofeo1NQLql2pnBd56JCdx7T77Rvh
         aIirMS/JcdCsIyh66X9VyCx44UeHug6s+74G/msz6MG4v9mDRqGXhdEXc/NSOmoyV4MR
         5oypUsBIkH4404pD/WPSjoGo99Ishc2QNm4gL1Rd/+YYdBlwJNl5aZ0PP1u2MnLSktG9
         AHGaRrakWwXUnUqgoMIgYoYIfGhz5OzOTBKf/2GIpuYlL4POA+hRxgrrxfPD33fo2wpJ
         33e8CnkW7QKTgISUQrn2y9TRmwVPx6ARqL5FYbfLkSP3GI/EwtJVT+90EBcpf75dmR+g
         2K+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787136084; x=1787740884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G8E97ZQvAGrXyZ8ICqBm9FXVCnTnFkg/F1lMXTTvhqA=;
        b=e080Seucm9Co1zEDSXSY3ZSti80eopzUTrAMSB8rOI5PYZhn00iVvVZhS+YG0HOiBU
         8VtQK5m+yyPG0stOwFKMr5JuvAHO0W/KV5WA0SqRZLklVrN/07oAPUprOOB40bCQAqf5
         4WBOQmxGQ/Lpx1xhldlmYxqRtXGd/yRFOGZQuiWTlDI89PKq83ZbtVPv2gG+75jInEde
         7oivTbUDzvyy7Ayl+RST+4PaRWv5cWcD/64yJyrayH+wlPot1hiphRzxlFTcs0nN+Ev4
         8jkTZvPGCnVfwZhonmEQTzZQmVXNE3rENQUbdi2D9YW6L9c1GzSvnf77O5C7Md83qXjy
         nkaA==
X-Forwarded-Encrypted: i=1; AHgh+RpqRWD20X72Q/fn5DYz7Z3k+AnU2xiT4blAfmJOTGA/Sx9xUhTOoatZ0kuvO2NslOgifM9+OU5fmA8T@vger.kernel.org
X-Gm-Message-State: AFuF++l7th8MVmgym6B+TwCWRql3npFE3kcHUysU7UgtIyyLAVeMp1YW
	IVk83gWVO1soUeloKLfEvCfOJ350N4Nvwlg1TaUXgw/sHlWth1nGkiAz
X-Gm-Gg: AR+sD13k5NqK09KVtRdAV01NL8UeSFszWCm+PotjUkIRHwFtqdkFSwAazXgAy1ZFOPs
	DpWDEB3e5Fx1HhkuBYG10CyXAZZ2Z+ZRPL7aPmQstFzeTdaSeBYpuS1q3YkbZNCeMreMd9jbbr9
	ZL3qCtR12VvQOclunp0gk17OiCQp86wlyNnlG8OgbrdFc83hPJfPF5EiLsJYtvkUbqgPdS7EK2i
	hAq891cQFUkp+PIUiYR9D/oHpPc3HtLcgaPQ23yBj7nei6Ka2FMb0UOwyfT91JO4mmjAOszc5Yf
	IBioUoj7ne+m18ZsnNMDrYiograVe3h/RtWu4fmO2R3UB306mq7buOTZ/kKpFG+iI7oF3yQvzdj
	KHLYxzc0OhLYAmuCebgc8BFCJwpsXtzNNwtIL22oNjJimrv6Kwf9+x2aC+F7hTQszwagk6EfvoN
	gY4V0rIYGbABYbP/Svb4OKqv47oeoxgIR+6KWJH0kCJhtahq3CDO3afd4jiCBFOepDJfQcjBOIF
	5Q6utGmr99BOYDyTWMsSUnt1DUQ8jaLIXw34M89d1ulBaht3Mbv3Ooz6CekEtdf3y0VQJdDKyi1
	Fip+F61dKSY=
X-Received: by 2002:a17:90b:5250:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-3958125375amr7486669a91.14.1787136083791;
        Wed, 19 Aug 2026 03:41:23 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:a897:a9b5:e171:c935])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef77fc0sm11169630eec.8.2026.08.19.03.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:41:23 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 15/15] rtc: rzn1: Add support for Renesas RZ/T2H and RZ/N2H SoCs
Date: Wed, 19 Aug 2026 11:39:26 +0100
Message-ID: <20260819103926.2136712-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for the RTC block found on the Renesas RZ/T2H (R9A09G077)
and RZ/N2H (R9A09G087) SoCs.

These SoCs integrate a closely related variant of the RZ/N1 RTC IP, but
do not implement the RTCA0SUBU register. Use variant-specific match data
to disable SUBU support for these SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- Dropped RB tag from Wolfram.
- Added OF rzt2h_data
- Updated commit message.

v2->v3:
- No changes.

v1->v2:
- Updated commit message to drop reference about RTCA0TCR register.
- Added Reviewed-by tag.
---
 drivers/rtc/rtc-rzn1.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 6097563c5f13..32f6464fe7d2 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -508,11 +508,16 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	return devm_rtc_register_device(rtc->rtcdev);
 }
 
+static const struct rzn1_rtc_data rzt2h_data = {
+	.has_subu = false,
+};
+
 static const struct rzn1_rtc_data rzn1_data = {
 	.has_subu = true,
 };
 
 static const struct of_device_id rzn1_rtc_of_match[] = {
+	{ .compatible	= "renesas,r9a09g077-rtc", .data = &rzt2h_data },
 	{ .compatible	= "renesas,rzn1-rtc", .data = &rzn1_data },
 	{ /* sentinel */ }
 };
-- 
2.43.0

