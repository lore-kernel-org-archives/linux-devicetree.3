Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C0928CF6F
	for <devicetree@vger.kernel.org>; Sun,  5 Apr 2026 13:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775396403; cv=none; b=qbBNG9bp1q4oR69sVYpNAScgdksUSzK2KX6hYCh2Amh6BCvGzidLVh73IsXYb5RGEMRz2bizBREIkjEzwDOQxb6lvGavPRn85+jfJV8Ch4Fr2kKW++HcRydV00oaUUoRgdf9uQTBkw0RxG34lYqpJtUFKBXrQ22JpP7dscVH5Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775396403; c=relaxed/simple;
	bh=zP1Q725C2gVijBM7MKdyaN85O1+n289G4MfeoCP0jj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jFU4juqTxxsU3k71RjV60IgWNEORmQTjc04oUO8AdICGhCxHKKiBVtFAY84mfwsOIPDuxSxoZRsegC1n+P+A4O3WmDj8vOMxbI3LHeG7zIF5xrefxdNQoOAAb+cNl+RsvAl0Mtkh/QNBNWigph6J3bH8Oj1SYVEvE4jLSiNmbZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GI/PKmzb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y6UJS8qT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GI/PKmzb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y6UJS8qT"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634LqGXm1870216
	for <devicetree@vger.kernel.org>; Sun, 5 Apr 2026 13:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LzDFJDdRx7HeV1kbNfklWcvzdM3qIlnSGSbecBYvve0=; b=GI/PKmzbKiprI3dF
	7A42xmHR4YWwk+HOqWcd5ZUCjdQuCodQ80wH9Xbix2j1IUAPqalnlvb43CQTU5Ps
	ZaDXG++6VmyKLghglPQSPF1KVOC9t0r7DHM3g0EEPpVHW+5LSyb8dj1gP3mSTtHX
	id4inS27xhcAwTtE7zpcRxpDJc7GybLF9/QUfpozJ5KY7KhYpIOqiQECW3qNyMLc
	8aM07uZGz/7Tudwh4+nbIaROSEi3YZqtBB7ZlWiU/jCvshlyVC4lLu7ExV38jXT5
	8wem/ArHQqiaEAySj3C7/S8tWDqsJ8RUWjc9+VNZCaoNGhO4BxNTSZAtyjDjWAaI
	L2RD2A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4datv1ahfm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 13:39:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b781542c1so70315941cf.1
        for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 06:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775396399; x=1776001199; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LzDFJDdRx7HeV1kbNfklWcvzdM3qIlnSGSbecBYvve0=;
        b=Y6UJS8qTpFyBLYD5XrEuedW73XNzz7OF2TBChVKBhsp1cQpQ3fhTLvX43pOSnbJ1gq
         DJ6InuXH6v4Xz8sH/DPssubzYZ7bM47/Q/CsL7sgyBV62e6wWkTQRCnbSQsjFUhdQ9KZ
         Ql1VitQRRJj9gvMn+Nn0Clj3xc23N/JjKD++lz8nndoLQBOzMxAQ082f4fTBLQ6s/l/8
         84nRNkihaewCi0xI+UZ2xZWc/l+KtXw5SjaNTc30JJHHXNEyCxXgEhLJrogaoV5uz63r
         ksAP3RqBO07emC3YEGqrTj9y/ihhfvkBEtn24jinDOX2D1FTP/qjq1NOepR9Hm5QGhOz
         RUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775396399; x=1776001199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LzDFJDdRx7HeV1kbNfklWcvzdM3qIlnSGSbecBYvve0=;
        b=iChh3d8K5TnLIRtkjHep/cmd+TilyvGV/9LYQZpjKmAhM+qygqkP5QV9T0OgviW1AV
         pSxCbqgdY8/q3vurmCiDYXDbPqFa76oXxc0HmbEgKhBBsrP3wtK+qCUxuq3KknPH3W4+
         YTNWvlLVjzMblZ2RwF+2HEa6IqDEMfMKL1t5HlOGPIxdxbHQEs9KHXu/w6Ul4b7oy7EH
         7193rUAaxAvpydCQWf6ImsgFaYFDrINHK2WSmDkjVZ3wDFdVUi9xhZJ7REokwCsHIjbS
         yYsEYpUuWLGoLO5CDQ7psmXfsig8aXRZqY9dkHdXqOdbDpigacf7nSavAWXOS0L0AT3v
         jb7Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/SEng6SKMCnvaJGcRAX2aNkBnQTNJx12XGrQMpthhbylFikoyurw3rdtyjjqDFvKIgRdeCmb62DUa@vger.kernel.org
X-Gm-Message-State: AOJu0YxpfG+WTU8VEmrLzJUMc1iOv/MdLkF5p7bReyLAjR5NqOJnLd9N
	nHsXqxo8pZp5zmSe6wHxJy/wi6TW/J4283EYIiMlRYCE035NYAOLEfLKfWYFnr4Nt5knckXIbdp
	cy32ymCsIy4OWc5Q7ZCjWCfFua0ndQ4bcqO7+5l9YxtEiLGBm7fRN6IbL2fGNqQIe
X-Gm-Gg: AeBDietOhRZ+Mz+DHe2o2euOSl3HZBbLxee9nt9WGwiJ0Yr2R4vFomBlhP388sIafEA
	lKm9p9pJlqnS/Zw3K6yU1s6dkRbnTJootf+nf2DJlKDOZTAkzy0B0Vit8n3cula2WGCmH5Wv3To
	pG1hYDoplQfUwksRRMd+K2dQleyUD6nuM4Pl2JvcnbeysR8ViRAZjXZEcn43FW7PhgQTNHU1ppI
	1wfVAcSyANtsT+FLGx3gPp4tZzC5OnxrgA1kyDbya4JmxxQKR8Yxq8W5oxFtesqApThijzjBE4x
	D8e7bN3Rrf+QwHyXWQIFLn1Go6lqLcDJzvKuKn4TNVAvl7IFAF0lyIBZH7mPV0m5+Vo0UBtEQYp
	w+wy2TlHzAbpcCk/zO2WIw8TBp2+bjYXB03NMrcIi9M5v
X-Received: by 2002:a05:622a:5518:b0:50d:770f:ad1a with SMTP id d75a77b69052e-50d770fb032mr80726651cf.37.1775396398770;
        Sun, 05 Apr 2026 06:39:58 -0700 (PDT)
X-Received: by 2002:a05:622a:5518:b0:50d:770f:ad1a with SMTP id d75a77b69052e-50d770fb032mr80726101cf.37.1775396398291;
        Sun, 05 Apr 2026 06:39:58 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f1esm32188774f8f.2.2026.04.05.06.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 06:39:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 05 Apr 2026 15:39:30 +0200
Subject: [PATCH v2 3/5] arm64: dts: qcom: ipq5424: Fix USB simple_bus_reg
 warnings
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-dts-qcom-w-1-fixes-v2-3-1f2c7b74a93f@oss.qualcomm.com>
References: <20260405-dts-qcom-w-1-fixes-v2-0-1f2c7b74a93f@oss.qualcomm.com>
In-Reply-To: <20260405-dts-qcom-w-1-fixes-v2-0-1f2c7b74a93f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1400;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zP1Q725C2gVijBM7MKdyaN85O1+n289G4MfeoCP0jj0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0mYgmZqGi2JR3L2yIBObdvtnqrq5bc9QvNvpc
 vbO2xC6Eh+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadJmIAAKCRDBN2bmhouD
 146OD/9ZyOZve25Xfvsli2OWmA4Pqp1eGWT5w0p04PtaPs/fW5F+RlJuFHtSzBPM7AAlCF8Ug2s
 vSIO62d3N2idfP+c2ckkaFZgIJLhudNKr0adkaKMwPoxGIvp7egolLhrbp8tWMrFgeI5InINrkJ
 Hh78sT2u7US5htEqAXk3rmmD0+chC77qfCvB///i/D19+IERQHQBG3fWz8yZIJ0j2R3YiVpeKXC
 xT+rc4AczhcMaBXqx1sMt5sPDgim9tbYsvpAfdNDLwd0qALwF4L/CrCRzRTZPuOBoAOLXl5AA4f
 QgIW72JKauqDe+tZCLyPP2TpMGMe8isPbQ0ge2QfKG8rBIgDfAxKOeoN/KHiGr82fojIbw396Y6
 tCkM5Sul+egQpYwXEPZnyqHEKl8VheAYsWWM7BnE3POJa5SYLjhkzHXUDZN+ww1+YhCHBHrX2AL
 A128zc2Kvua7JR6pw4bIwTnU356gvbPOfdjdc4jyFi3SZCDnZ8sf3X57GzoU4f0BbrW5aWnUG3Z
 CABOnw0ut8fu3hxdBZhq2C8JhM6Y3TXYiwE4WAUomt/3tp/Zfw9Zln7brSwuEmUgkaoue28gPg9
 KEZWn9zEma6yeUIGmAizEpy0myXoJsUbnuPq6wnYesaJRDOJfQxPgapHWlCn7sV2vZ1zOOc3Fdx
 IKpJm0Hjoz/Me/A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: 9UsPHG87lfT112VIOqa86LnTOnAHP0Ta
X-Authority-Analysis: v=2.4 cv=GLEF0+NK c=1 sm=1 tr=0 ts=69d2662f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=mXL7kWYZv1q9rXQNpRkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 9UsPHG87lfT112VIOqa86LnTOnAHP0Ta
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDE0MCBTYWx0ZWRfX5RhZpb1Gab+K
 TvMHUZhwwJ3O4XW7ebVvCzth11i8Jm31gCgiVYhdcENFyebo+Hvu9RYSpDUJDPFdS39Vs8N+GpS
 PXGPPs9fHIqO+yyfVlolTQKq9Ba4BZ03lKSd0bk83092KN3KfLIALqRVdlWs/c89xGTanTOe6oe
 eKKQbbhOZQ7/hIiCy3KnDNv3sSe0mGKu8hg/JittBPd1/ov3+SkzWD5p1Nib5TDSmtLhDtjm0VV
 8AOyWCO0hJ9sypeNbgGbAr9YhkTuYwevdXTRLNlcKmjlLm1vGVSUcygImnUFE1VKeV/1+FwcFV+
 r43ocLndVy9kUIGFGFaVhe+BYDYVn1WTj+xJWyMWTzkr7tVG6i7QSaWxIsl71G1yWDbUON88p5l
 YFZaED4B0YjvJtoMV1yZdzKdPNumgk9P39qJde9CQEYQ0s6WguOhnMXlhfkrU3hfVXaySbjYf+d
 PlRzNRTHEfDzDyYHqXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604050140

Correct the unit address of USB nodes in Qualcomm IPQ5424 SoC DTSI to
fix W=1 DTC warnings:

  ipq5424.dtsi:642.22-693.5: Warning (simple_bus_reg): /soc@0/usb2@1e00000: simple-bus unit address format error, expected "1ef8800"
  ipq5424.dtsi:733.22-786.5: Warning (simple_bus_reg): /soc@0/usb3@8a00000: simple-bus unit address format error, expected "8af8800"

Fixes: 113d52bdc820 ("arm64: dts: qcom: ipq5424: Add USB controller and phy nodes")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index f20cda429094..876bf6a8b8ff 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -639,7 +639,7 @@ qusb_phy_1: phy@71000 {
 			status = "disabled";
 		};
 
-		usb2: usb2@1e00000 {
+		usb2: usb2@1ef8800 {
 			compatible = "qcom,ipq5424-dwc3", "qcom,dwc3";
 			reg = <0 0x01ef8800 0 0x400>;
 			#address-cells = <2>;
@@ -730,7 +730,7 @@ ssphy_0: phy@7d000 {
 			status = "disabled";
 		};
 
-		usb3: usb3@8a00000 {
+		usb3: usb3@8af8800 {
 			compatible = "qcom,ipq5424-dwc3", "qcom,dwc3";
 			reg = <0 0x08af8800 0 0x400>;
 

-- 
2.51.0

