Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10F338836E
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257624; cv=none; b=oCkJWVN21ikGnkokhAgRzIWSjsbYzvW2CkzrI7cusxzpLI9dTeJoTwsYGiMiIeQcEJtdvukmzYZT4APdiTol5glkxwberd+g9lG70OHfVe07b0enuoP8A0fWAnHdNRav2CPVNSvLiAQBPf9QoqVw1MF9jumuGXJ5KDMr1jdI3s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257624; c=relaxed/simple;
	bh=VVj3okNTlePIGig5k7YzN8fdhlKG52AGUhCX0tuh8rA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BmXG2eP0hfmG2bnxN0EgWkOITT3NiSzlV05DnLt/IoG6oZIP4U0IHWTeqVoiSgKGlLsFBAalbI5ty16eNAv+ftdc+htckfqaYOfbmSrQo8xRyfuBGp5NgmQH+rglE4jUYYh49RAl5ZK2YRvTQtjttM++3gQu7Uq3Mt+LtgPXSXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EMmfaJhJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V5u8qKjl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EMmfaJhJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V5u8qKjl"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tnUk3468097
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Le3dsLCweuKduJ+IqHrXfj64
	YU/2qmjfq2MzgIVID30=; b=EMmfaJhJK0tFSK+TTcCRevRcdc8waHXeu/zA0a/q
	yhku4lNpS/Ar9IhW/mi1+ZNm52qyYdsDeAtwispxJesWqihud3oNXI/5HofOGnqH
	YAT3ICj265s9PfD7UakkdWY7SZ4dk6a4UhjZawUIIzdtIe53hB+EMP5dGHayoy2M
	VLFrrADxZmoZjmb9XQInA+VPZj2osMeaM0Dh01nr58uOaCr1lWEIFnKuWQKe74DU
	xi9yUjI160Ca868qf6GhzDcBOeH4YmgoFl/SXYv8cWKv8fX8i10S0j+SXDupCmPg
	8TteS9QEoqm1a2spWPr/Bi9ScXNL0DNWfKdyR2vz01SL6Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jgg9yb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:20:22 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35679eb61b5so2264284a91.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 02:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774257622; x=1774862422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Le3dsLCweuKduJ+IqHrXfj64YU/2qmjfq2MzgIVID30=;
        b=V5u8qKjl6k/2EX1+OMALmKXi78tYFjt7B4uVQyC6Sc9lOkahUzzVEY2JzVVT0EsFw4
         p4/mZEg2KFt5xt7P9VZRgXVQ4BURlS5kNwgVFNWeA0d7PK7WnFAeeDpbMJiNzW+k5rw1
         z89c8f18F6bqonRC/wNTvUy2xpq14FWNRVB2OMIX4V5dmR2MjuDTjFC0qVApjpGrh9iG
         HHRkSQXgUcNwrU2f+RpAnRjkmUlFZL45dhWKbT7AlhWe/5Ptiumd7dvf2tagkquTwS1s
         n8NNnjc94XSLOyGopvsMiKZ5gFlzI9i3sRR92UwXLPe0Chk/6wXutpBLYjBV+diObbBa
         rpzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774257622; x=1774862422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Le3dsLCweuKduJ+IqHrXfj64YU/2qmjfq2MzgIVID30=;
        b=Tm9h/3p9/jdAwe+lkkxLffJQZf4VP8I02lH4QlfY4JYWAr4fOSu8ErzdUdhC33v2fh
         wb/TcmDVaKqTZCMdOtO6PksKarYm4IrEY0H8puVudm3UU+HzHLguYNPhUkSaMyj7hlQ5
         MPfJ2Mz6hHYZqQE/IcOpv0/U/fJ6PmPc388AJF4hOVEvpWevVpiwC2RFI4j4R07xN/Af
         Hl+jvp9cL8wjrtwTsF47QATlvOnj9LpzDOU2938U7WD0iEFAEvmnW99YemJDUaYVURut
         2cCqgUl6C+S28BeEj8B6Vaj0X7GIs5akcykO8DkswoAJJscXVqyyVNKkY1A31DyP+dih
         jpQQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9R7/o4Z94bDM6hkExuD0npwpe3drYN9ob0mkF1qbbyXvCP27sOjEsNOQaSwtiJzg7TxqLsFZs3RJe@vger.kernel.org
X-Gm-Message-State: AOJu0Ywklzbiwf3TgWmmqtt8r5nY/yApLnCJnDr8SwOoTs9OeZgVcuRG
	2q0uwS/VfEF8nivs62Z+6rQZ8jSJBiP+Svi9XsBACpAb/vqwEgmCm1JagJifzhjGuyLjsZwBXQo
	lXCJOQnVWsklpdTsXSTT+h/vHyNVfCCh7G8AkWq5Cs1Ferg/XGMpMmPxHjFV5KkkW
X-Gm-Gg: ATEYQzyZZa1UU7g53JhO0NcAp245Oi6BZFCMxsARZLXOjxMBvxAYVejNqM8MnoewM55
	hnvf4Ni+yL5AcClWRR/E1dLrzA+qxWLEmjtJgMPoyARYRNzJlVt8lj4MGh8WaPTNrNue3kE11uM
	Ej84pSrpilLX+xmGLhqotJTGkouPXJzeh40ukxC8wGQIoSB5q7cvXvQq+c6KIaB9r0UKLs/Q7hk
	0L+HEryQ9fBk5YffXXSeVKLvcNLnQuyQ2VBTW6UYsae+AToStUuaIgeTrTWgz9XlSFHCNQ/EDZg
	ENHX71NJ6GMMNDUIQpq64qbI5H3Tyccc/WQo5ohk62xHjesFakpW8hq00YVG/X+C947Lhz7RBG4
	3TJx4m5y+e4Y02QoE6PN+rOLPSHJOidT1nUXnQe1crbGLc+c3GatGdwUcSROJagdCjK7Zn9mwld
	weiC2/elwI5l55t3DJjWDZH/lRiqteRiY4YNRl2qBqPA==
X-Received: by 2002:a17:90b:384a:b0:35b:e4f6:3a4c with SMTP id 98e67ed59e1d1-35be4f63c05mr3253870a91.0.1774257622217;
        Mon, 23 Mar 2026 02:20:22 -0700 (PDT)
X-Received: by 2002:a17:90b:384a:b0:35b:e4f6:3a4c with SMTP id 98e67ed59e1d1-35be4f63c05mr3253848a91.0.1774257621692;
        Mon, 23 Mar 2026 02:20:21 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc5ed0777sm12093180a91.0.2026.03.23.02.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:20:20 -0700 (PDT)
Date: Mon, 23 Mar 2026 14:50:15 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prahlad.valluru@oss.qualcomm.com,
        Prahlad Valluru <vvalluru@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: monaco-evk: add lt8713sx bridge
 with displayport
Message-ID: <acEFz2wF0CWJ2x1h@hu-vishsain-blr.qualcomm.com>
References: <20260319-lt8713sx-bridge-linux-for-next-v4-0-da886ec78fe3@oss.qualcomm.com>
 <20260319-lt8713sx-bridge-linux-for-next-v4-1-da886ec78fe3@oss.qualcomm.com>
 <c2b89cb3-dfc0-4793-8b0c-8ada5e535207@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2b89cb3-dfc0-4793-8b0c-8ada5e535207@oss.qualcomm.com>
X-Proofpoint-GUID: FshUO_-3EP5KYWYRTV4H4IrcYaOuH92X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3MSBTYWx0ZWRfXyObkOEntY9tB
 RwGxU44MoCQS0+JMFv1RbA9nVTUjX7HiaE2KyLsaii94clVRpYzvLLTSGUzxqYjKyH+RXarfgKJ
 8Dju0aBsZ4j2IJuqHjPrr7SnmwBGBY/s2lAXFJOY2cDDiZci6jc5uyt9YKaACgi41NTg0Oga2K3
 6k0byXZQFepxW4jQKA+0qI5Y2fxHAoX1EgeEq/4MwkmIfonPa7xb2xr7Q1HuMbizL2kYyzqII3w
 zXjaZcOiwCctaTDZ/FIrGYNLLl0vnBZ7BBEhb2VYuvo5W9FJzxRV8B3jvCy2GUq7YUPmgWe4HOV
 +RKBmHOgBNsh5jz4Ko1+CM4AmvlDdmaDzd75fNN8GHnjyYm9KNm8vRmQYa0hxvSsibTVSl/+lNC
 V78dZI6JvCN+dlddsHWF9mDFR0cDZlAQormBmzWoC1ZS3hNaHZpbYBEm8TumDse3bBy8S6W7T+x
 DdlbqC0UZq74X9exVLw==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c105d6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=9lST3B_NRd4_nVoNR2gA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: FshUO_-3EP5KYWYRTV4H4IrcYaOuH92X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230071

On Thu, Mar 19, 2026 at 11:11:20AM +0100, Konrad Dybcio wrote:
> On 3/18/26 8:08 PM, Vishnu Saini wrote:
> > Monaco-evk has LT8713sx which act as DP to 3 DP output
> > converter. Edp PHY from monaco soc is connected to lt8713sx
> > as input and output of lt8713sx is connected to 3 mini DP ports.
> > 
> > Two ports are available in mainboard and one port
> > is available on Mezz board.
> > 
> > lt8713sx is connected to soc over i2c0 and with reset gpio
> > connected to pin6 of ioexpander5.
> > 
> > Enable the edp nodes from monaco and enable lontium lt8713sx
> > bridge node.
> > 
> > Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> > Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +			port@0 {
> > +				reg = <0>;
> > +				lt8713sx_dp_in: endpoint {
> 
> nit: it'd be neat to have a \n before the property and the following
> subnodes

sure, will add a blank line between reg property and lt8713sx_dp endpoint subnodes in next revision.
 
> otherwise
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
