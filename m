Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0709634678E
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 11:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104629; cv=pass; b=KraN8toZMjPiF+IiE00WQOnT7pEYdJNaFm+4DOLxALQdgzfjVpAwiU0RwVKRrBIOfWEweDxOJgdJguoicY8TFoOvTVCKFktkl1dYDMX8b3w4YMHKDBAipAIC0LKMsd4KSHMWus5sZzS8Ba/1FkpaptoAddb6XqoXBoTsi9JqWY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104629; c=relaxed/simple;
	bh=rRAYjqwlB+OxplAp/qyDNTlYSuMhMlrxJbK2n+hb2TE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DQYmYyHeaPLTrrL6/q1fZvSNC/4SrmAl+81izVD7eWw+6KP3/b/aT3T6/USvjkk/KNFZfhiS9xiSfawC924Msahkgvu7aF6xvP6Xf4AmfQ4WWdH854bfUoyhlOUPP7oDoWJXRpdcktG9oj7+6pl/TyagrTS+lgwlTNu1+op7QoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=krFb0vYv; arc=pass smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="krFb0vYv"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-48270f099d5so1812328b6e.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 04:43:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779104627; cv=none;
        d=google.com; s=arc-20240605;
        b=ekd5Yx6P0xJce5hTPcfXAHURrlv7p1QmS7yixEWj/by7bIMF7kCh1WAD/Y/nVpBSbn
         dO8QC+dcYKxpccBsk5YbBB4Pw8pTZZ8Kg2mELIWkWIWUj+jAddAoFZVNEAqQMCKYTfyM
         zAhBr9trTzvZ5JJQYQjIr5thJR91JqXmdZtdTZQs8hqMHjfWyoa4JYB5HYnIgjS/m76j
         36mPMOH9LQaE3anKTeONwROGoQoF17K999gI08mKTibgzz8yTDcnSPg5tEioEDbW6chS
         TJaLd0vE6pKMVCqSHOQr19uT9Ua45SDW1YAWyagp4EOdXAK2xq4r3rKq64manHjrZo+A
         MpHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rRAYjqwlB+OxplAp/qyDNTlYSuMhMlrxJbK2n+hb2TE=;
        fh=z/8WklfBvFCixGp4ttxha9rGIUBLI901mWJwpKiP8yE=;
        b=DUIAOPdjvkV3N5dbd52DxyMFCro77P33Vk8cPcenuB/SEChn/3ocHVxLE93L6Qb+1l
         WuM6dWveMdEdI/x7S8OJsURszx6JogZ67c5V1vUs9vt9uQgJCUpfO0O0oBjg5V4DOdE/
         TpNNrVtJJkFYNFr49YgyokqL4oUFJKqQ/0sXpI/Z9gfMsKnkzk9sV4R3TA00RZ5D6gKL
         RFqYJMFsqKXq2quvUcj3Y9vP9U65uqWHTBcTlRB9s4Tq4s+t4+V6JvrKg3je17i3+C40
         5HVon2Yiax9LShz2aqLBuMpNtdW8OAlTDeeoJ0h9sj1fS3EpiUvR/28p1RAWEgjmWWto
         u4kg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779104627; x=1779709427; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRAYjqwlB+OxplAp/qyDNTlYSuMhMlrxJbK2n+hb2TE=;
        b=krFb0vYvhGHSwdPLGfjo2Bl8bgsF60o5tn5Tx4QfZWInOaY9385QtflOf2BV1ludm7
         NnVBJ+5pNkYMfAnlkxsCpAsE5CwOVH4Tb0DP5rd1rzOYtgQDx2fN0uQzcgv5ukbnqdIp
         Rcdn6Vc1CdC3j3EhvMOebsXi8fPHdsnRTsq2bvtjLPrcdAOVPXaOynA70Yg+TR2IOdFG
         LxR9i5UMYgsgkaBTHAwduIt+SSAwY2nEol6NQbRLfeTBpK8RGYhqBsM4sNm0+TAwskoD
         WL9GgJ6jWN2zU0pFd6haXV6oNaW8IawTflwUFFJVIMWrRfbEg5cSERtj/+o/gFTmG7R4
         Evag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779104627; x=1779709427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rRAYjqwlB+OxplAp/qyDNTlYSuMhMlrxJbK2n+hb2TE=;
        b=IOtQeev4ayXchJepYr69jT1ohZDt73kgsumjQ1fT7Anuss2O8daMu6fMcGU4t94s6e
         nTg7UfoDZpofymbDOLbAn72EvajSVAGH/xs3xLky1jRZsBDq5PTpvcfn9Tkgi99RpvNe
         DMVqFamdNEeOLJRm52B41PSTDAs3JoUxVbJc1iH5P+XeenqflzhmhD89On5Iusp95P2R
         dnJ2ep6pnDuA5Jy4AGPeo8ZkHBzbEPivugv5qhQbvYLQ5GVoSlXYdOhUxi0Xi6lSDTxO
         ylF8djxKP5eNShosUD06+YuG4EeCa8c3+/aSL0VPSJa0UeqB3ciskGG2t6SStMzxWCAy
         nU4A==
X-Forwarded-Encrypted: i=1; AFNElJ/0YG0HO67FP86x8v6ezMYuDQKaZqV9+JuwTlrhxcHVhfPMAbnwLI6XNXq2h7Fflc1er8pp86rT+wyN@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu+GE/Yt4lSskvrzZ764djGaEB9CUW7+7evnq7tmXnQ7XfI4JG
	ucgKkYjOtPha4JncyGW8F5M9lq5cOmDucZL8UaBD1y/FR+Yxhx01BfaPybzEneq22eylkW0GrmQ
	jQKDJ5YF6jWiHQptRKfEwiLfvurMYqCY=
X-Gm-Gg: Acq92OHhST4ZQb+55fY/9q0nu6h8CfMy2FrIk0C1idn+JK/j0dWCpq8w7/eJXzqCPNG
	7Xe8dK0sNnyGVgfXuSEnpXKYQMoR8Stc0/hD/OjvFOX+s6sghwqnD2wX4NHUml1TYOkMtNjP0qB
	dSmtV6EczO19PA92tGZseijBqENkD7tABSaH6c6CjBLeHIvV+lJV5dIVTcPxXhfEoueMzroFoKS
	bOF1NKKfa5ch/2Pxx0xbqCXVWKJZfgdwBcSVdKVTzajSjL+jcuMQUVwRrLWpmLILL7aN0C4O1Qi
	gS6JFnQIO4ljiRhL3qCF7NKtKGu7ztRMD2DM
X-Received: by 2002:a05:6808:e412:b0:479:f9df:ab44 with SMTP id
 5614622812f47-482e576d9b8mr7135028b6e.35.1779104626807; Mon, 18 May 2026
 04:43:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
 <20260517-sf21-topcrm-v1-2-438f2e0513ff@gmail.com> <agryR7TRtYeILSeb@pie>
In-Reply-To: <agryR7TRtYeILSeb@pie>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Mon, 18 May 2026 19:43:35 +0800
X-Gm-Features: AVHnY4JxCy_yj0ct8SUGbokzSlNpNk15B0EZlHkNvjOJV4hCGN2eYVdaxEIO11A
Message-ID: <CAJsYDVLvA_ASpctsC_HKA6mUMqp93J58c=nghCeP_jWpzkaf6Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: clock: add binding header for sf21-topcrm
To: Yao Zi <me@ziyao.cc>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 7:05=E2=80=AFPM Yao Zi <me@ziyao.cc> wrote:
>
> On Sun, May 17, 2026 at 10:12:56PM +0800, Chuanhong Guo wrote:
> > Add the device tree binding header for Siflower SF21A6826/SF21H8898
> > toplevel clock and reset module. The header covers both clock and
> > reset IDs provided by the block.
>
> Would it be better to split reset stuff into a separate header in
> dt-bindings/reset, so it ends up with a clearer structure? This
> shouldn't cost a lot.
>

Sure. I'll split it in v2.

--=20
Regards,
Chuanhong Guo
