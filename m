Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEC43793D4
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 19:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985942; cv=none; b=ecT/C6bMpxyyi/KXJN+9kTp3rB569oJjbMd7S9TlC1MPo6fLJ5brRCh6vM42m8Z2tmQZeOQluV+1eK3Je4jdH1RT7kjFvgLCbLDoMqq0UGoTM8Ijx3bp1RUbNIJm++88MYkJK9f2o7xaaxmMd39du6p1C0A74kGosIQbooxlkcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985942; c=relaxed/simple;
	bh=md7ZgyJKci1oL67mwHChonuZy799l2+wru4xchUlLE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lNlTlz8u/FlZF8lzJU/6KHRzARbUkhHH0TpyGDUihMcm692Oa2Od+ujPTwKqS3DjuhSY96zPagi0VS32Re4rdB5VjX+jhU4+yA2vTMvV1y2qNBATxBiIkCOwmLsma7fHlvvUMmnoidZp4hyxZbuLf+Ms1ZuyzxmSEMC3s8Bml68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YcJQZTI3; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YcJQZTI3"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8cfd122d78fso966345085a.3
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 12:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985940; x=1775590740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8PeiigyZeO1TReQFmzOYp1g+SjtZC0Tv13VfVdNAnw=;
        b=YcJQZTI3egIel3Boxoxkifz3IOHjSFkT/nmX2NTArEqDC8W1PteE8GOJjPqcgBSfJE
         sRsfniMWKCiFBLZHf8oJKMVKk8wtgL7VoUZuLqaZV/ARPxOUvcXyDi6bhM6OB9ZTVsDb
         abYjVzQxLjW+q3NkCQSa6gGNVOhDWJJHZ5BqhGZuQan1ANJfEABZkYRkoUBCD86oeiA5
         3ijE8nUr8ARUzste8GdykxYjtYA8Dph9R2KoH7ilOSmRp6g319AGARlwZi7UdZHbdP7j
         HEzVVYs0hFYODRgpKoUVeYx1FEws3NmbivT2HAAi0d7ta+lf9Pg/Ch6KN/AEWoYxS+cd
         +I3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985940; x=1775590740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V8PeiigyZeO1TReQFmzOYp1g+SjtZC0Tv13VfVdNAnw=;
        b=db8XNI92bgBx8QDzKrbOkI9mkcf2MBxKLokgl78ZwoQE94iaE9nB+K33igEN3pVh3m
         Q/hjdWnI8lr80G11Gxt5E+5uryI4OxmUl8ISOTZpiJgcr62K5CR7tPASkI/aiyq4NO0n
         qoJrjhvT4NNSrVNb4rLZwalIm45VMljvyKxnAeOlsCkkFt2E0XduJP0vTA2ZYrTC8RET
         8NgD2peOXHQT7MHwHkdk/L4Y34GfKM0DYlK8kl8jn0x3Hdwu6Lyvm7Zxjwc+IRs3sOPv
         frD3W3E2j7yIfc3tQbavv6Z5G/49PSmqKVbwWx45uCo7cbZklolXyUJsFJRlWujDET5r
         xE/A==
X-Forwarded-Encrypted: i=1; AJvYcCVDptSiW4UmiaaXqSQDACH6MH+G3VstWEPjc3MDWZOqr7L2gF4KkAY4czHGcbwm6jT8CS8Ao8FThE2w@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5oEfngs4O9R6cSZ4r5CmqBoMKCNCYQxeZgIiwOTLcWqsHyGqT
	9IWR7vNDRsSEg6RiohrZqceR+uxcymON0kiOEyzc/sKxsPOk6BUslRux
X-Gm-Gg: ATEYQzxAj3G4KnaKbeSS4iX6DLDETe/r4bhvh8O1G4LJ1JNe/ZQEbp1RJV9KplrRFHB
	L2wcam2BjJqbAaNafH6Pu51AIgw057Def1iieAtzDJx1ufo6Y4OTMdW87uFqZVG983/L0mCzJnT
	luz5rF/iX8/1/05zmCg1CFB8oeu/3YphalR+loy94t/DzDRS9ovYlhk9Dm9v2Xi1ec3tbvVvqZK
	5bLiNoYh1Og4iqIH6SkDm6kmNfbZ64rfVwhuZRe7f02hNNdDSKkCybcGgt6ragCB6umNO7U5qQ4
	2w2ZPIw/8oiA3vHgDSnxvIZnU1Zcw5gFSVDimcgW6GFDdobX/Wyu7u1CzRg05xX5ONI0uoRe2fc
	P7O6mj/ot8PqHB46o45j7jXi8R7poR+FfjzIZXs5jgj9sjVihRGG8NuwjAN/LCHOfnCPWHwQZj3
	1C/As3R0YAAhk71tkSlsR6O75e
X-Received: by 2002:a05:620a:bc8:b0:8cd:dfe9:60f8 with SMTP id af79cd13be357-8d1b5aeef3bmr142663785a.23.1774985939822;
        Tue, 31 Mar 2026 12:38:59 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d02806a36fsm936924485a.35.2026.03.31.12.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:38:59 -0700 (PDT)
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
Subject: [PATCH v3 01/15] ASoC: dt-bindings: qcom,sm8250: add compatible for sdm660
Date: Tue, 31 Mar 2026 15:39:25 -0400
Message-ID: <20260331193939.40636-2-mailingradian@gmail.com>
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

From: Nickolay Goppen <setotau@mainlining.org>

Add compatibles for sdm660 based soundcards.

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 15f38622b98b..63c744524e01 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -44,6 +44,7 @@ properties:
           - qcom,qrb5165-rb5-sndcard
           - qcom,sc7180-qdsp6-sndcard
           - qcom,sc8280xp-sndcard
+          - qcom,sdm660-sndcard
           - qcom,sdm845-sndcard
           - qcom,sm8250-sndcard
           - qcom,sm8450-sndcard
-- 
2.53.0

