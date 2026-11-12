Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794486248;
	b=EvEzecBPwDG4zENrHBd9tMtIshLJEYjZqIQl0pfQxZkYxQX+GLtioPRHc6d30PC1e6Bs
	 dqPxi+7odui/joLI5KY7U41jku8Gjmrg6/G/roY8H9VUIDNWgRH3a9gox7ZVkS124yKLZ
	 L9767CgVH7i6Vxw4FGrAUN/QMtag+fOYA2HOE6iAYk5XofB6bkt3so8KOSTYLy/Bvsqiw
	 j8sCW1KBpB8wx6cg4Xj+7PUrMxmZXCbRQp1el7jJmzrMfqyEyrBwtsd4J2jaL/0BeI2qI
	 KzBY3TV0rjvumoipnokY9l9DkFiVjdHHgECyk0RIqHzxmX9zaKJPIoWJahM2N0Qhs0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=6jjbM3FM0vEh41D6tTAiBxzcbzcUKnDu2QUW56tX9Ug=;
	b=u20E2mGSq0SBWHM1zfDbFsGv4Vbjgv+jq0/x36GC7QHdpYirjHZ4+z1dda2cvGy6toFl
	 cZq8gn/3vac2J969AgjDZO8e3SALene3eCeMCo1SMK3WQf0N8NSV+S1R7Kcp0xQHt5ox9
	 G+1gxokcPq4NuClyNsbW/6VPzFa7AdU8rnGuYykCZOAWHzMEyQZ38MLtxlOPyDvXtZ2wv
	 MBxaCWMijM9N2P6q+sDIC9XYGGuybOkIEJ/D2ebkelVGNKBKq64F/YqJ2OtsDq5zoIVbv
	 y7+5Ui7dR3aamrM4tBDIRrpGTi1N0wd1zm+PjclpAf8REY9gDb9fYjf4mhJxbS72TIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=02Ee+baK;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C64C606A32A
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 12:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C64C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=02Ee+baK
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so6587494a12.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794486247; x=1795091047; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6jjbM3FM0vEh41D6tTAiBxzcbzcUKnDu2QUW56tX9Ug=;
        b=02Ee+baK1h1XUD6WO/nascEjWrwiuWrZ9E9j2MFQcrZI5K14rA7YSabQFZqCFSvC3N
         ikyw7KKQgOI1ld3nNdFDTDd5OmzNRUttM1oIZghE0ToKxHlOE17aLobyJRitiIoejqNG
         SX3XX8oHBl/GOFBVpjPgVTxjDbSle/WjdqOh3U8OGGI/2vZzio5/iVz5eAVVsJpDRnvM
         eyx92Iw2Ybw9Da1/5/WmCEY9yES7r+L+75EybPosobSiFFqEC9MOqcLtX8lqUVwiDxVi
         4V//JpLYWXeWE0e02nucAt510hEbI43eS7S3Xlwp/s0W1fjuv1UYI6ioe2Sj6ehZ70DD
         nZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794486247; x=1795091047;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6jjbM3FM0vEh41D6tTAiBxzcbzcUKnDu2QUW56tX9Ug=;
        b=0+n/R+qmY7RASYP5/v8tRA9M388CuG4SnNZjFkFcHAnB/c5Cfzd6tgUgMlVYEYwaMU
         kQ/HvOiWFzFJZG+KpgMNFhZMjq38ZSv8mnWVG21kn4zrH4ALMEK56VIxBiqVKeXgVdUk
         /kD02IgWzOfnbywh0BT1sdSIDYG6yyVhmyDC1y9T/2gTyfl0NDYuroPLQWOMCqPvMltk
         u19rdwGWZsimiWoq+cmpzmpnOzc8xgecSiHwnDMWSztacaBxNIM8Slg+8r5kKKaRiPPB
         i2SSB8/4b1qf7uWax0dCCwS9xHTBGGUFMwiIdA4ndkc+f24OhrDS/xavjc9J8Fq5venX
         vPZQ==
X-Forwarded-Encrypted: i=1; AL+hErGGaE77VFd+fhsIO9mWx0fDk6DYxHuUNtwB3E9ftz8jhNux+qXKutInaGOUvxTwVi9+V18r2TSl0Xfd@vger.kernel.org
X-Gm-Message-State: APuU4Z/d/LtHvg+Cwtl1DweakxnuAB3oKz5JjlJ/MYvIaf8v0pl3KpVH
	Zz0gHRm4XUmjcZUKaGx2AVpnco+CMqU0JCRQQlSMSavaU2RbKe8gJJpb
X-Gm-Gg: AYBFou3nlLVEHBErU9LRBCktXrraoDGjFKeYQPUpzf6m/cC1Q9DGu21EVUqN/JZtODC
	0I+Y5gDYf+QwcNFbxJK1szZJAUBPObfKTKksE67U5KXo7MM1nv2/3Lc78ClSjZlx5cFTEan/CMQ
	10bmJ4uWK+aaBOhkWFKZKtH7NW6rdYE18rJdo/v6rBFjPKlaDCP4LalET089omcCKK6IYII+ojW
	+Jx+bVxjKxXZSpoZbT2KwausbrrJNI2pb6mEZr/gQMa6j2O6FeM8AQedNjAk00DWEmdj+FJImXW
	tRemidF9YDwweSuku1UK45HZ+ZLpA4kYBkbi3LOUDNwjBiZTuXa3gI4n2Mc8JuFdQ7i7XydeVIN
	CYeB+C7F1dob66Wo8N8gf1wGYLD4N6A9GvJPeZ1T6co9vLsFejKlqrsZcPEuDt/uQpyMNYo/y5C
	nguK4M0CYX0TJhT0CjRntX8d47E9NBdq9Y35WIqF/80tOyJw7u3me83+uVz64+OmGCmlkStXdYL
	dDOHRNBSuVhD5AurRsxmccbNVAWTOvm5+WldUImOTXMkavzMuVYv2I36XV7JSY/9mHKutdlOGVL
	AQx495rj5hyYdiPBk4AU+2fSNhCnaw31JFPR03f7
X-Received: by 2002:aa7:da59:0:b0:6b3:b10c:40f9 with SMTP id 4fb4d7f45d1cf-6b77770232emr3279335a12.31.1794486246730;
        Thu, 12 Nov 2026 04:24:06 -0800 (PST)
Received: from crispy-cucumber.local ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b77918d094sm1835931a12.26.2026.11.12.04.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:24:06 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH 0/2] arm64: dts: qcom: sc7180: enable GPI DMA
Date: Thu, 12 Nov 2026 14:23:21 +0200
Message-Id: <20261112-sc7180-gpi-dma-v1-0-2a8eceb49563@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5EQBCF4atIrVWiSTSuIhatulCTDNLFZBJxd
 423+xbvP0A5CCs0yQGBf6KyzBEmTYAmN4+M4qMhz/LSxKGSNVWG4yrovw6dtXVZ+JoNEcTTGni
 Q/xNsu9e69x+m7a7AeV78i3zncgAAAA==
X-Change-ID: 20261111-sc7180-gpi-dma-a77963d9e1cc
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Erikas Bitovtas <xerikasxx@gmail.com>, Vitalii Skorkin <nikroksm@mail.ru>
X-Mailer: b4 0.15.2

Enable GPI DMA controller for SC7180 SoC. This can be used to
make access to I2C, SPI and UART peripherals faster.

Tested on Samsung Galaxy A72 on an I2C peripheral, in particular the
Samsung S3NRN4V NFC module located in i2c0 0x27. The peripheral driver
is not upstream yet, submission can be found here:
https://lore.kernel.org/all/20260811220135.472380-1-jorijnvdgraaf@catcrafts.net/

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
Erikas Bitovtas (1):
      dt-bindings: dma: qcom-gpi: add SC7180 GPI DMA

Vitalii Skorkin (1):
      arm64: dts: qcom: sc7180: Add GPI DMA

 .../devicetree/bindings/dma/qcom,gpi.yaml          |   1 +
 arch/arm64/boot/dts/qcom/sc7180.dtsi               | 101 +++++++++++++++++++++
 2 files changed, 102 insertions(+)
---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261111-sc7180-gpi-dma-a77963d9e1cc

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>

