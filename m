Received: from mail-ej2-f9.google.com (mail-ej2-f9.google.com [74.125.228.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98928360EF7
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 22:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791237707; cv=pass; b=VH02R6/KZZRv4RSZ4c1ha8H40Qr8LJpwpd5/m//rnX6jcI1TWbZK1mzwRT0Rb6xXE/54AY/le22FgsGgi6Sn8QbaFoJOSGma4kL5G5heBkeOnStbeTIBrTYy8nNux+pNrediK7f2CqNSJ1rZHvuIbV2i2Ob8pZEIKIX5c+1yBUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791237707; c=relaxed/simple;
	bh=pU6N+LDOUo5/wsUPaDzc+C7fTsEvvOq2zd9vTznRek8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M39ZYr05P2PMPv3h+Yp9k+Bb3g0v8I6hnGnoJISawu92DyJn+YFdrJhduQ65CATRgLVTQ5JgObjHqEmjUVDAAjOdGlYk0/PdE7h83YDvF9InR79cdyCk8t7TjA2Ga3ROr+KBg1enO48P9Ex2OwlRrAE1udLvnBIcjScO/fotgqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VMVISnrZ; arc=pass smtp.client-ip=74.125.228.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VMVISnrZ"
Received: by mail-ej2-f9.google.com with SMTP id a640c23a62f3a-c2e31c05606so67987866b.0
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 15:01:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791237704; cv=none;
        d=google.com; s=arc-20260327;
        b=LpgRVGUuaINQmSvu+Ib2qmbxOGtKj2wir/xOjD4rkXIUVK9QAW614y+NSDcZd9XS+R
         ph3TuOOxofApTbkgbetwQ0vsR4+5lzRSMKQXFEQEiGjNvSL4Ogxcyi6hKVU3WKnctFcT
         qmxNNCOQZWITeT+ljbHxfGUW+Uf7yc5LTCIhmrDdaGsRnn78WRC8fJd6Nluy8ZFpqHAg
         7NksDybfYo1obXK87cYUIia2Zs3UcYXProrMyWVJAiZwyIxJ1bQ3qTjWSYfv956e7rZV
         8tWjhRFtGqWHnK5jWkdSNmpG7NZnaziES5hbeEMldct+5NOdPiSdnfMufIgHFMzKIkpi
         tTnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pU6N+LDOUo5/wsUPaDzc+C7fTsEvvOq2zd9vTznRek8=;
        fh=CS7M0mhQXkTfwhIEs/PwBwBSC3KZ/QFmoI9P9fiNbLc=;
        b=BIoTPuheeE0E1tJaArxrJpj3gC0B5BALpGcKH2LKsI5nra0Xh+Dc2V8VEiYwkJGI8q
         NB6zwsfF6AUoYi0HrlihO0O4oGkzCqUnorWJRY7qG4rsoPrYi6sXseiigI6VkapGQ3Th
         fdbfmpnbPUSqDyEQNpQB6Mh0MYKfLMzlrdvjFMds3hp9AskpsUFw/0gwe1T3YabyfUWN
         EX8jMrQj8aqIPK1dhKg+O1/XgRAFfGKLC6AD8y/Wxi+sPadeia6OepqAkl55x/bQJGE5
         zG68kA56wp8PKUeZiA86sKQmvaQkv4fL5P0r+ELcSdmMRSypuHpFKSAwdDfVYdL3btQE
         5OPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791237704; x=1791842504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pU6N+LDOUo5/wsUPaDzc+C7fTsEvvOq2zd9vTznRek8=;
        b=VMVISnrZL1wHWumoSE1JWHa4u73KOsWbHFE3G3orTGu7+JYRVCX3S8kMHXYSvdfG9Q
         UdXDeZAVvBHi1OkxNKzhjwcpEiVtfpZoUz224dn3W3H6a7Blp8+xrBV0HTEevbD7k/MI
         b1REuqdItszSL/27/2sEGqUGao3lb3DMzUog2l3cNvXJDBlM4ZTfpr5RHWofkW7EbEET
         fQlrRKaGib4KVSUhgdDFYIo+pklFe+IYLIiawdfQN6LWtnX684xmKOgcFpQAxFtzg8EG
         I8pKC7dGLRknHQO8NX/098ZPGp/FRCeMPHim1YTTvsy6AvSMnooyAvu+sucSvk7SU9Sb
         RPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791237704; x=1791842504;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pU6N+LDOUo5/wsUPaDzc+C7fTsEvvOq2zd9vTznRek8=;
        b=V6AbMHWmD6he0Mfj0jOwnqxVL1VeULwSWBadY1LOuhuIpJp9+jgLbYV6hchdlega7F
         ad7zqHhrOqXz50CN9OWF52VyvCvuM8Hfy0CZOtN09x52wWrV8r/RuU03ORSDy+aiCPNF
         3WSrdkq07XeUNOHuR9YGneN//isAH1IAk/jQ64wM2ipM+75D5FRlpreWJfLDMlYjP5UB
         RBMDzH3AI+/z5M7hqc9t3EPiBVOerx7KDqlVXV3TdLjX8rVcQEvllr91BmzOlTE4pCUV
         G/p7uzMclhb7Fzm5n6jjwVOtgvUxxPrP6maFW5WfAOphJzsfJ6fUcnBINHbQYGO9Cww5
         ugWQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJbomaVYnGZii36SmDZw7yFBN8L/kNbv7tXuiVxSYCHB8LAVbcgm9IokByzoCm3+7/DgeRfiBd+Rn4@vger.kernel.org
X-Gm-Message-State: AFuF++mW4CACZ5jZhfG792Drvl2ioAehUVA+Mqx+uj9n0UkkepTVT0kL
	j7OPyLF+peuLzi/QY9DfcWn2czwYcJSGcJCgnpf8nEePhDr3kWyv+CVMZyf1I/PNowLIgcPiAQh
	7jEEiYaJSdZaDO4R/ysOBn7ONKWTU4oo=
X-Gm-Gg: AYBFou3ymfv35xRgJnN7RsNmUEsycSPiIUl4ZU2DGkBQTztkud9FEDJWIpbBu7bVFoG
	8cczzTQ5ptGXM+ZcGi/dM+vBaksyXmuSfdaTWs+zbo9hKFsTeQnj6jMDbdgVNZQt+juQMQx3JFl
	jm0SQSGgn5Qr17PnpOc5u3oSyM3k8tClRT+LKTlRMmu2F2nyPJKdm4wuws1X9nAH/zfLxuxjmS2
	7BiGoZZSd0Cf5IR1c1fBZ2tx1pD2MnHG4aqZr/jhsRB9FFYk7e4b66gWqprpuE4MZvJbimLo4fm
	WdnMGQZfv1Est18ZUvATWsRQonX/9AVvz6l5sA7PmcrWDOIL4xxZTAmKIg==
X-Received: by 2002:a17:907:2d92:b0:c29:f5d5:5a92 with SMTP id
 a640c23a62f3a-c2e4b007c22mr1011878966b.28.1791237703713; Mon, 05 Oct 2026
 15:01:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922200336.2201212-1-coiaprant@gmail.com> <20260922200336.2201212-4-coiaprant@gmail.com>
 <20261005135939.01ccde50@kernel.org> <CALj3r0h7j-4ZAiX67LmbgpmYCvK-Xmzd_qnYYgoBmniAW+eiWw@mail.gmail.com>
 <asQZ99CMsQF10-RZ@parshuram>
In-Reply-To: <asQZ99CMsQF10-RZ@parshuram>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 6 Oct 2026 06:01:31 +0800
X-Gm-Features: AclHuK-R2LsVgHnJjNmWI_vZ1n3RwcrYHA0O30u1dyI8VYXPn7GxP9tLow2x2eg
Message-ID: <CALj3r0i+sBhefWPqzt76OX+DxEZqzxg1JOz3d3te0sHzHQTV0A@mail.gmail.com>
Subject: Re: [PATCH net-next v10 03/11] phy: rockchip: naneng-combphy: add
 SGMII MAC selection for RK3568
To: Vinod Koul <vkoul@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Vinod Koul <vkoul@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=886=E6=97=A5=
=E5=91=A8=E4=BA=8C 05:43=E5=86=99=E9=81=93=EF=BC=9A
>
> Typical order is that binding and driver goes thru subsystem (in this
> case phy tree) and dts thru the soc tree.
>
> I can review and pick these if you would like
>
> --
> ~Vinod

Hi Vinod,

Thanks, I'll resend the PHY binding and driver (02+03) as a separate
series to linux-phy right away.

Thanks,
Coia
