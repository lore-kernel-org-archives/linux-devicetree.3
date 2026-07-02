Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE623495511
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985740; cv=none; b=W0F+HKZYPqaAHY+v/vduOABFDDwo684oeqePp2PhaL8NCNtYFAfSy659H9aDdS1czOaBYiC1LCsKL7DrDAjcmBR9Z8ynbwUCwkNBeMvRnK9TpCONWVyKNqjNBowfYg9n7x0D0ebkk7rQB8b4Ai4aDNudM5AH6bmAWOjtsZGoYVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985740; c=relaxed/simple;
	bh=q2RoOMzcj0veePsMkspohWrUIvTiV2RGzC3oQwNbiEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mOUPcq/u8VFfrCzgLCTaQWteet+thjhqQvL+IZGYHMO0Ca7YVIrxOrRSsCcnLrpvWlgClJ8YuiK0Tz12w0usGQJrZDjWq+SA40F+KT9gLjhXr/hQjjE94ytH8XRQewwBwVoEI6LRiqptrBnuDvaMTiDg8rwiqYzJIg0oW1Fik1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JDYKeQFK; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDYKeQFK"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47122683cf3so1190009f8f.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 02:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782985737; x=1783590537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zX32mNUoHx/o/ajYaMNh117WhqsQfOxAKwbmb4jDyT0=;
        b=JDYKeQFKEj3DkRllkn8Wq0aO4oOTWTPY7slJjGFblOSWEjQiIU11Omh0aIAGnLLhA/
         dIwelOfW2qNZgMZXlaO0xd+DQQQgPrtcPkNEizxaL/Mqc228b1Lq4VUQq13nMLI4ocAN
         5WCSFtBqsftUcAN7jnr46sYyeNxifg0shH+fQQwkqmE1R6HxtlFQmQ70VSKz1Sbr5U8I
         EcDJoUElVoij71tklE5BpI3u+1LfDPcg4Orok9wiIbatHsgGIsJF8pIkC2GWI77WWc/b
         8hRahPQS2zClYALejfP44GLitQxfyOwdu9nBLvaCr3auvPR2VJlTPEG3E9FhljUUTTcb
         ATlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985737; x=1783590537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zX32mNUoHx/o/ajYaMNh117WhqsQfOxAKwbmb4jDyT0=;
        b=F1ATNxxL7b+xWzXa7IpoHSp2baVCpBqAuvlRiZOByVAlWMEHwDn7xk8jdtSipN9wpn
         Ul/M7I3CEp2EDYY+kVL72txLKiiV3CGmqXDd7nN6t0cT3xDQsP5E+dOuwwWzQqEkwUeN
         DW8hB3cZ04CwnkgtjEMsZ1EzUk1Sxs3ItiJQ9kd2HYL2R9cvd1tiVykXYUXzyxnalIzZ
         abzd+I4iVBCn4g0HfMBaRrTDa8Htdg8r7fOd7xZaXis9yXo2X+ycX+tP9cYqNsPPwZ9E
         i7dE2ysynTNPycYVEAW0cIliSnKLEN859j6K3aBKC5nOUGRM2e+z5DH1CAvgjdkxb3TR
         JSkA==
X-Forwarded-Encrypted: i=1; AHgh+Rr9h7i3GyQ/TX8cTZ9DiYsyoeWljnDeHv7GjnfrpNXTjRtijXr4VBkIxhDhjohYnU99HVoCLrDDsQGj@vger.kernel.org
X-Gm-Message-State: AOJu0YxXJ8/Ivhq/T29879EWEx6OX/gTNSy7WbW/N+3Abe8aVBNy+Q4R
	0wsx7mRqis+/p6PhSBmEd5TnI9tl57mpR8Shd8KP7PdoMBWN/xfLPh1Q
X-Gm-Gg: AfdE7ckQfwvve093uk98LRy1DA4aLHaKn2oHaDDkNE7hGa6sOgtkPJ1lGeXQcQj9qcp
	pZ9D70UmSK3d10QMMCxpWdW5vQfYhKeJWw/gM1x/3ahUfzHv9jLB3m6BmMml+fVwdLOTfV9yRKK
	o8y1fkb1hZhpdHOkm4JK6bUP5qmlF020HLK/aMgcbUMcCnRpUF4qA5cRz/QTDhHZP0Z/1UHNLZE
	Nq3nG0X8ZVIaOI6zNHwszYhZFdJK9mhvax/Mw0ui0Jo7Aw1iEPQvIVOfXxAn1PH1zY6lOl3sEJD
	ytBZ4cq4q7+J95S0KM40eD9Z6yOdx8jSWcJTLI/GRRtKjXiMdpgGmMsXtGSHme/LPzAt1t1/N7P
	uW2KswtwE5lm//LKzXhgL2G8VZuj7YiANOAqx6D9Bnh8ISbzhD/3u/d5gb0Z+q/lqDToAbYvU/J
	TYw3eYRZSS1S2fWX0yNzDXCAY0nCAr9lV0JMW0ehnsWZ6mJpiIPEFy01KGmqPIOOpk/hDdcjn5Q
	g99Jw==
X-Received: by 2002:a05:6000:2309:b0:46e:550a:4d2b with SMTP id ffacd0b85a97d-4775a100b67mr7689307f8f.30.1782985737015;
        Thu, 02 Jul 2026 02:48:57 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-52-250-217.retail.telecomitalia.it. [79.52.250.217])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-477dbe617b1sm7381364f8f.16.2026.07.02.02.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:48:56 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: Wayen Yan <win847@gmail.com>
Subject: [PATCH v6 2/7] thermal/drivers: airoha: fix copy paste error for sen internal
Date: Thu,  2 Jul 2026 11:48:30 +0200
Message-ID: <20260702094846.17325-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260702094846.17325-1-ansuelsmth@gmail.com>
References: <20260702094846.17325-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In airoha_thermal_setup_monitor there is a copy paste error on configuring
the internval for temp monitor. Fix the error and use the correct mask for
the sen interval for the EN7581_TEMPMONCTL2 register.

Fixes: 42de37f40e1b ("thermal/drivers: Add support for Airoha EN7581 thermal sensor")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Wayen Yan <win847@gmail.com>
---
 drivers/thermal/airoha_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/airoha_thermal.c b/drivers/thermal/airoha_thermal.c
index 439aa011b75c..829a7327fc40 100644
--- a/drivers/thermal/airoha_thermal.c
+++ b/drivers/thermal/airoha_thermal.c
@@ -403,7 +403,7 @@ static void airoha_thermal_setup_monitor(struct airoha_thermal_priv *priv)
 	 * sen interval is 379 * 52.715us = 19.97ms
 	 */
 	writel(FIELD_PREP(EN7581_FILT_INTERVAL, 1) |
-	       FIELD_PREP(EN7581_FILT_INTERVAL, 379),
+	       FIELD_PREP(EN7581_SEN_INTERVAL, 379),
 	       priv->base + EN7581_TEMPMONCTL2);
 
 	/* AHB poll is set to 146 * 68.64 = 10.02us */
-- 
2.53.0

