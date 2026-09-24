Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04518493D24
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246517; cv=none; b=DCJ7Uv4RfhX0JdQ3TiK+YFjKuyXj6VlPejWSEgG+tz9IW4gq4oXcm6llWS/dQmBo3zZt82ynARLwLYzPdX6bXDuqQ5K9Wur9sSwHZC2QkF+3fM+181zkY2efG+ehwMub74qecxwaelMtywCsCdiG3gZNlzkvhzz/C7dj2+3G57c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246517; c=relaxed/simple;
	bh=f7zFNC7Ga0KARgEeV11nyncXAlnMUFUz8jSYYAfcsMo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AowUPEB81ZG6SBB7DvvFSjCRdlAqT5C8QzIy+P0r0ERGVIXdrfLl3Ao+gI/CYBiv8l6viO3iFN7rcgkql4Ay/l4ogEpurlwXPBch7WRbw7io1X0+O/2zlHs0mtWaZpMNhAejZ1dN7FRgccfmmOt+NM6etnKFlZCJwpVufn3XCY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P6g8nbee; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BEbXiqTx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P6g8nbee";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BEbXiqTx"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PnYv1644215
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:41:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Msl+PMWNKMeXVrW2pFB7q+pvHrllvBjiq4Fpzko+780=; b=P6g8nbeemYsAYWPI
	AYcccYYLFidF+J5VBlPvjrz3igIIYrQRY0Co+eFEPeu3xKE9Ai2E2aL6nUVEqW8C
	ZdMbfYMwDa4xlUt9ZM6lGVGl9FQkz3+gdQ030VfwxCJcgPeYUGRNhldiJG8A6+Go
	NCIHZ9hEIaWd0jjdyzFKFlqXhM7GRRrJSZvGkhVNT/mKZ8QyjAgnE5GK3o4AeNgz
	F2+yNTKtPEcJ6R5hvCqIUbTZWiB1jjo09C87DYe7gljsB8gPeKzoAqkqz6J6iCWE
	a6OapqfhgdtNtEJQm/DmyO2YMUXMP2xVojdhuOzR7TjBXm3H3OySSp6CeAY3QU57
	bSN/xg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvmrrb45a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:41:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939f925ba4eso350587985a.3
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 03:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246514; x=1790851314; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Msl+PMWNKMeXVrW2pFB7q+pvHrllvBjiq4Fpzko+780=;
        b=BEbXiqTx09g2x3OcsvrMLpxMROtoQg+Es3CLKi7LdUU01wpVPdcVp9I+1ySBUDM94r
         ctWv61RazY4vqG6u+9g+xusoGcMlTaTEAMa1Mq4060QNNecbnvVQcrRbyELmBPH5dbIy
         6tNHN95cmM1I7e6/jgnQEpeFYon11PaizSANA2a0cOOzDmmon7N1HeR4unLko2o/A1pg
         GACUeV0xp0lo0h59vdQoyenk7XfyrqM5N66mv3wDwBR5uzIs/xSxbviKoV4jh948TKbI
         i9yVVrXIQJDJAG32PKEUHjVIUsQv4ie9ryr/1Ge7w9CovJZfHhMG//U1pI8P0IvSqbw2
         EaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246514; x=1790851314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Msl+PMWNKMeXVrW2pFB7q+pvHrllvBjiq4Fpzko+780=;
        b=L8GrPSK4xe9m9b3nPtzBvJtjGBqML0Yn1houDJQ9kMcDTs+dzKlXD4ZWYSyI/RMGKF
         ZFMX4qt1w4GIvS1EXppRlIob8llxMhdCUye7N5svykQEaCEW528I/iNwB/PZ3xM34XhH
         0UGxUpW865NojecVrV9oxf2C1+oYsbNMp25KHw+zD/2utDgOIQWHoVbO7OHlKlF1U92X
         qFYEYpwzgQlIYOt76Z/OvgMIncOatvaKBM8BHxklNuXP4zqPYmBHOGy5UMmmTnwmX+oK
         9ou5oeR7v28g1A8i25sJagTa47VzUySUHNdep5Jv7PwylTpdlnplDcBIWp1E6xTOIqIb
         JJQw==
X-Forwarded-Encrypted: i=1; AKwUvByULkdyQhOsfplEeQdvqxk42tpaDHfwmmHO5/IVBlUTuiqe90voaN4m8TKS85JPtG21m/RWGPkOpZH3@vger.kernel.org
X-Gm-Message-State: AFuF++mpnkZyPi5RuQJx5fjyf2uPcIhhRPQPrQAbcuFsNr2PodMRoL7e
	+H087u+flLn9a3jhGGhcNMdx/a8+/xrvpU9AEV7lLcBAzfAt28IwChWMRDOM7/YaO33oDmxrH0r
	Z7p3lcnprdwWKQuyMiHLI0ioVx5MACud8iZRnilwiOQIx2EkBv5WxHFzSyolAp2bz
X-Gm-Gg: AYBFou2nK96h+uSfW+XQ5ixbW07rqOYNZbXH9Ec9WVrNKksIYg/YBojY6NKeWDDx5Mt
	HIVC66LiCZewF7FmhzwBKhp/8CKlyxyT54nJl9TNGY36RnBO1JCaIcdov7HPqlRjpqrqkewt79V
	vcHW9sucUJxA1W3vQdyH6IkVV+ibG7fE8zVU0TXe3t5JKtEBsqpzXuBobPcpJjQfW7uJb5St2ab
	5PUuGg4CggJyWmIC4DL8KMoKRjQoHPXvb2QsqUnV7lSzLbsTxA4/RWAzmFTlSAbnRplq9pKcR1y
	KfmHvVmJmarrqO1VXfJa+bCJzM7bwHeCXyXA8Es8M+9Dt5Ghuuju0eWikhkr4Pfs/GQRErd3Ppk
	jmkEDFNIq
X-Received: by 2002:a05:620a:8081:b0:939:de48:e41f with SMTP id af79cd13be357-93c36396c40mr211628185a.31.1790246513695;
        Thu, 24 Sep 2026 03:41:53 -0700 (PDT)
X-Received: by 2002:a05:620a:8081:b0:939:de48:e41f with SMTP id af79cd13be357-93c36396c40mr211622785a.31.1790246513147;
        Thu, 24 Sep 2026 03:41:53 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:52 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:54 +0300
Subject: [PATCH v5 38/42] arm64: dts: qcom: sm8450: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-38-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1038;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=f7zFNC7Ga0KARgEeV11nyncXAlnMUFUz8jSYYAfcsMo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3+lsw4w1Mtx8pFr5mcgCtDFLVQBbgx8NXPA
 IrpI2NooeWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT9/gAKCRAbX0TJAJUV
 VqYoD/9DXDz0ZdheOl1aW/pvmj0bXRZ3lw5glcJXNUM1Fk+Aaybgs7KUkLwbChCD3Wf07iDNrtA
 qOXu4eO9sEMA0hMksTpkjS3JHTA9TuZqp+sK8ldyuQB42QbDAELKMli+v75t7xS5w7nr8mrxa2Q
 s7GELaAsU7/oOScENAjTn/81+QStnv+ShBe4BueSPteUVX1ynlc2d8WDctKm7/CiVNnYibJ9c69
 xfUKnhTnHrBxAhF8C4CojiICDqKFFylu3ViF2UbPdGHOH81Vflr0gAMshXn8INGW/CCcp04R9h6
 p28k1Dr2qf8tcDDdkyKlOGN14GPS06o8G4toPI1baJeFiyQjAShEtWeLzmMYtWyBqLik9cXquFb
 MOpnx6VDx9TKWnTpr3o1ALhU4K9wVux1QupPyeUh6BD1k8uB1KQjD+vjxU3WQT5ubpYHi7GcIAW
 iby3HGCJ82VEeQ7q1wERwH5UYDZ/ZtBeDSlxdn5kzXUnRok/vskvQ7jOpOKNhs8VIlgXETKYKAj
 iA43FzPpv0eNJa2waFaWllXB1/t2m8Ecns/xtGyPFu7wvoAOlv5rY4jwv9TSpuPsUe4TYu9hI4l
 jJYJgWd2b7l9CT0HVINWCwQO2Hzx9/PR5IXun1cnqwTqCWX8MFinLkY724Vf+ykElzOoXvw+TBY
 uyljE9CWCIMUb6g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXxmG3O1UYBuXd
 6VtAAE473esjN+vd005RQbiC4NXOsBJvIDa7z8+fpyoHDih1E9jYzKFLS/AGKNdOnFzSUYxFAoC
 8Crpxa7FZwHsNEJqsZ0RsE9Tqtj5MhWk2LBYUcnMqjl4ZK6Aah/f7ciDvE6bRuP/e2lMYE5cLZP
 5OBXDLYbHQkRqYOzn2fSIXbdN5MW+4RXAT4Fw4DVwOT1pucEqGwlDFCyQwP+MxDYVm7Zbn6j0OL
 4NBnCNmCajr7Lp+QF16okT0hq+ji9Vh7x/6VGmmMMnw7ynsg1w8OEiG3bU1YK1fDgOb19ACX+a+
 rmjaG/JfQ7B5JbU6HLT/iUnX66Jt5funAXGLnaTi+IpixndqQldSDMHhOeYxFCaoUHIBBUn9Yf+
 Mq9g41ZlBYL8Lig/eTMnahYfzxaVb2hjtB9jjeitOyxO/6P8CDtpzr1hSTYh8+fBiThoxKS4IK0
 n+XRtCxA1S3+1CLPfJg==
X-Authority-Analysis: v=2.4 cv=TYwDJhQh c=1 sm=1 tr=0 ts=6ab4fe72 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=cMt5CT0DYXTQOAQHtqMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXwSqXuD6KyZf9
 GynVdDoDhznRQyZWDNIv8GJweQXts/XdIE7SwRCi6irMM+DQYerPzpG3g9ZJY6bIZbfG1jmLy8L
 RpPSCQ2GGeVabSLfidcy95ni5yf7Puw=
X-Proofpoint-GUID: gmCJSo5gRkkW4UPkcpaKrvKU36mbDMjj
X-Proofpoint-ORIG-GUID: gmCJSo5gRkkW4UPkcpaKrvKU36mbDMjj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

The GCC GDSCs on SM8450 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 484ec8ec8c10..1af29c5476e3 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -941,6 +941,7 @@ gcc: clock-controller@100000 {
 				      "ufs_phy_rx_symbol_1_clk",
 				      "ufs_phy_tx_symbol_0_clk",
 				      "usb3_phy_wrapper_gcc_usb30_pipe_clk";
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		gpi_dma2: dma-controller@800000 {

-- 
2.54.0

