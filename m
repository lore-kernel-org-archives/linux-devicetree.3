Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D7B4A8A28
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 18:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789150100; cv=pass; b=XALb8d7dEhZS0Fk9vkPlpRH4BPttoVWYC1lPrgWK9kvE46HHY+xqP3F2aL9yzVivtrxd0u7niSet993S2Rnn3VW6I4t5JdkX8yEQRPjM9zQyTNNL8DM8TI179wXSeSw8YlV8hgh72Vd8DiHrcLqJZRpKAByoABOAFHYVRQ9RHWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789150100; c=relaxed/simple;
	bh=Vhnjxh1HDobVuiEJYIJm79PAu7Y1XNjwuISN/rF7iDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rnigH2OB6qj+imjtIyUm7AC0ADqVrDBAvEoKsRb9LoLTWPjW7qQSisup82ekVuf2CbPJ3wJa0f6lM7RoEd+NZsy618H+4TlERk1UAVrl7RYnw9xF/dU+uNH9pStEn+ZbT8squzbSZFvwUJ199FiGVr9Jc0RxdQhA7qP4oO4n3ZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l0qPQ/g/; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l0qPQ/g/"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a20f06cce6so10504771fa.1
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 11:08:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789150096; cv=none;
        d=google.com; s=arc-20260327;
        b=ZjHuOI1vLtUd0pBmQYAbTOHTyWf+WbRGU9FIOVIHOYeLVModorHUBTeTom0tIpqQbf
         hIuVxVK/VEqaBwx+kcWW7uH4+08YpWNkRVtGk5Gf8XeHq+hsRcMgn2tc0x3Vl1FxJB5D
         0gi2uIs5P/UNI/XFdQuoA3NrIJwiDO6HxBfBtYiSAboGpqd7Tt4VsCQiP0mjj4Nmhma2
         xUMeWNExikYJZW4WETB1/5HVfxjuq8BaHwR9z9nMqnuvncYKJ1HB0nMdCNwi/On18fsw
         nA0vHyXMQYcJxMp8u5QB1BCjIgvGhMmU+HmXMV+RuX17VuKJ9xmO9hySSGWQHYb+dAFu
         plSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ouJPu2UO9j/yOvhcg7Ue0/AOuAhMQTW9jyKxwu22jHE=;
        fh=5NcGL4W1K2Q4d9OPA5RiLSJ+PLOjHzg9IGyx8HYvI40=;
        b=Ls/UeJbxARhF4LHIrq7t32SgpuZ9UdjMVQp83bTUa3bSM3/IrT3TMiXu3ZsNA8x8Un
         d3iPeumGAEZjKsXvnCGp2oshXV2YMjq/av1m8HLvgaqIqbOXI3EO8UkvSkyIOjLWTzQV
         slNeYBSNBPT3vTn1OegTzvMCWXI0wFbncTUlgqdMJoO35uSWqW1pGkbkj6cgLIu0htlJ
         /Ti4HTL9vTnsarT6sEQMthYNX29rjm6xi6kCXHwSG8ZmAEF/IV3kCziqbnV8LCHBX50d
         T//OXWxauM2h2SNKIp8hfP9AKAC/5G8v0Z+o/Vo/faXBnEbdJpTQSRtr0ltwtD2KDDR8
         I+bA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789150096; x=1789754896; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ouJPu2UO9j/yOvhcg7Ue0/AOuAhMQTW9jyKxwu22jHE=;
        b=l0qPQ/g/9zteRf65RiOvlykq67P8LZojf6F7srr+GxW/54c6ya0LMwC+JFGKXATtak
         dN8oRvm2KhXDNlep6q6U5Es6JPOed7l8DGhuD1OUKLtNUFnq9qQhwpqqvf2oSjGdTN0R
         g0TDYyp/3MxYhE+6c82CddRUnOr/350/xZEZAOGMcC3vBWL/YvmVpN9xwfM4UMzs5rQJ
         4om9UOT3SsfQykIIu9lBa5xQWYdAyVuxBSec9m/VFunbJw/GdyaJcg+PVNCCoLe2iRv4
         ZZSejNEFGvBQC8wLkadmN2ms6lL7OzJ47qtgqte+yn8249T3Mu79zqPO370w7p+idzUM
         zUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789150096; x=1789754896;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ouJPu2UO9j/yOvhcg7Ue0/AOuAhMQTW9jyKxwu22jHE=;
        b=pa4PD/Ne3dLQOW8X3e/TLeRzHnkmuQJCPY6nhNzcmya+leBRheUub0t9z0mcb3yw2V
         +woPnLz5xoQnFQVqeK3+U1OZmEI33wl/+IWRy4Z33ax7gr/SEFsquB6SbcCQObWzCsg0
         AbUyHgh9URvi4zt6BfDo7VPwQj8f9hLl54W+BTudSb4KU+ZaxdqVMuAugW99xtGy72XA
         AHMP2q71Jzdc2Bz7v7+sg5xZRXjOudehSxSKMHPbF2Qh3DTUJGW1TkNgDvFj4Oi3EH12
         yUbLkkz5tKsfEwqSGJC98ql8Rtqnekhktu5dYZMKi3IdVOpcOu7zxyL2I5ArsUF84Y7x
         4vGA==
X-Forwarded-Encrypted: i=1; AKwUvBxN+0LxUUwx2Zqokw3VgVnp+pr8IisaYmFa6BcmdEre/aFI3Cl/cuzOCpSyU6cBTl02zsUIY1C6IxGJ@vger.kernel.org
X-Gm-Message-State: AFuF++nX4jwP5HW+9aX4D6f4cKjyN7wTr+PwXX+6zfUBjcpdK1+gfeL8
	3IuVyO6F94TmM6BJMShNHUTjogL+yhKo4o9N8EsN+Ambm2f3+qtQH04YRsqPdUI5colbrooJP1q
	9FEZT1f/Lu4ww/iBipfEqh3aSrlDZ7lY=
X-Gm-Gg: AYBFou34NrKXN72kRssvANNrycV1aBn6xkviDMZng90z1oN+CHo1WV00SBqb26Xe/XX
	EC5Vobh9Q29Gvof+CliuCaT60KELAAB6ioJvPtm56KeEvH0OcpPD1kkmFHh0Zo78PxejKobSNzq
	Mar7rX0uB9V6sV8Qb1eoxRduq4IGPqQYyb8zFy1ek2cCAXEZ8I6fFW+EZ2w/yB76S3Ba+LI01yt
	Ap2NwFkrnuy3AaEMYY5Qn+euH+Vg7bwrKvTcFRe6zn0FiGtZ5lEpaaANuxYya/Xq+EUxrfErq/G
	hqt08hHg15BhbzvtzMtULQDGhRBK3Arb/0SQoOInNzQsdJ0nq4JUhhFBE37lHffsAkoMLf9knAt
	0GYtHFpWNi6vJnKgqC/2Yj2xuOOVhxSyUE6XaNAKVce350HIaSXDYPg==
X-Received: by 2002:a05:651c:4cb:b0:3a3:3fa3:25a6 with SMTP id
 38308e7fff4ca-3a591060d33mr13539661fa.3.1789150096131; Fri, 11 Sep 2026
 11:08:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-t210b01-pmc-v4-0-af68a21cd746@gmail.com>
In-Reply-To: <20260727-t210b01-pmc-v4-0-af68a21cd746@gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 11 Sep 2026 13:08:04 -0500
X-Gm-Features: AcwNN1UL3Y1nd704u2MCWStPUxYAt0AKVH-AFaP-s9fmNKYucXoG44JF7P_CHrE
Message-ID: <CALHNRZ_i+yBeYqGnp8PGfpYdT8cU8ah+8qm3O2vpoTtEmUx-=w@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] soc/tegra: pmc: Add Tegra210B01 support
To: webgeek1234@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alexandre Hamamdjian <azkali.limited@gmail.com>, 
	Thomas Makin <halorocker89@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 9:00=E2=80=AFPM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:
>
> This series adds support for the Tegra210B01 SoC to the Tegra PMC driver
> and documents the new compatible.
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Changes in v4:
> - Add venc to powergate list in patch 2
> - Link to v3: https://lore.kernel.org/r/20260722-t210b01-pmc-v3-0-1c5b970=
788f2@gmail.com
>
> Changes in v3:
> - Update patch 2 commit author and sign-off tag as requested off list by
>   author
> - Update patch 2 commit message to describe the powergate differences
>   compared to t210
> - Drop sata powergate in patch 2
> - Fix has_io_pad_wren value in patch 2
> - Link to v2: https://lore.kernel.org/r/20260720-t210b01-pmc-v2-0-ca5317f=
8507b@gmail.com
>
> Changes in v2:
> - Address sashiko report and drop duplicated structs
> - Link to v1: https://lore.kernel.org/r/20260717-t210b01-pmc-v1-0-bf776be=
8b3a7@gmail.com
>
> ---
> Aaron Kling (1):
>       dt-bindings: soc: tegra: pmc: Document Tegra210B01
>
> Alexandre Hamamdjian (1):
>       soc/tegra: pmc: Add Tegra210B01 support
>
>  .../bindings/soc/tegra/nvidia,tegra20-pmc.yaml     |  5 +-
>  drivers/soc/tegra/pmc.c                            | 62 ++++++++++++++++=
++++++
>  2 files changed, 66 insertions(+), 1 deletion(-)
> ---
> base-commit: 1a1757b76427f6201bfe0bf1bea9f7574f332a93
> change-id: 20260713-t210b01-pmc-1a3f8b908044
>
> Best regards,
> --
> Aaron Kling <webgeek1234@gmail.com>

Thierry,

I see other things going in currently, can you pick up this series please?

Aaron
