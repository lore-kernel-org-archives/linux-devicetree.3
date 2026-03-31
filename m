Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7893E3159
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 08:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774946174; cv=pass; b=ept7cvmIJUi4RTNRaa1S87aLOz+d+rJoPdp7EuA3Voj48OBdVaFO7+p+hY+Nw1wcKGyW/KHlE2+MIPbFOL/LRL+Vvv67eUjatW3rKW2faFUrh5raneP8I7ULxLA4+I05+ILuQOGcMFQyWMUwwhxnd2tmse5JSESTacLbl2tIpMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774946174; c=relaxed/simple;
	bh=XVn2QcmjcQjFkVK1YggfjpxaDDncirg+Y3RdNmPE/+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JPDroQLztybXvjNpEG1pK24a2JJ82ntNHXxnOsclMWLjWZWUtTruHhujvrNjNJU+pAa5d56UmabS9koM8v1IFc9vmbCfEwhqz9iwDvr1QURXqc9EbgXP9JoAF2YPM9zkhV/tJ9TcX87qSpd5a6HAt7kbgwb7qZtiqFsvMn7S2KE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+mjZTkM; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+mjZTkM"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b9c04152730so20114066b.0
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 01:36:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774946172; cv=none;
        d=google.com; s=arc-20240605;
        b=JTPrTdhR6UE16ibXMgVlEapO8WUcowI6vXNdcuKYDZ1uzMJfJaMD1HdqxNSDMJSVWS
         pKadV4O7CDvl7njBzcp+Wisa7hAv/qL/5nK5/6NDrFrAKzB4EOkT+h1TeWjg7JGkYhLU
         RVnXI0aS34j1EwPP9KW/dpF0nC94a7QgH/G+PeurCCqg9p9mFXKshzayoeDmbHPmc1Vt
         Hp0iVGo+VxXC6qbxOMXnmha6GS+hQ9fRQgTiX89dBpgTs+IxD6Deozz36KTvjL+eY0x7
         10yd9AkGV78qhnkRc+mDHSbSj4GTWmu1SlFLd5bkIHhQBZtKgyilWDQ79Gra890AhV+s
         noPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=L3TSuB1FbI7lqYJC1uY7y+dtfsWxR+6ey/FSJ/giDGM=;
        fh=awN7mu7NOwYWGMePRNLOdYyXl3W/dXk21yV/kZZXG0Y=;
        b=dOfZqDBlj4l8w6FMKbSIzRJ5G1cmcDXSnskwIVHheF3vFJ2UuMdMPdJZ6+6ftJ7GHi
         AAWCOJbFbSjb2APHOn9TAd+lpW+Lx2NCGTnk7nQAg72unyOCUEGHJK5wH9iHkmKOg86e
         gmXC8di1UBAQ8diaHv7M8tsFFEztcce3sGWBclRHsiqFANnkZQpTEhjVa4diAVmoDS+x
         iN1kHlyY++M5qs8aNLdlF4wEVTQ9hUscj67XV+qPOVcKjdm8wGhDgkFIkvW8pfn22qdW
         xXPJZS244I7J+9FUGmxfkSwQ+BeGd1HbWjJLubcQTmyidpMLvNzw82iwzo7FRhP8WRy0
         v7ow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774946172; x=1775550972; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L3TSuB1FbI7lqYJC1uY7y+dtfsWxR+6ey/FSJ/giDGM=;
        b=L+mjZTkMhikoveXVS1doON1iA1D3e19kfJZdouvzvYjjCPs/Ox04vxuqTbHSBKdSmV
         ijzCACmhOB8z87E+xJGzEsmDKjEmXyZpcjBDQu20B+9pmLPVkF3yGnXCMv2iT4yM0+rl
         UisC10rV3oTOuBJjPJkEKe8C2wrlXqN5ZWuoeaeag8EleBfREB/CfMh9tbMsQEQzV9Oq
         2Zmm3ciexDl+gwr6RCPdgTmPgLplOkSvhRb1pYOpi7ylQOEmqHPU9cpxeutJkskX3aVw
         we7CjQ6vN46t+XJp/YOMcWWwMk5ZCF6RUK7UUq8UhLrCQ7yk+AFwH/kQCnElpUKajMdW
         JLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774946172; x=1775550972;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3TSuB1FbI7lqYJC1uY7y+dtfsWxR+6ey/FSJ/giDGM=;
        b=AdFB7hJ127LqJSMVuo5tQI51MEMskwjaTa8IRwntlu1znF0bKrYwRlWhGNtwar+w4x
         6KAvHegKwOAnK9reIdapl25Vsx+9sNZ/uG5iEyJ71paONykkUZcWoYPmTIwBH8wRUt0B
         Twbp3wrH9ikdlpOpiTbu7OuuT+LVoaqGbSqH21iagSuxOUYtFmPA8G437/Z1VlSsVWQx
         wdK+ezmQEJPTkuao0DJh566EgLNPt3y2ptaF7nwSS12UaUdG23XQp6PcIQgjFhT9o2ql
         8esrFO8WODWlOTaFS8vF973R8atlGPsQKR4kgJAsJr55ZgAdAqJxGAgI2NBzcRrB8mJJ
         m9EA==
X-Forwarded-Encrypted: i=1; AJvYcCUDiCqjgffE2xCbJPK8a019eUAcc+s9AYV48lEysd2bo3gSR68U+1UJbCrumMNMCB4dKpHKoIy0B954@vger.kernel.org
X-Gm-Message-State: AOJu0YwWp2VJ670tZSWTJ8eSisRVpxJihJQQv7p+F9WG4nuknudg8fxV
	DNTdP3snkwYJtTHQc55ZihiD8BnnUJhfgiRox3HU55otmmzlvyWkQJk9izlm5CB/0hERtX4fIo/
	2N/WRODrzLguSEqQz6G+N7xBIbElEKDA=
X-Gm-Gg: ATEYQzxOHMCMYUE7sCtz6dKwP+LdaCSFmw7kZP/1vdyREK/FwDm5U90qH15EVnykPNW
	ulKl75bAD9eb1PoWynaYIwl9/jgzHNPG1s2mgabrJtp2OBTxSBpNcgr+3xxUe7a0pJAos4iFawa
	2ufnjvd8wK92JOWQEr9IqZ5Mpl3kKEZ9vpx9Zod07ygHPWI0eiJewa2bncCppjHHEJhBWjMZMYG
	Uj2tUZab0q2p6NCk9clP1fLLpwB7w6KgW/v1I38Bg0ZS3fnjJGLl14oJJUzJX5LUN7TeGUt2fMf
	1EPG8w==
X-Received: by 2002:a17:907:da7:b0:b9b:fa57:d5b2 with SMTP id
 a640c23a62f3a-b9bfa57d98amr71812766b.42.1774946171488; Tue, 31 Mar 2026
 01:36:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330083429.359819-1-l.scorcia@gmail.com> <20260330083429.359819-2-l.scorcia@gmail.com>
 <20260331-flawless-bronze-lorikeet-59a6ff@quoll>
In-Reply-To: <20260331-flawless-bronze-lorikeet-59a6ff@quoll>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Tue, 31 Mar 2026 10:36:00 +0200
X-Gm-Features: AQROBzCHGHvki3QPtgYv0FgcoeVoJGVuIm0WEFEat61ZeqaJ2itNlZb_JB2hAws
Message-ID: <CAORyz2+1bc9Z-opoNqyUU_WFzyXZKGQmR_Ur=4UonOC=AWtQ8w@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, Fabien Parent <parent.f@gmail.com>, 
	Val Packett <val@packett.cool>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Gary Bisson <bisson.gary@gmail.com>, 
	Julien Massot <julien.massot@collabora.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > -    required:
> > -      - compatible
>
> Not really, this affects existing ABI and might make the child schema
> being applied. Basically regulators node can be anything now.
>
> This is definitely not a binding we want. The syntax for parent schema
> when listing only compatibles is requiring this compatible. You cannot
> have here whatever empty node.

Hi, it felt quite strange to me too, but that's what I thought you
meant with your previous suggestion [1].
To keep the required attribute I would be happy to reintroduce the
compatible here, in the regulator schema and the pmic dtsi.

Before I do that and resubmit, could you please help me understand
what you meant before?

Thank you!

[1] https://lists.infradead.org/pipermail/linux-mediatek/2026-March/105060.html
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com
