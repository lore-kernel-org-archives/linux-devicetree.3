Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6198922A4EE
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778763689; cv=none; b=mn3MdiL796xzGl14qfFZt9st2lVk3qnipunF+tAs98OiMCwcV46PYFlMmv8m4yHNvPJ/eLsHHLsRHU8So8qm0lTQWQRRn+aBwfOjVHsJ4G9lQZgkSqAFT7aQMN3UGQ0YcAgRl7/cDjGo+sZXq/EmF/zEbQYMzDpje5PdeEkkoRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778763689; c=relaxed/simple;
	bh=GopKziKFwXkKALP/c/zJEtfkD8QeLMTwCEZscK1owqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=USv/NZ9tAMvRshzFlKJyIwD8u5o2aJAFT+Lt8lAn0/DjFrOVLTwgVQXZmt2xKkLvhlCgh07jzeiOisYSMlu3y75HNw9hY3YLsF5I2HQm979fOvVSJ2Uu6KfZ+yA2I7kwjnjla3047MQXI74Pec352HaGiHmKNyqCIsHq0wXS4bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EuV1NEue; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y+bXX70Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EuV1NEue";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y+bXX70Q"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBePV51717706
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zUoC87TXNaQE4Aqaw3Eteqzt
	vR3mU6hzvTnCxp1TRNg=; b=EuV1NEueWRJHyt9/tpOg0KbTJyy1wgMZDjAAhSt1
	+BSMSR4/iglXr/M44xs+F73rG+8zKIBHBG0dq3AvYCbJTuHF+KKeIt7AIBb8Jixb
	duIyETqXKxh7WkI1GGhtz34Ci1mCOhvJaXGTKiQRWFk20dwX+GWWZSrg8+u2NqH4
	4xf4p803iKqK9d/krt9FI2rG0NXHVVvRPshfEUZdXUmROBsjIKS7XP9ux++AnkeC
	KYfbHHVTEqJQNZMXzUiBrRcSaQFmNETqDN9lJg5hgKClNzBJuVfmCdOQht6D6eli
	bahH/yjFYMs0+CmgOhXY6Ssm1pLu133xIEHs9UVmm5M6kw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e57y7hhtq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:01:27 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-69b4c167215so9760692eaf.0
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 06:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778763687; x=1779368487; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zUoC87TXNaQE4Aqaw3EteqztvR3mU6hzvTnCxp1TRNg=;
        b=Y+bXX70Qp6xfnevg1tsIYljRrwAgcfVWNJ75q3Xr8vpoJKgPsp0HPk4sGu2xLnOFhS
         O+zoVlj/1K6eIn9Ri76y/z4tdSvAsUvTzs466g9Zgps1ibAt9oX8EHBcoIaARoL5lkEc
         n4rWQJfHVO6HeZMYYj0wNY8LXcgT5dw7uUaSyB9TBADgrYpY7APLGulqRhvJjwtu9MOF
         f2EbamdGly80atB0QpsUGIjVXgncmubDfRAM9/XrjYI8qt1zIsIk/i17IHCg56aa2z32
         xu9ihR/SHRlLzhaVnOfJKSQ18THrgC/SX1cxWrgzo2L+hoy4BpKGKZ0qo9xhnEEUTRUj
         GgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778763687; x=1779368487;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zUoC87TXNaQE4Aqaw3EteqztvR3mU6hzvTnCxp1TRNg=;
        b=qcoVKpfc8M+sShBfs2zHqQSCTMOOcHp3a2oAS7SIoR+nkS1j0iBrV/K34CP4lnVVwk
         LRVnBe1aySP9RqnFGwMuOivmPPIadhmQtDNsE7DpCL3Ora2PLvJ9d0/2joZv405SwSJm
         xPD//8U2I88wg9s7iufBtY6ATr8EeYRmPfoAKW0TiL4ffLh2ru/i4bRGaJ41RDC/N/pc
         K9ES0xnbg08gwbms1nPJtaZiHNyjqCWkZq30pW3zvbPg+9R3YGR3Y0d98ccbxEsWI546
         qeEJH7gTUy2HDCCinQAZjkA6Tnk/LeEuZsA0URFsnQoKlPGgYDWN+bJO8Vm9alho4VcW
         I8hA==
X-Forwarded-Encrypted: i=1; AFNElJ8rpHYbVqMMCwIbADhbLvSnw7UZVpU3Bg5GoZBmzmktIGykwVwE6L8TcuUV/dpLEu/O5hoNFZ7J2RqE@vger.kernel.org
X-Gm-Message-State: AOJu0YwLUOdcUNVwM1ZQLJtgC6mUHBLgD8jIxlCOnJAnr7yySnpNTeGi
	+U2Uhx1LqUGYOFTQFD78gTJPjGVcBRbyuutia3JIIzHZq9MXs+JvH9eZfRaq3TSRdGJQW/zin8t
	AOQKlVg87PBJ/MayKdnxrRWNK0sVniy53dLb2zP/X8rMlOygmDW+IBj/xZUWd38sF
X-Gm-Gg: Acq92OEAhKe39Yl884wJlqdwFHuJ+FeXX8LLn3O9ryfTonXlBhM9GSafTf+wNnI6U1Y
	CRvkokAP/2arSuhuY6ZyN1OftesoyVehHU+tkDKUXYxKZvNOPHTs1nuF6/ATOO5gE2dN3ukbjk9
	Ox4u2c36omTiCtK3+BzGpOrGmFdOnVTf500PerYUUzlqNuuWBzgkH8fbIWuBCeWVHbWrP9CPSPb
	rYzFEN1NMLSw0mvQt/x5uTo4u/M/JPqVYBukqsFUhBVV8K8EZ4dcRAUfQaoUbAvaQt+IrQxjGO3
	ZNyDYAmf87MmMuTk+gGZzB43NuxHKBn6kDb01omvDoFpRGNqL66OpEPMKn3T+HxBdYGpYyt7bn9
	y4m3mt1PulHmKka5RoHTyv94X+EY2dby8IKU2aQjKw219cKk=
X-Received: by 2002:a05:6820:2ac2:b0:699:b2a2:9150 with SMTP id 006d021491bc7-69b885c933bmr1569153eaf.42.1778763685301;
        Thu, 14 May 2026 06:01:25 -0700 (PDT)
X-Received: by 2002:a05:6820:2ac2:b0:699:b2a2:9150 with SMTP id 006d021491bc7-69b885c933bmr1569033eaf.42.1778763683496;
        Thu, 14 May 2026 06:01:23 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fd62b55f7sm20278845e9.3.2026.05.14.06.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:01:22 -0700 (PDT)
Date: Thu, 14 May 2026 16:01:20 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] interconnect: qcom: eliza: Add SDCC1 slave node
Message-ID: <7mrqg5n5yn3lps63y6f33tpeccj45ifoe2smn266ouciwwzyuu@onttafl7v2dj>
References: <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-0-b1edf81bac3b@oss.qualcomm.com>
 <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-2-b1edf81bac3b@oss.qualcomm.com>
 <0aa79750-ac75-4111-ac82-ad5672157c90@kernel.org>
 <3y7hyzwy7n5yqlmyywyuls374j55i7aqfgyiuabf4tubu7slut@pnhrvqulz7dh>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3y7hyzwy7n5yqlmyywyuls374j55i7aqfgyiuabf4tubu7slut@pnhrvqulz7dh>
X-Proofpoint-ORIG-GUID: 71IwYRZp7Oey3XrTV9lDN96UZL8PafVV
X-Authority-Analysis: v=2.4 cv=UY9hjqSN c=1 sm=1 tr=0 ts=6a05c7a7 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=zvVpzuEAzJinQkndZGQA:9 a=CjuIK1q_8ugA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-GUID: 71IwYRZp7Oey3XrTV9lDN96UZL8PafVV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEzMCBTYWx0ZWRfX4RJzMvxin613
 NsfL5iPQzz3zJ8QpNWHJqyWVWCLfyJGqAxmSAYHNXONguIRKhJBQwLJ48QrY0EricyeX2sc5yJb
 jGXLmCLBFTmmpouCQSAfNSzXQHvB2l19YpR6ziYgWI8ba+ZWH7Nz209e8f38UVDgUISATwGpsuz
 GepPBPLmaAfK45mpriD66Dzc4fMV3IKY4kZ9Iu/0YV5EM5m48lvTDhwqAMUzNzIqs7nk3AsxXlt
 uHQEbuQEGPdFOkUPompVjsTTsbEZZ6I6rie3Dbie45XM2bwBR6I5v5Absn3uH3aVsk98K6Vy8yn
 xtyoXB8ytTjqfGigxPIzXe+VFXxvM6NBlfN6D6Ofp2im3ajsDEQ59741W8RPFUgPZr+wRwcau0k
 3KwV4EveHcFXYySRkZNs0GQ3iaO85zzAg9hIFZAnX6cQslZUbTwq+YVm6wV0+dwTtYbHRWNwBEK
 x0JrlGzu/RMapZ+OjOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140130

On 26-05-14 13:39:24, Abel Vesa wrote:
> On 26-05-14 12:52:21, Georgi Djakov wrote:
> > On 5/12/26 3:18 PM, Abel Vesa wrote:
> > > The Eliza interconnect provider is missing the SDCC1 CNOC CFG slave
> > > node. Add qhs_sdc1 to the provider node table and qsm_cfg links so
> > > SDCC1 interconnect paths can resolve to a provider node.
> > > 
> > > Bump the qsm_cfg link count to match the new entry.
> > > 
> > > Fixes: a39efc80ff50 ("interconnect: qcom: Add Eliza interconnect provider driver")
> > > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > ---
> > >   drivers/interconnect/qcom/eliza.c | 11 +++++++++--
> > >   1 file changed, 9 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/interconnect/qcom/eliza.c b/drivers/interconnect/qcom/eliza.c
> > > index a4f7903f0524..6d12a1c3c034 100644
> > > --- a/drivers/interconnect/qcom/eliza.c
> > > +++ b/drivers/interconnect/qcom/eliza.c
> > > @@ -127,6 +127,12 @@ static struct qcom_icc_node qhs_qup2 = {
> > >   	.buswidth = 4,
> > >   };
> > > +static struct qcom_icc_node qhs_sdc1 = {
> > > +	.name = "qhs_sdc1",
> > > +	.channels = 1,
> > > +	.buswidth = 4,
> > > +};
> > > +
> > >   static struct qcom_icc_node qhs_sdc2 = {
> > >   	.name = "qhs_sdc2",
> > >   	.channels = 1,
> > > @@ -383,7 +389,7 @@ static struct qcom_icc_node qsm_cfg = {
> > >   	.name = "qsm_cfg",
> > >   	.channels = 1,
> > >   	.buswidth = 4,
> > > -	.num_links = 29,
> > > +	.num_links = 30,
> > >   	.link_nodes = { &qhs_ahb2phy0, &qhs_ahb2phy1,
> > >   			&qhs_camera_cfg, &qhs_clk_ctl,
> > >   			&qhs_crypto0_cfg, &qhs_display_cfg,
> > > @@ -392,7 +398,7 @@ static struct qcom_icc_node qsm_cfg = {
> > >   			&qhs_mss_cfg, &qhs_pcie_0_cfg,
> > >   			&qhs_prng, &qhs_qdss_cfg,
> > >   			&qhs_qspi, &qhs_qup1,
> > > -			&qhs_qup2, &qhs_sdc2,
> > > +			&qhs_qup2, &qhs_sdc1, &qhs_sdc2,
> > >   			&qhs_tcsr, &qhs_tlmm,
> > >   			&qhs_ufs_mem_cfg, &qhs_usb3_0,
> > >   			&qhs_venus_cfg, &qhs_vsense_ctrl_cfg,
> > 
> > Should we also add the sdc1 to some BCM?
> 
> AFAICT, it should not. Even downstream doesn't add it.

Actually, in an off-list discussion, it was pointed out that sdc1 should
also be added to the bcm_cn0.

I'll do that and resend.
