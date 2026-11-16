Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794809631;
	b=hnLF34/4i8l/ASDUNe7XvgaeiWUt8pLIOQANmez2NWXa5jdQoXBp0PEQrC2mWpPd0svB
	 T3mGDlF+9TZdmdB2g8ynUFcUY4wKtLWBPVrtPh7ikELfJwJ9QfwRy7sKFrEVBu0L1aBId
	 1C4w3FGlJ7A6W4inUSPsP8I/pSAfDV2o23d+qngpVERpHKCs+BXGz13AsjhTdXL154VKM
	 qiXUI2Y0mxcpjDaGb2As2Jx971TpEbCzsuc4WXq/w6Z18rQjGWlMYpzLoH0VaewVK1EK7
	 EYmB8U9CTPq6R7wyRotiJIMPaU94QYVTRSPaOWgH7hzzVpAFdNpyxr6WgY347N8Cwrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794809631;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=;
	b=0xB4mt1XRdBtC+J6wLQGgWuw4A2qotBUTfxojsj+E6MY1VvKSAi4zoPoPTwUlhCJwP3A
	 Js5SQUkLmv0Fy+kKGu78XPqGdZczqNovVc8+xUkDmUI7ZyGqvi/IVN97jv3cR7BJ3ujb4
	 d9r1HaXTAGeJye75VgrGUASwMm3tg5xCZMnSmbQZL+4GF9/FYTBZU+vgyKS1dwDie24cD
	 zxP4AWYWG02do0i/gSt8z8rBLNv12t/HHzrrUysNg5f6qxxJ992PUW1rMrhLMU9Osuec3
	 P2zZIDeiEyGLG32jlIHE+b7Bs1bHasYoTZC4Xa08uc/NkOyK7UXSplyCnKPOA4yC9Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gzqCNZY+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VksRaQZk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C085606A336
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C085606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gzqCNZY+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VksRaQZk
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LlSp592473
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=; b=gzqCNZY+70YgH5UL
	APxg9Ni92XafCbPxwKXlw02fsH+5579YKYJH+Yy+l+NbD6943WlA5xYwMqHA0nOa
	J88yWLSY21PgSMU+CmIuVGr075SBh6HIe1S9hEGVCh2nDgNFOMYKNq3Lcq8Q8Xee
	DyliXAGqdYo0qrtN0GTr1wg+TnIowlcM1pXo5FDrsnUrxVMhw41sZnXwOZ71r6pq
	pE659skkP6mceH7TLfuHZLEoRFbxMQ+o/M7Eo0FLUArPURrdFWQuAZfpM0XTTr1S
	c4i6aMops/CHwF5eJkuciNhyNb2aOwUOE1XAMv2lqzl0Rhp16PNT/NSk9P0Wedru
	9BgiMA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhjw4gw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:13:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b08364cdc7so2352747a91.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 22:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794809629; x=1795414429; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=;
        b=VksRaQZk1+mySifCG4lI3FCReUs8kjDT4mnO9WDyyx4q6kQpvLEJX3iiGZIArkeK41
         QIKxgb9w78IOX3e0Vdql7teJRNBVqGbtoX+7naSkIYSn+45StJD9e3ZUuBDhhTrN1TrE
         BrdDI1K4NjpqqqbeRU03W5xNanijizFskQqfBW8H3yZbWzwEzDmfa9LaJ5FsfAJTheo6
         Q8+oqMuQNdtGgdBFh5ge2zU1EUvF6dojZ9zDHXzezx6iv3vogPj115Wd9IihyMOEyWqh
         +ArAnxyer6n7uk75HZV0jgY5wKgqtkmYMBlqJYNlSBOPrvuE+clb0RBK5aNxw/tfrl6d
         bsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794809629; x=1795414429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=;
        b=ASvDZSDAL5L2iojiJ7wpZAwHidx4GYmbrkFL5inQmE2gTT0iXSp/UhHfe97AxVpn8m
         p6Zf7wdNLW2m1jeQumNH02m2D+dn5J2RJ1yKIYFgdcaQya5B7Fu9mLdH8d4PgdTuMl6S
         HBtfKgL2/3WJpw/KxTRh1IQr8aS5O6MDCwTZX7QSF6JwetTPmhgIwJ+hGtYYqtwPX5Aq
         pBD99xGiIdLHail40sKpwA5K4zispf3JDoqpsh8Se78Qr4Q9vg/xOyKUJc3K2wl2LV83
         hcMbpSrWblCpHwHSZLviKLJgNj6DVS7FXmsfzXBmfiyWgxZr3x63aXDwPjmPyQWxcMMn
         MpQw==
X-Forwarded-Encrypted: i=1; AL+hErGDUd2KAF7AH13Bfabw1GSJp6iIBWXaNun9sQj48B/ZBvi0KBi8n3jVMoZsI6oxL3cdz9+8xxL9sT7Z@vger.kernel.org
X-Gm-Message-State: APuU4Z/C8PsindfP44aqwnAcyEE3gYH8+uw6zl992+GkfgLwq1r5VbNj
	VBi9tkuQI8llvVfkrNE66PgbmCKa+a2znYK5bFIgSs4QQ9f4FIA5wLSC0RKQWk/YbYiBhAJnAdQ
	rCPLsB5eErHRdWuLHav4kh+XGKnhK6uDkj+Q/PDT+Bgi5E6HI7/P/DWp+3zekFG9o
X-Gm-Gg: AZFdTZe2WXamLtNP6iwb67w4ny5UPcQI3K6RKsKxrwR4wbfJo98UzMz2Hsb73MVhIMK
	n2H3ZNSdrF4+1VPi+6EHTNbpVSbC45XykTeOMy4vVwxjRrX6LyW/A8c0ac3NHqWIJ59mEfmNofg
	prCCLayDd61T2JVlXLODRovVd0xNMj0Xpx/p3rGq1Zi5Zu1S6pym+j72H/cd0dFUYroIeOTn3TY
	lctzTkhle1fchhzwyfPiDL3gB/B/UrT0ojpZC78p4CndMnGAwlWqxPaY0AvPFHsfBT0UusDKNbx
	NTXoQ0DiD84mGsglgxzLdLrGhGuvv0FmwRPlJDxevXmKZBFXCQKDdKxG6a0uAew4qgHZRBRSPgE
	9vrCj/M7iQzuYfx02Bk2pFhja+GeSvX2YjTxacgQ/1lxLUY/Wlw7feqS5sY0jD0WKEwP1
X-Received: by 2002:a17:90a:c110:b0:3ad:93b4:718f with SMTP id 98e67ed59e1d1-3b1b0ccda1emr7899430a91.65.1794809629018;
        Sun, 15 Nov 2026 22:13:49 -0800 (PST)
X-Received: by 2002:a17:90a:c110:b0:3ad:93b4:718f with SMTP id 98e67ed59e1d1-3b1b0ccda1emr7899415a91.65.1794809628569;
        Sun, 15 Nov 2026 22:13:48 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm20229444a91.8.2026.11.15.22.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:13:48 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 11:43:19 +0530
Subject: [PATCH v5 1/7] dt-bindings: mfd: pm8008: Add qcom,pm8010-i2c
 compatible
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-pm8010_i2c_support-v5-1-5626ba17c0fb@oss.qualcomm.com>
References: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
In-Reply-To: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Christian Cortner <ccortner@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794809616; l=1149;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=KZ9fG+H1Q7DY9ESZBQ4IQWSPZb00DXIlq+MsGsgkCzI=;
 b=7xM5Y8xIR4/FK1WeNmeNY9E1yBIcjZe0Km8gqzVoExW414OwNCCbM3w/seI2PWz4BGHC/D2vW
 D/VN9SqmI87Bu6db953jrVnPy8unrYsdxuZuQmB2YKNoPH80l6DHfaE
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfX64L3Cf7wBNxo
 hbzX4b6AS64iG0+6/V6oDw0dkCvqN5L/PUkh8IUZqWPQanzysTY76HmFXHSNp9Si7kA5JLoi/OV
 W9tRxxduSR8uqnFRG701UzyPUAE4CdIVLgmmkrCm0HDLug9Std/DJeFzCIHe+FoMmQXJZp0sdon
 vn54PtKE96WzS9t2Ne5KsoBP/bvKUXLgu4leXCN+zGXZBwXZGk28VlAX1rGqnblWirgZ+iXTd/f
 9iXiRActdDPHuVTiW2CYF7n4CblazClcXYHXU9K7AxKn0ohAjDTISSyQfhA2Y9AYlrlFkYUb4VN
 /15hjVfiE3y3VudfaFmth9tulUUF2CQn6qUSA9AtoqxfzGdaRhivlr7jSaNpztMIIUqrYGf39UV
 cZdrcJw5s4v5QcxzZ0tJv1C0qVoSnjLhJfShbUSqo8gJmc8fz1q4sK3AcMzOyDFcGV0GbRgyhIT
 6kauo6MgMp99sh+uHeA==
X-Proofpoint-ORIG-GUID: o9XTyUdN4CxRE0cwn8YHSQhiI1dgXaoj
X-Proofpoint-GUID: o9XTyUdN4CxRE0cwn8YHSQhiI1dgXaoj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfXwvN955tXrGpU
 B1ZV1CzwzRuRdvykmeTIyURBUWQ+zasXfoUOGUWDL7jJEZtEM5j7y0jx/uwITT6clSu/Jim5gCO
 MLQsGQflowBUKCDYYmRYeebftXtHc5s=
X-Authority-Analysis: v=2.4 cv=X9rHu2Te c=1 sm=1 tr=0 ts=6afa9f1d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=a7mYcPY1mUh1UVlms3QA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160024

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The PM8010 can communicate over both SPMI and I2C, based on whether
GPIO1 is pulled high or low respectively. Since the qcom,pm8010
compatible is already taken in the SPMI PMIC bindings and that set of
properties is heavily tailored towards SPMI, introduce a secondary
compatible to handle the I2C case.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Guru Das Srinagesh <linux@gurudas.dev>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index 0c6e1870db1d..2701aa755f31 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -16,7 +16,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,pm8008
+    enum:
+      - qcom,pm8008
+      - qcom,pm8010-i2c
 
   reg:
     maxItems: 1

-- 
2.43.0

