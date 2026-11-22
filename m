Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795387848;
	b=mFMCsn5QiZgIqas3ijUyhpNNWtWAJE2kY7Lk65m0ksIv8W/gtTT3z7bDUkwpjKTUs8Jf
	 8yq3Eq6PsLZ60s4xNJwl/49gE3xfLSh4h+9aJKmk7qpSbVQgT74HVJT5ey3kDcaWNfTde
	 ZZ2geSAlsv9In8yv0YF3lNsozk9+lvy3geVcG61wJ2+dMemo/h8jslHNLVKeGZzQP3RLC
	 WsYi0oDSrwCVwUax2aojWMcAMaAtJTwDGyLOR30erQbC8ujljOgE1FDr4UadSRovUb6sp
	 BvetdV4AaOYTdGuvT0YjIP5A0fyhOspu1uaizEQLtwQPSdskpoPoy8N4DIfCpCCVnuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795387848;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=IcX3holNlfbuwWe3ymUNcnF4pepySHThrxLBq9wtl3s=;
	b=Jl8N+ER1+HuUph7F16FbQYJ4vWA8iwu6xj91yLYELYP6K+E3+v0y4WzTVKS4ii8Zkmjl
	 5PvfVEhM2jqit4iHhcPo/8x60cnUUctPknhnzgGOFeOid2mqjL3RGtbJESFaZV5TvNFqu
	 mAFwcYJkXXvmP82iNt5F6jfJw4kEVCxeViQ0cxT9x6Qq7AJ8qEmNXWfTqcZ0mHMfFBiKf
	 6I48sC7Ob6U+1MXwPaXetgM1boB+0xjrnc+TgDQPBRS6Cy6N4zYPfZsjo676P02JvytQB
	 jT1N/DCkFCyNT9M+ch+hmSxzvmjUQwyNkXQ3HtYbilCHfpLKEMMYKMqdegJJhiSbiIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=LbPpzx2j;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85539606A6A2;
	Sun, 22 Nov 2026 22:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85539606A6A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=LbPpzx2j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=IcX3holNlfbuwWe3ymUNcnF4pepySHThrxLBq9wtl3s=; b=LbPpzx2jqb5JH5okmQ1Jw7ZMvA
	A5AWcc+1nHOMXWVRf5lA2aD9uBLp8CQff5xrM41vLOk9zF4Za3X3qoBoW4oB2AePlzyQKZ0IU9Vos
	jK6fP6uk5l5YBLoc5Z3QPAucSN2XkmEQgmo8wlL6lGGKe/SL4s9Ed3Z1VBCiGRQNAziJcTXwcY3W2
	jaO3VkuCEH672vnFfJfviNNtAefevIQfA5HEBCdFTI0XtcifhFjQPYUVB8lmzaYJeqjMJ0c2HOqo5
	YSz5W/dqNhy1TLoJd7lunMlTQUDW2W1JJopvQVE5v+EK4nbQ4zvmTb1Yf84XuDFlTz/mgt6MBbqiV
	tsHU5ucA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rockchip: Correct double space in rk3576-anbernic-rg
Date: Sun, 22 Nov 2026 23:50:25 +0100
Message-ID: <179538782468.3150822.17090825292677759861.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113185311.183045-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261113185311.183045-2-krzysztof.kozlowski@oss.qualcomm.com>
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


On Fri, 13 Nov 2026 19:53:12 +0100, Krzysztof Kozlowski wrote:
> Correct minor style issue around white-space: double space before '='.

Applied, thanks!

[1/1] arm64: dts: rockchip: Correct double space in rk3576-anbernic-rg
      commit: 009e1d975af303a3b76b3d13846788fe986fd847

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
