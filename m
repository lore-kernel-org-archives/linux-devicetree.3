Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6253F1ADB
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368837; cv=none; b=BzBHqlGcDTE71Dpmmtl1yDssNAZdkRW1hA1naC0RpwWvIf+xJlAzDYB6hPAk8nYZySSAZFul9X4GdgZGX5y2QEWZZHBj5RrCUOlr8aYz7H5jnkP+bWC3MtZWCt4TJvuuwutnb5M5pMiEM8RThgqETfl/fyJZp9GJrq4iLCgxsFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368837; c=relaxed/simple;
	bh=SnFemOqaJpb3Bo96e1V7TzNicDBNZ9REneIaHNVBH9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eWEnyqGotNQCrqnWVh7bU1ilIGpdLIe5FZEbPdI5ozDFAqB1Yv91jNwBs55MvenTd0tWQxjfzBKo7DQcVwRxbIW7UqMx3bWH3HKg4OW3QkRjFGMbh1wtW6ZBfVhn0CP7ILC5gohb8JoMsMD3bIgEfzwPzdCRv34B8i7qbOvRNgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TjOyjEmr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hi6CYhk/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TjOyjEmr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hi6CYhk/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9AM4G1731236
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fdqOy8M151/0bGRhRV2QiiKDAnKhEQ31U3u1FbotUOY=; b=TjOyjEmr/mEgZ4iY
	4fH9rflGvTmahhdWNdY/mDh6R+mO5QmA1+epkJlSnX9fTLFmSp3cV2JzETAp2GY9
	dU6ifiKgY/wTizueaS3AdZkOJHPsnfER64T7zcrV+iCV8IDDPLS6Anvy0DGv8+Rg
	98Evc78tdJ2ah/sNy1toVUTLOBqn8wSTbgS5edCKlZX2FKLoTUmjr98k98AYaTTj
	mX//0KkaWbYWXcbNj9VcCrPMiyG9wGkQ9PIs3ivxLuoOczJCuav/QWiW6LSPRewu
	PyP6WkDCkySeUBf5cHQAaToVukeiiTBSJM0H2synupIOKXnZEpuivsn979Q2Hh7X
	9F2gfg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f5fsk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c828f0f5c23so2924966a12.1
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 06:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368834; x=1779973634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fdqOy8M151/0bGRhRV2QiiKDAnKhEQ31U3u1FbotUOY=;
        b=Hi6CYhk/zY8x8OS5G0BZkbaPTQ6KETsE+UljXZF5VK2RGLJ2n1S3MN4ZVZZtXDvb+K
         r2X7RMpEJWBlObMlxTuxRU6m2+sW3rtNlQi2jw6Vmd82s3UBW+pXhpD+5W4OJ7Uu/2Vs
         UjD3KBPsSxTOObK7I2YgHhSEYXlLVltnG5R8XRsoUW2kjFsHdme2RniyK1a04S3ilRB7
         IFwg/DcBk5bJv8gFT/riieQWWq7FiZP+qUKkRp17QZfzmb0o+aA2LzhppoLT0bb1lZx1
         vdkDMVp4s37iXslisHZJoDQnqJzONP2gfRoQARsf41kJ9r+LJZnLCY/Kk1XrXz1jswbw
         7pMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368834; x=1779973634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fdqOy8M151/0bGRhRV2QiiKDAnKhEQ31U3u1FbotUOY=;
        b=gZe2gBIZitXaoG2EFyf6xCH1ToKFEwlnJJBsmXgiuJaVcyI93Nov0BmDoQyEs9dUSj
         d4568TbM0biRB3h0WHdrBPm8IRhLEnSP++7PfUO3nw9jDp4Xiw6zLrmd3EfKv2f4KQ9W
         nP7+Yl8+NfhdFXvqjFiTMp9SAqefko26rhx6tyYpxqX/wJyRXIVPBY3fwDNppOdZIdxu
         LMd+0DKaTjUqqDZnk5flyQZCQekqkg4YDt9xF5WVallUOK2TRf1YPMrcNnojajcIybW+
         fx0BsUj7x/vtY2oSXlO/FH+GeuttsOlbLxvWq55VD3B+vyC7/Adwoj6X50xec1eMzDpX
         q9Ng==
X-Forwarded-Encrypted: i=1; AFNElJ8shLMktQi8OHlqQV5Z1z9ps3vaJPGaCDWgFUAKtgLJu0HA4px2Qe+i4PSrtScSPAgxDdME4qLEXUg+@vger.kernel.org
X-Gm-Message-State: AOJu0YzZFa7w/xJ5ijgrGA3yptlZMpdqwsYzhXrPF+f4+qs/BonlCpj7
	h5ULYyuO9yytwTPfRiHN3ZaF7O2OlsdOTFb9HQSPac7NMNT08RfL2l24eAvdMlD1tnUYnMpKksx
	yBG0lIy5SWsNDY63Ri7ogzBLXXadWipx8v0OvnEzZr6wTfsSpYoaVvxYzdXPm+V71
X-Gm-Gg: Acq92OFpy/qbkVoTJypbof2aCbElzHFKL/7r80Fei6FFEQj5l2LBeRVPNv9GipY2LII
	BtuqZRaZej7NgxsBDbZKh0f87fiaCk1MY0wUgs4l4V5v1WRTGriPMVKaHqKHqcKxHP+mCmsEu8D
	OwzK1wTDvn/lFEcbWaZtSAjoQZ8HGgxJLCwYpFoalWMjA3af/9nHQ3HZr9BWGwpRZlOiYyi2yWo
	SVKBzLVnnqHTYVjgLTi09++cGSRbbtdO3+On0X8j3nC9YHF00b8ImkXyALNLtygyyl1H3b25X4Q
	4WZhV9gxdVHGtML7Sm4xmZCwKDx5XwRWwh0y+K4ZJ5MovJEV1ap+YvCCCz583cd0k5fXQINBDUi
	nQHqansP14DXtUkm77M0qEk7IU0+OiCdjDsm0GK4HVp7Z45E0EPLfsxST
X-Received: by 2002:a05:6a20:7d9b:b0:39b:8dcb:f36d with SMTP id adf61e73a8af0-3b308a97c2bmr3433070637.35.1779368833649;
        Thu, 21 May 2026 06:07:13 -0700 (PDT)
X-Received: by 2002:a05:6a20:7d9b:b0:39b:8dcb:f36d with SMTP id adf61e73a8af0-3b308a97c2bmr3433022637.35.1779368833138;
        Thu, 21 May 2026 06:07:13 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:07:12 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:36:37 +0530
Subject: [PATCH 04/18] arm64: dts: qcom: sc8180x: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-wake-v1-4-d822567be258@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=1599;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=SnFemOqaJpb3Bo96e1V7TzNicDBNZ9REneIaHNVBH9o=;
 b=XVDSW2Tc0N0Lc7PQYaG0odmr8Qc8A4QelWCH9Vs5sbNENn6BMgcY+xGM+ScIRVzWupYsWq77X
 pMj69hJjypECdpnTZvKh1ZUbzWKw1Gg0EXyXSlcPoYZ6Qb61pdyF15U
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0f0382 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: -yJJTZcsLKT9FlQrbUO_KJVUrMaBlIbg
X-Proofpoint-ORIG-GUID: -yJJTZcsLKT9FlQrbUO_KJVUrMaBlIbg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfX37sdjupLqfSc
 kdAZodATjJ2TezBFHVbGVCoV2mMsBh4mzqNex1ZvqSnIOm2zjtWFfw5S8GMcD7c/M9rTOaThQoo
 VzG5eF1ET87vvhqXebyt3FcSiXIk7TDsJGjuVFNLOPiaMT8mLXcnI9y35OD1RjSUJD8GObNG6kU
 M178acu3nvdHQw5i9fYkH8XhJmYNWSSRlwucyaeBiL8BIKsHrSl1EzTNKFm5bnmRZFvAJbMJ5yS
 QVp2ZmP+/eU4e3/qbBD59h/Pj731OBVnGmS4srt9IvBgb/v68pwYjMnu6m6tfSGd3pb/t3NtiFb
 mPW0J5FTZQQ5XjMKEPcaSaHZGvCEr0b03MW/8JL6MlqbmvqV3O8yR4qBnOKea+R8lb7+ZAIaw26
 oFXXJL30SY79XU6SPUOIJSWOBCh8YXj0Cn0VgUZkxiImX2IX7CAh2juQkMC2Ygy2CWaE0yXWtKv
 FODsN2mzG8h6bqKM1uw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210131

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 2 +-
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
index d86a31ddede2..44bf3db01d3a 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
@@ -458,7 +458,7 @@ &mdss_edp_out {
 
 &pcie3 {
 	perst-gpios = <&tlmm 178 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 180 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 180 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&pcie3_default_state>;
 	pinctrl-names = "default";
 
diff --git a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
index aff398390eba..a4644ecca536 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
@@ -559,7 +559,7 @@ &mdss_edp_out {
 
 &pcie1 {
 	perst-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 177 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 177 GPIO_ACTIVE_LOW>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2_default_state>;
 

-- 
2.34.1

