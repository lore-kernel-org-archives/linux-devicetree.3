Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833DA2E7635
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 19:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985988; cv=none; b=WCkrDQz+CgOpqFylQY1FBtxULIYEBHngLh0+WQr0txMF3NfsVnqyuY69bbXLShMUsnN5MUcZLYv08P3xFwTH+NDSkLcLeTU7wJaf06FSvI6dG2aoWyYeYAjrgJQgOY80b34eaxVGkphGxYWUorMiqn9L2QpnTQTmbqSb7IQgho8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985988; c=relaxed/simple;
	bh=q14J6u6/DDiRdWQxGeiAZIu9w8r0CAe4FGRZ0vW5wS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qNsvl8wvRDUmVo4K7R+BbvOWwdjsGeD+CD6kD4HqWZMFocRwJo2ImFN6+VncfON8I7HL3E4gc7P+9fRQajvP9rJ1BiVIxBFtdEfXnn+AjyHJWLdoEpTv/QJQIAai8y/QSHJnAi8e45yHJxyfw4l5ZsEIeZv3Kqbl+umkhs1X26Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YDFVF5HA; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YDFVF5HA"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8cd8a189f44so533976085a.0
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 12:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985986; x=1775590786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sv7lS1+YROEJimKMMLDI6QUWBEi7PxK/YXU7MB7NaxM=;
        b=YDFVF5HACiyH/mQod88wTw6EY2ORp4XUah2QabJ5KmqEUN6XwTw+70q0q2RyB4gWOP
         UDuJ7mYc20rQkaLlq0mJCv58l41CE/lUVY7MU0bq1pBaeVV54oXnTYgJdOWOePSOFqof
         pyG9h+6z7hONxgRQ3bkq9UeAUulA+VD0AdqjjaHW0Qmr02i1uThcX8YJ3oFC3IhrbLRR
         sBi2/xXhHlj3+5aL8d5334RIoRrdv8Yh6as0wHmSy/H3xZFiENNtd6EDzRBKL71rCOAP
         95/343Lk6Y3+/FR+HpCrvJ7/QEHPAAOm7vaKSNXEfxyv0hg4R3j7v9Ocuc1mn07Ke7Gg
         m08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985986; x=1775590786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sv7lS1+YROEJimKMMLDI6QUWBEi7PxK/YXU7MB7NaxM=;
        b=iwJkXayvTUPub8c6SuYzcTLCjvyZhSbIdiCPiZNu8ykZeOML6sgw51FITEX8pgvC5i
         DiVjofbJFLNAEaQ94WFsnZACrVdThmPWeyIdrcqjZKO7P5uNoKhmLOIVagtpUQfq6C9R
         qRQIujYIu9oU0tXz8QdsYwWYsyC0bu2up5Er3otKJ3zVNLoaQ6Gb/iqaEGLXxHkTbiPE
         AYg0HV9ccEAzMS+aj5/aFvjwFnHUrzJDsj8O4qgXR+gCFybvPee6sxdthBUx1pG/o8Bu
         OxZELum6wMALsaCf4a0877v0kzvZhAnf0x0848bmNQl01lKJRNRx3w/XTo9xIjplulCP
         Q0vA==
X-Forwarded-Encrypted: i=1; AJvYcCXCoK25XdjNIV4OSYHe/ciSl9Xr9xTnkDvCs6CjJy9e/UdKWIGc9pJB0T512IoipTWFa0wskbifvl9y@vger.kernel.org
X-Gm-Message-State: AOJu0YzM27P6XaijGNfzsl8PWbk4jM9k+jqm/uWArplYPxMYBg6zU/ph
	EWY+RufaPYU1EEr5bmeXxAIKxSCzvZ17kOaLd5n+hjZ+1QG4Rq7/h78b
X-Gm-Gg: ATEYQzzg4Ns67Eq3KaAO5UAHS30VUAOx99xhbR98sagLIE5hR5uCB4OkYF0xg06ounm
	a0p4hdsvcde6mGIFtjQT7lXGXPivEqfUzi0iDqUSoDAL8K6gwcOEeU9BqhCwgJBljeDX/Qg5nOj
	ltklYqGYmh44T8Z1uRXWkhseLhuHbm4orl0gExAgVrxZ2wL2HG8gxeXCnUiU8Gv2pQYn4gYGDBJ
	UzLe5YN0KJTpP1oUNPZdvIFzYviU1jtpTubCfXtDDza0+jrSij+a+YQsRmWQQyzcRJcLmq8CWby
	vIkkNp8gYTimEPnSe5NDavL2yy7YxARxyZ5aS2ar+Ubm6zGaBKwdaPeU73S51R7d8cnbxeBZWyP
	2JGX3EHza2QNfcSr2SmpG45FJQ37gKsbMsFf/A2OwbmpLoLHjrQUAL23f5x+StiTIKWv3k6K541
	fDY9E6C9nk5uVfb/iGeflRyRk1
X-Received: by 2002:a05:622a:5e10:b0:50b:56f7:c141 with SMTP id d75a77b69052e-50d3bcd37e8mr12298821cf.44.1774985986487;
        Tue, 31 Mar 2026 12:39:46 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bbf69fee9sm82693521cf.30.2026.03.31.12.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:39:46 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 12/15] ASoC: qcom: sm8250: add SDM660 compatible
Date: Tue, 31 Mar 2026 15:39:36 -0400
Message-ID: <20260331193939.40636-13-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331193939.40636-1-mailingradian@gmail.com>
References: <20260331193939.40636-1-mailingradian@gmail.com>
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
index b8f1c91725df..84898bfff7d8 100644
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
2.53.0

