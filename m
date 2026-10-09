Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F314E4C5E
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 17:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791568794; cv=none; b=jsAZyV/Wja8gQxNqYn5T/gw4G1UUIAGsmh4xC7x6ZrNYnVouK7BfR82EF5hLJEXLnqppzG/c14ldJuCc5sjgdY+GclfQBQ2GhVljCMtv1ZW4eRPAP9TJEB/2FIVnWFPczttogfHkGLFuDCbKfAAEKzi7Yr+tPhDbaib63wJws5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791568794; c=relaxed/simple;
	bh=rzbk2MxA3bmBuvl4Feh4G/Vzg97qanUbygWm4jUMOcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A1rwu1hdTIet3QVzEUcjwTQmQ+zvHye2G+hR80f7QhVn4NslB2VHDdNoNKDOHKa7dlLT8htCTJGuGpH9YURg7gcpLcVtwsvENYjGsN9ZTV6bM/3WdW4e6xwpQ9/TMi59WPwFsrkD0aRLOX7afU/NWsLvq6vzTGOajdSolqEJU8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T/lKRNP2; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T/lKRNP2"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2dd9cbb661bso36204795ad.3
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 10:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791568793; x=1792173593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1VT+ejyWafsXKR5vefLCF5m4HpAS0Vj6O8SOoRARlLI=;
        b=T/lKRNP2zB5JLneN6JCpCLQ+FzrJhKB4jErDB61N3v23EeuLWnox+jZZshBs7cyuxU
         XvZxk6bubtQiBV+qOCAWRe5b9OQsL4OMcqzCb9sANCcfPiJ5J31Td4SHhaFUNSwSO2PT
         zWOjaO2VGCWgKIvAgwE6iZqx5J3bW5vFBES1ekCxO/3MBYn8PR12MquFGpoyvwKHAzFq
         rftgEmQJu7haP5EDtGvonNGOaRjSvDNTiEE3Wfl0pwKBb7J4DsszeGoeMrPhEgo9SnTk
         9cR6fRxIThvkAbDzwg+JdN4m97LcGandDGbAGZn0i0DCPy0bMGOTnJxegF0f7gCS+A/K
         rAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791568793; x=1792173593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1VT+ejyWafsXKR5vefLCF5m4HpAS0Vj6O8SOoRARlLI=;
        b=UFd3hK0sReKkCSMzKylpLnYg56W9kYIEXKH6U42wDOp2bcnvfPokwEDdcVbHGuQlJI
         XcZ5NGDzCqbDbUPzQaAT2yfneJyMW2fYtavBM4ZOhzGqfJXLGYzbWK8sHGBWA4kXqEM9
         lrzrJCbtR1ieqC1Q5jqfTD5IPlhDCTS+v9LWw7tcDhx9qS927kdbaQC8+2iWUE2SKJpa
         qEsX8k37chCGkklDekM8+V4bZDDvLX69v55vJZBOAa1hM9usvon++GnBGdlXfHwf7cD5
         DU8Mhe2vfSCSgBykGE+sjTnUphESQaxHwUm+53HZHO4W5fhRIX2GiXdiNaI+7LQ+hg1t
         wUnQ==
X-Forwarded-Encrypted: i=1; AKwUvByRIjfYQPIpOC6MNOeYemRDdBuFUSoGsHjOtdd8RYBhk/Nyy7Deg7lgfl/J5r+Pbnga1zX4fB/TzI5k@vger.kernel.org
X-Gm-Message-State: AFq9FYJf29gKB05flGAu83f67H6gaRk4Eh94PPv6HbNvSqL7vgIFkxor
	k48/fBhNysW9trUkWNkvElarpyW7GqtaUs1gnD/u40Dw7hE0FOTbVX+0
X-Gm-Gg: AYBFou3cOsF58dWGQUkcSSVYqVHy0IWyNTm/FL3mRkWDFWsaYx5kgzAXfLkcdwbtdrt
	GUK2Z8GwG68syAusz+/SrJQ4Sfo/ptGoxvZ8/o/lTETjltUWrSqfwHyyUhjoyuOBTkwogLEvNsE
	aSBa99GG0YInUfGJ5r0V210Ag9lzasGm3e4U64jq/HPoKiUkkRPFQlYm7Hmxo+/N8ysjZyA/1jq
	STOeNpZ7cCHkkzn7NR8VaqXl8C9xhAgk52XOrfMl3kZtm5MEdhDPoIwQRQG0xAYwexEs2UXfgq4
	qbj6zeACEz7/0Rmj8/AGG136Ddy32z9ymeUDcXNIYuQTXUKqxYOWHbZZGW1V17xSU4+OwedcpDu
	lwgLjv+SsSR4rt0J/OA8uzqtqeM2KWd1tCZ9teWm7Bkx1lywoLpEsA/s5TzfCmJgg8VgmIJ9s00
	Eh3X2u0deauGAgvify4XwlBJYva3Gp1JQCLJLc4/eKCX3YcUGKyMspSxlEpRsWz+uJbuNxV4ksQ
	7LawTdLpwScp33+YrMdCB8org==
X-Received: by 2002:a17:902:cf08:b0:2e2:c79e:5462 with SMTP id d9443c01a7336-2e8429a5740mr24238575ad.10.1791568792691;
        Fri, 09 Oct 2026 10:59:52 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661c:1246::1d2:d1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e84219e74asm14167105ad.29.2026.10.09.10.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 10:59:51 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Frank <Frank.Sae@motor-comm.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 1/3] dt-bindings: net: motorcomm: Add YT861x PHY compatible
Date: Sat, 10 Oct 2026 01:59:30 +0800
Message-ID: <20261009175936.428256-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009175936.428256-1-mmyangfl@gmail.com>
References: <20261009175936.428256-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The YT861x GbE PHYs integrated in YT921x switches honour the
"motorcomm,auto-sleep-disabled" device property like the other
Motorcomm PHYs. Add ethernet-phy-id01e0.4281.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 Documentation/devicetree/bindings/net/motorcomm,yt8xxx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/motorcomm,yt8xxx.yaml b/Documentation/devicetree/bindings/net/motorcomm,yt8xxx.yaml
index 26688e2302ea..85d01690c856 100644
--- a/Documentation/devicetree/bindings/net/motorcomm,yt8xxx.yaml
+++ b/Documentation/devicetree/bindings/net/motorcomm,yt8xxx.yaml
@@ -15,6 +15,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - ethernet-phy-id01e0.4281
       - ethernet-phy-id4f51.e91a
       - ethernet-phy-id4f51.e91b
 
-- 
2.53.0

