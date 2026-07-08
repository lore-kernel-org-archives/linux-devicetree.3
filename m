Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99414202963
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 23:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783551922; cv=none; b=dIeO3QuQoAQOjorsKRkHmNYRGEQixmnT4Uwterh2kcscVBmVTqTeNppmdxiOmgX1qwC/TB+J2zFjNDVA8NI1hVBKAnQpXu2KDq7/TAnWiPO5tvYrdh4bfbnZIIw4JoJbFp+mnifxU1sWlp974OkhVLLSEcr0CHPb08CyfvdxLo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783551922; c=relaxed/simple;
	bh=gJhnwQFyZZPO3Q6Dfku0C9MgSivyhcyGuzzoGKK9WGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uT81B2HfhGaRYaIPiI5Lq/6VaDXUHjXPV+5nm5pVWSmxtuyYm0agZKEBUdS/txdfnqn5Q3QXnEFZHEswlhTANuaBVuf2ebA067yHon6NZAtf4H7SH7QOLLfL8gsltv1LrJ3lnrp4KUXpgJ2E5Ppqb59JvyjCpBztbsuS+TAEfdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I5F+Ll6J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I5F+Ll6J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 818BA1F00A3D
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 23:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783551921;
	bh=gJhnwQFyZZPO3Q6Dfku0C9MgSivyhcyGuzzoGKK9WGU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=I5F+Ll6JGJTNAb8qRo5hi7TIglSrFCNmRjIFCYmudqwe669CoyKMjwerpNePCksYu
	 tL+paBKot/MGD3xc9PdiKY/IK+NvalrDSrDFRpuWKEZjfjyalXThkMtUsZJXqRsEzl
	 DcV6T6lT1pz9HRe3letnh2wo7/n5g2XqMF1ihaIexQsBzeLo9o8mtUxyzkoth1CJoc
	 GgOpk+t8F/bCH3BNtATRnz4jO4jDSYoLQDGB9GK9WvdoqQzhAB0puGo7zPIqLLl6BL
	 MT+jFMdl7bsahRxGu2c5NnEXckNV/IfbY8KmqPmvs15yEIqs2u5tu32eniR2GhpZI2
	 SGBo1PPnZB1yw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aeb77b3afbso1139307e87.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 16:05:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoGTqDa05CQp1dRxQY9fXs6zABL+El4OVBn4hPIrQItOLJGqtu7tXSUrFLVXk9mJ1eG9DaLG6b3NswQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxhAKhZ2rGWWpzQuddg5OpEDNU1/K7R7abl8GzZjQz3FX0aM3oT
	ibcMAT4g6OrzAYZD9Cz8nGyVEvYKs7E2I2tAMqyqIL2vQVa5WEd19L3AiCi3Qrj99yA13orA1bQ
	fFweYEHtxHidz0KNIAPxxT29a/OqYGcY=
X-Received: by 2002:a05:6512:2216:b0:5ae:b232:ec03 with SMTP id
 2adb3069b0e04-5b0114a85ccmr1074846e87.42.1783551920312; Wed, 08 Jul 2026
 16:05:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709-ixp4xx-little-endian-v1-0-e9622d0ba9e4@kernel.org>
 <20260709-ixp4xx-little-endian-v1-3-e9622d0ba9e4@kernel.org> <20260708223310.71F431F000E9@smtp.kernel.org>
In-Reply-To: <20260708223310.71F431F000E9@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 9 Jul 2026 01:05:06 +0200
X-Gmail-Original-Message-ID: <CAD++jLnTzXLSkNA8WGci2BZHXTc=Tzt3UVm2uVrsSdmSCHaCTw@mail.gmail.com>
X-Gm-Features: AUfX_mxXZ6-7xp23zFqGb8rY9ywZAoUf1tULVamM5PyyuWduXSwnq9JiMjwOMJw
Message-ID: <CAD++jLnTzXLSkNA8WGci2BZHXTc=Tzt3UVm2uVrsSdmSCHaCTw@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: ixp4xx: Drop the reg-offset hack
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 12:33=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> [Severity: High]
> Does removing this break big-endian serial consoles on IXP4xx?

This is solved with an orthogonal patch to the serial driver.

Yours,
Linus Walleij
