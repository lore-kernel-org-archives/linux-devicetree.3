Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41B829CE9
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 00:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787184590; cv=none; b=d5o/qFx+/y7dOfSiNds2jTLyrMJV/ClXoJIYhZT3M/cauOiegClQTQOlTuhn5rzpVkEvmtkw1MvxicCoQtdlAJ6yzKik5KCjUtDbDjhjUJfFLy9GNKt0CpTUVwek6sv5CsvU6maK8Pjr2V7RhO6AwVcn9WDa7aG4JMH0QrkAsUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787184590; c=relaxed/simple;
	bh=BbYV1T5PPR18+l+L6Swxv5tPta1L4nKglgRi0ktaiug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SZ4nBge3ftEzHNQVVZBfQlcZNpi36CI9s5J+pZnAmTsNwNOlErQ8Hc/6R6q+CsW8miA7/Yt2oi1N7aoNrEeyFOsF+AeDakLxCC5DfKGLoEWn5JhgCl4Q+wBqngt4PDpIkm0XW+y1xUsNndUOXRmavipxcOt2EEzyXUPNoWui9ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H4oIyoFA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MUvU3+hQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H4oIyoFA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MUvU3+hQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JL8Csv1988439
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 00:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ejd44ukcxUiyZAXHWEB4YLVE
	Zl69Ea/qBWPRf0vVCR0=; b=H4oIyoFALahghnD5E1fEcviw1MhC/RHsSwGfjqOz
	Ms1GGAXW1E0HTMNT0tS+WQAUZKZWGFXRLwHZ+ylwLA2h42yEErP9vSVvHX59JPc2
	3X2URwOnEFgI97QdwJPxO5X09SSkt/aJ4LvrMKyhqFWzJ022Y4F7TeUYwfBZ3B9E
	w/axFGtPvLBEAW7SkJFndcWIpy31bOaSzlJiqQppDAFp8d1X6VoTw50J4OEQQT/q
	5okALsT42zkI+N9EljmN9SVoTsU+raYuVBMpTkD14oDS0Ie0eJdYHQLB+YaC4aY2
	DEU9y6yjNX5XtRx8gGioLAJjrsyQU3+sP/F94F/226z5nA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5esj270c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 00:09:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so170643985a.3
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 17:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787184586; x=1787789386; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ejd44ukcxUiyZAXHWEB4YLVEZl69Ea/qBWPRf0vVCR0=;
        b=MUvU3+hQar4i7Qfjm4MNUMo5xKRk/gerwSQL0NddhYyojjoE0tzgQEIY3ucbme280Q
         QNjkVfQxrjVtWLalM3xjYiVC0xasp5aMXVRGFGqSnUkVI4ZT6bg9WM2TYnZd6MlMnH4Q
         RPvnkQdqtafMSWuBKNFTnuB3qSAvi+OH3jjHsZ5o9uSZVuwMHiXfp+xUdCe6bp1S9MTN
         WsgKQVQHypj4y1boq8E3TJhpVURRaddrPAFq1Jnvaujd4vD2IRPIt5EbEgxfeS8ZIK3A
         FTTHHBPVB5GmjSFsMd5Kv13hHUsot/OVDgl0V+l7tjemZr/B51hYZMUjBnCJ/ycuK6NT
         PIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787184586; x=1787789386;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ejd44ukcxUiyZAXHWEB4YLVEZl69Ea/qBWPRf0vVCR0=;
        b=h4esdsyWjD4DF0cT6IPtq0axKLLIDaY24jfm1GsShdj5i6VQfI45yAcwD0mfyFpku0
         tWS8wLhdfLmPGu5mCnCQHSoGiCeoeiZi/dyL3nJeOtN1DeWlu1Fsbv+vpdAj310pVwc0
         xlTTUtYcP+5D4dYDIx/GB0y/TbY9+NAD6ao+bE4KwQN8ISlJiCMs0921YCd7yfjjzQR1
         oCR7Rw2jpkzkII5ZR27U6O6uUhFdARLIYnw3kWz0Ib93qUV6rjiAKGdSlS73u8ZFJ7Hz
         6pnXvl+XcPnbOtzdVF5p6qj8B8ksP8I+2BxollysIzLv3qTMOantthboXx+Nkaptpk0X
         1PCA==
X-Forwarded-Encrypted: i=1; AHgh+RrJ+slktrBkg3dn2vYTC6MIG0fbZ4N5ujk7LyKkdbD4lOZkIevb/FUfQzAFEvOe7GX2n1m+S2JSeEoy@vger.kernel.org
X-Gm-Message-State: AOJu0Yx74ze6YfcX6/3ePnuNVXjPoFXENqrxDsaJoz9NHsEo4uEOCTEt
	owKvMFeQzrPp4u7n6W+Isu/duNDYv45KLXmlS9eY3u8VKviGL04t74RxyRX8rTVZV3ohw7lEmsK
	jtSXwveNndUTH6S3qXcG7TVYHRTlMxpKa4xNKLhbqZJ0XfUNpTzeBqskh+QQfAIjuv2KQU0VJ5X
	ZamQ==
X-Gm-Gg: AR+sD12PCiIlT7XlPrTFROvFM3y8/Guv08410Tn5HF3cEl+83SZvGFxcoD2psydkHtj
	SFFOnrR9JXPpUX0bYCdqz6BAdgYOb47cOhCMvlpTfd+ZraknmLXoSR9VUZ6dwMp04ZxigxBqDhG
	y1u3LIFaQpr88ujAQsiqYEnHu5sUvFleRfI2bijnHWKsH546EU5ny7uZqnM32fkivECmqJBkaTz
	11ng/T9O33kCjm6vJtMprvyp36P/CKetZmc12nN4DhZRxvXRh5HTnexnTCuioIUV3hPKNwmKsGu
	2P9+jpYoDGygNOMb+5LchnnDIachW2ZGKrNHr6AHntK8Qvxf39qAas3CSUVFhPRysUYHgS6XSyY
	4U5+hQ1aH90pQPYsTrFZrwNHZOmL7AH/uDp6BriJdT+bWVBJGMU7yR49PRJSLXo61ofEzmfR6j+
	MRxlCH40+lPccs
X-Received: by 2002:a05:620a:6408:b0:915:d443:e6e1 with SMTP id af79cd13be357-9371e301758mr848735885a.26.1787184585975;
        Wed, 19 Aug 2026 17:09:45 -0700 (PDT)
X-Received: by 2002:a05:620a:6408:b0:915:d443:e6e1 with SMTP id af79cd13be357-9371e301758mr848731885a.26.1787184585313;
        Wed, 19 Aug 2026 17:09:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a189ccd4d7sm9351001fa.1.2026.08.19.17.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 17:09:42 -0700 (PDT)
Date: Thu, 20 Aug 2026 03:09:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 01/16] clk: qcom: gcc-sm8250: Tie the CX power domain to
 controller
Message-ID: <cztm7jg7lhrccixixjd6dpogy4ky44e7kursf4akwux22vtyl5@xq6txg5qq4u3>
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
 <20260819-qcom-tie-cx-to-gcc-v1-1-840034124e73@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-1-840034124e73@oss.qualcomm.com>
X-Proofpoint-GUID: -5aEEOK7r9Tvx_UG5Q6OZaW8aNsbOq2w
X-Authority-Analysis: v=2.4 cv=EaL4hvmC c=1 sm=1 tr=0 ts=6a8645cb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=9JxFHelw-nvN-s8SXg4A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDE4NCBTYWx0ZWRfX0Mce/CBdAc6e
 a8epx6BHzPKPrC9NLmWtjFhwtxKZsf06c/En98ynE1P3zHgGEBIS5S4o2CXgoPRTIKFKu64sMWF
 e8dKMu6n8FTGT1OqAsOIoklK88O1p18jAw0296mgSlcnrzS9H1un7U39jXakON+Uvvxmvtf3jti
 pEiEEDrUkWXOR7PHKYZVRRqiNZk3J6CTR3j9G7TJAB8EUbnpE2oLJsln4zI8E9OcFRpBvZUo6Fy
 hcNyTr7XUavvD8MBvsn0pSHCqNeNRSh7ZtHiNhTiwht6VkxL6YcZ+NyrlV4QtT/ijN5Xiqj/FQt
 kZ1bCSbYUWi0QECvs0zEH9BEc8Rwo5q5STmAPBqLUNCxnNazormKX8y1r3MpQJPHVkJNU/RAIaI
 DcePNqNvjjAt2aUF1Dr/l+lm2FgAGmj2Ibwn5TedVdyLMAeb1kBxIeG7KbfnZkszihUmsb073UJ
 bau7u7LAUtwan5nkaBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDE4NCBTYWx0ZWRfXy0hVlrvZr3jy
 l5OgwymBbzq4CzKtvA0BTWdWX5n83rKPmkOnW+czBNLIPZh5IGrTQ2hnEzi5CVU5j+L7RRH3rnP
 oPBc0WnHdExKpOfBdPRsWifD2dJKSng=
X-Proofpoint-ORIG-GUID: -5aEEOK7r9Tvx_UG5Q6OZaW8aNsbOq2w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190184

On Wed, Aug 19, 2026 at 03:51:46PM +0300, Abel Vesa wrote:
> Enable runtime PM for the controller so the common GCC probe path resumes
> the attached domain while registering clocks, resets and GDSCs.
> 
> This lets GDSC consumers propagate their votes through the GCC provider to
> the CX parent domain.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-sm8250.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
