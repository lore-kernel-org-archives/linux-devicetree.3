Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B978839524E
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 10:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271287; cv=none; b=C+UlSA8zouFAMx0kbxpoUoOxcO+pWlcFYOSeCeE31Ud2iCVrv1ftmZGGC2vAPzfaNz4hAUcNHOw4+ff5f9sipd3XP0qs6/kqhENmd91Zc2YTquC1CduXUXKeY431LA/XtKwWQaYi8FbP4no1RrSmzYx4cf4uFC1fjR7FQxDLsA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271287; c=relaxed/simple;
	bh=vmfiAM6t9g85B4wTeavLutgdJmjQ8DwXDbuj4/5wtWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HTvt720eXQgbZRBfvTwQ3OOlof0SGyK9UsT26MIi9B1C3UxfPTYc+H/jqKbh5NM5fHz7lSZxNGfxgnhCysrAJW3y29C+jWsrXu6iH6gggpwqMxxeRLlfm7kZAEbRdPnRLpP6dlwC0cCqdJ8EZEoa3KgdpqmPgXqJE/lHFybp/UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UbvoVKIx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LywJeMGb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UbvoVKIx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LywJeMGb"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K8ucas4115180
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 10:01:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B3C1pz46TF7EHcIOJMpu/WwJ
	O4LBgll2RsOEX4nsprA=; b=UbvoVKIxzTzwbQCPxC7gsotpNPgW75B7myi+nsFT
	JaE0nCg2U4nFoRG2y4AVv+315MIpPUTUX/dUvqylKhCK0KkKXxdWtX2qpFZl6Dpm
	ynCqSjxrfD5s/Wi0M+PqhH+43EtjrTDq3MLbnr/BSXv+uOWtdSWHhFhEJEiubdf4
	pjaNfAjHImRIiTJqJ3AMlqHqlhEQmn7IHxu+RY9AHHSSE8DPhj89fjtxlRB5O2BS
	1zAnYoJCimoOlt4STa3oulrBqxIZyxjAQLULq7i2Z93ylCWqyF/lKm9udGUSbqtk
	8WGjRyh2pi5BiXn9k/NUmqj5h5BTVrZ6iw0qQVtaX3Aryg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e99w0g8m5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 10:01:24 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7dcda4880efso6689414a34.0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 03:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779271284; x=1779876084; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B3C1pz46TF7EHcIOJMpu/WwJO4LBgll2RsOEX4nsprA=;
        b=LywJeMGb0ZR3GD6rhwhSSVyreBEOSTVOGenh8hV13z9fI/GP+gEklQYHt3DiB/8u4o
         WsCj6SsDeea2B37kNk43UAhO+lMryLvKGsuMNVaIExdKpi00Dsb8PnRa5SAS+vBxwrxx
         zw4UVMxYDghHLx7G4bo1HwYA6BZvZcGD278C89dfgWXeMDO4DuHG/i1jEiNdxvK4AIAk
         Qs2uTjNKi/DS8C4UMTims22ypVvgqjlgylpgrnt3Ly6s8mW/oxjr+LmyR9p/VltK4/ld
         25m1VSOFVx0CRIuyXNziAYmv8Y5E0BqU53pIDNtUlzCnBbe9hFdUmT+g/xDYxzjSPeyX
         37OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779271284; x=1779876084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B3C1pz46TF7EHcIOJMpu/WwJO4LBgll2RsOEX4nsprA=;
        b=qkfv+yZY5wUCmFeQf/hgG/uudTN2VHreBL/Il1+gu+i007pR1on4VmQN57HGuAKAUJ
         YTaAZtfR5VYN/GilRIu186Zn5MRHLOZlNu9m1GpPiDobLRZevjRhvN68ZiyTFUSCNGPE
         ysIVRyIu/rzB/pB03V6NKXdIiVMCrUxjgt6LKR7/HfW63z+WQENrA1hdbaAvsl2JGQPA
         psx9oH8vXeI6cr1F76EcrZXo8wEw462dUagfXRpXppUGJFFD+j4GSjdciwUnDTdtJCWq
         CcFDjMUuGS3zUE3mw1d5vuYZ1O7nH3HwxMMbQFCA1J3s76d9Prihb+xz1cmxs09Un4Bi
         IOlQ==
X-Forwarded-Encrypted: i=1; AFNElJ9YlquO4DA7fi87jCw8PGryvW+Isx6oOJDhGqEv0XW2kXZ4HN1um4KFNjzv+HTsl7h7/brZH7gfGckZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwvpshwioclZeRcx9Vieiu76VX4T5pUlLMuPGiMLDBWMDk1k31l
	LHDmxB6eHFX2//u8dHWa2re74npa25c6WpBpLZtqedx5/smMCkJ6urlD+FF23gYcPi61ehiK7zp
	Fv3rq8ji5D4ZnAAEX35Bx99tMmFLeDXZmtwhxDw8Jk+VRUYcyi3Y1njMuL4WJxk+J
X-Gm-Gg: Acq92OGkBBo9XowU4vW5UDVw4361gJWEiqOPNuR+C3HRUwvAacgjZ8psrU04uwnnPV6
	PiPJU4kBMai5lYrw37VED7yGSkgiQ4J/OHDNmEK1lpHBG89PihCIJ6Q35dKX5OJdAOz4EsscLTx
	kFYGx/JWCnSERSVSGnodS7dGogC20wZnU+BEgndUyMkxWFtfFrBeuEsaxKwfszgf2qrcaPoRLPs
	0WWXYsWWDXsuyXUC2pXNCC5WmEjRqtgz2EY3va5KaM0nv+E3vZbx0Zg6sobZStONJfBdKlS23TD
	7jevkqnZZxhFOyHdnbTMnBL6rXs/FHfw7P2aqNzt68vj+4ZYDUs2+iVswftQaphVwyfwlF7KF3d
	qYUG5m0J2EFt4iJS6MBKgn9nCvJ56BKTQGcT8Juzs/zxnFdzBsbOIlBc+RH8EmK8W66Inz4m9VM
	fqC03eHSGCFmuR3Hx2QxTGNcFfANDbZIsKn64=
X-Received: by 2002:a05:6830:610d:b0:7e3:d7d6:a4b7 with SMTP id 46e09a7af769-7e4ea0319a0mr16222969a34.3.1779271284021;
        Wed, 20 May 2026 03:01:24 -0700 (PDT)
X-Received: by 2002:a05:6830:610d:b0:7e3:d7d6:a4b7 with SMTP id 46e09a7af769-7e4ea0319a0mr16222938a34.3.1779271283621;
        Wed, 20 May 2026 03:01:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a7a0sm4778570e87.24.2026.05.20.03.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 03:01:22 -0700 (PDT)
Date: Wed, 20 May 2026 13:01:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: typec: Add Cypress CYPD6129 UCSI
 controller compatible
Message-ID: <w7xunralidmy3lntzlmr7zfkhdifbp2y6lf4z56ssliyih7nae@gx32fjexuzkl>
References: <20260520093902.2064730-1-akash.kumar@oss.qualcomm.com>
 <20260520093902.2064730-2-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520093902.2064730-2-akash.kumar@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: mrdUczhRF1rbmjALme7HcIOF-JWO9gqe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5NiBTYWx0ZWRfXxeuy99lSs0Uk
 lKvekXXMQcHLzVmfbqLnqY5LCyYg4q8Cbmy/Rgw8XMWIraubbA0pCs3qzeuD+PzLHFwvoffWPYQ
 Pt47XxTdd4HW2JsdyDtMMui0GErecLcbLX0c5i6RI93jKReIkIWj65DFHcRnCDrAI+GRuZ+iysJ
 PMegp1BuCUgm9ItoiRw3XQIjwPNTPRbzOWO7Jg2X9B1RRkR4xRYNwfwK6FlkyHHeMIatWU7neNn
 ikMb1yc84X6RrAngPcQyDbZsyr2n7BPjyYEPJcKIdUb9Gv4IgMamVdVi+up31metecRRSApF+0H
 JATx1w4jVl4SQf6O644+vt4in60RPWlNSgoh0TgjlIYlhHiIqhCE1aG2k0KaD2Y3Z5lZUCvZ4En
 w1EtuQSRtriz4z5r7l/lHiLiFSraTuosQQT7AEIaYaUk1A7cb3NTfswVvDYr2gOtcwJ27MAypnv
 v1smFzqlucC9v+PyAjA==
X-Authority-Analysis: v=2.4 cv=RZigzVtv c=1 sm=1 tr=0 ts=6a0d8674 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=81s-UeQjukf3pHKFtO8A:9 a=CjuIK1q_8ugA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: mrdUczhRF1rbmjALme7HcIOF-JWO9gqe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200096

On Wed, May 20, 2026 at 03:07:32PM +0530, Akash Kumar wrote:
> Document the "cypress,cypd6129" compatible string for the Cypress/Infineon
> EZ-PD CCGx UCSI controller.
> 
> The CYPD6129 is compatible with the existing CCGx binding, so allow it as a
> valid compatible and permit the existing "cypress,cypd4226" fallback where
> appropriate.
> 
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
> ---
>  .../bindings/usb/cypress,cypd4226.yaml        | 73 ++++++++++++++-----
>  1 file changed, 55 insertions(+), 18 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> index 0620d82508c1..90769c43ac95 100644
> --- a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> +++ b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> @@ -15,7 +15,13 @@ description:
>  
>  properties:
>    compatible:
> -    const: cypress,cypd4226
> +    oneOf:
> +      - enum:
> +          - cypress,cypd6129
> +          - cypress,cypd4226
> +      - items:
> +          - const: cypress,cypd6129
> +          - const: cypress,cypd4226
>  
>    '#address-cells':
>      const: 1
> @@ -63,10 +69,42 @@ examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      i2c {
> -      #address-cells = <1>;
> -      #size-cells = <0>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        #interrupt-cells = <2>;
> +
> +        typec@8 {
> +            compatible = "cypress,cypd6129";

What does this example bring here?

> +            reg = <0x08>;
> +            interrupt-parent = <&node>;
> +            interrupts = <GPIO IRQ_TYPE_LEVEL_LOW>;
> +            firmware-name = "ccg_primary.cyacd2";
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            connector@0 {
> +                compatible = "usb-c-connector";
> +                reg = <0>;
> +                label = "USB-C";
> +                data-role = "dual";
> +
> +                ports {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
>  
> -      typec@8 {
> +                    port@0 {
> +                        reg = <0>;
> +                        endpoint {
> +                            remote-endpoint = <&usb_role_switch0>;
> +                        };
> +                    };
> +                };
> +            };
> +        };
> +    };
> +
> +  - |
> +    typec@8 {

Ugh, definitely not. The default here is #size-cells = <1>, which is not
suitable for I2C devices.

>          compatible = "cypress,cypd4226";
>          reg = <0x08>;
>          interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
> @@ -74,20 +112,19 @@ examples:
>          #address-cells = <1>;
>          #size-cells = <0>;
>          connector@0 {
> -          compatible = "usb-c-connector";

Don't mix cleanups (whitespace changes) and sensible changes.

> -          reg = <0>;
> -          label = "USB-C";
> -          data-role = "dual";
> -          ports {
> -            #address-cells = <1>;
> -            #size-cells = <0>;
> -            port@0 {
> -              reg = <0>;
> -              endpoint {
> -                remote-endpoint = <&usb_role_switch0>;
> -              };
> +            compatible = "usb-c-connector";
> +            reg = <0>;
> +            label = "USB-C";
> +            data-role = "dual";
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                port@0 {
> +                    reg = <0>;
> +                    endpoint {
> +                        remote-endpoint = <&usb_role_switch0>;
> +                    };
> +                };
>              };
> -          };
>          };
> -      };
>      };
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
