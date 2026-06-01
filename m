Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBB43264D2
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 08:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780302629; cv=pass; b=t9vRpqSigChcWTVhAuZIT+9t+4NlvCflUol3E8ZMKErzKw/qmEFiYK91a9mKHWWcq0tPBeRIOncMNml4gS8nOf7BGyH2iaJy5Ig2g3k4Dzxt7Nu6NwZlC5599A5JzUMyEYGApidbAimABinlLMVRX49Ub+OkvH8amCs42FR45bg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780302629; c=relaxed/simple;
	bh=+cqA8/wuSyGM9iiBE4h0VHHPaUQIsjhmoiPddJyqEkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WRlmsuvD1FtkiowKb8KOUOVbJ3dsytI8oY1G2wX449kiYXfEIoWjmGKjGv+PK6NnAzySNOy+ibm1DVc469Q+LulbloLeqnSD5TmBMzSZGBwH3odIGXZlMTby65IFQPw9+37Sg/aW2p9uUjpbfi5lEFQ2F6inCdClk0SoWUlhuj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sro2ciyp; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sro2ciyp"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-516e1525aa3so99419911cf.3
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 01:30:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780302625; cv=none;
        d=google.com; s=arc-20240605;
        b=Y6ywmqbiCFTbwhWISx8SjE+1G7HX7li1ELmbQZQZRZVXaAey1yMNazRY42bMyxVkIT
         rfAgsZTCHiI/ghWo715Ir4AoYpbT8Fi8kR5YhRTERfEro3FhRqifxQ3OwcTXIHy1zlnQ
         nPnBbMOhojalSNVuNm2rT8ftf5d4j7pXaN1MY+e6dLiMMY32FW4RvqGQr6uC5fCe13au
         XJSC51VAeiWUTqSWIfSb0e4Zc7Z3NIZXL1qV6r6Cyqqy7bB55nXjVe491zVxgxebb15g
         TrJGp6UXAPUv0oKGY+WSNFnrWp3L3NoEw3x+1ISu3dCvCzaUWu/mWx/7QZopMSSh7IZD
         QIbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+cqA8/wuSyGM9iiBE4h0VHHPaUQIsjhmoiPddJyqEkU=;
        fh=0PdNcMffXCycp0hH3uSeMBS4BGO4rIH3oZFHSXssPvQ=;
        b=cdB1BGKdH86MCbOwt1ofybPg46ai2QaXETx6Q1XNDTsAgb4rfZdiqU4yU9HP0FCFv0
         WXphuf6ZXYg07bwX+YX+hbnGAf8TUP3LZy2a4zZOQTVUk4UcWMonJpdhW22KhLsstJoA
         R0PpI+CWmHN0A6NvIzptOVnfk3upnvF3954CQelNUhwimDqROsj5o7HTZKwOCk2e5J0V
         zJN+FUriwLCvoqLXEkzVrz1IwAfy4C5aHFKAvrB4qgvnobzdGCd9cutA6yGDydaKsClB
         fThgeuA/gktNXVKR8d0TwU4wO1avu4GVdi3y+EV7WAd1mB6L9GpVYVw+aJUHT8rFWTio
         /odg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780302625; x=1780907425; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+cqA8/wuSyGM9iiBE4h0VHHPaUQIsjhmoiPddJyqEkU=;
        b=Sro2ciyp3oXY60a+N26HQkBjl45fU6DbjYc+oWk9W+tW8r6acJ7AeDgICC5SWnPebV
         uQkVn6hyID9g2fskwtVveznfvMb3yLdm8EMHTjq4AEJgoWpJDqxVXtMciqprrF+/aKvB
         NAmCUfWlGvGYMd1qmcX6rHnJrnjUx4OxEzm2S99UsuZm10aMpYI+p1Hk1FZjW+qoQUIx
         179tNJGHPgxdEHGiOzVqUew6DuY5RuKLBpqq+DU7NW5Rz+u+rBbcICnoeuPtMy2VKr4j
         uNx+DfQA42sXdbfYGbCTOpNKpKGZUj81xloismkq7R60Bvn7Y+zL/AHHxjBa9reXZ1Mu
         vkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780302625; x=1780907425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+cqA8/wuSyGM9iiBE4h0VHHPaUQIsjhmoiPddJyqEkU=;
        b=jw287VHWvpdT6wELmSUXy8RmUkGbTNwAPWaSGeLBQRHZS2TAJBq3Q6UZhhhBsnySXg
         XybRQs16WupxIKHBkCRbXVuSDZtVyJoxVOYcoFWGbGvBNRDPL2eRpin3agEHufA8EKm9
         bTktwnw/kh7cCT7O9Juky2IhoUAGOIebIbCxmUONmMyreZzMQDcSt5hFweVtv8H4CB6w
         88wKZkwXfOH/7w9Wo0HegRp8yDWU/rvFLAAk+ETdjOSblwDVjeFYoLMAZDpN1urCBoUU
         KNefcFYqbm+0c7VKGt4eTr4g06EedPpvW+59m0lQfhhaT31eh7TGAiGC0v4nNbfP/f1p
         pJ2g==
X-Forwarded-Encrypted: i=1; AFNElJ9ICDXWmWnfF+tPOQyMnxjAeLwPMXVrOdStAD7bSJFhkzJyVOZJduWZss0C8J7U9V010RX4e/Ev1t/c@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmac84PlZqfILcQBEINwJJe6qLd09TiIUmbSwenzxWCjFkQOuA
	bQcQq1nFzaDDEYF6wzi5tzH4xK1dzaIpO/TwXj9AuPUtXfgZm6HsmmjVF5Q1R70uQvLbC8q5+xQ
	FVGfDY70GRP8OVZYdHqW+KKhntiBcgwc=
X-Gm-Gg: Acq92OFfqv2LALeg+szE7aCXAS8xRPSEGfMWtYw54d2TdEwXWox8zDJifRC9BFvrPNN
	tip9oumbTVdWmiBH/+c3gjd2AHGtvmFAfiUMTW/A9EOhjF/E4iElpDNkBVkxVaiV0os6HNanPWi
	MbcSIJe0nHh5Lrd0k6quft7J7JVsoXMxrwRqauyb2wKQWuFQEeidMh1mo8mQHIQsrWhOFAI+CPc
	DhU3RUabxrT2IdoCeEfAlxmPfa5SPxR2dD5EeLthywmL0V9+AJE/c08oWz47Z6jJeRmGG+LjbZP
	w2hUIe1ilLKpccK0McVi/Kw5BFq0fMYHuOSrgzW5NMkaFhMVjq3wXYHxRg9m5w==
X-Received: by 2002:a05:622a:1441:b0:517:573a:8a66 with SMTP id
 d75a77b69052e-517573a8c6dmr29832011cf.27.1780302625083; Mon, 01 Jun 2026
 01:30:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260531171041.4149-1-challauday369@gmail.com>
In-Reply-To: <20260531171041.4149-1-challauday369@gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 1 Jun 2026 12:30:17 +0400
X-Gm-Features: AVHnY4Lwngtf-XUeNp5Z4FrKFr3R3FlI_39W44ACGsq6O9x-X34aLbBKMT_wRdE
Message-ID: <CABjd4YzJoHrx1suMbhNvrMP+X=d=thvXYwSY=UD-4Qy=7-qmjw@mail.gmail.com>
Subject: Re: [PATCH v5] dt-bindings: clock: via,vt8500: Convert to DT Schema
To: Udaya Kiran Challa <challauday369@gmail.com>
Cc: krzk@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	skhan@linuxfoundation.org, me@brighamcampbell.com, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 31, 2026 at 9:11=E2=80=AFPM Udaya Kiran Challa
<challauday369@gmail.com> wrote:
>
> Convert the VIA/Wondermedia VT8500 and Wondermedia WM8xxx series SoCs clo=
ck
> controller binding from the legacy text format to DT schema.
>
> Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
> ---

Hi,

I'm not sure that this separation of the clock controller binding vs.
PMC is the right way to go (yes, I know it's been that way in the .txt
document, but still).

The clock controller is not a standalone device on these SoCs - it's
one of the functions of the PMC (weirdly enough), with its MMIO space
interweaved between clock statuses and enable controls,
reset/hibernation control, system timer and watchdog, then again clock
control. You can't run the clock controller separately from the
resources provided in its parent PMC node, because all those *reg
nodes are just offsets into the PMC controller's MMIO space. So the
way it's done currently doesn't look like idiomatic DT to me.

If I were to implement support for all that beauty today, I would have
made a top-level MFD node owning the whole MMIO range of the PMC, put
clock IDs into a dt-bindings header file and just implement all clock
operations in code without putting those offsets and bits into the
device tree. They are not configurable, they are not board specific,
they just constitute the interface of a particular SoC revision which
follows directly from a SoC versioned PMC compatible string.

The only thing that would have showed up in the DT then would have
been the PMC node with a register range and a bunch of named
interrupts (not for clocks, but for other functions), a
clock-controller attribute and a single clock cell to pass arbitrarily
assigned clock IDs from a new per-SoC dt-bindings header.

I'm pretty sure there are no users of these DTs outside of mainline
Linux, because vendor kernels used board files, and no DT-enabled
firmware has ever been created, thus the only way to boot these boards
with a device tree has only ever been via an appended-DTB uImage (i.e.
the DTB always comes from the currently used Linux kernel source).
From this perspective I believe redoing the DT in a more
hardware-aligned fashion (and breaking DT ABI) could be better than
making the current suboptimal approach more "official" by encoding it
in DT schema. Krzysztof will likely disagree though :)

Best regards,
Alexey
