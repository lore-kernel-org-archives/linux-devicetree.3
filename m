Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDBE368D5E
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781209067; cv=none; b=scyNc0/qtFBD9RgIMoJAWUr4WlnwVTaN+V+a2t9QHCJ88uLmMOFJGjmSB5CsTjY5Lekaa91Oc21vaoJvqW9cQept+cfmtXTiZfXnMhtojL3QdCAWJHEZpMnrM7S8Z0vUQ0mhG9w94GLjo4y1R2D9pTueu0tLvHVZpce5FQ/u0tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781209067; c=relaxed/simple;
	bh=DEFzM9pXZjoiCXMOLYWdhHfA61XJJYsjWM9qvuHFVSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AaHCGRMgbu3QNjY1m3t/z+ZYEtG/5jbEWO3uWq2SjsxSIxO0jSsCjQQBPNpnJx1mCwzifMSRUvSrdjMHw2jSfwt0wo27mN7hJSD8ObUPiZcUwYvSSwJWjR5HjJA19+3Y/ha0N4pqS5tw/+BzLVAzpebjB31KwNKgSW5uCNWSzsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YYlqyOcu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f9wjlJtq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YYlqyOcu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f9wjlJtq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3XOW1479994
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9dSIL3f/lhstR7XBW0gRBnx+
	J0TbGOFQQgQzZUkFx2U=; b=YYlqyOcuNltzgMs7FrR3n5oiX34sYCUwZ/Xf9/rd
	MErXAos1iLNMlikcBn46+57ZPygnE+krVxT8qnR9BsKSz0ckkovQomkKHWy2s/bS
	x95D2pDC6KyVWhM7xdBEoB5ul9urTtY2/uoTlj19eRaXfQ1WA5jTF7hl1AU9riAY
	OxE/d1lhp815TCDR7O0p0YmFZjo+Ww6YJZGCBZ80W3VgKO8YgLpjxfnmDk1kfVDc
	xGmhy3Q7kS4xCg/5/PPkpytHAQvWZWSXkoLTU9trGTFlO1JYxeSuMuvEiPsKNLWu
	wegh/cG0LcTh4NoLXxFo/lU/sd0FISzy/F/4fGQz+evuUQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0x7gv9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:17:44 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6c152655acfso5115137.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 13:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781209063; x=1781813863; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9dSIL3f/lhstR7XBW0gRBnx+J0TbGOFQQgQzZUkFx2U=;
        b=f9wjlJtqsevDqeZ//ufLdJAPYCGo4dAsxlYma7OVRNmtrycRO8vW20NCm6q6Bgz4rm
         KozVPQn8X95ZRUPsw09Z2D54WfX5M40DjGNt3pX7Rk/+BpFqxhUhTMnpiWSvorkBHxj4
         omvxRE/vWikFaZju/bcLHif55bVBfbnlShLps2GZjrOFmoqCBOFG2410vUNTcCn7bsVn
         AJU/a35mRYrdLMwC1dBXHdF8zpCA9wZEnVV9ug4GY2RzUHK0BtGafd8Qe1XMTJyUOXCA
         p0hQKh1JlrbX3zKjTwnkuO1KYx+jTQFNlhKVwKulqpw19xCxDqT9Wch0cAnriqiQ001b
         vXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781209063; x=1781813863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9dSIL3f/lhstR7XBW0gRBnx+J0TbGOFQQgQzZUkFx2U=;
        b=hA0rOJnqId9p6O7rQvRW8OvA1/jjgG0tzrjc8bIpehISxw/7CnClC++v4r6XuN/u0u
         4W+xk/YOoJien7arYvlf8Me9fYukYVQk9bKBNs3mi8gF7urfyou50vMQvGPEahIvD+2R
         4xaSHXA7gkuLvm++TQizmV3EjiO/hhEQ92vprk3Gk3piJR/kWgYPPZ3j1LP4mGU2R3hc
         ZOe38DqkuAP25ae0ksQs/VvhwLwFxPuUF2voX1B3f/gw/spm05OGQpHJLtUhSxgWYGFf
         oDAsRs54Mb9pqg04V5q6x5IyaWbSV80VDZ8HVUSNrygM/MDSjRWhtJkHvoJQU++DxDRu
         8iRw==
X-Forwarded-Encrypted: i=1; AFNElJ94XLMGUVAXOR+D96Kobep4XTNukgcVtFjsYO13rgixNWNonwoZchSChonm8h5sIXlTSJYfJEAvDaEh@vger.kernel.org
X-Gm-Message-State: AOJu0Yxok/lBARUhWQ+06PLmWu/r2Wc+3db+VrDnY7buJrbbckCUKTb4
	QTSL+gFqy6apy4gaE5TKgRn1kVM7ra7Q0I+D2966RlU1UGI6PZ4hrLdbAnwwM4l2kJgwT8o0Mdf
	bbdRH2xNT2qC2Z+ECWYCTEi335S8Qrbr91ViqxtgiU5Fgwm/ur3cQuWn7DDU76GdK
X-Gm-Gg: Acq92OHt/Wz0X67UVjaGgSsdd6VNdwBslcC2VxjDX/NgSWTbzKqR09cT+czQBzNGHSv
	LL5X0CKyA2Sjj2ucljy27hA0h8f6hNhET/eYYorJZvF42sDZiz1tzWMtdHqsTTaROgKdg5kdIhi
	z2R9H+52aNxm7pK9CUMlzld+A+eQHxjMmMPX/V2+Tvmk9r4wO9pAy7CJ6rEeL7rfOmg6ZPGxihA
	7lA5kiIFqCuihjer2W9lYOasojykZdhKE/OYi+BFDdh24pnpzyxEDRaneWw0W7EkwjpaNR7W5Ni
	S5L0SW7nufUSNEWxrkFuiyaVazxa+cBmVr1VxGXTfvG8zhQFV/G9k1EEWRcQwIOm+G07cq/cpYD
	pYLtBVQ8a4Qh0SNM5LSNNFSVuG3ZpbxUlzRS28xS41gO1pLlaxsW8ZC/azqx7PnQsddtY50QK9q
	jHCID0v3OkAO7LZ4FA6T5BAPbEvgFUkNBQjFU=
X-Received: by 2002:a05:6102:370f:b0:631:d3e4:efc4 with SMTP id ada2fe7eead31-71d59fe3bbfmr2378697137.11.1781209063119;
        Thu, 11 Jun 2026 13:17:43 -0700 (PDT)
X-Received: by 2002:a05:6102:370f:b0:631:d3e4:efc4 with SMTP id ada2fe7eead31-71d59fe3bbfmr2378684137.11.1781209062669;
        Thu, 11 Jun 2026 13:17:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2cb3f4desm121518e87.29.2026.06.11.13.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:17:41 -0700 (PDT)
Date: Thu, 11 Jun 2026 23:17:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: Add Shikra IQ2390S SoM platform
Message-ID: <37vgpqv5rir2rdunvl27dv5kydybdwehinytow733cmkscue47@e6pnlxwklnq6>
References: <20260611-shikra-dt-v5-0-103ed26a8529@oss.qualcomm.com>
 <20260611-shikra-dt-v5-4-103ed26a8529@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-shikra-dt-v5-4-103ed26a8529@oss.qualcomm.com>
X-Proofpoint-GUID: l--1vuEiSTbEOmi-vcVd8GOhui9ApYEx
X-Authority-Analysis: v=2.4 cv=c4abhx9l c=1 sm=1 tr=0 ts=6a2b17e8 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=MSeU50jLikp4iQrAx_QA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIwMyBTYWx0ZWRfXyntyrUURM76y
 o3difI+7K6ooW3bweLcr/79ZNxMPbUS8MtzOdvHrFGfbMLfX+fhCZi67RZVhSunJd+60Pykozvv
 zXPetbLP0FGiQHMxiEsf8kJ0Mj8PNjhKQin7Qgk9h5Uc03e0f5kK9bnCHiyAj1R3n+uSQcs1Lze
 RwGHZ/9gmpzbTmTmS+CnSuhQ7i2WwJZIY4h6oK/96YIY4L/EGx1V6NQz+UrVviD8JjMJr09Y15S
 Acvi0FuTFVQsIpL3Wso29Wih9y3JwJG12shgb4ZS+Zqg2suKRql3/LVrUsoQDKldAa3whJjkvpP
 iq84zSB/SZoebHQrSUeHXY5TOYc4NqHtfDgHpz3mXBMi2utMcyT0ebefAM8uInLaFpBzjUpwP9O
 w1qXmKy/uzk6nRGwQN+3HN3t4OaLSvzGrQ1raTlpcFEUuGGAMQ5IiTaudrrHwF6vgzhfs3UbyK1
 gPvrfDWpG5KeBkmU+QQ==
X-Proofpoint-ORIG-GUID: l--1vuEiSTbEOmi-vcVd8GOhui9ApYEx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIwMyBTYWx0ZWRfX6RVeBUuauLXJ
 2CH8v+ieR41DxisAT8nwkjBHTr/0Q19lyCKY/E2t5g+tdNzyUD+2VjVKYbnjNjKutkblLy7Z1To
 CF9T94/I9WNaLnUyG4MO0tGc1o1uC7o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110203

On Thu, Jun 11, 2026 at 03:40:11PM +0530, Komal Bajaj wrote:
> Add device tree include for the IQ2390S variant of the Shikra
> System-on-Module, an industrial compute module integrating the Shikra
> SoC and PMIC for industrial IoT applications, designed to mount on
> carrier boards.
> 
>   - shikra-iqs-som.dtsi: Industrial SoM without modem (PM8150 PMIC)
> 
> The DTSI includes the common shikra.dtsi and adds PM8150 PMIC regulator
> definitions specific to this variant.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 170 +++++++++++++++++++++++++++
>  1 file changed, 170 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
