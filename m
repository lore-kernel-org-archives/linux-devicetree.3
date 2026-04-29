Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DC93AF670
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 07:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448678; cv=none; b=HSlCrm5jXxpn2bMTyVg0zGNlPZKwjtE/7adVlVwkXLIbVDaabGKhQsE7qw5E7yjCPhkYUnne8QWGFFKDQdgdRXedrwc/1YwJMwV4YNiNFamokqE4YGxTnZgdYVZujpoubpF3BC+Xij01spQ1mumUFWWm4OsuD/tbsM6L/nG6Bv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448678; c=relaxed/simple;
	bh=qscoCSFAgisCe1f4h29FeB3VcT/jr5H2iv1XW6q2vDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bx3HaBlOZEeQNBxsXUC5VOvZ75e6YzpV9qDVMlh8qCv6SMoWEPQhv0EtJc1XVcUdc8hFeat5Iaf+cbKf/uBNFz/odD0OLrA9hVP8Q35H/dBkokXNThKf5vd+pi2eYmY9IbfgbmQFoLk4ekLfGO1ThF6Um+MX0UgWKro1gO7uS2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eBVT0Ctp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BW1E+TiH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eBVT0Ctp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BW1E+TiH"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T1Y2W63705173
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 07:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wKU3mkcAdu5oWFLwon4MUG7vzEY7xSuDI2VpUgR6EjM=; b=eBVT0CtpVU+Blc7Z
	bDBGq657jgsZdMmj6uBX1mm5QtXRuPtQDgeXL87PyxZjumQY0cnIptMlCJlFRnIg
	4nQlomCYjz5dEeNkz3/L42lbMY1hF+91u1veRdbxAV5fvCFhVbz358ZBWBpu5q14
	RoapHIcc9wSCe2cLHB+/Qv+w5G3GzUZC8JB0yfmOk0rf2RirzDe5SWQAOTwyykrH
	+8/NBLosp79sV/80VEIM9HOMNGRRgdELO60YNlItIo7tiAtbXtowSk62xutQe3Px
	FjB/8syL6/AXQ77xAIf3zFHHldvYW4yA0zdWw2XghuhDVLcRQ/+35fPAmjhvug/8
	EdScEg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttxhcakj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 07:44:33 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c799ee56bd6so3666582a12.2
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 00:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777448673; x=1778053473; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wKU3mkcAdu5oWFLwon4MUG7vzEY7xSuDI2VpUgR6EjM=;
        b=BW1E+TiHXUZoubHObvG6KulvZ56bZ5ImcOj5U8vTR1xLRZnjTEfC6pDGPf0VpJ5UW0
         S1ZjTeZE6bxgimiOuFSaYbtxGEktO2gdCMyNb1V1hUBIF/bW63plOVA0yk38eI6ubJ1h
         xbkPNGxser64XM7kMWMQ+bug/g0FVtwPTnabMJ83Hdr65aVhRJm/k7X7VwAT8aJu2pPD
         LHpBk6A75JWP7f4uJ9MmZCFj8S+gqOGUc6th34vKQobizvcLCMyKFomUhP9c26hdiXSw
         Aoswew+FOlWe0sDtgItYB9vkKqAraBtVAhtGeRVLXUFf0Ki6OknXsUHoKNFdjz74+fud
         /c2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777448673; x=1778053473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wKU3mkcAdu5oWFLwon4MUG7vzEY7xSuDI2VpUgR6EjM=;
        b=tI67LvAagJU4xHS4bz9KiFekzHQuUn1tIqtJUKjeYWVmKnFLW5VCZ7piirD61CmmY/
         u4d5QzUPp5mlr2/Frp5xUAhocl/8El+MPxbRNTBxhO9pzplJvFMWwYUV/NceNmfc6CdF
         HEGnMWBLCUPS2asQpDhrJY87dbGmqj8lqW4mMbiIprtc/QMV1YjVTlnr0qn8V2fzE/6P
         5f6Hx0LvTMs2qQEwGhtNlxyQDLcMlHDkPc2Jx41k9B/f+8bwMWhZAyJu1g1lPf9i5KK9
         vFqm85qqJdY69Nkka2syODdZQDyy9GrwmwBXK0NILP5+4OIWsDWDfOoq/SHvEWpuNFck
         H8Lw==
X-Forwarded-Encrypted: i=1; AFNElJ+nqzkhGs7yxOYlInF8MM8WkLmXHz4QyYnYBXmcgDywiDAhzz+L2bkZfykn4T6rcwGPxhUa3FUPItFH@vger.kernel.org
X-Gm-Message-State: AOJu0YzkvKQZ2oen2r1BbDBgXgOfpFWlxketHcpn/e9ID0MWDwGxtr0w
	s3N8F40623fwgeML5Jk5tMo7JEP4eb5yzp4bjf/uULYu/x4NM15bKiNcVckwrWMQJewo76Qttvy
	q9dgSyP4wKuDDURiW5dknQAWipu3slF8azuGapT0+oaT9hJYshesLXR7DtIPXb3sO
X-Gm-Gg: AeBDiesc3TXZ6HwpZKfrR4fFAl9qW7h5juVm53MtbwDdiqLX396lWw1c+ze37719viZ
	nIaGjMPhR9jo0DpqADwbOYj2j/0YwcqhVErtCwTlaJmF75X1PR+cYD1RrokIkNlEDlZhXAEswAI
	Atw96A7lUzTz+nn6v09rsWr5r24x6N2jfX2LzV9SHh8rmUi4rZnLd/OdTCnX52JJI9va6LDUZ55
	0ahzLWF3Fz9ES0JSfsVkScFn3z/6cN6yr+HM2TKC/zlvcM4FWLRtR7TzpzlkkPpVX6zoU6UQQt1
	sFd0wmzMQj9oDol8Ejj3ecU7sXfbBamVUKzBaxMvCiklE0WUD/phOkLrz3G2mo+zXmy7MUtggee
	4LC0xd+sHF3166GPV5b25N0oSIHCuTTE4dUgwEs07a3amdwjq6JWQ6mCS5qc39fE=
X-Received: by 2002:a05:6a20:6a26:b0:3a1:d516:36ec with SMTP id adf61e73a8af0-3a3af700709mr3129248637.56.1777448672932;
        Wed, 29 Apr 2026 00:44:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a26:b0:3a1:d516:36ec with SMTP id adf61e73a8af0-3a3af700709mr3129219637.56.1777448672450;
        Wed, 29 Apr 2026 00:44:32 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd6506858sm1155848a12.24.2026.04.29.00.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:44:31 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 15:43:56 +0800
Subject: [PATCH v5 5/5] arm64: dts: qcom: purwa-iot-som: enable video
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-enable_iris_on_purwa-v5-5-438fa96da248@oss.qualcomm.com>
References: <20260429-enable_iris_on_purwa-v5-0-438fa96da248@oss.qualcomm.com>
In-Reply-To: <20260429-enable_iris_on_purwa-v5-0-438fa96da248@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777448637; l=1004;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=qscoCSFAgisCe1f4h29FeB3VcT/jr5H2iv1XW6q2vDA=;
 b=0IkCVdxVg0r4cAoAG6j72CGEOa3m9qhNipf+eavwcVAoJFapVIofSwDuJsXRjC5nfFVxOinf9
 fnDcVrlSPNuAlyb/a5+6MAslUrfQkL2Dma1IaDIocQAcIYc48sYlqRY
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA3NSBTYWx0ZWRfX1aHKUQ+UD2Ze
 ycHUanjxM3o6bGytrfK2KHKWMb5VHHDlchMPnCUZRzgTOBi6eCBB+F/NgyTv0I3OzRMrQ0X6z3I
 yNdwwxRmN+Z8OMq6HV8Upbjul++e9bSyABqQwNhN0XNRH9Ih2wzQOmkxdiRKP4b8AUIr93Ddk9s
 6uGgPen1Gl4jnDJrB2VKKmp2Bg13zWx5qHY/AAFPLek1riEkZ9Fyfwg7ui7hdy5/K+VCM6yFake
 PA3OicckaYJuJLHq9S/tjXknSchpGNvDYn+FpvO8jntAkK1MGChSiGh5qdm5c5A1J1FvXxhCSX3
 UlHVABFnHtCROIeDvVh5vg6spFAJVn1q+sx7vzGhAgXJ6xkT2HndQRdfKTY74Uz00Vc1M1U7uAe
 ZpSgWFKZH74ONG9poipqMKriG9GQzV/QEDzz7OmUjBgxZarntpVKB5M/sKFVDyy3nOpWeFgWBFN
 o2YCmqM7Ft0OCKP1WVQ==
X-Authority-Analysis: v=2.4 cv=Uu5T8ewB c=1 sm=1 tr=0 ts=69f1b6e1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=REEBHDwWlCTOHul6J5gA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 8qV6LYalDPOk9gCapw-cdLuubKfJpzi9
X-Proofpoint-GUID: 8qV6LYalDPOk9gCapw-cdLuubKfJpzi9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290075

Enable video nodes on the purwa-iot-som board.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
index 394e65518ac5037e5c7c50583acefc0dbc8ebb47..ff8621f8750584636ad781467f9c35ace2354e4c 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
@@ -389,6 +389,10 @@ &gpu_zap_shader {
 	firmware-name = "qcom/x1p42100/gen71500_zap.mbn";
 };
 
+&iris {
+	status = "okay";
+};
+
 &pcie3 {
 	pinctrl-0 = <&pcie3_default>;
 	pinctrl-names = "default";

-- 
2.43.0

