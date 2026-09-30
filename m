Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FAE4A2A44
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 10:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790765275; cv=pass; b=H3u9ho2DEKu6/AC5/VYkqgsjK/hgnz+wvIA2iXYeo802V4RDeFo+T3KhAY8O2stE2Jx0diDhnxT+9JX0z1P5pC5g7q0HCBXH6l13CXqTRH8l1ebwe5Wdsir71aaUcxVifP++bqrl77dfKbNozWaSO5CDaqcNNNTK+fN2gML8Y9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790765275; c=relaxed/simple;
	bh=BJbbh5rIl1dEuHCd/t+PuKNfcL4FcSDDMLm4FZ7TkbY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fqkpvuvrqBYnaWPIynqFdtJNOm12keYzgZmLK0VGgZYCCfmkanAum6aHtbkFg1+YTKNwRw3qSuOF4KMpUMUy4C2DAXqfTjSFFrjGyfzLWRpIlrAK6uJ4UV3o2dID62zlXX3cEP2ph0wmPOrJiETq9FLhw6okBlVWRGjbINS11rk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qP3uvbAJ; arc=pass smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qP3uvbAJ"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-87fd84c0bfeso2099580b3a.3
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 03:47:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790765268; cv=none;
        d=google.com; s=arc-20260327;
        b=FvQS50Gwkw8VduS42efbOOE9SkZ0IxRJSW3710/9cI/a0DnEimg5SuUjSDn0jPmVCC
         EeHDlw88wsyJcc/PHvI/HJVQxzM8ugb5zi6aRjfmlsgpB1FP0wtzHb+W+kSwOTNXmlQQ
         4Ofb8iDMftftlEhA7yRTu0MxlU4uMFRDpiFjww4oEKcbBgq1zTueF8moZi+J502lGNq6
         miOphHZG/2YA323uw8f4yJ/4sBHyh4IW3zQwvuhdw/z5eYArojI32gqI+A+526XIB43r
         QCR/ifh5UVhxuyYHSuQhdbmdSAm9krr1gvUNSpOKIgHJ4i8YwJCXueA+OR+/3EM6RqVO
         XOBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=frNDlYzQ/8uu7EJKdkeWFduTnVj3NcJs9Yyw7Sysjok=;
        fh=61L0BFO/b8ytPlrHvv7ztmDeb1t+Inh3SOBIsqQF6HI=;
        b=FGNnCgBU7823qbRZaiMx6ImVaT0R6t7CsEMUdVb4y9AGapV8OruPRFonGR0++t668N
         CRDdRy/1IDG8KJDf9yrYCyzn/fdpTH+Z0Pkmq7ZwLIN1k/16d3Zrjwbj+BSosexTMpE1
         SfawYWrUHC2skx+qdpFQMCV+TNLIcOA+tQNX0W2aD24nlL5l2HFhUs/7xkOYzoI2Eyvc
         wGVHJIOy/Uapaw7euPgoxAREGOm8V4BZPA+DFaNu40jAwJ+swgKY00EEzr+mlLvGgmeN
         nEpM/Izo0iIQEW3qhvfu/BjqVTw7aGPhyuLuXo/lty/bP0mMUxzPurXrewyA3xI4nbpi
         o24g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790765268; x=1791370068; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=frNDlYzQ/8uu7EJKdkeWFduTnVj3NcJs9Yyw7Sysjok=;
        b=qP3uvbAJc+BVGMRsNqrXSmbmrVa3FHC242tujymtCMQZy5pY8KR4iEIX4tfjUk5E2X
         03V3Z3I6pM/K2uQmX5B9QmRlv/IFau0ifvJqUx0VGpl/735baM6JgLm12MWESCsgaeZO
         sk88OeYx/0dyvyw2eHY61UiJQquOU8yK1U4dxJiEnScX4YptIfZEyvayf/+5ekFB+b4M
         IHtKYTctXJqMWEOY/nu32C4yCBm0/V5ATDL5eG6iIlkFv2NVyWln2wj3iqqi57JJ5dcm
         SGIvKz0l4mcL+ZzZJ8wrRvdf+s1QzaZI4jjnfulgYZ/CGgP307wuA6Mz+wpFnTRZLQyJ
         o1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790765268; x=1791370068;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=frNDlYzQ/8uu7EJKdkeWFduTnVj3NcJs9Yyw7Sysjok=;
        b=a53RGUO4s+WbFYjg02KhrUPVKSRf+mgQTDKkm0yoev5x+YC99I7PjXiPpAHBQlyWg8
         +vsZUZhKESPA3ILybyneCbGBiyO4tSrSOwOf5I3S8IKlIBpUICascxLYQPJO9ORl5LtD
         lW91BGrUb9jy0y7cGZr1ptDbp4KdFxw+y9lKgDclsKvI+XFDSxzN4VraOZmYpxMR/dAo
         dG9pSGyTOsSXy3r+apyuE7hn5eVyb8+rJXqU+DOsgcWibw+NNW/rUeDlngZiA6W3T22J
         NA9Kamt9SeRuaECuAgmw2uNGvkdr8mVIYV4e08xGv85mAY41kO2Bdz8LFEWVvpYxmGdT
         FBzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAnaBYLaAuKuYI6GeVn8e8VQQVIQnLWRMquTxV7TrpahgfT1ZlbO6BFc9SBLKYQVAQp42oGe/Xnad2@vger.kernel.org
X-Gm-Message-State: AFuF++md2rugzgU8CFhBHGmBBI8M0Ff44Fy06QXPAu2AjqIQZST6nrNl
	FvVD47JDJHfCXD8MrbB4YLZEgdeTkg80hvNtmXEs0gw055gJPNPLOh3eCUq5WGLw2qmoAqX2rSU
	CiFE++MbLXJNkCIXOxc/NXoK3uKVnv8E=
X-Gm-Gg: AYBFou3mzA9zaBNJmfkYimNNtgPZ9xQS7sh46hje9m6i6lmKUv8qoXxrWhwBoKC2Etd
	8R9UoHbRdS8wAowkXu4Z1hS3ZKEqME24keX1u7s44FI8lxz2Bb4pza/99apYz7c19z7Vjly0ZjF
	IoE6M2gwFZOi+ToDvZMdgBYxgAdrPsUMCK1CrRhpJU/jXpFzajswcEHB5eATOZsG7Qyb1sckJhK
	Nqf+3OVFxpgd8t8+nZE4c401Z69gEDB9VvfTO8eF45OkrocQ3/wTYzg+Eoo7NV3R3eJF0HUINMW
	ROoWFOaOR+7Fow9X4SspTL9NY6QTg8fodtPpnINgWgwhGM5AigR9nDVlUScPDhGcmstEkoA=
X-Received: by 2002:a05:6a00:6c8d:b0:880:3b31:a4bb with SMTP id
 d2e1a72fcca58-8874a89ae36mr654876b3a.20.1790765268145; Wed, 30 Sep 2026
 03:47:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927151016.186493-1-pmazzini@gmail.com> <20260927151016.186493-6-pmazzini@gmail.com>
 <20260930-camouflaged-koel-of-resistance-7b09f5@quoll>
In-Reply-To: <20260930-camouflaged-koel-of-resistance-7b09f5@quoll>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Wed, 30 Sep 2026 11:47:05 +0100
X-Gm-Features: AclHuK8o0ZcgRpk54PvKUPvKEFYR13nUvSknbUcihyLHytfHbaM-Aa-FPmvKY64
Message-ID: <CAAxh=jsr1M-RHfqPF-hgQnM+RmH_D82=YX==Vn5-r2=1AB9eMA@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] dt-bindings: rtc: sun6i-a31: add Allwinner B288
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thanks, will fix in v3.

Regards,
Pablo



On Wed, Sep 30, 2026 at 11:10=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Sun, Sep 27, 2026 at 04:10:10PM +0100, Pablo Mazzini wrote:
> > The B288 RTC wires one alarm interrupt, not two.
> >
> > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > ---
> >  .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml        | 2 ++
> >  1 file changed, 2 insertions(+)
> >
>
> Seems like valid and unaddressed comment from Sashiko, so dropping from
> DT Patchwork.
>
> Best regards,
> Krzysztof
>
