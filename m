Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE003A8740
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 10:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788084636; cv=none; b=aKc0Y7VOmTlHd5czQo911TUveEv4P0WFibbpH6y6LraZrwRPC/vEyifAobyhxpZ9zI+zie7P7ovKp4IEIVhhOPdRb9uYrEtGlGEcp3IANcRETRet5J+PaoubEo5hR5XQL4WDRUnSNp+Nj2eHp5FDnzsuzHstHEmXITtlG8JZMjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788084636; c=relaxed/simple;
	bh=j5xquh3YmyWbm6HinwSL5zCuhiJDnGPgbOGMgZZ0rMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iZYm8QxdBVTYfNZv1CTHicwoJZxVX//WbCj4qfsQiQ2ok9SOdsyZ/gRE+kaRaKDS4wrkkQW0RS0OcTlw3xpAk5TOSfXNAGDQw/F4bn8X2v93zyZ4IohnWOr5Uv7TmwLxyFrU0r5MIyARRnhWJUM+PtuM+dB8ISvlaiSIYaavsBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PgprtML1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DLJxuC6n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PgprtML1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DLJxuC6n"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UA7BRU3927818
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 10:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tsnnJ/6NpmZ4Kbv6OZKO9KkoG7EvkwFyG/j
	YSMybLiM=; b=PgprtML1Of3Mrfz+/Vg6qVghym1G7jiEme2994tYitEWpsew6FS
	+40XKqY+85rJclL/shx6d8B7P+VvEd2DPvCJmHtt8BZf6pLkRJoS0mTeV5cH51I5
	i3PJD0MdEzpAqXuqWAl7Xn2ZUdiFglr1I2KowgWOFgIPJgHBd3kz8g6d/fJtFp8e
	jU0QzzKNFS+dTlGsoPLI9WeiML9fPVGcSabpBHRx/eXu41lBPsEzG9my0KJ7In75
	mP9Bigp5Rp0pLtSuZAS2OFATr5VDBcsAUUiDZbcfMuJRWpYw0V+Sw4DmKDp0A5EI
	2LyNz7o+CtxGh2ToSQFHZeiIn5ATXzo9Lww==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbr6dtnqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 10:10:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cacd6d37edso31701645ad.0
        for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 03:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788084633; x=1788689433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tsnnJ/6NpmZ4Kbv6OZKO9KkoG7EvkwFyG/jYSMybLiM=;
        b=DLJxuC6nTd11mg18vuDKvYjjxN8UGsqOTjqRl7y4Z8WIlgpB/8w7rXt6Wx09jdisyL
         zV36lNAjQmNIDxA6PEgT0LlDl4M+TA2P2718Fx+9Qnw435fDLnVVe6WnpFUUNqCqsVCr
         lnmlqnZG0kMxXNwQpL7V+OsA6mdyVuV/ZvlR9r5ABCPIaQZvDzR2aswtPjdSlfaO4QZp
         wGOh/LcvZ5z6Eq3nS3e57T9gegQdCGcZqukhTX/uy9vnrT7n84YAcn7mQe+DJlEJD3Kv
         JfMl5oWBOq2HrwruV2naa7Hd2eY3vLVL0c4O+1z6g6naSHdHDJqD2VI1COqKNyp8h70q
         YmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788084633; x=1788689433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tsnnJ/6NpmZ4Kbv6OZKO9KkoG7EvkwFyG/jYSMybLiM=;
        b=RPGItEtJShlzRPQZuLG7ia8mQC5OiOUoQMGXcgDep4wiW2PPc8jV0CUJojxTpX/6mQ
         JYjygbzo3bJ5mgstSveIEnUloSVcY4Ufn7D8Acd5j4XsmAFxxvZFxL+zDA/1+c88F1Z0
         JOnldaMNWt+dWM/queeJ23ILT4jBNSJCgi2rSNaIeRSgRnlsV/mOlkrkWmZ+/fH6AZKd
         m5iKcfv7Va5TpVfkHtEPkTCuZQRGlunQZqV3h1eP99lmm4myau1sp1PffecufAytjIiZ
         vah/7RybD70mf85+PPeI7Jsku2hfxlvIS1KS3Y9hHqxrc9AJfutRTlgUzmW4wIW/NDs9
         YKrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDjEohMIRqq8FhmPNHLruEAA6v8lvRIKhMlgcKF7P/6u1Vy5V4GaUbbyvlWo5bgSLIwl2aSb7PAP8O@vger.kernel.org
X-Gm-Message-State: AFuF++lYe5LVMqkz6Z5mWaFt3i0//HYD4SFnRzo+g6pcf09jrCTE0w5i
	4+tiwXOfaIdaxUbivlaWbHztC7T9IxZYVfoRZ8BB84aM26kZqFTbLFiY2qD+0xy3Lg9h+LVlWKx
	b7d5FcDIoF1m6l6GL441YX7FZI+MDQXZxTDx2LXqoS0yE8al2PwvJ+/O3snBHzVTN
X-Gm-Gg: AYBFou1+N4WHBS5QTRHrOKPZ6OFBrlDNGUgOLt4gZzLr/e0qgR5Jmj9BQWPKRD8hJFy
	IldXE6a8LY/o21wCbnW1k3VzAbKYmITnNQC90hL68SRPe+IaLO/VWi9rGi4ewZgOeAD58xrPwjM
	q0fG6RwMiCppFRlmMuIXSqTTFg/9j3sHKPrdyHkckHRxC0V6IEpKbJ2YxjgvJMp7Wsum/Q743rC
	FihL4DJ6CO9T+HEz6/g2br1wGkSu6gqhwz1qcf65JflJcQl7PoNZFwB8w6eaA7B4tdRcHG/++je
	C4eoOqtBqpDb07Ok69/B93rN+04dQxDCTCmHeLP50dbIG7dv/+RR6Vki3B5CXLd/LalS4kUTSgs
	GmxKqEjciQp4YxMD/So8ZUI23e1BVAV8Z32FhGDa5zXSADmegOJIQo2XpcuSX
X-Received: by 2002:a17:902:f78b:b0:2c9:df1b:e948 with SMTP id d9443c01a7336-2d74dc78debmr313679835ad.4.1788084633434;
        Sun, 30 Aug 2026 03:10:33 -0700 (PDT)
X-Received: by 2002:a17:902:f78b:b0:2c9:df1b:e948 with SMTP id d9443c01a7336-2d74dc78debmr313679155ad.4.1788084633005;
        Sun, 30 Aug 2026 03:10:33 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7be440sm25312274eec.7.2026.08.30.03.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 03:10:32 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: thermal: qcom,pm8775-mbg-tm: Document PMAU0102
Date: Sun, 30 Aug 2026 18:10:25 +0800
Message-ID: <20260830101025.191697-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDA4NSBTYWx0ZWRfX6JYlK0eU/0ho
 cwGmpfNeDPm1+JLGonZEUGRoOBmo4TcxnZfDO46X+VbJSIYtkK1uwxV0Ne2Nf6Cq4EggmV6tRSY
 cX3I5sU3OkWlVF1jkB1qUjTK1vR96AF9RfEuKusPZVL0YRrQanK7iatZ0RVUR/ZddM8mYzDuZIw
 kPpOtVOZaqVps29JWxXzkKAqx7epgBdIn5h6d3LaF3Xz8SSPplsWczOSPl5vXbXP66IdatuQ3F7
 KevwlQL/hncSO+5qzUDlQr+lAIRUsFcBX5Uqf87jlOVtARsWLxbkC7CnELdNBuAuIj50o3taPzs
 fCDoX/TFa6yoORt3tU7JSxybblS7uy3KRWIEtK+b8mUMrW1vHNUDiWIQozxauw5Ypooto5g8q5M
 /Dfrr4sPXUjUEIxLzvlul4c8NaFdzucjixGw2uFkh8hp8318vkgaD1PPY9bPDhNvg8sJ/CkDyXZ
 8KMQ8IAwtUZTZG/IRHg==
X-Proofpoint-GUID: MnQK8iVwn7y_r3KqgIqbMmprzn_eUwNS
X-Authority-Analysis: v=2.4 cv=Zakt8MVA c=1 sm=1 tr=0 ts=6a94019a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=DV00hUf6onYBliZHTqcA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDA4NSBTYWx0ZWRfX0+leX/cjcDf+
 hrRcj3jpsB9fMJfzawSTrb/pcuPVb7ZtDEumBGE2i925bTPH+n5d/2iMCowRURlKazDhQYCh9ek
 02LoWM3fJnj4+H4Y37Jo7esiQTjPADA=
X-Proofpoint-ORIG-GUID: MnQK8iVwn7y_r3KqgIqbMmprzn_eUwNS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300085

From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>

Document MBG temperature monitor on PMAU0102 which is programming-model
compatible with the one on PM8775.

Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../devicetree/bindings/thermal/qcom,pm8775-mbg-tm.yaml    | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/qcom,pm8775-mbg-tm.yaml b/Documentation/devicetree/bindings/thermal/qcom,pm8775-mbg-tm.yaml
index 2e084d040625..ef8361a55389 100644
--- a/Documentation/devicetree/bindings/thermal/qcom,pm8775-mbg-tm.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom,pm8775-mbg-tm.yaml
@@ -21,7 +21,12 @@ description:
 
 properties:
   compatible:
-    const: qcom,pm8775-mbg-tm
+    oneOf:
+      - const: qcom,pm8775-mbg-tm
+      - items:
+          - enum:
+              - qcom,pmau0102-mbg-tm
+          - const: qcom,pm8775-mbg-tm
 
   reg:
     maxItems: 1
-- 
2.43.0

