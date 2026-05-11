Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA87E328B7F
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778497010; cv=none; b=qnVshEHVBv3dNLx5/EJTYfyOC/d724qKv1PFgVuUlJzMjBtbWJfC5P29PfNUyhDWEyTvgGEQ8mdulPXadl5zEwWZfFO5xOZci4A7F9by71y0lgK1tnVtItxexSJ1XtkwbxQoWNvMybMTitXuVloJ+AsSJOR6Mz+oJKdChTRNOf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778497010; c=relaxed/simple;
	bh=bs9a3oMWNVMsY4l8QZBxV0zCUtpnwr+E4kDuvt6qGpY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=trRDIsNa/hRaV3+cPAAAw+lZzH3l9Lq7ezxlnRTcd0sawLCVzNFVU9FPhVt3jPvhDMe3rS0V3+mYHr2ct/xml1Y8uw6LSfAz9wmFzHeF0HnHBBO2wAfCNQKUYPFD1bmWtl1UqAtJSSqU0tMdbgxtTD8tzTQ7VTEf7RSbtDNg7h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IRLkYrx6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V9ZwAQyH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IRLkYrx6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V9ZwAQyH"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B9pu3P2290927
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:56:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ubGMY3u9o/fCPPhuGtZ6/X
	tvtPsFVFXgNP2iwLl1pO0=; b=IRLkYrx6Xn1QG6NN4dX24aLkJTjpQGnwDofhHK
	ZUUFuLDG4X8Y+IU+noZP1qrISLT8iBDdV6mL4I3Kxu34G8ttO7hIP3muIJ21yBKv
	zhEF6LOMyWrOKrT0CB5wE18g9wa1chXFmbBXkQyWQ9WhHGWln/WBiTXLr7gP6ptI
	yVarTkM9voNQls/AbWUlrGrm5QvXAhIHxqndmEmoM7U6KvCcg1ht+pRdJi+EuG5G
	Cyt2y9XwF+P8MX/RoBZ6Y4joVw6wmslfdjqHW9plb9m7TjnZubO4vTS52U6GTutp
	iaXH/ZL6Tr7UrLqb65xKRuyt/q/ic33biqYjMwroq3nKuzUA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e240h4w27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:56:47 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c829366cf25so638252a12.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 03:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778497007; x=1779101807; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ubGMY3u9o/fCPPhuGtZ6/XtvtPsFVFXgNP2iwLl1pO0=;
        b=V9ZwAQyH0D2Cdum2naU6O9hPTovxajp/bqDwHk8XMCVcSY8rP3AvECAdU7OvATcCks
         o4GD2HLGFStSDtrfvhF1DkpkW1DBoBYbp07i3zpC4W/I/hO/w8ZYyQ3qQ1Yr5/4hY1bm
         E596PMdpGRlFPub3XR4JUMHPw70seo2xb+RPH8PF3b4zTn55CZUyTHN49UQP1a3lk2s4
         dUr0sy+NtwoRx0BM1xFW6zuJLO0AzzUQzjwZZham38dlS8y07jTNTRf19147H89duIuL
         MHimzOgoooJd//qLgX7xdSRzgwiRHCqfq2tw/85R+p05ycQBweaowo+gytMHdFdw0EwK
         teNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497007; x=1779101807;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubGMY3u9o/fCPPhuGtZ6/XtvtPsFVFXgNP2iwLl1pO0=;
        b=fYnp5a416+rHsnDLfuFJmy2P2ZNZp/ciCOUslfJNTT1YuFTuuh3f7CqADuUl+pmwMd
         5RM5LZ17hqWUTWuWHJ+dGzcW560NwCrKz99eeUrcKVYhkOJyjA+RuqIATX17l7uqTETE
         TLRwZPJgP1WNcU/aSPRMVja5cFMZSy2SwAMffamw1OSlxQhffNVXnLURQKosQ6hZw9Pl
         4Nsm6hJArH87exg2fyESZGgFIY2Wk0eDK1Runh8DNHdDmflNeqn5SwhZ1Xy7+OVF1lmo
         z4+VJpdwDLzhYIq03HC/wrhUfvx83ZnRddO0R83EIuhccIu9PCqZ/3G+k199srGpkzHs
         +Phw==
X-Forwarded-Encrypted: i=1; AFNElJ87ZEg4FqKDl3GixePOtdOx2WBXRWG4OdcXhW8ollZUALPUMpa0/P6iF+JyxhQ3qqRtd4B8NIGhUFWZ@vger.kernel.org
X-Gm-Message-State: AOJu0YytY+Vycv7Z+WqkCeIDqBB4yCDERYjnV+PbfKjT8+pp9MGNlflW
	QvOBRfFcXWVRwxtqUysOP74rkuCsN5m4yiiuBOBjFfd0XbEvKNTWzwCCt4+xOjCV8dT9WLdBEfw
	fxRQbDCYP0erUTuqu2+G8ulKrBsw9oMiqJO6NiJkrb9URTqKj6XEv5GDy1KB6+GXA
X-Gm-Gg: Acq92OEklBS8aW3ic4KbLNFcDNncg5uq67BWvw2PGSr6wLqQrq4jvjaIjXLh2lvLjqs
	5kSNWRWiHOviGatIsg+MzZoqXF/hjYDlT0Q8KQO/7wzbgZeDd7mNZtp5G/yw7hA6EO+OFqA6wUO
	GCZ62/c0c3d21aqVcoiSDfdFXvhcwOj4/hkAYtWdV+C7E138YlGmuXBhtf3vkD920NVTyARK8zc
	YPtgPu8FVo5vpRtCqvAin7Sa/Rom+T1zY18CZETtUX5cgN2OK5OukLc74PdUT02a4jCa16kcd4B
	oJedh22r2Uy/7fmNhH9+uTPz9M/4+pyVOndaJ66pbG24hCM+2+/z2duYQfTN7ue5DtQcHFlM1Oc
	BKW10THsOYBFoi7C2pc50vXxcT8HoD25Ub/MhrmKX4T3iaOkLAfoWP1/DdUs8E4Pkxn4VRw7dKf
	4b9Uq1dkD39cDB+i8y/SEfuAjhkEsd+AzpRI9tYqGkEpBN6xewEY8hhloW
X-Received: by 2002:a05:6a00:a02:b0:82f:2243:e445 with SMTP id d2e1a72fcca58-83a5d873210mr23535760b3a.32.1778497006679;
        Mon, 11 May 2026 03:56:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:a02:b0:82f:2243:e445 with SMTP id d2e1a72fcca58-83a5d873210mr23535731b3a.32.1778497006247;
        Mon, 11 May 2026 03:56:46 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbcfc0sm24254762b3a.42.2026.05.11.03.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:56:45 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 11 May 2026 16:26:41 +0530
Subject: [PATCH] arm64: dts: qcom: ipq5210: add watchdog node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-ipq5210_wdt-v1-1-870c4b7f77b6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOi1AWoC/22NywrCMBBFf6VkbWAmNWnTX5EieUx0BGvb1AeI/
 25rBTcuD9x7zlNkGpmyaIqnGOnGmS/dDLgpRDi67kCS48xCgTKgESX3g1YI+3ucpNHbLblgoSY
 Q86MfKfHjY9u1K+erP1GYFsV3MdJwnTPTOvtVmuJfY++5i9wdpE1VFa22TtW+ueEi8y6TDJfzm
 aemIFtHhQEr8IAxUiqNSaBK71NIxpeowSZXl6J9vd5hJ7oB9gAAAA==
X-Change-ID: 20260511-ipq5210_wdt-6544eac908e0
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778497002; l=1155;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=bs9a3oMWNVMsY4l8QZBxV0zCUtpnwr+E4kDuvt6qGpY=;
 b=GX0fh/PNuar/dnrekuBocQttmzSvjdEQun2nsrnst42FbKU0PqiDdkygbch8Y28P+vDT/zLGN
 1DrE3w8fdMoDKFZvORrxqKNyNdHpOsmR28dWziVJWaJfEasgF+q8lkh
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEyMSBTYWx0ZWRfX2p5HiuMfb6b2
 dyzjMqu1dcWHmNqf/ETeGHVrD78sXKezYf1Gk8qtNVGblNMexYEKX/jFQdDrKdfoI/pT3cfdb4I
 b4UlfM8sj+LFaGXUTFSXeaP4DOOkd9v7G1v7OtXbRG+NRqM1Rn9lxXWn78fvtaC8VTfXu/USNj2
 DrC/EiBlszlSKougNZN9qVV7fVLwQaz0M3wyN5Cru23ni6Pb0aj1Q1K/4AhSBrm3ekf4+J5WDv5
 dmbM5Q4xvSgxuPcVP4+oVB/a+MyqwMO9sfVDbeSOILQ2N0jv8sYazFVtheb/ySjczbAXrpHILa9
 1hV+8de2ey2kLpDC+fYKB0E8BjnXf73CiQSU9yvXhScNzPuPtoi3xljCFkz05TEdVFIcne5gYfy
 KVNAwg8+fcoF7y/83fD9zAFPNVeoj1k9og9AIZn0/8Tfn+T0vJ7N/EIIlZ5uL7FmPdwhbpc5nmc
 Ymj233njffh1037ygpg==
X-Proofpoint-GUID: HPi1kGKYdjzczHxkrALCE_CMX-DKvgoD
X-Authority-Analysis: v=2.4 cv=X5Bi7mTe c=1 sm=1 tr=0 ts=6a01b5ef cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=rKBl3BpjdAMFLJizQwQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: HPi1kGKYdjzczHxkrALCE_CMX-DKvgoD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110121

Add the watchdog device node for IPQ5210 SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 3761eb03ab24..2cdc10529c48 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -236,6 +236,13 @@ v2m2: v2m@2000 {
 			};
 		};
 
+		watchdog@b017000 {
+			compatible = "qcom,apss-wdt-ipq5210", "qcom,kpss-wdt";
+			reg = <0x0 0x0b017000 0x0 0x1000>;
+			interrupts = <GIC_SPI 277 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&sleep_clk>;
+		};
+
 		timer@b120000 {
 			compatible = "arm,armv7-timer-mem";
 			reg = <0x0 0x0b120000 0x0 0x1000>;

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260511-ipq5210_wdt-6544eac908e0
prerequisite-change-id: 20260511-ipq5210_wdt_binding-9f77d959a28b:v1
prerequisite-patch-id: bc56c2cdb782ff7ff58f9f4ab886ad5d8ef146ac

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

