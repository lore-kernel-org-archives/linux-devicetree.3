Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1730F36D9F5
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 23:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791587127; cv=none; b=r6SRqsdzKHsT/NH/EOHoSj7TZ3IKL1YYU1XhuOZZydX2lVW4Zdd09iG+zdaiK2eK1bjh5GQ0c+zxxxtE4OKNtx+MDYOa+MKjHjoiJz41T7pKACRibY9cg1NN5+s+mLIxWf2cXzKTunsw1nc2hXZAvpyn5fGIhv8dgU+g8zw4PxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791587127; c=relaxed/simple;
	bh=cuml1WRoVPo5CU/+noegueeRxjpqh8+p6J/SZJnA1Js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WfiVoe1YMAaMQaVQ4JBvmDiFt6KXR9XscRwh8nhQwJ61wJWbTV7S6JT78/tgH/ZmIPx8ZQ9HfoCdHlTZnUlq2F6JTnq13YwFtceSuhWxE2AJHO/I0MIpYIOZRcz0AgKhzZaUAveIb0xwa48whctwnLaKcG4SuSTE7xMhra+5Okc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A825mXVh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jnDuoouI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A825mXVh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jnDuoouI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699KhWIT2545229
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 23:05:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=92iPLLNWa6TK/xvUvTOqX3t1
	epK+uEt96Kr0e/HgmSs=; b=A825mXVhs+KZwUrOLshBD8MYP9LLoFjL+Yzw3ys6
	dtB5xLCIer94OMkdcIa3QJJKsjuzxMkafDAmzCDvDRkbTxS9ubh0+WCCjENVhJWU
	gDhweaud8dn0TW7ARsHFTOjF1H10S3n3jTDeyn6mJizHguPz8ziI35vTSTE16xOg
	J1kLYlLWQ2UqwOT6DGAcCj/dpzBGVTFWMegWR9qNvf0iSacKFdB9ajhzKC3vue7i
	cqhlKLASmdGk0rFfJRHB0s6OxR+4SqBmih9YfjYEgnPcr/5BfHXvQVuT30kCgc2W
	P0KsLXRh0tcHyEW7qi8QF2Fa9HyrVs76IdBtlsrAeMYaIQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t7s0w7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 23:05:24 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91961d4b31bso7636056d6.0
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 16:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791587124; x=1792191924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=92iPLLNWa6TK/xvUvTOqX3t1epK+uEt96Kr0e/HgmSs=;
        b=jnDuoouIQvmXvA9LrB14GrvwcEsgw7GrhO+ZFcxV1c6EVXdHbYqDilYd+wKqNLu4xI
         w//qxIVgyNY6ABXXhHJYOaicdnSxDQZoaIugIcXuqpLQXvcwNw2B9jM3RcrxLbahDcpX
         ZBL7JWShiL0wIcC5N/F/IdoV3F/GrwBjp3jcq14tABqWEse2B1OF2aa3wazduN85T6V2
         52G0Nurp7JU8q1X+ZyS/2A4up4ey3cok7F5FliKhjAl3LP1EnwIPByP8HxCq0ZoWgIvR
         t+D1ZAOKRI6bg2SzEH6gXainB7CMnW/qKCCM+HttMURFCnGN7Texvmc3S9Tqq3l+enp/
         Z2aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791587124; x=1792191924;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=92iPLLNWa6TK/xvUvTOqX3t1epK+uEt96Kr0e/HgmSs=;
        b=YPT5i8Wjg8WrT+z57eIbpvlmjaD0+C65J+ZiAOpo7J9QwXBAZ//8SWrePfCbg69JtK
         3sA3iTqUI+U/3DKrcnIPYMEKqmKzjRUveyr7dBuhtJ4xKoIL0u7mYA05rk7Oej4JNROH
         fQiEtdzBAC53KpAE5mZz+5njFJcywI62zOEU3vmBnhoNDT/2Zj0lWBSd7J3w/xfwKX1l
         cSTu1QyBNV8g0vtHy+Pz1dGkcy7Jbc3AOcgo3a/EUt4RaIX2VovLbL2xWJAZzb9/01jZ
         JsidtmB6qCPnPId55hJNF/jC7YwtVWOqkROiaiBVCWNz4226wyMxW4Iw/U6qam21VgGh
         8p1A==
X-Forwarded-Encrypted: i=1; AKwUvBxawQe9n0NVFoCtzlLHu+xoWtM8Ng/c+IQuffIoCFl3Yl833eLbVXXvyfwjQ4TVP8lUNiho2EObKTsK@vger.kernel.org
X-Gm-Message-State: AFq9FYJSXDus22oBMgNkPXSZpMVqt0j0tLKayMBxMzUyy5R2gHPKY36a
	OWixRANb773+DOXMJRr/afLUi0BiAsJhJY3LVHye2+bhyo/I/ZPn7VyK9WQYSxF7SxcaRGamjC0
	GjJ3OO0RAft3sq7rjozpSaMHwbthsyWiH/5a5w2p+nKUZJtMCkcpzK9i5WdnRLuPr
X-Gm-Gg: AYBFou2ys3akz6xr8CZr1KoPMUM7HDU4lWpQhWdxIMyIqlLFF0bMoCZ9L2UUCv44jtC
	OEDf3WrnwodpWdR5PzIPCkqyFku7DUzVdyZk5FUPx3bHOYLxTpV671d4f6u6ma2e/KHVq/akFDh
	xuAhE1UKZt7+iEwq2ItS+m9leuVa20O+eOcHMldwmvDqgLzhYN2hYBEthhD8d+c+XbaZ/uTJpSm
	h6NChUEYxbSWmujnRdtYuV8QNUSXpDERv7ljWogASUJecImt/9XeMRyGTN1JvcUMCZKDfyU7MCZ
	DmPeHCxzfLK7GYuOk+IIWVtqWOokLpvUgwbjWSfwkQ90IxtAdYGYrvMsKZfFx/xiHD56QkqsyoM
	v0+EybB4DSFdRju2y+jsJyvaU33PlD4evk6X4L8rEochf9gdAW6lqs3IiMYrWNpOBd66aRA8LLH
	voyR59wXwIFB+7
X-Received: by 2002:a05:620a:46a1:b0:93e:95ce:53b5 with SMTP id af79cd13be357-93ebd28b9b7mr596920185a.52.1791587124258;
        Fri, 09 Oct 2026 16:05:24 -0700 (PDT)
X-Received: by 2002:a05:620a:46a1:b0:93e:95ce:53b5 with SMTP id af79cd13be357-93ebd28b9b7mr596913385a.52.1791587123677;
        Fri, 09 Oct 2026 16:05:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde9bae2sm1004191e87.35.2026.10.09.16.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 16:05:21 -0700 (PDT)
Date: Sat, 10 Oct 2026 02:05:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: fabricioakio@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm630: Add interconnect paths to the
 BLSP I2C and SPI controllers
Message-ID: <k4yulw6hzkiw37ju7tp2bdxbh3kxrffkemyfb2zlxeuk6sul24@j6obth36alho>
References: <20261009-sdm630-blsp-paths-v1-1-6a86ba193e8e@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-sdm630-blsp-paths-v1-1-6a86ba193e8e@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA5MiBTYWx0ZWRfXydkmpkSNOgtK
 jewtrzdeFxcgi6C4LJOXF5hZHvWVUloDKS46/vX9FUhJNO2G1woxnjusUU7X6iAU2ZKJdoktwi0
 dihY6/Us3Qc0UU1cHaWa9UOWtNu4F9Yu1CE5IgMBGtID/9k2JaTExXkPiAZrulcXjjdliWKtfUZ
 nw8V9QZhkkpSFdaKq30oPRBFWfNaOeYEsxxBemvw88cQZVT/y8zSSs3OhsgOQm7J+BFf6aghOJd
 9UuyLhAR940Bl/eQ78O7DzYLMtWEZ59OMLzLmjLaBKUMobWVZwZtHHHSWNyipsKF74gUyXg8ZbJ
 3dZm9vVvvC37Gax01Q0hWd8HuhHdjfE42wGoZDxHJ1o6TtchFX/55n6/tORkkVF8aMG4VynHKli
 qsp1021wV/n5vJhpK0VupkdZvypagcRajI9emJgah+vZ07vz/VHqXB8encsdi5sW8/jJF5KGavY
 s+lk2LJsCzLSul8jOiQ==
X-Proofpoint-ORIG-GUID: yraRyjRPYyTv68ExZmshaElnQK4f9o96
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA5MiBTYWx0ZWRfX/w6Q8O2oaq00
 p3t7Y0Cm08oAHOGEhFMtMHy0HegM6N6LRSWg8++dwZ6Wuw7WsXDMr/iEiOHhI/xvqHYmqJEvvZK
 sX+W7qFJp6k7FTLlyhWxAVCF0yEle10=
X-Authority-Analysis: v=2.4 cv=PaFqFShd c=1 sm=1 tr=0 ts=6ac97334 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=OGs46NaP8JcU_4BjHI8A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: yraRyjRPYyTv68ExZmshaElnQK4f9o96
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_06,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 phishscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090092

On Fri, Oct 09, 2026 at 05:49:30PM -0300, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> The QUP I2C and SPI controllers move their data through the BLSP BAM
> DMA engines, which reach DDR as the aggregation NoC masters BLSP_1 and
> BLSP_2. No path is described for them, so nothing requests bandwidth for
> those masters while a transfer runs.
> 
> Describe the path from each controller's BLSP master to DDR, as the
> vendor kernel votes it. On a Motorola Moto X4 (SDM630), with the
> boot-time interconnect votes released and system-level sleep enabled,
> an I2C transfer running as the SoC entered that sleep hung the SoC
> without these paths; with them, 5,000 transfers ran through about 3,000
> sleep entries.
> 
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---
> Tested on a Motorola Moto X4 (SDM630), whose board file is not in
> mainline yet, on the sdm660-mainline tree. System-level sleep there
> comes from changes not yet posted. The UART nodes get no path: their
> driver requests no bandwidth.
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
