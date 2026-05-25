Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7328B37DAAC
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 11:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707284; cv=none; b=pviKYUFoYTb4ShwPyonQKjPpJgt+IDPyoYnaMdcCry0zjuKQ6VPfIMNDW4SEnfNQF4VRXOtYYLrU5FPGzzL7cPgull9KCDnY/ehCf7aYsF5eW/0QDhRFMmd2X5yNXv37mMZt8LrA8aXgFUbQfLOnMCCnccPXEsc9gcSKt/c1Azc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707284; c=relaxed/simple;
	bh=SRrxAHl1aPSl0RA0gCDQFT+KIos9pY4JXr0PnQa3AZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ea/i28A3NuY5B1ZLbklUKnxEc/mKeORSK7L6obe7ZvCpsC0EEgg8EfnfuVRMAfAVieA3HuSEe5Y7ACPzD2WbLBTYeibtxXKVSFZnw9gdL+3cJrAQ8pAFyl8WKABrza1A62TD0CIx7xoqf5r+O/QJ1KdUY2ap/4nL25QNeYsPS7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XVS+dLy/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GtblI8Ik; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XVS+dLy/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GtblI8Ik"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P8lFuc160817
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 11:08:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BQBUQK+ERcgosuGR7NTC0wOZ
	R9xugN2ow/YBjTyK1Iw=; b=XVS+dLy/RFtu826qPtQMuxk+BHyD5ZXsASq4GYvG
	1UhkAaRZLGsZS1qqo60dlz+3TKh0TzAi0METbxd8pdlrtVv+XkxXo9f5XgSGEp33
	PQGy8s0G436YEymGx7nlWEQhA7U+E7r/zybdER/dTe/2pZCzf7KNSXOxQZl4uKVN
	xJDF6xqEXG5+TL8fkr8lfDSkl+DF7E2ZEie2mV261jkg9ZPZ9rIofjtsvYNYlr8y
	E8l0tHGmzbyVD+jAGNRwMc633sdcFVgqL0l77S8ZkdEtcWyrwwepctsdTGCdcHSD
	lCq4ZOYOv8UvfWLcXDDVr7mZapD3d47NCnF9OO1wxVLdxg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb36t6j0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 11:08:02 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95f5daf2d5bso13248379241.1
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 04:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779707282; x=1780312082; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BQBUQK+ERcgosuGR7NTC0wOZR9xugN2ow/YBjTyK1Iw=;
        b=GtblI8IkDl1TuCiBeqtqTyzjvXdgwL3DUGXglqIGRleIDxHtRKr4S8CMMZMkEch6lG
         o9Z79etXmPudfx7rouYI97NgW3nbidNUNrRWisZ6rW6BYxqsHnM9NKv60QpgauZyjPan
         c1WCygQj0LOM/h6p08Qhw9FiUn//Wh6jW55mjbIUN1YyogamaFrw+z2GnoxexeJQyg0e
         ppfxpjD1yOsvtj18AcD3ita/4zpfZQ3TzRlg4N1/lsO6Bl56k+O1l14AS0W+74jJYfYv
         iZp63ioVQJOjBqpH5KQdoXxcnejiKJ6DCiSthoiFAZCxReepKt4OyQKHPMUGVKhjh4kc
         DLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779707282; x=1780312082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BQBUQK+ERcgosuGR7NTC0wOZR9xugN2ow/YBjTyK1Iw=;
        b=MNGC4UapzxgWbaS2+6KJKEIRv8Utd6HmnaanSnPyLcL2BqK7u7SHp7dPuCbmPbsgxI
         l/dd6OMuzeOE/2h4JCLuei2oJO31/QUgO8XnR/mM6DT/Bqtf6YjN6rL6IN39u0wLNMnG
         RZkuYjE+qfOZCEi+b2cvzlbjZomk56W5S92ObkrjHRzxF03coUC5nsPpKzRwgyuY1d4w
         3In8dblxboK3/eva4X48nGu+PJfoA824vp0Z/nFQZ6Icm7+7LGVqDmKj1pbUu0ECN2sk
         v2e1SUNpyK6tSHDMp8NBCYfLXjFPPRfHNjbzjkv18mGNYW77O7RuccetLUZBdHp/viCk
         XIUQ==
X-Forwarded-Encrypted: i=1; AFNElJ9SPPq+1lLLMxKpm1KAkrsrPfSHoN6V+AwB8EBjWBDeLLBExVxh99OGTWgLqpe5DFaD2iGidgCRTSsq@vger.kernel.org
X-Gm-Message-State: AOJu0YwWYcgDJH5UCKMNpu7pcnaAsEnsthEJbNJ/wMUnogV/jCnfHuAg
	uOfUJJVOEXgKZ6wRFaWzwvFSIsRPUOr31hEMg31qKt77UZdXgmcvnQtKC6TVOxwClWoXrxwuSuI
	xGN93XprO8JjWlbDXaOExfbPtUTPIxbBpmqZMgInYuVpj3nNi11ikV9tFkel7EOsA
X-Gm-Gg: Acq92OFBz6IyVbGzyVSIa/zz61Kn4qj+//C1tlIGR2aYz9PHq5IMTjV55DiEuu83LX0
	eGKWEbq5xl9A2HFFsa5RclOTlCqsbyM2Wyv8ET+Q0K0wwB8SQt0oEDozAiQfw8PVdO3NwC0xH+4
	K516mfeI6eNOwvrEK3JaBg1mw/zd/MgsHqrfXRt9gFi0/Yamnpl0t+THnN84u1wvCaQu38+529W
	khtujcAMXzkwLItELa3FjQIHYsPC8G8zBb4JGGoi+6gAlDFdTxnZqamX39Ar/Ik6j75G9YcHB9i
	RFV1wyQ5MWjPX3d82vsgGhvGP25eVR2FRyag+Q0dIkkeAAZ9c41tm57QEnV1wikcN4nzMG/yni1
	R78D4m6piXaSmTBkuutDhaHMTDfVZUOJ+q3H0aHjhz+bcSRbwNd5zjVZcvPM5ZhrI9RxslYO8k6
	FyBRTO4KkHUnlBpfrIClY0Ge+NsxZBVtbFLQc=
X-Received: by 2002:a05:6102:4b87:b0:632:d8d5:291b with SMTP id ada2fe7eead31-67c8451a9fdmr7416019137.30.1779707281650;
        Mon, 25 May 2026 04:08:01 -0700 (PDT)
X-Received: by 2002:a05:6102:4b87:b0:632:d8d5:291b with SMTP id ada2fe7eead31-67c8451a9fdmr7416011137.30.1779707281261;
        Mon, 25 May 2026 04:08:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cf4f1csm2578738e87.70.2026.05.25.04.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 04:08:00 -0700 (PDT)
Date: Mon, 25 May 2026 14:07:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 5/7] clk: qcom: gpucc: Add GPU Clock Controller driver
 for Eliza
Message-ID: <kmscrht56ljnkntponlvzuumxgdm3d5s6ttye4hwtq3uaykwsj@z3pyzcib7pk6>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
 <20260525-eliza_mm_cc_v2-v5-5-a1d125619a5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-5-a1d125619a5a@oss.qualcomm.com>
X-Proofpoint-GUID: KvfCB9Hiapk9ILJ4j9NObCI996hUGltE
X-Authority-Analysis: v=2.4 cv=Fto1OWrq c=1 sm=1 tr=0 ts=6a142d92 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=whjPl3NbLinN2m9j5McA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: KvfCB9Hiapk9ILJ4j9NObCI996hUGltE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDExMyBTYWx0ZWRfX+bdyL9f7AJ4V
 khM351rEXMYROSUoHl9BNPswTqloGgZhe7Bn0mf+GOLnLNybS7f4dpAvQ06JReVUjGti0ie6GuT
 31aMKwXSoSspjgeWyLqDSeKo+OXrOiJ/4SJxJk7cQo1wIMN78LHMaC3xcoW52XTm7s1rI88gKeA
 BpqkCkGjSFogh7vkps8CQw0rKmYJOek3Cpdz+3wSCMNIA/LgoVi/luOHg67xFF9vXJhNqxDsbsv
 G6C/ODMG8xBvN5/d2qtE1XgxHZZVJQfyc/FAGYAnG7/8/4WJD/zdsIyJ8j5MLdaGz7vSpqlulfE
 OLeWMD21Alr0DuQJru1g6aG8x69uvaY5CQzsmcgo5mO3ZphFWGL+8EWj7qZFcpuolHiolTySpME
 b1Vz0pEv3xd/RXdWLJcOWm8g2BDiRuB/pc5tFg3zIIFhJ24B8CWBJu7mujNtRSHaqwPX6/h4rCH
 lSpFob1croeXqxZnueQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250113

On Mon, May 25, 2026 at 04:16:07PM +0530, Taniya Das wrote:
> Add Graphics Clock Controller (GPUCC) support for Eliza platform.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig       |  10 +
>  drivers/clk/qcom/Makefile      |   1 +
>  drivers/clk/qcom/gpucc-eliza.c | 607 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 618 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
