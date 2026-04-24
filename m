Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F56D3BBA19
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 11:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030513; cv=none; b=sRqZvEt5JyWFtqN+uSHEtzL8rGDhJ1uiCtEKuYpARIQAIwEg8MPtaJoxML/z5/WO6bpG/M/2CXRrsX4yJeTIiN8wLZy4CNAbIKbZeH0RUaCzfUgQxxeJTWIJQmsZyoKkn86KiXZ04m0JAecxu0xy4miu4NxG5GgQqAQSTxKRuLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030513; c=relaxed/simple;
	bh=1+hwOvp8L+mZq2tI43pSkxj8ajhPg4gIxb0JWVm3tFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p/3u1zZKOXqbBGp0BxaMRMc6iW2lyoLaSwmxjMV4pvyjw/v110rZaDbXBDTV77fOBW/gaHjf9UCp7PMEk8a/IzBMz5m209gPFjHawZuXzHBMpNMcVwDAZRvIGZZ0/xkWEMOivp37KuzmkoX5jQ5tKv4VG1kXwX6Dwvr/rTrowi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B8uRfAwV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jYCke4GQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B8uRfAwV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jYCke4GQ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O94JH02710099
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 11:35:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VDKwjFJfEwBBY39KCK7JSKoRCKazpHWw05t8Msb32n4=; b=B8uRfAwVqXrgBHBg
	l6CM/eSxM9d/Awj7v0mfJM0MNE+SviepEWM9OiCuLgQIfp9UUWvlajACclM8SPg4
	E4OVqYLuvou9AfNpy0yY0By4+H48jDqvBFB9RUmk621DnbXXZRfN7WWs3VnaTnkS
	tMMPUy0ghLz0U+F3kmlUtucPXnRES/obhJrlHz64DEL/40T1HBHcChoRx/jPBtAY
	noCsGdyhtQyCwgHCENimOLXCKoELOkiynePPykL+N98Fn9D3STmFmO/UtQhOX37R
	46l5jEHWw72ypTqzaBusKZ11/D+XoAX1y6+PgFI6FYGu9ALR43iDTT5Fazo+rkNp
	h/YlYg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqqu9uwch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 11:35:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35e59791605so8298946a91.1
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 04:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777030505; x=1777635305; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VDKwjFJfEwBBY39KCK7JSKoRCKazpHWw05t8Msb32n4=;
        b=jYCke4GQtLYtDPHG+i9T3pGCCVuI8idcMAUax0zPwmlgRd0l/TViCo40Y56Mkq6M2L
         cR8bWCYn+1+SNqRgfNKvli9qAJAvWbDuANYjNAtqW9IAqSMO0x8vfeqAjbQ6GQBFM/Ve
         W0yAmkByKknVe2u1Q37QBf8eeKYCSXhGX46KyIUbCxrkM2fkB4SQJUk/PVGp8ZuBFN1C
         F4nuuw+FUizJriBCH/lYuAxYYkssNZ1fnoUs1YwUaN6wQqg0OsBjs3VDDVJR8vphE//f
         hgn3HSXxzL08UtfvW9/5RYdnfznvzy3wDHNbzORunJXIePVinKQEFY4+4Om6QYIXNXpD
         56EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777030505; x=1777635305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VDKwjFJfEwBBY39KCK7JSKoRCKazpHWw05t8Msb32n4=;
        b=lwHkF4a8ACi4kQPbyVqjQ/VrGoUNan0n8OFHZe6A3W/Yim1L+oNkq4ectQ0EXVBfNN
         +6qZA/5x3VfW2MQ2ywjU6+hgYo2zxPQHZWf4OQmnIzguABZb34N3PCoGjZG6y5v12SW8
         R6rUb2oR8+BmHEcPnuvepR5dGrG+LAx5ZYvZGwGvYPvumDUK2XD//fluTMyiBil+aX8H
         OU22XT7YLfawTIxbMBZqwK2LeiW+X/0P2UNQDYCN1KzKRmjSuoNlxfTlED6MY6UmSEka
         /mWM/4EtwVmh/GCz5M7XgZ8r/Xbw0ejHKgvKxpDjDYkdsQMKDiXQeMSgidPwk9jeq1JZ
         4mHQ==
X-Forwarded-Encrypted: i=1; AFNElJ8UGUkqwtsloDZKSyIOJhOyNZhwCJtakBmSYuOuYvRTXggjL4s7FI0dopoGg9jPGVnrkdEMed5unnur@vger.kernel.org
X-Gm-Message-State: AOJu0YzP85VUjOPxk6NmbygqxWnNaHjIvlI82zOVWD31cj9C04Z3Q/Hm
	CfuwNY7V+cfQZkUme9jUsxLr7zuo+7hfRAULU7sOZwoNy0d1ijY1W50v0uy4DOWsBhlem/12H4K
	WPgle2CFOQUXaZPGXaTlvaWLaummWZx/TxxbCHpGsWkG0qXx/kqFvaZaaqPJPMy/qEC1+g3xa
X-Gm-Gg: AeBDieuF+nsFkx9Z6HQt9jORfavw+CpTHLOamG4OJIqhaf92OquRPiOjSKNwdH7e0KG
	0JW06d391gl3uszpZN1i13C6BwY9x7gekJWpTuun+BzcGt8PVRlkt/pt3avxD0h9djsYwtsWqHX
	43bZ+mwEdjzswnFC9ZGpOOH+FuygmqmXnlRxZV9wDzgHfH9z3nYvNHL++JRmnWopSqzJMHy/SCB
	yNwAJmb6NCpBzub7vnpWPmrijFlDoOsBhvO6ie7RiB8GCR0Q3dwz1jsXlz335LZYD5NwINvKqF3
	maWUNlpxV8U6Al4tynp8jmZa7iAdmoHoNjhPZLMrRTZ1s/UI659GWdvNpVIqVaz6vQqu3xJI86u
	Y/xtP6Hq9htasFOZmu2GxSkxmJuxoK799Kk4O+hNoOjQDZAJOY/EzAcYhFbaZ3ivGBQ==
X-Received: by 2002:a17:90b:3b4a:b0:35d:a4c0:a0ac with SMTP id 98e67ed59e1d1-361403d61camr31243758a91.3.1777030505290;
        Fri, 24 Apr 2026 04:35:05 -0700 (PDT)
X-Received: by 2002:a17:90b:3b4a:b0:35d:a4c0:a0ac with SMTP id 98e67ed59e1d1-361403d61camr31243725a91.3.1777030504818;
        Fri, 24 Apr 2026 04:35:04 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614186adddsm24204734a91.2.2026.04.24.04.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 04:35:04 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 17:04:17 +0530
Subject: [PATCH 3/3] arm64: dts: qcom: kaanapali: Add qcrypto node support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-knp_qce-v1-3-813e18f8f355@oss.qualcomm.com>
References: <20260424-knp_qce-v1-0-813e18f8f355@oss.qualcomm.com>
In-Reply-To: <20260424-knp_qce-v1-0-813e18f8f355@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Harshal Dev <harshal.dev@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-GUID: 3TTNGSX-GuHzbIKeOUXDrKyv3_FtWjBQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExMCBTYWx0ZWRfX2dVKyHW1c7o8
 FvaXpU4TqVEt+nt3WlrN2qFHNccQ6f5bIqotn+ZVE2mJcbCEJ2xEVjUjwXFLjkgQepoiqoeAccn
 C01Qap0yf0LTJDFIiv3qkiY7GAIoCuHMEaIiGRVtQtcFAIcj+gouaHlLzJLv/IFi1rQjcFu5kGi
 uHMGw5bXioLjifqtDFmL7sh+Bm4KjpJZPyIAAOg1+pPRLsU1Qn+ipZlFMc6s1qYgbkN4UvHiMIg
 gHO1B85m2q0NfHs7OVhOHLKN6p3Jg9bHIl1meAnXu5T84cdjZbD4u1QPIIdeDwuWkejsnF8VcLi
 Y4of4bSStl2MHbYqMrCHWZ+quc0a+tlgQyCUl/fC8/dfxKG5Aa+SZmUiKa/FBw40GWcC8gJIW6B
 gMCAyBeaVKY1iFVUsLGtra1Mqk45xPSERq8UMnpq2No5SGIzpkiLJp4ovIItG8fuDajjmzMMNcZ
 dCHq/aytBZ0hk/RS6kA==
X-Proofpoint-ORIG-GUID: 3TTNGSX-GuHzbIKeOUXDrKyv3_FtWjBQ
X-Authority-Analysis: v=2.4 cv=QJNYgALL c=1 sm=1 tr=0 ts=69eb556a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=lX4hch5PzS7iFd4KNucA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240110

Add qcrypto and cryptobam support for kaanapali target.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7cc326aa1a1a..941c9b131a4e 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2541,6 +2541,31 @@ ice: crypto@1d88000 {
 			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
 		};
 
+		cryptobam: dma-controller@1dc4000 {
+			compatible = "qcom,bam-v2.0.0";
+			reg = <0x0 0x01dc4000 0x0 0x22000>;
+			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			iommus = <&apps_smmu 0xc0 0x0>,
+				 <&apps_smmu 0xc1 0x0>;
+			qcom,ee = <0>;
+			qcom,num-ees = <4>;
+			num-channels = <20>;
+			qcom,controlled-remotely;
+		};
+
+		crypto: crypto@1dfa000 {
+			compatible = "qcom,kaanapali-qce", "qcom,sm8150-qce", "qcom,qce";
+			reg = <0x0 0x01dfa000 0x0 0x6000>;
+			interconnects = <&aggre_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "memory";
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx", "tx";
+			iommus = <&apps_smmu 0xc0 0x0>,
+				 <&apps_smmu 0xc1 0x0>;
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x20000>;

-- 
2.34.1

