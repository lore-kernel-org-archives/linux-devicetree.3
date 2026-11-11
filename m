Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794382309;
	b=DIUAVtimeoKyJcfbzc7tLbb+FYFFP4YbZt9E6VussIaGayUmd1fC4XrIqeWDqV/YMBWt
	 Oya49hOK0/b0qAQYJ9tGeT2YmQU9BtvfSBOHaKrCL+jRHypHMyPGMoNhukDMHGC+GaAM8
	 hTx67zSFs9dFjy/YUL9ue/aXI6AcW2oh0K+aAYL/6j2XWhhuM9vHvtm3xFR9AUYjJkETm
	 HnV6+py6xEj+GsRLUr4Dii4h9dDDpgnx2iKIv7VRtYtMVpaAnVRzUj2BK8cqm6BSPsIU/
	 J6uL5OHcXVuQFQRkiJ7V0l89p90vCAATZAaFivCoRJjcCtzMvtLNi7B8ObaYfSUVDfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382309;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NcNvvo3woIB0oWQpL6j7la8H5u0j7QZwDyKdlDHI+3g=;
	b=WjgGmy5EI7BKdJKNoJpPlvFmH9poYYZ72bjbCUCsd0d1SwgvkxVc6MvSai3ugZEgzB0f
	 2nb1tHEwVkU4nY25G+kexV4jZJT4RqPSCViqBjJmmanAM2ZsmMwoLJOq7NN5+9Ein669y
	 zQ/pN4Rqyz7uPlQ1eC66ueDlxjj88XYZFaXIjCH4I74kI+trGZ2+PqyVuxyDNQDbtm0qv
	 peeKMsU0GFmH/BTzxSKbnFd57xgGluul3XIxvlaeXTRG1HzSkZgvkiz4VTguJTV+RNAgO
	 acalzrZh9swX0mBk+8YE71HI2ugmfWZ1swnLjqxKnFVtLxea2/eGBooLSOZzUwDvwdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zn2bEpI4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U8x6uAjR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F63C60A261E
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F63C60A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zn2bEpI4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U8x6uAjR
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KO7H2021256
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NcNvvo3woIB
	0oWQpL6j7la8H5u0j7QZwDyKdlDHI+3g=; b=Zn2bEpI4cWALr6LQdp3Thd+FyIg
	3kSdtDhN2872o9bSZR8npyUQ7pu2BpRIwiVsRELHSGHHin/yuC5xWk7br6wAGBuq
	YOwscxtgnnV1leLBCez48H9tsc5VMJb22MNPMeg1nphxenla64OLjzG/PfAkzLuj
	RNJ2JXEFpGOCRr1KQy3TU9gRY3OxiX4e7ltLWF1//Oz0nYYfZpPXHI7nTMAKGpFi
	CDb+bN+aT3K7FHStQyv6yS9dS7cvrcuaOcHOonjWza5BEeBQw+XaHAWYNC53M0kX
	ucwfJbB4IrQFsGCEbzVvvj0rZvFvaFKVZXxZhXAn5zwQ3UqxjkuEJV367kg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv4pvbs1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:31:47 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36ecd5db581so5078018eec.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 23:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794382306; x=1794987106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NcNvvo3woIB0oWQpL6j7la8H5u0j7QZwDyKdlDHI+3g=;
        b=U8x6uAjREAhHBFnsN5Vn2JuBnnGMYjUC4cPcZ5sUQl4h9y1pVxyKA43QXQ9VIwyqum
         rHEqlcVnRYYfMHCNFPriAlWgyLCBYN6u+hUJwIqW09Dqxmx1kl846C8Tmy3uMv/RufpZ
         9C2oC6DA7qT4zrVNNXZ+MQ29fq2o4ob6qE6uimByY+zwgJZGmPuycev95iH3xJAOVFUz
         w/12+MMcgitx3MMVfjilfaap+u6t3uxXzre0g24+QVXMnbUvmvTmiSiIunFZGJchQbGI
         5zAo4kn5MjAp2Io+SMyS7kMAnhLXbyTlBRHAisFHnh2r15dw3A+aLXLuLMdjTqd74CK9
         abHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382306; x=1794987106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NcNvvo3woIB0oWQpL6j7la8H5u0j7QZwDyKdlDHI+3g=;
        b=S2i/osjCkiYDqd4eng8JFJBDwcsD1Q87L0c8lQkfTpUjS0kQIiml1Io9QDgqJvJZsq
         1qizDclTNlKWE+jAeIpJnrJ+sfw1ktnc9iZowQj4rO08ZL8YQHTD9jnec4+F7lgid1uB
         GxO3WDCPBADQIe8tGmMwJaU9V86WBY3oZ2XpNhlkYGgoDBYcpX2eDjVJKZscOYzrm8f+
         y98XaBu4PRTOfi9WYCVCxcpE1xtPbloBReBknnFVhQVVe4KCYxbDkmDRPqXJuS0wrgVq
         GTP/Z/tKVveUrKwXiXRDN9vxhynNwYFtLINpIljXh8vYlwyXBOIZHs2BOCO4HGfk9GCI
         o/Rw==
X-Forwarded-Encrypted: i=1; AL+hErGw5HTdReQgf44U456F5U4OZwSVMKOwwP4cU7KjE2DenASjNiZxX1rMAD2j8qsKusUcaUqmAqsOLbY9@vger.kernel.org
X-Gm-Message-State: APuU4Z8TGu36NO3ENQyxhmoIOqVWOi/OWn3ikfAk6gnIc2ES4QDEMPcD
	mQUXoy2Ar+CQq3n+dcO3/JldaMJOwg84MszRmL7I8hf6GMjO1cqC9wvZ7CVk05npsx2ALjyXIFn
	t4X2j3FnTMYrFKyyeOwC9DnMrxxY+94E72wwzp9ISb5dBzng5AEX3weN4avbgpQZiiqSTxGTd
X-Gm-Gg: AYBFou1pZzLZo8oltR0ra7Ps2SXtgiAbyQBeJVB0IdQEr8gbtIy0Mcl/ONnoqO+Lpot
	QI81M2WJVBX9Ykk+A7rmABF9n/Mu/69L5CnpBybrE3Edp2AP0aii+pJxRW2sj1a1gwDF4aVMyyo
	82gjjlynCAx9zS1WCERuvf8JLaIguhmjv0ALmNFJH9kLDZd7EiW994+JGCewu/wBsMmn6sVGj87
	6w+d9XZIlW2eUAY9q3tkkCjExMMbD/fItJhLfWa2hcWzx4XUJaV5jBhAQm+3FgJny7KrAraFOrG
	QhBS77BUs8ikU8/STuicY8MLL7xlCwv590wSnEAOfkpXw0KTH2BYjfIirhJlW37kbWOcXOzOR6E
	3k+cXAkvM3mZEH1u8lIAYQBz2Ax504gUsSmHABlrczbKCWrSURwnYOaAso0RWgGSAu181NX31/b
	5UqqkTQs1U26qUZbGWk+zxvaiZwE/eiKLg
X-Received: by 2002:a05:7022:d99:b0:163:a197:722d with SMTP id a92af1059eb24-1b3c023c7e7mr1663361c88.4.1794382306249;
        Tue, 10 Nov 2026 23:31:46 -0800 (PST)
X-Received: by 2002:a05:7022:d99:b0:163:a197:722d with SMTP id a92af1059eb24-1b3c023c7e7mr1663332c88.4.1794382305578;
        Tue, 10 Nov 2026 23:31:45 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm27220027c88.10.2026.11.10.23.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:31:45 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 2/5] arm64: dts: qcom: nord: Add gpr node
Date: Wed, 11 Nov 2026 15:31:18 +0800
Message-ID: <20261111073121.3707030-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111073121.3707030-1-shengchao.guo@oss.qualcomm.com>
References: <20261111073121.3707030-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XqZvqlF9 c=1 sm=1 tr=0 ts=6af419e3 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=LQeRsTducJ9VbTWhBPQA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: rgtmLxkItWa3kKxFi2zIu4YB68J9ima3
X-Proofpoint-GUID: rgtmLxkItWa3kKxFi2zIu4YB68J9ima3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAyOSBTYWx0ZWRfX+ntsSA/V+Hrs
 7jsGzsXIqCz4o2tm4UPb6fpEEtLrOX8v9foCm4OyFBqX5GPg3mjg/7qyg7/7ChLrAHsDl0S6FgI
 ThdF+TYazryggrzxb4UUBpSDkO/q8yM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAyOSBTYWx0ZWRfXzbYxKxwDBqPm
 2lmWQw5crdixMsbQ29m7gn3vyygikxowfnUoXjsr5EwIEWwsgLXXl+PdoA9VDeLgim/T4CbMyXP
 Vfy/zsk8T6CY6rZpdY2eh1/1b2yoiQIx/zcI5a8PwIuUN9JPIz8SiDGZ76mLm2v927irKvcvcfB
 z9Ef+0iRlpDPmtD8OGEGB+By16bIq/Y2ti2Ly+n7BREeMwceH4U37HY1VtVbngajAZR+5ahWDYs
 6Z+T+bVGKS+J6TWwR4aXRi2pDZI1pfWqTb/0yj6QSDSzgU4x0fJKW+pucgooPdsoLegJ3MX5Vvw
 we5ut1YKXfAc8SozhlZheCNmzhVHahAbS/p05kHgSwSuR+D1vs+2UshGcxeCBexnhtWEvjdLRgH
 V/uyQkxxe6ZwGNUGSfTMXysgDgKeNV4GPEjJ6IAM+ZPCsaUQ+fyijDRd12m4Xel2Y7AGiqIRzCz
 7+qiHvK6KShIcxIcjGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110029

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Add the GPR (Generic Packet Router) node to the Nord SoC DTSI along
with the APM (Audio Process Manager) and PRM (Proxy Resource Manager)
audio services. These nodes are required by the Q6APM audio stack to
route audio packets between the application processor and the DSP.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 40 ++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 617e5312f4c4..c17a8a83e371 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 
 #include "nord-ipcc.h"
 
@@ -1799,6 +1800,45 @@ compute-cb@6 {
 						dma-coherent;
 					};
 				};
+
+				gpr {
+					compatible = "qcom,gpr";
+					qcom,glink-channels = "adsp_apps";
+					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+					qcom,intents = <512 20>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					q6apm: service@1 {
+						compatible = "qcom,q6apm";
+						reg = <GPR_APM_MODULE_IID>;
+						#sound-dai-cells = <0>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#sound-dai-cells = <1>;
+						};
+
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							iommus = <&apps_smmu_0 0x09e1 0x0400>;
+						};
+					};
+
+					q6prm: service@2 {
+						compatible = "qcom,q6prm";
+						reg = <GPR_PRM_MODULE_IID>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6prmcc: clock-controller {
+							compatible = "qcom,q6prm-lpass-clocks";
+							#clock-cells = <2>;
+						};
+					};
+				};
 			};
 		};
 
-- 
2.43.0

