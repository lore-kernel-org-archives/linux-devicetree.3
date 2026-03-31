Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD7739D6C5
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 19:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985813; cv=none; b=jXK/Je8zsf4uQ4Ib4AcGnHRCNFkEK7mfn1S4w4rJ6MnDWM0EqZje5DlfD6tHXxQfx275mLhGLeXJKAEIN33BCooKdFgNxNbgbDUAKmiMxTLqbg1qDtREvYJYNNfBY7CNEe8Ub7rKDq8SVhqzC7q5gBDnh+oOoSgzrLDN6EP3dgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985813; c=relaxed/simple;
	bh=wm5yabFkUPAPL3YweJzowMYhYBBBkFWHObuU4lx0m98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJWeyHa/Lxo2d1YthcTkcIsSX260/F8jtUeFJelXcjlPxBkiyY+j9k+6M08ROVSHy63TmGYSHOyvlf300R/ZxLta+6JQdFqA+1RRc0e0EBlpD5b/Jk8NvrHMiniDZMvi0vj9rjCBmzomXqD6FJSQ+AGB/6bdANJ3SqaUdgcry8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IlNjwUL1; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IlNjwUL1"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43b8cb81bc0so525015f8f.2
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 12:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985811; x=1775590611; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wm5yabFkUPAPL3YweJzowMYhYBBBkFWHObuU4lx0m98=;
        b=IlNjwUL1BTI/kfeR6oviUW82zC6ktDoyfiJOXBpUKclA9oK4815Z2CEfSqf2XKsJxZ
         MEfTLnslOGzBRxkg8s74HYMRmisF6Xw0khKi5nL57s4HyKXC20MxvjxLYVmwTL0V9YHR
         U+3PRue5JMAU+J4N7s7zHPN9WbOkrNi9hHuKANXxjb3QahhZjoLf2EZUqKI8+OhNJuUv
         s8HrSaOd1n/V5bnvFtkfol633imXvY2aCD4vexRr+uN9PqSpe7QptowcmLx4FdCpXVBX
         Rq5diokvgNnA3mXWBCSgB6JXb0vJ5ZRxzlsbnoOZF5x7AjYiJPsN9H6G7bJg9L6b7ZhC
         ipHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985811; x=1775590611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wm5yabFkUPAPL3YweJzowMYhYBBBkFWHObuU4lx0m98=;
        b=dXxwvB7OxFAIfXTdiUBht8ewsNS4d6ny34LmzM659R4NEor77vF4x+W43DyeTrZUhD
         TL8Zgv42eQvskbyKWMvleFZq4ivvc/cera+hWUqqAvdzMhDxK0VPauvAhcSuz1jVnSCt
         wU1S9ilXeRzJeEuRypADM1aP8ILSYBdCItFYkHnj+422viCGiCMRbci4j+8PjjOE8hst
         iN8dKo5Djp+0XlZAAl26os47qCwUGKfeE4O3L+KtqtEuqz4Hxz6+uYOY3sp0Jwjztkdm
         wjB4G4R8BdSR4YRm3lQ8zL3lCSnTLqKFhE/3QdzZqs8+2qxseKEaETaNGd/OXGPYFEdv
         kS5A==
X-Forwarded-Encrypted: i=1; AJvYcCX3MpYr/n/Wqfnah36hVzkh7KXiaj9ExBleBvCF3seeyF/BJpR8mDNAQgF+tF85j7vG0888NzswtWGn@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+7cdpwEQy6vptBqp5QViaGlpA5GupUZe3tBehhhPrPg1dInFu
	RSUqC/v0SDggCdRA9fvlSdxftgqNcUDxskzc4UGBmLi/c6+6A91aYZFG
X-Gm-Gg: ATEYQzzpsQyUq5aqAmwfbnc2esgON2Y4qtcN6fUq2+pWzfity3O433WmUAGyaH57wOV
	5Qt9ycf+1sFC6ESsDf6+mE/Bnh5PN0oNOiZgdTteEvjb0PLhA7fnYYpvkKgNvg/lpRP39j+ozNf
	s9TNb4SDkfYNAtFPlXA95HMOBdchDT8IAuP5r+2PdpJyP/sjgKwHhcPPZ1m8K4ih/K5iJWtPsy5
	94qWeCqYD8Cfhb0sgOhAFJXPbOLs+h1tXn4hx0vSH7D6lhYxCyN9nyMPWdCEDbJxcWnGfHExNJT
	6AMCKlYwW4EyZHr8Z++ehSAnVPcZSqh5N+awJwgMCKB/Qs36tW+DdUR0vpT52fSIrzN09ksbTIz
	9dNYGgYLlwQY2UNoC0QniOvEsqNxrWd2QCslYYc6RzXM4HTRxZola7uLprKBFRectt7lX6h0TvY
	V81pdAOA//QIvwmiI=
X-Received: by 2002:a05:600c:1c0f:b0:485:329b:24e with SMTP id 5b1f17b1804b1-488835980efmr6323835e9.5.1774985810507;
        Tue, 31 Mar 2026 12:36:50 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d50a:b400:7fc9:370f:c54b:9685])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c8a4fc2sm23549735e9.21.2026.03.31.12.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:36:49 -0700 (PDT)
Date: Tue, 31 Mar 2026 22:36:47 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Rustam Adilov <adilov@disroot.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stanley Chang <stanley_chang@realtek.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Zavertkin <misha.zavertkin@mail.ru>
Subject: Re: [PATCH v2 5/6] phy: realtek: usb2: add support for RTL9607C USB2
 PHY
Message-ID: <20260331193647.nhaej266v4gudrek@skbuf>
References: <20260327160638.15134-1-adilov@disroot.org>
 <20260327160638.15134-1-adilov@disroot.org>
 <20260327160638.15134-6-adilov@disroot.org>
 <20260327160638.15134-6-adilov@disroot.org>
 <20260330215033.ven3bllyw3jverfg@skbuf>
 <1884dee6134e1c069e9f68edb2fdcd7f@disroot.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1884dee6134e1c069e9f68edb2fdcd7f@disroot.org>

On Tue, Mar 31, 2026 at 04:48:08PM +0000, Rustam Adilov wrote:
> I am personally fine with removing the "force_host_disconnect = false" and other
> falses in rtl9607_phy_cfg but i am debating because it wouldn't line up with the rest.

You can also remove the other unnecessary initializations.
