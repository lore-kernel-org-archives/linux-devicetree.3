Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D570368D7E
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781153972; cv=none; b=OYpUg8jc3Hui2BhqAcfduSjv/H5cqQp+tQtG+jNVS0mbdnkS7T2CeuE6H3Kzmyfi8ykJvIlOXKwWGDoxKKX2+WCMPeLI7c6umnlnKwc006zl+M1N8CZUif3WzXiIdINKK0n4jyTM1Abk91Bai3GkzCDNz4Mj0ZJgYWYKxfc4HJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781153972; c=relaxed/simple;
	bh=39Sa4FRbA1XPh56vrPZ233l8fBb+GbeXoYXxNG9G+R8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lf29CHe+zpkIlp8HEl+vADaCKvNUihg4pMgZQXPVzXGrDw+C7yAuKU47piRpcnXZ8Tox4r9Kyx0hIRHfTRFzFM0y+RRNLv59jDReC4F8lN8XNi2NOTneCDAP8jnbRdYa9zLDIdMVdusBbLfAiL+9bSIIn5NTSJjSA4iG6+Riqns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MemERzn+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XsX7eaJ0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MemERzn+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XsX7eaJ0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NX893202805
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uKxCvumCkaRFL/8oxTufBn5fDWZVIi+dKwaTyeQSE8A=; b=MemERzn+e2m90AOV
	f5zUGS7br+qt54lMkIyeA2Yc+IiFS1Ygf2GPV88lunZKN+LgXIiiycB7kNl5SdVq
	3Fj4MtQpuAzWxkh0PwNG29QlsnNORDeiCvjL/Uiv6YVMS+NP6oqLRTHxSZCN/khP
	OQjjC95yn2H+Fdawh4mstM3xcEXSJRzosYbb40wa1/FTYG+3Q91a7tGDOoGKxx30
	fALCXUrH7aAOvj7YWnhN0+6sxqocRgSAz/99ofCsSxFkXgxHmkVhDM5jpJVd7a5L
	qxftL2ntycdFMD+Hx3EN6T7PsWjnJjKcYgm3CdrvI+/10nMo2WOkrMx3cjRmXZ2X
	ZhGi8g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6thp8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c2d0a8b5beso12270565ad.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 21:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781153958; x=1781758758; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uKxCvumCkaRFL/8oxTufBn5fDWZVIi+dKwaTyeQSE8A=;
        b=XsX7eaJ0Zq9C+iOVZcjq/wt4QcAq16hs4CqKi5IGFlO9nPSmfIifHb3cN9GEYSpWVo
         PtVUzRz8A8nBVsg/NPor3jtdSLWEMREgYmaKekOytVMZ06r2Hpb7jahW8mfhPE5tA28w
         UL63nsTQWiDaGxMelJekq3VmYj+D36MtRDmxQBzFUwJTuvkdJFoH0ls4cXnuGo1NensA
         6KYhamrjy37bCC8JRgT1jsYZFRtsOJIH5ZQI7sKDpdy67Dz48aAfJaj+/XP9BkiQd2ly
         vS/R5ZYtXYpcfGqks/ko8Alf64NxoAZSuRIvTdC3ESZYvCoDANrcLCQNknwQwcGwEkEW
         OXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781153958; x=1781758758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uKxCvumCkaRFL/8oxTufBn5fDWZVIi+dKwaTyeQSE8A=;
        b=Go9R+YaAfHrlKNqcNNotIWk3RerCGCCzFBegqsF00Qy2IaQJd/jT3oR0SxbustGPCI
         cg3Trl3Mevoq2ECG/s2lNFE+GYprHFVjD01LJEyP5B9YD/oNtKPS8S6lV8WYxz3Byuu4
         d0/625NOAxRRPLoFcm1WilaNiWQXMbQhLKW9/ah7nMXUMauh8MqU+HlMccF2F2zOh1P5
         zunGgE5Tak7cyGxm9zrcpO+0eZbsxc92Nwg4TIB9VV/8PuDCa/nNYis1qB08OW+DGTJB
         kWyK0zxy68fuA9OYF77a3wKPkinekSnbGWmpA6b5OZd8ZrilXg6KpDzBc/Z+Z2PkLpUd
         /Hew==
X-Forwarded-Encrypted: i=1; AFNElJ+7AtWxTjGucq5ENgpEMElz21cij/32qXxzbwmMwNfahiHK9I3VjINPs7QdR0QKxDYzVTMYhL0O6TDG@vger.kernel.org
X-Gm-Message-State: AOJu0YwkfQ06u/cCzTcxvwTY09L7K8H8xqEI/UvKIW94ontg/0W5CNQ8
	nDTHR9DHXcOGAUtmCXyybmr2inqNsCxuVJgcOGPk6mym6wVzrvpqabhWKY4nO1uaQMV5fl0nPzz
	JewPj/OQvT0zOU3hkc822OZWhXfUBaaoIZ0rlz2keTIfnWW8xVawKBxYKlVZIScXV
X-Gm-Gg: Acq92OEgxlXEYbcxDuKVKb1d6FTwOKEjqX6RXzVCt9daT9TGA8xrzATKlq0oEsynZp1
	IV5poNfhgIlpxJ6daeTQILgHYsWltzsPZyhGbZZ4aT3Eu/SNg7CgEk2oCtXev8MC7gW9V6wrq6n
	+AEOmj9f4LMoOO5FeO6nSHFHkqeyB/wYmfPLcBGIkcq3gqz5cPSeTMqPgp37qjOak3Q2sqBwbah
	PG0H7CFZF70GCQZJwa+mQ/617HdSPtGZno2DwsuT1qMtueraZFMc28sn+Z8EDA4nD5x/GPvAxD/
	fOvpyYhFLxBJ7nsZrVeq+QWOTcAK4oOrzyzxb/lqiYawswhK1HQwS4n33tPjcJMbg4AbxYQBMNo
	3604ZFcTRjEBVIuajrXgd+OSsISMK1PI1nlfxE6YpyZGJPS/MVjacJYwnVAk8hJpI3s4=
X-Received: by 2002:a17:903:fa5:b0:2bf:9760:b94d with SMTP id d9443c01a7336-2c2f092b23emr14796205ad.15.1781153958077;
        Wed, 10 Jun 2026 21:59:18 -0700 (PDT)
X-Received: by 2002:a17:903:fa5:b0:2bf:9760:b94d with SMTP id d9443c01a7336-2c2f092b23emr14795995ad.15.1781153957620;
        Wed, 10 Jun 2026 21:59:17 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.21.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 21:59:17 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:42 +0530
Subject: [PATCH v2 06/37] arm64: dts: qcom: sm8250: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-6-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=1575;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=39Sa4FRbA1XPh56vrPZ233l8fBb+GbeXoYXxNG9G+R8=;
 b=e+zRagMHI9wszHWPoXxyobcYzXlwlDlO0On7j7D/mXpqKgMn8pOJMfRfLWB4nmV9tzL6e8MqO
 vPvUo/aIOHwDfHERjVTYodv4kyc4dgGbD/UUvCZP62oGtohViGECPAd
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfXydQA/0PJ30NN
 4NH4MQAk+s5jBJj4NrFcFhqgyGRcUgAMPtVqv7W4V8WZl3J+5fjZZKRBP/mOinKvfLTAOCGLfuE
 N352tBU1QrRs2M8GesV2GAyIJ5eEyRcdKpL1mrNdMVEG3dVpwtjq+V2P8KuP/8h06EePM/FK+4O
 kqcL2I1ukmkbSxKIyI8Jg6clQJi4af+EB7Zdk3f3yxBI1y3dL2js7zTcx4PEh39htcMtJaOMDVY
 pKRG0vtggWU+BJqd8CmoMkrHZl7dz67Sc/8O2greWgxZCXcyUo8SX+5DOQpdVXc6iuX5S9R7I10
 WWJEtQeDIcE4+sEZyGo1Q6kGuRKYQVxm1Hh4/PJRHsmgIu0nQJZyAvDomHFD2f361NW6sTeKmZ5
 +F4ICtqSBNThnAPwD7/oykOyUZQjQZzDjjQMqDeoSNYlJXofKQ0i5bbQTiSPsOzu+R0MV0Ho/MP
 fMpXXZeeNVesBuaR72g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX3lkG9D+EqYWQ
 Ug/Tat7QlvUMNT07qISXSOAn2qoGMMjCCN9tmvdVtGM1Uuu0fkSTlA+4BBZvF5RYznkV2GxMhoU
 7TJk/CurGku8TvOtHt5Sw6M2QtTbEg4=
X-Authority-Analysis: v=2.4 cv=AaiB2XXG c=1 sm=1 tr=0 ts=6a2a40a6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: fGLEbXj_D9_5HrJ4LQVkJ9LfvstPyiXn
X-Proofpoint-GUID: fGLEbXj_D9_5HrJ4LQVkJ9LfvstPyiXn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7076720413ab..eca66d1c1c5b 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2202,7 +2202,7 @@ pcie0: pcie@1c00000 {
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 79 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 81 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 81 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;
@@ -2329,7 +2329,7 @@ pcie1: pcie@1c08000 {
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 82 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 84 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 84 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie1_default_state>;
@@ -2456,7 +2456,7 @@ pcie2: pcie@1c10000 {
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 85 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie2_default_state>;

-- 
2.34.1

