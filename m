Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793238092;
	b=c2oIHhovgJZsDRgFH5wSI+xplBp7BqND+9YFluNOZhWhhLrwjdu61PvlWfX1MZw7J3Hv
	 w4JkK+SHh/TBPSNiwl7brT85KAAOJwh1JWXz8pwrEHC2bvFqt+X85YrcWDn7louZ4rYBb
	 BBJLf47hEs0kJHoadC8h/cTFDaUS8XA+9QT7+Rc4Z/0bFIbEek9BwGUSnK/K8x0jDhQ9T
	 bI+E7beAkQFg9PnYpbiFKmXebM2yHkDyX0U+16N41Wt9DUouUFDmjPZKszNjQJHpIV1iE
	 EmpC8is4T165Fr/5yAZ/UH6wuecf8my4oEEUc3HoJ9FqHpEpLnAVzh8+Q2Pl8LP8rqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793238092;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=a2kuXhqVMsHVz13E2+Xy/aRM3eaxUgD5cFHLsM4u7/8=;
	b=ZdJfLkqHIIcCCS+RYFcplvE8UpDP08OC5KjgHsm500wQ4hQfzTHWU+AXjoJ5Vz8nCUWS
	 IHsfsGHR+lH6v6w8mW9Kr1j98tczuoy++mogN1M1VrS3NreSzkwyyo3VoZlgs47+kFC/7
	 jNCfUsujuvmb+8QYkjvuvuggkh+Ll72ftA4bEeKCQ6RZS2BDGqvaFYgZjHxY+42+EewFN
	 GDN9V7VtiEucy9SLx9YFwnjOxf+QlYZHxGDMStC2S0xzLlF/HrDokVc/NEg46LSJZXlSg
	 d4/LlJxNj7UoKaILzNXvx+sCZj5kFKAKvWXU6gcakYKLLDsn+YbO4vlPvNkP779N3FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="FO5r/cyj";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="LsKvT/JE";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA27606A31F
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 01:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BA27606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FO5r/cyj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LsKvT/JE
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SMAL8Q2062775
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 01:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=a2kuXhqVMsHVz13E2+Xy/aRM
	3eaxUgD5cFHLsM4u7/8=; b=FO5r/cyjOLkBNAJFnWxgB1NUvwodRJijYg496R31
	+KlJUmu5ZzIxTukS2wkBt+jNNXzrVBAVOniHH0vUQR7NkDw5Q14ah7KioCAvNO3L
	Z82Kq6bnDDoU/ptI4fSoWwJSuuxS8h0RegwcKGsuou/2UeKx43kwCU+51Gi1d582
	lT7uYlLk/tNK2hwrO4ixPCvdRH4lFzA/Rtk90AwjpOyTmCKshQs1SY5f4B43jItu
	ZNORkbmem2nRvttm3Nc/k3F8YKHCZXb650NqhYd9hXwqjUPAM3ecRirD4riQBrFg
	xUO9fV9KL6sY/hfbtaDgYLrVz6o5BldLV4H/W5FB6byxEQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknkp9kg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 01:41:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844cb60so62057585a.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 18:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793238084; x=1793842884; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a2kuXhqVMsHVz13E2+Xy/aRM3eaxUgD5cFHLsM4u7/8=;
        b=LsKvT/JEXNLi43lAm3c8END4CjTzsCR1l9d6gAIPE82nsWVFSmvVT4EU+hVbDLGjxC
         pHb/Ky4wDnILcYsGX51QKbXDnaS+lNOIGcBIM+pHqZ/T40Meei80kDwLePawR2FpYO3K
         UNi1yo7Qbtcvx/9z/Wyw2LBmffxMylvGxMKoY6me9uznx6wt74PbvMUOyXmPDKQbDyCn
         /FhlC47Fq4qIzK93TMT7+zpPFwDMc1dEx6vJbhxzYcoewQ+36wbV2NtO0Y6I6wlumDLe
         DeWtmn9VyGw7ZeAGgHlTZXiYOgmQ/HKsoleLPtchwpNq+kpaozziB6p02wrudYJj9CMd
         aRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793238084; x=1793842884;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a2kuXhqVMsHVz13E2+Xy/aRM3eaxUgD5cFHLsM4u7/8=;
        b=pPYx/14/w6TvXIHmcPWr/luVpPYa+Oi9WmWVgHkIABNLIlpOh/HIc4OViQPINtIgMk
         l8+Vk6FKTnCAmqnRJe0PcuxdnV8bdBNFcgsYn2+X4E/3qseoLAACqeyacm4m4HO7b3JV
         5uT8p1deqbg5mNkh9IfbF00xkMy5FukWS06HdRhv3OPUNNnbAWr40mdsYUaw7OTk4hX5
         xJXWHee3gmFN8I2E+jMes4SGeHy0At/4a6FifRSKGrJbvTha74S3bhRXuetjCOvxJmMb
         G5kb7Lh/UViE574DDln6SpwyiC/Yj489YFZHsxjceX1HgZ2PlM3iW6QZqmcA6jJgNZMf
         vFrg==
X-Forwarded-Encrypted: i=1; AKwUvBx3nmkFjOrgmK3/sioP18mT6Ctfy9rYvtJ72fKjQDHNkhue+hTeNz26U4CO5TQvXmVlo+c12bFh6m1N@vger.kernel.org
X-Gm-Message-State: AFq9FYKS1GLQh3wk6Eh+mVbOHRoAHCugskJWXlNb3FUANmgVW5b9KVsE
	dm4JK2DMGYfo+trr4Kh5dCY6XeOTjow8BqWyATcbL15yxpKhjgQh1LvsEWBCSozBDYdbUOMogrY
	ITdhkgvq7KgF6iHwERL3fgaKpKiCNFXFDKhaJmw/Y53uR4xcKreJSwjgIrsalXq5z
X-Gm-Gg: AYBFou06JoWgEuSy7Zw4+cSgIUYljt/l8AQHJHwl0x0zUKrjXYra0VGrGkGEgoYlrYR
	T0egAlv9YPb28AXp4dFepEhUHUvZDGd1iIEpn/AzWYhBxGHMzId6qdtzgvnRlfxMdisT1or1CIy
	AXwK7TmvX8PUJs3eErwpb9z3tE0gwclTIPQ6lWKwnlfpnrh3CYTrw6vTaEQyaf8qP6TT746BnAX
	ZOTO0TiO7gwot+0mCRhVPLPTZkwWmPo2zfgCNOQ8JSPWzf+8LS5a5hWJpMS8t6aJNgcmB5cRZ0Y
	4WPtXwDqPZj96gIE1E2d7XlPS8ix4FWPTo9z7YYcYErqbkS5lxopahpPwPTUM74pUSf7+K2I3JI
	wuX0QXACQ0RXjdGyEdqEXxOQZCS2vqpSOjIe2A8C9z0Fgp9Vtr4ZZJG/iaUlbf4K3z/f4xZznfA
	FDws4R5q38ntevFxrpPBSzkYXlE5BCA4ZNhip++616MP9mjqaHY+RQUk+t/IrDgA==
X-Received: by 2002:a05:620a:4104:b0:944:4e6:85d8 with SMTP id af79cd13be357-944132689a6mr211048685a.5.1793238084445;
        Wed, 28 Oct 2026 18:41:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4104:b0:944:4e6:85d8 with SMTP id af79cd13be357-944132689a6mr211046785a.5.1793238084012;
        Wed, 28 Oct 2026 18:41:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfd27eecedsm69199e87.2.2026.10.28.18.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 18:41:21 -0700 (PDT)
Date: Thu, 29 Oct 2026 03:41:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, Bryan O'Donoghue <bod@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm8250: add camcc interconnect
 cells
Message-ID: <6ivurpkaxe7rs5lxpbyahpst2bqzpkcb67whcymoopdgo6sjvq@xd2otcdpe6gg>
References: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com>
 <20261016170701.1504338-4-atanas.filipov@oss.qualcomm.com>
 <usade5zkrncpry4ufbdtaahoa2zyd5hx7tjgfvzfte2aqbkgs7@t3mej4maj6za>
 <3e5b7781-20ef-4e84-bb62-29a081c26d8f@oss.qualcomm.com>
 <x5x4av76vm3swozvwe46uq5vz2ys7bvo4bducpp7flnmhykg65@pvr3znxyktje>
 <a01d8d86-740e-4a25-96a4-d4dfd664af5e@oss.qualcomm.com>
 <20261028174523.3514860-1-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028174523.3514860-1-atanas.filipov@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Ju9kP84C c=1 sm=1 tr=0 ts=6ae2a445 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=rTgqbrGwJKAB67wPnucA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: QTRm0BvMegDAbJHHZrSJNt94f9cZpyu6
X-Proofpoint-GUID: QTRm0BvMegDAbJHHZrSJNt94f9cZpyu6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAwNiBTYWx0ZWRfX2Ugi5cfQRWK+
 RNhR6UAQzMq7FNPL/oP3fEBNnVn9PJTy5E157+jhoxEw5k3PE5+zLlyCCo0i8kEEz0U6ffdcs6i
 F9euIfP0JU6N8ndhp+A+FVmmFxVjS9k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAwNiBTYWx0ZWRfX4lBEjYE3D+Aa
 l1SWV/rb+SHp3PnBAQKE/hXiHMrdWc/Oy+priAnOxYSzupVWWKd97rbQpt8Dyvn01MD51d6Vh6t
 DGOSDLgl4o/uMwtyuDyQezDar0MykIFeg8lVZVQr23TlJShXHpMvAX/dxj04dRYZdswBiLFzwwp
 qpfSrePqlLmltNCiFfDnwxhcD1JERaK37LZGGqIRAB+P6lZn1pbpeXHSRFZspE4qN4GprR7lTS+
 ZGgKLRm0TLfjkh5kBr8BWO4aRkUOlKgxsy4Pfw9uQPvdK9tD8NkNvN7AG2/1EHtQ3i9KE7dMbaD
 k4ou5kFn1oNew3eNoyE6+0Ki4TRyNo7bVO+Hu7vNoDWizcjDKMSzrzZDLYeJc4hYoiYugiWu43S
 ImGYO5JMo90Bvn5lY/ZDHoCdMaS6BCBd2U37CPY3/ppXizhsK/eVz8UHQP9szgl5r4Cd46UsRT+
 LKJgVzQMXAHv55OOePA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290006

On Wed, Oct 28, 2026 at 07:45:23PM +0200, Atanas Filipov wrote:
> On 10/20/2026 3:49 PM, Atanas Filipov wrote:
> > On 10/20/2026 12:45 PM, Dmitry Baryshkov wrote:
> >> 3. Add minimal VFE nodes and let camss use those. Converge towards the
> >> split VFE (IFE) device tree.
> >
> > Agreed, I will take that up separately. To get it right the first
> > time, could you clarify what "minimal" covers:
> 
> After going through the options discussed so far, I think the VFE
> child nodes you suggested are the right approach for the per-VFE
> votes. Below is a concrete proposal. It is separate from this series,
> which stays limited to the icc-clk conversion as you asked.
> 
> Why a VFE node is needed, not only convenient:
> 
>  - The VFEs need independent votes for three things: their own clock
>    rate, the MMCX level that rate requires, and their own bandwidth.
>    OPP is per device, so this needs one device per VFE.
>  - VFE and VFE Lite have different rate tables (on SM8250 vfe0/vfe1
>    350-720 MHz, vfe_lite0/vfe_lite1 400/480 MHz). A single
>    frequency-keyed OPP table in the CAMSS node cannot describe both.
>  - Today nothing scales MMCX with the VFE rates: camcc only applies
>    its fixed required-opps, and CAMSS sets no performance state.
> 
> Proposed minimal node, one per VFE, as a child of the camss node:
> 
> 	camss: camss@ac6a000 {
> 		...
> 		vfe0: vfe-0 {
> 			compatible = "qcom,sm8250-vfe";
> 			clocks = <&camcc CAM_CC_IFE_0_CLK>;
> 			clock-names = "core";
> 			power-domains = <&camcc IFE_0_GDSC>,
> 					<&rpmhpd RPMHPD_MMCX>;
> 			power-domain-names = "ife", "mmcx";

If IFE_0_GDSC is an (indirect) child of MMCX, this is an overkill. You
should not need to cast votes on MMCX, IFE -> TITAN_TOP -> MMCX will
work for you.

> 			interconnects = <&mmss_noc MASTER_CAMNOC_HF 0
> 					 &mc_virt SLAVE_EBI_CH0 0>,
> 					<&camcc MASTER_CAMCC_CAMNOC_AXI
> 					 &camcc SLAVE_CAMCC_CAMNOC_AXI>;
> 			interconnect-names = "hf", "camnoc_axi";
> 			operating-points-v2 = <&vfe_opp_table>;
> 		};
> 		...
> 	};
> 
>  - Only what is needed for the votes moves: the core clock, the
>    power domains, the OPP table with required-opps, and the
>    interconnect paths. reg, interrupts and the remaining clocks stay
>    in the camss node for now.
>  - VFE and VFE Lite get separate compatibles and separate OPP tables;
>    VFE nodes of the same kind share one table.
>  - CAMSS populates the children and uses each child device for
>    dev_pm_opp_set_rate() and its ICC path. The OPP core then sets the
>    clock and the MMCX level, genpd takes the highest level across the
>    VFEs and the other MMCX consumers, and the interconnect core
>    aggregates the bandwidth with the other camera consumers.
>  - Without the child nodes CAMSS keeps its current behaviour, so older
>    DTs keep working.
> 
> Child nodes keep the camss node as the single entry point and keep
> the change small for existing DTs. reg and interrupts are not needed
> for the votes, so I would leave them in the camss node; moving them
> would only make the child nodes look complete without changing what
> the driver can do.
> 
> Does this match what you had in mind?

Yes

> 
> --
> Best regards,
> Atanas

-- 
With best wishes
Dmitry
