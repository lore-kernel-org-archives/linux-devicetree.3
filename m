Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452FB3FB07E
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 13:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802318; cv=none; b=ktOpImo5JSVh8tWsggNIvvrmk6OcoYV5sZ/zU3duO01wTAarasV4Wn538WNKjsG5ETmyVL24PwsRCrhbtRQLUnKHFp2jNukMyTA3rSjFj9b3M2K4Dz4uHYQ1Q3UtT2vphW6kcSJH23I6CzmzCD0PkmF8y72ri48571EVQycqWuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802318; c=relaxed/simple;
	bh=u1ZxeAc19H3I75eYjPO22qxUQ5RQA6sI/ieAA9yHFvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mrkTaW9uTfBphFR31DZci9mc99ySn95FWz/Z+FD72VL5u143ZMv5O8SvAuFn9apfIEY2hahMANFpD1oTJVSoyLHkPhl6IOyviMdi5iZyXZTWdIcKj9PrXF6jY0A8siAXkAuaE2JxAoWV67TwP9tpiXcnhEsm1FwbdCJZZN43mcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FaFpYZiY; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FaFpYZiY"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-44e5624c053so6349044f8f.2
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 06:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779802308; x=1780407108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLO7DOU1ouh67wd4NrLBkCSh/jnFkIqwlgXZjoPnVfo=;
        b=FaFpYZiYG8kkPPU8xAUK0V1ai0Yrr41pASF/JQ+2Ywq7KfHjbjK9CWyTrczbjy04Pt
         DLq8Oxg1534SpO1GC5aMMNMIE90jX6JvXqHP0+eoBA6H0HoMaBX7pvW/nUrar+YKMtYc
         iPbwNUPNemE6g1gJ6YVrQ1iyYXdu7JfafFLgfJtrFy6NhgiQUZR81y+1y3087PhFbqZW
         uXg9kNrku8POn98YwlSrcaKysrobJ+7YKFMZej+oyHkY8u7+fi6xBbhiW6jDJjmzRHmk
         0iKD8hVITO3N1AEOM5nILjyAemFyrbZiVwyTe5OVvNSLuyx2+XAdcPQOVIvWTOkHgIT8
         ixWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779802308; x=1780407108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xLO7DOU1ouh67wd4NrLBkCSh/jnFkIqwlgXZjoPnVfo=;
        b=FWYUETkCkJOoDB2KOTZBAKF9ppVED03evUfm285yytZVow25aqvKUGaMyXKrwzA1a5
         SEhL5kUwhvqJ5MP2keoG/vgnJCeB0RuFp7qvEpchQU7ZjZI20RgaaRcCzf+MpdyksWNY
         YmxUq4f1QCxT6JtabN1GcUyuhPvU8dJKzRtYceERb7kIL9nTOHv0+NTI3S2t79f5XSUL
         ZC7B7h2s0KbdYTQg9kvbt/bQtA6kTVIW6k6YBHvPd7aVT0x8IhxvYqtpHmn8rYf89qEp
         4ovHhiyk1m6x2eOF69VTTxYKL2legEc7UXwYO6NGV5tuZoF9FjS2CF9WVaXJgABjpe3K
         qxHA==
X-Forwarded-Encrypted: i=1; AFNElJ/MUBTDEF+a44nGQjUFb6h6YWLFU/2vARKMW1/jBrbmcSjngNxu7fe2oZXtETb0D3nOODJurYWDelvp@vger.kernel.org
X-Gm-Message-State: AOJu0YyIYPaw8N2tc35Zh1TeLSdXfXkVbJ2kJ3ZeJoteaNHmtIOcQv1k
	j7I97C4ru4cu9riznr/GZ2WcPuxeiXFCvvzC8doX9r0Yd4JN2sUi3sAx
X-Gm-Gg: Acq92OGchcAJNl8Cmhj5D9mOYGS/P/vW50zzy6TCSgF0Gi8EGJh4C6vsI/VAH7lIq3A
	oX0m5u35IfRMjr8Wjc63AA5cyPdhN9Jyj7M2M4uBcJBHojXdBsrvVdx6kY8V+kosw1OoRXV33+w
	R+h1uoYOQTawxTC7pNUh+53k7f83wWjbho5TIvVWKqSnJOs2U4B5pW1oG1tbmP9VNssw3Dp3t91
	2m78m0nWjis6iwY33mmqhXDNCzgfMfT1S36t6Ta/JRM6L+EKJ2xK2w6zIMMDwDsGWXG8yofksuZ
	vSLGKxFBI8BEDIRmCnne6w6p5yTuPI4h7drGw3dkssX/GLFwEu8TzILZnZZFw63KpfP+YnebSpM
	pRJw8l0LyT8b8nm3dHqMl8mVZJDXUqQPd0d6lbI0CPxS5f3CtCOF2KyBtFyX5yosKIi864OCuzP
	T9cdyvGQduFwyI4cMTj2XzYRhJTA==
X-Received: by 2002:a05:600c:a402:b0:490:3f7a:108b with SMTP id 5b1f17b1804b1-490426c5be8mr262860365e9.16.1779802307589;
        Tue, 26 May 2026 06:31:47 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490452580dfsm170958895e9.1.2026.05.26.06.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:31:47 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 26 May 2026 16:24:31 +0300
Subject: [PATCH v9 8/8] arm64: dts: qcom: msm8939-asus-z00t: add Venus
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-msm8939-venus-rfc-v9-8-bb1069f3fe02@gmail.com>
References: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
In-Reply-To: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Enable Venus video encoder/decoder for Asus ZenFone 2 Laser/Selfie.

Default firmware paths work on Asus ZenFone 2 Laser/Selfie, which
means firmware-name property can be left out.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
index 90e966242720..231a3e9c1929 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
@@ -267,6 +267,14 @@ &usb_hs_phy {
 	extcon = <&usb_id>;
 };
 
+&venus {
+	status = "okay";
+};
+
+&venus_mem {
+	status = "okay";
+};
+
 &wcnss {
 	status = "okay";
 };

-- 
2.54.0

