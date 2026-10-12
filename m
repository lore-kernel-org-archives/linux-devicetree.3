Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129AC489FCB
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 12:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808215; cv=none; b=Iu2pIGbVEsZ7KCsDK0yqqktb5u4C9IPFJTR10XMOqMzB0ziMWIsH3ZWqRDBY/VpCw++69FEhvRSZX/3wlB7tWam314opizMQyMh4Bl3ggoI0MvGWw4iRQd5D7X5ZcAfzcqMbR3RQIz2VDioWwAg3wpjnlQ39r1SckBuWK0vwARc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808215; c=relaxed/simple;
	bh=QBgS5vvmhHg6BOQCaYPvAzgfAee6J67gwubuPcqgVFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jbsfFDiwpkW1ne3jyYJL1iVve89LJ9PKdKHXW5N8myAqzgudYbVCw7nLG0anToGQ9Ye++jLiq0oGwvQnGGO5ZfEKyqOOWcbuH9VvMewyECLA7s3A4TxNLuyWe6ojgCBjVf3Bb3SG8pVbOueEUFc0awxHhuwXyQHW6dPQVptLsHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XSCvE/gn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VGj0fAdb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XSCvE/gn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VGj0fAdb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0a562679898
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 12:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ls8AOqBpZ2ngBQoNAA7Jpu1E
	3UX0n2AiAP1xAS2NcXg=; b=XSCvE/gnw2FUgpCu5FLGovGPGy6CyKoI27ZHt8s6
	DakM8ar9srcToncPCK2bQW+tZf+qZNX2wzzuHM/UBMl1KWSm3zqsxQZZOPVRbJUm
	HIfqMJmdYY7nuOKYvogJc5DW5+lRIlAGZu8ZclzPt+nFYxGgACDNPv/aNfcdaVCU
	K4k1hM5FJmVBjtK3FpuhJFd6W/PU/eA70y6ZaM5KacnJrW6O//niDX4mowlyywPI
	I9qb77r13hcqAiaT/6WsWMQDHsUBK/csAwHOqliTIenpKFHVD690UylLGgpT6yJO
	jftjx8tIIsxOydyNKbD5RAZ9vUSDekzxQgwF+5Ixh1RyJg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1swmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 12:30:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a3f673221so569362385a.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 05:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791808204; x=1792413004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ls8AOqBpZ2ngBQoNAA7Jpu1E3UX0n2AiAP1xAS2NcXg=;
        b=VGj0fAdbhd2sVkWvLg93oDmK9HOr73Folr9cIBVzRjT4Z3QpuQuvYvM60j3HHT1yHf
         C+xDUtsHXrKAZKXKyeCsZ7Sf+xTYNG5zGxSxNQ0pFnSDtPtPMl+5VWJqHUAEA/8sQBWI
         WLDYUpDgF6Iwu9SKn3Pi0Yy5RoBV1tWCi1cjUDvKiNQ7MK9pG479hkJBBcZsVn6bU9bS
         t2CahUTCe+zUy1h9CGp4Br9KvU2s2hmKFXiEMTPhkRNASw3LOVB0FlCUh4m4OW9S+cUo
         UX9fvAuA7fb7gHwNcRcxLljGV863xPmDcmVmrUPOj85zOkGRMDtTaab/fu6A/Lrdjg0j
         5v7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791808204; x=1792413004;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ls8AOqBpZ2ngBQoNAA7Jpu1E3UX0n2AiAP1xAS2NcXg=;
        b=2riRPWTscGH8fK5/cvGZbKAWRdR2EmtKqFM31g5fiwTwa1DdtMW4vXz9RrHlmTrCHo
         DVqN4ZBuu8RELdRzeQG12xpZj+hYgpdVXqjWAC2x6a89gykQerd06W5+ayY8Y/6v/HP/
         HhTB8kx6korOsjyDZ8vkM7eNk9G5uos+6dpUeiO4UuzuVuxdbALhsgBk87MyYPsRBrWN
         AJPwXuOdOUsDVy+/s2igmvkGoctMW96hJIj6zeA+R0UmuyOEacDcmgIIZzhK82HKhzPx
         SCbzDOh9e44mAl73fA8Q6KFsvCWtQevo2PmZ8MjqNaVoPKEy2Rdc0HYON6osw5RwoGCW
         CLNA==
X-Forwarded-Encrypted: i=1; AKwUvBzWMZsftQkShES1a8xS7F1JrQX34B6B8HYj+iiI3/4kIdKfsY5u7yAzFTHVfboB5o+e6LjoWzc+cjTB@vger.kernel.org
X-Gm-Message-State: AFq9FYIiQavyIzXpHTylzDQKvK4JUOL3YPBNo5v55YIPYgN8+C8HuQzF
	VSTRhDpbe22dbM9MBBRrbcJAooWoFk7uplAImzsx5CPFDXURWWoKx49/WKGsPRCEr+SVmY96sKp
	G3QO1svVD9zB6ZklY208RhuwmCmBtM1qF2zDcOjVaN4bRyzCfiEr5e0m1qX8hayx7
X-Gm-Gg: AYBFou1O7AtC5LQHziWpfi3wZhILcLCuIjOqnZAD2vhfv27NZJysIGJveLWyVHfy6X5
	NEVBfALTtkt6g3TLQgG1TuOKapyYP+ncz7pMlrjwzovlPSTfLGIr2S64HK70oSe5U1m/ZrPT9rk
	H0Qj+edPedxq5pqAi8mGQfXqamIDJ6jTSB53Qf5D09E5H7stExWdtGUhrMP7xB7HZpCZA8aNzgs
	yKwtcBdixW0AZeUrqqzHbcNEyO1BfW8gx8zbcoBh1sQ4KV0rDGjD0egcPf+PQUg2z8zoh8uFAXD
	RJ1vipt3kBOvqSAWCI3KIvPVOfQgboZH5qwf6wd1odpnZHGRp64zogWk/KB1b5XGfZhRzXVs4ID
	L6PzPzwfhUIJsd6168H9+N6sZoBwxc0TXR5RTq9bh4WFqbygvNcrsncwvCqi0dle8HfOUHjc595
	MvHAgu1UNYKoFM
X-Received: by 2002:a05:620a:2259:10b0:93e:f1a7:a20 with SMTP id af79cd13be357-93ef1a754a5mr35778785a.56.1791808204169;
        Mon, 12 Oct 2026 05:30:04 -0700 (PDT)
X-Received: by 2002:a05:620a:2259:10b0:93e:f1a7:a20 with SMTP id af79cd13be357-93ef1a754a5mr35776485a.56.1791808203701;
        Mon, 12 Oct 2026 05:30:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3cca23csm29408461fa.27.2026.10.12.05.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:30:02 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:30:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: display: msm: Add INT2 GDSC to
 Kaanapali DPU
Message-ID: <aecrclsbhu447xdfddwbhosyvhyvf6dzfv2nfznupao4oh6a3j@mqc623n6fnkt>
References: <20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com>
 <20260915-msm_gdsc2-v2-1-9157237b8382@oss.qualcomm.com>
 <f3qs4wcascfodjufisl4qtpycfb3lunff2fv4u3olybjius5kp@vahhjfjfh6wv>
 <a09f71a4-31e7-439d-b053-66b279ea27c7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a09f71a4-31e7-439d-b053-66b279ea27c7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: uP_1yzZJN0bBINHoHHvjhxKnV0_JbUJc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX2n1UbUvZcQjL
 d1ukn8j7OgYQym5YtSuOiXJ56I8fH8zV2IWuMg4NflUXNNOVvU+UEfj1dxjIwljclX89+NREqsA
 SVStaAvln/mv/7AU+kgrC+XblNeitKU=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6accd2cc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=fyugVKZb8pU3dQemVCEA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: uP_1yzZJN0bBINHoHHvjhxKnV0_JbUJc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfXy6s8qN5f/IEL
 8EJkbkNrtJq3RS4GMAQ9M9Axs3pawiS6fKHEYtmOw2F7sFUxn02awI13zL0+byBJ2XKobq92KzI
 ZJbIjpSznUF1bkR8yEhyLUkdYRg0oUGZwow+a5aHMtK46D0Zts5a1K8qo0bkApEZPp7nDMPVso1
 PM4dZKTI8tUOBKROsfyCO3es0Qu9l5Y2mqgl/JoaxXN2y7hFhzeLpvDZpeBwV2IVOmNse51bgRk
 XUS/4vpgWn5DDXOzQwiSR7jmvhM840JBfDmcAknxZ/n1sjKc2kWcIOcS88X/soPgczoAdmtr5hw
 UBZVD6uphTYraxoUw1kh1NxED4YtD8WZ6H9u4ts3o3fFgx6+CcRAAUKMS6QhkpwcUxb6wuu5PPm
 9O+V6Z44mEzhencGznHIdThraLudZLAUGGK4t1LbyePplZW7Gto5qqmdGyngBqB6eSsLVeXmQOO
 V3SgVGucLkceI5WWPYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120049

On Mon, Oct 12, 2026 at 04:41:04PM +0800, Yongxing Mou wrote:
> 
> 
> On 10/5/2026 9:02 AM, Dmitry Baryshkov wrote:
> > On Tue, Sep 15, 2026 at 05:27:48PM +0800, Yongxing Mou wrote:
> > > Kaanapali (SM8850) has an additional INT2 GDSC that powers a subset
> > > of the DPU source pipes (VIG2/VIG3/DMA5), on top of the CORE_GDSC
> > > that powers the rest of the MDSS hardware.
> > > 
> > > Describe INT2 GDSC as an additional power domain of the DPU device
> > > rather than of the whole MDSS, since it only supplies DPU-local
> > > source pipes. Restrict the schema change to the Kaanapali DPU
> > > compatible via an if/then, so other platforms sharing
> > > qcom,sm8650-dpu.yaml (which don't have an INT2 GDSC) keep the
> > > existing single power-domain constraint.
> > > 
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   .../bindings/display/msm/dpu-common.yaml           | 19 ++++++++++++++++--
> > >   .../bindings/display/msm/qcom,sm8650-dpu.yaml      | 23 ++++++++++++++++++++++
> > >   2 files changed, 40 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> > > index 3f953aa5e694..19b791a857b5 100644
> > > --- a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> > > +++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> > > @@ -25,8 +25,7 @@ properties:
> > >     interrupts:
> > >       maxItems: 1
> > > -  power-domains:
> > > -    maxItems: 1
> > > +  power-domains: true
> > >     operating-points-v2: true
> > >     opp-table:
> > > @@ -53,4 +52,20 @@ required:
> > >     - operating-points-v2
> > >     - ports
> > > +allOf:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: qcom,kaanapali-dpu
> > > +    then:
> > > +      properties:
> > > +        power-domains:
> > > +          minItems: 2
> > > +          maxItems: 2
> > > +    else:
> > > +      properties:
> > > +        power-domains:
> > > +          maxItems: 1
> > > +
> > >   additionalProperties: true
> > > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
> > > index aa0cf0ec5b93..88aa71d2b912 100644
> > > --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
> > > +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
> > > @@ -61,6 +61,29 @@ required:
> > >     - clocks
> > >     - clock-names
> > > +allOf:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: qcom,kaanapali-dpu
> > > +    then:
> > > +      properties:
> > > +        power-domains:
> > > +          items:
> > > +            - description: MMCX power domain
> > > +            - description: INT2 GDSC power domain
> > > +
> > > +        power-domain-names:
> > > +          minItems: 2
> > > +          maxItems: 2
> > > +          items:
> > > +            - const: mmcx
> > > +            - const: int2
> > 
> > Nit: I'd suggest more generic names here. If the next platform switches
> > from "mmcx" to some other domain, while keeping the split architecture,
> > the name becomes unapplicable (in the past we have seen platforms using
> > CX instead of MMCX). What about using names like "core", "int2"?
> > 
> Agreed, using "mmcx" would be too provider-specific, as the DPU performance
> domain can be CX on other platforms.
> 
> However, "core" might be confusing here because DISP_CC_MDSS_CORE_GDSC is
> already attached to the parent MDSS device. The first domain on the DPU is
> used for OPP performance-state voting, so would "perf" and "int2" be clearer
> generic names?

Responded on the other patch. I think that here we should be listing two
dispcc domains and then "core" and "int2" would be proper names for
them.

> > > +
> > > +      required:
> > > +        - power-domain-names
> > > +
> > >   unevaluatedProperties: false
> > >   examples:
> > > 
> > > -- 
> > > 2.43.0
> > > 
> > 
> 

-- 
With best wishes
Dmitry
