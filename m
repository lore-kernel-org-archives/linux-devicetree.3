Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AB4349B1F
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 14:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782916376; cv=pass; b=SPOPTRG++XRyIhnsLkLKDyrOPub/M4UOcih4gkuZZ/aRzMh5nuG3n/qM5Vx+LE43GClpEVZhC8Vsrhx/fzmxntQVbZsAd7DWxP5mAkfV8NZzHivrM3TlH8w7ML/bDegv7Qkc821bHnqE1M7O0tvp+6x2OuK5Db2btfakMpDYB5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782916376; c=relaxed/simple;
	bh=sZ+JoBpUWCF0i/dfiNw2PzLfB8Xqm/+jouOkAHa0NR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N8W/fHHfUTCcvI2Khd3W26uv/Eu5r4WpZvdM3BVzf7tMUd8Ku7YBtrvuk/yYElQrU0iPWt8r0rI95EQvvgk4HuENcq2SYpFndYArFIMGuVCyRrDp1wHVIUVVVDGXld4/vTijd/xXDCbi5PT+0oYbt1ufNFfEtjsWoQ3uY3E+Ip4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bm4srtnb; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bm4srtnb"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-664ee752958so965560d50.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 07:32:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782916374; cv=none;
        d=google.com; s=arc-20260327;
        b=KQziN+CvBUzy3kuqSgbgIbOfk2NbEPF26BJ03To72FVNsLO1YINWjYZUFG23LlRjGz
         P5FHWGhT0KGd6vwQc+ud4ynb97Juy8ulsq0qoouR9fN7I2QBYtqvUOaiNzECs00BDT/Z
         Lk3/LDeZlzwVYZTblgStuMOx32czjbOmu7SS3pFB98iRVaG69rNpZTqOpnB0kD0Lq7/2
         omAsZQeKKmhL5dbMgrWRBrf+wBAibBBNjobnHbJmsE+w2yFGM8v3mno3BMJNvTGqwPGE
         IhisbdU61fbgOJPVNobUulv93Hvep/0envN5zCGikzypNJBXRE34G9GP62ij9Pwx0vXR
         zx5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/PMJfwXDmjutwz2ZqUdHqOQ1qGXDhEDRkGoA21ZDRuY=;
        fh=8GgG6xYetNpXYsLn/b6phIrJfbDyO1RjUa++TlUF4KY=;
        b=O08dRu2tgCEMS/RBCBgzKiZ7Ou4XjBvpXRQmoDfvfSJ6Rn5rQvMcZtEji5Aizj3FxN
         AyBnNwFd6VAgzrp7rSOU40jP2FIjnzO8Lmd0siDPBOuZ90faE8EXa0xYfNid9xKW72qR
         +ot+VHvHiUxnAbrRZYOzKtz/VeHVkzwRe6t4FR9P/pwNQc5VKtC/aNprFBBQypvAYXZZ
         yW/MfL8UP6gK8sThhyhNwlrqwN88fCOzstG+4ajHOI3K07OBe3cMfnQSa3ZqZixpTo1P
         8TViAK2zAPETSdjegPlnyH/2RUvrFbVn50906g+YN7TFkKuwOj6/v9P55qW3/4UJZCQz
         NAjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782916374; x=1783521174; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/PMJfwXDmjutwz2ZqUdHqOQ1qGXDhEDRkGoA21ZDRuY=;
        b=Bm4srtnbXfxE08SMcdbDuXZbfjIn44GxLF+Kz6nSzEvVIRh4iW8SHYds4De8tHXlck
         DmmulFqBuElueQnM3orb6L6+Q3AUgov0KmW2edGUJoax8/Vw1K5cSOeUbLEXxnDcD91x
         DxjsD7njYS2beekHon5d4L1ObOE6dCJFXHy5Zi2KtV7FDcXDBoya4U1Z/RqnkkHMWPqE
         FJaNMdFJuP6r/VW7qo3et9CAxXZymhu0XEjdVVkJd7YZfAajN1Rws9gPrwBIEXnpgxq6
         B8GGeuDC4jJeRTLd07Gqlg4LNkQ/bbuI3OKX0bqVlegEQWgGt/s6QPovWgXKUcP8cOEp
         YP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782916374; x=1783521174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/PMJfwXDmjutwz2ZqUdHqOQ1qGXDhEDRkGoA21ZDRuY=;
        b=ZtAfTxz8HumImqoYcjXwPUolQBWGanq4rUzlM3Bn0t/4LpNpQV8Q2Z77X75fhrYjvp
         Z5gkqh52DqeI36x1L6OvhLvrnTnhY4rGNH8StGyH+DgqGdm675N5iRXJXL5yE/iIY3pi
         5qDoKUTRsReWFPVpcVnn3gTeCR0U7941sB6fw6xf/80MnPp/4DFX/8mpP2RhlDOg9wJQ
         xJ2ZpezVeTb/dtQUWkQ2MFvYirFHddkNS7K8TbuEVnkHHOqqbVAXsxV5hzqD2/x15ade
         2auarHV+9fpUs35p/JlljF1n0tSvYDyZRRcj5rfiO4Pyaad8JqV2fgpSom+k/vecg6Iy
         ns7Q==
X-Forwarded-Encrypted: i=1; AHgh+RrNsk/9E3J5Q8MLsZh8dkb4d/g8Nxm1duo0nUSiAg52a3crd87hu4Ysc9AWUMZ4Bp12qXlINZEe9apN@vger.kernel.org
X-Gm-Message-State: AOJu0YwXLAJIRZmbUzUeQJ8bqxpB+7Fng3a5QZ6+6EoRFtmR9IBd6mtI
	zqX2drVYc3kX3SLBqpgF7E2iTvZiztWrjw4+sK9ykLi5bd2moKWLd38ttC1oru4UYXSLqRjsWNf
	S6B/w86Noc9t8OHddFmCg/o2WoSeeLIw=
X-Gm-Gg: AfdE7ckR5fGkSFvWIfZPYT2VhvGZqIcz1caoKjFc0i8KUFEXDnobnE6eAZFm9KkhaBp
	O3J4wGD4aFkLnLWKFN4mjGfH0+7M2BX4ptqj1uCbkFdQBXj93BMZgKo67+NaQEfTuTIVKNgk8YT
	8biECsECgpSXj21j3HNEPZ+/6RbZFSznsK4N1NHswIEzX9omA9XID6i66otb8CVQD0lBh25VqcN
	MmBO5woK5d+nTyVaj9eZsE9ZxOy6KELXqMXyB5mGVaNSxzO4xoobM8vYxeSeAzvDLJCxuxrObPt
	1JP/7V1aHWrxrPTHEICWzMTyXfWZ0li8i/V8m7f7/sANjSu5QgljKW6tArkbZg==
X-Received: by 2002:a05:690e:bce:b0:660:a41d:d175 with SMTP id
 956f58d0204a3-66521b945c8mr1896345d50.55.1782916373989; Wed, 01 Jul 2026
 07:32:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630-apple-mtp-keyboard-final-v1-0-506d936a1707@gmail.com>
 <20260630-apple-mtp-keyboard-final-v1-8-506d936a1707@gmail.com> <05d39c4d-8405-4fe7-a798-c8a9c92699ed@cyberchaos.dev>
In-Reply-To: <05d39c4d-8405-4fe7-a798-c8a9c92699ed@cyberchaos.dev>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Thu, 2 Jul 2026 00:32:42 +1000
X-Gm-Features: AVVi8Cf357Gij5feihuaNZJkJ4WRqS0nufoZDV_3Bt4D6iI9pAVwxlHJbwtr7a8
Message-ID: <CANpmGNs3s2yLw05jkpZ9mscQNZ9JvfbqEgyW8V=cMD29aU8c2A@mail.gmail.com>
Subject: Re: [PATCH 08/10] HID: apple: Add DockChannel HID transport driver
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, iommu@lists.linux.dev, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yureka,

Thank you for the review and the feedback.

On Tue, Jun 30, 2026 at 11:21=E2=80=AFPM Yureka Lilian <yureka@cyberchaos.d=
ev> wrote:
[...]
> > +     strscpy(hid->uniq, dchid->serial, sizeof(hid->uniq));
> If the keyboard appeared before stm, dchip->serial might be uninitialized=
.
Yes, true, thank you for picking this up!
[...]
> > +     /*
> > +      * Prefer to enable STM first, since it provides device IDs. Some
> > +      * firmware versions do not expose STM, so let the keyboard start
> > +      * without it.
> > +      */
> > +     if (iface->dchid->id_ready || !strcmp(iface->name, "stm") ||
> > +         !strcmp(iface->name, "keyboard"))
>
> I specifically asked for a mechanism to let the keyboard probe even on
> devices which do not expose/have stm. Thanks for adding that!
> However, I think this might need some more sophisticated mechanism to
> decide whether the stm is still going to appear after the keyboard, or
> not at all. I'm not sure if there is a way to tell this at this point,
> or we need to add a timeout for the stm to appearing, which needs to
> expire before we create the other interfaces with fake serials.
>
I do not think there is a way to tell at this point, unfortunately.

I think the best way to resolve this would be to implement a delayed work
item that is scheduled during probe. If STM appears and initalises before
the timer (I'm not sure how long it should be right now, I will prototype a=
nd
experiment) we cancel the delayed work, get the real serial, and spin up
the keyboard. If the timeout expires without seeing the STM interface, we
assume the platform does not have one, mark id_ready as true, and
proceed to init the keyboard.

I will work on this and experiment to see if it's the best solution or
if there's
any others as well as to find the ideal timeout, and submit as part of v2.
[...]

Thanks again,
Michael
