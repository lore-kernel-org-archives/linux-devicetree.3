Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B153093C1
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 02:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776651980; cv=none; b=sSd+W4txOvZXqy/6E/gZHEdUWGmkRKzvgOPZ+dUGTi/10PB3y0sef1tcJd0tGXQs38//d3t6wW4KBcxp7hnyyHoAoev2kyn0gMONxcOH2x1IsF416arQpkm3dX22poDPbeu7pEy4ikRZD1cq8LubhXRJPgB0pkpZBQtCccmskxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776651980; c=relaxed/simple;
	bh=/5a1m6I6NfJxXWkBlWbrgm5EJvWmpe+5B0+24yFFvY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hlR5+eHNLAi9RyUk1ByaoS9RpZFvmURBR8Ax9lrccV9qu7/9LE72GEwYaeTVDlxiuzImf95t24Va3S+Qezi/D4lXJx4cyyg9EXpeqYncvMnY1BRegmDI1S5vFhUgeW2AOfmg3cxhxy7pv/wRJ0G5jPFXla//0jy6kbshzETXDfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wm5+tB5w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LHi5z+mx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wm5+tB5w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LHi5z+mx"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JNcH7v2396241
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 02:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V6EfKChOv/S9Rl3s3ulBfu3o6W1NQgEPPHlL6OVVk00=; b=Wm5+tB5wBGE3VMCO
	dqSFmNN7z7kmyt+AtwWxxozWliGxJKgOm/6wbJBRdBDCMLzWhM4Eu2YLXJt3rHmJ
	R7XTHc7Joq/rWiD0SpIzVocI4Z5J8tiPyjAr06Q+ChieDyJzn/+yJsHldpgiDlIH
	lve/bhs1fkWCBvoFPtDxyX67snP5oG5FQwjqt2ac2upm+hzaLFIFH34uRMsJOj9l
	4yBZI/Ob9AUgIsQe3zA3M72iwv+p7MJwcAI6DZPckS2LqcoAgzEhv6UGJr5w3/nn
	JmJOr8Eij/Y/m/UeM8RuHGcY5mfhGI7P31Y9a358WHuFBXiHXECG9SJhs6Yr9KJP
	mRdmSw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm21ukn98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 02:26:18 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2e60238adb1so1232634eec.0
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 19:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776651977; x=1777256777; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V6EfKChOv/S9Rl3s3ulBfu3o6W1NQgEPPHlL6OVVk00=;
        b=LHi5z+mxizhfE4FFJxzc186HfDaTGZzMCvmKqaNOIPx3Z9k42ipk8O6EGirw2IshHf
         5UKSbIdaC1EWPlwj5qt4fpKbDV+JuD8fLz+ETbJnQ7AZcbOJaLe5f4Ib/Oe8DGuy1QYq
         LntXmi1poIjAjMl2iXNNXBzCgUwAc2aF54sTtfsHy607uVSuh/nijQq4zGJI22rOyqHM
         Ju7VOlHhki8i2A6ZhaS2koP+d/4v2bqLSLhjlkVEVpsGczUXorZMoss349CMRjQs0y1l
         OMZVAYZiDVWHY01Us1DBmRNIdXyxMgMUCvnvU3z4hOz/8psaUDH7AWOuIpGDWQZSXuHL
         6t4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776651977; x=1777256777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V6EfKChOv/S9Rl3s3ulBfu3o6W1NQgEPPHlL6OVVk00=;
        b=fWLovTeh563rhX+WBiRgtxRpOLLauoWrru/t4DN4pAi9dztcvTXfBsH8r1XDhNm4uN
         Sx//4Ul5o8ALUVmFi4JL4f/sQVJVp113zDqDhUNethu0RQeRrUgkWVpf1UAJGIPE6wKm
         NB+GVDEDW6uMQ6OIgOPzx7aaMy2Q8DCCnQZhbJrqhqegmptiKHQ51w/6Pry+fKcBJN3B
         ZVRqtpIQYiKh01vKTL5CPNKke56b7/U1GTXmxIM4f+ZVwpBMIoFvvMRE3aGQdo10hkaG
         j/Cg4mXC/oDlJzR8S2/cZkoCbltQ1qAK6XQjkXxiuI0KMPgbUKzQxtP2eUpVN4+OnDGv
         5wlA==
X-Forwarded-Encrypted: i=1; AFNElJ8QNuISoSDYTiR48ZbFHS0eFDAi/KrsgwXGY0gA/jlGxZOlZINMWnrOtKT6isunDzmhItVA1bdHlRnv@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtcp6y13pUsRvQNohyiEIyK6USWReT106Ze+7JXWMS2f+IGhe8
	b0j0UE76eQtfNSvjQjJCtNCP/1h54G8DIeSkLrYBh+mWRjehDCMNL0gcxmNig/LypkwPlTgmmW/
	p0Ij77jtXWtaXGETSJvFHGmPjUBbFbEbLRy5EQf+bXPVUdNQA+4xLHwMqkGGT8WTQ
X-Gm-Gg: AeBDieslXvLFERSAx/8qBjitqKMDlLMm46JGa7ahNsSgWoNMA2Hy9QQJxN32xBNoX8N
	cqMyT/VEROAaKoOWYskZ2QE4YOarl4FFxmq0PKx47p8EqGnuMEk+ePocRQmj1TPFZvbLagTSHv7
	PKiw+UAKX/14KefQby9LphBPDH+bV6LUwLEZXT88/Gd199cp+GOsgSiP0Ubr/94HNgOi5RO9e4P
	aVNMaRnnqj3YDt3DJHmtqnILUd5sFMfazDdHO6W4KM4NJU5BA73in2kdiQYOaJSdVg6LcUf+UO1
	EvxQelKQMmdsn+Q1P9tuZeW2SYoQxFXOEObqxNrk+i7RfHOe3FYu4XpY1zPEzrPlfRgWWC8GMqj
	BMlqpSnTFl6zBYITuz3TA/C/6eUMKWKoOXWIWtg9Rtf7sOrzL4crnXhw+3Iasikunejqvi8LwgS
	JWkh66ZENB
X-Received: by 2002:a05:7300:748f:b0:2cc:600d:2ffa with SMTP id 5a478bee46e88-2e4788392c3mr5384299eec.16.1776651977089;
        Sun, 19 Apr 2026 19:26:17 -0700 (PDT)
X-Received: by 2002:a05:7300:748f:b0:2cc:600d:2ffa with SMTP id 5a478bee46e88-2e4788392c3mr5384282eec.16.1776651976580;
        Sun, 19 Apr 2026 19:26:16 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8018sm15299023eec.8.2026.04.19.19.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 19:26:16 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Sun, 19 Apr 2026 19:25:52 -0700
Subject: [PATCH v3 1/2] dt-bindings: spmi: glymur-spmi-pmic-arb: Add
 compatible for Qualcomm Hawi SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-hawi-spmi-v3-1-b04ee909cb87@oss.qualcomm.com>
References: <20260419-hawi-spmi-v3-0-b04ee909cb87@oss.qualcomm.com>
In-Reply-To: <20260419-hawi-spmi-v3-0-b04ee909cb87@oss.qualcomm.com>
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@oss.qualcomm.com,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776651974; l=1247;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=/5a1m6I6NfJxXWkBlWbrgm5EJvWmpe+5B0+24yFFvY0=;
 b=Aed8aqzAbb2QzSosTdomq12q1XJ2seUrCT/4G+qah4Fuxvl/JjOWjVxxVbPZovIMdLRYbF1Ut
 tFwScTjOghZCv3a1Eo4Q3BnIvxDyS8ctjgvjgerHpeRqbEYjJXe2Sdv
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAyMSBTYWx0ZWRfX6Bf4W4nYSltB
 eI1TQYQPRfg/PE3kog0zYbLcUzf8a4pb2BZydSsxbIcWGvYe0hnlX5Rk/itFN3NoDIct6KaK0Q/
 hCHu3HGywaFjWFQl1pwskXiEejwAu/qvXzUuhqS+bcyD8UYXs2nkqCL1fb+6eNlmZYRyCgbYd67
 WCrTa5/ppeJqtciDxuGGPhiEKfBiEwI4ES1VuvO2DhtRQEfY2hMrsEI+TKiSQW+FTzAUvb+H/Fg
 leCL+jXpSVABpi7MZwSKg2hxN4PJ9f2I5zOum0pnpJVd4QOR4TyFHCWniRqTqInMA7qhGxZmqLk
 QTSn2xPM75QefuMwe0SqLebFRn/EEKB9j0J0gWgze02/jImfLrLGOhVkxjYNruBj+ZPsJ/ShCjH
 HOOO8SJ7Z8dwhow4kZP9txQu3MjG3rBXqAiEyLGqqwLK4gtYtAV+SmVCVXE20p2ocR4IQ8Ih3vI
 gID3nUy/vvHK8KizRnw==
X-Proofpoint-GUID: 4sYqeaOlcTPAnHm1-1TxxTN8ZqHeC5N7
X-Proofpoint-ORIG-GUID: 4sYqeaOlcTPAnHm1-1TxxTN8ZqHeC5N7
X-Authority-Analysis: v=2.4 cv=WK1PmHsR c=1 sm=1 tr=0 ts=69e58eca cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=PsuS8QLcD5ISLKS92A8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200021

The PMIC arbiter in the Qualcomm Hawi SoC is version v8.5, which
introduces parity and CRC checks for data received from the PMIC,
as well as NACK checks for command sequences except for read.
All other features in PMIC arbiter remain the same as the one in
the Qualcomm Glymur SoC, with the only differences being some
additional error status checks.

Therefore, add a string for "qcom,hawi-spmi-pmic-arb" as a compatible
entry for "qcom,glymur-spmi-pmic-arb".

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
index 3b5005b96c6d..1593a1183a36 100644
--- a/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
+++ b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
@@ -25,6 +25,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,hawi-spmi-pmic-arb
               - qcom,kaanapali-spmi-pmic-arb
           - const: qcom,glymur-spmi-pmic-arb
       - enum:

-- 
2.43.0

