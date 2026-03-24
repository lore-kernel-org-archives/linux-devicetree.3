Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF9339DBE3;
	Tue, 24 Mar 2026 16:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774370741; cv=none; b=DizEYFQ7BcIteQZXyLKF6R8gQkBRxghukboSmHP9ZaMscmXonsC4YBZT6M5ZDUgwwdW+EfkHzIvhunnrPT9sjS1TBm4larA6FAoqnTR+ghLYM+8Zx1vacAwHekNqFoPQqj8V6aeur9iWfIevhY4x6LU99yqAzbs6TXsAk54sGSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774370741; c=relaxed/simple;
	bh=cQi19jtcU6Iyu4N30APA+fwr0ftmfyIl1qZTx9t0OjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aNzpOO4ddKc7IDMToy8Eh1k3JMJQhSdQrLUDWgSk+wDiMiRjkkgKbt3abagFmK0ybRlmqvCphr0X6XBCGWulaVOo3ZDZoTSHVJCK7V8ps6dx8fUclOaLj6fN9eg+dspM7CGN+O1AQEIYOXjWMZenwOsU9RoaHqPVvj7cEsO/n7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=ZUgozKg+; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="ZUgozKg+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=ws8gnjoF4i5AoJRWVzVh7quYkJpi5YBeM5lgd/FTWtM=; b=ZUgozKg+7/Ozw0MZAj14bc2Mud
	RF250v2ZZZ/QL2u7ThWUQe8+i8EmqBpQtFcZaIcv/t/abW96jZMbv/NmXcD1jxvhABmY3RtJCbUcU
	9vj5ZzFoTeQRHrHpTw0vVnwXDR0qQRgJy80AWAqtxytOtoFueLqKncqSIoaxFdpaiTnj9Gph5GjOr
	SwcGzRj6LWnpudS/GZp9si6m4cT1TZJhmrrXAGDTTLUY0NcPz98xGlAUACP7zOEqJ1LKroru4uPmR
	G3Zsj3oE5DdSYUjsgRqYCCH7fmnYLS/+H4oDGM9GsOFN6sgS/JkCC/lpKkgh07wf0twJ/bAFkaTRx
	JddF3CJA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shawn.lin@rock-chips.com,
	Fabio Estevam <festevam@nabladev.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/4] dt-bindings: soc: rockchip: grf: Add RV1103B compatibles
Date: Tue, 24 Mar 2026 17:45:30 +0100
Message-ID: <177437057319.780275.6126712599317976655.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260313131058.708361-1-festevam@gmail.com>
References: <20260313131058.708361-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 13 Mar 2026 10:10:55 -0300, Fabio Estevam wrote:
> Add the PMU GRF and IOC compatible strings for the RV1103B SoC.
> 
> 

Applied, thanks!

[1/4] dt-bindings: soc: rockchip: grf: Add RV1103B compatibles
      commit: 25c2721f18ff97226a6561aedc9f8f76a51fe2e8
[2/4] ARM: dts: rockchip: Add support for RV1103B
      commit: b4dc241c68f5a2a6e312259bf23885d693f91960
[3/4] dt-bindings: arm: rockchip: Add Omega4 Evaluation board
      commit: 2ea01fbb1d29d2349aa489eb884938898f10a84d
[4/4] ARM: dts: rockchip: Add Onion Omega4 Evaluation Board
      commit: 683192d7d5b47e89d920867f7c6997d2c0d1a0ad

Now that the adapted mmc binding went in, this is also ready.

I've reordered some properties according to documented preference
= largely { compatible, reg, [alphabetical], status }

And dropped the watchdog node for now.

Please resubmit that one, once the watchdog compatible went
into the watchdog tree (and drop the status=disabled from
the wdt node, as the watchdog is not dependent on supplies
from the board dts)


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
