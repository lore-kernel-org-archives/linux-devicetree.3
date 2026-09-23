Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53841436BF0
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 05:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790141793; cv=none; b=pXEhfLCBiMrO6jlhyTv6x6hExJsuFTt2GSdMaO3IB8zIiEovcX/bucJ45h00s5OBms1sGcNQqkeBNEQeop+Nc8CQkqc4cJSbDC4h76BnbDmd1OowMfFqvEa0a0RqYTS3Qr+KyJVQwX7gQnGqR8CWDReGr8cYuhktCWH0TaZpJ9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790141793; c=relaxed/simple;
	bh=OJS6mQlRWmTTimOyj6kC0TvQSBszoDm45iW9XPqV2AQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B8BD+Pnshjd3MVh6CX9dKNCJKEcLAwQs+r4e+eHC9cPAX6KEj+b9lrELKD4zBmdamhF56/GpVwLlN/XGEjM4sOtQE1sLN3d0DuV09U0wN2L24q5Wc2dpz1C7DTl6EOUd84FYAjbglFZx6d84ES9bYERnzicTuR0CYCXFvalNMGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hxUBZbHV; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hxUBZbHV"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4b37a2ffef2so308195b6e.3
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 22:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790141790; x=1790746590; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xhBI/4MYKZ9FiatfUTHQXDlddZz4ARJ+4t2N8WN0Mwk=;
        b=hxUBZbHV6QCZXuCz2XUqH4RtTWSjfTtAuoAbuFYn36LKQ9UFFzkyYjzF681zZBcisc
         8gX0HdHSSHLXMLJWsgtY7NJN8Mh3EKqnpDidPuVjlB1MQQfIqsVIwhx4aN57mur4AG2C
         DLJnCIaN41i/bMg5PjAzqI5BQQu7GQp3OGkgLYkVTaiH1tGvvvFKuBgo8QRZfr0aBtpH
         Ff+a2hfus3Hb/uK/Bl+HCweZCBtrfxN3/DSHnWNc1UatibpDktP5PmqUCHXkPQSlA9NU
         G2PmBYaijuANITHl0C8Ihh0xfNXA+UExUFohEDPfEW13k9XpVleZQAEefxpKgSmAPg7+
         wxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790141790; x=1790746590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xhBI/4MYKZ9FiatfUTHQXDlddZz4ARJ+4t2N8WN0Mwk=;
        b=I5k+KgzgJEoFQOjUCUfzpcTEI0qsGFUuNOyeHyUPCTVnSJrsmvnBfVmnsHKy7+5t92
         ZctIVTWG8tFJNXaj+UwjNeVEymbR6gwWnHGyGpSreQt75v2MX6g5Yxu/Necz9I6XNosx
         ik4uW9KNbEdoT31j6XWlqGBTG9BZmXBXmzhPpbwmxKzEHrdQ9fNxdTcmw4NBrxM1rClT
         ToqMcDP/WRBc0btTpYbnpDiGhLQ98Adr2KnomvYdGNVfFj/ZsYxjPYLeDWl1DY0Mr/91
         vQxjUQqXcOazLtyZZiItZzlPzALwt6/vAgYBK4WwYUf9eLVTf6fCJ70yXzd7F9nDs/nw
         TGig==
X-Forwarded-Encrypted: i=1; AKwUvBzhKXWmKIjiYvxSK0Jd02HSjOvTsNX1TmtkLD2sWlvZGFtl+L1xF3OukgvCPHQRAzZV6+HSo8v48go2@vger.kernel.org
X-Gm-Message-State: AFuF++ntH/bt1/MhIUHj3vThcqtBGDx5mZUDGoK4U8ixBk2r077Pb9Nd
	jXPk/ctKjSG0k92PEJrgWODIHqmJ+zYQKvDgUfrmkqxMn6iGbgwrnXEG
X-Gm-Gg: AYBFou1nddIBoKrEjj25ElgcECpi9J/xeqKCz83YOl3PaToQ+wzfkcOBSfTncKyz/nT
	sUHVRPawGKrxJHIwjlUctNlbNROzxjWPk3Fw1ifhvGGg7za/3WPhkcxfPJIrHZrvtcIqhXNcZtf
	wcvtnDumlagjRAJA/xtTLuCWFn4q+sDnmzFrp3aqDGPo227049nR3ITIu4dlk+KSShKfLcV7H2J
	EArIfmLYdNxtHWHhxcSlxKff2lhQQiTYH/o9yluHvdwvHMQ1DH+MK7NU67InKkuxPAw+EDRfMwP
	5g108kW/uArEKAI2RPmjYTbiqgY1wTzY8I2Xt5XeokbP4W/YBKlp6rCncEVa63MAcV9QOF6N2uL
	pizT8bbZWIQVVXNjiNCUQLXlAVwgXdwM0Boec8eKsslpy8hDDBH3RfrmzTxKhvPRDKdbL1GD0Lu
	bHRNmz70zzwRRuXighlDyPGEhkt5X7/Hw319Ful4JPQPGiEPaLq7yWscUTCkXnqsdsdzFAhQMIH
	mZCYuWxw8pMUnf5HqZnJUn9r9use+IOnfcOyvkB/sZds3ZP4C1x0zB3QzH14DdnoEuqrodatsqV
	ROA4kWvp8tm55pnrXrLnJtv8yfi97fpa5vz8Ezl0oEOts4TtRYxEybUR+DigPkqy/hKs7/bh8v3
	ASQ5snBIc5Z9dZG60THW1
X-Received: by 2002:a05:6808:1495:b0:4b9:e5fa:8a1d with SMTP id 5614622812f47-4d5ba092ea7mr1861997b6e.34.1790141789974;
        Tue, 22 Sep 2026 22:36:29 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d5c4aed99bsm1436896b6e.12.2026.09.22.22.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 22:36:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 22 Sep 2026 23:36:18 -0600
Subject: [PATCH v10 5/5] MAINTAINERS: Add entry on Allwinner sun8i/H616 PWM
 driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-h616-pwm-v8-v10-5-dccebbe1aabf@gmail.com>
References: <20260922-h616-pwm-v8-v10-0-dccebbe1aabf@gmail.com>
In-Reply-To: <20260922-h616-pwm-v8-v10-0-dccebbe1aabf@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

From: Richard Genoud <richard.genoud@bootlin.com>

Add myself as maintainer of Allwinner SUN8I PWM driver.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc3cae2e378b..d9713b1044c2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -918,6 +918,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
 F:	drivers/hwspinlock/sun6i_hwspinlock.c
 
+ALLWINNER SUN8I PWM DRIVER
+M:	Richard Genoud <richard.genoud@bootlin.com>
+S:	Maintained
+F:	drivers/pwm/pwm-sun8i.c
+
 ALLWINNER THERMAL DRIVER
 M:	Vasily Khoruzhick <anarsoul@gmail.com>
 M:	Yangtao Li <tiny.windzz@gmail.com>

-- 
2.53.0

