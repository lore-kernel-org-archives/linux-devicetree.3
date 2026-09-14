Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD91379ED2
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 22:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789426152; cv=pass; b=dIya0K5G6cpzw0vQpX5Oktp+tW1KP/prpCDhzt4HYR0thkkDwS5UrrrIQ6qjqlNGfOivLAzJIIPQwhsKrteK+cMw3UqJULCRpeo8OM0rjExyTSIAxCcuM+nice4u0ZHBoIFZ/RsD5bWfbg8VJF+RIhJUA7LTv9rJBiUsho1GWJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789426152; c=relaxed/simple;
	bh=Gb8DWQjrs9f+P3wLgZ+RgMWcDCFnHm5XHmUmq+Bd4U8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nd4M06M92mvWFHM+axTw+WOSi6lL9Z+a7xtEYKd7R4gBt6Qh8cc4mJZPf3g8CX+7BCCbX9QvXKQhmISZOdikSNMJLLvKVTL0jiK3mNi0TwEBY2UDCgTqJFk/p1iFMHgT5DxtYX+bFCVNU6P4GaJ3w8wTm0QFlAAk2fz0dzSXCy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oyPsWtY+; arc=pass smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oyPsWtY+"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5c989be99abso258246e0c.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 15:49:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789426150; cv=none;
        d=google.com; s=arc-20260327;
        b=HIyyAoe76GFRIHyX/9F7Bz47Y9+PHHPkgBuxsGsEL1SRD8NATCsiPrSoijL9wqHgt4
         hUVbuEu1Cf8dF3Ku1y5hZuv0ev28K7+IySqpkI7pPzfwXgJr23VvPObHJsvFPkXVN0zs
         dyLhImUt/n9lFEQ4w+3C84zVYDhuNtIMhe07hloVormffuYDjThUxoIYe3RvbzgDxp49
         XNkDfvSy4jFVKjefsXlfvkUcPDtxENZXncYwqCcObbrhgiHE/XBIMsnLPJVJ6zQ0QbWU
         s7QuA6WkNO/pabXmsMnrdYdrOmXdbf8VM8GkmWE1mzzaLK7vy9EX1Xj9VcI49RqB9F0E
         uybQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gb8DWQjrs9f+P3wLgZ+RgMWcDCFnHm5XHmUmq+Bd4U8=;
        fh=/s1ORse2Hk8GVe1R/i5z+qDw4oNC+p5HU3dLL5LZqcw=;
        b=AEYrCEadI7hd0QsCjAcxfiYuvTE7u2HH9oYp8Rj5yWYyMF6XqwFkib6OBwgTl4poyE
         gQXLgOlhDkJzi0QsKRMOMfy4aUjsUyqPGAr7qQ2mY1TaYrCFTKtbumnbJQT4kM7MuMib
         k+sswg/Fyr2nRAAbFmX7jiAEuPdq+kw10FUkGSwdxwm3fRxfZgs69FGYqnSXUP62CbE5
         mPFkbbMBE4xVnV/81w3U3E/L6SisgzGFFyeObtUS0hZQAqRr01R9lA11g21Xf2Mqz/Xc
         wPcltcLQZPbIrNoOC/ybztDpmEa0Pu+QYmWODpjANbGrPRZnIqUs6ViVrbYaqnuCq+VI
         1dOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789426150; x=1790030950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gb8DWQjrs9f+P3wLgZ+RgMWcDCFnHm5XHmUmq+Bd4U8=;
        b=oyPsWtY+1hS3t8V8z9RpnsZRLnxIV9qtcOHvrQbtUBmUMe7f1xz7MLjUN7a8o16jRY
         3bFyo4+PDeK/3L22Gn/aetbXQINkdcsE5fMW9ON73sFbQmENKaMxjaDPxfkbHSa8WnD0
         UPYsY+oJ4CSzzmudPYyramALSGrPll0WxysYDnleDKRu18YfpTonHcUntjCrhi+fknM1
         S4n4lPai/yV6NoSARkvrE9YnKt3eJZHt7DeqLTksX8yPG/kGzAKKDTL8suIyPKB9SQSz
         hrnNO477Kld+wk16uJCB5UJzPr2hi+eqKjWGZ+eom9oZs0kaojNuC8rPYBiV6WD61dl3
         fVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789426150; x=1790030950;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gb8DWQjrs9f+P3wLgZ+RgMWcDCFnHm5XHmUmq+Bd4U8=;
        b=URDzl4WgkG5r5eH7oREPyn3OacmDDCM9YuO6Zfvsz2rb2+TKrtqvuzeZb/NPIH53aP
         jwZuIqtfxJ0v6KgoMIbOjDxVr6bCnHIRv5xr6wmqqps7xOSe8qws6Vm81TsEMfy8SjLk
         JmuB/V+8siaYodWpS3U3zzk0f4TxbDo7YqP4QT5/p0cCoyNZlKH5cFCThOPrjQJsUzJn
         FzaAwWRMakP2zYAYEbplBI3IHHM6cwd4vp7cKs0Ho7TS6zD7uMc7Lne8mSLfM+3aq8jF
         p/K/PcLzB+BY0KP70LaUwZLv40Umndv3mFJIQCZLlUBZtAXHkGJb2ailUeGmEj3QJxQi
         7O0w==
X-Forwarded-Encrypted: i=1; AKwUvBwAGR7rDa60HbzCzyreDf7nFVBK4a3nIkRNZLZN0jXGDutGqXkzRRbKA8L1gD1OmoveeM5Cs2VyFcZ7@vger.kernel.org
X-Gm-Message-State: AFuF++lWZvj0fuadK/wJcnWx+kAb2YAYoNa/aJkWT98RcC1VxvHbLG/X
	/+m5WXBoEVUWBhP0dg8ID7HIrG6imH6kfTRRMmi7kR9hA3++VeO/ypi0VglBHwWTEqYZRB/d/dA
	r05FN417zv1JdX0GGDCKGKT3s9zjQcgk=
X-Gm-Gg: AYBFou036YKlYE2np2q0Z1n0B51MVHvDAy5MnKtc/zhlYbAteT6xvdrKjCcfKsDHdg6
	+MCzVPWIDNaN8jqdrGdFM0lnZ8HU3RM8atzk+dlp/c71Qot5qux87b2pYsgQbhi2072ZvB9VTIC
	jUCn+F6/BUG9bS4tMJmyY1tU8ftAymwpCxBrZaPbAtd9Y168A7VTIC4B0znfHM/XPVGkHCN/zzu
	PLhyWb9fhVnHl+DNW44KJqdnzgBkRXQN6A7XstMXjvzF3upO4ULk3dQjyP77Sad0H7ZRBcTU69P
	luXidgpyQwhsuY3kz2YOqrysaOHh+0FGyY8KuOJEL70VU3S8BsHh8+ZLkoz9SsIlTqx0zFmBoPk
	IY0hkXX80KeDTkNPZ3ERnRxqBYu0bWyTUszhfpGvRaLpKQfJtUMI+r6WNKXQSOparu199n7rOqg
	6hDkip2iZDseYGvZhf0Mptos+zRXmnA+aAJx2qRKKByEIqQotY
X-Received: by 2002:a05:6102:4492:b0:77a:d089:3dd8 with SMTP id
 ada2fe7eead31-79b60973580mr409096137.12.1789426149941; Mon, 14 Sep 2026
 15:49:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com>
 <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-2-b12074f4aca7@gmail.com> <87ik4fu4fh.fsf@bootlin.com>
In-Reply-To: <87ik4fu4fh.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 16:48:58 -0600
X-Gm-Features: AcwNN1UlC9FxjgijfoClAvZzNG8RBzvUoNkXu_nF9VDV4LFTu4fZlyRKfp3tTWs
Message-ID: <CADvTj4pH8KvTmsxOXO8JQYCQmKf2OA__eqvYXrM+1=vjq0368Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mtd: rawnand: sunxi: support randomized OOB formats
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 9:51=E2=80=AFAM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> Hi James,
>
> On 04/09/2026 at 15:22:12 -06, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
>
> > The controller randomizer covers the bad block marker along with the
> > rest of the OOB data. The driver currently compensates the marker bytes
> > before writes and after reads so that they remain plain on flash.
> >
> > Allwinner NAND firmware instead stores the marker through the
> > randomizer. Media using that format appears to contain bad blocks unles=
s
> > the randomizer is enabled while reading the marker.
> >
> > Honor the allwinner,randomized-oob property by marking the NAND as
> > requiring scrambling during normal hardware-ECC transfers and leaving
> > the marker in the randomizer data stream. Keep the existing plain marke=
r
> > behavior when the property is absent. Reject the property with software
> > or disabled ECC because those paths do not operate the controller
> > randomizer.
> >
> > MTD_OPS_RAW behavior remains unchanged: raw accesses bypass both ECC an=
d
> > randomization and expose the physical representation. The raw-NAND
> > core's bad-block and flash-BBT paths use decoded accesses and therefore
> > continue through the hardware-ECC/randomizer path.
> >
> > This changes marker handling on all supported controllers; the H6/H616
> > protected user-data placement is handled separately.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> I believe it is still not completely working. If you look at the error
> path in the read functions, in case we face a factory bad block, there
> will be no data, we will face the "page is maybe empty" case where we
> still address columns like before. Since data is randomized with these
> accesses, I believe we would return errors which will not be interpreted
> correctly by the core. The discovery of the factory bad block markers is
> thus broken during BBT scan. But a BBT read is also broken, because even
> if errors are ignored, we perform pattern matching on data which is, if
> my understanding of your implementation is correct, not de-randomized in
> this case.

The erased-page fallback could overwrite the decoded buffers with
physical randomized bytes before the core inspected the bad-block
marker or BBT signature.

In v6 [1], both PIO and DMA preserve the main data and protected OOB
from the original hardware read in randomized-OOB mode, including on
uncorrectable ECC errors.

Erased-page classification uses the controller-specific vendor
spare-byte heuristic without a raw reread. Accepted erased pages
return all-0xff data and OOB; all-zero physical pages instead retain
a bad marker and an ECC failure. Other uncorrectable reads retain
the decoded buffers and report failures through the ECC statistics,
so the core can inspect the marker and BBT pattern.

I verified this on H616 using the actual NAND-core BBM and BBT paths
through PIO, DMA and forced split-DMA reads. Signature searches
retained the decoded pattern despite ECC errors, while table loading
rejected an uncorrectable primary and successfully loaded its clean
mirror. Correctable protected-OOB cases and BBT creation/update also
passed. Hardware validation is limited to H616.

MTD_OPS_RAW remains physical, and the existing plain-marker
erased-page check is unchanged apart from the prerequisite
error-handling fixes.

The series grew because this work exposed existing bugs in the shared
PIO/DMA paths: error propagation and cleanup, IRQ/completion ordering,
OOB indexing and program-command handling. Those fixes also apply
without the new property, so they are split from the format support.
The final patches are separate optimizations.

[1] https://patch.msgid.link/20260914-submit-sunxi-nand-vendor-oob-layout-v=
1-v6-0-2fb084fe0751@gmail.com

>
> Thanks,
> Miqu=C3=A8l
