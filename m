Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65370146A66
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 17:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776189441; cv=none; b=MIr8V+XFsmZ3Ll99NEALIVjVkIkj6bimWsm1ZSZ7fb6GH35Chyl1ffkDOznrG3db63NucbWM99X7+O1dX1ePKN9wQ0jNvFOVj8G1LmjrronBYO+ohl0mX95TJbRKFyjLSJIPcwNGga5Md9eg9hXr/y5K2y3TjRKYMvqlZYw2W+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776189441; c=relaxed/simple;
	bh=JKiWmg8ffkxoKEYWHQrhErMIVIkRpAjY0NU58RnL+pI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FjD9vZWcERpiHAuCNvYZDv5bfyq56OoEXOR5PWnvNJhldb0PlRrgj4voPXJWl25DfugQaYLa8iCV5jELqfEt+6j+yNsrQUIqNQcwO52uIeFa2kqqkwHg6heXOkBkLR9TqflrOvZl10Vd9BxC1I/eG17GYaUlggZn5wjGuDczsGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fasTXj5X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OA4Pv/zH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fasTXj5X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OA4Pv/zH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EG4VTX2005543
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 17:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KYapHT8xNp4EtV3Te+VNJJiO
	yGb0k3FBeWxnUftoqwQ=; b=fasTXj5Xi3nWnE5FByBFAiYVCaWEi5HrziB0N06A
	eMhC6bW/jjugwyLfwc8aL3+ggJbL3gONbXk8C1sQt172EyeThq5Ie0zcvumkpXAa
	KX6o5d1PnzNZj3RrecrkkbNZp5QrEAOXizv2jZ0E4e4qnU0fC3gam/u1WeKmbqUx
	RKmo9ukl67Y4ZOzT/R5INdNrh/qCP2ZQqaCIq2W1sW9kdx3oqyrMVYKcAY+Oj138
	wdBPokzMRYLpvJZ71/TqOKI2HwgUXS5Cpyoh651r8oB+RBHfvAmGVrJ4rdsP+GhZ
	wDKcFACuD0DjFrO1EVAA1kyURpc7g8k57DqkMk1vDwqfaw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrsjrf77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 17:57:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4661881eso9551071cf.0
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776189439; x=1776794239; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KYapHT8xNp4EtV3Te+VNJJiOyGb0k3FBeWxnUftoqwQ=;
        b=OA4Pv/zHx9J+CvCCFP1cWtUj7eh1waz4S2Loxhf6yCUqCWfKxMrspH91W7K2yLZlvO
         X/VHACKWFfpEVD+/jE0F2HxuqtXNwynDBrVuAQ4xjHmY9OXZhbRvjtmEhj4HvWp2Y+6w
         HNZguJpZtcySL+Ik6hv6jAdSo+o+51BzyZE2clhoJXU154jD/7jtOYKPCpGM/gDG/agH
         5i3GrPhrulsZ5oOwdyt8mfaDNGw+X+XWrMA2utQgXIsWk+q0sQQK7wdippZRBkRQ+1hx
         5ENxPHxOgkIdOrPYmHFcYYEadHMX9eKP6BpAc0zwuM3miAmFY05OsBECVEURKsmFQ1a9
         GQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776189439; x=1776794239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KYapHT8xNp4EtV3Te+VNJJiOyGb0k3FBeWxnUftoqwQ=;
        b=nlmdQi/ixkEOt6oGyS0U2F9GImm4d9wyBpL797YPPzHqDoFTRSB5nb7p2ELcKl3AFS
         Mxq2Kat2IoAQ2Vqa0O9PId9LPfPysUlgOrWF1lzQyuhSzVgT67zmTyNdxtGsceXtAqsI
         jw0a9WKawt4xwHfM98h214vbPWwkwMVC/Z6N4B08dIUpO/WHkjA5Qlrz2GsPfA4GTApJ
         0imlfYODUmKSwq23p9fpyeBUM0U/cAOZIySXQnYHNx//YrKh+8ZthTmA3MSDsq7XOdQj
         s8R46pmL+jY84bbU2B2XtLp6rlndphkvpMmPGOYrqO1WeEK1NLCrWRQ6C4j8u15H5c+c
         2nXQ==
X-Forwarded-Encrypted: i=1; AFNElJ+enbo8z148m0v4l3dhhis8lUR7Dsumd+5hxaO5ncdtJPMKBo5Ngz1ImbeJu/rs2DqPWOID14NCd50e@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt1GJSqPGRu/VKFNh8eBnDXdnu7PZy7mAm2PLZJAIvB9BUnldb
	JNWKjFHDU0yJre3dHanv/geC3aTfVNd+H5qlg3krz4Ewye+R+ucwYnCmRdLxHFJFmBsm3br5MDp
	07DjN2ectu0xwqBlCrXTheEveHP+onx6sPlb51ROK7xESN5eNAkLdjcn9b7Zkz1Zi
X-Gm-Gg: AeBDiev4rT3qcYixwSX/xhvZaWXKXVmPcV3Pp9I8aXRsdWnGcCMiA3it70Aw55YIcOd
	WAyXJ0eKUn2cQ4A49B76XlV9Aka47Uy1gmMtqYyWSs5Gv3kO68yZQ+9vD0ngoYRjmk1fBhWaJTc
	x2QHCnTmvNjka1svh3t+J4QYNaD3TzHfwnSx0oJ+Sumium4Ise41FuNG5OdtZiaNM7fER7Y2HI0
	XT2fiGRJj17RNva3QuxrECY2JkFquvuurc/fc/J4FUqf9XgzlyYdNczcDEbg0+PDkksK4/QoYhe
	geJpZImFplx7LEz7UBfsX3Vb9I52tPU63rfmn9K3EBuVnyDdayZhg3O5Dx0wAD2+SsZ9v0/xeAr
	rVLKLtwqUrQ/XSmYQf22/zqk8xRUdGMfmBqK0+Km1BIyasjyTj37gLAaaCBezN/d8I9GeDB3Ge5
	tJ2ozE8c/iHtCCLZM9MPYtokMNLOtGuMggCCIOv8f9DyEEjg==
X-Received: by 2002:a05:622a:d0f:b0:509:372e:35f5 with SMTP id d75a77b69052e-50dd5c0335bmr233791141cf.55.1776189438641;
        Tue, 14 Apr 2026 10:57:18 -0700 (PDT)
X-Received: by 2002:a05:622a:d0f:b0:509:372e:35f5 with SMTP id d75a77b69052e-50dd5c0335bmr233790781cf.55.1776189438156;
        Tue, 14 Apr 2026 10:57:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e7c057520sm14202001fa.16.2026.04.14.10.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 10:57:17 -0700 (PDT)
Date: Tue, 14 Apr 2026 20:57:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Drop RPMh CXO clocks from QMP
 PHYs
Message-ID: <g6nfj6ajyfyjaw53wewgwl52qri4ql46vtc4jcq3emnayk354g@bubpxtr5t7mi>
References: <20260414-dts-glymur-drop-rpmh-cxo-clk-from-qmpphys-v1-1-ab12d77c4aec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-dts-glymur-drop-rpmh-cxo-clk-from-qmpphys-v1-1-ab12d77c4aec@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=WKhPmHsR c=1 sm=1 tr=0 ts=69de7fff cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=9Jiz1KvnAC8adWN42FAA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: -BSPMUCsV6dp4A2Dpicy7jnYIFIjP72C
X-Proofpoint-GUID: -BSPMUCsV6dp4A2Dpicy7jnYIFIjP72C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE2NyBTYWx0ZWRfXzFAtvte4EIzC
 53rDsFF8WH2Ik9YyEpiUF7vhdu2vAL4wkEVvu6n9f5TTnlSDZ+FZYvZFL42TOEeFvCF37F1/i1g
 JJJYAzZqkJIz7x1ZaxkUF8Bqh5u4m79AC0IEOWGvxL+L9wlNPZzdJ6jV95mNiUxAh7gJ062HXb9
 9uXdEeDTDsYcqeC9XB9VmGGHvORIVKCUuiGOG+1pipFZ39aMQezX2U9dUV+MHZfmFMtPv94JZUb
 zkdG/Lp6glNY1ZHuAfvbYdHgBZLsjNMWlDBb0kIHgSLrDUgyn3qdctTRTsVnN9SH8sPLWEMFRTm
 cAOCkPDeROK3VT2JkAg+EJfAgOJedaBIBTbicJXS0vrxbYIpYIGfCyZGo5xzBGG1IsHiL52iz+N
 Vb0ikHTEh4jkG+EaTdJqS4hzTUaGgKYWw2mBalGer8Uulob3R+rlQazovb9IrULFAeBpJKU/goa
 n93Tq0obxRYUjsMLM7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140167

On Tue, Apr 14, 2026 at 08:05:51PM +0300, Abel Vesa wrote:
> On Glymur, all QMP PHYs except the one used by USB SS0 take their
> reference clock from the TCSR clock controller. Since these TCSR clocks
> already derive from RPMH_CXO_CLK as their sole parent, there is no need
> to provide an extra `clkref` clock to the PHY nodes.
> 
> Drop the extra RPMh CXO clock inputs and use the TCSR clocks as the PHY
> reference clocks instead.
> 
> This also fixes the devicetree schema validation, as the bindings do not
> allow a separate `clkref` clock.
> 
> Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reported-by: Rob Herring <robh@kernel.org>
> Closes: https://lore.kernel.org/r/20260410145205.GA554754-robh@kernel.org/
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
