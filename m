Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9648382F1A
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 07:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782114908; cv=none; b=L1jUd7jvXHrVWII8OEoYYCDniwdxWO2+gqLCpu6WCfFJKxe+oHiKu9ieKU9SyLykl2llfUg1FZlCKSf1ucJQfkscrB90nPy/esq2iULEvcnjJuhPHD6mORia39xRUAWTfUEaIEtdxYZ/moBHv9WahGdjvGoTGJh2yHTXwLR1xBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782114908; c=relaxed/simple;
	bh=yRjr1OV5OKfKAH/cr8wF12EEhzDEPZf3H/BmclMEchk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ijzAJFpal0b0cThY8JvIHu/j2DGoC6svQnEfs2Yyj9BEytzG+Zby38YhGuM0byuXKc+auY+zuhWksxiCys++dyWmUznNGNT6qajH2T2+8brC7m48E5bm/j0AfgPGxnpvCaVBDosHMJ+Csilx0/bXIzO6QXLQVqnY8frYlKJ4C0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DTK3NrPs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OpYXtYiN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DTK3NrPs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OpYXtYiN"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M5ANdE227688
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 07:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Kzka4gFUSWQP9V9X78+Xixa7
	EVscxDMrc20o4519Zg8=; b=DTK3NrPsL/O1WJFj5C3rSQPeiRtPUNOqxt0+bGr+
	NWYWjROGhsHrCgHjAtKsUdqB1fAX06hOmcE77a8RDebKOTZGH7R+KURfuvgAmKWY
	B5tBE+HwAndgx35sHuO5Gu3nz+df6xu2njRM+zbjGP8FqgNgSQ4wGHpoU0DQU+oq
	sIQ57SJpMq75I20qbz8+c1L/pugSxydOSwLQ4UecdiuGT4kd30oxkUDNmwniZeua
	0f3QDzzuib1ZcX7NG4VAobkUE70OKNAv5Svt0OFBUeeWUv25Xg63rz3Lg67WbsYz
	ETHny6yPthz9qFGX4ZVWYE7cMCkwYjD+tZYfrqM4YHe55w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewjxud9y4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 07:55:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37c9127e316so3047578a91.1
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 00:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782114905; x=1782719705; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kzka4gFUSWQP9V9X78+Xixa7EVscxDMrc20o4519Zg8=;
        b=OpYXtYiN/Pz7Xf3CWQtOjJKeD3OAo0o8a20XqF+QsKsTI7Uh/ZkLdpIoJlF1Hy4FRa
         wJF+dY39P5mMvX4G+SlXlRNc5cWLDALmJyoyAuIuWHk4Ew4TT1WJ40Cc7I/KOtMus87u
         ZjPR55/XRyQAQLlU4FeOnRQymJxq8T75Qnr74i60SslTYoc+Z4KwqBHK+s814ksrc9q+
         ZEAS5wqTA7DqZQvxRa+2/Klj2/Jv+11P9pPgAbqdNUJWBVzq6x4aWREAIrMQClWPu0m0
         dyShJfbx7ThSBp2SJkgFhgz4jUwo9X8bNoMiaZSM8g0wVbSXFNe0z+Pnhmai72ZCUGuW
         hQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782114905; x=1782719705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kzka4gFUSWQP9V9X78+Xixa7EVscxDMrc20o4519Zg8=;
        b=lFE59CrMekaMdQzfDLiU/iILdif0SFIjDNd7RJCZNBWafCcNbyvZ+SMY70MdU3e+qp
         Jc7kkN9mawi82mtBorjmehRGcbiFXWQXC/aZZx+L37OcHSss+RoOO9uPfs3nhK+yBxWc
         D+qNCHktj2dyOXES8PcSrd55Aajt4M/j4Urlwdd0AzdXGo2sk2la2TNkDTistS2kF+Ei
         F5/NNPtGPb3WU29eAGxcUCOagW1vwsZJRZyAdwDk5Y60FM9jcA5HnExRMWJuUlw0//Y+
         y7E7qLIws9d3XL0CVj1KnRLBFpHQWikouFGfaCXzEpupm4NgelyRKdxepexNm0Z1sgbX
         2ayg==
X-Forwarded-Encrypted: i=1; AHgh+Rq7Cm5ZsoG9YitPK4kRXmUjGOafnPHUHZf569XHqle1rjlc2CgJ7CpXD/nAKt18fl58ASm6VDvoJuUT@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6laZ+KmlvuR/lDV0koWCz/GMC/3lIpCB/iAEmc8/CaOlotd7P
	uVyuvbKhttQs3LkjxmqdFbb7IawRzRRRMTs9pLikhnlv3bQzRjj5auQHcxejGGz09vtuNIi2WqL
	enSdofnieLuahKCqNsC2U0F0Z9cA/VeMNWrxq3qtLU6ViKyu3paDe05fsgqAJa0DQ
X-Gm-Gg: AfdE7cmz65qt2/JxrfeoADIXjiSDfzANikQa/ehoS9YaLYrjYGM2nLvvMkKhL1qo/3W
	CrNQFaY2mOPK7RanDcc0yUFbC/Osdg2wxowMTBdCSVXSUj9OHFzQDB/lQ2JxQHZGQ5JQL3xTUxa
	S9Q60p5wx587+AccDAR7/jhe19ZK1gjiG2oDVdIDo2XxraHCT8XkD7Rr+YNoleKkrfCzdHN6sgz
	IjbJyuqcqdUToPsDK9JypJlUyzPqJ/ZuqR9Wz9jwrCAXrGg1R+xfqbTBV3/2S/xNTO0jPhTDY+T
	aoykeodmCbrX5Eb9G5/TJvXEMfAtEyyL/9bJVeoC6KAw42b3o4ITCCsk6cNvjFeraXrjWzI0nKa
	j3wsz4JK/tErduZz62CG6t6bTpsG5ok37NwOoRGoBZOMFYHGO
X-Received: by 2002:a17:90b:48ca:b0:37d:83d3:4ce6 with SMTP id 98e67ed59e1d1-37d83d35e9emr4822203a91.10.1782114904757;
        Mon, 22 Jun 2026 00:55:04 -0700 (PDT)
X-Received: by 2002:a17:90b:48ca:b0:37d:83d3:4ce6 with SMTP id 98e67ed59e1d1-37d83d35e9emr4822187a91.10.1782114904341;
        Mon, 22 Jun 2026 00:55:04 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d15de53ffsm9489656a91.12.2026.06.22.00.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 00:55:03 -0700 (PDT)
Date: Mon, 22 Jun 2026 13:24:56 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v11 3/6] mmc: sdhci-msm: Set ICE clk to TURBO at sdhci
 ICE init
Message-ID: <ajjqUE8TTBXhpVPN@hu-arakshit-hyd.qualcomm.com>
References: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
 <20260609-enable-ice-clock-scaling-v11-3-1cebc8b3275b@oss.qualcomm.com>
 <06999033-1c2f-4203-bdcc-d8e94ed281b7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06999033-1c2f-4203-bdcc-d8e94ed281b7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA3NiBTYWx0ZWRfX92aSkS4j3oYx
 pVvX4r1J4IzMbonXWBtT+Y9nDjrSyayLAfpqcdMFyGim6hIDbAN0LkI6Ww3ndZEmwpABumxRiVX
 llvg+DOFe5VIPYN0bT/r7FZZoO4kY2E=
X-Authority-Analysis: v=2.4 cv=G/ws1dk5 c=1 sm=1 tr=0 ts=6a38ea59 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=ciROkYvXyXDSqN8Q_VUA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: xfBKJLWlsTr1AE-6cR9WLh4anaKf5qYk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA3NiBTYWx0ZWRfX8MPCne9ZdadC
 op2bOl02ThfEaK0FrMpyvTZIIa0MLljYiNQwxstYXYoeThhg1mYR9VzpEF3HgXpAkOWkjx5wdXF
 Rb26/r3h2AZQYDJkfsaL91SRi71bc29XE1QXoWv/+eZjO+v1zLhTfjJStskHhFfMDv3WijHzfMK
 aQX18hNwgiMuiVblDNBJ8//H668fEU8zfd+mKhlBR5lhvK+eYSPT/qN7Wk10zkNJO2t3uO9GMWr
 lVy3uocEQreZyA10YemhZvQ6q/DDpTN6Jb+gqN3nNv8QdlBBk1JxI1t/B1KiX50xRLGiy7JxnWb
 4JN1xJgEcRq7BSyA0Ks5Is939wTNYY5qF2Gg4wvXo9L3NOd3iHZxk9qw+9A6+temTLp0wR1B3zO
 p9C7ypwcszWZyOPjCdqE5WtVXpDK41xauFFWk+ERXgwTmuAc156mzJIdLBSZFd7PacfT7AhW5YH
 Vl0+RHT+Hiz7ySnJrAA==
X-Proofpoint-GUID: xfBKJLWlsTr1AE-6cR9WLh4anaKf5qYk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220076

On Thu, Jun 18, 2026 at 02:59:02PM +0200, Konrad Dybcio wrote:
> On 6/8/26 11:47 PM, Abhinaba Rakshit wrote:
> > MMC controller lacks a clock scaling mechanism, unlike the UFS
> > controller. By default, the MMC controller is set to TURBO mode
> > during probe, but the ICE clock remains at XO frequency,
> > leading to read/write performance degradation on eMMC.
> > 
> > To address this, set the ICE clock to TURBO during sdhci_msm_ice_init
> > to align it with the controller clock. This ensures consistent
> > performance and avoids mismatches between the controller
> > and ICE clock frequencies.
> > 
> > For platforms where ICE is represented as a separate device,
> > use the OPP framework to vote for TURBO mode, maintaining
> > proper voltage and power domain constraints.
> > 
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> > Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
> > Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> > ---
> >  drivers/mmc/host/sdhci-msm.c | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> > 
> > diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> > index 0882ce74e0c9bdddd98341a67b97bcef74078e0c..b655bcb5b90c0677bbe3dc6140de488038fe5ee8 100644
> > --- a/drivers/mmc/host/sdhci-msm.c
> > +++ b/drivers/mmc/host/sdhci-msm.c
> > @@ -1901,6 +1901,8 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
> >  #ifdef CONFIG_MMC_CRYPTO
> >  
> >  static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops; /* forward decl */
> > +static int sdhci_msm_ice_scale_clk(struct sdhci_msm_host *msm_host, unsigned long target_freq,
> > +				   bool round_ceil); /* forward decl */
> 
> Can the definition simply be moved upwards?

Yes, we can do that.
I used a forward declaration because it appeared that sdhci_msm_ice_init()
was intentionally kept as the first ICE-related function in the file.
If that is not a requirement, I'm fine to move sdhci_msm_ice_scale_clk()
above and remove the forward declaration.

Abhinaba Rakshit 
