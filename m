Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F773AA518
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 13:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790514356; cv=none; b=CDuZgje4oSLMcsUbOXbskavKJ7a3GoIa/7fPNyP6iuTI8JH+Smccl2VQOB+IMZAqrcT5lYJB7wr27BDM4rdAWjfLayi1QwTukkVqVEoKLkGuyrqEKO35AiFZ0paA6FSbxFFCxqD5e4IwOHvGpIDweibrlNPjQjyDP0ZvhB6P/b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790514356; c=relaxed/simple;
	bh=5PhNDLHcT1Iw8t7jW4E73wXBcMvAkzi2XT999lFdLh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MZKJ6M9lSaKBrlGB4P2p0na89iyVdmrXU6P4Hp+YhEZBjTWGNfqFfUzEmtc/5sbisie/jTbC8TRYknTKPJBilC9NyB16XMXVWC3mVlPUx3r2UebRegbbsnEjN4oa7hz00dbXc7SyxRPQGI4RGJNGpPJzVTiNj2X1wXtYcpXKNLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C6MAGmwO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WJODZZKf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C6MAGmwO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WJODZZKf"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QGxaWv718390
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 13:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BkXSWtx80akFwCoBF0CHDjIQOF+Xh2PE8+5HXZlOT+Q=; b=C6MAGmwOfdVa2x9A
	maezeYrZhsF9SpMTWajUBPo+2s3f7fQpCsYx77CY/WPaMwziB1n5xB5W8bYvNFfA
	+GBV9wCPfEe/BRpt+feGZJpDdKataviwMaXkYod25/cL+y6uAbaPbv2JLqknjMtM
	WrucOL+nJU0s9UYzCqeLBVO6JoMiXuObY63Tm5UnEwyGCHEIAC2x1OyZbLEkcD0P
	6QUcpeY7UNwfkRenxn2xlaoNymEGWMe9jaW4b5bB6U+Kqe9F61ec4sLwNz+OaDAE
	Bw8kf3NdOEFN1KxIfpMqYhHLmxEh3z+s8TobhFbIxy1/z32i1zTyyR9IaWKpdiUB
	eMFEqw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx526k2sx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 13:05:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530d86d40acso55182621cf.3
        for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 06:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790514353; x=1791119153; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BkXSWtx80akFwCoBF0CHDjIQOF+Xh2PE8+5HXZlOT+Q=;
        b=WJODZZKfo0IqUmb+skQ+0ALeZ8x1wL8MnWJSj6pviVO1Eyj0hZP/4GN/q4Mpi0Zuju
         Ns1jpqx4GMQb8qzIoiO/VNKyg1WeDGhIGeUUPubAmvQzo/x2KaKARPSWqiQRN0cw8wwn
         CRyjkxldUHGv2nAPXPl6rANo6NAafG9oAIm6DCrQYBf1kuFYx7ZqaHi7u//kLOigUzL+
         UO68Ds+95XRr2NZHIbig9O7l147Z1vXgk8y6VVtba3aoSBTP+jHcnT/wbha6MJPMd2Cn
         O7OqNr8tLwekSsmavucM9Zlv9ENut9XuQvKxa4tn6+J2/tUzwaebCDkf8RBEnwC13LZ3
         sUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790514353; x=1791119153;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BkXSWtx80akFwCoBF0CHDjIQOF+Xh2PE8+5HXZlOT+Q=;
        b=YfASaLqi2/W1cA3PqjQVIwXCj2Tp2b0zupgjynRmqe2Z9lvd0RfGIpXZrByvm/GJ6f
         DFLVS8M/e040qAW7vqBCQfTguN7RFDSob5UVv8oi4P2LckgNgNTwndOSlSgPQkLahYiJ
         ScaGFNSlqIbXzdzKMuPYoNRWaxcruPhA7NUvIO0tSP5qxFnF3BNatvdkezNI0lgZB2tv
         rnEpS+d6vSZDexi2C58h1E2tZtW2f8XhvkZkexequkxTXhz6UnqtmNcdmDNk1ku4VJaA
         QKTjLYZeqg+sM/8i5uE2AtBgQjg3uUp+cFGGJoBxXiVMdM+nkEgkrj4klK5tzGNZqesU
         8yNA==
X-Forwarded-Encrypted: i=1; AKwUvBw4dhrfbPQF13cTDp5lP/+nq5ToPLG8vBM2e6Rk+r+hMdLrmzCcITbD2ne4Kx+DS+WCZr8biBygg5yv@vger.kernel.org
X-Gm-Message-State: AFuF++lao4wronCWOHR2uEnB7Y30kzJbtTaudjtGeJSgSPBNG+rjDDRL
	4VAYGmifuQLTkF9f2kV5xEqG0WVFuqCkkPeFN90dccOYtKine6YHNyXz8hyZI+N6vstOcJiLD4m
	vqgxSkpfYHrHw9b+qz6SNcMhqVD0LQ57gvKhEpeklM/ae5taKpq7Lu5e3t7P1RjEa
X-Gm-Gg: AYBFou1ggFMse6b/K6Tqr0JIMCvUwJ2L3XJBaEey8gc7H8nKbUGdbkbe7bFGoEvmUxV
	WQadv4loywGfEQ6bO9vWnWOXLwABc9wFUA0963rlSNWmhYsq8yQJR3socqMAo3y7qHvUf6teSOx
	L7kFk82+2miyOHpBKAW7MzA2vcbPYYaL73tec6P77JBodLmC/SClyYol6TvYK6FQVp6kondUyqy
	cn7VGcO+7zAnQoRFqR0UPwpSmBC0eGOyhckN+NXMeaaFubUX1HVJ4DhzR7NUR3oAAXAGR5Dtyhp
	pmoaSsa+if9Kk9qfPXmcYvbpzoEbNKIYMMKoFcOP6ycHuQvzLdEbRfnHgjPvf9F3Y1UG2hM1bYf
	FWSNXBm0qIXQVlvKJJasjoOMDoa/VOxUIMD1d5iaJZBV8hufr5pT21WtqJbL5/t3H2q6p0U7DD0
	oOgTOi+JVCo0la
X-Received: by 2002:a05:622a:580a:b0:532:d3c2:165c with SMTP id d75a77b69052e-5330dbe7682mr144377321cf.5.1790514353134;
        Sun, 27 Sep 2026 06:05:53 -0700 (PDT)
X-Received: by 2002:a05:622a:580a:b0:532:d3c2:165c with SMTP id d75a77b69052e-5330dbe7682mr144376751cf.5.1790514352651;
        Sun, 27 Sep 2026 06:05:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a64b580c66sm20204111fa.6.2026.09.27.06.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 06:05:50 -0700 (PDT)
Date: Sun, 27 Sep 2026 16:05:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Alexey Minnekhanov <alexeymin@minlexx.ru>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH RFC 00/12] Qualcomm Type-C support for 1st generation
Message-ID: <voc4ie6fcegr3thk5n6dib4pkdxmracch4hhgjdih6pxrq2bfm@lq7mx4flowqk>
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
X-Authority-Analysis: v=2.4 cv=VvS2kO2n c=1 sm=1 tr=0 ts=6ab914b1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=MMZBmsOjQwISAzkKN4QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: kyXHbPfRAjLXe5SIgS312lLptKtYtfpM
X-Proofpoint-ORIG-GUID: kyXHbPfRAjLXe5SIgS312lLptKtYtfpM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDA1MiBTYWx0ZWRfX6gsIe7o58ifA
 +RLlC1BmLos+vC/Op0pM/hKKrJLN4RYIA5wyn60if5mPPGALIaHWtx6WPoUiGOD4NLp16V1bU4d
 qSw/e63B9P4xiQJhHfqTOKsZ/6D+6RDrhWCsEtkye+xHIonGK7piacmskvGgMCWUkySVlX54G7b
 kTED01m9Vg9dHNIhCWRHe/0QI5cT1y1g5zgQ9Rzu4vY9RYPE3YMqDM/XTz/IMFkC2Aa5DqCMrtb
 81fCi1ALUwziFczGDspy2P+ICg2p8drUHrnltzQoWn3I6V9oKC4bK7SnUHC6G9eC4XwZEYYvpar
 SdY0oqQ8gi5h/bWUjuKi7Mg2zQxLxIBymcMXl2ze8TtZzMvEbUl1Ffv8zl2pTg9XDf12osXZzba
 /4xCxPq70jjVfpW3L8XxSParPEeyhcXipL5u2Cy8u5WDBtsNCUjJJBoGZrfKs4RDnZaE+IhU9Kg
 8u3SxofNIR4tpOn8DhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDA1MiBTYWx0ZWRfX4alIes7cTzK3
 URNz10lHg++FX6e3YZvg08nlOdPOIgLoo6ttL4mujoU5OV6Y0yr8GOYh60K+s5myUdq4X7sTKf+
 dRo8I+TY04058X4Kz3ddCHvGXD0891I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270052

On Sat, Sep 26, 2026 at 02:40:19PM +0200, David Heidelberg via B4 Relay wrote:
> This series adds basic USB Type-C support for 1st gen devices, covering
> configurations that do not require VBUS power (e.g. devices using
> externally powered docks).
> 
> VBUS support will be added in a follow-up series after this one is merged.
> Supporting VBUS will likely require refactoring parts of the SMBX charger
> support, which is why it is not included here.
> 
> Tested with an externally powered dock station:
> 
>  - Pixel 3 / 3 XL
>  - SHIFT 6mq
>  - OnePlus 6
> 
> Tested with an additional, not-yet-included VBUS patch for non-powered
> devices:
> 
>  - Xiaomi Redmi Note 7
>  - Xiaomi Mi Pad 4

THis is very interesting, as it will also unblock DisplayPort support on
devices from those generations.


One major comment. As we see, on SMB2 PMICs parts of the Type-C
functionality are provided by the charger / FG device. I guess that on
SMB5 PMICs we will get the same problem once somebody tries to implement
additional charger features. Would it make sense to rework the PMIC TCPM
driver to be a composite driver, taking several components via the
existing Linux interface?

> 
> Credits to everyone who has contributed to Type-C enablement before:
> 
>  Casey Connolly
>  Zachary Dry — LLM generation and testing
>  Max Furman — LLM generation and testing
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

-- 
With best wishes
Dmitry
