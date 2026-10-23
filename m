Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792736931;
	b=kTVrL/CooDO3aw6efbMdmkw/twzy8CdoExmXXabVkJPMSP6im9O7ny8ZivnmFQmHtGWl
	 m9zkJiw9dLSEiOO3Lg7XikWbxYlOPcFFQ8c5qIsrAQDmShfnL43MRqUddxUB4AnttbbEI
	 +8QaKJInzIEqVIWId0TJ5s2xPAC3z975pypDrxZj3uytV4yD3uP9Xb5edVTTrR2MIFAWt
	 tYpTzpblPZMDmErbUmt1s5imodQe+Xowlz47BevD/6SFyCmlC1bE88oDWh+gHZrStFKLV
	 xFUM40ItucpDHiUoHBFlKNJ4kshDmeF0P/hI84sJA9GkkWRW4m9DbmWfGF0r5ecmuFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792736931;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DW2w0x591pvjHkfz8jt7Fqo1AwPIyp85Xma/TxwZuQY=;
	b=O3uHHC6iaTDQEuWKDN1Hq6LjDJyoTh+7DSOxZxDBMHlVwsFMaqVoWuCt9VTbLB30yo2g
	 PoAoVsHTxVOW1kLYaTzqFoYJ18mZ2c7hfSpf9Qjqb49de+59vx5s3oNofG693Z/l2wadY
	 fbNIuheHBMvDk3UdS/blNFtWt30/6y9/vjgLJJTf6igoS45mhrTspUhked7tRYE9MgigH
	 0G8X3yYS/3lrqfSy66g6jPxOKz4InvTTr7WpkWKAGP9ULyyT8Axtrukoa5BoZV4RFr3ZX
	 ZxzIa5VN7uD/c9wsXMjYwR1OOTyHsdDCAcr9suGSkHFXjiPS4ieye97PBn15FUb/3nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m+u+GPLB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XlZSfhS2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3188D606A31A
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 06:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3188D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m+u+GPLB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XlZSfhS2
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1FJ9K1793758
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 06:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DW2w0x591pvjHkfz8jt7Fqo1
	AwPIyp85Xma/TxwZuQY=; b=m+u+GPLBPWPBd6lTolvyN8SBmqB80emrAO701WFU
	rJiByVr/KqWc0kdL1MwrXF+dj8MH25FWQGdMontfbuxAh3rXEFxvID6Nfbg6yf/s
	ojJWPM2t22z3tdwabCyJmadKTAjVLyOcxf0ft72r44SQUtFpSqLyLz9EIXQONQaL
	cc51rE7M4lhu7HhTtCJI/HUGUjD5bdMnUswvXjYP+EgfNm/MqeYcaG96Gpt75n2S
	FbPaZHKH2PMaPOaoQ0FwRcRsKVqmZkKRilDTl9gej6SzC0bjFa3eCKqAxS/M0CLd
	6dXu4oUUUKE05Wy9bJx0NKlaVdc8kOkPR5G1lICHcnhdPQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnq0jstu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 06:28:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e9a4052726so2121915ad.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 23:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792736924; x=1793341724; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DW2w0x591pvjHkfz8jt7Fqo1AwPIyp85Xma/TxwZuQY=;
        b=XlZSfhS2ke5TU324pzhJKCKbiqUVmFtpPiVHV3jKSyigQgYqGEZeNaf8ucVjyK8noD
         zSIv0udnso9fZrzw4TP6Qj3I6cWl2tzXZ1ENXxw7bQlo1r6yWI2YA6/Dw5F9O6L99zB2
         GR7RKEt/e/KS7CLG0IkZ4ilFKQu/E61uMw9yxYsW9nInamX5zDuH76YtPrlEBVQHMiIc
         jkdI1bqsGvESrwA4oaj15pIlo8Nilu5RcdL9LVlaML5TbtMihvcvCNAD1grsAPGpQGxv
         T0uWdTOB+wfTrZWcxuUQz58l+CHtaKPVMEyTsTzWgmt9la/rKdQRxeMlKgeM406B9/mV
         swJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792736924; x=1793341724;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DW2w0x591pvjHkfz8jt7Fqo1AwPIyp85Xma/TxwZuQY=;
        b=wlgTnQHQ9/itOSkUJNjlaC1LhFQUhmPILf/socV+8WILnlEGWS8MPlXyKIz8F34Ty8
         1K9HhG9zMzXHcgiRmLiCuw0saBpBRQ3KT/kGc0JEyxY1Xt710RFxhejp8hHqJTbreQ4o
         wm2fYV5aT/Di4Zru1svRAt9oFjmoZn1iDtsqpzcvXUw7ff7GAnX9IGeMIHztUJM+lHcl
         uGSz0EQovWX4zOGRIe9t9GoIGn8aL4oUGK5BmphoOgwOEhpnK/bxnXIRyzGiu5ZHqso8
         Cf68h/+B8musa7OrpSGwKLvO6i1RA44IZ4O0bH8YvxEP4sCLOkFBE2mr6U5cSG7b9zUy
         /XEg==
X-Forwarded-Encrypted: i=1; AKwUvBydytxz2osMDM3wLuROeMSpBQi7AHIRzoEx5SQfn4RJCnov1Q8iwJl2oU5j4mu7c5pluNUc6ATwpsiQ@vger.kernel.org
X-Gm-Message-State: AFq9FYLvFAECNz8HDVAwPLjjJRYXOUqC4/7oEo9Fins7OGMr2sB0PLTi
	Ee5k+12/oN4FvP22+YJXmsQ2AWucuh9QLYlJ6DYQoU2smLYozSaqx0deiItztApG+6Ggfemam1H
	/TbK2qYs2J2rPlzEHl9spSbToaI+N5imGywSgynE7DkRev8mWZeyICe1+LA4cs1dF
X-Gm-Gg: AYBFou2LsJsUSgbJXQj1rqI7qpJH0pg61t9fcOasZtXRrON8/o635FwqPL5U70VHFMG
	XO48t2lWsJ8QB3k5d+NaHgfllJQtmMoAItAY4/SGnCPupNqae3qCAHNI+Y6uWE4IztofGjQSPtK
	OFE8m40mWsQwBH58ifBt7UhQKB+tCDUagCA4jJ+cHSdkiB5PACXsBBfnIxnUoriyB0eyNW8g4wX
	utnFzAuTXknFW3SPR8CDkLGwB2oPwtO/eb1skfloPad8OmMWcKRPiIfr9LqXK74DD5YqTmYFBXb
	dxooGuv4fE7Qchdd+5v+LEEgHPJygD1wt/g6pIjuYSDfQuynHH1ejmVnH+Tt31DWtfG/JDy3tFK
	kQZPiZttRj/nuCKkw4kp03V+I/bjKyhiwPQrD9vS2vHHVYn9b+TPq2rtMK5ABqvGfkUSFeDBZ6H
	EiPdVRhPUvxPyr8j6PWCsR75sFdAK/AxmnDRLccXURsD6mYy6BvtAv
X-Received: by 2002:a17:903:390b:b0:2e9:d00d:1307 with SMTP id d9443c01a7336-2ea7cf21f70mr23118745ad.3.1792736923951;
        Thu, 22 Oct 2026 23:28:43 -0700 (PDT)
X-Received: by 2002:a17:903:390b:b0:2e9:d00d:1307 with SMTP id d9443c01a7336-2ea7cf21f70mr23118515ad.3.1792736923522;
        Thu, 22 Oct 2026 23:28:43 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b3b01a6sm5982175ad.44.2026.10.22.23.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:28:42 -0700 (PDT)
Date: Fri, 23 Oct 2026 11:58:35 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Subject: Re: [PATCH 1/7] arm64: dts: qcom: shikra-cqm-evk, shikra-cqs-evk:
 Add HDMI overlay
Message-ID: <atr+k3qqNHWHlvmh@hu-vishsain-blr.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
 <20261021-shikra_display_overlays-v1-1-adaea735999f@oss.qualcomm.com>
 <f74579a1-11ca-4201-9bc2-369d5c2dc58b@oss.qualcomm.com>
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
In-Reply-To: <f74579a1-11ca-4201-9bc2-369d5c2dc58b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Dxp2Q4jS1wKPLcsR_whW12OkikjFdjun
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNSBTYWx0ZWRfX3ZJqmiF+m7Fo
 NlsZRzMxO5Wg8ok6Dxh1CrYpjnL/kxYarZkBe8Jz/Eucj22zEjypSETBwdZHLftQcVfhC7tAAdu
 QYz9/yCUVZWY64DFDwgHnYaBkHIUymLFypg3LrZFnvJ/GCWsrqDdWt4intOMVOPqx3nW6XcRxwS
 pA4Jsw5MsWZGGsqbd2dbX+MEjgfNq6NWnGWHMaDq+9Keuvtgaknjw+8veov4QwE5aKrjesuF0aY
 EmJu2szeaXqCfUK61jUTH1TUfPeGqPxR8wS9JDDICzBWSeamqjjDNxOhFC30ZED5297AL+YXKE9
 reRsdin7/qK4PwCUwbvCx0vcjASwznsPXad50wRawAU+cuYFPzni0uIYbbJtu/lB34mtEXptIgS
 flDykP6w0G7/HHRwpyJgSSuawd1MiTxVC5WIi3sZ4+LdNNd3dDrr98mkAbka/RItjWNvPWonU+1
 n+tBWZeK7mN0UfOEkug==
X-Proofpoint-GUID: Dxp2Q4jS1wKPLcsR_whW12OkikjFdjun
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNSBTYWx0ZWRfX58gj7bA9t+9d
 gfoOoSKXvGC8NPjZMgieuyVhkWYwujgG2uRTk9maVb2r4N4R0zl19H6xEqkLCiLXUjOw/KJrshQ
 GBRg33Jllaz50FwCdUk3lQ2TyOWmdkA=
X-Authority-Analysis: v=2.4 cv=UaHE26SN c=1 sm=1 tr=0 ts=6adafe9c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=N28F3utlMq1gC_S77h4A:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230025

On Thu, Oct 22, 2026 at 10:13:29AM +0200, Konrad Dybcio wrote:
> On 10/21/26 4:21 PM, vishnu.saini@oss.qualcomm.com wrote:
> > From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> > 
> > Add a DT overlay for CQM and CQS, to enable HDMI output when LT9611UXD
> > DSI-to-HDMI daughter card connected to PDISP1 DSI0 on carrier card.
> > LT9611UXD is connected through I2C4, with reset and interrupt connected
> > to tlmm GPIO76 and GPIO85.
> 
> [...]
> 
> 
> > +&mdss_dsi0 {
> > +	panel@0 {
> > +		status = "disabled";
> > +	};
> > +};
> 
> Please refer to the panel by its label directly
Ok currently label is not added in base dt shikra-cqs-evk and shikra-cqm-evk,
will add label in next revision.
> Konrad
