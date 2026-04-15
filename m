Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9413346A5
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776244871; cv=pass; b=DedD8kxRa9CG/N2mFlDfxNjdtEop8yq9dmTjq+0RRMhRQzDTvdYTAuouNBRoY0BlOWKeFsQVxN03/WoH3pZ/lBF5N+zBHhme26JN3QRrvq+D5LDta8Z5l75YLstjcO7cLR/f59dbZ40+xNIwEk/bs0RXJF3tshwk2lhnPPcTn5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776244871; c=relaxed/simple;
	bh=qXu//z6Xo5LnFnJscSgw4DtwEHHHbw3ufbT2XnJFOVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JWpRBSZS98PIoZMsxOnlKywOVMC0Mxn7pJpp8TaxC1znR0zfHSUcbD7ZCL19q36ixFA/58oDlca6cDoz4+FDy1vHI9BXwvVL2UOmO1PGOJBwQnikvedqgmqUjd86dbsKonD4DkR5j/h9iz1IN0md/gWt249RswLBQPAVFwzjE04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MtzMfdf2; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MtzMfdf2"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ab232cc803so33046705ad.3
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 02:21:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776244869; cv=none;
        d=google.com; s=arc-20240605;
        b=jUQJmnBUqN9vsSHHfV5IHdAH5gVJ6nNR20WOgy+WjnEpT173KE+z5RgD7WqGLNRgZp
         HRyHNpbjFVnjR3fZvIAwYEpxtCQxfUuHpVzdOLZRBiSri5fPrRjQLLz6jYxhCITet3hi
         jqN55aNUdSyHxXT0vjeDaPUJM/9D9bfX0fWY6p5S82RUDWKrkJkY5te8m+ai1EwnqY9r
         K8QXbUCQS1zCeJx+vTq2pSnZMKv3jRyVseLPR25vQfMBW5Ajd9Z2/rCgOacnX6QgiviS
         h/0ZM+iMU/n/OfEwJFB660L7HeAH6NcKH5/rHFHZNQkXygekc82nCA0S6ds/FPJdccI/
         74Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pQY0av5WRVLImZfpNXr1TJM3eiP7oWFORfN6hvmChm4=;
        fh=XFp4uVT82uDns46QbDD4DPLA93tWlbi5wsIRiCZbaGQ=;
        b=PN1b1FRnqukR8vJIkBUCJYeawcO3GyayxBxMwlD2H+mvpszl4Cy3Kw25fvNwNbGne9
         UltV4/VV7gORsvq5HoYHodB64bSXWNQrJfkSFI1GOeOqkGIsvi0nu+sJ00sGumhBzgyZ
         Vr6eMuLNzxCiXULY/YAC/+gXW+QkU1QBwssp5HthvtR3C++YWKTIBC4VwuxI4E6y5I4b
         nCUcF9dd0ltrfBSDNkZEWUokFh+BlLQ/Cz6UPTtGXXjl8A64M5SXtISF+QcaIeyZi6J7
         r2LMFMkTuK4XT9eLGqp0xVnvThAptRBprLU4Tkc2HORRTSKX2Gt68HLbdH0AY9WaSSrN
         W3/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776244869; x=1776849669; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pQY0av5WRVLImZfpNXr1TJM3eiP7oWFORfN6hvmChm4=;
        b=MtzMfdf2VAvfDeqNyD5OLJUjMw35uvScAhno0ouNZ7l4zup6rBXOneFGvrckCDgE9M
         Qy0Q5dxCF+Ver4cOPei83bBple1qS6yDiX/Ya9s0N0Uf4xscpTwOkazFgfmqQdlYq8n8
         TVNZZ+2YGSABFm/E2hAjGn9SGBHA5agwWuBaQsg+0p7nMHi7nVoGLK+ixiC3T7s481R7
         htKGMEBqxDdbdHx//YxnmXIuPgNw89eq3fuKcLLDCNjGlZLyRfggIuHRpD0OYWXVgurp
         cgsOOK+cogrVJhMesZA/m2I5KKrUeYCry1aFm9+RCobcHNUaAduu/IBHGNXtj61nFxo4
         6b0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776244869; x=1776849669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pQY0av5WRVLImZfpNXr1TJM3eiP7oWFORfN6hvmChm4=;
        b=q03W6uk7rJb+qovjIFxru0VGDknfAjifwTy4LDSC4T18jOkY44WMUvGCzsBL+iVlIs
         SfUZDxz+T8aihPQIaqg0Q4EWrgOpePxkc/d9i8oCao8TMDFH/7rLmb31J5yio2e6dycO
         nsj6b4d76zcHLlFgJW66pg7BpYvbgCRaiK6BC8STzGfrrL5Tzv4iCtrCk5WK4hXOBpFY
         IHMgx4iWhiYFysluFDzFIcD2rauyEg4fjpMrLX++AgZEUr8Xy96S42Tu5DFH7iGq734n
         oOtvIt4LX9uhRS3ThWeX8LiiaYW2aUKnhQN8XXeuDHI9tQjxQWod7ov4cUbTCi/QDXyL
         ll7g==
X-Forwarded-Encrypted: i=1; AFNElJ82TplNkDxdjGzZhW6t6pzJD6fpvXO+d7dxXpCEtdZgEl4OFz57SvYyQY8lfziEoq5YmPxjAWQGAsqZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/k1kVRBerEvEFG991YncQD8n6nG9PFQ49phniv2E0j9po+JaM
	ibNgrs06p25+giWsAR9gS5WK1h9WWgW+/qzbbREZG3nB9vImeKmGA6gfjzT5BqGT9obHOwiQ/B1
	6dzMbGfHBLnAFeZTEX7cxm7uep1vhAIw=
X-Gm-Gg: AeBDiet9M30RscX+p2Z15t3/cHK1hUiWjV0c3QVE6ImguF1jmUWR/a04xmNCb42D5XA
	yDIgTjz1/npFUxY9LthUCGMQBGp1B1r6o0lw0xCernNpebdZ96MrO70eBPYuPDfxTE09GBl4rsN
	7TGOSN2gHwX8dalxMNeP78LbbAQQxwY3nFkaudlgHuhBiCF6bzIeztVKzgKo+A+4vhkwL35m/LH
	+qm5aJ4LiKNz5sY+wJ2WPsiWhmZ2JystMEsO/FETbhHke/f4RRbd2L7QYrj4xKBoKkQZZT1mJWM
	vXuk9WvLqvbhHemKwxqDQ88e+l743/eapbM25hseEgu75HlY
X-Received: by 2002:a17:903:144e:b0:2b2:58c7:2ce1 with SMTP id
 d9443c01a7336-2b2d5a7773emr209666405ad.36.1776244868799; Wed, 15 Apr 2026
 02:21:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-4-phucduc.bui@gmail.com>
 <87se8ypeq1.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87se8ypeq1.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 15 Apr 2026 16:20:56 +0700
X-Gm-Features: AQROBzAXSd3qJJschZNpIapnadex0hZxdzsnez-28xKExmnIGX3RLVbWSqVsXBg
Message-ID: <CAABR9nGB0u-Y7ddGtu0DmZXUiEWTVrXQy7DhTkLgkSBvFjNyJA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] ASoC: renesas: fsi: Fix trigger stop ordering
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

> This patch should appearing much earlier.
Thanks for your guidance.
I will reorder the patch series to place this fix earlier in the sequence.

Best regards,
Phuc

On Tue, Apr 14, 2026 at 7:28=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi
>
> > From: bui duc phuc <phucduc.bui@gmail.com>
> >
> > Reorder calls to execute fsi_stream_stop() before fsi_hw_shutdown().
> > This ensures that all register accesses are completed before the clock =
is
> > disabled, preventing the system hang observed on r8a7740.
> >
> > Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> > ---
>
> This patch should appearing much earlier.
>
> >  sound/soc/renesas/fsi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> > index 109e06b5f32d..9df3e91ac79c 100644
> > --- a/sound/soc/renesas/fsi.c
> > +++ b/sound/soc/renesas/fsi.c
> > @@ -1606,9 +1606,9 @@ static int fsi_dai_trigger(struct snd_pcm_substre=
am *substream, int cmd,
> >                       ret =3D fsi_stream_transfer(io);
> >               break;
> >       case SNDRV_PCM_TRIGGER_STOP:
> > +             fsi_stream_stop(fsi, io);
> >               if (!ret)
> >                       ret =3D fsi_hw_shutdown(fsi, dai->dev);
> > -             fsi_stream_stop(fsi, io);
> >               fsi_stream_quit(fsi, io);
> >               break;
> >       }
> > --
> > 2.43.0
> >
