Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E9C3002DC
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781510648; cv=none; b=e5XUgrcESGOxXYer3fY5+O+b0NS1zG21b9Nb6c1P/qKrbRtIb+0JQPNDcyAK2FadV9tDPZQAGQkX7cvRNG7kx5x8NgbR5ck9ZOAQW3OXADe6L2GE6EFjxfPVeRVw4xlc5GW8k4FKm3DkRBD+iZjUgzjlF2f13jpziGze8+NOmi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781510648; c=relaxed/simple;
	bh=306+Dnl51wBPqV9cZtf8UkZPlQZgUUwTx4NzKjshApY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XhT3+gwkOTS00Zel3tCi5NUeoF6rgh8k8rGKE8htaiRq9UGVts6Kox4BOwgbZLyRMLjp2rCIzR54MJUTAJnL8qjvWdbSYE2pDmAgfeji8FqNE8v+jQQ4P2wG4kk/py9/N1WwXD71wNLvkziLxMrGyexQDGRxEPdy2oyWquIqJXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DXRHMoLH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ahSGmyEs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DXRHMoLH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ahSGmyEs"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6ItQv3346549
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:04:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=69HrKwFmXz8riMg7FP9KtF3p
	naP2sJ3u7cfriQzChOQ=; b=DXRHMoLHX+vrQ7nXmhsOc5Loakb5Kvri1bCKc4hQ
	Uv+aHRsWgnIxDpa7w7s/w7QcuF9aD2POvYKMjqe+BNh4z78z58BtLgi/fhPiG4bn
	AWhpwYIF2YmMaz8dHfb4judSrC4hWhYdPsJ3Ytl0FGfiyuJjwsBrmHbyzEgd63eH
	kgOwB7OEWknBID/VNDCOIOiUNZ4DgXIlZMBZCOOR8uynqf1u+oalnetw7u7TWgMW
	c5i9CCViBnGozoQGCEcx5OHgZSHDeQ0g526RPYZqCxvHPrc+3iKPIXeyCB8dYgLT
	dzl7mSRNKawoWdvpLrjG5Y7Nv24ToyZB8npMx6qMsZyHvQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4es0g86avy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:04:06 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85807671b1so1371506a12.2
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 01:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781510645; x=1782115445; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=69HrKwFmXz8riMg7FP9KtF3pnaP2sJ3u7cfriQzChOQ=;
        b=ahSGmyEstd7Dcu3Is5mpsp+u3u987f0L9z7rUWWf6rH171B2SwJVJ3WaLx2a0Tb66/
         8MGeENUHWxuUc8N3G2zcDcsf8YI4wcNP4cy3fQEfQFWg6vdXzMGKC1ROKmMKsgKUh8HU
         d6eYQAUVHousVacHuf2/vXzsM4pxI3VMuiO975DrxfH5QhD2GrX6wHRiON52ZYvB15Lk
         OrCXhm1x7MXbX5zDNwvD3tgjGD8SnXGUiYwa931EahRwBmRzSUChwtc3dTHBVJ+1vA+f
         QJslb0niz9Kt1jR1+r8SFTuOX/RrsGvnWelgM3JkdDmF9Mqj2lwjGcWBEYKW6yO2Ai5y
         z4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781510645; x=1782115445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=69HrKwFmXz8riMg7FP9KtF3pnaP2sJ3u7cfriQzChOQ=;
        b=Vkzygah1EqrBFGAR8e5Zm34v8fxBKZIKl1BCmGF5hRRiUXUO4TKbrqSi6yLpr856wG
         VffI2xmQawZmNNxd8NwmRDBHE++BPf0z/XuU9E8r4zfhs2ylbh2mMd+RGJLLQqQ1/EEa
         JQbt1mbg7QdPs/kbw1HaB0/EVebif5kNWhRZr0bdIK7kJlfCybZQhsM7qDw106s4yIEs
         7S3NK5PsqmoCv1D8XiFEFWGDAk1ACencrApL8sxLSsZwnb1CDyA7H3xu70CyXY3IP4IN
         1tIqaJG8OUTWEYTTB0L4NQDymbZsDM/UptCNUd9dVEZ3E5g7CZ+Ew98FK+OatUPZHhR0
         +7/A==
X-Forwarded-Encrypted: i=1; AFNElJ+pxHsH0AP2QhO1eOM1vkxlfEDWGadBNNkB4EQUSLdvzwZ5vzjbhj7sO3KpHgVJbBEN4Mg3c+lZMhNW@vger.kernel.org
X-Gm-Message-State: AOJu0YxFhnmU3K+k8LcrHG+TwRwBHkWmwTnB+JDfMFJRbOEnAcbP3hZ1
	18VzRfRUj4kMJEe/yR1TNDu4FGsMACArqIctoTKVmzNaIe2edCW5VhtAfyDCdSfb+4OKbbPpLXB
	KwfGYgtPI/Tp0D+NKM1HQrz9k9XYsKo7GiF2o8TVD2m9Wp60vppfukGwfjzEUKPvC
X-Gm-Gg: Acq92OHERaDOfim3QKpfidTIdW7jKkda4BtyhfemOlQ0eo/KEkn5QWSdZqEdllR8vjF
	kXA3WpQJU34VAIHxki/TdJZDTmsPPoOe6jbOwRpNV4+Uo4JhelVxGIp+AP9jQ9hg+0t65u3725h
	N+JP/JhdkaFseP2CLWMZxie3Ym7q3b2SgemnPJAKXR6hDthEAJRBPEuyr/0DKAViGXeyFKb8lri
	nI1bQ+st5//ribYVderXytcL8vr7/8ctIfrWz4orqj0Xp7LHjoftz6ZSY6kEKe3zC8mQVEeThrl
	W3bdzB73fyiu6D6Dq5VpbBYwgqhAC/ZfnOAwf2buzdnBPCEj9mFncDVO/PTD8E2fPYgODRiCwCO
	Xl5atAC+l9Tz418rxYHJs07Ye67gzOHE6dqFQX+wwizRBJAZQ80pF6+MmA6M=
X-Received: by 2002:a17:90a:c890:b0:36d:a510:f8eb with SMTP id 98e67ed59e1d1-37a01846de6mr14273905a91.3.1781510645445;
        Mon, 15 Jun 2026 01:04:05 -0700 (PDT)
X-Received: by 2002:a17:90a:c890:b0:36d:a510:f8eb with SMTP id 98e67ed59e1d1-37a01846de6mr14273878a91.3.1781510644980;
        Mon, 15 Jun 2026 01:04:04 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a2668cce5sm15354774a91.16.2026.06.15.01.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:04:04 -0700 (PDT)
Date: Mon, 15 Jun 2026 13:33:56 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v11 4/6] arm64: dts: qcom: kodiak: Add OPP-table for ICE
 UFS and ICE eMMC nodes
Message-ID: <ai+x7Ovc9/pPTu9f@hu-arakshit-hyd.qualcomm.com>
References: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
 <20260609-enable-ice-clock-scaling-v11-4-1cebc8b3275b@oss.qualcomm.com>
 <184dfbd2-4781-4dc2-9165-66b3617bde0e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <184dfbd2-4781-4dc2-9165-66b3617bde0e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OOoXGyaB c=1 sm=1 tr=0 ts=6a2fb1f6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=FjpnKfaMezcxXxbuv6AA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: UUAHsGlTEcZjshju9ebd_jNQmH5oj5p1
X-Proofpoint-ORIG-GUID: UUAHsGlTEcZjshju9ebd_jNQmH5oj5p1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4MyBTYWx0ZWRfX3lvnI4GRhThp
 r+h64JBxVs2UdMdZIf7UhxhFSeJu7mt5tDpgJFS0xQEBBsEc/gvCCnVJn2XyUZ9Vsp2WSYh1rIM
 OXdWvb1Hmj58BzKX14FBMxN4B8riEjllrwhs9+Sdc/FhpHMgo7ZQWyOzNpWdc+5YOROLNOzLgzs
 llbUU7zYRAwqhEF7zfFS8q/1XZQbpM2Z5xivwbhFJN30sblMgQtkeJJWYuklxJvPF2QdqbFwPWq
 pbBqiewE/VnVuQzJ1qMLmivwokR65s89N8MV5uhxPNxl9WItnORmU0rD3DOb1M7yefrzhW5QENg
 aQkCFeKg9g2PSJHGA0dZngo+StCSkgytMcrLPwBBbnZbhti3DujPkF/12IBQjtsjVxgTG60G0R5
 +7GV4/J2W35jfHP3xMTV8JPyzArs8jIGnbtBBEUgJvtere4BcvbOqVxuJhza9NknGCb/E1E41hl
 tiUAgvWDYh7glsXxhMg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4MyBTYWx0ZWRfX9zRxXPTmh2aH
 iiFAULohOcDVkDfDTlb9UJSQAB94ifKLTiu55Y0TMvZNOqGLt1VrPi0iDdUhiv7pgc+4/4C7MZk
 PWCf8bQVvzgoewa7ptra+n46TMfYhgY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150083

On Thu, Jun 11, 2026 at 05:42:10PM +0530, Kuldeep Singh wrote:
> On 09-06-2026 03:17, Abhinaba Rakshit wrote:
> > Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
> > an optional OPP-table.
> > 
> > Add OPP-table for ICE UFS and ICE eMMC device nodes for Kodiak
> > platform.
> 
> s/eMMC/sdhc
> 
> > 
> > Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/kodiak.dtsi | 42 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > index ecf4790f3415c46781c8e790d7892a41300ee7a0..cd76da7e49d8c664df6a60b5c18418c4e97a3ba4 100644
> > --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > @@ -1087,6 +1087,27 @@ sdhc_ice: crypto@7c8000 {
> >  			clock-names = "core",
> >  				      "iface";
> >  			power-domains = <&rpmhpd SC7280_CX>;
> > +
> > +			operating-points-v2 = <&ice_mmc_opp_table>;
> 
> To align with sdhc_ice(as label name), can we rename to ice_sdhc_opp_table?

Do you mean sdhc_ice_opp_table?

Abhinaba Rakshit
