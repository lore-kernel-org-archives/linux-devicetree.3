Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CF03E1689
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 13:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779283619; cv=none; b=dCdFoDk/0bdswB5jDTd2dSR790zEWi1tXsfVftwljvfjFoF3v+UMnlanGUxj9L21yh839XEq67ZmJgIryGtNj5EGgWoiGrsykA67bthkG8HvMNriJoxdphX7dSb6ZYs2kP9BzjgQs/2jfaEgXN3OmVd3zx5TynUNqkYq1vTB428=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779283619; c=relaxed/simple;
	bh=HemS74o5kpFzP0BLSBOjgyNhK0QVj940yoFmMZasu7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ymjlz9kZ4fyUCqRYX/snIXy8h12J1sR3ISOZdsd9A6hHwbsWSFhd6mAfXxe7br8vtlMHCFzBJuONkHguCMRxXSNrJYPrEuzgtICMh9T5iK/kjwOkcntyAYuDaqHYuosetKJat0hbUqeD99iqjDwSdCaoXu4mhnvcRRSAmLhUTZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y2xNKsMY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A6n3oWcT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y2xNKsMY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A6n3oWcT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9oLK51177853
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 13:26:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vaQoESsHm3Fjd/yTXvUGh2U7
	2xcFTmSwrslZBvyqdkY=; b=Y2xNKsMYNtBOg7oJDZRcWtAT5+7On04gsPDJnNEk
	D9Ac4J3+LJu3ZTmGxIKArpVdlMZedEKPdAzGd0/3WJWgznfsaP/tPcWzWMpTeAmM
	lcKIEXgOXtH/s3Td2f/loPXrjXXDU/gVtsYNXabyD8POWTlQIeiIdxI/j4ky9sFV
	LvY/3qYL0eduYoCEgl91QKppuqoQfu7VxQPrYIdFNjltl1nt4v25CBaV2IgMGH9k
	ov4pQe4+OWVavnEPEENQSy7FmFTyqngn/YJ+QBkPG3YzJT2tCxw5T9/8CU5LTsDl
	VTzjuQ4ns4n1DksudrLHdNzvA2mY0tHhjhxESoPQ2p2CKg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ap6rrrg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 13:26:55 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95fc346e02dso9112574241.0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 06:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779283614; x=1779888414; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vaQoESsHm3Fjd/yTXvUGh2U72xcFTmSwrslZBvyqdkY=;
        b=A6n3oWcT3D2ORcujF1L8/KBUy5b/s6gHeX1C4UQMbby0E0OWg570o5AB9IAPxRlAWS
         8L8treMaSJJ9nH3PfHCbbM6tok6oaGpA7jJEiV8gskDWAM8rHyceNGDLbq0ZMGkLSmgG
         lKUVCkGflXzB3iIFLrLEBxxRgXkwHsoMNPNYfHnp+0DCZT/+C8ywKLQFSc+lX/1NFSU1
         AGIF6qT6AD2XjXSED60hk3BzK2uqqqHrGk2UYUtGoTKcPcUj5bgI8llQLLDM6shenM8D
         +D5redQl5MClF9FTXUXy0pbRQrH1CTyoWbYu/OL8Ht4C36vRP3B9XkbQod8cUDPcYHY5
         9aOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779283614; x=1779888414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vaQoESsHm3Fjd/yTXvUGh2U72xcFTmSwrslZBvyqdkY=;
        b=aK7FaYjupOVFTWBZi4qXQhgYi9J60VA2Sm174mrFeKkSrVtZ5KmAr5SgJlkxxuNkZy
         N2ymBoMeam8P7X3t4VzIQIJcP42k8JLaSIi37RlYNfU4t3BTuERr+9L+n8QvFR4Ldpkc
         6Bcq0WLujm/BmGnJr9Pv2RfFhMMQM8SQCNzsSbJqLwT14PAB1YHVzl8Y9mbunp+hIMK0
         lc4ZNkrSeTGyBD7w1PNZkpcdYG37bOHqgfYjd6hJdb6i7qgGLlvJQKoIU2rjCQCFbarz
         IZmvjRc960fymdDxAdHumLdQKix3Pe3J0Zj48wZZryplmCzBGbzi6yffOfuSEUaprv8J
         U+zg==
X-Forwarded-Encrypted: i=1; AFNElJ9ZRokVhLENFRq+uzUvcHAaNc0jIJYJ8zInc0uXgVAP4JNjZhJqpUc+uKHEGq7lrG9aSoJvuGuIqvR0@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0JMlp3ndaQBOBH9qAcds1NouAo3y9sHuL0XYb8y6qm4mhjH+F
	/dCnWWadsjgDQRlzQjOCT1Tx3dY08RSpX8CsYIG7DS3yLdJV+kT4vTY0IMMTfsNbjXFi6sx6oHp
	ayRQxjzV1dXPGGsxGWQOXlRoiV7BuhRSiTvo6scq4/ptDwkCOIrd9xzTuSgw7R7fA
X-Gm-Gg: Acq92OHDwZBpyBPzSlJc3Sxr0TQp1Z7mN2emr5ca3znS5LGIc/l0JQ5gOeErIrmsv5t
	ICuk5ywK46eqn+8/1mebXI/TZLoU3Cwfe6sFZaSIFdTjoSPgNlV62I2pZaHXpT5lh5RY23jriZs
	f5EOXpcUIdnd7a+bTV+zhRSY/1A0BYulCTrcZC0ev7c/wfZGAvFfYVh6RxnMbQtzjqMDdzW6t08
	B1S0kWgqnad25g5gaDRzZSzovl3V7FdqLA//5QaJzX1sjkNRtwrpFg/cWJw6yQy19p/pvhT0tBg
	tbLQA5VcJfwxrmAFr4dp3+ImAehusoFjVe0yME3trAH2Ug/GZFpdvbEGGpXq03/i3nJGuD5ea6p
	m02ARNINx7S9IQR9dq+fF/M5a00vKWjkoWT557Z11GnRi2T2lYSj6LXabUEE+YaUufb4+aQdmn/
	6JrbYdruRnMRcdAHTDV3ZtIz+Ub7Qn1axwvCk=
X-Received: by 2002:a05:6102:511f:b0:631:4e25:5e40 with SMTP id ada2fe7eead31-63a3f698d43mr12171736137.25.1779283613934;
        Wed, 20 May 2026 06:26:53 -0700 (PDT)
X-Received: by 2002:a05:6102:511f:b0:631:4e25:5e40 with SMTP id ada2fe7eead31-63a3f698d43mr12171674137.25.1779283613354;
        Wed, 20 May 2026 06:26:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3958828151esm28711551fa.3.2026.05.20.06.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:26:52 -0700 (PDT)
Date: Wed, 20 May 2026 16:26:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Arpit Saini <arpit.saini@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>,
        rajeevny@qti.qualcomm.com
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: add Ilitek ILI7807S
 panel controller
Message-ID: <yn7rwuguaqliovlyukcj2olxby7zerv57na3jf2pgbke5zgahk@aasd4ojwdy2u>
References: <20260518-ili7807s-panel-v1-0-d7b048163b1c@oss.qualcomm.com>
 <20260518-ili7807s-panel-v1-1-d7b048163b1c@oss.qualcomm.com>
 <20260519-curly-courageous-sturgeon-2facfe@quoll>
 <dd065ccd-d7cb-45b5-8733-64b4f6571b3d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd065ccd-d7cb-45b5-8733-64b4f6571b3d@oss.qualcomm.com>
X-Proofpoint-GUID: BbsQoedYWffDh6ngmG_jHn8bdmIRkmwR
X-Proofpoint-ORIG-GUID: BbsQoedYWffDh6ngmG_jHn8bdmIRkmwR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzMCBTYWx0ZWRfX7LPDg5ooGMMS
 cTikUYx6KUyLzUvX75sGD7445q6tHTTlKgXajBG2b3rJWda5CQOOlRI7YgKthw8c7KamowpRx/7
 1XmDPss9TY6W2pUftLqNFhdLBIfzqfT0/2D+2UX3J61tyBsVjs2khN8zln8n0uXIXEtpXlm3KaV
 YsWvueIlhK+nR6muKoRSmd2z4xxv/c4dsx4dCuVMRM/EiwyZt8h++nNWYaLLvPFMxJVTfVoqRKu
 kaeXDEk0SWnZqya1bGs8X98gJwFtxYxeZfTOb6BuXUVjEl95+nofjp/sz3flpHWeCUjZsf7rAyl
 djffX/sy7ku8pnqnMdkJri+2yDYsIXhNMw4iYHBIkJrbeNWBdd1ugHtnuq4TLBqBH4fhh6C5w5+
 A13Bi4LRSWRlYEYmaWcXssVNtggX7LXN8bTqeXwSlHP7RLg4oXIB8L0SQXs+c527TxqqTD8zm2z
 D1z5yqHUuRtc/hVT/NQ==
X-Authority-Analysis: v=2.4 cv=FesHAp+6 c=1 sm=1 tr=0 ts=6a0db69f cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=b4Uryj85X3Pt6JUd_SgA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200130

On Wed, May 20, 2026 at 06:10:57PM +0530, Arpit Saini wrote:
> Hi Krzysztof , Dmitry
> 
> On 5/19/2026 4:02 PM, Krzysztof Kozlowski wrote:
> > On Mon, May 18, 2026 at 04:34:12PM +0530, Arpit Saini wrote:
> > > ILI7807S is a DSI display controller used to drive MIPI-DSI panels.
> > > The DLC DLC0697 1080x1920 LCD panel is based on this controller.

I can't find this panel on the DLC website. Do you have a pointer to the
product page?

> > > 
> > > The panel requires a reset GPIO, backlight enable GPIO, I/O voltage
> > 
> > If panel requires it, so should the binding.
> > 
> Ack, I will update.
> > ...
> > 
> > > +  reg:
> > > +    maxItems: 1
> > > +    description: DSI virtual channel
> > > +
> > > +  reset-gpios: true
> > > +
> > > +  backlight-en-gpios:
> > > +    description: Backlight enable GPIO (active high)
> > 
> > What is the name of the pin in ili7807s device?
> > 
> Display daughter card has WLED driver as well as LCD bias driver.

What is the display daughter card here? Is it a Qualcomm board or is it
a part of the panel?

Also you wrote a lot of text, but you didn't really answer either of the
quesitons. Is there a GPIO on the panel connector that enables the
backlight? If not, this is some external supply on your (assumingly)
daughter card. And it should be modelled accordingly.

> 
> The WLED driver's Enable is coming from WLED_P1_EN and PWM is coming from
> LCD_CABC output of the panel.
> 
> DISPLAY0_BACKLIGHT_ENABLE (GPIO 91) of ITP baseband card ==> WLED_P1_EN of
> Display Daughter Card (DC)
> 
> In the display daughter card of Shikra ITP platform, we are not using the
> external PWM for WLED driver. But connected the CABC output of the panel to
> the WLED driver. Backlight update is happening using MIPI DCS command which
> is driving the CABC output (i.e., PWM for WLED).
> 
> Because of above HW configuration, we need to enable the MIPI DCS brightness
> update on this panel. The below command of dlc0697_init_sequence() is
> enabling this.
> mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x53, 0x24);

So, this should be then dependent on the presence of the backlight in
the DT. Either it is a panel-internal one, or an external one.

> 
> 
> After checking this, I realized that this panel can be used without the DCS
> backlight as well when it's using PWM based backlight control.
> 
> I can add `has_dcs_backlight`  in panel_desc and set it true for dlc0697. I
> will update bindings and add backlight as optional property.

Why? Use backlight property instead. It's already there. Anyway, you
really, really need to describe the panel in the bidings. Not your
daughter card.

> 
> Currently "backlight-en" as optional. I will fix the commit text as
> Krzysztof pointed out and update the commit text to get add more clarity.
> 
> please let me know if you have any comments.
> > > +
> > > +  vddi-supply:
> > > +    description: I/O voltage supply (1.8V)
> > > +
> > > +  avdd-supply:
> > > +    description: Positive LCD bias supply (AVDD), typically +5.5V
> > > +      (range 4.5V to 6.3V)
> > > +
> > > +  avee-supply:
> > > +    description: Negative LCD bias supply (AVEE), typically -5.5V
> > > +      (range -6.3V to -4.5V)
> > > +
> > > +  port: true
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - reset-gpios
> > > +  - vddi-supply
> > > +  - avdd-supply
> > > +  - avee-supply
> > > +  - port
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/gpio/gpio.h>
> > > +
> > > +    dsi {
> > > +        #address-cells = <1>;
> > > +        #size-cells = <0>;
> > > +
> > > +        panel@0 {
> > > +            compatible = "dlc,dlc0697", "ilitek,ili7807s";
> > > +            reg = <0>;
> > > +
> > > +            reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
> > > +            backlight-en-gpios = <&tlmm 91 GPIO_ACTIVE_HIGH>;
> > > +
> > > +            vddi-supply = <&pm4125_l15>;
> > > +            avdd-supply = <&avdd>;
> > > +            avee-supply = <&avee>;
> > > +
> > > +            port {
> > > +                panel_in: endpoint {
> > > +                    remote-endpoint = <&dsi0_out>;
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 26060e51c067..529aed669401 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -7941,6 +7941,13 @@ S:	Maintained
> > >   F:	Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
> > >   F:	drivers/gpu/drm/bridge/chipone-icn6211.c
> > > +DRM DRIVER FOR ILITEK ILI7807S DSI PANEL
> > > +M:	Arpit Saini <arpit.saini@oss.qualcomm.com>
> > > +S:	Maintained
> > > +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> > 
> > Drop, unless you handle patches for this driver.
> Ack, I will update.
> > 
> > > +F:	Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
> > > +F:	drivers/gpu/drm/panel/panel-ilitek-ili7807s.c
> > 
> > Drop, no such file at this point.
> Ack, I will update.
> > 
> > Best regards,
> > Krzysztof
> > 
> 

-- 
With best wishes
Dmitry
