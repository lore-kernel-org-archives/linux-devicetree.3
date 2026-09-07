Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA9C424D58
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 10:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778050; cv=none; b=MZsxlYfaqdINoJUv+ADtoLFWa1fpHupvqZNA2UI++put+Z2lBLNfp3XSfMrtO5bCVOXmAAiFube6FPWS/Sf+fUqSwRfZk8UafASmknVlCnSxX/YSeZH5zSZ7jXsGCOPWF4MBsecD10t9OR+NyPJi5f8zbRar6ARs5n6D3UBzW9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778050; c=relaxed/simple;
	bh=9NTlxl/KRT7a+u6DdwxgUgjC8syCrwSE+8g5XIKqIco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TsPFVo45qQjZNuwHJIteKbkucNWXOnXo+s9MTlgf0isjEF410dJXwg0k1tLK78RbnNdeLa1clhmOCJyGt2OKqOLZwmeGANVZPF0Lfj2ygKqz97hck+6I2FJ/ANXGwiPjaDvggBgwsToL5lVyjN+9150cxfwNHtZi/jvDz6+LOmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AddXTiFj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EIqLCCeS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AddXTiFj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EIqLCCeS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bWcM3702347
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 10:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=joXVJ+ek92ipV8BX41gQLKXS
	+sH6pDp8t54BpG2WTHE=; b=AddXTiFjvwJrOezmyQAiedNUl5AaULxa4s6ZUpNQ
	jlCEn3vBr52VEpai2I9Gh8nyffiCUQz6V0vvhVHV7bhDI8SDtu6XPUgfOJuoczeY
	w4T4FsZ9YUzv0PhDAcHMgHSjt3/7Smsym0UtKAkOh1tfpfj5QVI8CYId0VQR7QoN
	4Zc+7yh+r+YaedGbOFAs4LfuNwQv+JllbmHTLlM6w1b65OFOc+h1wLhhAtjrXrjt
	c38wEVNj4ZfvxdIzLQbw2NRTCGfRSBa+3AVF7IDfavq64uo7FX61H4mMiZ3Yz6Sj
	F/zsiTRhrhnqvlbGX3jqkJ4zYIYuZVoS2LSEvy9V1mvTKw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghq66hefd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 10:47:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93915f50a5cso884548085a.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 03:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788778047; x=1789382847; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=joXVJ+ek92ipV8BX41gQLKXS+sH6pDp8t54BpG2WTHE=;
        b=EIqLCCeSjsmzdRtRiEYxusBEQG8GFHbUxDR0VMZ4l1O92MMsnoLgtWxREtXXuaxR94
         BgK3CQ18SIGWIU3eFDy6CNvlzgqKFTyCUCRxl/EDkyuNF8lKvIT9SmBYC7ZbkA6YjKqZ
         BDGeUkJiiUSL/f71/RtimMm8nLcGbb8nu3ZreCwNsed/H7blxzANfWnCD6xQCmRyFrvE
         UTMXMwzuL+jD868dBs5HzoD0AsNlH1eIL3nnHNnESmZERq8qdONcdNFb/x/GducEK8Hl
         +8wroSk1wR589m+52sirsDbso/F/iTZEPS2R5Pt2SMalwCjSYPZxwFExkgdGk/TEWTeQ
         H7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778047; x=1789382847;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=joXVJ+ek92ipV8BX41gQLKXS+sH6pDp8t54BpG2WTHE=;
        b=PkL9tv4a2LwAxdcpwHlCLvKS5LWOMN/gK4ayw+T1gSHIeHby7cQMT7UKnmpDA8wR92
         7RCvuoJIuRH29EgRfmJLqf+2cWiH/RJooeldd1lsmlN12Rp1VnHn8CBXcBnMIuxaX5yB
         irEIcjiIWEz8WNondv6EjFgHqQutALMTDARL6ca7PZGmEcvqgRimQUlvPbC/sn3DWVz1
         ZcXpZKXp1CL7AzIs9eGwc8CYXlYwTLGVSbxlnsF+icCz3PFw2WtW58oadcwEKYNS9gZ4
         AOjdEXYE+VvyCoda905c5ULOHkJH3+doT6vPNMhRVu6OfNyKvlv0AubLRo5hKFSDuOIt
         Mm2g==
X-Forwarded-Encrypted: i=1; AKwUvBxhpcLBPcP60S7Y/3jTRJKyFESgolMMeV3NDhtqXxB0U0HHTu9YXVchIINO2ZlFjtzabsC+TTrJh/SX@vger.kernel.org
X-Gm-Message-State: AFuF++npMqU1wk3pbzzPWrGfi+XmiW7+HjcJZg4mcmwmtRNnpdlrraLE
	qpBbIJQSiWbnThe+NAzWGxUBEHP3zZZSW4GVhIDpDly3ackAucNFDQ/cJ16pKRueRizm8TQNCjM
	A5AGCHGIV+xWaTAr6ZEm/SRVLyrorGGuup3beC782l2asALD+dSnUCiHE71SAbt5G
X-Gm-Gg: AYBFou0UdPEglWV83hM43SMkVNDfYrxY7bkOP2x3nbZUjtnaJn5s9dgCE6DES8RixNY
	Qdfb//1hbAVwUqjNzfj494mXXEkcqND8y2SbCoyNxJOEHgX7cuZ7fZlxoT0w+XIdLiabLyBFKRT
	xkWK3gSKz8wQFX1i90oOYeyIZMJCLNQpohD7C5GwDO6MuKSeVFRo2ktGevNfapkEDsS2W6XWMoZ
	NH2WP3/iWVsb4XtBEvnrgk/kuML9cICxim3pL/xClG0HEnkulooO0dfQsTf7+iHtBTCbH8jst7R
	TcPx6VAt+ZCDlvKlXEl0xoRsxRxb+LMn/KLFVXgzCTcUPky/xnpSP5Ysi3caOx+DZao70xrqeYm
	l24NxZDyJED5I
X-Received: by 2002:a05:620a:d8b:b0:939:b783:1748 with SMTP id af79cd13be357-939b7831bedmr22465185a.7.1788778046599;
        Mon, 07 Sep 2026 03:47:26 -0700 (PDT)
X-Received: by 2002:a05:620a:d8b:b0:939:b783:1748 with SMTP id af79cd13be357-939b7831bedmr22462885a.7.1788778046123;
        Mon, 07 Sep 2026 03:47:26 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d476esm423348425e9.1.2026.09.07.03.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:47:25 -0700 (PDT)
Date: Mon, 7 Sep 2026 13:47:23 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/6] arm64: dts: qcom: glymur: Add camera MCLK pinctrl
Message-ID: <5unqbyuzs5sglugv7kbtvjqmsokjxm44ldgpxatfvcksntmzdw@qe4faliho5ur>
References: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
 <20260907-glymur_camss_dts-v1-3-6c2ced5ea5f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-glymur_camss_dts-v1-3-6c2ced5ea5f9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a9e963f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=x3DTJP6EMlRaZ7yyrLMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: LM6RFVfkaUJxExO8-Q9AU8lE2GsNvx-E
X-Proofpoint-ORIG-GUID: LM6RFVfkaUJxExO8-Q9AU8lE2GsNvx-E
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExNyBTYWx0ZWRfX+cJCAi2kJkrV
 QSg5xDDc702AH5kIRkZFqaa4Wo4kx/Nx5jCX+4YG0g278yyaQqYb+f2dQW39Q05ZZ4zjD6q6pB4
 snNJLT6IbRW0yJxnJKcCdJXDZ9fhmYo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExNyBTYWx0ZWRfX2ZPoAfzb0HhD
 kumtGi6Dgi5OxMm5JBJhXqJ13ImInQza9hAZr52OEIFVWZj8bF2NmbBrMBT5FYMYWBrhvK+thEA
 /dN/5vNBK32uvc0oZJHTTBYR1nu+QeGtDZQXlVhxup7v3P3bZ+XqN156q2Z7pSuVhsDnpjrG/eX
 UAMS+6jz90O+rdqs5FY/aeOh5ACiJb15Z4BwSx6j59CFiRiqRs8YXZxTUk6nKiirZJHmjiNApBu
 TDvBopLLZM5IEuOsBUP3ChgBGA1Sigm9G2Ty/QKWvvCJVEyI0dRaXnQJt+DYcIU6zUPAdfIH+cZ
 WZWik0tc/8L3A97WXL8KmmXHWdadOIyMM61CkI3WkAWxA0dkcA8AWngELu4aoQI1zlp0cp/Bch5
 hhxndmmhWiND2KKSWXPPu3WNtVb3JwFe7hv4GAvNdagAYCuTTNT3WotTC11tW/I6afwGsk/oDpT
 Gq5lDStNjOhG45rDp7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070117

On 26-09-07 15:37:46, Nihal Kumar Gupta wrote:
> Add pinctrl definitions for camera master clock pins on Glymur.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
