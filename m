Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165F23921C3
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 07:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977450; cv=pass; b=nnrfwHIaP6fCneCLHi4pm2ZNJ6S0Z/1VmnS4Xk83UWENGaT4eLbENgAoTy5tyqScnJAeCG7OjbvvC8zjCgJbpzj4TQ60uWFG+kVx/v6aOnsi/LSr3AaQXHOeO5/7qUfW9/0kCl5WlM7hDkaxBLU3pOWo61C9gqfnDRW6L4Zxums=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977450; c=relaxed/simple;
	bh=bPjlkXbnQLrb0GjdrGJjWhBHHs97vCsRJMBEH+qH2Lo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VQIuImVfCbe5eXNQ6YszXpiUcQGaQ3j8JyzvqLwEglYkP1BPBHW49Ctxa45kPEC1fQorf/iMPQogR9mWnVe0ni4sjsIRfFzREt5omF+Xz5jY2t99/qFuYoWPdRdtNuTFIpnlYQ5WT5id2LH/KtC5JsVe2qhmfCPnEi3JsL9NxzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P5+2GMJh; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P5+2GMJh"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c1268d56234so208926666b.2
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 00:30:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782977447; cv=none;
        d=google.com; s=arc-20260327;
        b=Vn7/73Ofm59FSSZl4SleIVxmbgiQplvE5oL5nkHyTM8wZS0I9+uqRAZqPnnXMOrDE9
         mQwC8JOsUWxeVyI8lsPsZnWexEJBb0DhrG+/ZdEw199UdrUMIO5J8KMND1CZMNk5+d1h
         ZuMSJpEYt0oUke2yrmF2mMco6XEDfvQ4mL0IopAYAEPgVf9o3tL24gYUpvZ9Z9ZrGzaG
         IUdTbc1IsIuXNMSkN+EukNS6rqI+5F5gnDRub/pVK0FnooVRpwobwr9Ac1HB/Ygi9GjC
         bJ/KsHNd3oEZGxLupPLhZ975ctpcVKvoGuqmtggJHa2bXa47iZmrzLu2sISYhWnCEuhF
         ghig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bPjlkXbnQLrb0GjdrGJjWhBHHs97vCsRJMBEH+qH2Lo=;
        fh=cPzNYpD/oxhDayA3vStlVXVfHZNaff7GJ1HxutGTPG8=;
        b=TEGUU3SceMyaGmKYsNLHJp8w7LXx61E6hUJkVMPSfgOrer05h593nyKsovBbIepXta
         G6AeaDr8zY/bjMFCLCbBDfGPBtKJPfPif3ZjNyjl6097Lsx3kRE6LHbT7pbyy3YVi3D6
         Ev+JL8dpFmrTMPit5IpzioszIotAnu85fHuT2AxGbKZbOkhCOgqnyy9wnl8QfgdLNQSg
         9Pwr9vnQdBBDrkHAPLBx/Fg2zdKTmi5f0coznBSmMJD2n+Jb4MMg60AX4VXXHF9+Wnzw
         1cQIWQjd/nDPqfC3abFY6Sp8M1yPkYUuA9/83/II1xhzGakUrbnQ+vrgb2x7P7pUID6W
         17+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782977447; x=1783582247; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bPjlkXbnQLrb0GjdrGJjWhBHHs97vCsRJMBEH+qH2Lo=;
        b=P5+2GMJh2KEmUu/e4RguYrTFD78M03iYeNhDSCmYsvhzNB5+uiCdQ3fF9JUa2U/tWM
         Y5BRqZa0OzHWFFC/ykj7KRln4U5o1l8k89cHBbIj8aFLQNZ/+GFC7N2d9ECe67KXVRYP
         jTWEevdA7NHgRz3LvuoBV0tOLnqlkLTEO1IIElle661gX+A23sGZipA7lbwSQXoA5ysu
         amiPcva7S7Rg7fXVfSqa3ag/Q05Jo4HdJ3volciuZsJjnxK5OwPIhhAzvL/X4viHScjh
         X7q1UD9goyRb7iTLd8fWhQu/k4lW3rBvXqfd2sgglCQaKgC5dM+MgY+Egv/ulAQ2FSJk
         W7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782977447; x=1783582247;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPjlkXbnQLrb0GjdrGJjWhBHHs97vCsRJMBEH+qH2Lo=;
        b=oZkMmJkiheH+gleDqYh6DSF9g+Z/YdxxpvSC6cF+rTU0a/oCSqPdGXuUoH/qg4ss2w
         F6i3tJshsbhSfaZgptguYuvJYMNUF4j4b+1pdObtXruwXXhSDMvffNaQQZrZFriajl9T
         S7ua/o40xJlRfyKV33Xq199wDy6XOj/r4nYx6Il50pWZRMJXMfzTmcdMLyoHV7Xpz6M2
         KU65mw082wyngtNK+NoW7b1DmrCCSnE7cDp6Uvjcyqz14PoR27ZJI21k+h7YjdmujWgM
         cb/R/JMwJnTFAZS7nW+RellEJJgQznGFHX+dPxJuXXR1EZtspFsb+kt5g80TbKVkFOPo
         JwLg==
X-Forwarded-Encrypted: i=1; AHgh+RrwhoW4Dyo6oec6oDIYrm4u8MlX3vgQn57c01SCxDzhoM2g9IaFFFkZR2h9HameOEX2wY0pweoZ3lEu@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/rH6PyfgPWHgTbcmpI/LGtjcvrk+D72fPCTp1nCYAoAOpLrUr
	21kCtvcBjMAoadGVXj4EOoeuPOzdEiM5inuP0J2lm6cbPzs2kBXwbxusXmPMKFPMO8K1uxpvjhf
	RHLKMtpTCylzDkWzvPhdiGiNYxxH/D+Q=
X-Gm-Gg: AfdE7ckvMjw3iFBOBFE/lUDqpOrantg0hz/1R833WA6smfSTzL25j1lxTxnBPk5Axwm
	UP2TJ3n4XLHL227EiEhcfoGZqBLyV3yxKRsXv16Zp0vUzbtWi4FM4sN54T+ifksSLelsHjQUVdo
	Q/eLhM5HObGNYZUO0IKeeXJiK1s2qoWGq92QAwVoJqkqMiegm26VLFphcsYJaHQPjL87s8ibbPs
	9OUMgLilLiZ+lPjgX8ys28uWtkukWk6EpChujc7hQEmRMTkhqt4Ew5zRMO9IxaeFcBfumejMd0x
	6zxOTYJmpb7tSj74rqwPpkfh/QqC16lP+nb5yE9bsM5tIdWTBoCa7QDZenLRjAw=
X-Received: by 2002:a17:907:3cc3:b0:c12:83db:e3ea with SMTP id
 a640c23a62f3a-c12aa14229cmr227716866b.41.1782977447153; Thu, 02 Jul 2026
 00:30:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702-hm1092-driver-v2-0-4f9f369d6a48@gmail.com>
 <20260702-hm1092-driver-v2-1-4f9f369d6a48@gmail.com> <20260702-generous-beaver-of-perception-f2a9bd@quoll>
In-Reply-To: <20260702-generous-beaver-of-perception-f2a9bd@quoll>
From: Ramshouriesh R <rshouriesh@gmail.com>
Date: Thu, 2 Jul 2026 13:00:36 +0530
X-Gm-Features: AVVi8CdU7KatiOHoz-3tO7DGKqQfvZX3ffamBxk1FUMrG18Lr6Ao3tISiYJHmek
Message-ID: <CAJTcUFR08TXjOeQSxdBhoqHe94+7G_HLSrCN00BB8cHmBgTpZg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Add Himax HM1092 NIR sensor
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> This is a friendly reminder during the review process.
>
> It looks like you received a tag and forgot to add it.
>
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions of patchset, under or above your Signed-off-by tag, unless
> patch changed significantly (e.g. new properties added to the DT
> bindings). Tag is "received", when provided in a message replied to you
> on the mailing list. Tools like b4 can help here. However, there's no
> need to repost patches *only* to add the tags. The upstream maintainer
> will do that for tags received on the version they apply.
>
> Please read:
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
>
> If a tag was not added on purpose, please state in the patch changelog
> or cover letter why and what changed.
>
> Best regards,
> Krzysztof
>

I'm adding it in v3 along with changes suggested by sasiko bot.
I didn't check my mail or lore earlier before sending v2
