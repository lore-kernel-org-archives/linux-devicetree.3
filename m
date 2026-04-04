Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1898E56A
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 21:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775336866; cv=none; b=C5TPoARYVYGHhZUcbnVWVBQsH014jeGwww2C6qh0AFAfSwu14B134U2+5p9Q5JsK8rGbVCaSH3/SCUWXu56cl1fUromnmCXrpkdUGyf+ef9/ncHeMTRyC/byBw7ArUOh/j88arWPscHfm6ugud3speZh/opaJrx+fsIsjk+wcdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775336866; c=relaxed/simple;
	bh=7eu/0u7pGY+lBhiiWNwsX7l/njF8oc2Kw58KXloTqD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a0TStUiYRW9OKYkFrSlY020+/nLu3rRCXzzvlWCUIn32t53qm75/5bwbR0KwA88LO4l1zyfkwF3yDg83uSbhk1mLN3QvnASZFvzMcsZqBV58z2of3ImSC6N6FbUksHNyR2CVMO/llkl3K+644iDUJMoWq74OPEz0aglHKfFHGmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YCJAtpgm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rf9xqeBi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YCJAtpgm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rf9xqeBi"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634JKZ5h1402021
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 21:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j3hsR0HuhyaSEZPjBzwmlPNT
	WNcIt84wryNaoCw6ros=; b=YCJAtpgmfiV6BMdOhObjsEVLqWyOy0qQGpGW0TgI
	sT3qSA3zAtmx6v5FGD4ZffV78rJ+stxnIomn8JiV2DHcul2/648aTJ4c6Yp0Tuzf
	lw6iCNtStaAEdzLB3x44N0nCGlKYsN8IJczXyEer224Cj4PvWoNdi2oxzIvlD7kQ
	cNez3SRYBSkawmJ4IWkiH66fYgxiDXv1Met2Cu0oj7lSqkZrZ5ZRKUGgzMGaJU+f
	ZNDf1Ffw4BPqrNmlVdnZ0ID/b3+n9JtEgQ4h7snpUmGyrzeMEJTBQyOs5Y5CYTty
	Rfk9YYjIXFYld3lsFC4xWf0aL+/EDMwsTFjs0kVyiPbPhA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4datqshewt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 21:07:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so67558131cf.3
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 14:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775336864; x=1775941664; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j3hsR0HuhyaSEZPjBzwmlPNTWNcIt84wryNaoCw6ros=;
        b=Rf9xqeBirEsYcH5uRrTxfxYrl4Yu5H/4aR7B54L+AxBfiz/4t56/IxoFyt6N7JzXUE
         RuFdNXdyfvrFyAWYMRUvne8vO6hYfBoNh/xtG6EjLNR1cQyJyjcnV1wIhGqC1jlO9cLK
         UlG/3NNNWToNRUJTYGqOV63G5urdrtmA3Nf2/MAvQ7q1R7VxyKssokaxqfTt8xNjMM7d
         rMP31XWk0J96c/rkezQ5k93iaWH8dryJ3FCTVzrelg6I7iCrreP2SAp8s+Uamz6NZuu1
         wHlKi5Ta1EPmBmY3PwUM1YfnMuW9E1StestwWnnIzlH9yqasn4uH8Z/AJBNspvjJundU
         30JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775336864; x=1775941664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3hsR0HuhyaSEZPjBzwmlPNTWNcIt84wryNaoCw6ros=;
        b=pw8ckpFv3Pk8lOXNZQ5lGSYQeuVYKs25W0SF+DuJobSHUR2fJLXruvVZY/n74OSkyR
         MxmoDDKdun+Aw0MbCiq8xHR6Jw6MkiEuiTnMtXzejoBgDt6nrtAA0qgZsRzUCmEvlYtr
         vrsfsDFEYUzrqHyn21P/O07eLWHf4HHqxEf7m5tBqBZk5sz2653HWDLi6SOTysWv6m6w
         uPWWLnxuB54HutsiXD77s/CzxO7Qrxjhnw99ClhAJiPS6QjQ6PD7ax6QWlsKb4QybA7k
         aojkfnYgC/w15Ra0Pw3jP7XjvqXxL9ACaMzwLBDwiBRdYRde5lsfnsvUDNuLr5Xilftq
         W93A==
X-Forwarded-Encrypted: i=1; AJvYcCV2izFYfS3bK1OjazkXd849Kx3td0or/aYvdNhjojQXlo5QJma9oQHxXa0O1WTrtpaHchtDDpMDcTff@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+pNnOHUOlc2rY4HdSzW77Qsim4+sJK3FYGL6D4ulFgaBBIYX6
	Ev9NAplSp7EAotJ9wuUVbWhYC2EmsuCgYvfOh6ABP9XX4BF8BVex46Ndt6RbihhQ7oGqlWQYnaq
	59t3vR6JJrDmQRv/uq4laprKaZzAa1x0eb740/xyoXQhoGrL/jASigqj5O+2FeM+5zq370xKu
X-Gm-Gg: AeBDiesxd7m6GtTObBYYqHsLGrlEp/yumI3Y05icdxZ45CxNiGIq8+XOBpTuHNvoBZk
	urmxWcs3i/mfpOH7ORvpyjQBzgq6Uklps59cY+5uJCXPjzPwGa0z4q8GEY62VW2kHdOtOCPtULW
	Prtx67KNlpddTeiP9WmbqwB1YjxvtjJAhDn8lAeNDM7jBc2HZBUbw+eLzmjd0ZKqHap7rSF6Abt
	wk5Suq00vlmq67t/s3Thal0ZPgA9ykcGQsB3ZNOEbcoAkkqttFs6HihabfyN9wua8bTpw6nC0/2
	QMVIxwEaOfwUoq6mxDDh2L84sDz0xSsDOnHv4ybvLR1D2whuZwK+VEeO2LxFLaP//teGTQHyiYH
	pPM9ML/JDAvL829PZB3wgL/VPt5XMN9ZZoA95+48iuXjp7BmVbWkofMgumWu1a1jf8jw4tet5mP
	XMsCFLRn9UWIbwMou2XvA7HvMORXAndGdFeX4=
X-Received: by 2002:a05:622a:4119:b0:50d:5b07:feca with SMTP id d75a77b69052e-50d62c31c4amr113918351cf.38.1775336864065;
        Sat, 04 Apr 2026 14:07:44 -0700 (PDT)
X-Received: by 2002:a05:622a:4119:b0:50d:5b07:feca with SMTP id d75a77b69052e-50d62c31c4amr113918111cf.38.1775336863689;
        Sat, 04 Apr 2026 14:07:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd1fdd274sm22739501fa.14.2026.04.04.14.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:07:41 -0700 (PDT)
Date: Sun, 5 Apr 2026 00:07:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jsandom@axon.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: qcom: sm8550-hdk: update PCIe port label
 reference
Message-ID: <bzbxyduvwlk42yj6mchu2denfvhqemahdeuuwxgzpbz52kmhn5@roukkyhpdbwf>
References: <20260404-rb5gen2-dts-v1-0-895f8fc494fc@axon.com>
 <20260404-rb5gen2-dts-v1-2-895f8fc494fc@axon.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404-rb5gen2-dts-v1-2-895f8fc494fc@axon.com>
X-Authority-Analysis: v=2.4 cv=ari/yCZV c=1 sm=1 tr=0 ts=69d17da0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=h77gEMGJAAAA:8
 a=WW_2m0qt-0cxhXHWDy0A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=PYyYjrCoJcZo81GydsRF:22
X-Proofpoint-ORIG-GUID: HotVgSacszwLk9RnJf6N0gqo7tCoTFYw
X-Proofpoint-GUID: HotVgSacszwLk9RnJf6N0gqo7tCoTFYw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIwMCBTYWx0ZWRfX7SrNUDqfmTz1
 4Jv8e4Wmw7/zr643uAP3bgfyUqkCXUve+3kb6LnrSquN3XgWwrfI+75MR1L59EBGX/jO/hYLdwa
 zBuLHiHN29u4H7Ay6rYuxWdpskszUcYUrf7OReM80Cl/htIK9ZmkSI3eFxx2uYAIdcezyiR8vjr
 BWs/zVlqnkN1UvZimkApzeVqMQHtrc3EPiRbaC8Rq60RXhCeaoa9iDrRBiPcT8z3zQFg8OhFf1M
 WvllvX9Oh7LPHWbUKpn1EkGMM21/rBPld6Rs2mzzu3zIaw/2L629gB6KPBq6mOJ1FxtRYxy9wEk
 ViUp9yOVETTD39mBk9YCFjrCIq2wtcfY1q8DBaxQ4o24jhDO3SiKDjYDEKaBdJuuZpo1ZwAE8Ix
 Iey9FaqIvMG4LD0npeboCWCBEw6JdMJ4HQOZYGqtDDMbmqZ4UYBsewhyHIfR0BcD/7gCFj0pXl7
 nmFEVReJB/l4Jr3R5YA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040200

On Sat, Apr 04, 2026 at 10:50:55AM +0100, Joe Sandom via B4 Relay wrote:
> From: Joe Sandom <jsandom@axon.com>
> 
> Update the pcieport0 reference to pcie0_port0 to match the label
> rename in sm8550.dtsi.

This one (and the next one) should be squashed with the port label
rename.

> 
> Signed-off-by: Joe Sandom <jsandom@axon.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> index ee13e6136a8259d28540e718851e094f74ead278..e821b731bdc496c872703723df02ae9b9b0233b5 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> @@ -1012,7 +1012,7 @@ &pcie0 {
>  	status = "okay";
>  };
>  
> -&pcieport0 {
> +&pcie0_port0 {
>  	wifi@0 {
>  		compatible = "pci17cb,1107";
>  		reg = <0x10000 0x0 0x0 0x0 0x0>;
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry
