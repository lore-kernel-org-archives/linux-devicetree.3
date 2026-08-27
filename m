Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDBB389DF3
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 04:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787804959; cv=none; b=fVBsiV3ZidZn8ns1QZQSsd/kzywxYFtYqqMcfG9WQVbhs4USILtLShyG+eDhXb8gi97FmoSBFdkIsfuPcdnSnKGqDJql01+kXV7KIDFTSondJjZqJwN+pqgG7gjqzkZBKrojdNlwFGNlT+gfP1k/xUShYCgLbruj5LKsSboxEwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787804959; c=relaxed/simple;
	bh=WndD0WDFKtkC/iz6HWlwVmqlArMDCQAk82ZnUf/JwR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PBO6+yBZuZSY/T6Vt7BNa7C09qzRiQZ8r8ZGqGqwSlZ7M7kjcDB7Iz9aH8Ey6UgBDyrYsiaocBbY0j784pLERRVfYUBjTZYcL4wy8TP1H2R8zNqWHdANoLX+jl6TstH2m4WJ6xiJ2udzmYdBxMRjhGN6a4WlWOVPIFaJf6aawlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XgXC16Fk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dpo7GHQk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XgXC16Fk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dpo7GHQk"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R3JTBL2731479
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 04:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PBQfXRXdbtZK5RC0SQJwvsCn
	/rM36L4ZzGVrHyQOUFc=; b=XgXC16FktSQa/UqUPSEbVSrpYisyPDeMD2X7EEVe
	JINfReQlMl49naK9CZbIU0IoazGhg62KSI7f8Dr2m56BVInzEj6LPazArqZ4B/VC
	RV5LrHpjaNVIEejYsODazVBneNsgN51SlCS6jkXWzXQWea8ZgvrJI2RK5aij3Ab/
	2ChYg0HO2o6wes2iuK4so2VLdCA0vfdfVccpzGPWJnTdKAeQCmtICwMKSmwaY7+P
	uFfOYOcYsfpt+WXu+aCnsGHLJOOXuvYuYOj0YSq6Ty4y00oojljtNqr/3KCvdI5R
	QYRBAF9FrCvmuOiEcnH218uDDR07vYHPTn74ivrlKntF1g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9x2n3q0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 04:29:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6df0a1e18so27745025ad.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 21:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787804956; x=1788409756; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PBQfXRXdbtZK5RC0SQJwvsCn/rM36L4ZzGVrHyQOUFc=;
        b=Dpo7GHQkhohaZqT1AMIHFa5pDcytSrasgZL81uvlw5SbWiESfnJLm5om1fdPP75MGn
         8xETlQTJY874uFfqJExs48j26sSfGwAe/fzWnO0k5XFwNF6PUtl5ztdsqKEhEoZYkC9O
         H8Tt9jfAVuDItqJlqA/blcgngIgNarseWJHh5SsC1zjSKpLnYJ+IqVEsrNOyZdDLB4FX
         /aDMkL6DSFeGU/yfOHItzRT0uaCiu/A5CF/H8v+IDoJwQZUn6KqSWlOor/ReIjZQWuYw
         YoOXOcp41Hsm/2XDN3v4y52I58R4Xq92QpnElj/rs5yBFxPRdeL10kfDeytmBeuR3y++
         ORDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787804956; x=1788409756;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PBQfXRXdbtZK5RC0SQJwvsCn/rM36L4ZzGVrHyQOUFc=;
        b=rFqqdIrCmtF/oiIQ6tq4jVb3kss1luVMnqXK7lCFeJHLs7/m1/n2aVYralrSNZ6PVw
         4lsceBeTHce/72BO9atN/doJeDuMnxxlZZaHj+oTSEeqcHf5dSTBnvRbdZwUXB7dmYuK
         +PejJxNdlDqvkVv5WgXxKtJJUwiXspvNytil5u7wCnb1LtsTv18yBNfvQ96OEGplvCgD
         T5fDeLliOsqDHN7+NdbVmB30WyHVDX9L9tyY47zAc+zVgUcFsKLnBOPooyMdk48D5kFh
         IjD/Eqcx64MXsxrkcp16zb7e0L1eCo4h+n7Rk+aH2BPosFcYhYGaVhlypZBAyOa1bjg5
         TLJw==
X-Forwarded-Encrypted: i=1; AHgh+RrVjCNI48KaYPcIPOjf/YRaG1ZiAeEtATVtla38+h2dkBAY1Ym4LtH113Z2PrgtUka/aL6ajFcPUAQc@vger.kernel.org
X-Gm-Message-State: AFuF++m9Bh0ZhOqGE06CFJavRA7tjffrrORFrAHuezritlqHVUCFpRjm
	hgUhkbEbF1GTc9890+GKqcGjQ7a0VoXUAsK9EGJl0Eu7O4m7mSVARDHbL0qVFanZ/aj7R53i6GH
	3jvJDdvL0m7Oz05SqLdyzhUsQF3GktMA7+5NLtoJa4/1tp2U3/Dt4Qs0St0e7REdN
X-Gm-Gg: AR+sD13Po+cYdYYt1fdSuP05viMEstRDhF3lzxerlRb5rhSAZtR0M2r4MhzNZwmkGDH
	6wbQLtlHcY0f1mPIkaTpePabfD/sSC1HnEk41YFXT497Wqs5m3MJY/TVbRDylIr9DS+LQBB6PWR
	oWTvUKBBCtI29KBRrcInWOcJab2+HJQ1n4tdsNBUhjcUJzVlGO07pMtmpC89sZHomnZVzcr096G
	K4AlsG+8GrI0UPD5vI5/RLRQwp6JFSn4JqUcep+XjtLyshLZ1usy1l1EudmYmJL8HXTaEfNedrk
	MmihMR6Z72M09JDFQK4vbt+ibuXKAlkswE8Mpf/yVG5CvmqQr+xWgJrYzfwKHdxbBJK8+knQIs8
	wQXKVzt0+I4pAx1TsFf/9smF42+CbnMy5EPQsXRAHIxl6m88rhjtAClaeEcwEmsMcoDxtHJ9/kA
	Y1KJg54sSSAXd8BV15q/oXzvOtwN2hkA==
X-Received: by 2002:a17:902:ef0a:b0:2c9:d88e:f996 with SMTP id d9443c01a7336-2d707ba9460mr232937765ad.9.1787804955895;
        Wed, 26 Aug 2026 21:29:15 -0700 (PDT)
X-Received: by 2002:a17:902:ef0a:b0:2c9:d88e:f996 with SMTP id d9443c01a7336-2d707ba9460mr232936955ad.9.1787804955469;
        Wed, 26 Aug 2026 21:29:15 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d885fb6sm13901932eec.14.2026.08.26.21.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 21:29:14 -0700 (PDT)
Date: Thu, 27 Aug 2026 09:59:08 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] phy: qcom: snps-femto-v2: Move PHY init registers to
 config tables
Message-ID: <ao+9FOzw6d+hjDyB@hu-varada-blr.qualcomm.com>
References: <20260824-phy-v1-0-257d68a3210b@oss.qualcomm.com>
 <20260824-phy-v1-4-257d68a3210b@oss.qualcomm.com>
 <d3d075ac-598a-4b79-8d59-556657edb23b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3d075ac-598a-4b79-8d59-556657edb23b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: T3ZRQji6RNEA3UKOSMF4Q2MFoxCi8eZS
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDAzNCBTYWx0ZWRfX8Z3rWYi4m0Va
 3/HO5JFI+cbBV9RvNxY/DjFsz/isNlX4pjlCN1xM5FXeBR6Qsym7aJZTDehxIjmgD3pUFfuFvPf
 dx4knOB7/mpkRK9MjTC+MpCoxDtp5+s=
X-Proofpoint-GUID: T3ZRQji6RNEA3UKOSMF4Q2MFoxCi8eZS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDAzNCBTYWx0ZWRfXwGvCpAaGT20D
 dxIKkl3n1kFtMv92de9+DoIX39GBZ+afv404809kae7sLl1JmSMwZwW22F8YLGvK2y91UPy+s3n
 /lylb+y4Gm2xRuoxPqxGQcN8eW/+S/VFumRwJ7fy8rjXbvai4uusAPlWyUswmWb2hYPbiUieP8d
 OsyIr6a+3rnlHnRkhCcUjaCK4uWuuEpBQsK8qImxXiKgDG8LCZC6sGkIVT77GtxILg8iGwM5Yp7
 MhCKK5kTf9z5pnuN0YgmohMEKpxtIOvj6Rve/ZUm5CV8UwbiAW3hzs2H0Py/+wI4DRFvAc1jctw
 CjyWv8y6+gVvO2CxXvypT9Nb62W4N2OD6stpv4xsZIp8ign5xUGHTwdWqKjtRcjl3iC1dckTPVQ
 tprccXG8ticw2S4yDxAUAVQBtDsCkP4XN8Y8IoI89jthjh6Wqt2PihPNBLsjG2ZKCNVZTLuX2Dn
 /Wse7zBVVoMlCgZJyPw==
X-Authority-Analysis: v=2.4 cv=PPQ/P/qC c=1 sm=1 tr=0 ts=6a8fbd1c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Bgcfhj6G1kAcdHnFx8gA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_02,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270034

On Tue, Aug 25, 2026 at 10:54:58AM +0200, Konrad Dybcio wrote:
> On 8/24/26 8:37 AM, Varadarajan Narayanan wrote:
> > The driver currently programs the common PHY register sequence directly in
> > qcom_snps_hsphy_init(), with the fixed register writes split around the
> > override parameter handling. This makes it hard to support SoCs that need a
> > different sequence or different values.
> >
> > Move the fixed pre- and post-override register programming into per-
> > compatible configuration tables, and keep the 7 nm override parameters in
> > the same match-data structure. This allows the driver to share the common
> > sequence while adding SoC-specific sequences for future platforms such as
> > IPQ9650.
> >
> > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > ---
>
> [...]
>
> > +	for (tmp = data->pre; tmp->offset != UINT_MAX; tmp++)
>
> "pre"/"post" alone are not descriptive - perhaps pre_tuning/post_tuning?

Will change.

> Or do we maybe know whether the order matters at all?

I believe so. This seems to follow the order given in the hardware
programming guide.

> > +		qcom_snps_hsphy_write_mask(hsphy->base, tmp->offset, tmp->mask, tmp->val);
>
> Custom termination is both error-prone and memory-inefficient, add
> another int to size the arrays

Ok.

Thanks
Varada
