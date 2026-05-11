Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7606A1E98EF
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 11:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778497304; cv=none; b=HwGpxw2bFN2oVEjF/et0UEbsBcouGlT1j2moKR0mXkmLIQYoEh0Hy+DQtK8tXqlRSPZpoBC3qT6AMFr5YhWzZpPG5KEJJxBVfFe9rB1H4NpOSfporY8LegSZ2PV71Wt3Ta4rWxZ02x09PqFA+mj5xzXyG+V4xqhqb1BMeibY4oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778497304; c=relaxed/simple;
	bh=YNwSIpFm08EBvtqIqMQOfYYN54m3ct/e/7rhe0o7l6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=T64JWtb6oxL60w/Awq+GHzyOoZ19w33WdxIVlTWWa2Py+80kRNzPIlwbh2PJS0Id+RBEvlkx/LoIhz/Tq/0seFLw5f2flwAB6gEQC4AXKpUg5w/p3HBWHSkPK9mznbDgfKzTvujWoRoXngtcuvgiSCl+ge7sUtKZgNZ76NeVq1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J1yPgFk3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eLP2oJYf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J1yPgFk3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eLP2oJYf"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BA592L2039669
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 11:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Rjt+1DL2EWHMJuGEpz6QP7
	+XUe0cPp+JGhcItYkEqBo=; b=J1yPgFk3qEpH1hN9vM9SNuSPga3H5qckrQBay/
	qVSrt6L42VlniBmnYdfG0fYDCU4ZNU+W/bwwLzun4s8jMQHYWdU9D17A1+ELYdCH
	ftQBtyI+9tYfL1SinXDvaEnE5tqd1Xxe2hSsCeDYZjAgHqM3Ql1HMwRqt7mjifUO
	sixdlHaoP/PT8SgyZ1DgsMjuHpybVPbvXQ4cdo5V8Lm8Rc2r63CnyGpcCJdEehH6
	4M/IlwBcEhe3CJL/yFK8jtLl5js8mV/Hr9eAlSOle4J5HyG8t6p3OknQvbTRbFUF
	/LshuUCW6UfgLqYk4SUEDCSLUyH2pXNKLRKncCoizu+HMCmA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3d22r5ya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 11:01:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b4654f9bb6so46304475ad.2
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 04:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778497300; x=1779102100; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rjt+1DL2EWHMJuGEpz6QP7+XUe0cPp+JGhcItYkEqBo=;
        b=eLP2oJYfywXHI1qk+NFMa1OKI8lXHjuXR9WG574PtYvSvvEaRNN6v+9oLqxUtvUJLl
         abWv3lV4pm6eKtS9SrP+tcP4hKbR8BoYZ1wcL+kw2Mr658Qcxwehw74PT1HkGfHoD8XW
         vjcWJaHLqoG59NzUFjYP/mvsaLX9Sv72FqmiA9nFQLVTUsluopnpy8BWkr95+tFjBlsl
         PyXltaoggws4IKZ/cpUbwZ95NXyYQXG0aPlEc3I8WtvoyLBQi0YWpsQ/voYCkjpt6jjq
         GEpYCIRzHVQ/KimPn8FRNFxv8cPYXnkYl5YGqlIByKPWzZUIsvmleXw+1iNWPbZSIU6E
         M+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497300; x=1779102100;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rjt+1DL2EWHMJuGEpz6QP7+XUe0cPp+JGhcItYkEqBo=;
        b=FjFLUEIWZydhTL6aOd674UbEOqbH9iqNfDA4aiD86Bw8bCJlYgSPBIDgnovfdAP1O9
         dyEFaRV+Vx3lf5S6hWP8ntMaAY8FTKplbp5voSZj7cNYm/eSgbxu2GBXPDVLt9xllQCO
         x7wpowDxKDfoDd/QGdjUMlqsiDb2mLCYfrcdoEZm+T8KXuaSXiYZJ9NxzpheXmhuReve
         /nUKvj5oee8UCzzvxj6mJSLFGgG8UEDrVfE9UmVRmZ47OxByJwT13t2S7EiDCiEC8tN9
         9KK9NTmjgo+ut74ixEpIIfpKIwlmBsoFiFWBJRVndK8RbTuKdLdXPOqNf/GvN/N3nFEs
         ewTg==
X-Forwarded-Encrypted: i=1; AFNElJ9pK4DE7W728NQw9WqJbxA0xHMprFWC73gPkVaHDXpUvsCVaubNs/1tRhl00WwgMai5QYKIVKttZhfA@vger.kernel.org
X-Gm-Message-State: AOJu0YyxRyw/W7xB/n/e3rPU6iabDrDNqcTAymXZaRdhcd25W2CnQOAC
	oAwfneMKqbIqwD+sUu9hEG3TOeaHZhwxQ8B4lVi1tRS2dwibkP8k43OrHcB8D/1C2pPo0DtPlH9
	Vj/XBOVtfxdfw278dI1p/yh0CVXZNb0Q+pxbV8vqYxWeHNQ4WqA8oM7V/WgbTP2kk
X-Gm-Gg: Acq92OGmao1jP0CQD/F0ddz0vQ0d5qSri3K6pxUMockUg3xRRA2M92PVwoVPQIy03gK
	FiF3zrNrbX8m2AeBg+i1Vg+DBamUDrvtQnG5FrPqAd6DqQQWuftGLv+F8NkTYRuIsq4fdwB101I
	k8FiBlnqFrYUCgRFy9iiIL+xWU3yVKjLPuX97p7LC0vTD93g3uhTw4gaLboHHGd7UncrMHhgFO5
	p0gj9JUaKA6acwJuSdYb6gBWu5ss31CeIMZTLYU5gHPNRiXfn4AL2XXaf8AzRBVbEidQ7cddjE5
	MYDxDly7gFbtOiCwWH6/uSZ9HzaMYzfKUq6iFofXFtHbKR1RJEDw5j0XMladMqdOkka2q+6iZ5Y
	SK1yFtkqHIjDpYVKJgebOSOUlPPHnG9Lb5wpXefkQq6orD2Ttw7CCH0+EyvUNdw5JmFav2Q9Mf9
	RXaJ5x7NEkMH40BbknYyHNTkkBH3GI2Mlh7ppSe36V+y10k2ok1QwU3+eyRDPOMSRtbBc=
X-Received: by 2002:a17:902:d60d:b0:2b0:bed1:46f7 with SMTP id d9443c01a7336-2bc7ac7e1f1mr95667285ad.37.1778497300010;
        Mon, 11 May 2026 04:01:40 -0700 (PDT)
X-Received: by 2002:a17:902:d60d:b0:2b0:bed1:46f7 with SMTP id d9443c01a7336-2bc7ac7e1f1mr95666645ad.37.1778497299359;
        Mon, 11 May 2026 04:01:39 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ec232esm104238435ad.81.2026.05.11.04.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:01:38 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 11 May 2026 16:31:34 +0530
Subject: [PATCH] arm64: dts: qcom: ipq5210: add the download mode support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-ipq5210_dload_support-v1-1-5609c6b8330e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAA23AWoC/2WN3YrCMBBGX6Xk2kAm2UbbV1mkZDITdxZta5KKI
 L679Qf2Yi8PfN85N1U4CxfVNzeV+SJFpnEF2DQq/oTxwFpoZWWN9aYF0DKfWwtmoOMUaCjLPE+
 56i/nPHXebpFRrd85c5Lry/u9f3NZ8Jdjfco+i8znZQ3W9+yv1zf/ajWWPKCMJONBt4GTIcuBY
 +gv8LRhKKzjdDpJ7RvudmQhwtagASJOzvtkrENMMXl00JouhZ1T+/v9Aeof+EoBAQAA
X-Change-ID: 20260511-ipq5210_dload_support-4336d9627beb
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778497295; l=1328;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=YNwSIpFm08EBvtqIqMQOfYYN54m3ct/e/7rhe0o7l6c=;
 b=RAL8HuuXK98PDkLCK6tZO7K9uyOfCPqsL3gbjquPZEylSX5frOaeB58V/+N0WbQXQQoXhguNW
 2G0az6enMTMDrRWy9heSHJQ4SAAOboN7sqvUZC6pstelEJzyMO/TCez
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=EaT4hvmC c=1 sm=1 tr=0 ts=6a01b714 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Wwb5wLp0g7qfDHHg2hcA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: -2Q6JafzENtCR-clYbS7DJvK1BYRJ0Vx
X-Proofpoint-ORIG-GUID: -2Q6JafzENtCR-clYbS7DJvK1BYRJ0Vx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEyMiBTYWx0ZWRfX0LI6+32W5egd
 rBSZpVvgw87SJhC+qjeHANuhvqKh7V1PlX2Xcq6t6+sWoCmMPm7QYqgHPM7+Ss0ZAYeNKrClDDC
 O7BB6DI1LrIBYWGWzIHY+ZlakiS9Hzn4hmAge8tN96jZpJT/uxtWU1plGqFacn2O6HEyl9OTkQ/
 KqbyC0An8fZu4TRCpX8s19IozJYvLzUJknmKqvcFYVkHrgQsG5y9v2LS3J7TjUqr22Rm8pdI+4O
 Ji324tvTuDw5kjoE74rgsQhM6diNlIkkg3wBqZJtKe4ZhC0kIPTVeRw4QyAtTLYAmj9RKvNLu8W
 Ul//dQOXU+zYH8H/elKntZPrHrivKPDJByZRcol+jiWWjQ32GCtwdHRn9GIgoWMHvCQWVfCRb58
 9LIxa+0lCJzNBP30S5ZIaG0CzLTOGvusYTXTu8FgkQEvqiYiVIsHKXQNZEHmCdyS5SLB8DzHrST
 mmgYm1c/Y7VbnC2KVAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110122

Enable support for download mode to collect RAM dumps in case
of system crash, facilitating post mortem analysis.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 3761eb03ab24..cd587eef0018 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -75,6 +75,7 @@ optee {
 
 		scm {
 			compatible = "qcom,scm-ipq5210", "qcom,scm";
+			qcom,dload-mode = <&tcsr 0x25100>;
 		};
 	};
 
@@ -160,6 +161,11 @@ tcsr_mutex: hwlock@1905000 {
 			#hwlock-cells = <1>;
 		};
 
+		tcsr: syscon@1937000 {
+			compatible = "qcom,tcsr-ipq5210", "syscon";
+			reg = <0x0 0x01937000 0x0 0x2b000>;
+		};
+
 		qupv3: geniqup@1ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x01ac0000 0x0 0x2000>;

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260511-ipq5210_dload_support-4336d9627beb
prerequisite-change-id: 20260511-ipq5210_tcsr_binding-5aef0d2eaeca:v1
prerequisite-patch-id: 93b818cd4feadea099a037157877d5a033545b53

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

