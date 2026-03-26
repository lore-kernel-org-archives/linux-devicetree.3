Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE551AB6F1
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 15:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774539688; cv=none; b=MCPqi+euTPYUmU8LIiS9oMV9kygLuEMR+5J2Y/khCdF5CA+ySzMXwBtPTASg9Aa5/EJqubvzqwZVy6iJGRSk+qBJbL+7EeSP8n6f825dAcaz32j6o+MPIZTy4wFYlxVRSkWc3J86XHwyPj+IfkJbJidKIQCUKfME2JOF41m2J3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774539688; c=relaxed/simple;
	bh=Wf0oWZY0oRn4dN/vCQzyx0UpsMK0rAk5jldZnxn48aQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RgJroVFZwH/89X4FyFbO831x8Ap46wjXpqGDCRix7QCxHSzc0NHXeW3OL5koFpxo3Pze9iSDFOzM59DmlmtH/n7yLbaVgscOxkzQ+vJPbnn0HiI8Dv6309ZMfg9S419PzR16L4NFdA+WGqHyDZJmEpWIFRGCYRVHkNkddYJ6LU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KfFDsaJU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PSUrxhA8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KfFDsaJU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PSUrxhA8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QF9uX1790653
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 15:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=h9cTHuXTabtypHLXwNdj/XBLnWzsA9Y+HAH
	wL+4eL+o=; b=KfFDsaJU41Kh3aQqAU0slvLHD+dcUHf+AvAjsEPDVerS/+1s4uA
	Qburc39WscRr7HR08dViP+hDOWGxEXI0APh2DnjmxH+8buGYK7DlHinsh754B+YR
	hLv+EJ4QMPfllvPdAMOsKamaGeuI5f6VZL0Y2cE6KK401HWkrgChnz2xs/EbQ6M0
	EBOZrjex4zk3eJPoD0+CvfObUmmbuu2/izKnQbCc69AbidZMIvRfBeCKUhLLDD0d
	NUo90YkBGygraFhdyaDbzJ6t2jzlj7pE9dvr0xrUmUFXUU1bsysPh+KVbvtKVQ7Q
	rZ+wefPboZyxCaPGm6YqWVy54B2NGTx21qQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d53eqgxj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 15:41:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5094ba09affso29724801cf.2
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 08:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774539686; x=1775144486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h9cTHuXTabtypHLXwNdj/XBLnWzsA9Y+HAHwL+4eL+o=;
        b=PSUrxhA8/c0JxmYv9Zf6mmWgaGagch10j32wqOEdXu5K1KGj8oqQdpYlDRw+BpILnj
         WYSB5Kd8gD1LLEmAFD7KLd4ze3sEcaNQS2zCqnmNlBIX7MTalNH/E3/V8FFtwUFfR5d5
         Co/d/3AlQA3gHfZ39jp5hQUG9dIz5zbMwG01VkU8T2mgBjKCIepbL6HUvR/sEgrSUwFo
         RlA844yXGKaYvZay2bG0LTSza1Gcn7X1tVXWyFRwUw97wcpuKUioPDTfrzM5M4FH9Z+y
         oOpPrr014awww89e3wG2hA+uIl58RnM2H98ESAU4hsYQde9nbUgDr44kcB0vyjlr9OnZ
         5z5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774539686; x=1775144486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9cTHuXTabtypHLXwNdj/XBLnWzsA9Y+HAHwL+4eL+o=;
        b=VDuV62+lyblvm71RTnEd1LVsxWSMZZ8hAhwnb5ocPBp+3cTrGv2t95t6Ekka74bYn7
         56w6DtMybk7yElH9l0FIE9E4wvys5ajNdBM1SFY8lS0/vKb8HJ0Uu587I1QCT8qZwF3Z
         p45BoL1jz87f2XUUZR92WnRC+AZM+XIcCyfDBkl5gymK+9O0gUbiZKM60brFej9+Cn8k
         67DIrnnKYHHhLUk63sSsspTF8uUDb7oCioTv1sbuvnvlON1/x9831QLII53Iv7G3sWys
         NyqgCSn0nR09C4TEe50DjRGh6xjeRVmRy60uk4LZidRoZMQzaf8q1EvhfSSRzmaX77fX
         JXgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXirLKztL6MwpXvyKQS8vbOZbMLI6MHceewvOO96TV9XL2nb7kjwFbYv0M/vWyNVokFLtcithtRNx9X@vger.kernel.org
X-Gm-Message-State: AOJu0Yxna/vJ8I729kluPzqYRJ7jPnsZ7iFfyrFjbilWbUH8z8JtibH5
	mOK6vk/uIDEfrnAaSOmgoR1wuWPm5Ot6kryRsvDSIyp/OjraP/+9PMt6rxhg+PTO2/gBheJS+bW
	jo8mb6VKkPgSzQV/etNCLG6HoNuIKxOd58Yq9N64bjkUALZ1mCvkFbVHmZg6SDMFi
X-Gm-Gg: ATEYQzzp9P7B3Of6LUZ8cWBqLvb9QCYhYq9RkZum4Hs0n9YHQUYZROSE27VWKfnPc5B
	xHKFiOWdEzLCycrGeXZiMhfXM2n7SYIRCZhupvfmKljYY4zMjT1U0hKC2pu6mHFtYqHNqcx6fZx
	0wBXy0cBdMH8/Lzb1UnRl6OAs5lLXfKhmGZFjC3O6m2ZPpfP9LyR5jWkzYv+Oup1nOgRK4KYs4B
	HRW3tmBI/IKdy4ZdJJA0kHTJ6MQQNySW+KUjNZqQh5ccfMnCyepS6Ypx6zV/zc2ut435aauJSer
	RGa70+dTTvKEaMA6oymqHDboWV2y+cKVsu+716P0qmghMlyoxVrD3742st5pdmkcrcpxgGwiexq
	YwHk2iL2BIbrMZOtl/GhIcxp+bazg79GDz6BDsgejl20p/u1zND5emJk=
X-Received: by 2002:a05:622a:4a09:b0:50b:3be7:afd with SMTP id d75a77b69052e-50b90c8c660mr68758771cf.65.1774539685782;
        Thu, 26 Mar 2026 08:41:25 -0700 (PDT)
X-Received: by 2002:a05:622a:4a09:b0:50b:3be7:afd with SMTP id d75a77b69052e-50b90c8c660mr68758161cf.65.1774539685206;
        Thu, 26 Mar 2026 08:41:25 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871fbbf65asm25765265e9.2.2026.03.26.08.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:41:23 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2] arm64: dts: monaco: extend fastrpc compute cb
Date: Thu, 26 Mar 2026 15:41:11 +0000
Message-ID: <20260326154111.2781802-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDExMSBTYWx0ZWRfX42jDQNhg/cWC
 XXhNw3RNGFKYi9mDta/1NiF3LYwhhi+0HYRInLRJShFyoRh8TFHIcbCrvhG5vEjA5oysug5uXAk
 DS89u/9mpiJ5i+PjU3JLpegcYu26BSL6+N9wmIrjZY0j+KpwrWjAuxmHNcAJ2n7deBdvtimAkZi
 hmyWvFkYPhYUPpm/HLIbbV1UD/UHAi2n8HA73Y3d2zpNgcwiIC2xz4DEztvoZGMya9M7XrWa3hk
 X1+ycS8XiDc9Tlc6K6lxv8O6ITOE/5AT9n34bwOm4Td68cAlIyMAwfNzYHgUkHLAtqG0UJaTRZk
 rqLJ/DOhdH/PbF3pAtqwHoQ43zc7r5ebZEDFK6leexdwMlxCFL5jp+mv4a9cYL6JcMDzyo74Mgl
 1PfL8kqOgQpitrzBVEXFlApNYW51Skpg85euCH+gvtZSjjSLpiUPcVhWH0OMoEu5ooT/TFaiXi6
 G+sRP92TxuH7EJOxm8A==
X-Proofpoint-GUID: tktox3ox3JiMjYxB4hv0I05kAqQBRoFD
X-Authority-Analysis: v=2.4 cv=S4bUAYsP c=1 sm=1 tr=0 ts=69c553a6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=ebg3YuX8VNz3oMcFMKwA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: tktox3ox3JiMjYxB4hv0I05kAqQBRoFD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260111

For some reason we ended up adding only 4 out of 11 compute cb's for
CDSP, add the missing compute cb. This will also improve the end
user-experience by enabling running multiple AI usecases in parallel.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 49 ++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 10e799dd4a78..38fbd44c7d8f 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -7739,6 +7739,55 @@ compute-cb@4 {
 							 <&apps_smmu 0x1964 0x0400>;
 						dma-coherent;
 					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x19c5 0x0400>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x19c6 0x0400>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu 0x19c7 0x0400>;
+						dma-coherent;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu 0x19c8 0x0400>;
+						dma-coherent;
+					};
+
+					compute-cb@9 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <9>;
+						iommus = <&apps_smmu 0x19c9 0x0400>;
+						dma-coherent;
+					};
+
+					compute-cb@11 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <0xb>;
+						iommus = <&apps_smmu 0x19cb 0x0400>;
+						dma-coherent;
+					};
+
+					compute-cb@12 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <0xc>;
+						iommus = <&apps_smmu 0x19cc 0x000>;
+						dma-coherent;
+					};
 				};
 			};
 		};
-- 
2.47.3

