Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D03502D40
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 15:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904359; cv=none; b=Fhm1kkiWOfKVJ/DoW3u6uAN9VNGDmUUgHCmYgvSrGY6LOJr4fXuBIGdHDNmdoFUaD8j/QxrA/1Y0ozBdAe4BkXmV2l+PPbcR0zKs+HkEZYSIAJiay+XJcJcWJuhxy09DROBkzndV7Z0pzkCPavZZiN74PKft/Z3HgjZFqlS8qPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904359; c=relaxed/simple;
	bh=qYeQNT3tjV04rlnvVwiGcycmzog7//CwXI+8H6Sk9I4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kuDEkrFt7O5FyUWbyU2va8YtTPG8guVaV+BwpZJFxMBgi73MTEVTbH1eWsfDSsq3Hd0LuCKD/BjdU9t3xsD8x4rxL90kGaTM4zEZyEN50bY5hNL8AhexlwjyFyL5OsX/k/1JbguuZaI2cpPVpECq7UTHf9yQdgluytTE3aMcUhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=M/NwNVQL; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="M/NwNVQL"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48de6a62a4cso289877f8f.2
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 08:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1791904356; x=1792509156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qYeQNT3tjV04rlnvVwiGcycmzog7//CwXI+8H6Sk9I4=;
        b=M/NwNVQLcoQ9APOs6MyeogDXjBfcOqF7ewHZPLeXJA0+t4fYOoSRW7AHiLDTBWQUB8
         ewWPVjgviK9nF3bM/Isdp4HPeXqk+p9QcaQXt8f05BgClqrSmrEiymsDxlqa+WW+az1g
         OHd36vw2RFKkFGtvFE2fMZxfC+PGmWYur/CKhenTwf1a5y/WzA/aijHOq2k6dHCvJwGt
         Mlcpsbe0R2TrGtg1MghQQd6aZOMaSkPJBFlEu5Gwy9mU+2lMhMTDs/JR3p7yIox6+HOF
         kWUdYk2LKNXUkjeGNjpiJnkef9lyMHAhXqmKlov/GNRennfSR4pqK2OybtkaAcs/EEkL
         H/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904356; x=1792509156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qYeQNT3tjV04rlnvVwiGcycmzog7//CwXI+8H6Sk9I4=;
        b=B3Ic53d5THZwkPsp0xIeEHRdfuSiHQY/nkPVZZNtUj9sXrOjnx8XY6iJliMXjbAQ+5
         dpawZ8vn0zs+QnhHcECvvLq3AGzbO4qvJyyGr5FrQLtESYbVfCvViAIc8Nr6WKWK4muD
         BEuCLXHHhsnwDqcZgd2ADpghd3GtfjpQyfxDISvy9J5MwrWFHUupaZI1nGyktnDyX8o4
         sh4Prat5taOBLCQn5PjDHIuMCoyGF+Wj0iNMrHzGegYI13hXRNwtCCFC7wA3q4icJKim
         7n7IIOJHhjHqkxORhUCu8DzE5eYOwzyLku5mSR3s9hg9DJM9WLKKe80K5FR7i7O4+McP
         xQNQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1FT0csy1MRGR948nbLRoOc0N70AAdX4rt6P1hGfKPaHHGg7cJEgZoQRpgt4Aed6H7aQ06F1IDd3yF@vger.kernel.org
X-Gm-Message-State: AFq9FYLd6fOUMjYUL8iaT2iesKNIPOZl/9tG0Qa3lH5fISNLllZacQ67
	pnKOmKUVhbAx6NI+lSsTCpYxcLuRg8unxZWJZRwn7/vH3HEBVGqMCQmBO/UZ2dxXCKE=
X-Gm-Gg: AYBFou1EjSEJoPrJZ/sl5uGReVziuoj+XkMd658FYzzgq1jc9QyNeRsHjPNx+EF14Dr
	2tzbEg2jJ9kleQQlV0KtFpXtPZ4R2M6oSPJzIUuCWJ0K8r2dhgRtJFRXUlEZg8du57lAHUFX4dr
	xXy/IMDB3jfWFnJhFyS7afw9yvidVG4D+zKNccQ8Axiq601jOsqiLnvHmLRS/y3EoSbKnOCOoHF
	b2irajHdu4aWLWBMj1yXMQdSlrsW8QTsimGCyLZ72XVMNXuufhLrFhvemXbx9LowkLf9UmLE/Li
	mIOmNdWFegLwKxCULBHE74GeHUUh2ZF8MUGbUg8+oVvHDcpdPWBF/S2XTmKOJjFcJsoAdPaP3CL
	NjdSr6DxbG9GgmqdDArX1cbyqfGmsK8Tg6JU3ZKyXXLIQexBxdazGVeDnCP+1X5DWokcL2BgwrZ
	sWzztxaii7jzENnXT8ohU7XHc+iSTQmzXsO4A9+dlJ83uo7GdQfw==
X-Received: by 2002:a05:600c:3e8d:b0:4a1:7701:f863 with SMTP id 5b1f17b1804b1-4a18e4aeae4mr233814475e9.15.1791904355994;
        Tue, 13 Oct 2026 08:12:35 -0700 (PDT)
Received: from remote-01 ([84.17.55.226])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0967c03sm5740158f8f.6.2026.10.13.08.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:12:35 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
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
Date: Tue, 13 Oct 2026 18:12:33 +0300
Message-ID: <20261013151233.2474217-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aa01ab1c-da2c-4638-816b-f535b635379b@redhat.com>
References: <aa01ab1c-da2c-4638-816b-f535b635379b@redhat.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 10/13/26 09:53, Paolo Abeni wrote:
> The above looks like a significant amount of complexity for OoT driver,
> and I understand it could be solved with a different kconf?

The PHY driver is in mainline, air_en8811h. Only the board's device
tree lives in OpenWrt.

A config change can avoid it, but it is expensive here. Building
air_en8811h in is not enough, since it loads its firmware with
request_firmware_direct() from the root filesystem, which is not mounted
yet when the switch probes. It also needs CONFIG_EXTRA_FIRMWARE with
144 KB of blobs, in a kernel that OpenWrt shares between every board
of the subtarget.

Is that the expected answer for a board like this one, or would you
take a smaller change in phylink?

Aleksei
