Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0002C40861C
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 12:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785761302; cv=pass; b=Jnf3nRsH7lSTQixrMPceim+V678QWwRkIg5YE5icr1vOrJ76yebwzrJ2xfgG654kf/wa1ApxoWw/yIt+tFw3s7BTU5AKksi2Qq0ZttdWqgu42IjrB0HucS0tfUanyY8T7hGQqhD1l2FQ4HGW9HAofk7YWrj9eGSTSOTOOnNJQRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785761302; c=relaxed/simple;
	bh=FqG7OmGKUyU4sbv1V0oLUSK9uJRSuOp1aPGEqAPuBwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T/9l0BET0pSV2gH0iK4sZH4y7Bn4ENxJSnIpDAO+yzTmaJ2HOhxlKTeDsPCTBiC0RCMNT6DbaRaIZIGOVV5hj+iJ613UMPJyYG0EmtDQquTqeJz3rNyfNtM9PZ+ZgpJ3zp6tx4Xw9hG8j+KekQ45cymeYPIxbMKsn90DmXlwNeg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=muX0k9Av; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="muX0k9Av"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47de008b020so2215290f8f.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 05:48:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785761299; cv=none;
        d=google.com; s=arc-20260327;
        b=X4j7yNS3s1m0KWh4PGSBBLs8DUEO0OUXZ2VHo3Kj5WrYJU1PSFtgFK7MmI9hwlN0Y4
         4e4VbypxUzbIsPzq8CI4SoGZlh2BbK1sT8vs57DMYid8pkYLZIp7M/v4AagoaP9/+LXO
         KsJ41Jmf0P53b3FbWR/kClk2WVzEonlo4qEe4p8BOzus1jjF3CRu3HIcbC2Fr8LF7Ylw
         G4XfAn2zyriUX6D/BXk+5wLterUCBJjUkmq58tBBY2yIQ9whGAL0TJ1CCvlh6fMj+vqw
         jzg7bB6CfSXmty3h8jAgBMoivtLetqKCrKGl9zZLsmm44LPG5fBve29a8i7S8Woc/78q
         VZeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5fax5mU2nzN+Aiq0QARQ+H5w0Gibs6bj0/RcHVBZ+sM=;
        fh=yvifKZYGD/exnVHiPMncrHlYjwcF5S+RgzKMU7T3mek=;
        b=pjb1xlZitJ+d5q0zNh1X7LkqjZZiF4uXJ6qr9Z2ZHcVTcSiniKd02t+KhfZa97/XMV
         5PfcG7F2oDbcpRf7MAzvA8NX4BdL1SVh6S3lzoRxjZxbs14KAmls52rOxbpyamDfM66W
         U3VayKU6vZVm2/vvx8WZwoNB0Bug0wiv1kZR1ONDVlwHc4IeLQlAWLaUVk+UWpM1PZp3
         HT5TyksbXfIocb3DxJpmtcVlvrSB2SLyDnixyoj3SKbaEcwAUEXlUVG/+1dUqmlKbduG
         CxWvajmmBqDhxMiScPg/XyD8PcK5SNSpNZKIRrz/saEOQP0E38Aqtxagq6jndfYzgb/I
         1gJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785761299; x=1786366099; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5fax5mU2nzN+Aiq0QARQ+H5w0Gibs6bj0/RcHVBZ+sM=;
        b=muX0k9AvrH7b+PBR7pwMnntSIKbMKrMW7Lkzi46y36VJR4SapVqccU5iXzMcjJ3rlu
         mS9T4ZuWf5LlPkgZu6QLkjFj7EfGC7Yx/uNdN3sr9oZLdI3fnfnNXk8WVxq21Fe4bJWx
         pxnpIrhZwywwjpH8AS3UxlsH3rmGBJDpLwMzpMcaM/EzqSVIdZH2prrnddIg4hZ9LyYj
         x+8jgFin9wTAfoHzqWe/GJ+rP9fKLe9/7tuwbx7gOko1sNgZuvl5asD90b4jlQYJfp/Y
         HX+6mJ7cTOcR36q6VoTr2lWIiGXd3sEjdAXx8ZGA2qjzdYxJTqtdg0MmYJ2sdCzliC07
         r6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785761299; x=1786366099;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5fax5mU2nzN+Aiq0QARQ+H5w0Gibs6bj0/RcHVBZ+sM=;
        b=s1/0wgHY06oRbJ/GJwz3AwhUMKDf7G1DxvZtF/IoA1RAJIVxeGz1MGS7uVulsw33hY
         cdSUArmj/fIC4igxFbUzzqwBKnmW1fNBH8sC+62qaK/T2itshyiu9bDuH+2/z+/Pcp8Y
         fpFJzNxZn56BoA0oXlu3wf2ZggVhGStilPbzjoT/kDI8MXCz3dwn6hA7DVEt10uaB3bJ
         8SSzcjGk7I7dpsbe5M53i399+okUOqDpK7jApGUY2Uy8wuvmnuSfGDLFvrO1eWcNEUMK
         UWakvRV/b29WFk2+cvdYyUEq0c/YA8ZZkx232+K3YgWhwplI+eL1FAgP36ATdu272mvo
         DjtQ==
X-Forwarded-Encrypted: i=1; AHgh+RpHMLhT7KFrzNJsXCNTo1G+3zRMIthAzrkyhBj9+eyNxbLMYrnd8jV4yBNt6DL3DdMySwyoaxbWoycq@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp2gCmjjKTqTqOb4Kmv/B+gkBsVOF14dKaUggzxerjH/vrkQq0
	xDQk6vbQQntfTtv7ZfH8n+wLasR4DJCfeSoe58aLA6H7yOmjpR9J9DRnew241sHz6IkrpKUr6dD
	iIpLcbNAXajNozwhRjXBKckQerzNCOzk=
X-Gm-Gg: AR+sD12oIv5gJeN1JdF7IE99MF4mzu/NnQfxIcOOB7ImG5UVZ+T5tYtoi7PuyuA5XQz
	ATZNJZCGmP7aGL/IZtys1Lh70Pi8q37AX1WqHSifqyIlH7RDdp+SLK9yXu51gj6c7PELJKlZvbi
	U4tgeFWAxV7fqCIgIolpWrm0FwgijkRTKMuLgXMbBBnSRNapiSI0i4Bzv/eniDqcxAZeQnFVY9F
	u/vHBI0z3UPNsb+wZ1XjXf1edwLRtlwteaOA0Z1TarwXyAhiOaER47dnvKZRvGECVg68Jw8Mxvv
	QE5AsUd+c60I6ZgOsUTmlIwwF4akGuvtx8c7vy3Lo/axk0vAxY4PMl82wSikvajyvWmmR73D3Y8
	BrCHjp6iG7hLoBqSYd6t66nthKwWV69krISWzDavkgjF/129rauOwZC/LQm1yAbU=
X-Received: by 2002:a5d:6f0b:0:b0:47f:95cf:26a3 with SMTP id
 ffacd0b85a97d-47fd32e1f41mr28059514f8f.14.1785761298926; Mon, 03 Aug 2026
 05:48:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 3 Aug 2026 13:47:52 +0100
X-Gm-Features: AUfX_mz8pwuAO_YEZl6wI79Yl2xndxoZy1e642I1E-oM4Ny4k409h84jPMs-axQ
Message-ID: <CA+V-a8vohu9Sswp9jrmUkZ3SUVhVJzf0=9MdU_1S7h6aMShT0g@mail.gmail.com>
Subject: Re: [PATCH v3 00/12] Add RTC support for Renesas RZ/T2H and RZ/N2H SoCs
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 6:51=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Hi all,
>
> This series adds support for the RTC IP found on the Renesas RZ/T2H and
> RZ/N2H SoCs.
>
> The RTC block is closely related to the RZ/N1 implementation and can
> reuse the existing driver infrastructure when operating in SCMP mode,
> which is required on these SoCs due to their 195.3 kHz RTC input clock.
>
> While the RZ/T2H and RZ/N2H variants do not implement the RTCA0SUBU
> register present on RZ/N1, this register is not accessed by the driver
> in SCMP mode, allowing support to be added with minimal changes.
>
> The RZ/T2H RTC variant also supports a 1 Hz output signal on the
> RTCAT1HZ pin, controlled by the RTCA0CTL1[RTCA01HZE] bit. This bit is
> marked as reserved in the RZ/N1 hardware manual, making RZ/T2H a
> distinct RTC variant despite its overall compatibility with the RZ/N1
> implementation.
>
> Patches have been rebased on top of next-20260706.
>
> v2->v3:
> - Added new patch to fix weekday underflow when alarm crosses month
>   boundary.
> - Make use of devm_add_action_or_reset() to simplify driver teardown
>   and remove the .remove() callback.
>
> v1->v2:
> - Dropped wakeup capability support patch.
> - Dropped header sort patch as it was already fixed upstream.
> - Updated commit message to drop reference about RTCA0TCR register.
> - Added Acked-by and Reviewed-by tags.
> - Updated Kconfig help text to keep it generic and not specific to
>   RZ/N1 SoCs.
> - Initialized rate variable to 32768 to avoid timeout_us of 0.
> - Made use of RZN1_RTC_SUBU_RTCA0FX mask for SUBU register access
>   instead of 0x3F.
>
> v1: https://lore.kernel.org/all/20260615154805.1619693-1-prabhakar.mahade=
v-lad.rj@bp.renesas.com/
>
> Cheers,
> Prabhakar
>
> Lad Prabhakar (12):
>   dt-bindings: rtc: renesas,rzn1-rtc: Add RZ/T2H and RZ/N2H support
>   rtc: rzn1: Handle EPROBE_DEFER for optional pps interrupt
>   rtc: rzn1: fix weekday underflow when alarm crosses month boundary
>   rtc: rzn1: Fix malformed MODULE_AUTHOR string
>   rtc: Kconfig: Broaden RTC_DRV_RZN1 dependency to ARCH_RENESAS
>   rtc: rzn1: Fix alarm range check truncation on 32-bit systems
>   rtc: rzn1: Replace remove callback with devm_add_action_or_reset()
>   rtc: rzn1: Dynamically calculate synchronization delay based on clock
>     rate
>   rtc: rzn1: Use temporary variable for struct device
>   rtc: rzn1: Consistently use dev_err_probe()
>   rtc: rzn1: use FIELD_PREP/FIELD_GET and GENMASK for register access
>   rtc: rzn1: Add support for Renesas RZ/T2H and RZ/N2H SoCs
>
Gentle ping.

Cheers,
Prabhakar

>  .../bindings/rtc/renesas,rzn1-rtc.yaml        |  35 +++-
>  drivers/rtc/Kconfig                           |   5 +-
>  drivers/rtc/rtc-rzn1.c                        | 159 ++++++++++--------
>  3 files changed, 116 insertions(+), 83 deletions(-)
>
> --
> 2.54.0
>
