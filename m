Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795702228;
	b=vlDTZGAktPU+78WdDYe7K433iTo+E2XC356eeRa/uZ6v3JZqa9EUjKXb5rA7l9wQs0xP
	 rttrVCXSG2xHzOY/NgdYdsKx6rZGGR4tynLUH7hAIdSwazFGvdehRNnxdSNrey4IEzzdH
	 GhrHuwhIRd9oDdF0QPXEJKyNazP7ekQ3EQXntd8eUEZAx9wvvjUaXM/aO+P6ScM5ImoE+
	 0wPxm2pBJrrY+9MUj++BYok2mKfyA7fGfqfvu07J7/7MzSKRdRTyjV2MsQh6og1WH/WNU
	 3VTUUWDI/zk+IVKn2TlxwYYxAN1O08vYul8DWv7w0JWBmKf6O0M/pIv6Te7+T+pLrSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702228;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LnToH+VDSW/UE7qu5+Ee+lqVWVHx7RyNd7qITUAZXJA=;
	b=5SeMDVtRtnY6LfgjdivzpdWUXtfGopKiMllz0Xj1nTisHjOTNqEMjEHiDM3oivJkuyn2
	 oe8Ux4acoeQ/hn9TE8TY+ntbkwUPeIiEcMgnT9vA1mkquGFy877uCahEfpMzGCFCphGjE
	 mU4rRPba8TSifQuhYcZO8rRNPewe/PwnMQj1WrrHpII9fjq+W0JLQ8kcdXMKALYocSgw4
	 hKGkb8SYf/tUWAa4meJb7kZrEAdWvGqSSgRluXTtHzqffdwjorEhIYAiBXxvaM7s01aQu
	 QnQVAfeGmV8MvufFJhRSbn3dZ1ot5jLT4bebbG6BQltiBxcWwqhO1+Gb/bdIhVmKyUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ctD65HiJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6976E606A33F;
	Thu, 26 Nov 2026 14:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ctD65HiJ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795702228;
	b=UcmrJRxo0KBFalr3cv0Q8u7Bo5/gU602FJQ42uN1xv+iP2ioFPOJvsx8ZxmT8TI9zZWN
	 GYe6B28ZE3oi2PaXoLRdLfydTJOcfaBTnkgabheJd68CuO0AlbJ9jGp6md1mfR0W4O5cb
	 hmRRjK1Pzxq05sKVev5cxmikofouhsRivcOBVpvRPRie8WsxndOjYEwXAjSR9LEfCoxnd
	 IOvMLT+Q8HpnFOve3yWhAYpV0WNK2YUYw52RxtbJsRGWvFjll47SN2Uq8AhCI0pD9QHJw
	 AAowISg4dOU4LpgGFXplVasHZGyeQkkMx0MeMCtMOypPYpv3xirTgWbRgEPQdrtT0qA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795702228;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LnToH+VDSW/UE7qu5+Ee+lqVWVHx7RyNd7qITUAZXJA=;
	b=w4s5xyix/TEO11w4wqfOx7N7ui5FBBI5QH4ZQT+bEf4bMJuep3rs3UpNQsCnBMgro5zf
	 4LZLuTqqLLvg+LQcB/ntx64owXx4z9beRXXNN/9U3Y0H1pcEK9d1EHJE/1hO1ZR1fQJ4Z
	 8umekFeZLj78JAUCWZWlJq4p+vl+wGnU1NwUAw2pr0QjBUDXxQSfPQKgUJqOnySirj0MV
	 m0vRjjsokPy0ImB7mTHIl8ivsgO4/7noiEl0jYRXHAra0cltEtWPA1tQPqooBzaCD3eHf
	 XrJ6A71eMG2DcBL1R9I4oSJE8ImfTg5MVMIdlDLKEgRjBZFXJXdiUy3D/efyTjG0kyw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 311F41F000C4;
	Thu, 26 Nov 2026 14:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795702227;
	bh=LnToH+VDSW/UE7qu5+Ee+lqVWVHx7RyNd7qITUAZXJA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ctD65HiJZgYyzUPdDs6DHFK6/+fWx8jgd+FpBvAkBjR6LNG4SHmbEKCgvSjX1EiGt
	 ZeJoqM1gsFCiZV7cy2mGd4mZ9XlK+1wWw7oGeLxUg225kocC9M+/JlVvlb/O+2MktE
	 zwilGWuijRnf5mwYx9WQ9myavhsxBhRrqZjH/SEd2b6pGnV8MnmhUBraOPskuStiSy
	 3rCoy54uRkxucM8Q3/sT9Vlio2v8QqMWBFRNozwr1fXNO0LfeDbHg7LhrMbqQHeqfQ
	 zY9RUuxo/znwejv3TkZrpHiDxH0ktuONlYF0MrC6RL0lPjonYhl5tPfZVMABC84Rze
	 nnvkEJAEN6YGQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AEFCA4D581;
	Thu, 26 Nov 2026 14:10:16 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 15:10:17 +0100
Subject: [PATCH v2 2/3] arm64: dts: qcom: sc8180x: add IMEM node
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
Message-Id: <20261126-sc8180x-dts-ipa-v2-2-e919ed1643c1@gmail.com>
References: <20261126-sc8180x-dts-ipa-v2-0-e919ed1643c1@gmail.com>
In-Reply-To: <20261126-sc8180x-dts-ipa-v2-0-e919ed1643c1@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Robert Ijtsma <robertijtsma@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795702215; l=1181;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=rDI8dY7d2yAfqJnRnUuDpYfbnBT2kMndnLO0zvD8B3Q=;
 b=jQr9IKkUH8ADF2LBEVmig2kTt3UH3oHL3CXoxmXm/oGn9xJeqYxkCt1ejIHfPOviCM74Uh3oJ
 M7M1kpwSZfUCRGyNBo8WFLDRLyNdlANNFpob4xkR1xsTEaYZI5aEwWI
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=
X-Endpoint-Received: by B4 Relay for robertijtsma@gmail.com/20261122 with
 auth_id=1604
X-Original-From: Robert Ijtsma <robertijtsma@gmail.com>
Reply-To: robertijtsma@gmail.com
Content-Transfer-Encoding: 7bit

From: Robert Ijtsma <robertijtsma@gmail.com>

Add the SC8180X IMEM SRAM node (sram@14680000) and describe the 8 KiB
IPA modem tables region (0x146bd000) as a child slice so IPA can map
it via the devicetree sram phandle.

Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index be79608b7161a0786463fe93e22798080ebba93c..7865054a3fafb85e34daa31b985e3c66f8d7e03f 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -3623,6 +3623,21 @@ spmi_bus: spmi@c440000 {
 			#interrupt-cells = <4>;
 		};
 
+		sram@14680000 {
+			compatible = "qcom,sc8180x-imem", "mmio-sram";
+			reg = <0x0 0x14680000 0x0 0x40000>;
+			ranges = <0x0 0x0 0x14680000 0x40000>;
+
+			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ipa_modem_tables: modem-tables-sram@3d000 {
+				reg = <0x3d000 0x2000>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sc8180x-smmu-500", "arm,mmu-500";
 			reg = <0 0x15000000 0 0x100000>;

-- 
2.47.3


