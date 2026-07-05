Received: from out203-205-221-233.mail.qq.com (out203-205-221-233.mail.qq.com [203.205.221.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D403254BB;
	Sun,  5 Jul 2026 13:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783259448; cv=none; b=eeU0fZbW6zfrJHw4/N36uiUuTCowqTavMfCHcZKm9eslGboIAo11T3I4bA8JNBNaV71RpATlYQObBzS+F0Zf7eEMfVZt6IWZQS1876MgAHPT3HSJVujI3XcRUJwBGUQFRmBMExCWCwVIf4KH9hTcLhLVmtxrwfk/dcSlCJ1lR1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783259448; c=relaxed/simple;
	bh=sc/y5hMpPdkQIA2/jMHG+nVzAbXShOG1KaSAGolVbDw=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=QwNDfe0MP0zVvjryOzzsHXEEXNx9atdXITjat+ImIhqnaZ2FDITb9m75KqMmIjvlFVUMSrzoXJzd2lcJmjg/fqAEVl3HmkTE/6hUMTdm4u6ok19a1XCLJbS+USInudSavegk1AwgJtsOhmxo6UWdM1UNk3D3F0yBOeTux3VrdzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=pUGtZFZK; arc=none smtp.client-ip=203.205.221.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="pUGtZFZK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1783259444; bh=ptgJWZIsX40jO6cPpRKjQdeEPxbPXOrzES3xheV45dk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=pUGtZFZKQqvSwsZUjz6BNbqy8P3MvSlkAumXiAOXKwYyNYnOcs4OkgytUePqRoEwl
	 HU2ywkpuJIprZ9YHKtekZjxKu0mUmH+eiVNF0Aqkv75GMjuhg+7ZpEFSsnfzM4M+dF
	 DA4m7RiOZcP3IumOgrBygDqE/EQZ+SU2qBRWgErg=
Received: from AERO17.taila7786d.ts.net ([112.43.117.189])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id CA0A8E0E; Sun, 05 Jul 2026 21:50:32 +0800
X-QQ-mid: xmsmtpt1783259437t28oiiu80
Message-ID: <tencent_B1442A024A02EFD704ECC0F098F663588209@qq.com>
X-QQ-XMAILINFO: NuGpsYW8pZ+AqoI3ue2b7Jwtso/wx9Ppt3m474UdRjBsrXBJPuOaiOiqvRULXY
	 lTJcdGr+1LVkuqVBzlpvUVs/v17ZU84o3DueR5OSElbSXP/64fy/XK2fQl0gP8/Zcv9zH4LZ3iCS
	 VJMeWTwl3iRLZbSWwlR+lvXCy7wvFh8bZab5yoGfRaH42SYjCFPmDsLa18zMXH0f0PJZnE57HB4G
	 hDHf4fS/Zlho6SZgGdnuFe+5AoXPNmKXXlwKIVUANUvqblUGgZXEW3uL4wKXJUzji6oGrwuaZveC
	 IAZm2sWK3CZpOfMEKp7w7/jupqbcsnftLAz+gEDGiW8HOs02r7Tm54qSWyb92qaCV7vl6mdIo5nj
	 UWDvir79a2psorJV1Nx7Rt8ORpx0k0BKFTCOhvX29830AkJVdfBcDiTY5j3Ovjx5ChByH/zMAbP+
	 0JvbCVcDI69WCexbxjsHSLk0AKtzk9JC3ZOgddooGMKY8Lm/c8H6kcvlmP1GfZkN/5cf+HOtTGLP
	 V1nE1SuVDpQ04PXLiez+Etz4KRguKta/ShtUQ6v8naH+CHwf20b5k2eIwN3iMmmy4wJUrO3JlGxX
	 MeMgRIGLQ9rcuv6R9eIGiykU2hJMabmC0MvBfrBiYyNLkBtMwM+Asu3ufMDveV7Q2hjYGgpUGZ4r
	 zC3WfLgQd8NIUMqowA/gJCiZJmEavebp3NpG19xU5QKxV9WY32bN1ivQAEs8h11tHynl2ieaVwrF
	 /WiLZHQ98QR0/7I+wPbd2Dhwf/wdhFkXr3jfOjknSrH1Xn873UZ5UOFYwYtM8eW/vcJgHfDpfWzF
	 wmjcPGuj6NUq5/GqcAMhND0bTPZKKemgohLBywzHNdWN96mixuGV15QIJ/wc7hPeKXNGCaPbycJ7
	 pkcOka3Qbcinc4yaKQzJ6o3bV7COQWseYsIdkS21Ibp/CBL/2tWxbEhdkWrksaffRUipU5m9YvU9
	 IgPF0FUiOqMbIBFSVWhooudmCD0idsJWRY9G7clenT0QIQHPijcZNrF1ufIXk1QsmTQ5cQn6J3k/
	 KFr9TKFM80Rh/+t8rY
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: LemonFan-maker <2254650260@qq.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Add EmbedFire LubanCat 4 board
Date: Sun,  5 Jul 2026 21:50:13 +0800
X-OQ-MSGID: <20260705135014.1004166-2-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260705135014.1004166-1-2254650260@qq.com>
References: <20260705135014.1004166-1-2254650260@qq.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LubanCat 4 is a single board computer based on the Rockchip
RK3588S SoC.

Specification:
- Rockchip RK3588S
- 4/8/16GB LPDDR4X
- 32/64/128GB eMMC 5.1
- microSD slot
- HDMI 2.1 Type-A
- Gigabit Ethernet (JLSemi JL21xx PHY)
- Mini PCIe (PCIe 2.0 x1)
- USB-C (with FUSB302 typec controller)
- USB 3.0 Type-A x1
- USB 2.0 Type-A x2
- 3.5mm audio jack (ES8388 codec)
- HYM8563 RTC
- PWM fan header
- 40-pin GPIO header

Signed-off-by: LemonFan-maker <2254650260@qq.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index aa66a15be233..44b005bc709a 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -191,6 +191,11 @@ properties:
           - const: embedfire,lubancat-2
           - const: rockchip,rk3568
 
+      - description: EmbedFire LubanCat 4
+        items:
+          - const: embedfire,lubancat-4
+          - const: rockchip,rk3588s
+
       - description: Engicam PX30.Core C.TOUCH 2.0
         items:
           - const: engicam,px30-core-ctouch2
-- 
2.55.0

