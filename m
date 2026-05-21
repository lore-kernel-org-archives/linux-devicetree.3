Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5629C3FE36C
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368876; cv=none; b=k0E4dfMYtXefRObITAKJl7+U1Krj3zya1/VkKvtPnOqIa+sweAToItlAM/7Z2d9xc6J8ihrwxVtI6Wp8hXbBDYnJposF3Byley7xh7AZHbJaz/ZVkwuQTWVq397mNp73zr0qDbasKxBQ4w6qm4yqRnv7Cgy10xrZIpLbzuJvZ14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368876; c=relaxed/simple;
	bh=YWQTnwwuDj6jKqmNIBBOM458HqBbqXiHVkCLAkWhTu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OOwcY6H8sQTLUMSsmKf0JvGqK1B7w4nEClxph1vJ3Fx8xySFNUzGj8qGr9Qf8DV/CtspJFZmUNSvphXrGNVGPyqldgVhIJ5NdX4WOldO8KqFpT8EkkC563G5dPVzo1RpZPYxwsJOg1hGzM01xmxc3xT2p6LT1n1J3+b3VFUhhKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kWNE4Rq7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kf4A5Hc7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kWNE4Rq7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kf4A5Hc7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99pbf3009557
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gxffwanfGPhkL4TX4Kfzzu4TaWJkNBos2KiB0FBhCVM=; b=kWNE4Rq7OWCtxnEV
	vHXJeCJOWb+m3I7UAGWvVG1DLpIjFop3pgCcueJTcmXRxdxJ0CtpRuAVaO4sb4k5
	UxAJ5+Yfaa15HElmfCDSzmRFRoal2+/SR3nbShgHD+LZdJ5XnyNkg5D5XAHVkJ1F
	HaC2myu89GomQgTrndF1uCshyBwtwrk9X9ve0ZnukS3ZjZWeWMlxHwTCdmS6Go+N
	rPJ7w2gepbvnob60E1LHi7l3+tMPofshmBtAr4lTOaJOd00BpUHUipurWD78GCd3
	dGrUZ33N5S7ij6nqR4c0yJVGSXt33SZoj8K8mpG1++nKxcb79VIibilUD2Ci/kAV
	CnP6NA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9sr329tq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:54 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c850fcc89d1so649377a12.1
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 06:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368873; x=1779973673; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gxffwanfGPhkL4TX4Kfzzu4TaWJkNBos2KiB0FBhCVM=;
        b=Kf4A5Hc7gCnUdVXF5I4YkjMe650Vgg70lxWfPNFBA2so9QMY4MKD4yFur5S2/Gsowh
         4Ppa3sOygijDl9ogm7Rfesy460jECv3Lvqc9ky1Rg38NXf3cJXjCnFbYPy6HaNOlXHli
         jI5cnkaNTPYz8qGUq2xcp6BmsT/s/v8nvDrUeq/Bl2cJIs9xIukChopjgYk2uQpGfsqR
         dkBSvPpmx5B0sE6KXL9FHGBfwrkyTb2nquiRdFWpY68RoVaBFgjNzB7hWWcPM5OJuAF1
         22ke8ncwxRufIC8PlrqCGR8PejnymLNHenqIwtvuyAfEj30eDXcyBOm7YkWIFeKPngK7
         AZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368873; x=1779973673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gxffwanfGPhkL4TX4Kfzzu4TaWJkNBos2KiB0FBhCVM=;
        b=YfOdPpLyodurU1899AoQZ3Yk5GLiAmRjayiZ8PjCRyTaMUa5c5+tonV/OHh5O2Uv5H
         BG00zp2Qv6wS1pSDwNCr5qJLjVM6LhXDyFjiz6VUjQVJMUVql0ki1//M3cMe73yefgkW
         uRK1l//w2RO8/yQLvJgV31rC54oSrZRIizp3TQQnoDv+Q+5wTFZ4Bd6oo1UqX9yCGzIR
         ayEKTqMeGbH/cFgMPHdKSx9RgG8mj7cTdyynUPxEnWpe5oJCbTlEwAV0lIndogkmbmj8
         EO7rBE/VttI6uuhPJKBJcZAS+Jl2KJiXxfnZLQhGedJoOt5fQcYxsWlh3kkmi4hDPKvW
         8sqw==
X-Forwarded-Encrypted: i=1; AFNElJ/+llTP8afdhtEn0/14tORniEB0d67gCVt80wwDJWP5Xk95EO/qH4CL+N9A9Qjv8X1pduha1VMh/oTu@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/dLGLTcXxF3mPq+1NLq4a+zuJePMQ61iAmcLgo/JRK8QKZg/U
	Nfp69j0IzRAVOUOBGjV/3oP+PZJbV2y5qPT/7vreNc1Ey557dpnIJENmCx9r3j2Rp0FNCpCHNXO
	TCvSm4lvfxZHrcL1+xnQOMkTX693PuOgHpJfEmQL7OL75LThUqAayCqt3mT31BJ85
X-Gm-Gg: Acq92OF18JBzDWsDTBhX1Q+I1h+ELfmilrm1LqIL7dE4fN6jsohOLgcsVSXcwaqWJQ0
	x/+u+HTLgdpmUvUt8CQcRDtROSCpuwAg/APU3pWgAWDzD5R1aMRuddMiCK5bNDSSNwcBIvdbldT
	pFtRqnUn0waqeoGJrUsE84G43SElrkpvx8H/nSUrTC21VHzTv/Vec5MWko1gfoGkZNOg7YBXZsR
	5DfEeqClIpiYqyQsfn5Atl5lF7zr5edbpw2NT0OctajW8cFJxubtenTAEL8XPZKDHqzH/iBU2kx
	BosVGwf8g7kHjsarYxAaQpcoucYjADpdk6Yl/7VDe+6mDIB6gIBVdJLMAtNvTJGbIMW1cXQhF8l
	5dYvHjNMialk28kdcuBL5nix3KHaEs2Wu/rlJGWu4gEHBrRpTnr4Lr1wuVwEf37xO4KE=
X-Received: by 2002:a05:6a21:3390:b0:39f:1f92:28e with SMTP id adf61e73a8af0-3b30874e6ddmr3504163637.27.1779368873150;
        Thu, 21 May 2026 06:07:53 -0700 (PDT)
X-Received: by 2002:a05:6a21:3390:b0:39f:1f92:28e with SMTP id adf61e73a8af0-3b30874e6ddmr3504117637.27.1779368872548;
        Thu, 21 May 2026 06:07:52 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:07:52 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:36:47 +0530
Subject: [PATCH 14/18] arm64: dts: qcom: monaco: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-wake-v1-14-d822567be258@oss.qualcomm.com>
References: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
In-Reply-To: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=1812;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=YWQTnwwuDj6jKqmNIBBOM458HqBbqXiHVkCLAkWhTu4=;
 b=7Z9bIiI413fVVHiiSsNDh+c22qDCxGBUm+fOW8z6qvb3YllEqq5QGUQpJw8LSV36/RrRmSZoD
 eV7Z0Ud1C/bBP9Fh1jKNZbIAHyDQr99k9R1KLVCgepWjkotHfyEiK5r
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: gYjAZyYcquHEhEp-g1-XdgBhm-7543hv
X-Proofpoint-ORIG-GUID: gYjAZyYcquHEhEp-g1-XdgBhm-7543hv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfX0/SDszxfc2xq
 hwapEnmdJHn4Jd3aKuEY9nZDoCQ12qWv4BwRQ+2XFh8igGDIBJ3yGhp/Hm6IUOCVzK++8OgzPsw
 J/4w01JQrpqfiUPjGXjW6CsWfWCPKDfN3CBhBPRh0qEmRZud9qn1TEZNUK7Bd1HmaU2u304xidH
 un9EAZZ8p7hAt0ikRYG3qz9+6dJeofWHyv/ejGf+u1/iB3AVxTp7auUOOr0jpLHna+j26iw07b7
 g70yaIc1b+9x/vktRazsvoSOAMN4pBuOxiqeZJ55WCPH+plp0By+MlTEgPaLl868aTg89OwkcC4
 wb5hcUnKSBQ2LF7n8iEzIUqXrhAMy6h8Z1zp3eE57w6rWiEpSK37iwlyXzvVmJrD+QuPY1nTmKq
 bsWjoIJ/oEfoM/+pVn8S4bq/opFZWYUT/KTPFeN3GmHPfA6U/ZN4YqBacS2dAPcOrBUxpBQONAk
 RzowQhxcswMlrEKPDNg==
X-Authority-Analysis: v=2.4 cv=L+YtheT8 c=1 sm=1 tr=0 ts=6a0f03aa cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210131

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts   | 4 ++--
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf..b30fc7ecdf32 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -643,12 +643,12 @@ &pcie1_phy {
 
 &pcieport0 {
 	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
 };
 
 &pcieport1 {
 	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 21 GPIO_ACTIVE_LOW>;
 };
 
 &pmm8620au_0_gpios {
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index e9a8553a8d82..f9891fbcca90 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -615,7 +615,7 @@ &pcie0 {
 
 &pcieport0 {
 	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
 
 	wifi@0 {
 		compatible = "pci17cb,1103";
@@ -651,7 +651,7 @@ &pcie1 {
 
 &pcieport1 {
 	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 21 GPIO_ACTIVE_LOW>;
 };
 
 &pcie1_phy {

-- 
2.34.1

