Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497BB48663E
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 12:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251823; cv=none; b=TfX7ZQd5MKyZM9kqBu5LBWObegsv930fT6gt61gKXaapRLMgnxC8Bml0Ny9MMo/myjfTnggqxUXDZAd17+r0lRUWezebYoVZ2ruDQ01BVxkph5ciupUV74Rh7xCxhb04Oaka6OHWKFa9ycoOSksX+fnO/ik+R/2PsO1RStoaodY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251823; c=relaxed/simple;
	bh=NpAZldeAoyzGBo75hnKstjC7zRSK+xXJRSl5HAQ3TZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C5LuzSvobfrtTAuQ2vULG8dPnrAZaAs/w4xDDa4FM25w5lOIflE60DiPqsN7Ozv7abdy4kn45yoMN+2kvB7S7q1qexwRk/goBAl3sz4R7lUrEY+Vr2fm+VpeFz/7J1aR8y/dSzIgbjpoaRqbfXVnxinxQv/4lcXWCGbOpTWDDWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EoJdnyVO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BI+p3Vmz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EoJdnyVO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BI+p3Vmz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4Tv73282795
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 12:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aaXLVPEu+d+wf38cxXleh9LgP5i9sJNqPRJ3U21f5xw=; b=EoJdnyVOhcpQjR8Q
	MFkhVCR9wkiok6GCAAuPGdJc8K3UslE5PnllW/+cJlVx5+rIcienf2135AvGdG69
	i9iyLeeRGmnpuX7DYR94Ztf9T7Jaq/rYhkO9Hd3iM9j7k2dPCnFIBD5db7XP7e6u
	n1ug2vP8B59vqIE24k5MI2mlUs2fr4hZeD2Zs0Axrvt6QvXFx1klhrQzMOoxMcnA
	Dtqd/VncYu9oiMOmx6sl+RdYGMwe9lddGFaGlMSr9wfH8xKpGStBmM9j87coU3oH
	+YJB1gAEZBLsPSgUBkfhWekk3wXbOoV6pjusAt07WEsT5hatG3X0LrIwWB/XgjL4
	b7RwlQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvstujg44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 12:10:20 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7a9378b844dso600642137.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 05:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251819; x=1790856619; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aaXLVPEu+d+wf38cxXleh9LgP5i9sJNqPRJ3U21f5xw=;
        b=BI+p3VmzasLveF8Zh7ZYULcJbW0NMvRu+qwqBdUhvnrcRWmztk8zzI3dtz0XV7ccIY
         OD298elcha/cXoB8CE+rFx3qHjcapaCWTtID9Bp8v9ET3xwSXfMFZw7i9r6J3/7CiOjm
         XlILXIGku13xpANH1QMjm6iJrnUhcS3NGFEno1QCuz+wbKZyMjmUOocBXbe9nvcpaWi5
         P5fFSUdcG0KUfXKQrCK81TdrgMbToTH0N1Lyd6ts36qmhYqoTY1J6UripJAKB15GwBnR
         IafPmSSETtU8gqmkqvwVaXd6Dyw+hrHN8E8okPgn2B16/QupJjVB2VwgwzM/hWsfduTH
         1ePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251819; x=1790856619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aaXLVPEu+d+wf38cxXleh9LgP5i9sJNqPRJ3U21f5xw=;
        b=vBRlt+jWf+PzrKbSm9IldY+lVsEXj4o1p0qUTHDHIC6zoNZbRmvrExnhB1zwRlsRqk
         /hy9zzk4JC7e//4NbOlwyxfmoiy+R059ZvbMftHeZQhfEkWNdh0skWc1FTNC7BAtcMW7
         t1Eot0XbSmkhFuZRtL5rZG9+m87dsazrEr/CohGmkekTs7FaiQkrnDtSBDIDcludShNZ
         tbDmZcoCo9oVfntX4gyhPdMiW/9g+efbVlKfKQqWHtJIin76O93IMJBRdmoS8L5+d6fV
         nO27oxyntGqDMtZlkbRjhev/I8D8VB1Iy5tbDjFtNs9uwrX5cBFU8bamqoiNFA0c6WQn
         IitQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJgUtQHoWl0/MnxiSGs1lzxDuyvRpgcNX99DxokDuw9AC+v8Zxf4dBWDzrQc/SFJpnv3GtUv7jhZI+@vger.kernel.org
X-Gm-Message-State: AFuF++k+jSZxwsMfgOx0kuAIdEj3kJJMhD/9cIMcM9ZQnKoG3SWN/cxs
	oEpwkUmE8s0bieZkaAkamuQMzjfJ3RrN2x4F8Llrd7HQ+G/ZibVnd1NjkOeOeLFsijyP2edAOKu
	8BVLPRRSfC4H7IkmyIahrkHH75kskUF0fzrALnk91I4v4/RjEAwuCMZ7kOehhaStdp0V1a7gs
X-Gm-Gg: AYBFou3/Ja39CCcwkmQEnXWoelpjND5zSFC9dzxlNcQPrQ5dt9aIIRteqC/M1Y97L9e
	bUxl1EG7VUYBk1uN1fRSSt2Yr+ZYRiqq0N0In07xObTI2mt/ABkPlVXqRvzzaAYG/47yW3otFeb
	QE9yEgeDPAnXf4UXKxAJsXqD3vynaop6uXpaAkQiPKZ1sCs/r42q7wZTwZySFnf4mF+cLULcybG
	7x58y8KinP14Lb5jO0cFe/jwI2fwdmIfhhk31SCv1OZLUGsveA3/UsHREfz+QVRQCigw9E/98b6
	hgxwRC/HWvFofCwKAveeaUmiP69LyweKDZphBStCcBHM71IZYl1Umm7zBjeNfXV+BcaVNiZw7Nq
	E6TbiHfQtLDR2I7scbgphXUFvz2dJ
X-Received: by 2002:a05:6102:f12:b0:7ab:d3f6:6225 with SMTP id ada2fe7eead31-7af19738629mr1067700137.0.1790251819099;
        Thu, 24 Sep 2026 05:10:19 -0700 (PDT)
X-Received: by 2002:a05:6102:f12:b0:7ab:d3f6:6225 with SMTP id ada2fe7eead31-7af19738629mr1067678137.0.1790251818168;
        Thu, 24 Sep 2026 05:10:18 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:7d0e:af24:d3c0:9a86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886877a2a5sm15227876f8f.26.2026.09.24.05.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:10:17 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 14:10:04 +0200
Subject: [PATCH v3 2/2] arm64: dts: qcom: nord: wire up GPI DMA for QUP
 I2C/SPI engines
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-nord-gpi-dts-v3-2-74a85134699f@oss.qualcomm.com>
References: <20260924-nord-gpi-dts-v3-0-74a85134699f@oss.qualcomm.com>
In-Reply-To: <20260924-nord-gpi-dts-v3-0-74a85134699f@oss.qualcomm.com>
To: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10183;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NpAZldeAoyzGBo75hnKstjC7zRSK+xXJRSl5HAQ3TZs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqtRMiTfpORTaciHnrk7aXomcfgu9adESnLPYha
 we4VKXAqMCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarUTIgAKCRAFnS7L/zaE
 w5L8D/9WdpIUzubtT6qqDUw4V7np16c5RpdAME1f1rO8d55WN8tmhYwwy3l8T74Dlc2lR/L43ZW
 AhKCS7LzBxjj9q91jZxmAU9HVR3pVtXMsUr7YCrLGls6fM/N/joJzOOCLcrk/jV0oyIHTiL1kSf
 Kx9R/0E52KOEx/DQHe4t85QbLIuE+V23ihV/7EVj97afF1CHgXIIf3V7ZC9X9Aj7uwvJp4nil+s
 tk2LIcG1Q7SrhAd8viz5NsR69an4kC+NUBMdyeAfXwjRpMu5XGyrdE6NGDYVNuD1n1aeVqAjQfy
 Jlvfnn9c/ljy9j9++7KKN6+Sc/FY7XrRDOVF4eFBg9oTfSERSN3GydwJOcn3ynuw27wb/R7uJdG
 maw0YC7Fk2mYq6hGhtfj4t+9a/S3rZGjcwebwY5XK92VmEBC4MXxSQR/Z74foqJb17uV3L2uQgJ
 d3+OySILQ13frzCTWas+uA6ibpMVY5YS8igbT7noN5PK/92Xjq1n2lO1tvynPfMV9sUK9lNiKGP
 fpsVD8NL2VOJJZUTLh61XvvRUft+QrrctVz09ZODOlaBekzwCuklUE19dCx9B7qTKyx3/omq3eg
 4jN6L6K+usPTr2DZxlMxCrnxYLikXCP2p+fyrxxGaQRx7ZeeWdtcomALdijmtZnEmGCy9PkVkCc
 dGfgNoiQ6iA6suQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX5Er4Kq7bDI6t
 vyTEL61dHElYO+hLw8aqQ8vXnPfun0Evyjy8jpUD3JYGsBfc6PImTZebvuEXbT0iUK1ksBVZMgH
 YtcefCDRFx/Ev9XGHit0NhcvSUoNkMU=
X-Proofpoint-ORIG-GUID: YHIxScnSdtlx_gq0NukkusYhgC2Q8aYU
X-Proofpoint-GUID: YHIxScnSdtlx_gq0NukkusYhgC2Q8aYU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX8mZF2zUjbaal
 GsU8MpvIbVt+/rS0qpZMAApk7q9wQ/cebAmMW6BNvv4SowmjegWu0Q/EgpsbuKSnLgIH3RsGZXw
 ljI5i7eeardoFmYCvPLvAhky6xdtD965lUfXHzwEw0JgDrJNF4YrE3Gk7VSgVWnWPmyiym72Aat
 Or8FMhU4T/h+TWsLm+jP/pK8NTwZmQS03wg4Gbfp07f6QsRKmUdx9C6RQGqJGUEcenep4vkzhbH
 uxhZy1WzXk95TOt4WL3Mv+hHGYw7xOXHk6sCMtibMU9pdWgRhydkk0LVfUTxhxICYp5CUoSJzUU
 2S2M+yqRwyDEFaLYNQ0pdEaCso+AtHFw4yRZZ4S9/3u9haFdwyWtyfrAsqKE43KgIMWrl+tDq5x
 gyNo2U3aMAPHIV6DnUGpLML37xXta5Za99gpqf3lud7nk9Zs+p3gExi/f+Jw5GMsjTUM6k3xOlX
 c7bRYmJkj95nUnsYAig==
X-Authority-Analysis: v=2.4 cv=cKp1IVeN c=1 sm=1 tr=0 ts=6ab5132c cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=A0ElxUCGbprSqmrbtIUA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240050

Add DMA phandles to I2C and SPI QUPv3 serial engine nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 124 +++++++++++++++++++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index bc48238050ecc6efa342f68a568447be6f9068c0..0ce5db747919952bf0c785592b797f88793a3047 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -944,6 +944,10 @@ i2c14: i2c@880000 {
 				reg = <0x0 0x00880000 0x0 0x4000>;
 				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -971,6 +975,10 @@ i2c15: i2c@884000 {
 				reg = <0x0 0x00884000 0x0 0x4000>;
 				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -998,6 +1006,10 @@ i2c16: i2c@888000 {
 				reg = <0x0 0x00888000 0x0 0x4000>;
 				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1025,6 +1037,10 @@ i2c17: i2c@88c000 {
 				reg = <0x0 0x0088c000 0x0 0x4000>;
 				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1052,6 +1068,10 @@ i2c18: i2c@890000 {
 				reg = <0x0 0x00890000 0x0 0x4000>;
 				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1079,6 +1099,10 @@ i2c19: i2c@894000 {
 				reg = <0x0 0x00894000 0x0 0x4000>;
 				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1106,6 +1130,10 @@ i2c20: i2c@898000 {
 				reg = <0x0 0x00898000 0x0 0x4000>;
 				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 6 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 6 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1117,6 +1145,10 @@ spi20: spi@898000 {
 				reg = <0x0 0x00898000 0x0 0x4000>;
 				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 6 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 6 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1163,6 +1195,10 @@ i2c0: i2c@980000 {
 				reg = <0x0 0x00980000 0x0 0x4000>;
 				interrupts = <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1182,6 +1218,10 @@ uart0: serial@980000 {
 				reg = <0x0 0x00980000 0x0 0x4000>;
 				interrupts = <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1190,6 +1230,10 @@ i2c1: i2c@984000 {
 				reg = <0x0 0x00984000 0x0 0x4000>;
 				interrupts = <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1209,6 +1253,10 @@ uart1: serial@984000 {
 				reg = <0x0 0x00984000 0x0 0x4000>;
 				interrupts = <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1217,6 +1265,10 @@ i2c2: i2c@988000 {
 				reg = <0x0 0x00988000 0x0 0x4000>;
 				interrupts = <GIC_SPI 514 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1236,6 +1288,10 @@ uart2: serial@988000 {
 				reg = <0x0 0x00988000 0x0 0x4000>;
 				interrupts = <GIC_SPI 514 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1244,6 +1300,10 @@ i2c3: i2c@98c000 {
 				reg = <0x0 0x0098c000 0x0 0x4000>;
 				interrupts = <GIC_SPI 515 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1263,6 +1323,10 @@ uart3: serial@98c000 {
 				reg = <0x0 0x0098c000 0x0 0x4000>;
 				interrupts = <GIC_SPI 515 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1271,6 +1335,10 @@ i2c4: i2c@990000 {
 				reg = <0x0 0x00990000 0x0 0x4000>;
 				interrupts = <GIC_SPI 516 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1298,6 +1366,10 @@ i2c5: i2c@994000 {
 				reg = <0x0 0x00994000 0x0 0x4000>;
 				interrupts = <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1309,6 +1381,10 @@ spi5: spi@994000 {
 				reg = <0x0 0x00994000 0x0 0x4000>;
 				interrupts = <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1355,6 +1431,10 @@ i2c7: i2c@a80000 {
 				reg = <0x0 0x00a80000 0x0 0x4000>;
 				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1374,6 +1454,10 @@ uart7: serial@a80000 {
 				reg = <0x0 0x00a80000 0x0 0x4000>;
 				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1382,6 +1466,10 @@ i2c8: i2c@a84000 {
 				reg = <0x0 0x00a84000 0x0 0x4000>;
 				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1401,6 +1489,10 @@ uart8: serial@a84000 {
 				reg = <0x0 0x00a84000 0x0 0x4000>;
 				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1409,6 +1501,10 @@ i2c9: i2c@a88000 {
 				reg = <0x0 0x00a88000 0x0 0x4000>;
 				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1428,6 +1524,10 @@ i2c10: i2c@a8c000 {
 				reg = <0x0 0x00a8c000 0x0 0x4000>;
 				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1447,6 +1547,10 @@ i2c11: i2c@a90000 {
 				reg = <0x0 0x00a90000 0x0 0x4000>;
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1466,6 +1570,10 @@ uart11: serial@a90000 {
 				reg = <0x0 0x00a90000 0x0 0x4000>;
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1474,6 +1582,10 @@ i2c12: i2c@a94000 {
 				reg = <0x0 0x00a94000 0x0 0x4000>;
 				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1493,6 +1605,10 @@ uart12: serial@a94000 {
 				reg = <0x0 0x00a94000 0x0 0x4000>;
 				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1501,6 +1617,10 @@ i2c13: i2c@a98000 {
 				reg = <0x0 0x00a98000 0x0 0x4000>;
 				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1512,6 +1632,10 @@ spi13: spi@a98000 {
 				reg = <0x0 0x00a98000 0x0 0x4000>;
 				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 6 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 6 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 

-- 
2.47.3

