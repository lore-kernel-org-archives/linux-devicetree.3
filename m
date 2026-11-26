Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706200;
	b=G7kstYqJywcYqfeboKJUhXL9ZSC3xjOdp9G61HQNPwntVLIeLfnMIml+6wQwggYBeLb0
	 bcMDfV2t2UxfRz2Kg7KBPrvnrbnPgGCvHA5QC0lu2uIy0uI4gSFrvZ/bsLl2LJx85tsY1
	 hqsA5pJIqYSyGD7JSDdJrj5ZUC9G+8iVbJnqbylFW5ohgCdzr6RbreTQC29PRXRQ4kGaj
	 jVy7PH8x+M058Mwfs9uJKMyC16vqCxF5UdrixprWc3hrkYmPYWAeNlkJiOxQBIYRneKHw
	 zVl94K0yVygwhsDTGem8wj/Kkv084rTG8TRJzmsWxg2+/sxv2BfnCOoWJEI6SgiNoDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706200;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=WDWtYTY+sZC5hAzfWj0mR/RLleEqjywV+f/SNH7uucw=;
	b=2PzC3l2EPzHjvhOsXLMH5PxmPgN+sRiEUFvJzI+WAahA5LBB/Gm/sbYDzTjmvR+MaPs0
	 xESEnNKSqoL02YKZSBUVG4hXP5Vnkfkb9IZEskDNXAlaMIs61GwB4EuOf2a5KSkhO5VpS
	 60M0uCr6n91B2YG3KoC0LsTMHmKj9GKBjPt0gaKr/CllM1AQ2hEtkb8o0DQ/2UUIYNmNt
	 S1hqgU3GeJ9dOo44VsjNF5EPNbhDDMJ2c7GJC3P0ADMIFB/Z6jHwHC1ZVwFNLYzJvKOCK
	 sTMOpqpGw4gxETkT6fSEDlOJO7BI3KapLoJLvmLNwZp/CNYh+D7EW5ZD+rWfZIXI0CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=sPbktIvx;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=r5V3Ldqs;
	arc=none smtp.remote-ip=202.12.124.151
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3184606A337
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 15:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3184606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=sPbktIvx;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=r5V3Ldqs
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 48BA31D00496
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:16:39 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Thu, 26 Nov 2026 10:16:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795706196;
	 x=1795792596; bh=WDWtYTY+sZC5hAzfWj0mR/RLleEqjywV+f/SNH7uucw=; b=
	sPbktIvxDtOqcw7H/tr2TNoZUK5Ijs9pzCwhSY6nDk1JGI0bp6wepk8yVuftErQC
	w1pW5UZnzegbBlyJjKat7LOqDEp0CnplSCyd+u8DIkRDKb3o6xh1P2c5DCw8wKNa
	nfZ0t1Z6S3Nvb9R2aS47io63z+sfHY3doNvFf3KIpBztqyj44L7Y/jhjVaKjul+X
	ev/vu7g4G0MgCNCV4aao+yx04Q0HRcU0XEhrRZU2x57qD0aH4osAXC6diDJYas5B
	wI0afY1cIV70XS0DzmHGqL1p5bKsME3EzuVHKCvGrXpdG1pP6G1FqvExnqAoSRZS
	CcH+wA+l+WGEz+eEpE3u0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795706196; x=
	1795792596; bh=WDWtYTY+sZC5hAzfWj0mR/RLleEqjywV+f/SNH7uucw=; b=r
	5V3Ldqsix/gj40w4xEFU1JuOV7yNH3N5p0j2iVB4lW+EjeqgkkNCQ+ssDgkG7qlj
	MKDvGJwxugvUXEbVT4kU74ebMPvNE7UpuUH1r2BIuk2M970WIlt22p/h2Rf/TSw7
	VgWt9bU6ykCHeH5yg+67Sd4YWF5sNTTXTPDS18OG3S1HSOAAHhsHCEmvYPFYQV5H
	Mr6gd7B0VE9Prp/Wzieh391efoOUBVRJaHkUfHS4AjAF12bBD6044akhv08ik7Qh
	p4yVd18Uwy/oCV0r0sHSL9DlGfju1j0ed8vAzP8XB5DSPEOx9BFo43g1a5uyPABX
	3fCBq17YA4iCeDXcA6Qbw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795706196; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmQrcmVuZXNhc0ByYWduYXRlY2guc2U+;
	rt=PGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnPg==;
	s=fm2:rsa-sha256:XWgUebA76Je/YiSnKBxwSLMuAvrnz//IIHSfLdhIixtuf0W
	vsuwSEgxGtiz9kWZrSq+QQCBOSkcInYbkUiM3oDTXR0eWQ4BdhNT2KW1dXuksqFH
	bb/Clvm4mBo7xcEGzifvEJKw1EW5SHew//PsDVUgRbssbW9ayduoAXh6vxzV6WBR
	x7AoBtw8to9Cw3/rLIdxy7F0wxXXf/j/XN+SzGnZbKiEhWHbtPH1IrNUhS0ztjsw
	n6421GMx2wjT6sl9O4TI2JmWUnBEXIE1yYTeL5tegQpIMP317QvpWuy51B0Zk4TH
	IN0lUEOQmxthSlT8E4vUwMpGjq4Qwf48/eWvYgg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:puB6BJRTkKE6hebjx/Q3Mz4EncRdrPP7ESpTb3Q0sQk=:C2N8E0UtXfgUBIHQ6mWE+kP053kdV3LEr3Z3sqCjAsI=;
X-ME-Sender: <xms:VE0Ia2sfEfLd7bQrQiLmQhz1HulANV7A2G681fdUsvmv65IQP1pWXw>
    <xme:VE0Ia0MeUdHzK0T6GqQOAcSyfPjsL_tZ9IJhYfW2lu_CBa2Jt6YqMeX9QbeVPNzDc
    tFr0rDIOeIjYCmHG6TSaCn3wETm_bOS5oVa4QApCblMYBqotMeu-yAH>
X-ME-Received: <xmr:VE0Iawc0HUuGSz1_l2UD5FCULb0YUlxLn2ikDHij8tSR4d39BCI7L9bO9FthSYyRleKZfbAzNfkpOMRVmRWGkSjxA5q234Q>
X-ME-Proxy-Cause: dmFkZTFKLbr2QDBgNKAiPMruT937wjzgJs24dooozejAZvBRUGS7W+wH2deW9gjJy3HaTa
    H0hvCSm0TiSBFGNCFfIn7NyqC0jbxjNtkRHnfwmtw18pQS/qEX/SNNCbixcihvM+i5nK9I
    4oXoD4RAZi7KEA5VTdfu6IlcbZXkD/J94/bqVEGy14HGfOU6Cmc81KlBpLAmB9wtT9X30o
    mcCeaKM8N3aGs7CwM/SAL0DVvxymZFbV1NRx1ekVIkWmrmN7eDPKj+KXjr4EutfCePP42t
    IZMz6ZyVq1BvWvZPsuI6TNOprCqCoo3ABsHaSIeZA1j1D/IAJ7tujyCyIZbg6IEIb0onDs
    IeMZiMas37GafKXoZHOjT7wh0P43Ezz71iHx3IszYGqmBWavDNEW/J9l0pxbPrX6W8l9N4
    GypXwlBxf6WAKoE8PwDr5JNSfbb4J//I4TnpeeV2k9ThuUOWaBRSIhTeVbTZmYylBFRByA
    sQIZAxw6HVLlxpQrzjdZqPgeV6LPtcXSXiBXu7TEoX2wjjvr2XNh8bMGYhR7ZfpW0bDwEq
    MctmeEj9PYfeGg5qujsmAB7Qx51isJTsGrnu4o9ybUw1E35xQM94v4n+qk2LAnUlCvOU6b
    nt0YlUXrbmvdq4eBvmA4ykT+IR0rQbLxP/V1sAYYrdVS8fqEHPoFmD1xPUkw
X-ME-Proxy: <xmx:VE0IazkIvKLfjOFtqa8p40ufg-gkqzFAYmeWVoTlAkDDwkqoGwXB4w>
    <xmx:VE0Ia6x1tdcTV3E6HIl83bTgvY5tvXaFgkerwKOqJKVC2g5jcUus7A>
    <xmx:VE0Ia-NYgoYl2pQTmG-5CmLFMTqZVHysccu5OV4q1_vy8ZylJpctBw>
    <xmx:VE0IazjURUI6AIsMi3VLVLU7HYd8YEJTCYc6Z0hGo90Nj6WDBJPnrw>
    <xmx:VE0Iazkr76K452i61iwLw2lNuYF7hABlHa_G8POHYuJk0gJPLY__pYJD>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Nov 2026 10:16:35 -0500 (EST)
Date: Thu, 26 Nov 2026 16:16:33 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"DavidS. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Sergey Shtylyov <sergei.shtylyov@gmail.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v8 3/3] arm64: dts: renesas: r8a779g0: Add gPTP
 node
Message-ID: <20261126151633.GO3898744@ragnatech.se>
References: <20261110080727.2377040-1-niklas.soderlund+renesas@ragnatech.se>
 <20261110080727.2377040-4-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWpZfsaJOcTEBCugyDgKDXNRje68n59OrGFx-0hJXG+4Q@mail.gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWpZfsaJOcTEBCugyDgKDXNRje68n59OrGFx-0hJXG+4Q@mail.gmail.com>

Hi Geert,

Thanks for your feedback.

On 2026-11-26 14:33:17 +0100, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Tue, 10 Nov 2026 at 09:10, Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > The gPTP module is shared between the RAVB and RTSN Ethernet devices on
> > the SoC.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thanks for your patch!
> 
> > --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> > @@ -606,6 +606,15 @@ mfis: system-controller@e6260000 {
> >                         status = "disabled";
> >                 };
> >
> > +               gptp: ptp@e6449000 {
> > +                       compatible = "renesas,r8a779g0-gptp", "renesas,rcar-gen4-gptp";
> > +                       reg = <0 0xe6449000 0 0x500>;
> 
> Can you please remind me again where I can find this base address in
> the documentation?

It's very well hidden. The gPTP device itself is only described in the 
attached files to the datasheet, but it does not describe how it is 
wired into the V4H.

For the longest time I assumed each RAVB (and RTSN/RSWITCH) had its own 
gPTP device as it where on Gen3. I got feedback from Renesas this is not 
the case and there is only a single device on Gen4 which is shared 
between all users. That is RTSN and RAVB on V4H and RWSITCH and RAVB on 
S4. To make it even more fun the gPTP device uses the same clock and 
reset as RTSN on V4H and RSWITCH on S4.

I got final confirmation of the address itself from the address map in 
002_R-CarV4H_Address_Map_D_r1p30.xlsx.

> The size looks too small to me, though, as there are registers at offsets
> 0x500 - 0x788.

You are correct, it should be 0x1000. I will send a new version in a few 
days in case you have feedback from the question above.

> 
> > +                       clocks = <&cpg CPG_MOD 2723>;
> > +                       power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> > +                       resets = <&cpg 2723>;
> > +                       status = "disabled";
> > +               };
> > +
> >                 tsn0: ethernet@e6460000 {
> >                         compatible = "renesas,r8a779g0-ethertsn", "renesas,rcar-gen4-ethertsn";
> >                         reg = <0 0xe6460000 0 0x7000>,
> 
> The rest LGTM, the bindings don't descripe the two gPTP interrupts,
> so they cannot be added to the DTS yet.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Kind Regards,
Niklas Söderlund
