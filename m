Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACF8334692
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 07:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788852229; cv=none; b=SSAFedAEtVAp+r/zUcD3yqefCt3KtLRUJBZNUo1g9oxdeu/YesCCsVqZXStryha+9TI04AI53LVgu3JApTEFeOLhS4MA7cit2d/thpqINDRsIqcjT1X0XNMy8wEeoaGxXRcFiNdiEItivrN1gCwZOtaer7oBc0nTRrWuntRp1Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788852229; c=relaxed/simple;
	bh=0Hn3nwFflocQDE1Vnf/oZsgxF4q4ZrlzvFiOG4Em9aI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pbHh05YiBn4QTuiQqR38E09P5Abrx744POyj7EZdSt0WPB+Pxio4LY3GMdemTXitQWjB8Uz8EzaPjHilO8sredq53gyQ+dq67dUgta76FAuhjU1o+N/Ifa0X9LHUjGJwXvy9dhRJHlXz8Zn8R+vypnu/Mgeacu7g9EVT+8zaA4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gAt3yW2A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EE9n50bc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gAt3yW2A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EE9n50bc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M3Bj1479002
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 07:23:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=repPIlp7EV4oN5ph2gAva5Wf
	gIj/jHE07iTHvT9P2zQ=; b=gAt3yW2A0/zE7b8Wn5f82T+fA4l7lq4kudwqWMvC
	adw2vDQmfLzguOQnOKVRgc+CptAbjA4k3bbFiPYItE+pZhV3tS94rzo1j7VNqxGe
	nKuTI1hKNJHvvEJorFf+juJgYSsKNCg2esVmi85pvdYMESKGSnFFvyNAXAehz6Io
	pKPWCOG568TXw5QQVeg0hphYQiIa+cT+WkThGj2+0iWDQl4OmuDaLxJJ7Xn7AcNl
	SnThu0XD8uwvFpG9EhxkVHsnc8NlMOL0/Ce5f9PVcRbXx3AesZU9Whyh3flUAf2s
	h8sEJhvc65j1KhiURLf7A6luPK45cFDWb8MdKeXEy+0tHw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjatjgqs2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 07:23:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc487bd6bfbso1346753a12.3
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 00:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788852226; x=1789457026; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=repPIlp7EV4oN5ph2gAva5WfgIj/jHE07iTHvT9P2zQ=;
        b=EE9n50bcw6o9gzcOVgt7yyHkY9bq6skq50Zobpd+BwqD9I3pGaO+Mp7fMRolx8GM4h
         OdQYlZS6TI2Wk1zo+JSHOn0uylTJTEFXG175stMRste4mLvkMOMHyySTL8lQKaszTaXe
         7qTlrLgNCVxZ9h2B2BHszoiNh3F+d9BI36c95spKZpBliCbQF6BoMulTEXZ+4gmJnIXl
         OOUvti0sz1DYR9eiIh8OsKjSHOI8oBNrar00mAzZuP823RTY/2ycBYG88cUBjO9KRfCG
         XOj8XBEjWtsDH8IhlOd0eg4XnlYMIqYr2qAeJVym4BbTnSokbq50DrRo7hqt5dg385cE
         +5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788852226; x=1789457026;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=repPIlp7EV4oN5ph2gAva5WfgIj/jHE07iTHvT9P2zQ=;
        b=R18PxV33NtacMJnlcEFKbfvnFDTHiSRAn4IcHxFoelLU56PrShRQ6ExrIyn7OIq7cT
         DawU3RRGQNsRXDzqWCk9HC48UFuAgt59kNUus4VSw4t266wE4I04FPCFnpoohPIuFlz7
         RC9CdiN17qKSvWXm+rs/bw0tGxbr5v4J1xb3ejlQzl5vg9BJjOYj7HkPXY7Co5KidCZC
         gDeVNFXDXEiYJot1wRHYgCr5OTEAZU4yDdKCadmwgTy9fOp/hMFB05TgkHstRtCNxF9/
         ldTMpvjvz3gWmV50dw6T8Wvn0D/6IOCCSxEJ6ywpn+FLk36yOyaZZioa04BscoL22bFp
         wstw==
X-Forwarded-Encrypted: i=1; AKwUvBx5Z19C+iNHhTvJDIDBIowai6iKTEYsV08Wb6GPjgYRXAwxKCeZAHNilnMp+92qJj5orqeccaH67lA+@vger.kernel.org
X-Gm-Message-State: AFuF++nQj+ppjJTnd7d8LLUeRB6KOaD0wkOyoOlwG1KxHcmUYeoVhZSi
	mRZew6bSgeOdp/3Tv+nK9Ctf8HAfS23vWvacE18HHFmJEHHQ+zvsH6ompxOPuqwOWc8yoGFkmY5
	XnXOihZ0PoekY4ib/4Plt9n/SnJC0uSmZzbcpgCOIyAMti5wPy6/IQ5zpUmwEwvFV
X-Gm-Gg: AYBFou0FehkJ2GHh/5hPo3OJnsveDUjHlRPFCLvTuwpDhmaefC1tVT3bjsta4Cfdgmm
	phA/JM0nWvuXv+WzYT0e5yIEgdP/P21XctZxuiq1HvcvCc/L7fmkSFLARuQCAtbqsqSfQWHu7DZ
	ZfZn4LhETCs765hOnt1IKxEHgM87bNVS11DJKAZE/ajuLX6FBt0Nxx1upNuwG3pY7tIRZ/pseIR
	GxNi2FHFJwaspaeRw6sJTeN5KeAV+VzCyyYaz4hiL18NfmlJSbxM6plCb2gJkSuWUN9efe7N9UT
	4ftkOtM9VkWiyS+gHsOZKqv7TyKTKAA+6CeArwtwuKVYtjX1o8+dZEciR8H+Ga4iul7FpQqwk8Z
	9NeCbfhGRXel+gQ==
X-Received: by 2002:a05:6a20:2583:b0:3bf:7bf7:7913 with SMTP id adf61e73a8af0-3da39ff4716mr38887949637.14.1788852226275;
        Tue, 08 Sep 2026 00:23:46 -0700 (PDT)
X-Received: by 2002:a05:6a20:2583:b0:3bf:7bf7:7913 with SMTP id adf61e73a8af0-3da39ff4716mr38887881637.14.1788852225783;
        Tue, 08 Sep 2026 00:23:45 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b9f68e4sm35845902eec.24.2026.09.08.00.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:23:45 -0700 (PDT)
Date: Tue, 8 Sep 2026 12:53:37 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH PRELIMINARY 0/5] arm64: dts: qcom: shikra: add Ethernet
 support
Message-ID: <ap+3+Xhq6ygnPzQ7@oss.qualcomm.com>
References: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
 <e9388ffc-ddc8-456f-ad7f-1d185d35ab69@kernel.org>
 <ap+zd/2QmerMwi0o@oss.qualcomm.com>
 <c23369fc-84ff-4881-8327-c18fc3692306@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c23369fc-84ff-4881-8327-c18fc3692306@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfXwy7bjsEu7iDZ
 ic3V0gvoKqJ29gpenGl4rWfYRG4UgIk7cNbfhZh9C6F29Lz3TGyFcepg8m3o9SWYa9cYd7roC5e
 208QNB2ByQFWXF/GmYZLMknRKePaXjo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfX3jhwvYCxv2XD
 7wM2PGh3NpyCvBglZF6APa5c5LqaGHJUgkiXH9Wd4xClMan59NqfMtOAJfXoJmOGKoZLrYLzz9y
 FtYH31KAWR67UJsaxzVrv6E74r0IRTaUZEMHmAqDQG0q0kgiBcvFuQaSMTG9/DoURgFaq6vMc+N
 j9BUQmvUBIYJi4YOUn+v69X6Etn1nG1vKXqKP97jhH54+YgAXgzzqv/MNSJOYYqAOaO1HXFHeC1
 AT8zPK+7RA1FTwPtD0aRtI2oCCcSWlGplI4EeUrqVHM2j6AZ3izE0zZCEVSLiUGbDwKG7eXogqw
 4tEIs2wWAYR3TWnW3f5EB4DBiC7yI/X6i0XLaYXXiQdEz/DyLPz9ChTpS5FoAQmzxA6euz7NpoB
 2kTk43utu7rEliaVWfiwgYpA0FMUGPk0jwoQD2zgAieeg3D5ZYWPo3e6b6O4bUjF3mGAX5mi/qF
 J/bxSoeGkTp57HaYung==
X-Proofpoint-ORIG-GUID: F4KEbryKwZKri_gzCTSz5iGsvyn8-di4
X-Authority-Analysis: v=2.4 cv=QrduG1yd c=1 sm=1 tr=0 ts=6a9fb802 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=enzuNw960j4ePshAGDsA:9 a=CjuIK1q_8ugA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: F4KEbryKwZKri_gzCTSz5iGsvyn8-di4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080074

On Tue, Sep 08, 2026 at 09:14:45AM +0200, Krzysztof Kozlowski wrote:
> On 08/09/2026 09:04, Mohd Ayaan Anwar wrote:
> > On Tue, Sep 08, 2026 at 08:56:39AM +0200, Krzysztof Kozlowski wrote:
> >> On 08/09/2026 08:23, Mohd Ayaan Anwar wrote:
> >>> Hi,
> >>>
> >>> This preliminary series adds the DTS changes required to enable
> >>> Ethernet on the Qualcomm Shikra CQM, CQS, and IQS EVKs.
> >>
> >> What is "PRELIMINARY" patch in upstream? Where is this process
> >> documented or expressed?
> >>
> > 
> > My apologies. The code is ready, and I was hoping that sharing the DTS
> > changes would make reviewing the driver and dt-bindings a bit easier.
> > The original RFC had them together, and I split it out for net-next
> > and linux-next.
> 
> Yeah, but why calling it completely different than every other patchset?
> Why coming with different style? Why this cannot be RFC?

Agreed. In hindsight, this should probably have been an RFC v2. I saw
some recent series using a PRELIMINARY tag, but I see that its
ultimately just an RFC.

> 
> > 
> > The only reason I added a PRELIMINARY tag was because these DTS changes
> > should go in after the driver changes and dt-bindings.
> > 
> 
> DTS cannot go after the driver changes. If that is your requirement,
> then original work is broken and needs to be fixed.
> 

I should have worded it better. I am only worried about the dt-bindings
going in before this DTS. The driver changes just add support for
whatever we are desribing in this series, they can go in after
dt-bindings and DTS without any issues.

	Ayaan
