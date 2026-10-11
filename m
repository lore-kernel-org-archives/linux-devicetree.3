Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40593947B5
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 18:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791744676; cv=pass; b=bJrulWFRL3J16PkjM3Wzd16+G39i7UbqYca9BB94eEm2E9/J5nypo/30OQhZwumZ24NSr/X8yp3Y3jbnMY8VJ+J229hpgk642ct9gxCQBHl5VN05T/QEjqF06/cPSLIuUqizymq+aEbLZrBu3wB8ES7Cn0t85TMBMWwUs0nV8tA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791744676; c=relaxed/simple;
	bh=0KIupU1PlUnI74kbeA9rKFTjXf0bMD2fNsbxeKLKsfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rKGoE2bQCAO8IvdSOmCcTyFH3wdC7H31CPSfY8zmoA65rXri3IQ+Qd4w8LHCPe6xLEe0r1WobkpYllwOhU65zosQwBDmBgngZZAkO49o/m5+X1Q0DDZBxJL06cSMKDhyqXBrIQC7/7oD0AlEaNQ3/NNpi6WqYXLePJzZEvTx9bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X9yfGSA1; arc=pass smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X9yfGSA1"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6de2f213b7aso479707eaf.0
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 11:51:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791744674; cv=none;
        d=google.com; s=arc-20260327;
        b=lU6cySk7Hlz2X5M/xEjMeTgZZ7fhqv9n9VcxsE4vlAe/EwsStHfvIdmLQqW30/40l6
         tkKyI5XX6zeLuYZTCSM7+1Ti7gDwvpJUqLwiw17/3DYPYiYmyOGXpch+fXnC0WBD2BmL
         iD5C+Q43gA3CGnmsPlFb4JLdOfq/tLHySjIP5rYC/30IitpZEfcQ2bBWeL3CVenkeiij
         T9Ec9HwAUJzLTglsZM68h9vFHlKKwzCHfpxI416T64KJWtYKLfs1ngiuGk6AawXxgHcE
         O4wPxH4dBf/Kx28OZ2JsSrHrUuLuGCvjWRHlOb9MgXG/WHPnQoELxKsaCx7L33FYwww2
         8dmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0KIupU1PlUnI74kbeA9rKFTjXf0bMD2fNsbxeKLKsfA=;
        fh=nTJoDiioTteUIcV9YlITzJF2mjRn9q4FF0PXXe+280Y=;
        b=KuuvyiiUTZ7gJueLGqaJeYK3+Wk2IVO9gn6UUaKMYASXcvOd7zY5eulLd39Q6azwve
         7O6dHPuogysGMpTIkhziqMp+GNJE3Qt8DSpaHw+t196Z6xqHDP1Pm7WWUNKfmz9de795
         HVzpDn6VIsXxBYLQDhwsRckqlJ92TQ1xE1Y8wsB7GQcdMlu7ORD2Wwd0hgJqwfpXIi9b
         76OpVP0Jt7LjHr/3SIH82e9xfGMk8hJ987fBET7xgqhKTMm5zqh9eQJ0L1cvao6H7Q+n
         fR4MkK1EbYWoKUgvyCzCi4gGIs+vt0H7jIJWq2KuO4NnXGWqvt84ax7ATR7eH/sUXD4A
         FO6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791744673; x=1792349473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0KIupU1PlUnI74kbeA9rKFTjXf0bMD2fNsbxeKLKsfA=;
        b=X9yfGSA13kZZ9ayF0TSz9TDeu2nxFa6Fhd2ijAHPG/Rop32kbcH82HpWMXr3Z981BG
         vuVzB+0sXqfNBAlN5wvuQm95LxER9Q028TgcGeIuAXBmAPbXFW2ji9NLYVvJ+IOG6vUk
         zv/vh5pjOTwcXheADfGCSwbHPu4+3CjLSON6XW9uUsB5EW4XCb9epAatW9Jmctv+pSBW
         D2CFeFPP0rDW5ya9aKOqEJK1bx41nrM8UHRBme3CFQKRfrs8YR/ujn46Xjng3VlN0DPz
         P31cqZo1G5cHRn3uaMI9yRdeTzMDS71Y1/iPRtnUsfIxgGE75yHNNuYsE2GfZIvmw8Sj
         Dckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791744673; x=1792349473;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0KIupU1PlUnI74kbeA9rKFTjXf0bMD2fNsbxeKLKsfA=;
        b=I8aakLyApJcxRhWGCbX6lSRELvEtbZ4OHYUDXECPJwDJyP/7kEpPsEMC8yVN4k/jZq
         NZh8hqMyJf+jJlZYyeGnhs3aIMR7zajCEvba2Zb8YJ7xz+RGHKpZHjNPvoBnduAOVg89
         MdPc3WdatlN2DW/nEEfFWPhiz56iExO6SEWwZzSoAkQee1w3n5Vih03ODPb2Lk4qIaJf
         PXht6/rcV7WLTnyBNRl4l5P93vs5U+geDKM08SLHURTcX+PIWsxE1FV/slpTudlNUJTv
         6cd/09bOH/t46l8sT4qfHuajNEjv+yF12dLM77duw0H0fj/QqNRXqmMQChpN+ikSi7SG
         vyhg==
X-Forwarded-Encrypted: i=1; AKwUvBwI5JBQcZ2g0MDdMz+39/KgRws3yYsrC0NgAMDcqdpE9ZkOzROot5/svC7p6ei95IxvgI7VmjrLGufv@vger.kernel.org
X-Gm-Message-State: AFq9FYIyHS4ByPJ8XhZn39jrD+oezdbkLt1R+Wv5uFOXayDASuZwkhvb
	Ezj5aIgv+ROQjvzOsd/IjLNuE+eSGJcaiAB1TBQ3HYtshXb690XWWHpFZWsN0rVV3rMrOWcWW+i
	v+IQykyQglG9aEiu+vhXlIUQahII14oY=
X-Gm-Gg: AYBFou1IjcTo+6EmeB6FhynSl1pgVwWpA014JF0V/LQNc1HaBCG3SEMlQ5DG+swN6sw
	RguYKmKuGN9U0tSoaT2E18igob+zGo0bpzs4qMlnKtAZw5rzcafFbrHp6B5QVTmxJFNXOWbmxI8
	voEE5kM99jDmDKm3e8XqTO42WrK+7hvtVlW6TedF2oJpWGprHGZtUjbKmBfQU8l1Ers5xUg/q0t
	/rsyVmlonE3+ccfsYuUrkBZ5lM2x2b3JDkq4z1YruQsnFRPe9TguBKwQJfHSPSyf0Oi1sCXpMe6
	uIDC07lYcKZWyTY6BrxDY2vzRofsINZpNRGdZN5Ds0RcfZlDzxQNmfc=
X-Received: by 2002:a05:6870:e311:b0:47d:a12f:3951 with SMTP id
 586e51a60fabf-4a2a89f425bmr6103374fac.39.1791744673650; Sun, 11 Oct 2026
 11:51:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-6572-gce-v2-0-412a5b037290@protonmail.com>
 <20260907-6572-gce-v2-2-412a5b037290@protonmail.com> <39494ea2-7fb5-4414-8560-47ddd40260cf@collabora.com>
In-Reply-To: <39494ea2-7fb5-4414-8560-47ddd40260cf@collabora.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 13:51:01 -0500
X-Gm-Features: AclHuK96ynSq9uLesTtRAZnhZ7wj24Xtpvp969Wwe99Ul08jW1tzra27V2b0o08
Message-ID: <CABb+yY3oEfZrx+=igTVUOSGB1+J-pa6=k=+DGOxWozJnK_sJgQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] soc: mediatek: cmdq-helper: add legacy GCE ISA support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: rva333@protonmail.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Houlong Wei <houlong.wei@mediatek.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 4:57=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On 9/7/26 20:03, Roman Vivchar via B4 Relay wrote:
> > From: Roman Vivchar <rva333@protonmail.com>
> >
> > Some SoCs, such as mt6572, have different WRITE and POLL instruction
> > encoding. Instead of 16-bit offset and 8-bit subsystem ID, old GCEs hav=
e
> > 22-bit offset and 2-bit subsystem ID.
> >
> > Extend cmdq_instruction struct with additional union and struct to hold
> > the legacy format of instruction encoding. Add legacy_isa to select
> > legacy GCE ISA when writing instruction. Finally, add special handing
> > for legacy_isa cases.
> >
> > Also correct comment about PA writes, because it's incorrect for legacy
> > ISA. Only v2 (mt8167, 8173) and v3 (mt8168, 6768, 6779, 6785, etc) have
> > GPRs and SPRs for PA writes.
> >
> > While mt6572 GCE supports 22-bit offsets, the parameter type for offset
> > remains 16 bit, because all mt6572 GCE mmsys consumers are in the 0xfff=
f
> > range.
> >
> > Signed-off-by: Roman Vivchar <rva333@protonmail.com>
>
> Verified in the lab on multiple MediaTek boards.
>
> ... but I either need an ack on patch 3/3 from mailbox maintainers, or th=
ey need
> an ack from me on this patch to pick everything.
>
> I'm fine with anyone picking this, so...
>
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora=
.com>
>
I realize the patch order is messed up - it should have been 1-3-2
instead. So maybe for this time...

Acked-by: Jassi Brar <jassisinghbrar@gmail.com>

Thanks
Jassi
