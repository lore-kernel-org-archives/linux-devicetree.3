Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795387848;
	b=ITXLGeYjp5UfTzVv7z2kVkSqiEtp2vc7vmEGbVZ1tiV2Zcmk5TtmU0ywhGlbNovOxMO+
	 JYzyUoi9NzEIFlw1LfCE1aE7tQDoFl0IO/BWNFZvpSUDWJ489k4U6vvfoR3zblbj1lyxa
	 tgZO+8uyjH8G/eX4a4EzpZ3ZLUYjAZHfT/EcSkFfPnpEJY30qe6zlVd8nZcVnko4jKs6T
	 9dELAnPf9+/3mJNAUSLlN7OysKziWDAqzBDIiY71LXdArqAW3CQ1qryZ42qfR3MrEbF5l
	 0l9gdD/HbaT4+D2i/xPC+n4sHiLHpOWQ4xg8UtlTMQJ1/5Cfnfyo0ePf1Q8E+jvfHmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795387848;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=SUxK8Wbyp1z6HIwsJTKoC1poNH1fjxEFmkSe91WZgls=;
	b=xIkt+F1Jb7WHlSVws2LdbM6O0cnylTk2q5La3fw+GOqQ+bIIBEUOLNb9zx1KtYk+tSh9
	 6fBvi4XzSO92eUSNrnD/YtV14osxi/RXkhZI5+P+vCVvC+hQivnjPH3auyT/A9eP3bURB
	 RWTOkPu7h3D/1ZC6BLdzAIw2T4Ezvsw+IMlDa4+rRNLOoM5bkvSlK2E2CgshHvaWGxJWE
	 g1G9OnzfdZkd5+kP4DcKYUVWZ1zGE8mMqOtgfFxR1cWYMI9ybcJ0IHXzckvyL6hjq6nzw
	 WXolOiOA5Op9hdbYqzEVvAkO3fQww4VK7TQMzRNMnj04D4lOlCzqgXxg1/0sd66MEHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=C3vYXEET;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00CA606A688;
	Sun, 22 Nov 2026 22:50:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C00CA606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=C3vYXEET
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=SUxK8Wbyp1z6HIwsJTKoC1poNH1fjxEFmkSe91WZgls=; b=C3vYXEET62B3VwzJDoyz559Wqs
	ZvXUi7KIr4r72m48oR0ASnZSR02rvpB+PZ6Ibg1XqKYmYeSfIG5Gx4AAFgZgztQhs7agaidGGXny3
	OdtpQNboCyRjZiXZzBGplLF6ncLDpWnftmbvcFD06KT5TGYGpjCYUG15w2pbcGgGic241+5pqLymq
	Az4IGWmwqq1y2COBGQc81rwyuXpEQECmozyd1u6oibAxax7S5PRxfys4bz2WecSGb8gZjVe3mWZiU
	NLAbPVdABlfFf+ndqc+t+kRimVjQMIHEk+vgIuAlxLySjJf94r3ifXLKQnV1CbLZ7yAOxBG8rdV1j
	z+tOv/cA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Igor Velkov <iav@iav.lv>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Name the GPIO lines on Kobol Helios64
Date: Sun, 22 Nov 2026 23:50:24 +0100
Message-ID: <179538782472.3150822.5314985328388383475.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112-helios64-gpio-line-names-v1-1-2ce53756753f@iav.lv>
References: <20261112-helios64-gpio-line-names-v1-1-2ce53756753f@iav.lv>
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
Content-Transfer-Encoding: 8bit


On Thu, 12 Nov 2026 01:18:15 +0000, Igor Velkov wrote:
> Name the SoC GPIO lines after the nets on the Helios64 Rev1.2
> schematic, so that user space can find a line by name. The auto
> power-on latch (U23, an SN74LVC1G79 flip-flop), for one, has no kernel
> driver: user space sets it at shutdown through AUTO_ON_EN_D and
> AUTO_ON_EN_CLK.
> 
> A line that reaches a named net through a series resistor takes that
> net's name. The SD card lines, whose nets are not named, take the SoC
> pin function, and the two board revision straps are named after the
> schematic's "Board Revision ID" block. Lines that go only to a test
> point or are not connected stay unnamed.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Name the GPIO lines on Kobol Helios64
      commit: 4e14210ef8d7b47d1ec9dc6d6655c1fa5be18243

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
