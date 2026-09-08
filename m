Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBD138330E
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 06:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788848649; cv=none; b=Z0JqVa72Kc7htIRzIrObrr0PE2mmP7IYugBxCFrb2teBAY1TuWX6OzrQfERhFumG5fLEH+8odZiU+nGD1vytH+OcE6cw2KP2TX9wrQJgcYYjZ5qFYNTYGfbiz4guvMOxy0bmAzcLPgxPUDgUqDjy4liwBqeYJvrfH1OBxWhWLfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788848649; c=relaxed/simple;
	bh=/GuuipV5ZjIiafj0VbQ5D4TqDt1Bb+9GgJneHFtZyeY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W58fYN937rgw4aSfTveUNd0uejGB9D5F2eVgzgN4pkIM9n842R8NefbAYrfzTgeWiLT/TLf6ei2CGy21WKxM/pALqE7l7q7ocErrU1lAMTzUxrMVc57ky4C3DaT+oqeikQ91npSPo3oDxb60fomd8zZPnsh77aLd7bbuPM+jHG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UrxW20v1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cEqT5qrE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UrxW20v1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cEqT5qrE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LcmT3299120
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 06:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	92WfmraFgzjIJBF4u5643LYqw/A6RaaeXEKXfqpkMVE=; b=UrxW20v1T93CuZbG
	tXOZX3uiZN08UGyRutI9aaQQsG9VdTvT5VoE7XZf0UqS3WUucB0k/LYOGxr94wEp
	1ORaIytr+IVQpXaZNVvjS6bey6aunQSFT9o49U7mlqtPRXjKFceAlI5RvxHyj8D8
	rJVBjetvGYuslDasBx9Z5+VoqV1Nqh6JVcxYwV7zTGmCIKZSCe9+ZjOqqnB5d0O2
	4fLgHjqem+Weu/htvK7xkNL8w1h4L/hT7QxXvR9nRJ+ZatqMEGhXhjG+X7jfhxG+
	4AxVHHGJjQ3OJVV96KOiNQjKTFo8B9cAqzVynTd1lNnMoK7n5NCY6popsrafoZSX
	9yY3cw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjb0p8eb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 06:24:06 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7f1da5e5b06so5109495a34.2
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 23:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788848646; x=1789453446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=92WfmraFgzjIJBF4u5643LYqw/A6RaaeXEKXfqpkMVE=;
        b=cEqT5qrEulW4nr4Wh337VCpky54IgPQX1163tweQXAuShQkovkDrD4TMHXpUw7nMFZ
         08xlWaCcPBp2oTGv4y0nVMc2x+djIluxhzfhmigDX0wRaXgoFi50tAEZZwYS0Ps8ed7q
         3KwBVC2lbYTMamrNZYIpGFE97u7YhPT2dyXzxEpoYBtEv97u+7L73Nfj6H6TmlZ/T87C
         OmvJcGbaih6hLkIAfla5Pmh3AWJjjj/3C/R06hTvNB+QW9fE5H1vY6H87iI2yK98ryCM
         hHBxBOOHrrV92T6R/JnapG4Acgas8AUNVDNWYV3vdnRQNFup4yyrO0ButK4NpBgc7i2S
         Ulqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788848646; x=1789453446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=92WfmraFgzjIJBF4u5643LYqw/A6RaaeXEKXfqpkMVE=;
        b=DLe9ejKlIkw3ZtZG6VP3wC557T1HL6JYUkNUuWorduiU/88sGPLGpjX65R2/xGDc/V
         F+QX5PTip+7HAsNJ4CrINsF3KZi3895Q3NKSjGqJb8AQlVN6DTTsfLLytHfCRrd32QzM
         ylvTsprjb5NNZvw+jalk9xRZrVX0IWw9DzpuhHKT+zXwSGfOIjAeQHvclO1K7WW0RmXq
         iKIdpBQCqHVMDkO0uvEh+iKaPCdmD6wKGvewiPbhkShRfEMaFPSYc3dCW4Wxk6A01SFA
         +L0iWmr+tLItIvPlkl5utja3UoAD6VYNYoJViwcaD0nDTCErD925RrGS4RItXfHFY1OY
         aA4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzQ0HbfeaN2QZcd3/Ilo7NF/sAEaGfsVFb5UU4+YFBW84B5XBIOP7QK7ykmEdzN9QxlEJvUlAAUBSxc@vger.kernel.org
X-Gm-Message-State: AFuF++m9La3LUcRIHPoL7KkQH5CHDebAY7Hi2zT7Lsn0GjpJ7mxXVCML
	StLgf7gKx+RN7Cb4/ita6MEf6hzCPKOVNnMpbRaGqhCJkFXYIdYYR3/Iwpg0hUs/uycF4Gy+uMd
	rW/fbptMO8XdOxTv3Lvf7k1rdn6jOKBiRYqG2wds7/jd4KvqoIY3MPlfeMNKiZ05V
X-Gm-Gg: AYBFou2OA9Rg7hsNXVc6qiw+g+5tqFrUplqinQtywSd/KyOAj/sP8NGzSm3vq7mHXY6
	4LXflws17m839GNOPoFI6MCajTeA8vPDH6vA2VBT0eo9CmNKdzecbz0F+Wn6sHoS6TF9i1ITZJn
	MiGpP0apLuS7EIhEe/M36G2nRQ14oGWEH9fC54CdKuYBX15tQnyyby74Bo6pfJ0ezPPCYC81TzQ
	txevV/J2quXUVvAEcGoBB2+d9FzMPcsEOdWtRsM4RmlrKyg6zOOYXVM/s7D17uN7Vtmec7dVl/6
	dV4bIyjo7+i/NS+aKh6ua8Gg6f34/Ly6LeNC1HwvxxxULUUqYMpwtftuehuZtbQammpqxjD3P0U
	JuGYnwdX4SiLbFHFi3NF7lXXmgiNF1A==
X-Received: by 2002:a05:6820:f004:b0:6b0:5233:f69a with SMTP id 006d021491bc7-6b6fdbca26emr16108759eaf.30.1788848646031;
        Mon, 07 Sep 2026 23:24:06 -0700 (PDT)
X-Received: by 2002:a05:6820:f004:b0:6b0:5233:f69a with SMTP id 006d021491bc7-6b6fdbca26emr16108729eaf.30.1788848645547;
        Mon, 07 Sep 2026 23:24:05 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm26266297c88.8.2026.09.07.23.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 23:24:05 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 11:53:33 +0530
Subject: [PATCH PRELIMINARY 4/5] arm64: dts: qcom: shikra-cqs-evk: enable
 the first Ethernet port
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-shikra_ethernet_dts-v1-4-69c0c5c7c124@oss.qualcomm.com>
References: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
In-Reply-To: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788848616; l=1888;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=/GuuipV5ZjIiafj0VbQ5D4TqDt1Bb+9GgJneHFtZyeY=;
 b=NrHQqFlLLixabJfOk4HMei4evExRyJitvdtHpEl0Q1CLXvpmd4Qhf7hQym6cIY5TP1h8j5ICy
 yWPt1Zz2HXbDzuFM5VOMsoNGmnWDPBs45tgD0S+tCVZsyXgeJakM5AT
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-ORIG-GUID: jyd931oGmHcWe2aQPK-0VYwpvg6FRJJ4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA2OCBTYWx0ZWRfX6iAHaQt19qpy
 BfDLYbBbFUqEVuMlsgokSyhtEYBPvzC/KBH3cYgEbxUW7u/I6SeegC1DiA99KyzCNQ+XL4Y8wTJ
 a+y3zotJH1rewAk6SJOUWBmrgeApQRs=
X-Authority-Analysis: v=2.4 cv=HL3z0Itv c=1 sm=1 tr=0 ts=6a9faa06 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=O40WLhOeGaaPd3mYGW4A:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: jyd931oGmHcWe2aQPK-0VYwpvg6FRJJ4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA2OCBTYWx0ZWRfX0gBa+4Zb6iX/
 M2gb6lJzLDReQvoYvnH+OI4yzuaHspHiqEJQwv0ko69gdrBAQPd0jnwWzwr8c42AT2IsTUk6qyH
 WGpA7YhmNeapmjq3596XMvqOncKBoAeSvN1ghBjymnSMf4P9FrplnUmBYVvTs9/10jV/uJWrdRc
 e8KEyGIKrei8M7LZgssXGSRIYG0am1Y2HT9Yh1vnZyltjmHBoqYaKZwkY8ANFIrhb+S51B77bOr
 JrE3WZTFwDOO6I0FodeoICJYSZ2r6v+i7gJggXex9Pp9XoPvPaoxiRJK625Ub7l7H8WbBHxcrlQ
 QFHuL0U6A/t/w8zRwRvXqwJ4nDv5LctWSfle5yI++rUoaafWPGhxnMORxJaPRFomeN3R7GKca+y
 vD3usC0D6J5fGP8ULbquI1lwcBv4SMF3AN0NF/n/SYZ8OETZQ5sWzBpaPehIiOmwC71dgC924mg
 Ng5vYD7ilJ0wVqvHSLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080068

Enable ethernet0 for the Shikra CQS EVK board with its DP83867 RGMII
PHY. The PHY is powered on using a GPIO-controlled 2.5V regulator.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 46 +++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index e62ba5aef71ff5b15e55810ae3d80a81e15e44e8..7b30c67c68e8c7161bfdd25168fe882b394b5558 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -21,6 +21,42 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	rgmii_phy_supply: regulator-rgmii-phy {
+		compatible = "regulator-fixed";
+		regulator-name = "rgmii-phy-pwr";
+		regulator-min-microvolt = <2500000>;
+		regulator-max-microvolt = <2500000>;
+		gpio = <&tlmm 149 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&rgmii_phy_pwr_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&ethernet0 {
+	phy-handle = <&rgmii_phy>;
+	phy-mode = "rgmii-id";
+
+	pinctrl-0 = <&ethernet0_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		rgmii_phy: ethernet-phy@7 {
+			compatible = "ethernet-phy-id2000.a231";
+			reg = <0x7>;
+			reset-gpios = <&tlmm 135 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <50000>;
+			vdda-2p5-supply = <&rgmii_phy_supply>;
+		};
+	};
 };
 
 &remoteproc_cdsp {
@@ -57,3 +93,13 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&tlmm {
+	rgmii_phy_pwr_default: rgmii-phy-pwr-default-state {
+		pins = "gpio149";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+};

-- 
2.34.1

