Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BEC318ECD
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 18:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778783237; cv=pass; b=gkQOCacY7FNsG6Yc46OfMLZ5GwZGsUO8MpLHohVxWScc+2OrzAkN1947XyM7wOERKGbktI9rtmzx38fDLaGC8ihcT4dbJPlAXZs/luOWtQ8SOYnYCbERBSGiRwheNpEv3dxY7zXLZzf8zqBB/dTAONs15EAglKlE7fUN7d1Hfqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778783237; c=relaxed/simple;
	bh=ItU+KZc5ropgCT28IRSogm4JMBe/gW3BCododYwU41o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ga/Dzd57PKwNjWClA5EkMJ097Gu6tpapHJETyy0QHfRJ0LsItfuRK3dOwU9fhQdK8YlW6uyEjvZ+fCpbkYoAIFRVh2ZW7GR0koddclmc7ClU0tw+Gw8RtTnUwSf5RTJcGFzcPPsQwS5X92eDTmgGb44AfjXVNnXWPB7VFjYrsWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KNkj7xnp; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KNkj7xnp"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3937014be0cso77538481fa.0
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 11:27:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778783234; cv=none;
        d=google.com; s=arc-20240605;
        b=go2NeXXsBjDA5po02/VcGXvCM0r4s+S/5I10riZW8EyhpwHNtAwnDeVqJK8gdYvxDR
         AeqEzQFnkWwaRCli2YSdW8Vqx3J+plHXcJbmPYO7vkUwm5SpqYlgHoMGEo0rf8CtdH9N
         h3Vjvqpwifer1jfXzvFzeWr4Mj+nrMffLflcnfNC0i7RzaTTU52UVFQWRFyDdxIAzSWa
         jZPmDAukY/AmUk7QBdac7B64A+5YkXzj5n1F6Ji4xrTnbw8bk7jny7JVUAVuBSbnsDE1
         9Ptew4afnV5p23h81QSTjrsGtzGdo9G/puxvYyhw+KnM3eLY+qWQ2BfdwZo2SqgjhX6x
         9ZPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2Xh19LyQF10UTWKq1me0fwm+mh43ExASMESLfzu7G68=;
        fh=ETiCDgPO4Lj30uQItMfm2HZbBRK/2BwUf5a4NzYBOAM=;
        b=Nok+Z4oBrdI95DvRglsX9Yne9G+Fz3Wci6ebEB5AIulnBuJmyE7NuGmz/iYc6HfhXI
         qXMhTDEvlJ0CcTCofy7TSmhwgu3uaRoH22cD7GBZM6i1E9Uk/ZRvr5jgcb31gzKtPmEs
         CftwcMT2xI/j5yW/3jWwQ0IqZEyhFZl7+QV5Pm9392k+vOrmc4Wt/riSUgq0xW1Z8l5Y
         nFTxabRo02B9PIDVykzwlvUuYf2JDrtm6y2n9IseNw0BTHES84i3t6f0jVsGDuxLzNp0
         lrh2d/uiqhcuoFEIPrIBhOvAJyi04H6Ys4D37TcbFb7j7g8IH/CreV8e8ke/3KKG2pEF
         GeWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778783234; x=1779388034; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Xh19LyQF10UTWKq1me0fwm+mh43ExASMESLfzu7G68=;
        b=KNkj7xnpA8wjCBtPMBQ3t2/8IgxbXORSid8/7SOpf/wsRST7+N687uJno9UDf+6gpk
         TnhJiMr7GFfaOW44a/u6SypqWuNPQB9pJ7s9KFyUddcWZqAQjATfzW2XqNBhnA5Et1Yu
         LcepG9qejAL7OmyJVM0igq9wDsk0JBiF9PytN23o+8rRfXT10ZZweI1QNOYY4mBOQfQj
         rbVopqT4uRdSDxtbueE5nk0xyhpTcqXvvak6N/GvAMZ4lUbGlEKZ1zkzU5lPtRIicU0c
         /yBDUjQhF4xvP8TV6ExOyQD16vNZvOLO9CFrbw1EFq3aU3KmODwLsct1rO/dJkpMGmr8
         1w1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778783234; x=1779388034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Xh19LyQF10UTWKq1me0fwm+mh43ExASMESLfzu7G68=;
        b=qy9+6G76FYcyjwYR8Bjxj4YiV1UPPPkM3YohhaS+qKznC/whvmKiQ19yOKlYEtHwCI
         iSdhGnjx+W147KdUXpVLicxjgR32mk3OO5y+NxPqriQKhS2lbgx8uc+LnNzd09ovEB+X
         lFGURQniqDjYQqxaYKHFb0MuI4GWMAcjr1gVUkDJtCOv4mCRu5XN0plfmpokhTj1gzy5
         TRkHAWyWhg0ZH4WSp300ADRJ+ywyK6P0e6jlAmc4qvbzK+jkm0xP6SkPORxc64xTdVEQ
         efgTYLVdtxS80BRTS0RE3B3mt4igW1/nHm/rTFPDApk+8BEClBdXTzD+jb2ypVB+QHq3
         rZ/g==
X-Forwarded-Encrypted: i=1; AFNElJ+7u4+sEazoqDcuUjgHfGhiZ29XPqaijb+l54J5N1AWgCfxtbSQBQHIgCUfi4kFHBe9Tg7j4lqAVvxT@vger.kernel.org
X-Gm-Message-State: AOJu0YyL/4QiKffpWl8kEGCk4xb/fuXxvFatkZefnh2wJb6IRfXAk0LA
	YvMYM7sjYiv4es5NC7kRVEUdTHas1/sTRfiToisDclZKBKZjpMhMpS5Lg6LTvEb5X+/3B/yxR1C
	PI7s1ORmFMtBonGYZbE0NC1zNNnmmUhM=
X-Gm-Gg: Acq92OGaFhw8BJtwSGIPgrAUq/7veNP3cqpdchcmkN25oNwitGxfiJ7yMC8dG4ghh3u
	/EmfyI3Vh9R0rAdQv/19hv6QFHvncZ82G93yVQwwAIsF2jbcBxlpcHysqPVxS0gEG734tDSXPfU
	VmzAL9uy+BmO0cnbOZZrwqgcAy+75oJ09RXOIbeeq9A2c1Cc2H38JZOdrWYkRLMdRCb3IWk4UCW
	9k3KLXBB+z+dQMqnVEJp9CeTqlNsmZ/kW8Q6TP6UAtJlzGisKo6s9USn6B5+N6OEOLJewtjlGQy
	2RO8SsO3Wnr3bo5HL10BBkZHCZC8uW7Zk7leOHETrBgCktU98aseQOC9WOSvfZrAR4mPNC5mQTM
	qzm4=
X-Received: by 2002:a2e:b8d6:0:b0:393:fcd7:5f69 with SMTP id
 38308e7fff4ca-39561fa5c00mr481851fa.17.1778783234209; Thu, 14 May 2026
 11:27:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514-icna35xx-v2-0-45acd1dfa566@gmail.com>
 <20260514-icna35xx-v2-1-45acd1dfa566@gmail.com> <20260514-ambush-salvation-ce6616190390@spud>
 <CALHNRZ8ukiSM2+uj+Qg6rVbUjjFeo88HQjLZsFHbHBs_GTy_1Q@mail.gmail.com> <20260514-accompany-expiring-c90c6af5f7a9@spud>
In-Reply-To: <20260514-accompany-expiring-c90c6af5f7a9@spud>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 14 May 2026 13:27:02 -0500
X-Gm-Features: AVHnY4KadKJWIbrmQIWY9oV52j-lGH3-yJCkf7ITOkZqzHwuTXiKriwXdalEiD0
Message-ID: <CALHNRZ_qBwobaf=nX0i-CwnKexf_PnucEoctFk4Ec913YwDzNA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Add Chipone ICNA 35xx
 OLED driver bindings
To: Conor Dooley <conor@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 1:23=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Thu, May 14, 2026 at 01:20:57PM -0500, Aaron Kling wrote:
> > On Thu, May 14, 2026 at 1:07=E2=80=AFPM Conor Dooley <conor@kernel.org>=
 wrote:
> > >
> > > On Thu, May 14, 2026 at 12:24:49PM -0500, Aaron Kling via B4 Relay wr=
ote:
> > > > From: Aaron Kling <webgeek1234@gmail.com>
> > > >
> > > > The Chipone ICNA35xx series of DDICs are high refresh, low power
> > > > MIPI-DSI drivers for OLED panels. The icna3512 is used by the Ayn O=
din 2
> > > > Portal and the icna3520 is used by the Ayn Thor top panel and the A=
yn
> > > > Odin 3.
> > > >
> > > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > > ---
> > > >  .../bindings/display/panel/chipone,icna35xx.yaml   | 79 ++++++++++=
++++++++++++
> > > >  1 file changed, 79 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/panel/chipon=
e,icna35xx.yaml b/Documentation/devicetree/bindings/display/panel/chipone,i=
cna35xx.yaml
> > > > new file mode 100644
> > > > index 00000000000000..6464d8d0cf86d5
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/display/panel/chipone,icna3=
5xx.yaml
> > >
> > > Filename matching a compatible please.
> >
> > Does this require splitting / duplicating the files for each ddic, or
> > can one be arbitrarily picked and the other stay with it?
>
> Pick an arbitrary one. Maybe which one is older?

Alright. I'm going to assume, perhaps unsafely, that the lower number is ol=
der.
>
> > > > @@ -0,0 +1,79 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/display/panel/chipone,icna35xx.=
yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Chipone ICNA35xx display drivers
> > > > +
> > > > +maintainers:
> > > > +  - Neil Armstrong <neil.armstrong@linaro.org>
> > > > +
> > > > +description:
> > > > +  The Chipone ICNA35xx are a series of DDICs connected
> > > > +  using a MIPI-DSI video interface.
> > > > +
> > > > +allOf:
> > > > +  - $ref: panel-common.yaml#
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    oneOf:
> > > > +      - items:
> > > > +          - enum:
> > > > +              - ayaneo,pocketds-panel-top
> > > > +              - ayntec,odin2portal-panel
> > > > +          - const: chipone,icna3512
> > > > +
> > > > +      - items:
> > > > +          - enum:
> > > > +              - ayntec,odin3-panel
> > > > +              - ayntec,thor-panel-top
> > > > +          - const: chipone,icna3520
> > >
> > > Commit message should state why these ddics are not compatible with o=
ne
> > > another.
> >
> > Ack. Short version: some of the mipi vendor commands don't match.
> >
> > > Rest of this seems okay.
> > >
> > > pw-bot: changes-requested
> > >
> > > Thanks,
> > > Conor.
> >
> > Aaron
