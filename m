Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6925361DB8
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 01:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783128784; cv=none; b=gh+C2xpjSuRDZxz+9anMyMcu37Trgmd30W5EbPNXyJaX5J0zTW6s0wBLWFlTh/G3O+ebe4Ydv5hHUuiE2IkaAFpzxOCebPZN651vMz01ZJW9m+KaXB6j8+NH5LLgqZc6qvVXDGf0YafpzDxUkYqxAYTruyeo/kv2Cj6AjoE2SSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783128784; c=relaxed/simple;
	bh=cL20gV13J+1kL8sm+4UZLCloZhf5IQMRz4hwsb3m9b0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S+MEmPZs0/vaOWC/cBSXd2Ep4BeiEwqMNsjm4QFhp4M2fF8UWpNzD8eWEnsOG92Ee9YlP4JgZNT2hsgZo9c3HIMUWF5ap1cSeJtc0TOhrrD0fL3dgi7ouZM7Ei3JLM9ZSCa7XJvRxXW20LMgUoStdFTKzfgnXulXm+7nzr6A898=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GT1DJE5K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zob2pm7O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GT1DJE5K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zob2pm7O"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPnWh888939
	for <devicetree@vger.kernel.org>; Sat, 4 Jul 2026 01:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qPBfOOGxXvjk8V8KWTJiCP98
	Ny3/zANKNhi6DinyuRc=; b=GT1DJE5Kgo8SerFdU5VlkawpWieqvXVVadu1G2pj
	GAqR9mt7G3/onXdkZSqhtQVQrbz8AtTH5CmyUjHXJSpRE+JiH3TVflETqqLzOLq2
	XC/JxdDR/dmClWKJrvB+IsWQDVihNAKy73i3PpKExp80H+FuWXAWfezQXWaBaFyc
	qis9XeEOmosksU10kz6cSn2UX3Vtl17hCWvgxq6imtqBXPi72UDVKO8l4Q6vn8kK
	/+eZOUglkS8Ay4eh4kCNge233UNcsvY8xY/AZYc1eaJQ9IX6sPBxPNsATEheX3tB
	MgqlRHjBtfALQX5c5klnxtaIaA0pxexGMLAAsJIJEACqog==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682bue30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 01:33:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-380b630c505so1378754a91.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 18:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783128782; x=1783733582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qPBfOOGxXvjk8V8KWTJiCP98Ny3/zANKNhi6DinyuRc=;
        b=Zob2pm7O6ZVJZb4ttlJ26c7bFqSzEzwTu/BW5FE26FdFRwVR5X0IYlsxaFdzSxkdv+
         9uDHdwf2VayZzwnaMNiJokP9zNLCbUfZPni+JPizmG4u0O1az3BE0A7HjBPB1uBV3k9r
         gYUu5VDjmM7dYdYu8rcNN80cvQz13Zka2YQeeTuQZTCiYDTqIq29w5AL+phHpg8lCsDc
         YL5HrxoD4i/dwL8j+QGgtmOrpmg7TC5NTKIaOOMpWcv12ua8mEhZsqhMiLte6mGT4p5/
         922tHe1oY7OviP7nMKi9FeKJzP2MAHb0I+xVJg4TCNXnn/0v/TnBAhdzSL60EQmLlktk
         D+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783128782; x=1783733582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPBfOOGxXvjk8V8KWTJiCP98Ny3/zANKNhi6DinyuRc=;
        b=c3DEho3+ikFZZu/zMZ70YNipt/6U577fQAcL0khy2U9cEkRStl9rsjhSzHZh+xjtRA
         y5f6YFiPtSDh9M1IDUYtCYJvKFl7+yKkaLbPj81FKYFaRWQVuYTOyvmcXQMefB90pc0l
         dcSI/gv5uNjx7ZnM8g/CiNJklUpDxMufWCkMmudtQGvIczSOv9XOyH7lkKtSeN0BToOm
         DvxNfv60oQfwfIaDPq69jL5EEB+oaYRTTHwn76og6MgUyXRevtHy9OV4futc1KhHjB4X
         k4IRhrliM0RcUOa0V38O3+f5LKRGZivC3HzC2UjxN1xzeC3Su3rshyUJsH6lXVFcJ8Gn
         82Gg==
X-Forwarded-Encrypted: i=1; AHgh+Roe4/9IyYM5Z0apiwXEsYjBKX8bJpxytjSoKJiOYfT51ucAHMpJijFDKIUP21jU5lNV2zsPO2/nlz1W@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8IAVVdVta7oafeQnl9D0TRNq/9cZL3GQR2tNtBjpWr+dZFair
	8EvUcx2jBgPUcX0V6TXlIk+cqaz/+hysUzHClm99PHldbAhBKUN/8nB2sDiJeOyfzI0f++YeQZr
	B/nRFF09R04TtQVz1+VPBPQLRKtMk6TPTmorevEAuHN1zLPS/7Dd6nBQ8ScCQJECskQ6bGYHM
X-Gm-Gg: AfdE7clMdNbqXiu7/7TxBaH/B0NcvYHKSgyIGsa3VvBRgbpzFmir/n/Hm09+Nx49mTc
	ZMHlWiD95cAF3GxK0qfoBLo/oeCjZMnAhgnY5utmD94eqJ+UYUgJR/Ph7v5ksDloHdsHuoXFw+P
	RbEgePHmu6jgbx6FbRg0DdjQw2IoEXpCeQwWIF0BDDAy8hP/a//NVSZ8JgHjub+p6ee7StKNjCk
	oXRG8jEjDbc2A8wyIGiKnqJ9SfUAOVGzkeqhbg9cJU8qJNLnHLB7TVBuJx+AAZOtiZPZxWaWIsZ
	CV3GoWOiPNP5vzsEtlXErMldVbsT52l37KDzvvWsxBz3qKc+WO8/ZPKZxc4y61af3JnlYbET3fw
	UTXCiw3UrwIrLNzQ39mfUlb6Z9AXTpLWAgxicjHJdIFMneJfDmtszeA==
X-Received: by 2002:a17:90b:2e48:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-382803b66famr1755744a91.2.1783128782103;
        Fri, 03 Jul 2026 18:33:02 -0700 (PDT)
X-Received: by 2002:a17:90b:2e48:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-382803b66famr1755704a91.2.1783128781595;
        Fri, 03 Jul 2026 18:33:01 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f3c8b19c7sm5776851eec.4.2026.07.03.18.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 18:33:01 -0700 (PDT)
Date: Sat, 4 Jul 2026 09:32:55 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 RESEND 3/5] arm64: dts: qcom: Add device tree for Nord
 SA8797P SoC
Message-ID: <akhix2qrSBp4elR3@QCOM-aGQu4IUr3Y>
References: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
 <20260526051300.1669201-4-shengchao.guo@oss.qualcomm.com>
 <0355cf52-b9ca-443e-88e7-2e7457e4b576@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0355cf52-b9ca-443e-88e7-2e7457e4b576@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAxMiBTYWx0ZWRfXy6xI9xXi9agR
 0SysTXlnMJerSXI1+NNnmIV7wK12WydkdG2mWEaujwdZN+nwGyHTh3rH9xSJxUPIZXyZoYG3mYa
 jkwGr/cYEDdqMwa0MEwG429cwU/gOLmxfVbWhOFWR9bmMQ7IKECjCy7ILR2nS+LpWTZwyzQarHG
 p8If3rtHZpuorNKT24qJ6xlxRyMR6SSJlsaDVhT7n52hj3a6IH7tqV9L9eDlyUJqTApqQoxxPWD
 c6MewrRHR9YDuuxYoX6N7ocKtXvxmTi+CwMjCAWT5GDzVdZc0bW0RE+ry30OpRDVJmgcFPqJAEr
 yPBV+Vp+2S+UyD97HzaOVqpF99HRjeZ36ynrIPKEJR6JoJ9SEvL7kM/ffnrQarDB7HyHmNwH2xF
 rzi/S66cuuofPLg5+bG5hfQPdKA+XoeBuDrOfXgx3jyzHI4kBgY3baya7uTc7S9X2IvdIR1K4P5
 idbHy6PfZ1CogFdtJ2w==
X-Proofpoint-ORIG-GUID: BCyAz6YdzptpbYbutY_Upo2GY10W9n7D
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a4862ce cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=WVMw9i2Su9l4J9phZI8A:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAxMiBTYWx0ZWRfXwHlMpxUd8ZpV
 ctCAjMgmvfecmhnszqBJVmcXNhTIVZLpmp8daJIWwNK7Kn+/ERsu7HwwyBduLjH99JbTuKUKLhc
 cUuDabnjhqlxvvJTSZecZAygF9ngK+A=
X-Proofpoint-GUID: BCyAz6YdzptpbYbutY_Upo2GY10W9n7D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040012

On Tue, Jun 16, 2026 at 01:00:32PM +0200, Konrad Dybcio wrote:
> On 5/26/26 7:12 AM, Shawn Guo wrote:
> > From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > 
> > Add SoC-level device tree include for SA8797P, an automotive variant
> > of the Nord SoC family. The dtsi covers:
> > 
> >  - 64 SCMI shared memory regions reserved at 0xd7600000-0xd763f000
> >    for SMC-based firmware communication channels
> >  - Three QUPV3 GENI SE QUP blocks (qupv3_0/1/2) with UART controllers
> >    using SCMI power and performance domains via scmi11
> >  - UFS host controller with SCMI power domain via scmi3
> > 
> > Also introduce scmi-common.dtsi providing the firmware-level SCMI
> > channel nodes shared across SCMI based SoCs.
> 
> "across SoCs with GearVM firmware that utilize SCMI for resource
> management"

Sure!

> Is the scmi-common.dtsi actually any common? Are e.g. the interrupt
> numbers going to be stable?

Yes, from what I can see, it's completely common for Lemans and Nord
GearVM variant.

Shawn
