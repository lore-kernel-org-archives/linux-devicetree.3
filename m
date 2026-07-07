Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8C3395AF4
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 09:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783415039; cv=pass; b=oNMYc0ujLGDDVbKs1wHi8aKYQ0QKy+H6YX8NtpoJvwSh6yPfHa8/JV8BZDU++gmGgBd4hQIY8XozLnyKkC90AZh+rb+7kxkakygmgVHjWWcA/GTTU8z0Jg+YTQxJqpm+xzNulSuFaZePc62PHJhC0iBb5u9VuxJK0JWu3qBXB/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783415039; c=relaxed/simple;
	bh=9FyuG7sjeOAPrtrynAcI68EoLlubdtH6jczOrlWt8tA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RdXFhLVIw5Q/W/tq5qi9FyaQtkHVgBMOZBuzaDnS81L2aMsqSSkjHhxniQM9KLKGSfeic1iaKC+uYeBkasKBfu2bSfSQqF4riAgbsIQCkr7hsnx53tPAgX2Hc48cX5QYbiyQqTJfAMaU6zwgY49er7M48NVZ+MSO/FxEktRbTPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MJ6o+9l5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bPRnRY1k; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MJ6o+9l5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bPRnRY1k"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678ECi03070833
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 09:03:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IqtFzbu6ZptvNsw4DrQ0i4D9nyNMJgIO7R81K7kWg0s=; b=MJ6o+9l5JSCHixRe
	miMfPg+aVqKNc9GlbjcD4xXHv3ZRgkgTLfdsA4vEByifaRYUT2k3QgEGMZAzSiyA
	tZUX681/15/nndq+6wRcX+Eke8NHI+k3Oucz0muf4twtRBzWK8sjBDWf/qEGa/By
	5cao6zRXtccuh0kseYLkcp560jGYoEizvxlDfzMaPxZEHuRUDutpQKKEhCqQrMaO
	eMyFmZRIcFEFEpSf4DGOo8FBgYQmz38eB97VeaC9bpy9CdZwz4JfpLqhdE3oycqv
	5pe1jy/+SxmfPyjwgN1MzpEd0yaMiRhI7s46mS6FHga5vOIP+eTtoY2LboFVBKD6
	Dm8puw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8sm8h666-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 09:03:56 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8e97889ac8aso51370616d6.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 02:03:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783415036; cv=none;
        d=google.com; s=arc-20260327;
        b=AAygIIcgUXBnTMHaRYJqRm2la0JSFRyAJyMfbTL3Qf1JTEp3ZhAB0DkNiZgLvHXYl4
         LI8De+GDlcNKRe99iT+Mu7Zv1x8Uxo8875GRpHL3p1nC9yWqh4P+1mwBtlFJC8mSIPKO
         NH1TcfligyAH2zyjJqVZ+2xOOlgdiftSGL5C+pyLfHougfIffFZKkXUy9gYXqieCWHq/
         OLf2dfsVDmb9rB0oEKb3L6Qb5SPJstWwSVvCGzvgzgEqp9GmCkAYM2DCFLvr9S5TnLV2
         rg7BHSuECwOTwXeHpZIxDI88rxu2o6QiTHhx090jElqEMgPOQFQogz+Wnk3IxrY+bSnk
         GknQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IqtFzbu6ZptvNsw4DrQ0i4D9nyNMJgIO7R81K7kWg0s=;
        fh=6yys7+VmM5eB9bs5FVOgTKVWpHvnUEwV+sm7TsYtN6A=;
        b=f8bVnp/I6vnuXg4NDaZDmEFRXupOOZtHlwRCoRmDdfY7fobg4cXyZKvy2SNQ9ZcBLh
         hZ/kuIpv7y34W7E4vi0hTEObw7pgf+rCqowcwdmT5GyibMKu6HZvijE86JR/sE8oAvdU
         LDX/IFUO8LKNDF91v2cWUfgpcjVc/Lm53VaaXnEwihKoOBPVWUz37u3CvaSokmlVVWci
         GUUjlEPCM7bUheFMNNjZb9LhPPQN//2dhEU/EC9KaQZPL6KWFgJDYiJnFKWWx7mmRpaW
         eJY+fBTgoue6lBrALedFlLdU9QfXHkIfuXBeHZEw5sO5MbPlS8C29acRSOLvD9SY42KO
         Flqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783415036; x=1784019836; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqtFzbu6ZptvNsw4DrQ0i4D9nyNMJgIO7R81K7kWg0s=;
        b=bPRnRY1k/LVDA9DnleZLdmJwU4DSXd5zSE20NJ6tnlE+t+FAMSzi9LwatkzSbspweA
         pGHkrolE4bMakVxmQfQregWtQ1nC9CLs5EOfhHu755GXQco/cipQ3ydaPNrMZzb4WPXv
         qeoQaFKbAzRi0kcN+msQ+pujhZtOEX2AwrOhfQR+jG0+ShmzLGtPHc3M0RA4bbwJelv0
         ag+u948kBM7wUa1ovjdoKftfQ8qQh5KpJ3s4UBnKztKbpkvyOTHqjjAb+vs5sfyUGsEE
         MB5HOe9KSxjqbBEqKr3Dg4D6OPZRhUzdWWkuBoxIkUbLlxtF3k6yRsjoGtSESZtOAHbU
         NzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783415036; x=1784019836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IqtFzbu6ZptvNsw4DrQ0i4D9nyNMJgIO7R81K7kWg0s=;
        b=Id5Pcv8KNI+/L2+EKC8tV/eELKpKxIrO4BDG8EtSan4wUyL+vv+ODlJX91vGuPDCn2
         pBYyT/8izkaCwuGm2/4G7ixUKt229FuRKeOjJbodx3voPdZhNKn3aAhUhwr3RCH0BeuZ
         YCvDu2xIbNSErY9q/cSf/YvaVIDVCT8IrOquCqh6kyFw9x4GfK+R9wQNVR4iAYhy/kLP
         lgyxi9ZC7rNY0JrX43NI6YTdu7RtqwAq3CKcv3y//x/+6rXu3CNt0OSyOG3u4LYC24k8
         HtuyYtFClRzNHujDQ65dJSwEkDvsPOAzF5dGk4gHe2EgNPzLZyqtiUXmzICJjdqNneFs
         s2yw==
X-Forwarded-Encrypted: i=1; AHgh+RpAZaq28AVR91H0VAGzPswp7t0rNhD5AziL6XjhO3U7mdTcNNC81f+Cd6Bgud9ARTbjLgaq3YYqjDJv@vger.kernel.org
X-Gm-Message-State: AOJu0YyB/rJgZggw15tofqXPFU1tNlt9FsDLP2/RGpT4l7Mv9CfhuLU1
	u1k7ZsQRvaan1+yjt7+bbyR7EMyxYZ3l5Vf9274h8awJVvQ8N8JNK0uZx0tsyyzqgVpLLbuojVJ
	dcaROEvDm4C8r8ITEhlQujWcZ0Li0VH+T69qLMbwcc2uNJck0tRRcdh9R10VEPFDXFva+wJL7nW
	IJbCt+7+IXRXo6pX8MFm5H8Ep+0xx1RA8GbPiKTE0=
X-Gm-Gg: AfdE7cnIM1c4tpAmOTYUF9YPN3YYMr9ivRT+m35bZ93wuPf6qtebHJpBBwI9/F9Kr4W
	d3RHwxVumP7n5updk0ih/WH6dd/XHwmu7ms5FB9QaXupqPI9sSA9i8V4MEUTyYXB/G2qurBlwEC
	v2MY5mfDq726XskD9P3pPl3FZR2WFuca4ANyj46nAk15Xxo/QM8ukl5reL4LLM9tM1hAdSYi8K/
	OYjItT/Xvolft5XXULV6YhRtwWEE309pHuIMuJ0AjqK7HYooReIdS6IQ+XXXKUQOKMGPod4n746
	VcJqG51Y6TQ=
X-Received: by 2002:a05:6214:3d9e:b0:8ef:9dfb:1f56 with SMTP id 6a1803df08f44-8fcb51e6c22mr45473616d6.52.1783415035616;
        Tue, 07 Jul 2026 02:03:55 -0700 (PDT)
X-Received: by 2002:a05:6214:3d9e:b0:8ef:9dfb:1f56 with SMTP id
 6a1803df08f44-8fcb51e6c22mr45473286d6.52.1783415035058; Tue, 07 Jul 2026
 02:03:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706-monza-leds-v3-0-37ea8c988363@oss.qualcomm.com>
 <20260706-monza-leds-v3-2-37ea8c988363@oss.qualcomm.com> <20260706-account-harsh-093c6354bca5@spud>
In-Reply-To: <20260706-account-harsh-093c6354bca5@spud>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 11:03:44 +0200
X-Gm-Features: AVVi8CfJSRaPJwhTLYj1cS0kmlijGTDjxXc5W_8Ag6eQlnRy7D4lfAYGFXRDmio
Message-ID: <CAFEp6-2k1O80iY9f8WeoHHRZPMdKGcOTYuEsDvpZmZZXTz3xbw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: leds: nxp,pca963x: add multicolor LED support
To: Conor Dooley <conor@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4NyBTYWx0ZWRfX3dELuGls4p83
 Qfo2Kfa95Ssa5AwgJuX+RlOvW6FbkIOxESdTBFEAr/0EemQmXzXgTJaHOWySgXKiXW6BPWczHP7
 RTfGyVsCqZiBD3l9RnnTKkbedt5INys1ti+KcNCLNpg4Psz3oJ87n4/P6EDo98VpF9p0YISYZ1E
 h8QkVhS12GinZpJSQbNl8P+neatgrclKUU39vf5QbpfyDdE/Moh3QdBxJ7dHoylWfh+lqrGe6rK
 WraOWSvNu+LZfQssYpUasrpZQSetAQXtpCg3flCxpVMOm2bbCgcDctbFWOlKGgKFKx6CSJje+Xy
 8G0ic0USkRwcpRpX8NIcpqli4zeRSS6fYPahw2AWdtEgvf84AUtRfhSdj8mkJ9dLcR3moEaOdcx
 aD14vrfBbBXi57iO+0j6pEe0LIxHMaI8bRtX91nEo7+TWFRvgRtfxrUkQ9hneXjtarwo7CupF0R
 cNBlnwCgLAnmYfFYfKg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4NyBTYWx0ZWRfX/YqopeSa5IC/
 WJhS9A3fS25ZF4ZNECzm1PI8YoSobKGLHCwwJfBfWFpipeO1Lop5OfVxYq9CZxyOrr2pkZSP03E
 TVKsw0EEmuwKsyOMXsJbgsnuFADX1+w=
X-Proofpoint-GUID: h-vhMelMDTpfpBiWcVjNymtRCfOaGG4R
X-Authority-Analysis: v=2.4 cv=UvdT8ewB c=1 sm=1 tr=0 ts=6a4cc0fc cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=WjbTyRfs7wdu-KiIkK4A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: h-vhMelMDTpfpBiWcVjNymtRCfOaGG4R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070087

Hi Conor,


On Mon, Jul 6, 2026 at 6:56=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Mon, Jul 06, 2026 at 05:49:56PM +0200, Loic Poulain wrote:
> > Add support for grouping individual PCA963x channels into a multicolor
> > LED by introducing a multi-led@N node pattern. This follows the
> > convention established by other multicolor LED drivers such as
> > kinetic,ktd202x.
> >
> > This is necessary to support and model hardware setups where multiple
> > PWM channels drive a single physical RGB LED.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/leds/nxp,pca963x.yaml      | 104 +++++++++++++=
+++++++-
> >  1 file changed, 101 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/=
Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
> > index 4034139e3f770a1035208490a9436bdc33387279..dccdb1d9421199a51cac5c7=
f3f7da503caa35622 100644
> > --- a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
> > +++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
> > @@ -74,6 +74,40 @@ patternProperties:
> >      required:
> >        - reg
> >
> > +  "^multi-led@[0-9a-f]+$":
> > +    type: object
> > +    $ref: leds-class-multicolor.yaml#
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      reg:
> > +        minimum: 0
>
> I still don't understand this, minimum zero is literally useless since
> this cannot be negative.

Good point, yes. I just reused the exact same pattern already used for
the existing led@ property (minimum: 0, with the maximum only set in
the conditional sections).

> If anything, you should be constraining the maximum value. Remember,
> outside of conditional sections the maximum permitted values should be
> defined. Conditional sections should just narrow the constraints.

Ok I will just set `maximum:15` here and address additional
constraints in the conditional section.

>
> Same below.
> pw-bot: changes-requested
>
> > +
> > +      "#address-cells":
> > +        const: 1
> > +
> > +      "#size-cells":
> > +        const: 0
> > +
> > +    patternProperties:
> > +      "^led@[0-9a-f]+$":
> > +        type: object
> > +        $ref: common.yaml#
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          reg:
> > +            minimum: 0
> > +
> > +        required:
> > +          - reg
> > +          - color
> > +
> > +    required:
> > +      - reg
> > +      - "#address-cells"
> > +      - "#size-cells"
> > +
> >  allOf:
> >    - if:
> >        properties:
> > @@ -84,10 +118,16 @@ allOf:
> >                - nxp,pca9633
> >      then:
> >        patternProperties:
> > -        "^led@[0-9a-f]+$":
> > +        "^.*led@[0-9a-f]+$":
> >            properties:
> >              reg:
> >                maximum: 3
> > +        "^multi-led@[0-9a-f]+$":
> > +          patternProperties:
> > +            "^led@[0-9a-f]+$":
> > +              properties:
> > +                reg:
> > +                  maximum: 3
> >    - if:
> >        properties:
> >          compatible:
> > @@ -96,16 +136,28 @@ allOf:
> >                - nxp,pca9634
> >      then:
> >        patternProperties:
> > -        "^led@[0-9a-f]+$":
> > +        "^.*led@[0-9a-f]+$":
> >            properties:
> >              reg:
> >                maximum: 7
> > +        "^multi-led@[0-9a-f]+$":
> > +          patternProperties:
> > +            "^led@[0-9a-f]+$":
> > +              properties:
> > +                reg:
> > +                  maximum: 7
> >      else:
> >        patternProperties:
> > -        "^led@[0-9a-f]+$":
> > +        "^.*led@[0-9a-f]+$":
> >            properties:
> >              reg:
> >                maximum: 15
> > +        "^multi-led@[0-9a-f]+$":
> > +          patternProperties:
> > +            "^led@[0-9a-f]+$":
> > +              properties:
> > +                reg:
> > +                  maximum: 15
>
> Is this 15 the maximum for all devices?

15 is the hardware max for pca9635, and serves as the default for any
future/unlisted compatible via the else branch. Per your comment
above, I'll move it into the non-conditional block so it's enforced
unconditionally instead of only through else.

> If so, why does your regex permit values greater than 15?

The unit-address regex only validates that the name is well-formed
hex, and not the numeric bound. DT convention requires the unit
address to equal the node's reg value in hex, so in practice this is
limited to 15.
This is again a copy of what the yaml already describes for other
device's constraints. However, I can tighten the regex itself instead
if you'd prefer that approach, but that would make the yaml a bit
inconsistent.

Regards,
Loic





>
> Cheers,
> Conor.
>
> >
> >  additionalProperties: false
> >
> > @@ -149,4 +201,50 @@ examples:
> >          };
> >      };
> >
> > +  - |
> > +    #include <dt-bindings/leds/common.h>
> > +
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        led-controller@62 {
> > +            compatible =3D "nxp,pca9633";
> > +            reg =3D <0x62>;
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            /* Three channels controlling one RGB LED */
> > +            multi-led@0 {
> > +                    reg =3D <0>;
> > +                    color =3D <LED_COLOR_ID_RGB>;
> > +                    function =3D LED_FUNCTION_STATUS;
> > +                    #address-cells =3D <1>;
> > +                    #size-cells =3D <0>;
> > +
> > +                    led@0 {
> > +                            reg =3D <0>;
> > +                            color =3D <LED_COLOR_ID_RED>;
> > +                    };
> > +
> > +                    led@1 {
> > +                            reg =3D <1>;
> > +                            color =3D <LED_COLOR_ID_GREEN>;
> > +                    };
> > +
> > +                    led@2 {
> > +                            reg =3D <2>;
> > +                            color =3D <LED_COLOR_ID_BLUE>;
> > +                    };
> > +            };
> > +
> > +            /* Remaining channel used as a plain white LED */
> > +            led@3 {
> > +                    reg =3D <3>;
> > +                    color =3D <LED_COLOR_ID_WHITE>;
> > +                    function =3D LED_FUNCTION_STATUS;
> > +            };
> > +        };
> > +    };
> > +
> >  ...
> >
> > --
> > 2.34.1
> >
