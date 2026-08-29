Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469D63F106C
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 20:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788034638; cv=pass; b=BzaZAAUxbFM9i2oUoJAuzGbzVYM6QwNsZ2meMqOi+U8QOHprLvfi6TI+ee71hJ9GseOjiFKsjWBhSf37FnT9qoFWLbKHlcVsHn16mkzQoHmX2/JCTyYCptjUHXRyzX70s18cjMHRN2eI4Q6KNYMb1+oyFlTFU5gwPTOBv2jM7bg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788034638; c=relaxed/simple;
	bh=zV+6p4ubGKbiLmgem3EajeC60iHzJEHcw1TiAsOWq/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HQTlcWX2k1fPH+aXxwMvm1SJaptJms7r4uH7b/QkwykkFv5Bp5rcMZfPTF8i/Ogi0EWfalAvxLuFMFDGN483OLNzAleNPycWG13e3ST09gxoZ0O5q7YANIXNoutkksK2A+R199TBW4DA3aFvXRrb3o5d4tA/RWS76GBiWSWk8Q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=divinehawk.com; spf=pass smtp.mailfrom=divinehawk.com; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=divinehawk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=divinehawk.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c255206b4dfso280614266b.1
        for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 13:17:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788034635; cv=none;
        d=google.com; s=arc-20260327;
        b=e4D3k4tu4avB5ugT1iRCBHiveSNk4aGv0uS503YDbcMYYjxqBgHqMxjNmLyCNqDpGL
         dIWxKnu0V6eiu4Vx3Uod8Z1ZuLB0NdbQSrvgdTbu5yHsQ7H2cLVa/IzOMtM9GD8Enl1n
         g3F/El4+4/+Ax3dyhV/N7mZncy71KrRf0h6a/m6Q5d97bk4sIul6kGvEqq1H8N2Eameu
         F87EcuJ5XsT3apJQWRpZHCaed/rbqm7H0HOKr+IgDt6MLtJXpHzVTCpys40BUPBEaQjh
         6nqkc0tvJ4DJp2RGKRDnu5N2gy/ORRvCRxsbkvyDBbcxRuDxNzDVToqRaR/D3ldZ1mZN
         dBVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=6C6ojXuUuOCnp6lQZBCyXJ7Yhmo+q/tVeeyZp6SEgy4=;
        fh=P2lA9NPDlC5eWkgPreZIjP0x2CFLTF8D4dctxB8Qxe4=;
        b=mVUgSQv+SXnNrKxLWLTTU2S1DDvMhV6a4kDm8YuwBqk7iAwk9G56eodxqU5Zydjueh
         yilUTQhdiO7jjsJ2Ebfynfk0AHPpd0ymgEG+nV8kVPNyhR4oF+LvV/UIl5GjwsdmKeGm
         3iTIs3e47DfhPP2uG8k19f2epblq7AgAbO8YjIVtsVBfamKsIHEbKzIbrpawd0Z/3kFM
         D/kpfjSLAKJmTtbCL6MohNUBkHLyJM2W0dFM3Aq5xA9IWK95BDqAzic+VFwJ+q+Kp0NC
         bdaP1kwWc6gAoDP0fkRL+vxD5UYhb4baWUdK44tBROqVWg6YHRxcyZ7MvgGclNKdDuBw
         POlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788034635; x=1788639435;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6C6ojXuUuOCnp6lQZBCyXJ7Yhmo+q/tVeeyZp6SEgy4=;
        b=omv55f/yaBsoXBy0+/+IMSSSCrgCbBBa6vWYlQolE8PSjP2B7pDrZWeiKLu9dVCn1Q
         GOnBj6D16OKlRDX3I52RNRo3zaEd6nbicCLa8bn155Y6PqLsS28aapaOpiOhHEsIdvKd
         6tx9DarcRnWaQzWbslvAq3kicdQUbMX4UbJQv6cpcqOGiHlAoqpGb3UGYUXfkCh8A/2b
         oRTDWTxRwY6ktec4wBKlc3nLJ43kBdckxtJEVLhsTmsDQegkwY95TMTiHeGG5PcZvnYL
         f3Mpw5RciDkbVSu5zrwftTVOvk0oMunOQjqEN4/6bmgzpb5NZTie+sT5PK61NCZFOhGS
         AEqA==
X-Forwarded-Encrypted: i=1; AHgh+RqNXxZp+AaZG5Q2KKxqhaMPK65+sRm6KpzhvpsHYND8I0Y2NHrIQQz1V7zzpRio42pbNvLVwM0caFO7@vger.kernel.org
X-Gm-Message-State: AFuF++mATgqvfWBwVICGEPWtSXPCDjAtt3okSZKiGpFKC9Zk4JO/hFU2
	tTS6Q6muPLvjiCIvwwy7OWEe305OaE5RUDaqQp0sGa2ycegsnjvRL6KV6X1tYgUiFk31PSGCZlJ
	FeNQsaC7SLRdv51Crul1Y/ITn8wLbdBCNCzi9E7gl
X-Gm-Gg: AR+sD12NaTTfkcNspP9GvUCYf2Pf4NFVGjadQOta+s33ofzxEYNf6KB1jg3bM7qRB7O
	pVvu0K1x2XbC2mFZNwcaIWzZjFIiGB3gRItjX1dGh38ayG4Q2qezq94Bzq0UyPSlR57aAB/jh4J
	TMoChB5RectyNHyqqp2feO2hPx3VLHAu78FYdPq0hct/OBBdBEq991GCBHr5v+IwPHnag8/IQdL
	LSBTzEn2Dfdx64ZK+z0Gvdq/gmkNWj4HkfgIqTG8O/2BHcRyHmuGFKuUlutGVY3ua+yWTkv6Fyt
	Po/LOQ9Hg+qA+7VokS0+tZjqthsq8V3olXhmuiktEh4ejnuSY3XbmvaRzNFTfD3obUk9kwD18oQ
	AdGAuYz9yrRBh11rLBYz6tAdFdXJv0f/WDmk=
X-Received: by 2002:a17:907:c06:b0:c19:5572:d234 with SMTP id
 a640c23a62f3a-c2556c250fdmr1045810766b.1.1788034634928; Sat, 29 Aug 2026
 13:17:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829-ipq4019-dwc3-migration-v1-0-cc66b54ce21c@divinehawk.com>
 <20260829-ipq4019-dwc3-migration-v1-1-cc66b54ce21c@divinehawk.com> <20260829194119.815D31F000E9@smtp.kernel.org>
In-Reply-To: <20260829194119.815D31F000E9@smtp.kernel.org>
From: Matt Eaton <linux@divinehawk.com>
Date: Sat, 29 Aug 2026 22:17:03 +0200
X-Gm-Features: AcwNN1Xj8NKGsRmzdt0hKXWDVNEsssaRHa4Edn_9AFU7qkNXFXgwIkcbj9GNJIo
Message-ID: <CABUBpLc=ebrTh65revLHEtND3KGFtMYsLXJEw+w8FUO9zG0tmg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: usb: qcom,snps-dwc3: relax interrupt
 requirements for ipq4019
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 29, 2026 at 9:41=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Relaxing the global minimum constraints for 'interrupts' and '=
interrupt-names' unintentionally leaves multiple SoCs underconstrained, all=
owing invalid DT configurations to pass validation.
> --
>
> commit 245becf7a38f613732404251842cf1f13abb06d5
> Author: Matt Eaton <linux@divinehawk.com>
> dt-bindings: usb: qcom,snps-dwc3: relax interrupt requirements for ipq401=
9
>
> This commit lowers the global minimum interrupt count for qcom,snps-dwc3 =
to 1
> to accommodate qcom,ipq4019-dwc3, adding a dedicated if-then block for it=
.
> It also notes that several other SoCs relied on the top-level minimum and
> are subsequently left unconstrained at the low end.
>
> > diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml =
b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > index 7d784a648b7d9..28e78302b814d 100644
> > --- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > @@ -137,11 +137,11 @@ properties:
> >                                 only on SoCs with non-QUSB2 targets wit=
h
> >                                 exception of SDM670/SDM845/SM6350.
> >          - ss_phy_irq: Used for remote wakeup in Super Speed mode of op=
eration.
> > -    minItems: 3
> > +    minItems: 1
> >      maxItems: 19
> >
> >    interrupt-names:
> > -    minItems: 3
> > +    minItems: 1
>
> [Severity: Medium]
> Does lowering the global minimum here unintentionally break validation fo=
r
> SoCs that relied on the global minimum? For example, device trees definin=
g
> qcom,ipq5018-dwc3 or qcom,ipq5332-dwc3 with an incomplete interrupt
> specification (like 1 interrupt instead of the required 3 or 4) will no
> longer report an error during dtbs_check.
>
> [ ... ]
>
> > @@ -508,6 +508,25 @@ allOf:
> >            contains:
> >              enum:
> >                - qcom,ipq4019-dwc3
> > +    then:
> > +      properties:
> > +        interrupts:
> > +          minItems: 1
> > +          maxItems: 6
> > +        interrupt-names:
> > +          minItems: 1
> > +          items:
> > +            - const: dwc_usb3
> > +            - const: pwr_event
> > +            - const: hs_phy_irq
> > +            - const: dp_hs_phy_irq
> > +            - const: dm_hs_phy_irq
> > +            - const: ss_phy_irq
>
> [Severity: Medium]
> The commit message explicitly notes that qcom,ipq9574-dwc3,
> qcom,qcm2290-dwc3, qcom,sar2130p-dwc3 and qcom,sm6375-dwc3 are left
> unconstrained at the low end by this change. Should new if-then
> conditional blocks be added here for these SoCs to properly enforce their
> original interrupt minimum counts? Without them, invalid configurations f=
or
> these variants will silently pass validation.
>
I have a fix prepped for v2. Standing by for any other feedback.

Much appreciated,
Matt Eaton
