Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2000E392825
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 07:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779436330; cv=none; b=mqvsWrQlR9Ti7fb47zjC97zkHtlLj6c0mnDCgkTwpfJ7RUrKQtLNqMLmuzGlWrc4/k8ELEIEh/acM13DdK5SGJ7cz4TqfWIkFSY14kk51235OiEW8JOHSTOpPQbq3Do7ekUYHnW6iSURhlMP2IUL4Z5IAmRTe5KG4NunKd+JxyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779436330; c=relaxed/simple;
	bh=uQO/ppJN4//X21q0E3AO6wvjM3i1W2lW3vAhF/4Nd08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLOlCkhWjmMDvEUJgTl9gv/puXCv1C/9/IR7Y2UqQsi5eCgQ4sA1pN4YIOQ9998OlMMfZlqG0aY23sEsQlw5pubK4FQGnaeAdehguOQAXznfk7+1ZKcDE1PVvJH4vwcFi/t3rn1HfEwN5z4dmKzBeGPjM8iFiYWMw7YVjuO9ag8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lbF9CIiL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cBrz+0u6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lbF9CIiL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cBrz+0u6"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M2sNnt1658219
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 07:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=E4QqjnKpknNvt5c1OucC1/DJ
	WgIE/2OWCTMkqhVNWzI=; b=lbF9CIiLSqUYgSpK1DuDJMr89uijJ+9G1FuX+57Y
	Atz+A+SS9OFjip5fHkcIzFKVJDNyr1PmFj3zdBUvZYOv6AZm2DUElu6htLkjzmXX
	MsCKJoWTW1a9z+tKPAKnVK/l0twDRN7q9TuyNX5kbq33sOTwixNm9lgKg2v2IdMo
	3HVKTW9wFe7EyYtNPzXtk9YSTM9G/jG/vmJs1b7OkSzGfm9RZIwZaJE7+NiVBOTZ
	HJMtigpXw9dQr2bi3QUy6fYcdJlfKBYemEvu5uD9kBKqhIFrNwaJPz1obyji/4fY
	E4gmHYcS0noKKtxdIrGi/ohEZGQVlOyI8hiMUQ2bGARnwg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea0dkmj05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 07:52:08 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-835423c69ffso3716593b3a.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 00:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779436328; x=1780041128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E4QqjnKpknNvt5c1OucC1/DJWgIE/2OWCTMkqhVNWzI=;
        b=cBrz+0u6MiHnleVerwKQ95zaIwN5QHiyCM160KPUTxIfqrSeohzqvvMuSFgjR5ycae
         khKpviEUfNiiVrMaPMWvh/bPkKw/C9L5DvrYAWJ3PPFcfz/5QtEh7WIoLl3SuQyLLrSQ
         GIgPtDkmn6R0A0Wv941AriIyD2wRgnmoeuHoCERpWuLM0DyhYl2Ke7mR5uTL7651qeSm
         Ms1gDxHxNXFtuPPn0HhuV1rTa/m8XhkiGzDuqdgRQXr3aMM6xqu0W79rQIk0K0Me7TAL
         oHpSyZ0i8kzTy46xjJAWO9wXvlVDH8x3kq2FhTzhDtqRS37WFamEJyrGGXIMxazz11F3
         mxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779436328; x=1780041128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E4QqjnKpknNvt5c1OucC1/DJWgIE/2OWCTMkqhVNWzI=;
        b=B6ZCyShL47+8v71gFLzAtpxBe2Lbnrh/0tDayKaVjyX8iwopcnIaZX1LKAbqec42Mj
         hMiHMSD+8jkkCSYxGR4vuafmHJt6MGOv75OmcjBOj/lrcqApXuoBB7lp3fZYPValKXuD
         /0kaSXX88oxCyIZkQHvPTLLBIIh+JbKxlGFeFjb3vZzvHTb2YsRhLA/E2HsanPQOPtes
         NYEyHSDOZ6+/TipPfnTX9hJFunABdM+zLT2Ar4uLHy/94k5dfFJ/BVKJNcsCEGxJ+45T
         g1+KcbP7A5P0bvA1tRB5c1/p6yESdrAY+ToHbjnMYkgfYokwi9ZoQISv9/cRmUJS7zY/
         GHrg==
X-Forwarded-Encrypted: i=1; AFNElJ8hROm7BSdxqRsLLEGzRHvCaE4y9Y0pvXTGa3o5vmRzHYlgvZQTrsVD0viKWYWpurozMOaEShCaN+YC@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0+JUcr3GCDnfZzRO5cwwFqNikrdPJvh+MDYucIZQjFjMLbKkG
	/60E2pvZVVvGGwAdu8+7c/eAqcpBfvkCshFmFw8fKQ/I5ta8bHNYUwPr9DFBDesQUjaIY1cik1i
	NB3tx0d0d4JWEqt3XjtSzAaK8tlp3KEAwKCHMQEEXXAJTzOuIYhLymy0Fnj4ZEJUu
X-Gm-Gg: Acq92OFOqgPLI9ss6I9xpg5dV7kUc96Lb8DWY/VeuaQCBFTHxlxeVcUUfqN6GblVS8V
	FIlEtq6T8DLsmwmdaUzJMrn/zsh1s6ApB2WF5Znbxz1VoM4RW6ZgfF8RFPakQqvNoQP326zF7k4
	RQBFqJ2ZCUUYtK9K3//PaC9HkT0ggYC/8V2HKy/Y1Ia+0dTu0eNL3TZHuZJkv4x8LL9CLGUHGuR
	8fNKAz37k37FaULNVTQcaMRN6+b5PTvePx+J80BDMJiVB6pTKu2AWSC4vu4itUtzvCogODdjfEt
	OwGDqLYyhDwCzvonOZ9oS1C7cyoqp01vroxiiS1ERUds5HvEKQYIR9kXjZOoCEJQVb0qG/IN0Ja
	sdaJUru2cfW2OEZjWg+4b3T1qKuXFt986CppJzsI536B9Gn1m
X-Received: by 2002:a05:6a00:298f:b0:83e:c76c:d720 with SMTP id d2e1a72fcca58-8415f407bb4mr2391638b3a.30.1779436327716;
        Fri, 22 May 2026 00:52:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:298f:b0:83e:c76c:d720 with SMTP id d2e1a72fcca58-8415f407bb4mr2391595b3a.30.1779436326812;
        Fri, 22 May 2026 00:52:06 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164e9e7d8sm1182749b3a.28.2026.05.22.00.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 00:52:06 -0700 (PDT)
Date: Fri, 22 May 2026 13:22:00 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: firmware: qcom,scm: Add minidump
 SRAM property
Message-ID: <20260522075200.lzpj3cfqvrpzv7r3@hu-mojha-hyd.qualcomm.com>
References: <20260519171442.1582987-1-mukesh.ojha@oss.qualcomm.com>
 <20260519171442.1582987-2-mukesh.ojha@oss.qualcomm.com>
 <20260520-hopeful-beautiful-agama-ecbebf@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520-hopeful-beautiful-agama-ecbebf@quoll>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA3NyBTYWx0ZWRfX1w70gdFI8pSc
 QzS/V8NdMhgN6+T6d64EUOii/nop2y7xWaiyddSTm8BA5C+64Q2fAMh7K7MHQLbJhBIbVq2+2eH
 vSSlyKlqTJoBvDEWSR6y6aQza6sBrhBaHwxsKu5ODu71t16Gviggslbm0657xIE9Uksx+5Jfp+B
 R2IlRNaJQ+LhSGGc8pKGIp52Gnvc8zmX3IAywDXX8zZUPBc9YIolDBCtEnhoc5kOtutZ9M/z0CO
 1nJF3ahjpEyr/vbuf139xu/+TcmilcvaG50yF/RYPRLBkdYE06+58ZGEB43FepPTYesWcxS7NH7
 w40ErJg2ClbHKBo0FSLSMMKhp3OwJacQ6fA3evNRF9v1ol2UZPMyPjbDyT/38ljb1Bw597wsm/F
 L7KyWz9l8NCgaSOE4oQ/hvqQZ0sP9RDmq6gWXqRd/lu8/ezi9Lh3uSAa4mNbbYya0w1d3pivfHz
 3VI0r4veWXIbORJ5hng==
X-Authority-Analysis: v=2.4 cv=aueCzyZV c=1 sm=1 tr=0 ts=6a100b28 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=zTSmB-ngaieQRBGXSw0A:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: jTNH3BhMtKQmnRYb6O3AD-V8fV7L7Qnh
X-Proofpoint-ORIG-GUID: jTNH3BhMtKQmnRYb6O3AD-V8fV7L7Qnh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220077

On Wed, May 20, 2026 at 12:17:21PM +0200, Krzysztof Kozlowski wrote:
> On Tue, May 19, 2026 at 10:44:39PM +0530, Mukesh Ojha wrote:
> > On most Qualcomm SoCs where minidump is supported, a word in always-on
> > SRAM is shared between the kernel and boot firmware. Before DDR is
> > initialised on the warm reset following a crash, firmware reads this
> > word to decide if minidump is enabled and collect a minidump and where
> >  to deliver it (USB upload to a host, or save to local storage).
> > 
> > Add a 'sram' property to the SCM binding to describe a region in
> > always-on SRAM where the minidump download destination value could be
> > written. Boot firmware reads it before DDR is initialised on a warm
> > reset to decide where to store the minidump either to host PC or to
> > on device storage.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/firmware/qcom,scm.yaml   | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> > index 25f62bacbc91..27422d00b8fc 100644
> > --- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> > +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> > @@ -129,6 +129,13 @@ properties:
> >            - description: offset of the download mode control register
> >      description: TCSR hardware block
> >  
> > +  sram:
> > +    description:
> > +      Phandle to a region in always-on SRAM used to store the download
> > +      mode value for boot firmware to read before DDR is initialised on
> > +      the next warm reset.
> > +    maxItems: 1
> > +
> >  allOf:
> >    # Clocks
> >    - if:
> > @@ -250,3 +257,12 @@ examples:
> >              clock-names = "core", "bus", "iface";
> >          };
> >      };
> > +
> > +  - |
> > +    firmware {
> > +        scm {
> > +            compatible = "qcom,scm-kaanapali", "qcom,scm";
> 
> Incomplete, missing interrupts.

Interrupt number comes from firmware and has not even been described
statically for SCM  for any SoC and so I am not sure to include it in
the example. Perhaps I took the wrong example here and should have taken
some pre-Gunyah Qualcomm SoC.

> 
> Best regards,
> Krzysztof
> 

-- 
-Mukesh Ojha
