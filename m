Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941153C061D
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 18:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792260197; cv=none; b=C0ZpRxAXAypN7wcewdcGnC7F2R6Fsu3HLMi5hivTknONiQ28qLN8hwfYj+5Wv/f0i1elmv5GN8lJor0h+DV7S7XI4J1rYcDiv9k3kjehANtmDjXG5XWY465NECugOsCAFtljNdurPUf2zxs0Wl1tr/amhkdK9TJgMbP56KPaL7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792260197; c=relaxed/simple;
	bh=uEkbkJFaQMaOIdNScbVyDcoXBnczG5ukWjkDYW48x7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nZ6u4sFOibByOQOYmQ6GNfVauZlCsQ9sP5wyh153Mqm53KAibUxRLd1cap/m8/4ZSImknwh8Z0sggpnd6M78CMBP94enG+H87itTOtGCWZ8f7pl6P0Y/LngTXhlrhpmfJXp12ulPBMjVyi7fYileLpcYVmoYH6ClTBrpfSzpMQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=YgBL+yKx; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="YgBL+yKx"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so7912795e9.1
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 11:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1792260195; x=1792864995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uEkbkJFaQMaOIdNScbVyDcoXBnczG5ukWjkDYW48x7M=;
        b=YgBL+yKxRjV7y/Co7CwoI5lTnVc+UpQG85Zfp4QuWhVZ0Ir5T4dsZHcjBM6i4gvat2
         sg0PG5LHd4zzkZzAGOF9TeJGE6/7UrB/tZm9jyXddgtlN5gjKqwow6wZHYvE/kcoHtK1
         4t2oKIlW9sqdkVD1jxJVfjeda7NOqMG6IXLRIIn6EcZrrs9t7qW+Yh0DCnU2MPXiTzWt
         gV1Y3uXmRmIAFOQPlUREPri6Vbxzc2G2SMKnUgowLFNt49rJKw18uhFP2V0E/oYAtxJw
         2ektVE6kg7Et8iSZeLWnik6lMW5Fwd1cQwvACvuH41Lh9qI432v89H2z3WVzc2Xkobvc
         osdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792260195; x=1792864995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uEkbkJFaQMaOIdNScbVyDcoXBnczG5ukWjkDYW48x7M=;
        b=GCtlUTWBpSSFpaJWtgNOO9nc00+VCeGENjvkfvrY+8vwoiSEBa5vYbauCysqFy/EIv
         FV1/5cJ1plyfFDlgdgENoCRrCZD50K4W6l0dVmAlv/Ii090doNYoGJDV9Mj0zi/p2SlW
         WCxhvt77n8eTs3mMHGe1KHmssdsIM5I2mroYuExWXIQe+qzMzSbotqV1y389KHI0uJiW
         eBOj8znIu8/bBw+hJ1RlaE6Zz56FELjUpg4Uo1XO+eZuzyIT4428ZrKGyf4feR32E+Vk
         YR/CodO68n9XzBJQLqUNTKt2dsGHTDsJCou7XRQBJfQexhYHddsSNCOEcKtJXH4Dwm9N
         avbQ==
X-Forwarded-Encrypted: i=1; AKwUvByWL4gKAJUv0qpXw0wP5Lhrukf6kOp+Vz8WlywPv7lVlE6Z1G39PjE3qkq34FalV3870jW0d8pC+hIg@vger.kernel.org
X-Gm-Message-State: AFq9FYKTQ+qsdo0DjbP/H5zaRvGZ5pZlIdVSU6rm2qeRcDNmqi1bu+EY
	kkrmR6EJW650YGgKZvAxE8SfVFB5vNyCxNDRYVSqNLZr+lzu3DBJx8S0a5iF13WheCk=
X-Gm-Gg: AYBFou0tzSHXQVcmbjYx9dlnLF9TYdm3i+DK8K54z2I7MHx2C703c9jrd/tr0SyXKU3
	6SpUdVMqVuN44EFqc5/XnrqgjMmui0jIRJRuZdUQngUrPhUxQrrC5dBbScHGflZgJG/x2qW/wqb
	MGJtxD1UYqLzfAPlLdcuZW2hySMR24lvnsLV0G/N6YjXIP2Usd90f41Gjly91LGu+MfdSgBsI3s
	znDhQsgsq4zgf5MWW2lURH4A0rJeqCHwvWhz4rtnsEOvKkOdg+iFPWe2H2rUpCNubHgR3L+xKV4
	LwUThMmJgbvgzn8LOOhuC1NWEoA/SrtIwVEdDQCP0viy+LWMTxkT/NgdTGhzSs+L3AMBw+WzwI4
	8rXY0mzuiTL8knJqu2ZVfJ7lx0jynq5ZHBfdZDhJVSJCMP1VAt1rofJQKpGMig3m2WaymZsWvOq
	+JYYvkcZV0owSVb0zkzANDoonryYoVLSw8OeLYlLTtlMiWJIY0vA==
X-Received: by 2002:a05:600c:1c09:b0:4a1:df2f:ae8f with SMTP id 5b1f17b1804b1-4a1df2fb8abmr32120385e9.6.1792260194385;
        Sat, 17 Oct 2026 11:03:14 -0700 (PDT)
Received: from remote-01 ([84.17.55.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cbedb6f7sm159228435e9.2.2026.10.17.11.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 11:03:14 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v6 0/3] net: phylink: wait for a PHY that probes after the MAC
Date: Sat, 17 Oct 2026 21:03:11 +0300
Message-ID: <20261017180311.3618879-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <b175c750-104a-4859-a137-09de78a6d8bb@lunn.ch>
References: <b175c750-104a-4859-a137-09de78a6d8bb@lunn.ch>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Oct 14, 2026 at 07:10:19PM +0200, Andrew Lunn wrote:
> One alternative is to put the firmware download into the bootloader.

That works on this board. The bootloader now loads the firmware, and
with the driver built in and a small change to keep that firmware when
the files are not readable yet, the port comes up at switch probe. I am
dropping this series, the driver change is posted here:

https://lore.kernel.org/netdev/20261017180251.3618606-1-f@lex.la/

Aleksei

pw-bot: cr
