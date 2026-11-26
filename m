Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653434;
	b=v/Em9rwIl200Vjy0eZO5PjOZiYXt65DWBD7b/BTtZto0tX9auOHvEwYvWGa+xkiC9f5d
	 qCeWGSjIMkaX1UFTQ9EpB6jENXkpJ+uNNWPSDE+YvPxvAaSbII6y8dP8VAWVbgU81RR0c
	 PaUOBu0D1NioxjjtLq4M78jG4jvCtzsWxP4BSD8vE9wmkb2C9TWgRRYteEI3K55AVL0RE
	 HtEcWR/KJuww0ScYrdpgU7UAYEYhukatlj/hnNWAskyX9JouUJkt+qsLUvBcmHbV26oD1
	 MmFglUjovsWYpOONDT8oAprBJCD70z4g1+WG/uYVZAceKf7kMdfWZtIt1enqOQHMKaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653434;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=kzXVAyWbPKOQ0Nvu6ytm9UohTm6nO9mSl5COSJVLAXs=;
	b=m+jtHPYIsisW4wWfORV0hs4NaxDllUVHmX6BhFs6gSVTE2MI1675ERmh09xBs+CPsm9y
	 nH6tqEtZ/pUZS9unjnEbTw9XmmYlISLBB+oKEBW5m3GSFDOBN0/t6VoaH3iitZS3ya56q
	 I5RYkE7psnBT9bDZEGbBmoLB//OjQ0STiqCw63Qcy9JPn0Sa1YmLqYSvhjUDJInuVl/qd
	 TGUailTW/lFdJn8IM8SEXH8qUnsr5I7yYnbCQO5X+T4P7b0ItInbdxKdGCfA7kcr2Fdsz
	 noIcTHwny8XCnqJYcDHXRA79lK1XLcLBfztwnkCuKyizG/eio7CWozdVnkeTvx+mtKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D3vWj6++;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3AA606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D3vWj6++
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 156D61F000C6;
	Thu, 26 Nov 2026 00:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653434;
	bh=kzXVAyWbPKOQ0Nvu6ytm9UohTm6nO9mSl5COSJVLAXs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=D3vWj6++G7/X7eMsBd+yLXwvbTQ9EEg26cXrYYeFK5tfpA2i4uL2qbiqx6mC098fC
	 95WacM7+w9c8Gy0JEZQPDd4IM6rO+h8YO9jFH8Az+lZjkEH0xwaCqrWMO0+bloAycs
	 4zB/NDCvgbmuSc9bYN+ABpvvQXAnlMsgIP177Crz1pm4WNy0WS6/hU4ud6qPIvshrU
	 25d0IaDNV/TW+cqPBfprAbnRQByO+57odZsDs1LEaaGB0LGGZl2kcfZX0QKDVrIWDN
	 56PiamodQDV/SQjj8y+Mru7Oeyzw/vTygIIyDergQYWZHzt+ioJt7/LJTh0k3fHD/h
	 2Aww9XGW+RJig==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 01:37:06 +0100
Subject: [PATCH 02/20] ARM: dts: ux500: Put CPU cooling properties in a map
 node
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
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-2-791cd62d8870@kernel.org>
References: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
In-Reply-To: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

The thermal-zones schema requires cooling-maps to contain map nodes.
Place the CPU cooling association inside map0 so the thermal core can
parse the association. Found with CHECK_DTBS=1.

Fixes: b786a05f6ce4 ("ARM: dts: ux500: Update thermal zone")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-dbx5x0.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
index 967444e4a618..2682e250b23c 100644
--- a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
+++ b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
@@ -98,9 +98,11 @@ cpu-crit {
 			};
 
 			cooling-maps {
-				trip = <&cpu_alert>;
-				cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-				contribution = <100>;
+				map0 {
+					trip = <&cpu_alert>;
+					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					contribution = <100>;
+				};
 			};
 		};
 	};

-- 
2.56.1

