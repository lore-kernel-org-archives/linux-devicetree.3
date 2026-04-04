Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549E621638D
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 19:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775331558; cv=none; b=QYhS9e3D18vrwqUU6lv6wccGhDUVwu8iCUJZ76ScPubCZLwoG/QLQwgM258j7Igxt8vjsCRd+iXmEAgIJ81roMAWk7HXpkQ/9YRdCeBtZM3zpD3wSPbPEuJbxdyfxK1p+s3c8V7bcjdx69Ke2ekFNbI3/MZmiGyyCK0ejdLg5k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775331558; c=relaxed/simple;
	bh=bhSWQ3ZfgXTqMl5jnr9Ey35ceFVnpsBFkYha4L/zkDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQYaC0SQxad886jEoeAY5EUV7n58gFZpGj01MpUEffqcXJUpgIIZ1UzH9v1kcQGeWzzjv9glPYarrNzHNXHdyqvwp9FxuM1rxFpUsgPOEByg4hLzyQIdiIJLLr3tkLaH/JYubgxmC6+/2CjV7sihXunB2aUdH8UHmfp9pA7dxX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pypFs1hd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jwQHnjrK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pypFs1hd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jwQHnjrK"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63428hHv2408390
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 19:39:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MYxNlfn0z68Q5H689uRsG1iSbQh/q+inGQdA92eyZtk=; b=pypFs1hd1fmpkiOS
	SoCmFB6a7C6JeW8cJ8l0YpQJNXwy5mzkR/AkyOBkjlmVTlzo5rYuBnta32t1pgXn
	bOWXpET9Oh2Mzwu7zR7wxWNLFIosDW4K02DRC2NJ88dFPIjGLHkhH5cPXcwvxoct
	QOauj1XnasTKf5CydOqgnYBSTgc1bqZf2ECuNWUlAyuUscHYyATM/G1GKQ/iasGj
	YQVHsrm3z29jJ5fOjwfIDbwJJKeYx/KiJGlL24o+l4QSrDQ36hh9eIx5MXrzQ+Y6
	z2TsodR+rLOH+T1FcnNTxA1D/wp8eTy1pMLCYuC4aAtdsKLaQp0KUtqtjGeBdIgz
	EpLOMw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daskrhg1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 19:39:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d826ed6f9so8261901cf.1
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 12:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775331555; x=1775936355; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MYxNlfn0z68Q5H689uRsG1iSbQh/q+inGQdA92eyZtk=;
        b=jwQHnjrKU+QPOjNF9Bova+Vkhfee3PRLp8LLzH5WKLs+00a9HAnJNwERLAQ0rEcrjB
         ZEerdISYlNEickQEA/pwIsYXehxE+R9uBQcWOonTfKsvTihcs2kQUPEz/ujPY4EtRC39
         k1wh1ZeSoXO4T1OcfI3YGvQ6eHaSek3l+TdtA+2ffnIRLT3YwOFHVTFtZT0Daap1NDrT
         oIy7VAj1AdKUUL7h9rsVkTF5dIfQ11vvSHhUFg6q1JfFqZfPBD0/0MhGrot/DtOMJ++B
         jUrZRnwMMfgwA4G1VQEoQLyLLLzo3MSq0ws0/Z1d2iyfT6Q0QmC/gJLTBZ+ACiKGij6o
         fKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775331555; x=1775936355;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MYxNlfn0z68Q5H689uRsG1iSbQh/q+inGQdA92eyZtk=;
        b=TpnmKBoeK4E/MK3ZUOkVQSVXKijWAqWubweoAGlJ9LNPruj4YFexJcO1Dminop/7UU
         5PaRwuBziz+UgYml/1VuBqos0zQ89eJ7OzzlxKfnxaZhX5SjaBIsxkPwy7ArJupOWxDX
         GBCuRADfmcF2GSs7B8O3tGFJJHve7iotu1ec30YbqKZ3Swh/vptZ9gm7uMexf85gdD/Z
         FTONDiMgSvgvyTRu8LjjpH8LqEyvzbwq9emMUBqw7fZ2EJdIj63L3sbmC5sT7bkJNsK0
         P3b2C10mtT3FWg2TVCGyH/8gsz2FeEL/lCz32DvEfHBfa9Pil0BN508vwGQ2rYN+8ygy
         g1og==
X-Forwarded-Encrypted: i=1; AJvYcCWv1DAkEDcY8WP61a0K5OogUGZv4EnWfUy8z1l+nP6+1g4SdG2EMgZlE38o26rYF4fYM3ui6+ByYAZ5@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1OWR/nlOky4iF9s8Dg6GlbjwO0cUsaOaOmMCJq+z4IZMlaNW5
	zbtbueehvfXdivxiJ7JcdhEhOuuqzmnZG4bVBkgeQhl73Lqrk04/a3oNDPpKgLR5VfrkGLryzOS
	qux2hAw4Wftw0Cn4Qed6E0SeoF8sUgBK5OkFidedpr0p3xx53mWMwMAmklF0Kf+CL
X-Gm-Gg: AeBDietNWEvI2YElVsQ1rN8YfTI4MoWt0QX3lTH1ckeyXNfwdivnH8diybJLMYvaLpp
	4A7rJ2jd+V0uwu2X3OcZLFXcjr1BcC8uofoInavLC9oX2HHzLLuv8Yu1tSQApagI0G7Xh6omCZ0
	mev3BiLrBKCuTduaCdPspNi7UGvZNFRNcepeXdfg+GAlI1ItAsp3QtsSUPLOgmDiUnBfT84Z99f
	Q3RN63meNDpGx78/sFLAzAQmaQv6vZzECYeS4u4eiWbdZuBlruoPONB9HqHg5mmznxRnM5bvc6O
	UEAoU+ZXGqPiyvdw2YbJlQ7Md4wVRKNhr+unVaRMv96c8b94PdPKe/UMGX9feQ3o0btBvJJSnHB
	+krkT2ZmM+P1e/sMWdjKzq1v4SJcIFDXEK4Du/PwN9no9IygqvZdTdCUXuaZJf1Flvfj4qF3DkG
	HTtrYy2SvNDv+zABio8EfnsFIWQmPMMzcvS2E=
X-Received: by 2002:a05:622a:1487:b0:508:ffad:4bf4 with SMTP id d75a77b69052e-50d4fa37523mr124524241cf.5.1775331555565;
        Sat, 04 Apr 2026 12:39:15 -0700 (PDT)
X-Received: by 2002:a05:622a:1487:b0:508:ffad:4bf4 with SMTP id d75a77b69052e-50d4fa37523mr124523981cf.5.1775331555115;
        Sat, 04 Apr 2026 12:39:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd1fdd208sm22313111fa.12.2026.04.04.12.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 12:39:13 -0700 (PDT)
Date: Sat, 4 Apr 2026 22:39:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Add monaco-evk-ac support
Message-ID: <7r6373fo56alzqa4e2zzdnsgwfhgdkmbhxe4cvdo4p7fg3zren@eyiml4uedfbn>
References: <20260401-monaco-evk-ac-sku-v2-0-27b5f702cfba@oss.qualcomm.com>
 <20260401-monaco-evk-ac-sku-v2-1-27b5f702cfba@oss.qualcomm.com>
 <7baeajhlqv6ujiqzmknjw3h6qr4mdw6qdywhaczm3c42pzjiue@nsgcbd4jsba5>
 <0f2612b8-5c44-4934-a625-27a66eeb7bdd@oss.qualcomm.com>
 <zyarcaimg67uivssnm4uxqiwc2jadolf5kx6moycwlbzhg4gmv@xa75wcpotzpr>
 <4d32e86f-353c-4951-89ca-46aa49d60f76@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d32e86f-353c-4951-89ca-46aa49d60f76@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Xpv3+FF9 c=1 sm=1 tr=0 ts=69d168e4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=EsJBPIv444T2Bi-tIFIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Nl1o2gy_hViDsz3_c3sxI1uq8wG53StM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDE4NyBTYWx0ZWRfXxqc+/iJ/i68P
 vM0CNrzZwzgnP3XhPialBO0Crn6VDkx2tVetQBkurOb3LAf863KyvNVexyry2NcWx1l/evliQnm
 U9MpFIB2BqqbE84Xha6eAtYpnnccF/5GeBNZNbsss0VHyaShb316bexNkT8R2d9qOKtCpEPwtHj
 s+3IPTbJycdO1XGMEZ8/6sU2iLVOvLQKkaR+UVj6OHANJIdkcuxPJDcoAJiew/NFp5ULsv50qlY
 Ac8PYcw7xASBRwTr9e3x878Xnh0hplDGlelo2cFgGwLBGsaIMqYchu+PZx9+QIVuKL8aRJPXOvs
 T5lt/kHtQViuu1w1k6tzoectKMSOeJ59YAtpC/q0mnnhiZwGVkp8+Ken+1iJxP05d6HfoCQXzZd
 3bw4ZZ3/IerrPrNiTntkCGewPAev5l69OrhFD1Jwl1GYvainhy2CN7o32TYTEZBYDu/KhzZCiik
 lVTgmuJFLD0+QZxQ/9w==
X-Proofpoint-GUID: Nl1o2gy_hViDsz3_c3sxI1uq8wG53StM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040187

On Sat, Apr 04, 2026 at 04:15:54PM +0530, Umang Chheda wrote:
> 
> 
> On 4/4/2026 1:58 AM, Dmitry Baryshkov wrote:
> > On Fri, Apr 03, 2026 at 04:14:28PM +0530, Umang Chheda wrote:
> >> Hello Dmitry,
> >>
> >> On 4/1/2026 5:06 PM, Dmitry Baryshkov wrote:
> >>> On Wed, Apr 01, 2026 at 12:14:42AM +0530, Umang Chheda wrote:
> >>>> Introduce bindings for the monaco-evk-ac IoT board, which is
> >>>> based on the monaco-ac (QCS8300-AC) SoC variant.
> >>>
> >>> If it is a different SoC SKU, should it be reflected in the SoC compat
> >>> strings?
> >>
> >> Monaco‑AC does not introduce any S/W differences compared to Monaco SoC
> >> -- All IP blocks and bindings remain identical from S/W PoV, Hence
> >> haven't included the SoC SKU in the SoC compat strings.
> >>
> >> Hope this is okay ? Your view on this ?
> > 
> > You are descibing -AC as the main difference between the kits, but then
> > you say that -AC doesn't bring new software interfaces. What is the
> > difference then between monako-evk and the -ac variant?
> > 
> 
> The major difference between monaco-evk and monaco-ac-evk boards is that
> of power grid. monaco-evk requires 4 PMICs (2x PM8650AU + Maxim MAX20018
> + TI TPS6594) to support higher power requirements of monaco-AA variant
> of SoC which supports upto 40 TOPS of NPU - whereas this board
> "monaco-ac-evk" supports 20 TOPS of NPU and has lesser power
> requirements hence 2 PMICs suffice the power requirements (2x PM8650AU).

Is that the only difference? Is the PCB the same? Should we have a
single common file for those two variants?

> 
> 
> > Also, from the naming point of view, it is monako-ac-evk, not the other
> > way.
> 
> Ack, will change this to "monaco-ac-evk" in the next version.
> 
> Also, should I change DT name "monaco-ac-sku.dts" instead of current
> "monaco-evk-ac-sku" ?

monako-ac-evk.dtsi.

> 
> > 
> >>
> >>>
> >>>>
> >>>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> >>>> ---
> >>>>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
> >>>>  1 file changed, 1 insertion(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> >>>> index ca880c105f3b..c76365a89687 100644
> >>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> >>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> >>>> @@ -918,6 +918,7 @@ properties:
> >>>>            - enum:
> >>>>                - arduino,monza
> >>>>                - qcom,monaco-evk
> >>>> +              - qcom,monaco-evk-ac
> >>>>                - qcom,qcs8300-ride
> >>>>            - const: qcom,qcs8300
> >>>>  
> >>>>
> >>>> -- 
> >>>> 2.34.1
> >>>>
> >>>
> >>
> >> Thanks,
> >> Umang
> > 
> 
> Thanks,
> Umang
> 
> 

-- 
With best wishes
Dmitry
