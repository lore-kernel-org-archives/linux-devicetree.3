Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B25F3E556D
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 18:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783448016; cv=none; b=dLV62kiVyVK4McIXbTbchG94ivd7fgHMk1+kNvo8iSxTF6NDAOu/8+6SNvhVmgu98x/YZBusT2RtM/1N2IvEdg/RGF09EVJ1DJOsts9m0lQr1WUaipn1jDMHw//AmPSmTDqDXeZRxQbD1YTx3py+yxwjT5LPFQNfmL5CsBS161I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783448016; c=relaxed/simple;
	bh=O7TeLys+hlkPql6XQz3KimSI2a4UVx/m8erQ9CsXTyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dTkPOn9nx2igqgcmG5mqwOsOG91+YA/SHtRxKqKCMHj3PjExuwaEW8CbeeZ/OxcVqAJw7pqTSFfs0Gb5Y/TlOf0Udv7emCmnacV+z/Y2DOYb9XihJptJ7C6NXD4U6NmYjhT+2gwFL3NNX6eOQFlWWmxQo+TQv6GVsdJPDRxgqlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gduc6Gp3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jKATZFXw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gduc6Gp3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jKATZFXw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667GxYb3187936
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 18:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Yg6lL+ira4Exk3dGLkb6IIqE
	BSIlHykc4beJK4+FcZA=; b=Gduc6Gp3BrtvtyLtlZP7yUCRuZ44QSvAEFID9BmR
	dKaHqvybHIH2rXQjbUSWxn2aOPoOqO35UN3xWak98KifYp82OTKnAY9UTq5+9InQ
	ethqgyuJolfesnx1MxcfdqKR4PokqmMFtHu7EswgzoKKJtIBfJlpwK2LrXQErZL1
	eYREnR6Jf5UcArlFDfpafvHxSZRoXXtbsaaNmp8xxZiOHmJwKHIift5T55B3QzcY
	NTIh/CXJ3dWyTHENOtb4NrmcZIRKR/Dwd/iD255yCGfqvheB+0QZYkhQvQzBUML4
	OoHoGl+it39DNiWbtId8eQZHPah1CJ9R8fu/2Jw/yTww0A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95fd0bq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 18:13:34 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-73a5cef4811so1054341137.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 11:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783448014; x=1784052814; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yg6lL+ira4Exk3dGLkb6IIqEBSIlHykc4beJK4+FcZA=;
        b=jKATZFXwQTmkMz67eK5UYzsnDZe6L93n1KMkIU7qT2JZUXqsuM76U1bPrshHs9cM5C
         n0huIlAtFFq8KKYRMfXQOMFhAyrU+4/40YcvDXPB1muCbjYczFTY95BInyIGkzepjgUC
         eDuTOvjFPIQBxxo5WyA8HGSo280Z4Lsdo6HNOI1WNYDcLnVuRkDl78MzIXS9ovfhWCHW
         X1E7wlM02DK4tqkwFvt43pOUlO4wJNFak25Aj9ybNSZTWjojIW/IUUDR/bn+Zjk1ordf
         ohP+Lg+RqdvSE5mmxFyrpkZzjkBWdAW/GYgUpppFViaSvUwJ302M3THxd87VpE2vC56j
         luQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783448014; x=1784052814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yg6lL+ira4Exk3dGLkb6IIqEBSIlHykc4beJK4+FcZA=;
        b=UcBB8VE5zI73l5O8fmB8xgNYxC2IWvWzMmnjsX2JoN4xgfTa12nrRUVjJhZVN0Y+ze
         LB65DyShozzMIza0pZPDXfN23ZyGZUT3JL7gKN54PPF/tmdi643ON5Ets3zD5FUPCrVz
         76HL8Oebl9ZCSbeO3L45z4BtruuNC0V2sEABTBoc+Ztt1Ary0RyQ+RE8YrYyUc9r6DmW
         iBU8VOSWv4F1YMQRavbSvb+V2j7581VwSBV7lyWjSv+w8UYVc3dusRlt7PJ0fujAYtLN
         xyaGDSiE1BRR+UfX1LK9pUB4YEmhx9hKFa3JFrA79yOfKjjGdrrNYj+2zAPPX+O1Mc66
         bFsA==
X-Forwarded-Encrypted: i=1; AHgh+RrNvxTN+io5JrO0/5M7fnIYHjDY55gNvkcLzBiv/7kl0R4q+UgjkEpdHLKRI+P3OgUzM6RZLWWr7+Ss@vger.kernel.org
X-Gm-Message-State: AOJu0YyJBF9nxA49qlS5yORV9zHnNx9LyvCIKGPr1JlMb1qiaGcU3n4H
	BESyuMWN5I8JtXZHkx72vEXLYdGdRAakBoRxz3lA0Z2XjIPwyOiz4IDDpyMRo6qPuIPwsi52PWw
	QkN55HQITr3l6h2ScQCs/Wp1NaRv5y7TcDCAiiA4OTNKCMr+qG5WcP9RyV0O/ohs3
X-Gm-Gg: AfdE7cnRcO85AhR1D0GnaLROGMB4BcY+JjTTeUiGS1EpMqGRyhWJ6F8edXPIM1UljQO
	NGDCgkIG7AUlqP+hV9SKaok7C6xv0AVgbcPSupeMThkFUNcxVg/Om0wBc6xMvp+Z3+jrBQheHD3
	dEmnINuqyViRKUnkO6WGu0w72tw9KQxV+i2/NFMfP/E952vP+Sj5bDXQh0ZUp6NyPdLMK4joKr4
	1aRT8bX5HTZZtU3RwAP/RuyK/cBnyTlimG2quh6R5kXCVV4Xt5UPTXpREKJqLZRKq0pgrhOy3V/
	XC4DyfCvFky6WfQaxjqMWWuv3bmNZ6GzWsbnXAFpyOwxTTT6gErc+pw7ktXe9ZGeJpFvjbYNgH6
	Jtf1jJQvCydvpqwEVZOW+BNm/lH13ytS0TMCwNnT5M9e60laGMJIjPgA9gIkjWIu4Esuda3j7Mt
	76xJL+GN/7ctO7Dubll8h6qZ8x
X-Received: by 2002:a05:6102:579a:b0:722:a46b:2f2c with SMTP id ada2fe7eead31-744b7d2efaamr3505952137.15.1783448014010;
        Tue, 07 Jul 2026 11:13:34 -0700 (PDT)
X-Received: by 2002:a05:6102:579a:b0:722:a46b:2f2c with SMTP id ada2fe7eead31-744b7d2efaamr3505935137.15.1783448013563;
        Tue, 07 Jul 2026 11:13:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4adf5cf9sm30864641fa.21.2026.07.07.11.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 11:13:32 -0700 (PDT)
Date: Tue, 7 Jul 2026 21:13:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.poulain@oss.qualcomm.com
Subject: Re: [PATCH 2/3] arm64: dts: qcom: monaco-arduino-monza: Add label to
 sound node
Message-ID: <elehtbf2uk5pmxmt7gltafhw3cdd56dkefyk6pt3uawtoleo7r@iogbtibfh6uf>
References: <20260707163703.233405-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260707163703.233405-3-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707163703.233405-3-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE3OSBTYWx0ZWRfX2xpW9S24qlbo
 maZDazpBUJYciYQ06bnyDNko9cvedPse1F9YreU/jVs/8PXT71nelBoV1L90M0SAXUsOBKdYBT+
 uiysx7g2DKdrfA5n2N1HWKYy0bQdM6mpexwAwV1ZV7Zad2PcSmDfag5CDCNnyYAw9EwYRcOpDv3
 ABRoEaPDrC+S/f/e4GMHFj955XwC9+JYDZ4kHWYVekB2Z8RntgqTC2P9SzLR/qMe1FqvnCsM7XX
 gPsLLBjIZCm3udCFqAQAuI4nC4gDmjzqNrrwfQSGf+YTUBuEe8ya78xtncfI2O2XKUMSFanevNV
 vQDcAa8cK2ffUBxvInhFLG+pB6zhYse3EpqphEueE5zVhQZkGUdGGW2s/G8nJ/S6X2Hv1bEHuWr
 ulTP68GgvukrMmhl1zRAeC+T/JTOF8zGRkbDaoiisfEMM5L0l3rzDD5fI333y2TpqMGkrcaZxG0
 bUBh+7JvM5GSfWAMU3w==
X-Authority-Analysis: v=2.4 cv=VZLH+lp9 c=1 sm=1 tr=0 ts=6a4d41ce cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=YRq4iih9PaHNJmzARSIA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: IuCyzaX0xSB5dzM2KB7SnWtd01e46nNt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE3OSBTYWx0ZWRfXzD8o3HVQ8OoV
 gA7WvWcxHsntrSFBU1YEFOB5KNtLrzWs+2UTocj+1nkKJq0rk82Dh7kyVdw2FLo852YtIh/CTVf
 wqGCoAr7oJnEJMdBTILwCt+DttQZxrU=
X-Proofpoint-GUID: IuCyzaX0xSB5dzM2KB7SnWtd01e46nNt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070179

On Tue, Jul 07, 2026 at 05:37:02PM +0100, Srinivas Kandagatla wrote:
> Add a label to the sound node to allow DT overlays to reference and
> extend it.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
