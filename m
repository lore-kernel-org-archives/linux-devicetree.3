Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774263D9058
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 23:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777593281; cv=none; b=u7F5Rark/8G9w/umqRQaevgAw0LOigFS/If3M33I2ZHwTEYHHBixVuH5FA9SDBWwAx8ZmMEQMlvQsKzAR6T3rsPF/GIqIoWcyRKSXKKQ4DfcR+PipD3OquWg/kM/wquZc8CS+Moidc//vA+CoJPTSvSdtmur00QmqybDTmsm5E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777593281; c=relaxed/simple;
	bh=rWDl9l88s5smH4oJB25R8ZD9EUfLZO6b7a2lfjBov+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JNyB9otClsz6t0dnqLETKsCpgHeK7HwlqwYEjnuGE/omywtWDca8LeZNgJ+z7OmPu7g42DdFWXo9+7WhWXLS9c06D0UCC0QDtp2r1TpsvrmNkrlTx+JFuQ4zS1WkN8mPVjx8bUKDrgbIFg3VCFRh7fq9hOd/RYKo/a5NwSlY7Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JkAJLzSb; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JkAJLzSb"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-67bc6098640so57135a12.0
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 16:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593277; x=1778198077; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6F0Zles587cKnPSm5xIL1UTxvPC2KivgOEAzPu9dSY=;
        b=JkAJLzSbbpgpkNtOrjlmzFA69wlgD7N0BDyH2VNaINmq9LmZatuVZBHyCHmtuKZXqM
         mjIB9eePuB9qw2bKi2djMi7gL+wnFGnJAFvfObC+RGFoJluZnCh/hmj+YlkFHiCxe9y4
         /tm+NT/yrRQMw6Q8L172qD+1EvM/iWbnIGjlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593277; x=1778198077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o6F0Zles587cKnPSm5xIL1UTxvPC2KivgOEAzPu9dSY=;
        b=TBP1XkpFYEveXtVg2z503eCs1cmBdOxO+hHBZKsDGHJOe6DZ+EkHeSqzDpvVMbL8tw
         8wlMio3vot6QsDhXP6WKzZTAgS49PuXISFl7OFWP8MPE5C0avFBN8QHMum7IccE8hHyi
         /qQUsiwNAUoEcpr2GrtrsHy7rR2GAxUF0fh3zR0zrxvybxKoQ8QtOxK44Xm3sx+HxbQd
         1pgaWV5ZH3ZvxtbsS3zppuP7X0yrPX0a47xH9qUhYJRd4pEfXdZzLLvZy1EpoxLKwWZX
         OnyrjRuNZCtQyDk8s3TAKQ2bP0xPp/yIjt1ajSrokd7zV2ZkN0z5OjWukoUq45+HNZ0o
         PbKw==
X-Forwarded-Encrypted: i=1; AFNElJ/eBmZ61RnwM4VWkVv15+S2tN4OKrsTzDEafJ62HSr+ebQzjnlu3hvat8toOp7xyQ1ZD6CnGF8dJrsm@vger.kernel.org
X-Gm-Message-State: AOJu0YyLzLAZ95M6EiVFBVI354/HzULvbodVZJcmnyCeKoViQ3T7Fk8+
	6KqiJUawYvlT8yDbGt3MvptSeYZFBBh0GJUnEueVZ6MKHsp33qBssC6t4FNIFt4IE982W5kUecP
	h6np1jA==
X-Gm-Gg: AeBDiet5GoP3VuSt9qFAyZI1DgF698Tn9GC0d0m8WbX7BY3R3np1Sui01IrEYIKPz23
	6+HB2Kcn0aklXehvP6ZQE1I3LWc5qeGXk3mpkocukAo1ZBfrSLLIjS8/Na3dLgG4vTQSPOF6Ree
	S3gQbDOESTeipAUoq0QopLIAJAg4YO8HUS43JecH1gVsbCdrQF3OKx9VvvTkxFnksaE9huGpX4Q
	NgkNnlAN348vx5TBjhKw62TKkuTkmZuzzWkQirQhGk0Rl5IHslYfoJf8QNoCyLftQq9rG1V7Wk+
	FK1qFNT7Htlxy39H4MyudNuXAms/Jely4tPybIpWT2nglAec0i9NDsfMai4okqgpeU+LwU6JgsK
	xqP4f97xfz83du4ZrwfPNTYwGxiaNwm8rOHJHnxAQC6RpwCId3wQUew3Bz6jQKKh3ekQpu9hcer
	d0rDKBq9QWHCmJS80x1KtCv5bCFAI+bkT/JPotCOGWgYfXRBJ6MwGSDqt4dV8O+Gg1/c1iGPNw
X-Received: by 2002:a17:906:4fce:b0:b9c:c3ca:a724 with SMTP id a640c23a62f3a-bbac4cce26cmr295077966b.8.1777593277424;
        Thu, 30 Apr 2026 16:54:37 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6aa5865csm47553766b.27.2026.04.30.16.54.36
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 16:54:36 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43cf8d550bdso1300655f8f.0
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 16:54:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/SuwETW/V1mmgYO/GSSPttmo28wB57M7LcJeK4sFfrbXREmakAaK1fkPLdyc9STAw+94GKH11B1/Ex@vger.kernel.org
X-Received: by 2002:a5d:584a:0:b0:43d:6a0c:9571 with SMTP id
 ffacd0b85a97d-4493dcd3c71mr8939823f8f.11.1777593275557; Thu, 30 Apr 2026
 16:54:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-3-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-3-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VFCEEBKYY8Wnt6JEK_N4NaUvvhWXYR1pbt6teLL=zYeA@mail.gmail.com>
X-Gm-Features: AVHnY4Kl-1ca-wbSwPcS9uBBAU6zbdhWLbd9Fj0fAjnpUI5H2rQOrfd8cK8P088
Message-ID: <CAD=FV=VFCEEBKYY8Wnt6JEK_N4NaUvvhWXYR1pbt6teLL=zYeA@mail.gmail.com>
Subject: Re: [PATCH 2/7] ARM: dts: rockchip: Add #{address,size}-cells to
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
> ---
>
>  arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
