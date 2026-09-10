Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875304A499B
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047064; cv=none; b=jGXjRDd+tMSkxs0jfPnnf1sEhBoorrg6uhDBEPHh79P/F+qja6YDxmVDuc0KL52Wf3GggCCmFXL18XxybI3a2pYnp4wVE300iQE3KZeWtryLejw1uX2fw3GRon9IhPGP1KYWM9CaIYi+TBEfmvJyZtIW5Aq22c+FmBve7fKODfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047064; c=relaxed/simple;
	bh=5NcRxyQMNC/n9KrCwgmcLq3fNJGbmEydL9lOvw3xjYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EmYyyih9Hb4wgBAvc7pDgjpBYSUeGHI7aDFaCgZUezXDy/8urgE0rCj5b2RIVYtqO3+xGHuVKleJRq3LcdL0GB8RNDEsZNxDsSwVLiXXgKiEoOgGN9gdK+c65gN8sOwC/Oouw9TrY9DpqG7HT7WJ4ABf27D+wQh63xWg2SME+DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eQ8TC7by; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LRT8dUkI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eQ8TC7by";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LRT8dUkI"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7pfL869189
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LQ0u5h36OH/cHv3Jje5GoRuJ74z7xN7D2bFkXserU7I=; b=eQ8TC7bymBH6ccuW
	32J7Lkx2BfEDrI9vJ+7VJFqU1nAckUe/sBvBEEapfokMg3AxirSpKV4qcIQ9rcUA
	bL9ywTX5B1DR9Yum/cvxZ3/hCw/Fm8nQ/qxGV0idzJ4k1ZV9s6gAx3/IK0tw6R+z
	ZkflH423QVAgt1tBe9XlykFQ+Ww6EL5Q2fwNWV/npyDQiite5pj18fCwBnnG1oyL
	bHJVROiOU41AVNkzMb5YsHjftGpYA2M0pdo+L5093WgAmvx9+6913gKyxn/kpqQx
	SSNSHhwrfSNRj4hRml77g7FAEmSuZ+1SQT+rjh2WlM+VraUbSlOmkjaz7TrQM2Fr
	L4vysA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyd40kg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:31:01 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb92868263so6284288a12.2
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047060; x=1789651860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LQ0u5h36OH/cHv3Jje5GoRuJ74z7xN7D2bFkXserU7I=;
        b=LRT8dUkIXK2iIsanLhXGtsRo6HNfIYa+oEPuAy9JGyv7esVLLssMB2vJT2kW5ukWVe
         agThSO6jyxxiCnnDQLoO4Eiflq018FmN4mb6jr99LtcqFWfNBw0LqapOam4R22pgO9Yt
         HnjoSh5DmH4+a1fR3Xiv8BPRWyCUyEvpkK2O8QENE0JYNQra/CR/EMMLM8wcFe1zBW+B
         TVOnhwuEW0dGl3fgfxhloCgQKeY4t9//w6uC9B75km34pehbFathPmZGzgwn+v5QYBV+
         Zt4xMW0/DnNy9V69MBxc7jKz35eQxQaffUADu1RpgQk8Lnh0Wsr/nbxJavxK91ODKX57
         EBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047060; x=1789651860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LQ0u5h36OH/cHv3Jje5GoRuJ74z7xN7D2bFkXserU7I=;
        b=nBiwY+/zNJ5T1RoaVA3n25/NoSAnipGpza/SW4jQgLvw72Vo3Vf41QoaxkoqVv+JoV
         OmJYqqVpUq6/P7SOfynzzjH4/heNRm1l954DR1ACM/230kbzUl7Y6/9Xu5FAPgNcTxxB
         T7t2ZTOi1Oupl6DgLsY3eIn/bPmu3+/gvyvJzbpKPzLYSy3SA8E1nLWF+jfNsR7RBKan
         DXAsY7I5S4Wjbr4aT6qs47ZmxMSvd0DBlMqm9CaVOwSRZ9QQYzxm5Gc8uJJ+RRzfAiQX
         9Lym8A9+EIZiakjadz/3FCqLP5zj+sVDecqCCHvawNnu+WtZOCOpXi9WYCSI7n/nnTVE
         1jjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUO6ms7VpBmCnzNeHSSyeLqOWp/1b29aW3Q2Tq3crexi3tWB4quwxnWr1s4XAMK0Ykc79FWPG0MAv0@vger.kernel.org
X-Gm-Message-State: AFuF++nenLFy1Xywl+8Qakd2fXZG6pVyIgW8m4JmzyKcRG77Up/93tNe
	zhQyVgHfAp7+6bUizn7VS0iQv7mU8C7MWpSYEbaOt3LUrlDECieW9033SSNjGgE46nDQJko5ZV3
	Q1y1O3CFI7GV+330ZFMJcHw0JSwqynkZgq12+NdGc+NezUXNKVkWZjUkRGN8nhq2k
X-Gm-Gg: AYBFou2LKnuScXG111rSXMr0LNudU68A8x+x4J4k+SbmzKZxHw+fmGQXKu6dO6+bzlS
	r6FwVXEUudqwdqN5078y4JL3y8h6GAjxUP5zp6Kn7mj1WrYxgC2x9jRG8lkt03vlw7RqDkG5UGA
	hkC7Fl7aa1hvpQCuNmMviQhMPJ5bap9PpY75NpfZlmEGu3ZtfWxB3UdTahmBdphBZ5SuqIKpjEA
	cRk0vFw5j/C/jdlaCQUcdjKDFdx6nKYu0Ivl6SCXiDV2bwlmlk75GZSxSOa9W0x7NTjCVpeegLg
	TpPRNR42IWEUo3Z435GD0tinoFjMMWl3G+gymFqAfs7njwh0PH1TDnquxPEqURh4SI3kdw6PTZl
	HTyP0n7QiRCY2EKoLrCPO19zbt4iNwmEISqc=
X-Received: by 2002:a17:90b:5485:b0:398:9be6:f999 with SMTP id 98e67ed59e1d1-39d70c2f16emr11793982a91.24.1789047059991;
        Thu, 10 Sep 2026 06:30:59 -0700 (PDT)
X-Received: by 2002:a17:90b:5485:b0:398:9be6:f999 with SMTP id 98e67ed59e1d1-39d70c2f16emr11793885a91.24.1789047059498;
        Thu, 10 Sep 2026 06:30:59 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:30:59 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:15 +0530
Subject: [PATCH 26/34] arm64: dts: qcom: sm8150: Move PCIe phy and GPIOs to
 root port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-26-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=2177;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=5NcRxyQMNC/n9KrCwgmcLq3fNJGbmEydL9lOvw3xjYs=;
 b=//GVFcJqTez42D1SmXL9sZnfMNny9/xBtM43OIfHsEDALOA+4PoPPbJQXQnxcVIp8Pw7DA548
 W1Fih0xkxV1B7Tp8zjCLaEdOWD45fEhT392B3OKZ5E7yp3sZV/KCU4T
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: s-x_61phWfHWQS14xkYP4cbdgk_frzNy
X-Authority-Analysis: v=2.4 cv=ef+o7LEH c=1 sm=1 tr=0 ts=6aa2b115 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=bvY3E1ByFFb03tV5gjAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: s-x_61phWfHWQS14xkYP4cbdgk_frzNy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX9rKEEykLrTbx
 qj0mWXXm+8ibisJ/82a/ILR6hSUdiwFCyauIDCHgoNbQEOd/SqoO82Et8z8I/etsQ8cQPTBMr63
 gzRhjRsb7bI7a0yH+CzvhyvS2/zMxzU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX9PWmb1/5k4/+
 9WEM5eQKbFAeN77jRQm27JBLo3jga3f5gYYFkzKzJHnwsydxsi8h53zMKLtYGYkjUnsUra/lSbO
 VsfsWiC/9XWmgapa9VKetGTubEGT1IGm+9IXAIo7fU1t1ohICszzQDSSZRGHPmn6cvwNlO0v+ke
 SoU84jEHoGWEL1xW7dYDbCqftTAezB4l10u+zknhnthlMU4qsVuGV0LbMTQ/V7RQpk/IjKTzd4z
 Lc1Kq2HOjEWezY/LQc1LMVIe0Yh+tRDOEh1KP6zrmOc7BSI9u6+wzyKy4cE4TaqPznG+vwdlIeU
 d3GJE/EIztSkQqXSq4yCos8NptxWUspKRJwF/5rJb6Bn2oNuE/m2yuDqCCZmwT2yrI3yqyO4V8R
 Tt4turzmNc13crT3jGoRfM8QBJrcDX+j2VT5vhdAMR0SAmimBmHu1Z1mMkApN01Csk+Iwo3kAZw
 Bpl4El4gv/2uE8q0mMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100161

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
from the controller to pcie0_port0 and pcie1_port0, adding labels to
these nodes to allow board-level overrides, and renaming perst-gpios
to reset-gpios to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 74df5cd86f04..d75f71463287 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1901,22 +1901,20 @@ pcie0: pcie@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
-			perst-gpios = <&tlmm 35 GPIO_ACTIVE_HIGH>;
-			wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie0_phy>;
+				reset-gpios = <&tlmm 35 GPIO_ACTIVE_HIGH>;
+				wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -2019,10 +2017,6 @@ pcie1: pcie@1c08000 {
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
-			perst-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
 			enable-gpio = <&tlmm 104 GPIO_ACTIVE_HIGH>;
 
 			pinctrl-names = "default";
@@ -2030,11 +2024,14 @@ pcie1: pcie@1c08000 {
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie1_phy>;
+				reset-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

