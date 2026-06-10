Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC71404BCA
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097630; cv=none; b=koccaiZadsDW3dUZMLxrz7Hy06A3E71jpFPrRL8037nKyB5WcxUupR19FIkisBiXyD62tI2TRVBYeYBM4UvBZv8iOrmWql2Yt+Dc3yblOOMNwN65VW2FRXQ7QAMmsTUVmzZluWT88IeNbSIoS4JG4bi8chjKACoamFcW1JVpHdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097630; c=relaxed/simple;
	bh=fD3dOrtZgpHMYtflX9pD7VK/mi22+LsFBAAJVHHd4M4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IXzHlObVAWYqGzk1YXjtpONs7nQKwrZCBIjSXbGZ+GvQedW2TKyMrdboTqO5fVcNb4nhApuGweOxUOgKO6Y+xbTP7yRpqiWxpzvs1B/6qZ+hIssVjvK2Zu+AMIKtuF/WZHFzxRtqaxVoPqRPdKsGv/Yk68Io4OZtBMXKuYB6FcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W2wsDPig; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NC6cTvlC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W2wsDPig";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NC6cTvlC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBfLS1138070
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b+ILUUeSN9I7rJQjjJXG9lLz
	Il41Tpno6VEpIZWt+nA=; b=W2wsDPigsNbT6UesO9rCDgz0yG6GbY75tZnSU4+d
	sDhFjUGv0pM7sf70salXeeFctT7bxvQtalSCnGKny/Uwq3pffyByBkJYcXOuc3qr
	eKb9ULZHixiO8MzmueVgUofdq0msLz+rXl/IIC7VZlA1ljTaNPdFg8wQ3rZ9DEiM
	MuxeOZe9KDPPTL4BaYYIRyQACXJHmZSNtltSPC60oTeB1gyZbcBtGzOwhrcXi+m/
	i5ffxvXugGUyri9djfUGejRkRyRN6sjE/TrH3+T8ED3v4HtoeKfNhNipGP8LXbpO
	xa4S/aF7ouVr+uzcqpfUpmaTiNTb0osDB5nIxB75jPEU5g==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2jk1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:20:28 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-96396658728so2045705241.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781097628; x=1781702428; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b+ILUUeSN9I7rJQjjJXG9lLzIl41Tpno6VEpIZWt+nA=;
        b=NC6cTvlCDqMolKVGzOshGvxyDUXaWIdUdialhE8B2hyAXZ66543m+icYjGnomPVkLB
         +94MAxEotLgHOm+EAKd44u0bpV7xgQvCre3Em3PGWjCmmmTiqd1azpjpvxYA5xGT8LP/
         qO88TygYG2wrUvxQfEW+Vx952qgUAbbcOyhKT+FMKG0fa646N63+5I+UT8D276otD+5Q
         n//z5lGgVtgjMxYy1c3Y6nEVMRzvsj7hhzpPKBT9mZ14081CyFNLRgbbpNUTphrabfw7
         /BgH0oVFqukfvY3h5NqYrMHwUm22qUAXDo0IussiNKtYhKrjdVFPbL7WN4MQQdsPPvFN
         RwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781097628; x=1781702428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+ILUUeSN9I7rJQjjJXG9lLzIl41Tpno6VEpIZWt+nA=;
        b=WWT5JMXgcPduA2snDUDzQf9I6jtpAwcZydLchyqjd6xrSCKSMYrBWBe94S6bpclrAu
         rZHCs+gXwE9xDEHPno6CQj9VzyhlQLooW5tYg5yLD7P6GD5BimLoG1yAikUPL/8aa+lp
         hDikO9aGTTpiIIF2tYPVR5NrwxHoK8C0qlEUOOZYHkTM4jCtVQ85kIp30Pqpe5Gky6H7
         7QUGwaniq0Qdz1GOrQWWgUX9p/AgWpYCVNcrLkrNmZED9znAqFO8jUlB58q6pUijt1WA
         J+ujtFuGYOHt++0PvRZ+Nu29lQD5KDqRxCis/2Aq9bOe7z2msWr7P/El3BVQ0B6/aDaS
         iT3g==
X-Forwarded-Encrypted: i=1; AFNElJ8AlhGvhAdJO4nRWDe853UrgcGMOMMrp3+2d3+6OXiRWgkqL7gJUI5Wb+9qLf28GsKUAbpdt7f3JYev@vger.kernel.org
X-Gm-Message-State: AOJu0YyPZfMFbpUDHoFj4x2cRaPDqu/7L9e7hV1br2JeWSrXWY7adcKz
	xLoF/WJtDAZuq1ACgUyMzFRNAWCesR1qxiQcanXlURM35faR6U7tVcwlksCMbh3vn5atxcYeOqP
	nGCyUxzSdbyKc0gPLdKiznbv7eFM+alhRtgtKVeqcHN8ZUZRQ1OuC+Sv2ufLXmS+H
X-Gm-Gg: Acq92OGVx0f2zBcHm1xnuXnqJhQ+0g5bBubY/bnhsopByov1YdwQLq/iGSHFHYgr4IF
	/+roj9mHs0V8sa5DYpz4XrEDj/Yjq3nlwkVYEyfJepbJX0tILLwUf+r3TSVFfjUYI19Hu53Lthg
	cUbt2xITw4DsSeUIjSaeY54emXsGqqQzIJtBQ0XVzK29eO2HRmZYckwk4bb9OmSs7z85Q6k9/Qv
	noLHXhjQ+SkWFutKA+3ouFJMLLNFlohSJpUuk/TRXrYcP7p3JeyjLNL/3z+hhPlJ5LFkBVNqAnL
	Q7rMiYAB650axKfSyE1jAVGYFTwgiuIMpOKFVsS4NAZB0NffKkvVbVJ/0vnwL2bNsBjgJrBvvuV
	ekr88+6iWSPQdjDZWmWT+aGNq556/zr/XUPW75OiCHHhxa7rN1cTOONPgwUt4fAPLyLTjeHW5sI
	d+xoCfkEOBCCc42M89CYQ0uzzDlWnz1pSvt44uCNCQKptCPA==
X-Received: by 2002:a05:6102:5044:b0:6ef:f691:7044 with SMTP id ada2fe7eead31-71928c9b108mr4398293137.1.1781097628046;
        Wed, 10 Jun 2026 06:20:28 -0700 (PDT)
X-Received: by 2002:a05:6102:5044:b0:6ef:f691:7044 with SMTP id ada2fe7eead31-71928c9b108mr4398247137.1.1781097627623;
        Wed, 10 Jun 2026 06:20:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2be2absm61723611fa.23.2026.06.10.06.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:20:26 -0700 (PDT)
Date: Wed, 10 Jun 2026 16:20:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Iskren Chernev <me@iskren.info>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/4] phy: qcom-qusb2: Fix SM6115 init sequence
Message-ID: <iykbillfumrcbi36opmu5i2fbcot7lz3settfnw5i7sqdgzmr4@evagz7qqnjpm>
References: <20260610-topic-8996_61x5_qusb2phy-v1-0-d7135980e78f@oss.qualcomm.com>
 <20260610-topic-8996_61x5_qusb2phy-v1-2-d7135980e78f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-topic-8996_61x5_qusb2phy-v1-2-d7135980e78f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a29649d cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=Oh2cFVv5AAAA:8
 a=EUspDBNiAAAA:8 a=SC11PsEEbJH5d9KfBicA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyNyBTYWx0ZWRfXzkAmH7QfbYUn
 nkRFGYZK7G0875MxFIJZtvQokEmOXPrhZFwebEdecn/l3GJ/Vffcui+zcNN86hQ9q16I5MYvNIf
 qYKBRR24pDjBp7vM1Udd596IPJRNkt0GkmFVVZqzvOGcQqobvoM7xDZB+b1op/f/J0HnbNurTRK
 pnmspuNmEdiYMTrTQnuTuBxq9l0sxxRnubTLOvICL0N20viUuQLMUqJiWIV/2o8gg9Sif5VHHVf
 /FZeSUJqEoTYPPDY1WnJAaLVaF3Qx3uOfzKOUnlSUQaKMiqi/A9q3WHmNcGh3HN0uDHx6DA/CZy
 YTTctTyxyqGFXnfbtSKNcAdwxdTgLqoiGWgxX7ju94iFuySwsVcLnY001jDqN61vI4Eg07Pzu9i
 XSyiW1wQFWq9eD+WHJh8CrrdI0qXvQwcD5txMDbqdHWTNmGzLA1ja1E0tOrq4NeKxh/25ZgS8KI
 9IbT/kGIlIkkNvvpKZg==
X-Proofpoint-ORIG-GUID: q1ckNYrMrT3lQuBkOuQTEk2yrPESgqON
X-Proofpoint-GUID: q1ckNYrMrT3lQuBkOuQTEk2yrPESgqON
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100127

On Wed, Jun 10, 2026 at 02:04:15PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> I don't know where the existing one came from, but it's apparently
> wrong, according to both docs and a downstream DT [1]. Fix it up.
> 
> The updated values also happen to match SM6125, which will allow us
> to fix that platform too.
> 
> [1] https://android.googlesource.com/kernel/msm-extra/devicetree/+/refs/heads/android-msm-bramble-4.19-android11-qpr1/qcom/bengal-usb.dtsi#145
> Fixes: 7756f1d6369e ("phy: qcom-qusb2: Add configuration for SM4250 and SM6115")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qusb2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
