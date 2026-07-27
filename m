Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A22337FF7A
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785140743; cv=pass; b=A7Syv4fHMyjFDokyDpVpzIYh0iZI/at+GoRcCOzJX9jW9Lh+b+1lCEUrqs2530ej6OWHxd1KN1ADzyrimYad0+7KZ+Yzml02YP9g9N5F/h2r8hwfNB+PW0Pvt/QZ5PsqgBJnpvWniHVOPnLQDUGrZpBMGWWgxJdzcJV96YVQasA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785140743; c=relaxed/simple;
	bh=/szjitr1JF6qSuEGCBNiddM0d5D1/45sj0Iytm86R1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KKVdeP4b07ADYHS6WK+nG5XNKjvkBgiux4MTGqDEC6Jiqy1Nhv/n/g9ndZsOIVsDUNojipb33eR4dIouhZCYf+bKdGdiE876yymYwGoluh4vKlqLzAsWm7ejGbLamNeZcP/gM43VYLAW430GkyHbobvhyVivLUyise1+VO8CDMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jg7+i7/h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cgaS3dWz; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jg7+i7/h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cgaS3dWz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R7RvsJ3231773
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:25:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZKisjWJ4QSIf+LiuWonJcccvvNDHmGQTB1J1wU0www0=; b=jg7+i7/h0/1+dgac
	c/IH+KszMopK6T6ODzBRdn24ovwm/K4QF1gEljMdO6hM4KYTPMnXHyfeTqLFDjKl
	QWVluy8uIU7EAw4+P4X19lWCCs7CsnLWR0avItF165eaNdCgNEsr/YyQTcyfcu4i
	i5nx8h+/oDLiuHJLgUS3fmOFwDOnlYEX+eGAQrDWcltU/G7pAZcuyuz5TlL4D0cn
	4pIGXAwRjWuU90hS1eRHxo0xOLO1uxLyQknnFZPTBhVldV5nS+fEIpVMvwQ6P3gj
	9EHDQ1JGetmKXecvGJ3PlRfshCWxQoXnNg1UoBT4xDaJOPPQ+0v/Lz9f1xRXx/8J
	x4x3vw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmm575eeg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:25:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ac0a54110so327359285a.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 01:25:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785140683; cv=none;
        d=google.com; s=arc-20260327;
        b=IFvDLb7DPSyKNVORqWsXYrvTb7T7M63bzP6qOph+Rvt94OUI7b3iFvMBj0IgKd/9bZ
         mpqqdDoD9XCKrEVuYdkLfsSRpwy80WbgRnNjSzp2Qpz0sLsIni61AlzZGdFtIng0rRPF
         FoAjjkb6gX5qyAuZShl4vvcvJ5rjx/ZoAqY3mVF0i1Y+NrZwBVSBwfqy6JwlHdKFEAqo
         rm2eRVwuFxKZtHv21T0PchQ+8rtHmXG3Sxm7SpUWqPFevti7lqMGtWNzVjYDu9EBmSN1
         HF01bzRI0YVkZKkv0ZWt0Cm41K47bu3lOvbsxUlBLaAB4SECIhq5CVvp+SxRRNjUrh5I
         yxJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZKisjWJ4QSIf+LiuWonJcccvvNDHmGQTB1J1wU0www0=;
        fh=2B6lCg4We4gwmBG2k2SMU5FmDhPJ2JbQHdGPGcG+/NA=;
        b=j7YGOwPMJsbF/8zEZEmsKBpH0/pcyxDlCGEtT10sfyy6hM7NBzfFlzlzpb2IX2Ya1Z
         FiJHVdSOMpOJyGrdJmdSna+dx5zOw1LXih2r4nlJvVZRnwOqyGDB2f0jji1It2hwWGm9
         mF1kmsb7QOFN8yT6SrD6vBZR8AEn/mERu6Djq+J79I/76SRCn1uQn1+3aQe1BBFdz1Cj
         r0LO1Y1DOHWuwVY2DdzzKHoVtm4bohUTrfBFiWbB8z5UxG/skyPco77JvEqwWIfA1H6B
         97HmFqkCyOMpKQ+/UW5XZjFfFQatVLEV+4t1WL8OLZNvBADzNIFhkhFvz/JcmOnRBqzy
         Plsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785140683; x=1785745483; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZKisjWJ4QSIf+LiuWonJcccvvNDHmGQTB1J1wU0www0=;
        b=cgaS3dWzVHyD/gFSNLKEmyJLDmMG8DnyhC6Ttwpw+MIffZM01B012/MxwHdqx+J0M5
         tnFPD157f/a18sKsSmtJJHR2tJn08DYALz1ixSCtOJnzQNEPthaOZcx+W8SxVE7EQH2X
         wAEf14IqNdI3Q8xX/VIxOtYyMsW/whvOtbA6j8VxyIQgJ8V+ZKY3g5Y+jkToOt/vax1S
         mBQyU6GOsw5u7tL9ORH9wC9ULj5Zi8nEwN8KQfEQ6TWJ/hvp1obUIUZEH+3Zn4NzFaUr
         /z5G6CRtMYwRsZ5rps5LuOcGS72ZAkLfaypQWY1z5ymI6JLDfOQsZaTytAB4/9PSXY3m
         0UoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785140683; x=1785745483;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZKisjWJ4QSIf+LiuWonJcccvvNDHmGQTB1J1wU0www0=;
        b=YiT0R8YS3SeMQlPRYsscDQvHPUJQqcrWtopG6wJRmhF0MHbZ3NHx8xn5UBZh/zqv1w
         1cpwCUugPcldVFcr/JpG64YnxEKDT3VJiiFAZDNz/Kfe7j5Ld87a1KlQHILGR03JRKvZ
         wEFQXsX0vNhd/Umbh8XyNT2zO1fQ1EaCyY3I0vzDu9vbKx6qpyYtyd3d6UO6J4T5YN+4
         MCeE7tDS5bQNwELpvzF9tIWH/qCUrWzFSocK3eKltixPPgJLQyQP8j6QvF7PY4nK0Boz
         kb23YDCsa32RQ3HcQ07KUdS5T68OaojGW1uO7Ci6QCK8F49Mp4tpEpvAAYvhYFHwuW/m
         NVqw==
X-Forwarded-Encrypted: i=1; AHgh+RqWY75ksOQZYUkzqXixYQVssjrnme1v9yq2nMEzQT3PfbDTahCeJwA8Q7WChuW1p36OKENUdPAXbKDj@vger.kernel.org
X-Gm-Message-State: AOJu0YzOh036+JTgb7PmDGyvE/N8AOE4PyiE+oh5dW8vBPoUcmjbYM22
	KL/+XP/P/zErJ825Q1acvEbuagVSwXNbDVsMwq7Nvg25gFGCBfKVUQFyZmrQYTVdL6XRCAswUyx
	LPzCH8m8y7lCtokc7Qgv6eqFF/MnT2xy8FqSGC1+hNA7UoksHylKF2wnul8jLzShcelL5D6zZO6
	aNaVXxdy5wWKFVKVpHJN35ouNIYFrCfs6Q99eLr3A=
X-Gm-Gg: AR+sD10zcTQl4LK7aVLhFSDw2T+tO1kbXpka6ILkj9feH8/7rHb0NZ+4Ikf+2JHvcdD
	1DrE2Tmy2KkSmdC7Hi+DmcOqyOJci1xHNs6DVaa0TYV3Lh+tiL3jwlsRNwxDnoLtqHw0ah9rX5e
	AWae3PjIAAOvpDF7tcPrfYg9f2q2Ahop+gFpV1RlpnZVpS67se8QJlSFeqliHpgcihpjRSBDJIO
	UBTcENuDXBZgzAqusSzhyWRyrIdAG1YAwVTEnuB6+wj/17CNises1hXSalY8CCFNA2V3lGIH54=
X-Received: by 2002:a05:620a:8081:b0:92e:d01b:de5e with SMTP id af79cd13be357-932df726607mr772541385a.51.1785140683535;
        Mon, 27 Jul 2026 01:24:43 -0700 (PDT)
X-Received: by 2002:a05:620a:8081:b0:92e:d01b:de5e with SMTP id
 af79cd13be357-932df726607mr772538785a.51.1785140683104; Mon, 27 Jul 2026
 01:24:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724-monza-leds-v7-0-0125a3bfea98@oss.qualcomm.com>
 <20260724-monza-leds-v7-2-0125a3bfea98@oss.qualcomm.com> <20260727-mellow-iguana-of-drizzle-ebcced@quoll>
In-Reply-To: <20260727-mellow-iguana-of-drizzle-ebcced@quoll>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 10:24:32 +0200
X-Gm-Features: AUfX_myV0_Wl_14C6MR4VP26q2WPb3N04NR3JSuL1c_UODALCQ3qxRW1JtxJA8Q
Message-ID: <CAFEp6-1Rciv1qqsYeHLnxKPKXos+hP3FUkgRjXzrTzHDA5cMDg@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] dt-bindings: leds: nxp,pca963x: add multicolor LED support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA4MiBTYWx0ZWRfX/LNHKHfja/hm
 gu4iJSI/LHXr+pNWhk30JTci4m9Cl1VmisHAUIsNTXgnFOGEe+4No4dG6/nE1jsS+Rfki0V/0AC
 dmFr1qcuqq4jH/UGAyzjnIoxt4JDyXc=
X-Proofpoint-GUID: v0BXgb6959QE462EBGC3b3UOKrqbVpS1
X-Authority-Analysis: v=2.4 cv=FOErAeos c=1 sm=1 tr=0 ts=6a671603 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=1AaZgIuxyIDxt6-OCucA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: v0BXgb6959QE462EBGC3b3UOKrqbVpS1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA4MiBTYWx0ZWRfX2pCF4Izu/Te/
 y+Qk5SmRT0WXvJa4WgzicPk/aC7t9PQBnu5hHdKUAG0ZtQcc42rrlUuQr9IK9th5b9/0Igjqc2M
 Tot6YEXqclR1rDwtp5ueTjlEuGsybZ69DT8ePTCI3f//PjLcPwRI7nBhg/cBn+O03zmykkEXtPc
 tNeWrw4Q5NJXIaMTzMARG/olWVAMb25iBIrG+rBcT3FJ0ncy+cWCF5yYqCW4E8dFgHJkd8VNgym
 ay7pcBx9Aov+dS5Yvptcc3gP46VOgNO88fV5eGFOs0rIpUHd6Sl80SP91+FAkKcAFR4T894UFb9
 cfRBa7Y45+U0+V5Q0lM9eduufbTj14ZCvuaG9eMDbnLOpQW2eyMZ6u1cXdiHgJBQ6Tc278IkUtI
 0Wfaz7qEsAXUKrv5YY3/P0YIsKcdXy5pzfLgD3ClbU5GqkF1jvzd8c5w8JBLpngeQrJYApFbXZM
 5xoCYyrMtjvWoa1J0KQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270082

Hi Krzysztof,

On Mon, Jul 27, 2026 at 8:22=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, Jul 24, 2026 at 09:48:16AM +0200, Loic Poulain wrote:
> >      then:
> >        patternProperties:
> > -        "^led@[0-9a-f]+$":
> > +        "^.*led@[0-9a-f]$":
> >            properties:
> >              reg:
> >                maximum: 3
> > +        "^multi-led@[0-9a-f]$":
> > +          patternProperties:
> > +            "^led@[0-9a-f]$":
> > +              properties:
> > +                reg:
> > +                  maximum: 3
> >    - if:
> >        properties:
> >          compatible:
> > @@ -96,10 +136,16 @@ allOf:
> >                - nxp,pca9634
> >      then:
> >        patternProperties:
> > -        "^led@[0-9a-f]+$":
> > +        "^.*led@[0-9a-f]$":
>
> Why changing this? multi-led is below, so maybe you wanted to combine
> both?

Yes, I wanted to combine them so that both multi-led@ and led@ nodes
have their reg property checked by this filter, while the multi-led@
filter below only checks the reg property of its led@ subnodes, though
it may not very clear and also too permissive?
>
> >            properties:
> >              reg:
> >                maximum: 7
> > +        "^multi-led@[0-9a-f]$":
> > +          patternProperties:
> > +            "^led@[0-9a-f]$":
> > +              properties:
> > +                reg:
> > +                  maximum: 7
> >
> >  additionalProperties: false
> >
> > @@ -143,4 +189,50 @@ examples:
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
>
> Messed indentation.

ack.

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
