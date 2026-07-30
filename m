Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102D344605C
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433487; cv=none; b=O3EhCIySjMaxat+fU+HJpeJheBAFqjtNpAwNZboEK6DT771DVsxNuprWFkiCxwraWLDLkSRpC2hn2UMQrN8LDrxVNjJHbObkDy1bLcCrfplPC9wfDFibwXCI2mPuQLdqEzbj01y0xNOX+MaRqNMKqRzH43hwJLBPY9bJZ4XqmUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433487; c=relaxed/simple;
	bh=A4EcUqBUamR2r/Iyk/gfR6LX+9b+7S/k0p7QmFKYf3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=REpEOQALCULYf9Z4t4uPpoBoDiwwreHjSCC0a7pBqWiZuIGJMvsHqtRvpbJfqRx58LWLshldTa9OCixM9jDGlsddOYi2eGmo7C+8N3X97wRGpvkUqUf/ioEDXUU6mZBqOmsPk7w6w7jUmPfzRLI4Jpi4ruoa/IjC84274wUQiJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pQoLHX0l; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pQoLHX0l"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-92e5cb052edso9160785a.2
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785433485; x=1786038285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DKJHpeAHU57LnqfzYvQX3/o+Gw7QJ2BjYIAi4uUHpUA=;
        b=pQoLHX0laUv+I00piiQuJH7WCX0Jt6CiP3hII4+OfSdB+6viAgIwDUCTStBKTFWvRT
         0mTgiaA2h2TWnLwg+Jp1xcEK/lY4PurYTQR1wRWm8xSHcdiF9yWXfZvdFL0S1+EBDdC4
         Un88LgzjJTT6D9qdO5hzL+brIhKyQNdeYkELzQsFUhX3okLrdgvF4cdZJ+KyGTpVAlia
         +PXibQ/AM6myn9XiN9GCKiFqwX3WApwr2Q1T1xVv4Ej3vZ4u/8WSc4VgOOqniaRonehK
         okkCSePJCI4lG/2R6rheFIvmfx89ZDugAR7dSmS4XZcQefTasjxl3+ltvmL7Xx31fHub
         cJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433485; x=1786038285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DKJHpeAHU57LnqfzYvQX3/o+Gw7QJ2BjYIAi4uUHpUA=;
        b=Cpx/Lo4O263ndS45pD48Ya4SYVlf0oUecQ75duS6gyKsfwyacbIpXqzfzfXXcKrcz5
         yw3PmjO+50DVpKXjyD3INnmIHVdsfXn46b6902yv5SUCaYan5oOs/alkKuCyD6x11zp8
         /TYRvmymX3ifmOJN+v4WneqdHFZ/L55c9Dp5veuHv2Z3wTrkKYplD32FOJgoTzDL+zlF
         rx0PpStE7m7RyVgTMWPq6/X4/smG/geNIS9oSNXvcZJUHDmP98a/epztcqbaD4qDEwci
         64pISPi13dz7MxwT8ALC2SyeCjP0zOqsiYQ65Qv8Ziuxh+rDapdd9CSqWT4C4uTsAZNi
         rOPw==
X-Forwarded-Encrypted: i=1; AHgh+Rqh0nD1aMS93SK/KPXmKe+gOPBenRO0W710JNjLmvbxbUGkqIJA+pAmyNeNJgJhw8vsWMDKAFPCdVHg@vger.kernel.org
X-Gm-Message-State: AOJu0YxhBkpZvDhg3iIyF+ClMTz+KmRPk6boSCyFsn66MPTeUDAwj5hP
	saKrIEiAAC2xeHEnC3P8qbECRKDPnOBJaT5AQ34F4JuAaT+8GaDK4ABp
X-Gm-Gg: AR+sD10Ycf8vNw+L83K+1qgHkybO0dHnRLU31meoV5/3bt/jLQ5txaFszKGPQo8+OrH
	T9+12mMZuH7/XHEmcTxXPh+QqKlmRg3aUbAe2zywkUKzivmeg3RCUDeRbxPoIkMLufOmZ1GcL7c
	Ut2BEheJc98oOAXJBjby7WafP2IE5M4X6NNOqQBpq8+IATfsK2pEfIwH4ltxoyvfqjLIWDvOk6k
	a4cwAqAyPpaYkzsjbFv+3F6voMLPHSosvVOwTZ9wpkL+WopZrM6tCT2dsIpnTcyqVwqUWhz8BQi
	HnU5mo91USdTuh5UmZIost3nSmJY95lXf/3n25wUM5N+DLGsd+zgTUoBAv5JRugdo5vadJuYrxp
	OdF73oHVHK1CXPTuqYd8c9zT98j6C6lVZczAnE05IcR+y1WmeuJIKU36ef2bbseLmZDwwKfOi8u
	LXcOq+OcT+d2QrKmAJeDVyOuJGtYxjEKKV7RGmU/LMrr62fTjZiOp64fRjE3c=
X-Received: by 2002:a05:620a:2547:b0:92d:aa96:932e with SMTP id af79cd13be357-93485fcb296mr405846785a.28.1785433484807;
        Thu, 30 Jul 2026 10:44:44 -0700 (PDT)
Received: from localhost ([70.54.57.80])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933d3221bc7sm457575685a.7.2026.07.30.10.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:44:44 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v6 12/15] ASoC: qcom: sm8250: add SDM660 compatible
Date: Thu, 30 Jul 2026 13:43:50 -0400
Message-ID: <20260730174353.108023-13-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730174353.108023-1-mailingradian@gmail.com>
References: <20260730174353.108023-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible for SDM660 and SDM670 devices, which can use the
support for WCD codecs connected to internal MI2S.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 1952c599e004..76dc3a3f4a31 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -210,6 +210,7 @@ static const struct of_device_id snd_sm8250_dt_match[] = {
 	{ .compatible = "qcom,qrb2210-sndcard", .data = "qcm2290" },
 	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm4250" },
 	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
+	{ .compatible = "qcom,sdm660-sndcard", .data = "sdm660" },
 	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },
 	{}
 };
-- 
2.55.0

