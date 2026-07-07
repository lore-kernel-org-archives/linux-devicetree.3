Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B7A3B7750;
	Tue,  7 Jul 2026 19:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783453488; cv=none; b=qjRSwbfrGBw/ycdVLnwRZkFZs3EOtSAK7IKY+a2+iYhnLCIMGz5z1KFx9hdbEbMQCAO7Djeyf2l5+H7j3WjBCXxtc4s2utp4OJ+LLQo8b3imcE8bEwGP2+GQrrGYI6pDpLxUlYkLYDd8UP25Z94GD5ZmZ2j0F7fgaketxtX+wqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783453488; c=relaxed/simple;
	bh=38viM6a3hCc/iajP7yiO1YbGX+K3bu8naoXVfYjfk9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a1YJyD2bGzpyzg/Qv0fBQdLxvsb/9DRcLs5T0jyDnXiuIm9VNDszig9RMu1xX/FAfMCVOy2yO2/WF1VXS03a+Mf7/6+k/I9WIvzEI+Cenh0FxthnvPcn9NrmKbOOzaA+pIChzDFuH29yGN31qBdQ/dr6Jy0OMj0TqPOBTIxsKLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=ClMWaosy; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="ClMWaosy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=jteq0TKUZAqOWEPonHZmx2eOEuuVsa36AnDrc3qvX10=; b=ClMWaosymu35Yw0mr2jf1aN/q4
	vxGySjktzAxg9jdcfWt+SH2kew9Ce6Qv+5tmEAitRE2CmThPFW2eD/MrIzh5vOPg22JDKgbeSURyw
	/kN610PVBOeDGC1u04ugy7kEnFxf4xejKQlZ/A+nxJGvX/7BngtuvnArSbtdgrjT597zGrPTsDNgA
	pwNy7YFwKcgvjPntFyNZyDDXP9IJ8+Jlo5ckO8uf0iWTjETtMcZIgG08vlpd/9iH6+ajl5CP+d0rD
	R0t61nCb8DULHs0qT6Sx6egC8TtF4Jc5UzeNIZR/yOAlUBHNxxGriKo09Av0uSDLQKs8l6kQjl96e
	gGcKTIqA==;
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
Subject: Re: [PATCH] arm64: dts: rockchip: Correct indentation
Date: Tue,  7 Jul 2026 21:44:33 +0200
Message-ID: <178345345841.664858.18334635633167983226.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706093419.273625-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706093419.273625-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 06 Jul 2026 11:34:20 +0200, Krzysztof Kozlowski wrote:
> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Correct indentation
      commit: 740134dbe3184211efdf5f92204d6061733e1aaa

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
