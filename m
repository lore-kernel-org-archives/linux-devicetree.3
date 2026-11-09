Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217321;
	b=JEhuloA/HUoSGQuuDO8l4D6eT2IwEXQMtSt40CC/3LD0CXiXm4CJRSBDzF3catbEQBpD
	 HkRphZ4a6mKTFpHUg1B80zCNazbcpvy9X+GSKo0epW7ftPSRWsF0w17FNjoK+E3VQBuyu
	 MBbbyMDjGC7y2F/22kV9U+H6eS4i9NT1yyb0sRnwPRZDeY0Mno1sP4JHPBOcw1oEnFMjr
	 qpHY4G3fTVTPudn2vHhnduXrKlz9Nh/BRJTup+oevPPX/3+b/6sJ/kf0FKfx8PViemB7E
	 96KfC6f4TZCqH2hMLoMnsQI2VosGGvxfUPPPGlUAMezxnhNvO5mISJOu44qhBHdPFjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=VT/zo9JcAtk0rbqrKOPs9YxznKVRxb2WxMsneu8EByM=;
	b=FhFS3TGz1enPedLLSMB6ptbYlzJcCgVPcPrv/Fs94u0Jn/gYUUTHm9Lm/JYR+RXrc+zh
	 PQriJJA0TrnPNcPJsokpb92TBl6jlavT23vCx/KlTIRt0UPgqe5CPUIyrl2xWp6Hh9UUU
	 y3fDOjYU2levu3HMkmL7pikofcwVccpgGp/eSxKF75lpCmRScN8gyriH+tiLswZWTN24S
	 +IXcsRHSRLnecas82p5TimA7PGdNSL6rKCsfr8MhuajMMabQCKgCZYtIJf2L67pfb3/9d
	 sJxUwfDDyeIuEe8S6fQ1y53dUNnLL9d1Ip8jVfUR+eOkdfqdnfcP7LODPOoH+yoHdWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=jwJWJpYG;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DFC606A330
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 09:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90DFC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=jwJWJpYG
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so437336f8f.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 01:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794217320; x=1794822120; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VT/zo9JcAtk0rbqrKOPs9YxznKVRxb2WxMsneu8EByM=;
        b=jwJWJpYG53W3bYNAMjjnfAHNEopoiPfqGyHAI24dyaZQLuAXG/R0aWT62L7iE4Xa+l
         nWuO1sGeg0D2G3nth8+R38WlTxdcOvd6mvfGIzMulOxmvp7AoazK5iluv2N3oUOZ/1Dz
         LVIuHoEKRz4PPldNoDNglzCZ985xc9uoyEI2GQT/QHjpy00HhmmNLf3u1OOEa96NNl/Z
         79wzRaz1EcbQ/uJtFl/1uOw/AYqFsdf9/EvwYYdhplVoG1uaz73zyGe7a7aiTGmheFPT
         Z2V1uJjmro20ysyMeFGTlEFfIrEjM0J4KZ7Bx6jqPQfBKH9jj0cv0/VpjXq/STAlG0U9
         AqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794217320; x=1794822120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VT/zo9JcAtk0rbqrKOPs9YxznKVRxb2WxMsneu8EByM=;
        b=wz1nlYnCeva+6X+8jdz/FsVsodfgz/aE5YkFPwfO6q5FY7bYoFbt4TORzMBkT1wn6u
         TjXBVnQCS9sbQb+JyZws3TDV99P+OiO04V1rpjmap3nr2/Y2TNGWbDzO6h3Uh0TUiqp/
         GgjOJfpb1HeSIkkZfz3eC9lcDguQHwahgRKFcobzJGs7bnygKzM7rRwT24HBMQsAIU+R
         m9jDFC1u+CKwbBpQA9h+51dvl+9Cw8AurDiGQjWCOtrbt4XqJzAGPo/WsgPcJ+EAwR7w
         6pW03gXVlK1U3RKnpvTc3pmv1HANFNkQCUSlcia1OyEoIg3+nJXQPipaFzmOIOKBCD8H
         4Tow==
X-Forwarded-Encrypted: i=1; AL+hErEyPBjSRUtCte/dLqKwE+cKtSYpkKW9xw3uJhdm70a+rejvZ8aA6T2kvKa/BVtrvED1XH8D3qZFLW9F@vger.kernel.org
X-Gm-Message-State: APuU4Z+NlycYqreA3mvnpM6zkpdyr8INEOha/VyF/oa6E9f4Ic8lH04u
	KN8Genf1zswtUTekiL7PzX85Q1BXNdjiL7+jS3AecdPixA1L5cmDOxPdy0v4wwP+378=
X-Gm-Gg: AYBFou1GGYYpnCqm14lTawzXWYvIZNNhkLlRTchJD2VK6Af38FHFlmiYLPaJH9ANP6Z
	XrNGl96dmXl75YgWpEujjb0kNJUrLsocCY6bWIb5AbsBot1t+5gO5axmtptlLxdOs/A3bgvp+0s
	SfjxIEP26Sitvpl2rnBJ828p5gN9ZWpVoRDdgiOmqbuacWgiVjnJFQrtAcuvwj8WxKwVGIEXdPC
	AVVdhHIns0IYWPsmvHiCM1MwKZt5XnO1n6cklL3g4HkUcEKIXSvjGLMmByKa1G9R9ekTvfo/eGD
	P3rWCIJyDjqWvEVR1pXv2Wkxa6SKlC41puWqGf91xIa0AKZzJhDxl4vNnnUD2j60Zfq5Emmm3IZ
	e6Z+nDFKJcoLhzZ80YtNpqlaCADvVZ/zbHqcNlb9go1mXmmpNvRn68KNYv6EFv6Q4phGN988pFA
	hl8chI49bigdZMPXe1mKS1HhgNjYd1om5FKwFeaDDPOSMkdYCutnosAVk8h9CoqYOKIsinp7y7f
	a1/UOnHHQlforkEmHKcdUJQ5WB4Kh6ZMSLG1DGuc7MofwDAh3pBsYKVXd6DE/UOpczsFVnXENQB
	9bJ+aR83vKP5VoWthkhdBiCo8LNfH7tJ82bBWSA8fd8FXkhcxuCN8FDJyQaQ6N5javqVvlYNggz
	hq380kYNG
X-Received: by 2002:a05:6000:40cc:b0:491:8462:20b6 with SMTP id ffacd0b85a97d-49583b0bb95mr7229716f8f.38.1794217320053;
        Mon, 09 Nov 2026 01:42:00 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-496150c6e90sm7278409f8f.2.2026.11.09.01.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:41:59 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 09 Nov 2026 13:41:50 +0400
Subject: [PATCH 3/3] power: supply: samsung-sdi-battery: Set the charging
 temperature range
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-battery-charge-temp-range-v1-3-a967abd8b80c@flipper.net>
References: <20261109-battery-charge-temp-range-v1-0-a967abd8b80c@flipper.net>
In-Reply-To: <20261109-battery-charge-temp-range-v1-0-a967abd8b80c@flipper.net>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3153; i=alchark@flipper.net;
 h=from:subject:message-id; bh=V8yoLBrj8mD8VVaKSjnQMeP0OJ8ZemjP5irT6VMLt1s=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9nBr/fPfb15KlzZO16yduUD768jeXhcjnVj5DpgRJL
 hMNxScvOiayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjqpy2MDDdCOaqtnSM+/X/1XYypuTEjYN7OXY+Zjot2zZ7+qJ7j/QmGvxJuK24
 sPvOnbdXWZyGLJvPtfDJ39661LZ3XriRvnCNpvY0BAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Give each battery a charging range equal to its operating range, as the
firmware parsing does when charge-temp-range-celsius is absent, since
these static descriptions skip that parsing: keep their behaviour
unchanged.

Leave any correction of these limits to a separate change, but note
that they follow the charge-block thresholds of the matching vendor
kernels, which count in tenths of a degree: the -50C and -30C lower
limits look like a unit slip in the original import, as -50 there
means -5C.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/power/supply/samsung-sdi-battery.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/power/supply/samsung-sdi-battery.c b/drivers/power/supply/samsung-sdi-battery.c
index 33565002ee27..da283735df3b 100644
--- a/drivers/power/supply/samsung-sdi-battery.c
+++ b/drivers/power/supply/samsung-sdi-battery.c
@@ -659,6 +659,8 @@ static struct samsung_sdi_battery samsung_sdi_batteries[] = {
 			.temp_alert_min = 0,
 			.temp_alert_max = 40,
 			.temp_max = 60,
+			.temp_charge_min = -50,
+			.temp_charge_max = 60,
 			.resist_table = samsung_temp2res,
 			.resist_table_size = ARRAY_SIZE(samsung_temp2res),
 			/* If you have tables for more temperatures, add them */
@@ -703,6 +705,8 @@ static struct samsung_sdi_battery samsung_sdi_batteries[] = {
 			.temp_alert_min = 0,
 			.temp_alert_max = 40,
 			.temp_max = 47,
+			.temp_charge_min = -30,
+			.temp_charge_max = 47,
 			.resist_table = samsung_temp2res,
 			.resist_table_size = ARRAY_SIZE(samsung_temp2res),
 			/* If you have tables for more temperatures, add them */
@@ -747,6 +751,8 @@ static struct samsung_sdi_battery samsung_sdi_batteries[] = {
 			.temp_alert_min = 0,
 			.temp_alert_max = 43,
 			.temp_max = 49,
+			.temp_charge_min = -50,
+			.temp_charge_max = 49,
 			.resist_table = samsung_temp2res,
 			.resist_table_size = ARRAY_SIZE(samsung_temp2res),
 			/* If you have tables for more temperatures, add them */
@@ -790,6 +796,8 @@ static struct samsung_sdi_battery samsung_sdi_batteries[] = {
 			.temp_alert_min = 0,
 			.temp_alert_max = 40,
 			.temp_max = 60,
+			.temp_charge_min = -50,
+			.temp_charge_max = 60,
 			.resist_table = samsung_temp2res,
 			.resist_table_size = ARRAY_SIZE(samsung_temp2res),
 			/* If you have tables for more temperatures, add them */
@@ -835,6 +843,8 @@ static struct samsung_sdi_battery samsung_sdi_batteries[] = {
 			.temp_alert_min = 0,
 			.temp_alert_max = 40,
 			.temp_max = 60,
+			.temp_charge_min = -5,
+			.temp_charge_max = 60,
 			.resist_table = samsung_temp2res,
 			.resist_table_size = ARRAY_SIZE(samsung_temp2res),
 			/* If you have tables for more temperatures, add them */
@@ -879,6 +889,8 @@ static struct samsung_sdi_battery samsung_sdi_batteries[] = {
 			.temp_alert_min = 0,
 			.temp_alert_max = 40,
 			.temp_max = 60,
+			.temp_charge_min = -5,
+			.temp_charge_max = 60,
 			.resist_table = samsung_temp2res,
 			.resist_table_size = ARRAY_SIZE(samsung_temp2res),
 			/* If you have tables for more temperatures, add them */

-- 
2.56.0

