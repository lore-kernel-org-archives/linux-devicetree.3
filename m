Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BD73446C7
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 03:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789355698; cv=none; b=ciumAycXTW+zRBakhkYdgYsBZglO4gJtY3bmPOyKfIUrp4+qTEDe/YIk0VaTyHt4luuOYhuFt4AYmorK/QgGbeC+DXJDEAn9Gp0A5qMR2YgOt5ohjzuKhNvbrLr7CxkMkuwe/0xl3qDi562wLEfCXjF5FCgdb7pbN3VH77xVnDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789355698; c=relaxed/simple;
	bh=JgSErsi26zg54MOYpEmCXDaVXp39jM1QscQTntP/eaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GIjtGr49Vkdlxl7ixnfouStvClSgYFfkD5+xWMnFBCyzMaiUkYAa1EQVjFRlQLlTHYD+qOK8GBSlRkjfp9Hf+HFO0CqbNAOIZgUknDqHRvxWNN/SER95iEUfovv+mSUyTzOpCASGcIcIGFGlq/tegUZ6KRBKR9kevSfoknvXc+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IZihtD6l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dw5EE8ZB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IZihtD6l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dw5EE8ZB"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E2ePi3151700
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 03:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=c/0YpGfZ0od
	ltJJBeDuWYSwAcG7JUvF6TS33dG0U/a4=; b=IZihtD6lZcsCs8+3l54hBjF+p5M
	nz/66Ex4K7WJV5YRcTTn8uHGdYa8sUeLcsrEQ4OCXh93HTxOXwyrKYpUnsY77zm0
	WIPspM/aPwPYSvp22bDrJkhLe/hulmTa8BaRMObzyu9bhpaf1riJE6oCXu8OV1UQ
	+aKvVbSLrxGJf8SGpfOLF25x2ER+ZA0+bAIVQMoV07zx7HBziucohsGpPGALzKJw
	qni6teYjuPVXDhg6olRLGpBCuiEyuJ+PBcRePS5eUZX20tSmGoz47f//iRTfcK28
	aOhmbtBwNXRHVODvbjam+AztoOPyoXnwR6hTnaZIlqjb9z8SaOkTgTrPOUA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k08nk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 03:14:44 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc489e7a701so4028050a12.2
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 20:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789355684; x=1789960484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c/0YpGfZ0odltJJBeDuWYSwAcG7JUvF6TS33dG0U/a4=;
        b=dw5EE8ZBO+BNjMkRS8ug7cX9NngBn7LhKX/clp4gwc9m+Eeu/eUn7Tx+16lD5yyf1m
         /Gpkc+OyWmmGnPhZ9GXcBUzhgoIgLWP+8avED61OBwxFOuBukhENgfrhxy/tdPCJKZHD
         49HGJhWwfbbZD+SrqLymw/5Ga2qcbV8QmF5qrA7om2h0e+CU3HqRo4DQsWHyicSkLytb
         dpa7qDGaANVInvDz0BxUuqDGke2kp+9iVgzSLRyxv2oeXIQp65cQt4Nx92WoNg2WnTiA
         wF+Zntdqx6+AF2XQGPqZiGUIf+T1f6fPkL/Ob/XhKfrSzUJZ1p3T1P/8KzAWicFDRujp
         8gSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789355684; x=1789960484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c/0YpGfZ0odltJJBeDuWYSwAcG7JUvF6TS33dG0U/a4=;
        b=srlWEyM8JzeRQhtcFQKE6zrlhBN6tePjXyVqamYzKg1p+x+VJNXouMiRx3tkrKsmVZ
         jMWJ6glRnFVwXzjtN9wfyTgHyqG8GpSmuf+Luzx547v7jVySKn55EiBcsVQeOfxE/wrY
         XBOMQ4kn7dKiaPKgS3FuLD9abDsitB7vRlEMWExk+xZ9IR2AzRzgWtIR9zjUPJpnNBA+
         Sd7Yd6/hGSd5cfC84q/pTICjo2scV7ogTJY3QMPffyyOmFxoCDVoooxR4PtyRKh8pDRG
         ddiZfDBp+tHBGT5F7vkwe4HQvCGDI5O5NiIyb5tdQjrVbqQga2dF5gsz6f0Fh4TtqR7L
         G4mw==
X-Forwarded-Encrypted: i=1; AKwUvByoDgG0ne1gg8bcRlVv/btaYL3UPjBeY0nQYnjKp+JNGb2OkJo9MuVwcOynDXOVUjJx1ZJdVXPAceSG@vger.kernel.org
X-Gm-Message-State: AFuF++k4awYdWgMswMDzk2Oa9xs/juj4W5U2FzEf4g0NCpvvk5KVfJ6L
	lw/9dFKVy1Vm02BbSI29ocO/Gai7yOqntYr2Dw5Igaxpi8mqSGYgXzlt+McfhEQaF4qnM0rO6C7
	Kb2YvVbw0KUcs0Iw8Vl72wUDc7D6qpLr4rhiKrrGj8BVOBhKhvyKz5JfOYmoPHJeQ
X-Gm-Gg: AYBFou1jVUhwNYuNeeHQFQWKx24X6lSwQ6JmPhrKSktA2+j0aDwxrKC0oHbvqTK9jHU
	oa2TXd1LQ5BOOXpsCQwYPTZimi5pRuNNwagfbsCUe2o2+X8qZqstAcPRAWPmUN1NMjt7YgEW/JA
	Lkmo8dhSrnNLl1d432cX9/VTt0NNynv97eVh90v4VaZZy+ZAxNj+cuvwuy0U5KL5mwbNaxZ0j3o
	0t+Z77Ca90wJY/wzQedemfPLqAuCYwZMjGFb8rB8AI8zI8cFHMSyqa0MoWCOA1LrWBhBv5NBPoK
	lZlVti40zkBaRGuoFjHERubtXxtfz1wKlsWsQA4aOiUpSNWmJYuNL/EFFpOC/GJ2LLD6hvM6pb/
	tGmxBHI/NtE+cwCKgeDX/SN1ejnF7+x2CLDAMdnEF4RmxWnUChq/Cmwo9STtt
X-Received: by 2002:a05:6a20:c88f:b0:3d3:aec2:4dc7 with SMTP id adf61e73a8af0-3db4056794cmr1158557637.19.1789355683888;
        Sun, 13 Sep 2026 20:14:43 -0700 (PDT)
X-Received: by 2002:a05:6a20:c88f:b0:3d3:aec2:4dc7 with SMTP id adf61e73a8af0-3db4056794cmr1158496637.19.1789355683475;
        Sun, 13 Sep 2026 20:14:43 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4b1f409sm26714231eec.0.2026.09.13.20.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:14:43 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v15 4/6] dt-bindings: arm: qcom: Document Nord reference boards
Date: Mon, 14 Sep 2026 11:14:09 +0800
Message-ID: <20260914031412.140856-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914031412.140856-1-shengchao.guo@oss.qualcomm.com>
References: <20260914031412.140856-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA0MyBTYWx0ZWRfX0pVLaJei7z/m
 CLQF2xBR4ZzYwwVYYj9AZycI/5/8W2WyqAb9NK/S84VBxo7UQTRPd/taAH5H70XyvCT7j74YQM0
 k4r5WB4bTn1FvwytpFG8jXRNm2LvA70=
X-Proofpoint-GUID: Aeg8eFEYxnEUr_WtVUTK3qDMlySuyXQm
X-Proofpoint-ORIG-GUID: Aeg8eFEYxnEUr_WtVUTK3qDMlySuyXQm
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa766a4 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=3mLb7b5QgQ_nS9KBAK4A:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA0MyBTYWx0ZWRfX3sb4q8ZGXsGq
 irGP104CBFGTXsBgEv+k3MECTy+XdFVklvuOSkJ2fxpd+/66VpCxONq9Xls5C2PUsSVFyRZaHyg
 cz3od2VD2TQVh/3SILDsG2Ga8P+cyDAooqIZVf6WEzEwWTUO8cND2ub5x4il6wQLnNIcGJWSIch
 NhPbe9bWJUpj9J1zXWgjh0hRB/0xsck/YbL3eue0QHNDX9A3noLEPY0Blfn3xXOu5rjQ1ITdZeS
 6tugPivgha/9TsoNtUlGzYew8rqYhbYaOexTsMFYN5uDObEYD+117fg+epnfk0kpalrpb2O0Mtg
 mCi2FMmeVOsw8LY85G0zdtxz/dfRFSvSH/SajQD7yWJcY4TPIumcw4jDDZIIn5mL0V5QjScdz94
 W5Y+WRsktGPGh/5JX1GxRwNCngJn9gcJ7d8UgfiUVPwpUTcif+E915h+ygOtHQCmxCfh/FhSpGz
 AqmLPMpuznBR0ZaVvbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_01,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140043

Nord is a new generation of SoC series from Qualcomm which includes
SA8797P (for Automotive) and Dragonwing IQ10 (for IOT/Robotics).
Document SA8797P Ride and IQ10 Robotics Reference Design (RRD) boards.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index eddf87fbd0cc..f93027caddb4 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -409,6 +409,12 @@ properties:
               - xiaomi,sagit
           - const: qcom,msm8998
 
+      - items:
+          - enum:
+              - qcom,iq10-rrd
+              - qcom,sa8797p-ride
+          - const: qcom,nord
+
       - description: Qualcomm Technologies, Inc. Robotics RB1
         items:
           - enum:
-- 
2.43.0

