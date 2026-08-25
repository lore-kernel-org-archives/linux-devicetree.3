Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38163288C2D
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 16:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787674542; cv=pass; b=Gi6dUjGdUyrviSJ1yP26kEAUANtkFstNmxiS+jSpqT+yT8WFKcIE402JVL8Fm6amGCf9qQFf90TZH2pLMMLE3bXp+LQ000a6GHeqnQ6N70s+Xvnih+Ggf4gfjOXNShAEStVkx5FDH0oV+gakzK0zmky5Xk42u9kY9lsmz6wka7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787674542; c=relaxed/simple;
	bh=mhCYfoLImXJnmt0+tRDHMMQyd9cURICYnhCWLjk2PLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xt4fCp5Q6XB1qui/EnIAuRWqzHiIakNvV1/0K9S99KyIEgsnKP583ZIu+wCA9ztLAgzGUNECifhsqbpJWi+dN01dRqaDo/kEpychE/T3p+D6ecFERa54fj61raB3nIH6MTNw1FMJVSFZHtRFJWAgQr5YHLgZORZsQgjYU+vCzz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LYDe5Sfc; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LYDe5Sfc"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c15d111ca99so602045666b.0
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 09:15:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787674539; cv=none;
        d=google.com; s=arc-20260327;
        b=rONyYQRybSK7knJKcaYXwKs1SFHtiYSeFS6m2roB3J+2O6c0x1nompfYuPDD8PLUEX
         zoQMsjNrPyO02in+b+lBMc/llQZ9QphO8Lji3u47O5N43oKmi6HwwTSt87TQsozc+jq2
         K3BjJM/hXiiYJe3lRKEc60LQTuFeqALZl6z7yg5ukGsTpJkYKWA5Vyy64NM/SgtuH+6N
         WaVChma+5xc1P0O2+EFoKFgmmC6/QFOIyOhf0oeDOUZkCObrUW0YfOPCtG4GnnKpDElD
         4rYPlNEQHV0l9lJT3q40ClHuigS46c4fxC4pP6U+ZVyL2I0yri0onYB2uMUpOpx2GwAI
         YnRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mhCYfoLImXJnmt0+tRDHMMQyd9cURICYnhCWLjk2PLg=;
        fh=35PTNJsBP6vZpye9h7tBXCiNl1DSzlkOZ3NOdZna0Zc=;
        b=ncQLrMDTuAnSZghMkmDadZMqOuK9Nxk0DjgDG/OmexPIiL8sXWmMC4+J9lfaWn7KaK
         qHiHCty+KEkhR1be3aXglt22tx1afnbi3RiM/GtC/cAoWzt4ZG48UExca0b1VJLVjgEQ
         q1EXjibheVa9TNPSWHJjOHLmECAAxqz9+d6v3lAq3oKex9kNt3T6cJMXFocnpOlt86lc
         AR/HCG9n81P6I49tYgE/Uo/f3sRlGmt0fiPFkr12hMzgT/EjkS2lX3PaGXtN/WaA9GZL
         6olrct8gRBCHIEwXGXWa5K2Tp+3dHHSnCc/RitsERXWVjiLotRDhBNTSeUBlNO1hLxb6
         5vvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787674539; x=1788279339; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mhCYfoLImXJnmt0+tRDHMMQyd9cURICYnhCWLjk2PLg=;
        b=LYDe5Sfcrj44bmekSy+MJs3ZkuY/uJ1DYBOUqIO7oKKeFFlRkyOzCo+j1xKwS1tX0D
         iVaKnNSa+lWdNyKsGbmdKjYzbwXhxuPnP+fydX5cKuNdCf0jwSeKEqaED4Qgt+fwkeff
         3cvBlDUf2LyRzPconw09fVFK64j54dTw6z/ISV0iHTMBPycDl3QRES2aanzQAI/uY+kH
         rrVXRH0ySYaQmWYFgorcMizjdC5rUFepdPAtMl6BY2VNYi1kP3yoIRGx3d8spbG31UC9
         xNLWsHGzTqOtFo0vgSgQyiJIkCEEmG+h6d4RY3/UztfU2tEzi2AXtvlMPHlfjnbcMYLX
         hTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787674539; x=1788279339;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mhCYfoLImXJnmt0+tRDHMMQyd9cURICYnhCWLjk2PLg=;
        b=slR6reYH/7uJVrNsCgTksebJ2ZkaTUndW/ni3CsHyI8Vmcb5F4wnaCmUx6jWYq2/hE
         XcSmVyfOhCwQrfmAoqT74/U7D4BkD4os0MivdbGaWAeCUgGbzew4ivEl+BpT62C936Es
         eyp6SBbdx3ZXxjOkCSYhqMvAZsZZj1FhWtzJsRc7/wuEKfZmHWyZxf34CMJLzLU8twJg
         K/HEv0hYfExWV5qVEi7rEHIUrHHsVpKUzCAOxKER0j63SS2l+GuO8pSlOKQVd8Mg0xkA
         cl6HlwXdqGLh2WJDpP0HMUQ3O/SwKB90veGHylRqSYZA+EKexHixQNgRPkSysiWYnk0F
         +YvQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpfuxj+ROtr7vGJJ1F/GUYVTHHcd5fkTg52ZGqvcBllK7aDD6sR5vjiWSeFSv0YlcqAHZbsjpJrdb0m@vger.kernel.org
X-Gm-Message-State: AFuF++lY1VQ9j85Qy7wPLrNofj4eO99ppO6TclPsgzxI5od8wUGzZvSs
	i94FMT/ao80oVPSPHCQLgrdlGcSJ3RaKMaQkTzg0+aIEJ3cEPuhnNNwBdF2t4NONBuXeuN8RgL6
	zMGvAbkpos31fAdPva6RPjG4XEdu9Jg==
X-Gm-Gg: AR+sD12ucBwFs5TfKzYuYmscodU4GRCPoKhsi/cH5aO4ckpQo6quNNPtynnTDMC7syY
	gT1vofl4E5OBP4047jHs7EvSDHWQro8muTsykhnSQqEyk/r1D6DOZmbCUxfE9363iBFFiU0KC6t
	+7XH8FE4S9i+IZ/xsRSq95Bess78tspYwIqVL4fVPPRvrimZzICKHgfqD3MagaR1WexwF6yJoVz
	llv07juxLBCefvNRVlgUqrxYd4xjD8wE9E4WvlrSqXu6wExrMo8UTMHviN4KgyltslipTkY4GNf
	fAat0M8pyVMv0TCsegqxp7/H+CE3v7bHQIH9iRmJm9Q=
X-Received: by 2002:a17:906:6312:b0:c24:6445:d19 with SMTP id
 a640c23a62f3a-c24926f3cf9mr3439116466b.17.1787674539339; Tue, 25 Aug 2026
 09:15:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825-blackrock-audio-v2-0-659cc4724d57@oldschoolsolutions.biz>
 <20260825-blackrock-audio-v2-1-659cc4724d57@oldschoolsolutions.biz>
In-Reply-To: <20260825-blackrock-audio-v2-1-659cc4724d57@oldschoolsolutions.biz>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Tue, 25 Aug 2026 18:15:03 +0200
X-Gm-Features: AcwNN1Xh1B5d1Dzdu5ByG6tQN_JbDhHIx5uu93y7vcm7QY05B1IJMZkB-j3ldSU
Message-ID: <CA+kEDGFwSyebOLJEsg4fyQ2MjVuyPzJxq8j1acbmGeiOWw0RJw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sc8280xp-microsoft-blackrock:
 Replace old sound nodes, enable DisplayPort audio
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 25 ao=C3=BBt 2026 =C3=A0 16:07, Jens Glathe via B4 Relay
<devnull+jens.glathe.oldschoolsolutions.biz@kernel.org> a =C3=A9crit :
>
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>
> The Windows Dev Kit 2023 has no built-in speakers, microphones or
> headphone jack. Likewise the device with the same mainboard, Surface
> Pro 9 5G [1].

Potential nitpick, I don't know : the Surface Pro 9 5G has built-in
speakers and microphones but no headphone jack, so I find the
"Likewise ..." sentence confusing or misleading somehow.

This has no impact on the actual code changes though.

> The previous WCD938x / WSA / VA sound card definition
> was therefore non-functional.
>
> Replace the unused codec nodes, SoundWire controllers, LPASS macros
> and related pinctrl with DisplayPort DAI links (DP0/DP1/DP2) so that
> audio is available over the DP connectors. Add the required
> sound-name-prefix properties and update the card model name to the
> conventional SC8280XP-MICROSOFT-BLACKROCK form.
>
> [1]: https://support.microsoft.com/en-us/surface/models/surface-pro-9-fea=
tures-and-specs
>
> Fixes: 16a7fed11714 ("arm64: dts: qcom: sc8280xp-blackrock: dt definition=
 for WDK2023")
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Cheers,
J=C3=A9r=C3=B4me
