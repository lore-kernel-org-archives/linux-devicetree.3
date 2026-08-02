Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BFC3264CE;
	Sun,  2 Aug 2026 18:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785696599; cv=none; b=JfgO6cdOBdbM4fA7XP/sy3cOE0ptz76mzzNsCE83w2Qb8GS4a6Wbk15tNUWyVLlG5t0JQ6YfIDdN/fmAulVwOnw68hs5FprPiJsPhAnymBK/YxjA6M9XHQVCiVK2X/7FXG+SvLPOdLB4HeF7st1zEmt4JQnyZ2UyXC06EpIlZcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785696599; c=relaxed/simple;
	bh=Dvb5mtFK9Rum7bt0/2q0kFwTyG4WpCdvD7ecePvvB0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jY12DO8O30g5jRM41ZTcIZyFVUEMxzGUpDAc6DnVJ8ahRLmxH46znpNSyzJPWm+bx0Pt1yskayf6bkz5Xlbzk61ZR+G3wKNH2XelwsxZyrudnS12vPAOfTk6QCIh0n/58HAGPEQaT/nGAqyjcvxqmuT80QQ1J1bIa9VL1WoYO5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=qXH0XFF7; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="qXH0XFF7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=pqx6OvTXdU0f9pU2nJLaZn6w5mtSJ6LW0/pV++t6mtY=; b=qXH0XFF7kupYbVbAa44dTR3mGv
	s6jajJK0z15KaxMFV/lnA3KbmpaV3a7B2SlLb5Vn0WfTvswg1lRZv3hWHMEe5z1hGoCTqiJZ6Ozhb
	1KXW3EgImXjKExczg00gwXTNxXXBfUqxNifQWjAv3j5NzymSXBFtCNp7rgrqX9ACEmR4QTzm/KYCa
	1ZySyqmMwn3BwWwJ8LGOCbK2yEuen0JVTWV681emNDdDpNjzTzyEe1jaKy2wWqRnK3PBgDW56W+yB
	tL99UcUQn5rdvgWV8H/DQjU7yPqPVbiz2kcywz9DsZzoRsEbBKgrYTOZ69KhdSnGnS9N5gNNtGmSA
	K34xLpvw==;
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
Subject: Re: [PATCH 1/2] ARM: dts: rockchip: Correct white-space style
Date: Sun,  2 Aug 2026 20:49:38 +0200
Message-ID: <178569657651.1403346.13086086653286299708.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260801210247.383632-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801210247.383632-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 01 Aug 2026 23:02:48 +0200, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like missing space before bracket '{'
> character or spurious space, which will be flagged by dt-check-style
> ("redundant-whitespace" warning).  No functional changes.
> 
> 

Applied, thanks!

[1/2] ARM: dts: rockchip: Correct white-space style
      commit: 1a17f391c139567e2fac6894c6b43f5978e915c8
[2/2] arm64: dts: rockchip: Correct white-space style
      commit: 49ee9e9a51b85113b741bf97d9131d0416316f04

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
