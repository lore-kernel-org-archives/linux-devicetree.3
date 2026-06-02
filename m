Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216CA372056;
	Tue,  2 Jun 2026 18:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780426124; cv=none; b=hxNPHXiecxYK96MpIncAyl1d7ckWVassNAHOSwTccTyGyvR+UOOe1DzJUZo4e2ZeuDAT/g3J3XuG+SX9e0MoUHLxaS1JR/sb8Po6Uuhe2XAPNtL2KyCnMXmyWWdY/f7RdtCW2OSzZqED2aZTm5YZBiagoXSNj3cmHucHZ4najzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780426124; c=relaxed/simple;
	bh=C7jcWsCoDxMib2WPuCJeJn5VGHypERJema709z7ZOfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e4IcuGdEbV7U0KjmlU+j4n7sIWX74v5asYesmsbdyr1AC4S5JFhLudOHXeN9vVz2iXi7KAeQAdvs7J9GXHAyaE0Az8T2AWWThRHyPzgaZHNsAlpiD0MaHrT4osQywTLsujw4tSRuyCkGov4igUU2ceuiqMcSTT72O1l9XR54VhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=RtevXQnJ; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="RtevXQnJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=7t8xpC2Gxg1/a7tRUHOdz+cAWyjmba/5I1131NwRPwI=; b=RtevXQnJEupgna/t1cryNL51nL
	QE1dJsLsSaPtEpHaoKVwHDdtSNKLrInOY0dpzA5f5y0T9+brriRqSMoKyeQl9Ppa5xgWbzbMFQ7zn
	isA2qHcGnQFLiF3KJ3wCQs08TtKaM50hvDMPJ4l6duzc+tft3ZJErZnz8iUFWCJjwQ1c4zabBnQdu
	AspqR0kJgK/TiTydibe6VnsuWMC1xxXgJiAmAVRom1E8H10fr4rbJOmM1xchdGY2efwMTWcEbRt/m
	BaOfy5uAKFfyS8i/a5OJRctOFfh1afjyXW135jcMURA6cLAT0JAbju/a5PYvNHpR21KSvutrb4CFj
	OfrQVXSA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: enable button for Radxa E25
Date: Tue,  2 Jun 2026 20:48:29 +0200
Message-ID: <178042610721.614536.13908287937215191728.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260601101000.2076721-1-amadeus@jmu.edu.cn>
References: <20260601101000.2076721-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 01 Jun 2026 18:10:00 +0800, Chukun Pan wrote:
> The Radxa E25 board has an ADC button. Enable it.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: enable button for Radxa E25
      commit: dc98bd71f41db3666aa8505cc8c72d02653d2980

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
