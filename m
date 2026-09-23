Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28845218A4
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168649; cv=none; b=tb/9lLSuL623lOJ2QfMhVDzaDk0/wXcsowTRhB/i4xr2QBoV5ALBkBvlgQHRCYSoKwHNbf+YwpL8EX3fhT/+aohltDiDOtEmxIxmQif1VUvwi8mRebLjnHEfevvm0AaoaXsU8qPZAzIjJmOstsMyW+LjDE2W2oPOd07xuoPoDqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168649; c=relaxed/simple;
	bh=NApJ9NFSgYYpVWupMRsC8ElXkAZIpMR/Q2Wgt76jr4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KjwcPRuNI5+yylu6tq6IEe9+DkqgEbjMpYA+Am1hFkpyU+stnJTFCqDs2/HkEstCU8np1H1lVe+XaTZjPZbuVz8Bq6pK/l8kYCTfl2xfbfmJPKmiBS+mxEhgP5GldAw14aJesrGQ/3xhetu1Aj7NXA00psPe32dDjCk3Skp5KeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z4pNN1SX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cgtO9VmT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z4pNN1SX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cgtO9VmT"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbXSF3028019
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:04:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yQt+uQAnGOQ1XmZG4t/uNWpK
	1EvYqFxQkdNygcG7YJE=; b=Z4pNN1SXpBQqnh7QpNEsixJFW+0xnuRrMEAluG8a
	b7TGiALZoMsc2OmVOuXvM57r2mWmkiD8Lop9px28J1NxLPJlZtQiIEyoiVWwMwyB
	Rw4oZLqsZqMdKfX/fqDf7io8Z34w9+rBE2g9PwKPlboeXzJWf5VycexxgrFZWAnS
	h00Owy2mjJcqP6HQiDFHOsfon8OzSpK2VhnbAt/ezefPySP/uj95zN+qBlSq8GVL
	kBU1KL/j/G3Pz/Bft7T+ZHbxg/nk0TI9mmm0uLVGKQDPUWJMJsVksHVHkasgg0VL
	Xs2mzEv6FsuEobxfd51Qx2ogQEK2nmUYHLZQKBDFI05vSA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwarx13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:04:06 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc51591102fso670764a12.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 06:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790168645; x=1790773445; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yQt+uQAnGOQ1XmZG4t/uNWpK1EvYqFxQkdNygcG7YJE=;
        b=cgtO9VmTxWyhS4/aC8xN/mMFGPf86kJ/klKQ5VAAYthlEoo9RbrxyzqrBuqzHgXXkQ
         a3KiWlYXW1NL3w1RgHBEHl6iRY/A/6Y9Vm+bnwCFcI337nz7kJZtSdtqnpqakWAYyaFS
         QFDASzY/pWeuq23hH4TmRxjNjxqUWHzk0Ezhk6IpqeSh4Ij07UNoke9i5JUSYwLXXU9Z
         94TC/kQsapQ5CQAqj+PglYUygDHcwxoWcQe3ZW8Q/M7ryqBD8EsMzDSZArXNynYWJ3d6
         ViWCx7nE7T9mdOG5BXL37lZ+xTqsaFwEhrMpnIlaYPNVv/cEg94YQxnETZUIWyz13Jqg
         KrPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168645; x=1790773445;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQt+uQAnGOQ1XmZG4t/uNWpK1EvYqFxQkdNygcG7YJE=;
        b=kutMRLLdPtQ4OMQ0HTW0FoOom93YSt8i3OkbAJW+H3MVI2FUKAMfzGAM38vnOYNzwb
         /Yf5mEnW2xi0jFRW8xbJlRn1Cr2hK8sEGvrwiRzVB4rFQqWvHAKDS8s0Ch+1pE2HFgC2
         nqpb20O9aPl91g+ecOoXO+eMjZU1tapr1K399RMEI3Ka5ZRaOuT5OskeZ6LrF4y2wvin
         TS0GCtJSFHTjV4m2haQ2a8T8NHXDmbRFBirUiuvM5iT1rVimtuwccZnN/EveqzsmKIXZ
         rOSWZRRGpSj5iYHiZIlcNNPTfyyBuxMZf381RBfqFmMs6cTh5F0ezFP3jh+UB6jjI9P7
         YMWw==
X-Forwarded-Encrypted: i=1; AKwUvByLec7qJ+WKW+ybcMH3ZXayeigrAIM27c6lJZcYerXDIXEc6OdzqHcMl0s3wEhK5BsCVJY0QFrhxeFy@vger.kernel.org
X-Gm-Message-State: AFuF++laZwtTE9X54H/cj8Yg1HjBoImMMVVyRplRtKpDgaMguJHJI2IU
	Sw75wQ/eHM5kw4uUwLrAYx7TjnohHKjYLHf3otmfFPh9s9bzYA2SzcxclldqEQUfkTbhhGo4K8n
	LR7l0lXJVpWT53WisQsjphEDc6HcTTkt4v20z3pf9IUlwt/Wm9t7LDOa/5Z8Qu86e
X-Gm-Gg: AYBFou2LJi3OHiLBdUtmz1KWkDjf2MT1zYZjuviyTD4h+1mBA49RgJgV0fLa/93hz00
	6JOCpeTXoF8lbVheG1+Cu6jovA1KxjuzAtCroald5jXcWnFLAOxQ98ptkG2Xe0MeWzeQU/cYB2s
	m8OKIWFSK9bJDhkl51ll1f53DHlizDGAybLBqCSsSWUyYoxuooPbOC3/BrvPLQonSRS/BZSgSp1
	GMHBDYHuqBJnibFHxezI+MFLwKqPCAgRMB4tOzb8s92J5PcmBGxk/fYHLxQOAXMAhyw8t+NPb21
	4AZp2HB1rlI/eL0RNntT6mIk/26cdzjKPUCM4RSY82f830BWCQrvvo2Mmms35M/Rhovw2B7frkE
	IdMmD/ie8IRNC4XltrDJmvYCdxQ==
X-Received: by 2002:a17:90b:4a0a:b0:3a0:42a9:9c7c with SMTP id 98e67ed59e1d1-3a07e717b46mr2132133a91.39.1790168645382;
        Wed, 23 Sep 2026 06:04:05 -0700 (PDT)
X-Received: by 2002:a17:90b:4a0a:b0:3a0:42a9:9c7c with SMTP id 98e67ed59e1d1-3a07e717b46mr2131846a91.39.1790168639925;
        Wed, 23 Sep 2026 06:03:59 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07dbc013fsm6125567a91.5.2026.09.23.06.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:03:59 -0700 (PDT)
Date: Wed, 23 Sep 2026 18:33:53 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Introduce Hawi SoC
Message-ID: <20260923130353.4jy5tlu7o76kjzek@hu-mojha-hyd.qualcomm.com>
References: <20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com>
 <20260923-hawi-dt-post-v1-3-e41473b6298b@oss.qualcomm.com>
 <17ea3f77-5480-419e-90ef-9c51c2c21da7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17ea3f77-5480-419e-90ef-9c51c2c21da7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MiBTYWx0ZWRfX3RBFginzLVye
 fqDuf0eNcax4toi4cUI+6j1AG9V2Evkpr5XViQBtWRiYJVsK9WMYP/Zt2bDcAlScIfsilyI7fZ+
 lhCazVBYn18Cnr8x+KufnWxl7QSB1/doleis7yV5wERj8Sbi4CiDsN9CPs+Mi9X5+00so/ld0V0
 oo8HOoLsdvIaJD1gS+Blou+yRnP36dNkFygTHZcv2z2Xk5d0s1r8cjx4Jy/9mkA+Nw7+loPm95Q
 7UYzjDi9I6srRu/8v+XcI56IuGYC0rS4vC6pUgXS1bGqPT1zdgHfhfc/5MLeFN++PiHUykC2zBr
 qVCpemhSO7flv9S0dlbXb7rbUJ0NeE8aQL6TR0Ow0k3g/pRsmbP+E9iuYKK7LfxabMgQYIpgKuz
 utrV+6db00VOsONdg8qzc/490c6JgFDjD6tZYLd7xPdP9MEiq9WjK/ABj/BrwP9POPxwllxOdLV
 FQxd2RpUnjpyrGTY13Q==
X-Authority-Analysis: v=2.4 cv=HfuB3SE8 c=1 sm=1 tr=0 ts=6ab3ce46 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=IU3sRpwDCDo_Lwim3DQA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: YpUOda-POss4Vie6drcwIWedZfYN_RGl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MiBTYWx0ZWRfXzrNMpRCevNhL
 +faUfM6K0okEnyhehHzJ83YW7bFfwkNREMlcw6dx1UCtXiCcNUtmUCLSsFP1uFq4NuTdE6yeuZG
 vYlCJ1W+fmuSgQK00SuJF7HLwGAMSno=
X-Proofpoint-ORIG-GUID: YpUOda-POss4Vie6drcwIWedZfYN_RGl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230052

On Wed, Sep 23, 2026 at 12:41:54PM +0200, Konrad Dybcio wrote:
> On 9/22/26 10:18 PM, Mukesh Ojha wrote:
> > Hawi is Snapdragon SoC from Qualcomm.
> 
> [...]
> 
> > +			qcom,smem-states = <&soccp_smp2p_out 0>,
> > +					   <&soccp_smp2p_out 8>;
> > +			qcom,smem-state-names = "stop",
> > +						"ping";
> > +
> > +			status = "disabled";
> 
> SoCCP should be enabled by default
> 
> [...]
> 
> 
> > +			sdhc2_opp_table: opp-table {
> > +				compatible = "operating-points-v2";
> > +
> > +				opp-100000000 {
> > +					opp-hz = /bits/ 64 <100000000>;
> > +					opp-peak-kBps = <160000 100000>;
> > +					opp-avg-kBps = <50000 0>;
> > +					required-opps = <&rpmhpd_opp_low_svs>;
> > +				};
> > +
> > +				opp-202000000 {
> > +					opp-hz = /bits/ 64 <202000000>;
> > +					opp-peak-kBps = <200000 120000>;
> > +					opp-avg-kBps = <104000 0>;
> > +					required-opps = <&rpmhpd_opp_svs_l1>;
> > +				};
> > +			};
> > +
> > +		};
> 
> nit: stray \n above

Sure, will fix it.

> 
> with that:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

-- 
-Mukesh Ojha
