Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD74274FD1
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604077; cv=none; b=c7TjRlapzsGm8Ar5t7RxejRdFqYSuU8QR/UBbITdh5xIElkVGLIVASJlMSB0UsDvm1dFP+TyNIRinlhLhfy5jOOm0n/QHI6M/0LZ9My3dZLIX5i33MYPLut6uTU/lQV1q0bqTAuvlBg5Dntv8E8eHgCPrsy7TEfJCOI3+QkPk1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604077; c=relaxed/simple;
	bh=K2T2G7YZiWLfbnn1GVJWqxESyobPigjjzduEmuvYRuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eGu43RTXD+FBx78BI3FD8BSJSO/6nGN4Xs3/9KPilWSDZYM2qAD8snDyXOdAUKc95cIjaSbvI99BiKDskBwH/EHlZL4K0he9m2CIKQ1QxlqHyPh6il4TDOkosmIPOXNp05P0PCkzNpCx5rR2Go9h1ckmXf2sz0wEPo7zhyXBoUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ub/rqc/T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CUFeOqoN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ub/rqc/T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CUFeOqoN"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNSh31489081
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 13:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SCzvZFEyLv6RgTnPfwDuyZla
	L1syzlkWX0WSeE/ZzO8=; b=Ub/rqc/TpnhHS/3VzsYwNHCR0m8a6MZnx3IGIthQ
	GFFTY2dSz1D3gIaGk8NctA6Epy0KHoKfwUP/DQIFudc22XaojktBwVLM+d5i79Q+
	6N8rtGZCene/OmtfHgiYdEgJwTuiCIO7jfAKuNt3v39xS/xUW6qqSW4rwfZ0p3aQ
	C/PLMmTtVi6LSnFhS/6YmIMLtub1AVWO5qds6KdtVps/AkY0q/RmanOXFc9KH2K4
	WgAk0A6Y9YqjvALbGrcYo5VQnFFRLtzFDxlQbByQaRufd6Uqt8C3ZhDcthdGxJHu
	jNbzrZBmK71Godet8KyLsfZXz6HSst4iz/1ZSgrWQNkUlg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9wwfuesk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 13:34:35 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-738d9935e23so365984137.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 06:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604074; x=1784208874; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SCzvZFEyLv6RgTnPfwDuyZlaL1syzlkWX0WSeE/ZzO8=;
        b=CUFeOqoNrV5pPcIEr7oQhT3Et7vQnD1VEx8jl0mDxdXiYhIJrpGkXl4sQTzT/OGAbS
         +Af1kXAMXIU1kDN9yGvvEZq0UwNipYseKOLwpWmqFiy+mBGab1DVZwF1kTC0hvWfQEOy
         gEnThR/cYQOkM28ea/Yu+o2JTjrsU/faTZV75wVYwh8rSueZpnR36bERR1vNJLXwwerp
         9Pg7XwbZXXUzk6shEhK0gtwHqu/buaMOO0ljOiMvYlPlFvHomOzdSRb39mtTQBRNTwq+
         Qr1tS7fiZwzwhXXGMaBqdLw+qQHwZPfH4aCUfwsZR4TYEXyo6H9tBr5bnjiwuAqBrDXw
         /xEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604074; x=1784208874;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SCzvZFEyLv6RgTnPfwDuyZlaL1syzlkWX0WSeE/ZzO8=;
        b=PV45dZHSupmmSZzsnCZc6Wj0gbS+AR+Zl7WO3K4FNl4BI1UGyczpY1eIR/0kQxW5Ux
         3UiPGjDi+nidKGxGf/WMKjmEHtd4xWJzre6f5tagiEFmd+KfVD6mw93kx6SUai0XcBUO
         /3xIOflPTTPsA6JV9PRkqraHAnqC6GwPJRyXX391kTxQ//VmN9l4J97HTvrXL4QE2GXL
         66uImz8AKhAnvTwLYDiQZSOGwibXMJASnj5B/Dkn+VTyGEqiZ1HJ7CkXSHqAXcCfkDBl
         /eWLwCDqf3n8gFQ7rIEwu6kJ8U1FOz/qFZkDLWfD5jhEO9uW5XykZ1f9T3pPImU7F4Q/
         YOfg==
X-Forwarded-Encrypted: i=1; AHgh+Roe7njsvp9iLoaD+1F6gbTlbY+V7yXzZGQomiP/0r2dTvWBvIWcQ6fCFEt7pvpVE3lu9mHT5BB/IuIz@vger.kernel.org
X-Gm-Message-State: AOJu0YyoQp8vRP/nvIrW/fv3HUnb1X0EnCvwBSXeU/gk3ZZUPP171jkL
	+QLzyKZt9KUehaGNca6D1rUjisBQ/PflcsqCNZaz50WwVBzDvVAoxOVLq5KITVt+MkkXGOnDLlc
	xYjb9sky003l+UEA4UDd9snNJSNXS19wR/WWu+wYqTU8RO0fWefwROHk3Q0s9l2cw
X-Gm-Gg: AfdE7cnV+0Yeq0dg9kQGixv0IKq4BVV/QhZ3dK0mgYWy8bPpd8voAxyyfBNkDcNI88v
	OSVgxgG0MADi7sf6JoyT3LSmTknI7RPSD4KvDArqmGbB9krdXGMNMWeNJrH1VuW0ihxcYLM3+j6
	dhLgG+vcJzk6FydGGOpuehLJrTwltv/R200DI1jEa6ohNb0J6L9rzpH8Jp6Yc5zhdI5/IHI18FX
	4QHj1MkT6gwPg67HzAmgEzsuk9ejuW205kVrIi06eNBKtdXNeRW+tCSYqVvBgj0EdcM7qKSdSdw
	sUhvU1BOoJb5LNqy27kaxGbkF5wOZj4XOOzIeAMG12DKOb+0mdpakjj26/ILMMwSk+LARhaPAJn
	5sPsTFGTG5bDsFO91B2LhtKbkuTqg0IC4Dab9kUhiuc3JHUc58V+JEu3xudosLAjuSuYnr8vHIq
	JswJn5e7NhK/cnWe0ZGfWGCUwu
X-Received: by 2002:a05:6102:2923:b0:738:9c79:7513 with SMTP id ada2fe7eead31-744dffa3fa8mr3830177137.7.1783604073906;
        Thu, 09 Jul 2026 06:34:33 -0700 (PDT)
X-Received: by 2002:a05:6102:2923:b0:738:9c79:7513 with SMTP id ada2fe7eead31-744dffa3fa8mr3830131137.7.1783604072873;
        Thu, 09 Jul 2026 06:34:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84ba1b9dsm3373301fa.35.2026.07.09.06.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:34:31 -0700 (PDT)
Date: Thu, 9 Jul 2026 16:34:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: kaanapali-mtp: Add SoCCP node
Message-ID: <smmir3sbtpaqbmaddmkrb4yusjtuthaafmgzckmwqrwrjnrw5x@pnd5al6xdrdk>
References: <20260709-knp-soccp-dt-v2-0-6e2bfca96088@oss.qualcomm.com>
 <20260709-knp-soccp-dt-v2-3-6e2bfca96088@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-knp-soccp-dt-v2-3-6e2bfca96088@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzMyBTYWx0ZWRfX211CUy65RG3r
 JFlY0WTA78oM2aNeUnU0wdN0o8x64mIvQZFoT58nbXeioVFdTlbShBcQK8u4z06qFds55UDBeB3
 OPGskXVhhT4n7BXeZU64TwxNIvFDDmpPp9LeDEJwHt4C2MhUVeR4xMOhOVObDs77UPpi2H5qbK1
 525sE8O8CA92hUSAOvhV9ydFWVsTdkGaXNlfGq0GBn27hbDEH7hyDAe5V6LPO39IIIa/g5cRPQ4
 69n3rnbzVsg/U02JRduK5SLEjvBR+IMIe6Y2jju5U6UOX2H27USCaTi5JjvKzjgxn2zZrvt7sqi
 cu1xx8kv0eYIPJ6egkKQ6ArR7NisO868yMfbvHCOAvaHgQK72KqDrq83Slgqi55wUqvCCbS1zXs
 Qa/fGw0mw6MOvYJPOXnbqfhSb9Tgi8hrwxJcPTEPwrkS/EIslrSehi+L/fwaSuCcAbZKLiA6W/6
 Y01xFBg+eybWu5DnI6Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzMyBTYWx0ZWRfX2RbLMmQ3QeBc
 CwCX1WfaK6YFHUV+wLoon0J6m/4tAwFWABzGMVFmzJ+XK7qqIXg2+DgIh44nMlmbPGwBDm7n5cW
 743mViHI08gIkRV7HOYOLazMEMnbqhY=
X-Proofpoint-ORIG-GUID: 9jZDZS5mbXqvjnAA5riydusHCV1_ioM4
X-Proofpoint-GUID: 9jZDZS5mbXqvjnAA5riydusHCV1_ioM4
X-Authority-Analysis: v=2.4 cv=Krh9H2WN c=1 sm=1 tr=0 ts=6a4fa36b cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=xI9PflpFdleAlTMqXZ0A:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090133

On Thu, Jul 09, 2026 at 01:14:25AM -0700, Jingyi Wang wrote:
> Add SoCCP node on Kaanapali MTP board.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
