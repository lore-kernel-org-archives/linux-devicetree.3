Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795818783;
	b=2YaMiLhidfJeMWtHiC0haM0e2x84A5wp17QJBE1HB0rFkvVgNDooUzNFrMzBEmuGrlTU
	 wl4MR3NvYGLyfK41nH8wcKwWcgoJn3fLv2Ehl9oYSTOirVV6auRkHdi0E8NO4vwTfklkj
	 o5Hwg8ogNqyJ4MUm5wciQBToTueLg/6/sUfC56YnP/x79j4V1mxufZOhdfaXjDr+WizNy
	 3n9GWMUhT6hALseB2n9vAGYvsz8FpZx7RdA/dYcru0nRWiyLEYfII2TgMIv96TclN2AUu
	 8gxMP9PguPTvTmOYbg56GX7Hj089viYH3TOMXFLt1HXJxI/68gAXHxD/DUd+d3Pm9qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795818783;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=k/KosUODM3E0fiMrzq8AJvlBOzlPE3xFAe43O33GX5w=;
	b=OK+p2RHt8rnaDY8XOKjM6CJQfJD85LOI97+VwZlgMl3mE2EqtkcTrmkuIZhb7WVmSNP8
	 Xh1NIL8e5RLRBMbLYOUKvVDligyAO8nUtyJfq7/KjzMQ+osES7UvuNIUVoSs8shZjN7Sj
	 eEp3jSeDXduqm64ea7oWiO9nmuTBmdPEev91Q/kuKKKgkO5jONbKEIA84FVyJt7NgT29+
	 aO6ObBDW/jGRECyL9biErFinRNgbnoz3Xs1HhC+ybMkTu8GZP5xR/Bzx6XnCf31uAEH3n
	 mpZX1G6S8E1zdSFHHbzMPoR1h0VgsgGPHa4jmK7hqk9l/xmuU0QTYxETVhuofHJs9ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="wJ7wQms/";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C46606A32D
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 22:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9C46606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wJ7wQms/
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so6069953f8f.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795818781; x=1796423581; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k/KosUODM3E0fiMrzq8AJvlBOzlPE3xFAe43O33GX5w=;
        b=wJ7wQms/FbVFfSS9GId+NAkDIUaPJ09YungOD+wW1zjd1tf77BqwLwmlXhnQC6+BA6
         UL9lKsq1GyngUuFmiJOwcuVTmcWF3gbgQ60pPwqivQ6QV2IVYBTjsFFZJbF1z4Rjcgkk
         HyTZL83web5sRNEg9b6RdEXblW1miFnv2AuxhMGkTd+h9ezYCXoeR8KZ+DMkfoo2PHxz
         tKPZr7cFl8NoV7I6pgxzqfdWCM+EmPrxUWjYnCDBip3IC/OG6EvnJa3ivQ+WwIieYQgQ
         jO8vY+zcoe0FcKKaUu4jS9C+tfnyRec4VGwYcrbRCzgZQOgb66bo9BOKA8PgsSB+0YcL
         ZHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795818781; x=1796423581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k/KosUODM3E0fiMrzq8AJvlBOzlPE3xFAe43O33GX5w=;
        b=BgzLvK46X0wquGV525BqBQEvrv6kyHhERD+byLDrVaCVvBu2tcmaD0ivCFxB/rf5RN
         4ejCIHmyTpkzDA1EnLv2QOEbZjgZcZB74q8myTbxYnvSJeRlWjG0sYTbpIPvdlKQJD9N
         6VroC94zK5KXWF7+/1cbll0QzgmJTffwY9f20x+pra0QJRlyiG5atbldLLX2YXw166S9
         kfdthQURZYvUKOnuPAROW6T+Vd4E7OBXRSf+XT1AcHppuahOtKRuZeclbjxisKAjj93i
         HBjnQkGeytANBEXvcTAz+PN42TBRj3xicW8JM7glqqVSGUcxR7UQ6RzBtO6lleyGJ2gy
         G7rA==
X-Forwarded-Encrypted: i=1; AL+hErFQTW5EkIxCe5EteLXj4MHaDrUKGSBuxW2E3DP/VIZsPT7pbOrJKAhXmkvkHyehDQerCmonqhXWuFlb@vger.kernel.org
X-Gm-Message-State: APuU4Z92bJfzxcvbLM7Qyg3ERKogirswnTIuB6E00DACPsFiVbCWx+Ue
	eYcfxdDxWzkYUsG3gURZYFwtpaSFkr61+ZINAZa8mUXq0zDLfZTBc+Ic3hMjwIgCsMYb1Q==
X-Gm-Gg: AZFdTZfpqE/ShiiKMGA+ubssZTCB0F36wZFidPThWGj3/Vop6GqaKrNi/8Jyi6juf2c
	N4Rr5icXZ+cY1XtqhStsZGvopleARGtV150cv1XeoCnw34w9n9AREPOjc4LofeawGs1G1i35uBE
	dFLF93/+wgs4PyPeFyXT/3T0Urqss/h+1zdej8lYx5Xp7IYU5PSDbmDoDHyYczEJ5tU4yJBUUm8
	snwtPShUC5ZALE8NhVZ4T99UMViUsTrOUiI7TM36zdHELb7wKH2e/v3G9Y8W7p8CF8K2+1DsfP6
	hZhg0HzkQPtmZswbNRORZraw4GhWG2fVUgFtswft7GPWTQuIaPrRO/VgHU4XEzZYLnKr9JHmUMZ
	1cdTfGX737QLZSmNkPsLH4kI5qPW1KAtr5w1KnHSDJ32wLJdOpY1oWAPLDfMkE1zJ5JNBP2tc+f
	xD5uW83xuXcPubqJlOWiBspbp61y3TTUB+y9jrVn9U4a8pBaFPtpMK0XCI9NJ+sErNQfXP31pZq
	Gr4hf/rSB325UjxY96ShPXSUAXTrxKe39h7bklRR6OElQUO4FxEUYKuTOf+ZsLo489kakH7l2FU
	Uper2B1+cHkP0UNRxVCEI3QNPExW/go5
X-Received: by 2002:adf:e006:0:10b0:4a6:8012:19a with SMTP id ffacd0b85a97d-4abb18cb896mr35464456f8f.22.1795818781206;
        Fri, 27 Nov 2026 14:33:01 -0800 (PST)
Received: from [127.0.1.1] ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm50430285f8f.20.2026.11.27.14.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 14:33:00 -0800 (PST)
From: =?utf-8?q?Adil_H=C3=BCsrev_Tepe?= <tadilhusrev@gmail.com>
Date: Sat, 28 Nov 2026 01:32:54 +0300
Subject: [PATCH v2 2/3] power: supply: s2mu005-battery: make the alert
 interrupt optional
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261128-s2mu106-fg-v2-2-2c3142e05aaf@gmail.com>
References: <20261128-s2mu106-fg-v2-0-2c3142e05aaf@gmail.com>
In-Reply-To: <20261128-s2mu106-fg-v2-0-2c3142e05aaf@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Yassine Oudjana <y.oudjana@protonmail.com>, 
 =?utf-8?q?Adil_H=C3=BCsrev_Tepe?= <tadilhusrev@gmail.com>
X-Mailer: b4 0.16.0

The driver unconditionally requests the fuel-gauge alert interrupt and
fails to probe if the board does not wire it. Not all boards route the
alert line (for example the Samsung Galaxy XCover5), so only request the
interrupt when one is present; the gauge is otherwise polled on demand.

Signed-off-by: Adil Hüsrev Tepe <tadilhusrev@gmail.com>
---
 drivers/power/supply/s2mu005-battery.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/power/supply/s2mu005-battery.c b/drivers/power/supply/s2mu005-battery.c
index a76154e5a09..9798a62ffec 100644
--- a/drivers/power/supply/s2mu005-battery.c
+++ b/drivers/power/supply/s2mu005-battery.c
@@ -273,11 +273,13 @@ static int s2mu005_fg_i2c_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(priv->psy),
 				     "failed to register power supply subsystem\n");
 
-	ret = devm_request_threaded_irq(priv->dev, client->irq, NULL,
-					s2mu005_handle_irq, IRQF_ONESHOT,
-					psy_desc->name, priv);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to request IRQ\n");
+	if (client->irq > 0) {
+		ret = devm_request_threaded_irq(priv->dev, client->irq, NULL,
+						s2mu005_handle_irq, IRQF_ONESHOT,
+						psy_desc->name, priv);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to request IRQ\n");
+	}
 
 	return 0;
 }

-- 
2.53.0

