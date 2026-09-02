Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED0A3EC816
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 08:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338982; cv=pass; b=tgPud6ErRTHg7WKW1pSISALi7/eToXwrYtRR6UYzqJF/Uaf3xaLRfUNX38mo18ZmNUGmnnoRSj68aHSwFBwGDNIElgK5SIQncqAqF1Lw11BgiT/lHoD7X1zTGstXy7q3pLyxgzxmvCrk0A6tjQtcfx11J+/RiTJt6zYX/rBLrd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338982; c=relaxed/simple;
	bh=dXHVE6yyM/VxszSTaO1cHtDg7uvExauymcaChdiRMus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=u7HfWpzxPrwsWvvLhtIf0b8KpE7oC5COk7zpbQTSD7iNPKAiaVGJkwu4CQeFPyjXyDEiJ3Q6WXO9n+kiutXea6onQhzOeD9fxvq1KpjMpgFLhdmWR4BaumKNbJRleYnq53/IJzvaBNyAlN4zDuifwCgofWEfxXTD5dCcndpkL5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jWF/96fN; arc=pass smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWF/96fN"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-90cd96389efso9795726d6.3
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 01:49:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788338980; cv=none;
        d=google.com; s=arc-20260327;
        b=GshJe/qBeQamaDoCVEFPneIf0fyKDMTsdZAINlaP3qm5P0PWedZC8gWCWhW1X5Mtjw
         /XGy9LRWs6o1z8idunVo0dr9n5YdeEEx44xm7pIO/C10IPZdVwVNfP3T/hpqxPLpw33S
         XP0g6ASaYGjk/kdhtmeUeqpGFKYu3QS3RyPCGGln+FMOE9Lf07nqOKLax8+W+RFE5kDz
         iDGT+Ve75p8TgpqRzkrgjxYMppyP20OSIOaGdLuxPLs7d03i0ReJ8BOdUzCJE4Tg+9Ul
         QEAgq7+QBthbwyG36DyXPUVGPK3Pase90db4fO2r6rHq6+uojfnvZqe2Qj7X+8Uw08yR
         OMcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ahQZkdikvVjzkT6T9UmwO3n2/e5NTjCRZNNcesXUjLU=;
        fh=d+ujcX9yrFA9RtCfGoNkZCZyTvLDUXt9/+tArFH7gG4=;
        b=ZoXAgao6UXHuCMaOo1FTQJOoptUQuLqCBfsYaSSOQL7VR5p8lSwst4epsekdDxUrIq
         8O6Bi5GgxAbWTJsjUEVtCm7xEjwmMaPqJ/Np3GPHs9+wUgLvfOePFiq19lhrm+mVHDN6
         8XlrvqOtd44hFpX9ktCwbwqph7RJ2KfTXSE5aMaMHXCHtpmtuVd4IxChWnXJpJMk9BUl
         aRjJeyJ4YZgyCP0cRrN91VKMZJ0xPmeTEZSB04akJhG9T9GoFnJzM6W2vKz21edxbmUK
         MQpbZ5arJIZI61hgFUuZ1ZtFacncoupSAOgIrB47MnvqUEtBr/Raw/JjG2oy7HHJVAN0
         Adeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788338980; x=1788943780; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ahQZkdikvVjzkT6T9UmwO3n2/e5NTjCRZNNcesXUjLU=;
        b=jWF/96fN0UzOVU7RxbRvwCqfhgf7FcI+XVtbbCgEecAzcPhmoMFWnoMVW6+gHn3+K+
         APTvIsnv8bY4lI1xOTPsLiJ/VdTxKX2BJqzIV7FKsUUGt2LZhLLIyyxy5nc67vi3fR6S
         HD31gN+ariraWuaaSZ7ZIIjOTBF7+Bhx3oZ4x53l3ulZnaxpfkcwPyMq6hXD/AN9/LED
         S740PyLu/Sqv55mB6mUeT5GoQouL9WRM75NaQi8mgeonNQcZixlZrfyNFzWJHHJ+3aDn
         7IaHJMMBdUQqPv1voM3tnIYKC8r+y/xeI4KQboX3ePplQipw7YSvFcSLhuae+1WZImHw
         MoWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338980; x=1788943780;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ahQZkdikvVjzkT6T9UmwO3n2/e5NTjCRZNNcesXUjLU=;
        b=Cbb78h7L3Om9/fcBFFz6dsqorzA/h/ZYaYDtKw1XrZ/pW1NlvtWgncyEid7H8hr5Bl
         PuIYHSINlwTstKFaPnfH3CHLSf9VQe9TNwWU6/0Wcvoc6/ErsgsX6vnr2kFvhJRjEpn9
         S8xcSWZJ3pgPdu8bmqrQaygccpLmHySHJEwdk6u87ZtbOZ4QpSwaikdsD6Zj4rKbeFe/
         DdEXcZ7wie8c0nfRDjxqotl/Z+Nw++r2LVe/8ib6wZ3vNTEBTI/l5P9ipQZnndWotHYo
         auvjkQNAOlwTgqOP+wj5gAV96ykgJuKgVJhqKW9tM4kDUlUtMJvHWTFAJRApJi54rv3u
         wfdQ==
X-Forwarded-Encrypted: i=1; AHgh+RotKPFL8je2gd7Uts8Tyq1mpbT+5TqjEyQgMCtabRCWp+zSWWOTqGQXXJvw+3neGDbetanW+i1dxBQn@vger.kernel.org
X-Gm-Message-State: AFuF++mPsyKgupr8o2RTzZUdFVv1HoxwYK80vEMYT1R//BcaxADfucvR
	oG/+pOoc4/CGb1Oue9RY9V6TfIKkIElRR4sBIsKVqDF1bwwSdevvex8gpJUZAP5bu3ZGtjjwXDF
	vTw2uJ4DElmmwNWB5PdX0q4LQx6UAF3E=
X-Gm-Gg: AYBFou36i6aK4uNMsODNGUjDgjwhF/Axh3lxq8DUDDpj0zfYnZ5OG1IIpmAcS0zXLNF
	KaXD3mHh7M/lASvvqBNL2YR5XZiioWS0/fSdAiLMLEGfNjmjuJ7eL3zDBnGsxNQ9SKTYYykSwV5
	/aCDwOs0+ZNJCgcVw0QuNMweINSH+FTSrXEHk84m3ykgIbRpPd63KOskECoI3qZKPfOiVIslSus
	hM/YdRY2HFrj9ktMGLYgsU7yBy57nmFsOjZJakW/Li4NuY8ELdUQhuDvhmo4Me93l68fPQzuZ3b
	YKqiyn41y64K75Y7ByNpNZbVVsgMtwZX26ruPWGNBeCx4i7Njzn74+1LxWhfhLvGeBSvXUd0XcA
	eZGugJ2Yp6H9psIXXU1PCeqE/1NfDjcUPyTEAXFwYLl1MnUl3/ZFrUDq8RgG4TuGIWRMdUxAI+K
	dMNmwYKawpse1VCywRtwCRS/7GEjJl7+/aQDcI9b8=
X-Received: by 2002:a05:6214:434a:b0:8cc:d29:9f73 with SMTP id
 6a1803df08f44-90ebab8fb94mr48871086d6.21.1788338979975; Wed, 02 Sep 2026
 01:49:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260802145109.728793-1-pbrobinson@gmail.com>
In-Reply-To: <20260802145109.728793-1-pbrobinson@gmail.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Wed, 2 Sep 2026 09:49:27 +0100
X-Gm-Features: AcwNN1UlM_Tc8DR5l-MabxNMXioOiMJnlb69hTglEaQjvp97HJXJG9SkJC1Szww
Message-ID: <CALeDE9O1oPtbJ2p+pYbEw9BZOXuEtgO+uhE2s2a8i6XjSo4urQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Some minor RPi5 bits
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Phil Elwell <phil@raspberrypi.com>, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Andrea della Porta <andrea.porta@suse.com>
Content-Type: text/plain; charset="UTF-8"

Hey Florian,

> These are taken from the downstream kernel device tree. They
> are small components that already have upstream support, from
> older generation RPis or existing arm IP with just minor
> changes for upstream, tested on rev C and D variants.

These all still apply against rc1 with the already queued display
adjustment patch, any further feedback?

> Peter Robinson (3):
>   arm64: dts: broadcom: bcm2712: add arm PMU
>   arm64: dts: broadcom: bcm2712: Add thermal monitor
>   arm64: dts: broadcom: bcm2712: Add USB OTG port
>
>  .../dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |  6 ++
>  arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 66 +++++++++++++++++++
>  2 files changed, 72 insertions(+)
>
> --
> 2.55.0
>
