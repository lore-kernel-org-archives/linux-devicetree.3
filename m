Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407C033B6DA
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 18:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775239889; cv=none; b=sLqQPw0bXxe8HHvbNIOZ3GOkpVXwY7YeWL9bSOtylDEvZyu2Y0byFnVZ+LHpkNQwynH0Yh9Yknr5JAwYYbCLChofvhCm0d7ndCS/IZcePtX9pYfkeoKzffkXQtuSOfqrrxAetmO3xHzp3M5BXp1nm8EPK449X9LnAnineXRi2d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775239889; c=relaxed/simple;
	bh=DzF10D1I+97HjEWxl98Cbs7hOuZlV88rFUr6Iuk5fP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bbYeVUqZ6YyPzfXC+2psr6zKHRDdmgQJp/4p41cchHLko5dF8FpVQR+B5nWV8zETtnFGKbLNs14V1c2ny+evFinDDui+l4YskO7v14KUrXNJezq+I2WBHPnqIZxqqMxaOW96lhqXtgeCTMkz9Nd0KuqL62xik5XC3VtrEDxGAkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BzYT7Vpn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=grb8NrrZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BzYT7Vpn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="grb8NrrZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633FUqBS3449815
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 18:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MtXL2iAOtYsDXiVQNN0H4B4e
	Un0PA2AWtcephXdhd3k=; b=BzYT7VpnNaCzbAEeGMJLxOEOKCN9WybmxMDCSBgl
	tm0MnN5zuc3xv9CpIfjdxv/vl0gFwfGTGNYgOtqm/685l3EscBg12euGOX14t8yV
	34uhKLoV+ADzKfwBj4rb2n8WaaiLMGuQ+n8lFQ/5y8wt3Ij9VFR7SRWWv7+TG6fG
	RxvljS8da59o0N+PAImzYAjF4vZbdL1TlGdMtokuieoxxfCG/s3x9XNVOED1uIEf
	ZEQV47/zgStC6+c0avfZ8DQN9BmnaSfKniwYhMW57KpA9BFVsHdchTuiW59jeBK2
	KaQ6cgOnpyRyLPiPmS0k4Ha2vZGu68ifYnaKbIPogeFoCw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da8u59usj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 18:11:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24308165dso55016395ad.1
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 11:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775239886; x=1775844686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MtXL2iAOtYsDXiVQNN0H4B4eUn0PA2AWtcephXdhd3k=;
        b=grb8NrrZhbEaybweaS1xEyUYbkM6fAam/VVmhHtfVXSzbQewCeeSsr0+bHS6Zi/wKU
         5fzb3gB5p0Ds+3Zyb2kmQYsvXK/MA+ijUNcKheo+RuUdy6SjNPWfLG0+7psHyRO08Ran
         KU+FeTPhI8Dels3XFDjQD8TWssBHwoSlQc00HgRds4VMDKMifXu1FaqvLzhHhrjxyYxY
         ZV1fj3dF8WfFQ6y0yg2UDWDzlD0CnpScE8isuwD6RhvmhHtucY9D185zrOaIu9OGQ0PD
         nQDsLnN+wD4UY+13B1jnqtzezZmDp9q4dEnzR65iAt88rm6+AZcBkDPdqCJLSlpUVEOa
         KN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775239886; x=1775844686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MtXL2iAOtYsDXiVQNN0H4B4eUn0PA2AWtcephXdhd3k=;
        b=Z79qZBtM1SPSlGIyHPP5OEHAmI6oNkclfyAT0uflqMApWuhsjeypVGIVSQj1iTWn1l
         3DzxC2+yfCsMjA/br7WhC7iW26So2gEYAkMNQsKJug5UPtjTMkXx5oQbN5o1cv58Sc4N
         FWatvT7D8GUd0fkoT7uKZ0xW79ErslC+zv4wHJn4chVmanFY/TEwiNtOJDb84+i0unLC
         GBakdPz86d7Sj0c1v9nu3O1G4CunD91kNAB9Ps4Ga4ekRGcJ08TIUf4SlyM8dY5URjUN
         0ydoziUFPEkF8fly8LLaK98AZ5t13bNRvVBjrysBYftuxUIfUO+997P7hTLNKmaVWn3c
         Ucmw==
X-Forwarded-Encrypted: i=1; AJvYcCUi1R28xiEi1Va3BRSGeh6E7GRyOApVgHSMBTw7xg35Z7avfdrw5DunqromfVeD9w+K1YCZ5elk6BQ3@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfif8WAV0cjct4T1kyu3UKgD3X/dvEW2jZvs6vEneigNbnkJA/
	miSRUC/CUHL6mGwRwGHTIPu2xCE0YhQdtFir++DUfdpSlS3dhkHqeXLruwa052siTtjesCtouA8
	0yGyqJ5fdM5AoUIfzKdP6ah7xBpirBQEk0dvdz/aZEdWB98wKTOajDtnnFT8Q4gh+
X-Gm-Gg: AeBDieuAk5QHu14IBdIiv8VVpNfEyA70MMFv8B7yH/4aoo92OxTOPYQ/NQxpmDt636v
	HxPbHd7N3EvkY/+eaStfxkV68/Rj2i255bqZQOZjpySjQJJBaSVe1v94ra2BwdLxm4XZjoRs6xh
	Z/3GOaIETLuHv6V+N2LKH8bvm4q0uFPJPYG9jqsChGP59jJEVtN5VJE89hosEy5XBv5uPxvxx5h
	jB1+QXs36zEV1d162mLDQkDr7Crk1i7GiTaDu23DRxOfswV443UMq60ayl27lNSPBU4f4zEr97b
	cUz7r0e4HkVmBozVRWucYQElVQK/vwUwZtmeE2H7FVJKdjoWPVCORepVdJ16/AotR/IwiLbQ0Kd
	/XFLxgOExJX+EOolIenYWyw5gqso48t7W+52spT/Mdv6QGZ6QvzDRw3FcjXY=
X-Received: by 2002:a17:903:a86:b0:2b2:4d78:eeb4 with SMTP id d9443c01a7336-2b281779e2bmr40739985ad.22.1775239885856;
        Fri, 03 Apr 2026 11:11:25 -0700 (PDT)
X-Received: by 2002:a17:903:a86:b0:2b2:4d78:eeb4 with SMTP id d9443c01a7336-2b281779e2bmr40739785ad.22.1775239885297;
        Fri, 03 Apr 2026 11:11:25 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478bc96sm65435615ad.33.2026.04.03.11.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 11:11:24 -0700 (PDT)
Date: Fri, 3 Apr 2026 23:41:17 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH v7 2/3] ufs: host: Add ICE clock scaling during UFS clock
 changes
Message-ID: <adACxdpwJOt92qLd@hu-arakshit-hyd.qualcomm.com>
References: <20260302-enable-ufs-ice-clock-scaling-v7-0-669b96ecadd8@oss.qualcomm.com>
 <20260302-enable-ufs-ice-clock-scaling-v7-2-669b96ecadd8@oss.qualcomm.com>
 <7fbd9d3f-a313-40dd-9335-799aea5a077a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fbd9d3f-a313-40dd-9335-799aea5a077a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE2MiBTYWx0ZWRfXy+W8hvfQh7Df
 bgPfHOXR11jgOhc9XRHvKWf0R1EJvUcfquZwCdRgR8RuLkNSXbHu/Gy6FvU9JiaZaIsGH+OkCnY
 tIR3WT9RBsgw1IiKDgHmYIeWwolUVsyfRQxWo04gDen+W5Iz0oSZmLBhLfKKNJq9XMgtqlQru/g
 LzWzLrCJfPgL4DGL+nNY43+J+r+3TfbcHyuoIbEa1o+M41+UujLXMxbi0AAFF+jj9qXyQTXMWPQ
 G2aw/Mf6CuA7o6sYeb3MXLbck++YaKcDxvvv/yyF1aD121AMBk2k/QGa/bpt82cJNUowl1uJh+M
 a5NT/cuu2qMqHQyEAqhFN6eZnLEAPu1UC+4BxqdcL5aewWEF+kKbSODnVkJDFX7+UDf0nlwgpbu
 6BQG2SzzxEFtrbTrGnxOWeyvqtoM6Cp6+jD2CGpHN9vAzS+KrTK3Y2SZ+Ph6mtkALwR/FZ+xEfs
 36OghLqiPL7FhJ2nQGQ==
X-Authority-Analysis: v=2.4 cv=W5g1lBWk c=1 sm=1 tr=0 ts=69d002ce cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=wPS2iYinNOdQAA01N08A:9 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: vY5eUeWcceWrBmp6EkMnIMK0r4wfSMHD
X-Proofpoint-GUID: vY5eUeWcceWrBmp6EkMnIMK0r4wfSMHD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030162

On Mon, Mar 30, 2026 at 08:09:51PM +0530, Harshal Dev wrote:
> >  drivers/ufs/host/ufs-qcom.c | 19 ++++++++++++++++++-
> >  1 file changed, 18 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> > index 8d119b3223cbdaa3297d2beabced0962a1a847d5..776444f46fe5f00f947e4b0b4dfe6d64e2ad2150 100644
> > --- a/drivers/ufs/host/ufs-qcom.c
> > +++ b/drivers/ufs/host/ufs-qcom.c
> > @@ -305,6 +305,15 @@ static int ufs_qcom_ice_prepare_key(struct blk_crypto_profile *profile,
> >  	return qcom_ice_prepare_key(host->ice, lt_key, lt_key_size, eph_key);
> >  }
> >  
> > +static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, unsigned long target_freq,
> > +				  bool round_ceil)
> > +{
> > +	if (host->hba->caps & UFSHCD_CAP_CRYPTO)
> > +		return qcom_ice_scale_clk(host->ice, target_freq, round_ceil);
> > +
> > +	return 0;
> > +}
> > +
> >  static const struct blk_crypto_ll_ops ufs_qcom_crypto_ops = {
> >  	.keyslot_program	= ufs_qcom_ice_keyslot_program,
> >  	.keyslot_evict		= ufs_qcom_ice_keyslot_evict,
> > @@ -339,6 +348,12 @@ static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
> >  {
> >  }
> >  
> > +static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, unsigned long target_freq,
> > +				  bool round_ceil)
> > +{
> > +	return 0;
> > +}
> > +
> >  #endif
> >  
> >  static void ufs_qcom_disable_lane_clks(struct ufs_qcom_host *host)
> > @@ -1646,8 +1661,10 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
> >  		else
> >  			err = ufs_qcom_clk_scale_down_post_change(hba, target_freq);
> >  
> > +		if (!err)
> > +			err = ufs_qcom_ice_scale_clk(host, target_freq, !scale_up);
> >  
> > -		if (err) {
> > +		if (err && err != -EOPNOTSUPP) {
> 
> Using -EOPNOTSUPP here works fine for now. But anyone touching any of the lower APIs called by
> ufs_qcom_clk_scale_up/down_post_change() needs to ensure they don't return -EOPNOTSUPP, otherwise
> hibernate exit will be skipped. So this carries a minor risk of breaking.
> 
> Since regardless of whether ufs_qcom_clk_scale_up/down_post_change() fails or ufs_qcom_ice_scale_clk()
> fails, we exit from hibernate and return from this function, I suggest you handle the error for ice_scale
> separately.
> 
> >  			ufshcd_uic_hibern8_exit(hba);
> >  			return err;
> >  		}
> > 
> 
> Add the call to ufs_qcom_ice_scale_clk() along with error handle here, and let the above error handle
> remain untouched.
> 
> 		err = ufs_qcom_ice_scale_clk(host, target_freq, !scale_up);
> 		if (err && err != -EOPNOTSUPP) {
> 			ufshcd_uic_hibern8_exit(hba);
>   			return err;
>   		}
> 

Right, I did think of this later.
Yes, this needs change.
Ack will update in the v8 patchset.
Thanks.

Abhinaba Rakshit
