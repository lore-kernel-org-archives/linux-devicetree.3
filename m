Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F64D2750E6
	for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 23:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777246850; cv=pass; b=tJOt73O/06d++Brp5SVHBnI8SpgH8G7nnGf07dq7FWYaeCu+ZhC6faCJikPQ9kBST+or5otcM7Cjq48knlziZuevC2CNnmiC9cpxCgvElbMI5/p4jRCPzNOhXfiSjuOxIhqO9K8tWf/Xic32+M9Z93lM5gAitaDXjh9XGCBKne0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777246850; c=relaxed/simple;
	bh=X0R+smGYEcUcLNPqU5xk6J7XACJYnkvYN5xGy2f4apQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a1wahi1BiRaySr+WgkvY1JRVI1okQJEDyTa9XQNV69xPzOa/CEV6wAR1ngf/ftx/z+cZkszLqGP4+u0c46aiHn21xAEe4bCAX7iAiZBlHlEWjstJeiYjzLLSZUkAbQQFiaph0g1Tlp8q33/9ASnw2VmY3X3fsINOrrNG7AZ6i+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qmTRfpii; arc=pass smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qmTRfpii"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c70f91776fcso3643272a12.0
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 16:40:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777246849; cv=none;
        d=google.com; s=arc-20240605;
        b=IjBNkVaurV4pNFuZ9y+EnLOjINURdlJpyIAyYHPoM0quYti3hUKRJrYc1J76Nj+kJk
         ZtOxAQDFEgRO8+OHu74pItIQ4zivdQTtezSW9/9jBcwudRxaxWTUKfWRFwrHkik8GXgK
         ndXWbaPejR5TTRpi7tHuMTJdjygNobXnnk/Pl+zJUZtcBvY56iUtsW1dSV/WZCsFTSmL
         uAye588D2IKsKAkFtnFA8k0O0tzAFW8GnnlJs+IXUo4drBC/xnbf6MfsftYKmIkv/KBH
         Q9n4T2Lay4Ajv6ARyzHBpftEBvTAi2Vk266w0aJTdu0u1ZUbGTmbGgenVHlsDXTOqR/8
         O8Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y0mG82ZqnbNgU5UbwCZHANJfxcxBs7X3CB8+aFRbO3g=;
        fh=4AYeKdjbOiD3SWc+/p1SWXJvawxhxr6Gu8T1f53v1T8=;
        b=iGzkYMKRKVY9X0Je3WtAeCJ1r/N4h4N4n7ZEiUKlwNhl40pETpsGqzk+y0EGS8wKI6
         htBvLRAaaV9HrUyE/NMJ/r3jqrrth9+76RQk+IzTjs3Os8YfGWI/S+bNuq4Ev6oQiw8J
         hePVgNurJlhr2F1f1xgtH67xTxbDyFNxBAbuCGS+Pyi3S7lceyEWApY/7yqcCqV7Ytb/
         W/PQI0f8IOHWpiBKW0IKFMrbCIVK3Nq9fKhm6M4mKTqjCFH0m6W4bv/slv96n6aw9nj1
         g5d7tcUpISnsPvDsfAQtAOADopc3OrKm/SrEn2iR2DFrLauMyU+y5zY57LTHR4yzsAla
         xK4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777246848; x=1777851648; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0mG82ZqnbNgU5UbwCZHANJfxcxBs7X3CB8+aFRbO3g=;
        b=qmTRfpiin/w29+GB+htBgs3zJWgka1CUu8RvQ+P4tiRy0g85vfg0LR3aBVTm7ISu2e
         0YWl/ZHyH059cSZkWkSrUl/OSn04GuRxsfDwPiOMrvD6oYY4V3Fu6TTqDRw5bWp20/5s
         K8DLoki6sFLlWCLfdg+02vR697XlzPai6WFfrU7TMFUbMNNk6cJgUc9SHtbb8voIxzXM
         6GPbi4wOrZPboxBmOazvjnO6htFPSSHwRhTnS8w742sVAvflCOaiFVmTpJpdWexokKcO
         iYUkCpcYlsSkkPG6zjv36MZMMnRPBEcUwht8b4Ah+qQpfCJzATn6UHbEcraB97+iLI/t
         FQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777246848; x=1777851648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y0mG82ZqnbNgU5UbwCZHANJfxcxBs7X3CB8+aFRbO3g=;
        b=iljklL2ZOkdQuRTyMD0BT+3SmLuyHuQeMgPYCF3zyHL2jodBCX6ENAJ47PaahliE/6
         rj2JYXym6jQpQSpglhQ9luwxjYsmfpm0Gg/FN4cix2T2UYq0dzKXw1Pp9hyBD5qoMabd
         lqVz0tFebYnREpTT9kHNr13ibhG/4Yeis/0cLQLO5afU13/GzCTIZtWtdmYPoZitBXG6
         DdP2SY25cFHQFmTxBN1KrnVyGydmDTdsACE8f8WH2JYxAk4jpm9Wbkl6sSAL8IB+xdmz
         d3sLnwGdarjFRE144E/e76yWyMZttF7NwTjQ3WfFFzfoi8n7RJ9mVYhekVHxNdTo943c
         Jg+w==
X-Forwarded-Encrypted: i=1; AFNElJ9IYEBzldsbIqsPsULmdlGhsFfHQ/rkcjFdqz6BicTjw5mr2GadyXwyPzfJuCMJ9OKmWsEHpYNvAPRb@vger.kernel.org
X-Gm-Message-State: AOJu0YwOQrP3xjhREG6vGFvCSuwl53ctp57uHYrsch2IexLfgKCGTFPn
	ttLWeKU3gZ4DTV5TI+o2u+4Zckgftpwj1ZP/Jok6G4CMdP2AJfzRVvVlbPp7tJ6HUzP38MlTD19
	Smfd45+ZHFCOTSE7UXVOfRIIK30Nm/9Y=
X-Gm-Gg: AeBDietXhL2jwJTutt8DpUKQZua1oORho8nEcNwhGfoQ1w8jCUesZd87sjFTx7yhRCM
	fi53t48UMWXEMO0nbus9tNepSjvu8csBrQT1CN77k/lHLuTeaaaBzRYVL1AHVtBMT+ZpXW1aJAI
	TvG+XCQErRwme7CazoaPZgbBNllHnnG3FR1UipLMWbJVcu2dT9AEJqdDafVYmnlMGGTTokN7zMw
	dhwMsBvELMwqTvcmQTiEJTmbg08gIl1ByIWRUbDaW64aqnfB7/RQJYMVI9YymQ+XipXSoNZAe/f
	ygpTTUWlNO02K1ttUSMbExOsSpJcRvbdwSHOgcpRGnwepac=
X-Received: by 2002:a05:6300:6d8f:20b0:398:8870:b531 with SMTP id
 adf61e73a8af0-3a08d70a1famr25303284637.14.1777246848558; Sun, 26 Apr 2026
 16:40:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423042831.21114-1-phucduc.bui@gmail.com> <20260423042831.21114-2-phucduc.bui@gmail.com>
 <20260423-ingenious-psychedelic-jaybird-40bb4d@quoll>
In-Reply-To: <20260423-ingenious-psychedelic-jaybird-40bb4d@quoll>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 27 Apr 2026 06:40:31 +0700
X-Gm-Features: AQROBzALmqPDt_24g1IGVKGMMWkAGDfkR70trABOv_7t1jBQYK1ibQPH5H_P7bg
Message-ID: <CAABR9nGH4yZcgyzm=wNYVHB2vLhojZJSHKOC6dSeQPm0rbh4KQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: drop redundant wakeup-source definitions
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Joseph Chen <chenjh@rock-chips.com>, 
	Chris Zhong <zyw@rock-chips.com>, Zhang Qing <zhangqing@rock-chips.com>, 
	David Rau <David.Rau.opensource@dm.renesas.com>, 
	Animesh Agarwal <animeshagarwal28@gmail.com>, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

> > The 'wakeup-source' property already has its type defined in the core


> TYPES. It is plural.


Thank you for pointing that out. That was a mistake in my wording.
Regarding the two data types, I=E2=80=99m already aware of this and have
discussed it in a previous patch.

https://lore.kernel.org/all/CAABR9nH3hr+Y5ksD0cn3Gd9XUvmb07X7zJw0b4k_yVbnAu=
z9=3Dw@mail.gmail.com/

> > -  wakeup-source:

> > -    type: boolean

> > -    description:

> > -      Flag to indicate this device can wake system (suspend/resume).

> > +  wakeup-source: true

>

> That's wrong. Commit msg is making here false statements that it is

> redundant. I checked (and you should too!) and driver does clearly

> device_property_read_bool() thus the property CANNOT be the second type.

I think Device Tree bindings should describe the hardware capability.
If the hardware supports wakeup functionality,
referencing the core schema is sufficient. Hardware description should
not be constrained by the current driver implementation
( e.g. the use of device_property_read_bool() ).
Bindings should remain stable and generic, while drivers can evolve over ti=
me.

Re-defining the type locally duplicates the core definition. If the
core schema evolves,
this approach would require touching many bindings instead of updating
one central place.

This follows the recent cleanups suggested by Rob

https://lore.kernel.org/all/177628888260.592110.11727813820499601669.robh@k=
ernel.org/
https://lore.kernel.org/all/177679687272.1458365.1328485324673928433.robh@k=
ernel.org/

Best regards,
Phuc
