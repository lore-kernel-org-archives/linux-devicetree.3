Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAFE3E4C98
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 09:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782465189; cv=pass; b=VRhYY4QGqwGmnXMq3d6Z+NpmDXVF+IlM+KjNvemabAjN6yrP0dotJLBdXtD33hwq5ONKQHcgcgSEmI866PfiHFutmTBn2sn3P1hVogynLVID2QrQ6kW0FTqakTLYjOYTqxEQ+8uAJ8qdTOSXwMdFaRUx35iX5v/UvbuLlCcpVWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782465189; c=relaxed/simple;
	bh=KbbQR1i7C5wmzlWEzAQ1sdnBYsBTwBeB+CufbfTPiYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rdfzkhqM3d0GC+n2x0eSQiosjdvY9jz3oZ/MC9knwXzJzG32ab+2yvdihLwl/a89lUfKa1WTblilnqB/Gdd4PPap4K1hQSnGeknuYN++mepNGHxgqzuosZyRaDy+ZaCDUkEs402JBb7QkBlLELjhIteh7Lf5JuDaKbGQVA9x6cE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cx0DSStc; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cx0DSStc"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-69531108f25so1311449a12.2
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 02:13:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782465187; cv=none;
        d=google.com; s=arc-20260327;
        b=nVXjMoZknfYIiMZ+hWZQHq5smT8fQpqLiHian6bx1d8kJuQxj1sa6BOLUSYx7iopPp
         /UDU2OR5JzbX6UgVEfnmnKVEqns/NDPv9ouQefOx9X42n4+/1WwN4IWYAhGKnhvp+8+2
         h1a/8gaVehucvBNRc6OofaNiKSFLXAARIsLz6Vjx0FLYwj+RFDpHVNaMzMf2FccEDsj+
         5RJdmqsKEOH77UPf6er1ko6+zRK2FSSiT8ub2mrRItGP89/1BodFmNZIoLL4FwH6HrfM
         CDcRXVyfIem8CxDM2TyjyNKospmmk48M70G316OW3luaMoogQpT4AIyAfm3pHKdBM1N2
         FyTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=j/wSzbIwWiG92EkgcKi5EYZENCnmwssp7G2yc3jCRsI=;
        fh=c7kZFWR84XUkYusvfzBrMCB0YJYTSarCUb69wwkAeIE=;
        b=f1cESCsx5GcdgAbk7uYxIxkXhCDsDIa5QBeKp+whCfKC7SWE5uzYdShrx+tXFI1pLu
         ZL8XS84d6lutHRQDHlkCnd7WOtHr53PV/xVthLGsOtlJx96/+kLQpFjFLRWrHcnzdhGU
         QHI1lTLchZrtVMeyLg/MLBeEOxobPLTa5wVmLdKw/XTZe/pIcT0xov91AfyAcl1T+d/J
         L3xxm6WCLbED8F5GOoBJ71NK2mshyrCzkP6VuRvWaab+asLhDcEhCAmJsP94Q+ONdWjP
         FjajodWF/psrUYnTgAKIuct42t4wYAHkg4DS7izAUcpmN5kNHSKJpn5JAZ+2upBQWROy
         7Ylg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782465187; x=1783069987; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j/wSzbIwWiG92EkgcKi5EYZENCnmwssp7G2yc3jCRsI=;
        b=Cx0DSStcLxM8pohUvHSL0GNo8GrjeB4FcwQqIPrLRRrb9s0rP9U3UlHCAcYcEZwLAl
         qOndO8Fhdaxxs4Tfqty/YVodDxXSXakDnDJGbE8XxT9fFzjocJIN7xxBLpFTjIScIjFc
         Swfz+LF24xZXlciA8qdtXYHTv73R/VJeTWG4e4tGd/lXqVNEioJeLTCF4DeSzacuBos1
         lq2e0HFLIHdQghgFyYrdrVViwK7SD5wzCp57ThnvLxmELNE6tEA9kPdqIredpZQIKp4P
         bfeO9q8tdVKtVKd1BEi+EqG8c/vfzvy99fIE7ZonvkJg0qv7Qssy6TRR9TVAHQNNSLB8
         ei3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782465187; x=1783069987;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/wSzbIwWiG92EkgcKi5EYZENCnmwssp7G2yc3jCRsI=;
        b=DzvpHl4sqtn8mHCjf/rrdXX2f+6O8MUpuw4nctsDn3fflYz3OR/5mtgbO0f5F44Ofh
         LL2TxmZAWFo109w+jX3WCvElJdNHeAWqG0G++V8UsYu/A9wLttRTIdy6AyJ+JaFyjPlV
         z3ta/jPlIHM455EEarr6EASdWu4e1VBzIlnVYg6VE3OUj+NKm3ZTh2WnmpMQ1HOfhbR4
         g3pqwqXAvcAEbqqhTte6lxTsoL0SP+9osfVjyti++h6jWaWnjv1VIDKRw6R6YVmIuI8b
         hPQ/mBitrIr7bC4qKFq6nWYdOPjLHFXqmIuEZokqAhTPMq0qKGPRJ2NGOOslosyD36tU
         eSVQ==
X-Forwarded-Encrypted: i=1; AHgh+Roqx0Pc7acmxoMXxcuUZx57xOFadBmTDqlKaxonESTkQEwRs+3qLbOxpcmszr6lZNUMKYyjmK1o7WaR@vger.kernel.org
X-Gm-Message-State: AOJu0YyN2Ksa2GKAWwWBHvOiLI3ObpazIjDn0PS5Ly40EX7vcZjz0WqD
	MXCsuVMLoJ/zT3KVaTAmT89FGDY9R/umznRv3pxJhCHPWMWkV3gsKz9F1AuGXNEIkH7J5RbgJN+
	q4/xNWMksZvrOy5uPRDTdANJJUb6NTso=
X-Gm-Gg: AfdE7cl2IPXYfgSlLCvWiIWkUQ3vH1+LMmt6s5Zk4caonm3Y7t/1Q3+ydfby0y+IOaT
	oL4pDKtDIelYpo3Mbm5ctNJBPVyAkRU6s8rbUSTgVwSD9gtxf92Km+Y+w1A3OyL6BFFE16BIgC9
	QZLIR0LUeeifGUxvVnxF5CgsnQGL/fd4PNBZE0Q78Vg/HH1c/g/TIvn4tzWgOv+Gm3MqFtjSc5c
	YRO/GxwPxzs5b/+4xM7JE4p5/VscM8S1Mv4FEpOFw1NmLnSwtvr6oVk2X2iXK9OPMoh/wo=
X-Received: by 2002:a05:6402:190b:b0:697:c0f6:394c with SMTP id
 4fb4d7f45d1cf-69810a44a6dmr1504110a12.9.1782465186628; Fri, 26 Jun 2026
 02:13:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625104742.113803-1-l.scorcia@gmail.com> <20260625104742.113803-2-l.scorcia@gmail.com>
 <20260625-cameo-siamese-cd78c349519c@spud> <CAORyz2JHj7i6VhKom+tVd8PWBjM=TFhbr8-mOy3GH6eDYu4WPw@mail.gmail.com>
 <20260625-unearth-suffering-e2c59d39da0f@spud>
In-Reply-To: <20260625-unearth-suffering-e2c59d39da0f@spud>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Fri, 26 Jun 2026 11:12:55 +0200
X-Gm-Features: AVVi8CdLNvDTFf3GfQHOzooYBWEAR15rw8FIdBZyi6PI5TChocrGHW_idD11qis
Message-ID: <CAORyz2L5YuBifG-ud7QHPva+_nyL_SyXMVQ5EeC0s52isc5J3w@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: pinctrl: mt8516/mt8167: Move
 compatibles from mt66xx to mt6795
To: Conor Dooley <conor@kernel.org>
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> Usually when making ABI changes because something was inaccurate (but
> not wrong to the point that it didn't work at all) it's possible to
> support both new and old ABIs at the same time because of new properties
> etc. This is a difficult one because it's using the same properties in
> different ways. A new compatible would definitely be required for a
> genuine fresh start while retaining kernel support for the old mechanism
> in this case.

All things considered, the cleanest solution seems to be adding a new
compatible, mark the old one as deprecated and also try to fix the old
driver code. I'll try to do that before submitting again.
Thank you for your help!
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com
