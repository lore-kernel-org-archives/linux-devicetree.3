Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34143EEAE2
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371549; cv=none; b=UwMlIjIUHzgQ/YKhuNkwcQg+pgi+xd/CNxoKH2igIb9se4v+4xHPmG3xgIFTCmT0vu8VBH91HyvFG6ldUtmnRtoYD2Gw+sPfVS9xqZrdEyeVyMOiXlLJ7aUs3/NLjU9BMUFYzTUqq/o2RMsWp7H0gc2SwvqOQCgasV5csiCbDpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371549; c=relaxed/simple;
	bh=lPSKOLF4HEIse9WLPJPgQBawOJu8EfJdJjYwQwdsMOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GCYElPvvHZUb/jJ+UtYD4Qe1dpHhVsF5TDD4xZXBk7PTpP9m2HBrLy5yiqO/hUp9+5KK9/kf6UUkY6PBoNBTjO1B1yMhmT06SauPrNCa7gXmNe8pqjYfpdxS8OhGDq+aPMd+O3CjvatsCiO4FceKT7cST2DSu/zNDEiTd+9ok8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nHFKCBM5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HrTKHtEn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nHFKCBM5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HrTKHtEn"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jVDG237697
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dMOipzmvJTy8aZrG+SejtUux
	PskCA0+RbWPXbMYi0MQ=; b=nHFKCBM5bztJvOS1cIRinlPY4oqCTDHAwkrDPwK0
	bSCamQ7H7j4ESPxESDwuS8JAf0qGi8HSKdkDQP/n7lUmAz1hsxRyCbYMW4OKwFgJ
	/HcFqed+SLEJfhalQtuu7Ms4oKQ/PDvH7Xw6rt3Y3C/s1p8qOiOSg7YbO5/aZHSY
	5c2kmNhBeukNSZbmPgrCI2iCaQqVpyEP3Zd2qOSzN4K28rNQ668zyEVP2BJiKW2Y
	NRklVcl5W064oDm7//c33TEPSfbf9k6B/LkpmJlCSc0oBlE9JVYrvJfPX8+bHo2w
	5L/lluQzg2gSXy7TJ5S3vjXFaXd+436jQnyQVRSufpqGHw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dnkbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:39:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f1847fb9so325153585a.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371546; x=1789976346; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dMOipzmvJTy8aZrG+SejtUuxPskCA0+RbWPXbMYi0MQ=;
        b=HrTKHtEnUWunppApeSSloO+utSIQOELwpGaL/XLMtyieFRdgU712TOkiWSyv7+xy3P
         6tO59OXJLFtyQUY6NbQ6F76SOYp19lm6p0jH3XMykUk3XNu1cr8HJWtV/n1pgMFNNT7h
         dfpV1J1+mI7AD291XajjIPvuKK6C432u3AEL1xRBQm0iVLK5hVtflUTTNzyG499tA1ZO
         XY2tW55rg26D2FLuzL55tL4Xt5dkfMP2hDBkW+4bpigi1z5yQqSk9Q9nZJSJKzSVVOFU
         pupLpCZklyDLsIhW/a8uUy6Xn6brStwSN1zFFfmOeLRKWWA/DfvwgS1qRuCDQYQ3GdVW
         emOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371546; x=1789976346;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dMOipzmvJTy8aZrG+SejtUuxPskCA0+RbWPXbMYi0MQ=;
        b=FzWOVcSY5W8/E0HKghQhWx2B7exsO4wr9k+HW0uEzGgpPJ0XNiSj1idlfGxl+uyL6R
         4tZWw17oZd0JOXtOSluSlhRbGUoWrC7OhcJMVA7G3dfSWKEINal1kTBB/yjEKCnUZx1B
         N0SmthVs0ZW4zaAllZrtFeXyMTbY7CNVLm19HmtbtM612GoPCEk/ExFop2Y9jPJzalrP
         bvd9jDXz5CJx2u8AJRwhhx2EtzauCKkozClX0/HRmn8TiXFkSIZJjD+xVWD7VH6tyBnd
         4lJqBaf0sxD5QsJ+DF3s/neAfES06ccMYvoakyiMyMh80nvte5zXGYTlguvn3v00d7AJ
         NU3w==
X-Forwarded-Encrypted: i=1; AKwUvByauuPTpvlZ2Cola7nND19fDwJZp0/TXuWnmxGqFnmJRP4T1vH7BbLj3jLCRKbMjF9lu805RusIysEA@vger.kernel.org
X-Gm-Message-State: AFuF++lJ9CykUBGI8OaEuzLJV7s+knTnUu/zkwt0rkmt9vV4++nVeaEf
	A5DyHwdkBfjfjSvvFvTSEuVn7c8EqA3dzkAe3mcYDvynfBE62Q5RmbmV8cRL1YBzkljio0KWxC/
	6IivlXgQvhF+bOzfDyNvRvXLP7b5eHBdvy+Lp6+w4Ge3oMOaGYpxK5iIdyuvNNQ8VAWLKZKxB
X-Gm-Gg: AYBFou0hgGslz75yXH//fDRYDizESyeEYV5KseaADX8NbvN5z5BVQIsDH+ltjXSXWq5
	Pq79bVi3fKjOxB36lsO6eRee2vs0ycTGJakY087U+K4yyNI102oHgM3saLToQq1UYHyUXpSsN+Z
	sT4MpoCc1RIDzshpHPCgMIMYATr/+sNKbS6NxrLaMWu4v9hBeiAt32Tq6f6bJH7eHVzsMo539py
	ou4th4vUA5CvGlHNXQA1OpbPDi3k1DUkr0lNurAZjTCziwc+28jGgW7rgPfOa+V8q+tQEN5aYhk
	VU227JOUjwzmrWkPDK1ZJZcknlP8pKf51B3HYM+Frb3aDIyZEIyen+MCMoKtOMNac0JEkP/23Jn
	gkxhEIpsFP4L/ZP8=
X-Received: by 2002:a05:620a:4556:b0:912:1206:ddd1 with SMTP id af79cd13be357-93a2970976bmr207450085a.1.1789371546189;
        Mon, 14 Sep 2026 00:39:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4556:b0:912:1206:ddd1 with SMTP id af79cd13be357-93a2970976bmr207445985a.1.1789371545682;
        Mon, 14 Sep 2026 00:39:05 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e71adc2ecsm168282475e9.4.2026.09.14.00.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:39:04 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:39:02 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 13/31] arm64: dts: qcom: talos: Add domain idle state
 names
Message-ID: <eqvy6im4sah2nlull5w6qab4llvdhtjpduhz3ujdqrswkj57ui@s2odjdj25q5v>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-13-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-13-660c31187819@oss.qualcomm.com>
X-Proofpoint-GUID: SAAGXokh5tiqa8NRfMQi-qooX4q5MXpB
X-Proofpoint-ORIG-GUID: SAAGXokh5tiqa8NRfMQi-qooX4q5MXpB
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa7a49a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX76Chi8k3kOrV
 0PZclST+4LzT0OuUJqgone9Y/tVgBhVlFAiq6tLTqFgp/GyvJaSDjeVgGvC9zafbhMPY1z56J98
 Rd7ngatDnJA0Y9hSGKaTxZWqzocQgeU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX32qkG96bakhG
 3vmCFgfFO9gUYcycS31D+HuPp4geKm5piMWoX1/g2kJqMyH4z2FG8nxWUuVRNSqaBiqXLbvGIZ9
 an9z4FY3YJkeF2e7adX4ReUiKdKF9E/jeYH7b3IYm1BxeGmYRyqhCWOn+UacEVMUvizndELfcP6
 zdr2TKdXLRkf1oSp43L/PdP+lPobcdGLqXTTKpB0hmHnCFvkYH7TWx+arrQIp75mSdO7mYFZVfg
 3wbqKa/ICZPzoE+o4UkoIDqsmNhFwhqydI+CYgd6k4K70zUwMUZcrlv6YkgZFvnLzUoLlfaTPdz
 8MSiQH62Wz52TGEwhHCzqkBUloAFzbhDLkvcYUbSRwRxtKJc7RUKL4YSjoxsaN7FO8thTcT1Q7+
 YAVcQeEoGREdtROYH2c6REy27At38wz+/fWib/2jP1MjqADoUrhY1VtBjaXeBGlxVqYna4qe31F
 svgJGvZjLfFOdlpsorQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140108

On 26-09-14 12:29:45, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
