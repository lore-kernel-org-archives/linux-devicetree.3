Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638083;
	b=zwNKc/0EEJ8Ba6SVn9fjut6bCHDFbygNN9KCIn/Q8Ho8IkOXBUZuPgBhQNPRtV0TAP40
	 4TE6LNNnaHXxvomJ6gzRp7TMlmF9FRZVAKsu3hqoKIgt0g3vtx6WK0/RUxkmCaF/OcEs5
	 bQckdkFGHTGbIuR/Sxf+Ky6MmJ46rj1R5QiX6N8NdIqyyvialvG73MU50UmZYWF0RFBAg
	 5pwPYrAAMdSMPG+25x0Xde/iN797BIwkYJlwwR3IxrdA2y2COLnH9R6WVBU6qS5X5fpIZ
	 1C9zc/6wT1xe0ps1dEnnWSdAu6RLWjY6T6cbexMVKMAleo3oNWQkgStbsXw410Td3yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638083;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=/Nhgp+LILdcFaO4Ni0xUg2osLyux7VP/OofLw1qu7Rk=;
	b=zY53pfOf9L8Bm+dUfg5WsxmFH56Oekzcy3pX9GTMsTR2eyTwcYBOJOK5oLOnD+8rrrBh
	 5n5PvvPS58F2NxPgA4bTBC0nByA9v/wcPGefria0D8LpOukCiwFeVyR8zgm79pXCJ9hca
	 ycDYmLWqJPqT0FxZtwUdxVOijMP4Lq/RnxQu6QuTcs9TYFrjgKal1BPPFIC3xYtZ/NWYG
	 z6EKbwaMQ2lQXQmM7vmnC5hxIRvKvoBvNOFqzfwYyGgeeWplrLxdpZc1DGpTlwOMGPWA3
	 ZyhcNrHG5Ns+fq9AMb5lsavGy4gsKx98w0I8x9Cz68V1sPApCMZMXqU/gopbkcQUMdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b="R5bc/vnF";
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85432606A330;
	Wed, 25 Nov 2026 20:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85432606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=R5bc/vnF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=/Nhgp+LILdcFaO4Ni0xUg2osLyux7VP/OofLw1qu7Rk=; b=R5bc/vnF++APfp5hehLZBjqzbn
	tF+L0Fr05YpjMrIO8tXI3fiSJEtBmea1HWqCAvXIzMlO0yOQ/YJ/OOzggMgP1T7g+ZXCXoqZ69OqC
	1xvkj0H9kXcqaKrInnUEo+rfcAPZOysTw1PGYqDsuDREyYnhp30COoYSR/sKnK3lFIUR8GRPQAPac
	NDyd9EwF+Xb43jbjTrTgGi0QMew1gHqsV4BCRiM9EbmotyosIWfmKDA/yBz8lnvB0ulHP5dmdaiB+
	BfzDiQwwK2PvqNb+inRZtKe5WjphNXmYOxo5JvdfujA235Isj5vn705hcT86lGNqap42/5/UKaqJ6
	FGE7V07g==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Yashin <dmt.yashin@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/4] arm64: dts: rockchip: add Forlinx OK3568-C
Date: Wed, 25 Nov 2026 21:20:58 +0100
Message-ID: <179563805240.3885553.6111189798911467440.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119-ok3568-c-v3-0-071840643591@gmail.com>
References: <20261119-ok3568-c-v3-0-071840643591@gmail.com>
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


On Thu, 19 Nov 2026 04:29:38 +0500, Dmitry Yashin wrote:
> This series add support for Forlinx OK3568-C board based on FET3568-C SoM
> (rk3568). Patches 1-3 add .dtsi for FET3568-C and .dts for OK3568-C.
> Patch 4 adds .dtso for FIT-PCIE-SATA adapter that allows to connect
> SATA drives to the board.
> 
> Note: tested on v1.1 board. On v1.2 RTL8211F phys use dedicated
> crystal oscillator instead of 25 MHz reference clock from SoC. Patch
> should be compatible with both revisions, as in [1] solution.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: arm: rockchip: add Forlinx FET3568-C
      commit: 45935aaba59002a6e50b24ee229b94e7bae1f466
[2/4] arm64: dts: rockchip: add Forlinx FET3568-C
      commit: a673ac719a827dbf813dbfefb277b13c85999c0b
[3/4] arm64: dts: rockchip: add Forlinx OK3568-C
      commit: c5c520d606b87361d9833a06ac7929599d02816c
[4/4] arm64: dts: rockchip: add FIT-PCIE-SATA overlay
      commit: a78448b92c2e03c77d33f87505fd3976385ae9d9

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
