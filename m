Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C1327AC31
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604026; cv=none; b=ndICkVTzsv/pZYhSrLTWMktE9ZV3mSCSe7YaqD2cn8DJMC2I0XWCKI9owsu4kY51YmOaKHRVD1kE1uxjj8gusUHaz3qiNAriKocGVq9HUw72oC6jrlVo7+KWfnuMscTFu3aKR50JMvtJ6RKKb33sqwoN448KPhLAFvPJbW/0w+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604026; c=relaxed/simple;
	bh=1iCLJJpqrL4AOIiE1kNcZnaRP0P4Kk2PCRe/zU210vM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WH+wk1oY+6I7XIqkJXENfeTJaA6osZgV/yNkjKjdBh4F48VkmyfVNrFVvGgEKw/7uXFo6OjdwU7l9azJHNhFS3EADE6rEVrB4cmg3Wl7d+MNHPTSrTd8nDr2wQw2b2hTFDJOuXtiH2Cnk8GDYa5hiB/l/oITGa/v7sjvy/fJCsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=has8LNja; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QQQ+jDxW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="has8LNja";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QQQ+jDxW"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNLpm1626099
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 13:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HGDQxKpfGuynELuUuEDPnfET
	C7Na4BksgET0EcwscvY=; b=has8LNjaLvZGUemb95IqGqRWSuaUtWQFSTBt+Rsq
	aIQiSMwwYUlwSzU79SULrNdeRwtdb519LAfqwtjOCcHoNgxPIAusiqU1OrZJgOzW
	cLE15DBMGbP4X/bRKD3xW4v5YwvTYp6FUS03u256q3qy9VQT0rQrV1vtrHIbN3Bt
	RRtwOW4NQhzEoSPdC4Ma88jO9z9H22FTyfPvUBeCl609zmmTrz6L7PYV33Eh93z0
	5nrwzr1G6TBrB6BIn9VBI8u8eK0nhJMZ6rLwZ506rx7CK79RuEmd2n5yGhqO8QQw
	mTaHiSVF5Yx69gGuwaZguQj/M5WXjcyHokiFHTEAK357Lg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq34u9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 13:33:44 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-738e5b5ef68so298510137.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 06:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604023; x=1784208823; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HGDQxKpfGuynELuUuEDPnfETC7Na4BksgET0EcwscvY=;
        b=QQQ+jDxWI32UOEEz4NXit93xjN6LNClux41+tFIvHq3M09QjWQXlnf3UC5TXpUaa0F
         b3zf551Y+V/o+sRdpf4Rf0C4MbXQWni1WQjReUqOamqk1aaCDNad02WOK+biJgABLNiJ
         zAceVb30lUqw9srAwUm15ZwD+mzeqHHw2CkymZkzSajFixSzU8YiqfIIuSmE9AoDn8tf
         fM3ebxZQI6xcEcLvxH0DE0o12ursmUQHhyzcfmM7SkdwRJi2aqZSF3fAnCsZOl+wbjho
         B3vwLg5NDPCoiHlSMNdpT7YnkXFbXaD9oHX7KumvpSGye2qZkKYTJ95GCOdI0I8CMj1i
         LgTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604023; x=1784208823;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HGDQxKpfGuynELuUuEDPnfETC7Na4BksgET0EcwscvY=;
        b=OKYMeSXovJxTXtXGM4nfntjboTm6ruXDDFG2Syr/DZeMBsHnpGIguJkyrfRXdXXc4E
         hdK/qBU89iEbJB6Yhd6K2BPXnViB1bGsgXjdXvE3oLrpaNrkcr2oxW4HGSUU5KixEFPQ
         vJZk/3PAmFaqMi05u0PHJU95taJRpOs8sVLyzB8nlybrb7oA3LcCYRxNdMQJX6AKZKHa
         ZaBSJwns8kVjKusXk6OsmR294Bd1lQfNkpMKpR35ZNdvlvFVGPNjhyTZigyCbBBJXCBU
         lrNOrdN/1WVb3gevozIKG92iuY/cQMZE1Naf90YtrF6fod3grt2yYQJVR6BJG2z+csoB
         rhMw==
X-Forwarded-Encrypted: i=1; AHgh+Rq4oZohxKkUM6N0o7ubDb3p2I8YlD9RMceMlJP3natZRANtw8SHN83V882Y/91oWKopUbVvxVLX8ZEc@vger.kernel.org
X-Gm-Message-State: AOJu0YzdG5UB+bWWvLcZKtPHybKm2hoNgkRw5ZxMFLw5CG78CZN7gimB
	BpJwEDKSKD5W7n7qqC5FagCeTMk43GM8zYo95LhEYiShHqjQPAGQ9+0byUzi3C3rTwjYhcF8/Ku
	vD1VcitXu5FPEI2y4HIvi4nJw8PXB98vwO09z7nTg/U3Vc1Vmhe3h8JjeKw/2Uwb8
X-Gm-Gg: AfdE7cnUP1J2pc05+f5JoKb2UkImcCISBrgmE4wEyRF/Deh68Cebk2JPhZ9Ow1hqTQy
	+p3ZNxTdWqgoH3w0UFkjMAfpRolzYztFc4nR/V9DGcgLaMh1SIckBavQrwGBwQQNkd/SiD9LyAX
	ke6m+aOUzCe1QcsVOvjBLi5nnkAj7r3BxRJZTsusZFQepw1tCCZdVskMeWpQhzH0cA00HoEzGBd
	8OCUFjUGSeOU/m2UhlAw/x4dh5HbMKOrz53R7INYdS82qWrdt6rn1QVqACrwd8e2cEG4cvwIQnF
	9yOORmUO044eSjqoJXw9NOasJ7LIzh6TKffEtE2Woyo4G6BghxvdYqswVrf26Zf+awtfOUMVQxp
	NoIVuT9OM0H0X0xjDWF9wjEzn6Tcu9e+X2+XL2wmHst4Qr8Q9CgeOQ28hnvJsRaT4PenhX9Wn1A
	jsbIDKgefALy8YU7qJxpHagqPD
X-Received: by 2002:a05:6102:41a3:b0:73e:9fae:5841 with SMTP id ada2fe7eead31-744dff81cbdmr4215308137.29.1783604023404;
        Thu, 09 Jul 2026 06:33:43 -0700 (PDT)
X-Received: by 2002:a05:6102:41a3:b0:73e:9fae:5841 with SMTP id ada2fe7eead31-744dff81cbdmr4215282137.29.1783604022950;
        Thu, 09 Jul 2026 06:33:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b00e5801e8sm1438500e87.21.2026.07.09.06.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:33:41 -0700 (PDT)
Date: Thu, 9 Jul 2026 16:33:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: kaanapali: Add SoCCP for
 Kaanapali SoC
Message-ID: <azr2xlic5hyoli6qtneroygofl3k3mvouigootxti7eyqdimxi@kfdcvufgwrhs>
References: <20260709-knp-soccp-dt-v2-0-6e2bfca96088@oss.qualcomm.com>
 <20260709-knp-soccp-dt-v2-1-6e2bfca96088@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-knp-soccp-dt-v2-1-6e2bfca96088@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: dDNySmoWIMWyojwMfMkhreJ-X54QCOMk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzMyBTYWx0ZWRfX5mOo27A3MKET
 5Paii3OnuanosNmf13RMAcWg8eV19thsK2FDGjRkcMEDEyfVdIFMuGjpDtiIfLeSFE58kcLy+R0
 bs5onhB+aaLkEws6qx6cloTaKgrn9YvKIE4gxTqqKdwE/8JaaZPO0D6IyPxXCfZGC/kwwLfXscH
 q0fccvBNI5yjedtqAB7hI0WXDuG+I7nO0qEVVB7BE3CUxUPRUsWcSQpu0uqLI+I94QYSi4FYvWt
 CILan7lBcggHlBoZcHhH7TFhLrTxFNPVG+xeSPGAiYHQgE91jZ+5jKeT54PjUD70uyiTiYrN/gg
 J35mIajaOQUKplTW1mnbTn04IGjEY/7Lu2SQHevyTg5EhXD2HIm1PU+0ni9wg9SwSrhvxm43NaD
 VnphtV5GKn4XxTC/LdhAN5lEWCV/o7h8X116PAOO1PgRFi03fh9QHAz0nDenIw++xtUpJEAzkyT
 6G3hCCMiD37tkXWjcUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzMyBTYWx0ZWRfX8TiB2pTd3jps
 qphfCuAfMsrgjPKSleRzm9QTb6sQXM18yJ5WAa2YK/OU5bgys9Vew+Bpup9VUMyNMAz31aGwOw3
 JrD1ArnocCE6YorwOzZRZ1bvNeFa9O4=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4fa338 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=3-YoKPAtwUcdJlF2dtsA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: dDNySmoWIMWyojwMfMkhreJ-X54QCOMk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090133

On Thu, Jul 09, 2026 at 01:14:23AM -0700, Jingyi Wang wrote:
> Add remoteproc PAS loader for SoCCP with its SMP2P. On Kaanapali, it is
> brought up by bootloader.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 70 +++++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
