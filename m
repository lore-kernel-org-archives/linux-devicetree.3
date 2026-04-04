Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1076F3A9D86
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 09:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775296280; cv=none; b=sJdV+tpVqRuZBTPxofh6XSmEGyeLqEZwHOqYkbZlBEzBRf/ZZUf9yIeYcY5lrz86u5sWKITL7RRnjhVfdLBSHEI1TRqBgFRjCZqwJGPTaZyA11eORqvs2FpZcE15+IjOAghUonuxgSmQuiK1Ybw8dWhk5HbRx4qWEIiamicyC4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775296280; c=relaxed/simple;
	bh=ICECY/f2NzjoVnynzXY3eFvLPxrhhSvWZsoedFzuz9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YCNs644K9F5bghuInoCMY/PCP8ipsF0hWaPTL6U1p6o7H3N/XQrKRFMxTK1RXWCXf3LOWz1o0D+g5Z41H878fklsdWeo3EkZXO8zUhqY+bgV1NmRX/gCcUH1y2UeFAvMmknaRvZJUqS1HDut/w+f8HMVaG+8j5l/3C/7sUEjcmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B+LpTHKh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YY9jX4vZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B+LpTHKh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YY9jX4vZ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6344lft3919311
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 09:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZlyCXDNEqi/rs0VxBJa3wAzVaeSGZoFUpBcp4EZFxxU=; b=B+LpTHKht7MCp2QF
	6jR1OEuFQpXhBtAlEn4piXlIjKTpe6Ef6hQL/naBdBmDFVgwQBEgu+eTNuuytVh+
	cvLDI22k++/TqYEsLclTPNMD2dMl7Zoq9q50AZhPN7842AZ0Ktok4PF1rp7ZNiRX
	ZZokmPNkKqjs4lo9ezg7PblhsZ2kEh4tcjV/PazHyALEIugxudUGNhn+eYyYC7Xr
	+1VWzhZuvdSRqu5tjHbr71k/eXZ7nOTz8AY5yBpjmhwH1sgM0PYcg48R04AHkdSw
	WteQzpgWH6JomGbgCEi1q5xahB0wUKGWW8sj5Ak8pxIbpo2BhR3EwMPIyuWP91gv
	8KEYsg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daux88fq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 09:51:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso65448721cf.0
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 02:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775296276; x=1775901076; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZlyCXDNEqi/rs0VxBJa3wAzVaeSGZoFUpBcp4EZFxxU=;
        b=YY9jX4vZzu58h8BuvyUOBLB5/NDEFBauTYLsuw1Mmb/gFXqL8UMtohQotm5Oeeo2wC
         PT6fhPi80Pyo2EuXQMnnDAqWdxscvZ70B12ZrTq6Vr6pMPaCHkqIusAPDdS5LF3IWRTV
         s1YbLTx1lCU4u8GIJqaStM2C65IddmhKeZLyq8rgnveYzXYgMrIjlDEo5QRSOXJQKtrE
         7iwqNf4w9+2CBJzMN5zEx2T3SLGsPA1PlNZ/VIMCnAlajNxGk3UKVdypidM+EwoWwtH4
         WjlUdMZwZTlwbsRn13flI/BmczJENRnt/XTxGEFA4tfAxs86yFL65WcZa2JPrTJbEhIC
         6+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775296276; x=1775901076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZlyCXDNEqi/rs0VxBJa3wAzVaeSGZoFUpBcp4EZFxxU=;
        b=M/m/OYrRVxKUpqI2Axxji62qdG36dboMJXmOuvvvBrj0wGqAQA85WBE5q2ePofNhxx
         g+z0DYdc8Z3oHzm7HN3fREiCvo9neuHmGQBvwwrhiG8AfhsFOvVKMxH1VBHyiQOkaMXV
         VC+NfwKaGZuVgYSQmQu4TcBN1gVpBuUgdDBSMGc7AADjludZf8xx0zPxb4a0QiPMo3HD
         4TcfzBqG6Y1ktx9e79gVtwnjAM+zrhaRARgDcEAcGujx72fPvG3tcns3+F0aF7vhHd1Y
         dgtRQHZjFXfC3sM2nGSiob2GLdFL3m+GEjPJhKmRuhqUZiZPRTETR2V49Pf7T3FcJCTz
         yfFw==
X-Forwarded-Encrypted: i=1; AJvYcCUVw6t7jRLxZc798CZhlvhKWNuIkmSFD0+mn5chnNT9M9C7T21RXFXC0jVqYeuCXNsMhF/DBjQNNnqG@vger.kernel.org
X-Gm-Message-State: AOJu0YwzJMcqlcdyjjTcsW6DIyrRvGLaqoRJTcBvf9nhCwhNUhFMMcL0
	/qCzs87fLBUQH60Av/8hDzKbe6qL0AUFTvi5X9OW10uIg1KHuFO+o/5nc3sTiYbcRMaHm0qu49e
	A4ly59FxbSHz4I/AgjK2Zd38xBDnJzOE9Urlxm8gKqCLN0vG2fTpC8AKAhZDe5bLx
X-Gm-Gg: AeBDiesxyMGdPpvTQSXewF8gNz4mTofnXpmWDuJ01k9gW3OOwlGcyWpmjCatXvvvwg6
	WDxuM4nHxIlRg/rG8ERdLbtfMtxgcG9YS582d2jPimV0qAA4cHDxjjuIVrQAzRpj58s4UzrdZaL
	2+dyoDQdKkyoSl9xkrzbtPDxGL9r0rdKUq0lSyGbvcIvM2u2Y2BOOM0n/cu8d6xH42FsI2n1vTj
	tfl01h8LZHhGQK5P7u5ywcE/HMaIkzQiBWcuzUjAcS/YcrdXoH5y+PUjgfwqdfqv7+DB2Pag+l/
	jFS79GZD4cBaCx8Z3u4XcrsRsKtI16LDfG1Z3AzWgPhGHyeT3boYJI2KsRACkRAx1yk2gHWkuW6
	s5/6xkuhhKRL0rOmvD7YXHPUp00JZ2LW6onDqqzbOyBml
X-Received: by 2002:ac8:5e14:0:b0:50b:8d12:358e with SMTP id d75a77b69052e-50d4fc1802cmr125027311cf.19.1775296275993;
        Sat, 04 Apr 2026 02:51:15 -0700 (PDT)
X-Received: by 2002:ac8:5e14:0:b0:50b:8d12:358e with SMTP id d75a77b69052e-50d4fc1802cmr125026941cf.19.1775296275561;
        Sat, 04 Apr 2026 02:51:15 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c50a7sm24098466f8f.15.2026.04.04.02.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 02:51:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 04 Apr 2026 11:51:01 +0200
Subject: [PATCH 2/5] arm64: dts: qcom: glymur: Fix cache and SRAM
 simple_bus_reg warnings
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260404-dts-qcom-w-1-fixes-v1-2-b8a9e6806e0a@oss.qualcomm.com>
References: <20260404-dts-qcom-w-1-fixes-v1-0-b8a9e6806e0a@oss.qualcomm.com>
In-Reply-To: <20260404-dts-qcom-w-1-fixes-v1-0-b8a9e6806e0a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1421;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ICECY/f2NzjoVnynzXY3eFvLPxrhhSvWZsoedFzuz9c=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0N8JXgwQ0f3OjJpTDtnpUNZ0qM3OWHE2MhGS4
 kODD8ObSgCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadDfCQAKCRDBN2bmhouD
 1yu6D/92UK1bpPWMR2OPJmATkSckCJzZEOylH6mqQ8FQ6Q8zQozdiyIJ+BfVKAanR4sWAahEd6v
 MPBog9XeH4xlHmsacBx1ms1UhAikdn8wc6DaNyza+R6VzT+QzwoImIP+D8JjGBUHe4Vf3nuAyRl
 5iRnOUeWTbudakhUFag/NNQZG+1bqfoAMHk18ZJfuZHMIYmnGg2Lnkjvl8iRW8CEk8eCbJT73uW
 nrd3qQsLkLulrWQ/+bp8ebfppevQWJcz6nUpfZU9cIzeLN97mA6+LYJcSY3cw2YB+3t/8AiYwMk
 e0LXR2k6fopPGCJyN0QB3JOJJCiUJ/0t4MHgM1TL/CzXjnnBkzU5jCgJd/7/qdFQV7uqPZq/Psg
 iIgsiM47exD85lzgLS3rz+wpGy7A+TYRn0MMlk0/Xurg6d67vpFgebLxJ53pOluMbjztFZb/DTQ
 CoP4dYPq1n1+mZKVoIUv6A8VUZHo4jE4oZKMbkRPUH2ReinBpZua2xg3ENyxvyDbHHJ2Yd99ISE
 YgfBkY6oRL7owaUqx0foSMzpeKFvtRoP4qWKoA15Wck3+mReyzFAZTerd9NtQSlLtT9BGs/hLMd
 SDvcMFTNjgmZFR2Wqr5FBjDYw+4PuymrpcnBf7JPxk1e2FAXW5rtrtxW8fMUbewuaDe3t+xpLCm
 3sohW+lDlhKAGnA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: NkhuxDEy6rGq2NFIDyYs8OYFT2nMpq6m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDA4OCBTYWx0ZWRfX7Cf2GVzzJ6TC
 IfiGAWWyZfQ4Ll8p1qtDcsE6bfezoPse8uoZEgyNqCFEZwYTZPoP6w1VZXeFEqETeObuxfCUcFL
 Twto7CO/lgR1VZQmQPVFjFAJgDmPlQ2wHW5ISKbdq4Rkn29U9Wxb/CK21d6xIdQ/ND7ndTEqCTc
 8LeEutUhyi8P6mYOLcmuOkI5evbmtXt7p6JsI+a8Swk0lw3QAeF5UbOQZzfGGbDRoTCbQ1aGN8E
 TRSk8F3fYIJnXCltXDKYhbomMyuluVzv9mMfw7XdTQOldMmduY1NJWa7CuhKNJCxR+gOV7RIhH+
 yHzGFvzk7wkzM0yInwe7NWUjOJGZHAW8MrWUZ2xX2ZZFmWO3XNattSkWJfPUj9eKDgC1l38Aix+
 Vsr4VmfP5mA/YlZhV/sULyQaKTfh7Vdu0eC/cEmItfimS+nKEcSLtV2uAstEsgqAcg2mrPPp2JA
 xinRY2Pa83nTNXOz9BQ==
X-Proofpoint-GUID: NkhuxDEy6rGq2NFIDyYs8OYFT2nMpq6m
X-Authority-Analysis: v=2.4 cv=AuzjHe9P c=1 sm=1 tr=0 ts=69d0df14 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=whlQpUbcimcIkjChax8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_07,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604040088

Correct the unit address of cache controller and SRAM nodes in Qualcomm
Glymur SoC DTSI to fix W=1 DTC warnings:

  glymur.dtsi:5876.36-5908.5: Warning (simple_bus_reg): /soc@0/system-cache-controller@20400000: simple-bus unit address format error, expected "21800000"
  glymur.dtsi:5917.23-5934.5: Warning (simple_bus_reg): /soc@0/sram@81e08000: simple-bus unit address format error, expected "81e08600"

Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 3389103408b6..0c5cb8532b20 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5873,7 +5873,7 @@ oobm_ss_noc: interconnect@1f300000 {
 			#interconnect-cells = <2>;
 		};
 
-		system-cache-controller@20400000 {
+		system-cache-controller@21800000 {
 			compatible = "qcom,glymur-llcc";
 			reg = <0x0 0x21800000 0x0 0x100000>,
 			      <0x0 0x21a00000 0x0 0x100000>,
@@ -5914,7 +5914,7 @@ nsp_noc: interconnect@320c0000 {
 			#interconnect-cells = <2>;
 		};
 
-		imem: sram@81e08000 {
+		imem: sram@81e08600 {
 			compatible = "mmio-sram";
 			reg = <0x0 0x81e08600 0x0 0x300>;
 

-- 
2.51.0

