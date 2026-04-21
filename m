Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5704118C2C
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 11:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776769682; cv=none; b=OgwZJ1arehzZ/gvK+njq7tKNASPsNaqGJeAauDAFqYl5mbvfcgx9fXQhIsGqIuC1MJ+qHHUm0LvBjRsSa2VrepfNR7Yy5YoA3+uBW+pJa9Wd6vBitoQgwuifHTbnSDJb5kdLezk20szAaA341kxKTPFYdq0aBVzSMg95e0V3KfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776769682; c=relaxed/simple;
	bh=v0+xwh5bG5XNtm6PpRevp4WJfOcOhO0Y3cSkuhNFXzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P/L5SAYJpUSTmhmzgb8s5nH2yGqLSBavL2zg6IQEd4yNHgrd5Ies3sNoWP4Ld4oclbT3JQVwkHTTrUKL+UuyUIRYd5PpcOCQwRhEtnhkesjBYfYeAv8dgCurf6zqWkrXKMzY+CSMSQmLemGzWzUxY5WmcdilIFX6Jw7JvKKmFAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WDZ1x7dA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JRBFnKbt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WDZ1x7dA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JRBFnKbt"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L64Xp13257367
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 11:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MSKGPyTIVnf7CS8YuXLCet8XHrDFl5o/w9bZgb2MKfQ=; b=WDZ1x7dAVaEjT8Fk
	fxK18G72dqrq8lYLZG8C8SDp6HMnCuhl3bOnIaXx446v7AMZ9TT6TnTNNFe3b7EW
	/t7tPu/4cu2V+V7ZKCiqx0MZQL1aHksPedL6OE+QqdxaTWKwQrPgWHsfB+h842xB
	PDKz6oq8wfRIL+klKD6uvkpNObGpeleN6OCSU0/qPL8Yhg9CsbuImut9TfSA0mQx
	JZ94qA47VOguqmACih+Tx9K3rhj25CpaLO6mjPKOWHpLcNvrV0bxx703SFCFbf9B
	xowDvsql4dxllUnqzELVqpCm1yB7AI1r90sOk6HLhG/QL6MbGtKZfZ4NqMcTwIVV
	x9AT1g==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp3na93h0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 11:07:59 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-612ef4e6c54so6865951137.2
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 04:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776769678; x=1777374478; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MSKGPyTIVnf7CS8YuXLCet8XHrDFl5o/w9bZgb2MKfQ=;
        b=JRBFnKbt1rgFUNvcckquzWJ+D7yy5jxfdJzNvncvpJWef4Z5Aa/eSGMG42oHwxAO+w
         2me+h2WZ/yNeOPEHc7lZqUf4IdG76Cfz4OMi+ISo2YckU/dH0ImY7k+AYPHgfgR79KoH
         cv2KRC4mQ0LX33AGix0XVsRxMnifQaI40RK4SS8gA7zsrhlqyCSIJc4OrNyOOELV1CoR
         TuIiU+bO38PQXg36YflIpQXn5s2JHE+OgmMw1EHPNiwqgUa79uBaDmJVBzh8MROJmubT
         yuLdKyHdT2AQRONuUbvvuUe47izytfpq5BabzSRNiJYnlDXqcLAvxBlUbG5yrHhrezZM
         pJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776769678; x=1777374478;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MSKGPyTIVnf7CS8YuXLCet8XHrDFl5o/w9bZgb2MKfQ=;
        b=nAOqy1DmHjiMQDz2WESnJ0sv0K4Lx1fOt7TiiFG6Qvwsxo3JRhAOoIMcHavU/UbQRZ
         N+8uHSOMIhSJu5oSM/jYv/Y+UGiSExfL8dlL/aKsdpjss2avssRQm9asWYQgzHuqi5dw
         KpLlEjiyMz0sZk9FZzppxEEDOdTrzYXElHmS783+k93XwlUUBmnvRU5R5GkrI/X6c44w
         ItzlMVXO/RhsvMkqGezMtpukvo5unrVUnkX+H7+aCYE1fvJniES3O2Xes8R+NEGr9eq9
         D7IlMdAerLrKlE9J7yPmXK+lEySqG2RlrIvXD/lBMXgm76RTgNVx8UYN5sIwt32/WrLN
         3WBQ==
X-Forwarded-Encrypted: i=1; AFNElJ9f/9Ml2rzXmcoaQVhydMr56pA9/nM7WQCD/zq8x0Sn0xsnwyati62ndokhGqcdRza7oK5mE2WzRIVr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4Fweu8T71XPUJMWvDb+jdnYG3hVxDk2EDvH69igbZ1yegKT1c
	tsJQb3+4vLK0tdmHnEA1O0RTtER1mQocrl3oaBCowbzevW7bg26G53JJhESNrvdZ7HlTK8mTTJ7
	4HhK8UppdM1FWhAlOMDKq6KSD+PssHyhJOCKmo+LvrLXi1Kt6/ypnEPAJYSpllj9R
X-Gm-Gg: AeBDiesBS7Wbc9M4Cqja2BwCpRWvQ/d2Lu+cUNYjfth2DYlrWmzOp1DNLhR7dhUxye6
	XrKaVCrFFZnK8ocNdAZlzagUA+u5QEmUewUdiitomBptxXhjCdKqtTFSkLZRgYrgPHZBgDBjbNq
	k3atXKP4JV5q8dS8wNFaTs0s3G15IB3Vd6+GjacPTRVfbTAnl9XWZYM//V0+s/LIFUr8daJVIlP
	r5DwVrHejzRY6dNG5JaMbU82mh+1Wmag5uEHR+H0yRIrUjUHZdq/2Xp4dNc0VA//L4Rf0k3PKl/
	t++QhCERDzOrFkiJ6Un/R5kgPb9JIxs7RoO1X/ScBvI97h62Wj1U30KUQer9149YucYcadebuU7
	w8MZ608+QIMW36Msbgv+PX6Hn6CxgcMVNS6Q46ICUveFPLUy0W8vPkx8D/C26FBygjZsWRsFF+3
	E3/d65WXFY3wOAhJSQU8MBPgwQ60eLhR+Co8154RL7m9f2Uw==
X-Received: by 2002:a05:6102:5987:b0:602:86a6:9877 with SMTP id ada2fe7eead31-616f68d3997mr7735202137.19.1776769678549;
        Tue, 21 Apr 2026 04:07:58 -0700 (PDT)
X-Received: by 2002:a05:6102:5987:b0:602:86a6:9877 with SMTP id ada2fe7eead31-616f68d3997mr7735192137.19.1776769678045;
        Tue, 21 Apr 2026 04:07:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb73aa8dsm28362761fa.35.2026.04.21.04.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 04:07:56 -0700 (PDT)
Date: Tue, 21 Apr 2026 14:07:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?5p2o5a2Z6L+Q?= <yangsunyun1993@gmail.com>
Cc: syyang@lontium.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
        rfoss@kernel.org, mripard@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        xmzhu@lontium.corp-partner.google.com, tzimmermann@suse.de,
        rlyu@lontium.com, xbpeng@lontium.com
Subject: Re: [PATCH 1/2] dt-bindings:bridge Add LT7911EXC binding
Message-ID: <p3aruen3h3ddmzlqbdseksuqwuwvxa32qbi66yf4gjwdtb5h2a@xs3dleimg2an>
References: <20260420023354.1192642-1-syyang@lontium.com>
 <20260420023354.1192642-2-syyang@lontium.com>
 <CAO9ioeWhWemzyF30t8KDJht6_59b1Y5+GrH9nYCeKuPwddVLHQ@mail.gmail.com>
 <CAFQXuNbyH88Ab_LgfZknRxhK9QzN8Xe-G9NuRMuECZF_SrRpfA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFQXuNbyH88Ab_LgfZknRxhK9QzN8Xe-G9NuRMuECZF_SrRpfA@mail.gmail.com>
X-Proofpoint-GUID: hxnbPjczQ1L3Y1M4qLuZWkb0vxumWQHD
X-Proofpoint-ORIG-GUID: hxnbPjczQ1L3Y1M4qLuZWkb0vxumWQHD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDExMCBTYWx0ZWRfXxMQzJlkhB1Iz
 FSR9bFQsoe6b/3206ihM+nqfb8TEZjoWh2O4ijRmNnOUSoKhSkxkDX9+pfAeQmFV4Zsv0j92Q4T
 61ZWA1W6cFe/zWe2GwhcnhWz16NPHWUBWvNcSoMsZIT7X2AIQ6Azz77EOJlyrQz8B0ZycAANrh2
 FrRdIFE2vhztU6YUGcgVw67byPPpH1639D/6TXOS3CCZHlhE71FAJGvMMOZtZiCkm+U03pkYloA
 Rz/AZ4O0gPTYxoDcghPKGIS3gl6e8JELPcqMsuBPsPwyBOFmqRdIWzqLAOG6DPYTs7v6zLQWPig
 NWfeG/cdyyKNizEzKsmuYimd8boEnB6h4GW4ZdZ7yNTSGmOr8f8KANpdO209nTXYpietvoZfjM3
 b+8bn2dJvmUZdwCfUUW8DHXvKTITeLlllqgvriPdawbHT/WQmY8y30X3MN3IwsKh1iA6N0ZfCdE
 NTsgrqaKkyAs8roxrOQ==
X-Authority-Analysis: v=2.4 cv=O9cJeh9W c=1 sm=1 tr=0 ts=69e75a8f cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=Kz8-B0t5AAAA:8 a=SyGcD3P3TnKYVP3v8i4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210110

On Tue, Apr 21, 2026 at 09:33:34AM +0800, 杨孙运 wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年4月20日周一 11:12写道：
> >
> > ote, your message didn't reach dri-devel. Please check why. You might
> > need to switch to B4 Web relay submission, if there are any issues
> > with the SMTP on your side.
> >
> > On Mon, 20 Apr 2026 at 05:34, <syyang@lontium.com> wrote:
> > >
> > > From: Sunyun Yang <syyang@lontium.com>
> > >
> > > -binding for lt7911exc.
> >
> > Less is more, but here please settle for slightly more information
> > about the chip.
> >
> 
> It will be modified in the next version.
> 
> > >
> > > Signed-off-by: Sunyun Yang <syyang@lontium.com>
> > > ---
> > >  .../display/bridge/lontium,lt7911exc.yaml     | 91 +++++++++++++++++++
> > >  1 file changed, 91 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt7911exc.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt7911exc.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt7911exc.yaml
> > > new file mode 100644
> > > index 000000000000..54a73d41635a
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt7911exc.yaml
> > > @@ -0,0 +1,91 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/bridge/lontium,lt7911exc.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Lontium LT7911EXC eDP to MIPI Bridge
> > > +
> > > +maintainers:
> > > +  - Sunyun Yang <syyang@lontium.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - lontium,lt7911exc
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  reset-gpios:
> > > +    maxItems: 1
> > > +    description: GPIO connected to RST_ pin.
> > > +
> > > +  vdd-supply:
> > > +    description: Regulator for 1.2V MIPI phy power.
> > > +
> > > +  vcc-supply:
> > > +    description: Regulator for 3.3V IO power.
> > > +
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +
> > > +    properties:
> > > +      port@0:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: Video port for mipi dsi output.
> >
> > MIPI, DSI
> >
> It will be use MIPI DSI,  in the next version.
> 
> > > +
> > > +      port@1:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: Video port for eDP input.
> > > +
> > > +    required:
> > > +      - port@0
> > > +      - port@1
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - reset-gpios
> > > +  - vdd-supply
> > > +  - vcc-supply
> > > +  - ports
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/gpio/gpio.h>
> > > +    i2c {
> > > +        #address-cells = <1>;
> > > +        #size-cells = <0>;
> > > +
> > > +        mipi-bridge@41 {
> > > +            compatible = "lontium,lt7911exc";
> > > +            reg = <0x41>;
> > > +            reset-gpios = <&gpy8 8 GPIO_ACTIVE_HIGH>;
> >
> > Reset pins are usually active low.
> >
> if reset pins use active low, lt7911exc_reset function needs to be modified to:
> static void lt7911exc_reset(struct lt7911exc *lt7911exc)
> {
>     gpiod_set_value_cansleep(lt7911exc->reset_gpio, 0);
>     msleep(20);
> 
>     gpiod_set_value_cansleep(lt7911exc->reset_gpio, 1);
>     msleep(20);
> 
>     gpiod_set_value_cansleep(lt7911exc->reset_gpio, 0);
>     msleep(400);
> 
>     dev_dbg(lt7911exc->dev, "lt7911exc reset");
> }
> 
> I think the two are essentially the same. Please confirm whether I
> need to make the change?

If the GPIO is active-low in the hardware, it should be declared so in
DT.

> 
> > > +            vdd-supply = <&lt7911exc_1v2>;
> > > +            vcc-supply = <&lt7911exc_3v3>;
> > > +
> > > +            ports {
> > > +                #address-cells = <1>;
> > > +                #size-cells = <0>;
> > > +
> > > +                port@0 {
> > > +                    reg = <0>;
> > > +
> > > +                    bridge_out: endpoint {
> > > +                        remote-endpoint = <&panel_in>;
> > > +                    };
> > > +                };
> > > +
> > > +                port@1 {
> > > +                    reg = <1>;
> > > +
> > > +                    bridge_in: endpoint {
> > > +                        remote-endpoint = <&edp_out>;
> > > +                    };
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
