Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383550;
	b=N/x273hEHsnFkBngJSkYRhxAyPozpSw8WMh6JNVfPUxBDfH+Q689RnZa9t3mVOzfu4gD
	 je1XHcjH2cknPcFOoFd0isET2NhZKBx+Q4AqOobpkGf9FF4UnfWpR3Aas0jYJNMs00S6l
	 thTz1alkhWcE8tflqTA9BPEO2DZ3NF2Bp7xZnezyZng52z53jTixD+FA9HP8SjGW6RCT2
	 O47mL7bWzxCLCEpJ2jf+ryI+cFuR3gCzgZ32N2sfpKuTPIRTfX9IoYyNyKjnp4TWFN96+
	 DPcU+WJAVCq0t5ENALrzk6D5xqgoMNf/YOthJA5qiB7blMy3+RtNCpVc+wCfwmTD97w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383550;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=H1FTmvvuzLSB0xhxVui9xLIa/5Rt4Meo03vMKHS6kVE=;
	b=yN5tPTibspeT8L+S28/XAo6CayovmHoHAgpUKbLl63wEazMtAOvqCBCH+Fgcz6Yzh98W
	 EPATWZ+jEhczYSHRc8iRj4myfazzKQU2/1sMi1DccFBIqnsGd/dBwH5IjPzQb5GNP5zFU
	 ZLbsO1EJVHvQchbFyyvH3SJpQqtnOBWs9o93eO2m99Zl0m2r5YTN0pL0NBGJqn39CLJQ+
	 wriFyhEfJ9sfAv/lK+m04HvURSORDXTd94rvoAK5tI45Jhbpq04GQ/+wNlKcZu0vFUMQ8
	 Pa+gSrHfY4iZTw4w/5e7kSaOEP8TaBKI6T678PCASgkJW43odiTLU3PrkE5joxF/R2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MxDw1JwY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gV4BTd2z;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875EC60A2600
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:52:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 875EC60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MxDw1JwY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gV4BTd2z
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB6ZAxC581250
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=H1FTmvvuzLS
	B0xhxVui9xLIa/5Rt4Meo03vMKHS6kVE=; b=MxDw1JwYm675bIC7xzYAztv9GJi
	g7nkdsaRe0y/7w5AW5CoKQCvV9vUH9LOWO8hjuwgeq9FiTIKox/uckH8Q9SRyaw0
	3azXe9LuExqooW6lH4h2rmL9F9IEUwXaLoOh0R4KuNYLWl/EZRsfqa755DNTncJ9
	jhojylvx+2lIJeNspc5vKbBEcWyUkqZMtT32OD8AqVDoDntuIWs8957jf0XWV9Dy
	DlHS2L2cy5esbNsCjuhUqWmurLzHRKTnuCzGbJMwxUww5pY/fU9/rzhWPIjv4QOM
	nf4oGB6e9DIHeddqYPkYUOwmSnL7CENRbZayqdNBhi2JLpGigXm4mI1rf2w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7pr94e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:52:29 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so6354384eec.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 23:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794383549; x=1794988349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H1FTmvvuzLSB0xhxVui9xLIa/5Rt4Meo03vMKHS6kVE=;
        b=gV4BTd2zUV3gALOVSBe0GseCRCGwIxcvQpWb+F28bMZTaBJE1JEYTBftDuXldXYofj
         nPzPgpdqJ50F9w1x4JatPqPybTGTSGMSLiaFGt7k+DuXAtwvHeB3XEtwQp4N6nEqIA4C
         dqTGMLZENgvxyTkX7QTcrFyagVNTHkn7U707dcy0UPAOs3pyTWE5TO87XTatp/Z9lCoj
         B03p9EfBN7oHphzyWBGQKpkzz90eliEM7+srKAGhkbrUoe/f5Rx+wdGD7GTAOZreL0PN
         2YQVwkyP1J6CkzG3K5Qwx+JtzRfS9yI17i269CDipLzwWXcQMhxOs96HV6B12QnUQT67
         AqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383549; x=1794988349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H1FTmvvuzLSB0xhxVui9xLIa/5Rt4Meo03vMKHS6kVE=;
        b=MW07hcuXI6FBQb3k922IxOAj5LnbShjmrNpMet1zn1mTWVzW1CYGGkhlzS9NM1/WDs
         mji5RuSIjpPkg9hPETABYDYbA8Y71ClBe+ln73aMlM4YdoJ3mTLArU7PTBGNj72p6uYh
         9wXCOkQGWE/wtNxqOwz4OZl0dgfx0e6OBeFhHFncmOLXMWsvxvrbwIo52j+Ae3Etq8kw
         C/YCvT1uuZOhw9FCwbIHWQJhH0GOr3uG1U53/bOWXMjgtlNjqGJ+DBXoxY7uSDoGe8wU
         qrS5aImLBAUVhVkJfvtbsfYy8qQGVkTlv+BQk2XIcLdPE8AJcBs1OmsjTCRYiJd0XTBx
         cHnQ==
X-Forwarded-Encrypted: i=1; AL+hErH58YjNQr65z0YTUGjXgOSj4zj48rJgCJwb3bVszrIVOfvJiFg2P5FGS6y/uDB1lODT8hELswi3X8Qu@vger.kernel.org
X-Gm-Message-State: APuU4Z8vDtUCK7aQVPVYa3U92ESAdebRSYQKFqSjhUJ1G3WZbbdCXCMu
	LDO/USidmHWTZ6xb5GwuCyaaM7eiCxnx+ougwNuLtWACZJqJVvt21jI5OlMGKWcjBVyspeCOFyT
	6gQ9to9Wp82hnUa7IO+rxKKsgSXUiuxJBl6KybX/5I7CtbzO2giIk4suh17w4odgk
X-Gm-Gg: AYBFou2Xwn0DqB1t87j5NWvSfX6rS3D8HxGcQW/jDfwOzcZqMcwSt/0/mTfOO7qn2uZ
	B7j993EchIQuFnPSbltHwb9/SSsGFvT2bLyIO+lRH209JjY5FM5BaYa2K6tiAJasPT8cRF0MgeO
	Rg4BrlFvPxfsak/OsV02MiQtVoUjfkDipX5Ef0G9EC7zwazTX845kd3U2Y6Uxy+jWG+WmJJcJw/
	tgIOUUbOyH7UVGkH1ugoD29ioHPL4mI44TMdPXvfZMZEDXBxGY/UYI2qvqzMoFvdwF/g7tWBOUn
	8AkMV/WBZ1zYI+IjdfaQkeTNYc5Oasclh1dnZEElehfAoYSPmUzN1jONor84fO8I9lGsu9E6Dbn
	+w2iZoDYChdB+TXE7EVSA1nb/kG7g7ktCkhgw/ifmzyMKW6/nRgEYKGjQ3mzUkZ9Vh3oghrrYxX
	V6DcrTOwKrFugoPvIj9YLmpFXaCA7jbAvc
X-Received: by 2002:a05:693c:88c5:20b0:369:daea:812a with SMTP id 5a478bee46e88-3768694df2fmr2222273eec.30.1794383548977;
        Tue, 10 Nov 2026 23:52:28 -0800 (PST)
X-Received: by 2002:a05:693c:88c5:20b0:369:daea:812a with SMTP id 5a478bee46e88-3768694df2fmr2222243eec.30.1794383548209;
        Tue, 10 Nov 2026 23:52:28 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-377531d3287sm187032eec.0.2026.11.10.23.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:52:27 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 7/7] arm64: dts: qcom: nord-rrd: Add WCN7850 Bluetooth support
Date: Wed, 11 Nov 2026 15:51:41 +0800
Message-ID: <20261111075141.3710366-8-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111075141.3710366-1-shengchao.guo@oss.qualcomm.com>
References: <20261111075141.3710366-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfX6KjUmENaCpKf
 OuSiMRP8Zbg58GGXZsuUNdEZ8tR7KjkX8KM6ZjlZ13Sk6gEnvOan6qCnXKdUaTAmMdqn63Wnht1
 khs5oUirs4lOburREIo1Hg7nE5Yf5w0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfX9YiqBL4qJc6S
 xN5+VGMHg5UHFBDAA3RBDrG3GdD7VaQfDU/Ihnmcmoe6EihfdeIm2mz3BBu3BSZtR65c3jZJmOH
 e1SepMFDtb2FtE3Bk9e3IfS+8Y8htmajayoiI2Xf3Tv5lSn/gV3zEdKS2k8ph1XpCNbmN9QLgun
 DqLswlQxTszu+I1XY5+fpLnY0h4Ax/8HLSKKRvoW4nc1SK3l5whWWeqatEEr9XR1I7MYVNNk0sa
 aROIzM4zDRlefEEf0KltoNJf5NuVMSXbkZYY8kFyABXAE449WF7lvR2gNnN3OtgVLndQA5rnp9A
 piH86OK1W/2g31XMy7A6YXFfz6I/xt++CvHCqmeCh15Jfa2jZReSQ+TXEwGaLNheKZloVBwhUwX
 4gOGbN1sc7gZ3XxkrpbXS/ZJeEITIf+exHBxlDYyh3xHeXiE1efA5yHco6UyjmBsbT5XtZQNQ3q
 iGiR/8+/6AqBsRhGAiw==
X-Proofpoint-GUID: 2_oz1NBnuCjcsWEA7SlVcdZYeGTHb_4u
X-Proofpoint-ORIG-GUID: 2_oz1NBnuCjcsWEA7SlVcdZYeGTHb_4u
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af41ebd cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=grFeI82b2oVWyHTUkKAA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110031

From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>

Enable Bluetooth for the WCN7850 module on the Nord RRD: route the
BT UART (uart17) as serial1, add the bt-enable GPIO (pmau0102_e GPIO9)
to the WCN7850 PMU and describe the bluetooth node with its supplies.

Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index b23c1a81a376..827d3ba3a238 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -18,6 +18,7 @@ / {
 
 	aliases {
 		serial0 = &uart15;
+		serial1 = &uart17;
 	};
 
 	chosen {
@@ -102,6 +103,7 @@ vreg_wcn_core_vh_1p95: regulator-wcn-core-vh-1p95 {
 	wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
+		bt-enable-gpios = <&pmau0102_e_gpios 9 GPIO_ACTIVE_HIGH>;
 		wlan-enable-gpios = <&pmau0102_e_gpios 10 GPIO_ACTIVE_HIGH>;
 
 		vdd-supply = <&vreg_wcn_3p3>;
@@ -602,6 +604,23 @@ &uart15 {
 	status = "okay";
 };
 
+&uart17 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn7850-bt";
+		max-speed = <3200000>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+	};
+};
+
 &ufs_mem_hc {
 	reset-gpios = <&tlmm 181 GPIO_ACTIVE_LOW>;
 
-- 
2.43.0

