Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC603FE345
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368872; cv=none; b=FvwVJG4wmIwpF5VfElTKrqr0mjGRIv3tJkLlLMxAliqLxiPg2Ccul04LYDbVnHaJjb++R/6PULsZZgGRtix3AkNad6gam3q+mh9lzRDX5tnyx/BFTC537LzZ51OHcGt0c8mOVefN4zDvsKY/tbXN2K274WQrlcHa5bUJaTxKq80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368872; c=relaxed/simple;
	bh=6Gmdmv7lAShyad7gH3r084z0fSBUtKnxVTK+fj/IZQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=So9zHbSLB9HHzw8Pnnnh2sKISO67innYVXjgZGoFnmCAAJKubt+F1SxRku581JcK4zwpR3vmYbekZL5uQhNxB/RlBpSu4LSxnCo5nEI2yBW8Sa8hUOlHeWHyeqYzX5oQcdik2fxBiKB7MUQRh3BRddUiD6tHsqeWCYxhQiXlE0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mtD0vhyJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dLyjxi49; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mtD0vhyJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dLyjxi49"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99nXT3118529
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pjzMpKoao6HjiAoTyRYUjE9J9YMQAJD0aLcYZMVcq34=; b=mtD0vhyJaRX/6n2h
	oNW6gwzXESyv1buCP50hNxmmf3vTalLeUsZ0c1zG4UA3yqyY/rMzvoPNMguUwP8U
	lmRUJRYJTZlOR1kuyW9g+suZD8y+QfacKRoilqBpq3QlwBY+sN5CfCwuIKQzOGXT
	cBGuIZI2+YVmjQQJ02WnVq7ELb8N1hKrD7XLhbOYBDryvOq9ExAIDU5lFZc4E9Is
	lj6rFukyzaW3MOxBL4YWfTsRbXYqMXzMEvfmM4Oxx5/tJghVblobUuKvtrvJjDou
	5p4Io1bt80tTDsy4Q7DNo0bVqzu458p2p+LGUz3nWUWGd7QM+833UD2wppY/LMaK
	ei1DCQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9r962htv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-369ef27fd09so4313762a91.3
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 06:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368869; x=1779973669; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pjzMpKoao6HjiAoTyRYUjE9J9YMQAJD0aLcYZMVcq34=;
        b=dLyjxi49CRATZoGd96STPIRsHY0RmXf+YwUD9vNP6flSuYgeEQ5LvBhR3L/7c+cssc
         p3U0RRobhAGz1G8tZM83Gu7Al6AWBfpC3jNMnE3pVTKDlWbtNoRVh+kvH7JSIk0N78fc
         OlukV+Nk+70+TFXp5nnLRrffYaH0nfOHmXcYuZa1q5l0WB2iNsaYb6TZmgioAZkLYgXF
         TI9ZtWt+g9eUV0oWpbRtWU7M6XkmnOqaVpXqMywxXaYvHmY9C10aep2YxqEnhjBkpxmm
         eGmGmUZCNAacL2wO5WyECiaKSDzUHq6riCXAgPdSYXoGU/+szII9aVIgmTzy3gHnm677
         4P5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368869; x=1779973669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pjzMpKoao6HjiAoTyRYUjE9J9YMQAJD0aLcYZMVcq34=;
        b=TC7qA4qelZ4A26o02sc+vODvuUxp7zXhU2S2LCKGfYuVkTETZaKvINCN5E5jf/xiiq
         ZboQqMaJypPK5TDfFx4LQRipBnP3uEWrh8dfcmDDsBIsm6IzVodW/+Zjk0faYWv1diWm
         IpAjdSqFSk2QfgDKWqDM9c5YdpeBAF62egPPyh2OuSqoZPrPrfHTzhUgXInyViXv/ELr
         ntm67wWA5jPw7YPnjAotlQkUkLG7R4kVOM5WX14n528rhd6TJGYjYi/2zxuPBqNppIdj
         jYpQODDioOty7LdOcEHS3sw8aQedL3EMXpcUqJz3Mnhym2FBrSGmo6SRoE9F2To+oyvK
         Hd3g==
X-Forwarded-Encrypted: i=1; AFNElJ9AoI33C3WxJVmivMFCIJS2L56fAo1r5tyu6vQI/N/Iv1aoafvxx7ArJW2XpiCQJ5CmvLxsqRBdNGho@vger.kernel.org
X-Gm-Message-State: AOJu0YykPjDEOszq2WaoBt1zQ+M/NQbDk9tVoTsSg8ED/2IH6kAVtycf
	QBy8ce4/mHv7x91IYzAR9XgOn6reeCn5gAidWL1Uwo4Hc3jwaZOMdGOa4PRzH/5Mgb8pYbYJ5JY
	V5K4uzBs68BIhKi/OYIxh07HhQBGNB3ucuCHNm00ezTIpf4MMTtRLtcsii56o2RfK
X-Gm-Gg: Acq92OHU68aT3Dy4lwc1lM7wAO/NiglChjRxzgym0j2Y+6LHfBkfmbosPYP/YH0hXZ8
	nN3IO97GulzWltOxpMKIqOMrhbRRV5x7QGL3K20UO2Kf23JAXEjjaGTaCTXI5P7AqoLKD0bA0TE
	HWBCe9O25pra2jOhdRT046yQwxRRUbAklimAiJs+lXW9qEYDTB38VJ4jKJgLHWgZ61R/hkNrOSz
	5i93IhErU8FpDcN5R5mFSvg6pvPbH4f0xteKfiZNXYdrlKjUFhCIcC2tmQOZJyqgYpbC8FGYrXu
	gLvTP/XcTs656vnbjQU6RD+tgXOB0zmuwBIUcCNmBFNQXYrFdrmO3suTxe1FyDTaqfAKtQU7IyV
	FRqJM1ceHxjsoGHkfE58mREYNqg9mjwgkJnqEMqHPAsHFR5B7tVaC/dAf
X-Received: by 2002:a05:6a20:432b:b0:398:7982:21df with SMTP id adf61e73a8af0-3b3085e3d36mr3488821637.9.1779368869084;
        Thu, 21 May 2026 06:07:49 -0700 (PDT)
X-Received: by 2002:a05:6a20:432b:b0:398:7982:21df with SMTP id adf61e73a8af0-3b3085e3d36mr3488775637.9.1779368868587;
        Thu, 21 May 2026 06:07:48 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:07:48 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:36:46 +0530
Subject: [PATCH 13/18] arm64: dts: qcom: sar2130p: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-wake-v1-13-d822567be258@oss.qualcomm.com>
References: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
In-Reply-To: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=993;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=6Gmdmv7lAShyad7gH3r084z0fSBUtKnxVTK+fj/IZQ4=;
 b=wGdhZ0hYyeA4bDycQ44LCcuTBZ340Xcs44tHG1zM/hJ7vJXCD9ufC013PUR2zj6Ne3Vshqexq
 HT3g0lZQzpODZkypbL979/aCHTTa/6OkgxXQbvif8muY7H5+0zBeTpM
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: rZ95wbRXaWsLEZ1V43Rnw1iAFr28tRkY
X-Proofpoint-GUID: rZ95wbRXaWsLEZ1V43Rnw1iAFr28tRkY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfX8g7iqO4GYZhF
 Ixxbz734TfIhzcv0WiReQOSuppc53qJwU+xOSB9d2BwEJoXgL3EYzNWwEAMOTQLtGLtTUisWdoY
 oHcrQrUN0qEspAccug9NNfZFkO6W5thqFkwMkSZnyT6LAKYUsK6z8mb6HMZFggKzXF8ejy8ZFVs
 4MC/k09V7wNfpGl/scV2I/kwARFJ7gHfpxGldc7F59Smsyfom6Z9COUBCk+uFvlqiW3r7YYd/i1
 prQQ2WTOmtQVW9mNLGem8e1+ObkmwsxK4dmiCrZMkGcaRzF7NCv/KKRK1gKWfkAZdN5bRl1l6WN
 dT/cObC9FlAlenXT0CZ0Rl7e5xjtBMWceVlGWiISZSSH6WfgbxrdNSDCHEjBJSXRLjmF2Zde8OB
 vWNXRIwWr8T6S+gvRonSDB/+9ncLuMtuVvLgwMRpprx0tAcDEw6crAvpKlFmI1qSYerCo93rlxb
 9oqd0tap6uS6/Fu3cbQ==
X-Authority-Analysis: v=2.4 cv=GqFyPE1C c=1 sm=1 tr=0 ts=6a0f03a6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=t4RzHNKIQDbQSdFyBH0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210131

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts b/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
index 74778a5b19ba..71a09e76b359 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
+++ b/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
@@ -358,7 +358,7 @@ &i2c10 {
 
 &pcie0 {
 	perst-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 57 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 57 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";

-- 
2.34.1

