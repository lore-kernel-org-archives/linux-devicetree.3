Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08824457A2
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433456; cv=none; b=JHYbLRbvhrdAkyd6LqbMWeuw/lT13Io6GBa5LbPNK5CFZRJXEUvo0mfK9OtzVpJcjiHyjuntOK3cQeHimi3tJ1GwJXZTgGCaIavxlywWSiG5BZUMSm5JSOmGHO6xAhGXOpVo0/ysy+sR632xELQzv1AXOH3j+Ah/K7wPh74JIXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433456; c=relaxed/simple;
	bh=0SNVcD2ismw260/fCs9UP7KNTkcK5iz1vXhTrUZeJXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DhRr/geqmYB0brGXht5nbbrvpbGQ8ZCwQepHFb/Jcy6yATE6eKQhgQn0pi/Hw/rbCeg6qDZlGXnMS+dSPYvj/i9jlY76C1EOlzcvy0MmWMPetVKG+fSu9vDBmdKYpMt+YCF5GvO7xQY2gX2q7QX+ZDsMrpf9gx9P//FEg2f6MSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mN5sCL/m; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mN5sCL/m"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-92e5cb052edso9123985a.2
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785433453; x=1786038253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mke9aMgFoX8mi0/LEKnGWho0tCyc+eXDPVUKaIIH15E=;
        b=mN5sCL/mhztkXQ9/LIDMH1Bi2dWxYeExnkMxgsojYwnSxzHQgoSefCH6/1wQ1LFlsG
         Rc+Z/s4DGWVKeiBMawvxM7l/KXRmlbakNDsExxKHGWGR5wO5az4QLtRnmoNPh32OIju1
         gRiR2nLoFX7GzcgTVTB+nckxCM4wT/y15hL9PHAywyArIdiMY65tStoUFJz9RR5Y8LcK
         Ft0+6+kyHaA4fGDZ1WEhrxXcxyvQUfl7JDPN5/BXi2JdY450EQH93fq+9899esXhFcvZ
         T3pVgI2UrPjU3WleoAtOqQK5XcrkscAvCBjgZxCFJ9hod9KWBbtCTrbcmnf59l5TEAcd
         vw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433453; x=1786038253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mke9aMgFoX8mi0/LEKnGWho0tCyc+eXDPVUKaIIH15E=;
        b=E7zgsh7O1CpTcNhPj6RrrJ0kYT2A3Uxd0yR+lyBS9jdb14npBn93JfcIHw/yB3AKs8
         dLKyIR5W0Gdhokm5C99JgfsJAo+zJtdisXs+xA6ZawCvpV14uzCXJVNZCryqs2VZUWOW
         eApkyrS58CxU2GJYBk5YGSYEjdPEIa36A3g+2wkOsuVk6P3DMqZMU1wzLPIf2zeYXCy2
         AuxrEf0YJRYHJanwxgLZF4+soLPsTC3BrfgvELiZ2i6J9wGF2G+k7x62Gs39fqiOsQuS
         lZhEVFYy03F1JnHW9SYoCNN4yDwhw/JNtlbdEHCdccAmJx6aut6KFuui4ahNSle+c0cY
         X53Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr6csjgxhUn0dKknVRX283A7W4s1m9SbIffJ74dTLUYtAjo19IdZ9eMZXFux82tf6mFpJqp8w9/Yw+L@vger.kernel.org
X-Gm-Message-State: AOJu0YyXcu0nkgYNC1ZibY1pyccoFQGzsvm2BBMxo6DYI8D4CgFIEOBw
	bYjkl2BYeDtJVYYOPK92fr5xG/EucjZRdGxjOKf4C854aqmIYAFeNpSb
X-Gm-Gg: AR+sD13Z0m8jypivOBSTpuxnHr6l/AzXkOtIM8of5CcWjV8AJqjZON+qJzAVCT1wAqx
	y5qSRWSz3LFuVgFhCo+xVeEa5Mk28bHYRkrR70lLMmMw/6Lp7dtCvGzFJL8FPXu+Wrvti2xNyQr
	h7oF3M4QFWygIfxdH2W4/FXmkH/sR4ilcqXrXERZUjjiUB+WK/O26TcPLLp+VSUmqtVfHSmT+2W
	28cyadG07jRBjnz8LX4P37ETsH5FhO1rZwAFBMDz8fG+d6jdpJB7WvfPjDLvMLm7uB9r671hvxj
	EGSh6lIP7gMKuC620pt1CqbjRSrJATKN1E2DR/OXiNckDGnxeT9Dh8wzHAJ/jhft+gRdejx7a9V
	arjp+oK6NjwxLwk0GaAmWYEYz0VGC+ZE6OT3sS0bsRWqV7egKXUqPVvBz2xkWjr7ylQol4S6ieM
	1QJVPSAQrfVLCtFnyNg70HVKCcqGVXBs0N80kpo6lSArCmqSrjla3QwMqs2ikaypfRl6yKiA==
X-Received: by 2002:a05:620a:b8f:b0:932:f1d8:b0da with SMTP id af79cd13be357-93486157c96mr295847585a.57.1785433453529;
        Thu, 30 Jul 2026 10:44:13 -0700 (PDT)
Received: from localhost ([70.54.57.80])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933e733d933sm473505785a.35.2026.07.30.10.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:44:12 -0700 (PDT)
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
Subject: [PATCH v6 04/15] ASoC: dt-bindings: pm8916-analog-codec: Add PM660L compatible
Date: Thu, 30 Jul 2026 13:43:42 -0400
Message-ID: <20260730174353.108023-5-mailingradian@gmail.com>
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

The PM8953 (cajon 2.0) revision of the PM8916 analog codec is also found
on PM660L, typically connected to the SDM660 internal sound card via the
digital codec. Provide a space for specific compatibles and add the
compatible for PM660L.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../sound/qcom,pm8916-wcd-analog-codec.yaml        | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
index 15389645a3e8..be47dbdb2e92 100644
--- a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
@@ -14,10 +14,16 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,pm8916-wcd-analog-codec
-      - qcom,pm8950-wcd-analog-codec
-      - qcom,pm8953-wcd-analog-codec
+    oneOf:
+      - items:
+          - enum:
+              - qcom,pm660l-wcd-analog-codec
+          - const: qcom,pm8953-wcd-analog-codec
+
+      - enum:
+          - qcom,pm8916-wcd-analog-codec
+          - qcom,pm8950-wcd-analog-codec
+          - qcom,pm8953-wcd-analog-codec
 
   reg:
     maxItems: 1
-- 
2.55.0

