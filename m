Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779245;
	b=1cZiquf3nY/hiOP+eWioEs0JAjhCwg75p0fkGFzLPPgVmCPcZ7al8VfLfUZHIJXOov92
	 HXvSvpggEM+IjBfMPcjpAyAP1d0l1mC9OdZvToLZLUiLzKFe6+oppGs14ulw95XzeLsNF
	 Ej8CTp3GRxSgoXuYzNdvpKWcClRIo9iTMMevjr48iIHLTpikHsJNcmq5w3IdBpnShpzwB
	 KCrh+G0NcJ5ehrFP7a3Na0MbRcRZylThBDQ3o58OUBueB45utDm7sk0MWQaurgazD4TTv
	 /zqvvzw05kNLiNqQZ8f1BSlM9jY7B6Su/8+2hUls5FA7kAW1DmI61C/rVQWEjWorAFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779245;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Reinject:X-QCInternal:
	 X-QCInternal:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Vh0ZqxJIkJ1JLdgosgsVKcfO8jWsWfljJx6goOef+fI=;
	b=rLhSLCNETdMcJEDbA8fVA/wQlU27hGJKAc/EyVvpQL1IuD01SdgQdT5fREI73Sv4aM2E
	 csFniittUhYxUBjwKi7B0uZ+9GURE0QuriuvAIkluC0lf+bZFJalDXbxn4+9gxC50F6b7
	 w3nxU0oM2LP9qVXtKx+vliLcxfg+9IPBzgk/AZvROoWb/m8kpC+9J5142A6gaaJsAIreA
	 3R83vZPryOYAFXL8wZW7UEl8zm91BYit2JRfSRu3n9tcs8gHxFfure7iQjFFixb10UgOY
	 uAyKp6n9Q5Du9wQLrrHX31WaPVbdhPWVuT6CfkMR/A8nUjTFuNYHzDtEywl3TLzyYbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bJPZfTiu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D1D606A31C;
	Fri, 27 Nov 2026 11:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5D1D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bJPZfTiu
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApWCN1685592;
	Fri, 27 Nov 2026 11:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Vh0ZqxJIkJ1JLdgosgsVKcfO8jWsWfljJx6
	goOef+fI=; b=bJPZfTiuMJFe25x/RIgPSnS5fPYqmYZM8OAOo8IVoiFbxWsgdja
	twJwR9TDJnQaIR64ZKQWTRX+M5jwm24rTD6NOOHV72KSQINXl3stdyAxv5cs4JK2
	G8ZBmt18dl1+RMo97Xj+WzZwS+L47skVHXHXmmvLKyK0SikEVDrgk3Y2Y5OfrBcx
	NmYnIatxBVsIaoh0Sf1sZln+97e9zJu2lK1lpZPrKiHpoD0NbE84U4iRgVvgNx40
	Jf3jazPapBE93UJo1cP3T34HRPejfDmlJLLVJUPDT050eWEq6yi53zyFie9Kl2E3
	JXXBrwCL5s8mhky88t1nQA8OruS67nyzhtg==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j756k91m4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 11:33:41 +0000 (GMT)
Received: from pps.filterd (aptaippmta01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARBXdgE1469932;
	Fri, 27 Nov 2026 11:33:39 GMT
Received: from ap-kernel-sh03-lnx.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 6ARBXcZC1469921
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 11:33:38 +0000 (GMT)
Received: by ap-kernel-sh03-lnx.qualcomm.com (Postfix, from userid 4851478)
	id BE42940C5A; Fri, 27 Nov 2026 19:33:37 +0800 (CST)
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
To: shengchao.guo@oss.qualcomm.com, andersson@kernel.org,
        konradybcio@kernel.org
Cc: bartosz.golaszewski@oss.qualcomm.com, abelvesa@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: nord: widen SoC bus to 40 bits
Date: Fri, 27 Nov 2026 19:33:26 +0800
Message-ID: <20261127113326.2889944-1-zhangfei.gao@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NSBTYWx0ZWRfXzIF7MKwG7qkE
 0SA+qkij3S8ZMUI//lBouDpoAFziFZr6w0vjRF++lv/8fYQ8alUW9wa0R4a5EzYtJ+8BhpD/JCF
 d0u0JiWhOb0QhVdf1em/EsO664Dj/k5WC4rpNQzkzOjno772gO3Sz40i8C9eLwcbpNtx5W9nQ9Z
 B8BE8WSyyl+r64ZdPO7638+IfA12LsYCJBS27nMbKRNKRCRCwIiKKNrZNWLooKNWSZM2nYHkLqj
 ygnQXKu2tT+nMP2B8xzUb3PwHd4RgOV/xtcC5Y06HiZHaSiL5tBQnaAcnD+BUJLcIrVbyc6MN9B
 oYL9v96CfyYlQt6GQdB5RRFKRc9u/A7PEt+4I811x+gjWwMWbFwcNZwuo7KuH3J9/vbKtNL0XUf
 bW7YLTuYzg3J7oJwSIuF3+noZloA4x6HOmkB8vadira9VnhHrBmVqumush9GeOkc3kBqb9RDMWJ
 dbxul7BBbPjuB4sDigA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NSBTYWx0ZWRfXyGfYuIhx9iNh
 td64tva/CMWu0qGUNgoSffmqdL5pxHti+XVXeGQVE+E2jM8TNYbi46Kidprv5EVt167sJNBXLh8
 iKmRog0B7KJNAB/ZuDJCeyqf6csgmWE=
X-Authority-Analysis: v=2.4 cv=ebWo7LEH c=1 sm=1 tr=0 ts=6b096a95 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=9iDlsHklZkebGCAyCIcA:9
X-Proofpoint-GUID: mCtU1SM83dgqd1dyvhkGjb0fHJuNE2uE
X-Proofpoint-ORIG-GUID: mCtU1SM83dgqd1dyvhkGjb0fHJuNE2uE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1011
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270045

Nord exposes System RAM in the upper DDR window starting at
0x8800000000, beyond the current 36-bit bus range. DMA mappings for
pages in this window are therefore treated as unreachable and may fall
back to SWIOTLB.

Widen ranges and dma-ranges to 40 bits so capable devices can address
the complete DDR map. Devices with narrower address limits must
constrain their DMA masks individually.

Fixes: 5e97460df08d ("arm64: dts: qcom: Add device tree for Nord SoC series")
Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
---
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

