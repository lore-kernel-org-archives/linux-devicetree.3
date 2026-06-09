Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EA64B8DEB
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 17:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781024662; cv=none; b=XHUElt3DeGX+aoeRG7YOLFZubBkz60BPhCHk/9HYbolLMIOLQjpbYXwDJxvE6oAPyYnSOp1q9IbzB4rhwDZrhXBV7RMryV5BGd97W10bUgZDobJpYqD9W/ST9qlYw6iNI5OymSKu/qWjnjbea5LQI+kOK1v5Z19hfuSy4MEAns0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781024662; c=relaxed/simple;
	bh=cIvhz+aTGqeTefQoh76+5Nj2l++XoB8R6R6QKA8pw38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IAdVt9EUF9LASxGDGhHSq8U9B002dCZSF03499Nonoz5Y1LYCX7t6AeOqj653jqZYi8Zk2u7t2m2iq5tT4+G4wW50MwlbRK/OMTC9b/vyo9z9qKz0z3L97aRf+lRmQObNe7HP+KREo57j39JEhW6mnLw1wYe0eQXJFwi+zpgm64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pIzGZsgn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EhxnpMU8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pIzGZsgn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EhxnpMU8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659GOXhi2746260
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 17:04:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YX2PdgNHHCyhysHFsTSPjEsekZuo5eTizJoTciq+fxE=; b=pIzGZsgnk4mVJExh
	l0dEUEHMktUi8Ep5ShHnyP+tHFL8zZ+7zCEf3BWVXwn6Rer6isHMZC/lTutRGrlG
	+30rsHzqXfZVBqynM2JGVIHxsqf8ClhWjR98AaQNroSxghYy5vzmguYfj3ff8WLI
	sTrU4HY7jZCg3nc63c6Ud5I1lMXTR0JlQeTpzpU8AmIKWlOAjzPQmLoQ61aAhiFe
	+ueVm9NP8KAzUEk07gE+sYm4OhhQ1gen7F8MsBf813KDorDcWIo3uwmKCcBZ2+FN
	FtP+Q7/h9Hz5l4mxOJR3G/sqfYcNxrtLeieFbQMS2XIjveIl8TiXj3RfEkNOtTfd
	2b9tzQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3wj7nm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 17:04:20 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85a2c305d0so3370627a12.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 10:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781024660; x=1781629460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YX2PdgNHHCyhysHFsTSPjEsekZuo5eTizJoTciq+fxE=;
        b=EhxnpMU8s0Yzf8cbp4eRUOsBAw1pYQcskabdeb8FaWwLlkRUBor1wA6aWBIDLVrvoV
         wYE2h18hlVc3WwCyl/WgPi0tH96kJEuPbIY7kN0vfmxBmSlsVRhoyRCwZgY8bpKbazUm
         6e1Ze3SRjLALno8KiPoOyyyxV/Ecbi/BhA5tiavqxn9OIrdP9INdn3RFYuhNJQpr+RM2
         +tR81KPxcmT8AZB/25vrHcK2E47xutgvZ8te4vY4VNlBHEuQgCuq8H68j4Sv8drG2yMS
         uICLLvkzc/Tn83+ectQKLBdlWwH5KA0MCrDUoYenFE7Uo2qurhOfMOM5YRTagnqrMyNe
         rIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781024660; x=1781629460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YX2PdgNHHCyhysHFsTSPjEsekZuo5eTizJoTciq+fxE=;
        b=DOewwzrFO2kLc65CplFqNh2YVznqnNepQLvvkYLTsCny0lZaRGoE2KqLdqmYVmy0lU
         gEjvt8SEWkURvUDUucXkCs2/YDPTv7yLr7uJkJ9kZFk98INy8ztmqpaC6BcJ3aWm/xT+
         fCKmywwfGwECVPCyg3HAJn3g6WvunfVzUBxgXUm3bencX8VdO75yrXbEhY0mrEuNU6Ha
         UPLwRmHK54F/obukBd1zqYAFQW9DigMqjh2rHvRVPOuafY2eeFu9XE5nlLH+EbZfscCM
         SucPaq7GQfeQ7tftyNvOEZVmGxQHtVtPUemPSelxEfaA9XgDVonVT9ojj58mL+6Kpudh
         p8OQ==
X-Forwarded-Encrypted: i=1; AFNElJ+5lucHWrpHeU2SFDMfSC19pSPVu7dHXf+DwmXvO3kCY2N/ZguegJVCDTWrtxw4jIiuO4k1wB+pOR+0@vger.kernel.org
X-Gm-Message-State: AOJu0YztcRpEMN8y9rOMyMNR+VJQxWYfgmn7UBDIT/r8ClT3som3+Rgi
	qbF3mZIp2F4kfc5QiSc3h3fIIuQHG/NY0SsoWgaCiSjuaYFsDKiRcwax4s+bayjeaPwS8Dvu+Im
	PhC1oNyovxfNIIJdX5efKVXIcBXPpe5lZW3+kguV0k777MnCK7e18Sj47lAGEKr1S
X-Gm-Gg: Acq92OF3HuflHzSIqYH+7z/vsM89D+mVqnHOLRRI8FHmwMDennxxIPYiaxRp5C3fWQB
	5BAdgHu99vDcOlk5gWhM7A681mLi+EQ0gGWB2l7V2BlObNLb58FYJLHON2T0QQ5E6bUfPqXhURg
	d+S3GQWhbpZnhQV0GMCiicnuxrAegH6otjzI3qFGOVfuoFwAqIGimtRbHelcwSX2piyyP4M4O/E
	3Ydo/IV9lAHy1gRL3X7PrBWDNKROQQh/SLkrJUAK3OiHHi+hVLmsTewUhEpXoLAH8FXwP4v/NWN
	S6ZevZ22zMAPBEZhFeDoj1KD4/yHBBRauGAGgOs4j2RMKTz820YBod4vfzLx3pCF5R19zsgXYKn
	Bio3mvVT97G0sTuYluQ2UxByHwpv+3nB66Sf1sWcDrktyBpZiNJiG8ZwBzHlteqXgswhLxtuSvI
	M03a24mX7I6yjGGm9Iq6HOKGRtHbS0AsHRFWMzfM+9eVKGPRSxbyC1kOj9d0Ux7sdLAOk=
X-Received: by 2002:a05:6a21:730b:b0:3a2:e0d3:37d2 with SMTP id adf61e73a8af0-3b4ccfdb601mr26289933637.35.1781024660022;
        Tue, 09 Jun 2026 10:04:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:730b:b0:3a2:e0d3:37d2 with SMTP id adf61e73a8af0-3b4ccfdb601mr26289863637.35.1781024659428;
        Tue, 09 Jun 2026 10:04:19 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0b9b3fsm17739119a12.28.2026.06.09.10.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 10:04:18 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 22:34:06 +0530
Subject: [PATCH v2 2/2] arm64: dts: qcom: ipq5424: Move PHYs and PERST# to
 Root Port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-move_perst_to_rp-v2-2-6c731523d08c@oss.qualcomm.com>
References: <20260609-move_perst_to_rp-v2-0-6c731523d08c@oss.qualcomm.com>
In-Reply-To: <20260609-move_perst_to_rp-v2-0-6c731523d08c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE2MCBTYWx0ZWRfX0Q0JxmpZC12k
 ah3qqXHlib+HmGE+I2PsI9nqxXgERNya//vSX63xzqFvWdOyM00BJQNnC537+IcEbXT8qBNV6nE
 B9qCnApsJuaYVOncEeQM8nc4JgDAxMKnboA5t9a+xaU857CRm6SOGle/xV/lwlxkY/piz50Jzqh
 2CKQBo1Pm7U5wr3kznX35vslMxOhtblQA15vTc9vG8O2XG+Hm8GHvZNP3r4q4DirXVe6Y+Ga+it
 Hl/WUyhI10S+XdBHh4tc3D4Yk9BkE3CDxEwodVTZ8FT/MFX/1cKfEUcon1B3ViKc2g9dpZvR6A7
 QejyHt9MPrSpo/mGvjgEjFc4d8xUjiIxWonjHeKlFtQ574RKqxtj33TSqkOxhXpD5AMxqV7ooUt
 zbKebbzo19B0q+Wzw/9k0DN5FceECNi61wJ3uNfi9ytVJ7podM2OXb9qsSEN/SqhnVTNAQSMyeV
 fWs0romIhJxu86imUPw==
X-Authority-Analysis: v=2.4 cv=csWrVV4i c=1 sm=1 tr=0 ts=6a284794 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ia1wqS2LDIYHZchi8R8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: h52GaW_v9XPatMHYUmmte9FZYrWMLKZX
X-Proofpoint-ORIG-GUID: h52GaW_v9XPatMHYUmmte9FZYrWMLKZX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090160

Follow the new binding style by defining PHYs and PERST# (now RESET#)
under the Root Port node. Avoid mixing styles and move these properties
to the RP node.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 12 ++++++++----
 arch/arm64/boot/dts/qcom/ipq5424.dtsi       | 24 ++++++++++++------------
 2 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
index de71b72ae6dc..be8657239c46 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
@@ -86,8 +86,6 @@ &pcie2 {
 	pinctrl-0 = <&pcie2_default_state>;
 	pinctrl-names = "default";
 
-	perst-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
-
 	status = "okay";
 };
 
@@ -95,12 +93,14 @@ &pcie2_phy {
 	status = "okay";
 };
 
+&pcie2_port0 {
+	reset-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
+};
+
 &pcie3 {
 	pinctrl-0 = <&pcie3_default_state>;
 	pinctrl-names = "default";
 
-	perst-gpios = <&tlmm 34 GPIO_ACTIVE_LOW>;
-
 	status = "okay";
 };
 
@@ -108,6 +108,10 @@ &pcie3_phy {
 	status = "okay";
 };
 
+&pcie3_port0 {
+	reset-gpios = <&tlmm 34 GPIO_ACTIVE_LOW>;
+};
+
 &qusb_phy_0 {
 	vdd-supply = <&vreg_misc_0p925>;
 	vdda-pll-supply = <&vreg_misc_1p8>;
diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 876bf6a8b8ff..702061e16a58 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -968,19 +968,19 @@ pcie3: pcie@40000000 {
 				      "aux",
 				      "ahb";
 
-			phys = <&pcie3_phy>;
-			phy-names = "pciephy";
 			interconnects = <&gcc MASTER_ANOC_PCIE3 &gcc SLAVE_ANOC_PCIE3>,
 					<&gcc MASTER_CNOC_PCIE3 &gcc SLAVE_CNOC_PCIE3>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie3_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie3_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -1071,19 +1071,19 @@ pcie2: pcie@50000000 {
 				      "aux",
 				      "ahb";
 
-			phys = <&pcie2_phy>;
-			phy-names = "pciephy";
 			interconnects = <&gcc MASTER_ANOC_PCIE2 &gcc SLAVE_ANOC_PCIE2>,
 					<&gcc MASTER_CNOC_PCIE2 &gcc SLAVE_CNOC_PCIE2>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie2_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie2_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -1174,19 +1174,19 @@ pcie1: pcie@60000000 {
 				      "aux",
 				      "ahb";
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
 			interconnects = <&gcc MASTER_ANOC_PCIE1	&gcc SLAVE_ANOC_PCIE1>,
 					<&gcc MASTER_CNOC_PCIE1	&gcc SLAVE_CNOC_PCIE1>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
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
@@ -1277,19 +1277,19 @@ pcie0: pcie@70000000 {
 				      "aux",
 				      "ahb";
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
 			interconnects = <&gcc MASTER_ANOC_PCIE0 &gcc SLAVE_ANOC_PCIE0>,
 					<&gcc MASTER_CNOC_PCIE0	&gcc SLAVE_CNOC_PCIE0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
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

-- 
2.34.1

