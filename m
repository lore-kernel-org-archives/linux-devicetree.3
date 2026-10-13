Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81362538D94
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 18:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791917828; cv=pass; b=pY65DEEAVXQ14jYFzESSJIAp6RsiUZGeEO3YtoiQUSWDVV9ayy8XLbL1isNP/3dZ0wqGzpsWylPhDGsyIyMX05gsKaggZWmsp/fcVbqOBXYXlQuwtaSTJSBOY3KrLjR6NHH2N3CMAlOgLYBsfp/hmH3XabYbn1MG3FB0WW4yKqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791917828; c=relaxed/simple;
	bh=UdFnEN23ZFL6cWSBzWu9juvqVYubuE8e4CCZuSkb0f4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fFOobwtgevbv4nRX35pHVpKKSNNmK8FvQcqQNuxTFLOZgE3jtLAXg0g78KvnyvBFXt9XRG/tN/jXK0ARVawkEBsB87NbaXJIL/kNPEqeE83Q55dH9GpxYt9uvYEJQGi5x60en9u4axRdFjnUVn2Svjx/Htugu+MO/HnpklRNOW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bBL5Szn7; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bBL5Szn7"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso1739660eec.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:57:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791917826; cv=none;
        d=google.com; s=arc-20260327;
        b=S0oiYtoqn+G827uMH8eOeRIMWBkLRUAYZXkZPOLdcVUB9PcC/YZ4u7NuUw34nDFogj
         L4cDcot2MFASAi/Yt1mvqN+0NjDJx9zxFjbY5OlTPfJi+d63MSN9JtPvSyt/t6roxEKJ
         FgqmAzXiibbMuHonBugTsiXeLLcdKKckcJqXj7HxNoqyQKttWplvZreclH5UxIs9JQNr
         ZGxD4W9cdc3x0HKj+s1jgNipdOaVLuZK6qY2I8+L+Q9VSBcna8OPodMBHSsIU4SZP4iF
         KtS7EoAueRpDoFHToiwoFsVl/fX8WX3yMOyx27ObsTZ3fHNeXFShkoFR97tyUPLoT5M2
         VAfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UdFnEN23ZFL6cWSBzWu9juvqVYubuE8e4CCZuSkb0f4=;
        fh=iso1q5kv7/J9+G4DJ+phgVCzhMMRdI3sSnvkaijbQoQ=;
        b=q83hlNECpDHF+0kv+Kl5os8qsOY5Ym/8MjfIgjLYb87QPKU6MEB1HQBwASiq91CrR+
         6v5WPFmDhWMGqIm1DiSmqQpm7hOVpanfhTPGpwE4oqdoJKoni1DAocu+9WgO2hCSAavt
         g3zUZUGZO7n+uOI3IpT1QrAWwaQFqnATZ+Txvjb6EGqtHxH7bsoP7xjHIEkgr27+EhmP
         awagxWBL/ool56zVYEzMsRiX2IxpbMzHclzBHE580/cc15BZgmba53owxWMXb/mCkehp
         BLgdE2v8/p/Y3vObMGLuAy5QunvYNxnlxnJHb5Y2GhFndkUv2lFfPG0FSsLch+mt4mSx
         Ub5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791917826; x=1792522626; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UdFnEN23ZFL6cWSBzWu9juvqVYubuE8e4CCZuSkb0f4=;
        b=bBL5Szn7TWVoKFg1ZYDGMX2S/a0MgumDzIFdDyQpxAs25psBPG0ZpCZWBgkBvBQr4Y
         CXHmK0Mh5onjNJcbIcWiHOX3XmMne77LVtqpWVRgPxN9447+o3CQWnfAYoeD3mV6zxSA
         R3l55ZMKDANO+UxoNZhuGox4tim/UAH/crJU1lyRm4nZYq7LnJC2UA4PZ77zM4nde2m1
         Vbg9ur2OeUs+WdPVOeBdnKq0UNq0U3suZqDgKtJy0l7COIwgAVjMxcLU/2Vd0VbJ7EEF
         FeKXBEgpTNGbVGJXW81G5XI1sZt51FVZNhw/A+cRXKX7w8W2fbY4w+jt9axpnYxumRLC
         hRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791917826; x=1792522626;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UdFnEN23ZFL6cWSBzWu9juvqVYubuE8e4CCZuSkb0f4=;
        b=B1tBcyHBC5b3suZy5jS9yFT9O0JL2Lg6GVe9BirAMmVGwhVocRcV2puHfieOf/4fCo
         tgM4GoZD/qb2SvjGOmtbrIU2HBkF9uqYYndaZgpYxJvwIH4ejgVVYr07dwqxPzBMuxXh
         thvgB4c2m0vSuExDIx+zYuDQkW2FRfjs8/6CdgXKLkbTFQTEBDV2EDKwbWDyZ0uKyg97
         PCsWlP2HWmrTjC1LrmE7dHf0XjsJOgkgBuGxbBSYhnh7gOfMTZT4D4ijdOvh2/lkpbFa
         y4cayMErCkKTPo2gxY5kE3I6lBAcVx2TYa4BNvOO/FIAbfeQ0IxftzWjj0/GWbmtKC0q
         6MLg==
X-Forwarded-Encrypted: i=1; AKwUvByx9pX1vduywkXQUcAtIIALuBvePpO7kLzpMxVLs38UexIGtHOubL9FwoQoW6qL8cGA7mJb3LBKQgBP@vger.kernel.org
X-Gm-Message-State: AFq9FYLNI0hktEPfbQ5HPAoE3D+I7s04sYlk1r86sJbH5OlprOJWVrE7
	dwD5rQDkviTxNPEXhIuGpW0gP+VsuDKrdD27YKQgIiza/a2YdaPpqBUvrzK/K6zNzJlljNPpM9Z
	NFFW2Iksi2uT5oVZlCzy3U8BC52wyABw=
X-Gm-Gg: AYBFou1BYRihpAkcoSwjPpoK9r8uBbkf50QY3rD9/gzjmP5cjIP7s2mxCwNS0mvVuPi
	S1vzzWPoiQ96ZJy5s+PGuWeQMd2zjVyEmVfByZN71QgM9EMTqm13f4KoX3vUwxy2A3fHgDNjs71
	dl4ikTHhQlAE0muu5Yy+FPpRapR3GN/xwnVodvfd2onHGzaHPsz7qWtlTEJSJRSKMpunnsbVcUh
	pjVDRxdGXs7/4sA7tWGEGM2PVwcqg5Tqqf44CoNEdu5JCXp/MVkl5IPu/Kt/3KzhUuN8r7DoBXr
	nDoS1ZlOLbycIF+WwlByW6LaEAFdh1en1BK0tlBmRhheRi41LPsFBTMYHIsGYi2J9Md7VXMllQP
	faTk64dDIudqN
X-Received: by 2002:a05:7300:de49:b0:35b:b3fa:40f7 with SMTP id
 5a478bee46e88-35bb3fa4218mr5269925eec.38.1791917826305; Tue, 13 Oct 2026
 11:57:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013184755.530392-1-clamor95@gmail.com> <ebfcdeef-d0dd-4c4a-87bf-4ef3fd505b5f@sirena.org.uk>
 <CAPVz0n2ZY1L=kwSkjLeTYNvDA2Gf0Oenetj8hK13g6+qf_xnaA@mail.gmail.com> <964527c4-0105-4bee-8fd2-a9020981b02f@sirena.org.uk>
In-Reply-To: <964527c4-0105-4bee-8fd2-a9020981b02f@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 13 Oct 2026 21:56:54 +0300
X-Gm-Features: AclHuK_S0QaqCFW5w4Kb_wTSLK_O9WStPmy1OozO53A1PmbZln0ct4QN1H7jeQg
Message-ID: <CAPVz0n1YdOHG70_ynqL0V1Q3=38USHCbCQc9EBzHAmrNb4eQnQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/2 RESEND] ASoC: codecs: Add support for Fortemedia
 FM34NE DSP
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 13 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 21:5=
5 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Oct 13, 2026 at 09:51:56PM +0300, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 13 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
21:49 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > > On Tue, Oct 13, 2026 at 09:47:51PM +0300, Svyatoslav Ryhel wrote:
>
> > > > The Fortemedia FM34NE is digital sound processing chip used for
> > > > active noise suppression mainly on ASUS Transformers.
>
> > > > Resending since previous attempt seems to be malformed.
>
> > > Please send a new version if you have rebased, tooling gets very
> > > confused about which v1 it's talking about.
>
> > I have not rebased, it seems that format-patch malformed first
> > iteration. Both patchsets are made from the same commits with same
> > hash.
>
> That sounds like a rebase to me, and in any case the same issue is going
> to apply - if you are not sending *identical* patches the tooling will
> get confused about what version it's looking at.

Noted, thanks.
