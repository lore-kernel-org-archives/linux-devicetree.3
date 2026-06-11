Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E950F3876B3
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154044; cv=none; b=ce/RVHjhT+Q1Y8njD5u3sEu36SMpnaOkdB1uvk+WPSw9SQpWD0a6qkpTYBjdiIkDbREPgl1KA76PdPjCxweYMsOS1StYiT/l5ej6LnRXg7+d1NRxCDg3L+YwwFsTXqnMm9UVZ1hNtss9XTHh/ehTF13FO2LJp1mI5fK1ByryYiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154044; c=relaxed/simple;
	bh=qulQeLlsdi2L9cgTVMM2ifRrI3vP1mJxG3+XGafHl1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ajKXxY0bvVgg8t7CAVj4Be9qtzGr4tjV6z3QMoSOcnjIw6xF0Vu+vuHkJLwfW95sqs5II9T/ryrcx7UZYAP4XYEhkJYOEsxUaNdWdxxXkJ2hGTQXKjveELe71ccoaERtipVjDVED30t3gcoFUjID3PQs9B+CdLn8C9nNxfQofUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YVFd+f0p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V2ML73kg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YVFd+f0p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V2ML73kg"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NT2x3183675
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yG71hJdidD01pZim8qt5eu3WDh8+/Nc00tfgnxfvMhI=; b=YVFd+f0pa/xVpfs6
	MCaLefhgK7vNkoDYqjWnY0kWHicpKXUKDQ4f92mhJii0cfnZG+4ZQ73bjm+W0hxk
	jAY8mOqy5clrU8PItrlvXkfqz/p/0/XzLCX0S+YqjHz2kaiCZNIxzIXbDmS8F4tV
	2FFAlb8sKFifd4Y0XYiB8CIo5Ww5bCFAlx+w0XtHMesckN3gpAFj4mMhHb9I0QNs
	Qu2CKWzUOVQFsgO7h3SEOzWWQp3zWAzJmgZKX+Pg0ya6cJDZKQX3kqSjApHiw+vp
	uicKL5nCK+kaql6eVcfAaiqs0d1TqcwTZt3EvjAcWRvkKrq9/p7qpYOuH1eNY/At
	7ydDSQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u1np7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf32259e0eso99135565ad.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 22:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154031; x=1781758831; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yG71hJdidD01pZim8qt5eu3WDh8+/Nc00tfgnxfvMhI=;
        b=V2ML73kgMZvTfIQljstgyBhP7kY6ZTfDS8s9KAIf2cXLq4IB5iU40JCxSR2X/O4zrg
         23nyGw+Quif2A2mxM+odd/shzw2JJj0o40KDJol6JmGTpH11KKkNPPxhe1LOs7M5tbPn
         KOxwzTgB/wVdaWKLdNvSZ5PLiXv7Q9mo8KHx5NEdjZtLJ8Vd9qCRq0O3eLyLvkWn5aFT
         6EcJRtew/olxJcAqsRjzlnknNuFWQi+1jUu47YzgxKevHPFxu1A6/l3Dlimj76NKigH3
         OaQfglHD9PUxd96PBx1c8Yl5T8Y3DKKiy1J5R1s0ZIO2bA6MfP/a3ARzBAYT70d4IwjN
         DZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154031; x=1781758831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yG71hJdidD01pZim8qt5eu3WDh8+/Nc00tfgnxfvMhI=;
        b=kNo8X57FkjQLfG+wwISHL1P88pRb2SwRJO019Nw9oJMjffv3ty62yk8PLNLjGqKpp4
         44v6lxJfL4Qm2w2P9w7nQeTqAt3KovnokBq0nwOQy/ns+ivh9Uam9DX8EnL2Xs7hfBss
         uzq4AqvdcZZ/S3kQROqqgfPybJznya9gJxROq9qmvcI5svLsYBx1ufBavydug9sDGx2i
         C92glWWuY7fpJHPOBoVPqBPygXm49qK/J9l6/Lsh4oSPNEbZOPsL7yyf5DUS8siasljS
         z4hHCPtcaMjTR6H1IDeiLuuDxLYCwICuSgDBatzHp0W0b5syYe/X6ac1SAWbdZHHdK47
         VMBw==
X-Forwarded-Encrypted: i=1; AFNElJ90FSJZP7EasBtwfgAj0QAQHuhXy21DRpLMKdXuqafoz4OxccJ7xwQonZK+L2VZHgnZV80S6nbUyI2r@vger.kernel.org
X-Gm-Message-State: AOJu0YysVt3PQKaimQFZWMT92ZhDwu/pNBz7opjVDRnjnoZvuPdfFaf1
	4DWSLs5EJkq3KSI5EVXbQBFwVv1aZZ+ZxWHd3hyvaK+w+2kIHjpnneaCkUfjvlbSmasW3XzcwyB
	kS2ebC3YujkwWlaNoE0ZMoZVREPTHKD3bj6bahJUqpXpy9goL9Kp9rCqnklHpa1iA
X-Gm-Gg: Acq92OHoeREvGJ0ikjvF9Tw4e4IfpD+3iEPPe9nfMhDec6OZKY+7S5lBamD4/nGBO9g
	mavfzGZZraWaxTmRfpidL3cA+KR2uU7IYx3k4W/kvDtCy5PGfypWrsM0AfW4P4PDF+eMXunVcsc
	DzikNVj/HpzZThWgFpJU1kROPXZoxoU2A2PaA51x7EVQius9FDrm70uclgCpqrv9quHHE2K/kyp
	B7e3USA+5d+sUKolwC/ueGHSrkOyrfWjY20JMBWUtfq6oWl6pPxnwMN1i6Py6GICFaHvWJX+QoW
	FV11t/Rz2ttE43e0XfPDlLos6iCasgOS0epd4AWvImhXZ4FGD2dHK0f4HpoX/y7btUdT6j63aUp
	heHwI1JGaoewO80m6g/rNCrZcQe8lLInwm9YGZaoNK74czh4oHduR+kzPdR9ZtHnBxTU=
X-Received: by 2002:a17:902:ef45:b0:2c1:1aa7:b17e with SMTP id d9443c01a7336-2c2f2e5f6b4mr14526065ad.30.1781154031453;
        Wed, 10 Jun 2026 22:00:31 -0700 (PDT)
X-Received: by 2002:a17:902:ef45:b0:2c1:1aa7:b17e with SMTP id d9443c01a7336-2c2f2e5f6b4mr14520455ad.30.1781154026234;
        Wed, 10 Jun 2026 22:00:26 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:00:25 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:59 +0530
Subject: [PATCH v2 23/37] arm64: dts: qcom: sa8295p: Move PCIe GPIOs to
 root port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-23-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=2675;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=qulQeLlsdi2L9cgTVMM2ifRrI3vP1mJxG3+XGafHl1w=;
 b=fBV3GiKdV0a55h3xYCW72AeLyAejpU53bs/YkWn2envrhuGiuJc6r1LN9FjEoUwz4OjMm1J+S
 FjRgoLHfGLADmHvyniTOzBlM1yh0JQiI0qdZpodlQOZ1wLeVZQIzQdR
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: L28T2Fhfk8miTUsgAqQFE7AuMM8xaOkE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfXzRV3TaxQE6D6
 gPkbrDIIVRXzrSCj1Ki+tQ5sM6rUQtxcClmIPXHAcMupiwJSw/E0taA1a69wTYCKBzEcdfaGOSD
 PPJRMAhDFSL4gc8+q7+D9ZGIQMxIKcc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfXyodGUFMPNZ0s
 FHCkbiKFR64sJD6gXWQkRXnczjU7caC1Jeij4RGCfaaO2VL5XvPlt7FvZnxtF5izvSdN3bN/gEf
 uJZfCjeUAOkvpMKlft/qzqTt/JdkCr0c0biMHhMte5Y5AzJffDMp8/PBeV0278t8OjSvkNQlJZE
 wWSjLe+RGVwNJN50rhyhAKseqp8PrMECLyrWvvjyE2M3pbU/Z4IXIBtO2t8KknI/Q8xxCNkIKZJ
 hocoITFzccP+qqeFZ+MvuXI35U1F+iGfDBeRPi1QO813gcqguOK3A2eZfFYCzT5P84T+RvfmFXt
 fuCNNI+5nkYGGGrKBedWzkIdPPUVnlmcsaTsmnw3gzky+ghktQrlEmzG1bVpQo/0NE/tQIcKPq8
 UAqlyLIMCICwREDRHF+um2PHp10dlgKWUzVm2XuK74Gub4JbQiPzKLARwGqOrubCmFpvsIke7Z6
 F5UZKoK5yu/Tcpng5ow==
X-Authority-Analysis: v=2.4 cv=F5lnsKhN c=1 sm=1 tr=0 ts=6a2a40f0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=xzbAzJKGZiqbpjPgTfkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: L28T2Fhfk8miTUsgAqQFE7AuMM8xaOkE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046

The perst/wake GPIO properties are per root port and belong in the
root port node, not in the RC controller node. Move perst-gpios/
wake-gpios from the &pcie2a, &pcie3a, &pcie3b, and &pcie4 controller
overrides to the respective &pcie2a_port0, &pcie3a_port0,
&pcie3b_port0, and &pcie4_port0 nodes, renaming perst-gpios to
reset-gpios to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
index d28d69162427..512de3597581 100644
--- a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
@@ -453,15 +453,17 @@ &mdss1_dp3_phy {
 };
 
 &pcie2a {
-	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2a_default>;
 
 	status = "okay";
 };
 
+&pcie2a_port0 {
+	reset-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
+};
+
 &pcie2a_phy {
 	vdda-phy-supply = <&vreg_l11a>;
 	vdda-pll-supply = <&vreg_l3a>;
@@ -472,15 +474,17 @@ &pcie2a_phy {
 &pcie3a {
 	num-lanes = <2>;
 
-	perst-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 56 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie3a_default>;
 
 	status = "okay";
 };
 
+&pcie3a_port0 {
+	reset-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 56 GPIO_ACTIVE_LOW>;
+};
+
 &pcie3a_phy {
 	vdda-phy-supply = <&vreg_l11a>;
 	vdda-pll-supply = <&vreg_l3a>;
@@ -489,15 +493,17 @@ &pcie3a_phy {
 };
 
 &pcie3b {
-	perst-gpios = <&tlmm 153 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 130 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie3b_default>;
 
 	status = "okay";
 };
 
+&pcie3b_port0 {
+	reset-gpios = <&tlmm 153 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 130 GPIO_ACTIVE_LOW>;
+};
+
 &pcie3b_phy {
 	vdda-phy-supply = <&vreg_l11a>;
 	vdda-pll-supply = <&vreg_l3a>;
@@ -506,15 +512,17 @@ &pcie3b_phy {
 };
 
 &pcie4 {
-	perst-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie4_default>;
 
 	status = "okay";
 };
 
+&pcie4_port0 {
+	reset-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
+};
+
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l11a>;
 	vdda-pll-supply = <&vreg_l3a>;

-- 
2.34.1

