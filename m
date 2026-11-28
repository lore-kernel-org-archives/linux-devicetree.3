Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795836267;
	b=CH2cebuxEfTp/UKzt2edOE4kQXZLryHSBRJZFKLrit2UrnyRH53Z8wsZV/ULrU+fTX0e
	 esbAWozv5hGuzRFBLyAH5prSui8YzeD1b0CnZPUlkUFOzKxyZyxHbKbTcTNiTSn6mL+y2
	 n7/8FeYdSke1HKrzMa79H8uYBPbZfzo3U0sZBDJ6RexG0pg+KrHwNJM1NYsCR/Mrb5mxo
	 9n7w4nthAMgOdfahGXzL6H6WpeFyIc3LOC2YHa8biWuU2AsFf+FSbfCJb1Qkns8soEUsN
	 6yELBkIKEQGbzfgUJHociCvuJPrYmZTmWGWcMjo1yxByCzQ+skJ8+rLns8KkZeywMHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795836267;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Reinject:X-QCInternal:
	 X-QCInternal:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WmrA5c8p1j9jAn1Im4Q614Hd9+s7lvkcFxaMJaWiuIo=;
	b=SAKX43lwF8oz6AAxp1poaGOaKd6Ja+1Ws1NEx7oips859Yw9LnF1viNRnJsQtAAiu/52
	 ToYdopEkAF7bMB8PpsbCANBgjI8uiWmnBUueX2jgMuxnWe6Doxn/OxQoNhreuzOMIKuRr
	 vacphQl72FCQWaVDz7jv7y/3IBY2BvlD/txzHlLD2H38ffAGVsSMYZlvIRJQwfcVuo5I1
	 smRvGfdmnRaP37W6u/+PXHZZwnnzOo5OegCBbVMBI8ZwZzR8SX5Zbp/gxpWPTpTJw8rKB
	 UfblVhz1Lk0SdPF++m0qJdXJ6CLyhdV1r7tEtU2BDFNqw2baawc06H6RRGmfzPoqA6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="U1/3vG1I";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F6D606A31E;
	Sat, 28 Nov 2026 03:24:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75F6D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U1/3vG1I
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AS2ANeJ009217;
	Sat, 28 Nov 2026 03:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WmrA5c8p1j9jAn1Im4Q614Hd9+s7lvkcFxa
	MJaWiuIo=; b=U1/3vG1IFL/Fo2hD2j3vu5P4cHg7sClYXt12r5j2ENTBOpETbBV
	UBoB7ObX2N22qRRa1fsz4GcgKw1iQH/9kGpJHxGZ1PdMObs5CkcldIIUSLli8D1W
	PGulpoVkQ/I76EhLDwudPkRM5n5DaF2NszpeA+5lBEZ966Mwo7hGuvXSEXur1TU4
	TdUeFlZU6eF3BXoWNoFe882Vgq35Vyq5OWSBqo+uXTwwCTAoG4e1zeKafusCEc8d
	mbTFgHYPl0GxZqlquD/YQB+vNZVK2rJp0PwFL/yJPEN9zoGiKqxJOY7/KsIVUwYR
	4qSILaOM3ApW+naqzP1b6dAl1qOeae1K38g==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7nwsr486-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 28 Nov 2026 03:24:17 +0000 (GMT)
Received: from pps.filterd (aptaippmta01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AS3OFET2627194;
	Sat, 28 Nov 2026 03:24:15 GMT
Received: from ap-kernel-sh03-lnx.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 6AS3OFt02627186
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 28 Nov 2026 03:24:15 +0000 (GMT)
Received: by ap-kernel-sh03-lnx.qualcomm.com (Postfix, from userid 4851478)
	id 67E1140551; Sat, 28 Nov 2026 11:24:14 +0800 (CST)
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
To: shengchao.guo@oss.qualcomm.com, andersson@kernel.org,
        konradybcio@kernel.org
Cc: bartosz.golaszewski@oss.qualcomm.com, abelvesa@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2] arm64: dts: qcom: nord: widen SoC bus to 40 bits
Date: Sat, 28 Nov 2026 11:23:58 +0800
Message-ID: <20261128032358.3754156-1-zhangfei.gao@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI4MDAxMyBTYWx0ZWRfX56ATcanYsbDD
 58kjJjVysehg2/y/p5zBLPPbZ6OF4KQrG914XqmmJ5/yhi0o5WmQ9mTyqeUMgYuHZXwaBgqKAl2
 S9hG4zukHHUJY71mQyjYdSQs6LxGPuUDcgtIrtCWScGUqCpN4wx65/4xqhINs50bSSKbNEpExPy
 A3FjuK1l0QjQsen4X6MKOPSHiGg4+45Rt1y0Bs6SOgURdIboSDY4u+QFVvMLyBIJj77Lht7OZR5
 uctcALtOnSwQ7dTGRiGtPzAfy3Z1436Vd34Th0K2I10j6dfVd3hmNU91KuFfA7FZpNtkozu5v9U
 Q7v/1ZIjSkKzjLcQOqHdzQR43vn+7TYQXE4VVlbSL3Ds6Q/306k1+5zSpfmykbCSks36DZHvdwN
 3SwL+VRrEp9brdQrZdu9c74k7zpE+C5PrPUnVoulXrQp090K/xX2BTT9DTrUO5ZpJTHOOEKdreq
 cZmoGq4phe+o1lUh3HA==
X-Proofpoint-GUID: 3HAZ1cP5IoWAgNDrGvR8L8jFjEg7fxj3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI4MDAxMyBTYWx0ZWRfX5HDjxrbKiW9x
 NZsH4syqsYD+IqvG4AfJD6u/iohq9msxAZRkqxea802/vBTAYXDTJGcoMwt/kmfphhbmDdGIEMa
 CL7MC1DtEL9n/Biokj2jvi8P/bRZgNc=
X-Proofpoint-ORIG-GUID: 3HAZ1cP5IoWAgNDrGvR8L8jFjEg7fxj3
X-Authority-Analysis: v=2.4 cv=To1zFzXh c=1 sm=1 tr=0 ts=6b0a4961 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=u28KdbLrW0N0w5xM4YAA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-28_01,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611280013

Nord exposes System RAM in the upper DDR window starting at
0x8800000000, beyond the current 36-bit bus range. DMA mappings for
pages in this window are therefore treated as unreachable and may fall
back to SWIOTLB.

Widen ranges and dma-ranges to 40 bits so capable devices can address
the complete DDR map. Devices with narrower address limits must
constrain their DMA masks individually.

Fixes: 5e97460df08d ("arm64: dts: qcom: Add device tree for Nord SoC series")
Co-developed-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---

v2: add Co-developed-by

 arch/arm64/boot/dts/qcom/nord.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index fdbe290350ddd..45cdbba0e4fb9 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -911,8 +911,8 @@ soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <2>;
 		#size-cells = <2>;
-		dma-ranges = <0 0 0 0 0x10 0>;
-		ranges = <0 0 0 0 0x10 0>;
+		dma-ranges = <0 0 0 0 0x100 0>;
+		ranges = <0 0 0 0 0x100 0>;
 
 		qupv3_2: geniqup@8c0000 {
 			compatible = "qcom,geni-se-qup";
-- 
2.43.0

