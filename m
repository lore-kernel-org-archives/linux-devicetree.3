Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F50D3C4B63;
	Sat, 25 Jul 2026 16:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784997171; cv=none; b=uGKZ74TVni6lPJtW2SZoEPVNgbCUlbEm2AjPEmspyjDimVZ/GvH6e/TZGpNktcGC05qJq82UupGhxfpJnCQhuOnBTkAwb+X7iOWF2EhwhrOoKcY6oxeRG8Rt8y2hA5yOe1Uf4PezTzPAkhiPvRgIbd9VeWawG/9BliZVOrxf9sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784997171; c=relaxed/simple;
	bh=7NbO++R0ksXQ2+dZ1oyQjNKjg1s5HaqRtBSVguV7aMs=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cbuLHP0bTMmt8kN42E1RmOnw44cb68ggQjLMiNOdPDNRQw21cYKxkYGS88RrvJzvUCBHlrR/pTnBZHTFK0VSwn6Qj53TEaqmqSZoxAYe4gRSEAMqooAN6x+4eg7fr++3iKdDNw2j39pzrv6tYUkloP8vA//ZStmfAE3VYetvWoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fHSBlDwP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fHSBlDwP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 848BE1F00A3A;
	Sat, 25 Jul 2026 16:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784997168;
	bh=qnwL1qE9Ii+6o4b3xylYjzog1iBzviBOstSmwGrUzpI=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=fHSBlDwPLejc7JEPCJUJw4FHSYmN4gZrs4RpHBUX2+7ARj9GmQQhxpcItSas6Ccv5
	 qxDsmWPlNO0HC/m3ikK3f6XObQwHsEt2e9ktQtzIgsJV5ved6KYcnzTIGCZhME/bq3
	 n2QReXwLbWCeWclPfkb40BJjxyRwJo+fZp0+sgQSG5Qzz1bCfdDHdTS4NCVsiOn+oy
	 q813qxRSHKXzDV+4Ddd+BoJ6oJyEU9qPUEiUp4RvVV3Qb/aMRNsO4ob0Vq/tzchBZH
	 PsH0OkHK3CdtFW9Q+ezOs3roHYXw74YpxBcKYdMxprNZyUJc7iQhAA/suLXzYy5HSx
	 wc0EzzrOHxJ6A==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260706101843.341339-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706101843.341339-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] ARM: dts: microchip: at91: Correct indentation
Message-Id: <178499716505.107055.13231791672359944674.b4-ty@b4>
Date: Sat, 25 Jul 2026 18:32:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Mon, 06 Jul 2026 12:18:44 +0200, Krzysztof Kozlowski wrote:
> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).

Applied, thanks!

[1/1] ARM: dts: microchip: at91: Correct indentation
      https://git.kernel.org/krzk/linux-dt/c/b364559b491ada54eefdd948606767621d2cedde

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

