Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8048E41D202
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785167278; cv=none; b=W7c/tBFr/XOqmcTMLLeNOdwQtyE9miGqbJQ1yxo1lEkyF0fqvjy/c/yBRg/24dE0lFcscMxtQtBcDhDJgIQkMGcueu0tlZU339dGb/n1nytTmSbK2IxP+ErOF7tm+dn0hWlLZhSsfkAQ7zYGlMGtPJLvtVZjAYED/UyV0iPZqog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785167278; c=relaxed/simple;
	bh=zm9bsFytylvX6JSvk/UamkMiaCkb215yq2AsQbRdbvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g2ttkzktMfh6c5nhBkConUJIdgQCnaW8+JBWPCUufrQf7pWttRFD+rAgWCqNQgMe5qlaimqd8BewAT+MwaQpHwN2EyLzik2qE+Kf9/yrOMaj/DJgcm12uhT9lQarvCxFO0qIObJPH9TF+afi1KA6rIkW42vptbjmWW2LEDWjXbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PhmYJCXb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dB0W+Oj8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PhmYJCXb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dB0W+Oj8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlpZ93787311
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:47:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iOkfamEWx04fg/3rjrIG2V8/umLoBHLDYdgpSy+thJ8=; b=PhmYJCXbwl91wW1M
	fJKlRRZzCeIaOibHnBbHoozz4Ixs1MwXc0XTe39c8FN983UXbWRx+vWQ6lBeNtoJ
	rmTHF0zFGVihaAiVzmQQ5MR0yy3IqwMDITTK6FCBwY36IgxfKm1qIYzA9v+uHGyB
	wVA/0eIm1KdSOn/EH5YzukXbN+HZAunpzyvp3PL8zsd3ivBBSdpGxDxvboKPzFoi
	Ae9QY1vsFkclfVabF1OrV2xHPlnKBowT1WuU2ZuvA+Qipq5Rbq88rceYfhPpZ0ro
	0WJmyGT/2jF5zsbzktkuIhWkNd0TKsFTNahzua5m4rrvwB46VlPoXjOXSgRz3at+
	3jytnw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp3v2hrus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:47:54 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb4bd11ddf8so3335874a12.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785167273; x=1785772073; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iOkfamEWx04fg/3rjrIG2V8/umLoBHLDYdgpSy+thJ8=;
        b=dB0W+Oj8eSgrrVjQmD5jVqXug1Y/VLLWFSVogFuw/1ulCq8f2cLR689vWwOaRof6oH
         AlZ9Uepfn9PBfDDE4GzniFwJSSHXuHY4WqtzO0fY94s2MHIKURU5jjTeCa7jk8dd8EHV
         TcmvVpPfCsUjzgDpmKYJLRH3ujwr+k/3pp+oVptKctWLDXg8Nru9GHzVgf1D/Cy2IDj/
         EY44Wy0JdMYX1JU6eSeVk5xRGLxIcxXaNFEI/kHP9de45hXMse/o+Zi8D7XUX1ox+0hi
         8J21dYIWVyI4xgMaqvumqu+oq4MhzbQxif939e14WtPQk6oA0DntsZuhXY86qTEKNPf+
         Nbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785167273; x=1785772073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iOkfamEWx04fg/3rjrIG2V8/umLoBHLDYdgpSy+thJ8=;
        b=hY5FqNvZ9/Xm0TpPg/RjLtDXDCE5AYkBN1nTLaSSiuslOONVkFMnCa4V4IOowTU3c6
         ceEN7tUly5Gbtzqa8NSj2V65ke8AkmdOAeZJyfeVwS6luksORAhfZaAHq4nxCAp2yCvJ
         1UaT2HYGLc0Jf0I7RD0wl4UCqukX9dCCNrXKdWY6NN4kpvsQ+zmJ2R7/GsDoIrRfCzLj
         Xfe03S3tj9y138KLpnAL9FPdJ3PNATcJrE7CRJNOqz+XT9XbaNY6mVFWzyTmbJBbRgF3
         306SY3bN7pXJydKr3bm2aqoFx+nnHyyEw6X7qEo8HSMcUC2/5HYhZXAnDAC+WWiGDj6Z
         SYjA==
X-Forwarded-Encrypted: i=1; AHgh+Rpg1ZrUbXJbBOpapXQjC/AhU/pmYc/1ainELqgKR/QnWnHz1f3lNYNmN2c4iRF+RypeIVD1OFDMcJhB@vger.kernel.org
X-Gm-Message-State: AOJu0YwszUkfaa18V1y+/bMnuSMYaBS28dVSd9VaGuWDIoGWcSb+lb1f
	GA9BiJG5pZwOJiF8nwaf+8we4kLLC7ztRwyJ1yQpAZ7sPTyQdM409FsGAoFgXHQoNmsbZYE12sD
	BEZToj3EApl0s9bh7kQYZbZp2oXwmlGGC2j76KF5KbKoQIAjUMGrujDJkduadgFB9
X-Gm-Gg: AR+sD12NyCt+UbsW1SvyLUUZbSazVr/3HCBDJGxf0s+M8WO2KlPD7FvJ5UhB+/t+BDI
	Ft1+fHYp0M4iwQ0Sy9lpmHVaJ+wiU4OhxRlSYmlnaoPllYOuIVGh9CHh81J1nP1QXwYXEhDBTML
	Qw2VTiop1vTqh3uk1Qwbks/wCb5VyRO8U8qztCnx9jzAPXjRd8TfNva4KcP254SXGUjSJRFSXSj
	Z/x+UJBkSaWwzL/m0UB19IuDKL5r2WfOIPZDTZ/EpygE4+i2eQasUKzcO37GCP1+0ZH7fhMr9zg
	woKpDJY8EiNeyWcdx4kKd3q+ZKgvFINNXLINQ9MgssWjGvYIjg2l52xn2uLKj6N6+M0j8HFYPBd
	0Db08cQNQmLqSotH0PNsylxdlOmfV2WUKTkPCXGbUThe6IP/oUDwPQOB0VvKTSbZvBK3eXlnTmS
	eMk9FNbaIpCwOnO9MVuFlhE83QWPZl8+GYiX8=
X-Received: by 2002:a05:6a21:1398:b0:3bf:7081:9356 with SMTP id adf61e73a8af0-3c67da14622mr8252586637.17.1785167272991;
        Mon, 27 Jul 2026 08:47:52 -0700 (PDT)
X-Received: by 2002:a05:6a21:1398:b0:3bf:7081:9356 with SMTP id adf61e73a8af0-3c67da14622mr8252532637.17.1785167272419;
        Mon, 27 Jul 2026 08:47:52 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc4164ddsm32845204eec.9.2026.07.27.08.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:47:52 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 21:17:36 +0530
Subject: [PATCH v11 2/3] arm64: dts: qcom: ipq5424: Add the IMEM node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-wdt_reset_reason-v11-2-eeedb22beefe@oss.qualcomm.com>
References: <20260727-wdt_reset_reason-v11-0-eeedb22beefe@oss.qualcomm.com>
In-Reply-To: <20260727-wdt_reset_reason-v11-0-eeedb22beefe@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE0OCBTYWx0ZWRfXyV4D8HIFv/Ux
 MKNbW11lNtYcRBoiWJEr4oKOyNpTfgsBzuUu4yWndkoSvBiZTfw5vS5gAlYnc5i6mXOgP6Mk+HV
 H5qKrSfnNjdO+ecGNvaQX5HoZlVXIIw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE0OCBTYWx0ZWRfX53B/Ib98nwnj
 35Ht53hJmB3HVqVI5ff7so1xDmfcqYnrf8RGv2724XJZRkLMbbOYqKXBfeq7PzOXDNwOCbeXP4R
 7BY/Ez3Gzm5NiJbcGbNrUm9Im02xjrRcnSB4AB0P5ixP2VNYXA9FK4tSslC7lzzKFg8bL0x0eCt
 K8OEYXM4vvtDLnOlYhzZhK+e7v/27PdKMUX8CCVOqW6LdjGJS5LjNeGLsobRFEbxms7LQZf7LZ7
 ZSORNwxEpjYd7ytHF44O6yY+Pd5O4hayxQa90yiOAbUdHktxQbk4YHKV+gnvqYX90IXArwqJz0W
 6+XN0Fa5HRH3+E8DtO745qKhwtQtwsiViNS/pTItnrsfrZf822iafZicHPiiGYjI9S/pn3UG1TA
 L09P13IlRfN7Ptkprql5UX2BiHypMV1GDmeyQNY4wPtAC1++wUr2rAVqVbHw2lMbYLzRGgxPUyp
 MsvHjsg3UJloheBrOLg==
X-Proofpoint-GUID: 8wFfdA7FPP95XJJx5JpMV-3aRjgNAzmo
X-Authority-Analysis: v=2.4 cv=KJ9qylFo c=1 sm=1 tr=0 ts=6a677daa cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=QDJorwyCwNfNgOuVDpwA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 8wFfdA7FPP95XJJx5JpMV-3aRjgNAzmo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270148

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 112KB but only initial 4KB is
accessible by all masters in the SoC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 702061e16a58..ed61db0749f8 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -730,6 +730,17 @@ ssphy_0: phy@7d000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq5424-imem", "mmio-sram";
+			reg = <0 0x08600000 0 0x1c000>;
+			ranges = <0 0 0x08600000 0x1c000>;
+
+			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		usb3: usb3@8af8800 {
 			compatible = "qcom,ipq5424-dwc3", "qcom,dwc3";
 			reg = <0 0x08af8800 0 0x400>;

-- 
2.34.1

