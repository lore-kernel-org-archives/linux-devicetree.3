Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BE8EEC0
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 18:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777140616; cv=pass; b=VMLvKKnkpNPM8Nl+rAsMHRyWyKAaiaJawez22UStj4WUmWycfdR3pU/nRBmeYnEKrx9AQVuOnk2F2cTukdGW+bzzdbXfX+dhQVO1B15XCOeaQKzFmHpZRjJ6pFt0ZDd0iJo0eLh/pE3ARVVNPXI4LRkm3WipZf8Pce7s7H9jCro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777140616; c=relaxed/simple;
	bh=VfmOtwx7JsyeKf2StfxC1lRU3maW5kQyjJpRElpNuW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LkvLqRSVfZ8SyLuAqp33J4aUeViC8Hf29WsIDzkAMf/LjgNXa+AWKgCQdILzzmv651jEmV5JoU3W5HFZcOAgaaHQdgtiCNEITRyB+hIobbGwWZK/RWa9eFTncnAtiWm+SXejDrwWGoKnStk7epHgB1pu6AwbG0sgIy7TC13WsBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=gilmore.net.au; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=crYkaYQg; arc=pass smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gilmore.net.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="crYkaYQg"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8a154cc6a48so98839056d6.0
        for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 11:10:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777140614; cv=none;
        d=google.com; s=arc-20240605;
        b=SlwtYk3vYmSQfnnphsMmwsidlTYc/oicDkAfgsGQbBSdTMvtAFKnU/C79VYyvGYeRY
         V3ikSr9GgWR5SWrJBleUb6kNUsUfsOhBuk86AAsFq+i7V5OhXzu1ifOxoPAs0L5V0rrl
         6tAz/ggHz2Z6DOmvjwsOmEnaCz4ZhwnDb8wJGb6yzGWKlDBipTRrMxYpWAwLYKYyWLlC
         z2cZg31c/hNVmVBShwZJrQbgHK9q0kpNAXmEB5pd0UIwYD62rv+uXVkPtvzLeaZ37L1N
         r8YLwbFk1G3VLlk9EP/GN1jF4TDNf8qQ1q8rrOENRp1beDgpsnedeeoEjqKpVlYb+PnR
         eKcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HcPTXTJmSyH/IMfXTVMA724OkR4f1Jn719XgrTAy0hs=;
        fh=p/7zn5hc4LedMmRQSOTCheAuNjZl6enqqzZUy3L/28Q=;
        b=VJKYqFnE914vgRl0XCPqstI/KpZYTTV4M5WF0pFquaJlEIT1dfjEab/lt6+wK+2xxM
         MGPq5+BejXXa1G96hq+DRA0TL5d5+V9sp/JLjDCMeijp016yN/cpi27lZctGYlg/nAwS
         TnW1i8AwdpmlNQsMT/k7vreZkoKOikLRtPTI0HMV0PvqarsqPAselX5nt2oDWiCXObNe
         bm9638GXXzEDvrjS5BHH9KRZbrsvJZ4agpYNYFOAaPsla77xVdBzUa+wVUssrm6B+6WW
         Vtx34JM2gTwqtWiOXoX57CEdM21miAAgRkR1ReH21vhDybymaAdmOKv5WKaDrvy9+6Xn
         lVNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1777140614; x=1777745414; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcPTXTJmSyH/IMfXTVMA724OkR4f1Jn719XgrTAy0hs=;
        b=crYkaYQguAs1jyq5KMJRwwPQXYuKf00CiUMRjwGKd2bKc/4dO6H9ka0F5bBrDCwPjw
         HA7Cwi/G+wVXs/jNyyNcMAlxf7hf5dSle1n16x5+suxtZ5wLOFl3BBix8J/1LdKWeC86
         DG8FCFUTFiBjzplKHofvm8ikPtuz/ydf4LEzQ4GjC+Q7sD6IVH6EgyD49t4rc81CTIWf
         zqQlcz86gncdy9g33fBgyWuBrlYHO35vJlwgOBwOVE8JOX0Ht5dnCahHx6YNAV/J9scu
         6aVKluuAY8ojGsdTlcp9+rgz3lUTxNHAF+StdoEiHrey822s3kVXshMhJa8gWYs2WAW5
         U7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777140614; x=1777745414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HcPTXTJmSyH/IMfXTVMA724OkR4f1Jn719XgrTAy0hs=;
        b=c7yng37+OpV165wWPZMI/ATBQ3d8Ufp/PXQfhVeT1gA1xS/2ML5Oge/r8HDCXO5Wx/
         sdRsG6dyDv58DZmz1jqgPepVONYIWqSFoYOx0ToFbuCqR6tSStc/6TVEzOmwNSazZfD6
         IFKKbrx8bQBRye01QzpaeTUeQUlH6EI/oa/JBQhHRTHun4DqWsrNV2PM7V+etny9iwhJ
         46LO6ouhQF2iNrWlkY/lzU32WkVObIgLVEdn1eT8vWBfAagHQ1jKi0fkupxyNKu7vav2
         ShqqiGRqyAlgR/N8FocjyZtGLnPNHe1GsgPkC1jOosvGsd83CI8yLEWBlVt6spfsTS6X
         UDMA==
X-Forwarded-Encrypted: i=1; AFNElJ+QEa91hluT10fmizvcEWNF6gZc8TUOcN+3Zp+uqR9I9N+QxaLjhDHfWkdKgxACW3WpJFlIwVc3cVMI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1FLQHskHRlc/hrWIgcre0XiLDcf8CIW7DmNXcfP3VC0EJx5fH
	sVFJTQOMpq/I1qf18XPCTtcb/rYakg8UmlIztkuhhOzWWIbWSGoC8IumgmGa8ZsRzOd6RS7ljBd
	YkQwQFgi98S8CAgLN+6ACxFI1qiqA8BMFYMmLOJlOU6PpuNFBuEGuP7OB8w==
X-Gm-Gg: AeBDievc2un0sj+ktWcXc9LlAlIjAmKN+O7amdomqWlaE6hASNZRSRtxyhG6K431v2r
	+X9jxAqymr1sX9XRxgQmRagcsXEoxcs+iiouAfj3xs1foZ3QZYhHuCFFXHLS5EEu7O6CN7T/j+N
	nLXA2UUfA6i3crXNzolYGOkOGuDOE6SJbJx4DL/q+o9Cp4EbIsRxdT94+LI6/NPWlIvbdO6XldL
	3C4BCohUsnF5mWVzGTs0fsNqMX0qfg0grPt61oD3tXZyYnZW9ytDrtvm0ooMUYbGTil4NIYQWOD
	XjZ/78Ko6zWGZbKaG2BgSSHEtqzPad81dhETbbCAvqDnVOhKrOYej0DXMUB8ygLaAaG7+azIEMM
	6pjT1
X-Received: by 2002:a05:6214:e85:b0:8b1:f069:3f67 with SMTP id
 6a1803df08f44-8b1f069473cmr348052086d6.27.1777140614077; Sat, 25 Apr 2026
 11:10:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260425031011.2529364-1-dennis@ausil.us> <20260425031011.2529364-4-dennis@ausil.us>
 <20260425112844.GB2964234@killaraus.ideasonboard.com> <45evt7lkzuykoqsc2z27hsvm7fasmn6sr6gbjtdnme54jauehf@dmvon2o5emzd>
In-Reply-To: <45evt7lkzuykoqsc2z27hsvm7fasmn6sr6gbjtdnme54jauehf@dmvon2o5emzd>
From: Dennis Gilmore <dennis@ausil.us>
Date: Sat, 25 Apr 2026 13:10:02 -0500
X-Gm-Features: AQROBzChrS7gVlPnev2Qw5PvTHOSVj5tSgsWsZxHd0olXAmf20o-DIbcxoWnR-Y
Message-ID: <CAABkxwt1=n=CnrVfCcw+EHjqjfsLkp67POk451fV8Gqw4vdnQw@mail.gmail.com>
Subject: Re: [PATCH v8 3/6] drm/bridge: simple: Add the Lontium LT8711UXD
 DP-to-HDMI bridge
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Heiko Stuebner <heiko@sntech.de>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Alexey Charkov <alchark@gmail.com>, devicetree@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 25, 2026 at 9:24=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, Apr 25, 2026 at 02:28:44PM +0300, Laurent Pinchart wrote:
> > Hi Dennis,
> >
> > Thank you for the patch.
> >
> > On Fri, Apr 24, 2026 at 10:10:08PM -0500, Dennis Gilmore wrote:
> > > The Lontium LT8711UXD is a high performance two lane Type-C/DP1.4
> > > to HDMI2.0 converter, designed to connect a USB Type-C source or
> > > a DP1.4 source to an HDMI2.0 sink.
> >
> > As far as I can tell, the LT8711UXD has an I2C control interface.
> > Shouldn't it be an I2C device ?
>
> From the datasheet:
>
> The device is capable of automatic operation which is
> enabled by an integrated microprocessor that uses an
> embedded SPI flash for firmware storage. System control
> is also available through the use of a dedicated
> configuration I2C slave interface.
>
> My guess was that it can either be an I2C device or it can function as a
> simple platdev with no I2C controls. Please correct me if my
> understanding was wrong.
>
> But now looking at the schematics, it seems to be connected to I2C6.
> Which means that it should be desribed (and bound) as such.

Hi Dmitry and Laurent,

While the schematic shows that it can use I2C and has been wired up,
it also shows that both MODE_SEL and I2C_ADDR have unpopulated 10k
resistors; as a result, MODE_SEL is connected directly to GND, putting
the bridge in autonomous mode. I confirmed this by running `i2cdetect
-r -y 6`, with the only device on the bus being the HYM8563 RTC at
0x51. Without reworking the board, the device is not directly
controllable and just runs autonomously.

Dennis

> >
> > > Signed-off-by: Dennis Gilmore <dennis@ausil.us>
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm=
/bridge/simple-bridge.c
> > > index 8aa31ca3c72d..42c1f3d5ba0c 100644
> > > --- a/drivers/gpu/drm/bridge/simple-bridge.c
> > > +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> > > @@ -270,6 +270,11 @@ static const struct of_device_id simple_bridge_m=
atch[] =3D {
> > >             .data =3D &(const struct simple_bridge_info) {
> > >                     .connector_type =3D DRM_MODE_CONNECTOR_HDMIA,
> > >             },
> > > +   }, {
> > > +           .compatible =3D "lontium,lt8711uxd",
> > > +           .data =3D &(const struct simple_bridge_info) {
> > > +                   .connector_type =3D DRM_MODE_CONNECTOR_HDMIA,
> > > +           },
> > >     }, {
> > >             .compatible =3D "parade,ps185hdm",
> > >             .data =3D &(const struct simple_bridge_info) {
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
>
> --
> With best wishes
> Dmitry
