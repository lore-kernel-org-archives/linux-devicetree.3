Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE61376BE0
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781074206; cv=none; b=tKiE+O8+ypFdkeRoGwI/hknU57YOga5vJ3dpYVzOyTgRv1bocLmY57ryHpxdR43NguAHY7MPn3sxr7x0EhoHlH4eN587+3k1Hfhbcx/rqz3uw9730vmkwEXk0ETv43ulPstWBx8yJtUhCNIwJkoR66k/hfKPzHPdEsp/FoCmVPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781074206; c=relaxed/simple;
	bh=VrJim42FbHSy/OeG1J9YqcgVsPI6batE4df3YwB+vUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=l1h2dfLK8YHeEzz9rFcBW10jh0CvofBuLGLj4z5uT7e43aAvbSY9TlrtewRrRHOH2xuYdaK3lZVXOdEFT/AjfAyU2iwTap21jJpekw00qzuq950LRqWtniD3P657zrtSzGUpbADepMGfwunx975lZJqOAd5YCeyGAktE2Nz5Fw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jm+5Qawj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eumv87tV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jm+5Qawj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eumv87tV"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A4WluW571791
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=J/sCpXlUxEW5l79X4rBueU
	wBetk/KTDxsJDk6SYuyzQ=; b=jm+5QawjVAmc4J8ptv8QH/Cy3Mun03klOz4VnG
	I4bz+uKDmShc0dir6ZhglGNHR4MgGaCR+pwFPhuUMymfMYfy+d6PEW7sb98PTcQy
	vXXl9XM4ypuyxqZywjZg79SK/1icf4BLP08oYX3xA71RCNdWyuuRWVHZi0nYp4yR
	mkAsZadQAwvUih1P8gy/T0CV1Ypm2aJ++uiJK9c2WIs+w4G3l7uNiq1355HuIdkT
	6CFT+WL8EcGDm9Vi1IKDk4+RBH/djOOnsEe9hpTPda7nX4w0etBgkFD7cyBjanQw
	d05Cry7Dbbs9OQRwslkw3jCujFwrzPk0GYrSCW8AY3bj8l0w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq10a8f2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:50:03 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304d8613efbso6605777eec.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 23:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781074202; x=1781679002; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J/sCpXlUxEW5l79X4rBueUwBetk/KTDxsJDk6SYuyzQ=;
        b=eumv87tVnj84i5eGxodgwzw4x5kfl9ndiyBP/4DhaVUlPAQasxzcJslW3Q1m4MRMLx
         yKftHBEqyGHo57Ywqm6yWgEw2j/mcLQhMSj1GPqI+/lazWVZxFJTJqAcP6bKE1dws9MP
         G0KD5yy4gqKx890CoMmyIMoD+c+P+IJHZXuigvkiHAGKqgt0uN7jnvnWqUeiw7eT5j+l
         VGvc/IJJtFwe+khvRHQot4mpbgN+dCrrQ52KPv7Pl9wGZM0HU/crsgsHE0d2D/jFXwNP
         6+4W0tsv2ogYjiF0VkqN0vcHcZNJfcWrT91z3n3wi4JcAeeGZocM/xHzlBhKk/a3zMJW
         B3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781074202; x=1781679002;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/sCpXlUxEW5l79X4rBueUwBetk/KTDxsJDk6SYuyzQ=;
        b=hEem5eG243JCZ2ixiyPCVnHbGwdBpgEIqKGUTdp9JMFRY51xC3MkuiLFdADioIDZLg
         xGcQpUGcPlBrHrcxzPg53L7jd0a6MeQhh6r2mfOTR/TOYq3lRO2EDpKXS21ej+EbFNyn
         gp0IR9Q/B4vgBid9pCeesOC5VSIkxqotC4zWyd15FPAKEjo2PPH5nOkf7W/MOeURQ80z
         nMbVUDj0dDEBtjO5Tr46gxHNTKpQ+UuWI6mP+PxcGxqM+SkFBwxCvPhxHEru4NcP+AC3
         2XCWcCQa+2EpiyDBnteGL2XsB33Uz9X6WajxdJ71da0EPk3e9VFgbwhbgE+aK79oJ9AO
         rygw==
X-Forwarded-Encrypted: i=1; AFNElJ8bDQQIcpeDae5HlUYRT+suNcJgdCVqTtr4q5bPa/UYsLGdkuyspsqD3Bd/DnUMKquy78Jm8pwtqk6g@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl+V8+xKuu+6SMAxpR7ie+B0+Oi0+eat7OS7hm97wa6WLVdFnM
	qcPQ9XpiiOexGpqdsbpW2QGMX9unl098nR8Kh1jrIHZVajMbGQcqvamzXtKu9o7xmpPXPxkf5Ai
	PYVfmch2mc3xBgLqX4NhIoKVYf8Lf09t9KftNhEX99OfThaA52Ud7kx9nd34A0wpFSrAFfrKy5+
	Y=
X-Gm-Gg: Acq92OFcBNjO2NKrhkNM+JEYB/wtJy07uWmYtPZdBK6mPfVObBDsqI/ZOas8COJsGRk
	/wpT6oC2sflxW8eRwBug8e/ie/4x/bY2nBrk7H3Ob+vPljZL5YdS5td4Es82oMf8AB5XaMkK5Ju
	hje6EG2vHQIPPnWuYnEZjXXlFdkW5++taAkmObMh7eCXyGrgfg8gQT3rNYWZxSxvJguL9xhbO0T
	SSdfoBSOv6UJtKuMgFtRbBf51dHGQsEgGq2UoJ945+A0O+lNk+K8fSCNRL1rrkeRMW1Z1hHyX/v
	D3ODCKgQ8FdT8HSnM4UTQMWfrpje+101jsEtpUWm97GOWDt5j3cQ3odkJpg4mI0kWK8n0YZnf7Q
	1VrR3MR3vY2vzEhyAZVUJxBKFv6DNl3x+OJxyyFET0yPbqSmAez0V1QxO4ehYnu9y1uyvzitsn2
	gdexlPN8m+
X-Received: by 2002:a05:7301:6794:b0:2dd:8ac2:9f7a with SMTP id 5a478bee46e88-3077b3908bdmr14107376eec.11.1781074201951;
        Tue, 09 Jun 2026 23:50:01 -0700 (PDT)
X-Received: by 2002:a05:7301:6794:b0:2dd:8ac2:9f7a with SMTP id 5a478bee46e88-3077b3908bdmr14107353eec.11.1781074201305;
        Tue, 09 Jun 2026 23:50:01 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dea9226sm24420518eec.19.2026.06.09.23.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 23:50:00 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 23:49:59 -0700
Subject: [PATCH] dt-bindings: mfd: qcom,spmi-pmic: Document PMG1110
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-pmg1110-v1-1-6604d0adc907@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABYJKWoC/yXM0QpAMBTG8VdZ59pqZ7TwKnLBHBxltCEl7264/
 NX/+y4I5JkClOICTwcHXlwEJgLs2LiBJHfRoJU2yqhCrvOAiEqatNCt7XWeWYRYr556Pr+nqv4
 d9nYiu71zuO8HC+3WP2sAAAA=
To: linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781074200; l=925;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=VrJim42FbHSy/OeG1J9YqcgVsPI6batE4df3YwB+vUY=;
 b=omdgOQqdXWowyW+Bf8xdAAbBVlzzqrGCHkzANhtaFBfYKbB5kyLpfPoutCNNJUHoDOMq5MFvg
 BhA4skzUW57AplYk8iVe8kCTiSDh6Vlkp7AxMzx1iRmSJ07bP8r5iXJ
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Authority-Analysis: v=2.4 cv=GoFyPE1C c=1 sm=1 tr=0 ts=6a29091b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=nbmi_X8hiBWjOgQv_TUA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: kFZSNaijCJxWudiR9PrwQPd_qr8yQn6S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA2MiBTYWx0ZWRfXwKyo5cYymHFX
 ul4oJEcBiB9waiuYKDm+NycnVMRVa9bByzYEaPG/Z1Kcv8tnOmXv8dX2NUwpYPIudfUNuE9qCFi
 C8IHICWigvEsi9aJrGzvslVcREM7LXYNQwED7TGR8xOkJV4q0KdwzFq2URiQUAZVD/FyZtMqopI
 ClqwHHkCSmdyFcP/KQbAAyqsAAUFSi8HuyAkj4PdTBd3MKx0lxqLekl7qHlvqx0cM7jzf/ttTUh
 mGYBCJZ6hLoSAsjI50CSeHSKZsCsxnRBnO4WDIeiTSZvbQlqb19kh4gA2SAO5UixBaAd3YtCq6c
 biD43hp3j+fVDHrfVVAivulPANtUGxks1UrrclNN5HM8R5ud2+PTdJwItyDa/avauu6VhGzNK12
 0vFF2MPUP9cDGutwbnUFaqAJUjjuevuDLqpLnGVAZsuYZQNkrKQr5M7do4EuIERJwmY8+jL5l8V
 T/Sz7Xuxy6xZZLa6Pkw==
X-Proofpoint-GUID: kFZSNaijCJxWudiR9PrwQPd_qr8yQn6S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100062

Add compatible string for PMG1110 which is used on Maili platform.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 644c42b5e2e5..809be2756a0c 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -80,6 +80,7 @@ properties:
           - qcom,pmcx0102
           - qcom,pmd8028
           - qcom,pmd9635
+          - qcom,pmg1110
           - qcom,pmh0101
           - qcom,pmh0104
           - qcom,pmh0110

---
base-commit: 3443eec9c55d128064c83225a9111f1a1a37277a
change-id: 20260609-pmg1110-6392bcf284c1

Best regards,
-- 
Fenglin Wu <fenglin.wu@oss.qualcomm.com>

