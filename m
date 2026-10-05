Received: from mail-ej2-f11.google.com (mail-ej2-f11.google.com [74.125.228.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451D13812F0
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 22:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791237857; cv=pass; b=ckM4CcTXj0Lj/WAcQhi+9stxuBXe4BHZkeCk4QkQsj/GkmGzn1EbdKV81WefjW33EbZEvOcbd3PQyYPGLIpGSVGOqdeVPLaswxhvSD0IDPsa4A0I7f6zIKr3V/Z1yLlbqbhoyBBYNTb1z30tL9kOUIR/zJLk5OuXdmgGia8TGck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791237857; c=relaxed/simple;
	bh=KCErEo1wEmMk+mf7jU8H4RsXealnJyQ44fgkbs7wqm4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IYB/EI6e8Jv5MmqM10rT80/KJpBRh0RRAfGDV8y9ZVvhWrdsD8HMGpiKNNQ31sSslqbUK+Aw0SnrhBUGdsgt9R22lfYEz4qfEaWB26fukuZBF4kjb72itjaruxUw9XzkD/gudwzGdRWDdQ31ry6yU809aB5eon+Q3cfglkO/wfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rgJQptSp; arc=pass smtp.client-ip=74.125.228.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rgJQptSp"
Received: by mail-ej2-f11.google.com with SMTP id a640c23a62f3a-c2e258b0924so130240666b.1
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 15:04:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791237854; cv=none;
        d=google.com; s=arc-20260327;
        b=PlVjlKtMGtugnmyv9HAy83l2r8tOpT46BtPnvH1ZGUfW9RSdEunydI3DDlNXh8rffL
         xF5s0zsbkYJ2OiSUrf3V7Hv87ZfR9X6zO98H+B70wohqMDNIZ7KLDQ8at02RQFKJRqU+
         ubQnxwSXpk6+Z1/a9+a5WCOCu6m5Rz4DLr3LfkJtJ1RPBs0/8sw8XSyAQq9MzBerHdCD
         SHXRWmHQUIk4rnqbHS+3rGIUtZCzWy9vZ/DybLsVKWRANCZTTaHRTbY5mpSvA+olyPKv
         7K8lWXbfi4pI2D+8WbTui4MhOMXrgOl8t4f39hci3gHbuH9xVxiH3PqR2JTh5O519dFA
         Ka4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KCErEo1wEmMk+mf7jU8H4RsXealnJyQ44fgkbs7wqm4=;
        fh=4bMX8cQswt1ZXnrE3WVkhPFjupQteGmD7oDG3C4kgu4=;
        b=EeGrx3FecDFXpXV18WUOSghLYH9KjOOpmQgY8EnuDNhADhv4NXmWNcN2DY+sPx+45A
         dMErHefdDalA+PePJXy1SAAaZ/RUASRI2IB3o/uj9i6tHoimhjcYa832gbHlpN8XHpUf
         TU1La4LOsZmmAvaLy8llAmUPOZXFINcpNH4BbjguyqhJwzDS4erISr9FpvY7HckDlQbT
         X6hzuVFuQIQVKQmaAiDzaSPHY8hGKkqOSDXQx38R/FGNagYp3JYHBtTRAAqxt0MrFnKw
         ThiI6w64MJuLfM0oAd0L0WK9fqs35LKNZWzRcnssM34N2TXwYUXSnzS6idkdk+MWN3jU
         NDiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791237854; x=1791842654; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KCErEo1wEmMk+mf7jU8H4RsXealnJyQ44fgkbs7wqm4=;
        b=rgJQptSp/5lQbMC4IAeUZp21Nq8XNL1OauJhINU/5TD2ClLBvu3L/rCA5ellOgiTes
         U/ZWx+0rfJqnHnl4L//q0nNVUwqHQHIyeTb+sdd+9LLYkRsOFuraogGW8V5wrE8c51cM
         urXTHQg8JVDjvdzBOi9Tv3PZiDQaqryCi6pA5R8sYy9DfgLx2iFe9WL4FNnZzy3PPqST
         qPx9y9tKkJkYxkyxyjE1rEX5KGWph3fbmXdlJCFQhoANfJtk8VGRYpoSIuidg99m9QuK
         F4xn1FuXwLSfbnuHpTz8Kl5488H6aVgs9ZaXI4iFXfX2mtowMsY+VVziB0TtdO42NI99
         ctaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791237854; x=1791842654;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KCErEo1wEmMk+mf7jU8H4RsXealnJyQ44fgkbs7wqm4=;
        b=RqQ/YHFXtyEJAcWur7MJ9ALro1tulRiy3JjDZz+1A3JF/7diWpcuQbfYyUkWCN+khK
         Nf33okb2Vro5bUUihd4sAS6BNRgEbwgcclOcj2yDEBlYDBDmUlzSGHfe2C2auSkkTmHy
         ZYM1aFy+e/R5Ie5jfB5Xdl0RgBXL9XkwO4THBQUj4AWH6hZHe+qnyzJ6fgiMNk99Poor
         zL7J4gzgAGVcAPW10hPBL+EMF3THg0FxjqtdnW2sZjMwkpnpJ0pbmrn2KrXtddc9/Koe
         GwvbcktVgzHEz6GlSP8qJz3DIvAHAWUHM0u7zy1cpVg90lc7rGke2RcBzNdB6nCYuIHn
         u/mQ==
X-Forwarded-Encrypted: i=1; AKwUvByzBkIZYT3EAMOxee17y00gvUzQPb7nDEbDzJZa7WGdC7cV2T7aQ40C9//lu4GihSCvOa6Cq4md7/FT@vger.kernel.org
X-Gm-Message-State: AFuF++knaTy2H50FS2DpO5+IIlETPTOLAtThssp0eemiWNdDU5f4orzv
	S/Cv2RrEhD2hXqho1exFYNNtn1xKvciKyuu27LbFBeTjJofu/+RyQuDq56uCXs4xpMFMQ2/bNoV
	tsniRCEmeDGWljbJqGCGDD9Aw16HWkDk=
X-Gm-Gg: AYBFou3EvuhCjKGHUUnkidKNyAkVyYu5iawQAhsbgPWgqL9vzGkdC8/IOfp3wiz0L2Y
	+6X5E1DfqYAtcqWwz/qrcS6jy0yc0FwYNDAEs7eKq61hzr1mEvuxNhgjsiJy/tgSyQ9+SdoRDrM
	+S7wbBsk+QSphRqkni777USasKd1xH3zHk+dWQSgtniOvv62O0Tw3xEfvPyn7o9CDMGsrrjz1eb
	KdlSodKVCP51JTPjWubOxIBKSXVgpZPjB712bBQZ8YqMqwns0hKwlmcsOPjwm5LtyKAm3lqfHzl
	vj5j7wXU/Y2c1j/c+HoRdIOJZZmsLcqFl2kT6pmVO+uhZ5vX998oJFRG8Q==
X-Received: by 2002:a17:907:3e29:b0:c2e:19b1:dfe2 with SMTP id
 a640c23a62f3a-c2e4ad3b1cemr1046003766b.23.1791237854529; Mon, 05 Oct 2026
 15:04:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922200336.2201212-1-coiaprant@gmail.com> <20260922200336.2201212-4-coiaprant@gmail.com>
 <20261005135939.01ccde50@kernel.org> <CALj3r0h7j-4ZAiX67LmbgpmYCvK-Xmzd_qnYYgoBmniAW+eiWw@mail.gmail.com>
 <20261005144432.580daa2f@kernel.org>
In-Reply-To: <20261005144432.580daa2f@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 6 Oct 2026 06:04:02 +0800
X-Gm-Features: AclHuK8_KLwVxsmgUNUhSrq19BEwBKrpkwc4LlinlPX0y7uVYSSqgvZVvQtFu6E
Message-ID: <CALj3r0jNFss4RqdPjJ+NJ=yPRm7zZA0N83T2XxqLuFwoH6iN7g@mail.gmail.com>
Subject: Re: [PATCH net-next v10 03/11] phy: rockchip: naneng-combphy: add
 SGMII MAC selection for RK3568
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=886=E6=97=
=A5=E5=91=A8=E4=BA=8C 05:44=E5=86=99=E9=81=93=EF=BC=9A
>
> Well, the patch series is already getting stuck because of
> cross-subsystem acks. Do what you will, I have 700+ patches
> to look at right now :/

Hi Jakub,

Understood. I'll split it as Vinod suggested: PHY binding+driver to
linux-phy, DTS to linux-rockchip, and repost the remaining net-next
patches separately.

One request: could you prioritize picking the stmmac lifetime fix
(patch 01) if possible? I will send it separately.

Sorry for the noise.
