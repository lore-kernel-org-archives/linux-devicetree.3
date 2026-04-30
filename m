Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E063FE655
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 08:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777539559; cv=none; b=uyK/ZaVIYlEtq2PqrDdkb2tvKhs6h5oPs+90tJwPFu61XjQkt0hlVD3vwz0seSk3TV0yQgmzzKTbu5j3iH+QlzvdnR6Ns1rKDL9htm+IzAGWJ0aGlKDFsbkQogtAE0AtBv4aSaZkAs26IzYKx/cxMyHZIXo6qa6vUazHPg9/nLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777539559; c=relaxed/simple;
	bh=bjspg4RGlRRJ+lWkvFxPGZiaw9MGEJLfXMpLoztY8ik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bvp9KCnYyaXQ1Mm/hg3EoARuQSXOhVcq99O+CHYiX/F8q9FO/TUi5Cdk3ASUpwW1F1STdHnp33FEUF5ewg1aj+SGSDFUDCKjHvLG5sTFn+UzYeQZewfeYbiFV8GQDqjt55svxQyrq2SoyVijnTQsyqK0jmDMvYecybbi584mQdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iZQ/v0ZQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mh4VBRHU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iZQ/v0ZQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mh4VBRHU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U7536i830424
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 08:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U8rVeNNET+H6LFlILsmBsQMscHlKkjKdcxsQZkuhylw=; b=iZQ/v0ZQrkmA1dPI
	IEIkmvEjQo4xwD7JPOuuo4kSP7TaQdodBztKonek8nIHyUql0Se4vlwVH92uhyqH
	N+iAMYJOfzBbEy2oj15C3NHSaV1027LZ5ctltwIU9wXnyLPZaCx/LBss0cdk3drw
	qUkZj/5hT501JftpMKZwovzMA37eKXRHlb88duY6ZGQvLKC5n7H1CKy0iuIsvTGM
	nf9qmAiAa7CmpAQQsJXvybG4DDomuBbkekbhiz4fqUmmjQPRQRzYraqr0P/OhOeL
	BTuiqJ55a7OpZvnS8AnkuT2k032EAjtrDrdLIX/h107qTgfpotJIm524JlJMBGUB
	WBQWWg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv2cq0e8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 08:59:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35fbc53b64bso681891a91.1
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 01:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777539553; x=1778144353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U8rVeNNET+H6LFlILsmBsQMscHlKkjKdcxsQZkuhylw=;
        b=Mh4VBRHUwzTSG2Zjui8xZGG4AmMr7dlNtuuPn2OSlSNxA5hPMWqOf/5rIyGKmIJShJ
         On9LsxbHQcpXklrx9unxO31vk0qn6IIpxzJw033KXZ9C+yciOniXLbdDPC/O620iOYFI
         cQgsHxbVTpGiuK0qZ897UWXXtmYChpDbuZ4xELQZh2NSOjXaRIMCay7fgPhD0zRnkgff
         6iKnBSJ3mP5aTOhEiS4vlYfR68X+v878UV6n0KBFIPACXYOgsMw80wZZp5HypqhgKzkT
         CtROr4+pwvfaC39Z+M0wj/j9R3baKwSfYMLKPZbid+CiS8W75IV9I007SnogRCQ8YaN8
         49WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777539553; x=1778144353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U8rVeNNET+H6LFlILsmBsQMscHlKkjKdcxsQZkuhylw=;
        b=QDQgqpD7kPIp47INIV7TsFCfIC4arn2dHGXBhDpMDv46Y+K+j4w+l2xeWmj4zt6mRj
         z/ccZNrn1xNYX6YdRmALLTIZRkM4L7ftI6rJfN78jQ/5kjxpj0mb8q91NMrjdlyFij3A
         VU0bBgPBXDoeqzKWtRFd0qmK4vgAjIOIpjjR/dkSv81yaxlxbQKk9mnwt4csbwT0Wze6
         /5PGl1M/LSkZE1puXAkgnerfXNYdFJwv1kUF2z8wcUiqB43EMmAlbJ+gMx7iAUy4FtuM
         vb7f9BR0r+GT3fXzCI5JufsI1Md0UzzsqiKAEqqxuJ/mgeeJaP+xUvP2vdeeV0W4Nv3k
         EYXw==
X-Forwarded-Encrypted: i=1; AFNElJ+sIr3QgpHMbpsKPBOr7v8Tx3k522QV/ahsgzhjiOT17a0XCDF90cSq08WdBOm/ok1sRJ96VQhALnVm@vger.kernel.org
X-Gm-Message-State: AOJu0YyS+gpkYU4qBFeVP9qmBf0lEOgcDzgMiH/WiB0MumrVrkN9ZwUB
	P6Item1Vhj9A5mE01HUGsDlxC+O5n9i6ozl0OczBAy7YuybHOCC8LsbkiIim6a6gZVY7BL5t9Q+
	oWZI2wnp8CvJbUWqNDK4xqliCLMTyEmy0NrSnESZFM71e1bzYWfMgWhj+a3xn5HwywhWAwUis
X-Gm-Gg: AeBDieuUwoIFyyGhXEkrnfO3rj81flZGD/k/13x8UUIF+314UgbiYwk4+vsj6VB1dzC
	dxjGtfHKmnk2REptiXUp+8qreK7sXmLmIu/8rMc4mJew1Tt14U+lT4qorOnergydiUeMfqkuJgZ
	ZszOQZKPajjPa8WnnrkTFDP29z6MuP3RNyTlW2zCYeGDCB5eUJnU5gDvM6Z2aiRBmwfVcBmJot3
	kWQaFBkMmipY5jUzOM5fkbO3M6xJ6G5usm2KaFaGTnPNo5NLJOiVbjLzVz0MFHlGOhj9HIqWpik
	AZ3OrKyqme2LZYtEyxmNSDt8mWveNRrYR5VtaZH86OwRJaOKJo/8fIlrh8PWcUcdgNxLO2EKfVd
	8KovxZYDDjjCymGx9oSYUH39l4irrtcuL1oB6sYuRm1xmhIGcqt0=
X-Received: by 2002:a17:90b:2742:b0:35e:5ae3:2993 with SMTP id 98e67ed59e1d1-364c30e2c5dmr2029569a91.15.1777539553159;
        Thu, 30 Apr 2026 01:59:13 -0700 (PDT)
X-Received: by 2002:a17:90b:2742:b0:35e:5ae3:2993 with SMTP id 98e67ed59e1d1-364c30e2c5dmr2029547a91.15.1777539552746;
        Thu, 30 Apr 2026 01:59:12 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364bd5249c9sm1267312a91.1.2026.04.30.01.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 01:59:12 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 14:28:58 +0530
Subject: [PATCH 3/3] arm64: dts: qcom: monaco-pmics: Add ADC support for
 PMM8620AU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-adc5_gen3_dt-v1-3-ab2bb40fd490@oss.qualcomm.com>
References: <20260430-adc5_gen3_dt-v1-0-ab2bb40fd490@oss.qualcomm.com>
In-Reply-To: <20260430-adc5_gen3_dt-v1-0-ab2bb40fd490@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777539537; l=2376;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=F/Dag6hAiI52pCaHDtbl8w7fY3rlU7H+PFfQz62PGaA=;
 b=2o8KVBQ3iuFtrNMgNvWwQesgdqfN1gosy1D3SdG2S5+LUxNLtyYuPQfFovwVICQODS8wrUm0D
 I05R1YnYgjZD4girptl4N4E9eD4yE5jeqxer6s4dTxQdgnA0pmBNaXi
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: C5WgTa_ss4AUpnootxIyk3_DoL4r64TW
X-Authority-Analysis: v=2.4 cv=aYRRWxot c=1 sm=1 tr=0 ts=69f319e2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=5fc2j9ygtCN5jjOEnLIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA4OCBTYWx0ZWRfXzaYREa1Xxttv
 /lGmVs0gwD4neCfpsqOxS6i1OgL/EKVhrNt9CDm0pIU7E2/jwVU06B1uHxWXm1yBQwlT7J2NLyX
 tMZAsw43yUBkspSlraNxGfe2ifdOVMsMc6NFcpjiigeCxXBkPKks2S1WyVseorUA6eX2llN0QvM
 WEOvXKqO+8k2t3Zsp1G12j8C2g87HUBiMVaxH8nzfn0pF4gXEUw4yckSU0Hohan9BleWugexr+f
 PChY1DfZ2FD8UDfEZdQ2YYUUDvt2Zu24aEBkkegsES33TCBqMafIXBPpVOsDMXZmJ7LloKUbflm
 0l1uZwqa7SdTSjvtKumOFoEy8sJehBB3qourLjZ73IMN6ff0eRczIxkMy01QKImteHjPGNN/yIW
 26iLkufwYi9QvUvoGSf0zOi1QXvaAhxWhksYt+GJASxvrZEyJbYTGKt0UmnZSoV2EATqjmCVZN1
 liTJJiyjyMk9QE17xSQ==
X-Proofpoint-ORIG-GUID: C5WgTa_ss4AUpnootxIyk3_DoL4r64TW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300088

From: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>

Add ADC nodes for PMM8620AU PMIC instances (SID 0 and SID 2)
present on the Monaco platform.

Each ADC node exposes the following ADC channels:
 - DIE_TEMP: PMIC die temperature channel
 - VPH_PWR: Battery/supply voltage channel

Signed-off-by: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-pmics.dtsi | 43 ++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
index e990d7367719..232bcb942b54 100644
--- a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/spmi/spmi.h>
+#include "qcom-adc5-gen3.h"
 
 &spmi_bus {
 	pmm8620au_0: pmic@0 {
@@ -20,6 +21,27 @@ pmm8620au_0_rtc: rtc@6100 {
 			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
 		};
 
+		pmm8620au_0_adc: adc@8000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x8000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <0x0 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@3 {
+				reg = <ADC5_GEN3_DIE_TEMP(0)>;
+				label = "pmm8620au_0_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@8e {
+				reg = <ADC5_GEN3_VPH_PWR(0)>;
+				label = "pmm8620au_0_vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
+		};
+
 		pmm8620au_0_gpios: gpio@8800 {
 			compatible = "qcom,pmm8654au-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
@@ -37,6 +59,27 @@ pmm8650au_1: pmic@2 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pmm8650au_1_adc: adc@8000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x8000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <0x2 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@203 {
+				reg = <ADC5_GEN3_DIE_TEMP(2)>;
+				label = "pmm8650au_1_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@28e {
+				reg = <ADC5_GEN3_VPH_PWR(2)>;
+				label = "pmm8650au_1_vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
+		};
+
 		pmm8650au_1_gpios: gpio@8800 {
 			compatible = "qcom,pmm8654au-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

