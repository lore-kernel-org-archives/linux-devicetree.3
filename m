Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01164476CF4
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467018; cv=none; b=qO+QDF9L9GREPoAu4EdnlZATVsIfhnwsrR2zMy3T9H7jg2oUpVCaPbKVb93akkCr1IW8OkjhiR1dtFsq6bHgwHlyANj9qevfXOFR5ZH/OkkxqPP9zcb9w4thoTuI2Qob0zQncOQRyZWgKmwio4UKx1R8BSU+zR3NmWxMk1v9qiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467018; c=relaxed/simple;
	bh=o46548X0zjWcpw5go7rCKB5jhZfiGzcNW9qc5oI2NH4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BhVrUIwLcocHjD5/nBQnM7ddXOYHWOYZwiolttkMlsz40939iif36F9ROzWHhUYqTsjHehFyki9Hy0AK63f/hWDqli6cmhgzidJ8qViFwx/cKW0TQWxgfS+JTnjXZkhbqLa8rqaWZTwObtlVTyObkOTS8hZ5WO4uJ/RiqgyUXjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dQAi8gZQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HXygJOlh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dQAi8gZQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HXygJOlh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9h20v2086727
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:10:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RVjnGkChUmA4edEyhTP5KPm4Mw6riega2tgDME5R+LY=; b=dQAi8gZQcI3NN8Nl
	bkmmhLpBznOLDX4qKgoCLxdb2bqZNo6PB12K5QCfDQ1dT0OykT/MEa1fKXHejMGk
	kQ8s4s8OuoaHhCWtdJrZJqgg191R+xYRb2lX1fJANDmErOJDypSoN7sVffoPMPW+
	vVUbhNj5eNCYoaoYJVZHQIqHOzsT7lJfodHbJAY+RyWTvBoLssJjDKkkcPeAkRcZ
	/zUlDVJytK5NYkGKnkcTjFX5Cv5Ay9rVbtp0Smv2jID5uIopM996lEWsQC7CJBKw
	5dEemK5FPYiFG9MPzep0VE25Y124TM07xraKuxxRHW5kzL6lozu1FJo80Bhrgeqq
	J8+IfA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq1qp8s6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:10:14 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8627258ef12so9204123b3a.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 03:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789467014; x=1790071814; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RVjnGkChUmA4edEyhTP5KPm4Mw6riega2tgDME5R+LY=;
        b=HXygJOlhY+HAnFbIO7E30e775uApFHXCKnLjUCsW90DJCHvtF1siyaSr7Xv0MmFdCk
         QQvRgCd+OoDBcGBEj+0qwct77v7n7+0k1kGijx9yCUMUfBB++524lO7OqwvVkUOkv7KY
         iIQbiJFx6Dpnr3FHrxaXJS7ssvJKWjx+FgYB1GUM0dyuL9u2hrzBI2yiZ+GwCSwE3fjX
         v3mEtUfxo8cKp/9mqEzc/onxtCBdgNrazCfjPQ7yRW2lW7ekM/28P2RuboFpWZFq9ccS
         U2OOAjOXnRssib2laC4Q96/WGXMXOBeIybJolVakCRIvG88sgJmpmpMUXyEtvX1daL5R
         lTwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789467014; x=1790071814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RVjnGkChUmA4edEyhTP5KPm4Mw6riega2tgDME5R+LY=;
        b=BUUt7S3eDP7n7U3hu3S6HCADfjoZjsRH4xr6IK5hqSAamoNbsSMjFpHCj/G9+zdPwh
         rNbszNHze7n3RmQhyYXv4uI5Ha6a6fPyZB5l/4rKI3pwoHfHGi5SSPusXdAHLswEeHgx
         /vjYvs3j0wQniGI3Zn01ihr3+04Obogw4EwBTnGyBn3hKi5JiSHOiLozC/j2G7nZXF8I
         4EcJkh76nBembY98RJn8OhjihJXmW8IOa/wrcSiprbgRFW84q72LnWI7VucP3ZpVO8Ge
         rXOodPjZNHN55SF/0nNHmpZG1CNV9QSf7NwiOfTV91V+S0fXQhenpopyXKobMBkwBQSk
         yHqg==
X-Forwarded-Encrypted: i=1; AKwUvBxyW6UZnOt//SI7Y160w5YR5A8waEUhsBiBu8dPjjgTmM/PKhFrDfSgMnP6jS0OaFCBCpcA99EnzyLV@vger.kernel.org
X-Gm-Message-State: AFuF++ncFPEs1iOE5VAsvkjhu2y0JkI482SSYLG/8QW9DW/J+xYl/Aki
	rG2m739QYYWC8ppQznwmL/FEI4NTWK5d4h4rX0Es8t3p0619HKniD4OP0qP/mq1flTcv8BXlfto
	ykyfKS1gGpteisu5Sak7lcG6BualZiRymkKnMk4yOhfzwmKAVH8N2257sn0hIHp8q
X-Gm-Gg: AYBFou2yRhKMAD10j0pbUWvq7VNd52oHcFAbQbc2kZMOG6jI6XXe76W+lXl4K3/jfZa
	29D8rg5oWYzNhES2gzo/Kel3QY6UpmBYhxSRJ/FlXikmtAUAYdvyFvNOz6zWR5IjqD4SpMQJg7o
	1lFo+J9xP7o+mQZnJ8qwEXTIydjSwOZn8UjLrap2UhPfh/QHpke17zKu7utwhEuevOUDrhTsDsT
	ESOkJgjHylacOrGfeB0WU8cqYX+hcnpcr51ILmyFgW4D0Ua5kfkBKH8r6/igFlP5uJGhEdy3xJw
	u8uK8zzGzxYDFNLK0Kh6lOPjoavZiavyrmV3vCx8rQEEZSMV6VPBI+H5xrE3bSv07J/3oSCVz19
	I6dmwMlvDyjw08ft3IoAzzt59MPyQAq37gwrgkt6fzHFw1TukrK/twZhek2rMt8eTUHyFdaOTw3
	effjxE2lZLltY=
X-Received: by 2002:a05:6a20:3d07:b0:3d0:7a2e:f827 with SMTP id adf61e73a8af0-3dd529a4cf1mr1047884637.16.1789467014089;
        Tue, 15 Sep 2026 03:10:14 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d07:b0:3d0:7a2e:f827 with SMTP id adf61e73a8af0-3dd529a4cf1mr1047809637.16.1789467013661;
        Tue, 15 Sep 2026 03:10:13 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14382741839sm14244091c88.6.2026.09.15.03.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:10:13 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:09:56 -0700
Subject: [PATCH v16 01/11] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-kaanapali-camss-v16-1-c9f3f6f4180c@oss.qualcomm.com>
References: <20260915-kaanapali-camss-v16-0-c9f3f6f4180c@oss.qualcomm.com>
In-Reply-To: <20260915-kaanapali-camss-v16-0-c9f3f6f4180c@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0NiBTYWx0ZWRfX+XSH44Glp0h4
 vai3d6yjMU7HxM8RjE2QPBDIzqgOcsIK/FAbIoMbeUnSNnXsFfLDQsGCEf7Qidnm17gQ1ySVMtB
 QhoXmsdBLDWl0jyhNVz3NSLU2xxjVsE=
X-Authority-Analysis: v=2.4 cv=I4Xw19gg c=1 sm=1 tr=0 ts=6aa91986 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=8sc_bQFcTW-iTt5i-CEA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 4UU2Tjxn816fIkNiU3Mwvm2irxlIzO8s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0NiBTYWx0ZWRfXwc1rU4Ii56Ly
 o9FNwHuYF45UDzhjHgwL4xdoMJqH4kfN8BjlK8fuNQ5Lpw/xjOrODZD3oe2cCc//xnzl+cYGXXG
 BiOR6N/PFsGzSevvxyq9E/0BbfdqA3YTFeaoZ72RJ12X21jjeVoFWAD92cckBf55XSU6GqeywFj
 k6eaTObQtL3XIEoHfpCXPhCv/fmZw/ssl5KYgt2+cTL1E9+fpdkKzcB5k1BSfzC/y3Kg6EVjobf
 0hfiLS+loW5F/RSm0drP+mXG1Pb2i+6V5UiZgJmK6X5uIXFqLwOk75uhQDVA3nHcwxYhtR7ENQs
 sruLnX30pAq8Q6cxIZ4ksN85ba5xV8D76sDL/hZIyRUFjxt9NeceuCqHAiiDhGBVDsO5vH7PbFn
 UYW9/7TyKgJ/aXSPugR0AUTFx9/cprvsQJeRBSKX1N/EHDA+/bqbBPbczEWnBdN61yyrAnirINP
 gcSYBNNAxRasuqyiYLQ==
X-Proofpoint-GUID: 4UU2Tjxn816fIkNiU3Mwvm2irxlIzO8s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150146

The Kaanapali CSI2 PHY is compatible with the existing x1e80100 CSI2
C-PHY/DPHY binding. Add the "qcom,kaanapali-csi2-phy" compatible.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 993271c42fa0..fa56a375e752 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -16,7 +16,9 @@ description:
 
 properties:
   compatible:
-    const: qcom,x1e80100-csi2-phy
+    enum:
+      - qcom,kaanapali-csi2-phy
+      - qcom,x1e80100-csi2-phy
 
   reg:
     maxItems: 1

-- 
2.34.1

