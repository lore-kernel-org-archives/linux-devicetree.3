Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBBA39DBE4
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 09:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782121885; cv=none; b=XAQdk+TNrswMYjjRlZC2ckDkzmgpxlefdiXhbg7CIUb2NzsFXpWcHlWipIZElfjfafQJ95mHyOy7kVMALu7dvtC4PInpr+fE4rb4y+9wFwrHDDjkH/IVesGn4kmFt8g+ghykeSGT4MkwTFH92qRb1ZN+J8ZPi6yAMvsLQoD6BYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782121885; c=relaxed/simple;
	bh=aE4FsBnNJvaWhU93PJqxU50S8JsmJ5NhDPXl/TgYFPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UyNl2Y6/ABWFYfTK9e07OlOBoy3UAhllcGK/MxBOXd48/izW2db2nU1ZYpCL4/PN1YsSz4Cdwf1VPezz9sLuZZX5AFqONLryHwas5oAo4YPEYa6lLKsRHZUZWod7RllIeckwSuGYlDYqjCjq3AjUuq/9xbgH2isP4vHSABHZ8m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W2bfUqfi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Syg8QKNi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W2bfUqfi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Syg8QKNi"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M5AN6x227673
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 09:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fRd6CaAcKy06xjZY74/JRE6n
	wNpgYi3kG87QOpxLYP8=; b=W2bfUqfiw39gTEX46O9qiXkaDmMqplS5w5+W5eWT
	WtOpbTsqMChqWZukoQZKv1UnWkk3+Pyr1hFfWufP+Mz5/FQiBqQTFph54NS/Jwz1
	vQkzoBHFXumHA5lQ1RzxAoudrTInt6RW2L4hXbpyPyq+gQhz2TdcBlNmW0+FLrOo
	vvDeiert0JoY3lkxAJ8eoNEN65FOfDLBF865zLGKxUWduf/Hgyuu0vJ5uvfTvPu/
	eicqzLu4oeiJNyTrva5iYLkXOy1/5ChJFMUS5yOMKgAaXmMb22XNwIVCutT3FIsO
	+E5XPktuHrN0Xci4lf7JlXxFHKipilLr6LCwESjH6x3qqQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewjxudvxt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 09:51:23 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c1f6c5559so4514942eec.0
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 02:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782121882; x=1782726682; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fRd6CaAcKy06xjZY74/JRE6nwNpgYi3kG87QOpxLYP8=;
        b=Syg8QKNiWIsBz++n7Gjafw3RuOPqjx+5hbNLcXwMEmk+Uf3Z+3G71Nt4qzkWpqufAV
         xA76+B4oFkK2/fwF/QCyL0XZUgqsbS8DRSkh9md8/vuWzQF3oBq3a+DqRe4P/KPAmTim
         M1yOzPGV+oZLi/3bh3anOMNSwtU7833s3aViy5cc7Rtk5PnpJJIFWQbblxGvLs3hTS/H
         +BtJk6LAUe5uU84IZeOK4/LyFcNZUS5bSXxpLLOdVpFzyU4rdzVkSnPd+w790LFYYmrn
         7j8kQCnhkKY92UtzgAxarVupEt6GDb04EfbfdPCdfBXlF0wC/jXZQIoVdKQgFgjO0oYm
         uqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782121882; x=1782726682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fRd6CaAcKy06xjZY74/JRE6nwNpgYi3kG87QOpxLYP8=;
        b=sguLJkDp8te81jACNbvgHIttp9Ks11GHr2gxvs2NcZLIzbj0KqsU7J9aoIIwsfKTfS
         NRCun3S1LpLaMaTau4Ewq0wIAP4mJe4x5l5TIxd1MHJjZ79h4p5Mni5dVBP2JvGWi8Si
         KQojMdwnzFlfJ16quKyNmCCnahuVqVnCSL5MQPwYPVQq7IdB/BzoW848M1cW+z5+xtx5
         E+SqDUz6rcfOGdA4qPEnV37g/VN5n9KQzcNVyVdy790Lk1FORiLug9+ctn5ZUisKvwRL
         jeofaS5HOluVtbGD3cC6hXjFEktVd7UMud5+3TAoeD+BjaSNBfN1tPWWCCN4St1KJTVa
         vHIg==
X-Forwarded-Encrypted: i=1; AFNElJ8J+0ZaqV5DxQlx/RMK/52dVOkfzGqSt7rD/uT2qw5dwHnP0O8alfKiqt9vzY21Xs1jEdW/swkZP5ZU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+LvUT/Svknjp98kVJUth+04PU0mfVf/vyOB9fklZXLj1kGSFi
	tgmzBu1zLHrNiZJ9ZwMPD3Cgu25mij1d4BztszjW9s4CdUVBuldBlsV1f9zjssysua//uUSd1iV
	EeDEtYDMtc7gCnEmGh0DWH7gMUplwVVhPqKFgEhwL1LLrZIateRll4/Ht74WnlSjP
X-Gm-Gg: AfdE7ck43Jz1pvwxics/ZetJ2w/TT1uiI+3lJXe/yxzswMhTBqj02Tq5F8furLiWhuy
	J7dHiGKeDgd71gqvEzDtFyPyjawR1+3aHKfPv7617sbl9XF0HX7Bo1iJG3TwxCxFpvSu8TaCMGQ
	06ms6ZK1oz7m98i0UIp8EO5o62iuy70Bgw4b/ggKrOfumNcWGvWEKyoncHTVBZDurkP7a4Cb6Br
	H2aX+eg7HqtE3+DJk7gOJXObNTVWdX6PaQAGM+jMUuuO3OB509fuhL2pAIRdAunKLOkqo13OP14
	Y9M3iIcob1RevZcK+4XRiAwKv6FxjwlRPp/Hd7xpwEArRGldjIV2sOIk91oqE4btbThdijtL2NU
	u5JZ/axAQrGkksO7J24Xgu0mD0a5batn7iiyGi4kpeL/b1F33WZ4U4aBM+g==
X-Received: by 2002:a05:7022:ec2:b0:132:fac:2fb2 with SMTP id a92af1059eb24-139a202ec66mr8670839c88.8.1782121882234;
        Mon, 22 Jun 2026 02:51:22 -0700 (PDT)
X-Received: by 2002:a05:7022:ec2:b0:132:fac:2fb2 with SMTP id a92af1059eb24-139a202ec66mr8670810c88.8.1782121881525;
        Mon, 22 Jun 2026 02:51:21 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139adcce488sm6774074c88.8.2026.06.22.02.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 02:51:20 -0700 (PDT)
Date: Mon, 22 Jun 2026 02:51:18 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v6 2/8] dt-bindings: clock: qcom,glymur-tcsr: Add mahua
 support
Message-ID: <ajkFljva7c/FuaSk@hu-qianyu-lv.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-2-c939c22ded0c@oss.qualcomm.com>
 <20260622-legendary-graceful-goat-3b5d56@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622-legendary-graceful-goat-3b5d56@quoll>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA5NiBTYWx0ZWRfXwZvVfCNJDU6J
 z26lRGDCgDhaAVpehNZC2aVNn6r7IUj14TsClaiPySUWG18ejtFsDb0fbYd0Foh6ACIlcyLlJtt
 L+PLafgU0tp10CW6KLNnrCmCBF+PxEM=
X-Authority-Analysis: v=2.4 cv=G/ws1dk5 c=1 sm=1 tr=0 ts=6a39059b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=j0q-cQmEjkG7pVFzz6UA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: tNpZe2_78P9yN6FUAr1lYOh_0nYfmp4S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA5NiBTYWx0ZWRfXxddOLeieYnTu
 hA9cd9N9jy+hl7GKGrICNX2WgEonPx90LyLMUJrMeffm2oUWuoznDPqxf0n0D9Faf80aJRPeO5e
 Sxkh/BfTwFdXUG5PLADyjF4aNFlPPfh6XbtltAjM8//BlEmN8kkXy5pG7y0NHHa00oYhemdIURd
 8Fa8cueQ8hAFQlPZ/PcJLoUIz2jH00i0Bri+lRrv6U4ApKAOvE8GW0WmPE2gquD7Lrc+OcYEYs7
 VMziSjVtGxHi0dZ0Z3PMNUktFc9JBMj9lslh57WwMPilUuR7agPnn1PpAcHZZa85k6QP+d0X9Dt
 GGWRL7D/CncjwThn8qEq3DY+c591++peELH1fwOS+w8u0DtQN7LXOdNWYheeSYsN7z7OlsE5jy8
 cX/OO7M5p+N1agwGEKo+LuFDeHsBpQrbk8qT7Zbxdd/opzNOWpPPRvlOFKKxsCL+dHLeXip9agv
 tH8h/Fpmy8V0gvqXcuA==
X-Proofpoint-GUID: tNpZe2_78P9yN6FUAr1lYOh_0nYfmp4S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220096

On Mon, Jun 22, 2026 at 09:32:34AM +0200, Krzysztof Kozlowski wrote:
> On Sun, Jun 21, 2026 at 10:11:25PM -0700, Qiang Yu wrote:
> > Mahua shares the same QREF TX/RPT/RX component naming as Glymur, but
> > has a different topology: a single QREF block fed by REFGEN3 only,
> > rather than the two independent blocks fed by REFGEN3 and REFGEN4 on
> > Glymur.
> > 
> > Add qcom,mahua-tcsr compatible and document its required supply
> > properties.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  .../bindings/clock/qcom,glymur-tcsr.yaml           | 68 ++++++++++++++++------
> >  1 file changed, 50 insertions(+), 18 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
> > index 16fc6ab87f9b..2b6422627165 100644
> > --- a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
> > +++ b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
> > @@ -20,7 +20,9 @@ description: |
> >  properties:
> >    compatible:
> >      items:
> > -      - const: qcom,glymur-tcsr
> > +      - enum:
> > +          - qcom,glymur-tcsr
> 
> You could have made this enum in the first patch, so you would avoid
> changing the same line twice. Usually adding line in patch #1 and then
> removing it in patch #2 is indication of something to improve.
>
Okay, will use  
	- enum:
	- qcom,glymur-tcsr
in the first patch in next version.

- Qiang Yu
> > +          - qcom,mahua-tcsr
> >        - const: syscon
> >  
> >    clocks:
> > @@ -41,9 +43,11 @@ properties:
> >    vdda-qrefrpt2-0p9-supply: true
> >    vdda-qrefrpt3-0p9-supply: true
> >    vdda-qrefrpt4-0p9-supply: true
> > +  vdda-qrefrpt5-0p9-supply: true
> >    vdda-qrefrx0-0p9-supply: true
> >    vdda-qrefrx1-0p9-supply: true
> >    vdda-qrefrx2-0p9-supply: true
> > +  vdda-qrefrx3-0p9-supply: true
> >    vdda-qrefrx4-0p9-supply: true
> >    vdda-qrefrx5-0p9-supply: true
> >    vdda-qreftx0-0p9-supply: true
> > @@ -54,26 +58,54 @@ properties:
> >    vdda-refgen4-0p9-supply: true
> >    vdda-refgen4-1p2-supply: true
> >  
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: qcom,glymur-tcsr
> > +    then:
> > +      required:
> > +        - vdda-qrefrpt0-0p9-supply
> > +        - vdda-qrefrpt1-0p9-supply
> > +        - vdda-qrefrpt2-0p9-supply
> > +        - vdda-qrefrpt3-0p9-supply
> > +        - vdda-qrefrpt4-0p9-supply
> > +        - vdda-qrefrx0-0p9-supply
> > +        - vdda-qrefrx1-0p9-supply
> > +        - vdda-qrefrx2-0p9-supply
> > +        - vdda-qrefrx4-0p9-supply
> > +        - vdda-qrefrx5-0p9-supply
> > +        - vdda-qreftx0-0p9-supply
> > +        - vdda-qreftx0-1p2-supply
> > +        - vdda-qreftx1-0p9-supply
> > +        - vdda-refgen3-0p9-supply
> > +        - vdda-refgen3-1p2-supply
> > +        - vdda-refgen4-0p9-supply
> > +        - vdda-refgen4-1p2-supply
> 
> It is fine, although this you could as well keep like that in first
> patch and mention in commit msg, that binding will grow, thus you
> already define if:then: block to accommodate future changes.
>
Okay, I will add the if:then: block in first patch and add some
description in commit msg. Then I also don't need to remove 'Mark the
relevant supplies as required per compatible using allOf/if/then
conditionals' in commit msg of first patch.

- Qiang Yu
