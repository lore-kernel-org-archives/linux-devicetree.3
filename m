Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2463B583E
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 06:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781244886; cv=none; b=JC6vXRS9glMwTfTUAgw4ZmzRNSyRuwKdOJecwW5NnmxiU8JvV6cb+7oew6HvV/y0e0ni4wiUIj5bdn21Np98LQYJuehzLsaxki4Uwk6CZFrRWlx8wf3XiBpT3caujRPx6XMEIIqdN5y3pqOSIciDbdtrZixMF3Wc0BMRd/6GdJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781244886; c=relaxed/simple;
	bh=8pWotts/kpDpCde4ZNY5wGJFHdknrdfgwD8DISz0zyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jKxHfvoKon11aJlgfSRy754zgYzeAIICVqWI+/hG7p4wQ7Ua3mKJ66SXpk3o1nt3XwCEI16hQmmXlJjv7efr3w1BNlflsHjBXn2FDMH6EvDDdGYt6elj7eppOEpBrmRwgw3ABKFcIi/TpD6XUY9v/jIzBdHOvn8s0DmfoBnlTqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=njOxZdAK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RPleETwN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="njOxZdAK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RPleETwN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39pnS2516712
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 06:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4EHvEVapSr/pXzWOg5zZWwsW
	MURjNCE8rkDaje4bveg=; b=njOxZdAKtWqnUNLXoQVt7f1CI5elvV9KfMj5d6aJ
	iewqp7Pv2q4nB25W0Qly087GIweWvHzw2EILpZUKx1ml1RpLhG08QloaAPfqRLJV
	pbaUwdSa5lZVhZ9mTyAc3ay/LSDP9Im0teTyoYW8qAsSSUll1BP5tj7yCdwSVe31
	zHTKXwrzEBtGOoG5LkyDcWxX9DvFLNpgSqs35IlQVsTGp7l1OKEyuXy+PmNt9djw
	HmCV49NhdJfIwQEW49Qhi/eQGYlCmK28N6jLQQAqs6qeeyrVI6a2sx6RicltiLz7
	1MJYZmxg54W6MlHMoOcsLlRsRbPsoYW8QPjIVUK/QjEYFw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r71uk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 06:14:44 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cfc66167c4so194973137.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 23:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781244883; x=1781849683; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4EHvEVapSr/pXzWOg5zZWwsWMURjNCE8rkDaje4bveg=;
        b=RPleETwNraCHoD5akBLzTzcw/qj8Q2WjEHsfUvh0YA5CjXE0fn8caEEDakNCYbX1fA
         rPc4TipLvjTBAoCzZJ76jGBSzH+5ehOpBc6+3CXGRu8NgLkHDkW1arSnNAOOzylbse/L
         otwGDK/hsJxv5WZ6+zF2IuzUra6xVv64OvOpzodCHSEl0XB5+mMvqNwEASUwKFVUcUWf
         iaiC8A/oQyUZ8gqhRwX2tu7OCwp7n5tE3v/zAfFJwgZ1z2j4T+nCL1hULg79wf14eTP3
         ca/31zgobkGZ+9zvey+KBswANy+E7FiXkZX7/ooLsMsaRb+BYQ3fTj+xAl78QyWDDkQZ
         eTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781244883; x=1781849683;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4EHvEVapSr/pXzWOg5zZWwsWMURjNCE8rkDaje4bveg=;
        b=AlK0Gh3KJeeBAXk3sicocLu8OplWDZ0fNPHhvPgIxDrm0/yVgCSakUPQp8N6xnvBed
         Qho+DT99QeuPwTb+h4ifKhZt6W+5WyrpguCd5H9H/7skvrKg2uZiIP6fIw4vEuMKT+fS
         WTCGXRxwOit6B5g6IWSc7XVpHoiPxjwBFqv3CBl6gIRnDmHXagR8XGgiQn32DgcXrR/s
         fUO9iB8yPwdJJuDxyqAWQpT9YXVggwU0snU/liPvBH11oxy5lJXPu2rBGY2ZldaaGnXU
         thLRUWmqGyofha6KMmtg/7D0EG3agEWOGcP095oXr+2mdqUT9WkrhNgbB8apTpxsAwJD
         gjkw==
X-Forwarded-Encrypted: i=1; AFNElJ8X1E3Ufw/svLA6wskvIayCpHvNp5QZ36pnLzW5Hjx1kAgEfXYH29OcmmBbzjSc7mSCRnxRvfgqaNfv@vger.kernel.org
X-Gm-Message-State: AOJu0YzspU1QrAKtG3l/7Zz3dAVIe7+eiAOYybKOp1kfaJ9dFvg4K2yU
	5mLcVfxWip1ydDTENGK1AoAxoI0BW0q9Q4uvh0I6bn6Q7YASRvtsyDcRly/QTlb9zqonuQLWOB3
	o174O15Fy2Mhxajrc6f/qFapzN60kyr7BWo2xHWPm/Dp8wJ+0LaeQBPnf7xErt0NH
X-Gm-Gg: Acq92OFFTcKiLD8PfqxhxVasWBTs2Pf8t02vz79NCXgteqPYHxF7NXAcWPKS+f5mbWh
	xMiHn0FPXHZyddmwbQEWj2j6mcEN8XrBgDQ6hcK46O3+RFsL5V9goA42c5dpacz7S/sqWTTvNB+
	RpDHyUu0BadBpr2spJq8GatsTILUDWg6K1VXWJgHID8LUCdBj52a8v2NsqVNEhOPOCsnwdztWeI
	IXoO/8XfRvtqg8swztEvzXbupNYYmsCs4oFH/RgtwjpJ1Sorr53wmGK6O40n1gFQklRVSXdK3CX
	JgjAVju8+if5mk3rj0k3VhuzVbgxrtItU8xZJdq3z71cPdJ8Kl5p4/4wiFMohCKw4IR4cRiha0u
	NIa38BOzne71P1nidqo48ECmHSscci88WCdUzz8FbCbmIZ/WLzdssZI54y1u4TlCqQGsK+LlBHP
	7te42QbFSXW1i9gjfMCaWe/rUVTUZqMTy70DU=
X-Received: by 2002:a05:6102:38c8:b0:6f0:3ba3:7d84 with SMTP id ada2fe7eead31-71e88acea8fmr634854137.5.1781244883479;
        Thu, 11 Jun 2026 23:14:43 -0700 (PDT)
X-Received: by 2002:a05:6102:38c8:b0:6f0:3ba3:7d84 with SMTP id ada2fe7eead31-71e88acea8fmr634842137.5.1781244882942;
        Thu, 11 Jun 2026 23:14:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f547c3sm3733451fa.30.2026.06.11.23.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 23:14:41 -0700 (PDT)
Date: Fri, 12 Jun 2026 09:14:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: qcom: qmp-pcie: Add IPQ9650 PCIe PHY support
Message-ID: <ohijjcszynmoocjarid7mo7nbtd2dqcdvqrbnzb7anjytw5m56@nguadudsz7qg>
References: <20260602-ipq9650_pcie_phy-v1-0-d8c32a36dbd9@oss.qualcomm.com>
 <20260602-ipq9650_pcie_phy-v1-2-d8c32a36dbd9@oss.qualcomm.com>
 <56zkq7bwrt5smmmum6jckzrekkkqrych2gntx3obnrmamwumtv@espahwe6pc3v>
 <7def2ccd-0319-4f85-8275-73fd254d887d@oss.qualcomm.com>
 <fbtghwjrokuijatssy7xn2hwkp34p5fjyn3ndr5t2w67fkz2na@3izdh7uk4hst>
 <602e893c-d346-486d-86b3-50d0f01990bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <602e893c-d346-486d-86b3-50d0f01990bf@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: QN8Ns9Iyv_RxUxiQ-eKdRl3qJ_twtVoY
X-Authority-Analysis: v=2.4 cv=RJGD2Yi+ c=1 sm=1 tr=0 ts=6a2ba3d4 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=JfrnYn6hAAAA:8
 a=EUspDBNiAAAA:8 a=FLPK4wCqi9WiV8jjNa0A:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: QN8Ns9Iyv_RxUxiQ-eKdRl3qJ_twtVoY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA1NSBTYWx0ZWRfX4SRorw1tu59/
 8o8LdFsDC8rmlzWLnVaJMwzbO/1SxptPJ+5EpSIWkkYvFHRL1gMP9unH+qOC1ozNyO5Dtt2t1bJ
 ol7i1Ai2k4S+v8VBTAxVPPh5aku44XVwPVaSr4MLRDuppBg/KRPpXD1kJ25qOprRqeuBCNejCGi
 K8nF2IRUdu67Rxz5XLflJuj6gmOErfHGvKDIKz9vUff4KgIieTuajyz+yo4+nnUpdf+kUAZOlc0
 sVbUJU/iXz2lfgTWVzC021YP0/TbIj5RD+S9GlCRI/UwOpmrK+UZJCM1Und5KOoiftFPOvxcfw2
 7MHUT62zWjY+QqufINPOIAt9j1qq4JrpdpfLWLPa/d40FHd0L+GEY3zMm9tgQMnXli4UHUqU2Km
 luPo4y3evjpQR5ZZaCoYii3IYEh7MJmmsh3T1ZsW1dJPj+gWPri4VYTZ7Psxc9rClQWeFMI5H8o
 YeFaM/3ccJS6mLGsvzQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA1NSBTYWx0ZWRfXzG17sGXiuDN5
 rWDbd6SPC502TdwwlDCAQKx7z5BuMxq/wAvv44gPDZpmdMWM4h4dVASStE/Z9ewtHH6NArMiF7d
 rELOQ6193Gse2t/dAmsFPOr8DEDOcnw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120055

On Fri, Jun 12, 2026 at 08:22:02AM +0530, Kathiravan Thirumoorthy wrote:
> 
> On 6/12/2026 1:52 AM, Dmitry Baryshkov wrote:
> > On Tue, Jun 09, 2026 at 03:46:56PM +0530, Kathiravan Thirumoorthy wrote:
> > > On 6/8/2026 12:26 PM, Dmitry Baryshkov wrote:
> > > > On Tue, Jun 02, 2026 at 02:40:18PM +0530, Kathiravan Thirumoorthy wrote:
> > > > > The IPQ9650 platform has three Gen3 2-lane PCIe controllers and two Gen3
> > > > > 1-lane PCIe controllers. The PHY instances also require the on-chip refgen
> > > > > supply.
> > > > > 
> > > > > Add the IPQ9650 Gen3 x1 and x2 QMP PCIe PHY configurations, including the
> > > > > refgen regulator supply.
> > > > > 
> > > > > Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> > > > > ---
> > > > >    drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 220 +++++++++++++++++++++++++++++++
> > > > >    1 file changed, 220 insertions(+)
> > > > > 
> > > > > @@ -3378,6 +3524,10 @@ static const char * const qmp_phy_vreg_l[] = {
> > > > >    	"vdda-phy", "vdda-pll",
> > > > >    };
> > > > > +static const char * const ipq9650_qmp_phy_vreg_l[] = {
> > > > > +	"refgen",
> > > > > +};
> > > > Now vdda-phy / vdda-pll supplies?
> > > Cross checked with HW team again. Along with refgen, there is a on-chip LDO
> > > which supplies fixed voltage to the PHYs. It is enabled upon system power on
> > > and no SW intervention is required.
> > What is it being powered by? MX? CX?
> 
> It is driven by CX.

I assume that there is no CX collapse on IPQ9650? Is CX not scaling on
this chip. Please provide some details on the commit message.

> 
> > > regulator-fixed doesn't take the resource 'reg'. May be should I create
> > > another regulator driver which accepts 'reg', something similar to the
> > > qcom-refgen-regulator? Please advise.
> > If it doesn't require control, there is no need for a separate driver or
> > separate supply. For example, the refgen is being references only by
> > those devices which require software votes.
> 
> Thanks. Then let me respin this series on top of phy-next so that Vinod can
> pick it up.
> 
> > 
> > > > > +
> > > > >    static const char * const sm8550_qmp_phy_vreg_l[] = {
> > > > >    	"vdda-phy", "vdda-pll", "vdda-qref",
> > > > >    };
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry
