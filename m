Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862043403E1
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 15:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783007379; cv=pass; b=nc4oTd+JeZbJW7U/LkKlMqY8m6OSb1E5MM0fpszBk6DOFwx7h7uALQ219VUPKsYVQ7zeypPkc+Cp4OOxjaL9alcWKUbVAk+IJlsRN0eMNtQ8G8Qsyl7lJLpTFa2GVdtvVLis8NIP3C6kooGr8VjzD370GrICBbwkyCNXbnyehhM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783007379; c=relaxed/simple;
	bh=s7xLGTh7VkzLeGxMGgeKXQvvrQFuqhBJGNmgswF8J14=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aItjkFzwD9EnDgNfRzx2VGJBlok5mjUKrTk+RZ4wQ3ZiteEi7u8ScZrV+fCAQWAZzI23OkXDmM7Wm7rM8LGG9Iga7ptCko5MBGCAcDS8Gkdu7gxcaMhdE+UkC2jYb29FfAjeSlc0+WSykHBXn25wBhVZcF2bOU7OBAwIffVdAFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qKwTqrFz; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qKwTqrFz"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c12a430d71dso188790766b.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 08:49:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783007374; cv=none;
        d=google.com; s=arc-20260327;
        b=qjEDuU2dZoXhX4x1COa8op9vUhzYL52Lt+pTToahJYnie4EVDV2fd30eISIb3z84DC
         whlSk1WHP/y7INXla8m/ffuY4FBDpmdnQCI2HBw7gYr6uUtHjc++ulFjun3TsXnHfCmb
         z7fLSIr54AzH3WQdlkc9kNE3VBC3PIdqJvX9dxIBGZ64niAd3zBOgniVDr5/680tS8OB
         KnQkkU7lOt5n210CvIF2Mcv6vsvsQOxGK2bfBgri1ssl5JGklOYsgNDWhB7ii4hbNOD4
         7HK5ppyu9EjmGhtOczMmZLRvdfMFt2qLNllKdDIwie58GoyWpATbo1Geol0MGA9fQDoX
         /rBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=s7xLGTh7VkzLeGxMGgeKXQvvrQFuqhBJGNmgswF8J14=;
        fh=qzrRUXBW6W7V9ng57uXmupOJwJvb4L0b11tavX4HaG0=;
        b=ObQSaGw2AJrSbMnDwOrkHqCxDEsDvmTBxGlXMWUwyJhLqbw4FFAmOI1urJaM6yi3yj
         u/avqRuNj/m6kKIXUMJUD3URVbZDxRaeIZnyHA7GidYywTZEM29GkTdCpUEVlGyIwcBh
         W+vgtwhbanQFG1hIXmhJgetuVP156AKZj9VNKCshMQ4JRJQsQk2fne3NCdBR0y6L30bw
         MVMs8zzr1dd7s6ltxJJQ2EChGBLR/tQOhvyQJK1TJKObnnNTsitaCBtczlGcUDFtIYK2
         9sQWGHx51Ka9f1PdP0OYTrsTpj8x90695u7lyPOsFvwvnmqYsYfboy9pvF2SA7baHp8g
         DDBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783007374; x=1783612174; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s7xLGTh7VkzLeGxMGgeKXQvvrQFuqhBJGNmgswF8J14=;
        b=qKwTqrFz2i+hBD2/LzbP2kMWsZO4bxw0s/Lipdbke91f1TMcEiUCL5Sq+x/y58/6d2
         6jC4SHF+X+MDIEQwDW9H/nizhBnY7BuhnAkqhcYRuAVqFh6Vg7hnnLs3TDBWDy/q4AJc
         BvpHpu4o7EeyENiAWjDOgeUJl3KYZCPUmsv6niemxhUJfZPytC8ZgKcQGzA06b4Fg6wl
         Jwskz78ffCEt4Tg+YBDhJDTsJhcKXINAs2sv2JnDmaW3sspOBxjG7a9dlpUPqdeMOXwI
         R79AjM6uew/Wvk02c2i8yyg7PyNhydgUMvD3Z6gm7yjAG5yttGizckUJD4Q5+OUb0W5l
         1g1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783007374; x=1783612174;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7xLGTh7VkzLeGxMGgeKXQvvrQFuqhBJGNmgswF8J14=;
        b=chO+yLHVyJVQo1p1Qm7rwgbDm56Gbt/+MGONY1Bhuh+bIeK7YvNWv5ZBZEZViB3ids
         QRcxlzaI+yI2t/IAGalJMEXfEeC40Q7ax02TzS08ISszZ0r2L7e0B1SgIa/2M1hu4iXj
         59Skws4ipe5vt7p9uWUtnVT0dotFojms492pNIrHGfKerk0dod12Kj0eLJMOsx118gVh
         730RT8vVs644qz8cLhFOc2SWdvF1cINNXcMxSQHSMNh67YskoRlT5FAZaiVt3jC+9bHo
         RrpE2E74baMSmWxbaQKOjymQSFT3fhBDab00m3uZMI+qYj0BCfDD1DKJI0O7VttLeYEW
         UBEg==
X-Forwarded-Encrypted: i=1; AHgh+RpWJiD7vJbIhFcaAjwXw2MYDm8uqcS/PYTtCfwHxEWoaRLAvSYHtnb75ORekmSOHwotvbwV7qce9rRO@vger.kernel.org
X-Gm-Message-State: AOJu0YzMMKiKkqLGM3OjnLFj70CPoQsk7KrQXsfnDCHTxN1Y5dQXtlzI
	EYnps1wWq930r4PXRaLBK+/SSd/Lj/E6VIDaDCF8WhBzfhKoOhVLKa41n6+aRO84KZ4IlHzCSf7
	Q1XDRbxdxypk32XNZRPXXmoXMEpAseksyqn/BGR0=
X-Gm-Gg: AfdE7cnPPAUqXSePftCT+j1CFnEIRnb4zegrPcymZViEPw4z8VHoOSsuQTJl7ZWC8PO
	hDOmKILY4iRUYSnE5LVhzTS9ayIsJv69hyDsr84AOVgoaN2nPB33kGv2DPRyqDOQ8+rIzpoDKrF
	OauWp4CoILdspl3VH5gnG6JAy3L24jS2GTH3ZgmPLAPFobtvHEvT2vbUkJm9g4swrjSjXpS0/yb
	Wo7apzp6P4j20cWXCal19qt9OwDNv3grgadA20keyTq70VVZ3734T6mc9jn8yJ8YfWf1oeVYT14
	iRtGnuaoZVgcQvVOfRl7d5Gg1xtb5jUsuY6dSQh03pvKezmcdD1mzfC4lGn221M=
X-Received: by 2002:a17:907:a80b:b0:c0c:fb79:ef83 with SMTP id
 a640c23a62f3a-c12a9d70fc9mr313164166b.19.1783007374262; Thu, 02 Jul 2026
 08:49:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630132857.3007019-1-egbostina@gmail.com> <20260630132857.3007019-3-egbostina@gmail.com>
 <20260702-comical-accelerated-labrador-a06ad7@quoll> <CAEFOc63tOQ-uUoL-2kefU-X=SwLqhVG5rE64E8cm1eSeHnTFsw@mail.gmail.com>
 <16acd740-9f1f-46d0-b5e0-41f26350c263@kernel.org>
In-Reply-To: <16acd740-9f1f-46d0-b5e0-41f26350c263@kernel.org>
From: Eddie <egbostina@gmail.com>
Date: Thu, 2 Jul 2026 18:49:22 +0300
X-Gm-Features: AVVi8Cfmnv5EONPBfRHZa2M0oJCldKlA-9-KSBFdQ1HzcLXRdEWuNKB71S9tnqI
Message-ID: <CAEFOc62wAUaoV+pqQ-4LjPNi3ULoZOEpcPAcBxM39D3TdSxCiw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: arm: omap: Convert IVA to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, daniel.baluta@nxp.com, 
	simona.toaca@nxp.com, goledhruva@gmail.com, m-chawdhry@ti.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 2, at 18:03, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> > I will add the justification to the commit message in v2: the TI hwmod
> > framework is legacy and is being phased out, so new device tree nodes
> > should not be required to include it.
>
> This should not be part of the conversion but separate commit with
> separate reason and analysis of actual ABI usage. During conversion you
> only make changes necessary to finish it, not things you in general find
> better.

Understood. The reason I included it in the conversion was that
keeping hwmods required causes dtbs_check warnings as several dts
files omit it.
However, I completely understand the need to separate it.
For v2, I will structure this as a two patch series per component:
1. A 1:1 conversion keeping ti,hwmods required.
2. A separate patch dropping the requirement, including the ABI
analysis in the commit message.

Quick question regarding the general rule of thumb for these
conversions. I understand the expected pattern is Patch 1 (strict 1:1
conversion) followed by patches fixing the dtbs_check warnings (adding
undocumented properties that are used or dropping requirements). For
those follow-up fixes, do you prefer one commit per property changed,
or is it ok to group all the warning fixes for a specific file into a
single follow-up commit?
Thanks for the guidance.
