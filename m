Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F98361662
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 11:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780313652; cv=none; b=FcPtDSH0anJURNSdOZ/skOO5yb33kmoEAFficAy6n6xMVFy9KN6Ym9+38BbI2Er6LnYNOYn4asAwjFb/Nxn1CQTOXTvciHGa6dEE0ihd3K2vS9yVAHG7lFRj+a1ma/dH/h23U7HDEwA9apHYKsN8IOkjGQGzVmaXt/d2DRhcJlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780313652; c=relaxed/simple;
	bh=8KpuVWQ6jm1r2rEeu3LN8WRKYbIYv+jQSd/1TldiGw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jz2NFwK4mMHhpbiZiXrsBaE80KBYPAKNdFkrTWsAFTgN6iDFwin5vJPasNZgKkWGivzrwI3turUgMVlgpTpeXPIVAX6g9WWPRS1RXqoO300maMLLrlsa24WsoPpE7In09qyPbqIlwVYGQlfd638e9YlZho5kooTBdg78Gdjurng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hGd946rT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CG14OFk0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hGd946rT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CG14OFk0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651BBDIK3128349
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 11:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4Jjqk5PfzznUHaFXGq7GmW+t
	L6JCALGPf3ThF49riC8=; b=hGd946rT0wOrWOdrGu7/KB4ryxKyr6s5qWNbtP4x
	Z04IOx/+Oh4TjtDn3aZYFTYlaCTzOaae7GafFNzHfMf6tZnJiwUtH2/4dSmLFX86
	0SPejkUqvdOGp8/iVCCHrTtfN6H1UbrR3Ox+RhaEfXA9wZ0l320djF471iJX8sPd
	3l7IOf1pZB8KNb9d1+VaKc3XrsuHwpwX92ED3FX+toFbiNceIEFuMXHu+0zIezHd
	FRf4rsVm9teqDbQAmM1/h2I4Fe1Y5gr1pt01UuFOzXidaX6ZOWQU/pMxy7jW4NVx
	ofWkUvOgWHDm0pzvhe5HhdlgKqVYVkscAC3lY/jtHRCukg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh90102p4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 11:34:09 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cfb918a9d7so1774885137.0
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 04:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780313649; x=1780918449; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4Jjqk5PfzznUHaFXGq7GmW+tL6JCALGPf3ThF49riC8=;
        b=CG14OFk0getzBzeKUnFjFOu8tT/BMejrhSAqw2YCM2BzWaXyHwY7Rb5TIlWG39GVid
         LQCHCP8BNsxDxg63jzcOm7NvLc60NxdQtkabs6kJYP8FVaqRsqF64uHAn9332KQ/sczK
         0NlAGj3DQdiTlDPVTyR20qDkFzZihhGtpQkUgTVnynQNNxOB1iiD5l/JALR8PhfP5bQb
         JPqsST2kQPUAceZJSLtz+SeygMF/+iwAi9qSBnuYi8G/3jrJGfRabIxfAIXLxrN9hFOi
         BUwkzJTzUstIhYviVE27Liipgjxx1lRu4LvNRo1y63xsrqWh1ZRYk6fnxhWTy3rwFDEY
         Snog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780313649; x=1780918449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Jjqk5PfzznUHaFXGq7GmW+tL6JCALGPf3ThF49riC8=;
        b=AITau8yxuTHc6rlVF7HW2qW9Sh1C2iwMHi8kmNmuIXEa4hMhW2hVligOQ7/yMH7Wgw
         eyRa6RiTNymhL0MS50MTGMHOym8WiYQJpxnDk8mesQHf2mLnElfaq5uF7U7IGU/DQKPV
         IuVDfkAoNoZ/FsX+vgV1JqftQEXvMNWsERXHSSwcOcij7laIa5p0bCU6v+uQ8TCuKY9X
         v1ON72ftaUVpVF6Bj9vZGjXEgwU4ZQYzD12dHQnXs47BAirddnvc0UtC+Znh2KlldKAt
         k7Jlw/dRSGlYA+VWHOH3K4+vUc10Xet80OyGAN47gDLdoyBRBALvOIwHRxsRfpnZg1S6
         txXA==
X-Forwarded-Encrypted: i=1; AFNElJ/T70bH3sLjxp4R755s3lNbRIFM5XSxZfOAL/5Vf6fFgnf6Qe36W89nTsDWEj2nlRZXTzblCsudiIRY@vger.kernel.org
X-Gm-Message-State: AOJu0YwCjiERrudH06mhqY9P1JKeKr0eUfxbeDXDMd6/N1PwMx8pWMIy
	oJcoQlPgzDwXbRYSbjGf81w+3W3FVGMyLRap7u+2/D5aa0ZfR0MR6GeYDh4hIvj5ozoRM1mqLE0
	tm/Moejzo/TbHdvZb9frdyKDCTe5+i9Rd3aX7ZAzKuJ885VAG2COffZ/ZYhOJad6l
X-Gm-Gg: Acq92OFSYWDc8L7cnrkH2FXQsHK8tOpoEdxJTekDr5HoKucWCRYAxQxnG4hT0+sM0bj
	9Qk2N6z+umGfceFEj6v797SVvTHoPrSnaJJgsaLFFt9iNd703+6Mkcz/1TXNwhMtKpz7l0vxx73
	pJO+wiMzGxm+Yx7rHEmJEtR+lvFhzboDQBTLhZemCb9GTeeTZLvCLxZrbfnwphK22vZ2pu6wHwa
	0SeFqQ7QK70XU7qEZVKAABRpYhn5WFGhE7aYwkJRXXjPqKT6ktmy+P0Sio4VlTj2CSv8QaG/zpI
	GCLzbs4OL9ncyREEeec0f7F1M2suTRxh/8e9kCFWF6kzsZUl615QFgDlvew8JGfM/8WG0W90HSQ
	DEr7jqUxi4LoWQXpJOKAAtONxTUZQLVuL1ATzxAoU8CNMeml+48Lkfs0NYygxrAQJd0tYLDkmQy
	0qArUAVqYBfZIMwEiio0KWgIY0MfET/DZ5AdD2+8V4lVRHRQ==
X-Received: by 2002:a05:6102:2d07:b0:631:8665:3510 with SMTP id ada2fe7eead31-6c68cd84c2dmr4027188137.31.1780313648812;
        Mon, 01 Jun 2026 04:34:08 -0700 (PDT)
X-Received: by 2002:a05:6102:2d07:b0:631:8665:3510 with SMTP id ada2fe7eead31-6c68cd84c2dmr4027178137.31.1780313648408;
        Mon, 01 Jun 2026 04:34:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39659c91febsm20928961fa.15.2026.06.01.04.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:34:07 -0700 (PDT)
Date: Mon, 1 Jun 2026 14:34:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux@smankusors.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH v3 03/10] mfd: qcom_rpm: add msm8960 QDSS clock resource
Message-ID: <4t3vit6et5coeiqhv2kw76qyxki2qfktf2wiczt4gzohri7rg2@eolb7eajunj7>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
 <20260601-msm8960-wifi-v3-3-fec6ac8dba02@smankusors.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-msm8960-wifi-v3-3-fec6ac8dba02@smankusors.com>
X-Authority-Analysis: v=2.4 cv=H6nrBeYi c=1 sm=1 tr=0 ts=6a1d6e31 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=wxLWbCv9AAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Pn3paz4bqnjGj1Rei2QA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-ORIG-GUID: HHIaXJIfWw5lr9A0liP0UZ4LSD7ubrNa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDExNiBTYWx0ZWRfX3LtrFJU0FVQJ
 iQgHks1Up5Iu9yt5jx6Sgi89+jT/L5gZ0AatmPj+wBTCFhwZkGDZ9CVaqNsCUwC7DivcZCWAT0I
 MPKcvEQglC1dvlqjAIFsw30AFhtjIwBT1SKdiDZrLelf570zLgMRF+u8ZJHMgqt9f0OnruC+fXK
 gMaMHP/SFC4Dua4KJVmBX7CfjCzB0C5P+v3m7m8WvDkh1O6V/IslgVAkuD0ZK7vXbJQlxWEJSAt
 WpWkYcdhW7XIVtEUOPPp+3rqBBF+tX1UMA6vgXICnev0t4J6HZes2xKs03TKpPJqHT1iAQmMzbh
 SlOcjWYwdRYcMCOhGBMjrDrdVYDbmmTcMYwkK3+gOSA4vxbe1/92H4RSbDpwixTXwu94cKSCwrc
 nHJaOqatjoDVMf9d2gcrPW7TawxHG9GC79xq2eJxgPlgQWaKaPCzU60e25Wf7b5xouCag0qMdbX
 H6N7sq4n7VTXfIB5eNQ==
X-Proofpoint-GUID: HHIaXJIfWw5lr9A0liP0UZ4LSD7ubrNa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010116

On Mon, Jun 01, 2026 at 03:51:16PM +0700, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> The msm8960 RPM resource table is missing the QDSS clock entry (resource
> ID 209) that is present in the android-msm-mako-3.4 downstream kernel.
> Add it so that RPM clock initialization succeeds.
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  drivers/mfd/qcom_rpm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
