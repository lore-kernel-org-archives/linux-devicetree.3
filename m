Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2B542EEA2
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 11:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783510547; cv=none; b=JV1QdKW4MbZZxewo4CBpmXjIbd8vFHeDuYGR5/1hODWOyapkjWNRJ03bb0a5bhS6ENPn5djh647nDxoWyb4ba5pJC+Azcwx6RmtwWrMmnUty0TZ2Csh3I2E5MQc0MFG0p3c5KU2waOFJGF5wWY2J0ymMdzc5xsaigT2RwXwbtyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783510547; c=relaxed/simple;
	bh=sp7+wcPxRR1h5sGln/Bz23+FdtTKsplubtMIWHT4QBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pF/X8YevY9lkvZF/2UoYWhQ32Vj1+ZBWGPLWxpnC8v/QqIfOgMLpJfrQx/KOEINB0tb0degGZDp1qM0N26YjKSymWZ0pScXFskkgudV0DBHgvNBGMtUPLO+iqlWOIdiorpPc4qK5GKW4XMAb/Kl80WK7vbgANtJYWw6vk1RuVHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FtSBbdb0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IbJ2OkoN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FtSBbdb0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IbJ2OkoN"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668BTSoI2502471
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 11:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ctqeJn+E0TXXAvATaSfD1OLg
	SY1/ELoaG2BLUR5j9T0=; b=FtSBbdb0UUwiA44QxIEUf+XIz2nO3oSqdeS3M9tZ
	XlxeU7vl/qVZd3+bCwoO0r7ItKtkmf8CUb0vVt75YB3+raYdzJlJ8CdeAIlgNH5L
	rjJnkfeZgALFofKVx+TxqPUAkhimPOYeK7FZnfVaMFMY519ZwX6rzu5kmuftzdOg
	EbNEZYMaZ4E8PER1zzAHzTt+uiCN3FRnYGf/B1FX6cCnXC/zZu//9G+HlEx7T8S7
	rJ0KTxsrUThJMYqLwT7bErrmQND9GlkkPmmi3eqEf6ScfaiyDM20UFQ4RJCJ7KD3
	3ZyRDvfL2cFm6k2e1tIL1l2ZgBhhL1SzcH/4HfLtRY69bg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9b5gah0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 11:35:45 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-744e806f474so28505137.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 04:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783510544; x=1784115344; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ctqeJn+E0TXXAvATaSfD1OLgSY1/ELoaG2BLUR5j9T0=;
        b=IbJ2OkoNzXGjuV2o8e9RieNG1sh6dxrydT+8OV/7PtTsUqWYq4aaBV0ItpgSwI/prO
         cEDvpHsW+9w4ZwzXZme8ZT98Rgg6CEit3N7cmCwNnZr5/vqyF6VVWoeIepkpjGy1caEq
         sCQMY6VpGGUHazc5cU2/0/knmH3XsrNVMN//1ATpTKtPvBRexISZoEo8C1Sqz9wUCeKd
         R2pKmJBm+F/E2bEWdGDqOo40iEvukVh2V63L8nxew8dzpmNA5Wp1SZRPkjdTmrYb4pSr
         /sFIFDnqnTsHMg1qX/EsDsarLZ96DYCL25s0qfnGrTYs1pWNiQI+yD6cBuCHeTb4GhlO
         OqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783510544; x=1784115344;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ctqeJn+E0TXXAvATaSfD1OLgSY1/ELoaG2BLUR5j9T0=;
        b=aU9GFJCwLH59fIpyKZFnKHsGfLQWCCr9+qAGsKNI/HC/ib5vfgy/ywm5tcv9d6Znt3
         IeHkxr4dFe/oZ3SfCaJX0PwX1BMB4mx27Dy3D9GhKNNOil6csWh3Bnut3rFgmqAk00hh
         vIV/ARVwPcM5PX/AAaEA6eAb4mafOY7XRMFZXqo5lmcC4ofhrbwPtwbJhl9Ss8RkoOBt
         nAQeDCLRYPUH7+eikTmAKHqtwBshHikXxMeSD1mB8Du0phOz3Pmy+rBsMEwT2ybAgk04
         cfRozuoHBcK5ScRE0lp/joGad1bIvi7FFkOyVbjrRumSpqSlfdQadONiJX8RvozO5g8H
         +HCw==
X-Forwarded-Encrypted: i=1; AHgh+RpIiMX0QVPBHTVV7GSUty7b4PGubKG9lFpCSxZYieqJluud5x+di7FsJ7VmzlZFgF3DG7v36m4vcj3n@vger.kernel.org
X-Gm-Message-State: AOJu0YxhWQpKEyJoo7Nc3oXnOosV1p21ix3ATuXSSTe6I/70OS8q1TLO
	Pn4d8deq15jYbkDfozCC+/RMYf6bRz0jzuHxh45xg65/q+O2PSSRTc9ABMA2t/60UnW9o4ECxY7
	NE8Va61Z1t4/Yhvxt4azIJ5gq3RkYs8Fpujvs3zjjloNlkPLYC820F5cmfnN2OnrP
X-Gm-Gg: AfdE7ckHytYyrzUZeKGmUURNlUaJiHxg0mfClwlfyZyPF0DDWnfTx45xiJdxzo6KhHd
	pI9hLelaPA0lsdp2BHJ8HNFrpOjgubeWPgf48BvTSJ0F5hCPn1cLr2dZLz0h7e/nKWpJyr7Ymyh
	of3nKteUHTFUm2Q0uTUkx7vh8CWwOTImPRZvIOjidz/ygP0ofvB1b4cVfftvBQYr9uj6R960aX9
	rrc0dTIVfW3vedlxpwL2kH7U2MmrPW4E5ONXxKq3Irr2C7CqscmLvbM4zglAPjrJGEyfLTXQy82
	Cn4dpfNdbefAJH1QX4cpXsHW3/XMI4A8MQI8kX8V3pqSi91v8udIW000v/PVgmydMviybq66tvG
	SS1qq7h1nL7ec/8b6WIgkGlRemzvPCZMQy6xezXsU1htAVsRAPTv+6ka8DXWFHo3kcBz5OQ9i+t
	v1r2iXeuN5LrsZyF50Tf+O2zZr
X-Received: by 2002:a05:6102:c47:b0:73e:c6a0:328 with SMTP id ada2fe7eead31-744e0159398mr913500137.19.1783510544355;
        Wed, 08 Jul 2026 04:35:44 -0700 (PDT)
X-Received: by 2002:a05:6102:c47:b0:73e:c6a0:328 with SMTP id ada2fe7eead31-744e0159398mr913463137.19.1783510543878;
        Wed, 08 Jul 2026 04:35:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed1383a29sm4440016e87.36.2026.07.08.04.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:35:42 -0700 (PDT)
Date: Wed, 8 Jul 2026 14:35:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza-mtp: Enable touchscreen
Message-ID: <fgkyrdw6rozuwsklmnazfxoxy5rnochb7asq43hpotz4ajvsmf@nmkt24zsvz5s>
References: <20260708-dts-qcom-eliza-mtp-enable-ts-v1-1-372020a7a86b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-dts-qcom-eliza-mtp-enable-ts-v1-1-372020a7a86b@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExMSBTYWx0ZWRfXw7d2BKsYdcmC
 bGAcG0QU75I6sGI6lfZDIlb5hMBNBQu4uC+In1dr8fyGI/uLz+9PZ2mlbDUncmyzFCVGT18+Rju
 WVzDDRzNGObesWKkM0ET4d1ffn64E+I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExMSBTYWx0ZWRfXz7M+IEdwfC6/
 fAitcfKc/SJnyGMOo0uM0P2nA/t76fIfB+MTzZeEGx2JK9924abM7Ppb+KlClwuNUyMNMabV/L3
 dgVN9g2rOSwEioK9U8+C32j9JvmZTtXdtKPxvs+Rjb6CPFqF3qViMQzq6iapbpgVeh9kQWcJD+z
 E8yjKWAVrgYyPOTwkqILaEVRLjQgBFAZFkuxlQl3pN38xiKI0Gs9zdmUV2A5FbkITNIaUbOi2nC
 Z3oyAYXJMUmSfR8gZW6P5byyhH9Zj08z66rh8y0Qvtc/s5bbXxqRDW0KZqL9/TR/wqDTNoIWKNM
 ZOX6hyq2wz2xvOJ+QVmZxf93ZLE5J7x0XlYcHF7Dq/CcwWFeCSKYNXzIkBgeYieKrYDOLxAaLbc
 vpWX+Dz1OKcRPlfsnStwl5AAAWqz3dRHL94SQH5w5b5AAdGdplWaVopNxkD1nnFMr7MDGvxQzhI
 QNWABVCMCHPf18J4v1g==
X-Proofpoint-ORIG-GUID: WWv_PP5gRbKz64rO7zNjNtoAVXFmU4xG
X-Authority-Analysis: v=2.4 cv=JLULdcKb c=1 sm=1 tr=0 ts=6a4e3611 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=vCPi8hDJYrjmXadnq0oA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: WWv_PP5gRbKz64rO7zNjNtoAVXFmU4xG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080111

On Wed, Jul 08, 2026 at 01:18:26PM +0300, Abel Vesa wrote:
> The Eliza MTP uses a Goodix GT9916 touchscreen controller connected
> over SPI.
> 
> Describe the controller, its power supply, interrupt and reset GPIOs to
> enable touchscreen support.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 39 ++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
