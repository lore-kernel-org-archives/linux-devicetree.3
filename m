Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5411489873
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 17:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788282641; cv=none; b=khtPw0x2qllaWADk0qXrYOFBf5SeWDeQkWZ9si0XT3i0toXVk3bp65xSTR1l1s+0XxNW59WG0qXh/06jCUcRrOZnMgqgwD4FAOCs+vAa16jaXgVR/doHm9WSw9xMSP6epOWthwwZgzZxdCrz582WdYi6jx0UiY9kIwp5OJIihIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788282641; c=relaxed/simple;
	bh=ZrQuMqy5uBsBDcgHPFdZ9qrEDBqpzn/5bpyyFgMg0/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HBs0GiD2LnOLYGxT2idBcIDdeRVGKYb3FAbAiHBq9bar6ee5mNwwXBX3zV4moAjfFk6UjopyFF4mTPg38WDw5FAPkFf/ToPiTZ2kmiZQO+4A5MVzDE3o+K2oib/EG5L0GHfNOxcVpFRehGD1R82TYILRUO40M1EIg32vIaxReZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kCg31dLc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kCg31dLc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 833351F00A3D
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 17:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788282639;
	bh=ZrQuMqy5uBsBDcgHPFdZ9qrEDBqpzn/5bpyyFgMg0/I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kCg31dLcbcJxsvNlIiGPaRvYTAolRwbnyrTNh7df0NUa4SNd71rD+avlItPibQq/X
	 FYX+850hphxZFeRTMs8ClOCNv3svQ18/42jU7k+arfharYQ8S3H0DTQPecYGubx3iw
	 f21rCa1wCg3O0EpK/s6wrcXMCoJbv/Ym/LHyq2gJ7knsY0XSfeiaSZ7StTnQy1yIA2
	 jsF1Z6p7SKGFCZyg1ziXv923mzlnTNmOS0GRvC2zv9GM/l++idppV7v0+c/jObCgma
	 I3EPRMKxXn1zPoDSRKXeLy1UT8Zu1caYHajFRmGRrG4a0jiY7a5c85rsdfPGIdebHn
	 Kev6e2kF0cGhQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aeb98460c6so1504454e87.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 10:10:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzSpYCJm2X6pwOqWHcLbEsuHCo3YJDHvbTElXI/oiSKhvvqohJsFQfuPPabKLVd81Xf6Cj6sj3aQPif@vger.kernel.org
X-Gm-Message-State: AFuF++nAmbXaXXvfSdfM3KvRC6g0kE5qqjNu7YUTLWqQ1qcK+BlQ7cHC
	30jXvOYHicbFutO/5H2l/e/gblpDDE46kNvSzhz9EVu+G5CkzTA/OAZTr1Cx9tc5X/ZFkUoief1
	dBK0uL/xjvJQeOvgdMy+g8AAJ4IbsJbw=
X-Received: by 2002:a05:6512:12d2:b0:5b0:129c:ed85 with SMTP id
 2adb3069b0e04-5b5e68bdacemr11077650e87.1.1788282638096; Tue, 01 Sep 2026
 10:10:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827110242.1203546-2-andy.chang@synaptics.corp-partner.google.com>
 <20260901023300.1382808-1-andy.chang@synaptics.corp-partner.google.com> <20260901023300.1382808-2-andy.chang@synaptics.corp-partner.google.com>
In-Reply-To: <20260901023300.1382808-2-andy.chang@synaptics.corp-partner.google.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 1 Sep 2026 19:10:25 +0200
X-Gmail-Original-Message-ID: <CAD++jL=0szwyknJ8S7nCgFyxwws-WxeqJHi4w2L=o-T=4k4sDQ@mail.gmail.com>
X-Gm-Features: AcwNN1UH0p3Wtr3eiA8KmHVuccBgaAV41TvtLXXTmB9WfWrOei9guGrG77J8GIA
Message-ID: <CAD++jL=0szwyknJ8S7nCgFyxwws-WxeqJHi4w2L=o-T=4k4sDQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Bluetooth: dt-bindings: net: bluetooth: add BCM4384
To: Andy Chang <andy.chang@synaptics.corp-partner.google.com>
Cc: linux-bluetooth@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 4:32=E2=80=AFAM Andy Chang
<andy.chang@synaptics.corp-partner.google.com> wrote:

> Add the brcm,bcm4384-bt compatible string to support the
> Synaptics BCM4384 Bluetooth controller.
>
> A fallback compatible is not suitable here because the BCM4384
> controller requires a dedicated firmware patch file (.hcd) matching
> its specific hardware ID and revision.
>
> Falling back to an existing compatible would cause the driver to
> request the wrong firmware binary and fail the controller
> initialization.

I would word this neutrally like

"any operating system must discern the proper firmware to drive
this hardware and the compatible string will fulfil that purpose".

> Signed-off-by: Andy Chang <andy.chang@synaptics.corp-partner.google.com>

Either way:
Reviewed-by: Linus Walleij <linusw@linaro.org>

Yours,
Linus Walleij
