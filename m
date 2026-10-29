Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793298847;
	b=H0xRUCmWSsviHR1fgmP4c8zWdY3wencdm3BRME4kJ6tJcSDNj1IOYGR28mTWipw9kJNj
	 IL/gW+OIfnn+q03IaQsmHAHrHMIgXW9nJ/0PZZOpqDO4VHE63LMgWfSNGlqpHJUZBNyaO
	 QFwnKPTFtG0JKtjy6SnxetU6k4w0Ui3nGElwAZyFrrIAcJB9/e6UyiKhbuYeBHd1cASCD
	 RQpRSaKh+vdfqPYGYIRcnw1Ya8eAvIrrriCV1BfayrVi66/gC6+3Z2V9khFbL58B3TI/U
	 V34WsB1uflCYgVAo8M/Xyf9FCUeMn4BYMWLT7/Bk+rG4p36UEPYMsGXJyQs72huY1zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793298847;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Z+aDws7OJDKq+f4+h02DRvXLUpx0YCtn3FsfNdtqNoc=;
	b=s5Lqy5rp1+T4kTjOY6she0f5ccltix54mO+h1749aHVKArasYT0WhPTHbp3uZWnX1pke
	 AnRaTccgA4igUoQzQe07s/Xuyqxljx8YfhaqYe5mVGmMp+vlGDG+ZyHVRNxUQAtLcuRca
	 9CknMXpBPDFica8tZamy/gzXEwr/3H5ATym4SS8FlehuOsBi/rrMm+nh0tJdBQyT7WYsI
	 KqFNY/fsXH667PFYPfwYJGhdPKHIreAVtcnxYted/olX7YaYr10H3+tqxY1xCHXygPVWe
	 d6xrtq5hUT2SJffrHz3R7M5BjWwIysRXjGsQi5TN2Tv4WvbWownlmVFyyiN9AYr52bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="K/1UWcCZ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OTYW69R7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6B7606A31E
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C6B7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K/1UWcCZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OTYW69R7
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TIHvd6879687
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:34:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z+aDws7OJDKq+f4+h02DRvXLUpx0YCtn3FsfNdtqNoc=; b=K/1UWcCZpNbhyzNN
	WbtJu/7bS5iTGmfyIl+XdgXFcxcZaSq77pY/Z9jqUqPtArOotHCHroW7SKalFhX9
	rDj4WrQXIlvnAwa3VXV18HpaaWcOfLr4ZAEw2sxnjjrMBtnrmbuBLZvSU5TkzBWY
	RV0f0JNssbuzy0qayYMo2cLG9WHONvjfjKmE4aOfizipis6e++C4WMCESwE1Do47
	v86gIckMySnK6gwOl8cEodnNkSLG5r2jJyTtBgh0Rq6ytQUmwGZIn7AJJKYqJWST
	4jQmhCLZhsEsNMsXVjfcxUmDjBgoH1OVCCdrUNWvk4WSqXbSOYOkdDP3mPasJBlM
	nZZliw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hmba4r3jq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:34:06 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3662e7a9299so9411522eec.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 11:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793298846; x=1793903646; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z+aDws7OJDKq+f4+h02DRvXLUpx0YCtn3FsfNdtqNoc=;
        b=OTYW69R75hy1zUMEtOG9ELYw47s2HvYNUiIXVsDAj8p6ruZt9WFdddUwnN8HNw+4YC
         3wg3uFmSzLFtWvwnjMEOvTV+/RH2zcCYlDThHeSU7iAIGN1LVA2lZlLGRfOhj41LvHdT
         IO4WgOiULzpmRfMp1bNazf3SxKdC/bper5VqTQHsMbL04gsT1Mzma+31cZEXiNoN3tTV
         XJrVxBb3mmnQ7BeIRK8bw3XLO/pZi2Vi4LzqXpdR5cBx9LjZBKjlSVaXsOgjry61y+kd
         Tb4hNhVpH/qFBY74KShCYfREfhHVDbwe0GGcG7vsJ2C6diIb0UynQkoirYmoz6YTfZt6
         0shg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793298846; x=1793903646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z+aDws7OJDKq+f4+h02DRvXLUpx0YCtn3FsfNdtqNoc=;
        b=Zv4U5itOaY/ToZtM/78eaKQvgD7E1sgDn414oHzIDpcItTiMH+TbyzST80GtE1/ILN
         p5tn9e38jUxaohN3JffFlizPFamEsCDSwT4cP7HhfvkkOPzQd9zDps5H2dFkdj0nBd0P
         JSNftIDLV0IO8ObNT58l8EQVyIRPxjj4bYcsu7JZeKDBzD3/lcWsq5CQiJ2gadfHZtTp
         VCXuBuPyAZS/qDB/R/nv74hdK6/a6NNh2NvpHRoJ7TskbCddoyDXCNZihdwVehiuPoHT
         SMXYuYta/BEkjv6+SBwu5AuZ6Kq8xGD5yCGNIy30YKxuT+zeyqe38AnMvv9hAr/wMZKu
         Y8KQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQ8myTeSXWU4w5xQDr+1tmHjQjUs1i3crhyGhub8bOZYpKK4rNed3ZEgrMLxTRmsWckF3kUPjtAGqq@vger.kernel.org
X-Gm-Message-State: AFq9FYJekTb108glHY7GOCFhlGDL9mTuUrO+mcXRplyfWRLycchUuHKS
	yoxLCL/3SKjReFRSSzpSlzOrLLPDPNigAobDXQM/lRMqi9JEFPx+XfG29MeT+nOIvOHCKtuwNjT
	p3Ryg4rldAfnZ9WzszKR11mnc6/R7J5dZUgDqTFUKIISzErBKDe3H3+EJqBt4aT7T
X-Gm-Gg: AYBFou1RRcOq50QTCrXXOqqYCpMxATJ+nywkmplLvL8L2gDa6CVGWh+YC/JcyX0a9D7
	TJlAqOuwyPGJ5gMF4PD8DCfwDFK7cpJ111erqc7qgXH1SUnlAsVT/v3Ld0QiXWlOrYOvukAGa7T
	XcLa6pAtgHjMss80z7Oo0kpGFBi+xxTvZanUK+wk4IND/lXjiPPT/6Lgjkz3H5MDsfValtnZ9CT
	omwcWDzNsh+SJPWZ1GHkMFc/FZZnKUw0d2CNZS7zqI0Pw3fYUqPVKgafUk6pDgUYoG3KlSOBy6w
	PEKPnTA8PiHhl7gon6kiefsGg+uUaC6COXFj1lXdRJKi2zrATCCt9H0dPGvDas6hNdqVO0e1eum
	n5SIVbyLGd8I1Lp7zMGMw3Ldqg6jCp5UGkLAy23JAbtS/QqbjZOEZEM5qMu05iVPPpStx9++0xD
	XlP8JleN8MuMVdMx3ZwbTOIlEBGs2w0lKPzfkiJsqrqQ==
X-Received: by 2002:a05:693c:87d0:20b0:36a:18a:e00f with SMTP id 5a478bee46e88-36a42406487mr293221eec.34.1793298845808;
        Thu, 29 Oct 2026 11:34:05 -0700 (PDT)
X-Received: by 2002:a05:693c:87d0:20b0:36a:18a:e00f with SMTP id 5a478bee46e88-36a42406487mr293142eec.34.1793298844743;
        Thu, 29 Oct 2026 11:34:04 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a504c6sm389458eec.21.2026.10.29.11.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:34:04 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 00:03:40 +0530
Subject: [PATCH 3/6] arm64: dts: qcom: sm8450: Mark USB controller as DMA
 coherent
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-usb-dma-coherent-v1-3-3147b8f7aa64@oss.qualcomm.com>
References: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
In-Reply-To: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793298829; l=708;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=DZIC2FMxgoUo+lHizqzlRGkDHZh3jbRVq2fl93zvclc=;
 b=1Ja1rpsjyOWr7a4tpUPPzBUUP1eVslWIM2yGsnNIsK0ixqk8y9GKW4MDvJZMJixdgl0VJkKqk
 TGqPG6CJ7kaCE/8hR1WY6LAtiJbZj71ucUq49R6xJqyzcQOnOiTwsgu
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-GUID: qZ41dCvK5ptZasCVSkg1HQLJSx8BtuT3
X-Authority-Analysis: v=2.4 cv=X8PHu2Te c=1 sm=1 tr=0 ts=6ae3919e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Srwhhb0qkpw3J9eHVkAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfX4xIG+3VMJvd/
 ou3PPQDR7JkzD+yHz94zzfViG7E1RUWwcBPx+Vp2agGu+B1WP4uheQE0kGpOFxdSnpD7yr6D7FY
 5S+5hgtaqMRfdi/THWRuNzsId/hBgXE+c17Asqf0Z13F6KHb4KVPizeQJ1TfgPQorIMLTudWLj6
 QvUfQFAUUyb++i5mDIU7FL3Er264knKHqiix8Zv/Y+bEL/hofL5LNV8D+hdhEcQscvRfaw6xhyw
 VasKLDOECCyIIu8IduvVOIeDYYehsV9pzO5guL7+oCsiMv4Y5y2nqseA0KdWNLYnPUdaLqakqwB
 sJEOoiSAR6Rs0XUDdkafJi3KU2xo8SjB3ETQDz8GuIpdg4Wti9PRw1apKU+xa69BqoS2rbBl9FT
 1yQZOZYE8aq5sUVm615odOL0rVFKHBpBKeVkCPaDXXgNDjYase5uHfkMoDqlJZPazbukn6yIUmT
 btt1hymbw5V/aya4qnA==
X-Proofpoint-ORIG-GUID: qZ41dCvK5ptZasCVSkg1HQLJSx8BtuT3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfX3mFe10rnfmpJ
 RuOzKkUM/SKOx7TMQ8/Hkk6j6kKTS1xJOK3K2h/TcoSAoYPIqdYfvNu7Bcbxjvr+p15FpL9fFw/
 K37Je86baiijKKmLWm+3s8AihgQRglc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290072

The USB controller on SM8450 is DMA coherent. Add property
indicating the same.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 05417cb5c4e5..b611671e292f 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -5489,6 +5489,7 @@ usb_1: usb@a600000 {
 			phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 			phy-names = "usb2-phy", "usb3-phy";
 			usb-role-switch;
+			dma-coherent;
 
 			ports {
 				#address-cells = <1>;

-- 
2.34.1

