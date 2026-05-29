Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DAA21A92F
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 12:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780058843; cv=pass; b=VfrkrWmsxB8cl2DYPoy4vfhrkSPRuw0PYOhTA1CvIFx5a6EVsiK+8J0E518NdWXAisxI76GUc2tYW1cQ98Y+Y7nQbrljy5btVVjHWMjiYSnjp5Ws5WNm8by2LYPExS/T6TfO3qYGzx0E7T++q7sR9yF0Uinp5UR60FAhEZOOMVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780058843; c=relaxed/simple;
	bh=gxNcfrriIjSv2ErPB2KszZ+tnSTwuzgtq1xME5V2rQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pM3G5zBm8Iwsrc2joiUOs9B/RJZLDAmZxq3MbOqqtl3/qfsmFjrrAjq13t+wpOWJqeSMwm6NyE1JCO+AplYIgSdH0aYNSQNCl9G39ayYk8rD47T4rwxeAQ46Vi68/e0bF/DZen+JJiOflGl5mPLCkcWT046m8M145F0z7R3rUhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R/5YKOQp; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R/5YKOQp"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-304d0ac5e3cso394573eec.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 05:47:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780058842; cv=none;
        d=google.com; s=arc-20240605;
        b=Z22GTjTL44vxQLePMZ8/aWHgqC3XV6sRGE229HTa5VN113h2ob3SFpjHj7ut/gCiVo
         oJQ6zZrpkJpKoQ2l5SkCn1W5ZaNFxkDsoePDLR2NW0g7q2Ja9hbt9N1Wa4qFFkh82w6N
         PKwI27qAxtelQwQH9rV94r6NFDXNb9PBEFRe+MMbTkgkcm96fVMxc8Z6zf+gbFMzR91i
         vKxNkzEmpPocN2Qz7taKpBm+7UJb1pbZp57XwJRn4lsAgZgnbxztr4T0kkHAZzcn8eBz
         bGFhb/ioanjFb5I3u3JoZ1x8sVHtxAR5GXP1pnhyr6aY0ZJiPzaj8vrnrq81ZTPI+0DQ
         aPmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kxd7pDN4r+x1pc20wnNZSk5uzpveedLJxkfd4XwHmSY=;
        fh=Dlyy98ZUaWzn0VPXGZ1eO/OPDZI1Db02YvBbnKnaXdU=;
        b=OqKsGp3z/tISlaoJWPZFrPDg5DREaeV5hTEeiBxvtQyAStFFbTfM/0eXySTTbSL1CV
         ga9uxk/qni9Tx0dTlx36o7yvA85TwrQTnZFkMFIpI03wN8OGEefz42w8qPGZfSSfnCGM
         SR3v9frGLRerS2Wx5DX6IoIEJWTRv6lR5lr8+qnL0u5Ne7PLR3Yd1bbWFtYIfRAbq7i1
         WEt4Ewpkxmwc9irWyRTybFi4NRF04S90n9sYa6UaFux3TUr2IG1e2dsYMD6B0o3HlgZe
         De0Zj4m9LZr7aXB97HzfASDO/TaKWvBItjYnMw1kKAXTV1ZgI4J533xgmacV/XzEOxXk
         McBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780058842; x=1780663642; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kxd7pDN4r+x1pc20wnNZSk5uzpveedLJxkfd4XwHmSY=;
        b=R/5YKOQpsW9pcJs4cZKhF2RpxbLFZbFV27A5WWjHHAcmURvyN1FQ/6Cm6dv//GrICP
         iCkYDeXFR5uEDsA1BLuPbncwanrztBiPD/CuXO92m5msQZYZd9kKFAbwopRnmlGYKvsY
         E2ZcPkmidNZw1YSnoWIxiuNXqpdyjYF3RZmzgRo4WYjGkSCp1gwmwYdIRU2MI1475vXW
         y88IclEbFoW4+/cYnBXgeDeiQaDxx4pQNjCxWXUZ0GL9cFwcjbeuhbgS6TgRvqEE+bai
         STpxk0So7ENoB5hDuOEASgEp+FnfJu4evTHGFIqjLcCVK68Xp+gIvuAayz6at+A9998s
         /ubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780058842; x=1780663642;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxd7pDN4r+x1pc20wnNZSk5uzpveedLJxkfd4XwHmSY=;
        b=j1vrIGViXSTtDcK4mIcNey5fzyQ2Lu98IizwsTxDrpfSnGWDFTjN7l0i6X1VXrHfp9
         eKZzSTEXynL1NjQkSK3esCVShyyaXo5I0RraK8ARdL3ztROpDCSkZNN3uF9lEolfwTJ5
         KvGEWe3lrxBj3p5h2rCcv3bC+Nng/iNMUafrEGrF4pL6tV0L+kXZ/fYJvh2nCxYN/mME
         YY7Vmu5AyPPu/BALt14aQye1rXhp5CHuNgGxylDdeurglYxksUZWieQomW9W2sJ8Kqtd
         /SvZ3XUt0eiH1VAiOo8aJdsVIfyguNiaCGJ/mfnzJMPPgDZy5bGofca//3SUdmblqEuD
         NgZw==
X-Forwarded-Encrypted: i=1; AFNElJ8HIBCuozMzlmdB18Rx4ePuZLSNUhbjQmVhflL5JedLIdRi5a0mB48XgYkmwzEa93TdSSWXCQ7PV642@vger.kernel.org
X-Gm-Message-State: AOJu0YwrQ6S/KINxAQW9ArIXEvLBu0AmxK+QpwUKlEMrsP6y3qojZQ+B
	4agCQ0Aw63VqcTlMTE2KO5CMwKn+y/a2W89EpO1Ki6fCIwYS8NIprEoJsIcwd1LBiP/nIdXaK8D
	EbhVCxK6xNsR6f5BaosMx/swsIuDD0aA=
X-Gm-Gg: Acq92OF329UKt3IYgj/AJuYmcajPnPqHyNAC3FCQ6RDOxz5ZRi+1l0cJnQ+DNX3bbcs
	1Q0tZp9PDz88XrGMzX2bdIIpPZI5dhPaOTMICE06c1JgXM07TNQRkwG6cIEb0VSSYL78UiBwbxX
	A2T8oIg2o7fkndiQgVDWiitHfekQFW5o9WyB6yv665mkQapHp0o4eeVhuZT2Z0/z6ZvzofZFMYq
	ZdjMOHiIKq/7emHNv5Xtv+/dfOaukRv4v3oZG4s/cF1hyOd+It9hBbBoJybYrmHgTMQFpxQ9Q+F
	Mh9xtxlavPTTqxyqTS2B+2Saj2Su3n4dQ/5Zn5iHFoAbBCVi2HsTe0C8MatxFTgOFZZhHf4O7C/
	5hKb1Fg==
X-Received: by 2002:a05:7301:2b08:b0:304:e7ca:4b62 with SMTP id
 5a478bee46e88-304eb106cddmr1229257eec.3.1780058841699; Fri, 29 May 2026
 05:47:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260524085312.15369-1-kimjinseob88@gmail.com>
 <20260524085312.15369-6-kimjinseob88@gmail.com> <20260528150636.38d8e091@jic23-huawei>
In-Reply-To: <20260528150636.38d8e091@jic23-huawei>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Fri, 29 May 2026 21:47:09 +0900
X-Gm-Features: AVHnY4IGxGowofBHcDiPlgbcncVC-q3E32X35d6DaNb4JwsYtVV5e3x015JdIr0
Message-ID: <CALMSewK0pL7hgRQsgn82zb0Y27RiQVxY+oj7nqRDQZ=b8cOPzA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 5/7] iio: osf: add UART serdev transport
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, May 28, 2026 at 11:06:00PM +0100, Jonathan Cameron wrote:

> Various things inline.

Addressed in RFC v3.

> Why is help text talking about a patch?

Addressed in RFC v3. I updated the Kconfig help text so it describes the
driver rather than the patch split.

> You zero them memory before passing to this.  That seems like a sensible
> pattern in which case this memset is unneeded.

Addressed in RFC v3. The unnecessary memset in osf_core_init() was removed.

> If these can happen add a comment on why. If not remove them as overly cautious
> checking.

Addressed in RFC v3. I removed the internal-only NULL checks in the core
receive path while keeping the protocol and stream boundary checks.

> Perhaps check ret in each of these and return early if set. Then we only
> do the shared path below on success.

Addressed in RFC v3. The receive path now uses a simpler early-return style.

> Given there is nothing else to do on error, return -EOPNOTSUPP; perhaps.

Addressed in RFC v3.

> Given these don't match up with things in probe() please add some comments
> to explain what they are undoing.

Addressed in RFC v3. I added a short remove-path ordering comment before the
serdev close/reset/unregister sequence.

Thanks

Jinseob
