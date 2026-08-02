Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AD83C0619
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 16:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785687436; cv=pass; b=LFyHxwDL0s8DXiYYQfRCqTF3p4z5uoUwKWbZYNj/Pk2/gDnuvbrpSKtbzJdUEnaxyLHIi3No/pljmnXrh7zzwUayKuaB6ED24Fu9uRW/AMSTIMpuJY5K9VOvb7ejlFbmR+uzZ+FXDAwY7DtOHO7s2HVZaToLksZrcfzqmeiuYEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785687436; c=relaxed/simple;
	bh=ZGOSaaF0DCsc7pccFSrxVGgbHoSWxdG0a1SqA9YUh9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sy4l1NTuBuLeZr1yJjE15CZwGz23jMWL3alukdXhmyemz5IPzm5+o/hBYoH9yUJ/F+hE7goifhQvfk/UPIGl1XVw3Drib29zZ7xqwC3rO/MZa8P8ijk0ldZHumKqMTrM614q87cyJ2DGJ34Mt8JJOKFtxpQckplYNeE2Kv7HdJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TyEvBEwa; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TyEvBEwa"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b01910b499so2203813e87.0
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 09:17:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785687431; cv=none;
        d=google.com; s=arc-20260327;
        b=f9yYtKsAJuo7FY/NXgZzqEh0bu0IDYmTN2fu9RvvjgH7Wvbg2pQYHmaPWwcEmoGdJj
         x04H4cpXo0GC/lLobwTMFx82O4P0fW0t2ziSDFL079nWnQ2BgILSJaK7lu2E6orCTyKW
         Jnd6ntJG/2AAV+HQknwTrJ/BXDWx1gmmAG0+q9cFkJAN6Mr6ywWj1kKkUJZR3FtWFvAs
         NYcXbeIN2PGTtYXmbfTdYPYIwiYUdNfXp0tdk4t+I1H4wCkB9Z8rw/Gwr0y3N+Iyd4Dx
         rZcPq44sxZlVpqDHjs2bEYjTcmu/8eEFauFxt+CLf8alxS6Oa7DT80paBbqxGQGzrSiQ
         OQ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=F+zW3rLtrKxs03zqEcqhbiHh6u7f93DhbA0J7vHyhig=;
        fh=q+aTIjOm0TYjINxVH2n9z5uuEpRN0lsjjeV+vJHJBrQ=;
        b=culO6iAjhzteePJ2UPjSWlkI/hO6CCcYZUInHJHJfux17DZQBts2ykR6D7rIGEFOER
         Cb0zRHEKceEt7ygkuwNanhlrCsEXzaDjcp4QyKH1Mdb/wGTsPIF9+2iMJNNk4xaRI9jt
         G82cyqjMFZvYWnyLvS0b3f2MCTl3ImkPUyMKonEMDZ+ZYhWHIM8SIbmTA9ybcCunEUvK
         bNWUPh5nba01rP0jqIBtEBCuMvKKJRJJoY/94HCtN+6M80ePJL812KW+4YdRzxGg/boQ
         i1vUyBurYz5YEnINe2HN1ZMt9pA6N9hSxfTAvmZHwFxR2cdXfzTCaNzu2y9yriOkwRWk
         KIcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785687431; x=1786292231; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F+zW3rLtrKxs03zqEcqhbiHh6u7f93DhbA0J7vHyhig=;
        b=TyEvBEwaUMG7seMD7JFL1YoXJbGkcjIjPLloSffCy04s2uLiaO3d4IiCr+wSQP1xY6
         tTctRZ9V6rn0YFFdjxHV/TCeqCzf0FbGZ9Mma7+COeFLQwb+HKslMZVXZ8H1ZbMPsySw
         4LKbb4LW5g+GTr+ix+UQW98vLwN1mq6s7tMdCnoOVMUWKVvqDqKGzzx4+S2h70vhK5ND
         CGlVa21/U1yur4Tp9oiLS0+Empyot14UEzdMm9XPGzFzn5BTv084LZO7h4160h7B/5Nn
         7cnMObjpQHu+XeCda3fMH/IYUolKDxOzGbgjPsxK9EOKVt1WSheH9wQFI7zJCF7agb3M
         oWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785687431; x=1786292231;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F+zW3rLtrKxs03zqEcqhbiHh6u7f93DhbA0J7vHyhig=;
        b=qOX6h1Uge6CMNaV54sd2gOm0CzmX7varwQqtnOFAohuBJPi/DuIQrlNZGEbTN9uQnK
         RC9davHX0jPomxKQfAZPloDqJGhE+nJUDl8e2UABbAX6iUy97CTcsBw7ECZGGQZJJ5ZL
         Qi4qlEUmcz4rboIkAEGqqu4SKLTNjMkrjZ1MAdxuavEQFKIvjoaEBOcQHHa6Hw6SF5nH
         sN3DeTthXnUN6u1F3Sp2xsn/tTkRt1NNqOdkZY8DnlGndFKUC1iNf8fM6fGv8EK0vpqN
         GfaWTWkHtlbx8KCEyovq3MMbtmlSJlV+6l1x4zarq71G2uSQnumz14EqKGLWptzjcSR+
         dmpw==
X-Forwarded-Encrypted: i=1; AHgh+RrocT0o3XoqtluCLzId7a0CWhBSNEX7PUNOG+y+eacD3aY66w01wQK+wnqr8EDMoNu8nf6FNLYKa/dK@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj7pIvyy1kUe2bzTcmVkXJ8rA2uDrjo5uDZqmUGfe81SxO9ZLG
	6DTboNSmkepBJE2JlvcvtNeydJwaW34Y8nU+aImi2mZkNt5MUFqWH/svgHY3GS/gYy0Ko4Jqdtx
	sr8JK3qrOVkEwHvDitj22w1Osj2/0a0U=
X-Gm-Gg: AR+sD121AQ8XrWmV1DeV21fdIjv0PUIwYVjKv5vtTOd203Q7T/XJH79oBvXotdl1ibr
	u+MwPDHReghaGQojN55PK3/8+bY1QxqnEWJUSa1wZbtLBmtnQkifskttA9Br5MkWmmYejprKDRw
	UrdoMKFidgDGTWCDQ0HmTy/t5YfVpnLbknf+/QUtkYYFvtwPQar/nxhiWa7aXlge99yGv7uPJNI
	EgYxPFOtd66ytsLgy+il5OLZwX9ElXqqXPbsin/J6A5eNL3RZ707vS20PBVdVU77yBKWGmES/WJ
	858wyjX+Bku0telOfANv9f95k2so+ZNp4L0SjsIhGRLYW/PmZDHwJJTbED3unzsezSeVe/hR+SL
	aDpRD5ClP9ybwNAHB9qRUSiy50bruBYno9pSCfeKo5mHJ8iVezYwBS5Yn9PRT0Wto
X-Received: by 2002:ac2:4644:0:b0:5b2:a353:e4bd with SMTP id
 2adb3069b0e04-5b2e4f74c67mr759807e87.30.1785687430791; Sun, 02 Aug 2026
 09:17:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730173643.256052-1-kieweg.leander@gmail.com>
 <20260730173643.256052-2-kieweg.leander@gmail.com> <20260731-petrel-of-fascinating-finesse-cd10ae@quoll>
In-Reply-To: <20260731-petrel-of-fascinating-finesse-cd10ae@quoll>
From: Leander Kieweg <kieweg.leander@gmail.com>
Date: Sun, 2 Aug 2026 18:16:59 +0200
X-Gm-Features: AUfX_mz5HEe49CyDGpRdEdFN7gD16niSwzfJt3LuNERXKkSNUjs1qx6t2yWAiTU
Message-ID: <CAMwcS0hupV50NEOX1Fsi_tzRYXBecaummjAm=CFHO7xOT1uUXw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: Add GlandaGPU binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, u.kleine-koenig@baylibre.com
Content-Type: text/plain; charset="UTF-8"

Thanks for the review.

> > +properties:
> > +  compatible:
> > +    const: glanda,gpu-1.0
>
> What does this 1.0 correspond to? There is no such tag on linked Github.

I've pushed a v1.0 tag to the GlandaGPU repo now, matching the
register interface described in this binding:
https://github.com/stiangglanda/GlandaGPU/releases/tag/v1.0

> > +  "^glanda,.*":
> > +    description: GlandaGPU
>
> Vendor prefixes are per actual vendor, not product.
>
> I have doubts this is needed in the first place. As a pure FPGA design,
> this cannot work alone and you cannot get it alone (at least yet,
> happily to see resources proving me wrong). Thus it will be always
> customized per final board design, thus that final compatible is what
> matters.

"opencores" and "openrisc" are both accepted vendor prefixes for
open-source hardware projects rather than commercial vendors, so a
project name seems reasonable to me here too.

That said, I take your point about board customization. I'm happy to
add a board-specific compatible as the primary match, with
"glanda,gpu-1.0" as the fallback, e.g.:

compatible = "terasic,de10-standard-glandagpu", "glanda,gpu-1.0";

The driver would keep matching on "glanda,gpu-1.0". Let me know
if you'd like this for v3, or if the generic compatible is enough for now,
since there's currently only one board using this core.

Best regards,
Leander
