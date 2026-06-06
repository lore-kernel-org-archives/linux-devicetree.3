Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7990E3093B5
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 12:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780748172; cv=none; b=NADSz/cGxOz89scy2ThQ3x8yMbzU0aCYxqPm2q6JI9IKvDgUGa4Eq8VREzzD7P4H4F3h1g3WijlqE7hc0gZcx5vgrFF5ETUhyI3zkdSvLawKCnlvM2gBDGloU1G1/NZ5PWaVYHEwg+Bv1CZOGFgKHEPKHIgJwrPM3QlIETqfF98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780748172; c=relaxed/simple;
	bh=RJW3ZrUC9CticGt7TJWt8EEhmxJcCwuHLns53qLa3qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CRwUJcWxS/t/jbWzM1WLwBgA8bPVztnyvgkwH19Nn2OPWsK3HHzT6aP15H9tCmmYlK9Ntgsh/UlIAQf95iuyBb5Skdnvyk5imtTeW4GVykjTkhFsn86aqz0EcbcwShszt0i0/5Awk6ovWExhhgjjgPp4qif0V8819l9dAl3nyLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UrmBsf1D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GetRCjJq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UrmBsf1D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GetRCjJq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BESan1330749
	for <devicetree@vger.kernel.org>; Sat, 6 Jun 2026 12:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1zE3o4VQZjHAay8n7mzWjWrr
	l7kDTW8knX8g5BBXo4w=; b=UrmBsf1DursXcp+DHml2Fw+Yi7SWRWd0SPCDjAiK
	X0pcnwOI8e9tRgFaO4kfR6ISmHjh8laeT6W9iZIW7p1Pej4g2Jmhax4DS+QHfWwp
	91qMxthPY+gDtsAE31QVZby9GR2PET2XYvWFWVtjbuH7/SIl0+1rdL4u6dLNMS+B
	UtkiaHFs3Qme3J6JImm1f7O3s8hSBaoU4/lwtDR3xBXZlLpl7RMMgtFdl6uRL7/5
	spyKfMYZ4yaYPOBrldqp3Sd0QBkCUXIJegkWb/cOIyJQKhLoSeREQWchVnTUkVqm
	hMDRnc8NCIa//tOs1R3NJxk0QY3W/9yEudgjFUl2QBtmgg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs18xtj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 12:16:10 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c77c80d967so2728580137.1
        for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 05:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780748169; x=1781352969; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1zE3o4VQZjHAay8n7mzWjWrrl7kDTW8knX8g5BBXo4w=;
        b=GetRCjJqThlwoMstbEBhZVbg/KYESmCZGaUpGNON8xL9VRqRRxi3WN6wfu2/WfyrZ1
         SJG31rzbQDwl5geP6FTn9h4tCyitWs8KhJBCg3KFBVnW35BQeKqbfISqjKPoaia/YnpL
         SByWyQv3Hm63NM2+W98mtWjDJEyJrbel69w108R+eKfatggJxNz5DPN/U7j0c6vQdxMc
         +oT6KemEoWcm2vTxxgPSK1rFHUFQO38smdGcWwSEvmhAj57JlFnBTB8zTJd+r9X/91JL
         VEISLVrlvEeXIHVQc2Bj3NmV2z+nimqNLV25CLkH2YPu+3cn2P0ZG1ybXEyeBV9Q+90A
         Tq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780748169; x=1781352969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1zE3o4VQZjHAay8n7mzWjWrrl7kDTW8knX8g5BBXo4w=;
        b=peLOfHSf4azGwJXhhpDRnJNBtszESFGcgIe0fj6FWuiR6gCDZynT2RNaiIF75ZFW3e
         IYyqUHrmKJEDeNhV5MtxzLlv7JQVC/JhEE//eqgMYowY3SyD97/2NUGazQXROzt9fxKf
         o7XnwiasMA1gkWINrIiuMrPim7UvyD6PK5QujI1Ve10U5qLFtkHO3jf4S3pof8rDFCya
         W3QfppdnO6r/c4XQGQ4Re1kK2OtoozZqP0GShjjagjWdrxXNT5ncie3OTx423W9CFxHC
         AX/J+/JjtD4YgqSp6mbOsPtgtrpSj9h4RI4MPQnUOtAshoelgcdxvlUABW8hS/LmI45p
         w7HQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Aan4NSF9BrWXbXhMFur4ar/1A0RXzLhJ+1gj2K4oFg0FgFlL63GcRE6/V460Jd/1xCErG2ZVJT+Fl@vger.kernel.org
X-Gm-Message-State: AOJu0YyYr2ZhduHdYVXsa8eHvueRGZfSaBgOh9Yf7VEq+00R3g1Gwr+P
	YqwScyELQh0C4rbxTWeqlqRYv20sJPdS6t36rduOEjiX51vg4oZqV2qCt29R3HjMjYMtV4mrC0P
	lBeBHXhFd9KSpHZSyUfYsSIotgZPWGVyl8y6bs9lkrS7tBHv1oy0553CmDxi5YNeS
X-Gm-Gg: Acq92OEAv6ZOktEPywGDO246ejKKS+/sBQM8RUGKwHn42jnnN+61iwjH43D4yYxIcUn
	tgp6bDddwGrW5fNK5Yq+1UHKGLPNe+pzPPd5CYbt/A2oUO7Xeu5i77Eh3XblL+SPf+Umc/WoYeH
	KgYO2HHF2jFjcV64WdfcgiQr2ZTPvLTI7/xfOYxHDdj/Y6c8sFEEa0+sXWn0R++adaQlLsRTdQQ
	Ovsbu8DqHpYjslwy+Mpfxc6rwlPIZMKNOGPE9VgaM9NVg4RaskOpzDjzSxfmvtt2UyV2/WPlEff
	x9apuFNqOoA00sbn1gf40kLY2zhcWMv+tEvZQ92GkFi5FKwGWE/FYHd85m/NPhzFRkL1PWbA6dL
	qLtj0pX11oS0dJAyubOFWxOIYMAE+m8n0fF27hqV14w0WXfY+MELZyqZINtALPRHprdjhsCSTZm
	qinqT06ZRgjHNTLJ56iv1yFzhv8jVcXfsz7fCdYnovS9cqFw==
X-Received: by 2002:a05:6102:c91:b0:6ef:fca1:13f2 with SMTP id ada2fe7eead31-6fefc8b5b6amr4334565137.7.1780748169185;
        Sat, 06 Jun 2026 05:16:09 -0700 (PDT)
X-Received: by 2002:a05:6102:c91:b0:6ef:fca1:13f2 with SMTP id ada2fe7eead31-6fefc8b5b6amr4334521137.7.1780748168762;
        Sat, 06 Jun 2026 05:16:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396abd6cbe6sm31092601fa.0.2026.06.06.05.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 05:16:06 -0700 (PDT)
Date: Sat, 6 Jun 2026 15:16:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Arpit Saini <arpit.saini@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
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
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: add Ilitek ILI7807S
 panel controller
Message-ID: <aiQPhPycW07t0U-6@umbar.lan>
References: <20260518-ili7807s-panel-v1-0-d7b048163b1c@oss.qualcomm.com>
 <20260518-ili7807s-panel-v1-1-d7b048163b1c@oss.qualcomm.com>
 <ss3deh6wb4bjasig2r56bhl6opygpkid2ixztzdsegqgayuvdk@vgy4ytjzyife>
 <1ebc7c8a-b0de-4f25-b4dd-571909f9c67b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ebc7c8a-b0de-4f25-b4dd-571909f9c67b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDEyMiBTYWx0ZWRfX4j+KeEbBLWob
 GffkK1t15bAaKXhDUw0oshkvPPLm/wfJfo0ZQqxq1l+JHHXA8x4/KbtSSbIXfHeSyAsEiL0mDr4
 J6yIPAkD8V7eDFl6Z+bMCT3pePKaYG6qSYt///oQlFwuqat7biqEf2hr2aeGqAn4hLT5NJ3DisX
 sKtk4tB5UnNCFcXTXXYvsvxDRTSYNQ/EKscNukAJb0th+oBNjxSoVcldNAHGm0ECmam8KmoyI3k
 Ys82EHWBW3nfipr1lWcG9orOddLpd5cpFj/MJK98KlT2Who8iN9qxwibDlBDgLnMMgIsRSPpdk8
 cIbZJUhfBx0uvGDeqwYk54ytbapogbZ2yDIaQwWeqNNy/2LAT7CKTz1TUewVtJNZtWNuPQVN5sX
 m1ALOS7j9ldyqsYsmvmXclDRDOdbetuahEXCdwlWfmkNnRaHqyhawsfVeeqU5RCECL5mBuDaLzz
 r39/E4damqvHj75UeCg==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a240f8a cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tJgGB5yCzY2aFmRDZG0A:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: XSoa8gWEHfWySpreBJIO3GBqsr-l0L3S
X-Proofpoint-GUID: XSoa8gWEHfWySpreBJIO3GBqsr-l0L3S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606060122

On Wed, May 20, 2026 at 06:24:20PM +0530, Arpit Saini wrote:
> Hi Dmitry,
> 
> On 5/18/2026 9:53 PM, Dmitry Baryshkov wrote:
> > On Mon, May 18, 2026 at 04:34:12PM +0530, Arpit Saini wrote:
> > > ILI7807S is a DSI display controller used to drive MIPI-DSI panels.
> > > The DLC DLC0697 1080x1920 LCD panel is based on this controller.
> > > 
> > > The panel requires a reset GPIO, backlight enable GPIO, I/O voltage
> > > supply (vddi), positive LCD bias supply (avdd) and negative LCD bias
> > > supply (avee). The panel operates in video burst mode with four data
> > > lanes using RGB888 pixel format.
> > > 
> > > Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> > > ---
> > >   .../bindings/display/panel/ilitek,ili7807s.yaml    | 80 ++++++++++++++++++++++
> > >   MAINTAINERS                                        |  7 ++
> > >   2 files changed, 87 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
> > > new file mode 100644
> > > index 000000000000..93c511d03c00
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
> > > @@ -0,0 +1,80 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/panel/ilitek,ili7807s.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Ilitek ILI7807S-based DSI panels
> > > +
> > > +maintainers:
> > > +  - Arpit Saini <arpit.saini@oss.qualcomm.com>
> > > +
> > > +allOf:
> > > +  - $ref: panel-common.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - enum:
> > > +          - dlc,dlc0697
> > > +      - const: ilitek,ili7807s
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +    description: DSI virtual channel
> > > +
> > > +  reset-gpios: true
> > > +
> > > +  backlight-en-gpios:
> > > +    description: Backlight enable GPIO (active high)
> > 
> > Is this actual GPIO or the GPIO-controlled supply?
> > 
> Addressed here https://lore.kernel.org/all/dd065ccd-d7cb-45b5-8733-64b4f6571b3d@oss.qualcomm.com/

It's not. Or, from your description, I can assume that it is a PWM
controller external to the panel. Please model it accordingly. I assume
there is no 'backlight-en' pin on the panel connector.

-- 
With best wishes
Dmitry
