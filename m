Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521285;
	b=KmpiA5tBOCPCE0rX5VK5pwgJUVrySPk3ErAMB2AaHpyL2lTx4E05NAZ6KK2mtkgRcs5o
	 +0av4cP14jGPNCcagq28FW+okXDgFAqD9XWXMNHJZ6QL4hJOvTI+zFYQoOeO6eSdYUKeb
	 VJtI1uxQlwMsjw05H7Z34TDfSzCgZ70siMXs9OxI8L4Dy7TRW5nN841QrHCUTErp9x29W
	 LRI4KswCF0SyJ+g0ElAht/+9unDzBMT9eiVTWtFByeU2c8P4P5O2McnQqwWPcqj7FKM4g
	 JFRUOm7OzVSD6Ave2pYQsXU24UVPDYVc9S92HFVu1pgJ1dA8B0AwepGXcumr3P6u/kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521285;
	h=DMARC-Filter:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ZfR/6lnsUE/pnRQi/PbCLWIsXUsmgZSZZiyw7HHwysA=;
	b=PCPHSIGrk+WTxJdDpiayy/NZ6N/ljp2kdq2Nv/OPBoeXsMh919uM/r3JHuCk9n1BnMWT
	 2NnQ81xEPZhTWzA/3rvVlirJ9quzH3Gc3F4WqFlnJzRne7isZWF/GYBXIp0aOa8ydpvQS
	 UyM65rW36VAlahuI3itsohs17pji2KjvTlQZ9WVD0sJfiDLXsNpeq5w6+F2kV+ZODZl5w
	 RzBxnfmbZwqP0zBmJz2QeEumbpS3JcoZIsndWw6RK0MEqfsimE2fiRkxnFd8LbSuljiTl
	 3NLVG4qnegdFo8j4a+5h5KaoJW9wuI2qozI1dWqOdWCpbCMHty2LsmX8bObtJ4sR2sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=79k3dNqo;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91265606A327
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 11:54:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91265606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=79k3dNqo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:In-Reply-To:References:Subject:From:
	Reply-To:Content-ID:Content-Description;
	bh=ZfR/6lnsUE/pnRQi/PbCLWIsXUsmgZSZZiyw7HHwysA=; t=1795521284; x=1796730884; 
	b=79k3dNqo102LFk8pK61THrTFr2ofWfd6mgYCTy/iTFxdD9ENwDVXLezkbOOwEGcXjIShMPfNH0C
	wjx15BYnGiV4dJLFGdYmGNN+iAG09mCjCqFFr+SE9oWyScN1vziFUvEwl+dUwok3ahi85QW+X4nMt
	z7ItO4tNLZ/ywj13iVFXB06ynnKRUFv+Y56lD7VVJu7Z1ze3bJC4G+Pp+pqIvcOErmiYI0+p6Mmsc
	CnTd9lX2589Io2TzhUm+UHchnFlfOlvHlcKlsDrUe4csk/NXdDv6DGFFPFgVnh7YAVFGIFarg4QTX
	007HMvsH2lSEl33/OCsXTvNhEEiMrPaw7/HQ==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Tue, 24 Nov 2026 12:54:18 +0100
Subject: [PATCH 2/2] ARM: dts: st: stm32mp15xx-dhsom: fix bridge reset
 polarity
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
Message-Id: <20261124-tc3-reset-v1-2-a5d27fe4b5de@kemnade.info>
References: <20261124-tc3-reset-v1-0-a5d27fe4b5de@kemnade.info>
In-Reply-To: <20261124-tc3-reset-v1-0-a5d27fe4b5de@kemnade.info>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christoph Niedermaier <cniedermaier@dh-electronics.com>, 
 Marek Vasut <marex@nabladev.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 kernel@dh-electronics.com, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.17-dev-1b309
X-Developer-Signature: v=1; a=openpgp-sha256; l=987; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=GLBUHsrqFLUlRWZt8GXXwr1nDsTd3sjuIa8AxQT8QUI=;
 b=owEBbQKS/ZANAwAKAYRhRfpAKNzxAcsmYgBrBXr1CRJh/k3SF9zhnM67HN2W2PpCGKtwoj8rs
 m16MvjwmDqJAjMEAAEKAB0WIQTY6xCZL0TEE1XHfFiEYUX6QCjc8QUCawV69QAKCRCEYUX6QCjc
 8ca2D/oDzZqBbg9Q6EtTMYB9aOdp8ZoNadLZJTOgTpzJyL2LzN9+ByFR/egZ410Qg7AVj2SB56P
 hZaJ+H/QyPO2Dx5opg154a4TR94MtYM2Q/1FpSRV68fE1HmNPVApLgZR6GM8BsB0wGd4a0O9nd9
 fm1cdr+PmQU42qZXM9Z5fs9vvqyNj+bXFycpwr5Rq3EBGdhRRf6UMq+jjnXrKtN+O2UekTpC2cM
 Epo+k5CGn6CLhbuMqUCsTizWdxBkpfHBxEVpcyO1/DuPeyxv/H+aH2VwuHHYYeoFCSWs0+FAcmg
 5DOB8uU01m7RdkQIbJjm6HhO61RR7e6F5tSa2TNOzbwxCCjWhzp1KXXe09VoIKjE0xYfNcfy2WZ
 32ZoKTCABmz7Yh3scDhhB+LIrEX4r6DfSRIMxCzF7ztjkalnufW7nxCfvLdeVKil7TAWweKzoZP
 py+vB95lER6nvtaZS6Ie4N3nuTccqCqAU9utFpW1MhibUlFNq4j4fGQyQrl96iInIds2t0GsD6k
 BI+NNo1R0cToaZSjgXerjfDefiH4Dc2Qhp6QVmf0P6dHswP8VE1lj+xm+QbcXg76BHs666QdzKD
 TI4Q4zEpf4PR1ddQCM43HmVM5GhWvPkVcZ5/y+nR4KwbyusEBicryFiVy/LjSmN3WcvkRNxNqXc
 IQDAUPDi3mgPpUw==
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

Reset is active low. It is apparently set to active high to work around
a driver bug but not to indicate an additional inverter in the signal
path. Correcly describe the hardware.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/st/stm32mp15xx-dhsom-overlay-panel-dsi-rpi7inch.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhsom-overlay-panel-dsi-rpi7inch.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhsom-overlay-panel-dsi-rpi7inch.dtsi
index 518c269a1dba1..6342a6e757c12 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhsom-overlay-panel-dsi-rpi7inch.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhsom-overlay-panel-dsi-rpi7inch.dtsi
@@ -35,7 +35,7 @@ &dsi {
 	bridge@0 {
 		compatible = "toshiba,tc358762";
 		reg = <0>;
-		reset-gpios = <&attiny 0 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&attiny 0 GPIO_ACTIVE_LOW>;
 		vddc-supply = <&attiny>;
 		status = "okay";
 

-- 
2.47.3

