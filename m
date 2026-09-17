Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BA84F30EF
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647979; cv=none; b=hpoWyIviVR5f7hpGsb4l2pPdlGeDgHOvq2KsAdKlgozzGGGP1MI5pyptiEpW91ZGSElYz/nfVIf4bZTJVOmAzCx8gSw/wO+zmkJthEF3ef4xmm882l7ejVeLg6J2EndVzH9bbK+1svlMehtGqRAYzkl/Z/BAPflBkoIxL09VKYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647979; c=relaxed/simple;
	bh=0kqpkWCX+McU4OWemDEHRra8kpIDnPy9O0dOQBiEauU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZpuwBrsq8Xo+0lDmQxaSR+Tjln8R7bZnvwC0+Ikc+02sAnMxz8vX3HRwqNQi4DneYduwrrgUcD491MkP31tWrMZNMsaVbg+PkVk2z2gc2LUM5xyLNrOUEvfOFITSzacT9YequWQg7ZHzhsrFHlbKoVT0St1htHP4+NM9sGn6D2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ajVr06jp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UB4sZ59v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ajVr06jp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UB4sZ59v"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HC0Ltd1853588
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dQ5WgPyMo+VGRWpxH+/dMYkefXTeQ1YRnMZn7FbpR7o=; b=ajVr06jpJTzbjBRx
	0LcsHc+lZ96TfHK7dEFhQVlpFFN+8CFnx9Kz/FqKkZcjvpA8TFHrr7UWIXrCzE4d
	wUBJEu+B+/Xs5/USxpFJfM285HIS4imq2KEqlEo1ZSJxQU6bFrIM3h16C3bN2t0Y
	LIeBERsob+7jkkzFmSk7xRf4hqWqpsuVsJaYfH+o+WDk2zhjGy49M59jXxWPW30n
	MxBX5VToPWits+Y76WClnIAp+cb+XGnhsJHWgmQO1u8VEfR2Q2X16kileD1eNB5/
	oxisJc2Rq0h3fE27ubD58ju0dbWxVdVUukMh6C4OgT6/7aOt1PH84U2fq+OEW54U
	Gq/a4Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfu403fc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:26:08 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb48f41343aso698091a12.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 05:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789647968; x=1790252768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dQ5WgPyMo+VGRWpxH+/dMYkefXTeQ1YRnMZn7FbpR7o=;
        b=UB4sZ59vwH54s2vjz820twfaeO0UAfuaXYnGWdpOAVahmLCidwyOiJ6Irx9TXK/waC
         hZ0hKe//9ZN6ZpUcUKntJGUdwhVlAMahRh1RNMuaNtUEvQ2dsGIzp7KYpJFF/ClX/KRa
         5nZvP61VgJoC166TIMf/cjBgBfG7t5m6QKZoBaCr86M3ZclhZOlfpSpsj3o1Bg3iduFN
         FovreRoR51GaWx1tUfQ++HzZch0N0wojWwkumTbFxxLcfA3YD50g03zTunYGrtM4LivH
         pbUrwQeYHlPT6KF4HTIJZ+GuJboEaI3KZOkRFm0t1QOBr9+hf+vKJyaQmMuELxjbjICh
         OqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647968; x=1790252768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dQ5WgPyMo+VGRWpxH+/dMYkefXTeQ1YRnMZn7FbpR7o=;
        b=ggNeLd7fuBJre6FjzRmekr4HI0XJHmwAXeC+X2ZVioCVfIfziVjaYTsyW9xLC76o8z
         F/55QaaTFFzk38bCpHFlhT8SUXuEQsss3doRJ8qf01D/FIfT8IsnbNgxaGvX+g2AYq+X
         7k75Ng/WkpYwU27Wpe6fZ4yiqRd9yK1qlw5Ahb3dFtMTGHfdgBdPhO79VA8fnVXo5/Cp
         uAQlt3NP4Tkcnupf1Ehcal38ZIn7wXFKwBWSZ4tbKXwljyvIwHh9UKupuN2gCYmHoACi
         TgyBGlS4Wgng3211pmKH483fUiv4mjDJMI+P9Sf+89q0smahr+IHxHGvHEJpzCWXxjO8
         gOhA==
X-Forwarded-Encrypted: i=1; AKwUvBxTixckoqF1W7E0GykW3rRsO50fUrAiGCjBgA30e3llG2by7DHGPCiCHSfhkSZcwx4mvMXb/kQB4k6H@vger.kernel.org
X-Gm-Message-State: AFuF++mDuRcdNn770Yr0jzyiL7O44uEni/Oa4k4y/Z/JGV80CjiVtvfU
	jKz0+6Si5DdYnLJD5DKfgv6YS7UcpftHdmd5aPDD9VUG+6VPJzUkGBx1IEac3DngYwa4z4Ujto1
	TomyxCv7HV+BYlLqANS7i4ZpwaOpjIYNAsh5cea7VUjiMbEVu5fvyvFA5Iq6eqORT
X-Gm-Gg: AYBFou3sUPpAud5KPRe/QDO4kvOilYf91+Ycm+XmY/8b6fGNs07ZUh9ZmE9WjsHVI0Y
	u19YJCbwR3OA4Hv+vkyWcn94yZmaereCusQZY1LnTXCKn2FXWxvO59VQjjp6vOky6tWovWbNkMN
	N2x+3E+TOgOGURscgAwnWXtBnuGG2MdaTjESJB0zV9GycQ34nCTyvZgQDlqKh/R/k+Wt85QUuJO
	LxR10M2XDQhOaJRpjgEjSlfc51A3dxq/r6k8eXmI+gMshTDROlCD5RTE4jy3ZMX76vmQ7HbIw3I
	expvybAunMRASFukCMXL519Yv9RpxXC9MsTyG/8XigZIZaW7Q/0c9k6Yr72FQn5OuHH0JpQPAll
	24asV6w1pvjgCvnQqnTnQXU1FU7xOwTJ70Bg=
X-Received: by 2002:a17:90b:3b52:b0:39e:fe9:c5b8 with SMTP id 98e67ed59e1d1-39e35df66f8mr5234939a91.10.1789647967584;
        Thu, 17 Sep 2026 05:26:07 -0700 (PDT)
X-Received: by 2002:a17:90b:3b52:b0:39e:fe9:c5b8 with SMTP id 98e67ed59e1d1-39e35df66f8mr5234918a91.10.1789647967131;
        Thu, 17 Sep 2026 05:26:07 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a175sm16380968eec.9.2026.09.17.05.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:26:06 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:55:23 +0530
Subject: [PATCH v2 09/15] arm64: dts: qcom: sm8350: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port_v2-v2-9-6272b7caae9a@oss.qualcomm.com>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789647930; l=2866;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=0kqpkWCX+McU4OWemDEHRra8kpIDnPy9O0dOQBiEauU=;
 b=Fc1L53BnTTwQUkah3tqgEH4J4g9gSGNvEPULuIeOYH95PREHPBfCe5YmGuWMWxNC4C32Crc6H
 h5OmoaAqdsZCVBmCEg/bhif24Hr8nEnZVfruF4maDEmN+bbx8OQm9KN
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: WR8nv08fCGNnosFCp4Brz9LexLmaH7B0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX0eru426O6MVJ
 YvmERF4Xwsv/4uwjqQG4Yd2swYYuHNwRMlvEA3oDSffkDEYt/tEN0/DsBnkMm8r06lCCJB35yLa
 LqMCTeVmvqy4td4mfdPOZLTk9MIm/yo=
X-Proofpoint-ORIG-GUID: WR8nv08fCGNnosFCp4Brz9LexLmaH7B0
X-Authority-Analysis: v=2.4 cv=LbipeTfi c=1 sm=1 tr=0 ts=6aabdc60 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=bvY3E1ByFFb03tV5gjAA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfXwK18yn7ITw5i
 8yKE74VPrRSd8OjZzNXojiLZInmd0srePFgAQPdr1uIA6VoiK18OI0C5ZzcpRoppZDj9pBjXOSH
 /Ma93yvCwkUUz421AbofTai0Pwa4XkWv59/8+TIenfWZRpuUeKVr5x3Lei6ErS2HR0bDH+9+fB5
 bLIp15LM92Ie2oA+yUfcnuxGLCrZYf8rklePfX+DCHhda6v8zMXRQ3p9AfbqX4HW81SEIfxUaAq
 YTTEBwPHRUmy4CZ5lQcvCSHLqTGs26Vleugpafvgb++XHGcRYvK7WhQC0cF8GYZ/nQtQCBacq5P
 0UIDiWEztd4JWvPFuy8YFWxACii40is5fecPSKlxHirAY4U1xEHFsIosUlSxPR2MRZQOwPNrIW1
 LI5cVyT8eEoo+SMmR2cobK7id5xbFgutiFAeGKlfgKAchnDCWJT7Xq6F5b3qZjo68Tnnt7vXvOF
 tbV/bVDo+Bj8ETsVjZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170174

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
pcie0_port0 and pcie1_port0, adding labels to these nodes to allow
board-level overrides. Move perst-gpios/wake-gpios from the
controller overrides to the respective port nodes in the board file,
renaming perst-gpios to reset-gpios to match the binding used in the
root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 16 ++++++++++------
 arch/arm64/boot/dts/qcom/sm8350.dtsi    | 14 ++++++--------
 2 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index e9b9e03f725e..37b9dc1b16d6 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -499,9 +499,6 @@ &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_default_state>;
 
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-
 	status = "okay";
 };
 
@@ -512,10 +509,12 @@ &pcie0_phy {
 	status = "okay";
 };
 
-&pcie1 {
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+&pcie0_port0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+};
 
+&pcie1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;
 
@@ -528,6 +527,11 @@ &pcie1_phy {
 	vdda-pll-supply = <&vreg_l6b_1p2>;
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 32b47f5ec1f6..74cd66d98c54 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1586,16 +1586,15 @@ pcie0: pcie@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie0_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -1695,16 +1694,15 @@ pcie1: pcie@1c08000 {
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie1_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

