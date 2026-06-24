Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4443836923B
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 14:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782311028; cv=none; b=pRYMQWsYZe52FM/RpYILj1TysYoPnNihCODgwX33N3+f6/VCov/ofBiR/oyW5AH1CAXFm+o/pJYVMUupQHme+lsdoU8Sk4E6cYHwKuwkMgZBDM6+oOTm/98bZRs69OTRXp761ed08sLb2QbAPw1RkluMQ6X0ewu4UAeP8KZwcss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782311028; c=relaxed/simple;
	bh=QNGenFbPTeXL/Rook3irOlkkvGOXohHaOGEMChBsdQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TRmAv8UkTkTnA5UCOPXERi2S/Pz/V0OIFNhpDhHMKHv4yaNv0tvprMc/wutydVDKFZgYvIuSp5ZHvcHGC1wtpXGz0M5FE3mQnm7pXtKKUgE5w7KHruUlMIA18cLZLR4qAA1kdwIJSkQJ+6K0pMryej6dy0RyRnEKyXDvW6KYVoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kUQy7MEv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kC976qMJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kUQy7MEv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kC976qMJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANmr74180578
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 14:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NcpTjJLsVJBbegyf3923g3GsuTzjADZiqREetvkabCw=; b=kUQy7MEvtVXFcrSN
	Kurx+11u/l2qBqnAstYKRG3amRWswGVomFm4a5gA6cUsbviOIHWjMAzlBDtvTDNe
	gx2dghLCx7TE/Tiys4lDnoqrwpdlumR1M7Rklux+XC2+c6j5WOMw4hGMM4Fd7FV7
	3ImFV/vMU1yPkKM1VjrqlsbZmVYN+eEtrutp0cMoaVnNR7C5XV5ajG8kmVtTvwYO
	OTrZNwy7N+qwltmYqeqYdsBhPGZxJTiywfAyMs/UDXI3PnK2PMeHGVsUEu5qTM41
	miBL8AQv870WvJWT2kSnVVkscPK19pTw+FqpjOI+NLx612gEYHkPGVp8k+om1SYm
	kVs07Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0aqp9n91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 14:23:46 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8453e61d6f0so1083974b3a.0
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 07:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782311026; x=1782915826; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NcpTjJLsVJBbegyf3923g3GsuTzjADZiqREetvkabCw=;
        b=kC976qMJd8laodnsxMqG6b8d5NyxbIU63Xw+MFziSv0Nz5dgRTnUMkLG9zGIswrpbq
         pwy545oxTQF61EGk1ObnL2x8hOM0Kisym5SeGP5UEUGfyi2VvwsAPFA5zmChJBMnscop
         V3x3llX96/DYM5+96R0qEH8x2JWXm92T5YiXFKkmaMG6Wx42FVm1F9IPAhURo82Uwjkd
         vD+e7mRCzAl3RMwf/NS6AOgQcc41xrhkoRnel0zdVt1mfw/AMoT8QlRYi6hMU+3K3LbU
         tkinVjjXtedBdw7ut5OWjTjCuFbHYTeqjqKZvScXD5laKePmCn/EqBB6fdI7+RKsJ3nD
         2lfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782311026; x=1782915826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NcpTjJLsVJBbegyf3923g3GsuTzjADZiqREetvkabCw=;
        b=Vs3KOIsFJQi1/We0Gjm49OsrEKLj0fmr6khAzF+v2JTJqBalFmHihPcOjzD7ig5A+b
         jJ7b/GOdNIiWiG31V4NQX0agUjQaxxxb4+d3PJOpJXiwHXwRq1PSd3VlmLn9mmGfs+eb
         bmup1cnjc9UPaHkCxtbehA+A9Xm0BMhsFWQGdFjyKsBgAfFsthyCaGAKo1y9UK7aM5B1
         aO+cWusaXUpc0QQZFIAG7LuJC73HTgX68ixLGsR5AuCSAJRfhDA0ir1id4bLv1CQrZ1F
         S0ewYzGS0ii67WxDJOwUUO+nDKYonwbJdSIHDqYw7ztHmDsz438Vr3J2QwVpeKhIEwFA
         T+gA==
X-Forwarded-Encrypted: i=1; AFNElJ8ce8cXdQFMFcxXuKIUUMrgUug2V+RsZTkysXmHuOfUjctqMvb2R7tJ4ugTALV72S88CrNNaAQ30JQu@vger.kernel.org
X-Gm-Message-State: AOJu0YzCXQwsITeuc2JnC5ILbFGUekdHOe8D73vLnXoNulUkaNuSzIn/
	SDCtI16gOxiUsdpaEXlrly7Wvir79+pvsHRVtiBx4AzrXp/sBNFBc9DLDdIgMbWm8qWwiddg/mM
	eX7Al7VFB6R+fl5uAOnGFuxlvtRWpYqv1svG8XE853kJW5k8TVbGCo/g+UbJSVJuR
X-Gm-Gg: AfdE7clQt0P/SM8YWAIB9sj9JH+9dz85YHTL+15VYuoChNEyXbS+duNdgvyEbZebLSD
	p4abMW9PtnAyhOxbBmzYZJxyxwC1jCwCH52SONZZP/RM1F9/ebxUw6n14z9Hms767uddj9M87Jw
	Vh9pCjfBZHL3tXTntFDpVjbNNTxRA5kTnGXHbh+aKCSZC/on621SZgAkXZ68eHOdSzHW3PdjtAu
	o3Hj2b5ZvZBhXOPgUb4fh7ukj4CRad21H+znfKiDeO4xzQ3VN2DLio650XA2TRajdu1IXONAlQl
	wUgnpO1YaZcIenDARUtZ3V7fSEn8WHtRSI3x4fBeL+BUWtU0JYpOlTAARAGVpT1HEzgqoA8rpjg
	t7wIIATTEJM856TaGFTenF0ZzI17Gudd0WlD/0xGyBnKg
X-Received: by 2002:a05:6a00:1311:b0:827:4bca:f1a2 with SMTP id d2e1a72fcca58-8456247857bmr21212415b3a.10.1782311025889;
        Wed, 24 Jun 2026 07:23:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:1311:b0:827:4bca:f1a2 with SMTP id d2e1a72fcca58-8456247857bmr21212373b3a.10.1782311025442;
        Wed, 24 Jun 2026 07:23:45 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fcc773sm2548152b3a.11.2026.06.24.07.23.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 07:23:44 -0700 (PDT)
Message-ID: <74d3f07b-3212-41dc-ba59-ecac57dd1b78@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 19:53:38 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 16/16] media: iris: constify inst_fw_cap_sm8250_dec
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
 <20260616-iris-ar50lt-v5-16-583b42770b6a@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-16-583b42770b6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yb4C_9Xvm13lrd4mzpX8Z0BkddYizKKQ
X-Proofpoint-GUID: yb4C_9Xvm13lrd4mzpX8Z0BkddYizKKQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDEyMCBTYWx0ZWRfX0yXnyOULTdX8
 jEDICLcPOQ9FD28tav9ykbuhX0ADSTO+3U9nbE8zfkJvHn0WOY1VkdvMH+khscToYECbzismqZM
 5AAhrmPQvfkxoqaFnCPBJrmqXI3yG5fkbH2wnKrKZ/WAoNRF8Iih8p2pCfUHlJTUN3sW7caT5WU
 f65g9b51ZP+D8n9fLDUOio3R/sewwrJnb3qjBdilEdGppHu38nV+kapSt4eT6Mlgk+d1GVoVQAK
 529KgfyUWj4QJCaf1qRw4/sGGLlILbE4s0chF/lwlzf9VTZXvIGyr6JgWXJq+N7K3oit4D3Eiqm
 zYM35g3wFchiszMPh1hmZ9iVpBRzLg7wIEbAjnM/g5PMaUgeDvG8DpGXsOrWafrgZAq/G/giXiV
 gbiBjpVsbga4chwwGfDHBZg5plM8CTLqrMCT96QTbuNEdJ80WlV9oVhovLt+LXd40W8K29OiAjZ
 oUYoDya7YyZaMItJ3Lg==
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=6a3be872 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=e8S3DcHKpQokSN46YpYA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDEyMCBTYWx0ZWRfX/1hSkFZ+Yp3B
 JQQxN+/J01TgIIfRWHxHYmcK9FocDsDPPT9A9xXpX0WJ0xmf7kI8YAweiVc7tP7Fy3KGj79JdRh
 3Ook9t4HlrfGGu6ZGDtGWd516i/oZe8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240120



On 6/16/2026 5:34 AM, Dmitry Baryshkov wrote:
> Mark inst_fw_cap_sm8250_dec as a const array, the data is read-only.
> 
> Suggested-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen1.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

