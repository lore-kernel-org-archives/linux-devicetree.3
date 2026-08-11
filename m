Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826A731A07F
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 15:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786463617; cv=none; b=BwHohn4gfvuUrjT2eEYz0ysH0wH9QczvTmeQp8Sk6V5xeZlmlPaqMgMGLu1MtepDxIjsiKD87DmfFTV/XOXzoK2ilTGkHw+V3DAJQUbIL100BW6Pm2IQUqfJH0LpsRGM+vnzaHH7YpeA3pZpcH/+hXHkU8AJl/aileNmFy0X6zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786463617; c=relaxed/simple;
	bh=a/Bp85Gwns8FUWjZGA43gS6PxJUrfuust6vHqofL4wo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oFSCO3PLCZ7LtCH8vO6rFbDsu90PhSIwrAgCZrCo4az4Sf7rnSHOMnp89oJ2O3QQH0n0MciPtO3w138klK9AUhT37DrTOokkCBnZTP3+c941XdkHj/epKNj83gEPQtzaeDps4Od3kDWA0JnY9QkN90p45QGQHfSliQSXgO651wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p8LejGeM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VQ9f0D6n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p8LejGeM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VQ9f0D6n"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWvJl766892
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 15:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s2tJDTUoEq5Fh+5gEiMOadNu/ecmavi/SSdWaoYcUQE=; b=p8LejGeM+HKN3F30
	8jTNOI0JXnLisw8vI7/1PKA2VRebNJs8/Pr/cwMDZszf7g6NaKCJBmWkIYYplMDF
	NuUODtyAcPmrqttjqAPG0v8lVuxXfL+K7JDGg8B7/lNC4a/8l5s4YSgapkgNpy73
	IOecY1bpavmGJRyz5pfnlRQq8zkCn8Mld4PmAQ9MtEtPYQmcs2jZsKh5A6XfmW7N
	vVEw+JDwCSdDOmNN3CvjtuAgxGlxt4UZf7Jpvg5qokqVBs8eiPBTdIEWj9GZZDrT
	RIFbp6zO5Hcx250aVVRtRcfD/+h+3xPxzaV5r5lrKeRR2szFqCNx7aR6I5wAolPj
	dQv6Xw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01q11bm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 15:53:34 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9c26587e67so23877a12.0
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 08:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786463613; x=1787068413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s2tJDTUoEq5Fh+5gEiMOadNu/ecmavi/SSdWaoYcUQE=;
        b=VQ9f0D6nQ1GXFsTpmKam6saae3qhc98WqoY+QwSLZJdri6QJO04I7eIT7EmeKPf+og
         oWPERGQvMayZeBnXuLjltVRfceYBr65CKbeBf+LQWO6mFsBgZQDQqFbRBNhLAfbGlAl8
         6pslWmL2PxYx9HgnsGgmJsR6c1E5vbCSNxWczJCqiw3eyA2d88yrpb9uCPWb/XSpgdUH
         DYZCYWe4XlAbIVUKiGXAWeNKo+Xe26GQqVqDkrvLx/Tgdsh9aJrmWRqMO6dQXBE20GaN
         XUtfWHjIqlCeFHN5Iuo2aUh8qLy8y6YbhvQAEPY6o7WgTG0x/akoglpbYPwdMtJ0GZqK
         ZmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786463613; x=1787068413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s2tJDTUoEq5Fh+5gEiMOadNu/ecmavi/SSdWaoYcUQE=;
        b=sBjmrE30N3eXrGWxTEIwa7X+4SyMQr4+nJl0jdH1NU82xGFRylNmX6pbRQLkxel04W
         uXmAsb7OBkAlqhRLE7siCVP7WPJhAElendXlJ5TvZOU3s/UEpavRlr14plk4wWZNPbLL
         q5Sq4bz2VqjvZVWQWan24kpv9O2HcAqQipOsJ6cbme/78GGDZ1+2SYWbvsmFWipNo/2s
         l72jsx68Z3v5gKkOdBEUK9v/4CrKgEApqXCB2+Lown/xXzc4yb+VpgrVg6Af4IRAfxl1
         ISZEYvPTDt4kJRAtmkY/nDjKjFIWKnoMbrpFP6i9uOEcJEtbLCRqyV2ifIp4SbxyNA+R
         GbCw==
X-Forwarded-Encrypted: i=1; AHgh+RqEWQnKReB72pV0EeENG31iQgo/swnLiq9nyaeD/NvBvcJxVtmLNd9stiu1EDxzVnD2/n8yEMqDced/@vger.kernel.org
X-Gm-Message-State: AOJu0YwYtt92P8EYgK9Vnv3F2pBuMPPQlyCudah1KcolTufdaHa/ed3d
	FhLfSUKfMvJejbkZoqY+l3I5Ot5L297WiLuOKslkhskaY54UEeu5q6D9/UuKkU0WlDaiVNyfhKx
	rytLZYs0WoWGrEC62sArGoTfrw424TdhV5CEDELZ6CIjnnpQmdC48eaxnnIHy5YhH
X-Gm-Gg: AR+sD10xdmWo5Tn8NPhHF6VALrzM69PicG6zeOqiMWFCKf+ecfZShYUhtq8XNahFQpz
	9UHw+VviSeRnjawozl29IzlWXY8YNFnW+wB5DPzP/e1Xn9S+fS5jJlC/aB4sN2yqGCUet1iEhwr
	20igscuXcSIZx3tlQ+cwUH8cD84RdyxEPL7qteq2ffEet2efCxj0dj9fQ4ELYzO6nUNbcBhLF5G
	D2e8w3x/N5GvBDsuUHsBrCdhXJtUagTPjPcLT67KFNNGzZA0aWu4KxmlLxDDI6YtZvWRf8o+GBo
	AwiDjc7m7mfyTAS3t1q34Y8aLGdaK+u05wwuD7c0uRVijvwMg06/OuEdP348wptf6NYYnP4VhGZ
	+oxoIFDJmt82QfmHmUdJF0+nPuksttjSTHsyYOGKxIU7MmbwufMgEshHWlVOmVKaite46heqyDl
	mu2D3OeUP9TwtWFpdYsZ+BkjAKyt2TrDDlxQE=
X-Received: by 2002:a05:6a20:488:b0:3bf:a517:cdcd with SMTP id adf61e73a8af0-3cc379514c4mr1591816637.12.1786463613435;
        Tue, 11 Aug 2026 08:53:33 -0700 (PDT)
X-Received: by 2002:a05:6a20:488:b0:3bf:a517:cdcd with SMTP id adf61e73a8af0-3cc379514c4mr1591713637.12.1786463612792;
        Tue, 11 Aug 2026 08:53:32 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf6d726f1sm1143032eec.26.2026.08.11.08.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:53:32 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:23:10 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: ipq9650: add interconnect-cells
 to GCC node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-ipq9650_icc-v2-3-55b8efbd62c6@oss.qualcomm.com>
References: <20260811-ipq9650_icc-v2-0-55b8efbd62c6@oss.qualcomm.com>
In-Reply-To: <20260811-ipq9650_icc-v2-0-55b8efbd62c6@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: duF21BdavpgcmobRM8WzDeLAYQq9V7SU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEzMyBTYWx0ZWRfX05+PmgkO+efj
 pRiJ2+vEOMCZLXMxzSc/EQdQV6YafB/5Eyk8pbTQCkuc+gRQiavGdIXE23n6CtIK1NXwqE2+PO5
 sAXQIC1sLA/4P+O+8QGxp7JvvO0PqqnAgYrdDY0k45WdiXdJFfUzY1h2UioFcE4VUgyHzsugjcc
 b/Y9RrA+F8WtaFbpIMIi3ZbRBmdtk2mlhNJRCfQ2q/Z8YQwvhSKvH4sGufbTBF/k4Awrk5qu7dA
 7tKy47UiB0aQ0yF9pn93pveDITCCjpQgAXLAD+zhPH+FwuDP/EC0BaN0eoCIDRLYA17UCiWrPxS
 LW88lT6QR2DyOSyQMxeYv9xgsAIhEKTBhUAOD5FdfyaneMONvRpWmYKyqw5So3jSulVaT58PQpO
 u06i2h95MIk2+eoBQ5QSJ0KclAHZWI5Xw9JZ7kNA31F2WNOvr838fYO2KOJNjPsAowsdtsF3c/B
 E5+3Fym2VAF+wxBMM/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEzMyBTYWx0ZWRfX51YMa5pITS3v
 kwOMX7TEZ2GtBnJUG6t6G09lY+CctRx/z8Q21wqe7Nj9MN+Twftkob87ubMOfg7t2Iz0+RuFwMY
 5d+8GdzEo9SEfD6Is3oCFl6T5u4bd7w=
X-Proofpoint-ORIG-GUID: duF21BdavpgcmobRM8WzDeLAYQq9V7SU
X-Authority-Analysis: v=2.4 cv=brt8wkai c=1 sm=1 tr=0 ts=6a7b457e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=reN9DiWUbCtN1Y_qNI4A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110133

Add the '#interconnect-cells' property to the GCC clock controller node
to allow NOC-related clocks to be managed via the icc-clk framework.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9650.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9650.dtsi b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
index 3d3b317c6a3c..4c442773de53 100644
--- a/arch/arm64/boot/dts/qcom/ipq9650.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
@@ -225,6 +225,7 @@ gcc: clock-controller@1800000 {
 				 <0>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			#interconnect-cells = <1>;
 		};
 
 		tcsr_mutex: hwlock@1917000 {

-- 
2.34.1

