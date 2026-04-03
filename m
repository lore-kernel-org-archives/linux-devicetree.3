Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105C93446A6
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 21:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775253277; cv=none; b=NiwkbnQo63WuNnRaKpwnfwXa5X8T/B76qvKN4Zz1AVmQ61Fvg8gMjvF6L1mWE/wGxDggcOX9RTpn/BVJ/SfOG4H8tzDthCV4ApbDo69FN5Qdc/3oLiv9WtQlOC+ulcGLKYI1w+gwTJt5OssT3r182RR7JNaiDJU+b71boacXbfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775253277; c=relaxed/simple;
	bh=4PyYqCMRHxxU5QTdFQ2bY9UFxws/ljt2W4NAhD0wt/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m34Q4nCMWlcnXGIPg8B6DmswjkWQSrMt9Zvi7H7tAkTVz/iNfa/q5rzVNu18DrPTHH/MAelnnPbaXc6I101K7X7pdXBhjy7h/YrwwaIu0xZd9lPvPLINIrA7m8KUVOsRFmmw5Q8SVKgMTu6lVFCf5N04xdFbaeVnuDMaDnvhawU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SbGcCPnA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PA80ytiR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SbGcCPnA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PA80ytiR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633EPjZC140830
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 21:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Y9zedheblneIseqLyTu54++r
	jDJmuqlr324tiZu2S8c=; b=SbGcCPnAGCPNv/biaWHt9nHjaT5RCB4GXbpDrmi3
	EvWmYPFqdRIwO8pLUp3d6blQxLEiTkCn8520ia4PhWa+W7cQXLWjKqQWmFdXAINY
	J/VJeuwvru95PT2hgz2i1znNjyQetlACoMbXNkl9jYLXEV5hDQiHK+pXhAxplK/J
	NXfMKFOzP/leBf2NYPOrzoiKWv+v0d5AFyGOr+kLoMffEn1iVgT3yLgp0sLeBtng
	2fZXJi+eNlKRmOOnxuo6PAsGcreci7PhauKJcUMgy89+GDlMIWrGFT0BUUnE+kZU
	WNip0hAzGLj9+8rZibY22ENbLSA4nCyP8qyGFtZwK8JJ1Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da83y2fk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 21:54:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5093a985e21so62530021cf.3
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 14:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775253274; x=1775858074; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9zedheblneIseqLyTu54++rjDJmuqlr324tiZu2S8c=;
        b=PA80ytiR2JAM4Gs408LRoN/NVYo4lX0iVGdWchgt2w+OafD/UwF2VgtjEeyrLJ9/fn
         s/ghR2i/sA6LFf6rRBSEU/ia6xt9pe7TMi3tDFo7R8R8nZgi8pqgHDSAMWVribqhZdKw
         ZfmHCg4uFGOMdRFr02kakeGjgks792hiEvIeqLrBgVB9oyONnIMqJqW9W7mMdShd8XEP
         j4KZIAMlP61xKHSQ3h1vz3us6aNKUS1A98vK30ALqtVImgJaPzGo52tuG2zwPtJH0ZSP
         kNfaPtu+MLpftDZUkpUpH4CTCoKdnxx63YQ5v8j+0kUs7nyivuIqVn2opiC1BZPBUZ8I
         Ovhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775253274; x=1775858074;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y9zedheblneIseqLyTu54++rjDJmuqlr324tiZu2S8c=;
        b=lXRIFLaYvUs+6mY6/6Ktzr/iKDnjQ8Dbdn1Y2596jRybCnhjZVmLoIxFNZbYDe90J4
         +pq6d6fhzApNXNw44ZZujIVBJ+3pRdppZYYOhdeSqiPYP3wA/HO35pPR/hKZQbSz1ml0
         qpvgVGVvMie3hKU2vr4ESIXtWPsz45VowvDgzIo+e7aJ1mPkEwwmQmIQBu5UGkCcGCIM
         h/MdsssoB7x2+HoZXAZLbA32ZOYxvp7ArmvAZTLViU/VfD6/G7rPwV2Qoia081vSTtLE
         uw0jnJ7ns56tM+9h0OREZl3+bFmGSYGLfoxcgSMHjaVRLQFznxWcWXTt0rDq6q/c0DlI
         YCjw==
X-Forwarded-Encrypted: i=1; AJvYcCXIJy2zbuU3aUJBWSj7/XkGVUZpo4QBC7HKTCMVeS62SgXB5Z5ETnM30A77nmrUiOT11Kizk5U9Jzka@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8rHDZ5qWIS6ul7WgV/a0UWFTgpmlDJTkF2fa+3qamSKlL4RZ7
	Kq2ReZuoTHW7rI2Je0Awqy7gyf5tqx2h8W/1tI9bTqiHH8JloOShDDqegJd4cLFox8gefYdQjkL
	g9a5ulUIk16qQK82DGdKhutHFMpmLGelF5quL2a/is0VWea685TvzcvcSOH1KZZRB95dIo/QJ
X-Gm-Gg: ATEYQzzT2Nn8d6xch/i4DO0R9+TXpuaYLgmsu/thvoSl7hN5foVCALPdH4VefsLNKZA
	9QGetCGpGzZKP+otxp61NcAJ8OD+wy4WZj74U36yjw7OB5HAgSWW0q3uOR911pXja+LQFquCJcv
	XvUmdkOaOdW63x0EumCvsB/ZC3qBvuVgomH2pgURCadxb/hYPRACXi8E5r29lGtzNg7crGHYHyT
	zAKIyQzBq8DVv9cPRcW1eS7EjSaVnl/RwmexmG1wEZYs+UtCANqqDHvnlD6qs4/pSwgHG4Q7M88
	thoct0rGF35TiIVHkVG7JB6+1PjkL4+qiuNzl9d2/z9tW4TwtOAmscXixcb02C1LtYLjyYKde6V
	smafQhy4yB/aTsz9dNaCi0I/rer5/FUy5Em2gUob23JaGSBU7E0QLbOYIRb8YiIewDQIQFHnPlp
	p1x21EJ76Uzz1Gw6YHrOe35v928FYz2893H30=
X-Received: by 2002:a05:622a:790d:b0:509:20de:4ad1 with SMTP id d75a77b69052e-50d62614c30mr58337971cf.10.1775253274029;
        Fri, 03 Apr 2026 14:54:34 -0700 (PDT)
X-Received: by 2002:a05:622a:790d:b0:509:20de:4ad1 with SMTP id d75a77b69052e-50d62614c30mr58337691cf.10.1775253273514;
        Fri, 03 Apr 2026 14:54:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ca32ccsm1714618e87.37.2026.04.03.14.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 14:54:31 -0700 (PDT)
Date: Sat, 4 Apr 2026 00:54:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-iio@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] iio: adc: qcom-pm8xxx-xoadc: remove redundant
 error logging in pm8xxx_read_raw
Message-ID: <35urrjc3koye5zhlxatdsr7t2djuml5ueyhhazcucow3q3g5f2@pomnrrcwu7qr>
References: <20260403-pm8xxx-xoadc-label-v2-0-29b50bf821e6@smankusors.com>
 <20260403-pm8xxx-xoadc-label-v2-2-29b50bf821e6@smankusors.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-pm8xxx-xoadc-label-v2-2-29b50bf821e6@smankusors.com>
X-Authority-Analysis: v=2.4 cv=ar6/yCZV c=1 sm=1 tr=0 ts=69d0371b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=wxLWbCv9AAAA:8 a=5IoCURV5UOmB3lB6u-QA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-ORIG-GUID: SDl-Q-UAKVmyuNpxepdM7SRDdvAslvxC
X-Proofpoint-GUID: SDl-Q-UAKVmyuNpxepdM7SRDdvAslvxC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE5NiBTYWx0ZWRfX4HNMFfOF4+Yz
 +c8IvcG2Q3GHiRYv1aTuP+yo9OLbkjvBj3FE+2JXtl4rt8F4ZiSigkoFnEF60ISWdZ03Oa8ZtS2
 VUJO4JDfiZZoH/4skemVf6AWm6YUwlTfnMUbzJUqsD8kehNI1KEOZfr6+9ZOgfp9hixkIgj37x2
 AHaBHJDQqjGQw5/I8igpX1hm04fwy9v/2vnZnmZZpXMBPSgTkNkyil6GqTWTdW/3XZyT3kW9vwY
 nhTk1sLty++4TY4eB/LgC47mObfzeSOnCzl9MVdiZ5+pL5IsEbxXm6QadwZI/98dB3bhkugj8do
 sQDqxOgx3IaWkNXHV1IqIUMZ5lr0ivBJpLQA/Puy6MBrBovjXOmkZ0/s/x/7CGNwkgA6LuJ9FBt
 fBQQpQ5ZHUyO5JnCK+SaqAe7xgc6+o6Xbiuw0n1ysAsTgTf/1R5t85HPXyw3lMghEYnKbSs3cBN
 ZfEbINlUpDWeAHK0hzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030196

On Fri, Apr 03, 2026 at 09:23:18AM +0000, Antony Kurniawan Soemardi wrote:
> Remove dev_err() for missing channels and rely on -EINVAL to report
> failures, reducing unnecessary log noise.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Does it also prevent users from spamming the dmesg?

> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  drivers/iio/adc/qcom-pm8xxx-xoadc.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 

-- 
With best wishes
Dmitry
