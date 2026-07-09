Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155093ED10D
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 08:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783586019; cv=none; b=fCuD9CYEIDxVU8lrMeNGtsi70GS0mQ11luYe1qevkHG9WDKqO0WH2NZTBXTGsOZPQW7ZzFmNDdrB2kyzrfmjw2BlOoacwlZQ4duzV091ysjA5F8mVfsItwBIN6bx2MbC8I3f1IvO4S0G28uKGUETxuZ4S+EYnJiiAplTPEA2oB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783586019; c=relaxed/simple;
	bh=ePU5jrsIVrDcHmoQ1k9d4UmtDw4N0bDMh1X5hcTiDV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=poui2JFAt1wA6/jOutoJ+HFnpD3yPyn5yrrPRUZZGmyWbZQLblprE/PWYbISVxPHULIVwt3ElGzTBSasxDsDQoWfSDrR1uDhsiZISr910G9wSDjC9Yq7XLCjNaBTKkhstAMxXV9UkMM02YcDKbIvkAZYqRxn032FwjvBIHTRZBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y/kfQZxf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=igsaq55I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y/kfQZxf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="igsaq55I"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6695xuKO929261
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 08:33:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BNS6l6IyyVH86AVRFbznu6IwUQfciQynPWNDIYQzfBM=; b=Y/kfQZxf1K5VQSQR
	xPFjswwffLPEVXgqA8Rfx84vvWV39twPKcZEoodieQP1qhNvXPLuNY+Jot4IrBsC
	3xFZozwqzQ/H35+W3KPQ7FIt91xANzaWIeHXDT2qoCxOnyAzGyMlD8bHaVRv/5/D
	QwTXrSxHq/7DaSRIXwqRyrYti4CJgS/eUeJAaRyIZRILrLnsfpM7bemEQCYzXTHy
	DUOJet1uNUd4ty6k08UVhsOcjIlBsWIDRRaaLp1esTNVXdKkxlXke2j3I/r1M82U
	kBDyivYI5DLR48wbgCAXAJHQPq78kj9nnDKmc41lWBVqgJYZr2/dhU/Fzxkau6v7
	AuJWVA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa418h1xy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 08:33:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e69a569ffso30034685a.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 01:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783586016; x=1784190816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BNS6l6IyyVH86AVRFbznu6IwUQfciQynPWNDIYQzfBM=;
        b=igsaq55IgQa4j17z//6CfAKL24u+IE8Hz8UAGJlNr4kRVuIbSFAoBjmpeLLYUJ8GnQ
         EFDfhsi72WaTd74HuyK2dcCKwPaZDhiAmgtR8hzKSsOHeqy0e9RBa3eddE5Axj95FhWV
         GlF9XqvDt9ZdEZm0RHwe679O3uKiKUs6lMjzwY+c7Q/8kzhMZHBDRNJYfUXRxZhQv2iR
         MwLbmJ54Z7vjn/RfZGNaSi8fPzpR+MU2awcBtNcCEpNCKmHxJHBJSVMqxzVDFVfseMC9
         bwpo+bdhzQIY2R/dy9JzeCIt+hzjUzyd/B1AalEDcmSojhxSorNARj6/ec/rmFqEQmJn
         1a5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783586016; x=1784190816;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BNS6l6IyyVH86AVRFbznu6IwUQfciQynPWNDIYQzfBM=;
        b=Rm0x1G7Qsp2jRQDeMEjDy8b+3L6ivfgYEgDlY2M9B+QOkMjJaP1a9VvA0iOvoQeP3u
         Uj4RlzxFM2GITprooJEj5LNN6pKAJVtEcTW1a9kiq8E22Lbc2MGMNMN10zC1808Ahe7I
         uziMNeb9XIylKsBthNjxbfOt3hWuoze/8klV5baLsVvS690ahGmdYOreGeZtuLEj1q5x
         rePgj/BCc2IuT3GIEwiAaYFQGUFSDEI0tdR+uKkQhMwu9nqE6OhIhMVE0eESKLG5NbkW
         z+PH5baTuhGYNxAKm96nBVuRfFTAlmKzWyTstoJ5p6IAj9XdoXE+DTjzaefwo/MtxC2r
         Inbw==
X-Forwarded-Encrypted: i=1; AHgh+Ro0jlBKs0b8rydwWPILUOa77pbM+v/yIemKu5kdyl6VKtzFeoNv9Xc92D+dNgAXcCdSgV7eKRCrckJi@vger.kernel.org
X-Gm-Message-State: AOJu0YyM46vBdisNcZLa861o6IA7b+jeCLrYNj9e/Y+O/UyEJrMWI+gl
	9KVVOxumR3hbKFSqVsGCTxzLFndiZ26neMmK11H4FfJtjInKYsgj4sef5zlxtdsBQpfi8xDMJZD
	JUUcjooRheJREJyKWb4Q6r9yoXQ+D5U4HJn79GStd1EETS9oAdoRQDA9GKzW9Zkaj
X-Gm-Gg: AfdE7cmsuvqvd5gjI44Bg1UGs3AmSBEm8xCixaWUlX8XjSdrcazHGwHGmge16MGnbZK
	3V2oRAQg5q9zjOUnMFN0yYLT3DwcunBsfWBeZK1A2u0hfYmpoLW/fTILvsfDFBEB6UvbDhAqmmP
	6OAVzOgnLQAp/87G1fdXiEuXw0ysy2tSSKy10uOFh0OB6Kczw1HqhlhJo3n1VeOMDjK4NOkouuQ
	9s6BCahVYYROQOBpadG7xDVsInRvDt+NNKg3oxkEe75UGZTAPfITyuKt2DucnzH4KKgJXZQanhv
	rl+6JENh7feF/A6WYuzStjYfngIw/SUUblHZgIFUTrc1sCCQ+kAEFyzDUnI6Lzic8pasrbNUh8a
	FfMNG4YtiSH0waYCucVe/yOhwvdhOREZImO8=
X-Received: by 2002:a05:620a:1a15:b0:915:4ca0:1210 with SMTP id af79cd13be357-92ed799dd18mr267325285a.3.1783586016467;
        Thu, 09 Jul 2026 01:33:36 -0700 (PDT)
X-Received: by 2002:a05:620a:1a15:b0:915:4ca0:1210 with SMTP id af79cd13be357-92ed799dd18mr267323085a.3.1783586015951;
        Thu, 09 Jul 2026 01:33:35 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15e05ebd6esm95956566b.31.2026.07.09.01.33.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 01:33:35 -0700 (PDT)
Message-ID: <6e630189-5148-4345-9bff-f72596df27a2@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 10:33:33 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: monaco-arduino-monza: Add sleep button
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260708-buttons-ios-v1-1-f19feca52b60@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260708-buttons-ios-v1-1-f19feca52b60@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UI3t2ify c=1 sm=1 tr=0 ts=6a4f5ce1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=vtxEUVkT7waMBiOsAPUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4MSBTYWx0ZWRfX3wOU5dms871d
 B+XbmveK2BmPWPjcRsd0MvcOzopqnFomF6qCUcWonTYvx9OqSWWsy72f/jH9dfUvMyjl1WZNke2
 lCUHOZpYaO67GVgjx2AtetlLn6jjwM6DpKb8yklaPC2lzNaIDKufPuR9GZ/LW0FwOPtdAsXY08k
 HJOePJ5mq54ToEKfvlAmY9scjxWSa7fRXyxDUv347ww+RHFKKCGwPcPGJNcqRlEWdgfdrPaU2nx
 UEuEcwbAR0tnZvtUZCQ13ZUQq0RW0FBL4udtPE/4Gtfo9eotXzxkGQ5xk4oO9zOnJtakXFaEWon
 f0XpV/D8C7F/WCSvP2Re6K0gCK6i9wJ2ojBCCvK2y1ZoVFcnahvVmWQZ1BcCCmQZSP5wQfZU8C4
 zdTHdZ3FkssqgXTV7R+yZuv7HjfXwVNrVNhITmM6e/XqLPsST0LGWmgWescLN6DqSBtIq569Yvc
 /yZAXl43vDcwaFonb0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4MSBTYWx0ZWRfX2lXu0T/P6bYv
 y1w1lQvGMdYz48yFWF0xCCgAGtM6r6BnQhz0PBkJDVZYjW5XocErnlAgXWHGJLiMbpgqLBD3ZV0
 YZMz11x023SqfcNNqyaCPPdfgiCfO40=
X-Proofpoint-GUID: loO6XK6W2bfjePFy92BMckqovMYQo8s2
X-Proofpoint-ORIG-GUID: loO6XK6W2bfjePFy92BMckqovMYQo8s2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090081

On 7/8/26 5:30 PM, Loic Poulain wrote:
> Add the board's horizontal button connected to GPIO69 as a gpio-keys input.
> The button generates KEY_SLEEP events and is configured as a wakeup source.
> 
> Note: The button is actually connected to the onboard MCU, and forwarded
> to the SoC via an active-high GPIO.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
