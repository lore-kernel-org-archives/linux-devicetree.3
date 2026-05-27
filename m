Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24F53EEAC2
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875062; cv=none; b=LlrPDvV/2fS2X0yY+uzYUhosiSVIWoS64VVTkUwyTFtXnDicQTH3QUuKjLXXHsgXStJ3xyqTohMkBr/8z4CCkOw8JyACtix0Ox6a2i3Z1hUBOfUohZWN3Nl5vhVGWdbWxwqggEnrxXeOEOsM0YV/QxeS0nza/YAMJLePLwp6AtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875062; c=relaxed/simple;
	bh=J0Pz69SiuwkV9OpijCO1Zm7p7PT366AV5p1CHeSthm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fLZP25XKdqoTudjykufKcsPvbLl7M0i1w6q73oz3trdN0JHO8+fzn/yePg6lQfrqX1Gt2bF+7WOQ8lwXthEURMKNaS44ovgqeJYkAwYqAmtILC0bkDJfRONzVaVMho+i29jzRkH0274VtPFycT7AvL78AiJFaVD01IM+wimTvRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cVGn5hYY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=grDvsDKl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cVGn5hYY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="grDvsDKl"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mbgl1350798
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VCYprI2U0eD
	SCldWZm2FHNdfXyYhAER+hkaVBPnyo3A=; b=cVGn5hYYuJAzBC0TwHVSLtwhdKK
	CqDa2RpJArleJZETKWPNFX0tCSY3XQsue2PDWx4yTly1LE8i09B+KPaEHqPBSqCS
	a/l2dV1UVGt+fQ36KWYf85DnkKl7lY/e5BpayhCONfQN223sRkhiKvIhQRKK1yFQ
	iCUmG5z6v6aFZp/jTIhi4LeTZVgfVb4V+ENe3j2YixPR/MsxVPZcqd1Iu92yj9kD
	Zr4bbhAIsd0xAcxCuccRfjRJrK7b/E4E2TYeYSjOFx+d0uZG9QR/D8Fjwd21tX0i
	WZ3Ce7HAMFinEC+Y40OSc4qzOo4MlQ+iuJqJqu7SnidaL2ZQW8ky5bd/+Tg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edentkdsf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b9fe2d6793so248707225ad.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 02:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875058; x=1780479858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCYprI2U0eDSCldWZm2FHNdfXyYhAER+hkaVBPnyo3A=;
        b=grDvsDKlRaL9aLzl+cpbg2Gtt/FwH+umpjv39KRS/XCnySj3guXXYkwut7q1/Kgvf1
         yomMUE5Da9JItNf2X31LCRtfNAHOzwFNf3rL4uZ7FHmlOrL9ft0tAhQmlzqc+YG1H64E
         v47MqmwLPFR48mfovO/Tqn8w1gD35hqRJoZvYbVQZ1ByWDD3uaCQNrEsDMdpQEiNGE3W
         FX6AThf/wcey/wQ2Hi07XcCnP3X4I9i1AkI6xeSCveXvBd0O3zjpy++Fux5upfRsIpF8
         DJx7jZzml/kOHy8C1FwtzQBN8j8SN2wtB18b3r6Z0b3mGUqmt4hhDOKrtHgiBUww4ijW
         zKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875058; x=1780479858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VCYprI2U0eDSCldWZm2FHNdfXyYhAER+hkaVBPnyo3A=;
        b=PCsPfU5duuyRn21o0Xmog5VVk9ZgGkyaakuJq9iwUb8XoMLys1BYsfYyLx1sCGXDLu
         DKuBovn0cRu9Ay1btGsWqWUFOCbpugAHK3ZIQJWDCq/EhX4QMVbltInaOHlqC2du/ZwT
         N3V+1Ez7GBYEU5pBHrTRD2dxSF8q21hxb7Q1zjywRcYbAYMGWKD9zknpcOTd5Pcglvwm
         k2YOcits96bBehT8XiZrF1CN4IQeVYqrphTF1w1H55G/7AL/DAHjkglzI9xQujR+6SIG
         Mp5WCdmZsMxnqIixvRAw/Yrq06nzPMUcgRu6d2+wAGg22iEst+nmvGGN0zRlEAwAypm7
         /i6A==
X-Forwarded-Encrypted: i=1; AFNElJ9f8BWRqouap6C410IKUIfPJAzAFz7FVGR/3Bi5IJCZlaPpscaXSVBgrTJF4hemokeRO5KYAnKUxvby@vger.kernel.org
X-Gm-Message-State: AOJu0YytU9EwoqZEUCwgwpTBYn2Rg6rRKyMhcVDMN3JBVPZYPrY6pyVJ
	xlyddgz9UfLBJ9+QFjHissB6LE8MkYEyGG4YZiNocW4PQvTtN4cjhV4eBcXf2sFuc3kSgP41mwc
	Vc6Ca/dZw2iNjjv59xAu8Yz1tAxv96f+3MB3HOQYWjJzibvKnnTZhTjwKw2qAHSmX
X-Gm-Gg: Acq92OF+dqVo5pLRutphzfzYf8d4Ewl6DD2d6nEAuy90vvpI8SxZ4bPhdrN8vV8M1wt
	7nFxpXA6QZfkfqve4oWcMiSTnLjpM4wgUxsR6CEO1j9MIpawnGrpgdxAdnxdMx4G05SOHGF07Y1
	wdYzIZGNN7G1aAoLVclOThe5vnE/+ARb3xLaGuzvGkRsDQP5iDKMtJI5qCwI3O9PYqKNjyW//vv
	qg5gDyQrpJPLb6PSkzbVUuWar4QTWD+yx6NHQWFJN3xHRCheorTnkBNiCfRs+fIt7t681bDhoD7
	RsFwh91dxycyMySvbcVKQ5FcINnDPq0STd5vIC7PJG55/oc0mBqQqbt3CLUECN1q7bSSJ2x83Sp
	+M/ov+X2dyASOXz8vsHPdlSFZ4QL1EsWqvvS8SC/zqChfBCT4
X-Received: by 2002:a17:903:1aae:b0:2b9:5d1b:73da with SMTP id d9443c01a7336-2beb0741079mr257340925ad.30.1779875058484;
        Wed, 27 May 2026 02:44:18 -0700 (PDT)
X-Received: by 2002:a17:903:1aae:b0:2b9:5d1b:73da with SMTP id d9443c01a7336-2beb0741079mr257340605ad.30.1779875057976;
        Wed, 27 May 2026 02:44:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:44:17 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 09/24] arm64: dts: qcom: sm8250: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:14 +0530
Message-ID: <20260527094333.2311731-10-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ja+Ma0KV c=1 sm=1 tr=0 ts=6a16bcf3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=XEim3XUm7E7NZKULO20A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Jrov739NwOqbSQ2oQr3J0GWjQUlbiKAh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfXyx156PJ2CP4b
 vZ5nqsv+MkkjRtBEWCrH824AOCYgGgxjguDPQNSmV98BQDXIN8WUn0muPOnTAlQqcvyRViVW6Gv
 wv/MxYMgdH3eN4X3b34Z4lqnESa7mMnwPKWY+XLlusJTLImHvZ+VDOurA7rzYiicMC8sKUJUiK5
 OGp2+O1bHEfUQt7ogyfZgthaeFYZnqBukE+n/sWzBjreoozxNnB4+oxHuz9qzDHKcWeKcjyz5Lg
 lGfO32+Z3VhZdxojQ5nfPbEy2gQdxL15tIEP3Ogey1zwObGdSVa0szYJyuC0UgpJUTfRNV/UKTa
 Woo99eZeKGpx79XGN9LOKGMbs9Ex4+xgIUO3Rb+mgX/H9Q/DY2HY7pojrg2vUuovy1U2nvEEHJN
 Lrs1oIK4FCHEJa44BSCJhKw/5WmjXfYRs2jFBBVvg18HxwKmu+g7D0CYkRabhi3SaZXSE5wIz1+
 WpruHuhtKbdP1HXrIqg==
X-Proofpoint-GUID: Jrov739NwOqbSQ2oQr3J0GWjQUlbiKAh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270093

The OS PDC DRV register window on sm8250 spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7076720413ab..23aa483e5c43 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -5053,7 +5053,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8250-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
+			reg = <0 0x0b220000 0 0x10000>, <0 0x17c000f0 0 0x60>;
 			qcom,pdc-ranges = <0 480 94>, <94 609 31>,
 					  <125 63 1>, <126 716 12>;
 			#interrupt-cells = <2>;
-- 
2.53.0

