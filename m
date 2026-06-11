Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EEB368946
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781209120; cv=none; b=NfplsfXziTgPCUosoY6hP56vRQzYHstihs0Btr/ZvIF2ZHGQ5Hg2wswMajFyfgdnF80NxhUAw3aI8VFcxA8SYnCv6YVJZHijSDh2P0C43oFR0HbCAQtrwr5fI4gP7PdNC6altlzUIzjFvY6zdRbe3SmWdWNE0lRbHtUnsaDa61c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781209120; c=relaxed/simple;
	bh=DYyGCuBDUK0slA/6RuMYTeuS3GjYvbT22yJ7Ll7B/gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZfojTuix4lW5K2M1PY3tCL3AsXF3DSyp5pZBCtUhltYzcxbr2kw7gKZ3Autak+tbem2N9Q3IweqU92CGGzSAoKZtfAlPnh59G08zE8OwNbl7lPd7ayHO+ecRaYGfGCBpGMxPv0GfZYio5HmicCNG5vp+FIhKGGSYt48JHTxlzx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I2O7Ibk/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aklI5VKz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I2O7Ibk/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aklI5VKz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3Git1510362
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kpV9CXhTZP38LIhNRCDWw+KJ
	MwHc9eylFcIk37TdED0=; b=I2O7Ibk/kfARV7iSNU8AauOIOCcRi4uWwE5wDc+n
	OFmOBKUA+l1tzpdCFuiwcOrabPjVhzcYW6oQVkE7oBCmg6t/+vV43SJWi2vnT3z9
	uNLWiirhQR5UWJw5K8aGlUW6+eUmiyv0OD+MhU6KBhSvH54oJmzpkT6hZya3mTbr
	rgnX9YeBvMk4Mip6hYnMbEKfCLH//gRbTPBZdDqUBiqci5H9FHVY/wh60i4sQltz
	cJsYfVEfuQXBrG60RoJtyM+kcybVXP9ZdcY2pg+O6uZeYRY/4Gp4dMCTxSGYUWu1
	GDv2za2bdmafr0BvM2sYVRYJQQkGLpqkqpD5hKt938xZiQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2u408ax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:18:37 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6798c46f723so88047137.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 13:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781209117; x=1781813917; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kpV9CXhTZP38LIhNRCDWw+KJMwHc9eylFcIk37TdED0=;
        b=aklI5VKz/CVOopdI9zipWIORuIWFQhcdtYtufsycgJF8SqXdpJ8tdxZnl9bsgEK2ee
         8vM7pr8aLj58A2NE9KHcC5hGrupTDjxqqgDJ/k92V7vRSAwvvTcEYAD9y+qLXNNeMZFj
         HjkCxeAALGk8v9366dyjIXBbE8hCiJMVD+2O9q/YK5kWcD+aPFAQuWbg0tuWEibd5Iz1
         O4Jn14ZDKhZTAKGBp8/NadhIaJb1aFxXNSKpBwuDTlVX3wfl4uvkSSaqvmM4sQXNGmsb
         08y+zNMNcT1wdYy151ovMw9QGHN+WRn3J+ddVuyMkmx3+wjYzzjGqzjmoJh5CAjA9ZeB
         xCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781209117; x=1781813917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kpV9CXhTZP38LIhNRCDWw+KJMwHc9eylFcIk37TdED0=;
        b=cZR/EVElVHVsDoHWS0uEbmnAArj3VJt8ccrrzWfK8nT1BDpp/ZRMuIHq8fXc3GamqV
         SCN5uWR/yuhFNRf9Wdrry9FEjZLw2ViYRzcZyFwhRNNwc4zaLrc5o8U4vl77HNh9Mwa3
         1XkkPtgaW9FOS4VkjrKWzm01vxoqct1kBKOgIKD67dh6sTurh7E8GbnVHvpYayWztCuM
         Ea9Dm4U22lXLLWEbZWczV/6ZWJskk6ajwXyVmBT56ZKP6ZV1EMvImH7a1P24TqziiN+o
         uL6fIcNjggDqrJ4MR0JsLxqOFlidjhygZ+L9/qPLaqH45oFkDAv0zTafu57RVOjw4NYl
         pRcw==
X-Forwarded-Encrypted: i=1; AFNElJ/5WeeG6Vrvv7SbFBA+z4QA8yzlOtQPe61X0SmmPw5kVuWm3Rf7t32lx6NiOQWPUqvFOAS6Tm41AyUs@vger.kernel.org
X-Gm-Message-State: AOJu0YyU7WPypxJZRtboP0W+jrYfDhOV8MU9OAuAjEWv/ZeXc1+2fiwW
	mypagCaAK8tJBYg5vWc4GmpPPXZogaHHcSCalbw8bCZxwOoHH39uosGZo1B2+QChZiPfWdG90e1
	rM9kMyuvcc4uSZ/LBrJwooDXYI0aDhezYMeOaLlPwYR4NGF60kdHGwpvfFalKAq3R
X-Gm-Gg: Acq92OEFOnw3Zho4b8hWuEzmgC+/T8yuC0eDDNVna2aSmyzk2oHV3u5UK9AxgnKNb9u
	qcNndkMeH8TMHrkta7US/58Rjdufxv9gcQtoUuVqzkPwR/hJrDdOBBHc2yqGjvne+SUU2fgW6tw
	OowgrsTuI7Wnjue8NgJZs3Vs1bqzI4mNvJR53ztdimJkUZAd14tQLx48YYSeCv+WP8yPLw07VNE
	DzHtcdCunS+tl/nkRVhzpSZbVvAj0rijdJI2BC4RqZWSs8aYkjtjYIIkS73xokU+mboR7LsrFBR
	tPD1YuQyigPCy9SePlRdRFSpdnZq0rGPuCk6SU8EnMne0Uqcgh8y2T5ZdDcjgVyPKXhuAwjxiMv
	oyj1nloJWdlmwwnYig89j8kULFgakXQhfrRjV658w8LrxEj70JGColY9UmwgwuGuC8ldY6hUocy
	PPnAKRclme/A2f7qNc7YdYS+m0T9GrVRHHsJE=
X-Received: by 2002:a05:6102:512b:b0:634:d42d:15e2 with SMTP id ada2fe7eead31-71d5d19c0d6mr3018853137.26.1781209116631;
        Thu, 11 Jun 2026 13:18:36 -0700 (PDT)
X-Received: by 2002:a05:6102:512b:b0:634:d42d:15e2 with SMTP id ada2fe7eead31-71d5d19c0d6mr3018829137.26.1781209116202;
        Thu, 11 Jun 2026 13:18:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f5683dsm197481fa.31.2026.06.11.13.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:18:33 -0700 (PDT)
Date: Thu, 11 Jun 2026 23:18:30 +0300
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
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: Add Shikra EVK boards
Message-ID: <mxtofzlu3nc5ybmrzyb5n5nijujxk5c6dx3tjajdzaj56asyfx@25hmlxhmwx7h>
References: <20260611-shikra-dt-v5-0-103ed26a8529@oss.qualcomm.com>
 <20260611-shikra-dt-v5-5-103ed26a8529@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-shikra-dt-v5-5-103ed26a8529@oss.qualcomm.com>
X-Proofpoint-GUID: DnLs8jBTvyGEj2yJa7QoxQDwH0mfNGYU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIwNCBTYWx0ZWRfX5s4J7NPE4vku
 /9+7kdW0CPE8Ewvgh6VhfMQJGpNVX9HKEQ0QVhmq5wy7ivXWVa1D3WLonUlxdjWZPS3kNTqcSFe
 FfX/tDe2j9JwAEthI/eoCOGlt7oKpKE=
X-Proofpoint-ORIG-GUID: DnLs8jBTvyGEj2yJa7QoxQDwH0mfNGYU
X-Authority-Analysis: v=2.4 cv=N94Z0W9B c=1 sm=1 tr=0 ts=6a2b181d cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=sekFKQr-SxL-p-8QmjsA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIwNCBTYWx0ZWRfX/iblZBIu/iRm
 mH/VkQHJr8DY79o1D0EMO1oIinCaxsaQSpGIMbHlnQnA1P7h0CLWC3gXmkBAbrjtwu4+ONyP2Gy
 XgK1gAUzH8fem6LzfQfVziTMHtZyIskKOSDqZJcCZkElJIJ06UKILPYgU4AU3AJ9B82ccF10IEP
 iZrTpqvb1NEvakn0Tvj7gqea7hIy65LoUCO7z3vVM3Ev8XcaHuGXFndByLOfW5+qJ9e7otOKu2T
 Fcg8mxZbBp20wR3p3FnH5Y1+gUv6e+lElj8hsfASw6oXbDAFvdUT2qDa/4hiuzqpx7Ne35ODD/I
 t2SvDO/USDv4UjBk1/qNKKHTi3uhe50NqG7yJS7VTRNZ2UTlmx361m388knx1H46at4sWytMDNZ
 VWtg/HyNTvRIfwEtykX5dAKT/8uhcn1dzckTyXCXAkRUWea7RZRvfrB5Uia7+ZcwyY1ZjnYXH4Q
 kStzrc0ddgHDgB2qH1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110204

On Thu, Jun 11, 2026 at 03:40:12PM +0530, Komal Bajaj wrote:
> Add device trees for the Shikra EVK platform, which combines each
> of Shikra SoM variant with a common carrier board.
> 
> Three EVK boards are introduced:
>   - shikra-cqm-evk.dts: pairs with CQ2390M SoM (retail, with modem)
>   - shikra-cqs-evk.dts: pairs with CQ2390S SoM (retail, without modem)
>   - shikra-iqs-evk.dts: pairs with IQ2390S SoM (industrial, without modem)
> 
> Also add shikra-evk.dtsi, it represents the common carrier-board and
> daughter-card configuration shared across all Shikra EVK variants.
> 
> Co-developed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> Co-developed-by: Monish Chunara <quic_mchunara@quicinc.com>
> Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Co-developed-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> Co-developed-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> Co-developed-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Co-developed-by: Xueyao An <xueyao.an@oss.qualcomm.com>
> Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile           |  3 +++
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 40 +++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 40 +++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 15 +++++++++++
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 40 +++++++++++++++++++++++++++++
>  5 files changed, 138 insertions(+)
> 

-- 
With best wishes
Dmitry
