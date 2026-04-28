Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658F220D4FC
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 01:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777340172; cv=none; b=JoXURbb2YaOU3WHmdZ79NdNmLipXxnR/kRhVsPXkYziPS7x3qbkwzi4N4JWoE/ViFQZpFNp6KWkI/RVKye5EmK+mhuYVZFV9zMqQ4ywlBwfHAIrhI46pEVvf/7NNdLgJOZ/NqSpaLFKoRIrh4EgcI3TdUbT+mNwlcbr+1BRLIh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777340172; c=relaxed/simple;
	bh=Y7gKuCFiPboEfKzDAf73jyDXFOaCi/weSrK7a2Kqvuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k3Ur2PZ1Sl5RNOjHMDQjRfTrQ8lfLo4xdexI96Jd124WEhPQWcaA3SB/vL4Zr5PMr0x/Czdbg31XMdxw27pF//KMdrSCrhfXp5EjsOoQyKanu4HhStrIW5am5AH+uE/RoG8FhP1gm15vm92TetzkcpJ6JYaOZs6gyqI96nVFhHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N4CttKse; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NnjsHAik; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N4CttKse";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NnjsHAik"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S0TQa0440351
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 01:36:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kmuhBpsDaaHpjbrFXXWCLn7R
	VHpczN9SgLXRDFkeWwo=; b=N4CttKse4inMTMby51Mb1YAxD5xM1/fxIfjRhTVS
	iZno8VmHFOlMbCQVh1lFOWhaqm8tk0pluCgK13BzDyGZClkCKtyv0rltkqzDyZkR
	qjQwIjNZrNoJi29dR8kNUzvlnxVh0cPFApFnQemBDdY9tpzBzrQdnm1zR1AlacZ6
	/X7nsFhOFQDSnyJA2Tbmv7JqW2jWRjSOsXmz6OwqBmH1XnCZf0te4Z+O4DeCC1bQ
	WJ5MFIvKNrGGEboTE2z/+4Ph7NHfZJlJVb7+1/JjlhKFZjUFksRcz9RdSgrHFAtb
	s+rG6IiM4pZjnE0mnUEMx/MWvExHx0UMr8BwqibLi/o7Lw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtac422fb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 01:36:08 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ddd8ef5343so10796926eec.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 18:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777340168; x=1777944968; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kmuhBpsDaaHpjbrFXXWCLn7RVHpczN9SgLXRDFkeWwo=;
        b=NnjsHAikA33BjHVi8SDVvQZRfPNka2MksUhwl7i/uaoDTakGNsMKepk89BDzkjj5jZ
         AhK+rJF6OwUP+VThX9h+jz4Lrv3pADLzr33jzE3bhaaeIXxuIEzR8LqsxjMfNvPQBPee
         KbwE109pCmSCCwspXSTUftjRxJTKhTpiqWR7HtX6J4v+yAd7V3HN9JosFE4/E9BL9hQq
         UFVIAuH6c4H8Zs4uLVABkoNOL6kMmKNlLxpRW79N+8dDN9NnpgfDgxeqCo0WsfpKjed9
         gIIBvYDLcM6yjKkSV1iRnzAOjMNfM93vOP5VMxfOPp1FnHkaM7VdEFkXiXjueK8HcJZp
         cplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777340168; x=1777944968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kmuhBpsDaaHpjbrFXXWCLn7RVHpczN9SgLXRDFkeWwo=;
        b=rdo/zxXVtuT8wk23RqAehcUc8gEfV7MFYGR0MGxOQfhkm2hU83vuygViPyk9QZUP9u
         0dDTyIEsYUGrnu+pJTLlO7jjpnEaDK4Pw6YOd5WsYCHLmrwWpqWbGouLuAqhiEhqog59
         MavEzbDbmy1GX0hola3zLiornljkzahiQ6p/dOvJ1bdLzBn1lrc9/+hAJPGdXGdOf8DW
         LKstlZb4Kn1LagjMub2KEq/FEY03jFnbrDIax1o0SKOsB1jBKK6emMvOKkK3p2K05BZf
         9bM8+9eXLOAovQN+TNltBh/fE6trIIjMpo+jnfiy8HFibR0Fra1SlmH3F4UE+XzEMIaj
         MiTw==
X-Forwarded-Encrypted: i=1; AFNElJ/4nqmd2AOlv4CUbgVyTU9RYGMIqv/IveMfcB3d7MteyO30Efl+7diD7If1SLFbqA7gaTucu4NB6uxj@vger.kernel.org
X-Gm-Message-State: AOJu0YxHS3zkK+L/vsxHx0RC0yIjb/mZt9dUin4sgNPePcyMocT9iJ+Y
	39inXHIrprvEqFBjWMbUp4AwZ8h+WPmjqmI7UGY2TqceHn+SYOztS/QI9cefigPMOdnsJZVVfpf
	ub98FO2vyqtazq6h1yk7LgwXvcWkxyWIrbFAHFhhEzkmslAn7fsepQCAq9IAtK9uC
X-Gm-Gg: AeBDieu9AhxbCKPVLMz4h0GWqMmf7iJWYdJTDXnzdJ5TQBMOMMWoDq00/C5HDwpxV2O
	fI+LTxITnzbRJkYA8TVI+MtkLGi8+FN0Ln/IyYJTeOSI9hjFzn58kL08aicGECkdij/ZMuanHa4
	WWrCR9M4Cc5XHmz/dWJBpdwcFAbQs5Xsk3dXZhWicMJjsew2YAfCS6GlmerOSz7Hw2qpl/IsYOt
	veETdxxYczh/gE0BdX8BP1lbR1QEiiznHE2UG2JQE17DR4eLNfySLZkQR3zHo6m2JJwly/HRyPy
	7d6H+2U4nhexqiEDhC5rH9Iubh2/oLg45KoJ/yndP9vq+VxWvLgo4O/L8egBOPheKIAeRY5XtoH
	M9BuWBphRU4of+yHOiADW54glPz41n9fjVsK3cZLaqnbRN4nTbNIU08cwyE0v5E9u/ysKyauScN
	c=
X-Received: by 2002:a05:7300:3247:b0:2c4:ec89:bc7 with SMTP id 5a478bee46e88-2ed0a00248bmr597098eec.10.1777340167656;
        Mon, 27 Apr 2026 18:36:07 -0700 (PDT)
X-Received: by 2002:a05:7300:3247:b0:2c4:ec89:bc7 with SMTP id 5a478bee46e88-2ed0a00248bmr597080eec.10.1777340167102;
        Mon, 27 Apr 2026 18:36:07 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed0a106524sm1074873eec.23.2026.04.27.18.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 18:36:06 -0700 (PDT)
Date: Tue, 28 Apr 2026 09:36:00 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: crypto: qcom,inline-crypto-engine:
 Document Nord ICE
Message-ID: <afAPACSt4JoLuYLn@QCOM-aGQu4IUr3Y>
References: <20260427010527.230473-1-shengchao.guo@oss.qualcomm.com>
 <f3e83bc2-36ef-4628-af1f-d9465eca72e3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3e83bc2-36ef-4628-af1f-d9465eca72e3@oss.qualcomm.com>
X-Proofpoint-GUID: U0oBzvntkROk-MU7zOdkfuFG1QpW_F7m
X-Authority-Analysis: v=2.4 cv=D7J37PRj c=1 sm=1 tr=0 ts=69f00f08 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KIcV2tIvfCGpu7CZsroA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: U0oBzvntkROk-MU7zOdkfuFG1QpW_F7m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDAxMyBTYWx0ZWRfXx1EpP8PE8jY1
 TGnDH0iqAqx/2y/ZJ2dp7NSnTo8snz3JbQw7tKhhWWwIpIy5sUfVXUWQRpL8sn5f0k3AsiUQf5D
 Gz6J/Qq0LQ9rJDiw148wdk4D7SdMfiziM9dQSGk8rJrQtmYpPp3HhKcMSzw7lu+4YclAXvupULZ
 fplEeJOht6EAUyjZk8cKfZG2OSy0d8xPSedkfbNmy3xG+7ffPVM4RsnuQsdHweLb74OjBbk9ltZ
 Jz1s1ni/GqR7Z/5QnY+i+8YJ8GKCppKGtsJmX7goI0Es42BtgRDsTJqFSyKZ3SAYkpFZNoLzK8t
 nvXAE98Rdx7ZSeKjx0i1XaDamIsk6ErCaJUAVhgqf/vWNVJy/MKKWU61qnmJD37U6bvisfPPDDZ
 l+PtzEXr8Z0QuwQlAtMCQi3vvDzwO7qAlAEfetcGE8sPYVUQqww1DipSH5V9qRe3S6DE9dt4vbt
 YgFxc0Lg1IMt20uj+fg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280013

On Mon, Apr 27, 2026 at 12:50:40PM +0530, Harshal Dev wrote:
> Hi Shawn,
> 
> On 4/27/2026 6:35 AM, Shawn Guo wrote:
> > Document Inline Crypto Engine (ICE) on Qualcomm Nord SoC which is
> > compatible with 'qcom,inline-crypto-engine'.
> > 
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> > Changes in v2:
> >  - Improve commit log to make the compatibility explicit
> >  - Link to v1: https://lore.kernel.org/all/20260420073301.1250197-1-shengchao.guo@oss.qualcomm.com/
> > 
> >  .../devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml    | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> > index 876bf90ed96e..9251db2b8fcd 100644
> > --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> > +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> > @@ -16,6 +16,7 @@ properties:
> >            - qcom,eliza-inline-crypto-engine
> >            - qcom,kaanapali-inline-crypto-engine
> >            - qcom,milos-inline-crypto-engine
> > +          - qcom,nord-inline-crypto-engine
> 
> Wanted to bring your attention to this patch we are hoping to send for 7.1 fixes window
> which mandates the iface clock and power-domain for ICE (from Eliza/Milos onwards) to avoid issues
> seen when these properties are missing:
> https://lore.kernel.org/all/20260416-qcom_ice_power_and_clk_vote-v5-1-5ccf5d7e2846@oss.qualcomm.com/
> 
> While I won't ask you to adjust your patch immediately, if our patch is merged, would request you to
> update this binding to comply with the newly introduced ones such that the iface clock and power-domain
> are made mandatory for Nord as well.

Thanks for the heads-up, Harshal!  Sure, I will update after your series
hits linux-next.

Shawn
