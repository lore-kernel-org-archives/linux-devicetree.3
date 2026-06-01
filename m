Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA49F3955F5
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 10:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780309226; cv=none; b=W5ch1NVic6M7yNDwofGpQUXbSSDBg0mspaLQ43hbGj29R3DLOPOYOz/PUnzl2y1OANfegvgE+4UOI0SUuhIR4xOoxeEeO79ytuVyMUyPDie5aqgPS6jQuMt7L7rJX4WhzodcoFRK5soyJ9fDmxPB0JIj3SiQtpwnpecsQrB4ZYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780309226; c=relaxed/simple;
	bh=GA4YbXMjtveHdd+8yDUcA9gyhW+k9Eo3bVcS+AMyWYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jyhiamCizao5XPXlVXgc+92DQYOU03/9Yvhj+JhtyZAuvnKX8xP3Cv3zP1N9kd7b+iEXdPG8enS+/vVDotpFoURGAnaXaC1TbNkavvl1csFeT3NtlDNeeJkZI/xzZbYdYYGcwJXk9k3SE1YeaMoDFwt9jh9uAs+MFvNB1QuDh+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=mMluCEb/; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="mMluCEb/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Ymdp0u8WnwkjibvzQW9yDlLGcMsLPc+DPfNnEXlgKh0=; b=mMluCEb/t9fJDBmNSQDID2jhCw
	jDc5idq8o1U4CCPA0AD8cpbe73O/uq9yXuOzBCvOZTawrYjXx5CQ2GlO+CsKo/smYVB87ELdo1VXx
	ux8yuWRx7NK5PzjfBxGzQnTTfewtyzk7NtU2EX0citzDgC7RoL+hPWrBBWf9B5z877LO69IB7X4Hj
	5LfIUq8fmhlrHuE7yNbZFoR8+9ApnSpRZp0IGyRI5K4A7v2iRHSv4ZX/w9IosT9czx3lFyofKBEKD
	nY86gGfDCkYQUrciodadbGhjKazGooqMQyNedrYE5cAfWu1+M9FavssAp31IQ2AqWSz1l6jfQGF9u
	jOk1JFcw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: rk3399-nanopi-r4s-enterprise: Fix EEPROM compatible
Date: Mon,  1 Jun 2026 12:20:03 +0200
Message-ID: <178030918399.239725.16965452923012750982.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505165244.1902-1-wens@kernel.org>
References: <20260505165244.1902-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 06 May 2026 00:52:43 +0800, Chen-Yu Tsai wrote:
> The EEPROM used on the R4S (enterprise) is the 24AA025E48T-I/OT from
> MicroChip. This is a 2-Kbit EEPROM with 16-byte page size. The latter
> half of the EEPROM is read-only, and the last 48 bits contain a globally
> unique MAC address. That is to say this is not an ordinary EEPROM.
> 
> The compatible for this type of EEPROM was introduced later that the
> board. Switch over to the correct compatible now that it is available.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: rk3399-nanopi-r4s-enterprise: Fix EEPROM compatible
      commit: ab1375e25ea3fef62a4a5a93abf5d03d67aaf99c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
