Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172454;
	b=sm2s0h/zBsreY+9HzHEhS+txGxGTq3U2driEHZhJgHoyJ4ua6nOT9JkuCmM1zMg5EqRp
	 QDm7L/iY5LFd9oRx2F0YfANaYeyTk0RkW6k/cNIe4e31pN0sBCq5PLE0o5tTWMEEF5IsN
	 Q0LTU0GmAfBi8pkEiG9TglyXc/Vju1E0Haa/vXZpSYSjTK2MW5jSeWw8qD9DQnFz0VUPS
	 6q2kKuM6xK7Ov7SpPYvKB7JYzUbTa6LF44JVL2xzDUTcpnnzLyrHSCLm7MHbhAc4TZ2Qb
	 EhD/h1BnT3HUISillNk4dKFKGCOxDOz7TxnlT3brl6OtRCjnNoRPTIBrEN7Xbnpr90g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172454;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=XC0FYvI7J7PY7eGnEaiuIuCRfsjCJPAQuXRpzV9YviU=;
	b=VfwOgX/+YKxadPYdaFYkuPwiMk/xsY1gmWFf7REcMoO6Zu9kwaP1xDJWNdr23XNgiwC1
	 F5cZSq/Lu4qsb7USvppA4cdaoYn7ZVbn83KurDtnRGfEaS3Xce7X6s8oEMQT2JrG08unw
	 CjCLHNrl82HmH5AYahU8ZT6UaGzHRx4ahWKLcPZmP2xUcAcqn+Fhm1M1B3nBaz94gnriW
	 LMRdBOMBQceIPx480cSc+2yiClr9XnpOuKu7tQSszib9aEqTx0tgaipJtfuYJy2IyhZOH
	 n2MkVIfE63rGAr8nPDkN6mBhn/Z2dUEmPauEm8f4BJ+ZDZKFjBk1RxOiWoNmydZJXAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070C9606A325
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 070C9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5eae1276409so250220e0c.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:00:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172453; x=1795777253;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XC0FYvI7J7PY7eGnEaiuIuCRfsjCJPAQuXRpzV9YviU=;
        b=rHKJAlKsptfuFwjhI4nDRjKi6TRu3OTM7MJb7nxfosPhqbsLa1WLoWA+N6UebvXHa/
         ZpVc5TkUxTUcRLoZFB7nVKBLg0dFA4qCX4EJNkuej0id+KLC1KQyOfdm9WmUm7en+wPT
         jdbNgnaid2u2zhot02ReQUwinIYyceSBG1SaoCW1XHo6M9SM9KMgYAYThjrYpC8+vIY+
         DNH64wah0a/43DKRE+aVRxvbWXcRAfULcJJ1EUdk4d+3+FNf81yZGDkrsAnMHWPU881w
         dhYoPslxLfFZ83h8reiTsswZKjqYL1PHlpxYe9NeIQvhLv2aRoJMz4VfO8B7C28UIZw0
         uUag==
X-Forwarded-Encrypted: i=1; AL+hErFTrIfRwHnn92SCi0O3uKE9vd2SIqZ0PeBd4FPE6Zk/YStnnkzjPCfo1oqAtDysQ9Ng7PeZi7L8Zi/g@vger.kernel.org
X-Gm-Message-State: APuU4Z/M+ewtPh5F7o87y7woKGhdMj+1xytgn8CKeTgeM5rjxdKPAg1G
	hMeV92ff3HHIi3SawnNiLpALGtKEjbPvkhKfANI81QzWELApD6YAUGI1P76V5ZRt
X-Gm-Gg: AZFdTZf/dhEOJ5NRMrKtqFFa0krfO0szeYRmPoU68nKBc3rrND2rTEuCp8drUKaZB13
	tYtABu/plF/P/61UCXoF495OcdK0pcoiJRDvU6Gsz3AGMMFicbAchHP6P6YtkieRm2pDEWrJFZi
	JInA3ZotrzWdzDwU0Fpki1PksaiTIhx3/Rx8BxrkXALoUaFdoa4nYvLIfyj9e/GTqW833fBlZpC
	gGVee+BMucmqPHt/c988cK+tDe6d8oPqtL7ovCb1AwcSxI6Jz/6GiidresOPinjSUGNkPKd+aQx
	DrOS9/JhYJXJM7VjUH9w5EEHNV1//ThqsKE+h5siL3kEJtwavxhq+zs3LSDPuXzLNFLDpSajp9h
	3d/wrNWsjI7DB2JuViWQmzOEZZpAqLi/tw3wEYYcPqc2CZmziO/pNWg28L3dVIa9VFNBz5/SNwY
	Z8vc4CDP8gAUmB0xj1c+x5sKhGSYmsM16gRVsmYKjLOETTOgewFRORQuE5GxC+RhscJ2muj+a3Y
	Nl5h6a6CnGjkYR99p/8RvEjW9t7yFEc+ifpin5e3ITsrcziVSzfmQkH72eKJjOIOGf0doQ4rchh
	vGQnc54iA0jI8yS2sUwjYsT2vjuvxBlY9FU632SKkBc4xO1EudKKsA4pxY7IsggJKDhpKv3tdQx
	VVK4VH9CNFn0U
X-Received: by 2002:a05:6122:62b1:b0:5ea:b04a:cefd with SMTP id 71dfb90a1353d-5ee8aea71dcmr1212153e0c.7.1795172452957;
        Fri, 20 Nov 2026 03:00:52 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b609bc7sm2248810e0c.12.2026.11.20.03.00.52
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 03:00:52 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-99e1b352df9so232141241.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:00:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHBm6qhjAZVBEDKEECr913rRxTfGmq6jqvycaDW+dGkom+7hZEkm3IVVkOeG63vdImgctlJvkgAzomN@vger.kernel.org
X-Received: by 2002:a05:6102:6055:b0:7cc:95ed:3147 with SMTP id
 ada2fe7eead31-7d739689235mr857768137.34.1795172452194; Fri, 20 Nov 2026
 03:00:52 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-canfd_rzg3l-v2-0-89e06c46f40b@bp.renesas.com> <20261116-canfd_rzg3l-v2-2-89e06c46f40b@bp.renesas.com>
In-Reply-To: <20261116-canfd_rzg3l-v2-2-89e06c46f40b@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 12:00:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVe5agtLEH=EhD1Jfok8h19Or42u0GAkbxoK1juaJj2Xw@mail.gmail.com>
X-Gm-Features: Aa3M54rO1S0UF9YXcKOSJOhVHRxGaMtumaKHweYg3txlmV2R4gs_ta_WfKp8DhI
Message-ID: <CAMuHMdVe5agtLEH=EhD1Jfok8h19Or42u0GAkbxoK1juaJj2Xw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: r9a08g046l48-smarc: Enable CANFD
To: Biju Das <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 at 16:33, Biju Das <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Enable CANFD channel0 and channel1 on the SMARC carrier board.
>
> Channel0 is always enabled, while channel1 is guarded by SW_DPI_EN
> since it shares pins with the DPI interface. The CAN transceiver's
> standby GPIOs are conditionally wired up based on the carrier-board
> switch settings (SW_GPIO8_CAN0_STB, SW_GPIO9_CAN1_STB).
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Reverted the order of the SW_DPI_EN and SW_SD2_EN, to match the
>    signal flow order.
>  * Added missing check for !SW_DPI_EN in standby-gpios.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
