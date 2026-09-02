Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA26D39B947
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 19:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378050; cv=pass; b=VS20c4tDWCyjDhbSWBLf7QZGBYENAoJLodd7wqGIT/ph7VVRXQ4p/FK4rkqY2IPBht4xDYS8IbfSn+S9DGL6Ua9EpUFz0+LIdAx4VZzLGw5cHMYdpxl2OxHLVz7MjSxUVK4Z2qLS1e+RZvWJizXNT2mL99P49gQrdq9fB0xTQFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378050; c=relaxed/simple;
	bh=eLHTLx0sDJsJ3UdAPIBmpFXK0Itit+qS5fZpvv0jeas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nfbkoh0p7JQCEz7ZFH+/0fO9BxutHgP0HWQQgvkSBsg9/GTBtl3wydejnOehbRhpkY78OuzMUngCfQX14ANW5bTqceBJxJF9Y/All6sxo4ZfC+bNIg4iRAOIKDPUzGdibYHyJcupQyIqoNJq+TjnKL7itNfKH5SOxaZIqHxoqkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RUWb/IbW; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RUWb/IbW"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c25ee9d1264so56105166b.3
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 12:40:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788378028; cv=none;
        d=google.com; s=arc-20260327;
        b=DQehGCv/DJNqyeDT+dmygQPx1sSy1MoHEYStAatgaqmH6EttTlSgGQ5LJR8hpGMTcW
         fBtH6sDNLhEpxTIGP+YHa4725MnIsERpeRoMOZS1hDtp0Yo2cDHuqPDX49FLL+N3BL1p
         pRpn5UFPZXsxaMV5ZoLYNnhvV76Zr40f5ujvyXsQ0faPI/zfZ1EN4uNmJx3OPonwFP5D
         Vx4VjNRjIAuiYQNffwsMG4h4/5NjC0DtZ3YtBypFWBJ7YN28PB7AG0hs65b1UylTGUQl
         yaHpiMTWJ4ValoIf+w9g+uNpbhRt1z809JnRt+L7ppC6wfbJjU1nkirNnlo/BnwPTBvK
         KdAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MqbOVEuyYxeSD2DntBhPNO5j8MUT5Vkh/1ohb7qF7PQ=;
        fh=1AuFwvz+M0SenevjiYNK6DfUcnytRKhKUSMDgyp8N7A=;
        b=cPa3AThn1CegNxFx9JivqcKomVxdVxXwsccxAmFHzUsocZCAxJ3WmoCmMKB0H7XOws
         ijm6Rn2nJYxNQJtqUtP3/2eVVR1fYqh7kA1dSC/JstysF8LFVs3Jv9e7QvSfqSAN7fU/
         BNqCvOFmsHwEcyLmb4Prml1z0PaMoEu0l84ct3l0DOWuF9zWiHEWnBUXhp6iMLEvnNKF
         xkixi1u/ozNFRe0E14qk07VLg3efzllm9XvXCm0zLgnarGRIPqU+MfmvgaT52GFaE4F3
         w2COF7IyItrUz1dzIyJzxBaKQKop7C56gfS4Qrdfsm90aE3BNOnslmtmZSYGtBgHDNN4
         FELg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788378028; x=1788982828; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MqbOVEuyYxeSD2DntBhPNO5j8MUT5Vkh/1ohb7qF7PQ=;
        b=RUWb/IbWnwRrHbpmkQ/geuHNzbmDZM3cbIFwkfhuVSlkzDe9K+TllRV9sa1zWSFFNs
         P3UEISuLLof4pQVZAJksf7DH0AF2dwvAhkVTxtsCHL69q9dGK1yGxrjV89XvNvcLbc8m
         BqOrHpBBJttj8/slVhrpqfoXgq3JnYrl9wRfF1IvH93PMsBNKVxTqg9Lw/MoDl4YjSST
         WpmBUs8pxfEhgA1UaWwT/3P7AXVuaTtrPumsRcCwNtWxsv1UH5u5Ez+omICA2H14FPdm
         aU8Ee3Gi7M3UfMH3RZa+aoQQrTL0LbBcJBfLlPI1DdLYXaw/ofFUs/TXgvK/a5X6VzOl
         QgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378028; x=1788982828;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MqbOVEuyYxeSD2DntBhPNO5j8MUT5Vkh/1ohb7qF7PQ=;
        b=c1AoSMVdoYEzXiwam7frL/njoEloAiB20OZ4z+OPf/EOZ3duyzHKhzpju2mtzE2Cpi
         WXP5swAYIPt9zh1OOOcLMZwAgvG176omLb66quwGrwAhqx/6C5b4lwDNoKdsp/5J30eo
         M7MgCjSLz8MMRpKacDRy5cT1sY0a13pJu91JeUJO5Xd9skQnL7BRkUZV8rFZZxvkpW5D
         67CbHMSkkLyuIRK4mp+U0XA/FxWo1g/c9n6sOAzfdzkcZoGdqHvb5kCZ5dZUeDBrWP2h
         9jzXcvQyvkA8mh9TdfVOSuAEQAX+XE2QNjf2wLQhvFWksjoEYMmSnXIGElLWaOQRjtA/
         KYBQ==
X-Forwarded-Encrypted: i=1; AKwUvByklos+DUh+VPdHtUSDPbNPa4w6KecgsKhrxYHcTS/OkLFRHlfUXXh/XloaOQoE6gfNxkpBNGasZWh1@vger.kernel.org
X-Gm-Message-State: AFuF++nGqIbv3yDctOlu9lPuEyYvcnEZYYXpIsDTg+66hQAg1SEWQKhG
	V7BTjII6Oyrpj0jwNa/1JqnZDNqxkpensUtHtJrxs+5UJRg8GeFWtlbZGRLV74K0zIrAgSwD7cT
	mP6QKlpY9JuQe6n0EtR0gQ2lo3vP7OUw=
X-Gm-Gg: AYBFou3sCI8sntvdPs60HUvI6Yn63nCl+fS3rz31QQ1MxJxf4QYLtTJUDiea6RKoOz3
	tlV3mqp31WO5rCo4meevJAWF19JntcHqSdgQeSFyjtIVUvjk9KBMTU+uxG3veZKpNgrPhm0jh9q
	qy4fgchVTyeSUqa1EfETDE65BhwrPCZnouTYru6oBB7MiEIEEPHJPbyhm3cjhoAlXFbehQTWQss
	hy0dvudEjNuwJUWCgBvhajLn2W2uPFgRnlKHaD6LRVGCyZ3NT/qg12flWu4h7d0keA18OdN7JcW
	WhvlKMOkKQHqRoj22jnyAhZ+xmJ3fjGqdnmGJgp2BFA=
X-Received: by 2002:a17:906:6a06:b0:c25:88e2:fe25 with SMTP id
 a640c23a62f3a-c25d53cd18bmr358830066b.7.1788378027879; Wed, 02 Sep 2026
 12:40:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820122242.120039-1-l.scorcia@gmail.com> <20260902154616.GA2133376@google.com>
In-Reply-To: <20260902154616.GA2133376@google.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 2 Sep 2026 21:40:16 +0200
X-Gm-Features: AcwNN1Ue5U8Nrt8IK2CbOEno4dpAA-gcYG8T0qYRXxkQ6nYlNe8G_uXeI7qiNIw
Message-ID: <CAORyz2Kt=rKSJW0Q9pFJiBsa6nPGhHdNrsTsHcE4Qxpq5RsSaA@mail.gmail.com>
Subject: Re: [PATCH RESEND v9 0/9] Add support for MT6392 PMIC
To: Lee Jones <lee@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, 
	Julien Massot <julien.massot@collabora.com>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> What Acks are you waiting on?

Hi, I did not get any Ack for the regulator driver and for the mt6392
dtsi yet (patch #8 and #9).
I just submitted a slightly revised v10 [1] with an improvement to the
main mfd binding, so I think it would be better to "renew" the Ack for
that too.

Thank you!

[1] https://lore.kernel.org/linux-mediatek/20260902193351.185771-1-l.scorcia@gmail.com/T/#t
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com
