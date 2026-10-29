Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793300312;
	b=GK742s6CZldraXzktkqpnbcz1L/CYHh3f0c3EcD8ahpMsh4e5Q0WxizM82EFZIfg3taK
	 XffIkyX7iLYJS5G7v7IVkLnXEKj3L/mtyoNhYbr1ikrJ6MToCK7MrWa/PLgzeqX+SG9Kn
	 WuIZoIGd7Pk+7x8cnL5LcHOPd31GvBYArSN5041B9XGn8fBJzPRJ+tJNt+7YR681rbdMO
	 KPUhhGfahgfCzDlNLm1YyyGV74aJwHyMM3k9k61N08OM6IMRtRPwshBalG+sdqRyGoV4N
	 wiR55pmROuytjJCo/IhzJXAiX+KJTELqZX+px/ALKo1Sn+ntbkrSft+265MBCZYLLKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=6NiIJbfZDLQcgnQVEATQe5cFMLLhwsPwprswJhOKbJE=;
	b=AIeRiVsdC5CUeqgyAUJidkBWuqhe2P/5qkfM7Y5euPDnrkKnzKd+jz7EbHZoQHFpeTeS
	 rQ6ehsih3Zfcz3GeLCq78dM7aKnr1CuEZW7Tte4W6pmUDLxn55tpKTOceQu8V92DC8ly9
	 PbZFYFhnTZWTQqb5C68e4cPMqot5gNrZAwi3W61afnjwOvI6REyra7hfbbidOtu0DTSgS
	 fbe4MzUfokvm+y3K4XgXXZJio1aJhPUVMvS0L2aXcgyA9L+KIqJMlCiQZhLM3jgM8G4OL
	 Ild9yalxnO+YneNZGgK2gXju4j+SpWvs8r5Y+kJWhw6cTEkB3RSUqMxeVZ/teILaxaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W6Li9nBb;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD4C60A2607
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:58:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAD4C60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W6Li9nBb
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a215e64962so27204755e9.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 11:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793300310; x=1793905110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6NiIJbfZDLQcgnQVEATQe5cFMLLhwsPwprswJhOKbJE=;
        b=W6Li9nBbOH3I7zCAIEMwCC+RFJ6M+Um0HDMGFCIlP+7kpt4HiWzQ9YKXvGJFFYCYzN
         LafNLthR7/t5qCfYuyB1K1WZCt2Ptx4b19oulfm/U6RbervAlpLk24EQsYqQUrzo13ey
         OjjfL+AhmuDxhC6z/EbeF5rJiDshnHe86qyqn3djvK1zZSHoofIcuybmN/MWnlG+3C9Q
         neItSngWkCTs95pSTyzKFHLQ24dPDOvreHeISxFy4UaS0tx8inhC3jDb0cVuVsCf+dNh
         F2Kzm9+VBH0B1bGlUpzJvX7bJM8UfD887VOTvopgPM/2ViP/xKAi6KGZrX6kqxMacHt/
         3HhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793300310; x=1793905110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6NiIJbfZDLQcgnQVEATQe5cFMLLhwsPwprswJhOKbJE=;
        b=1D+fVF14akv9V/DIyQHMUXxi1sMAEL56PCLwHTAYITcOvH4pYG63GQrG8sM2xHgtfU
         2hY5J4PzR4yaaQv2EyrE4qFa5tXoffIrK1Tg4QTSsrqRIY/msQ1qEWdqgG1uVnOGJJIp
         XHci12ydrmDMALp8a4+c+LT/roJPNmMVIRoCR22z++SR4mi0q+aVydKrOLBsBkX7Fvw1
         lMITixeEjN4bbbQf1tZ3xj045Wu9zeDwnN1mcbsk0hxE7XXzDLIgvmzjP4iRr+8C3IIY
         sKzmG/iU7gRnn49F5xWShoO5Iktpu0OaTlLjod4M8vsZCsO0Vs3vesk2e6kQgxnqenHF
         wekA==
X-Forwarded-Encrypted: i=1; AKwUvBys29rw4FJcUMj0mdwAiveAWX5/pVYWacbXIVPsxNEhNUZbHuDexeiRCq7bFX2U3qu1AOJF17tVIHZ4@vger.kernel.org
X-Gm-Message-State: AFq9FYIrUXWvzo2xloFBgWbvLrKp1eTY3zFLzrzqXNKb2kyfhuPxv1ta
	BiH9a4zi67Kb+ymUlvQOkBtP7ey50VHnogGHfberTOobZhyinVHHyXPe
X-Gm-Gg: AYBFou2vhFDX8cYtuLCaKn8CMStSNuEzYVTO66TgC4GrGi/6DW0O9n3JL02cp2CleKc
	Vda/ZCRYvravHItl4jHb4cLzENCvxKwI2/KaUyuw3BG1zkjIjMh6+m6FdudEq6hquYJ4e1JXvLc
	r4kzgLoQquLryUYLktA2bo/wXskvEy+lNk+Zvj3TaXDzrN2oB+/qmTJm8P4D4Hx65mS3hYJ0qCG
	ch0f9XZbk2I5EEhVEonnVEie/g0ea2msA+Ri5Hi3d9kAwmGWGC31z5aaPaxowWlcDa2bRSn7cRr
	9MT4tbzTolZ2jRwOkg3gL/HPoQ/P0mT/ysH0zLhqwkQ6WvJyNMN8deAev4VMmg5h8NEov/5SisB
	Al9P1SOuLIRDUPtlI5QZr71/DOfbIIBCjY09auPTPg/DiAva+Nt6jn8ekaWlOx1XvPQdTPgCXwG
	YPW+zMCW0Z5GMRoh9aw5NYu87x2hT4vhfLizTnl1rtWWuDOx3F6+dQHiHkdIVG2OEE21eHom4ae
	dXMjhXZhgWlfWdAeR3WovO7eJMPvN37DSk1RLRJWZCqAYUy4UXU369OuLq0VjT/kIWEgQxjKH+1
	kMdn8ofxREJW44iO936g0BqHsBdGBvMoxh0qnzAOTvPZX2fyK4xpe4JVYee1PoS7zA==
X-Received: by 2002:a05:600c:4452:b0:4a2:fe3:121b with SMTP id 5b1f17b1804b1-4aa4eb767d1mr109168165e9.28.1793300310013;
        Thu, 29 Oct 2026 11:58:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:eafc:6fb2:6c68:5ae0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896fesm94291535e9.10.2026.10.29.11.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:58:29 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Thu, 29 Oct 2026 18:58:26 +0000
Subject: [PATCH v9 5/7] pwm: rzg2l-gpt: Add calculate_prescale() callback
 to struct rzg2l_gpt_info
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
Message-Id: <20261029-gpt_rzg3e-v9-5-f3a5520388d3@bp.renesas.com>
References: <20261029-gpt_rzg3e-v9-0-f3a5520388d3@bp.renesas.com>
In-Reply-To: <20261029-gpt_rzg3e-v9-0-f3a5520388d3@bp.renesas.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793300303; l=1990;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=DnYvXEhe2LMltaNENp8vW0xC//QuE96dZgztWBm3rrk=;
 b=CK3VHcCXw9rTMEjI22TqEvQEVUCyyXdeyzmXLoK9wLQ0+spxEB36xJifO8uF25dlYx+f0Mul0
 jfkI98ayXVrCNT7pZ9ni646PaDdBekUV0cwLCuiScODb10qDlxbZSav
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G2L GPT prescaler steps are continuous powers of 4, while RZ/G3E
uses powers of 2 but with a discontinuous sequence. Add a
calculate_prescale function pointer to struct rzg2l_gpt_info to allow
per-SoC prescaler selection logic. Replace the direct call to
rzg2l_gpt_calculate_prescale() in rzg2l_gpt_round_waveform_tohw() with an
indirect call through info->calculate_prescale(). Wire the existing
rzg2l_gpt_calculate_prescale() into rzg2l_data to preserve current RZ/G2L
behaviour.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v8->v9:
 * No change.
v7->v8:
 * No change.
v6->v7:
 * No change.
v5->v6:
 * No change.
v4->v5:
 * Updated commit description.
v3->v4:
 * No change.
v2->v3:
 * No change.
v1->v2:
 * Collected tag.
---
 drivers/pwm/pwm-rzg2l-gpt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index 414aa5db4c4b..488839e99464 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -78,6 +78,7 @@
 #define RZG2L_MAX_TICKS		((u64)U32_MAX * RZG2L_MAX_SCALE_FACTOR)
 
 struct rzg2l_gpt_info {
+	u8 (*calculate_prescale)(u64 period);
 	u32 gtcr_tpcs;
 	u8 prescale_mult;
 };
@@ -290,7 +291,7 @@ static int rzg2l_gpt_round_waveform_tohw(struct pwm_chip *chip,
 		period_ticks = rzg2l_gpt->period_ticks[ch];
 		wfhw->prescale = rzg2l_gpt->prescale[ch];
 	} else {
-		wfhw->prescale = rzg2l_gpt_calculate_prescale(period_ticks);
+		wfhw->prescale = info->calculate_prescale(period_ticks);
 	}
 
 	wfhw->gtpr = rzg2l_gpt_calculate_pv_or_dc(info, period_ticks, wfhw->prescale);
@@ -520,6 +521,7 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 }
 
 static const struct rzg2l_gpt_info rzg2l_data = {
+	.calculate_prescale = rzg2l_gpt_calculate_prescale,
 	.gtcr_tpcs = RZG2L_GTCR_TPCS,
 	.prescale_mult = 2,
 };

-- 
2.43.0

