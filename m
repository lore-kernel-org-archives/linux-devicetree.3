Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EEC412BF8
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 21:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791410349; cv=pass; b=gHoiW5mZTrXjxNpdNuqBjWEvTkRJP30DxU3056Wjriyk0N81RhbS5r9pIHTmdnla310FJx9LuTWjNHGk8+QKIRKh5DeFwC5RGFXBThOiRRlcpdPa6hfnhOcEJ33ra49dx+RSRyLYWZpvAEcUySaRvd/lKpGn3AvLOPu2aCgSjuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791410349; c=relaxed/simple;
	bh=NdpHyiQEK20ZJUkrXWW8lkNpvrkh/Tq1SrhZFgg2dxc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VGlqh0R/ZnLD1UHljtT/jGAZwB6zZRfXAUajr5QJo1GIGJ7C0q0Lth2O+u6wtWHw0UTX3FJkOY22G1Q796qM0HANuhX3iy3bp8rq9DXLhUpCQ2qdGy0WVIei6v4DbnpZ6NqlsLf5I2ryJfJ4rdoq5CJ17qB1AGih1o2rFiuGoso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=K6F154/d; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="K6F154/d"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c3156e7705cso515578666b.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 14:59:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791410346; cv=none;
        d=google.com; s=arc-20260327;
        b=HHAFnXKYEFnz8+nmgdjtihXPy1IQR5lRJuTZpjysGgI4G9RWSo6ao8PtDBMjZ2R2Hx
         RlCrBU7o0T2BybmrxgbMH9D00vQnue/791FVc0kXwYBVmOi/9chEJ37Cqrd1w+Tyv7dy
         v+U6kX05reUrndV3p0M9lB2sVydqTNk2BWIxmeJv4U4FdIFfM1a4Le53RyRXeSS9kBrG
         YNYpw5xxI5a5ZVNdaaAlKWVoS4xifzD35M/hiRB5+I/OK2pQ31TbUVjNWRh1RqLYDQ0Z
         tIUoNnupMke/zOt1uF2PLu6j7L4pTLGjzaxt6GM8Plk/05d8Ju0afdpfiG/Qa+lAiK43
         m12A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gTupLQqOTwq3jH2ZB+au6HoSAz3uNI5sbJCpfgUjYak=;
        fh=p0EaJIqI9i00KuQnlcGj7S5qhR+PDQtvwSZByZz4ysQ=;
        b=Ac9aRiALMEMp9glXeda1GWyC8e9MeB13vwHPjSdEb6NRyXE+LklTxEJl1eTI1/mz6o
         wOK1Hd1eyZLnyfUc7YAV170evkbzi6r+KeOxItsifGzFW5Yji41bEahYnbjc7huxicFD
         dk6aowlS9b3rm2AgkQF9jR8IFUmMUJZZj6AIQEuooj394uxTqp/fLX75un+ORsxTOugo
         ofuurKaCLldUcjDlUf+duHNOn2/6XyH3ZFNsysbjD+LGKKRxiXu6vw8u1hQF6wxQ4CeE
         GV3aVGgirRws0f3IpE2w9kL5oBoPDpxogo1Yy/cuze7gO6e05Ws6vocZyKhG9HVii8QP
         6BXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1791410346; x=1792015146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gTupLQqOTwq3jH2ZB+au6HoSAz3uNI5sbJCpfgUjYak=;
        b=K6F154/dH/kooP5BOsLg7rgu5qE8VoRb28+/aNuZpnEpw0lM1KSAQ6DkMWyNBHhEBf
         GZiW3IXZiWIpy/9qc4fuQM9n6MYZOmoMwQfpuDAxHuK2TNEqPSREmOJLUmO2ogrXj4JF
         DBtXCu3VhHpX4my6zYmFxJoBIYF2ACGxya8FTbfXZXgwgnirO0jMxTexip47BCNPnEP+
         Zi48FERJjhw7AwGZiBiim+6gbFznxH62uAn/YWu+kZfOgReSSI9kEAIHxpdoXygZQOyO
         P8oEfpCyzpEcGmgGCUFgmqkFXwtEh73CDjcjL0K3QpdfGETYlQTCGTm3Fa8edo9RpZ0i
         ishA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791410346; x=1792015146;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gTupLQqOTwq3jH2ZB+au6HoSAz3uNI5sbJCpfgUjYak=;
        b=se718kPK4IxnotKCPcjiSIq8fTG2ovEzA/nM3kDSmaz1ESdPXJIpLjxN9XOPnP6P47
         s5BHKgym4k3OIl5fRRMp9YeDRp6iQlkithq99dmVJ4eXhHwPgulp5/YLeaZcaHYhdMPT
         N7fRiXzuT8r3NTJs/vSLIyoVuQ0CIFn9dryzSIDEcDniCjhA+AviZ+WXVbxnbJajS6cG
         hqTTQS+/UjAQc0Fq0SdMaUFxDPfOmDsT0syV71k6pLBSpanpXa8FYvPZzTJiv9SPIETL
         CCMgzm/SuR6hDGgB493/sUMNFH8X4eQmNrTqpiJmhTyQbGn9DLy77xsJCpZH+39Jz5Nb
         IZpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwThrNEh30InQNggBxU9R1Iwej9Q5Xzfiytw4BlaZ5vQMu0xs6TdlbVWaVh8nqJGhNIctL+0sz4jGUO@vger.kernel.org
X-Gm-Message-State: AFuF++nLyGC450gAW1D7bygcg53MUGjc/UHB0iRUVMosZJ9/20WnD3I7
	b+eCB9o4vxsvZ0c1WdDPnhOa6wj81AsYL5gwV0udEryEILRe4zdXM+EfZ0/iFU0MHupyQTqEim/
	25CNVYKlPxZiJtqzXIBlDFdaeIlrbUBa2ARKCBD1aSw==
X-Gm-Gg: AYBFou1Arh265MXaJ1Cg/xSHWywaiJGIwQIzP1g6uJfKsbqyM0whXCEc2bOJoLhzXnI
	zeXcP4qmyT6B1HbRGggIq6sFDWcy9E4hxpgU8t4jY7Pg7Pc4kFD0NqV4ZOs2SLOXEpr4Pjju2F3
	a681Iq0MeCPRHXm1HIA6dv1l+ZMfmsheDaSjdS83+Ze0cF5ldUw18aqF/icgDxQc7tMh5aQdI16
	8heFyhS3TkPYt2k5ReybxxW+HwlXSbmSpRc2LfdIhnVbZpUW+oK/twDN9pkDukx478wEaKkvR15
	tuObxsz+aYYON8/UU49O9HVKleiF9jC/3acMlY2E/GntyUkG9cR1bDC3KNKX4h4XIGg=
X-Received: by 2002:a17:907:3d52:b0:c2e:7daa:23e2 with SMTP id
 a640c23a62f3a-c317c18cedbmr350164566b.48.1791410345894; Wed, 07 Oct 2026
 14:59:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-b4-rk3576-reboot-mode-v3-0-6edba064693b@flipper.net>
 <20261006-b4-rk3576-reboot-mode-v3-2-6edba064693b@flipper.net> <20261007212432.GA381404-robh@kernel.org>
In-Reply-To: <20261007212432.GA381404-robh@kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 8 Oct 2026 01:58:55 +0400
X-Gm-Features: AclHuK9YQekpwAgg-J06h9HjpyEEerPcos0qnPQI7GTm7jMZgcXE5m4c13MgYQo
Message-ID: <CAKTNdwFo03jFGMeJQpxXp1yOX+cG+6BZOYf1eGGZTdZWAFdz5A@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: power: reset: syscon-reboot-mode:
 allow supplies
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Sebastian Reichel <sre@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 1:24=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Oct 06, 2026 at 08:02:40PM +0400, Alexey Charkov wrote:
> > Whatever program that acts on a reboot mode runs before a full OS, so i=
t
> > may lack the capability to enable the regulators it depends on, and a
> > reset that preserves the mode register generally leaves the regulators =
as
> > the previously running system left them.
> >
> > Allow a reboot mode node to name such supplies, so that they can be
> > turned on while the mode is being requested.
> >
> > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> > ---
> >  .../devicetree/bindings/power/reset/syscon-reboot-mode.yaml       | 8 =
++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/power/reset/syscon-reboo=
t-mode.yaml b/Documentation/devicetree/bindings/power/reset/syscon-reboot-m=
ode.yaml
> > index 79ffc78b23ea..5ed70c87269e 100644
> > --- a/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.=
yaml
> > +++ b/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.=
yaml
> > @@ -36,6 +36,14 @@ patternProperties:
> >    "^mode-.*$":
> >      maxItems: 1
> >
> > +  "^[a-z0-9]+(-[a-z0-9]+)*-supply$":
> > +    description:
> > +      Supply that has to be powered for whatever program acts on the m=
ode.
> > +      That could be a boot ROM with no access to regulators, and a war=
m reset
> > +      leaves them as the previously running system left them and not n=
ecessarily
> > +      what their expected out-of-reboot state is. Any supply described=
 here is
> > +      enabled when a mode is requested, and stays enabled.
>
> Sorry, but no. If we allow this, then what next? clocks? power-domains?
> GPIO lines? The list is endless. Maybe if a not generic binding is used,
> but still pretty much pure configuration.

These are the resources which are required to handle the reboot mode
request, they are not exactly configuration. There is a limited and
hardware defined number of IP blocks which need to be powered for the
reboot mode request to complete successfully. In my case (Rockchip
RK3576), these are the IPs that need to be made aware of the trained
DDR memory parameters: if they are unpowered _at warm reboot_ then the
boot process stalls immediately with an exception (cold reboot is
handled by the power-on default state of the PMIC).

I see that this may be abused to hack around what should be a
bootloader's job, so it would be great to find a way to explicitly
limit the scope of these - though I couldn't think of one yet. Any
suggestions would be much appreciated.

Best regards,
Alexey
