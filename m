Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBE7302149
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 09:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774778118; cv=none; b=UBi+I9kG/nJhA4dBYUi6aU8CKqYzn5vcpBkAHDp95cS9h0VCa+MG2a2UVfrNV0Y5Zrmjr9HYQchc/9wrPwCx5skZPTe/JMRHb3FexVYVpAhkiIpvlJayiV8VTPmwk7s0qDSPAQSbQp/OC1k+D1jc0u1Fy1sbnbzvnO721yCAhRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774778118; c=relaxed/simple;
	bh=hKYMUQhPlD+FcxdSRmVqJEFjcEhfYuTKsWc2YQyjzN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=msL2LlT53WwW61j9/nIRW5QFeDg9EbZUSab5jZY6i/foDh6Gh3H2KAwlShBEXXd/KSTIdbHskv0FtjMQ85s/KlZWHoN2vsMs0LTtLpgggdxt8W+ywfWfsvMEVckq87DeivlctzDEzkXfv2QPTVMWW/tJHY+bc+r4maFSC1WwseU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CKNamHwh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bsP4BYYY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CKNamHwh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bsP4BYYY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62T7T5lR1805988
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 09:55:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2xdTDbVwnBwJPE7K6myDip/i4/5A23VxWLZ+PE6E0ew=; b=CKNamHwhspxZYN7d
	hfY/sU4jRhBZpXMyojnulZYqq4L8Gi/2pCJfCVg9UFplwydJisHdpEXx1LJtkmiP
	Ul4Tij5MEE+bHeJpes8SVxs29xp7OWjJR76eWAyhpFfKZejxYUjRmJs6xRx9Jg/K
	Myd8ipYKKKQZ23Wn05o7tUFn+H1keh/xQoN/HS7NMng7KApdUxNtbfADkQptZ6j4
	ixkGbMDwA+XlD8/57KA9ShgGrTPhVGmt9iyDHYHYlWc2ulKLdG9q9L2HNWVA0wl7
	GY73es/J1lLU8+l9HFlRBb/TXY14LzmSzM48XM4uhU+otPfmrCENjqMyyCBjj+Ba
	EWrw+g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6v9c0g1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 09:55:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5094ba09affso104134981cf.2
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 02:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774778116; x=1775382916; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2xdTDbVwnBwJPE7K6myDip/i4/5A23VxWLZ+PE6E0ew=;
        b=bsP4BYYYgGsAteYG1Nn/yaOg1GWn2+02FfQ4IpsnRTRVXZ25ig9Q9s42utGHIpj3l9
         wLnWIgPNC6/p16d7LytKjAAnQBXKTQK1qhO+T6faPo8a6C7Gosssrm0C2mcnUNyDaMNR
         LA72Ygyal07mWy2WLrqWv4tmdtsOPbg61/TDooRAZd+7Hxm69C6Szx7qeEVoK850LIPY
         VVuHs44gUdJ3qVD/EXcEZqzM7dtGMpb/qEaDpuz2WBIG7Plj5RQLWJHh1Ko7M3qzNHGv
         HzrR3fUNImg9bWMLZwSH5lokcEuhnuW7GyYe9vjVKjoryD4YjUI7ZjQPZA2UCe8iKD6l
         OBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774778116; x=1775382916;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2xdTDbVwnBwJPE7K6myDip/i4/5A23VxWLZ+PE6E0ew=;
        b=c65yl00X4UcM4gollm7LF5mlXoUum8UN2hY2nIcyTT3yY2pCF+HSFMqGVMdT6WJZWr
         tBr6imQad2XqyeeQsWUYVrOQItLhudBbGWudn2WMMg0ZIy4UMbi9I2dlhenrkRY0GRZr
         /FroCPebP1GBpfg0ybEzPbfb8BWNYEqIQJWidqOZbsii+i1TID6Ovlv5VdVz/+tWSfzN
         phAVGicavJvXkqLqTUpItDBijlmL81YFCHQccvPkCSEVBqnHuPBmMhdQ4P7JqhwscPl6
         93Ut8vsxQnNvjC2uc7yJE1ElSb40zuc+EUnlOPhzA3a4cJoumg+//vjuM6u0QDI/BqZA
         A3/g==
X-Forwarded-Encrypted: i=1; AJvYcCWD8CNsGdyhYNt7zSa2RuuoZy/34JCiH6S92deRbaS98LprAbN/zZMzBjAzLXTR2JC81vkzbF/GkUq0@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3BRCHR4i3xff366654Ztrz3SCF7g01/EZCk53dZpiC8iwAuVA
	yKtFi0CPR3dmOmJrRyqt3U7o67N7SRt2vkcqy/cbIH/nUy3oi5saV5ruNH3jtDFNSzgXXP+Z0IW
	WT2FLibBW6u7Oc8MpqOHrwexsPS6IzQwE5Tx93J16nZNKshNdh5E+avvoocG6NNSD
X-Gm-Gg: ATEYQzw0d0mDeTQJZfnPhb+qpSM4p66KzEZ7p388qoXPurFavMSB0bWtVZ0QDvrufKv
	K5LyNjfcjFIaalru7IyQNbgeB4MMJogUiDjsXD11GtLoeKgq7XaYvrfau6i62Ip0pZ3d28ZBvU1
	u7ud+wD5p5rGnS1ZIbe3f/Jsd8O0wvJne7/DktiAdkEdEe23hSg2CXvsXGdGZgj2DNfDmV1WFuX
	tLU31ThDMRNcGw4u54GPu4lEznxXdIoHs5ZNgNygTTOLkWXNonLKHpyw2xFM3SpFPianarVONzo
	uEIbkBmV8klTtihuX2UVxZ1OAj3cuxHHteJr5dwfLxnVgDS4bjSZaE8HrNrdDnasVExTCez+d4t
	XwCvdLE2u17Ra/X97K3+ItiNKNEEHUcd1JqoSdU9Pp8avW+m1nq6Wrp6ja8+LLYtIwugeEqiPF5
	ipVOoQKDy8YU1XYLRKVnGY/Nj0DarT/366+XU=
X-Received: by 2002:a05:622a:1c1b:b0:509:4b11:6d0a with SMTP id d75a77b69052e-50ba383e35dmr123128981cf.12.1774778116094;
        Sun, 29 Mar 2026 02:55:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1c1b:b0:509:4b11:6d0a with SMTP id d75a77b69052e-50ba383e35dmr123128901cf.12.1774778115649;
        Sun, 29 Mar 2026 02:55:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c8370dd5csm8686951fa.11.2026.03.29.02.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 02:55:13 -0700 (PDT)
Date: Sun, 29 Mar 2026 12:55:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: pabloyoyoista@postmarketos.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Richard Acayan <mailingradian@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sdm670-google-common: enable
 debug uart
Message-ID: <hbghyf4tj6g6sagmarg2tkps4mxaoo4cqj7yjupucvsepjzquj@e54bw7imsfmh>
References: <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v2-0-53abd9db8f0a@postmarketos.org>
 <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v2-3-53abd9db8f0a@postmarketos.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v2-3-53abd9db8f0a@postmarketos.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDA3NSBTYWx0ZWRfX8Oo64+Y/voCR
 dozMsYQyDeSJygKOjBGYuAyRT9efPsSUsiU2iNk3DuHsorMNHcMnhJHMdkuNshBtp16mAQVfjPe
 lR6A6sohpYahKJwDW/iiVWKlDLyscY8PFfBptDElXmCjsyjHbnYgwfirI4ZsjWkz0ShEWU0/E5T
 zOWHz7FZq2qvoZx14TwsaxKACRFBFXuuEfRjuA/O6E49ZYIh/U+EFkLqEdfDmt4I5/0Q7SQf66R
 Hrzk6hmfqvpDLAZ9FCrpNNs4ZKyrmuqh960mrhl2pDbBuVZxnuFhDo+gMmCn0onClCKDUEuXbwc
 DFRv3uXVX9k66iPMQ2g8JHwnXBC3bnzvgApj2Wex6Xq4qyQlUP19ahxFFG1GwhmxFAURHI1+6y9
 KpkhoG66ETaE03IK42wMhYtmynExzs8YCKSZjf6MXP/wSgE+kLsg4pOsDPCZvBb0znEwcB1yOc4
 90q2pXWWNWifgdLaMDw==
X-Authority-Analysis: v=2.4 cv=EIQLElZC c=1 sm=1 tr=0 ts=69c8f704 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=qxnbJ2uNi6Wp-GEmhAoA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: y8q6bENFrE-9qe4M57hSwil4ym9XNfMR
X-Proofpoint-ORIG-GUID: y8q6bENFrE-9qe4M57hSwil4ym9XNfMR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290075

On Sat, Mar 28, 2026 at 11:58:42PM +0100, Pablo Correa Gómez via B4 Relay wrote:
> From: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>
> 
> This has been tested on the Pixel 3a with USB Cereal board
> 
> Depends on
> https://lore.kernel.org/all/20260310002606.16413-5-mailingradian@gmail.com/
> 
> Signed-off-by: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
