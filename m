Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D95F421EF6
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781604522; cv=none; b=dS6wq+VLdAvdAKHA28r7tOrmq7EWZFgp4xWSMZVZ5JW/fsw6y4EibDZZ5FWcBMWHupYR3B0GvYnS8w1/gBNHjBAb4wO8ZRtl0T1eDLIa4FZsCc7L5Q5zc2yWZC1Vdfs9zwclcwKRYu/Arqt10OONXdsYkuolM7w4fsP1Whq0NIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781604522; c=relaxed/simple;
	bh=TwIeX7dWxmVsmvw4YK0bm5xz6TMcOrj4WJjtApbR6H4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J0KoIKp83O1ZPKcSi3nrQC8T/fXiJUTa7yy6Q8aDSqJS1IuNlOtFait1WMf8nFQRvA6li5vW49/WI2TJ5h99cN1samA9XSVDRZ4UaFBQ5WlGLYItkabCCToZNMSAlHKGWKv0R8jQafQTBwzWHwYE6kjVV1jA7W8Ocx+BUncChdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TT0eTV02; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dh+syixu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TT0eTV02";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dh+syixu"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G65mpt2699777
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ze57ivEQaVhQmk2GKsdaZS8G8SlBGCxdyc/OInFHA+k=; b=TT0eTV02YI+wKWrt
	F8WVVn6H3cP+WvKoZZ2XhLsUfnPL14DoT/IIAQx4NdzLSpptvGHhUdM9ZZrhMs+V
	E0kNuLGXMxuVfswCkXyC2CwWjj+s9RseWu/ltAS4VOuw+XlSFSxfDE0Ie/zWeGmB
	8OuHS4TGtLv32ahY+wEvMIaED6UGEA1k/65inisb6X+iFVVR0uUMXy8jYOy9zo2Z
	cGCdLIlykTzV8BwoLduQYi7+o6aQwlp1VFhG22jzxjaPyJ85bCFz2xdidoBK2nTk
	TtTzU21orUOaXHdFQvmlqtqWskIX1tl+0OVCeOWyDm0moVwBuPpWVx379z325cfJ
	h2li2w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09k9644-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:08:39 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30762d67a64so6106260eec.0
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 03:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781604518; x=1782209318; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ze57ivEQaVhQmk2GKsdaZS8G8SlBGCxdyc/OInFHA+k=;
        b=Dh+syixuSLi7bWTwhR28CpNjI0I2nLddv/7a/oz1Sz+eplF9Dd+rMUfSrhpz4LNMDN
         GtTG6xIKAOx9WQoVwz/bP2JUgnaZqFHVmnLOFiOaTKyy6DTY1ZLGeIYK88cPJ86xYCq3
         09WvhWPzf6mhgIYeWfyJHDnPXocu5vbB1SyUyFEcvx/ZWZDFT/hIORdOodPngyjPjFpI
         mCkz8ie3uqyPuwNMVP5cGWqtFJYE7PC/OXYCURQ2hdYiyW0Qu2e23yXxq6zGS6fbCRhB
         +9XNPMn00j9KQACPa0Jx8IqoqcSMQnefzMS1+d0qYLL8dVfuxvmCvTSwccfJQSXmScvH
         l+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781604518; x=1782209318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ze57ivEQaVhQmk2GKsdaZS8G8SlBGCxdyc/OInFHA+k=;
        b=nBnszLVpbBgCusC6Uowr1Ki9vuxRbsGRQWjwtVwS6M2qRcAeXKos6rcCoUAWj5dMiu
         /8Mf/hN5QPMMmgTbHcKdu18w1Ph6WAKCEnQJBOLY0W1KcTFc17XMpSMmxE3E6HG/Yooe
         +dEiJeMWufr9A2N8Z+fSljTJPkBd4AHb3z0ORrbwTpVragOhlDh2EbPkStWg8zo8fCfY
         3MiDye+ksbGvhihSOFW5eBO1pVeHo6tWIlNh/tlnNir/LsUGl7VMYo8Kw7Y2tq8QqTD9
         jvPc7hEqCw7+pk9ijMJQ6pX21EoBJRaGwgBWYcd1qx2hZjA/v/ZpDJkscjhLbxbkFA99
         q2dQ==
X-Forwarded-Encrypted: i=1; AFNElJ+MQc6hzAqhpTI/hE6MwPxjjKb0YMoMOV5VX5d2J0j/NK/75O85rMj1Ax7SEoYS4csV2+i8rhB9pRL/@vger.kernel.org
X-Gm-Message-State: AOJu0YyGaezlgoUxS4LZF/LLcmbOsyMe0vq+CDkkMtE5zbOQsn2ppcc4
	AP3QmX4vZln10BquggZAzG1yzDTIw/o63DHwCZoIOHzjfgWGAsSCnfJ9c89VTCYqhr+ye+9hu1I
	Br7noYx4UE/jC8njkihuBWzQOyb/UcpgY709bIwc0uFuEbKoFtLoaTKSS26X+y+oS
X-Gm-Gg: Acq92OE02AWBHmlw9xKtlRe4HzXuYAU+ql8kf7WF64oFryrSxa56s2EY27joLbaESoN
	r2fOw7nKICaNBfhZbSmGr6YuTy8i/EZFRSMqpKPjY13aH0z3Q71W+j96100FBbW6kvEBX+HNDdq
	fTxAi6g5pr0VFXtLuqp+6hBRGT7woklF2Pd7DdErRCLUkpXBfL03nh60SOPip0KLNS9Fw5ChWpE
	KgfrMQjdFClli+2j3r9ayVPP62MO74/7CiX3K1AnfB44J7+ZP35YRISRPcT0Qcmp1nboH49KKIJ
	H6/FwnUiFWRdS3Ax4wU0sVBlY4S1rhhvH5onVN6Nv50QkQjry9ZtalMPEWCQJdOCAsSYvnS4L1k
	QUth3UkmKv42JeiHMjW19by7nqXWTvRb1p24pn4DIacLexYxKps9+lX7if0FLFBdvFX5dbDwwqw
	==
X-Received: by 2002:a05:7301:9e43:b0:304:cefc:5fd7 with SMTP id 5a478bee46e88-30ba5fd3dcdmr1724513eec.32.1781604518519;
        Tue, 16 Jun 2026 03:08:38 -0700 (PDT)
X-Received: by 2002:a05:7301:9e43:b0:304:cefc:5fd7 with SMTP id 5a478bee46e88-30ba5fd3dcdmr1724494eec.32.1781604518029;
        Tue, 16 Jun 2026 03:08:38 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e48bfa7sm18401484eec.5.2026.06.16.03.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:08:37 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 03:08:25 -0700
Subject: [PATCH 2/4] dt-bindings: mfd: qcom,spmi-pmic: Document haptics
 device
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-qcom-spmi-haptics-v1-2-d24e422de6b4@oss.qualcomm.com>
References: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
In-Reply-To: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781604514; l=891;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=TwIeX7dWxmVsmvw4YK0bm5xz6TMcOrj4WJjtApbR6H4=;
 b=48XWeEtbee33WhaBiCWBr1iE9nVtAOrF+xNAPyMUznrOoUclZfGlbb/r6O7sYp0bkPNWbseQY
 jjCMfJCMSV7B/GB76UKz7DSXNKEQ38JLFRGy5M+yCeINH//5F8pRpVy
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEwMSBTYWx0ZWRfXx67u7nBDRxIo
 6GZjmXJHguN5ZHpjFrQxFcRnC/aVTj3opN2VGawvOZmftr8Kp/ml7WaDS7wt+mhiqPkQbef9x5a
 ioB7rUZHNoM6hRRnXGtm/uZhme89DGE=
X-Proofpoint-GUID: N-78qjJsXGczCbj_2RYs2T51fWyc-qxv
X-Authority-Analysis: v=2.4 cv=DoZmPm/+ c=1 sm=1 tr=0 ts=6a3120a7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=aKV5VrVIVVfq6qmweGsA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: N-78qjJsXGczCbj_2RYs2T51fWyc-qxv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEwMSBTYWx0ZWRfX3tOFNbdjlXH0
 ZqKb985qNDj8wo1295dNNpQu9f7f6zTXUI2iN0ZIeqJ7EYHd+FA3vnDtinAxva7V1rvTVQEiFbh
 pavXEoiEt6ENeEkmuVhDrMqrW56O1uUC9AEmtub3TId57WU3WoH151e4Cspw6Kd5wZ+FIBm4ykI
 f/hGNXuqMtS1b+xzh0SxHOXA5JzpssKP342xzMBXkwmeTYt61n7kj/RjBNKM0VN1V4dZsESmrmr
 Tn2L5JxRuojJWnlcrMY3sZoqt/s8+FJTfCg4ogVaW0VIp8ww+W1IYdWVdOSvMhxPOerde+rdWt/
 1uHnNEgbsR/hvL0KrgApJ04CB57fAkcKl/Gd+8vHtLqLzgpp6CQOHHvMTDS1kbrBGpJIqdjQtjS
 GO/zblWKwQXrhh2UwyWBF89PvNuJPDPxwFDg+1XtooIrk9S4aNl75fHqpM2r4IZ0wiBvq86HWB4
 oEHiuA+JbQYkh6lPWUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160101

Some of the Qualcomm SPMI PMIC has haptics device in it, add it in the
device list.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 644c42b5e2e5..773f4cba5935 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -165,6 +165,10 @@ patternProperties:
     type: object
     $ref: /schemas/pinctrl/qcom,pmic-gpio.yaml#
 
+  "^haptics@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/input/qcom,spmi-haptics.yaml#
+
   "^led-controller@[0-9a-f]+$":
     type: object
     $ref: /schemas/leds/qcom,spmi-flash-led.yaml#

-- 
2.43.0

