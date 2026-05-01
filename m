Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADD72857EA
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 15:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649570; cv=none; b=I0KgOrh294DIekqw9oPBwCIGYo7jkQElT4Gp6YilHzMQhd+c8HxmkQ/B3ithHyj+qct9UVvz4OnXf8AGwYU8ROoNTIj5oBaVdFdadab1EvwIfHs10sp304d7FeWCenfDrLEQRYjnFrIMgMUaU0BWAMlLDnEJMWrMX1vWuan1hxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649570; c=relaxed/simple;
	bh=TalITnoTVgN8hqSEly4krP0OENxfJ38rWqsEvppux40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Whm0HaYVvOOQgiwlXluAA8PCeWl91GA+RHC1RKEUNGGifiOPefxddY2LTX4I2Rh7JvYmYmAxBtbJ2A0EMo4NhHRVZM1MRG+IbRWo/NKcK8I2TLrCmj7wdne88KH3Uh6vW01iQxYu/W4VQsn3svWCv+4n/w6PZlRhB1/41UyN5MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qVFS7W5Z; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qVFS7W5Z"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8d560ede296so227941485a.0
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 08:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777649569; x=1778254369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/EEuToxfj2xtrYU96bpcfJV42FkeZzgzuAg8mxxCUfw=;
        b=qVFS7W5Z0k/2wzxDPfDGo+paXlOv+BT5UgU07oavsmgzhEjw93fM4xnuyPQRm8hslU
         /eu4EVFkU1zosXlC6SyckfvYDCy2QcxEJJvCX6mdxtH3e/O0ZlnsrV89y01ogx6BFvb6
         a9EhzYUxsPsPLOlVT8ooT6ewvDRxUqRUCx3fCKk1VVy7aN5y+L0O4mEj5bcjG+1u4UAt
         F1xr/d7ohLO+3hwqB/JgIUze+oVua9nbGy2rbJCGoSxFIjY9emKtKkz3PS5KKIIBNYGA
         /IvWGbLBEhcy9kO6xYS+W6D4h7QJAyhGhOtrNmK05Fqn8McgXFfJpOWsbH+bF7TPVvR6
         QtdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649569; x=1778254369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/EEuToxfj2xtrYU96bpcfJV42FkeZzgzuAg8mxxCUfw=;
        b=ap2NcBEgjtlzFcr6V+JT1KZcdsflKJ8ArfQ3oLvLma/qkvOnZtUByRlCI6ezHqD8EC
         nRHxtT3UV7kZ6/EJ6AMbgTmMvZKqDseGUrcpNnNsDuJD2Ak9hLomjj01ks5KWLnx8FpX
         MBJi0sJZGMzLoCEC8uCa/Ex1I6kdAyJlkGKh3Z6AOT+kalBFO8bprkOJhzEu2g7kbC85
         itdF/MuBuFKjSld5ls0dy5o3CzGKEzpke43a9tcUIzxo2wtCvaYecpTezWi6zgR+fT9w
         AQgC0loaBsAjRGv3D72ASYol///fkVsAnVFyc/qmX/PNc2FQO84Ra4cW0dRIL+Z8VJPK
         z1SQ==
X-Forwarded-Encrypted: i=1; AFNElJ95cukxRtPr4dJZD2llipF8EivV2++qBD5hCyfmgciu/787tA2JMeIoJNCBArZDmaA7hYpX8RPOIdCJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwnXpr+wobx3/IAFEOB0Gg4pA5T1fmFYORFgEwrEpeZaKbj0b6O
	A+JBTzhFEfFn1DRil/PJ6Syp/OXxmLqOQL6xEJMRQJ/q2wIXkK9gwSCU
X-Gm-Gg: AeBDieuG4DE5LHbpqnK7zDspye4by3q1JnPYyFQgf8wfow4GhfyMcft+6W/PSTPDfn6
	MJiWvgRHUux6mcuwA8o6hRrAfjRs9KayPqGUrPLvRZtP5G33IoGO4U4oHr8Dr5QIahvpjKNuCBC
	I7aCdqTEOO6fj262kynnAaeiUfEubtSQ5yzBa5J4kvslJlnK31JVpahhU0ydgrHRqPt7s6+LdCz
	sEIuoK3k91zALDDqzbUuALr4NdhX1+nf77A067nVsn9qQwBH060cALhWfBF4qCbkLbIyGUf/8f/
	E1ydEsJYY8FuNhWcwYOt8rc0fRuNuU0/XqzJ1npyBO0IRjevOzMTu5qgpSsotcW4IbsJ9dJTRyk
	AmLSE9zxYckexAc8dHf99V2EBJng/D09iG7lapv5QJPg7XQPHI3UNYJc7eXUiDkfX+/ZAtdKqa4
	VTvDYkMVZIgFHl5uAbLqODWkkJ+nJVAPuidWMjaN3CA2HqLIo=
X-Received: by 2002:a05:620a:4551:b0:8cd:8a55:510d with SMTP id af79cd13be357-8fab1c4ef7bmr1029971885a.48.1777649568576;
        Fri, 01 May 2026 08:32:48 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c34a0d4sm186890585a.25.2026.05.01.08.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:32:48 -0700 (PDT)
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
Subject: [PATCH v4 12/15] ASoC: qcom: sm8250: add SDM660 compatible
Date: Fri,  1 May 2026 11:31:25 -0400
Message-ID: <20260501153128.8152-13-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501153128.8152-1-mailingradian@gmail.com>
References: <20260501153128.8152-1-mailingradian@gmail.com>
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
2.54.0

