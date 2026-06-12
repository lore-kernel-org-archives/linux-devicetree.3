Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EEB305684
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250564; cv=none; b=YAS7WHzT2V8A7z6HhlnbuZJmhjbSOrK+DSRSTBhoUPgwCt1TVgXaMdjHLOXaYbaJaRcUNDBhFvOS3G50JmIiEVKFw+zm2Mf4AIYAxXjZGyuJowi1lsy+LMKI8w5pwQaOh8xfAVOjTxSwKAviHxVRga/TrlL+yyCk3JPVU+F6XTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250564; c=relaxed/simple;
	bh=oSClFw1N6Pzc5mrZzt83o6RTRpl1h132KUxpmGTz/i0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P3TQcy52N0P9nWOs+sgi34qz2n9fcD2/CMkoiNEEXgLMTBSFyg1HL7Ot0Bh4kNRSOuFAQCeN8vZFp4x5E9zHFq0/kS87pVfdpjkE4EfGis4dtEJg4pxYlwKJQPbyvc3N/RcM4Ydmdvr64rBggmkew43+5FaGNa55SLM8gvYjbZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZFsBO8at; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SjFV5NwR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZFsBO8at";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SjFV5NwR"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3Brfo2506213
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C4AA/oGx5sqKMDcm3WaPRz10s2TG42Ep0EEBjqj7wU8=; b=ZFsBO8atIgbiQHfi
	CmpJ7BufwbkUat8DmbBUny5rzWMpaaHG9SJkuDKjGTWN9fz8I+175yEdfvVNOl3J
	Zk7S52nxRpHgRe+utf+b87quHTG2oqrVyN75D53aVcvfdPUZDHKuRr3I1jG7OBLT
	efj44OHpnd8rdUBXye49gqmLO3Z2sfW2AC7fIIjkans3ftM+BdMxt2eiY4TVCzBp
	v4raRXmY4P31oK1ejEjDo6bS7M9dONpj/jXTHKAXw4veQKi6i9G+1whZKm3wKkxS
	XwgEhRRINkPdx57os3waUm87m9TovNncbVDwSh/F1D0gdHRb9MyRg1xxw7UTPs/e
	yGqimw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1cbjkkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:49:21 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6a2b8b91dc5so252076137.2
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781250561; x=1781855361; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C4AA/oGx5sqKMDcm3WaPRz10s2TG42Ep0EEBjqj7wU8=;
        b=SjFV5NwRtOtTsbxM6IJr3ehgW1KzkT0A8qZsLC/Tw7vDHcLIk9Fb5XR4V1wTbai7Pe
         GbNGD3Zq1HlAwidHqj3mhPt27M+A7ooLkOHxkar1hm0bBgmvKoi0OjF2v5fGteqSveHQ
         Dg6TguXIAHx7ayv7to2QdFfJLKA29jdZV81hKFlBRPgfIOEfKWr4xAp+5l8bbJjK8ACV
         XiHACFHwwQluHtjcn9l+fyoIecsQ09GHSCP/BwQ5SSdR7X//ZrjfUEM6ckn1ZXk9wB38
         ZXlPjRSw25mAW/3T0peqitmVPawDkFsFUKMkPtkXhWrZnNoRoCamlZAWN2EJfmfqVIUG
         ZKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250561; x=1781855361;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C4AA/oGx5sqKMDcm3WaPRz10s2TG42Ep0EEBjqj7wU8=;
        b=aOhEc+R0aTPkQ+wt1i41a6IRTUMHy7+UeHD18rt7QZcnVLvT9ZJ3mS4XEXkqn33Kj3
         hkhDInLKS2jTVp060CjNDLZDK8fzld/0iv2baPsozCByNLP0dkcODKQpC3vjTSjO8R8r
         YBUQF3SgQFgKKPXs8Xawls5bw8Zw0E5sixmggbVc+kFcXq5oiYvno9+13muv6epikfcw
         2TAUZ9PjlSYdovtkRN6YS6YQcy7TV4gd8sK31ct7F8ZruD9eO2o4wvGrjdwACZM65X4q
         f26kv0YnVdZgIVvgXlA4YbtNjVa3w7ffDQlc35CzAgQ6dSOOJaah1Naw715tzfqMToEJ
         5blg==
X-Forwarded-Encrypted: i=1; AFNElJ+o6d3kSJ8Kb6vokftSXcmFihkxxBfHPzjLta3Dh7KYLF9mTvspTV236Vneglw/Z1vDfFDOAsppxctH@vger.kernel.org
X-Gm-Message-State: AOJu0YzUZIAaXX6d0+ZMXnsmYMu2H+q9jQc0rSAoEmooGmJe1Da1w3zK
	nEaiku+YuNAK0XVgo1PzI01feASdg/ceQkMUq3VxnA37XsJdDE5+h4P9h8au1cAWyuD5dqAfeP8
	NN+ZhW8dfb83aSoov8OxdWbUEaqfeuyjRN+wUG5i5dza5EVvLqN9wAy5X43hH0E15TpVpFhDg
X-Gm-Gg: Acq92OGshytJ5wWfeuO9/vEO9+/3wnrci9eeYruwUU7AmoymT348fEoPA6OH0pAhvNR
	jcdBfJEkOk4PMRWpwTKkPnymcOqj8l0Z3gYc7v51CAly5fMjFlw/s38WK7aCPNAsJmhKiGptD2N
	1V6b1yV4PSbNzaGFQ6Kj1VhCc4sEr3UGrzj73OhicDQz39fqR4C2Fd4Gqs80HnYnFMyQFmTAaPD
	sJ+x6Gpy3Sm/AkA1mhPU/gN2CDr3iBcqtV+Vf75q7SKCzqDYnoKFqmIV5jymoo1mrbZ/A2Vmn+D
	SQUe8TCtFRb6FlS+XAysMtd4vNMr5W9J58N23hhY3Lhz9phdSLLT5wlV6fEpmGHmju/UubVox46
	2L25mkiF/QehZ0rGAy/oYDw5VbbYsF1dKX0JVGDiO8qdY2CjWA8U+L9rOObUXkOqeJKSBBMC5z3
	hiR7RBZ1YT+lNsIsklZ/njwr+QL30EAfejX68=
X-Received: by 2002:a05:6102:644b:b0:631:4cd8:b6aa with SMTP id ada2fe7eead31-71e88c54814mr544151137.13.1781250561320;
        Fri, 12 Jun 2026 00:49:21 -0700 (PDT)
X-Received: by 2002:a05:6102:644b:b0:631:4cd8:b6aa with SMTP id ada2fe7eead31-71e88c54814mr544139137.13.1781250560921;
        Fri, 12 Jun 2026 00:49:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929c4aa1asm4324521fa.10.2026.06.12.00.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:49:18 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:49:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: media: qcom,qcm2290-venus: document
 shikra Iris compatible
Message-ID: <q3sr74ncqnmzsjrd6jdbkpplxpnsnifhnvxsdplvogr2kf25p3@taadnzd2qrcu>
References: <20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com>
 <5YTsRTMAUGw0it3GAWHhKIh77_Hk823-xRJ4WxzQ-ENpdnC9-ttUvWhJI_CqFEetmFXcRel50GK_o2UMGzwZmg==@protonmail.internalid>
 <20260609-shikra_vpu-v1-1-3a32bb38b080@oss.qualcomm.com>
 <f793c665-ac99-4afe-a64b-bbd6d40044e5@kernel.org>
 <bc9a8075-db42-4de1-a3cc-4f6816681290@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc9a8075-db42-4de1-a3cc-4f6816681290@oss.qualcomm.com>
X-Proofpoint-GUID: 5hDLQVwvX0a8oIAOnFWRCAptrg71DsQ-
X-Proofpoint-ORIG-GUID: 5hDLQVwvX0a8oIAOnFWRCAptrg71DsQ-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA2OSBTYWx0ZWRfX+6EaYiXkrgUo
 LI75jQTRYJRdVKK+BL7aZvsm72nIY7hWyAxhH6mQy2p7Mtek4G4gX9815t3ZcndZNfn32bU+9gR
 HLRYRF+NGBIMcZmEeIrDpf7xSqkUWF8=
X-Authority-Analysis: v=2.4 cv=S57pBosP c=1 sm=1 tr=0 ts=6a2bba01 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=yW9dRt1GCuxPZAtmE0gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA2OSBTYWx0ZWRfX+7YjUCjJlEm/
 pQq5+z5fjERbxvfKDjmwwKsu9jznhWvdiCxgoU77cR8za4IdCr9uJjzLUFwiMjJp90S+hkxytzs
 KSc+J2NIi7Lzy6KgOfFevp7mSrZtSzRgV88uP8m+9cB3N9dSWffoZHCrZDt1AkSwJ/cX7CwKUVB
 wMUS9WgcsAeAuAGauGHN6JZExjllnb7D8pXw9OC66BZzxZBcS05baVpYvo6nwn7Coy5+5Enim/9
 nIYdIE0Hxml/Kj/lzpDFEWTKNF2J3UKr3ge/uSIsxV3dycCd3nndM8nFMjoQ3ONc9N3+Xex5GQj
 1FPbtjNIQX2SsuaIX6xTS+OKJIFRowhUofkEdxQgMUcU3WWGuRs/p6N0b0hTsTQHei0fp53WhEQ
 nMfS4zTKr/iROoJLaB7qv2q2LJ0XEmSguvUc+9InAMHL9x3cy1w9jdtQMtGmvbQJgazLPIkHr1Q
 A1Dw46H4/E6ndmqtafw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120069

On Wed, Jun 10, 2026 at 01:20:59PM +0530, Vikash Garodia wrote:
> 
> On 6/10/2026 2:07 AM, Bryan O'Donoghue wrote:
> > On 09/06/2026 17:15, Vikash Garodia wrote:
> > > Document the iris video accelerator used on shikra platforms by adding
> > > the qcom,shikra-iris compatible.
> > > 
> > > Although QCM2290 and shikra share the same video hardware and overall
> > > integration, their SMMU programming differs. QCM2290 exposes separate
> > > stream IDs for the video hardware and the Xtensa path, requiring two
> > > explicit IOMMU entries, whereas shikra uses a masked SMR to collapse
> > > equivalent stream IDs into a single mapping. Due to QCM2290’s SID layout
> > > and Xtensa isolation requirements, such SMR masking is not applicable on
> > > QCM2290 platforms.
> > > Since shikra uses the same video hardware as QCM2290 and shares the same
> > > programming model and capabilities, it is added as a fallback compatible
> > > to qcom,qcm2290-venus, with conditional handling to allow either one or
> > > two IOMMU entries.
> > > 
> > > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > ---
> > >   .../bindings/media/qcom,qcm2290-venus.yaml           | 20
> > > ++++++++++ ++++++----
> > >   1 file changed, 16 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-
> > > venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-
> > > venus.yaml
> > > index 5977e7d0a71b4fb5681f1c2094439c251366f01f..895533b9756690d075fd7729e3f805c8e72ff0df
> > > 100644
> > > --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> > > +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> > > @@ -15,12 +15,27 @@ description:
> > > 
> > >   allOf:
> > >     - $ref: qcom,venus-common.yaml#
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: qcom,shikra-iris
> > 
> > Should this be "iris" in a venus yaml ?
> 
> given the vpu core was first enabled on venus and now it same core on a
> different SOC being enabled on iris. There are 2 ways to do this
> 1. Add the compat to existing schema which defines the binding for that core
> i.e existing patch
> 2. Write a new schema (or say duplicate it) with ...shikra-iris.yaml, but
> again, the shikra compat would fallback to "qcom,qcm2290-venus" compat.
> hence even iris yaml would then need to carry the venus *string*.
> 
> I followed the first option.

It is a correct approach. However the block should not be called Iris.
If I remember correctly, the core is still named Venus.


-- 
With best wishes
Dmitry
