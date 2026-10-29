Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793298855;
	b=zVLy5DeNLQUHiFH02Nf64egcufpF0KSYFpqKCUrpmJTy67BDIP41u+f+r5/qe0BS5fc8
	 IaD1c8qZAVIsrtAMriWH+1j2pxBCtjp+pKb1PdTsj9WfJI9hElx8+CFCsmXT0aX/r4Ls7
	 I28BnXo4WQLuw4CZr2dIqXWTXRSxk9S1+rZ5jZB6JnXJk9Buc7ej8PVnB81hMs38SxUMp
	 /A687y32gQj9pbL2gGsRHtLJbz5ufU7UTHN/GiAthVWIkGJbQ/yz6x0oNe9+wOiKjUjWP
	 2doqcgVCAt3X/WQQu2AF8A1dEmMsVf7T7T0VYjvmlEsggJgnOci1Teou1kccBUSX3gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793298855;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wNFQNiHHy598GSstSddLXyS+E1B69m3x+sFkpb+CF7U=;
	b=TdKnUo0YUjqxDrV4lf1EEncs/Jh5FlpiqUSB4By13WbEl0Bamkgn237Rhw5AuUtiU1lE
	 ueWXJQO9p2Pu5GofkUlfow4GiYq2pitMrjvDEXB1KvRocQtE4B5asgX5bEF48V5yAbRtX
	 WvqXkn7SwCajN5uMCzG775ViGz7oOvs64HkG7nKxmstEu1m+3JgxiWehZKsjbgqXUh20h
	 logdJlZFyZlPtm6ZpZ/AbIQGERarieTrp1m4F3RFUxS3ydXHd6tOgPDno5aTlsE5k12Gm
	 rGYdRb7WOHMy2uveAHRv8E4zPr+y5OrDk+0uRgRHlXj+gYOxFI6oylTRDuctvsAdVKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aHwkIn4B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZgnQg1xT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC76C606A31C
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC76C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aHwkIn4B;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZgnQg1xT
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDHRq1654906
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wNFQNiHHy598GSstSddLXyS+E1B69m3x+sFkpb+CF7U=; b=aHwkIn4BUiWww/ES
	rRb0w8vGah3Kr3xjIPpp9gCYDMJ4JXolfA1BemYnClwWwglgqTVIDiUNXyUOIWyE
	d7/S/Sfu54v3SQzH4sXDg2/8A061xIe1oA8+sJB+/dzjHDLvzf0x3OfeG8Ykpzz7
	LAOuqOgx6JkqV8yaYagY/W4GO7QwwI/9aNSJ9l9KW9+28ZQqfLV/YTSxM1Q1PoOB
	g+DlzNnEyoqiIDuLfrQljMygFnMnAJZDsRKZScLNqeoy/UkUIebf9YXTAnfLVuaV
	SyI2b1vrzLjMV7It+AewtuQ1qJ3ROAoYKkVZae0OTZqNk/PR+ET/MratsfUhYRef
	P9TwDw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm4a226ga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:34:14 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a1e2485fdso4976116eec.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 11:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793298853; x=1793903653; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNFQNiHHy598GSstSddLXyS+E1B69m3x+sFkpb+CF7U=;
        b=ZgnQg1xT3p3rrqn7JgctH3yaPvLiPEzEnlOf33Yq5CqDLvfltSghAUlJf4X6X0aFJp
         qAp74icA98aHeWeGNzdJRIkrFVAYhmYerNySSzenuHzXE5iTkpfOKycnS5opWsIrN+rg
         b3LXmypuLlw60IZReS0g1oB6zw3pSbPMB2gSujYjFJIMNiUJLNYpajymCJpPWUiQ3qpN
         2sKyLjmlVXIG4QkQLKjtg95T/7ldaWPN/XiG6xUg8EiNGoCm44AyHSRi0Jggk0dIvIQk
         qRHRoe9KSnARAubxLXAXhjxqnARxzWMxpQ/1IzaTqe8dUX69dIektRJzXuVQTUkCraiF
         31DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793298853; x=1793903653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wNFQNiHHy598GSstSddLXyS+E1B69m3x+sFkpb+CF7U=;
        b=1+s1RzzkLhda+zNuJInIQkLOgtH0nAHSrcih1TAqJbX0/ZoZXZagAqct6zc9OL3g/U
         YzlXp1uUrUBC5jwvvLZ2YDL6hrU06/GNRRt/BIJdpvxuzgVpmkwcbzOwZyN9v/NDvphK
         pVZnH34G1CjS6nT7gDtRixS+mTBjUAy19D85yBtY/7N1uN6MddEsXRFhpMnL3/uaBDqA
         WI9Z7FcURpX01JWzMhu3q00C5Vtfxyqf0LwGdxEvfcr4K+Q9jZIq+ormF2C3MPsib0cF
         J89IQe+olMZ/3VnuQUIS2iNotEiReFi79OJeelOCOT02Fbk//QO595zPAtD/RytbIWsU
         noBg==
X-Forwarded-Encrypted: i=1; AKwUvByqOPf0Ld0DVv3QgjfjLNdNYl4bbA17oSSkGFM3/+nKyTWulsIgfxMSLnpZG4K2EpwAs/f+exyf4Fz9@vger.kernel.org
X-Gm-Message-State: AFq9FYKwYEMnuu6yh7UZNowfkcnC64OKNa5ycxwVI78naFQyCCRTFFIt
	uCHMl2Fi6V7T7mS8phBwC7kW9RyoHCq7Jxgn7DLtvpbh9QoOazcXNBFSj/9K6lXge4QYlBaTOUp
	kI6wwWGNsR1dceUhhWis66NWQG5+xPgyAQIj3BDpFry66i/qbHk5ppZ6BpQf9z3xh
X-Gm-Gg: AYBFou1Cv9SRnPHh9gGv8avpGhaOUyBvGnvXlU7nsbtFiObr8ufYWpTTlywPtgV9R9k
	Shk4Sa6uKE+vb33nGOU3NSDeq/mcz4lgc9M9OXoVgF9hkr3iGqOOMGLZV2CyMrRFaICk+r9S3hE
	PHJbYkTMCqvAcvMqSTEm+YVjJb4WWks7WPmaBDvrve45q7r9Prwp3bEGTnO5dnQcUh3w894fhU7
	S3X11QqN5kKpk/goNYgD0lSCbtaDy0/pLqtKE2EJcwoSkIb8sTvHhEZy8wuwszZKrwb/Jg+00Ou
	G0FIY2v0Hq8uaI2NLislk6U3pW2MFGN6wiAz8sIxbJbEvMdHVRPgKuLbbRVAeNIGwRD2S10NPoH
	dyMF0NySMNQ2lKh9WT0ozqctUeT2LhpYJpG6uUnSOf7wzJdmNh0BTZUJScjy6ezyFdJ7BUrA9++
	YtEOqIGH903RUA0kw4/8ZxrjfyGDl7n1j0uSA9UAsnuw==
X-Received: by 2002:a05:7300:22dd:b0:36a:1c46:275f with SMTP id 5a478bee46e88-36a4244c248mr298725eec.21.1793298853399;
        Thu, 29 Oct 2026 11:34:13 -0700 (PDT)
X-Received: by 2002:a05:7300:22dd:b0:36a:1c46:275f with SMTP id 5a478bee46e88-36a4244c248mr298682eec.21.1793298852836;
        Thu, 29 Oct 2026 11:34:12 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a504c6sm389458eec.21.2026.10.29.11.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:34:12 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 00:03:42 +0530
Subject: [PATCH 5/6] arm64: dts: qcom: kodiak: Mark USB controllers as DMA
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
Message-Id: <20261030-usb-dma-coherent-v1-5-3147b8f7aa64@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793298829; l=882;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=LDViqDps+gY5QGZh6wRwg12ChAW39TTNsdfn/yvqIEo=;
 b=bdO16iJMaKFPsmggJlsJXyAJfM+tP/adZF4InmvAazAB0QpJWs1nsfuIq8QOhXQNC25J9Ez/O
 t/4uG3/qLZsDtR8DUByyRTO53O2K2UOYjEpjmWYXse2XjTE9uSjp3m1
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfXyflPJuxsBtha
 bNgD6xKG+yY2lP78nYRKrJ1VZH8I9eRmdkqB69DJsv+rJadK9OvGAS+X/Fe23RDZ4B7ZpGQ1M0F
 ZDghXFrV3mFHNH1O62237m/X36ciYBw1Y5d8H78NYrWT6oO8wc9EbjfZmFvlDAr5uDIvYSeL9fL
 SB5j9uscWDkcSJb7VkcNm2G9JAN9UA+Cjfl8OCtCRVVqGG+/7mxY0A3DfhzMrqAlnr8KJ9Z9EiP
 wkKKjaRImXAcloMRrWw1+2Nf0cDwrWrD5MbWRZBjRKqpLinv3EU5o4IhRQraxhQPQE76BBvfV1y
 0inHUeb4O+Kc1bNXhWPkgldndVB2aR1nrLgZew7CoQwXlj2IiC+oIWVKxtSzC99nwabnUE7bdsj
 aUj1fKFW2c76ovhu26ByUEIA9FN6sYbSeMfAKluO3NRLHa2x675DUhiObyhZrW6/AEzS2+gy1Vu
 oJjPlIpI9OA85ToBkRQ==
X-Authority-Analysis: v=2.4 cv=E8tYNqdl c=1 sm=1 tr=0 ts=6ae391a6 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_R9ktDxRehPmGBbURfwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfX90NR7TsRSJfR
 MTu2CNKKO9p6ZW+8obXeJ3VCnWDCqEq6EgTSaZ3hPpvX6qIhNBtQ5A6ImfFYvnl8e23WJrhg+sf
 PcI5vJfBZB5Lt7qAfxiELGdN0EnfEJg=
X-Proofpoint-ORIG-GUID: 0-PIDOlXIxATBjCE3fZLekNTkftZGAcb
X-Proofpoint-GUID: 0-PIDOlXIxATBjCE3fZLekNTkftZGAcb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290072

Both USB controllers on Kodiak are DMA coherent. Add property
indicating the same.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 8c7523602d27..f8008ae3680f 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4434,6 +4434,7 @@ usb_2: usb@8c00000 {
 			phy-names = "usb2-phy";
 			maximum-speed = "high-speed";
 			usb-role-switch;
+			dma-coherent;
 
 			port {
 				usb2_role_switch: endpoint {
@@ -4993,6 +4994,7 @@ usb_1: usb@a600000 {
 			phy-names = "usb2-phy", "usb3-phy";
 			maximum-speed = "super-speed";
 			usb-role-switch;
+			dma-coherent;
 
 			ports {
 				#address-cells = <1>;

-- 
2.34.1

