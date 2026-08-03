Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48058388E5B
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 19:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785785331; cv=none; b=rYn6+FOBHhfeqnNm01ozWPyFBqCAoyperFkG+wTSItjXgfxXGYEO0W4JBIrz/KdlVPhGJ74ZN+sjlLPahgnu9BT2munZXrti/GB+PabEH/rWuujt6gzHfqy4NfcouROXEdPbWxCMNhC1xrsSNDvhiDaucMva7V3Jzhtlezo89QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785785331; c=relaxed/simple;
	bh=wN7EnvVz79rBaErrpDbknCUjIlKRTgAhcfR9ZiqhdnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QZhro7RU1q4OgnI9zrU6cEd8GDbTfSGqBaH4Wyti6+Ph80/RcMIub35agkwyisMrXz6Pibq3TG5T7Hh/Id5gKku0lwzdZZbiLJf7nOZOU7FIdblLm6BbM7PkgwhTkPsXWCDNsxsEWB3RFpb7f5+OpOGOu/ejC2h2f2NrRktw1Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jKl2cRAQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SXts/1/Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jKl2cRAQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SXts/1/Q"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673GwESX1301999
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 19:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6b56O3hExLavSIUEO+Tuv4eo6B8V4NFYJh9QW0T3V4k=; b=jKl2cRAQOSWSEX8H
	604Dk8bpE6Wi0Dvubie4QeKka79EEP+H38tiBcn+0QfvdSHaKC3houQFUDG/LXda
	aNDRaPp/4C7aNI/2fKajiy0dBoBBj4vbI3NNmmQS3R3iK7d5xvdqjbaJPjWyHBYJ
	XKf1sCz9ZRG8NPDsgLWAtSfZBfxmqtMmUz9vLwhaKw9kxBJ+tiyYOu03uW0I92++
	mtehm5icfKHnyWrHNpHHlnxjwWuNMm4A6j+KGxQex0yohflSO3YVQ3Z32UiMI35H
	S3HQUYI7zYck9XI5joaugJstlP4i8wqZubwVcrfoTn1a+ch7nOhizqxVSG4p3eMw
	tjCkzA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrtbcnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 19:28:49 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85798977dcso6352758a12.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 12:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785785328; x=1786390128; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6b56O3hExLavSIUEO+Tuv4eo6B8V4NFYJh9QW0T3V4k=;
        b=SXts/1/QRA/rfh08KpE6ur33B+p2kVhVGn+mM/4P9lVGd4hn7PVyh2V1a2x7QT0Tfx
         7i5hz5CfINXwwK8+H+e2HwqNbu/Vvt0hzjgsl+ptyvf4oV9HD+LCdkTBQTV19+ujQnav
         eHKaXnBYqf4uP1P7dlSm641CImkaxsfcRk7cmsrl3WkpkQDvyIDhXiCtJWyDUdpG5wNb
         +3Nj0NVNPlcMS91FSu/9B+3NDP4FxM76xR2a+3nhMTvzRedlBsBd/QZNdTxq+o+t/Hbh
         56vRTgXyYeRZYGZO3ca8sOm4vRrvXT0tEkmfnZPzgWK3HJuyGrdC9N4W46nvVuNbrtfI
         F8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785785328; x=1786390128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6b56O3hExLavSIUEO+Tuv4eo6B8V4NFYJh9QW0T3V4k=;
        b=LZmNmSk1Sl5kpetoTTQNoBMyt1vkOgR40uoMZx/b66UsJzZenThq0nYqW8e27jMo3C
         QWveVP7dWeCkqPl2lmsIYVuWIM9x9SFpmjpESQ5IgTN+L4xkyL6Ym67SkNNqvJNalhiJ
         WkRL44oLwQpG3MKDCM/Rpp2zeOSy4fciLfv4on6D/9a5tzpX/9GrDMtObmYJ3K2m53Rf
         TAUO6byEqh/I/+9gSKqUPKtXAJ60kZJhrrwkLf7/Oval7Ju8gS7yQni5OTzWDtd5HSEi
         MFmjHLYeIIJUeus2lDJ0bgpQgQyvi9E0nsvYNLZT5icCUhwcIkB/nUv21PB2NcGmbCAN
         v80w==
X-Forwarded-Encrypted: i=1; AHgh+RoTfAl2Pxx+rJFfcO+RLTBRYjPqY9ZFIP78RPZ+OJaA3y/JDqJptsU9Hg3wicWJHhnFUgTCz9NqJgwt@vger.kernel.org
X-Gm-Message-State: AOJu0YwkKeDfkY1SNjJ8t+itDgEM2Ov19uWhnUHY/Abri+/1o2LUEw+r
	YY8tojRWh0N4DvVO3ybbT8ZnSk8G4RASGzFbDWtAgrzlIi2RqNN3c/3zym2DsHcFZIHDDN9sOwe
	rbnYBLMTYsGEsiwXSS8RMOKIiVgUc9RXXKPXHtGN/TzjEfDpSkRzrRNd1C8/6NBUf
X-Gm-Gg: AR+sD10MSfsyr2lFT5dnWjmEpX9ByBAHsztmIOLq+slaJDbY68FRgNkwzgWTPlwXXu/
	QQ7XdcUsyzt+++PW1TIOHz+hyqEDxZwVKH+jQNLqFxY4gu9Xe8mUdIqktrcfsa2XG/tL7BFuiFc
	atZFncltL36XAGAXfgtTQVn2DzXN4xTyfbsBdwT/BDw8LtaXSkBaWuflgVLccuBkJm5syDjORmT
	N/dADyd0MJcE7GZ62t0cfQ32eTAiA7a8bpz2Ihw9OFgZlKFoI5bJlDX849ccsKRP5+5r0uHXuzd
	5TMYkO1CYJ2PyFzX9xozu/aNbfhzd2n8+tc018HCNOxsP8g77owFD5RzYflifPLOlac1RJEvQUh
	e2OLeTA/13LZL3pK6Hp2RfrJ7eYrDFg==
X-Received: by 2002:a05:6a20:d80f:b0:3ba:cd5b:3dc8 with SMTP id adf61e73a8af0-3c92a5f1c89mr10958864637.31.1785785328086;
        Mon, 03 Aug 2026 12:28:48 -0700 (PDT)
X-Received: by 2002:a05:6a20:d80f:b0:3ba:cd5b:3dc8 with SMTP id adf61e73a8af0-3c92a5f1c89mr10958829637.31.1785785327611;
        Mon, 03 Aug 2026 12:28:47 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm38622738eec.1.2026.08.03.12.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:28:47 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 00:58:00 +0530
Subject: [PATCH v2 4/6] arm64: dts: qcom: lemans-ride-common: fix SerDes
 PHY regulator supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-b4-sgmiieth_serdes_regulator-v2-4-c4bc688177dd@oss.qualcomm.com>
References: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
In-Reply-To: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785785297; l=1293;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=wN7EnvVz79rBaErrpDbknCUjIlKRTgAhcfR9ZiqhdnM=;
 b=mc4Qxcim7cpfZcq/vHaJ6rhRe2m50OR1wGF7K/e5Kh6fBL7VRKbtQc64BR2nETvTO/AHAXifF
 lCXbrv5JUSnD6Woig6Yu2Tdl6BEQJyMJ3mL/4FGIjpUWf2sRHOd1V/u
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE3MiBTYWx0ZWRfX9h//9sulHIX/
 V43JCjQ12nfb55CEihX+mYlqd3e5ZyLhCIxT1KtuBDTaj9fuRl8H8YA9p6/pdTEBGQpOE1GGYCD
 G/aQqUGJJMBtF3ZrgsHghgd/D+K0kNj+Ln+y3xqdivwthl7jCWFsJnNlUrE07QkTCx+ketgh7P9
 2J4KJ1mWLpfY0mB2nkjO1MxxFnj2H/4Xc+TNARdlhWpH+wsq+2I1ZUCWATqQct+gsdfSE028ke5
 /TOrfjfcp48+cTOjnyDxyDYRrRAqtpVA4rnCePoXVbVzZKa/TBs6PTqXiwaCqkiZKh3nuwoOKhi
 qXlek27HiDnUC7sK/hTkLu1eVw/dLoSQXtoJf/GjTKci9KfXrEpqm8jezVvaWKHHimv5DFW6S0g
 PvU+jFn9KMbtra1PcfbvWn1sVBopRUtYt7Xz8TsTB/zshDqiuf0KqaXndu51gs95F/8TB2PP7MN
 Tdu4aDTnVW1KAHChIRw==
X-Proofpoint-GUID: AZjLcKNuHI4YYCU9hPOXzmygkW1SFvbH
X-Proofpoint-ORIG-GUID: AZjLcKNuHI4YYCU9hPOXzmygkW1SFvbH
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE3MiBTYWx0ZWRfX8/8+fIczAjuz
 IvNtPxmMS9PlYS3pA9XFig3tFn6SP8phSexT0hd3xUVMPNgndwLUC8B4KLiH2E5EXtfoHpBSOuG
 XrBUahOG0JHnZl0TA6bhPXwxvsmp+wo=
X-Authority-Analysis: v=2.4 cv=Ft81OWrq c=1 sm=1 tr=0 ts=6a70ebf1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=0PZ1-FZOml_IEO0701oA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030172

Both SerDes PHY nodes were configured with 'phy-supply = <&vreg_l5a>',
which was incorrect on two counts: vreg_l5a is not a supply the PHY
requires, and only one rail was described where the hardware needs two.

The PHY requires vdda-0p9 (vreg_l4a) and vdda-1p2 (vreg_l1c). Replace
the incorrect phy-supply with these two named properties on both nodes.

Fixes: 5ef26fb8b3ed ("arm64: dts: qcom: sa8775p-ride: enable the SerDes PHY")
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index cefb8ff0080631e25e9dd3a05cd810c6955bf1fe..923fd8736f31df2eb5198b27ddf52c171f7b2943 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -856,12 +856,16 @@ &qup_uart17_rx {
 };
 
 &serdes0 {
-	phy-supply = <&vreg_l5a>;
+	vdda-0p9-supply = <&vreg_l4a>;
+	vdda-1p2-supply = <&vreg_l1c>;
+
 	status = "okay";
 };
 
 &serdes1 {
-	phy-supply = <&vreg_l5a>;
+	vdda-0p9-supply = <&vreg_l4a>;
+	vdda-1p2-supply = <&vreg_l1c>;
+
 	status = "okay";
 };
 

-- 
2.34.1

