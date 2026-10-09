Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B9C3EDAD5
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 06:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791525954; cv=none; b=Ai4yvg6ZrmiZrpFsOhefr1B+vMEiOgIoVjU6xdrjdeHrpBTPwF82NPaQ0aTSUhUV8i1IaF+B3Unfi2mNXLbebhWeepzYePkLrwZfjvcb+eO0TpccjJwX03yiUQc0aVHO7gX+N3QHEnCfZZqQSEWCuh1fALJbjBIJwo+0QPY2fCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791525954; c=relaxed/simple;
	bh=is4gJLoi2ipJmooXAfray6TyXKGcAgJe47D+iW9qPlA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I1DWzHZ0s4azm8cMXSyRUnAJ4lCDzSzr7YFwLIdVCdmwOqKs+jUvjRdb0xUgkR+WXYuN4hv60HHoNlD3/IddJ+th0mNiw5RRjaXSfTOa7pGqvKE7UnvjwS35E+ldHvw+5cTb+NsST7i6cNUBotd0SWWbvbsJEt93Oj6DpItFcsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5339173489eso44323551cf.3
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 23:05:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791525952; x=1792130752;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tWTuV8nTat+7Ise5DAVZrckoXbB3rEEMphlZwWdvIzs=;
        b=wTTBo2VMj/7ZPjxy+7AOWJVtFT0VCB4GpOA3t4Zdv3vCAib4kaZrx8uZBU51HZXtNF
         lqsUubm9A6J4ELtEzcD/GSFIgfErzxOZdoM/WlWSn//v4sqRDDhCnxSJF2mC9WG4jzru
         6iQHKCyecLu0XI0VORj2FDEJ2TOg02SBhcpNIgfs26UnfUtNH6vF5dWrp8KMc9B20cnu
         WNTAHbYu7EZaBsPa4EFUbb7PhHnSr6X7pLbVlcDGpwwa41gozYdKpk9pSeleJRFyC3kd
         o9rPuk7xEMYIfSp6fyusZ8OxIrRSgxxGacRR+T0x/EgWw07mW4t4YEiG5WSQvqWn6wV6
         d8fg==
X-Forwarded-Encrypted: i=1; AKwUvBx1BseBMaRbtgRFIg2JnAzCstEXKH8SmixvSKKTjv1nMXGOServGNu14lXLH4NnkKYTYaly4ZgZF76z@vger.kernel.org
X-Gm-Message-State: AFuF++nCrTr/r2JnXF60CeCDSR//E9TdgrznS1gC0w5ShmsJPh01CrwM
	fLBeJ+iRT7oVPkL0FyFPzjRWaMx3V1fz9bVNGaTz7o8M18edTD9gfLbjdNjYejpHEs0=
X-Gm-Gg: AYBFou35Qv1g8HI4MBlz4/kwhIr9xeI3M0OULjYE2Gq57P/yfp//TMe72M1vvlZvMKw
	v+gjeCA2eP9SAHAfcjuTwIa2MGFV95HAk7hJfioh6ToV9eNP3aEt1jEoPj/3JpKt+SrVcuuDNCD
	U8k/7ODFsrmJjJUqW5OUXBmooWn5nnhWXAtjBT8dYGD5nqmoTf3TVZ2S+gHyJCuJpjlEuGsw+DA
	93uDs4j0MqoLAIbFCJqSHWXfpMH1aphrTCiCCKdmt4MejqoX9OjggbwU7PDgiqzApf8nIxZ3rcj
	UEjMUKdPiO/ABaGTvpIrutfWG0fJGaIg+dagzPlPCH0NwxtRk3Y8ewQNNh1C1hGMMFhHs9Ax2nT
	ME9ob0SgrSPlp5HVXqqk1cVsL8bbY2TV3VunUVi36T3eF6h678V7cvQJOFz3aDz4iFEKePuWYC/
	FXOBXRjc2t1OD1OtqSM+O9De3PTjAb4jj7URCHZiP/dsNowqaB3T+cxwpx8bm0eo37pLT2Yjlg8
	hP6+pOK6aGnfpZU3aV99XmQuP/xHRJnYhPzfOhW6K7CoKw8Jp2MygYCM3rb+BCiS8ZPgMBiljSF
	Jg==
X-Received: by 2002:a05:622a:2483:b0:51c:1590:8e13 with SMTP id d75a77b69052e-5359f4892a6mr15467181cf.4.1791525952277;
        Thu, 08 Oct 2026 23:05:52 -0700 (PDT)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com. [209.85.160.176])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b6fbdcasm11270641cf.5.2026.10.08.23.05.51
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 23:05:52 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-53506b44151so56381281cf.0
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 23:05:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwavV61gXTorF/utelJkkGPnRA9QbykeN03NHvV5mAKhG4STo8uUTCHhw9Pjt1v3wPs5G+Ce7rDytyR@vger.kernel.org
X-Received: by 2002:a05:690c:ec4:b0:8ae:8d28:77ca with SMTP id
 00721157ae682-8b07edfbad7mr3120487b3.33.1791525600619; Thu, 08 Oct 2026
 23:00:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007082627.63807-1-tanure@linux.com> <d23dfdf3-5837-459f-afd6-6c198a05c13c@lunn.ch>
In-Reply-To: <d23dfdf3-5837-459f-afd6-6c198a05c13c@lunn.ch>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Fri, 9 Oct 2026 06:59:49 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+2au4x99kj=UBqn4joQCM3-D2kbaJ0zro9Y4RXka7ePvQ@mail.gmail.com>
X-Gm-Features: AclHuK8Z8XHB904erYGkjWemp1Y2Gn2Ya3i9_K0CjW0XJN3l42AYcMZ32Srg4dI
Message-ID: <CAJX_Q+2au4x99kj=UBqn4joQCM3-D2kbaJ0zro9Y4RXka7ePvQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/7] Add ethernet support for the Amlogic T7
To: Andrew Lunn <andrew@lunn.ch>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 2:01=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, Oct 07, 2026 at 09:26:20AM +0100, Lucas Tanure wrote:
> > The T7 pairs a Synopsys gigabit MAC with the same glue registers the
> > G12A has, but nothing described it. This adds the binding, the driver
> > support and the device tree nodes, and enables the port on the Khadas
> > VIM4.
> >
> > Unlike the G12A, the controller reaches DRAM through a pipeline stage
> > with a gate of its own, sys_ampipe_eth. Nothing else claims it, so
> > clk_disable_unused switches it off and transfers stop.
> >
> > v2 changes the RGMII delays, after review. phy-mode describes the
> > board, not which chip adds the delay, so this board is rgmii-id.
> > dwmac-meson8b did the opposite, and ignored the *-internal-delay-ps
> > properties. Patch 1 fixes that. The VIM4 needs it because the RTL8211F
> > transmit delay does not work here.
>
> What is special about the RTL8211F?
Maybe nothing, it may be this board. I cannot tell from here.

The RTL8211F does add the delays, the driver sets both bits and the
chip takes them. But when the RTL8211F adds the transmit delay, this
board gets no working link.

I measured the receive side by sweeping the MAC delay against the CRC
counter, with the PHY delay off and then on. The window moves by
about 2200ps, so the PHY receive delay is right.

Transmit is the problem. With the PHY doing TX the peer sees nothing
we send. With the MAC doing TX it runs at 935Mbit/s both ways with no
errors.

I asked Khadas about the board, no answer yet.
>
>      Andrew
