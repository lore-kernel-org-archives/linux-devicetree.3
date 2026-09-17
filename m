Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEF74D7950
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647962; cv=none; b=pftnE7SCseBs84fP5BqNCRFdvNaYOU9STMSUhjA8b9U+NuPDVc0QCQ8g9WFhGWlw0wEJZfQ1W6FQtM16SUVFrSDBgcVzHUwt6clOktXbNk82bnFLcNRVTtrVvUPjq/6FZmlfRxlFc3+zYT1w1P3Icoxo5jmatZrxzUswmjJ0Nqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647962; c=relaxed/simple;
	bh=YFChqT0446tORb/T6erXbuqGyCEGrzvzDf5PT7XJgFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nmSD4QGXSg1lnMzJzeTXs7tD3AXAiCtw9RGWYk7dvHc4IxUFZwat2SRzpLKt3NJ1sJICcvBTC9qc0ukkxxI85gWPoxAGnMoU3lE8WRzH7MQ+LY01e60ti3xK8k/JGwmAdSQu/fMdPulwgdLr3SHeP9oRUO9uXkR0jPr5ewafT7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D8Sfuy5l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kS308RGD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D8Sfuy5l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kS308RGD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZYMk746500
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UZi9vGdmEO23EVhCMp1C1PN6BGWSn+y+i7SV8wWmXOs=; b=D8Sfuy5lCcg2ICvw
	0PMhnVaxutHfi0TemvXhFjlzKBIRcwGNZ5248xxmQt/+a5VWF7YPxpClGCW2JfOn
	+HCLgFXBmmOxp3XXBhmoxmgeo2WVUEs5DyafmooEqLVgnjSNoFjkecXWl9YkC4cW
	vPlPhHDeep0+bmQoMv8FS7MBFtUEhyKOhzaMlxo3vwLLfsmOoXj6EbYNplPmUFlS
	FBIIoaEJ9HoZLm3/RO+27P/IabwlqXFITv+0WV1n8b4CampciWUHTLZ9TQvD8cxv
	aY02uI2QOHEQ7kK1VXHgcEyt80M/9dpRt/mgcUdcjl0rxnr2Uw0+2jGtLfysrGAX
	QiKe5g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grcra8wq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:25:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cec4226c70so11969705ad.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 05:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789647946; x=1790252746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UZi9vGdmEO23EVhCMp1C1PN6BGWSn+y+i7SV8wWmXOs=;
        b=kS308RGDbUiahvgtRetb7QLWPrCEKIlATSk/3qC/1peEvHwIy6WfpVTLUqqc4Sg3Dp
         V3YMKRerNPEqwWeM0bc2wTfj7+yoRjYVSLzbd5SY7iw9sy6tAFR6lAOjz5wcJ9Vkpnfu
         y1bNcRki+cBOX9HIIbKwRRwnL2JzUV1NYknSqvmVhxQoeJ1qxXNOba3oWp1WEQco5r4m
         gnDK39WcDJlwTzvVcebZpQUcgjWmSwCbfrxYcKpB+uzLunX+lvikZaYfvmL0M5UcAwfC
         keNssIibNW8FJljoUtRA1ov0yg8OYXbw2ag4z8TvF9OCXb7qy6kMC3l0XkAkd+a/xhS0
         4gOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647946; x=1790252746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UZi9vGdmEO23EVhCMp1C1PN6BGWSn+y+i7SV8wWmXOs=;
        b=NvhYebTVg35zoULDJnfzI60TSBEM3LviwkIB0MXAdYBB2/RvlV0TIw86Yv9tUIZG2p
         vcuVGGy/YZFIqpfc0zvG5dQcfmN/b8S/s0yUU7ZmOvwpLG42atfYhofD5S/wK2Q4GmWH
         W1vx/gRLu+VW3y2LY3s9vZwCehuUNV4GJJ1U/8rUjYi3LHHBbgxABfKY8WEMMhUCn5yh
         6dCyUbvG4d6yOjTz+iFVGXkHHRyzRwXHI2gjzUX+76EHQ4pDD0JnWyUYcZ5vLfmrVMhN
         SDqoLUYttp/tAPp7B4ufTamIDbBhHB2ZaER6VWa0+PU1yOPKTboelC3kubyOkDlbBCLM
         JTow==
X-Forwarded-Encrypted: i=1; AKwUvBzP9vD9rwzpWFCJw7vTHw3o1ZbNbzWOt0WrKzevdNyXFVYcCKkt00UlOruaZiSfcbbTl1qgsWYA6ung@vger.kernel.org
X-Gm-Message-State: AFuF++lWd0jvnC26BjA5J+ZluhvJaxsMr2z8usBrUrr9nrNW77vG2+I0
	mWEVoslBf1Ww9bxDqIr3eta45QoF4CZoOLPGUgia9VETfP17Q514TlIK2YQktYfSOPShnBYKgz4
	H1kP0C+mQPxkf31Ta7ALVtD1S3dCzMKd+PPrLli7zeYzRmXvo0isEidS7xOTY09MY
X-Gm-Gg: AYBFou2G6V2zkmC+wqrYWfyJzLZxuFl94XWRDvy7RkCCxcIX2rxT04wlUr8RKYnADwM
	CjVXvFNoenPsegBXUMn3Ow1SXpH58nGRbOkWqwqfrOtyIfSeEHltS7JsqSyvD0FB1+Ldqmw0KRj
	zWFrrqQLZOc00OiQzJ2QnYr17Y9qqcidug34GxV7PhtsWT6pUWgVWfzqyZV8rTUBvdhCSfKk6oK
	rg0zd/iNwYF02PsCfh+RVGKbf8uCcYItaxK41YXAOAjGuZzKfgQbTd6G/YjSCoOw+jIzgLSMBV6
	SDCfR5QU4vbt1PEj3zF5TAtDutIMy/n/4v/iwThM0778X33cH5Dzzw8Cl9X1+jwYb7X4ZpcU0Hg
	X8BShB7ZGO7U/fBOthzCGhHHL9aKxatYi1uI=
X-Received: by 2002:a17:90a:6d89:b0:39e:231d:1e89 with SMTP id 98e67ed59e1d1-39e231d20d6mr14655369a91.19.1789647945966;
        Thu, 17 Sep 2026 05:25:45 -0700 (PDT)
X-Received: by 2002:a17:90a:6d89:b0:39e:231d:1e89 with SMTP id 98e67ed59e1d1-39e231d20d6mr14655320a91.19.1789647945403;
        Thu, 17 Sep 2026 05:25:45 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a175sm16380968eec.9.2026.09.17.05.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:25:45 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:55:17 +0530
Subject: [PATCH v2 03/15] arm64: dts: qcom: qcs404: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port_v2-v2-3-6272b7caae9a@oss.qualcomm.com>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789647930; l=2004;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=YFChqT0446tORb/T6erXbuqGyCEGrzvzDf5PT7XJgFg=;
 b=quMBjQKcL+u5qCbbBE7cuiQ2yAYDJgyd5XJ51Ig7TQEsBBx7LmGnGHfxi95c0aJXN6czFX9HM
 nmkCGxN3TY+CjxsnzQcn5/gInD13mjsVbdflDt2zaSNgwhhHndr8h0i
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX8TP3ZGbMd+6K
 8TwBqCkhhvWL4twVQBci5pps5RRT2r0HgjUsXAkT+7bg0iyo5gDmpaovBdlIGRwVMlX9kMhva6j
 KhWOhISYeZkLGpro9iSW0y7PPSTI4Os=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX/OU60HVhX2YH
 nYSg786jnO+bYEY44pmcnW9+Lj+3zYVhqAyr9DLHlBfH83v6RGKt0AA4P8jZizKuYs9aIRJUuSc
 XgzLUZSADTRN8ppD5AL20dnasBg4hNF0oVxuh4NWTaGjh7wtzGCS8vZcw5P0Ac/xp1KwO+ovsvi
 uwvdXM//A8xKYaFHZaYlsyCyNv6RWyt7D/3XDhPYFN12+WznmzefjHrR4fooP76zGwhDmxWgt2+
 KHEf4odkttn7AwU/GCrxov6TB+d+Q+fiZXpFk6agokzB10UiLoe/aYqPKNKXF1t5HD4FcM7agBz
 cpmp6ZYI55hFxo4nC8tZ4h59cMKzeQEEUvfxtNrQ9a/asPR2HQeYPV84fKViHO3eLQ4d5vsnoLG
 ZPr/sHT/jzWnbPTOrN0/nXs2nQ//fOK58PM8tZng+GwpMr6g5nJBjkN5SmbJtHQPgQO2ocU4INi
 hfv5m1zdpENAVlndPYQ==
X-Authority-Analysis: v=2.4 cv=WL/qzXsR c=1 sm=1 tr=0 ts=6aabdc4a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: _HWh-yWr_Y1-CU0BJ8dLz8xlE45Pt6YH
X-Proofpoint-ORIG-GUID: _HWh-yWr_Y1-CU0BJ8dLz8xlE45Pt6YH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170174

The PCIe phy reference and the perst GPIO property are per root port
and belong in the root port node (pcie@0), not in the RC controller
node. Move phys and phy-names from the controller to pcie0_port0,
adding a label to this node to allow board-level overrides. Move
perst-gpios from the &pcie controller override to &pcie0_port0 in
the board file, renaming perst-gpios to reset-gpios to match the
binding used in the root port context.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 6 ++++--
 arch/arm64/boot/dts/qcom/qcs404.dtsi     | 7 +++----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index a22b4501ce1e..55bd53f8c159 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -101,8 +101,6 @@ pms405_s3: s3 {
 &pcie {
 	status = "okay";
 
-	perst-gpios = <&tlmm 43 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&perst_state>;
 };
@@ -114,6 +112,10 @@ &pcie_phy {
 	vdda-vph-supply = <&vreg_l5_1p8>;
 };
 
+&pcie_port0 {
+	reset-gpios = <&tlmm 43 GPIO_ACTIVE_LOW>;
+};
+
 &remoteproc_adsp {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 736accfc34f9..7b622660c327 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -1517,16 +1517,15 @@ pcie: pcie@10000000 {
 				      "pwr",
 				      "ahb";
 
-			phys = <&pcie_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

