Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F303612EE
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066693; cv=pass; b=VhI+bltwaGtv9i9WQwVhz2Ed0c/CYD7ndknrNb3eWybpoBLC5F14i1uHSXjHTYI7fpuPMoC8rTNgUqvWpUlSHcC8Nc4xGLPS5HvuOEZI8z9L7AfPRZVGzrB9zHxKB/seAJr5Lr+i08EbqysfRSIsAA1tRx+CinWqs66SnIqvgwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066693; c=relaxed/simple;
	bh=fQfj+gPmvgEK0Au1fq8tS1UqLUrdEtewMemM1nyumCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tH5DlRwDRvt7ZzDjBKyAqY52+JXQZvxobV+g34ujyvdeXZQCwIN62+U+DGHybWWqaEjgyT/yreqXXvI8VNwMjXYk2iMIWW/9IAPoS/PUlnLerny2v3oFeOd1fT/M9DiQiGP36QRR9h9hJKXIJmAZXQZZoKkCtLxyXuGU9dgA2Fo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CyWOGUdF; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CyWOGUdF"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-132d1b2519eso10644566c88.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:58:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780066691; cv=none;
        d=google.com; s=arc-20240605;
        b=Ylv0DZBCV2gD7voQHmD+wHcUW0dG4S7TYcNJ7HPMgjTL1/aNxzxxZLrZhWuYtunz6u
         +xrswU6jI7v/iwL3UWqxaT5dheCT2EQC4khLVd2nG3csYPwNTtQ8s0A5gbIVVxEV8HeV
         J4ZGK3HYsVHhKG9zO48GdDXRTjoevErX8uIQe0EsiIwrVOF9nBqBPdqRhjdqiBThSMLe
         IFNPncwuz+Yc7NwWOt3vqFVKQk6zAE1YQh+7mbVLoK44DpyJQElbUFA/NJE1Eyx8GDM0
         r//cijaVwSjWJ+Ln7lXmgr6rsfMukoXA79FK8huLSmBj/k3fbpqjQVQXk8zfJaMRn1OX
         aRBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D0M/NZDH6fcDnv+eyc8PV40uOX6pNFdyudXQwoi/OMA=;
        fh=QcUown2p8LMi9AFk2iclb0pQJTUuxIzG6fkvBfUmBbI=;
        b=laTE6b519LDKK3u9zJQAK15jO2w3N4oizqEiG47VsY2rTm34t+a6IilOcIhmc0GirK
         vnQb1vS00kRvy2cuf+R9zooG3Ft8+UneM/ilsZxAxc2uIwL1Gd9iTrFcXlH9a5ZRzk6z
         TqHiO3NEt88E74cWCOUDLiFSi6/KKg6/gFrcAUnBDUufak5w7LTaUQuXo9MJQmMa6ELF
         t1Wfp4WDX7sUwyJhPValHeg2Uuskfv4cppUdKf7/X85PjraMdcTYtOCx0cNLpemDRGdb
         kfCE46etQBtcmvz8Zxa8xpMLUcIMhK3MKqxoY1EfduTYmA4brGUdtmfpNPZO6+ci6PN7
         Oy0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780066691; x=1780671491; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D0M/NZDH6fcDnv+eyc8PV40uOX6pNFdyudXQwoi/OMA=;
        b=CyWOGUdFOn3NrSgpnO5y1zSbbaZfyqNAaxOZW4bX0ecjvX3v4VcoYZkF0IbeMy6elY
         Iqhg40OsDJj+hgkdC8EKY8Y6vP6CK8ddUAREUAyYxCHZge2CYIyd0WWwvUL5D8mmZGdQ
         oWQiOxJIVnUZbKIf3jmgMh8rvYOOIs458YOj8RAQsIgpLCxP5MW3p7GZs+KE+Yyda8h0
         2B5FeG55U7zCz3kmLiTxWuyE1bYjK4WZSRuuj/6+ijuSR50u/WfKLwNddAoUbejBKExi
         I8Rrj0DbemTU8tcIZj//H/XNMQRLCw4V+yhMHZFMrb7PIKPq+0ZH3KPVGdNMp1I0/FG9
         IxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066691; x=1780671491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D0M/NZDH6fcDnv+eyc8PV40uOX6pNFdyudXQwoi/OMA=;
        b=O+SQVzepubgsLVKHAQHV31SObYDdpIjQXvRAxScqLx0wTvibe6PSAsJuE30OeXNoMC
         BUUXj5WpJD04Pb9t7VAU6Yy0dxIX4ceBDsaSSBBuQpQ0jhtegEj3skcL8NmcRzJW0g2Y
         PzXTAP/EzgrhcCPJYMXW6COGNJqCMbNt5YbDr2Wn+kD2hdrq9V/mvqsxA+2LvhjeeEtc
         1oI/M/BtlcYMfRIfZRisO/jCwHdRk5VL5AZvWxrFQ2FGrsQAh0Jgx1ceov2yjvS+hmzw
         gNR+zcdzDhQkMz3i+GABsci8YoStF9DN+cTkHHqkYKz9vDlGauJHBBfVPpDZTt7cr3PT
         qXDg==
X-Forwarded-Encrypted: i=1; AFNElJ+PQs6Iqs4F9BMjHbDsjg8Zfmijkhjvajw+2V5kWmL/tnlpzUvDooExg53rF33gA0sQdzKS9FUdDciE@vger.kernel.org
X-Gm-Message-State: AOJu0YzOkv9TZr3tGlNuU4odwmN2vPizNg0kZ9pKKAt8Uw+TA1Vf9EBe
	OxkmmuDR+8VJdWNzNvTnvHKqig6Nou/LYSA6DS8R8B4dO7qdommuqGfqSZa89VqK9onvXiEoNtE
	Fg2gtbB1zUur3upDogERNlzOi9MXOq0M=
X-Gm-Gg: Acq92OFg8AatJq8isx+c8HOEEiDi/NF3+TE3P8F6a99WzURELrgKVchPfITFYBdtqtU
	oACmax4vg+alNzEOpenjpEhHoPkNFnKbuKMCYtKfWhgNq5CrV2Ud/riuhBjEHiPB31ZBibwnfqf
	2nztgS7MtARoZVDRE572hcdjNl8h8+pukxQtGRuLDZqNBM/gkvyTXUupskOfFe+NRI5zWpl+kIA
	Pl16YmWCyltZsqO09Z4HJrCKJ7IweiGH4STImYcp3ZkQs1EMnaIhXy107rpcEmeyHh880CsdDY8
	xjnelejs/56WOuYapyc=
X-Received: by 2002:a05:7022:49f:b0:136:e42d:2c20 with SMTP id
 a92af1059eb24-137d3f0d89cmr13506c88.16.1780066691402; Fri, 29 May 2026
 07:58:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523083013.46372-1-clamor95@gmail.com>
In-Reply-To: <20260523083013.46372-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 29 May 2026 17:57:57 +0300
X-Gm-Features: AVHnY4K-1vYeiXFYk-AlYEtzVzIQXE43sf_M9vxLcJuCUs6YujSLvUbhSvlV1gE
Message-ID: <CAPVz0n3hYU86yGeNS9WqHHPqn6JOPGrTqtSz=afs-SyDgeiKvA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] usb: chipidea: tegra: Add external control option
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Peter Chen <peter.chen@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>, Xu Yang <xu.yang_2@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D0=B1, 23 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 11:3=
0 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Patchset adjusts the Tegra-specific portion of the Chipidea USB controlle=
r
> to allow for the disabling of automatic PHY and USB controller
> registration. This is achieved by adding the nvidia,external-control
> property/flag. It does not affect any existing configurations, but it
> allows the USB line to be registered or deregistered by an external
> device =E2=80=94 in this case, the modem.
>
> Since Tegra USB PHY holds clock gating for controller PHY cannot be
> handled by code Chipidea mechanism.
>
> This patchset is a part of larger series aiming to bring XMM6260 modem
> support for Tegra devices:
> https://lore.kernel.org/lkml/20260511135703.62470-1-clamor95@gmail.com/
>
> ---
> Changes in v2:
> - separated Tegra USB into its own schema
> - tegra_usb structure moved into tegra_usb_phy.h
> ---
>
> Svyatoslav Ryhel (4):
>   dt-bindings: usb: Move Tegra-specific Chipidea USB properties into a
>     dedicated schema
>   dt-bindings: usb: chipidea,usb2-tegra: Document
>     nvidia,external-control property
>   usb: chipidea: tegra: Avoid controller/PHY init if bus is externally
>     controlled
>   usb: chipidea: tegra: Expose tegra_usb structure
>
>  .../bindings/usb/chipidea,usb2-tegra.yaml     | 95 +++++++++++++++++++
>  .../devicetree/bindings/usb/ci-hdrc-usb2.yaml | 22 -----
>  drivers/usb/chipidea/ci_hdrc_tegra.c          | 43 ++++-----
>  include/linux/usb/tegra_usb_phy.h             | 15 +++
>  4 files changed, 131 insertions(+), 44 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/chipidea,usb2-t=
egra.yaml
>
> --
> 2.51.0
>

Hello there! There will be no v3. Sorry for disturbing LKML with 15
year old obsolete tech. My mistake.
