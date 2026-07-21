Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD91415F1E
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784657573; cv=none; b=PG8dnt1ZFV6mTYSRrQLHPeyKpcyuIFv4mGucG6TMvVxXGmaUC/QUhqvz9wbIGQkEAlijtHFGMt3VACE8oEHXMhEmDvNRHESDxHWLqtxAQOFCH81mwZSVy+7O/bul+UT/c2pzbzxF0kiRcamcRMGBLs2310q8llHE6kxussfzsHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784657573; c=relaxed/simple;
	bh=Q8/rQI2ABsJSplqBEkMTTSfkcGZeSDa8752UWrfowx0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ArIQb0bvVUqFYOV3goRLm6D1AFP5o4iG5kFvREf8xfZ1Xns2f471YwLz2OSodYzk78XSCQibt5/XkPYr3SjRPFGeurGEXEc58fAMdHY//uzNPUvrVXN+bLNcnBqkefQY3HXfFNxzhbjWDvGRFIzrf6byqVyjZBlPfZGXJr122Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lf5WuvHZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JZXOHD6j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lf5WuvHZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JZXOHD6j"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2W7W2548706
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+vCJgscV3F32pAHlHx30ky50aIL5ZyY0TYmoWNW8i3M=; b=lf5WuvHZdzxT7r1W
	Twjy+SceUX/TwCEjcgqnwH0jIiLxhiKSVDvor3OrhcaNoHLFyzb0qub17VfrObKv
	spcnOn7GD5IeObJAWgyGv9lazG0m6um5GGP4nFl8vRpBQb+FYP3ORoeUXpgK1+Im
	juPavCK9UnIZtAHPuZgimHkRZAkKdJIKta0StGumcr364X01Sm768Us28dZ9R99Q
	q6WrcuwVLP7G6QQAkafFX+aa5yLu43n1mSWPZKvcWdBzcWDyFG3gKFRksf7MyJAB
	Yuo8BDNshs/wh9XDyhMlkFUITv29c0jo/mZqrd3YdXHRwrVON5JpxQqnhfcXzvhq
	FYwVaw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6r3jart-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:12:51 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6751db2792dso6415416137.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784657571; x=1785262371; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+vCJgscV3F32pAHlHx30ky50aIL5ZyY0TYmoWNW8i3M=;
        b=JZXOHD6jloXK9jPC5ddxCocHGk9IGCIBIlYMU31zu/kVKR8gDu5KTi1EoeEi7/y499
         sGgltVWlaemABuWK9DNfO2BGZQVm4SDNW4+sLkxaEc9dCBPuxgzIf+ig/8zWBXvWaDgT
         h83NQF2l5lDSUkHXOULEBUapR+bKNdxncPbqpI3Qn1aWn+fTZkhB9Rdn5Z5/NGbCxJqB
         ThArdOlt75JGCfti8mqMQqjdUP4/s3+9M15ZX1YMw8q69gcl9pzca/wTiUCN21KdE8gB
         UiixNUYtcEO5AhWkoJOQtH6RnBjFnCjUKz0Cz3h9JngXj+ztd10+4KI8xjVo3EMUsd1V
         C2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784657571; x=1785262371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+vCJgscV3F32pAHlHx30ky50aIL5ZyY0TYmoWNW8i3M=;
        b=gYOIsbU73lr721hm3XOquLbeGahUxMf0dtZJBdHbFgukoFIqZeqjSI63xDzXzueBTG
         fNCbw9TT8PMk3jckSj87k6WY7MJgc1iqdPOuRb7/SmtBfQ5TSE6sPoHms1bD73/9/JHB
         vztx5Hehil3nkK8sY5tG5Bs5SybPDFfvEM1q02cLrqtpHRMDymu4gCmEG+ccNYYIQS8C
         s08n+QcAdouWaBu2hBAOgvyzi5ioUF5w67dTWx5azY0/MYK7kZEAC5IbDSsPt0k1TKN+
         VLlbo/8A199YXDphMen/MoY9qVpdknCoSqloukWHLbTjrhDohKGDHuiNwqlOOJQosr7V
         scXw==
X-Forwarded-Encrypted: i=1; AHgh+RqhAXCXmwSDrikepvEQ45U7tSpskbtqdclikiXaCnDSA7X9EUUqUY9O4hS1JWzO+PLN8TCFpODmEZHm@vger.kernel.org
X-Gm-Message-State: AOJu0YzEcCJqj//IIaVtzue+Y1Sg+vtI3ikch/kSlnUTmF1khs7mk/W8
	EczuSVbh05rIEsKkE8Ff53dl7uj4VxA67/7hqIySRwmU3dCo5ySAed6BRI+QWjbdq6AT+wAqstn
	H9fOlStvsCQgBqfquoH8UogCiKT4czrpqh+gpw7ZN0yPnpC2sUZEjBTvCajhCOqfP
X-Gm-Gg: AR+sD10GGZZIv1n7xtucF2XLEXK48HDXDrWyFFV8uST60RroPs3l+5rguARNS/qFdAA
	oVJB3xwLPT7Uz87ejbtddZuCJvfpsSDDnRIJMtGYIvCRHfn3GKQH9p5XrfXoYpQLKMvNeiJX24P
	ZGq/R6QeBSm6cyUbZKyQng4UjpSGX5wTrJ3mfqHFR9IZxBs0pLQkrOVaSKwqvSteFlkV1YQkAN5
	0kgiCsqr+IA1zcwlAyUkvtnymU4Xgo7Dvt21qBzEWZGlydKOo8ab5AnaXLPCAFGyzVHKxFaiSP0
	YTYxxALmJ5FUaYovJProPVimm6stfER7pYyCZ8pSAlQMxbx/v1FwhuZk6vCNvlUjvcr701rWm2G
	SLlxDNRWpoNEx3iV/w8JaMq59pbRpup99+3LU1rFAxSXF7bq88uHmi6SsnQJ2XAkGLQNQxOB9fF
	ygx6PFXWkaXuCclw==
X-Received: by 2002:a05:6102:f9a:b0:738:84c:6b3 with SMTP id ada2fe7eead31-74753443c54mr5828472137.3.1784657570774;
        Tue, 21 Jul 2026 11:12:50 -0700 (PDT)
X-Received: by 2002:a05:6102:f9a:b0:738:84c:6b3 with SMTP id ada2fe7eead31-74753443c54mr5828455137.3.1784657570270;
        Tue, 21 Jul 2026 11:12:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6c41c9bsm596921fa.19.2026.07.21.11.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:12:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 21:12:42 +0300
Subject: [PATCH 2/2] dt-bindings: sound: remove google,storm-audio binding
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-drop-sound-storm-v1-2-23ae4a689ffe@oss.qualcomm.com>
References: <20260721-drop-sound-storm-v1-0-23ae4a689ffe@oss.qualcomm.com>
In-Reply-To: <20260721-drop-sound-storm-v1-0-23ae4a689ffe@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1241;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Q8/rQI2ABsJSplqBEkMTTSfkcGZeSDa8752UWrfowx0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqX7aZGX6hfkgZBA0x0BkjNKDy5Vg9Vspt+Y3eT
 eqFqq3zDb+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCal+2mQAKCRCLPIo+Aiko
 1eTxB/4xsKYfAQaauG4nWrrBDYm2EcygBRogYosk0QjVfbpgLIvWwcfEJokTqTPtt/1jDpxb4cI
 +rHoI1ybF6+G1dnFJ0fnz+xMjfkRh/k7xSeUXfM62z69lTpezaeDJR8SaMf46vIowQ+GtMSR+lF
 AKRaqA/B/TQqKVI4Q1v6vh6FCODIU7kdyLTM8v36F3BbV4Pt8dLONsJ+e5KsCgiV0g3tE4nRzEd
 gfMscjlxOetszy3dk8aQU4v1nEkOrGTz70j/aNW+EEo4JBwriKnRXh7DwSlhBcX4kq7mx2HTTmv
 A/X5QBfk8XYLctiZO+5esHpDJUDsMScTrlfmoV5wVdwZKhLp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5MSBTYWx0ZWRfX53uwfr5hYCfN
 Kyhnkl6VfQ7vp7mwbgWjCraDRU5rXhpSOdqXnliGIIAXUnnWQXZrlR23tS07PlSDpDDVTa7BTWn
 dbCDnA0dI/s2VxU+LdoAch/sn1u0+YQrLjzQDI0IFr6Q6CAs6c5YjSqG9toLl2UOZYNhzIFhYuQ
 KtypI/Vs4dSVOBPTmVSAIanSkzmd4LYZms8JqQIuoIQ3ZwOQKbkTTRO62W9bYyi3aDmzj+hpsJn
 97SprPCKqRN3QlIPZZ++lqBFBDzIo8qG0d7xMYhD0Yjln2AZizyLt/DYUjf0y2YcayzgWKtUfT2
 x8U8aeCvMcPCQEEELCUAuti8YLQfKnFuDZRtixrU+45A8TY/rvn3TpIR3/OppdI1nzpFmFCNSXn
 23imCEYExGqeRGwq1vsFd33xDpznWKg/LYtyXKJlHkKevk8z8npRmvv9+fFbxPMpwUQNf6pgXRj
 QCYZ/Quqhfs2yXlFxMA==
X-Proofpoint-ORIG-GUID: VD-dlWwrnA0kUGb3ORiKFnbTVgTrEvev
X-Proofpoint-GUID: VD-dlWwrnA0kUGb3ORiKFnbTVgTrEvev
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5MSBTYWx0ZWRfX14KL+H+9NNAX
 Mdh1vq+y6HQ0pj7d8YxxfkWfV0xhX9vUUhtCf+k/BBMSD9tPSPu5+J4iFQJLoUtCz8ZjnFTW30R
 zszKAladFYMG39Z6JbrZgFJlmG4jR0k=
X-Authority-Analysis: v=2.4 cv=SIRykuvH c=1 sm=1 tr=0 ts=6a5fb6a3 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=ZVp73TLCVlZYv7i2opQA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210191

With the ipq806x Storm machine driver gone, the accompanying device tree
binding describing the "google,storm-audio" sound complex is no longer
used by any driver or device tree. Remove it.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/storm.txt | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/storm.txt b/Documentation/devicetree/bindings/sound/storm.txt
deleted file mode 100644
index 062a4c185fa9..000000000000
--- a/Documentation/devicetree/bindings/sound/storm.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-* Sound complex for Storm boards
-
-Models a soundcard for Storm boards with the Qualcomm Technologies IPQ806x SOC
-connected to a MAX98357A DAC via I2S.
-
-Required properties:
-
-- compatible	: "google,storm-audio"
-- cpu		: Phandle of the CPU DAI
-- codec		: Phandle of the codec DAI
-
-Optional properties:
-
-- qcom,model	: The user-visible name of this sound card.
-
-Example:
-
-sound {
-	compatible = "google,storm-audio";
-	qcom,model = "ipq806x-storm";
-	cpu = <&lpass_cpu>;
-	codec = <&max98357a>;
-};

-- 
2.47.3

