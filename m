Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9BF29B78B
	for <devicetree@vger.kernel.org>; Sun, 12 Apr 2026 16:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776011686; cv=none; b=Boi53o5BWVLHjSdnXYKdDXyg26gHBM9qPjbcFnvDEkSi8EJdfEu9Fmp0b7atZAUS1FF5/AWCrrY9um7rbZBENMzoeKwIQ6Mj5rmt0Dr7ZnFRchkgelOVW+Si8kms98rqRl95IUxmTt1h17i6SnZLBFBd3rkOBr+oJ9n+IwEPpHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776011686; c=relaxed/simple;
	bh=sQQ1raFPnfYVub2aYK4hG7HPzM5CMPrNuWw/8Nr9hig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pK7kGXvxx1ZDyablscJk+JNA9gX5Rv/Cz2HHf6ECfwYmxoUYQX2AqLk88MrZrQJTgeQFho5HOqZkjxUoidMrnWml+IseF4SQkQf5g1aA2mxl7MxKsHw7tMTQzwzBeMvQweGJ4JmdPHqxye8AQCZWs8l8Oi2G0u0o0vEfcC/XN2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IadS9seV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KhI78cXm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IadS9seV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KhI78cXm"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE5SF31636229
	for <devicetree@vger.kernel.org>; Sun, 12 Apr 2026 16:34:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ookRjATknzpCpqleUHMhSAcK
	w7MrG8zOkEPy4ISAvEE=; b=IadS9seV/E1hVs/B7ADmqSiUjcRErys/DNBdmqyQ
	ff2CMVG0ERHm10cVPGoP2fjolS2tLYBew0G6Y/H5LC6GnlVbQ0u7DCQjMD5EqEtf
	6DFbUg6H5oS4eO1R7zzRDzIeS/eBtxJIrr60OY8gGMrpRCmrRI2imtseUQk0tw++
	7+rqHFT1e68meD8f6LKRts1lSDQCoy02XI3pn5buSeiZ56HDsAstI8ro/g0IRXZ5
	dLBjPUiPPNr6MngEzjntVk8Sy+Th3GW2JBl1nS/RvkzJj3WSV2gllv94c33zfqWJ
	KwvE2IexUCxCCY479DNa4yirfRrGEJdBqkedSEi+lOXV7A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffk6jn5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 12 Apr 2026 16:34:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b220c72bbso81079291cf.1
        for <devicetree@vger.kernel.org>; Sun, 12 Apr 2026 09:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776011682; x=1776616482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ookRjATknzpCpqleUHMhSAcKw7MrG8zOkEPy4ISAvEE=;
        b=KhI78cXm5hLHrLAPLAvHzaSeLomhr5frjQu272zzdV6FX9vRpqNy/ugl8VTHpFIeL2
         XMxTT3RLrY3oC/0WjcQsyOaEE7Ct15utjZSZdauVAHFoXtC4zi4OMuZdonHX2RF7qdaK
         ZXrY+Lmi8pnmudiuVkqvk3BFt7uD1tfJpE6SQpKYCco+B4BS1LPhRVKVyEG/VJNJ9LOM
         M3Sa+LvrIVNNsVmrd9LQcEKeNIaOCovqE0khAPDeCkEwma/0Ny4n+3dVUmPztdX06f0e
         T1jN58OTKXvaDGj6/3Lwyryt5xUzFUJJpSM4fXeMtqxeVZQaTOoI4FnIkIPslAEMEyID
         NZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776011682; x=1776616482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ookRjATknzpCpqleUHMhSAcKw7MrG8zOkEPy4ISAvEE=;
        b=mWiu6E7JPTLVZQIjLqxtKomGiM+qdgq5GphZZrc8MkcdJzqHUXBuj+CG0CDqBHm/Pn
         TIdxdo+jASmZjcXsZkdAihhhRKkHWgIoZBKXvcDzLR0A5YVZce16V66H4em1MYgb9N9n
         np5Q9w7972jgnSUNfX1WRuYyl4aQSNxt2lU0bcx3asQpDsGukXViuhyJrkp40PRQ0nG5
         WhsK7ZeIA43Xd+vQe9h9Tob8wiuKxezFe6oQz7iqOrC3PCG6YEjKJBZaqPoaVFjzbM7m
         N6kZY3/Kx3W+xgdNPpRa0e8fY9Ap6tMWfK2pCTpO0pYvTfTg7g0Vv6G54Cr+/T9aCbp+
         3Q8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXuddtznubiyMaVJ05byNtZU5Z5yIfp7CgyyzPG24on0nNzc4IfTmmjf1bhrgqs4JbbEK01j9Rdx1Sz@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1lhy5kSQETFrka0EOxzc17gVAgQ/MLtyUoXtIvh64fWhlrdnm
	yJ9V4SZpReCqbvIiffjG9fUn9iyOaT7rrpitZZJGMoUuG97T8+G89KDVP+d3LN2FozZeqwKdb7+
	WOdn+lHi9TFgxmGpYpR/Ev/LrQ6Bk00SWxxACZUvkdFPd3FEbgEy/vEtsQAaj++9h
X-Gm-Gg: AeBDiesXn6XMUSVt31vtosye1ZZYU8OcPHlTSih1pzNCErzdMHJzt/ovABo54HxaNkF
	+/0DmJ/zhzRza8r3gMJaoKVHwJv/OoLa6kjeZ8CwEDQcKg0jh6oU/8KlJCQx7IPXisedW9TqlS9
	Q0hvHw6jIysBYl3Ry3afQ/xSxIuIrIF+CevCoqoLQD3Mb1taalTfkbLIpMbqsLh1cQftTYKCIAP
	Ddzn0POx4daNsjsr8UMC0Ax6HL7lU0DqzAYsin8+xeyhHuoQaNowl19pPP3fUDiZotOn+nihx/r
	yQ3nAjC+oyzPa7nFbjUXt18I3fDDCO/rS+wMievtYAzD70MY7Oa7V0fg6NGEgIXpJtJbffXDDSV
	0JFEa2gux2TcmoPNLyo0qXJM9Zue7vq6cAE1y0R56Z6e7JcN4CAyKA0uXfv1XloMKImShJzDbri
	NojLSNXYhLtkhF46Trlwwz8hJH7cEaaA26T+k=
X-Received: by 2002:ac8:5d89:0:b0:509:238f:ad8f with SMTP id d75a77b69052e-50dd5b15971mr166679801cf.5.1776011682209;
        Sun, 12 Apr 2026 09:34:42 -0700 (PDT)
X-Received: by 2002:ac8:5d89:0:b0:509:238f:ad8f with SMTP id d75a77b69052e-50dd5b15971mr166679551cf.5.1776011681831;
        Sun, 12 Apr 2026 09:34:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495b4e73sm18146301fa.41.2026.04.12.09.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 09:34:40 -0700 (PDT)
Date: Sun, 12 Apr 2026 19:34:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] soc: qcom: socinfo: Add SoC ID for SM7750
Message-ID: <geovajoi7srr6j37eeykvoa3vwntahqqon2lksis64jbgvtwkp@rj463lvtt5d3>
References: <20260412-sm7550-id-v1-0-958a673ff791@pm.me>
 <20260412-sm7550-id-v1-2-958a673ff791@pm.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412-sm7550-id-v1-2-958a673ff791@pm.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE2MSBTYWx0ZWRfXwfjdAcgOp1GX
 JrdTuVhk9aD0Lizd9kVY5DRdQIvlXJ2SCiJtlu4Aa1q3SR7aXTqfglva5uReGUdH+0L0eSuEv9y
 twUenoLplN4uKthfeyvouiqoOYNzKefYdcGzZcdXWp8rNmo9C0nlQ921+og71TYinX+Pv+h3wYu
 y5/xjF3n5z7Y6DB0V1MYRJgkEF7rqMK/2NEJQn12EAxPvv4cj3PNyOAcaqV6A6xnCYrpaY3O8vX
 MQumdmANZgCnimzC4zk/bj0+5g0xnWPGLYTB4PAbZWS3MWlccFZshCcAfUIdmMykAAqArtfMThn
 a4Z8Mcw+6ox9bxTH0gZkBecpqpx35sZl44numls8EfkpDSzmhdlUO3PrVChlg4xHAUCLuwJvi43
 XPHpnDpRSHGABpY8kwkpEOqFoZM4DS0jt5bdSuhrylUOW67O559yMdIkEnSW/Uk+FYIHXX4ncd2
 CNw4mCsZ9Wfk10Mipxw==
X-Authority-Analysis: v=2.4 cv=YM2vDxGx c=1 sm=1 tr=0 ts=69dbc9a3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=f2K6P6kOlr1hZ3AlffoA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: Wg5VUlpw0dCtEobDh_nCuEmtoi3wB_E6
X-Proofpoint-ORIG-GUID: Wg5VUlpw0dCtEobDh_nCuEmtoi3wB_E6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120161

On Sun, Apr 12, 2026 at 03:42:44PM +0000, Alexander Koskovich wrote:
> Recognize the SM7750 SoC which is an Eliza SoC variant.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/soc/qcom/socinfo.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
