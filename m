Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9473EDAA5
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180457; cv=none; b=ZscXKVusDNj2sZKqsvSbTnpun/EhwbBzPq8d5EtuuuM0HHn8vSbleDJ9LtxR5V6AhaZO+HpKzMeiWvpShX0BirrzFUquGU0RBte1l//ceLY9NFxns63xqCXslS+FI1D5o9N23lIwG/lPFWqx9jKZ7lGweOC/7BU9B0OM2hXoV/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180457; c=relaxed/simple;
	bh=awu4K4Bs14uU/g+Ooa99QANFRukd+lo481ZTjtFUCoU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OJ57n/JzHQNkCg/d7Zut9Ktk3vDThScwKEhqMH4VXxQ0GEskxlr/fWpV+BhN2f22l9kgdLLLK7xZHwD2iCd/PoqkDQI6iAj23zuU026epSHa1/otrDIFlRlO+GWi7hoLI8syqTqNG8u5VoPWiU5MmQhHcCTq41D5AxktDZigUck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ah+Fyylo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K/8sP2Xx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ah+Fyylo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K/8sP2Xx"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J4fiLW1251285
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gmjNenISsu5vkMKrPVIkZ9GWLjHD1Fujb1tp1hK7UKc=; b=Ah+FyylofomzbuiY
	AFE13VtC/DuYRlcdGqG24sO3a5fjK4XrxBTI8OIqs0Td2mtzlreQKXp6uBHNiPRz
	sd3zz97LmJlwuejSHqMX4ppwwQnw+htG7fo1Sa64Xo8h+TL/m1MNYYpdDoD7R//P
	Mm0nCoG4k3GiK61r26nv6M96LqDyleEChAUOliDYq0tagnzb1Kql1Gj4ImDw61tc
	WDf/GyOYhgytNqr9LgrAdBWNU7CdRZ3qtVIxP/jxsGMCDkjusSPDyQOhhPGPLIDk
	sOqI1amVgyvA249M2jQdCRY7vBZmoFCwqBboSkidSpcozSrt4e0sCZ5teAltNHFu
	bT9X6Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82c0makh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:47:33 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8386367b23cso2358118b3a.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 01:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779180453; x=1779785253; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gmjNenISsu5vkMKrPVIkZ9GWLjHD1Fujb1tp1hK7UKc=;
        b=K/8sP2Xx4Ig/iy+VjSDGncKPvRj3t4NsW2R5MokpNVNk32XvkYKofFV98tJAzam8K+
         EnkIXeKV9wOGCQBw0GZG1R2fet9/s3yeaYAjLbSR35xQJa09/HnWDF1Y8qhiY4DY2Pqd
         kQo+3hyDn4d9erf/30NZIJmWPw7ZhhST2/o7M2nQr2JlutnQoLkSCYzY++jrZBJ7Azvc
         J13P1G4DWVbYy0bdO8lsNv/YraHRDzPZ+Ce+D3HZM7oNPu65jhNTqifYwRQ+rYK2j97g
         lTtWG63S8gBrmNT+/D37Lv3F7oYWznWT8TM5cIbJwhS71Vqm/3AwKkVyz+MK1ZKfnLkB
         fkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779180453; x=1779785253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gmjNenISsu5vkMKrPVIkZ9GWLjHD1Fujb1tp1hK7UKc=;
        b=pps2TbsK02qwYWCpbZcyn+UHNhib0g6F45pzOTvu7PZfhA7R5nGXP11SUcpYlaA3Kg
         U/kVGnBLMZkqKIqux/+ARIV1XnWA5vgXbZI2TVHMHL7LmpZqFSiYq40/LxqjUhvTXn3Q
         E9eg/V18sqObgpSxMFYhiFjc/+7OAPXeEc0ESYSf2BfkKLXCKwwoZBNdEK7Uu02jGT6O
         jPSvvW9S7hLSygfdwE3vfUnooF2nXk2uv3KjDhUZ/pr+lw6JioB7OKFOHV5BBTP8MlRZ
         L7hZkVGQ/Tww20m3t//WRQd0P1B3/gA4MZVbx56j+29XHPVuQfWEnrj8vroC8OgMcdGz
         ITqQ==
X-Forwarded-Encrypted: i=1; AFNElJ9L5aACpRmpUBKw116n4TTlOLT/Ly7vWyOYTtYCtuKcN/jt2KmIJJkwYj1y0ajxLAunMdqVCfs/qe7N@vger.kernel.org
X-Gm-Message-State: AOJu0YxwN6X+WhEAFSHOPqXjHVwJm+ypOH4BzHN9It715hfWRWAslraf
	8tSZHiD3f38OEODOCc6ZdDuVSpVDb0SV3FN49VsQkpNk/59TVlMXSo7hQ4yX9/m2m+uRZcRJ3HG
	lbglhaKFjw2Qb6EfMbybc2KsUpsAIIzR50xITlV3VEs60arf11a9+FpS+iKZyqes4
X-Gm-Gg: Acq92OF45lgb0ruGoB3DJEpKJbAzdgauJUBO0hJQcLcxj+YjRDTo9y7nZtrmHDsiIEv
	nnx1Zxw/uYCHCPoMpe2bqogYkEA+XsJH4i3cND6qmfvP5yy++pR4ynKIKIX5B9Ui0JO9Y5nJnlD
	g9UKlSF7eZv8dgVEhzVPd11i5uCvqWRoSx8NeXSgPSuvSWLb/t9FUWZGuxu4FgaxJR2dOku1+Mg
	gd7Co7cWMvUQVH2QMOrq9vUshbrrjfbOBlOpQmOv0xZTxKGdRXLe494X8lfMx0QXWQq1UIgEl7w
	dIoIUwoL4K8g4N/tKWVnnPyVTSJalBgObHWu2c6gWyVJ34ink5CVHVvwv0+7wrz82PaFUIYp1g2
	NGD5s19KlJW9PrNFPCkstIkN7R8xNN8SrNzD2Z/9qkMIgJrI1AWM2aUS3cpYbIrAoSOq0vgK5Eg
	8J2LfyEpwGAcgT3cWBO6eTvfsA/uSJAwAcpxteHOL+jmLN7FGjvtd7vVNc
X-Received: by 2002:a05:6a00:a221:b0:82f:9985:d4a1 with SMTP id d2e1a72fcca58-83f33d39e74mr17617250b3a.24.1779180452700;
        Tue, 19 May 2026 01:47:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:a221:b0:82f:9985:d4a1 with SMTP id d2e1a72fcca58-83f33d39e74mr17617228b3a.24.1779180452217;
        Tue, 19 May 2026 01:47:32 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5b1f5sm17434104b3a.31.2026.05.19.01.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 01:47:31 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 19 May 2026 14:17:07 +0530
Subject: [PATCH 3/3] arm64: dts: qcom: ipq9650: add interconnect-cells to
 GCC node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-ipq9650_icc-v1-3-4d3554c94257@oss.qualcomm.com>
References: <20260519-ipq9650_icc-v1-0-4d3554c94257@oss.qualcomm.com>
In-Reply-To: <20260519-ipq9650_icc-v1-0-4d3554c94257@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779180431; l=803;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=awu4K4Bs14uU/g+Ooa99QANFRukd+lo481ZTjtFUCoU=;
 b=7ZMNxdyViPnNTHymAwSaF0IL1IQjiaFvVsHJhxVSzfHAVVcwNaoQPYyjjgqSG6KGULhNCoP56
 mOp3b0/r3mGDMn/YLmAwFBosyuDyEBFLIRCUCUStmPnreBKn/EaAtDP
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA4NiBTYWx0ZWRfX0Q5ULza+HyiT
 7eSw4VLQA8uu9dwB56aa9xzRwL0x6elSM3usNPtS92vRmZ9Zt7KCfMk/t0limDXpSYXHAKLXO8o
 JCt9Wi6QzHz2YaCC+l6oN9j8WEbMVawiYnn5zWJwlc76+9GGqurFwFpQHaZuv9pDXvI8DGxxqEH
 MSiDMeGxfNUrOE+KM2de4qARBO82D/XIZucKULqnr5bQn5zl1voqmPnBazoRkkYnCnSsmky+3pT
 5vrHyCLb8LkbzBekLyPigzqV80ZS8G1ht2P/RD4BPyjpNYC0AUUmk+mqDCVjL/Nu2IKcF81P2FP
 3ei276W/1xE/epel3ubh2pvhWHmn7vvZI09Evpueu8J5WyrOAZFUpXEOt5+nICIH66NliqX9Km+
 qfliOTHPaVj+giayxq3ulEebfTgkTpQJN4WqDZ/jQ3IMr0EL9VqA6iNr9VOU7ij77FSDW9hNR/C
 fMMxl2Rm2Xqvg0Ma29g==
X-Authority-Analysis: v=2.4 cv=A5Jc+aWG c=1 sm=1 tr=0 ts=6a0c23a5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=reN9DiWUbCtN1Y_qNI4A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: jCM-YkNzvj8KO8oOz6leWpN6TJOvbiCt
X-Proofpoint-ORIG-GUID: jCM-YkNzvj8KO8oOz6leWpN6TJOvbiCt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190086

Add the '#interconnect-cells' property to the GCC clock controller node
to allow NOC-related clocks to be managed via the icc-clk framework.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9650.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9650.dtsi b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
index 3d3b317c6a3c..4c442773de53 100644
--- a/arch/arm64/boot/dts/qcom/ipq9650.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
@@ -225,6 +225,7 @@ gcc: clock-controller@1800000 {
 				 <0>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			#interconnect-cells = <1>;
 		};
 
 		tcsr_mutex: hwlock@1917000 {

-- 
2.34.1

