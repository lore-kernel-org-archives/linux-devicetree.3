Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B733246ED
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 04:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775102944; cv=none; b=ZNM3+Jklk3Xso2kHNF12VLZKPUqL+kdfS7xD/iIiErHt4vQFtTIm7HqYPCB1UO0kJszJgzlBsUXmfSY99xX0RNhZ/Qg+VuKcxpqecH61m/pDnSwUm1rICU1BdjhTbAk//kc0g21/KL0uW1FfjHHoDOo/o5dtoEe10ao9X9HvNos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775102944; c=relaxed/simple;
	bh=+8E/LhhDwPbM7UOdwh+kSRT2qx2VMg4VagLyy9JkD7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+F5bmGd8cZgIEzF5HV81AdGnLArHeNvtBK3GMlJE/Upwjt3hu8IqZg/dfBodOoLIvJb+Rcwk4g8cUEPzdJEd27E8rpW5MpXfUTsq3ig4rTYhkbfKHjL1wotl1db+Dj5KY8UrxO0lKhxbGMO5gfsfiNbzf5TmhksPTtUCi95oU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f1MrNjH+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WB0gSXGu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f1MrNjH+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WB0gSXGu"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M4Eud3335253
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 04:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Aofa1JW3AOYZFQk2Olb/0D9a
	q9CH2o6vk4E4accz114=; b=f1MrNjH+BObNeOh4VMVqLjiFr5OaGAdii9TkXFEd
	J/g+dAX+A4v9TrVFq5pSolVuP0O1qlVF4OasrvyeTwZ3KBE7tfLOWh9i415O3kcM
	oM89gldy8lpnezZx8cfDajxRIT10UcbYrvW1nCXETn6jVCAPEPawEvJ+OuCsKvBx
	BMJOHrauErXmc4f+D2BFqfej0zaHG6TFx9QXmRoLfQwazl8o551G35r5wtftl0HH
	ks7WoKTK3aviC7R5VcdzKV5tAS4CiMvaKVazqjaiLm1RQkDZzdwMTTibLCz3guLS
	H3BNDMa3EIU+/sddOMUPGbn9VpKW+2Wf7FMH9gg5qx2F6A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xm3veyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 04:09:01 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bda35eab74so450273eec.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 21:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775102941; x=1775707741; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Aofa1JW3AOYZFQk2Olb/0D9aq9CH2o6vk4E4accz114=;
        b=WB0gSXGuzfhrQyFpdnAJQLk3g6Gfjbv21KOAtuXZMK1YiGDuyukl8cuPBEipiUnF5S
         qmf3ggFFqY7f+PQhQujJQdtV5+oKmjhEL9Qbd3RJUJvEHBn5ExgmpSvjFgnMMAvoq4Ni
         E7gvG1uCz1GB159CGt5C5VNsar4cGuiSopGrXStrIuVPAjis0Fhdv4y6bQX4NlcBUzbr
         X7VGSCd0yHndKKiQAsPw4Lks0lk68CxzxRdNZjgpL3XeR6+8sTQFCawBx481xUfSx3HI
         Yc1Owjr/NxtJbVXAz3il06DxQUjdxY6NSKtfQi8M85NZKEkAQhx5ckAl60JToSPMQ45x
         b96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775102941; x=1775707741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aofa1JW3AOYZFQk2Olb/0D9aq9CH2o6vk4E4accz114=;
        b=L2HeoMpiIoFXXtwS5+kEwUtjg02tcTUqtQlR0qUVJBFBz0ClLHVKDfYQ/c2GMjNuKn
         Ugsy7nhP4YlntLdahES1n8X7fiGnS4K/So/MHIaQ5GZ9nb6q1s41pDPCf2fnjTmoyHN/
         HYw/YvSw0sRAv25Zvm8tLxQdKsWswpdmeT6+T2C+JSCLZ1a2PzM9ExCex1l0Pp16Z5Gm
         eEXZ6QlouAnrFc+ILpHSxBIpp0pzlr744sjs4ykBZA9bZyq8JmeSk0jvsM4PxOXBgCi6
         2j1sksjMNvkKif7Z8/APU7Pm5Y/869F+D/aP6ARzSsoxhAQ/217EWRTG7m97Zh3FW+nH
         Eu3A==
X-Forwarded-Encrypted: i=1; AJvYcCXULH9po5P0jkt8xLKpvtgTmdy6eiAMGSZLOnCFyTkwCJibl2yWp5tqXvi4wIyGAokj4QDKoBf0JPk+@vger.kernel.org
X-Gm-Message-State: AOJu0YxZi9udhOdyXN4GYMHAEby8uJ79u8myiHbjf44Nl699se5jExBl
	lN2quhOmKpDrEI5NeZTfGjrIaTDi9XCy2NVZ7MBa0lxyx8kkrHvAXgW+eVt07roxUoCzZ04jDwr
	HYmRnHIqqJmm9PpQWN1SLYz8ms072tvV6EnX5qGDPAfU7oTCR2T6ZhShl2K6TWz5c
X-Gm-Gg: ATEYQzy30AHGogJOgb87avzh53bww212c6kS2ZuThlUCUycBXWKEwD5Uhi5AQh5K247
	bZawh1qXa7SEh6LZ5y20nXTKCwulOCQX0IqoTPmZo7L/6ZErfyb/hIxBbxewDmMgwy5K87Wr1Y+
	H5QPGh1oACLje8Ge1rT+F2dPRfVGki0llTeQRXk3NRrKt9L40VVHM3qe2UA3PwXXndLCte0nES2
	UA30K95uz626jaLVDRU03nJTRlMIVF2pyflYXhkgLfbtYlxyGF/maBw8x3/ta2Arn0ubb/gzLnv
	5pp9nmqUf0FK4RwYeXEgM8nlaE7FUaoYI97I4RKw1lIoeTflFnpsu/bZGLve9bafwaHxpHoEoSG
	yg40CBZ0VjkVWK4aZNngfIW+/gNzI5wc0DCVzVAE6CjWLuICMCG8bVcwMYXYR9N1GQaF7
X-Received: by 2002:a05:7300:dc05:b0:2c1:517d:5e97 with SMTP id 5a478bee46e88-2cad6baf65bmr330289eec.7.1775102940733;
        Wed, 01 Apr 2026 21:09:00 -0700 (PDT)
X-Received: by 2002:a05:7300:dc05:b0:2c1:517d:5e97 with SMTP id 5a478bee46e88-2cad6baf65bmr330270eec.7.1775102940176;
        Wed, 01 Apr 2026 21:09:00 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca792f3f54sm1386123eec.7.2026.04.01.21.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 21:08:59 -0700 (PDT)
Date: Wed, 1 Apr 2026 21:08:57 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, johan@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/4] dt-bindings: clock: qcom,sm8550-tcsr: Add QREF
 regulator supplies for glymur
Message-ID: <ac3r2ViH1k59B6S8@hu-qianyu-lv.qualcomm.com>
References: <20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com>
 <20260331-qref_vote-v1-1-3fd7fbf87864@oss.qualcomm.com>
 <6d0c1154-b249-4c44-acb4-52d43d626fa6@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d0c1154-b249-4c44-acb4-52d43d626fa6@kernel.org>
X-Authority-Analysis: v=2.4 cv=L90QguT8 c=1 sm=1 tr=0 ts=69cdebdd cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=V3kEKwUAXSpzXU6G4ikA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: z7TsRoEKfGqWPyril38nbKDNgBh7n5ca
X-Proofpoint-GUID: z7TsRoEKfGqWPyril38nbKDNgBh7n5ca
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAzMyBTYWx0ZWRfX8pOdKtwFQbuA
 Q3sgYaponpO6lJ+MjIeFnO0puDsYwjGyL7dH0M+3p2a5Cq5Qui62wplXlqG81Agf2KCxX8Dr2jy
 D68e579Qpu/gP7wORDFVYDm5tEzUXU60OXIjHDlLUYvmeGHv34Nw1S9OwdkaXQ5zK5vvpK35etP
 WpARlJ9v5ZX70J9zXZFobOfvwp4Ub5lFK3/WL7oClBt7cq+69xblaH5BPjBkfUvcMUX0pF1YYGs
 n5Qgxw2AXiNUF7iwT6Mk/42aJmAF5wNei29cGJkQFLs+smuclx4rxhuNzDpSsDQwnHY99NuOmXw
 eO8jP8CVs/r4dKNP2d5qL8jgTWj6ETP+H9UyOn3scsjNG+OlJkLyIuJJGwgF3uyKO5ZdvvtUYYh
 889+Cgogd6dkEepFUG018mz5lLaZboztFESqdxkz92iZqJaACgj1M3TedoeldaLLODVXxkF6ItE
 WXEWH0X7+Y4lhfVuKog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020033

On Wed, Apr 01, 2026 at 09:18:12AM +0200, Krzysztof Kozlowski wrote:
> On 01/04/2026 08:35, Qiang Yu wrote:
> > The glymur TCSR PCIe clkref clocks require regulator supplies for the
> > QREF block and its refgen reference voltage generator. Add the optional
> > supply properties restricted to qcom,glymur-tcsr via an allOf/if/then
> > conditional schema.
> > 
> > Switch from additionalProperties to unevaluatedProperties so that
> > properties defined inside the if/then block are correctly recognised as
> > evaluated and not rejected by the schema validator.
> 
> Sorry, but no. There is a reason for that why additionalProperties fail
> and writing-bindings explain that.
>

Okay, will change this part.

> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  .../bindings/clock/qcom,sm8550-tcsr.yaml           | 26 +++++++++++++++++++++-
> >  1 file changed, 25 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> > index ae9aef0e54e8b8b85bc70e6096d524447091f39e..88db650e69ef2388a5bfb6783a57c1d48c0e780f 100644
> > --- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> > +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> > @@ -49,11 +49,35 @@ properties:
> >    '#reset-cells':
> >      const: 1
> >  
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: qcom,glymur-tcsr
> > +    then:
> > +      properties:
> > +        vdda-refgen-0p9-supply: true
> > +        vdda-refgen-1p2-supply: true
> > +        vdda-qrefrx0-0p9-supply: true
> > +        vdda-qrefrx1-0p9-supply: true
> > +        vdda-qrefrx2-0p9-supply: true
> > +        vdda-qrefrx4-0p9-supply: true
> > +        vdda-qrefrx5-0p9-supply: true
> > +        vdda-qreftx0-0p9-supply: true
> > +        vdda-qreftx0-1p2-supply: true
> > +        vdda-qreftx1-0p9-supply: true
> > +        vdda-qrefrpt0-0p9-supply: true
> > +        vdda-qrefrpt1-0p9-supply: true
> > +        vdda-qrefrpt2-0p9-supply: true
> > +        vdda-qrefrpt3-0p9-supply: true
> > +        vdda-qrefrpt4-0p9-supply: true
> 
> I really doubt that TCSR, which is a small, tiny tiny block the in SoC
> have this ~15 pin supplies.
> 
> Anyway, if it has, then device is quite different and should live in its
> own schema.

TX/RPT/RX are common QREF components across platforms; what changes by SoC
is the number of instances and the routing topology.

For example, a single PCIe path on Glymur and Kaanapali:

- Glymur: CXO -> TX0 -> RPT0 -> RPT1 -> RPT2 -> RX2 -> PCIe4_PHY
- Kaanapali: CXO -> TX0 -> RPT0 -> RPT1 -> RX0 -> PCIe0_PHY

The DT supplies added in this series (vdda-qreftx*, vdda-qrefrpt*
vdda-qrefrx*) supply to these TX/RPT/RX components and can be resused by
other plarforms.

- Qiang Yu
