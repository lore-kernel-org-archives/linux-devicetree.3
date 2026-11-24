Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795558216;
	b=JP5estRSyW37alAxju0dRQEm12yosekeKilc4XAHqBi4r1rJyGb9JCFnmHsTHvHMxXI8
	 KebPJvT6veWRdJ9l2BWwl3x3ScJvnW1o859ZgB3I+SbcDZvdguPqTXizKIFYeZLg6iKt5
	 FqfbF9sk0o9hzZCTXmCDr152QF2Qa+6AIWecLVvoIg9hX3jm3tmwM75uJ3/WYZUW2xIVC
	 rJqlA44SWL0CjVxxZ1Y442ktdv/Vo6lOViEl2o0wj4/hRbLunG59s+/kAPS03seCFP7or
	 Ji5yWGuN8hgQtyZGUof5+lmHmsxIyOt/klmQkB5+88ur6CoyF1N12IokmEnrXd4btFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795558216;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+gcYIv/WfsiKdzbyK8qfJ9ewfdv+u7itvKXaxeZ+e7w=;
	b=AtSCL9mjqe1jvk7/93VWNXSt/RmtzViXqK4IFAjk8m9JPheiJ7apXYmbnyR27wLfhjAE
	 7is5N25+nPHIJSI9BaSsIBa20ab+VsGRIRTvXXghwRBLrAZSbHf4FBboCGnSdVJX2987d
	 Xlto04hHIhXZ6GqRhj41ASjPwpIrP6Z7U31GMdUPUrm7YDamPYQ3aW/lR/hW1onDxPUxg
	 lu0DfFfp98XzybBTCrR5Q1rjR05OQpl7anmkXYt4M3jEWbvPqdJitwBVFfoTpx5UGTXEj
	 HYZ60MlsxttMoXZClD6P74vUt7F8Ut/DnxklydrQvm05iIAjMjlVhkjWFyV4Ll5gJFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JsRlwf4v;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D09B606A31E;
	Tue, 24 Nov 2026 22:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JsRlwf4v
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795558215;
	b=QbzG3zC59ehoowP4QsbuaIUNW1kveqMUqNCzpmzh/jI2i2WGFaM8j5wPyq74cxcNqvEU
	 hKkj17+3ThzYkabiPPwsBDhLycb/KZqcSuQDjCduYUC+Wu1/jrz7Hk7Yf2pNgJbnJVoVz
	 EUuiCFA+ziYYS8cgpyazKr68RwVJTpV/vrduPVYIJuJMLG5vKiCX36oHgpU+qoY4pHCF2
	 jgvadVVi97HiWTnHeJcOpkAEHGOLYoVVkXxzgbtg2geVH3yBdB86lT0FsTfQwTgapfBdX
	 boLUxMugG+J1Ia2Md0o25ITY404u2NWzgEO9gfck3bDYGa7XRbiAnZMosuPLKpk8PSQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795558215;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+gcYIv/WfsiKdzbyK8qfJ9ewfdv+u7itvKXaxeZ+e7w=;
	b=EiLWboK+lQFaDU9EObSblI9RV3YDxkULAgrX3y7E0hcvz9AYoCSEDDonOaynM+saDCrT
	 /Fg2iGToi10Y7sOTNVrbzJsPGmi0o3xC6kuaBBbfZBoM16uaUPNa1GgOwU6/Uibg5yjuW
	 f//R6o5STBl8Bxlg8oAzURyLNAvTyvJOUkzdf115fFCYyHKRqfth9hM0io9+KBXENJcUG
	 NZXo5EF95/uJKgaFrcbMy1B0bPEIg0wz/+/F/AI3OJ8cde9VD7BKmwCzEin193YetB9sH
	 KHMbl1NQIt5iLWV7KpxCyjEn0CvylP3JNBbp+zzPVDixAeooXfQGlYLYHVmxC25Ophw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A6CEC1F000E0;
	Tue, 24 Nov 2026 22:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795558215;
	bh=+gcYIv/WfsiKdzbyK8qfJ9ewfdv+u7itvKXaxeZ+e7w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=JsRlwf4vi/OZu8aDLkFlhD+QvSC3n4B+ZOgfu1xAe/1z2WPQhjbOjWz2Gva+9q6MC
	 blx9Sa/4MsRSEIGMlHCvbl1HAs0+6fb2fpZBIUZMwtVTIjhxIdEU5UdMs3UpqeVN4J
	 IbK0Gk1bfbzIopc2KRXN6NYJdgFDFfG6iwE/3gijI6vBkKqbOmqQQKeOklkzYM3KwX
	 myO4imTf8EGn8pLutHiAHWVWafQuk6HbxGL8kpPYd0YoCGXXuU4pGnMAZLydg60Hud
	 7oGAwup4rfNMYqAQ8UAs/lQTy15d5/GLRQVBTQvgsuPatRBcU1McCikbqDNnldeJCL
	 f5T6sK+Z5d9eg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1BC764CBD6;
	Tue, 24 Nov 2026 22:09:57 +0000 (UTC)
From: Selvamani Rajagopal via B4 Relay <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Date: Tue, 24 Nov 2026 14:09:53 -0800
Subject: [PATCH net-next v12 05/15] net: ethernet: microchip: lan865x:
 Depends on PTP_1588_CLOCK_OPTIONAL
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
Message-Id: <20261124-s2500-mac-phy-support-v12-5-3575855d99f9@onsemi.com>
References: <20261124-s2500-mac-phy-support-v12-0-3575855d99f9@onsemi.com>
In-Reply-To: <20261124-s2500-mac-phy-support-v12-0-3575855d99f9@onsemi.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, 
 Selva Rajagopal <selvamani.rajagopal@onsemi.com>, 
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Eric Dumazet <edumazet@kernel.org>, 
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>, 
 Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 Jerry Ray <jerry.ray@microchip.com>, 
 Ciprian Regus <ciprian.regus@analog.com>, 
 Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795558193; l=1026;
 i=Selvamani.Rajagopal@onsemi.com; s=20260531; h=from:subject:message-id;
 bh=RQxAdojvFbC2z0bmjWTse0lgoK2TJf6A/qXGzrGcCkA=;
 b=p0NKz7k9K6K4RSXzwPHx8lBfqGHGKsKhxiP8WhroW9Y3rXW8Qz4qXe1Udj25+TZ0rEH0LK+f/
 vkffmfPiLUiBtXcP0eAoshVkwHr32QoDj8U86dfNb6mANJh2zIup636
X-Developer-Key: i=Selvamani.Rajagopal@onsemi.com; a=ed25519;
 pk=5QRdM0HS/LGWWcUZZ9hVfZ+qbPQGZCumcTXOiN7Fyug=
X-Endpoint-Received: by B4 Relay for
 Selvamani.Rajagopal@onsemi.com/20260531 with auth_id=803
X-Original-From: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
Reply-To: Selvamani.Rajagopal@onsemi.com
Content-Transfer-Encoding: 7bit

From: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

Add the PTP_1588_CLOCK_OPTIONAL dependency to LAN865X. A following
patch makes OA_TC6 depend on it, but "select" ignores that, so
LAN865X built in with PTP_1588_CLOCK=m would link-fail on
ptp_clock_register().

Signed-off-by: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

---
changes in v12
  - No change
changes in v11
  - Moved the vendor changes into its own patch.
  - New patch in v11.
---
 drivers/net/ethernet/microchip/lan865x/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/microchip/lan865x/Kconfig b/drivers/net/ethernet/microchip/lan865x/Kconfig
index 7f2a4e7e1915..342172cb8837 100644
--- a/drivers/net/ethernet/microchip/lan865x/Kconfig
+++ b/drivers/net/ethernet/microchip/lan865x/Kconfig
@@ -8,6 +8,7 @@ if NET_VENDOR_MICROCHIP
 config LAN865X
 	tristate "LAN865x support"
 	depends on SPI
+	depends on PTP_1588_CLOCK_OPTIONAL
 	select OA_TC6
 	help
 	  Support for the Microchip LAN8650/1 Rev.B0/B1 MACPHY Ethernet chip. It

-- 
2.43.0


