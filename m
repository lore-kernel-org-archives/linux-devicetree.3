Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A314A204B
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047041; cv=none; b=mXYFYUeYduVCkQBUpVJdxqjjlt1iXacEcWwkdCkm0df12dLqK8z0Jvm4TJc6L5DDjdSitPMD+djsC8+jliGcmxcwOp/1hy83lP3z/5P9SdLd9YIVRFAuupaC5dzzFajaKcRq5CYQq0jp6fKFnY/fCwkgK4u++j+Rq/aRNnP8RuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047041; c=relaxed/simple;
	bh=8m8oDVp4ME+DQ6ixjSPY+Z2pZIlSEBVd6fCv5YKhCT8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YlxAZDI1yTIqSfZfu7eDw+ezhuusjWsnMm8ilCdzMe9CDink933/k3fOBn/PflmFpeUqgwQGtUG3h/AvdS2QA1gOkg0EKnKzhmr/97OsYi8idjeCznonsoAOC6oQxn3wCN+VBz06se+Z8fezQgpabd8inYkpeYMvDM0CGy7RB/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dhggUduX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OLsKd/KH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dhggUduX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OLsKd/KH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7X2b215981
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MrwRG8wRbUEcQ2VNpdUktqMkDeFTUSahcchNIS/G6As=; b=dhggUduXrOuqT61Q
	EYWtykJxrOAppd59DEKSmUj9FzRwVuACmqoikFCyAK81uihiW8WfmNn9adsu55XP
	noV7K8gB4f9KAdbcj1ZP4xBUmrV/3YT4njjStzEXOaJHpWr1YouL0nOzIssDBGOu
	JmHyszWLdOYESw3KhFFm9hObbAoqzob8BrDfWDMT/I0Jr3qgewEvapTP9Cv1Otab
	/muZfTDy0WGghGTZu7+V3GXvEcu654CyjDXRGhGp5WJAPxup+1NpGC4F01mnYTGf
	44CMBu/9TQKOqGcIZ8MRPfP170JMOxdbDyL/qpRt5gv/rYzWU7djvb3SW8a3BHhj
	NY5sUA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrdn99t2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:30:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso1232847a91.0
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047039; x=1789651839; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MrwRG8wRbUEcQ2VNpdUktqMkDeFTUSahcchNIS/G6As=;
        b=OLsKd/KHMsPlbC6mWTZ8hm6rgSsmHOPa+94oaxBEiU9THwoNJm0SwO3dXZNQZk5oq9
         KOVBlemTgwkW+c3JPojfIMin7sVEp5KYdQKJo6NjQ1Fwj7mx4upOhfvYsgPjUQ/xCJyq
         Kvsqhyb1xhdmuOz9Vll8/TT7d+vJNUAt1KZzPLqwOmYcdXNl2hSTnD5vVwfFff0oXLsx
         X6zqmrV7O94Ep+b6e9v1Iy3ZVO3Uj/8oIrJD3TEZrP4CFGsW27dfFppcuH54RRqi1e+X
         CvXF9ondK47pCItpgagBiqOxgPmqcyuIDrauUInt1F2HUXJxsSVBKSUx08wWpp7od0CP
         WFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047039; x=1789651839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MrwRG8wRbUEcQ2VNpdUktqMkDeFTUSahcchNIS/G6As=;
        b=PCoBGw6EdzBxcugSCGw2c73SyJlSSWsgFY9a9El+5H78wHSzjOU3OwQcPaHuUVHzLM
         Hit38F+cHaeHx2a2x+tspDJdBDca6SKPGSF3ug8v9I2CnX4YwAWPh3gOCWpQueOEDCmX
         +i742eN7Wknm0QYA7shIom+5lwo1hGkLrM8W+dPTZj1NNvX3PzpPG6oNd3H1VDIk0zBj
         foV5uad0BoWxYDcQwrzM4lxHgLzCG2tEEJrALimbbD78Ay6r7fWpSUHCB3jKesOFhSrJ
         BYChgCZ2FqmmS9N7SGr9Wg3P4eJwBhtPpxT+LvAlJWCJe7IuXvuuEhdHtd77prCDZzE2
         m3MA==
X-Forwarded-Encrypted: i=1; AKwUvBwUq9VwqvV+2zpFk8tDDyUyuKBf7W9VcXIY8L99rUTBFly9nxhyMbITZFn7RtuqyM89QpmSwaB0kOXf@vger.kernel.org
X-Gm-Message-State: AFuF++mIPGwp2T6ou7j+sQJPe0tj7baxwonn5QzvFuEFajK6ORu5mK2u
	R32F6Lr9kPAXtnNVCOIVUKuXgCbjl0zpk+WmqfRHQp0mhNjKyl0RSDn0fSZIO6n6ywXSW6Os2fR
	VA78bjwHHmYKdpM1bBMnz8ckf43LEV+MIMXZxaxAEUS7f6jxhc+4mKgEJ7fIa72FQ
X-Gm-Gg: AYBFou0Ra5pKgN2yCc/YoxfOe9+DCQ1HKu+LKcb2JE/03LKbCGLcbHlmIPeYBF2tHDL
	GIbCjLEftyuDwRIc4GkshYAe8Ngl27TxmItNjEf5w01i4w8NFB1yG6/EVaDlcGodbzhVxuK/6Bg
	igubYUJG71FOkkM6qdyyHOqtteRKwG0WkqIZ2Tt3EZk26HAcn8SsBF/dT8hZcNSIMXnFl1QEsTL
	gyQdzA1UOE6Em4tVb1F9FsOsjU/8AS4NbiXt2z1ZEyxLJzJms0kPeO6gVXVfb+D+z1fTs1Z5Wuh
	fkbySNSc2Idv3vpWihZB+PG0USrCK8fTPOeuge1PFd01vNmbQVWlyQZRExnLJ7uIdI3W9gVAYLG
	LIkNM4rJJ0EMfmu5LoRMokx0+k3MGSyQkzH8=
X-Received: by 2002:a17:90b:2d0b:b0:380:8bb9:aba9 with SMTP id 98e67ed59e1d1-39d77914f7emr5807661a91.3.1789047038682;
        Thu, 10 Sep 2026 06:30:38 -0700 (PDT)
X-Received: by 2002:a17:90b:2d0b:b0:380:8bb9:aba9 with SMTP id 98e67ed59e1d1-39d77914f7emr5807613a91.3.1789047038074;
        Thu, 10 Sep 2026 06:30:38 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:30:37 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:10 +0530
Subject: [PATCH 21/34] arm64: dts: qcom: msm8998: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-21-90a252ddbbfa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=1534;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=8m8oDVp4ME+DQ6ixjSPY+Z2pZIlSEBVd6fCv5YKhCT8=;
 b=NPN4FXoAkAitrK1GlczUgFD1S354IFzABZijwGlt9zgWYBaFCqb+ntMYu/pcW+tURPW1qoWse
 1fUEYjSlhRvBSsURB8/mTsUR82L2aK9Ux0jtXa/OoOdgirv4EKjsPYh
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfXyj/uADhn2OIW
 weoASZXAzIhwm7ezSO6OGjiq1RlMhgOJNREdfKdIWCQKoSjP0u1MPUGiS4wqSM/EK2kzZ6NMUt1
 5RynXasgjIr1KL/lKu7hcGNdDcgPWdYvniputypKZAKfzYsUbMg6ZT7pzJKUTNPJECLdo3sH3lJ
 NshDxkivVAOTd1rjDz0V8mHZSIYFTZzyCvFkxIr3rGMK3IwDRPCpMQXPSeuCsga1e+/Yz9yG4C8
 0mzNYXlkAgW+f6dL0zhx1DxeDzyQhzc7k22lqIWCoVogkxvZUvvbdQ34+EPaciLYMWOOVWEmzok
 gK6jX9W5PFcke58z2fK06I33WNIX3hPNWcMgyvB5/uLB5sJz8JQzGSLMmtlgMmvVBCIsdcbVGdx
 aBC5wDL0/j74NCJpMdH5q5za7mH0Z7ilMtgdhCCd0ulvMZ6QdBm4XgN3xdMpzuJFKzs01dFtHI4
 wqqxCgyuYYQGb2zmPww==
X-Proofpoint-GUID: P5vVFg2C_45efCM-f6nD7pmz2PH51Aho
X-Proofpoint-ORIG-GUID: P5vVFg2C_45efCM-f6nD7pmz2PH51Aho
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfXyhGH8VnsoO9V
 yhg827veZHdHUGqMqnF8zqc/YbLqsjA28+QUKOF53LyJJBHaZXrD+7LkKY2DyRNyoRHUOFuArqs
 Ck9VH1mcpUTsF9L3ZzvNuuFGDbqDxaY=
X-Authority-Analysis: v=2.4 cv=eOmGH3p1 c=1 sm=1 tr=0 ts=6aa2b0ff cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100161

The PCIe phy reference and the perst GPIO property are per root port
and belong in the root port node (pcie@0), not in the RC controller
node. Move phys, phy-names, and perst-gpios from the controller to
pcie0_port0, adding a label to this node to allow board-level
overrides, and renaming perst-gpios to reset-gpios to match the
binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 5038d0009c1a..0782ee1cde05 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -928,8 +928,6 @@ pcie0: pcie@1c00000 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 			num-lanes = <1>;
-			phys = <&pcie_phy>;
-			phy-names = "pciephy";
 			status = "disabled";
 
 			ranges = <0x01000000 0x0 0x00000000 0x1b200000 0x0 0x100000>,
@@ -969,13 +967,15 @@ pcie0: pcie@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 			iommu-map = <0x100 &anoc1_smmu 0x1480 1>;
-			perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie_phy>;
+				reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

