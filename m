Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793173483;
	b=Oamw+FxzTh7uBKyZ/BYUcgNbWXjGUJx4f+dGQ+7gjBJOtA300bt2cJ8CcCPWr6LAWZC9
	 cweKzl7dvcwJmKqqXK4kuz9uQ5fe+x3GlvatJ2tpgnDblEjAD0/OOOXFCLa4xRXpC1Ahk
	 ZbQCDbzlkbKafywJELAs3XOv11/AQiVJg+gzZjEjrT0omCQEAvIAJAEojmJny2s5KArzy
	 J0G1DeQPUypkMFNEunDGfCRdLQ7Lk+kQ+C4lHEFVtd4b8dzEN20Yh9TeNI1OgdKBvGNBb
	 2gLgdn9c6PLhAT8wP9vzAs8WBLpLwzlwu6LIqmh/lH6dUmlgIdY5bi5MOgUCg1m680w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793173483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7E62fJcGHq55xcKvRmAIwxtjg2iKkbG/L6LZzBK+bJQ=;
	b=VI4hT6elD4gWb3ZjmHmhwuP0Rtp+ZI12esjUCYCVbqJnEkf5r1iTiSZmOoUX3YeDuqB/
	 yvQkWb+IUOTAYR7B+NaePDxgnwTuqNZm4meIcHKKq5/Txl5gFdHHneEbdxyzozr8sb5Ag
	 ZRNaArPTsnlRqlj8DcTZ64Bked6uls/y3FutoSOPeVu8xvTPxeNVtbsM8Sav8j+SSC3qg
	 2OD0yNFL98FPo8EluhQNmlAofCFIEKK+c0aYow+GPcKyTJX3q8MpmhcGcewo2lTzYBCD/
	 1FvKctPmF4lJNL01r6OjO0DeRrAfdOGDST30VCx+Kd0AgUML4VtcZ+DjYdsQZG3QbVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=nrdMt9Vw;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B166606A330
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 07:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B166606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=nrdMt9Vw
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a208d93758so6205175e9.3
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 00:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793173482; x=1793778282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7E62fJcGHq55xcKvRmAIwxtjg2iKkbG/L6LZzBK+bJQ=;
        b=nrdMt9VwmmOe28+pqyx7enI1UOG1KjguwL7POql9xO0XqbrCrqez9lWvBKHlMP5ECj
         7oG0A/C4RLtkdSXO+nusOuulRlJaobkaBE91QmUonmXLjMc2heuWLbjw58LQtQq1SWW5
         cfdJvtdwG63og663E7nszcJuNHHBFKm15t+bI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793173482; x=1793778282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7E62fJcGHq55xcKvRmAIwxtjg2iKkbG/L6LZzBK+bJQ=;
        b=sbfKvdlEJ+em69r4qNN1gGdOHalxdLfg+TBwXoyOkiraB8RlIDTCdZXbe0wcGBilT0
         N3EwIG7UQoDV8Ni6/nfFdu4z5EBJUAUkikWGoaVzpy79gHYBCyItJfSIgLNbN4nBGrIe
         uWtgm1QclCmkzYGTFjlIsWTwdgK7ThrEtRTdCr9GQFmSKh1ldIUIfp5G0zEivD4yWSFe
         5uxX8Qmafe4dw7hxksl9cfAej5vOOO5cToiZgSv0bXkPbzci3ECW0wddd8oVzkbWYKuG
         1uecRT/Ex7PNrTICkUtvvjaWszm+UKrvys4yZroaJOGlHyLhnyl6p7wRE9BxE921sWjN
         eEow==
X-Forwarded-Encrypted: i=1; AKwUvBxvmbSYyCcWxUK01uuqOdywYtdVUBYopzFA13KDnMVK6sVMMDvD3PViuUlzviSv+aSchgxhdmJ3E9AE@vger.kernel.org
X-Gm-Message-State: AFq9FYL0g7x8QYs78Vx7U2J88QremiRVFn3YbFMBqlSwfA0DUpUhQ7AJ
	5NpEqbkvL7y3LNLzWXysABgxU9WnXddMmALVbp7Q228qVvbTmpQqxaI/AVcaYhZidIM=
X-Gm-Gg: AYBFou3qUWTNnvAf6D7xil5oA/KItxENWCFaML7HWCQeDNzGxbcnIe3LHOIvMSAXsJJ
	19fPnspmFdbYaKHHgQXPOk67hmQNcSxAbyr/8eFInR9QDsbNKg7RNIbrXsvwKXC3Y4bGuGR3KGz
	yWs2FP7d6AcIJWVgoAGoulrq4Qc9YtDD45Ns6EnWL+SeDxbJPpUh5LTo9WOIDB9A9oYEv5Bivhs
	AYZjMxaM83dnBM80iXw9mtgq3qg4OwajWvAck2ak02orVVOXHNGpTuTkYptU5A6mVXgQfaY3CME
	4X/S01Bo+ZVEbwdI9tAFtiNlMG7D+0ezKLjlXcrpac3uuDNV2KxFUF7ISRcSfxnLHzGZ/xsM00K
	XEp0kBT6a5pAB6aDdvT2jsk3+zjKr22UnOJPb3TYhCJi8vQYyh9t5GwGooyOh7JufRsX9VwEJUO
	yJd8U+bA9IuZEfcgR00RVULvmO/r/et0LAqeQVFUVLu/9UOA6ba7tq9907CtfY7FINDGAI/1F5i
	ON62Nn9qbjOvEUO7nGHQroOLjC0hXEH7jvTkDxKZSw701htdAYiUDjdF2URJZUKaYNAl/Fq7cAb
	2fK1FPaAL3SkMqu6FH3aRNWx+L5vtcJUqqSv9NmqP8IH7beRKdsTWJHc34H+SA/HnpAqc7lS3ZY
	Rql1aH9OBQ9I0i4zfmfyuGdAxie2rxe6FMwI6u/KPk8GWGwP42Tw1hJKd2v/2F107jg5oJnTKLr
	rnoeF/Vh71ucwhS3pt82s1acG2Yj0=
X-Received: by 2002:a05:600c:3516:b0:4a8:cb23:f71b with SMTP id 5b1f17b1804b1-4a966c4175cmr28825045e9.18.1793173481947;
        Wed, 28 Oct 2026 00:44:41 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e412cc164sm25324882f8f.7.2026.10.28.00.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:44:41 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: clock: ti: dpll: deprecate the ti,ssc-* properties
Date: Wed, 28 Oct 2026 08:44:07 +0100
Message-ID: <20261028074436.1958132-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028074436.1958132-1-dario.binacchi@amarulasolutions.com>
References: <20261028074436.1958132-1-dario.binacchi@amarulasolutions.com>
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

The common clock binding provides assigned-clock-sscs to configure
spread spectrum clocking (SSC), supported by the clock core since commit
a7f16660af39 ("clk: conf: Support assigned-clock-sscs"). Deprecate the
vendor specific ti,ssc-deltam, ti,ssc-modfreq-hz and ti,ssc-downspread
properties in favor of it, so that new DTs use a single way to describe
the same thing.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v3:
- Deprecate the properties instead of dropping them

 Documentation/devicetree/bindings/clock/ti/dpll.txt | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti/dpll.txt b/Documentation/devicetree/bindings/clock/ti/dpll.txt
index 14a1b72c2e71..8759c328e841 100644
--- a/Documentation/devicetree/bindings/clock/ti/dpll.txt
+++ b/Documentation/devicetree/bindings/clock/ti/dpll.txt
@@ -57,11 +57,14 @@ Optional properties:
 	- ti,min-div : the minimum divisor to start from to round the DPLL
 		       target rate
 	- ti,ssc-deltam : DPLL supports spread spectrum clocking, frequency
-			  spreading in permille (10th of a percent)
+			  spreading in permille (10th of a percent).
+			  Deprecated, use assigned-clock-sscs instead.
 	- ti,ssc-modfreq-hz : DPLL supports spread spectrum clocking, spread
-			      spectrum modulation frequency
+			      spectrum modulation frequency.
+			      Deprecated, use assigned-clock-sscs instead.
 	- ti,ssc-downspread : DPLL supports spread spectrum clocking, boolean
-			      to enable the downspread feature
+			      to enable the downspread feature.
+			      Deprecated, use assigned-clock-sscs instead.
 
 Examples:
 	dpll_core_ck: dpll_core_ck@44e00490 {
-- 
2.43.0

