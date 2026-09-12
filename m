Received: from mail-ej2-f5.google.com (mail-ej2-f5.google.com [74.125.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FB4284B37
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 20:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789245200; cv=pass; b=YvKvsGcudobxzsfdt2rTZXTxNWdGx8MJYh5XQzYXkE8eVrJT6M4FGfVzD9jU5ETsPgzIfMJZkajWUxK5EYq9E4XEwGmDHprYZuWFkA6ILG0Oe/Pp3FXETvS3pP6keCvTkS+s4d4hMhQ/2bqK688EQfHH/rZrsymapROytKVFv2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789245200; c=relaxed/simple;
	bh=rqyBuqSHWVw61RfLl33rH8YgPC33rT4HhMMfaGZOUmk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nFFHA6eo+tsrvwcydFX24/XE9aZ7CSyf0nTq2tESb5MHLQUyq8334SdfRBSSWnx/C3Jt9vEgEX/70fVO3wcptnWg3XjiFOHWHo78m3rJDcLVeApZubm4TcGe8tovglvrI3Kc0uleVgGYU3GpdNI5PuPBtkeTxnUXy6rpHeO7Gjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jbjo574P; arc=pass smtp.client-ip=74.125.228.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jbjo574P"
Received: by mail-ej2-f5.google.com with SMTP id a640c23a62f3a-c299e97dc0aso8509666b.1
        for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 13:33:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789245197; cv=none;
        d=google.com; s=arc-20260327;
        b=fvUZjiVBDtROB+yfak7xRMq8SwU2+iJkWj6hSuvqB43OV7NsaAn9gGzYC8smuf/hYc
         qY1gmF9Zi9BYHMXqX1mcPQLvRsQF3qhEzY9xD2XNRfU/QeCeWtTWELaOXTwo/CUYjskK
         pDU0wd1xWVQ5cF3g5XZakY0+5ny3IoIaHkAUzQCk5h7tll75LpUomDIk/lUNL+0tVCY2
         1+lgVPCH0Q2v6YaSmHiAeBCprU5S5OgXRWkTmcFVvOybtjPT0L1cQkQfbfDUnDzcnjwW
         KxkMGyGEq69mi1CaC8RLlzYXGPC/urqd+k7sfagU55UnPvorzq22DgpEhmyvly7sSrX3
         9eKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fXb2RdQOVdFeimkTuBnAC0nV21XWeOYpcj6vU3s52nc=;
        fh=d0H6+Wpea+XVOf/3AhUNUCEsZOl9WCIiUEiTBiSuJ5s=;
        b=bTR9S0UEEIuRFttzfcFzEm1Vf/4+CXxJV5Fi4OxKwPBNkHfEOVIxJV+SN1OpFFuUS4
         32XXoULorEiIeLIsq1HqlpPZuKa9AdBhvt0uJneXk+smIhCil8rmERPfCZEAjBz9vzsO
         1o9X6DUJwukRLSp+HvUxbopIN5X2KyChgktdVG5G3pzAIEDEjBT1DTv/A8AufsWvMhyx
         P0Jopt4EFFufrjB3OCQNXQHk8vIVeiFmxuBedYmqfi9DhMhCTvwWdpDpTf2N/SZMnjmS
         ISuUfIwkkRzG/mnn+joiu3TcO5MQX5ySWR13zXBKXQSZ8h8p85kDao8QyTlMM7CJ0a1F
         Vekw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789245197; x=1789849997; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fXb2RdQOVdFeimkTuBnAC0nV21XWeOYpcj6vU3s52nc=;
        b=Jbjo574PeTwU3+ByMmD0BDF3eHeS+YkszMRg9Bo7/IIlHtfBp7jgOLCGKQ7+5+1raM
         fUqdKA0UE/3fwUTp4r/6j/yU3C7O24396HMzfdE9XC65WsHanQkgjirPppgsGFkcdgvl
         bhlgEUqawkFA1HR0vwDkl8c8DbnKmwbzmX/U6dh9095SCPvDa+NcGEzbC0cuf/Ah13XL
         AUTfaAd8hqJbArhLA9GWAX7vPXVAPRsC5K4PRaphHqNMD5424cAQlEE889b1JNP8+8r1
         mg1+L92vDMS1CO3hlBJoqQp6rUsEWQ83E0ya+3hFyICO5HQb9w2EK5ey1CSwrfvq9CJm
         U6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789245197; x=1789849997;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fXb2RdQOVdFeimkTuBnAC0nV21XWeOYpcj6vU3s52nc=;
        b=V7ezaNFPluk/TsDjJK3gZruf7h8ufZlt4RdC7K/QFU8PovAy6rXZIB7lpJZ8K9BmPl
         cEy1WYZNJD3324B6zCqG5agbaD9dlAUAaIUE8pMdIgZ2Q7rQG6uV24koHZHm3oJ4HdXi
         PvLITxdNiNqE+UC4vwsvU+NbjmP08xxFwmQx4WuDEPFMqEpw6Rkrmbx5LUCLlMdK0bZn
         GHSqX9XRHJTK4yQT5ZsImCYpVMzfpEhfJuvDZ5e7HI9VqmFykwTFjKoBg5iycWjUBPWw
         mQ/ZkglxKcAJj1AT/aeG8ME6S2WqEnzsPPJ56U19Pm9o8EdL0QGf1Q4pyezgwFvb3ooe
         RCgQ==
X-Forwarded-Encrypted: i=1; AKwUvBzN17cO+h65JP+3KgB0T2f1/hT7auVw3PlDmu9+I23/mYGJAPEyIIBvxIt+UteKm72nRHAeX65WBRxu@vger.kernel.org
X-Gm-Message-State: AFuF++lq7TN6k6iXkC/pgPZ8OSctJyC3oeHMvfENixstEqYRuFRN4can
	gHHgw3kgpym1iVB6DYS6xFGTqW4/7PvM+mDtjmCvwiv6LX6uFy7I9QqEeWtmluMfLR6/C80vwTp
	EyBAjNjax6w708UmhV3QET0XOy/GLSdM=
X-Gm-Gg: AYBFou3Px1TAMj80LTGDo7E7py/ifWRM6hLYePyst6FEZN4VhyucNF4X4qdoSoaHlN2
	vnL6bI4s/Ok+5jnCsKr0TILP32nfiOepLZptniSLGOu8+T3z1tFbO0qtjqi7zNZ7G3/ntMdJCIR
	M+jxuwF1ph5irnVb5UhJePJJC5Zqs3BrsUY0x/kkSN9Loke6hPhT8gDmdfwtwX3MI/ArreoJnz+
	YEG+tVYDeX6y1eh9z9Bu8L3h6AGIL774CsJudGcC8fikKZV6a0eH6OFn67C15U1iThfvKfrA9yy
	rzaQOvzIrcQBBRSvu6oRm6RSSNd5L4YkxBJTW93mPehpfpTEKepja97fFw==
X-Received: by 2002:a17:907:d02:b0:c25:2a78:15ed with SMTP id
 a640c23a62f3a-c296659c61fmr976523566b.6.1789245197295; Sat, 12 Sep 2026
 13:33:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907153713.2572547-2-coiaprant@gmail.com> <20260912131421.2960a12d@kernel.org>
In-Reply-To: <20260912131421.2960a12d@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Sun, 13 Sep 2026 04:33:05 +0800
X-Gm-Features: AcwNN1Wp1szdgOCnvhL-ujyIZJIERlGVxaN0L7OfiFu9TcpEfz4jyCgcrEH55iM
Message-ID: <CALj3r0itTv0+8R+mTg3wtMD95=4V3Znwsk48oxaSjrVMLoJfJA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 00/10] net: pcs: add basic support for RK3568 XPCS
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
	linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8813=E6=97=
=A5=E5=91=A8=E6=97=A5 04:14=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon,  7 Sep 2026 23:37:03 +0800 Coia Prant wrote:
> > This series adds proper SGMII support for the Rockchip RK3568 SoC
> > using the integrated Synopsys DesignWare XPCS, along with necessary
> > fixes and refactoring in the stmmac core and XPCS driver.
>
> Sending the AI review FYI, please look thru it and judge if any of the
> comments are worth respinning for. We're waiting for a review on the
> device tree bindings, anyway.

I apologize; I have been so busy this week that I=E2=80=99ve repeatedly
overlooked my plan to reply to sashiko-bot's comment. I will get back
to you as soon as possible.

Best,
Coia
