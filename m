Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8446818E025
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 00:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790294630; cv=none; b=rXD1eo5yT18v0K6jkCsE8Img/moFVMtUo4Y0jOv02dS1m07tGy8hx9HvzStMbR39FnZ1WPT2w8LkMFxTRHH4O45kYQyNIjRi8f2j/V37lMsXoiWT6UqlHLFEbRAZzRAwNKPhYiJfLv0ak2n6FwxiTdcLFMvbaFPKuFKKJn5gbO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790294630; c=relaxed/simple;
	bh=smEO5ajkUjd/XE0Q0NvHBZW2RfBUnec6o1gpJNIoge0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IgDbePRyzTbr7rGQ4OFkxO9MXQFrYMYcmlVH0TsWvu5u25JgI+EzRALyYQm5Xe0uGNiEJiqVAKEkbjIAzE+KD5gwXp7VnxdjhcbTHiNz7hJcu6sWJLg5MNolWvyEvtIPvOfH6PZa/43Yd7k6/2/Yiol4JUbG1QV71l+9C+mX0JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ntgaicXv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LDYXlgS5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ntgaicXv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LDYXlgS5"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OMOuHr3466278
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 00:03:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H58DggwAYgasWPTqDpc+NXUeOTsA5g+ce6658T2WcyQ=; b=ntgaicXvjPhYL4n6
	qMgOWfjyLEiYTmV3eiqMJUfyDMu1v/ap5+JMIDrvPcsqAMvACUmEk1fPQV7KLR0z
	6liUr6WlTz+lrBgOGoRq7OmWO4BCuaqRysoTUJg2dP59gPytJcs3kx2/jh974v1F
	kShGODI3Xy0JVUAem1WpNVVfJNqhC/R1DcDqOdJIaHJaeNaxQkhAeOqyRCHFSdb3
	CXW/uraeyinRTqFdLFt6qPoRxzfKfJA7IKfMFI041x0J+s0/kfN1oZ6M70CU/Ls1
	HOrYAQ46y7ZI+YjZkCRl2k7EjmwD1uVljR0X1uBIhBHoc2HABrnwogN9pkeedX88
	qqXrEw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw4652gvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 00:03:45 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341b0999491so62906eec.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 17:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790294625; x=1790899425; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H58DggwAYgasWPTqDpc+NXUeOTsA5g+ce6658T2WcyQ=;
        b=LDYXlgS5aSouB3r89rdT3msz/WrB8+EYY8bWF3Rs+g0x5nGlBYX/gMeQyk/3qQtGrp
         Mangv/oHTWqcoFd5nu1SSuuaMLWHQPN+lbPSWvoHJbRO/l0YvRxTl68Jl1YmptGYbFMq
         P94OhMtT7NZLWzHkcwuZQTZK9y16EplTnxoGXJc3RI/g2AtRNAr0rXazvpWV7q1+rbnE
         5Tgy7tcp4ePUqrtMdFjpf80QSQhHnW9hRexGt5wdxDlB99U43DQyyrclxAUnDTjwwiKo
         neU+lXDd76/MhRrwIvBH5f12k3PLcin3Da1f8hai7NAIQfbOYp/J9FO8LIBVrZwHeTuG
         UFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790294625; x=1790899425;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H58DggwAYgasWPTqDpc+NXUeOTsA5g+ce6658T2WcyQ=;
        b=H/zzlm53FYXqt8Yq08Hjxa9GMoXFGQF7O2lk3cmX2j0IIfU+Slf/jRvaWlx4KLUB0F
         TfNRvoLddXgKjX8NT/F7fNjMliFTLh9zcJGIIS+2BdKvBEFv7ajycYaCfSrEIESEe0zb
         o1HBE+bezBjf7nrrxuBJrmSfX/5QJtnTmwOkc6BUKboyxo1KovwVtyGFctMRwL02Glee
         o1TtiSAEgQYTqdG8IoB28ybkDtlDFqYtq9OoENA1spkSGu7l955rwcxytYA8KYh2323h
         Kw4JhCerJFApwlYM9OguuOuicowfl2UWYURwpU5Rzo7cq29h/9O1z2CMCWT1g5Lnq+tN
         MG6w==
X-Forwarded-Encrypted: i=1; AKwUvBy8ycoVLVGBEQwaFc7CaMSlAYt0WhgysJ1OgjyvF7skIw9sqKYDzRb+Lh0WDKaKmgjp6/tv81e0I7o7@vger.kernel.org
X-Gm-Message-State: AFuF++lkBbHMemHCsyg7lTQ9mp3VY7XA3WwTyi/zCE+7Lj4AOXmh1Qm5
	krQGM3RH8XlMRbzPa2zpmvJmuJ3qTVNBAaLzHCWtU6mqzauIcAO53lqj56ze9T1hqnhrlvrsvCT
	gEdTvYH2kaCOEztImp5aC/0j8efqXrK8o+ncs04hjmYVvMxX0OjfFAwkyND6cuh+7
X-Gm-Gg: AYBFou23CpHIYWQjfWIR5kI0jC5nHv7s5vri+OhrueewYP89RH0ShaFhkJDwo9Y4Q3m
	eAsLE/0ZtikwhxsGBI6UTrTgDky0+yYbj9t/fcngwytv4Xa1Fx54my1bL0zYJ0/C2BTR87WTlHA
	7G+b4wYjy47OIJ7hHgTfZSO17JPAerV57cdYKCza6K8B+yhf9sH4C4x9x+vXsJCBHyjXoieUMfd
	yooBvZJhlPAkdN45sQpL+KCN9it1Gip7JtNYwdPeTDN9w7L+xbCi15I3gGz8JB/E/op0KjcMCTb
	4UHQRJeJRHpcNN+msN8p43zW4tpPNm3VI2008yMp3En5gLJEnDBcu06kqk2Gc9eLkuDGMo/mAFT
	JuFz4xkbTcoxwyc6XTphmlQ8+98+Nhjkj8aU+VdQTPw==
X-Received: by 2002:a05:7300:1c94:b0:33b:fae9:fc37 with SMTP id 5a478bee46e88-340043a2f7fmr3392702eec.5.1790294624540;
        Thu, 24 Sep 2026 17:03:44 -0700 (PDT)
X-Received: by 2002:a05:7300:1c94:b0:33b:fae9:fc37 with SMTP id 5a478bee46e88-340043a2f7fmr3392683eec.5.1790294623875;
        Thu, 24 Sep 2026 17:03:43 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3414407c548sm1779043eec.8.2026.09.24.17.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 17:03:43 -0700 (PDT)
Date: Fri, 25 Sep 2026 08:03:39 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-clk@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom,sm8450-videocc: Fix clock
 inputs for Glymur
Message-ID: <arW6W_2Azq0GLF9P@QCOM-aGQu4IUr3Y>
References: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
 <20260924161152.1162301-2-shengchao.guo@oss.qualcomm.com>
 <20260924162500.C92FC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260924162500.C92FC1F000FF@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=Wrq+otfv c=1 sm=1 tr=0 ts=6ab5ba61 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=8nJEP1OIZ-IA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=zgFx8tfR_8MVfJF-GFEA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=bBxd6f-gb0O0v-kibOvt:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: tywuGJ8zx2DbivAW58UMlCKrh1UDNRa3
X-Proofpoint-GUID: tywuGJ8zx2DbivAW58UMlCKrh1UDNRa3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA5NyBTYWx0ZWRfX2KdRQ6uOEH4C
 525pqf6FRfbvjj3dwmf8eBY5O+wUWs5wI76715B3+iVrtQoqv+o53gipKM3G2sXoTblKxfRyaDS
 Mlz9mz1evxtsV+r2M145gVYFVfNuhbAQh+p3jBvn/van8IvT/splH8CJa7Dz02qp/gRCAqACNON
 qxheVtSgDvA9HpCFncF2C3Br7MkktnssqZvza4ACg/w1Yij2GcaIwHjORK9hMfcFCK/ViOTAn+j
 LXUMwwbyrNcOP/3UjRapMlo6a7G3cOJh7oeWUdQA240cF+bv3db4xEnFhxyShZff7QPbLeXLMVQ
 ftEj+Bhuw8FAhQ14o3aU4ZaQW/3eN5nmDzbnNXmeo/3nMWyaSI/pQ8oVgByJaOcSYb5xiypC/OK
 uiZTjmwyaUN7oy97kwPGJ18H6Ar7DluQykpy71Y4wwOFzjy9BkHUI30fFKqfdrO4Jl8yQSevG3M
 7Ot5isjd4lfXt14S0aA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA5NyBTYWx0ZWRfX2cJJdwrxaFLA
 MX2zFL+/sStYTvBqM2hb4ONXHqmFsLBUqYCe+/9rbVwqh84nQdelXUSa8z2+lzxdKcBVMxqi3RJ
 zgUKfbBbdI/DV5DUAmFZvZraLW8WBP0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240097

On Thu, Sep 24, 2026 at 04:25:00PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] dt-bindings: hallucinated qcom,nord-videocc omitted from top-level enum
> --
> 
> commit 0ca2f034154349c48cdd7a693b1d8282d6886964
> Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> dt-bindings: clock: qcom,sm8450-videocc: Fix clock inputs for Glymur
> 
> The commit updates the clock inputs for the Glymur, Nord, and SM8750
> variants in the bindings from exactly two items to up to three items. This
> change allows device trees to supply the sleep clock input required by
> these drivers, resolving an issue where it would register as an orphan
> clock.
> 
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> > index 910c6d5672b86..dc01c37dcd0e3 100644
> > --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> > +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> 
> [ ... ]
> 
> > @@ -77,6 +76,27 @@ allOf:
> >      then:
> >        required:
> >          - required-opps
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - qcom,glymur-videocc
> > +              - qcom,nord-videocc
> 
> [Severity: Medium]
> Is qcom,nord-videocc missing from the top-level properties/compatible enum
> list? When a compatible string is introduced in the allOf/if conditional
> logic but omitted from the top-level enum list (under unevaluatedProperties:
> false), any device tree node using it will unconditionally fail validation.
> 
> Additionally, the commit message mentions that videocc-glymur.c handles
> qcom,nord-videocc, but this identifier does not appear to exist anywhere in
> the kernel tree. Could this compatible string be an LLM hallucination?

The series is based on linux-next, wehre qcom,nord-videocc has landed.

Shawn

> 
> > +              - qcom,sm8750-videocc
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: Board XO source
> > +            - description: Board always-on XO source
> > +            - description: Sleep clock source
> > +    else:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: Board XO source
> > +            - description: Video AHB clock from GCC
> >  
> >  unevaluatedProperties: false
> >
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com?part=1
