Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213034399F8
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 15:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535080; cv=pass; b=LBPrMW2oCQpzmt/kyQHW6wzGF13o3lLmDbCPUbDeIKV8fIIiauVRmNuNkag7OYlt+lQ3P/a0lWUOAiERW5RH+kJbxNZSKe2NOg1VWuzwxnBMYwgTw2Ilm44opfrrNwZxHpNdBkFZiGdWcETM2OO7wArR6hRw+hue3RAPwHzz4Io=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535080; c=relaxed/simple;
	bh=a8IcWix8i7C0DIMMGLJFWrwznvm95cLdWDVTqjuXB24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gyfc4TQvSBoXUXvUQ/6KjMgn6t1OeatJDZVByVmHSW6cDtxro8Y3HJozHa/pNbOdTweas+eW/Aww2Jl/2jA7kMCjrrHmyT9qXIqpIYk2viqXQb5GfmHLEjJPHPqdYOkgfTpgow0Vdyv1973Wq6Kll7DJJQpVezUyg8+HDuxdHp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lqGs1q9a; arc=pass smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqGs1q9a"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-97e96666dd6so732248241.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 08:17:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788535078; cv=none;
        d=google.com; s=arc-20260327;
        b=gVMhqJ8OboQMVIwF54iqBr8SrQh1d511qizD+GmQnQkVYPSST6gkL+VuDmHLXgPSgv
         Iz9mThY4ANmmLmj+L3ZTbxMiftBDrbrcevBb9KWiez6OcuOJATeFJ1xvF6oRWjLpLfJQ
         Ou2130L4WYOt7u7/7jZVlOZFHt8GUKVhr+1nxyzvGZPoqRMPP0t/mF/lTwkGnP6A1s9F
         6RnJq9rWue8nbv/JAgYCAJNfHoOXr4i0E4/k21PhOLvvf5pEpsxkr+WR9/sUswO9Tc9t
         kgLMxVCFEwqYpra+qKnb3bQhyjEtBoMV8vUxNhOK8orqVUUhCb0wEOqF7krbrn/VffXS
         4JEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a8IcWix8i7C0DIMMGLJFWrwznvm95cLdWDVTqjuXB24=;
        fh=2vtNVBBJ0cYLxRYDsNYuHxlun9nFpiALrY1fZLTDVjI=;
        b=dEvV+Ew/9mWsfAZsLRptF2yNoLflwXlPK3nPCK940wu1jUuYLT9fymJ/s6T224bkQh
         dxLv4WGzvOHNWkVwDOrttUOijkXthnXg1nMTYH6gPo7uFkiRAJGkrsp0ay6mcIMIkLZG
         oLpA0XJs47+9aCLHtVs5h9P7LtDXKg/nvYa+3g81H6Fm9K08tTM5ZI/q1YGHA0zOIuyw
         QWPKbrll2KBqk5Pf6wWon3Ce1BZDy2Hhd2b1+50QUCkjgUVgZWnyWjgIPwe9krhzKjLR
         fCCnSWB7si12ZA8t1OPOWfeAa7780jV9K1TfRC1SNBsM9V2/73gp/hdga7Ewf2t2uwom
         CRyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788535078; x=1789139878; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a8IcWix8i7C0DIMMGLJFWrwznvm95cLdWDVTqjuXB24=;
        b=lqGs1q9aVRXf4uDOu0LQyLGbVTM7mQl7nE76OuI3UO9NFmclw0HLAUCKmUfOkqNrsL
         5h6ypm3rQFdUqPV4ZOKzujh/IyF9VhRS0ZPKr1anvU+C1etKGmD5aa0iXX2qqvsZX9Ie
         O0srS2JBQrUz3qwDWdiRfLSkfaq30YYT4xKUFx6Z/m/Usfdc9VYXYLj6c8TR7niehiZD
         lxFOiSCwCuu4xMDyc9ix1xTTUEEQQf3aTMPWHhkHov7tCBKDTofZWfT6rB1OyGXz8Lum
         5q49Q0Gi9noLq987/An23D3PQLXR6T57MCQh4ZCj3QLBZol2fqc8JnMk5R+aMAUptBYA
         TO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788535078; x=1789139878;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a8IcWix8i7C0DIMMGLJFWrwznvm95cLdWDVTqjuXB24=;
        b=qefAkb/NH7p6MJ7s2GuTezu8wfNLcSvvS+Vz2MbN2AShFWJG49rf6ofp2N+/8VqAtD
         mrwqNeRy4v2Zy7kH7iSylXtJozCk08PdOWMcSewIBCLbVtBYVAsdh4fvjBLzRVR6gcTP
         IjyT0sY2l/PaaiE7FYVrL7jQ9mqlL9zhWTggbWD7Uak5z5dQESPks61sQGoZQay+Qapc
         VhvfRWmUSEzla7lrLPsLH2wDLr49fdHbEsEInN1iUTBDDe14K1vUTKir9y+LW18jNvJ6
         j0UYy6ZXdwYWFZ7R1/Leet7L4fcM2WduIP5S3ajqmHwDaQQf2JmBf6oJL8K0DEyerHD5
         dy1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxv6q3Qdeghl0xGDznzX/vEMWlduQbzwEEN79SogHwTg9SnbbBomGnbO7dKPkCBn1oPM3vt9WZprLxZ@vger.kernel.org
X-Gm-Message-State: AFuF++lNPByK6vrpVWJP2Q7sQs4AvHNu1KR4immqDQz0AdTy7kfqKOpZ
	G78GLchfKsJvaC8AsByanmkKq/+K7o0A5mEGAVxj1+eFxy6c2WiAAg4Ot6Luh2K8jCIJCLTtt3m
	24XdTjdGKAkUQyuk3Od3xZ9pPziEDP4A=
X-Gm-Gg: AYBFou2czw86DdewW88wg4AYUvhxjYUcZojgNf4GUJy7/24a8o9eo5QfnaCOejrtwuj
	FCRY2ja1Dh0/nlAa9f0xqiTFsjhbuPoBUskbrMlMniY1nByhjPJ5CI821cGMOedblt6e1yPjJ7R
	7T2g4aPTxKSeZ6smxj132uVIX/e41+I7bUGMk0B2Z0gP2RCrBpDXoo4artwQiQqNpvMTDojnYq6
	dfrCF/VCAifxHqH7c/Nlv3QeJQGONaENnQyEVKc8MF6HzjkQiEFhspMhm/uHw6A/rYz81DRPhmn
	NXIEiKuDkAx8gl9UYhxdJixmy+wrf+Pnw0gCkvKpdu/Qn0l42Z9n+AySPOzCnhTyW9CgoQQoCYv
	bqSi5PIqvGkzWGy0zhJ2FEUqivr+fg74871Tp4GdLsJauwStMrR5DBorr6mPINDaDy19AJ2RnqT
	bO+a4MMQOHlyIC0hSKiXggaX9OlN3ubbtkKBISDhmsh5o1P3AptA==
X-Received: by 2002:a05:6102:80a9:b0:786:4822:308f with SMTP id
 ada2fe7eead31-78a4a9aea5fmr2343885137.13.1788535077663; Fri, 04 Sep 2026
 08:17:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com>
 <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-2-463853a14ad9@gmail.com> <87se3p13jy.fsf@bootlin.com>
In-Reply-To: <87se3p13jy.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 4 Sep 2026 11:17:46 -0400
X-Gm-Features: AcwNN1UP0lhDRhRnmSbud-UU5EERiros9_WN1FPXC7f3fDYdM3_vq5pk0G9NwE0
Message-ID: <CADvTj4oW8Hxv_b5vWM5pbeB3wEO-WoqhLwyinCTFPNR6wTHYmQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] mtd: rawnand: sunxi: support randomized OOB formats
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 8:42=E2=80=AFAM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> On 10/08/2026 at 17:04:50 -06, James Hilliard <james.hilliard1@gmail.com>=
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
> > Honor the allwinner,randomized-oob property by unconditionally enabling
> > page scrambling and leaving the marker in the randomizer data stream.
> > Keep the existing plain marker behavior when the property is absent.
> > This changes marker handling on all supported controllers; the H6/H616
> > protected user-data placement is handled separately.
>
> But I think the reason why this has never been done is because it just
> breaks raw accesses, including the BBT reads. I don't think this is
> handled, is it?

From my understanding raw access bypasses randomization entirely.

When writing the SPL(which does not use the same layout) we use a
pre-randomized image.

>
> Thanks,
> Miqu=C3=A8l
