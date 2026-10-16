Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17685476D1
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 17:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792170438; cv=none; b=jECrVWzR7spdNZbEE6qrcfSbCZbJtwR5hasxTpESaGuy9RfU18XwdNmDRNAZ4pwnbOqcymM4IeJLWiyJq767+HE63rhlOw+HjyVQZazE4NyzGKAq7IW4fAlUDqQvnUOZFJ2zkX/z4NFTYLajAlfcihr2Fv6Fkq0dF1tRbqKK3WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792170438; c=relaxed/simple;
	bh=zq/cUxJYLIyDMxWb6mWogb9O8VtVTaiQSVTSqKXOoZQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hmwJwYJD56A0HTUOPW7sCIEoaApYbxa+RnZpAk28Mbj8dldD5jUr5xs1lZqOwalih9w8lKABxDRwJI19levIbWgRXQsvncCFsES0/TI6vMoTY/sWjwZX+IYeaNNvzqCkMYoTrI2TxgA3YtRiXexi9xrQamBe0dr5n2bjRmBBVTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HAOPSEVl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HNpRnt9L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HAOPSEVl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HNpRnt9L"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5eIr1613342
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 17:07:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1G9kS+BM1lo
	XoS2V/Vkp+eZL5rIIQukdHlC2YmVzn7k=; b=HAOPSEVlu3jP26sg4C98Q/qO8CA
	z/7sXkogztbByrAMeQ3RS9Pbw2ERmEJ46UTGO1ZnrhZnMKGfLNtszY13lokaA1G9
	Ln+IH0nV14NnY7ETLqGeWQXO9AwRSqaU2Kv9ZXp9d7yJdI4LtDDEW1NmWAXEtp7u
	/98P+uYpAvDq3t5XPhB8KiwPx+ZyKFcv+5AFmEDMXlNyBhVcW0uQJb7uLUwqQckE
	l4mgZTvJ7CEgpLmi9fo2DMkk2LJa55ho5TthHTRdcPmfiGQ2U1+IM0S/VG/CyAc3
	eWOmxg5bahOOsY45dE+WBlcOEhlNag+ABRsn+6i/gORYZ/SjtA1TYaAsWMw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbk3v19dp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 17:07:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93dea1b6c89so29739185a.2
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 10:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792170434; x=1792775234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1G9kS+BM1loXoS2V/Vkp+eZL5rIIQukdHlC2YmVzn7k=;
        b=HNpRnt9LWULlQdMO9TfAo0VvcOZz11OyNyvfmxfTrO42rAAM/iTgQuCFwp/o9TYADE
         P+ssRpjRpL2VKfK9fSBp35h9kJ5IcymvmdIiPBGaZX8TubEON1DM3MRInEoq7AJyJuRI
         eAD6M+Lm9Uiyq1odj3n8RrPMVuQ3iLPTIWjL8jjHxZ7k7zmj57kYDDKFV8fb+SXDhOV3
         VjjEeVmfnhF3XNJop3bTGEDOufYDkmisYOhbHgdzLrD7DmTux6oI9JKlXHqGtuB/JSyA
         oMAE8Lu6HZHoKxGJvy9u5W0s/FtelJMnpa8cFIBBEy/ghHlYUKQvmm6vsZ7rZbLB2GrL
         hzLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792170434; x=1792775234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1G9kS+BM1loXoS2V/Vkp+eZL5rIIQukdHlC2YmVzn7k=;
        b=qovp11iBmNn2ACCXB1OQWrBrg+twhPNFzunMy/vBbbrq8U0OhyPYLw/uyOnEH5AiFj
         qP3N5oRR5XYq5V6UOMNWSecIZIMflx92MEPL1I7+G2YTLd6SCYG3TEFBo8G4qMdpAaeW
         CSEcQtfqghQuam0DER2PiYWb7GKiWCs32sVERVo9zhZHVAt18ohwEF2pEEdyrWcbcows
         e+yMR8G+c7fteTkY311XQdOqY5Sf3FLyodZvod5s863gk4WIkF993hMgEbHk/wgKIP0F
         /AZ83b64Ui42Dtng1WT3qKIwURsgy0UuDoa8sw5Ux5yK+cJ/XxCWfHo60qG3yCSZb9ed
         ysZQ==
X-Forwarded-Encrypted: i=1; AKwUvByDjaOLjCvQa2DYG+mEdxsKqiP8bgd2UKFgQ/LJZokh0Q87I2GF3Ps9x1630OQyI9s/M3KQYwWfkj5d@vger.kernel.org
X-Gm-Message-State: AFq9FYKsXOMhKVYUND14wPQfeuegaKBUeDjbU7sR6iVXgjWuBWjd6Gtq
	p0kAmrDhLpEv3WdkMrgYqXiq3kI5GYpXVA8f3CYNWcNsFllR3cMY/qQzOYabGozZ4cIhwF16uve
	/g77an9wut84fvTTIHbUOB/oUbjSSHYCAaXD4Z5XkmGWdvlcknT8Lk6+QnMfPaiqeQFXy+cD8x9
	I=
X-Gm-Gg: AYBFou3kruDBF4+UKIrMCzS/p+eQlXxGl7iznxzMP1XOhnC8Q/O8bRAoM1yxmmwK8yz
	P1X7mwuaEBUzIpTsgorYn1r8Br1ryqFDsI4SzV48yYC6XsbgaDHdTY3brjSSs0EIffwcTJuaLo6
	FmUXr2K7NS7gy6WfhrC0dswfujLIWYkTg/TjprnLkXeMU05Wy3pRr72HETPikUc+qxc6xMrVqC6
	akc4g1m4kzJIVl0nK/X90xEkMp0y3InttWqTAS0w7Konw0ePi9jovW5z24DiOeRLNT8qlM8fZ41
	OZayhqpTQ8Af3+ScU2kXKctwiHyFu1uEk7yNLrkabFP4ygBJJfHxk8rgvfzhtRfT4zMM2B/NyOQ
	hTy4oBEV2r74L6aWFEPNWyFHo
X-Received: by 2002:a05:620a:29d5:b0:93e:5016:e3a6 with SMTP id af79cd13be357-93f29cf1578mr86161885a.26.1792170433773;
        Fri, 16 Oct 2026 10:07:13 -0700 (PDT)
X-Received: by 2002:a05:620a:29d5:b0:93e:5016:e3a6 with SMTP id af79cd13be357-93f29cf1578mr86156485a.26.1792170433268;
        Fri, 16 Oct 2026 10:07:13 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f5b2dsm6630571f8f.31.2026.10.16.10.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:07:11 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, atanas.filipov@oss.qualcomm.com
Subject: [PATCH v3 1/3] dt-bindings: clock: qcom,camcc-sm8250: add interconnect provider
Date: Fri, 16 Oct 2026 20:06:59 +0300
Message-Id: <20261016170701.1504338-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com>
References: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3hooEbL0A-ngUHRWx-qtAQ5JR0vc6oMe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA2OCBTYWx0ZWRfX2Valia6bPpuc
 e1cadLo2TJPnuVHqWdx/lLEUeZk+QiD09fCCpWp9kBsNu6eJKxOyV4g55rj2VtFhNuBNen8Eeqg
 94u/7l3q/idtZohrevEGixIdTQap/r4=
X-Authority-Analysis: v=2.4 cv=BZdNQbt2 c=1 sm=1 tr=0 ts=6ad259c2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=uGqkbxYduLRlOb2TP0gA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA2OCBTYWx0ZWRfX3zmHLR/T4IHl
 HvR37fcdeGcRNEJmgStVzCeq9PQh4jEE7diqCHNv3dPjZL83IxwzfYcW6Pn/IvNa6Gyf9eY+iul
 0tW739st9ADzRscxLf71vWRXzs0HwO/C1+nb3Ibr9YDKnGt/PIFSB+nn6gyprfIxy5GQzfFgUwt
 Gq6sJOvfR4/N9yyOOAXrnbAj29szR0ClBaIMvo6LcDSJS7SS2tg0PEx999uPz5As7UJREQQWgsJ
 ArXLlzsoK18YuHbnswLsiWjOod+XDkjCgPOUQWDzi1l91i50Iiw4TsMfnNQBFlVidvsBJ3lffzh
 tJUrGkIPpMKv94oZTLaPrWO1zttsTqFr6gXF6SHDZC1Wg2uxevmOa3I8a29sYkNTylZRfqt0Z0N
 WI+iTohhJbD7vGXvseV+Erjx4Dc41GepgdE6PooOWNVjppogt2p41FWnOTS8k+bSFNNEDrIdrd4
 xIEiFakJQNvj1Etq+jg==
X-Proofpoint-ORIG-GUID: 3hooEbL0A-ngUHRWx-qtAQ5JR0vc6oMe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160068

CAM_CC_CAMNOC_AXI_CLK is shared by several camera blocks. Setting its
rate directly from each consumer means the last writer wins.

Add #interconnect-cells so the camera clock controller can act as an
icc-clk provider, and add the camera NoC AXI master/slave IDs.
Consumers request bandwidth on this path and the interconnect core
aggregates the requests.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,camcc-sm8250.yaml          | 4 ++++
 include/dt-bindings/interconnect/qcom,sm8250.h                | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,camcc-sm8250.yaml b/Documentation/devicetree/bindings/clock/qcom,camcc-sm8250.yaml
index 5c3ff37ec0d75..9cc7e77ec89ae 100644
--- a/Documentation/devicetree/bindings/clock/qcom,camcc-sm8250.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,camcc-sm8250.yaml
@@ -36,6 +36,9 @@ properties:
       - const: bi_tcxo_ao
       - const: sleep_clk
 
+  '#interconnect-cells':
+    const: 1
+
   power-domains:
     items:
       - description: MMCX power domain
@@ -70,5 +73,6 @@ examples:
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
+      #interconnect-cells = <1>;
     };
 ...
diff --git a/include/dt-bindings/interconnect/qcom,sm8250.h b/include/dt-bindings/interconnect/qcom,sm8250.h
index 2a656c02df4b1..96dc43e063cf0 100644
--- a/include/dt-bindings/interconnect/qcom,sm8250.h
+++ b/include/dt-bindings/interconnect/qcom,sm8250.h
@@ -173,4 +173,7 @@
 #define SLAVE_QUP_CORE_1		4
 #define SLAVE_QUP_CORE_2		5
 
+#define MASTER_CAMCC_CAMNOC_AXI		0
+#define SLAVE_CAMCC_CAMNOC_AXI		1
+
 #endif
-- 
2.34.1

