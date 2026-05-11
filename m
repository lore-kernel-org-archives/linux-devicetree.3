Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A6F3BFE33
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778494986; cv=pass; b=cgAqgqgiIbskMICbnZ73rQ7cPbq9Ust0mXbd+mlRRnpTavHX/cHAHdtrDG9VXi/tfMWB15gV/uBIA87vQuI4UgI8J3hRHy7pC+k5U4/MD/Piq57W+gz74yeqIARlmaDI0HS9ISY1e/+bwvWzNjYjSCz+rF/jZT7dFvruid+l+5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778494986; c=relaxed/simple;
	bh=xXjo6IWfCz/xy4VI8+IePoDrGofTt+dOYDT8TY3Agwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bx7SVxAWzq/WMeV9cfuDNvb2lSHZqedkWuGpzzZeAzdQr+H4sTzuBev3vRDZ8qB335/TeNHaXMeSfpnnw/4gtV+bAUqRXL4VfdOyqE8A3YypvI52sGqD4eL+XhqpVkl3hSCa6mbME0NWUvp0HX1vxVxJYybjklWVlbmQa0j6fjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffeeMbcB; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffeeMbcB"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36608b2f2dcso2637381a91.2
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 03:23:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778494984; cv=none;
        d=google.com; s=arc-20240605;
        b=hhxODs7gpbQH/ZK4QksAri4yW24pUO88FLwhSVzcX87ro3OOSUKQPiedLz0UZBD89d
         DCwXL5/Jja7m1gcectJieCL+3yoe7qcD2/XRHcIlJM9Ezg5/dHEfDkvmaEyaYJjlD++o
         hYw/NuBakaYLosgB+7H6PfOESGE2FkBffomonwas7yc2cCaxe4nnKMO06R9MBSSSu/9Q
         NqcsRmUkrXOd9yWX1jNFupgsk3aLy+3zVvoj14BTId5iX0A2aNUXGWwFpfYsCIN0Qiy5
         klJt31w12KNC35u2ItwKr4naqCFRhHJbZ1GG3BisTgwKquQih+ALCCjGvHCpnOjVEClO
         ucPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HPX1tgQdYajA8sGK8tGlT/Biu6abj/wZDamRkoAL5J0=;
        fh=J0JuaK3DhEhpl5Bq+RE/zrYDtfI/oyZGF1rkmVMzzxA=;
        b=XBjmS235GCLIHAQfLehRd8c5iR3TMGAAUOqgNwwn6VRs98beKy3TG8jGJ+PruplNP6
         8jDkBE6A2MshsUHJtwb6E9PWlrMI3ekHTrzUFdK1gcLZzr2KpvWfFzOJsVX7teHTcj8m
         xoPqr2k1fA7v03Qro7ct9VjxXsMuv9W6djmwY+iipVFcnoume+8vypmOw2DptlxTYghq
         So91pIJQTwxSuvkWiv02iGLymDVOUau02eZS+STbR8rlAWITlXbIshPDSYq+nb7xz44c
         K2cpLiPLHOWhNJA7MPEgCGYnwU5UgZcLHnkE/IS8RSS9C4G4jJcUoGhc/dSGtW3TyNOQ
         Z9iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778494984; x=1779099784; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HPX1tgQdYajA8sGK8tGlT/Biu6abj/wZDamRkoAL5J0=;
        b=ffeeMbcBye+XbIdAqackXrlwO3lnbT5Nw4xtXd4rRWKnFfRK/AO9bJvKYlpvZ9eE1D
         ozO8LcXfY30TijrXbiz9P4AD77OZZGK+t6Ig2EL1+gnZBJK09wBtbxQc+899bb3jK0NL
         gWa0sgK2+egOsycEs+1bxtKd+1aIbEVxqLSt0PwtgbPBTOq89ETyrD42xw3szoZq8iJe
         Y784dP4fYbebecbLTYLjBGvxrItNseXOGnf7nAoRjHskklV/I2ZhpEc1a/TA/JLaKXfn
         HVu4AdQWQpJPkTioMqH9BuEe7LqEwzPqk2kNIbA8BavYoDxZotfoUysT7QKPeacQ1jx9
         ZqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778494984; x=1779099784;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HPX1tgQdYajA8sGK8tGlT/Biu6abj/wZDamRkoAL5J0=;
        b=ptOeFs94SlJVXL5h06tYwnQYTeP5NXzov4OzHggITUxK7StwHl/ATDCwOsO6RpN3ey
         ub8QrCA0l85e4erV/VHq1vYC3d1PuWkkxmXhq9USifmav0zAwHWxNbzJwVYAGcRX/GjE
         xgvnPRG0Kgciy8MwVRC4XT30Ldb9SErKHX7wNGeZjTi7AMfIeVPxE9WNcQnQSmO3D7ew
         tvaPolWEhtEu2KD1mP97lg2NgMejI3Brbz6fBurbCKmzY8Dd6dv+ItTn8gMZZ5VqeRA2
         xoW/sC6znSsnf4mGEcO2P9uU8EXaUgabJe62hgbE3bYKtjLLHIaMTatl9gjmb2tkh+lg
         1ngA==
X-Forwarded-Encrypted: i=1; AFNElJ+CRg8e2NpXOA/sUJeT+lmb5jJp4bk79QoM/T5q8j9vohEty6MMzqInIkmJMBtQb0UAJWZ2rRkaQ+A5@vger.kernel.org
X-Gm-Message-State: AOJu0YxOQJOid0yesMcJp4AIwAtxP2Yuur3712b8cu051CtbA0rdoL8b
	ULSwJRoBY8qeRj/PDW2jB1WW9hkUVMnpss+lrkSbZiwH/mYHx8NQCK9MhcEI+EbT3rH78/h+xAw
	xg/UcMKwySGkk740veMOXC1hN/9h5iFg=
X-Gm-Gg: Acq92OEk5zqzV+EKYDkkL69Vz1wjv5WBT0uXl1B52xqYI1iCwKX+B5qv6cFfHvgT5rJ
	McsTs07NaV2pewOEAQRKBMTlHGUtkYU7Ahr3t+t0rg7hxm56Qtb8x2oh/x1Zk6wJaHXMV+2PTfl
	7I8qBLoTSInfHrorMcZs1ZFdUIZGKfARO/cPVohEVZpdsiAgW0xSDqtgqhQMdomrUGbpJNeh4Si
	aFit1hAQe0+MdxzAEXxAtHDlRKMCjoYD9Mjz5D3QdA+JeOX/WNQbnMJanqyyBd/Bej8sS8Cg97B
	h6zzv47WolWVf1FlG9tqSEXSWZ3lpakOqOsOnfEkvLWpxa+W
X-Received: by 2002:a17:90b:5484:b0:35e:3afb:a3ff with SMTP id
 98e67ed59e1d1-365ab9b8beemr23214081a91.3.1778494984218; Mon, 11 May 2026
 03:23:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
 <20260510084303.122426-10-phucduc.bui@gmail.com> <877bpan1l6.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877bpan1l6.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 11 May 2026 17:22:52 +0700
X-Gm-Features: AVHnY4KeZdeHiYzmKMhvfxrwvLSvsF523Nansp1muFCl-srjK4towjDma_7cf9k
Message-ID: <CAABR9nGTnDQHceDT5=Q49WwLf9EPc52TQSKe=PrF7B2jxsrTSQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] ASoC: renesas: fsi: Use clock prepare handling
 in startup/shutdown
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	geert+renesas@glider.be, krzk+dt@kernel.org, lgirdwood@gmail.com, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, magnus.damm@gmail.com, perex@perex.cz, 
	robh@kernel.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hi,

> fsi->clock.count check can be done on fsi_clk_[un]prepare() ?

Thank you. I will move:

  if (clock->count != 0)
      return 0;

to the beginning of the fsi_clk_[un]prepare() functions to make the
code cleaner and more compact.

Best regards,
Phuc
