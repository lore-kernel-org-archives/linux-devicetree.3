Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795545613;
	b=M20k+9Ntnm+8hq/3H6AU6J+Brw6iUsuDHp8NhVMabgBzNziT94eV1Ve4gOfYFath90EI
	 ROtdL8iRPBYmBAIeP0mF/LwJaJAtBATO0/EMZw723vwAn99SAYNPjLfP0OQelLbLxG6Cs
	 XAY5fnR3DsXJ1MREAb7VEpx5FVkpqEjjmkohZ1qXrVGgF0sf/7doo1BChcIIjFjtk9Q0b
	 vzwpfAKPb+yzTB0cyMiDSfcozLzjlr4V7RErDjVQubU6owQkv94kwl+AzxII0OMpY0car
	 J/v+f9bjMt/lwe8tsnQszgj2r/+c3yejpV1S8nLkqGAwakQW2jHkJ3mIqKxUTmLMKOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795545613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=3cr3soCs/aH4Auc5veUlCs6H08qDugqKnqtBUy6DKyY=;
	b=Nj0nytnKqOVw7ntDGoc60kJmvpkHaiGCpFor+68B+yAERfa75Ss2dYyM69+0NRoyBKlp
	 vrZIyIOvYyqpRqUwuDO+nHyXMFdIetxvljAVKckNSH3+1h7BW/L0NuUyUUiCd9zmh+bB/
	 YhEHkBpvd6qcSPAQFH2NHArXLXAXoAIJ4z0KWoCBpEpAcHT7TyC3m8+Ko9fZbO1ZbbDz3
	 p61n8G5pF0tRYJdw8hnwIiy9Ln+ra3Dhd9s9lBMGakRUsM234yrKQMBLd+6ceVWoik1lg
	 KaJfZqts877O5RW1xDjE8asQigUYb9jkCcekVrx7czvkakLVUqD58J34ZBbJzj40jQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=Vfv0YWxS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E08606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 18:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0E08606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=Vfv0YWxS
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b5e5e64494so2535507b3a.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:40:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795545612; cv=none;
        d=google.com; s=arc-20260327;
        b=ROE0Ec4A8pywGIDQReqt/wY/JyFtGDX5EnkHEW+aW92tY30xRf4O4BJRa0Q6pkH73g
         QDXRvYLaDHVWJXfIpeVNKX9xT84iC/3csKT1K5RQemFDebamoAMigCCGKkk+yccK4LsV
         qCVefp+Idk0PXF3D4Qo8zeY/3PG1dAW+bkB0VmJKjwWu8yXU4sKHhqWnvLI2iPM1Cfh9
         LZitb5HIySNaTIPv0gz3LNLU/q6WRkWSDOqy0GnTEiZCbnQgXxUZSJVorSgH5Bp0T50e
         kaAqsMvdUs8PKZLQ3PCNYhauKQp9wMQg166huGNHiGkDi1WZL/cKS+ajjhCDtQBUd8g/
         PXpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3cr3soCs/aH4Auc5veUlCs6H08qDugqKnqtBUy6DKyY=;
        fh=hN7xjkh0KUcJbCimAgLHKIRDHJkrtjjM2RMBYUdZgxI=;
        b=Qfsegn1Whh/V0oR8ATxR9gWMnjwkIYjyDpuuZvbeRPgC1xfyayyXUEJX7tt0ph+kUS
         yCINF3cYuLPTSKzFBL0OtfQGDqYWpeekoIdNqL73RYjpurShJ7MKsggUPF312CuaBROV
         TRLXfn3Emr+W8oDrmlXmzfhLsyNSKmv7nqG5zn7C2Anb91Csr3H3d6fs6vghvjRfd+bo
         A6kJ3+cCakJjjgkTv4uzywVRPX3eAd11/9RGfDqiWWlGv9nlCNXQT8sHb2W3DKi7QovZ
         HAtEulEeIoxkAk7zhYOTM4pIlEzKPCNHqC88Oiq8hDXvkWi5Qmvcku4K/wSFkd4NTyUZ
         sRdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1795545612; x=1796150412; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3cr3soCs/aH4Auc5veUlCs6H08qDugqKnqtBUy6DKyY=;
        b=Vfv0YWxSAxoP1AD3nQ+YQzFzO3EpWxRZbX1pQuOChuKfbzewP85iO1pEw97BDfn3jm
         vjpbtXC0YVI234XklnPCOtBFXdOxskhzU1fvy520UfdSyEvxE7VRjq4NgzgxzY+K1XhY
         a731bhTlCKkOqy3fZ5xznDV4yOmbiBtbYFPHXAVKrEf6+gYjx5sj5UDs4OuFQpogM7LS
         6cDAynXbGm6LnF6yorabsPUUT+fzshFwUdTNxoE/0EAIEM9Hi3gfAhl9FrJRectaLrsc
         G9qQA1dGU/+wCd3Y5f0zLjRhsMwbxUw74/x1cd5hJ+xpdV5S/tEjdO/Rs0ooyEfwmtzp
         DUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795545612; x=1796150412;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3cr3soCs/aH4Auc5veUlCs6H08qDugqKnqtBUy6DKyY=;
        b=2hlzJBOsEk6elSG4SbhvZCQF6M3R+KhpkTyGQF+Pcmsl4LrAjKjgzqrCrlk7DSnxfd
         8jHxkNMEG5Tgmf0XwYqH0LXzjorxdf+DjLaMniaU3yfTLTGW1jXtclM/a/lbfmccmtaU
         MnkXaZfH5RIaMuaal4lpJJjBrzK7KninMpvcad59mQMZ2KBSJsp4Ocrnfs8a1Q13cnF/
         AP8hF/n/3kEHsAOvMKeYYwrzL7yodS+mhAvtq5kBU6oslGHRpOGT1VVY+GKi6EsJaaxD
         39Ij+az0CfVWhrilJNNf8wbiCYmFWaJmSKWGvu6leWekkLA11LVZKpdEn1aLK4SuUrbZ
         H/Dg==
X-Forwarded-Encrypted: i=1; AL+hErG7Q58DQaGHBtyAnXeLS59YWwCGBhbNFM5hJaCNEFFB5DkewnQijUshVYZdGeJJL5SXZIFNB9dH/b+h@vger.kernel.org
X-Gm-Message-State: APuU4Z805VyLkeTh6GLF0e6e7JCKCYET1oNv2+gMuAlq+vmmMtzjQ8GE
	NZSg7gBhjZxk8B3eG2AGChdoIu/KZWt9uNGlpC4pS98LwSo/+Y3NN0mjYI39NCw5hlpKYSgx1Ir
	kLzjxLQiml4SmW7MmXnDM0pvMiSyj3i3evUsr7yGogA==
X-Gm-Gg: AZFdTZe4gzG3KC54n3H6I5FCr/llI3jlegO8y/O8595ztAglZVXrtTcyTSyePfjzwbz
	YbQzvQn25zRnIFNDjFAHa9R2O4LdYMLgP9iOuGMSbUH5ZB8EPugyeXZOrhb/HTggdVw7+Tpzl3S
	YYVZ/LVjvLbpxwlFPhXUsThYFF2rD7mJ8PctQ8Y0jPFgyRDr9If1YPLLGHSTRrLyFUNIb2lPR6W
	UNLmxb0AUUN9WWAS4AFO52bddnrqXzBVxmrfWasxxTCViJyW1XCnHJGM185DzFzDjpl1HUTrYp9
	+WdDrVEwfxjwMAomE+oOWrHgnVPMGjZBaj15oeEAozb/KZD2stfEwLwDvbGI8/Hcqf4h1UhD17H
	JFC/7LnDGTvFeBBhk/OPEFjWJahRxJC89RMbB
X-Received: by 2002:a05:6a21:3e04:b0:3d3:ae40:51e6 with SMTP id
 adf61e73a8af0-4014bb52da7mr14240670637.26.1795545611912; Tue, 24 Nov 2026
 10:40:11 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
 <20260714114414.184512-34-angelogioacchino.delregno@collabora.com>
 <CAPj87rO9saEC34+5NiYK8xyZiNytrVgOcszoY5uc7BpL=M4WTg@mail.gmail.com> <14a4f698-8739-45c6-8904-496ac61e73c9@collabora.com>
In-Reply-To: <14a4f698-8739-45c6-8904-496ac61e73c9@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 24 Nov 2026 18:40:00 +0000
X-Gm-Features: Aa3M54qIEgHVmsqq4DxWvUflQF2v_NEZOm-dewWZxD6n7rtVG1aK5-HIk_WFDp4
Message-ID: <CAPj87rPtL1nDrEF34LTmQDr9V4GbX0s8SR3wwwWWp4r0yQ2hag@mail.gmail.com>
Subject: Re: [PATCH v2 33/46] drm/mediatek: Add support for Display Controller
 exDMA component
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"

Hi there,

On Tue, 24 Nov 2026 at 15:01, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> On 11/24/26 15:28, Daniel Stone wrote:
> > On Tue, 14 Jul 2026 at 12:45, AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >> +       if (!pending->enable || pending->height == 0 || pending->width == 0 ||
> >> +           pending->x > OVL_EXDMA_MAX_SIZE || pending->y > OVL_EXDMA_MAX_SIZE) {
> >
> > Definitely don't do this please. If exdma is asked to do something it
> > can't (and I'm assuming that these last two checks are intended to be
> > on w/h rather than x/y?), then you need to reject that in
> > atomic_check. Getting here with pending->enable == true and then not
> > enabling it, is not OK.
>
> That was done because mediatek-drm isn't in the best shape, and atomic_check is too
> late for this check... adding support for those components is done on top of a big
> restructuring, which still is not complete, as the entire mediatek-drm driver can,
> and needs to, improve quite a bit.

Hmmm, too late? I don't quite follow - there is the layer_check()
which should presumably stop such a state from being generated within
atomic_check() - is there something I'm missing which means that this
couldn't work?

> > Relatedly, most of mtk_plane_pending_state should be deleted as
> > duplicative of drm_plane_state and it would be great to see a patch
> > series very soon to clean that up.
>
> Again, I agree mediatek-drm needs a rather big cleanup.
>
> Lately, upstream has been a bit slow in reviewing etc for many reasons, which is
> why this series has been there for months now (though things are getting unblocked
> lately at least for this specific series, so that's good).
>
> Anyway - let me see what I can do, but I can't make *big* promises - the only thing
> I can say is that further *big* cleanups/restructuring is something I can do in the
> next iteration (after the partial restructuring that is done in this series gets
> merged, but definitely not in this series) whenever I can find some time to.
>
> I'm all for making things perfect, but I only have two hands, unfortunately :-(

Sure, that makes sense. I think this series is already a really good
step in the right direction.

There's still a lot more to be done though: if I was looking at this
as a new driver, the state management alone would be a hard reject
until it was fixed. It looks like it was a pre-atomic driver with its
own state management, which then had an atomic implementation bolted
on in a way you wouldn't do it if you were starting from scratch, that
has then had three different hardware-programming mechanisms (shadow,
direct, and CMDQ/GCE) pushed into it.

I'm sure there could be more to be done with the vfunc forest and the
way all the components are modelled. I'm sure any specific 'why not do
it like this?' suggestions I would have would be very wrong in some
way, but as an exercise, sit down with someone who understands display
hardware and KMS drivers for half an hour. Start by spending 3-5
minutes explaining the MTK block & routing model to them, then go
directly to attempting to explain mtk_crtc_num_comp_planes(). A lot of
the questions and confusion that comes out of that would probably feed
into what a different design might look like.

Right now, it feels like the top-level DDP implementation is so
generic and flexible that it's extremely difficult to reason about and
think through, but then it's so abstract that we end up not being able
to use any of the hardware blocks in anything other than passthrough
mode, which is pretty much the worst of both worlds. Hopefully we can
come up with a better path forward that means we can support more
hardware and expose more of the functionality as a nice present for
next Christmas.

Cheers,
Daniel
