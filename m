Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF07E3E6DC9
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 08:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789894190; cv=none; b=h+P5VVGQTNyqae8XJGakc2cUp+PyJx77556frSpmctMxrTHrRuw6/rQsKP7lxLP5WBBTqJMtuZwhS2mevjzVFBRQ0bxTJdHsDwIfuIg0iyEKingHJjcidEzIx924xOq0ReuKBl9DpScProuJejKwRzXVXZHB1oQNvdlre5r4jGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789894190; c=relaxed/simple;
	bh=K0mrV3SZdbvnKcSQAKh6cACwu2vBqTk7IkteI4rnFIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DoC4RTuSvZxr25a74GeQqCakrygBjlnoBg5WuY9/WKHzBuW6PwPxjmEe17kbg5mXkhOyOXLvF+WY42YJyFGncPh3JiJGZqXQYj7NuyC+e1p8yAYXCRUqUXaUuy9bRjew7bsGvxy8mvsF7f694gMcxzgVq3IaycKUS0+n+L19fpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fXTsNg0f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eORNnNbu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fXTsNg0f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eORNnNbu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K8VpaF579009
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 08:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xe6HhPLEn0w
	3R1ECXKMEXuVbXcw/o/+tTan1PrIOEhs=; b=fXTsNg0fEf0UGZ1Ku134oUxxsNG
	5l9UJpCHTBEfpgFi6u/ASmCg20uiQH3UG+mwQsU/C0NpGSyrwQDMl0ZVSLkg5NFV
	POJgwe2D01ztZ/7qe4Z5I+9C+ONXW8AkakbINJxRyc6vNJ1PFu0G+64eI7tZSLd+
	AimEk5uXykq0pJiZfw1yT7mkZCkCEajbIzibTihjZAqNqfuzu8Ozz/SOYquGLlNs
	uKBKY6DwVr3hDB3dHyGDQT2JJPnuBu/uNh2Y2tlJFeXD+aGuFRuwhs4/gxOWe1qO
	jYyzruQNkcHUXewU4LoQRBFaasBSySStXwMlFvJ8SjrNl1DAplJePSHC8uA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gskjk2h3x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 08:49:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso2921174a91.2
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 01:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789894188; x=1790498988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xe6HhPLEn0w3R1ECXKMEXuVbXcw/o/+tTan1PrIOEhs=;
        b=eORNnNbuRTffWtLD9QOY8muw8SPIQS3YX2+XXARbr807eZeXyUUGcxW3V8Mb3wUrW0
         pW5OzWx180cVrE4xzJiwVlilelsZqn+exA3u3hviTm6pRx40hZfyIFjeQP/LcbR0p0FM
         aNhZBjaMCp+G7NJSCT0qgRb4qn2V5IS9M4BTJcdr4x2MlGJuFxvLr+ilR45QpdwkGZ03
         gmvfFcQA3dBZ5mNrg9B+DdwLEHaOrYbH9xkVrHJrAVRn1EyBnXcZBnhIjfxQvADp8Qtp
         0Qh99j/JHNY+8O4OCAPdVWN31hRiKnrP5c9ZJRZk3+n50KsNTc1MDOS4H5pLxHCpw1Iw
         WNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789894188; x=1790498988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xe6HhPLEn0w3R1ECXKMEXuVbXcw/o/+tTan1PrIOEhs=;
        b=Iph1DaPbycfRIv1ZcS1i87d47IfmOjTPG6pOeZjmqC1UvyBp1RESlhdQ7IDAHF2g2q
         E9F+AHg7K6zlSoJyEwrP9AH0gIj4DPkqAEBwlb05Gcw7426LFbdQF/yzMOq72E9C+cMA
         ldt6Rd04cwDmLGdlmdU4thhVlakYLAIdHQhMs0LYflre2EDkFMP8LLysGRJ56HncSiDE
         MRQ5OqCJGVzGUsoLURwXxpoNCAFySwrzBv5BX8uwOeneRPAKRmZB11htLa5gNja+Nbbf
         M8DMFSGNjHojcd+4GwJZIzG5QpCJNmhzTnuxy2ixWi3+4yZ5zFKqxOLNPW4/KFFcAz/c
         PlHg==
X-Forwarded-Encrypted: i=1; AKwUvBwzeyiZQK7dKYzJZ+M+0w1VYbhFRC0VjehY+++dBtQXKhpUhG1VmEgNWuCHh4mHRbkk24wBrhkctEVY@vger.kernel.org
X-Gm-Message-State: AFuF++lo05KhcB3wamrkZ/URVwG2VtR9SEQsnIj5850zS7AqPijD3nC0
	t0Hytdnsr27HUmYu73HUR5b5G30ePNdMlDaYung5nBtJzohfxgtGU5r56gK7ItNpOPDkOLnfcTU
	8mzqR5T4KvYG9Y69ktyJHFbNtX6QIZEvPYA3XJy1o70qeDKNbIxYb7vSnVsZNo+PC
X-Gm-Gg: AYBFou1hlTEO5mJK/0/+oMi2WqFiR0rhOAKRsOn8RqYkEobRvipBIO4Crmp7CJFcj7o
	LJ+KZFI8Egww6Zn4HUeSNqU8qTH8e1Auyv/vYqVwPiunapF0QWI4dyRuntc+XmuiKUalWICDgIe
	SwQO4MGMXpZH34PjbNPHfTEyyFa7Skpk0MasKQbtdtO0bDzR4awQM0FNCC0V6ZTMIzMRCSfHoge
	3qiZU9/zeT9gtk/D5fa36wxRYjWFdYBLDsaRnsOhfnQQ6rt14D9s6psAsgZl4cOHl3zlDQxb1Gh
	nyFgGsQqOWeU8kR/jdHjBqLv20zAbPrpO+moWMeRwYtVF2fB4cQKoPutaayM1TuqGZPWYFz9gAc
	YEmwLVb/arSt2Iv9Irp46EF4wpU0UGUmy3ZU1kQJFRa2viegHjtmXA40ImsHg
X-Received: by 2002:a17:90b:4ac7:b0:39e:6c6a:4b6a with SMTP id 98e67ed59e1d1-39e6c6a5812mr5559930a91.52.1789894187609;
        Sun, 20 Sep 2026 01:49:47 -0700 (PDT)
X-Received: by 2002:a17:90b:4ac7:b0:39e:6c6a:4b6a with SMTP id 98e67ed59e1d1-39e6c6a5812mr5559913a91.52.1789894187207;
        Sun, 20 Sep 2026 01:49:47 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3314313esm11180808eec.14.2026.09.20.01.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 01:49:46 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 2/6] arm64: dts: qcom: nord-rrd: Enable ADSP and CDSPs
Date: Sun, 20 Sep 2026 16:49:16 +0800
Message-ID: <20260920084920.2201418-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com>
References: <20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H6JOUOYi c=1 sm=1 tr=0 ts=6aaf9e2c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=UZuJur8GfllDSyYqWHAA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEyNiBTYWx0ZWRfX5KqdDonvI9jU
 xKs+J6OD/wOC913eiXnKXLQAzLJwBk6y+SZinjdohCwP+bCQbaJnRZYmxuTLHV+/BaLijtlI2lR
 QDpLqkmSo5O2GQGmBtTeGgA24wlpSlnyh4x0yUqIs1OGawbPLlJSihJlM2EeRHJ7olklKY7i4Df
 7XWs17JiQsZpfTHOENFGDPcLQxKdQF9os1LyNO/MPvtdmnXRH9atqdNFbnKHsYnqbOAiTyeCeAu
 3NJ+tsBF1mDMtt4dmd2dK9JsSZlkftdh4JnRGuSQmXfbik6oVKG5ttyQN/bctvoa9WIYVDe8Vjb
 uZ1xa/SuKcAeN6X+Y6D+sQTl3SfHfzLlgGASML/n7pniCstGxEuhTe4gq59p+4xOWNU2SrzDK8b
 ha9/pMpWORHn7yOvZhKI9x6XQNNh40tlaF+j3dH9I0B0qxuCR4W4nUj1Dahn/CT3A5k/4Pwknpt
 hQykovlFATnBOtOgXTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEyNiBTYWx0ZWRfXwp7EXbbkmglk
 G83fC49XiRW1EssWHsGiLqjTLbYZDpHxkj9jaV8TppulXDAexxbunGap+dwl12xySyD9VgArxme
 eGwTr36/uuFKhhvvLJl9t3KMzWVgNN4=
X-Proofpoint-ORIG-GUID: vNnfcnyxpDLTdJYJ0_kutWRcWcRPmzh_
X-Proofpoint-GUID: vNnfcnyxpDLTdJYJ0_kutWRcWcRPmzh_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200126

Enable ADSP (HPASS DSP) and CDSPs remoteproc on the Nord RRD board.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 35 +++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 3673003c8b21..e4c3aee441c2 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -393,6 +393,41 @@ &qupv3_2 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/nord/adsp.mbn",
+			"qcom/nord/adsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp0 {
+	firmware-name = "qcom/nord/cdsp.mbn",
+			"qcom/nord/cdsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp1 {
+	firmware-name = "qcom/nord/cdsp1.mbn",
+			"qcom/nord/cdsp1_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp2 {
+	firmware-name = "qcom/nord/cdsp2.mbn",
+			"qcom/nord/cdsp2_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp3 {
+	firmware-name = "qcom/nord/cdsp3.mbn",
+			"qcom/nord/cdsp3_dtbs.elf";
+
+	status = "okay";
+};
+
 &spi16 {
 	status = "okay";
 };
-- 
2.43.0

