Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793223972;
	b=oeVrRVbk0++p8NRoobeFreDY3zw0pQhL4paxJJJL348AwxeYJ2BNEwOA03wdqha8BOaz
	 MuFy0oXOryomQHLrGjmeLRnKwB7udf4CUWOCM2hmDNesT0sWlg14zzPYojUkflWggJJ3w
	 PRHffcMK+cynvjzdCm5GZa5id1OatgVoT3wfP8EeI00lMJXpxmEZuLXRAfj0r1yUnT0Ye
	 ti/DOQMC+CxJ39eD61Xbi/HVCzSp/A7atu0OjUZbduLg+SQHDA0Aw/RSomPBJ2lkT6boz
	 3OL4YIu7TCwXbofd000a5YVHp/NIK5LynwpUBGL6iF+1H4X+iJv8xe8JPUOxkBLEcVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793223972;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2qTSPs3WOjSMbvYUNgRZIsLOaLBSwX10KkzzPzLpRFE=;
	b=phKFGOXRj8heDGyUPTIuIqJb2X9iy6ht33+adWWHf60NfVuBAQ2eYvtQnJClxl3guw/8
	 vbx54ZYruXy4D6tfm+o+X6MsGbQbQ8cIHhK2pGo18yDhJ5aVrDoS1W8f+rTaKCAzRhQbV
	 Q143RomjC2t280jjjcaAUIpfzLzXDOf30N7BIpowMopH1dmHsRerPKpdOt8KIj0EZzeQr
	 X0UKg/g9y67En9kZMJjL8TwTUyhMrm3YUasvJliXWOi+mVIMcCvlLxtM7SPo3DbOeR0BF
	 K0meZJVfuBkZKM7vuibVJBOlqQQccdFAWSgKTdUPv8aV1lVhglz+J/F7fSOLefDfn/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lsxYDtvw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qn7p2JWb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87FB606A33D
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 21:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E87FB606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lsxYDtvw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qn7p2JWb
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIcLb91918635
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 21:46:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2qTSPs3WOjS
	MbvYUNgRZIsLOaLBSwX10KkzzPzLpRFE=; b=lsxYDtvwYLs9XrfKSB9NiPvMgl3
	2JMB8CvvW7TH7pK55uq1HkefWFDh+OydkQEEWGnMTmZlWkHcS/KXdGC2RBdPjOLO
	rPyy6qz55XQSEp5B3n9sAGlyPXvslyImKFTc0HK7dA06igjgHIwkQ1hvsNlL6wm8
	JfXKBQj1Kc9LfTgB2vtHh/88nlTtVZ1BOXDx0NcyGY5FlVPGCMajD9hVqq73UWwc
	a0SDd79TACTTZf6V4blZ6u8K9DU4ytbwE+joOv7adxqamQzVFV7dL6jlc6HaXZQu
	fTwcpQG6aPPQZ63Qvg04Bnzpccf55zGHqgU56UBu4aUv2Xthx1F9iIhXRBw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpgprkjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 21:46:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2c0e6653so66669385a.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793223970; x=1793828770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2qTSPs3WOjSMbvYUNgRZIsLOaLBSwX10KkzzPzLpRFE=;
        b=Qn7p2JWbxU0y5SFU9I6cmDNxasfwLJmgXAEIR++nIJWooUqwG7Rj57+LXB/Ja2JhET
         OBNkfXcPDac39N6KAnnivt7/8cxkeRDEnkDhpIn2z08WBit2myHnCbo/4flsnt03sCFL
         SRbxVIHFM7YM0eJoRzfRcHL2V8NPjZzB0l8KkryfJRajnRazKu0U6xmidZMxVdym4ZhI
         IdB8LOaO4TyxTermOsLxmaM8IORQMteYb7xx0iUTCfWym4OWF8EDMkcNdoZSwW4kG9t/
         ey4vrxGJB7Y4qKxO73rVlTdrPQ64umrY7A8uM/5xJfu0b/To7B5rU4v42XXVB+4OkgNG
         czwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793223970; x=1793828770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2qTSPs3WOjSMbvYUNgRZIsLOaLBSwX10KkzzPzLpRFE=;
        b=ew5BXsdP6Ov+mfqUlJamI/Ep4D90Or916Yexdrgxx6KJtb5t0Y2cATV0jp8THTiCWI
         mJ8+y+woaBSYV1c+UwexVE2pYMtwd6KLPm0M/r1opWgflTiI4cDTSMyDbD8MXc/dRoN0
         LYgMWY2uhVRy6hXUyL1X3+VT5/3YPQCJPewFUCdMbNUYQPqwNRK5awR4ccoTmn1v9vNW
         3W7pLVUAkERoTDqTvN+mGBUWHEcEaU08kc4sRdZoQ1pwAZKjY+TclrRLpsfQU/pjQand
         ZuAa71VJCFSK5xyW2ohdj7/ul5aEjl3ugXO1C1nrWJRDPJZM9dezkCSWTcFIc+JIz2dH
         DuOg==
X-Forwarded-Encrypted: i=1; AKwUvByDG8gGwCM0uh9J/MtPlmOKZAHW1w+Sdjj74/ih48ZwixVNws1EDSHsIJo8eJCTyabcP7KHrNcYSkqg@vger.kernel.org
X-Gm-Message-State: AFq9FYJupLkQrAEt4IpuASd548vesJiyMOfegN0EDiaS77Xa+zzqYyRA
	L1aZ17AOM7fwxusVhOmcA9Cs2QW6Rg4cWTRnyDnRdife7dk2POc8G8IxvQ/nR0IFRyBQ2ZAaGdI
	lPB5qUwgZJ5mUD08O6aa/ASD1AiKxVxqnLX5OQMLvuoq2i/LNG+4DTeyctu+eVLwQ
X-Gm-Gg: AYBFou3NJY50bCTC9m3HK2fehx1N4fKgKvjEPA/qp9RhJQH33Hfn7wJoZUJOf+VRiiD
	KNbUe3uOQi1LKUu9jmXH8RmtuAmYDRz3yz9nD2fG5/Sw89lBFJJH4u3h+OTJwHyH8JL1RyDOUPr
	+fXWuXz2oQfU6HKQUQh9qfxax+w+EmNkh9PF6A4SD4/9TP2OK2mCkhlxOvgQMnjVOBEMyT5pAsm
	J4p879Gnx7Nsm7MfOJcpVFebbQfyqbY/WP25xjjHUpS7q4hYycik0ybNEPO+SFjP7DlqA7WCYQY
	/r0eTtk+VfxvzMf28KUi1T80/zcgSs1vp8Dz3Qf7xq+yFVclXPhi64HLgbj47GkY7XYjHUGymCw
	fz1yspfcDNosHu3WKIkGKt3WI0X8bRrol3X2gqb7NjCVyVew+4JQD24xoH6XAhw==
X-Received: by 2002:a05:620a:2b9b:b0:93f:6f8:9d74 with SMTP id af79cd13be357-94408e06e70mr520729785a.77.1793223970183;
        Wed, 28 Oct 2026 14:46:10 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9b:b0:93f:6f8:9d74 with SMTP id af79cd13be357-94408e06e70mr520726285a.77.1793223969751;
        Wed, 28 Oct 2026 14:46:09 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7fead817sm18642395e9.12.2026.10.28.14.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:46:08 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 1/2] arm64: dts: qcom: monaco-arduino-monza: Enable I2C0 and SPI3 for 40-pin JHAT connector
Date: Wed, 28 Oct 2026 21:45:50 +0000
Message-ID: <20261028214551.108424-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261028214551.108424-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261028214551.108424-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA4NiBTYWx0ZWRfX6JTgJAVzILCo
 /Jm4mGh4YLOWBkEm7WP105TowJdx3/TWTc+SC07IKSmFKpjSNawAMZbx3auN2WrS4LlIgF9p0kp
 Ss+uA6GBsc01u3aGOj5MU6LvZliLVJzwG0znpeLv4FGKY+r1W9I0URiN7ahiAEFE/mMW3bDmvLh
 qO47w7RvDW5ZUs6xo4uhO7E3POqQ+wtwDbmcA631dMHCwrxHGoBBdSp6wgT0O2ClLgR53K5asXd
 OMWNymoSep6iCuIcDd441RHEbWAZR1S5aO2PDCUgalTqnH7lQU83uGmWswq5x7ZM2OaJKXq/Wcg
 yw08K1RzzBzxCFzsXxCNYIqLFcLRr5j85Y/eQJhgrNSklf3M344C+GbEW1Q1b0cHKbyM4PrriNE
 +bbpGGx8YoaA3US5TDE7h3KmoAbtIBOx4mpHAsFkMSn+LWMIbkC65NuQKdwR2bMut8c484gGhKR
 kkvRX7tI3bvsRIWAWvQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA4NiBTYWx0ZWRfX0DF/mH2fxEBL
 wQx7GioThMmRZsc5kcoFhjtU1mOJXKrrgC4X0SuVhoiYp8FJ4LpYwohjWHVfsoZxKQnUHlkuEKn
 ne9Wo6cxQfo6BVduU2Ug3v3OlcNlIZ4=
X-Proofpoint-ORIG-GUID: eeZhH0643ptUpSW7OlGIcPhNbpKwYBqH
X-Proofpoint-GUID: eeZhH0643ptUpSW7OlGIcPhNbpKwYBqH
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6ae26d22 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=yjr2dUU_5hJp1kNbtNwA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280086

Enable i2c0 and spi3 interfaces that are exposed on the 40-pin JHAT
connector and add the corresponding i2c0 and spi0 aliases for them.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 940a03732eef..2fa652f3ae58 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -19,9 +19,11 @@ / {
 
 	aliases {
 		ethernet0 = &ethernet0;
+		i2c0 = &i2c0;
 		i2c1 = &i2c1;
 		serial0 = &uart7;
 		serial1 = &uart10;
+		spi0 = &spi3;
 	};
 
 	chosen {
@@ -388,6 +390,11 @@ queue3 {
 	};
 };
 
+/* JHAT 40-pin I2C0 */
+&i2c0 {
+	status = "okay";
+};
+
 &i2c12 {
 	clock-frequency = <400000>;
 
@@ -562,6 +569,11 @@ &pcieport1 {
 	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
 };
 
+/* JHAT 40-pin SPI */
+&spi3 {
+	status = "okay";
+};
+
 &thermal_zones {
 	cpuss-0-0-thermal {
 		trips {
-- 
2.53.0

