Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EF8499F12
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 13:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601602; cv=none; b=U2gtia24bTgx0jTyU0pkk82wQp3IEDqfgTnFtTspNuzndYAMByHljltVoRJV6RyvjozOVLuiZGr6CuWG0cSf3/sI5jFETasrDL6ojkf3oH4/2tLN1tlQy/eLOVWosJTi1CsOJuO8ncR4dEqfp0Jz16zVsEEBCwPpqbksjyWct3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601602; c=relaxed/simple;
	bh=k8NaUNezwm1OqIABpDqgi3K1HuGNVyBGjeIJUA1Vp/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ryj4BerIN97PtKlzVzpp8vEhPBoOwiN9LCT1hpoVBIqMkuECVickbqx4WnPsrU1WYnXDnae1B14PFi541EQbqPeqOMxPLOx8fUSqNDRBI9jHsAuWZUWa4M1pnDgWtzeD1B7qzZndSeyZhkH4WGSV+x0E3zSnpLL8HZhNW/BiRso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wy187zvz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wy187zvz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 015C81F00899
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 13:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790601601;
	bh=k8NaUNezwm1OqIABpDqgi3K1HuGNVyBGjeIJUA1Vp/U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Wy187zvzjuSDW/E2X5EUV6MGN8P3JLVGAgiMq34FslO1Hkv5k6DRJy2nVuOE+tOYD
	 sZF6r5UP4XLiLVzYgvE9Wmg3NZxgNMZ4fW5StrGWlRLR2szQg3+yRQWfGdfyWs1GHS
	 bzBju9cUq6DFC/KGBLlr3dAC0BCKN7JroSur46qeLYnNz8r7/qsD/4QLwi6hvyHSij
	 GzRWd3mk4pZl9Y7tMBy/zP3gFbZAtVSVI49c3NNMc6zoklUchFqDrJN1RHDVsYyXsk
	 4oTD/vFz5aN435Pi5K0vjKXJDlJ44n7DO0WL0gGIxsCJpLu/wFaNA+bR2w6xNEMy1n
	 8YQlO6nNSFS/w==
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-81b37951827so722092a34.1
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 06:20:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzfG4FyIL0otBUIc6OakHYzEDdnj3Ngyws0V8nS/7VIQwK31kzN5Vb76f1FKw6Y2yTBowmkBZ3C+bAj@vger.kernel.org
X-Gm-Message-State: AFuF++n5P+DjfpRlsgfsqm5QWjKvDCpvb1oDiR+UVgShMFHUsC6bkGHf
	LMrnHYdsJjgBAuehSvRLiEzCbs/Jy+bDFeXFudGdlCPf0jtUHIpTavhIj351yRAk+5Dn83u0cOG
	8yq+K+ACwnv18T3zFSE4XTyfoSYqKKV0=
X-Received: by 2002:a05:6820:2005:b0:6d7:c2d2:3ba2 with SMTP id
 006d021491bc7-6d7c2d23f2amr4986734eaf.52.1790601600291; Mon, 28 Sep 2026
 06:20:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-gemini-tve200-fix-v1-0-8be03ac2a8f7@kernel.org>
 <20260921-gemini-tve200-fix-v1-1-8be03ac2a8f7@kernel.org> <179060141842.3905299.18293784781944970746.robh@kernel.org>
In-Reply-To: <179060141842.3905299.18293784781944970746.robh@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 28 Sep 2026 15:19:45 +0200
X-Gmail-Original-Message-ID: <CAD++jL=VRVEo9h1aiF6-1fBA-eEuNjAdhiNHuagBw71=ZGrpmQ@mail.gmail.com>
X-Gm-Features: AclHuK8N4y_x-2Pp53B3CGwLTjOtb4DhwJwJ3Zwoh0Xaz47DE26TzaOXVbr4nRM
Message-ID: <CAD++jL=VRVEo9h1aiF6-1fBA-eEuNjAdhiNHuagBw71=ZGrpmQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: faraday,tve200: Use a
 level-high interrupt
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>, devicetree@vger.kernel.org, 
	Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 3:17=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:

> Applied, thanks!

I applied it to the drm tree following Kryzstof's ACK, I should have
said. Sorry!

Yours,
Linus Walleij
