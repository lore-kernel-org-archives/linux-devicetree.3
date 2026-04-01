Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E0D23AB8D
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 09:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775036506; cv=none; b=kZroCZK57isaS1Hf8flpgdcJyqbfwe9IC0zr2iWm1vFH0DuQyJelZPgtM1VT04CFsg4h8u6fUY6lBurgxz2xxz+TYvAMihM6JWjoyvbtLgPYwecvKuZxVUupTyWwtGaUyM99fik+8DvPrXHKvI8ZtFU9NdxEoGfrjl+RL1vHjNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775036506; c=relaxed/simple;
	bh=sasOTkN8AUTzLdpvJZcyVh9DMQLEJiqUYgURuiBgDkY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tOKHFyZFODsbvAp/DifYNHJ0zHWzjngDAdfTW+2tcNYEWHPZA6dmzldi8EUGq/PlsQ7/sMXRg39V4jhwj70FQDYnfbdrePhhaNoue5R7hEvTA4wvX997W6ylw7cLKVPNjgTrkLOKErIjbSQRnZSh3vq2pJHW8smFgjwqweQ+KUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=isWEtfCD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BOCCof2t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="isWEtfCD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BOCCof2t"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6314O6g51562613
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 09:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=E1ms1DUQGZzMgUe2cRl/AL
	bJBilJ7+kU/kSLleU3KIU=; b=isWEtfCDDKYH8XqDggdtAQt0ztZzvCftSeq37C
	eCge/42LKKDYy+FFmKp+LjdxZBrvzJYy4WW2hGoSFOweGRdS4CnFl9pFuCEvCeDF
	9J7zaCM3wrE3FU0iOnnuCkBi1gcxxiwJ8sv2AGylj68m+3Y103Tex8zisnqlr9z/
	qRdNCCn0dPoGzbwIrQSUpVk0PoYbJbJAOreeTqI3aQTaQLd617x/e26AdsNret5G
	lXCdWTAyE/a4m9oQ6UEa6CxBTeFoTLaUZ9SP4N+q8zPMrbXLVo3+f+iBr7PZl5eb
	SdGaItoovax2MpyvkELrpWPLMj+MMtbFoUSGGAVNW3hroCsQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8va3s6dg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 09:41:44 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c4cfe08c9dso16352806eec.1
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 02:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775036504; x=1775641304; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E1ms1DUQGZzMgUe2cRl/ALbJBilJ7+kU/kSLleU3KIU=;
        b=BOCCof2t5KIbRUuNJVcPW3w9qcBySTJAJFMDXZWvdXt6A7wIENFzdbvCHcZh4UBPgu
         FlxqIdWSswv4Nfhx1aFFeCy7/PjpiKrW4tUdos/ZclH0YVyFH82mQ3cHIJVhx0XECXrS
         n98slzv1itBxzIuWURixgVt6lmZRggCTfOHearAnXHWi/7fuTV+5nNmcFgY6d7aLF35+
         0m41Gxj9rYmLTnz5cPWZiNpr/rF0yf8Xop7hsJCCb1aimhj4UXuiVKosUesjrEu9jhNs
         34ejB50emPoMS8cPEJVwm78qGJc8rEn5yc+L6Jw/yeysgohXJ1Jvi+uuYPrYg/j80ZN4
         NliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775036504; x=1775641304;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1ms1DUQGZzMgUe2cRl/ALbJBilJ7+kU/kSLleU3KIU=;
        b=aDS2gxg009O4uM51JQGebKpEZtJn7tgr5w0iS52G1fDCGaCsd0c/P9V6VpJiC+4W2t
         ag4P7GNDAjPXeehK1WtvNtuhm1nOaQRIHrxNDfyVXnTz7MrvARpYOoWUQ1RLzLp1SyAj
         GmurEuvVOtEvdVjNaNyiOMJQtcC0CqnfPvCm3dL++OI5EBylBsQjYAyaFR4vy3fknL9B
         OeCOyFnIVpudlv/TvIopPmHRkgtlFfm3ABavhAoMdQGEuA4/7tLTQahI7UbO25cEz9gw
         R+VUTSjdijYifFTes85LbPr1g4jR/G/zUPQG4YiEilR9/vYWIRVxIdCmGPiRyaUdcvIz
         0DoA==
X-Forwarded-Encrypted: i=1; AJvYcCVTours6ooxNUgEHU/tFw3KkXArA9EE7lVKag5/VJZZsIBVNe1Gl0NhNb6E3ftHz3gm4nB7BpAqoT2/@vger.kernel.org
X-Gm-Message-State: AOJu0YynOPAdK3Fh0MTdqSD1Xsen60abUato73sG/7jVdODvUnVBp4kK
	HWeUC9sXR6eIr49XLBuK+vPENVCxr7rLjHPcBmEmiibu1Sw3Lj6f7kdKyU1aOgiZ0GmQhue555x
	419j0U0mnns9Le13LwwMEJk76k/SiERb7L7yUIbgA8kzk+DRGZL79s5t7HmaFJVf0
X-Gm-Gg: ATEYQzxK8FUcCMDUitJbiYua0xsduCjJU65zZKGI6C+GUqCctS6Q8QW9ctFy7WEufrk
	NstguQVirPWYdI4xYFf9P+eO15BZpaYJqSVzzV7a0/CB+YNSHSSOahY/n3LenRTQR2lxHRQPTWY
	2y+eCI9z4sKCT1FfwpdbAvxRqiEqfU2oD4Fj6jhB9N+WE4RQ7f6vhMnRdTz4b94MnKqwc37a7WS
	yM/eA/dqn+hS7mOZxBHGfEad9kOVHFXQ0/Nq067VUCVIy0nZfnDiowR3xA0ongv7XGBJ8YR2lJE
	M/hW/1C+nUKvY8rCLboq1ruvLFLIJyvmiH5X3u7sE+wBeKk+ZcmSu+kM1xGm42VnwcpU8V4V0gM
	vWtF4tjGEOlyC3XiWjhaml3l/Y2Eg+JXYG/lxgXgMlcZ4nY6Myo77i86oFHFmHdcHdhHrGFcw2A
	==
X-Received: by 2002:a05:7022:b81:b0:128:d25f:3201 with SMTP id a92af1059eb24-12be6574f6dmr1659039c88.38.1775036503565;
        Wed, 01 Apr 2026 02:41:43 -0700 (PDT)
X-Received: by 2002:a05:7022:b81:b0:128:d25f:3201 with SMTP id a92af1059eb24-12be6574f6dmr1659025c88.38.1775036503009;
        Wed, 01 Apr 2026 02:41:43 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab983f9f3sm18982647c88.10.2026.04.01.02.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 02:41:42 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: [PATCH 0/2] spmi: pmic-arb: Add spmi-pmic-arb support for Hawi SoC
Date: Wed, 01 Apr 2026 02:41:22 -0700
Message-Id: <20260401-hawi-spmi-v1-0-c40963041078@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAELozGkC/03MwQrCMAzG8VcZOdtR0zqpJ99Ddihr5gJu3Rqdy
 ti7WweCl8A/fPwWEEpMAqdigUQzC8chx35XQNP54UqKQ25AjZU2aFTnn6xk7Fl5dNS6o9XOW8j
 7MVHLr8261Lk7lntM742e8fv9KfZPmVFpFaiyQaM1+uDOUaScHv7WxL4v84F6XdcPvxpVJakAA
 AA=
X-Change-ID: 20260323-hawi-spmi-a29ef97409a4
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@oss.qualcomm.com,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775036501; l=639;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=sasOTkN8AUTzLdpvJZcyVh9DMQLEJiqUYgURuiBgDkY=;
 b=n+fnn6p6RgBM702NOfUCGKYgNk9NmhKgqva60iB3Oguc4cyIQ3uCVFeQlh/4Bjj/RzPMZOkOb
 R05E7op6DsZAvjzGNEPLra/Dt2wwrBghW3MG8QVgrsbJ7RF+tEnqJrK
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-GUID: S8fHNMMEphv3ATYZLMa5vJoOB0cwOFEG
X-Proofpoint-ORIG-GUID: S8fHNMMEphv3ATYZLMa5vJoOB0cwOFEG
X-Authority-Analysis: v=2.4 cv=B/C0EetM c=1 sm=1 tr=0 ts=69cce858 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ULQQq9JTZBL3cuDoGv8A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA4NyBTYWx0ZWRfX7UgMRdgbgDiL
 CX18uB7mrbcZsmErJHcAEKlMnACFJrOVTzQaHHHaaX/Iqky/PeJY2for+ef2dAly4qqusJXf+8P
 gMBvj6XYe3laF8iZR5l2DaTeHxVz7A4MdKG1oW7Xaaev/P/v4aBDeW0DRCU/ZKbFtpwwNmOc7fz
 LQQOl7O3HlcDZWf2tlxdjiYMGmYVkhUeLMl44KuWngeD6RXzlLoBLBl+1jDt+mZu4IdvzPpP855
 ae5I38Qdar94Trm7Y5+sM3mdp01bL3+pVl3XFcHmVSSHeX5Prem/dTKh1F0HE6FmK3HwwS+d8hP
 iI/vSWw60e1GQ85tFAfrGIAR1IqVgm9ewUWhFFpltSkf77u3qR/SLR/ZMftkdARNMO1Dtnjn/A1
 NkYQawsJMEGtZzed/wEH+G+0QHSUxkIGRv7Y28ojRYgnpS9iX/yCgsyNugbOVyMEuhrdzCB7zJ7
 tym/Sxz65bCD34Bvpdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010087

Add compatible for Hawi SoC and add pmic-arb v8.5 support.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Fenglin Wu (2):
      dt-bindings: spmi: glymur-spmi-pmic-arb: Add compatible for Hawi
      spmi: spmi-pmic-arb: add support for PMIC arbiter v8.5

 .../bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml   |  1 +
 drivers/spmi/spmi-pmic-arb.c                       | 69 +++++++++++++++++++---
 2 files changed, 61 insertions(+), 9 deletions(-)
---
base-commit: 840b0dd6b8c169e963f74265f508c54f1fe3c968
change-id: 20260323-hawi-spmi-a29ef97409a4

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>

