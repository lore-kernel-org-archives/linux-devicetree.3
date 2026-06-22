Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E21B352F95
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 20:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782160733; cv=none; b=h44D2UgkyHvu30HIq+unzuSBHJcPwyLIzJr+nRi9juVM9IV0DOV0ryqfvvzCJhIl2zQV+0rnadACcjj2msc3OzDWbtoAUB45lJ4qIQpHuNnKkfNJ6mBD6obhgGU4VnGN8vqCByQ9mc1xHLO0On8KTow8LUC5oI0fQ0BYrwXS0Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782160733; c=relaxed/simple;
	bh=f/eI1igp0jhTQQcKbkxniVkr0wAf2k+Z91+811cqNa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HzO5zf7zjQmMMG7LOmSo6J72rJV3qmBZO78Dk8I9mRxcrYzdj51uFpIGz/8B3ZobstuuyKXVAMSc0Q6GozlRjrgItadjgQ9+c0qAml9CXIRtDicBawLPLS8Ads4GhOqAXVfhZMEEnfrBFZ48JUray/wycNNkQr8oFhHm4g2cGRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=eOy8hlSe; arc=none smtp.client-ip=209.85.214.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="eOy8hlSe"
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2bf125989f2so30471885ad.3
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 13:38:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782160732; x=1782765532;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/eI1igp0jhTQQcKbkxniVkr0wAf2k+Z91+811cqNa0=;
        b=PPdz+inxN8zrvVS4Bu6kk57vkG2U89jqOA0YeBk2erckR9LHgJB3kiDlGutfKVG4GW
         xUgdiQL58Ox/jU3wyQh5KuwCzx7B66L853T5O/NpzTLcrj2udceNxqvSGxRIudgbKA15
         dPU5DwWMhajuQDTdKW4guOa9A07L7x2QrkbJt9Ay6f7XpTJqsjWOf7NBKSFwaZONpOTD
         PtwqqrB6ea1CCdZaiitP4sBBkF+i0kIcaivzfQYhQ5ODob8CuPq13gOdAcJ6LMJfUg8G
         0YjWvjEamD6uYySl1uDj3aLzQwGVcXYvQwVnR8B0pU2ZKMqGWmP1xBscqMBQ7Qm04STJ
         50cA==
X-Forwarded-Encrypted: i=1; AHgh+RoHoqRVhbgQcCy8g3/E0OnIuuO5IExsMcHbN6oxHH4HEoPqA8I2WTVVYxG/lgdPFO7Xsx7rAnux+Dc4@vger.kernel.org
X-Gm-Message-State: AOJu0YyWQYCaKIbs0L3ojIYfOjQZojagVWfqGLndINQrLHYPi3ti1OZM
	nE6WUlpULdeCCq6+E6yyne3ReJ41JZ3u0j892a3tkSm9StSivc/rs9vMxZcR93vmMCb3B9WUykI
	KVsO7T+tblxguix9kChAXfqgpMbrX3UAsKj1/2JHFDEinT9ER9D7Pxn/ouqGD9tJ5757DipxZVp
	OyEeVkBWM66+PqJkRoJabkd2s/pIj0EsLMpG8LywxQPQizeDfO0Ez+vfTlLdLarW3ET1OJC1xYl
	jyVxg2deEhmOVdyI6U=
X-Gm-Gg: AfdE7cmDJ13GgCjtXSCLxwSpJrPnMB9XnLPuwh3Lr3Eom2KqJcJNaWaprSYeQ0rDjOE
	ssh0Dg/nqFIoF2PP1h+Vr7xQATqWk9hI1JYPo6xpYj74hbGA3L9yz8z/tAjFClxBdyA5wH6TsWY
	iCMI2GOPCN8hIdEgk4XN12frS77NFZhaXuEThlUNKOrnQ6Kn8//ojqtN9VsmcTzcWNBTs/1zkeP
	vbkEZ2aURUglNVXic6LDfwYASplCSRRMuZ1hxQRUSQSQNXkcl/Wb+vSbkdIrK2UuPVohvSUCRDS
	K2TKdt2y7UpwF1NObFLXWDb8VRcxjx+WeZ4cqkoQ5Gjlh7Fb6exCwG7Ldfs3j77HhtZXHObemzx
	CRxuFOWH4MZgv9aNBxPJnF/KRHhrBMo9cl7xo+uJzud7B5xIC8UY3CulDL3X5AhhlcXsWgCf50R
	jEkvHVkqz1hxRE8DIZXRymaX3zlVPLSGEJ4AsvYBGH4MMxandO
X-Received: by 2002:a17:902:cf03:b0:2c3:bab9:4961 with SMTP id d9443c01a7336-2c718f856ebmr181332605ad.34.1782160731372;
        Mon, 22 Jun 2026 13:38:51 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2c7439cc38dsm6939795ad.21.2026.06.22.13.38.50
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jun 2026 13:38:51 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-696057a75d0so4565332a12.0
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 13:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1782160729; x=1782765529; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f/eI1igp0jhTQQcKbkxniVkr0wAf2k+Z91+811cqNa0=;
        b=eOy8hlSeglB0zra+mmRodiLy+WAEoXSHFldpEpQyYKr5qWQdkGj0Nf4L4YAzQlycQS
         f+K+kwQN48HmWszYYlOcS4w2/BxRRZ8q3s2Mv5v+NcQ/syVLWbTHeoV1nFzaFJY8X8Z+
         hbkTbpUBxOambYiJqDjXnrShe+VekN9okZ+Ok=
X-Forwarded-Encrypted: i=1; AFNElJ9BWerVjbRxvLkyNgik8fvfRCk6/jSk8+P3R9KirrCEJXw2+VAyNo1attt32/d7VQfRuzDVgVDJ2gqk@vger.kernel.org
X-Received: by 2002:a17:907:60c9:b0:c07:6a7e:3a4c with SMTP id a640c23a62f3a-c097cbc92c0mr971238166b.40.1782160729185;
        Mon, 22 Jun 2026 13:38:49 -0700 (PDT)
X-Received: by 2002:a17:907:60c9:b0:c07:6a7e:3a4c with SMTP id
 a640c23a62f3a-c097cbc92c0mr971236666b.40.1782160728684; Mon, 22 Jun 2026
 13:38:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231205184741.3092376-1-mmayer@broadcom.com> <20231205184741.3092376-4-mmayer@broadcom.com>
 <e63906cf-9f76-4fed-91b0-1a9168b179bd@linaro.org> <12f3c515-71cf-46a5-ad92-15bf6c4c2f2c@broadcom.com>
 <c483e962-a565-45b0-91e2-41f47e2cf4bb@linaro.org> <CAGt4E5smwohGsPkvFOY8o270mNQnTkSWz8UKh3un2=XtEibzAg@mail.gmail.com>
 <CAGt4E5tGHJFXswic6vTx-ThN2K9xBtO8oA4ybrXg+q5cA6GYCA@mail.gmail.com>
In-Reply-To: <CAGt4E5tGHJFXswic6vTx-ThN2K9xBtO8oA4ybrXg+q5cA6GYCA@mail.gmail.com>
From: Markus Mayer <mmayer@broadcom.com>
Date: Mon, 22 Jun 2026 13:38:36 -0700
X-Gm-Features: AVVi8Cdf8blAzch-m_uqCV7tC2oS17aknTGmI48yeh3qAuFBG7a4R9Q-ey1Q_vU
Message-ID: <CAGt4E5vemtkfpdz8k8mS5LeZF4SzZSgm0d7OORtDonagF=hwYA@mail.gmail.com>
Subject: Re: [PATCH 3/4] memory: brcmstb_dpfe: support DPFE API v4
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Rob Herring <robh+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>, 
	Device Tree Mailing List <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Thu, 28 May 2026 at 14:45, Markus Mayer <mmayer@broadcom.com> wrote:

> > > Thanks for providing justification, quite reasonable. A pity that none
> > > of the commit msgs answered this way.
> >
> > The real pity is how this API was designed, making all of this
> > necessary in the first place.
> >
> > We can definitely spell out more clearly in the commit messages what
> > is going on and why all of this is needed. I'll pull all the pieces
> > together from the various responses. As long as there's a way we can
> > reasonably implement what we need, we'll be happy.
>
> It has been a minute, but we'd like to resume this effort[1] to
> upstream these changes or some variation thereof.
>
> What are the best steps to resume this undertaking? There are still a
> few topics where I am not entirely clear on how to better explain
> things or how to address the feedback provided. My apologies for that.
> I will do my best to address whatever concerns there are.
>
> Should I put together a new pull request that contains improved commit
> messages and addresses some of the feedback and we hash out whatever
> questions remain on the new thread? Or would it be better for me to
> reply to the old thread with some of the questions that remain before
> sending a revised series?

Any advice on how to best proceed from here?

Thanks,
-Markus

> [1] https://lore.kernel.org/all/20231205184741.3092376-1-mmayer@broadcom.com/
