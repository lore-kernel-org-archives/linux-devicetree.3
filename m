Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E453E009B
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 16:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022199; cv=none; b=Qnfh88DEMEoegjFrNk4rkfFL9dTjxnblRAB+exUajqAU2oKPzZIWlk0MZdntV3Qz5UWYg7vkjRVc57ByclB/OFWieFxJG6kGcPYosfu0NSkRCbaaxDh83XkjhAgAO3NmrvPHq/F7FdWK0A/Yi7vn4DxlWP0m5FjXPjG9eMWP3LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022199; c=relaxed/simple;
	bh=6vUCGaF63VdoccYiTvUVMsMgGqYjEw34fYPFFOoTrN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NlrNqSC5Umf3ro2kx1l0qCST3byP+Vz/Wnt/NoJu/qjzXkeytytDTM1K0TZAkbuT6qR6KfNwdn6M6ws428NAz0ctmyPt/ODgWvzKYMGDiavLySj1gcnGS0Co6JYyz/rp17YK3Oe0LlShrznHqlckOTYF1iA5hsgnzoHcAmEYpLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sz/6mxB3; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sz/6mxB3"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8ce0f17a69cso42766926d6.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781022197; x=1781626997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RrCuZ9cncdLFw2IWDk3WqZwfRxngglcAZOkJxY5zifM=;
        b=Sz/6mxB3/Aiwn+RWo8hr6rUsqZJ2+ZpqKinuccRffSvyPHIMkODGpCnUmjfj549Tcg
         qFF1pzATk95bQBL5qFUmspDeSvB2+PK9qnwvD974Ofb6q3JsXguSybP67nZLLPLEvrR9
         VCbSz+k5jb1ZCBzdFXWQUejsZB5F85R6d4QNtPPKjvIN8auTzmoXeBNUG8wj6vEqGgEw
         NWpU1hoRzedvFFQ55sjY6Q6cQtysVRbPTR3z/Qe8Dx8Dk/NpeTtIg7fKEQ6/KCOoOHOO
         yqodtPigILFSImSuMmTNxvuyUZLY1UyZ3UtyTN0AvgfGWvCWERATJ2+FESLm3MCqvLkx
         lgkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022197; x=1781626997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RrCuZ9cncdLFw2IWDk3WqZwfRxngglcAZOkJxY5zifM=;
        b=RqCCJ9z/tasv2KhWnB+HuvoOljzywzVRKff66jP2PfycQXGFcFRqIvUo/T4BXnXjXM
         vOpsQHPoDgo4AlekF3PnaviYjlOPLT3SNZponnNwSt9xAf3xAHM9PR43ztDUoKs1wbYg
         FhI2LCTDzuxyPgTIFDlDqU0t8ZEzzB8jDhrd7VBYAmYO1INnjeGkM3N0D/VSO3eA+oks
         M2TlY8XOhytrP+wiSi6f691IinKpV+O27bO237bnIpIeUw+WxBSuxYbgn+KeNH/FOtPy
         b6PCYESxiLW/6hBdKNpubeJZoyyoC2Hu8KiTdKDW9zFqw32+6xcAA7c/cwKYG427/KzI
         FQWw==
X-Forwarded-Encrypted: i=1; AFNElJ8l67jups+dOXp9sLNpiNKzQ2e+Lw42EGRPEKMz0BA48iUlCTFIL95CyjHBJv02LLCSlT+6Wk8v1y80@vger.kernel.org
X-Gm-Message-State: AOJu0Yzugd5q091hoB2QV7tM7gr6cz/yx1cX0cVacVUpkySTUKtqIJwH
	xVfIgZP369a8RfcHzumPFOYA+t1LUkWpanl5aZvCMLuDkAuhMTKIENij
X-Gm-Gg: Acq92OFmOxKcOxZRLW9MZy3x62xFnU9Fw4rdtFLBqJIvZ4gB2mzcNCSPDjDmjMBDRZo
	mHRI6QlTLeYKsL0mtVNpCyQJa8a1OhOq4Jw6yupmX3UW4ELk4uCvKL7WfjIEToMQ0YeCbdSNaqP
	BHNW3G3ieetfn/dBmleycdLl6sla2ELZQyBx5eNKWGT6e7VYx1ZHKc24XAZCyggBWbQEwOQgvTs
	DvZByVJX6w/vrLrci+CCwhRYorzL5A9IJVymFIMCYDbhkUzI1PPZJpuaZ/g0DLly0/ZbDzyLMWB
	B9x3rs4SepEDe02pdGE9NZPr4iaDjsY3DXRBGfHCcoblMAj6zs+boRtyCv2BiNzAQPZu0rCPEoK
	Pp6kC1vQpc4LzZwA2UPmIloWoq58klUhggQ5hKWCrVz6qGYRrWWkU5YHHOiJDSkNGIFUlnOxmlh
	k3uh/hEfKr9LkqhMoFAPtJ0JqWtReQVsAKpFz/yp2n9kWhLHS9
X-Received: by 2002:a0c:fb0f:0:b0:8cc:f0b9:1f3b with SMTP id 6a1803df08f44-8cee5ff3b4emr249375006d6.20.1781022197371;
        Tue, 09 Jun 2026 09:23:17 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccda0904sm208055116d6.7.2026.06.09.09.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:23:16 -0700 (PDT)
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
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
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
Subject: [PATCH v5 12/15] ASoC: qcom: sm8250: add SDM660 compatible
Date: Tue,  9 Jun 2026 12:22:52 -0400
Message-ID: <20260609162255.31074-13-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609162255.31074-1-mailingradian@gmail.com>
References: <20260609162255.31074-1-mailingradian@gmail.com>
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
2.54.0

