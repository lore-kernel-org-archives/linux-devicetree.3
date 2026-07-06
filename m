Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E878B3976B2
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 15:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352541; cv=pass; b=hh+Wk+fs3ZYRaS/NMZJ5VJrExZGE0hK9KVTQlnLKz6KawlWV6DZqoKIZKq7439gEF32IUQHfoMaeqm4VROvoUKJid7udSkoIqZehlrLiGwzoCU2Xir73Fr4VNYq4JVbiwQsX8pDxremm8cx3q7YbcFmDCrDs9xrppP5nBzKauxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352541; c=relaxed/simple;
	bh=vxiTjmdRKEJcgCHcsh+xRM1T9V6SfswY5UBXy+kog54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fd7H3LclEP8u9DuyqOsNHsBltVJDLU8LmqoNsHI/ZKv9cXvxOgoyjWQsdB4Z2sNZ44zfDgkWVi0QKOpDhfj0QKVrFT/ATyIiWRLqd+qoy6lvCwntoiq2AQnF3JkkpRkZvRh/dTwYWynOpw00skTMlaDv4st00ajnB5eR7Bu16i8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k/gnqbuk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TEP2SqSx; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k/gnqbuk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TEP2SqSx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF7v3900700
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 15:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BZcHcObQnS5nVi7Y9h8+MwQRY8YJ4tL70k4yQERzNDs=; b=k/gnqbuk0Trr8pfa
	jkXx0HGDlJo1mkiT4zQYwQyH6hINsliO5RL5vxgjAvw9DgHGfNlnP3ndAK7CLHwG
	d+3cGDzsBka7pDwGWw8nerKqVeDmZjVQxRNID1hQsIkgMSiueW65iTFDq+RfBn9V
	hno83aRMV/skzuMr0hWtXdBX4t4t6aBagG8jokO7wQWBS4uM4HOUY6rZUMLE1D1s
	XzvuvwyT7Gim5nbfANBUwvhK4dUF2b2WPdk875p6k3yHGotHka1FQSp6a7xULIkH
	d2M5BCcOPhkFL5EP1tC3NOR9FMmAAji6UjS2BYMGKDgLnoZKOc+AC2Zq/op/HYhb
	qD1lOw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7j6re-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 15:42:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e66f9e2baso316406285a.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:42:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783352538; cv=none;
        d=google.com; s=arc-20260327;
        b=bZozJD1YKCQ6P4oeX6trevk2Rg/cl4okIjIhQndT+f73LQgMzZqqBaHPCA5c7F/pKp
         +QcZNpR4vUlKVnGbE683EYiCWF2cRixd8eaydpNuKB+zOBsHcL7bkUZctU9NRwTkaw0k
         VW2X6qCfgcvDRsmwyFyxMIERltuRAeZ5flY+UL0aBh/VFbPpjdqcv/nu0kmEzqMOfjk+
         Nt3yJp1wTjSFYQsj10a7DERnToX1pjKAeebZysTrWvHfVy04xsRTOyrchJ2mg6dCn66n
         UYxheLZxsl+Ro06iAkYl/Ga1WHAudAUbtY/3GVAu1w9vSfIS+7s3veXTKLmRIetL91nH
         0yeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BZcHcObQnS5nVi7Y9h8+MwQRY8YJ4tL70k4yQERzNDs=;
        fh=EdedKbXL4YwfwsoZKtsAsNBcOd3KzNfP5M7OMe0tyEc=;
        b=R1AXwlauZr+NOWuuN+T5nLvxjDItBWXfVSw+SU7H1RwZvgIX+GNeKcrOExqu0d+clm
         70xPBN0HJjzjQXIHy2YaDkQHZGkMXvInImzD1UkJGABb7DpRspMrQVri7wrn0tGIlF0y
         qRX9g+wB4g2kEYT8FS7Nwnr5HYgxHvxIE5KEEtq0DH8rOQk71oN5/5oeO81MF24GheO+
         AJAb6AmlSBZWrU8X1fkDJdjuFu6eAiWRjCrqAQj731AXxniv9VG/Eo8rbVfFxcOuy1eD
         KfExeQulJ2iNxdQKbMphR6ZqQJtrsl8FvhJJms8puWjNgEzny2/LtAmnv4k1iB8Zo1/3
         02bw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783352538; x=1783957338; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BZcHcObQnS5nVi7Y9h8+MwQRY8YJ4tL70k4yQERzNDs=;
        b=TEP2SqSx0Fe6LY/ABPe77gTpTcux+D0IJE3u2uy9EXBhoW1fQjIG9igFLqEzWDUoc2
         T01Ak5upLnG29b9N/JQkS3dL+JgBgLL9brYEhSDgpzW8zW86toGBOuoEZBrxXpsbUM72
         WC7O0UYD0qdkYQON11hcvrwu4C5Uc25qMk5OEHWD1NCeafnbfjrsYl9BTJ39xH6o4oCx
         7Mnrqr7kNwKVlYVWyJEyqujRct+Qghwn0bycMuHXhsgr7azOSCUlpPP7uvsiCheMnLYx
         vt6g2devQ1lepeiMpS2o9k/BMnKkYbflg1sDtVWoZPy9aDMoT+OF8AQPK/8WZ8ZGditm
         CBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352538; x=1783957338;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BZcHcObQnS5nVi7Y9h8+MwQRY8YJ4tL70k4yQERzNDs=;
        b=SfsJJgHFzc+xXKfucTk5aN9gU03/y5+dQeYuX8GBoEGE8/jxRtBBtsDHoASTQvurBt
         Ui9JduqmKWvj+Hf9y0HdGBySYTcSKAU2zCWaGoMJbcXNmlDXQh23Q6tlDj2Tk2ENkvGM
         UKkK0AEwGacYtQKD5USOWQDmVioQHsGWq0uhg2z4mFlRdeNHMvMUNaNNHmqtmjHRVgLM
         cnki3cyIJtckPtDfl4WM7Mp+oHb5THPIVra5axIV9qmpZh0RjMuvIZiGw4hZf44iAl03
         3aho4yT5Enjfs+vQUNrKObUeUMbbNQ96lIM7PzxLkjyZ9D51JqO6QU3XjyKTfKwYOYUa
         Az+w==
X-Forwarded-Encrypted: i=1; AHgh+RpxqAzTNoKAGZzYjG0xa+bjES9uDrgZybB71ka1stY2cyqObv+ZTrHaf0TJ4CVBN4ESLDbiTvthjimo@vger.kernel.org
X-Gm-Message-State: AOJu0YxqPbAluC+/FMTlC4Uw59WNI2SuIjjAaXgy9cfOg7OZcQiQ8skC
	82uDHtVJ20FcApjQWS/BZMgcgHeZ6p33SMCKqxSiQIMyVJPHhB8HbzVTekMoys+DE7+Rjutbzez
	a9v6L9aE4fj24Tre5L4SjRvXqFprc+HtdJkgE0r/S0K3a+5PxQ9WBKaYgHdrsTRSxuS+3myCM0P
	YEvuTcE6lZE4wA7zi8m1WrnzOAn/soZFSqPSiVgB8=
X-Gm-Gg: AfdE7clepp6C3Xh/3MYhIeuNSZfvudPcqEIUVPBUTxDMD7rgKQocVHgJ/tFgBtSLy11
	dTigju2yuC2EokC24ICK7PxqwMr2t7M4l1Cugbc1OcY99NL+K8SbxdsPNhz8lYDY6Y70gUIHSKk
	ceVmkLS427iqPd6TB4jZVjYoh+GskiXTz5oZS9Y+wt2C0TNJIvFS4SUyywfF/mzZ86lLbys/ReS
	ajniz6TLlbIC/wUTapGWeQB8+Z5aFHEpCVuaovvyicBV+hCtK9s3IrTvpc7Nk3on2OkpQwkFyYC
	UNw5/r4dXxk=
X-Received: by 2002:a05:620a:2713:b0:92b:814c:fb2d with SMTP id af79cd13be357-92ebb589766mr161261885a.60.1783352538085;
        Mon, 06 Jul 2026 08:42:18 -0700 (PDT)
X-Received: by 2002:a05:620a:2713:b0:92b:814c:fb2d with SMTP id
 af79cd13be357-92ebb589766mr161255685a.60.1783352537646; Mon, 06 Jul 2026
 08:42:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701-monza-leds-v2-0-c1be0b472926@oss.qualcomm.com>
 <20260701-monza-leds-v2-1-c1be0b472926@oss.qualcomm.com> <20260701-pulmonary-passably-c9272ba25533@spud>
In-Reply-To: <20260701-pulmonary-passably-c9272ba25533@spud>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 17:42:06 +0200
X-Gm-Features: AVVi8CeUJ6pVzmV1-XSIDcim_YRtoWjsN5T2iK6exKESLTqle6PByMrsNMzBRkg
Message-ID: <CAFEp6-15kG6PhZ=C=7j1dwCGnaoYX4k3pm90Q+LGWDG8VaHuRA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: leds: nxp,pca963x: add multicolor LED support
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE1OSBTYWx0ZWRfX9B96lEldazoZ
 ogaIlRY3nWyQH62yojN6U0UJAJx36FlnV2/9yySKnN7Z6hIT3qhg7pNeemyPAuyuFbQhpHm+iox
 bumj2ojmIN0+d962tatMNs+K9+8wN9ZrwyDtN30q5iVRbTL4YOcNUF8pzXt6CI9PH+rMK2XkUl2
 pwkb+PTIlRPaFyLhxV3qwA/Bj3fxP/JKYOvFdEc3BDybaUJoB3z2JGVmzm5SKYmTpIqQhMZPzOw
 CbPceuN+zn+wVvGM4WHOre4Oki+RbQ3koL30WRuRkR0RJZU8yAwdzE6YeCtMBREbdQ+SXRWdwsn
 u2dCvXqrot4hs8wvJlKJsxECGxCUbTiiBKMrjhif1JsjoXVXqJnn2fhp5DatotZMTQUwfDYs0GB
 yP7vAlJO/bMQAuTUBdUNlkIK2xg1pbHqi+dc8NsuAY49scGJ8CamACUY2YVF5pDvrucbOilGoxX
 pm1Hvs6VynQ/ogka2BQ==
X-Proofpoint-ORIG-GUID: eyIl8slVpuhFweXwoKnQr0P_sxvJhdYk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE1OSBTYWx0ZWRfXxNEQh2gA2qsv
 TQg7Z7pzXRujdOmonUeoNuFWeBksLmUQ8d7AqrRVWHlZOkFBLyh59KHOXDw27L57ZF6ufI+97BB
 lOw+Nr19/W8yBKvKo99bROQSmpYwJs8=
X-Proofpoint-GUID: eyIl8slVpuhFweXwoKnQr0P_sxvJhdYk
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4bccda cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=nomciOSXjZiP-vvF2YUA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060159

Hi Conor,

On Wed, Jul 1, 2026 at 6:58=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Wed, Jul 01, 2026 at 06:15:51PM +0200, Loic Poulain wrote:
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
> >  .../devicetree/bindings/leds/nxp,pca963x.yaml      | 79 ++++++++++++++=
++++++++
> >  1 file changed, 79 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/=
Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
> > index 938d0e48fe51bce82779c4457c8e99cb6d80fe70..04b05b8195c18ae9fc1c1cb=
9d3c694d819ea88e5 100644
> > --- a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
> > +++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
> > @@ -74,6 +74,39 @@ patternProperties:
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
> Some valid looking stuff from Sashiko here.
Yes, I'll address them in the upcoming v3.

> On this, was this meant to be minItems?

We really want to bound the register values.

Regards,
Loic

>
> pw-bot: changes-requested
>
> Thanks,
> Conor.
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
> > +
> > +    required:
> > +      - reg
> > +      - "#address-cells"
> > +      - "#size-cells"
> > +
> >  allOf:
> >    - if:
> >        properties:
> > @@ -137,4 +170,50 @@ examples:
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
