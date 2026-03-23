Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCA25C613
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 08:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774254379; cv=pass; b=ohjj4tZFtYyUTEZWbWGaUFUyznaW+GJGmbboFUZO8GtGn91bx5RZfs9kJdumG8obhqrTkeXnAXl9deLwE1800TrtsjnxSqwNYjzyWTv9JbipB0DUy14bZJ6TNifeZLbUTmcT2xhVa/d+MCqullgFiqQrChMAqlilhyjwPbh/Ht4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774254379; c=relaxed/simple;
	bh=Ewr7synVuzHzHm/axWuA/egZCARyhrqnQ6eWhyHoFrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HPsjYuOa7VkXYUrVxKZB0i1PLcZcrto3dsnuWGKuAewydtEarRRvXhOTSH2Uxb7Rmw/Vp25ihTBVx7Sjn26PCfW6JRNUAmLPAEkUjCUd/mgtzAyrTcQ23Iw02hRVRi4ZDrd4w941ySoaBrLHzhUwWirzWUQHv3nwY4CwlIampQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JikqKDjH; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JikqKDjH"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a142464316so4162831e87.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 01:26:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774254377; cv=none;
        d=google.com; s=arc-20240605;
        b=DrAfnxRv/inMkFemTf9GC7ss9ZIo2oQIiM+rCNUk9elQFonF40vJdfBpLWVMgEFxfT
         dWmYPIs6/Lj5bmFZklLvUaTCmiX5pmv/FYtCMZFlYjOdEDbHDHx3C0upv+7f8ypobwTm
         YDGgETXrxCaCyubuItX/1DO5J3MKfamX2cmHF+jkPHrkvcoEjsk3zTbqRk9tNeLqkl6P
         hOw5hePfAYYw/qsk/L7FLjR5gWwMg4uXj8visGsXR7ddSBEh9twEOH5akd9vbgijeI8U
         xU3+9WF30ZzPMAWPynCRFm5J1gT1dbWHUfDkx5vDWdQs2ep2Q6iS9DkMxSo6Glgs2Kuw
         KZ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ewr7synVuzHzHm/axWuA/egZCARyhrqnQ6eWhyHoFrc=;
        fh=Ba+NMUo68Tm1qXQDN5Uy95cMhyXaF2HJQQ3bk9bkGBg=;
        b=S8DEL4PhEtvHbCkBG7whxHU7hZcCFDGlPdhvBd8fQpLqWxF1O78AmICsjxybYlV4Zg
         l1hS63m8eKIasSYHjuVi2TBbaGySZhfBtOwgtE47GeHt11FeVfeM25CZCza7wrcgaErk
         iw4UhBD8ir7vSmDn8WEzn2/xad5byfzzM+UdC+Odzi2Hu0zMjUF8LLfXA58pBSHtkOgg
         274RQ73eY5ySncb61CxIAhu3RnEOgsHJ1Lhwel7CtCRgiw+YRn+NUQpO3+VdIfk3n4rJ
         4SSfjLQW8s2QuPH9EsUzk7sK8exX662cNUgCmdyczGO1CV46evF/1kI+GO8xsnHRVd5a
         CDaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774254377; x=1774859177; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ewr7synVuzHzHm/axWuA/egZCARyhrqnQ6eWhyHoFrc=;
        b=JikqKDjH3DpkeYJtvPV8O4+F795sWddFYj2W+wrGTLHhP/jR3DUA01FwtWF8fIlk5L
         7vDwaq1cHWS61MaDGMn4JtOxO3MyaCRm7yp3eQQi1GFa0XlsYgxHMImdRtvLmUOLUmBl
         2CuCo3RCAkxUNuJROKSb7NbkQKZvJE1jCtH9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774254377; x=1774859177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ewr7synVuzHzHm/axWuA/egZCARyhrqnQ6eWhyHoFrc=;
        b=Ru33EF+y9Q8eesKahM3LE3Gq4av4I1CxHxl1XWvh1nyGw1Cr8Hv9581Ib5lhZKObSc
         x7uT3qfrnmurREOUBdVRUUb7QZ2OJcK1UX4I/Hjlg9FNd3QddgHFlz6s7eWdKaPzq6Uj
         YIeHU/dJW2Lsndj4VoED5KYKvKpgQp/k4v1HrE9LmyTtUpk6m1+ceipmyR0Lxmd4PvD/
         rEmCzGVg+YN9lM98414opmwKcLxo6UnlUplotML5P/n6LGD6s6mpnk6NhP+ZXoNkblC5
         8iYYkonH7A7wdMtPQ4+pZmJc5POploZZgpPyaRHfm7hQtmRkWaa+RyWQfeEeOqE2zSuX
         N3xA==
X-Forwarded-Encrypted: i=1; AJvYcCX5kvcn9XsBTSs778Xkells4kKJ4o0qraLGPTInUtEAAhAlNSVC+VwAIFmXqbmJd/QnpNmR44VtiqA3@vger.kernel.org
X-Gm-Message-State: AOJu0YzT/ECzuJt/+lPmUgU4wFR6wbL5JXIsx5FByEg13VprgzGzF6wc
	S7jJRSZO7I9AA4Tgnxl9gJOxge/vU8tbls1fTG+WMQ3r9bYa48zjhnJNajXSog1OWwAXcRaRNfq
	Dx+Va7drBnTigvL/kNfmg1MhdUadmpT7lC9s7HbAl
X-Gm-Gg: ATEYQzy0oq/SmEedI/l9I4Jha/SBg2WhVMxWIpK9YeqJ2jB81JpkMCYtNBX7djby5Bf
	Md7dMALkqVhKwSh5wd/lOSt3dWGYjX0ETfkp57RoOqvi39UfGXfgSfSjjSx6IzKJHllLJBS/CA3
	lqursw5oSmNoEdySoHQG0+mz1v/4HQJK/qLKMokxYlYr5ewD+F7u2fZQDpNlaK4MXqiC5nYIBva
	of1eqYiT3XpPcHmUNYRRO4PO2SC+HmBOaNoxlfHEprcJ9WQxhDyIKs1fGoo66EDvJqVwN2jRJEy
	hHIjaSVN5euMe6cR1oLt6Iu3M2JDJlVFBEGJ7w==
X-Received: by 2002:a05:6512:2398:b0:5a2:7aeb:e7b3 with SMTP id
 2adb3069b0e04-5a285b5a313mr4975966e87.29.1774254376478; Mon, 23 Mar 2026
 01:26:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320072440.2403318-1-wenst@chromium.org> <20260320072440.2403318-3-wenst@chromium.org>
 <20260320-dashing-crocodile-of-emphasis-2cc43d@quoll>
In-Reply-To: <20260320-dashing-crocodile-of-emphasis-2cc43d@quoll>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 23 Mar 2026 16:26:04 +0800
X-Gm-Features: AQROBzDENi91NMB6TuyZQ44MdmtHHQSMpI0v-6B3nRxQpz8HCuyYhfE2FGI06HY
Message-ID: <CAGXv+5ESnhsVfu5pWf1DEt35+10ZKTgJ5G6DuJC4s6yEpRH_YQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] regulator: dt-bindings: mt6359: Drop bogus
 vcn33_[12]_* split regulators
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 5:54=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, Mar 20, 2026 at 03:24:35PM +0800, Chen-Yu Tsai wrote:
> > vcn33_[12]_bt and vcn33_[12]_wifi refer to the same output. There are
> > two enable bits in the registers so that BT and WiFi drivers can toggle
> > them separately without any coordination. If either bit is set, then th=
e
> > regulator output is enabled.
> >
> > Unfortunately some of them are already referenced by in-tree device
> > trees. To keep backward compatibility with them, keep the vcn33_*_bt
>
> So you drop "_wifi" regulators breaking the ABI, no?

Indeed it is a breakage. I kept the *_bt part to cover all in-tree
device trees.

But the representation itself is broken, as explained in the commit
message.

I leave it to the platform maintainers to decide whether this "breakage"
to fix the broken representation is acceptable.

Note that there is a similar issue with the *_sshub and non _sshub
regulators: there is only one actual output for the two. I'm still
asking the vendor for hardware behavior specifics.

> > regulator. Also combine them for a shorten regular expression pattern.
>
> Instead the duplicates should be deprecated and driver should still
> support the "_wifi" variants.

But it doesn't really work in the driver. You cannot set different
constraints on the two, especially conflicting constraints, and expect
them to work. And if you set the voltage on one of them, the other
will change as well.

If we want the driver to support both with _sane_ behavior, we would
need to introduce some sort of alias lookup for both reading
constraints and resolving supplies. The driver registers _just_ one
regulator, and both DT nodes resolve to it.


ChenYu
