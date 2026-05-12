Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1972FFF8D
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 18:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778612077; cv=none; b=ekBAAl/wklVzJKgz/kMz5EUm8aAwDs/SeSONM1p8qnF4/4PofdetF9ocu2t9XVtzGNL/2EobqyISZ6ILDKvStXGYqmn9/WFd5Nf0JiaeuLLEOZ8aAfXuxTzkDyTKRu1T6vJbk5YVTtAi5yzF04iPAjxV/8grDPbZdnsFG1DwTBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778612077; c=relaxed/simple;
	bh=gZ7/m9KpQ1/EqhvU01sswVmkLPUjhY90BeEr4h1qAGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pdvP41PNZl/tkoCBAhA8c8mVaQDZ+Rf7LhDA9FNHzw37rYnk4PRi6HsECP4WB4ZLROGcN+QqfO+cpor2GMOF8qv/6C7oSeyOrj7dRmk6DvqG6XBbD/2wmB4+qh+kYM9iHnlRtukNeLxKjglazqdGyftUS3no68Uu88PjA1uhNlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aU6eFMBZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WaAo0vrT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aU6eFMBZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WaAo0vrT"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CFLGNb3421756
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 18:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vZkXWqGOTuJ1cPUXpqHQv2kE
	LP6bt2pTDXGQ67qZVDs=; b=aU6eFMBZ9b8hmD6eMXGQ9/PCP6BAl1vgRHrPYaBC
	Tu15soKe2xqa4F6LWQRp9L4SVIcdcyjJhTFmThqa6awUlKvtfCE+D4Fwx/3dDVgP
	y+zFyIluITZtoAUKY20S+tXf6uA0eLRm3Fd+oMr2Mj7PwdcBR91ZBTY7ztdlIHTv
	gkt8fSf1mV5Gfl+X4TiNJ0fC78uLB8kLZMjNLo2T2M1i0q5/tqwfspNggyHjPNkW
	Y5MiH5b/eaVrpQojF7zuv19pWulR3Zh6fWM6iU9J6nOT7Q2Fl8IijS9V4C1qlSDG
	CEGmlzsXIsg4CPtHNoFyLpKbYkYCMpoAG+e0+/+7+7IPcA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e46s9rvdv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 18:54:35 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8badccc9194so29931256d6.1
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 11:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778612075; x=1779216875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vZkXWqGOTuJ1cPUXpqHQv2kELP6bt2pTDXGQ67qZVDs=;
        b=WaAo0vrTlKC0CsvD4EzMgKOMsIggZUHXVy3ip14rsOE/lnFy474aqsgs3oYDhAKSNj
         ImoekYC1PH2WLkzz0pce/0ofz6Uqw+k2N1OLNw/rzyc/42gWRoE4jtxZ0VXfGCYq38Er
         adal8jP/OH8m4Lru5b9rOpF77dXtA8+kq6IuKPHwR1MwsCltqvPYZ0jAoi1rvNdLvV3B
         uJCf3ZkUYdJfGsyWB9m8teoHXbHnQ19B3WYxYoRqPmFKUAAoXQ+D8rF2g0vREdAQgcU7
         B4IhnklRP35LcQn1yRFDvM/i0OvKiqsZuW1E7eN2+7eZbDN6r4/nVp1b6SpLY3Czxqdq
         0hkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778612075; x=1779216875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZkXWqGOTuJ1cPUXpqHQv2kELP6bt2pTDXGQ67qZVDs=;
        b=pZSEQn9S9/uo2I/Kg+lDo7e+MUVRLujEYcW2ze/lgYGBVH2UAsUQDdYkEManxeTBNn
         hHVdzi+TBCZci0Y8Fv2vMc/RtYLUD8auKW+FN8kTZ3t+mc3itemfT03AjDe0FZbkXebp
         G4CBkza6TITJxVYtkUbVuDnORuEM5ZDo34MS7373sU/eA5nKrrZQFBvtafZaW34oUmNz
         iQi5IXuemLtRHjm9qsHFYqbqOLnU9BCSvJFQW2JiuJ2N+pYnvCwSWIie+IfPjMlO+XpB
         0uzG3yrfjUPjRSSWXhZ30h7+YeCzyTr1nETVqcbcI75cTWKi7MIppt9peWclaPlq6uST
         Qs8A==
X-Forwarded-Encrypted: i=1; AFNElJ8eDkhBjz6SFAS0V0cH2bBKdqLAIcRi66Affr5uBPMUdKQEMvglB+pd+8DldWwt0pAPS7B9KnFQPbah@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv71MAn5069AAEeBmSs43yOnENSdTzuUGiYdS02a/7D+Ql36uz
	VhvjRkArGbDrPevwekfL9KwsUU6bbazL9mgS7Np49PdEaW47FiPg0jXEVkhuYUNX3POh5zLZkpz
	8n6dLwAx04JwJQ6CXKyEy8nQLSNR3DN7xtM4A0B+rJ1/mc75fmxlMxVLhl1u5kkFD
X-Gm-Gg: Acq92OGYbtjyECd8sMlNBX6MLwxWZJJwd+riLzkgSGQ+AGbsbleqya5fhKAlJl3w9Al
	lRn7Nht1VUJFPAy84LMjGQDaOSLIJ+glfSYlWEcCAl/PGS0UXtw+M5tuhL90Vv0DwnJUmxZcbbo
	wcsSAMykDK1Pn4K4SvMZz79Sn4iMSFZJveN2b73uuZqDqe+bOU3j7IR+hwsVFEFN4z1KIVf6YDm
	EWRTrkN2IupcmUB6eCkbTP4LpcqAWP1CNWKi061wE2X2cIX2ysqLmjr8d8CT9Iljb/57UZZnugV
	bqEF0Gg4n823MxLETGsKhAaPWgJ5S8bp6eNYSfS9eQ5gCiDCzVVNsFXnnpHSw1sBKmjNsJnulMH
	KwdG0BG2bJuUXQ/3G3qCFtnvKkCf5TVljXnm4w8SJLqO0DDxHmW2ZH3Q9VX2FwaVQJYCc4MQSX6
	PLESAHhd87T5msSn1H6QbVkweSRVg/vsCRvAw=
X-Received: by 2002:a05:622a:1495:b0:50d:3e1e:7998 with SMTP id d75a77b69052e-514d20eaa21mr54111811cf.37.1778612074383;
        Tue, 12 May 2026 11:54:34 -0700 (PDT)
X-Received: by 2002:a05:622a:1495:b0:50d:3e1e:7998 with SMTP id d75a77b69052e-514d20eaa21mr54111391cf.37.1778612073721;
        Tue, 12 May 2026 11:54:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95152b2sm3485928e87.11.2026.05.12.11.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 11:54:31 -0700 (PDT)
Date: Tue, 12 May 2026 21:54:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: eliza: Describe the ADSP and
 USB related nodes
Message-ID: <c344fbofkaei3dissek3akbou2lqzdffj5smho45qyshnztnbi@tly6yz67b4zw>
References: <20260512-eliza-adsp-usb-v3-0-6420282841c2@oss.qualcomm.com>
 <20260512-eliza-adsp-usb-v3-1-6420282841c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-eliza-adsp-usb-v3-1-6420282841c2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE5NSBTYWx0ZWRfX9dq3+EiR3gt4
 L7r7ll3KTX0ux+iPPoL+/APArLwqUe978WQWlnbX4J7GdXgG6s8LDIjpo+omYForHWjXCa1HB4Y
 6bTDDYg6xBOR5exbw+R3t0648/hTrH6sRGphFkZhwkOURZVmOBo8S41yA5Hp/eNK3n3Jt1Pi+Fa
 TOXE+dOtbkF68bX+koPepi0Q62Kw3VMS+4/LQ4bpnt9R6CTWS2JcoZutXQ99an3zs2TnNz2RCRX
 ySIlVQYxbLnMtPrZbxixbfAvtBZCVpiLEPAISn0ek/PDn6LWU7qMXL2wT+wV8jjiZJmFfvKNBO1
 F59moITxT6WgfHuSY9om9HnuwuZiNJW7FRQtMeIIcIAyWNarEfJ5WXU3T+2B5mxfDcU2jgqIJrS
 6ejfKnMCJS3MJWCOvjVqYKA5UxfXkLYzYNFOUjcArdVQXpzz2tVvZ5oaiWOF4LQcbDRViH+9aSf
 K5VF29U2IK50YoFbT1A==
X-Proofpoint-GUID: yPfp-heutSu7QHUbzONBrYF2TWJ-2gzY
X-Authority-Analysis: v=2.4 cv=L68theT8 c=1 sm=1 tr=0 ts=6a03776b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=68niEd13HyaExDxXyQUA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: yPfp-heutSu7QHUbzONBrYF2TWJ-2gzY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120195

On Tue, May 12, 2026 at 03:26:47PM +0300, Abel Vesa wrote:
> Describe the ADSP remoteproc node along with its dependencies, including
> the IPCC mailbox, AOSS QMP and SMP2P links used for communication.
> 
> The Eliza SoC features a USB 3.1 Gen 2 controller connected to a QMP
> combo PHY and an SNPS eUSB2 PHY. Describe them.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 261 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 261 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
