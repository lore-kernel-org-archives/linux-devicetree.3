Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D18A3644A6
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787153164; cv=none; b=WlIhwrZJcrmZ16ALbLbfDn7uIvJOiV5ifPa5+yhlKMz4EpkMplKcQgyFI9bhept3J5geSADjjSXG5ErJndSpyAP/q6B9aArhADZ8L5WB5BTLe9O+IBRmooD0ODeT7oeLYIXb7VYkuBM8WDcEONpZH1i4cFNFBLmWoH3xXJkSFxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787153164; c=relaxed/simple;
	bh=subwLL1PfykQlM6iOV+W88yItVDhQBVTOIwwIwhjdIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AqOoXYz/pcgjckBcSdS2pUqyMpFKDHVdlrF6qRFH/IpHzTxvuirg8+mbQx7BEK+Q5z+TsXUrPohq68GaglS+2sucbEIUbCWozimtiWkq9/2mhmjkoTkyG9traFAgPNXWteVOrWoDHIFe/ne7MuvvjsyxzntogYfGmgHn18OaH50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bciK6+6J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W4SXFQzI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bciK6+6J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W4SXFQzI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF22xq445146
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PdkEVait3/YZj6W8c3BIEGvLpmGIEpRHNdctIWV0OA0=; b=bciK6+6J6oBbxY0u
	4xg4RA9fArfL7XHoKFSi3IcQntKVYGwbXt+V3+RRTJi5HfOgyCeFUw/BlyuLMEwJ
	OzmcQcvYkbIBHWsTDDdyyGx9bGbMzXHmhCMHUM8uGYcIWwuHcdzZCjvAgyuIqgmE
	Kd4rnHsxWpS1o0wXdkjcJ/V2k58G5irPlA12ri2mkRaToKicivOrAlXoe6/7gZKA
	X/R9zMjnb/uz58h4tt0YTEEXNNFBqTNJFCcZ5VaGTWabo9+yXXJbOuMwd21iol+l
	eKyFX5meeX5F7/8p+fEtQEsWtMFCSOQiN+U61Uf5FOeKLKCShTCmHQkk7mg/nke0
	C7g5kQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es603t9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:26:02 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73a1cf1638fso24010137.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787153161; x=1787757961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PdkEVait3/YZj6W8c3BIEGvLpmGIEpRHNdctIWV0OA0=;
        b=W4SXFQzIIs5/g92S2DFzc1f8MRtfSz596TLGJDZjAQQFB9qU4aJoRrpSIQJrFy4nuS
         IDKVlcXTDdETv3Z2RdVKfm7Sw5s3ee6zpIZu9xlty9S/uUp92VA3kBm642sxV/wB0P/q
         4A/zlIx+aL7vn2jJB3bn9kxNKpXmko5NbByP0hBz6ILh9m5sz6M60N6p/NnDGexojQ2c
         04dcAfD3xfYOQLNy4D9NPirX9BnTCTeTRT24NZuF4dQfA5WFGSO7WcEzr78xiPcPB/GV
         VhsiE362raA5ongrt8L5mhyAmkutW2KA+AW1D6KoVBze8hLy/CTRFE6t8O7BAxx4tFGT
         OdjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787153161; x=1787757961;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PdkEVait3/YZj6W8c3BIEGvLpmGIEpRHNdctIWV0OA0=;
        b=Xn9vfMUloJhPE9Zz7a6jI1pF4M0mve9uNAJZ/7T4fAv2bnM/minXwFLqp1genQp98B
         eb+mKW+1ngf7FQiI2QuNenaUMr4Oj4nzvv76ulQTm1C65tb5QdRTK0nlYA7x0idzm2+x
         +Y8M8AUiwABg3AoQ05YfWsQweohHu7YCCqZcWugi9LRE7igBLqkdDE08oHXTYvl6gFqK
         YWXicCcT2XkUmQ0mC1bF+i9MckOfoEUNb+q0+SVP0dDV448o6b23lMAkUDNKajYrnr30
         A9mOXxa50Kg3eChP66sKvVvd4z6xFpQqbKfzFtRpVG9SRDdx8nlgpXryWbN8SAE2FxSQ
         5mEA==
X-Forwarded-Encrypted: i=1; AHgh+Rp5FLQwBMB5THo7XsJrJV+GEE3o1/Nke1dyYNQlqK2wn2OPPZ3O8cECt/W7saAVHnkKwfV4q7RxbERS@vger.kernel.org
X-Gm-Message-State: AOJu0YzibV+T18OJK8H7VtvGvX0waJX2RCrNO0nNcn0mLrknKNY6hj/o
	hKHtks+L6FM3ay5+5E0MpHKNXiBZmqAFxvoNx34icw70zxqe3jhQMlEJMtS2ZQv3Qe7Ew6eYDH7
	oWGWV741+fvA+JvVNssU3udbIMZ6EJNROO0FV0zb2LrZ7DLPpg9MUY/SE2KyjKbtR
X-Gm-Gg: AR+sD11XWWQeYEJd/FNKxsY0Mo4v9qZlQTeESSOWZ4JyyonFEY1E8ppmSy5iX3sig9v
	fuM2GhAF1qgY6x+1R5TaeKZ7wtRgV1imIY7ngX1ysgNkYfyvrB3aSMYnpzEAB57Vspr3vN1btnj
	dkJdnCvyvWnPjWWBnJ3aiu/dGKQcK/Q5BP/4fCSjGDv4W/C7X+JQ6P1kCLnnIsZoWaUwAkSmB4f
	6U5vol3FMFMVVBSunf1qhLl7VTmTpCj5waYF6L3+tKO9jAi89VRbykBw+NkcZPr5maM1Pql9Vgq
	7IlfSxmQdKAws/boM59t13RfFuYyAHffZPxgCIbNtthWfcwZyW8poc8o+YpcDzVkdvSW7ZWksYL
	4IWM9X+m/k8cKrBq+LDEbVU2j
X-Received: by 2002:a05:6102:8516:10b0:778:5579:c65e with SMTP id ada2fe7eead31-7785579c726mr341019137.2.1787153161403;
        Wed, 19 Aug 2026 08:26:01 -0700 (PDT)
X-Received: by 2002:a05:6102:8516:10b0:778:5579:c65e with SMTP id ada2fe7eead31-7785579c726mr341004137.2.1787153160999;
        Wed, 19 Aug 2026 08:26:00 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c694c08sm98478666b.34.2026.08.19.08.25.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 08:26:00 -0700 (PDT)
Message-ID: <cb3424fd-15f6-4ab7-9ff5-d82e42a13bf3@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 17:25:57 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/16] clk: qcom: gcc-sm8250: Tie the CX power domain to
 controller
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
 <20260819-qcom-tie-cx-to-gcc-v1-1-840034124e73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-1-840034124e73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E5/9Y6dl c=1 sm=1 tr=0 ts=6a85cb0a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=9JxFHelw-nvN-s8SXg4A:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: dusmUc-D9TajJLhyNxc2gD_Sg6BzD09L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEyMCBTYWx0ZWRfX8zvO2qLjNnC5
 n8K/qf/Ry8vmfYZvwS3eZoEvMxHAESpUoiWeySG76qNiHUZSFwPYLdysFk2qg/1KxPON5m1ognk
 RQ5Heo6y8DR6TkA7dmAELBL/hXWt5H3LID2IhjIwpLL/ve8q9g2QHk38VfmDgDgCf8Nbea5MspN
 UBQSoDGn/L8c6zFttei5aMiO0FaezmXSFkCm+BYek+Y9mRkdJ8bFfCd4MVGkZOmLwGgYKZGXcLd
 qzFX0aSUbfYcgJTWvNhcpHOpihUbpKWJU4XwD/1rBzzu0J5IspGBFxExr3vSbTYuTDxso9zuQ8w
 JXFwCRed9u4HeArK+sXWDJeUHX3p4UMhwS3SsxNGxEb9Zrh5D5h77RPr/CEbiWkrTebxayr+UPI
 RzmmpBziVMWiviGaZb0DyuBadCmLYJjFaRYtkGdHy79krtk8RwSFSxUFAXv1BF+/ZA4bkYg3v/l
 JYeGG8b2XkGs7dYlYaQ==
X-Proofpoint-ORIG-GUID: dusmUc-D9TajJLhyNxc2gD_Sg6BzD09L
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEyMCBTYWx0ZWRfX5qOhoNHCTIa3
 wI9WRdajkE5Hk5WJ8+Hpixts10G0ifpduZOp0wb9aFqLhJXX99I+6+5uEOBS05lfSTm2n/X4DXA
 nAb7JNOdpDLzmubrzfcfSV1u4h1YfTg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190120

On 8/19/26 2:51 PM, Abel Vesa wrote:
> Enable runtime PM for the controller so the common GCC probe path resumes
> the attached domain while registering clocks, resets and GDSCs.
> 
> This lets GDSC consumers propagate their votes through the GCC provider to
> the CX parent domain.

Not really, this is rather taken care of by the special-cased
single-power-domain automatic attachment somewhere in the pm core

This on the other hand, will allow the power vote to be lifted if
all GCC consumers let go of their clk/gdsc votes

Konrad
