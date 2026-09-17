Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66EB4D7D30
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646093; cv=none; b=o6DTYEkIN6pO3jxYqUxRS7KblA+Ao03Ot5F+MocHXo1QR5E8il9Hk6eOWYsmWpHyBXsNHHSEGbYb6CKpxXn4GP/dBGDZDcEqYrGjfcXb6ypgx6/M1aoQD4ZvB8NFBYQVMuc0A69UmV5C1WR7dMRAIWFdG+DEH0z37zqEdGd2cww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646093; c=relaxed/simple;
	bh=rCRWGJ5b4fhSvg3pyL2eurfsniGd0t3Eomr4jK0pDO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NBfrNx4ORIevWMqfo4An/v0E9I49cfOFYa12jPZc7GjS8p/5sW1SsU8orzx2RHj12m6Yo9uwBMQ/B6EYGVPh3oasM1FWArKH7yf+hhldhmKNUc9I7rjEc15k7ya+jZACDXP1XSovHa2kp81/Vznb0+sBUbXHhWGTskebiSwDYjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o5e/S9p+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OBQiweQV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o5e/S9p+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OBQiweQV"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZXSk1257781
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NIQ8Leinje6c2P47/uVr0dwDyOFYKUIkUtuMDx3JiHM=; b=o5e/S9p+Ql9mHY1d
	+Hq/W5uaMCZh6srksuDd6JtbWZ3lkBMSH2jH/3k7TzuSRrQzjI5EVgwxsWq0PoWo
	6i6AypqeptXJfYWLbSO+m/Jf0o9+GZMKfDCbXcJK8x7yuhE8GrB9xPy+3PnxPkzt
	d0K8/fPE0n7LmiPffdzM/2U+135gzyGz5LntTm0lACt3CvBuVgv+nNjL15auVqAw
	qQPi6h6bDPLxI1qCsCrtFrV2PYo4Fc8YR1dr4zhY83FzK4W2mQ8hUAJz7gJ+JmsV
	mp71iQsIgYszvZIo96I1zt2jA70lHEBCL/RSXNNRrr3g7o5FT/CrhhEHMCjDPr5I
	+RiEfg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdftgkm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:54:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d94a158dc8so15133515ad.2
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 04:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646085; x=1790250885; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NIQ8Leinje6c2P47/uVr0dwDyOFYKUIkUtuMDx3JiHM=;
        b=OBQiweQVv8z8t/N2S8URS5FWzkmbfszFkT1NMCVKSVrGlNbFtceWI8bx6jbduGa1lc
         rJLrlp6ReBBDuUWad9xFTDAZ2klox++6em+Atg3Vjm4XUZFuLCvUlxy5K4MyDm53ub7t
         Mdi/ByWpQbSMKdFWD38AJvG/4au3q+SsZfrOPF0xosa0ZAFa6OHxTKg4I/RifvRe2F8P
         sJ96L9712Fv3asyaURtAJJVxTjXcql8cn0JWKaESa+XAHd5/tiFnPMK7fjwztUQwRz+G
         OUk6dwn89Sy18jtRHqL8TpdHYpgBjpwsuLHSpKlzuesSEcozJkB1FokOCiDt9ya8FkBE
         tjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646085; x=1790250885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NIQ8Leinje6c2P47/uVr0dwDyOFYKUIkUtuMDx3JiHM=;
        b=Af3psmdDxqBHmWtx2Lskocwj28SwqSbjtl5H2Gp8FmnEd3pXKlqQu+QfkIGjTPkj9I
         RiIRCMm2kbv2FIPwDqVH6POn7DkNltA7fRazQLr9NsBRuoeOE54Eu5DPuLiWIfUh8YbE
         wZGuHeye3rWBRcvX1WNXpAvvUiQJSi8I13lEibf5DnWEHDbwkSHQylCcg1EJJwvekJZq
         r4cZldDJHtaXydKHvRfATrnDuic6IUtc1NflUV8BHMK/4VsMk82hnRglNixW012eHzew
         PnE9Ha+dGenUP84RpgwgXpaQGGPMS/dCZpaBKlVRBVLaOmCsuSNgGVHQl88C1eEDS9QI
         ONLA==
X-Forwarded-Encrypted: i=1; AKwUvBxvxh5J58oGYS5k5t76d+zb3KJVMe/hKDqmbdbD0X0J6n4SKgZFbaupRAlo8UkXTHr52kbg5bFxzOjn@vger.kernel.org
X-Gm-Message-State: AFuF++mGlI9AogzSZRSnaGKnDJEcwRi0geSzQAMmE8rU/sR24xVufuhH
	x69Owv4botMgrkxj8SbQ4HQZSyyJUm+dTJbU4mQhzMAMfMsmfYwx+RTRHI8MV9ginqg8JSUmdwG
	vlA+dqWI9Z1+SPxJRWj61Ch2tWVBQ8Xf28BvITY+ZPfn272/jT1OVy74hWkGEpK7l
X-Gm-Gg: AYBFou1AxKfGq2mPEjHD63fHPFyIYFE45K49JwpECt1gqS8M5F1M9nAwWpf3cGgDdxk
	0vCBjtl5rWQVrEUCGRoLyjIyfEdTuTc/AJM7FDOnTSq2ZHe+bV8qtO5ogHF3XCyZy8RACl8KB8J
	RARndAflaeQNAdZLPAjmSsNwkaabvy6E/dz4jeI4XvJwTbMl4F1CrWf90lusdTg9YaZjYw3wS+P
	E7Htivt3tMLHBdV34oJqqs7xxTFp/5QSvAS+uCVI6g6hyQswnW/+dmLKVJPJOD+cOa0FLsnE5pS
	LHvAOGGnWk7sriWohgZzMf7PsFg+UmqIsMQw6FHSbjZvUU65aA8CBzlm0nozhkUEe2FGFxWjixB
	oKT4CyPD5JxhGHpJOX1zM0m35n2EF497rbw==
X-Received: by 2002:a17:903:1b67:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2dd8e51df8amr141022465ad.14.1789646084776;
        Thu, 17 Sep 2026 04:54:44 -0700 (PDT)
X-Received: by 2002:a17:903:1b67:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2dd8e51df8amr141021835ad.14.1789646084305;
        Thu, 17 Sep 2026 04:54:44 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm18249500eec.1.2026.09.17.04.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:54:44 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:24:10 +0530
Subject: [PATCH v2 02/18] arm64: dts: qcom: msm8996: Fix PCIe WAKE# GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port-v2-2-0d627d0856d5@oss.qualcomm.com>
References: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
In-Reply-To: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646072; l=1618;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=rCRWGJ5b4fhSvg3pyL2eurfsniGd0t3Eomr4jK0pDO4=;
 b=yuYVnnpy48NYkM2nnKkvp+/KUlxlfEtskYX8ZWFczZbA66m8P0z+dumdvgOoLmR9V+xpcUqDD
 ONxl/4OpGdaD3JE0odLyerqLaqQ/5UTNKaIyzk5T1fZn3V68dHthx4g
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfXy8DbUUITrq6U
 AgxLglFicb37dUcoJozv/KNd4AX1wwXjNAPYD6wf+dsytWXdww0h+iM+5FuJX4nVTtKRFpNB7cR
 1iUpChMxGHEaQHGjfD7xL82+DmDFhGAptohEfYIx00sk6xyd+olJraoNn/ei+v4qUBT5t5652vp
 jGHVtwdChERPfxrhVZaU3Cf3TwLy3pa2k2PJuRfIS6y5EgyhFZUUJSZQRLcWBl/T3MgLOXHxW/S
 QeUWUmZ8o6LrGcNGMKOz54Fc1vTmCo8iYrfuSI9djLPU30uEMK2UCcVuKyvLGC0n9lAn/oN2kYn
 y4JYnPffSiI6oTQ90BSFAo0Sn4bfNbOQVPF49z0eAvK4SgnuXeK7PkfxeVcWBLYH27HV3uOn79l
 abgdYyO/ZZjWzUITkncPjyJ/61Zfmw/YyAupojQMnutmFUuCqoeh7Z8EbKYtETMwX8Q3BMhHHFE
 aIlCxTr3T9+m5mt9DlA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX3kWNw5nOipNB
 hAuTsI4rVxMjD/eIUkzBXDZdEOyejbEFwnhcizplHXO11cctCfBT2426w4wBQ3iFwzFwsrzB7uN
 n4cOtTeJ2gbg/ws2TbUbnTqWJ7+sUSw=
X-Proofpoint-GUID: NXqMIDmEurCUNbHq3q3fOXgJlJkVomBP
X-Proofpoint-ORIG-GUID: NXqMIDmEurCUNbHq3q3fOXgJlJkVomBP
X-Authority-Analysis: v=2.4 cv=K+W3jCWI c=1 sm=1 tr=0 ts=6aabd505 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170166

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
index d55e4075040f..5b42c266557a 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
@@ -192,7 +192,7 @@ &mmcc {
 
 &pcie0 {
 	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
 	vddpe-3v3-supply = <&wlan_en>;
 	vdda-supply = <&pm8994_l28>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
index 77ad613590a3..2abcc733dad8 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
@@ -280,7 +280,7 @@ &pcie0 {
 	vdda-supply = <&vreg_l28a_0p925>;
 
 	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
 };
 
 &pcie_phy {

-- 
2.34.1

