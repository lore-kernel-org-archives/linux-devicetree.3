Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2D63515E8
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 05:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786685904; cv=pass; b=X77Xazqm5V6aF3LeZxdb28Y9I7v2gZw1x7W5FDQn6cDH7+VLLShALCY8ZKVBHkgwy+ToH+anjFfmc361NM3e8gKekmXvfTNVqQ+RIIcWBuFeObTGhYXrdpuPBPIspVX718BHEhn0Ws2ha3E0FvDjYROLCW2wmGi0INBRRLvD4NU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786685904; c=relaxed/simple;
	bh=bFXrIBCwNXQf5uSzSbdWq2pW0DAs87dD/iRxpbolg+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rjiY8/fLB7ZZiiW7nwK2I4yr8Iq2W/7V1i5Kfnv9+Ys4WLjuFjSD60nh4D8JhS2yzeBtpMEsLlJovuhWHgatcYrRgFnUXPIEWGdRss0/9BzD2CzVl5VOAcGm2agCxsxkTlYzLDFTkCYlsxfBQhUlC3W7cUbRqiljVR6FB7bIp90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DbDX5+Ww; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DbDX5+Ww"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cc61541f8cso22835095ad.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 22:38:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786685903; cv=none;
        d=google.com; s=arc-20260327;
        b=Bi1vjDN2AU4IAIaj4EVAX7mNYps6k+VPHr0YFCZLmBNiMvAJPG0mbihp6YiUbOf0yL
         rg0q6d0YYKRH4Zqi+JYB1KE4fYJKYfntlZIbF5c4QumOh4uX3Z5kOUmOVM3xOPuctKR+
         OztNNRIYFdtNxifT3rzURKEPeba+chyhQxa4Gb9uyRl4PsuJez/GG0eONA/zaLiS+el1
         6pXO6VJ/fY6SmV8705A/l7LVenbAPfh0BT/ePuJMBTa32DgjiHj32UZqlkXhnPnyt60Y
         /Tkudq73a2ATJQj7YruLIGU6IoFRMOvr2P2eIJiO/WfaphGAyLN1HYEdvaJpTu0kNUue
         WfYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bFXrIBCwNXQf5uSzSbdWq2pW0DAs87dD/iRxpbolg+8=;
        fh=bw15SJZdw4yvbZrlpWKkMwo7CcX3wCqIYDhjQB5JTh8=;
        b=Rc7X1+e4TdthZx+dneinIs40/7wP1Ii6y4kvCYA3gxYDVeK8eyku9npv0XFb7pO2/D
         y67hLdDEIP7raWof7jfI4wFPdBenOECIFuVXcVScBGk8BoyXzgE1F8+nzHeRR+G/lkH+
         0dB2/ZlAc45ixWtOFHKogGg2d4Mqxi2jiRxApmTLGnCfwpxrXSWI9nP/d4jvK9bb7Wp6
         JTn9ouNJ5hZAP0yzKjDrVJ9TK74T/eTxOKYGVLMfmXHTEkkkztXeb49s5zJ7rmUJmMAO
         Jvl8uTcPY0QSVHNTt1pMBQORxJ0h88S86d8dm4+bHNW3fJ5Bcc4aNMaMkVf0IRhS/dG6
         yeTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786685903; x=1787290703; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bFXrIBCwNXQf5uSzSbdWq2pW0DAs87dD/iRxpbolg+8=;
        b=DbDX5+Ww7/0OEmHX51B2obaIdohdCQoNNo5DblpToErzGv7uj+376CFFno5PbLzT7T
         1ecBq7eXDfU+Qiz0DUVritW/wCHdQ0FllospIygIeQ8dsC5qFVSCcvyEJO2HmKRTUsc3
         wy5YCUY0Fo96Y+Ve2GR+8L7ytmssp4WkoOJSQK8q93xr5I5pa44e+rQePrbxiL2cZQ8H
         vuywSolv/xkTUBG0F5P5Vuay18L0AZeI+o6gcMifvfHDAt2YNUeFp3IUf4nhA9c6IqbY
         ZnnOFtjiLWW5w9mCu35tL0DEuq0eEUWmoZ3oPu9CawEISH0PDjHJykz1KTGIOmDq2xWC
         kvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786685903; x=1787290703;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bFXrIBCwNXQf5uSzSbdWq2pW0DAs87dD/iRxpbolg+8=;
        b=ilo4TTvFZDhVPEzWdXLrOFzmfDAD7U9mQMfZJaWeXrRHzjCIu+yd5P+bDYludgJcYN
         fYA9Mp/FIQ6bvfSYa6xgvxrBhAMd/Ekk6c/Qs1m8ZveLzGQkgvOpJ8cNNSizOBGzy2oK
         cFQ5CCPiD1UY29YS8dFqnWuLjSRcicjyv6yPrelhGua+wjGVT0skUpMBCS2/H0NAjWvT
         MiU0rPD8wAeXYvAIk20BQqi0ISBXrjwyoAZFwbHsGuYxv1N+VvgUikG7XB2EbH7Yh9tI
         IHFTz5htZdEPzVt8dLwJGzr+KWq543pYajcUO2ZbyoIhx1McpKaP/Mo0sbrCfTfGmE/p
         M1Eg==
X-Forwarded-Encrypted: i=1; AHgh+RrM/tvqahsNfci/VY3yOw/ghs23xUbXeKPBbaJxD0LBSpnGG7fKO8/1kwXdIicv047NuxRWeHi5IHOH@vger.kernel.org
X-Gm-Message-State: AOJu0YyGh3eaF8r8OG7f80GxiBP+WRB+P9MoU/HjXdAQGB1mCWPK6/0Q
	9AGGMFvlfvBht8cTlbJ1vmK64arJaa9Hk3bzvRz3j0cuvUyqUgWlp9QztLma3pr0sagSZNRkujR
	jSkfqyXP4aCHSFfrDpPO7zXLxrwotPM1EV2oQyg8=
X-Gm-Gg: AR+sD110Q/5NB+vGbk9/hD0V8fvsMDvpYBlzBsG1iZ7+xVghu2WVkzSK2Homir6cYqT
	S8V2PFAD561DL7dJ4qCdzddm1uqphCMUhfDWnMdJ78BWS4WpeR5OaCCxzKp+6zQUjz+8WjsWq92
	WdlZH+dQqyJtTVL9prxMkVbzUkrFQwfw/vULS4PufyWODN+azANTDjZk8dUeg8mk7JhOepO3qCc
	m27dnrxUsW2djiF2xsmn15tVSF6wL/skjEX7HTpyK4XLoY0rXXctJL4MQxte+n/nlN54pJ3RKp0
	r0qmF0/M85n0qQJgGFpq5XeBODqN5b5XrFF3NQz6QOiqvg==
X-Received: by 2002:a17:903:15c3:b0:2cf:b9f9:18bb with SMTP id
 d9443c01a7336-2d3afdacabfmr29441175ad.4.1786685902925; Thu, 13 Aug 2026
 22:38:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812132755.32585-1-zajec5@gmail.com> <CAAsRjRn4Pfv3LzQtVbeBzw49fN3Fk+M4JGwKkKq6pvo5Uk-fpQ@mail.gmail.com>
 <20260813190813.63fjmjmciry6ubaf@skbuf>
In-Reply-To: <20260813190813.63fjmjmciry6ubaf@skbuf>
From: Semih Baskan <strst.gs@gmail.com>
Date: Fri, 14 Aug 2026 08:38:11 +0300
X-Gm-Features: AUfX_mxL4JRFHzU19Y1xhgEzNg2PbVC97aaf1LW7NSX7i3h8ym5DbVvC39-eL8I
Message-ID: <CAAsRjRkQuR8u+vxhZXOzKpVDMUM-tG2AoiTr+qGg05ewjD+4yA@mail.gmail.com>
Subject: Re: [PATCH V3 1/4 net] net: dsa: b53: deal with Northstar devices
 using CPU port 5 or 7
To: Vladimir Oltean <olteanv@gmail.com>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Jonas Gorski <jonas.gorski@gmail.com>, 
	netdev@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"

Hi Vladimir,

On Thu, Aug 13, 2026 at 10:08 PM Vladimir Oltean <olteanv@gmail.com> wrote:
> Where is the code that configures this GMNGCFG register?

b53_brcm_hdr_setup(). Setting up port 8 ORs the 0b10 value into the
GMNGCFG management port field. Setting up port 5 ORs the whole field
mask, which sets 0b11, dual IMP mode. The chip has no IMP1 only
encoding (0b01 is reserved), so there was no single port value to use
there. Nothing clears the field. That gives 0xc2 whenever port 5 is a
CPU port, and 0x82 with port 8 alone.

> In the previous version, Rafal included a patch so that gmac2 uses the
> same MAC address as gmac0. Is this better?
> https://lore.kernel.org/netdev/20260811193658.14304-2-zajec5@gmail.com/

Yes. The IMPs never learn: b53_setup_port() disables learning
everywhere and only bridged user ports re-enable it, DIS_LEARNING
reads 0x01e1 on both conduit configurations, and the ARL holds the
host MAC only as the driver's static entry. So one MAC across gmac0
and gmac2 cannot flap anything, and the bridge MAC stops changing
every boot.

Best regards,
Semih
