Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D2C46F482
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 07:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249360; cv=none; b=bKi7BkkujAw2eBho2sZPYouGLdfLWJb5Dw515UA1EH8q7HbG9DAwVeL35eSjllrGHxWVnUbsys69ff0V1reig0KzP824i45XStI5CMj5CoUzrL4+G4QWjc1pNqvDbIrsC+h2dQTMKmRLe/opBTI6BBmQXM/zkuuymJBH2b1H80I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249360; c=relaxed/simple;
	bh=f5VRYrNrkoFkzfYJ3qJcnbvJpcWK6z3G2sJ/OdRAgEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C8q1okRcflgdfjZjF6nDCP3fyK4zC9PBUy/w7Oj/aCSn0sgBRgEbOcR3PPXfyFJQ+7I7ZRr5K2un8lRYGVgsCNfc3nCIfn+3ElkMobbqCnDnQ5UnNVxraEXObGSl5fu0MZ9jdA9u/6QUj6+rnhcHK7XMTzl+wy5/bQgK8R9Atk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DUwgCudP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jppGyUY5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DUwgCudP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jppGyUY5"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179JZX1709556
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 07:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YqOiAEMac6E
	D3MqD1TR4VHjt1zwOFQxdqtob1gSUfPU=; b=DUwgCudPu148gFW5duXESwkvsU4
	EiZYgZTsrXkAi+8vg/IJ9awCrZXuww5etNUwf3M8OVyIN8zdF94cOk2xohUB3As/
	VSREhUVnQvYWhe4QPURc6yEyEeDZq0S8yUSi9S8e8BxNmTYxferKH+oFsvnh/TFt
	2RnpjgWCWerGaucILK9LNmnlYVnz0qf1ZTRM8ImBOlz5inYWsplf5iWsabs0+ehX
	UEfGpZhLSlpHx5EBXF8iWt0IBJyiUx2iacKYiL/UCZi8CSAJl4t4KYxjflAUl3qz
	4IsQclQ+ZZJuU7OiBKn4+R59gh/omVs/lsbMnLBZ5AQP4rcBdyhL9xnYK5g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp8fs434-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 07:55:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso6112186a91.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 00:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788249356; x=1788854156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YqOiAEMac6ED3MqD1TR4VHjt1zwOFQxdqtob1gSUfPU=;
        b=jppGyUY5yQguOIJ6T5qFrAMdGeRoh7US+HtUaxcVemg2aZXH6SdQDFN988QTIysPNs
         jPkBV0SgnxQieeWlF/TfjUJnkBZqVc/gc78Ol99TWi6oRt3HdX2vpYN/bQ20/eQn1MSQ
         LLdLP1JIXvf7hn+Gr7wlkUhXxLVW/2gMo9ZBxA43fITcN/aWSdiyEtJcOvd/nUAqgCdB
         fy9v/QJG7dNGfT5WP7Cyqjs/XZrsW5Qgtd5/pkJXkGIXqqO9BY3dZ3yNp9LEQh/tpTvR
         UiCxGbvOULd0kY61nXJDkgydoCi770Vktdt6ZVarVOGU8z2Gsd2MHsUX8WU9hAJZCgke
         Hlkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788249356; x=1788854156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YqOiAEMac6ED3MqD1TR4VHjt1zwOFQxdqtob1gSUfPU=;
        b=EFZOAY+2MGrKyh9lcdaZhS+ocn6PwH1zenpY5k4IbuAcHHAmw6xFDEvEGItx5MUj+E
         CaDxnR3Pu6lp6M+paHAPYtQRtWGSPzueDT1FKfAENf/VN0zn54Dh0f5MKaCtHEa3Hqu1
         AFLHsBaOlcUYBiBI+4yNBSQdUFMooHnQKuaXBMf7Jydc743RhBb7yFjx6DpNL4IMLgkJ
         ahed4tXdRf/GzXuWZ+IKQlunO53gdOL8YR1SMzWIZrqJvgfPj7ANa3Dv7fZGn+LAQYRH
         5hh87pv8DVkOq6kaL0cP+YVi2i06/I2Jbe8i4cxUkoVmF/E5qXQbOrjoce62uE98yfnw
         QJUg==
X-Forwarded-Encrypted: i=1; AKwUvBxymUu6bX7G+mXOYWiUvU7qEyvfjg9wVk83jm9CcR/FjrcSxvSRLFtpGi44RF3ktK2Gt29jO1WT/bnw@vger.kernel.org
X-Gm-Message-State: AFuF++nguqU/oB3SmyQ0vFq9pC9gFFCnCpqrLhRiQ4jePD/+fidWoTx7
	Z8OHZZMdtFB5LOHY2YiqkKFJjI6lfd7enbtekT4Ao4Hz4Iw2ERpXgn3JfM652t4dHtBEK6xiOAB
	YCO/bwMpCnUvTLq0WHLrQowtbwPKmiSh34299featJxlcY7P+gtVaid5hgDBEYgTw
X-Gm-Gg: AYBFou3nXVFC4eBdCAg/aQwFOn4cQfmSYvgSCVCiQ6BC67d4k06yUteHvvZTyw6R3X8
	F1QJ7TCEkM6TB+ltwYSLkcEnGOY5aN4WshWnNS1vtWUERq2pkZbnA9hjRQDYbgmokgMgvpYL/sw
	PYvPa1V5itvF8fbqO2EGzSt4Z+rKAOAPZSM4W3WJTyzB+K6mO2ld4/BlRtHx7396bZy1Y0Zx/Tz
	cRI6BJjCtje0vOexyyWdoBYkN3c8OZUy/HYJurELHzq56yvpPrFHMUSDCMTi1+4EMdeZ/lOS6Ur
	jquV4+tPC+rgLI58bJBmEh2YZfSeFGp9/19hgrF+0w6q4NGOhhEF1xpzrGEf4XAXaK+Onm8VIdL
	I8/xZLbp8de52kjkrfsFnLVX92l1JtoEIOUV2rLlUK2nHfw==
X-Received: by 2002:a17:90b:384e:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-396d104d0bfmr42433134a91.15.1788249355717;
        Tue, 01 Sep 2026 00:55:55 -0700 (PDT)
X-Received: by 2002:a17:90b:384e:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-396d104d0bfmr42433105a91.15.1788249355280;
        Tue, 01 Sep 2026 00:55:55 -0700 (PDT)
Received: from hu-liuxin-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d2e465sm54873262c88.4.2026.09.01.00.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:55:54 -0700 (PDT)
From: Xin Liu <xin.liu@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        xin.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com
Subject: [PATCH v3 1/2] arm64: dts: qcom: hamoa: Add PSCI SYSTEM_RESET2 types
Date: Tue,  1 Sep 2026 00:55:45 -0700
Message-ID: <20260901075552.3558150-2-xin.liu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901075552.3558150-1-xin.liu@oss.qualcomm.com>
References: <20260901075552.3558150-1-xin.liu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cCex-oReM-FMGD6Pg85w-n9wMRrZ1NRN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2OSBTYWx0ZWRfX0sURxCl/MfwS
 CR5Lal/0L/GJFNdnnKvaLZ+gflDrzFlFfVdHWvpSbDkzRKf8ZNGOIkpyp5ELXIQSduEXi0vx6CL
 5MZRxrwhucStFw6BIvbTHQhE64lBB3c=
X-Proofpoint-ORIG-GUID: cCex-oReM-FMGD6Pg85w-n9wMRrZ1NRN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2OSBTYWx0ZWRfX1h+x5LFyLECD
 Q1bVvHNE3X9+klPcZ/NHOr1jcq0/tRobXQYbcBqPtWf7C/d3R9z1gBaxjqzrrXnEkGxHpFh3NDC
 lFtz+vrUbN9lCqAmrDrw7+aePPf7SdKxgKITkv64Sjg8Gh7rL5+swasgQll3yVjtmsihkTLfpN6
 enkPbygkV0UU52l5DI6S/DYz3iIVa1/kLf78ym3h9tE35jSSkqTTOo50ezEH0wD+RSrHgwRc3i8
 zrmWqlyrz1eoGzDHreHKHA/S+JngdAtYF2v5aPSn5bfJ993XDqFsC72dzS1EmPxaLrLOSBwuMmM
 jV2gVmEQvIRvCz7TRpIM/HpJJ9arNJntnBisMa2W48flrMTC+m/OAYTCIVQRhO4IZlf5WNM0EmG
 q6ZfsvU+wOuHaCtbJB0rNWoyq4Og116koHS+wu1fmi/bWpZvsRdomLcY/fCAT9lR3Bv4aW4nkCR
 f4/nocCmDE8O4ebuYlw==
X-Authority-Analysis: v=2.4 cv=BPWDalQG c=1 sm=1 tr=0 ts=6a96850c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=r8araxF3PNjSti9Ngu8A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010069

Add support for SYSTEM_RESET2 vendor-specific resets as
reboot-modes in the psci node.  Describe the resets: "bootloader"
will cause device to reboot and stop in the bootloader's fastboot
mode.  "edl" will cause device to reboot into "emergency download
mode", which permits loading images via the Firehose protocol.

Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/hamoa.dtsi        | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 9fa86bb6438e..5db2f19dc86c 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -1192,6 +1192,13 @@ &pmk8550_pwm {
 	status = "okay";
 };

+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &sdhc_2 {
 	cd-gpios = <&tlmm 71 GPIO_ACTIVE_LOW>;

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 8a96ea1bdb9c..a416114ff5fa 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -374,7 +374,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};

-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";

--
2.34.1

