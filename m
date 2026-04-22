Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F393D347C6
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 08:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776845493; cv=pass; b=uWhtTXD+5srnRORKazARs8Br/ByYb9zi0SxZ31xagpDQGpmmM0I6ujXx/aamXeZ7wpC2o1KPH4oBs9Gf5TJWuiOQlHHgxZWN1JvEPDy/WbOoLL4z0FOUHwRgXnnj0CJFA/MDEV95//8RwdkpEnhhUBpAY9G8SERIWbZ04buxscY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776845493; c=relaxed/simple;
	bh=Uj2dfvAmdvVsmr9BwtADebPDycT+EnGzdroVrjGKN3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YWs9LrG3RsRAvzu1ixVgSKBnBB7M9l4HxsKTOhFpiK40L1aplu6DQA5858w5cVyUXlzZ7X5mPeDGf+/8UP9OcYBcgq+p4BAVw7q16kUWY8E+kKUcbO1jDRberWhSAKSrZmmJ2T99gV70W7Ri1ylC0O4DNbfZFmTbbXGW4gGmLJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=8HNOcSpd; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="8HNOcSpd"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bab8ae52954so13746766b.1
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 01:11:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776845490; cv=none;
        d=google.com; s=arc-20240605;
        b=Q7TXmoK5kNfn1y2pFJaCPrcDEs+6/kbZJu8bsvIbzoAaHqD1CWYtdAvX14YTnZAvc9
         ORAN8wiTCDTlWzhFWX6NFRP1cAH8SREm0aTS7FJKK1moF9jUf+lEIyokMJ0p1qqPw6o3
         QImeEkC18QrOuQCHrqTha2cpJPVru79ALf3Ol5F8dPj+zEU7mBCU7aSpBkrEZuyv8ihK
         kgy0id9rTUBgJaEX1yyGvaTZ5BGrjBY59Yq5P+s9ahlsclCOId0s9vVP17msm2B4SbnG
         adB7pDhu5eH/JHpGgDuVgXwIrviTOdg9GELSedlcNOrUksZ3ixiz5+EIKG+Zy6kJXcUg
         ykOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kHhSfVuYhrjw/BhaVzSyk6LT5DFSKZyqA2uUtt4y784=;
        fh=jjDpQ9yhr4lvPabVx4Z4Y44p+pI0atI3VFwnMSBmPAI=;
        b=bwT+FRtFxP4YuItulb1ABmYfyhiXYNhjGnCFrHaSMctVKUJtdBW/mNmAgF/zcJc+Xe
         aWugCUCBqOxO7EyIYmmYxv5lIMIqQhz02xQo62gcqR3lMYJW7CEo+c3duxgtrAXSTsSN
         x85ezjWXut0sSbJtqF2qLk46bpSK3e2jynj2SVpz05Wj/77bsLz1iT1e/eIsm9giwUHT
         t/m346ULcNf3ogLJfppyrWCJu3Jxl4WQ8y9sgYULq8JUcDQM4qw5Xo5bCUywWeeu9C3h
         uUflcjGD/BL6Cw/e1rUiErZEb15MSwAUYiR7pJBJ2bTmiagxAf8fJeH8Qu0OKhhICwi4
         EIAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1776845490; x=1777450290; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHhSfVuYhrjw/BhaVzSyk6LT5DFSKZyqA2uUtt4y784=;
        b=8HNOcSpd+uE1Hs3uQUf7Pv9qppyedmlMdMpLRPz/vPuI98xOba3O1kxO8f5iu/NJXA
         ixg4sLV/7s9cZp/WY/HpWGAiL6kIeeBF1nHKmSKSrsNIkJ+aOoAzDVqLFaMidmiURV9e
         HGtKhi4xpPPZu+CJaBPDUthL5cn7gRxB+pHYvkZ66eLMgUStVe8TFVQklPzdP84y349n
         QnHRWJDiBWZF3GjaqQZ31k/OB1lxAAyb4fp/jVij+dZAHWArEdfDfYUZDN5eeHXy/IDW
         HBFWwPPIWQffjWXg5jqO3lxZIpeoBxKSNq/YqQ0rSXGPJAaJ5ur32L1COSF3YSbYZNxR
         dJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776845490; x=1777450290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kHhSfVuYhrjw/BhaVzSyk6LT5DFSKZyqA2uUtt4y784=;
        b=o9kd5PqtOJwK6RDz5z3RaZfZoBSQbf7x9ufhSR20CP8GZ07/T4saQ0z5Pxf+HZSBPQ
         Ja2itU8ZpMh8W1/ai/E2ulcGfXsw2+7toJqkmpIKGie7LhQ+woTezdgQGCokf77IM48M
         mJ4AvIwdKGXABDp08E6cLKCWR0UGXhGnLgrs+3E0Iv0AsR431Dinyhzm5DNVqZ5iUriJ
         9MX3kLBDdzVGWo2wdRJ5eqCKSsIi5qeV4G9VUeD4Ifqk/zZYR79l91oSV0hWo2OFceeg
         qdnG2xmOdxTSpga5mBrew5CIYfQjdEEKAjaq/rb1z4f8BaljPVHh53IJ44x4eABU+2YC
         iovQ==
X-Forwarded-Encrypted: i=1; AFNElJ9umbCkdtlUKw2/QHVy7dAvfHgcgU9hbn4jecAgPRKXys5P/Do814jY4tT++L0JYAl+6SieXB0Gt6gY@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe3wtRkakXw6hpQPIHG0dPnY/62+HIwI/PfrIyb5Po96VrBOGI
	ijyUVEQqjlHvgdSQnOHyrA0cArSxc4OzCVqEwepYF1JT8maps4erlUB//Of/cqJz/hIXJoiiZdf
	OFc4kpBsXKPc8CfLK/Qp8FAOy90NzsIw28B5oy0svkQ==
X-Gm-Gg: AeBDievDL7vC7Zx2Mz8QhY1aI+1A2o+aryQhPcdX7t+5HN38Rn/RggnCaUkzF5RwI49
	x3ujf59HW5NEevdXcevgsPbMtclTlxX3AWnliE7ky9eVOl859CJyYEcIud8OSRzDLgG5YJXd+sX
	YMWyIEdcrL38zz8eQOpMPCnQ9OEwf07XBpzSOd8naoVfjihldFwGk5MiAaMqqmKK1qz7D3BRHCL
	rlQIlUrzt4nC7T2WrFMWDpMnQwJLXnyFIAsVA7wjqPUKTQgndn5gIY3BcC7MObDR8cQQUJMKf2F
	EA2FcknysXlQLe97hA==
X-Received: by 2002:a17:907:cc01:b0:ba2:5226:95f8 with SMTP id
 a640c23a62f3a-ba41aa1611fmr746041966b.23.1776845490067; Wed, 22 Apr 2026
 01:11:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260417-rk3576-dclk-v1-0-26a9d0dcb2de@flipper.net>
 <aeKtNf8CCAWduI-f@venus> <aeZOMnZfBcBHzR8c@redhat.com> <20260421-quirky-tough-robin-817a1c@houat>
In-Reply-To: <20260421-quirky-tough-robin-817a1c@houat>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 22 Apr 2026 12:11:21 +0400
X-Gm-Features: AQROBzBMDLMpArAbO6yUVTJdEOlFOlX7S11D2R-MG4mKqqwVH-2tRc5cksKPqqI
Message-ID: <CAKTNdwHcN8w1_12Zd-2Xp90GEDLvwd8Q6XxTdS12QBbCZuUk5Q@mail.gmail.com>
Subject: Re: [PATCH RFC 0/4] arm64: rockchip: The hunt for exact pixel clocks
 on RK3576
To: Maxime Ripard <mripard@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Pavel Zhovner <pavel@flipper.net>, Andy Yan <andy.yan@rock-chips.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sebastian, Brian, Maxime,

Thanks a lot for your inputs!

On Tue, Apr 21, 2026 at 8:10=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> Hi Brian, Alexey,
>
> On Mon, Apr 20, 2026 at 12:02:58PM -0400, Brian Masney wrote:
> > On Sat, Apr 18, 2026 at 12:24:57AM +0200, Sebastian Reichel wrote:
> > > On Fri, Apr 17, 2026 at 07:11:43PM +0400, Alexey Charkov wrote:
> > > > Dear all,
> > > >
> > > > Need the help of the collective wisdom of the community.
> > > >
> > > > The problem I'm trying to solve is reliably obtaining the exact pix=
el
> > > > clock for arbitrary display modes supported by the RK3576 SoC.
> > > >
> > > > Rockchip RK3576 has three display output processors VP0~VP2, each
> > > > supporting different ranges of display modes, roughly as follows:
> > > > - VP0: 4K 120Hz
> > > > - VP1: 2.5k 60Hz
> > > > - VP2: 1080p 60Hz
>
> Do any of those have an additional multiplier or divider after the PLL?
>
> I'm asking because 4k@120Hz is 1188MHz, and 1080p@60Hz is 148.5 (so 1188
> / 8). 2.5k @ 60 might be a bit more problematic, but my point is that
> for HDMI/DP, most resolutions all have a pixel clock that are multiples
> of 148.5MHz.
>
> If you manage to get the PLL to the highest you need (1188MHz), and then
> apply dividers, you don't need to change the PLL frequency anymore.

Yes, each of them has an (integer-only) divider between the PLL and
the respective mux. The problem though is that displays' EDIDs want
modes that are all over the place and don't seem to converge to any
common numbers generally (it looks like display manufacturers haven't
heard of VESA modes these days).

Following Heiko's nudge from the other sub-thread (thanks for the
pointers Heiko!), I derived the fractional PLL parameters for the
modes which couldn't be obtained cleanly from existing PLL values. It
ended up being 35(!) different rates for just the 7 displays my
colleagues and I could get our hands on, majority of which only
representable with the fractional delta-sigma component. That's after
consolidating the clocks which can be driven from the same
higher-frequency PLL configuration with small integer dividers. Seeing
all of that I couldn't help but think, "Surely those should be
possible to consolidate further by allowing for some error margin!" -
but had to guess again. Even a deviation as small as 0.2% of the
effective clock from the requested rate causes blank screens in my
sample - sometimes less than that.

This further leads me to believe that Brian's rate negotiation series
won't save me here, as the chances of two different displays at two
different weird modes magically agreeing on a PLL rate that is a
common multiple of their respective pixel clocks seem infinitesimal.
And their modes will most likely differ, as VP outputs are asymmetric.
Unless of course everything is 1920x1080@60 with a standard 148.5 MHz
pixel clock or its integer multiple - then the problem doesn't exist,
as this particular mode works even in the current configuration on all
VPs.

> > > > Each one obviously needs a pixel clock. The required frequencies fo=
r the
> > > > pixel clocks vary greatly depending on the display mode, and need t=
o be
> > > > matched within a tight tolerance, or else many displays will refuse=
 to
> > > > work. E.g. the preferred (maximum) display mode out of VP1 is parti=
cularly
> > > > awkward, because it requires a pixel clock of 248.88 MHz, which can=
not
> > > > be obtained using integer dividers from its default clock source (G=
PLL
> > > > at 1188 MHz), and the nearest approximation is 237.6 MHz, which is =
well
> > > > outside the tolerance of e.g. DP specification, resulting in a blan=
k
> > > > screen on most displays by default.
> > > >
> > > > The clock sources are of course configurable, in particular there a=
re muxes
> > > > connected to each VP for selecting the source of the pixel clock:
> > > > - Each VP can take the clock either from the (single!) HDMI PHY or =
from
> > > >   its dedicated dclk_vpX_src mux
> > > > - The dclk_vpX_src mux can select the clock from a number of system=
 PLLs
> > > >   (GPLL, CPLL, VPLL, BPLL, LPLL)
> > > >
> > > > While the system PLLs can be configured to output a wide range of
> > > > frequencies, they are shared between many system components. E.g. o=
n the
> > > > current mainline kernel on one of my RK3576 boards I've got the fol=
lowing:
> > > > GPLL: 1188 MHz, enable count 20
> > > > CPLL: 1000 MHz, enable count 17
> > > > VPLL: 594 MHz, enable count 0 (yaay!)
> > > > BPLL, LPLL: 816 MHz, enable count 0 (but these last ones don't have
> > > >             predividers, so are less flexible)
> > > >
> > > > So ultimately there is exactly one free fractional PLL (VPLL) which=
 can be
> > > > used to generate arbitrary pixel clocks, but we have up to three co=
nsumers
> > > > trying to drive different display modes from it (e.g. HDMI on VP0, =
DP on
> > > > VP1 and MIPI DSI on VP2). We also want to be able to adjust the PLL=
 output
> > > > frequency on the fly to satisfy the requirements of the selected di=
splay
> > > > mode.
> > > >
> > > > And this is where I'm stuck. Trying to satisfy the requirements of =
up to
> > > > three consumers while changing the PLL frequency on the fly sounds =
like
> > > > a poorly tractable mathematical problem (is it 3-SAT?). We can take=
 the
> > > > HDMI output out of the equation, because it can be driven from the =
HDMI
> > > > PHY (which is capable of arbitrary rates) instead of the mux, but t=
hat
> > > > makes the decision of which dclk source to use for a VP block depen=
dent on
> > > > which downstream consumer is connected to it (HDMI vs. something el=
se).
> > >
> > > It becomes more messy: The HDMI PHY cannot be used as clock source
> > > for modes exceeding 4K@60Hz.

Thanks for the pointer! I've checked, and indeed it automatically
switches to the PHY clock for anything below 600 MHz.

This is in fact a notable improvement, because then only a handful of
higher-rate modes out of my modest sample need a dedicated PLL for the
VP0+HDMI setup: specifically, 3840x2160@160 (1478740 kHz),
3840x2160@144 (1275830 kHz), 3840x2160@119.88 (1186813 kHz - this one
might work with 1188000 if CCF allows returning higher-than-requested
effective rates) and 2560x1440@165.08 (645000 kHz).

3840x2160@120 can be driven from the current GPLL, as it's exactly 1188 MHz=
.

The configuration / policy to enable that transparently for the user
seems non-trivial though:
- If the output is HDMI and the display clock is <=3D600 MHz, always
source it from HDMI PHY (easy)
- Otherwise, if the display clock is 1188 MHz or its integer quotient,
always source it from GPLL, and disallow parent rate changes
- Otherwise, reparent to any active PLL whose current rate is an
integer multiple of the required display clock, and disallow parent
rate changes
- Otherwise, see if VPLL is free. If it is, reparent to it and request
its rate change to the required display clock (or its integer
multiple)
- Otherwise, tell the user the mode set failed (and let them retry
with a different mode, or own the pieces)

I'd love to learn if the above (or anything close) is representable in
the kernel, although I suspect it's not:
- Allowing or disallowing parent rate changes depends on the selected
parent here, while in the current clock implementation it's an
attribute of the child
- All PLLs are equal, but one (VPLL) is more equal than the others by
the virtue of being free more often, and also having the required
delta-sigma component
- Reparenting to an already running PLL if its rate permits should be
preferred to monopolizing the VPLL

> > > > Even then we somehow need two devices to cooperate in picking a PLL
> > > > frequency that satisfies the requirements of both of them, and chan=
ge to it
> > > > without display corruption. I'm not even sure if the CCF has mechan=
isms
> > > > for that?..
>
> It's not *just* the CCF though. You will disrupt the other, already
> active display, which might affect the user because the screen will
> blank, throw off the vblank timings and thus userspace, etc.

Indeed. Changing the rate of a PLL while it's in use sounds scary,
even if a solution for the rate exists and can be found in reasonable
time.

> Brian's solution is great progress on that front already, but if you can
> just save yourself the trouble, I'd advise you to do that instead :)

I'd love to, but it seems that displays won't let me :-D

It might be helpful to pre-filter the allowed display modes to only
offer those which can be derived from the currently available PLL
frequencies. The problem is that it makes an extremely limited subset
on real-world displays.

Best regards,
Alexey
