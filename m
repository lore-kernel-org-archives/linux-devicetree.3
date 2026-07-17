Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A177A3DDAF3
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784273357; cv=none; b=at+y/J+uxO0LigoTBE+yYLRn7JNwow7zs2e8BNQCyAoS6eYVrMeRkgEM8tttaYOb6XHUgML55P5VZFAlUnaCxDe/4zoqX5xI68j/C0Ea5MRaU93k6WsOCZN0C8dwwL5bj/wPPQLj5oNMbTuqFlY/V6CrM1xOVHwv5UGsGz5JDSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784273357; c=relaxed/simple;
	bh=Ys197YC3XOD9CnVoetaGWg4eqH96ao9lELwA5QMf5CA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cwZ3x9dSZKvyM8HOoi6ZoQ6fgMh8hHFmKDBb8ysFDf+W+cHOW8GX8TBH32Pmn2TQ9sBtMuzb3oe8P9cxMCy7Kwn3hY6ZJLC80QYdx6V8sGodxygaFssCa4QXsLTD6/c6XoeWjjZONNu5wBX0R+kiB208hpGTjUmRE4+ZayIQ4os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BrQurFQ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KBuptXT6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BrQurFQ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KBuptXT6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cI9c2098594
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jPg7wDJPn0dLENWw36JR9/8Qv11GyQ72iD0SDfmmmZ0=; b=BrQurFQ/gy+V65UN
	97cpB6n77PboqFX79tDf2BNfB5U64o442NoHkiZbI0g6uiQnPGeP13RE32WM7lQJ
	nJICXmp2YPLxQJZa7/XbMeQ0+uM+yFYdhrJeZdfooL+n8mn5v7n3CCTlDy+zDLh/
	/P4FukMMeLZvD4YW+QrKBLfBKCQfZPzlMeFR3SZl3qgmsksG4dTJC7pqISzX+pp5
	z9l9UwwO8r/vIsV3eu5Cm/4FKJ4+zEPUAMeWcRpgZcPB9J4c/IuAAo4loqwJ8vbQ
	qD4erNjJH8xARh6wGOj5jIyryTneBlZdm45wIQD0oGJCKzbOGvcvypHH7GEuCLnw
	rvI8hQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u6jjq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:29:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e095fd889so8415967a91.2
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 00:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784273347; x=1784878147; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jPg7wDJPn0dLENWw36JR9/8Qv11GyQ72iD0SDfmmmZ0=;
        b=KBuptXT6EygyIqVs3Z8Ql3qPLJYsvfEpHcMsBiPHDfESTW1WtkV9Ea6U1huaMVfoFg
         ZyZVeStbyY55msxNW/Ti4KerUS0eXP0ha9x8G6s2hQTcrQz+hd1RRiVYB53iVRFIvFpP
         n40ziscs/EUd1MHuQHI7MUJcQAmqQ2HVeg1d3/KpoZ297ks+Gxc8pcAJBoEpx8mqQcDv
         8K0D3uiJicDSb1FnStkNLG3w7JZgYMSxPDtBwTFi09otXy67ntxZt+qKiFhroq+bUIOV
         5C9comW5zTojoV8ymkMBgDkwPqHzj5Z2Tf2sFujZ+0sWvVKV3uN+lCb+D6hxgldRXCld
         59uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784273347; x=1784878147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jPg7wDJPn0dLENWw36JR9/8Qv11GyQ72iD0SDfmmmZ0=;
        b=QyDCjh2veWxFRpIx1Prs/mGdkEAlkryMgqwfbIG4bQ8748dEsCHbA5cpvYh34RGyc/
         tyfW8PPVDKOMKXltRtESVE001X+dYniabJ0hWXWDt6fAwizzIYURrXl3RSLw4ltXuA8W
         s7JTU8gZ81FZTUJwRCxCpBB5Nf7dIaXCdQjfTHOZ87Z1lU83gS9fedvR80ZILaUDLWM7
         1MRrcCUsqg028btgg4be2OiJgR9vKbCBg3RQ5EEIL71Ii3fHgj5SX3QvajiNYR4zB3x3
         mqphG362JiaXYC2sc0K6101VNT0PUEhE1lr6qcTA+k7MlLkMohGBGghKZKnc5K9Uvftv
         z4YA==
X-Forwarded-Encrypted: i=1; AHgh+RrjikiZLb9as3fBEgYVJ5NsYkmsaMCHOD5I2974aMD2a2HpVCEShXyViKBjpsWfh5QFFPOAx9OtXgFy@vger.kernel.org
X-Gm-Message-State: AOJu0YzJo3y7KNhovJvfuud/pDzwH+bmhwFcdnQ9E6R8WYZ9MrjnOm3K
	gClk+VS39vWJPK6dsOayTf/i4sA1ordULaOrdSm6ZNQPLBelJ/eYRxQ/oeQAqkue+WFy41nHj2k
	MVlWt+rIN+XCL1ZDD8Ea3PwNTQoWGFYoTbiM0iYQ5O7fIm/GaIZXvNkuHgoR63+/I
X-Gm-Gg: AfdE7cmgMJ9lWmIAsJLfKij3o38dQS+RyISoDc99uKqX9t9x9Y8PW75QiIzP5vrIAjb
	TZocH8iyKe+kM0J8oi3encM5JLIdmDWPv9QroIQVw3+6PYkj7gZhYEaObb0rS8X9gpugo9qx2kG
	DN8G4ui1ipGnUxko+lFokTYuoz8FOeJg4g/LhZ4c5dRVq3ybnjlvzEsHCzoR+Tx/BuD7fkFjDOo
	nPHKvVPQkV4oaNhfhW7ZHR3nHL5rHhJaXQWxjY6bDisDvaTuNpxKHklmvJYnn39v4AjKlhYa2jX
	3bN0ifDM0fDUOMHrkH4nDB70jcdOLFqmm/8J/REYqlXzGs2wlpzYlNjOQBWg/hgj0768Awl1qdB
	UZ/3Fdvt0VQcwEVg2a0lUsL5oHgkl29rOm6VRKGMzIgT3NMNQeZAg
X-Received: by 2002:a17:90b:582f:b0:387:e0db:3fb1 with SMTP id 98e67ed59e1d1-38e4b5f9bbbmr1434704a91.42.1784273346858;
        Fri, 17 Jul 2026 00:29:06 -0700 (PDT)
X-Received: by 2002:a17:90b:582f:b0:387:e0db:3fb1 with SMTP id 98e67ed59e1d1-38e4b5f9bbbmr1434679a91.42.1784273346457;
        Fri, 17 Jul 2026 00:29:06 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346da071sm5724065ad.47.2026.07.17.00.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 00:29:06 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 00:29:00 -0700
Subject: [PATCH v4 2/3] dt-bindings: mfd: qcom,spmi-pmic: Document haptics
 device
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-qcom-spmi-haptics-v4-2-b0fe0ed30849@oss.qualcomm.com>
References: <20260717-qcom-spmi-haptics-v4-0-b0fe0ed30849@oss.qualcomm.com>
In-Reply-To: <20260717-qcom-spmi-haptics-v4-0-b0fe0ed30849@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784273341; l=964;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=Ys197YC3XOD9CnVoetaGWg4eqH96ao9lELwA5QMf5CA=;
 b=cXBU3K268G67pLiiWZQEM99iACL5l9Dw3dfn/rTlzktErJv1I8FMLcmb/LJlyILzIKL5PN0h3
 8GbwJnxAEemCYpJeNcHrFrXQFn5pf1CHT/Dy5qjpddVr8j8tEz5MWXz
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfXzpvLqAJL7BMx
 pyf/iaBbykQb+KVZow+V1yYJQpedu0RyEUHliSECrnFb0Yb98bKeXBm9ol/cedYvSCr/8iFEtV/
 2BqftO6Izl3uPnB/qtE0AZdW6jSmCmLDXXe6CJcy+umqwMzLNzdP3VvhUHBaiXdRiPaF66/7C1b
 OzTvNBvoq66FK02sw1j3v2jNSHinDjISwNRD/XP3lWyvPilzuR8iLZYE46/0NX1YxSkL8qQZicr
 TdiqGIjtFkGODvGZUZWexZsPJiuMF77JIjThykfAqd7x199AOSI/MWM12h381P5PN4hKECeAo2z
 gfIhBovIkxudZcMD1E6cbmNLrLvvOM3WMjND2c3RJph5MXCQ05934tmnG7urLwIfZM9kEry3LE4
 ec689Po84SCpAPXsqjzu6BOSIWpE0yGipcatMt3mSxBsQgfn7azrEWxsRqFM8eHsZLBXJNIr8Jf
 VKnC+nRKSKfPY35rBpA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfX7AqFWVwqpTWf
 5+CcZwSn9NOyTsETAgAMr/AkFdHH/0tjMJOkfPszhgE4M5LeyN+a3a6JFwzHlDjqHMcxhlsDG6X
 naSHEdkhr9wW2m4vkPMNGJ69sQM4zTk=
X-Authority-Analysis: v=2.4 cv=DYMnbPtW c=1 sm=1 tr=0 ts=6a59d9c3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=GfP_bOASi7LDpkAm3wIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: dz7JJfSo8X0gynCSXLPpge8QLJi3uHii
X-Proofpoint-ORIG-GUID: dz7JJfSo8X0gynCSXLPpge8QLJi3uHii
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170073

Some of the Qualcomm SPMI PMIC has haptics device in it, add it in the
device list.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

