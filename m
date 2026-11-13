Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530233;
	b=tJFg9X5CT4dI5dcSdLKMGn9BeROPGxVVPMiIZ6mxtBlSYQ0P4PoOGYmbtDY5Vm4aIhoD
	 vP4lKxzzyNDBS2F1TdYiajMys0gX0MuLWpTWItNkQhkyXQ/J5dV8tFoYHMhjKQgKJhKXr
	 t4BV0W83Y5SCIATzXnvM+mZ2zkDQO3iMf1vocRjCAalxPVmv6T7zYfW9mCcFBRtzfQ434
	 NAhzWJ0Z3jq+9LB2Ec3uQYGoKCPN6weCCM84Se/q2KFWm5k+tWshamwAFDtv8oV3ctpVa
	 UzJNaCDq6JwJjmqAKke2Uq93Fuyd2lfRiOvCyKD5UkZ+Z+p6TAiK+rUrqaTAylySkyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5wNJJzk3hTiNr6RLY2D3wmDAEcehs+iUFvfGtxABCR4=;
	b=eC+mQoe9Vs/K3dIsu1x8R9bUQmNY4hNBJSRPrfUpwARktzghm8R5ZUAnPjpwkydgKVZm
	 fmT3wblAE/4vNCDGJFHhd3SCUROItfW88HN69Xvzaib2NZvpl3x72iB8AniIxCB1POu62
	 qxIHsy9TKnYd8gLXZv93J/Bs0AI5tcQUMI5zPT417RNGU2f8ba9gvkjj9DKEythHyMQRd
	 fvDWSTZhjrERwbwq81gsanvXe477iTgsk2t4/sD+xUQ5FjZS+/CJn+LFMjK6qi/KIBRrI
	 1xV6xJw1zH2cSgwkG1yd2l/i7MOGEhZdR7dCBHvpiF3+TtLWNYnPbrCRN/MjTZLUtZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SDzIygvm;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A18D606A8BF
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 00:37:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A18D606A8BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SDzIygvm
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so4800355e9.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 16:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530231; x=1795135031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5wNJJzk3hTiNr6RLY2D3wmDAEcehs+iUFvfGtxABCR4=;
        b=SDzIygvmmeQpRTIoXUL0i85BGt0NConZfVphZQcxvJppqnb4I+v5ANOEPmm2W0YRhz
         6HlYIqqCIL6XZ6NLlujRNoR0XRwUjML36y2x8b1Bbc3ajeu8tWzolBiPKPI3BPet1gqL
         hPHGevUkZa/Pp+UBbZHxGzut4ARbk6rADHTs5gGXSqjGiG274QFlGtBuOo2SCUcATIF0
         PIVqJLicTtC4MA2vzB/vahIkoISlNbKv6J0pdjPwqlVzCtpiinm9a8/ZiM4hKnWGUEpZ
         8ou0GFhUb/cxDa9CMfTXTDOpo5U5WSW0+6Trp1HGoVwknHHJhCJKIyhKh2xy1+DvrQQL
         BBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530231; x=1795135031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5wNJJzk3hTiNr6RLY2D3wmDAEcehs+iUFvfGtxABCR4=;
        b=vUoBQt6SeD8YGSaC+ZXOA86z5xmgIdxnEEqDFQ1x5DcRRhitUKyPqawRNLZfoUgnnG
         RHvrnYPdf8Ys3v10TECNVJ/Iyw6mk3hk1hXhEoD6/PH6hVgh1heJAVkpCCrkgtpNIvSO
         4/3krtnnDUlwZDpXNJxuRBFeL9ARnrvh9HbbGi7UOXIeONzir6BiiuncHF12p7mRHQX9
         mD+ALnNpXCHYom/wKtUq9i9OeM9l79qtz8Cgf5OF8/QJGf76oRukTJmJGX35HY3f02V/
         kyOD7wWYiMEtdVylBFiTnKu+SDHS3X/tRDU8ZB71FW9wnBxvzBPlgsmqql+7UmoWMYZc
         by8w==
X-Forwarded-Encrypted: i=1; AL+hErEIlH2MvnAYqNJEocljd+0b/P2LyQyX6uLu0Lc4dgATngZHr8QmGXNMaIOoh1yQjFwx86OyjTUkwgkC@vger.kernel.org
X-Gm-Message-State: APuU4Z+mMED9U2iRHv9RmCiaVE0MMavY0l6/8Y27sVsdbiX6zbPJnf5d
	A8TGN03VZ2whyBZPUss2AgxifXoPpDktIedtX9OJ9OoIs55T14MywUKm
X-Gm-Gg: AYBFou1lOQ8C0vc99m084QXhCuGuLAyLRN3vZN1879v7JcUqRpy7eLuY4wKfvEXKZR/
	4A0HghzsI1bV376SWbrRdOcmEXrO9zoGBb7o5xyZBaiU+hi9SyhMd8kqce5YnH0IblHRgXf2ubb
	3XGTYaCxzNzh5G6lHIcuHX8L4IDCXWCMthpINHpQprTLnvmNplnSip6E++OSVp7MCcyVHpT4bjT
	B8sdOMr/XLXfYMDbmUOhH1C50nija60UC5uG4kxO/e7yfWBWT86GQuSi9QWPGeck/+hx3NwHWBh
	y2yR0UAKnuJBTpYB6nGqR8uiW6Gdsx4t58K4zM3mB5JPqMFgDCIqRRWaNUdYkxlPxJ9z2X3G3dl
	yDS12UdiY3BM0FKbIDbC0UwjUp5s/ZJA/T48sGvD8rpyFQQtJtRmo0WJ1eovkPunzFpcoWbZtms
	/90NpCQnNV+uGeG9AYSR+Bj4GRf9M0bBlMqD4qzMYJ/jGkhQVhH0SIIomvqUUJ+RnC/uCFNHpL4
	cFOSGt4GWLi19GMTlAt69UpArEKBn5s13zkbszCtiKq6yYWQrL1SvR9wILCgdcR78Q0jVRQu8ux
	ZoDSdkSMH5XBm/FIFvgumcqvZJx+oPkYiAlTr3ThW65y9xAulojuSWWFcsiaAQX6BY+NE6fpOjQ
	RG8+74i3smff+X5ehI+DHWJ5/ndP0jL/fHx+kDvh2WJlCNPcZU6Z8E5oOkzWnXqWh4gN2ssZovp
	1uay/ShFURhEMuE496
X-Received: by 2002:a05:600c:4e92:b0:4a1:acaa:9d4c with SMTP id 5b1f17b1804b1-4bb55a850d8mr18959695e9.25.1794530231396;
        Thu, 12 Nov 2026 16:37:11 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e1f9e5asm102305995e9.0.2026.11.12.16.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:37:10 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 24/24] ARM: dts: zte: Add ZTE ZXHN H3600 board
Date: Fri, 13 Nov 2026 00:37:10 +0000
Message-ID: <20261113003710.3666410-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <0386c1dc-5026-4c45-9679-cc6e76f58e36@lunn.ch>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-25-ghahramani.navid@gmail.com> <0386c1dc-5026-4c45-9679-cc6e76f58e36@lunn.ch>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andrew,

Andrew Lunn wrote:
> You have phy-mode == gmii. Such a PHY does not need a SERDES. We need
> a better understanding of what is actually used here.

Agreed. gmii is just what my driver has always used, I never measured
it. I answered in more detail in the PHY thread, 16/24. I still have to
find out what the link really is and will do that before I send the
networking patches again.

Best regards,
Navid
