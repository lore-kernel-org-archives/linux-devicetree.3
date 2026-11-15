Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794772083;
	b=rLojAqUZYNOZAVE9271/uPlcO7plbrBMSBFzSMAnaOhzelD3EImq+nO5qo/0PHrUPx07
	 VNUvnvhSQvRfLTMcY6jdU/iwtwjya2QkBD30x9QlfpbEKI427bpPdlEQq0jg275m8t+bK
	 dTk8lqtu4XzgflOeE/0LRhmVikvebcK10Wu+E2PuZLyWCHpSZYAiPJpXJTdfF02rJltqJ
	 3S7xMC9VJu1GiV5Io6PNycobB2HlSV8RjEVteNnu8Xo2IGIzreTza46fRLQ66Vb1wqZ6k
	 yDc2P5vt7tC2E4wzoGt/CYPcXc1HDuJWqQJfve9gFX32da6Hsb6H1lH499X7jJD4zPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794772083;
	h=Received:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:
	 From:To:Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=J8wfWoRvlptTJKvGQanqlPj/1mz0o6eZhRXF9DHJe7Y=;
	b=cyDzRCbFh0MMYLnog2BTNs5tFsrsZtqWAre8f4iOm6dwDUL5KvBt/37cOrQkCV6fxVix
	 N6BgTVz9FlPvumS/k9FexOlNy4QUrxv/fSek7TvtsnI9wyEgZ6xBqPFZ6hHaXMqRhGG0H
	 mWbjEx3NyW8opFmXXmYCyLDm03ZXB+fih7d9AQubvn93zGoQfSRPEczkKhonXmeFriDBO
	 fx4335s6hkRYZb8yGixBO0JnD+e/DGB6Aifj0NiCBksRkFCoFtn7HepWTcyP8dOkKrA13
	 kx0lhRjcOWdFtw6oCwqbl+eQsGQg6jLSKgKAoWX8ynAEkewpAiUICajBMa8CneEc8OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE662606A323
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 19:48:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E601E1F000C4;
	Sun, 15 Nov 2026 19:47:58 +0000 (UTC)
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
Subject: Re: [PATCH v3 2/2] phy: rockchip: snps-pcie3: Load updated PHY
 firmware on RK3568
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Vinod Koul <vkoul@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org, 
 Samuel Holland <samuel@sholland.org>, Coia Prant <coiaprant@gmail.com>, 
 Diederik de Haas <diederik@cknow-tech.com>
In-Reply-To: <20261102015236.3844843-3-shawn.lin@rock-chips.com>
References: <20261102015236.3844843-1-shawn.lin@rock-chips.com>
 <20261102015236.3844843-3-shawn.lin@rock-chips.com>
Date: Sun, 15 Nov 2026 11:47:55 -0800
Message-Id: <179477207586.132702.13681064910468775977.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=970;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=z/N/KYzBmLjuxTwfXJmOo9VDU3z5rXYJ+jtGgfky3h0=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq+gxut/r6n3u62ciaAfiwxlRF0b6JJ70NZiftb
 LSnxtljYFWJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCavoMbgAKCRBVnxHm/pHO
 9ezLB/9RZF95g86QTd7xNdk6G43WKTX15whkytnIDCXmLFPMRLeT4K57mh7aOe8/FXyiU3JWpjg
 1rY0kOVv5tr5H/tGlS6bsLRon6IWvaS/JDPLjSzd7is/0T2kAdS03VztgC/CDyE5zxFScaKx4R3
 ssJ9B+OStoKXIIZp//fSlQeLi7V35NLEHcEbBoTc13PnL7dmAULGUnRrf4vU3MlneWSF9TEoRmn
 WewmI+sVdttKYUnwPfACf9Q6sd0BmR62e2gpP3aYwkikMIHyAbbk3FOJU0XwJVzJr/w30QT2ZIU
 iQpFEeCfMj/0yo1xErbV2pTxuWzGC1jkroOvmtnG4SB8pQt/
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-02 09:52 +0800, Shawn Lin wrote:
> The RK3568 PCIe3 PHY can load an updated firmware into its internal
> SRAM during initialization. Without it the PHY may come up with a stale
> microcode and fail to establish a stable link.
> 
> Load the firmware named by the optional firmware-name DT property during
> probe, so that it is available in the phy_init() context and is not read
> from the filesystem on every init. During initialization, clear SDRAM
> load done and bypass, wait for the SRAM to lock, map the SRAM into the
> register window, write the firmware and finally signal SDRAM load done.
> 
> The firmware is optional: when firmware-name is absent (older DTBs) or
> the file cannot be loaded, the driver keeps the behaviour unchanged and
> uses the microcode already present in the PHY.
> 
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


