Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0416538736B
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 10:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778755170; cv=none; b=dKjnLDPwfm2iMlz8v5nb1K9VNvnJ8Uxr8sZ/OH5hFZJyFEONJ7xJvLcV0Sujh8RedbkJMI+boaYIYiEE60/sIWhj+bPbBcSTaYE3gz3vrU0JlqWU6q+lOnwbuBRNnra93WcQAstyN41ljjS9cpt12F8GUILeBgpWULdyAdOmftk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778755170; c=relaxed/simple;
	bh=4j/OyGyzRIFpfmHklIZLkb/mrK8Ret5rKH1Vllo1txk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CqY5Mke/C/2WJFL9LJuL71UPlfwKOF4V0SkmACcUjpp7GuyY/fxu5ALpGonB8mqorGJj/ZrVJulE84p1lUz71cYtr2trpxmdhH4wlj/YeSo79f4rOG3ObK9QyfA6TtcFX+CaIAfPwUtr/7FBd1Byw1h/9fG6aL9pu1/O/3oJJpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GnS8Xbd+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vw7q9it8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GnS8Xbd+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vw7q9it8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9kMp52305630
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 10:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YKKtXydJLY5oM1H79u0eXKzT
	3x+88CSw8Xginv6rtvs=; b=GnS8Xbd+vBLVKs6O95srzBdWHgcSf88+h6ELb63j
	pURK2ToEGZoTUAgC/Fr5nWMXCIvdajfv/vEN9jgNFXjMtsikqGU8B/yxy3XKbJiZ
	N7vGG25La8gqXpwv77zUNnY9HYDycNuHIILd0K5CiO2gsKHzCDPxSfkvRlWG/vE7
	yKyaC11TM+bCg9j9Huo5nDw4CygWTgS+TI1jjKg2q/fwtXk+aiyRvMRXL6/WqCfM
	2CPflu12FhdrZfFx7CG/dtKlP5ewRCmrUyXY99cF6H96ix0Fr+rNEp6hWYy/t7PH
	P8jbJlActQdFF8m3Ad8scbkkVKCpa/bUh7dzThrfveZeIA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5b0brdt8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 10:39:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fbc70cfbdso189332281cf.2
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 03:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778755167; x=1779359967; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YKKtXydJLY5oM1H79u0eXKzT3x+88CSw8Xginv6rtvs=;
        b=Vw7q9it8nh0d+smGPIJ8B3G0Sp5G2EHWndTwHu5Mk82iSYQlah60sL295qgiARpil4
         cJlyk/qmfeXHWsbOrLXYL4C2I5wUKkmnwZPyLZE/V/T8aFtCvy5X+ZZAiqxl8tBfZati
         lFMaX5n47cL+41zoNOVv76MzppV3SrDxXxuBthI+GZkdDD6T5R63MKMhaNpM7/Cvaiw9
         mbEG5tLXuts6/4ncjGPdOWySjItFYrd30V8ky4vHL626nDHwf+US5Ag6393cMc3SzerN
         r5pQJLRKmfNpNg+65BAP3mpEZtEpipVgrCMbcCzF7AHLw3RCTh324I+oP62ORwnqJcLQ
         jYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778755167; x=1779359967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKKtXydJLY5oM1H79u0eXKzT3x+88CSw8Xginv6rtvs=;
        b=YKZ1s2THBTYAFm8++hTjbWfva9pfp27i/jheQyj2sqY+QrpPAEFMFCny4+BSODXCIW
         KCbgtofp8QeAo1nEcBCV/kML1W45AeJ3xloJCqCoIo6iy38np2Quaz/PlO9Z/VQuuG4R
         gnhhWP8ooRGGFoTr49+Pds/AHDtzoYvaHWt6o4/GblQBz6HU7rLSsec+OiZ7L9JQO4eT
         0e0jUmud4xscaoTzUmPKCL5RvDg3VLAzV2FxnxCX+7I3UrWCWEI9z0cfEjE9bq6QM0bh
         JuqjwXY+0byb8MP0OqXIpvq0ojLtBLRhvSaNwYFtNH8UY1KaupN/9nH9WExhOJsbCm2e
         QmPQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Jdroou1z+D6+QA1by5AY/2V+NtcPYguQlyXKwuIlIgXlAPss4nhtIoczYq+jeHEsRVvk4AQBrkiy3@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ4pE7yRIKzZMtlAFGRbCO23X0hSetsRKYxWu+bhkx+Rca2B4v
	sZqfw6+R0UpKkaDSf6+m2PPOrAe2rJ+uWvHzEUSYdtNy9I5S1DJ6YEnMDBaHX2FNhs5ZY/ldlcU
	sVbvnK2hT/BchGJ3hVVOVhoym5/3zAUVniVy8tY3XSZgE2DfFPKO10kqg+cVDMxEJ
X-Gm-Gg: Acq92OHi8AlXJyA1uj1yAh5WhLbQlqr0zTLv4K3noPkktBlr0CIcZ2FB4G/qBIMmKYI
	Cust6cxCfVVeGPyYhB1wyE+ag+tzQ0aM2bwP8pfWobLlFxOmnmmkvE2T84AWP8qRNLp2JyUet8E
	yPYbe4Vmjqkh7O172u57m8VnIefhtCLNBYOxS/QuNf+hJspZDeFwTSoNuJUz+ncsie4ghxS4bF3
	hTAc9NsKZUxa85MBfPUh1hxxoz3GoUrcoEoh1dXy/uZKmMY7ixiNh+cPQrvfCwHqOKXe1s3o1Bn
	9bYfatyrY8MUTEZQOtz+CKbJj/7k1wW58eX2rolM79svpS3qkEgsBoLeBVVshWO0M//ozlGBG1Q
	SQvscx9UN3j4iurJ5j9beaJnCTqrWhgtY7XZv
X-Received: by 2002:a05:622a:114e:b0:50d:a8f5:d519 with SMTP id d75a77b69052e-5162fe528dfmr86496501cf.14.1778755167306;
        Thu, 14 May 2026 03:39:27 -0700 (PDT)
X-Received: by 2002:a05:622a:114e:b0:50d:a8f5:d519 with SMTP id d75a77b69052e-5162fe528dfmr86496261cf.14.1778755166798;
        Thu, 14 May 2026 03:39:26 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fd769141fsm15515225e9.32.2026.05.14.03.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:39:25 -0700 (PDT)
Date: Thu, 14 May 2026 13:39:24 +0300
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
Message-ID: <3y7hyzwy7n5yqlmyywyuls374j55i7aqfgyiuabf4tubu7slut@pnhrvqulz7dh>
References: <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-0-b1edf81bac3b@oss.qualcomm.com>
 <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-2-b1edf81bac3b@oss.qualcomm.com>
 <0aa79750-ac75-4111-ac82-ad5672157c90@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0aa79750-ac75-4111-ac82-ad5672157c90@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEwNSBTYWx0ZWRfXyGYpLF/N8N4/
 yJyhx+zCyXLjZIN6/UhiKRv0VpOmTJEWGc2coTqL3dOuS06jonQDsAx0TOtkPCT4SGXISn1g+fS
 xX01+gr5YCtsKsG2Kkh4HSAC44GCrMS41W4l5O6dhLtmzxLjZAqU7O7Rtgd0suNqlGHH1j0dKzS
 CigpRNHnkTtMp/g641l98YQcxyf3NioL0I4Jxw4smI9GNu/R4jp0xK2MIhy2+04Bqva4A3nQWQj
 LvrNiT12ojLufan5gnq6qgdE+fINRuEBEkWXkP4BrkN6lGusAB3DY2MwbkfxNtXiJcpt/39UIez
 hRQKrWDKxPpRffyD2NRxkja44gkUSZeVoLy6P+vrDcKlb0p3Rf7TwQJDlgdpKX57MinRPjGGi/j
 JIMv68UDdbTMgy8boGsCchi/G27j9CdNMCi3HhX7kCqpm02dO/BeQbh9qUq1gSvhqrG3TCMkgHo
 ZUTRUMLeB1DiVpufvWQ==
X-Authority-Analysis: v=2.4 cv=b+2CJNGx c=1 sm=1 tr=0 ts=6a05a65f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=lU4jKie3qvkuPikK4K4A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: mcZa8bADHIuRLFDk5eV2GNmWNcYyksYC
X-Proofpoint-ORIG-GUID: mcZa8bADHIuRLFDk5eV2GNmWNcYyksYC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140105

On 26-05-14 12:52:21, Georgi Djakov wrote:
> On 5/12/26 3:18 PM, Abel Vesa wrote:
> > The Eliza interconnect provider is missing the SDCC1 CNOC CFG slave
> > node. Add qhs_sdc1 to the provider node table and qsm_cfg links so
> > SDCC1 interconnect paths can resolve to a provider node.
> > 
> > Bump the qsm_cfg link count to match the new entry.
> > 
> > Fixes: a39efc80ff50 ("interconnect: qcom: Add Eliza interconnect provider driver")
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >   drivers/interconnect/qcom/eliza.c | 11 +++++++++--
> >   1 file changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/interconnect/qcom/eliza.c b/drivers/interconnect/qcom/eliza.c
> > index a4f7903f0524..6d12a1c3c034 100644
> > --- a/drivers/interconnect/qcom/eliza.c
> > +++ b/drivers/interconnect/qcom/eliza.c
> > @@ -127,6 +127,12 @@ static struct qcom_icc_node qhs_qup2 = {
> >   	.buswidth = 4,
> >   };
> > +static struct qcom_icc_node qhs_sdc1 = {
> > +	.name = "qhs_sdc1",
> > +	.channels = 1,
> > +	.buswidth = 4,
> > +};
> > +
> >   static struct qcom_icc_node qhs_sdc2 = {
> >   	.name = "qhs_sdc2",
> >   	.channels = 1,
> > @@ -383,7 +389,7 @@ static struct qcom_icc_node qsm_cfg = {
> >   	.name = "qsm_cfg",
> >   	.channels = 1,
> >   	.buswidth = 4,
> > -	.num_links = 29,
> > +	.num_links = 30,
> >   	.link_nodes = { &qhs_ahb2phy0, &qhs_ahb2phy1,
> >   			&qhs_camera_cfg, &qhs_clk_ctl,
> >   			&qhs_crypto0_cfg, &qhs_display_cfg,
> > @@ -392,7 +398,7 @@ static struct qcom_icc_node qsm_cfg = {
> >   			&qhs_mss_cfg, &qhs_pcie_0_cfg,
> >   			&qhs_prng, &qhs_qdss_cfg,
> >   			&qhs_qspi, &qhs_qup1,
> > -			&qhs_qup2, &qhs_sdc2,
> > +			&qhs_qup2, &qhs_sdc1, &qhs_sdc2,
> >   			&qhs_tcsr, &qhs_tlmm,
> >   			&qhs_ufs_mem_cfg, &qhs_usb3_0,
> >   			&qhs_venus_cfg, &qhs_vsense_ctrl_cfg,
> 
> Should we also add the sdc1 to some BCM?

AFAICT, it should not. Even downstream doesn't add it.
