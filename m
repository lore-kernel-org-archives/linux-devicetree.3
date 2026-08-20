Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEF2443E3C
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 12:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787230094; cv=none; b=YktGlbP2yEWz8iP9oZmEX6T9AHUfdROhXgbhEf6Io74bB1wi0TCDsAQgdmUEVij1UY5fdPVO2myFKNT7XKwrdUFuu1wNpS2w7ME6XdEUk6tq/dMQtsIRUCZCsz/C/8iGvO70v9TIFL18q1s8apUtNqWK6GasyEOpXzoOLDhwDwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787230094; c=relaxed/simple;
	bh=449Ex3CsleS45P3M4E5SNBEUaD0gKJyWNYaUiEtMSXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sB1SHqNkzqgNTTdJNrLahblPJ2gYfCfXiQQXnOdmXJUwYTPAc+dpsrnJIoh0yliK1hdNd+KNG50n9CjEJAbou1/gvl7VFSX7OHiH5hP9Z3qrenf2uGrVsrjgF3q9bPFoLkovjYBfKL7lY5VHRm1RzLCFQu1vrqACfDZURLMp1sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EQViquN2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AGxc9bVq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EQViquN2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AGxc9bVq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KA2nTC2932720
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 12:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d2Rrcr6IN2TrSdxDUmXvgWf0
	aEeJTdeSxPsPjotviE4=; b=EQViquN2iJCEyWL2poAcVoGeXgOS2wwNuNSVNAPn
	fyBGMrI/aYVv2QlijTlhS+iMIeMAOGwaiQY4RK5+h6H2aZSFBx/dnyiCvx9skrHC
	+lsPqgSuIYT0MLk8HCvM19tm+WBwroKHYDQO2mCeTP8SpipGbyLdLk34/rHXPNQO
	y9lrFanfD+xjCSp4NAso9YfWQitV4kVmk0lmPf7CGGokeG/FyaOJj75qdyauvfh7
	AXGYIofULsjdWLGo2eXUl+dDUvgBCixWNyKpnbZGOm8nqYN/BaAdjBEqCARdkdGd
	qA7G3TaX+VIK+sXWPVu9YaBtxokm+CWsMPHXgo/87F5j3w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg0gjus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 12:48:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93494527488so382673785a.3
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 05:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787230092; x=1787834892; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d2Rrcr6IN2TrSdxDUmXvgWf0aEeJTdeSxPsPjotviE4=;
        b=AGxc9bVqIaOfnr1WrF00pYAdEUCFT1oL5RlHM0WjW5bS4YJGQxUIuXwqLd66vk83wr
         gH5E4PbebfRvWxHz7YbYil2PKjnmT8tStCZbGWivnd3CvBcBnV4MdNP+o30YDmyyC6hv
         ztvyAu+q6rJ9JBvOHE3xLHkEkvhBgf5v6ni6AS7on5kzNMgerOtqaaquJZYnEWO5mmTL
         7noNl0U3JKzuumOCQ07JRgAZO5TfX1rmxFnq21SvOeMgzAj9WnlwDZnfClj4RRXbZO4o
         6ta6O0AEoUjCDfzfzUQ2gHe6nQNZc0/Ln02+ckeeq//E2EUUz+sZV9nREdYa9h+jyrMu
         1UCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787230092; x=1787834892;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d2Rrcr6IN2TrSdxDUmXvgWf0aEeJTdeSxPsPjotviE4=;
        b=N2pv3gDaXfdH9tYfj63IkuM0qukMhMM9yejvPwQvRMPpWcoEbmf+ou0T4Ck3Z2mGDE
         B93v0J2N6JkW+z5VbwGnL3E5BFW5YjXuGswRs36CQOmq+LEFepnjj3Ia8fZ4TcHz8NGy
         wXJUiH3QeExJrEtQSosO1IsJP51OjGbPpUw3jG0zLDAnQIcU5ttxrwOgKwsoRpmL5oKM
         G2RAeG2V2C0Jlm7UoCWhWkjC6yYIFdW2wlqMeG/wzm38XyIOZsH9eJo/gk38H57l4phs
         DxWSSqD1QZs8XNLTnZ1I5jxLfnbMMKBcKzoJulE/Y1zdnkiyOphs9RXVb9N3vtIDf8ZQ
         tu3Q==
X-Forwarded-Encrypted: i=1; AHgh+RotMy9vB0x+FH5SZway0ivYU4zjsg0gS+H1/zfNkBixSqc1WoQepzXDPpY0TLlSxjioYLnUXCxBe/0M@vger.kernel.org
X-Gm-Message-State: AOJu0YylV+yZWL5J90IGMDGc3jE8u/UsCAFNegjfRkYCCfCphxazEszA
	ZCyUKpPAd/6J9LDSRRsCxaSkIharYtR2dvvDMp2+u6FVTP9reFzcuWSg0YGvLhhIPw5oGtvwAio
	AVI60v3iMgiVEhgN19B0W2cZCzlAM78l8QyJ/lVpSAT8QMS/3DgiqREBNFDh90Ajx
X-Gm-Gg: AR+sD10KYvax/r23LhRbepsmkWNPZjoVEp76Z+N5Q73Uu36pFYP6/vsy4rrqWvxKm/K
	KLKlQoyYKEir94yOXslsjn5rGJ9Djv3YB/udIxuqu9FW253bRtmRhvH3GanHQd5AeQzzSnkl60L
	t9379DJNdwjhXF80wcDOMbaXD5+KzwgBicipDkqIBqegGAVyXvYydhFLTZ/yYyVoYztbHawCyRE
	q4pDLjG0noXe8nEUug5upxXSBBMd3Gx6SUZmmdeuJw4kfpR8j2y5cZvkwz0NqZyZSfVUPdl9+sE
	Yp6Gg+4COhHNlIsgmi9PFbGCe4LIj8Yux3eoBtWDwWeS/WDSGRX+Yea2vonAzBRM59gheftSYHl
	rKbt0OOvkEkJ1EyI=
X-Received: by 2002:a05:620a:63c9:b0:934:81ae:6d1b with SMTP id af79cd13be357-9371e6f7247mr1220475485a.22.1787230091094;
        Thu, 20 Aug 2026 05:48:11 -0700 (PDT)
X-Received: by 2002:a05:620a:63c9:b0:934:81ae:6d1b with SMTP id af79cd13be357-9371e6f7247mr1220465685a.22.1787230090333;
        Thu, 20 Aug 2026 05:48:10 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa11f832sm136903335e9.7.2026.08.20.05.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 05:48:09 -0700 (PDT)
Date: Thu, 20 Aug 2026 15:48:07 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: agatti: Flatten the USB node
Message-ID: <xeto7gds4bwj4mcwitoaaxh6u72d2x3rw5evex7uuwle7i7ppy@s7unldat3cth>
References: <20260820-topic-agatti_flatten-v1-1-ba9dcab9dc2c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820-topic-agatti_flatten-v1-1-ba9dcab9dc2c@oss.qualcomm.com>
X-Proofpoint-GUID: tGuL0XjJCxGmAavOtHw19Jy7nXYVZpLF
X-Proofpoint-ORIG-GUID: tGuL0XjJCxGmAavOtHw19Jy7nXYVZpLF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA5NSBTYWx0ZWRfX2Iyb0TJeBS6L
 I2NVYRJv++YhkCSazfXcOUTHGguhWlmilcczYs/nH1D8ylMwYEfdkqonjno2B37XzzBpEGETpxn
 dJHXCIImRcIvXYwBZwDE2XpAva2TEk8X8/XAIpIjlKIq5MehKw2ZJh/9mQiqgRMhwqXSnWNtyiK
 F0+N+Y4B0tNglg1JAoz6xN7uqWSQD6nIZraylgE+Get0ieDNSppzal96fJqPt+xSqFfkujdkA5P
 eb0FnTHtGe58AwrK3AGfD4/CyZIwtv2CyewJeO+ZNvcRFJRyxCr2RXzCorP3UHRZygutWyM5Gwj
 0b0vHNG/zm85OuHXAoB5c4032WiadNNbtc3F4Uyynr5/MEXMWpx9hGq2QADGjF1HQxqcfAf4PIf
 YZGSG3j3m5cXLspuzQb8Fdqd1IrHMQCcFdkIvom8lssYSF+SyLO8mgf4h/+2T27jQdTbDHm72BZ
 tcC+HIjhUDm8ulr65Ww==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA5NSBTYWx0ZWRfX5QRRWHOV3xw5
 5b5wjTzF2VlBdiEFBycxFCyZNYPJ+gjInRiogr7was8hM8n62FS9jjbSLqQJvx1kV1/hxNcZGOQ
 SCR9vQkq2TvHdJToQv10W9GhsUWHKP8=
X-Authority-Analysis: v=2.4 cv=JoXBas4C c=1 sm=1 tr=0 ts=6a86f78c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=XQXjnm9Gq3xsJ3B3hqUA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200095

On 26-08-20 14:37:16, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Flatten usb controller nodes and update to using latest bindings
> and flattened driver approach.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
