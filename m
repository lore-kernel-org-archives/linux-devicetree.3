Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3C820125F
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 01:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774228650; cv=none; b=J9AIjyEEKMxZy7QDo3+l6HrmUXwhONgSvNtwRS/r4EgntYmR7OKJVXDYxB8iHQx/Sa+hfs2bHlcQHdAQnmJo0roL2RzkgLBjJmtKjRirnyJiIHSdKkmTHuE+Pg+Jy0xZ4UGQHiRhndPyqMBoEgn/s4GTjlV645uZqmE3ZMgtGDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774228650; c=relaxed/simple;
	bh=ve60Hat4fjDGd6a0MMY2a+1ZxOsOvrbkOAK4ZWhT+wM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DBYuyqGi5+vs2g7MMKKeYQ34F6AwMAUdyndBK4gCAFUbjif9KaCxJ4SyhdV3mk1fcgZXCIgb2lm3b78gCuBMAYxWFbtZTq34Kj5zFZEp2W1w0k81uE7NVosTLhaoIfozGPVavTSYMcohr/bk1Q5p/GQtnEyvdfimrYw9VF4FFRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F6CYOZCL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cFSJvcjn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F6CYOZCL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cFSJvcjn"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62M7DaQq2489750
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 01:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CsLnVUkiBBNLZ7fR/kaHQdxLUTQ7WZot6+FHpylt1ow=; b=F6CYOZCLv0pLDWtx
	XTI+ZEEIDyqveP9oLmGoSXcAx5pZm1AcAf61skGhoG9Sd0NFiyWUkPge/DsKuu9c
	3I3GWJRNRI5jf2S4I6LVVUgssBDyWs2mQxvC+QD8IL1nfnv3oNLpkRGNqzztuQDO
	w8xM99YPZ28Y63KzcVOLPCdkkbWIH/TCS9+glJcBOJX8yE9hP4gA8QNTJQuNS4SZ
	2QFkUPw4QTKOoVPbGYT4iMZPDNXcghuw2O7Xrb7CMIilj96LSUURGq5m5tAPKucB
	ALOQX/CaoZwcmToG3Tv9eToqXgKxxmecBaKVThWErSuxtdAicmsPHjDFfV2zWBys
	TpTaRg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1gpk3emj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 01:17:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090cc6a7d2so220545961cf.2
        for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 18:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774228647; x=1774833447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CsLnVUkiBBNLZ7fR/kaHQdxLUTQ7WZot6+FHpylt1ow=;
        b=cFSJvcjnY58N86jUXuCsZjCq+MsFIM9u0gjUn8NJwrhN4TeXSoC9+KlpzljE6pBR+h
         IIBx4L9+lzT5MsVUtO09jAGHrgis3W0RIyjfJiarRhQIeLR0sJyUskcIbpGGH5jL+fCp
         ixYefTnFLE1YpBnJjZoJ1WJg9Ch9Xw2oNWJ+W98Xpb8FnCpUsKKpZWiXk9sID6O7SssE
         pLywrZ1ZpR7UkieGZu0XYpnrZBl4GR1FB+1THAGYESNtawlCN1MtVZYQc0rrxzMac1j9
         2q1w9e+WF8CntMBIbFtSvsFTKvJKB23ZvE0sKnADtSPR/2SAeiM0AsOaJugCi1oXXVTY
         Z0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774228647; x=1774833447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CsLnVUkiBBNLZ7fR/kaHQdxLUTQ7WZot6+FHpylt1ow=;
        b=p5RX7ugp0bvWDOMdEYbpfniBUzToZZ0qGMg/vE7cvx43a0NN8slsabWnZydbsNIhPJ
         /QnTJDGGAk4QE1DQUKcgSjzo8cbg3p0k/xOzftopwEA4z/rtxuMHhgplEGChxan01G6Z
         xu3KungkTHdCEHA8bj2YUv6YL1SLq8zB4/aAbVTcHX/BtURhR5pbN4AVyTOlSwtnckY9
         wG/DTwIYR9IDcoTnZOYrYt9PIS+5w6oFbYqLkrcLNJsCbvxBmQ2t8wiqR0BShaX+pngB
         eX4NvK0loX3bEDQaEl6qLT6vquXJnloqiLSGcHJJNNCI+QUbgf9W+9gjjSWylcFsKjiO
         i/0g==
X-Forwarded-Encrypted: i=1; AJvYcCVNgifJmBapBZK1OSEwiXLYR3E8/hdI9ScjjC7dVlMl1J6mjoASfTjMKXXZUXtgh3Ut9iRQDHSGHiJ4@vger.kernel.org
X-Gm-Message-State: AOJu0YwEFc4UzSTFBlfM4vqRySFXPyOBly6/ogXdK3jpxoMBaf/3wRyd
	ABLwk9xvlfEfDtD0qqzwBW+7pOIla1NiVD38arVed1mqHlquxBRGu+DetCHfoU5nwGN9UN/1nou
	K5+xxABKjX+FtY1TUVN2LGWl0Tmmgi6sTlmGVBcG/psv2sGlmTqvgcw4oxSTMmBze
X-Gm-Gg: ATEYQzyrBUROi3Tq1RTVmHKZc+jIuipl6Av9abwwEHZKiAi5ueu4EaeOOcxPdJeqHqA
	15r0PsxZNpd8oKa8TdYYaYGXyeOl0qFndHWQ1HDSThYuchh9jFyLwPIxtVQyNcqDjsJCSeFW/gg
	NyrBLlazH9uDQtyHdB1HiTm5YOHv1701QP3yCH0r5Jz+3MkOxzEC8LMF3YjUzVJHr6UMQiDn11j
	mKo5WleoO8fEr2xY2BUcTUmvJ8y64tEjURHG62UnKFwijYh1t0Ol6k/DlbYV+duF0DdHO8CUDgs
	a894CHvq+uCND8esJnNm4j0KfPpkiggPX54T0gr1lDf7pLMri5zcH49yIKY7H9Hlatf8tXfb3qB
	ems91jr0mD93YNwFiOhXczwNvV9kqIUHWXZcbTGRwOxFP2CUNcIUodSdyVuPLA52tObSwjXZgsJ
	+oxGYjYX0bK9IEK4iJDST8cLYFPihYGrOJ09o=
X-Received: by 2002:a05:622a:8c:b0:50b:3831:417f with SMTP id d75a77b69052e-50b3831446cmr155920601cf.45.1774228647261;
        Sun, 22 Mar 2026 18:17:27 -0700 (PDT)
X-Received: by 2002:a05:622a:8c:b0:50b:3831:417f with SMTP id d75a77b69052e-50b3831446cmr155920261cf.45.1774228646653;
        Sun, 22 Mar 2026 18:17:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2853050e7sm2216150e87.61.2026.03.22.18.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 18:17:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 03:17:17 +0200
Subject: [PATCH 1/9] dt-bindings: interconnect: qcom,msm8974: drop bus
 clocks
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-msm8974-icc-v1-1-7892b8d5f2ea@oss.qualcomm.com>
References: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
In-Reply-To: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1735;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ve60Hat4fjDGd6a0MMY2a+1ZxOsOvrbkOAK4ZWhT+wM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpwJSe3RQdQJFeHh2xXQt4k+38SLjcj2g9+v+Nc
 s9xarp4oQqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacCUngAKCRCLPIo+Aiko
 1TuBB/9xmgcOyCA7bpzuVj8O8Z0KrnHaDq0TyTJ6Bv6KFU+xUce704YUp5HWPkbolR4kyocq6t2
 c6Vn96ja8bJN1L+uS5g1Z3VxA1BTh6o4QkYu9SVsCMMieVOp82xsIu3QJtyvo9rB35eVdJbe28N
 UKf4HIOA6y1XrLi0/EQkJmRS94HEgRx8CgT00wnYEcFDnYyhwv/cOzDqAr7TkTJIDx+oTwer0Ad
 Pw1C2ncE0GzrocHxvmckHAZmyA4RA/l8kLNult6q6uwY6EbYTZ0AII/sCL7zZKVrrG7T6URI1a1
 zWtx37rlS3/gvihjkFrJ92N645FTALb+DBK1xH31qmQPYYaj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 4yOGDB5mE-kB_48UZ0Ko7cw2maePazII
X-Proofpoint-GUID: 4yOGDB5mE-kB_48UZ0Ko7cw2maePazII
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAwOCBTYWx0ZWRfXw9jCBxNPaX0t
 QSeQKbpa1JKo4lvrkwMM/tQXonmtQ4ejFz+qi/vLhNfFfndXTRkySUq2GRKVDV0iyQ7F6yLEO6I
 Q1ZB7e6+jrkl+JGiUXFN/d+GLknPRlVAZeDJlnjrspwgWWZua2ytW8VxEqpPU0Cd/p+rXwqrUfp
 G9Ip4OKxSpqzLRngjrz59QieB4iFWSqIDTxDYq0M8YF1kiQ9VlEnaUKDfK4FSESMk/r+95WEtoS
 q0LuF2P3nLpIerFfG6jIUyCTO9ab4taoYYngRiD/95N3JifTwkeRa3zjb88HrOKEyq+9bsTcYZp
 C56Qqi/txGOroMur9+tmR+MX1pSlqyIERhhSzd4f3wOdMR2C8xfkc/0pTFFoIPd2yQuwHoXZlko
 v0H02gsp1U8n2qPf5GRRGaQVRftWpeVOBnXM/SdX9V+/XIMU4WwvjulGTaV7rhHVkZu6VKBzsRb
 V+r3Q276p4A3GKD7zTw==
X-Authority-Analysis: v=2.4 cv=QKhlhwLL c=1 sm=1 tr=0 ts=69c094a7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=xO2zaiYFPJaqVjnw6b0A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_07,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230008

Remove the wrong internal RPM bus clock representation that we've been
carrying for years. They are an internal part of the interconnect
fabric. They are not exported by any device and are not supposed to be
used.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/interconnect/qcom,msm8974.yaml         | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8974.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8974.yaml
index 95ce25ce1f7d..89a694501d8c 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8974.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8974.yaml
@@ -32,22 +32,32 @@ properties:
   clock-names:
     items:
       - const: bus
-      - const: bus_a
 
   clocks:
     items:
       - description: Bus Clock
-      - description: Bus A Clock
 
 required:
   - compatible
   - reg
   - '#interconnect-cells'
-  - clock-names
-  - clocks
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: qcom,msm8974-mmssnoc
+    then:
+      required:
+        - clocks
+        - clock-names
+    else:
+      properties:
+        clocks: false
+        clock-names: false
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmcc.h>
@@ -56,7 +66,4 @@ examples:
         reg = <0xfc380000 0x6a000>;
         compatible = "qcom,msm8974-bimc";
         #interconnect-cells = <1>;
-        clock-names = "bus", "bus_a";
-        clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
-                 <&rpmcc RPM_SMD_BIMC_A_CLK>;
     };

-- 
2.47.3

