Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB042C3255
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 00:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777593641; cv=none; b=ky25eKvFVAi7fQRgPWe7BxdzRwVD/xIrFtilk50wVEByWTDR7tydOi4ytl78JMlC3AqFj6kVkW1dVnzvYAWkXLNq2WCypbFRkrPH+uYJT8GQqavjiD0r1RmjtEvch4ufKUUPa4N2Am0WdKWEjWDernkKa3NC3c64pM4nOnacVKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777593641; c=relaxed/simple;
	bh=E5GkC4G7rtGBz2MILCU8/hEbtGwGymi8oc5Ct4p7lLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=awfjCBJ/YgZE+Wp9GuMxDz2q16yOi91aswJEF5DajIdNmL/G4ANeSQd6vgM0WlfZr6wzYtlpPT2BKqM8/x1hL1iYjRw/dQaUN5gSiTjwnAQjLeyJCdgA/REXMIyyf/K7IL90vgvW+cFZfmQTM7sijDIHEFpdpXwfilvCGS6fZVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MXJzsd4G; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MXJzsd4G"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ba922426c5cso266608266b.3
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 17:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593636; x=1778198436; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVHhCQMUid03F9iDcHc+WtyXeEQi+bjBCIpWQi6kbrQ=;
        b=MXJzsd4Gze9A2ayuvnr97OF8lqCpEjKmUGyvH6Sft6VhF6FSlehMi/qiThpOR/UB85
         ykXQq4XnADkzsHKRVzqjJ5LAlHwyMOTLqbuqHFTsKLGGioJI+CQ+6WerTib8ewVc0r9o
         pwwhVyE+6aScR4AeuSVRht/dZIP/TL09oEObg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593636; x=1778198436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FVHhCQMUid03F9iDcHc+WtyXeEQi+bjBCIpWQi6kbrQ=;
        b=GFLh0d7wEtq/0cdNNaRJMRJ+qLwS4Fw1EvsOUXHBWfZe1SDAVAeSj5bHuWzW7euoB5
         2Rq2AxZv3YayioFhbE/CyZgVrQ7hauPB0KZ9vtoRufIehghQAKxBcPKaU1AEnd6wJtll
         w3/qMHwHN3b5wq5d4CoD8yN8DfFVeKhlT0yP2A/HurF53mhGaylnUgaW18tzSE3GFnws
         7ZwBU9QLLZLoXuqH4mpbA5YdItw3cJzoYPrz1jtUBQQf2IgBdWwA83IkdxVKVyATFpcH
         2X3KUtmCYFWXaEmA5e10b6O74viqBbpRBIqoQlXWgzTa0SPKMQcY7LasOhBpvRCgsleX
         e1qQ==
X-Forwarded-Encrypted: i=1; AFNElJ+0lPFZxMwQxc7aU8o4XQ6aja4epso/Y/mtOvB3HJBk5PLw9wTbdOlRrwdqvlB/CfOZeRN8tK5nRbPl@vger.kernel.org
X-Gm-Message-State: AOJu0YyBBHyl2IadECdNp6CgGemaaLTWX6qxebvMa2NUnktRSAThCZku
	op1NyXdl8jpG3jdt/7ue0CKXvxB3UCzkjyphauQ+SobCcDIhCcxba1GoDOGIpsA3I33lIR3fy7g
	M9EkLtIu1
X-Gm-Gg: AeBDieuAI/hAXfC1ZHs46ZNJ1VvRMfZR9rKgPj8YLRgdfOI9kuCNgyYf3cOyw3sTweQ
	SLktLplL3PLa/pjyTaYXBM8mQ7rsMkYTYRtsA1bihH+VzWdjQv4OP99tV85LyaIlOJMb872dujy
	xPi901tXjumeKJx6rZk33qXkSGL+yNdNs49ZbAXXVU7CTqlaT5EWWp6QJid4YvIdcyODN1t+30R
	2j5pdPYHym66F3SWVvrN5Sh/b4mjuGK3Y8QA1/MpszJwtvw9yF4JqcQ1bHETp9p3obVD2IyjGXv
	Uta/xEtQf5o921XL0DFImk0hp+gwbDQlnn6sESh2MybwW+RHAa2ulUtDzhe+ZewJQ+iBjY1bC/5
	uyA15/QjY2sufU5mR9szyU7vv+gSDa/0WthtULb2/6y/YNOk2ClDFi8bc7JyVPaiKmeWJt7W/vA
	QUWdAXUFRItxeHNWM7ruY51NI/VzTZWeaR9NM3unAuX36mWxPZ93UqgFg3SGQ+1py6t8RBDCBQ
X-Received: by 2002:a17:906:fe02:b0:ba7:d65f:3b59 with SMTP id a640c23a62f3a-bbac46d674fmr331759966b.6.1777593636469;
        Thu, 30 Apr 2026 17:00:36 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6a64d990sm49524866b.22.2026.04.30.17.00.36
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 17:00:36 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-67bb5ad91bfso203814a12.0
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 17:00:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9ptaiFJTtglv89Su9ggvNRcM/mchAcpZT6LKRhPNkzvWLqOBVyKZ7usifM0qN7FyteWyl5Ogx3QpgR@vger.kernel.org
X-Received: by 2002:a05:6000:2385:b0:43d:7ba4:6b5a with SMTP id
 ffacd0b85a97d-4493f814094mr7876169f8f.22.1777593281177; Thu, 30 Apr 2026
 16:54:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-4-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-4-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wzk3BW7qOQHm3zait9p=K+pTNVviMgUF1dfdqw9rimnw@mail.gmail.com>
X-Gm-Features: AVHnY4Lf_-e67ZfLDh6j0F0tOI3LrjkSTUbSwaFXekuSrX2ugdsS_RxN4nbO7Qo
Message-ID: <CAD=FV=Wzk3BW7qOQHm3zait9p=K+pTNVviMgUF1dfdqw9rimnw@mail.gmail.com>
Subject: Re: [PATCH 3/7] ARM: dts: nvidia: Add #{address,size}-cells to
 Chromium-based /firmware
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev, 
	linux-rockchip@lists.infradead.org, Julius Werner <jwerner@chromium.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, cros-qcom-dts-watchers@chromium.org, 
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 28, 2026 at 1:07=E2=80=AFPM Brian Norris <briannorris@chromium.=
org> wrote:
>
> Chromium/Depthcharge bootloaders may dynamically add a few device nodes
> to a system's DTB under a /firmware node. A typical DT looks something
> like the following:
>
> / {
>         firmware {
>                 ranges;
>
>                 coreboot {
>                         compatible =3D "coreboot";
>                         reg =3D <...>;
>                         ...;
>                 };
>         };
> };
>
> Notably, the /firmware node has an empty 'ranges', but does not have
> address/size-cells.
>
> Commit 6e5773d52f4a ("of/address: Fix WARN when attempting translating
> non-translatable addresses") started requiring #address-cells for a
> device's parent if we want to use the reg resource in a device node.
> This leads to errors like the following:
>
> [    7.763870] coreboot_table firmware:coreboot: probe with driver corebo=
ot_table failed with error -22
>
> Add appropriate #{address,size}-cells to work around the problem.
>
> Note that Google has also patched the Depthcharge bootloader source to
> add {address,size}-cells [1], but bootloader updates are typically
> delivered only via Google OS updates. Not all users install Google
> software updates, and even if they do, Google may not produce updated
> binaries for all/older devices.
>
> [1] https://lore.kernel.org/all/20241209092809.GA3246424@google.com/
>     https://crrev.com/c/6051580 ("coreboot: Insert #address-cells and
>     #size-cells for firmware node")
>
> Closes: https://lore.kernel.org/all/aeKlYzTiL0OB1y3g@google.com/
> Fixes: 6e5773d52f4a ("of/address: Fix WARN when attempting translating no=
n-translatable addresses")
> Signed-off-by: Brian Norris <briannorris@chromium.org>

Reviewed-by: Douglas Anderson <dianders@chromium.org>
