Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276963A0E86
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 05:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789105351; cv=none; b=lmR42Rqn8STL8KyuYdGbBSAcvkDE+wvQcqV6O+nrnY2HLQXML2oYjdMeYsMhksKmwoA0SivUa5pN4iRiZPdUuob+eQwSOvn+6jsFHOhEkiZnI7keQByvE/2cfEO1zG9KfPs34uL+w/uaeFLFenGPCChLOajQdNV/B/V5/pAkTbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789105351; c=relaxed/simple;
	bh=fnl04WX2Spfg9N9VVYiJG5nPwxKffjLDMo7t8/9a5L8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OqIscbOmHaSkrO6xmrT6ffOtW5DI2YSKEf0CbBcnCd3NuDxI7McQJzrr74UWaidYC9bbn5uc3SLJxYx7fRbFpN8L1+9R3+w/ZUzE97tnj6A3xV6BRE/jFpz6fcnvro/G1ZEuWzaymINKq96UQeI+nzYh4nYkIYQNVB/AC+WExYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DVzfSWA/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=acL8q76p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DVzfSWA/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="acL8q76p"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B5JBjg4002407
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 05:42:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WyW5Ix8KToU6pCiBFnCkXGyP
	rVI7Tj3cGyVGu4U9jKg=; b=DVzfSWA/MwaqFRStfjxh9NUgP3Xj5lPcKOzWHJft
	je/MZknn4OXevJUHGt65hS01LjEqJZeXEguXm3q4w2QXF/v+k5GH2wN3+QCoXER/
	sg6VXwP3d7mOZdT/5L04SQLhJx0O/QLwAppqVHeVcyaYdfr8rfp+fDhgFfbMuSCZ
	wgaYs2udIiin89msH8L9WaNtlT1rTMv1tfC7gDjQGjAoQcfJkPi/9FL5l6PKosld
	M5W0fXagukeZXQWuSq2wpKmqXIrQth4PlSM57x5MBQXl1ZTix6wM8DNPd5taCLyp
	7yUOXjFpfjA9Ti8JMt3tzZsHyCal2Xwl/TwI+C10d7QSaQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd382dy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 05:42:29 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso989876a91.0
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 22:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789105348; x=1789710148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WyW5Ix8KToU6pCiBFnCkXGyPrVI7Tj3cGyVGu4U9jKg=;
        b=acL8q76pfhVhxaiMxBC5JWOVC81sS2jDkDgf27mUILBcWrws4ffcCrq7z9rK31R+RR
         WBOjHub5l6GKR9sOZGQeK6E4NjQXk6SPW5y7PmgAiaF81qpAmRUikIHU/WglWJVwuHo8
         jNm5iPcAszTABHnnhs09LFPRti2L+iGXORbfw59jCehPVhNzKa1Vo1nDhluU3abXISO4
         xoEjni6KS00nmnlP6H6J5NqB/F1dM3+Xc2L4M/SPhmApqaEVEUU/fw+f9sfdvkvcffzJ
         0f1u+aaoxpY/RZ7K0JEhYiv9Iokkyt1g3h/+aD7yyGcJdvMrQMPkXG9U4zZVgAw5mQ8D
         T21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789105348; x=1789710148;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WyW5Ix8KToU6pCiBFnCkXGyPrVI7Tj3cGyVGu4U9jKg=;
        b=g9E+aowlv2g5BZZ2Mu7DYAJOxCc8N/h7yaAtrQNyGE+5C9HYZHmumW9dZuL/DWkBRX
         D2iIOFZq++O6OM7VjMGriYlkTBwjgzzpfMOFTa7BgMJdh68wUswjQDAfJ86HTQbNftSI
         FgFwaHK56XRMSfqJ89wYtY/NYbjuFhNri8Uhrfs9SxOyFqyHsSbRX1yHrQR9Q4JFQQ6c
         ZqMEdhV/kXUASNwyihtqlLHidciQPARtq8xroJLfHRcWUAiC27Xx5rlw0mp4szfExCr4
         G9YbmWfFAAHmI4dW46v5hkBkEcKJlIR7ggWA6BLjL1cPsoVSdgfH1DD+liWrOWSZdtjX
         TCDg==
X-Forwarded-Encrypted: i=1; AKwUvByDe672JWn5LiztMX/VBULFKdfY94M+C4Et80o41HlY/onihE+0RYLom/f7mVAr2XTLznQOq1fXsYRy@vger.kernel.org
X-Gm-Message-State: AFuF++m41JxUHTs9AKHgkdGGhDyb1eGS2CfgT1Y8G5uxTVoVSmo7YWjy
	OxIKSThUW2Y1XHs2FnPyNvXTZg0iocxSc1w7l6i568ErXtFYj9xwMrSPylkEPOHRz3hgzhKx1rf
	UVEPswpZvLPPfQwYdwHI3jLtvu2UG/KAHgDW+60+Y8qAroP086NVvr/JnktTSV8YP
X-Gm-Gg: AYBFou3ZZt82S3HT3x4/4JJCw6aRU7kl855Zr5yaes9hjN5yFwIAg20LP1SJFWt2Co6
	XoOvFC32pQsGgqGY+qr14Q1lafxnXABBG4OTsOEtRwLayINs7a7ecvo+KjMPwvPfaGyPbfWUT8I
	BPlTfBRuP/np651i9aoG2aE0Ck+BLgBG++gU3rxHaX8jCIliWS+k+tFJnQ3GGiII93cd6yJkDeM
	ztFNDj3SgmMbDtrk6zKYlhN5mrLFnG6RbI097+2d9JSksjgkYo6au4PnlZYbsqsc/jnLgQhIzxm
	uilAwKWGR40+idfvYTw1gu/PTTISyrVX89GPtbJFTsSz2dYDIi+x0zV4yJssX3oBSdQtDX1wRXg
	6z1J7Xloutuymt8eUlilbJoyrezxQyDIBUR7M
X-Received: by 2002:a17:90b:574c:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-39d9bd99cb7mr4584978a91.7.1789105348411;
        Thu, 10 Sep 2026 22:42:28 -0700 (PDT)
X-Received: by 2002:a17:90b:574c:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-39d9bd99cb7mr4584897a91.7.1789105347944;
        Thu, 10 Sep 2026 22:42:27 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fb3ddasm2836115eec.30.2026.09.10.22.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 22:42:27 -0700 (PDT)
Date: Fri, 11 Sep 2026 11:12:20 +0530
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
To: Conor Dooley <conor@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: regulator: rpi-panel-v2: Add
 required vcc-supply property
Message-ID: <aqOUvKiybGs/YUxH@hu-ssmaurya-hyd.qualcomm.com>
References: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
 <20260907-rpi_reg-v2-1-0c59aa60d31f@oss.qualcomm.com>
 <CAPY8ntCF6e3FZPx0BwZKJimACwdUKwNSP+SPjNUE+1DgQC1=Qg@mail.gmail.com>
 <20260907-atlantic-modular-8f3c1582635e@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-atlantic-modular-8f3c1582635e@spud>
X-Authority-Analysis: v=2.4 cv=Bv8IUoX5 c=1 sm=1 tr=0 ts=6aa394c5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=DV-kZd77nCGiJ58iTUQA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: AAbTXCMaIhEGAjp1Pp_xbf5Z6QgeHiFo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA3NyBTYWx0ZWRfX2lgofGdSsu2M
 n7Q+FQ97DPGVilTFNsVgZLwFTfezTfUkEMWJgpTYq4gQzQFaaD6hR8afA+dx7EmQ6woLmhpChdc
 4wy00qzWf6t4ACDi9Orclj4HPw9nNhA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA3NyBTYWx0ZWRfXw0x3f/twFvVh
 rPN4kViKc8jcvl2/lG7qPfyf4KfQVQiBVRbuUA829k+hvaPlOrJZlOUIy29ybZENYLLxIztSJra
 KH3x2dTNJce5o+02XKgdCqP+85PALhN9mgQehn3sufP/iYAn6/5kRbh8k5hcgVWA11AI/TiTrTD
 1Fy+2zK7PSPEIDKjdtP3lu5M1TY4Lk2yjp0ogfffTPtctqbu+V7lA2LEK0zpiWyas7efD0Wz1yc
 qZ9o9jpYtE6GQx1rJsGFQT2Yi2aqJe1uXHarbw4/7gnUAVUUn8nFN1gxNLPcyPMpcK+NAfSlJlJ
 0BTBUzrxKcR3C3saAPxVEV+mVkdPeEhwU5drIt+rKhhilMNO6OjyG/lQKKkTuFL1WnhjB91o7QX
 HRsh+kF011He1XcxefWKceoIK0au8uQJ9ZXQI89MYxz8d7eprRWqpvcIL3bNuJSOy0HwYbkgPJH
 U/nSPO7Ndd8f9A4x8nw==
X-Proofpoint-ORIG-GUID: AAbTXCMaIhEGAjp1Pp_xbf5Z6QgeHiFo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110077

On Mon, Sep 07, 2026 at 06:10:36PM +0100, Conor Dooley wrote:
> On Mon, Sep 07, 2026 at 02:24:09PM +0100, Dave Stevenson wrote:
> > Hi Shashank
> > 
> > (Apologies for the earlier HTML version of this - I thought I had my
> > mail client under control)
> > 
> > On Mon, 7 Sept 2026 at 06:48, Shashank Maurya
> > <shashank.maurya@oss.qualcomm.com> wrote:
> > >
> > > Add a vcc-supply property to the Raspberry Pi 7" touchscreen panel V2
> > > regulator binding and mark it as required. The panel controller MCU
> > > needs an external power rail to be supplied before any I2C communication
> > > can take place.
> > >
> > > Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> > > ---
> > >  .../regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml  | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
> > > index 37b9ed371b67..a6195e53be16 100644
> > > --- a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
> > > +++ b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
> > > @@ -35,6 +35,9 @@ properties:
> > >      const: 3
> > >      description: See ../../pwm/pwm.yaml for description of the cell formats.
> > >
> > > +  vcc-supply:
> > > +    description: Regulator supplying power to the panel controller.
> > > +
> > >  additionalProperties: false
> > >
> > >  required:
> > > @@ -43,6 +46,7 @@ required:
> > >    - gpio-controller
> > >    - "#gpio-cells"
> > >    - "#pwm-cells"
> > > +  - vcc-supply
> > 
> > Adding a new property as "required" breaks all existing users. Adding
> > it as optional would be reasonable.
> 
> It can be made required here, but never in the driver. If it's actually
> required that something turn this on before the device can be used,
> making it required is probably correct.

Thanks Dave for clarification. I also see one existing consumer of this 
regulator driver: arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2.dtsi

So, adding required in bindings will fail for this user. 
Apologies, I didn't notice this earlier.

> 
> > 
> >   Dave
> > 
> > >
> > >  examples:
> > >    - |
> > > @@ -55,6 +59,7 @@ examples:
> > >          gpio-controller;
> > >          #gpio-cells = <2>;
> > >          #pwm-cells = <3>;
> > > +        vcc-supply = <&vcc_reg>;
> > >        };
> > >      };
> > >
> > >
> > > --
> > > 2.34.1
> > >
> > >


