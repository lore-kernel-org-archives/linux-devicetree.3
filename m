Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC89344DAB
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 05:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776402392; cv=pass; b=VdGT/3vowjWLz9AEzvvR2meYK/1g/FtyJ+HXAGO0CW0X1q96uFpw1JW5gzZ68WeVqHOPSVHi8ihxGhg2pOpYyeXlq9ZG//WgENeafYnp+TSqvqTW3gVHb972AGytRhuL63cJIndWZyBdwL+Lkj8nAPbMv9vnQ196qKF7Lg095dY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776402392; c=relaxed/simple;
	bh=cGpcP7poEsGLGthFXBvfo5NNBMVcBhH+NFqPvNbFjjw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k3eKUPUwO1f/D8lIk3lrBLC06L0+2PdXBHVklHjOyTdy4F5zoJV8z1MHpNkOJcQWdA8L7vNLbPJQro8nOchPjH2EWQ3TIhvXOuSLuka/eO8vT6pMEHzljkhd/mwrXz95F9oZldgX8spgg+Gp0O0rmXxSF8TWi6gTU7ma1JPVBNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tJRlLXKm; arc=pass smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tJRlLXKm"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c70fb6aa323so85430a12.3
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 22:06:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776402391; cv=none;
        d=google.com; s=arc-20240605;
        b=T+MDuet9s9J5MGPudjK9r4iL/aDrOwq1GmCbbr9plFcCeuPd7WVFBER2zvjhIjQDQF
         ZlgLdLfaIUQ7451LHp+sTjYLt1cSw8YSqOoleRtzA4GqPHQYJCryw5wB+XWdnN4p2Inl
         jiK9rrBGCVbfqeQqOtwmfa2VBrLNVD0MFondnv5dGHC1U2knMmhoh6Ea7VZ4xhRcNUUv
         qlP7OpUCYu1dc1WcH24mPgym2wzfgDw2L+v81BqxtuLe0eBgJzif8Ffdb7gkjK+ow4wo
         Fa3xknl2CZyUv/6DR9kRd+goSlQExj0diBAg5rqyawpC4fZjr7+orSEJz6TwW8tHWWZQ
         DnAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4l2YkIki7u4jk2tOd6Zkab62D8yPBgbCmDn20o+e7AU=;
        fh=MtXPD5DLf7Td7rr+jWlKhMZ5hpvuLW5bHunUMDL+7SU=;
        b=eZX5haMJFs/3QAU92DiaIn1e9E8a5Vo9FA6Dv8ZFmyOX/4X/4R4+37j6wGYRY94N9M
         nCFGZbISKiHSQ9dn5/a9ri3UPTQt6uF7BE5m+5nuOwtmxB9ytAv32ZNKu+VsoaGqwFNT
         rd2/kxgt6HE3rcaqTUeHzDvYEefft4AdPq+BGcoY6gdWLbwSb1CoKOpZ1GEH8sb/hWcY
         H2AUXwunKVJGxO05dxu/Rf3I3jOu98nusof8pD6KCtmU4yjaOplve9WwAU4rtvMI+KPu
         3ymZ7B+Ytie/9ihVm4PJp4YP1qmlEELDC75Xw5carYBhIyjnBJp5DKp+OTn4Gj+iUEQl
         L1zA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776402391; x=1777007191; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4l2YkIki7u4jk2tOd6Zkab62D8yPBgbCmDn20o+e7AU=;
        b=tJRlLXKmLfJU5pgAp72tDQed2JtBHWTxObrAjcxcor2Tpy7bgFnwgrBEilArSq2lau
         qB9xsakeplDoUiW5izs54hubxnoA7ZKs3c2wmCVd/fZ6UmUXQtMZ4AQs6qntq6JFhBNX
         O0UlpWNyE1G8VbB3kawN5AORbBoQfvSe2/EUCUFOgpmdFKEAQVx2aZOrq1Bg5fhSCTrG
         WXZD9BvydEyH6sbHzBMDZiaCaHG3VCzSGKHbE+CDLj3v6raVMWLyiRY85xriBPkUg8SB
         Qhdjn8pAOd66vULxU/S9Tx5TDPTuwyYdDRe4p+57WTCH/5yrOXqXmaE13WrYdRltQL6v
         R1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776402391; x=1777007191;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4l2YkIki7u4jk2tOd6Zkab62D8yPBgbCmDn20o+e7AU=;
        b=nVmUC4jYCVqI6ScT40l01tBwRy1zJBcPaNMzJfbYu6xtcYIJObIses/CojBdl9EBFg
         zx5HjAC7sl1E6Jaf0ZOcTxfFtuu/eRFbCA+Fn6w/mruFOBjFvzSY800u/HuXvJLdCR70
         cUHi/IRRLOS2uB0387NM73WfWkPbsZxknJ6Kk7CnwzNOzKP5fRK0vVCfYx8S3Jwla6cK
         go5sX8HnUr31mEz3Cq0xUFQ8mpmAOxS1M++4yhz5+TU7DkCjUR6lO7F7V9LCHOYLKa4u
         lSMSPJVIUOQQkaVz8V751Xhr/4pklHSZX44+dEdeWKLYI0lLWKg7gr57MVm3ixb9ccQL
         Y8TA==
X-Forwarded-Encrypted: i=1; AFNElJ/bRuORcMutYbDCNne901nbtFVSgdAdSZGWerWvC6xxw6avpCh/Eeg/b+H0IguzcOLk/O01rjs7w/1r@vger.kernel.org
X-Gm-Message-State: AOJu0YzAfxMdTmvzgCJJ3xXW6XmtSimYL3Xaal4W6MrgTnyWVQL4BbFW
	CTJa4QQmnPs3CGfFlk+dyijvld0jxCcPTDk6oMrT/XvZf3oNhIHy6ngcu2u3TtBeig//ntwK2U7
	ImqnE8efQW+ipwoOshPf9xtuXC+575QY=
X-Gm-Gg: AeBDiet+W0AilrkPyhlomXWhrJ5jMlH5GKOEk5Wo9k6BJbxabw9DaNHzoMJRz/9jfgR
	EQVbxRzH3Zj8gxxwHAuDehwnKPXcrkg6GCCRuDGgqZ5TechYu8lYrcWylIc203oxdskpDfCM41c
	D5VpqCLhN6foixGa1qcCLs7/vBnBqdkoLHVAdTbKoIRfVnuGXNl/hVhK2UcW4NuTHq7OF1nSu3P
	kkC2AdG6BhVafkzfjcHPMzsB1uXSCj1XhdYBcET6fXWWYI/AWfgRvkxKK2Mv3nCDKgH+pJjdXFi
	cviscO4ycOcTNwH6jk0b2Nds/p7LVPlbmcvtkf97hGtZCrHX
X-Received: by 2002:a05:6a20:2591:b0:398:9ae9:7110 with SMTP id
 adf61e73a8af0-3a08d6f1419mr1420155637.11.1776402390758; Thu, 16 Apr 2026
 22:06:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-7-phucduc.bui@gmail.com>
 <20260414-funky-sincere-polecat-20b0bf@quoll> <CAABR9nEKGSRNp=eK=ZHf6-MNsj=6cDCy1YdbzSPrHyuc3Ux0Ow@mail.gmail.com>
 <CAMuHMdVPbcz4rF8ojEcvxp1NaM2mbQ2o+HZLwnnjNnX8uHf4HA@mail.gmail.com> <CAABR9nF131G3K3-vUdaDwHuQ7MCCLd-VO5syLApE_qsn+J49kA@mail.gmail.com>
In-Reply-To: <CAABR9nF131G3K3-vUdaDwHuQ7MCCLd-VO5syLApE_qsn+J49kA@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 17 Apr 2026 12:06:19 +0700
X-Gm-Features: AQROBzDu280nT-xrC2OOG5fsst3QzaCGzF7yDjhZKFyOB_YIxODbhFQoQv65pgQ
Message-ID: <CAABR9nHhYOhMnHwrqK9oRE50jyC6kq9UFpxBdG-Tum6Ajtf3Xg@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] ASoC: dt-bindings: renesas,fsi: add support for
 multiple clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, kuninori.morimoto.gx@renesas.com, broonie@kernel.org, 
	lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Geert,

Thanks you for your review and suggestion.

I think this approach looks very good.
>     clock-names:
>       minItems: 1
>       maxItems: 8
>       items:
>        - fck # Main FSI module clock
>         - spu # optional SPU bus/bridge clock [...]
>         - icka # optional CPG DIV6 functional clocks for FSI port A
>         - ickb # optional CPG DIV6 functional clocks for FSI port B
>          [...]

Just to confirm: using this approach with a fixed order and optional
entries as described would not be
considered "flexible" in the sense that Krzysztof objected to, right?

Best regards,
Phuc
