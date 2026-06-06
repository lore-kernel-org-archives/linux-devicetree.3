Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1D22DF3F2
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 18:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780769469; cv=pass; b=HxZgLC/p2sQwNc/gIRQQUSOrszgRvr4PQs6W1fUuf9n/MfrKujZHkyU3lc02TJV350urNb94MLvOD1qXqpykLY+vdmc/JpfonXyP2kdB1pmhamKWuu0bGc3kuAe3lHuWAnBh6k8QKuDxkYQf6cTzypRzfR6wbTZlrv12Z5mN2MM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780769469; c=relaxed/simple;
	bh=g1Sr0VV2Gjr2KczGOo3OW7moNzxZ++f8NtW3I8eGzCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GWLz/mxp7nip/KQWF8tOmdKTPjSNipncKGft2acuBHEziZnjzkNTBXjnfx4LC6KBxh/as0+RFvZkbn4KDOAw0LcHIO4UOqbuJVgu0robdJ2ueyXMH9u5QgdmzYS6fjq3TV+l0g5uzEnZBUeJQ+NV4y+Sy9iBJ8lJ80nQZLUyvjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DyTj39YO; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DyTj39YO"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7e053987001so34119547b3.0
        for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 11:11:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780769467; cv=none;
        d=google.com; s=arc-20240605;
        b=ZtrNmHKKkOIRHdo9TE52/FlsOhlYn1JMqQf2XIUo3Q9lygRLFz1YF8cJDL3U3P9PWV
         sjEobhoqGUjXYkco57gZvYA62WM/O0WGPJFwI4M6w7D7NumksA3iObgI4jy5XF/WyxdX
         mduCwaz92sywozNfZncoHb8ryMYPvca9vXnroGT40p6utLzqQGZEeagomTzLrMShuVVL
         M+5WG7DN6vXUqNrJpauPQHs7fSo4X5+ulyGtrBHctTZDzZKPlBZKwXb4hcpXG9EK/DlT
         1n6A0O7MbNXYdfRnV0MHvl+PJLtUFahlDe7S+FNHMxG8Sr5tsZ1bqTHAMOUGZrZgwci+
         VBiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=g1Sr0VV2Gjr2KczGOo3OW7moNzxZ++f8NtW3I8eGzCI=;
        fh=BZZNnC3x15HGRZWWUTUgrwbzqkBOnjgRz8pnQAA/w40=;
        b=TG+fC3aq7AowVmjqaMQ/ZcNVQWz01Sd89cbqlnyw2YP6FX63RPVzf55U9cDqlviq/+
         4HeiGEZCzUFveoZ1zp4Gy7ijhMHgFm84lK/kqaBJW8EAmQjh3KWZ7HgiwxkRqgW7PqsH
         htzWjXqE377C086iZ1pu25g3U2y8ZrEOQCLvs4xGhw5QyWpRs2+jlR5TTnmk/aVW1TUT
         +kClVcjxPwu/jNink2gHdAyPlMKHz3PdOr1cW0zlCIQpDMtpr+iu/cmjGA+xRJ/pi9kj
         RxaQY+qSMyGmuTr/8DRNx73Jss8PZN7u/qkwaoQP1/tVMw+BEhld/X2/MIe7PIbdR7Kx
         DWeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780769467; x=1781374267; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g1Sr0VV2Gjr2KczGOo3OW7moNzxZ++f8NtW3I8eGzCI=;
        b=DyTj39YOkw9t90HL3tbwMbOW4P4oNp3qnzCgSpWsl2dBUIgN/PP5+0rMsLTlJGKTZW
         sNir0/NuCBD7Bz4YA7nz6VoFVjeUoRaWeWiO4I1M5pGiv43AEpKiGjMd9He32U9ykZ9H
         +FzjrfL2UArQcTwuGJeUI3ON/QA9lgqxEGkfpgHkrTdhWBu9JWJM+gVIFfDrQVJcXXYS
         /XrITCgVfwY1exreYHnrwfAupY5BAJKPodJe1YNgTb1Gm9Kk/846tMC8QMybH16kWwJL
         bbHyLzmftZNuEBTcrO/8gzqCA0kGLW1U7EPpkmM8T1T9jJ1GIAezndBz8LzqsoG2NLxC
         YIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780769467; x=1781374267;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1Sr0VV2Gjr2KczGOo3OW7moNzxZ++f8NtW3I8eGzCI=;
        b=ImFzt/Gsn2ifrr9XpMJ7sVQ7mKaq5w7ay83Yal+lySyMxnGIeolvY7BFhQ8TzNUE/Y
         4hQP+K6IRGEb5L6z+IqWg6QDOp43xrxOC/8K5jf2lFk0hQ8/Quu0LIk7D1rPp1lXTApL
         oPx8WP/9MtaL+xH7mjgX2lN5SSTZScI1theXu/wh72zWPZM68MQ1R9fEBalLbVX9Mb/T
         lZx2U6CrWclD7lxA+1nmHzd1j0ou4TA3GU6RuVexvVwVtgbCVrCZdtljRcUzz7kuPlrS
         gTT3N0Xl8S6F5OuEA4yfpdNEsagZn1+P2O1mW91+jfVfJMG+DWY/f2VhtYr1bKpG3bCa
         jSgw==
X-Forwarded-Encrypted: i=1; AFNElJ9ryaKU+nO0yva8xvjgvXLxu+tmHkoB4P53a3GqxAp0zTVRRnuguixEt86NacndSE8zWCJB9LNkiYIS@vger.kernel.org
X-Gm-Message-State: AOJu0YzMbgB9WOoCBWWdsLy4zh4TDrwkrmNm7k93rO7EuUqCgwDE+Riv
	ojZbyLEEytY90vXlYuMfxXDSneEvccUq24Iaw6XqWK5Quv/7QxNHCzxxANJJosQ32He8lNzAvxP
	1DcK4RG6p4SqzwJr1tepnlTAXruSJAFU=
X-Gm-Gg: Acq92OELyxRaaRlOUsQmnUECeMO4zpjPO8cEasgL59xB70dZm380cWgo9maIb1/wWvo
	1OtFeb3n77P/S702nMH9kgqJrEsxqHisOO8UYMI1yB7MT5cy6FUBg7yONW+cMizxER2mxrI2mQE
	RdQgeFywdPA5x/eW3cG3U4J9ikFPPSHEKV2sDhX/+m/MipLIQmwF5CgzFLNg1E/GQBfpZnuFzv7
	BaZO4bPu50PuRdoyurjYyZw+HSaxoPKpUXiGQE1NSgSanrbDVl/11fxVT54h/6rhLdmDFEXxydp
	Zfda5PBu+wbV2Rodog==
X-Received: by 2002:a05:690c:4426:b0:7dc:1c56:2901 with SMTP id
 00721157ae682-7ed5028e9b9mr47127027b3.1.1780769467287; Sat, 06 Jun 2026
 11:11:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260531171041.4149-1-challauday369@gmail.com> <20260601-zealous-loutish-termite-ccfc8f@quoll>
In-Reply-To: <20260601-zealous-loutish-termite-ccfc8f@quoll>
From: Uday Kiran <challauday369@gmail.com>
Date: Sat, 6 Jun 2026 23:40:54 +0530
X-Gm-Features: AVVi8Ce7u1p9uE7h60hWReuv8ATRkce56Melx_UbYFY28UGi2pRVU4y3Gq9-E8U
Message-ID: <CAAj-GBkEVOUgGxXZHmp3XFbvKD-7sDaVepWoGzij8y=gBciMOg@mail.gmail.com>
Subject: Re: [PATCH v5] dt-bindings: clock: via,vt8500: Convert to DT Schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: alchark@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, skhan@linuxfoundation.org, me@brighamcampbell.com, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > Convert the VIA/Wondermedia VT8500 and Wondermedia WM8xxx series SoCs clock
> > controller binding from the legacy text format to DT schema.
> >
> > Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
> > ---
> > Changelog:
> > Changes since v4:
>
> My comments from v2 still apply. Almost all of them.
>
> You a PMC binding and preferrably all this goes to that binding.

Understood, Krzysztof!

The current separation between the PMC binding and the clock binding may not
reflect the hardware correctly, since the clock controller functionality is
implemented as part of the PMC and all clock-specific registers are offsets
within the PMC register space.

Request you to please confirm on the below points to proceed for next revision
of YAML conversion.

1. It will be a standalone PMC schema (`via,vt8500-pmc.yaml`) which also
describes the clock-related child nodes and replaces both legacy text bindings
(clock.txt & pmc.txt) , or
2. As per Alexey, PMC compatibles should be expanded to per-SoC values.

If it has to be expanded to per-SoC values, can it be taken as separate DT-ABI
change or should be done in the same series now?

Regards,
Udaya Kiran Challa
