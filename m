Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00723D4117
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 10:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778236879; cv=none; b=Q12ly6q00pJQwJKfz07dr2f2u8Cb6TCOeQLQWglA/sBw8ZrMp4i87GqfQcAArikaotxsti2+Rp7lwLqn+M1+cdkIQuHDhVCgzHpjqUm9QO4TWb96VlRgY59kMu6wk6s36bygiNIBzUEvUrOEP6vkmE56xcBEz7MGnmX/sfUCu/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778236879; c=relaxed/simple;
	bh=FdSJT6D2xuJXBvgDlnbYS33t9DDGMH2c6pzndhSzc9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ajofJTFgvR1DHqK5TG8du5GFwIj8cMmH34sRZXtzZbXjIlemr8z6it213DlI/D6s23VgV3kaiX4rPMx6QKiO/GRUlFHk5a+5AQ7A4H0cgzCDqww4ElDdEfiWCr9/P12KAgY7aDjFD45hn6gNuekXE1f0KsE6RCungggBZ2bblOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PuS4G/KN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TGblgnqR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PuS4G/KN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TGblgnqR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6488Cawq2384382
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 10:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hbge0dEv99gSEczZnlBtmLnL5tJ6c+VFnX/wLkDiWLI=; b=PuS4G/KNYMBBCBci
	q2DnS35ikkPFflQqcO8Kq3ulREbYTryHHTsXcqsUGUzjxMwoO4SeFbiaHLIqhyB2
	C3o/QyWNYPlTuf1cXanaAAue/OQlLyk9nzuma6qHaA080GNA+Bms0oZRzvKeMeOV
	7bC7Z4SnLxXuoLcTx5Azm7MOq8RBAUeymzr4KlyrMlJ2GkNNFSBh/vM7FVZ7zcZI
	Ln4nCQPL4wRgzh1ndREsmShLhio2szKc3m3KQ6VcqBfavbKr0WPOw++AmUy81jrH
	lTzb0tuEW0lHAcXjc83JjIua4LiNOpbEdsY0dNThBWYgv0dyP6cxjQCBXAIAUk3n
	EqYC2w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0wwukp6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 10:41:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b9f5ac4e36so18704015ad.2
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 03:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778236875; x=1778841675; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hbge0dEv99gSEczZnlBtmLnL5tJ6c+VFnX/wLkDiWLI=;
        b=TGblgnqRxVdzR2ybGaU792yyvYBAhbkSp6NUqc2GzsE8e1+CWRQQ/XlPn9ugVIPF2R
         LV9uGd9T022lFW5o2/r+G305LHS/U1jzjttmPpwbRtcSF4U9Ds6Q4V4QsUyp0Xw86qj3
         kqLts5B1nYZv6ZLrlcn0TpV+sePXJl+fbNMxOVfMB3b9cpV4beaKpyCfx1llauN54Ett
         i1TlueTj2CHOGnkDrOx0z4/f4Vdk2g3n4b56gBdpg8v9zl+DNNwSnH7A1PCO7V/ow8ZE
         GWwo89VM9KjX5a258NrbRt9QZwzGYr8rIjeS/FRgSC7Wvn02Od5F7/0Ux2Lyg0lQdw1z
         Ulug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778236875; x=1778841675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hbge0dEv99gSEczZnlBtmLnL5tJ6c+VFnX/wLkDiWLI=;
        b=UcaesjtbAmUj9h16C+wbZV8RpPRROmNvaXYCVIe6u786FvcnlWoCzkjrOQWe1DkHaB
         Zl5f6cPBsXkNhi2L6WtIc9Qel3lS7UBhqMvMl+wvDZ4b9CSHjMSPmUs1/Cfog71xGc5S
         7Sy1nc5rQ610zWkVcUs+TGZIqY8BUCgIae4jPlGtSzSHDb0gU1ki1Ebmlj9TkJjbvQeK
         QyveBDQ1m67rKsYTLkaX0y7fCt77hMrISMY64G2se8mXN2l6bQF/LpsDoQ8BtsZQHaAX
         zHuS8e/Fgg12Lg/VCXHsUGTcN9GL5wDRNxKmH5sjN9GKY7YQDR7CvYk6SciKvvbGpygN
         00Ew==
X-Forwarded-Encrypted: i=1; AFNElJ/OX3V1SKOosoBg8oxr/SvBCg9jAvYmMrZEPTG9wTVXZQhh/nsLowyHkz8F4HfC5NI1K8PH5FsYr83E@vger.kernel.org
X-Gm-Message-State: AOJu0YxOZVJAOHalXGBTpDlntyXHShz88xbTJbjS4qHDGpDWY51rXGTh
	rXiDRJDSC3F1Z9r+LFQ4MYq71DsjQSlc9Gpewc7alkQQXsIEI5rNvl3Ss0BSfQCTyLuu8YWidGw
	AzaSOwz69UJSeWjYDeLWYsZUPBYH9+vILxxcpA7dAvSoLuPsEVmAGJ8QvrS+A3Nk3
X-Gm-Gg: Acq92OHoTdWVpHhQmJ5wdaAV5SDgcXLIMLMW9d/9+AVg22y81sDr7i04UGvxTZb29CZ
	MQFQ7vXR5YLUA2aTe7b8srsGyYxZ69ybANusJnx2/6dKJOvNMBjyub1mJ65u8NGXznriRxrjUZx
	nG/QMaayKoTBeIyY64X2W/wn8l0+lb+SbmgMeqwk8ipUq9O9BXjv3AW7j4Bs6kRKs1FYb5xEAw5
	DpcsNmIxCuhAlEKvuSeWX8vzrE5RgA0Yy1y1I3EbgakY+aZt4BLC8B4x1gGTE0nwmzbI8QgbJLw
	KGRj/2O8IvmfRlwY3Sauret/FLGekXYEEvWhnew4M/pFN0kBJFqCjgMeG7AxNIYSZSeKhSRbw2A
	pPC4hChq07coj8NCFdU0aQ7R4Y1YcieaNYR1zotxaCremNbEyr+c=
X-Received: by 2002:a17:903:284:b0:2ba:6ca2:be0 with SMTP id d9443c01a7336-2baf0cf3149mr25002095ad.4.1778236874785;
        Fri, 08 May 2026 03:41:14 -0700 (PDT)
X-Received: by 2002:a17:903:284:b0:2ba:6ca2:be0 with SMTP id d9443c01a7336-2baf0cf3149mr25001695ad.4.1778236874295;
        Fri, 08 May 2026 03:41:14 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3fee3sm16692455ad.18.2026.05.08.03.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 03:41:13 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Fri, 08 May 2026 16:10:48 +0530
Subject: [PATCH v3 3/3] dt-bindings: mailbox: qcom: Add Shikra APCS
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-shikra_mailbox_and_rpm_changes-v3-3-698f8e5fb339@oss.qualcomm.com>
References: <20260508-shikra_mailbox_and_rpm_changes-v3-0-698f8e5fb339@oss.qualcomm.com>
In-Reply-To: <20260508-shikra_mailbox_and_rpm_changes-v3-0-698f8e5fb339@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778236855; l=1036;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=c8/SeVqVj0VIwMhz140zaO2lQ7IVuDyupHPGVMe/Wdk=;
 b=5n1W1ZjoJldxii4uYKxfCywv1Ykd/6xTuZLCPfUBElSma5qAC+Qaa0cYoh8pZhXl77swfoqKQ
 WN2goHph21eCaEyIyOPugcDESJ30YXUkeI1TL4DBqK2vljOX18wk5Kj
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-ORIG-GUID: JlJ6Qw7H0jmqGYteSUBDD61tHGSfKVxL
X-Authority-Analysis: v=2.4 cv=Nd/WEWD4 c=1 sm=1 tr=0 ts=69fdbdcc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=QZub9Z3z2oi6Mc85LyMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExMCBTYWx0ZWRfXxmHbDiHSHN+x
 ZqZqOdv1Xis6Zdspq6cmlQLcyus6jYu+dcbBQCzJZG3QDLNV+fIeiDUBcsnJsVm0LpH61MZni3p
 cg3BeQ11WxOus52aA5ybvreDns5TG2XdvbxtAqd9HyyhJ1syo6w9IGwDKlRleKCmdxFItQc5nZ8
 7fNYiWcrf1zySDIdb3fbPsEVP07wflrUCShzxoOGxD1/x6qSV8KnZbKEAzsGjWLdmiXykyzLGgc
 JC7Pz2WgxywxNo/wvV/ZlVP1IzL7dM9FVS/3u9bN795B+0ncDfJCd3TN5E0Y5TfcerbqrATUlXM
 3IvBYcQpwneEAXqfA9WVYR24U7ClZHfbrhSJq2iW1jVbyIUsaHUAaClCTfJXM4LPL71KzmYegLC
 cxpC3dSWy3nNSSiK8MMJqvP23XNy2oWi+kwpGFZxKXMJ/0X6jAo6VfphugCXVZjS63qbe+9Qo6P
 iM+CDhXhrWHfDHi53jw==
X-Proofpoint-GUID: JlJ6Qw7H0jmqGYteSUBDD61tHGSfKVxL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080110

From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Add compatible for the Qualcomm Shikra APCS block.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index f40dc9048327298c6e78d4327bbd5f530a013604..1b4ef0688ca79f92f579d9bf5ab2cfb2bf879392 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -49,6 +49,7 @@ properties:
               - qcom,qcs615-apss-shared
               - qcom,sc7180-apss-shared
               - qcom,sc8180x-apss-shared
+              - qcom,shikra-apss-shared
               - qcom,sm7150-apss-shared
               - qcom,sm8150-apss-shared
           - const: qcom,sdm845-apss-shared

-- 
2.34.1

