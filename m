Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFD144683B
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 14:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786458391; cv=pass; b=sjiOSgJgolq6JFvsD04sQaqmlJI1HnyFxeZaW7iO0KYTIdC27H6k4X900r5yRdVAivKF5uHWpBIf4R7BX/GNZ4gQgU8q9wqq1Mu1msAoFZvt4ryqhKCpAd9rry8RNayYiEyszk2NR2tY52L9cneV3K7UF/uWvc2bJ1JIHyq692g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786458391; c=relaxed/simple;
	bh=s7/5014y/KR+YGJG3P/afJKvHIgiUzL2gUAT3eGJZpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pNIFRjrKWKcsximp335NIYWSyaZnCQzQzjkYraC/SjtK2J/2ogClf3hyEQXQ/fu+jmqdD1oQ8VWAKmttm6Ui6v2OxzPMg6ZqFgPdvgBLHBWRGy56plmNWdEZ8CMPC85MxwD3DWBf/Sww8F5eHpQ/gHuU4ogsMRoYJJHDmIMXD4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JAfJXCYN; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JAfJXCYN"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39c86945164so25229291fa.1
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 07:26:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786458388; cv=none;
        d=google.com; s=arc-20260327;
        b=KUoRyzgew61mUywdzoynIPsHv70H+a5Pci53MwDCjYUghMm1oGoHGw7E9uVgbX+93J
         z1NuDqkFdHNW9EFvg2eD9Pbs8AuJbJohksvZoxhyNHd9ntAoH8p1LYamPk+QcWhIL5C4
         dLZmQ5v0L6HMIERGvILEoDp96P9nrIdcVsziuVtTqRFV0kM75CMugK/I4RVqbfcBeoA2
         cxyR+UQpKIZeF47RVaNfXxhZPOmvROYESxwuJQjkPyZmRIs6zK64c2xeIaiHCtxZRoFo
         cnIY3QYUVZImAuV6ZkALlWfUzDyIuzFad29dGn7WS53KWS+GAZXOaNQS/iEw3jsGD9VO
         osdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HFsuYiD0eDbBDQjlEIXUzN7jglq6/iPth7nr4XtXjzg=;
        fh=rmos71ZLgO5Lg5ML6ZnSQBc2qALY+XBnU0v99U6NAw8=;
        b=aX74ien/4PMb2HCGmDpOlAyt81AU8SfQY/H+r1UxvoUPAQdSkEbIya8WoCjXbUQzKM
         82wZWixZ/3bx54kDoCdkvHLLqbcVmVoZE6o2sGwfi/PJJBWEtjywAukIuvgTHBEKrFv0
         TjTy0zH2DsmVzBwgJhLA9x31ySdnpYK/8JYAdjU0kgU1RpfsC+U8RPVJBNo34WU8VLPl
         QWDoo0NjITPAFQ9FWF8mF6mEQ7MO1BeCtt6JC8rWWA/nLLp2bLpm3tq2fpn6iCOfWb7H
         vPLDTqL5n37n/tP27bAX3Vh0FBpx5SfkppYSKdEkYI1jkAeDfiST6vukvXHdImU8V5f5
         FwRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786458388; x=1787063188; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HFsuYiD0eDbBDQjlEIXUzN7jglq6/iPth7nr4XtXjzg=;
        b=JAfJXCYNJf88CbdV2IGtyO4OvNUby/0rsctaYAAb7g4QQXOwAaFrmvGPxwz+gz7vbx
         0b3bsprA1ah1rHcjs5PbTmef3Zl40sTF5tCutRjWfl1OX57hlRjJJ8kT+Ba2qcxOjsgx
         buzATldbiKdcQomKxw2+qY7uq4rpEaMFxuDrV2Tbg3/KsxG6DAdwd+CoOZWUx5JqqE4+
         +uMSG36avJQFK+2v7we3AXorhg/pj8f+GGWheV0EYWbSnxeS3qCxExinRRWsdyEf6v0Z
         Q457JwOXyghn0TGNBKw1ueCjIYAkilFhsImjzQo2kUxCuHsRcZpG4kzDjkbjCmopqIi1
         u73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786458388; x=1787063188;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HFsuYiD0eDbBDQjlEIXUzN7jglq6/iPth7nr4XtXjzg=;
        b=pL86RRTR0B0C71sXMbUOSWAeeHIr0G33rbwg6galdwHr7LzXXrd6ao7CBS0Z0qzjK9
         bV+vOTWUnRGP+3g89IkqfXVXFABfdQx49EZM9fQFd/YBmlkC1rCOY9inV5Ul4Bj9Y2/f
         c7cf5TcrVSueDZCqbd2caO+PJuT1SlaIMHE38Sqmrp2dJkDm4kkBhZrr5fSQJzomtO98
         guew00u0Ha+JlPhsTeF74V3GN7xdP5ilKYujjJV9kOX3OqwEh/5jppuQPWw21tNM83q2
         0L6f1e/k7jAS3Dnk1dmyEenH+kLyX7mUFAiNatj2h9Ki3O9VxrILpOWvXLy3lkZ6y7Mk
         yczA==
X-Forwarded-Encrypted: i=1; AHgh+Rrhrsg6W8Q6+jCUVJekj8OYVB5Dj/37bd+MyMy6P7LTeNPtFfLK20CncELjggwAzUjyUpXraXCcBf53@vger.kernel.org
X-Gm-Message-State: AOJu0YwEbaPawCoO1paJDGGQo+3qw2h0VOdbZmAEbvX+eW/NdcvirV8i
	2c3AsznG2KOwFwummgXPwOknkvKyMQVw6HfOxUaVshYZeUe4qZxWBupmciVeCGG33TIzNNUC1nx
	sbh2aeITYLEbM/wDuv8yCxmlINCS5X3A=
X-Gm-Gg: AR+sD10sHHFhEcvriJpgoVdMOKBziXfG1eg3SetiNJyZlwKyNugZuUWcZhpdlOTv/+m
	S4xGgi/bCQl7HNcj9K8pUDZTvQqmw9DCI+gwUa3HjjZh9UOyniS4w0jdwF8FnX+hx+u6wb8b7Cz
	GkPeuwfda1snb2yCtTFKYHbLbYSjtD0thrkyllFEPmi3sdRL/didCvz7PyxjLmFXmJhrL2FgKc3
	kDbT9QBO+nB7jww78KveNjJUCjWgXW0qb1XIS4ZK+HnS5GNtEhdydBuEaioJOtQkGppwdNrrDB+
	OUTCn1tzH6tNt3ouKm2L2+Zo+PxU03lRccIdwAdp5k/fzf9h0h59R1UjceeJetdL6L/rFvWBoE4
	uLKZCFSARdwBZ3LFPUeH+TyP4FlkTVVyQg/SvLyC/f3euxg4kCTZbalYgfTFDMoW+
X-Received: by 2002:a05:651c:1503:b0:39d:93e8:801b with SMTP id
 38308e7fff4ca-3a0f8d9088bmr4687721fa.22.1786458387881; Tue, 11 Aug 2026
 07:26:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730173643.256052-1-kieweg.leander@gmail.com>
 <20260730173643.256052-2-kieweg.leander@gmail.com> <20260731-petrel-of-fascinating-finesse-cd10ae@quoll>
 <CAMwcS0hupV50NEOX1Fsi_tzRYXBecaummjAm=CFHO7xOT1uUXw@mail.gmail.com>
 <c5f760db-2235-44c1-899c-b6ac023b3233@kernel.org> <CAMwcS0jTwpigztHBTLv_sgFNLK0ERHDMzMGsBdi7josLHw56-g@mail.gmail.com>
 <f3fbdc3b-6ae8-422f-a161-8936ffd82abb@kernel.org>
In-Reply-To: <f3fbdc3b-6ae8-422f-a161-8936ffd82abb@kernel.org>
From: Leander Kieweg <kieweg.leander@gmail.com>
Date: Tue, 11 Aug 2026 16:26:16 +0200
X-Gm-Features: AUfX_mzIwlYwfI--6_3lWtHQX0aoa-u49OuWteOKOtIxMK3649W4Ay3R76dJT3g
Message-ID: <CAMwcS0jUNcVwMkpxSjToyqgVEPqeScz4WLHLQAtKL-VMNXxgqg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: Add GlandaGPU binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, u.kleine-koenig@baylibre.com
Content-Type: text/plain; charset="UTF-8"

> I am fine with small projects, till we do not have surge of them because
> anyone clones some project and vibe-codes new soft-core.
>
> Projects run on your personal github, without any organization, do not
> get their own vendor prefix. Why? Because then you come with another
> project and want one more prefix... Personal vendor prefix would be
> fine, but different thing: this repo for your design was created a few
> months ago, with one contributor and ~70 commits. This means it is very
> new, without users.

Makes sense. I'll go with a personal vendor prefix instead, e.g.
"kieweg,gpu-1.0". I'd reuse that for any future project instead of
asking for a new prefix.

> What is the benefit of having it in Linux kernel for the community? Who
> needs this, outside of you?

Honestly, no one, probably. I built this because I wanted to learn,
not because anyone was asking for it. I actually asked about this
exact concern during the RFC review, whether being a hobby/non
commercial project could be a dealbreaker for mainline. Thomas
Zimmermann's reply at the time was:

  We already have a driver for a RasPi-based USB display that
  someone made in their spare time. So being a hobbyist project is
  not a problem per se.

I don't want to pretend there's a bigger community need than there
actually is. If that's not enough for mainline, I understand.

Best regards,
Leander
