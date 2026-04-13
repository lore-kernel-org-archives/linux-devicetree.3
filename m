Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A367D3A9DB9
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 09:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776071481; cv=none; b=FUEL16cZi4gjD2ZWE3yzPrUNFM6GGLAGMozEUFpskQyFCqPomtU7UnCV8XecfM0GrxxhsFNGGRYZ7yp2T6uRiFRlJ7qVrexKiiMEI5xKHmoda4AECywnvIv0V9XVjRcGJOfcCWEW77PEp/7PmCHJO9NkHk3exsjTHMOVkjeuud0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776071481; c=relaxed/simple;
	bh=3WOw8s6Ohc5SZUfbw4vOwLhX9LZmHj7TUZSBFd+D2Ys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fgo7qvA88YY6KbRfktexDkMel653swvZ34k00auVl3Vsa2JxAEBKy10kM0g0O08uWaqFwiDAB1fSzr1xI1386GmUnfhk30CvNtWfPYCOjYgX9NOWVj+1yLA+fIpAnz6Xvt3MDlYkvIeraaFAwBdddFrQT4n2LEZcGovaLyzWGWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HjEtIRhY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FPPcigwz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HjEtIRhY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FPPcigwz"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7GhTv458656
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 09:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OaJAwMwHvRhGyIQtZCdpx+5k+5RxYYbk83a3VG87hbY=; b=HjEtIRhYP7rvPQ3H
	8kmsD+S3NpXHEKmiRoGkq2P5J1TOK1j4nJQIGDk9alGZihSnk0TSUh4+RgvkPl/F
	mwyCMMfprwotuxqqfAgbsCMvgXQ71nJ1S4CMwlWwCDafr+TGs05xvHlHdpIP1TxG
	1p73aMShwFz5N6i7TvpnfYZreRiGVLTOLGb9bKaSynLkQXUvWPie2+Vy7gnp+haO
	IiMViMHpLSQRwH7mt9b9RihoZloPpS1+mmzAeuphUkpbaKVuZNOWZaE8wmCHfgDL
	v5Xc7qr9AdE2L2OABadIuVkxyBtoGDs/aeQoIaWePDqLCJ6UFwkqh5jDVuJ8tLX/
	xDEC+g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfew04mb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 09:11:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5073ed1ec6fso11164491cf.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 02:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776071479; x=1776676279; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OaJAwMwHvRhGyIQtZCdpx+5k+5RxYYbk83a3VG87hbY=;
        b=FPPcigwzdoY0unWKYgB9X43IK3v0DsRRuLD2tc7TzB/CdtyLyqOtf+wAC2kwpSYYsG
         voQnqRaTv7OprTWD5hyMKXccXRJxSeTu18Hb8weO0MqxJCNIWnuUhp8iNh50ygonmK/U
         FolCoV+033uDpJ/ez6dDXQ977diaabT+Eek2P3wOmrMJpkb677Z3pVoxHb8qPpfOH0v6
         xRJFsTuFg1i5SMJ3HrmCDF7/MemV4bg+Egl2xqsf/TIKvR4eYk6J2T1sHxiRjmog4/O6
         BivCFXfMu0L4kK44bS6I1mbU9So1gEeOEgUfUoM9QYVU+qM6HYtDJkecJyS8uvvgfFBc
         17VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776071479; x=1776676279;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OaJAwMwHvRhGyIQtZCdpx+5k+5RxYYbk83a3VG87hbY=;
        b=d06s1U8NYl5Hrn+hYgy0e1oiqT2FfGsVqlM1J0NI83ETew1HfxGmujMEPBTZakAuTt
         PYXD3hADqlmdgh8d+jOFoFfxBRv3rxd/Oin4tiGWqYssqvPD+p1jNrvoP8NsRryQF76p
         xyBq/ahLxSJ0zvV8RblMXN4LrAyoxB9OJxqH0E9kJVvYVyghiw4DVObMdN6QzCVrdNSB
         mW6UcrYAGbNXEHCXBnHV2Xxb92lQH2Cx0gp1bm6V44eRL99sVHItI32aaTZuRlXgWN6c
         9eOoxJwSyVY+orT2xZW+Gug12SQ+f4ZmZtY4wBlX3OnvoDioAYTvMqyVRWCiY1vu9r0S
         CFKw==
X-Forwarded-Encrypted: i=1; AFNElJ//S3cxHDZlXSXGM2roDwiLRkH1Cu1CWupR4rm63xHpJQWpBNoDn9v3EDwcA09kUkMox1kjLcqG2fw6@vger.kernel.org
X-Gm-Message-State: AOJu0Ywutq/e90nHBtQ11yB/KY4mI6ECsf56xwxa8eJ1n24epS7uuZHm
	GLi+7w+0IHUlu/VRVyLby6/lfdEy4NwxBU81wp6bY2MnvKUbV4fklaW1F0T/UgLmewM6SugMxct
	xQ3F5i28l3arRueHrxkxFQlICM5h6i1I0dc9kVavz3AiU2tBIzA52jL0w7LvxwPo3mzLuUt9h
X-Gm-Gg: AeBDiesCI1EjWGSXS/gAQ1Op8k9jzq3wfAJbi5uNLNKniM+mEXE6xZli3yidQHRSW3b
	JJafjYXZOVa6OI2X7M+/MuRWzI2/2DpQAfF0y+Yt5RH+vxJCq6BducFWpnrLaoUAtTrr+8i0d5x
	zafOVqLCcT3iwte8UVA+5PCg6ZFIQg4Qm8aiyhOvqty8BGDrAu94Kl1sDrdv5NgssMQNwQkyroR
	j01X2CZcrpQfFJLV+c3s7V9DaN15FppnpVReTns+hveqPY+ZvMVWfkD2kykJXU/C/X92dr1OCR7
	Z8IIAnL2WS1Ei54xlBTOHFilhTtoTp0XwHAkQwdcddUMVbncRXOIoAvcOGnv4yvwUdgFueCt/Um
	QoIoY48vFg6RYhR4lacu+IfiHEOLabCKtwP3BjQh0gmUBmex/MR0DDga5/+oUAY3jfCdxyDztrD
	2N8xU=
X-Received: by 2002:a05:622a:5815:b0:50d:a92e:fead with SMTP id d75a77b69052e-50dd5bf0cf5mr130767601cf.3.1776071478691;
        Mon, 13 Apr 2026 02:11:18 -0700 (PDT)
X-Received: by 2002:a05:622a:5815:b0:50d:a92e:fead with SMTP id d75a77b69052e-50dd5bf0cf5mr130767361cf.3.1776071478250;
        Mon, 13 Apr 2026 02:11:18 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e5c56dfsm302667366b.37.2026.04.13.02.11.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 02:11:17 -0700 (PDT)
Message-ID: <d5f654de-0395-4c63-a1ef-3b99bc98cc98@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 11:11:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm6115-pro1x: Correct touchscreen GPIO
 flags
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Dang Huynh <danct12@riseup.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20260413090527.53000-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260413090527.53000-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4OSBTYWx0ZWRfX3Bvd39Nhnp83
 A7B/84lbrvvMGpPj91ClRvvEVZrX6cEQYn2xtb5XEnDvBuF6KyCBtgKDw2j+FfdJCiB9Fd7YrAg
 wEQDK608cQjl887uMnfwVfx+CUqAa8aqg9dZWooQL056c8FHzErX1RBlMoQ/lrk/ePoKd86F26B
 4jeWQKJ4p1hy4kuflRqMdrKcWKIVaCf9qk5u1RM3EdMv4lo5I9W6uLzOfWsO2TUx/D2dNieu9jp
 NpHntTmVri/sHN5vkTrGgtChFhDeYU1ke3cA99Z/VFNpTKucfPBQ1EIRADnP3mfP4ejnFhflpaR
 H7RQRH/GCwK7EjOUdeWjr3SYpDqKPEOylgADPWYcG/wUWpR2Py6EDl76SYOc8lf2gSIq436dnQL
 IRSD1ZHthTOrel9tMX+xiPgJ3t32qcVVu5IyaJn3dvAq8Wr+pa+xhGhIUO4lis8RViczsB9Rsx8
 doJMgTztwAVu1DIL5Ag==
X-Proofpoint-GUID: 3pI-1g_L6sQO9iOLbN5QJQCXT4bjkFw4
X-Authority-Analysis: v=2.4 cv=AofeGu9P c=1 sm=1 tr=0 ts=69dcb337 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=p5SleGX6KkeDsG2sNWoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 3pI-1g_L6sQO9iOLbN5QJQCXT4bjkFw4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130089

On 4/13/26 11:05 AM, Krzysztof Kozlowski wrote:
> IRQ_TYPE_xxx flags are not correct in the context of GPIO flags.
> These are simple defines so they could be used in DTS but they will not
> have the same meaning: IRQ_TYPE_LEVEL_LOW = 8 = GPIO_TRANSITORY.
> 
> Correct the touchscreen irq-gpios to use proper flags, assuming the
> author of the code wanted similar logical behavior:
> 
>   IRQ_TYPE_LEVEL_LOW => GPIO_ACTIVE_LOW
> 
> Fixes: e46b455e67f8 ("arm64: dts: qcom: sm6115-pro1x: Add Goodix Touchscreen")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
