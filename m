Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798846;
	b=pku3V+K7sSuCOrdjBYe672bBuJb5RV3RnOVr8VVn5q/p9t7Tq9cPmyuzFTysc9jlEm/F
	 WC16kubnVzJhilDtQ6EadDelUa+dYlSub5MTsTAOCtnZM4NapJ25SMFrejumDZmAvUz5z
	 F7kftv1JcFHIB5etlOJ4/qgXBBw1gBlVTntb6PYZQ8MOzTYicpC6henQg6y4PCvefUFyR
	 AUCErhBdfQvJuzbqp/GzLICF8FG80chq8aKWs/oXIHUboe/J3aR57H+hdWFRUSLU8MuqB
	 p+R4pw/a4skql8XiLhIHHTccS/Y+6JHlUFoPfs5zZTkVuTxt25L1e26s9YOrXx6byTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798846;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=U1yLLCVNt57u5GF+uQ4RZt1RrCY+NCxvna0eB8L6VaY=;
	b=mER9s6dsHQPBKvzObo2hF/XNrwPr6R8gh0jCwTxG3A4Exzu9cMPih3sb+u+rjsjJ0Dp7
	 WG1GPQFaY/xF4GRzP39k7PzwaemNjt3dxUUQmTofoMpZa/PHgeHKqmiNQUrgCjX8VY5hK
	 tEm2hjBZBHy0YQ97r68wjjGeGQpVjix3RswQqjbipQMh8/ELq009DZz9Zs+HN1SJOVWFP
	 zs5mzTHj1+pUcW6+i3UsrYFSogctE3C+QSE30F4sTGdNLq2zR20CHsnAFP1YkRh1AaCL5
	 wEqghUFHxcQOUTzaHBkmuHaCYe9O+XLFEDxhp+l9BxreW2bhLwbQJ4meJI5FuL/Z3ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	arc=none smtp.remote-ip=79.135.106.28
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184E9606A31F
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 17:00:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 184E9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795798823; x=1796058023;
	bh=U1yLLCVNt57u5GF+uQ4RZt1RrCY+NCxvna0eB8L6VaY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VYTx6d9ZdxGH5l81XvuuWIPnYHtdFZItIsvM6pQWRUqF3Iqn2pTfo7abM7gjUKzh2
	 Irp6q3gykmkf+v6rBYbl25atF1ZxmiCHkOnTNvCbVu1QuG4F/a0+6QmtaKygRbK4wd
	 N67LVxwJPkt64LR4XoRrjya++TNX+BjrCjftMEuy5qv0i9PX+nmuRY11sF4AAB0ZsU
	 oXZITO8llruZdsdF2Rd522JCHjXLL77ne2Sg2VpJlyLwDdaEkbEYF0iY6JU5+8BzXo
	 6W2/C8dzKBwVHW8bPud1NaAp2IyDyGzriunuLvzGOKZ5OOt/oweW4Eo8x5sXMnxPy5
	 7m6Ll2rpGWWJQ==
Date: Fri, 27 Nov 2026 17:00:13 +0000
To: Andre Przywara <andre.przywara@arm.com>
From: Norman Herms <dockseed@proton.me>
Cc: Enzo Adriano <enzo.adriano.code@gmail.com>, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>, Jerome Brunet <jbrunet@baylibre.com>, Pablo Mazzini <pmazzini@gmail.com>, Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>, Alexander Sverdlin <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>, Lukas Schmid <lukas.schmid@netcube.li>, Cristian Filipescu <filipescu.cristian@gmail.com>
Subject: Re: [PATCH v6 3/5] arm64: dts: allwinner: add Radxa Cubie A7S board
Message-ID: <AzjLG4iAqXVYU5xs3jzLGCHNElMjyalfu_xCbgGLeyvgkAXIXMDFHCm4LUyEe1sq6C4gcLhjyje0myr_eNKHhYEmWpoAVHJF0YHgGW7cDVA=@proton.me>
In-Reply-To: <fcdd57ea-8f03-45ce-886e-f0efb6f23d3a@arm.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com> <20261126-a733-cubie-a7s-dt-v6-3@gmail.com> <0a7f4a31-81ac-44ee-8cd2-7b5526af7442@arm.com> <IUp5Ow8SUNdgtour7we7BN_rry0fuoBNw-ucfXERukfbwTWvoWo5QjYLXAzxftTjGnsuhCCnwvxZ5fBpL6pFPL62oTr2hZddgE6XmrQ76o0=@proton.me> <fcdd57ea-8f03-45ce-886e-f0efb6f23d3a@arm.com>
Feedback-ID: 144388465:user:proton
X-Pm-Message-ID: e1853d72c46332b596795337445d7c8e003b41de
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Andre,

> Regardless I wouldn't want to leave it completely unbound, but instead
> provide some limits. I guess for VDD2L, potentially the same as VDD2H,
> it should be 0.87V - 1.12V, which seem to be limits Google turns up for
> those LPDDR5 specified values.

That covers what we have read on the A7S: ELDO1 (VDD2L) at 1.075 V
with our chain and at 1.1 V with Radxa's own boot0 (V0.6034, and the
same on Radxa's Debian image).

In June we also stepped ELDO1 on an A7S in 25 mV steps, with memtester
at each step: no errors from 575 mV up to 1.2 V, where we stopped on
purpose, and a crash at 550 mV. That was after the training at
1.075 V, so it says nothing about training at other voltages, but
0.87 V - 1.12 V sits well inside it.

Radxa's boot0 also sets DCDC7 (VDD2H) to 1.12 V, above the 1.1 V
maximum that v6 gives vcc-dram. On a board booted with Radxa's loader,
the regulator core would bring VDD2H down to 1.1 V at probe, i.e.
after the training. We have seen exactly that on ELDO1 with an early
test DT of ours that gave it a fixed 0.95 V, on a board with Radxa's
boot0:

  [    1.792706] vcc09-vdd2l: Bringing 1100000uV into 950000-950000uV

with the DRAM already trained and in use. With our chain DCDC7 is at
1.08 V. So 1.12 V as the maximum for both rails would also cover the
vendor chain.

Built and measured by AI agents (Claude) on my boards.

Thanks,
Norman
