Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303085;
	b=GuKaEXdeBO15A/9HsXPah+1a5vCZQOrRPN/YCri/6/693+YTUUomzvZagFFYmjYBySUA
	 yZfM+6OiNk+Pywv2f4UIKFSvNKzsO7lMpQ67Jt/GOZBCqkGfUMO7PNfvJyA2YHo5s47pB
	 PGSTnA+ddmbgEwZhpt0ug0MsxzjZllSxIMK6yx2KIU7uyiDy92c96SZIJt0bKxzYckODU
	 M/FEdQdG05/Wdx/lqAWfvXwLPELF9MNQUGspuMnJfestSGmPiN2q3N74JkK80DapgNW1g
	 N5K1iw4hTZBIv7CmXv8IfBVMzWxdWhhuN6bH8Xwy82IuBA9H8IM/nYBL2nO4MCVU+Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AbsOE3Hi6gKlewU2wMeuR/7vabb3aztdvLC1eqNs0fU=;
	b=cPRnoJNe2vvt9LJr8iPrYanpruITqOProlLxp0Id7Mr1MYjEc73nlC3EPuiWBWcjMrbi
	 b67D5ekCqGpjxpqmCNrzzhEC8M6GBj98LWr4S0eVRw91xaf80x3UDOMVKxB5M6RpbctyF
	 m6YzzSgQQTZai1Oey19tOLrSKW3fCYirLBf4+rFxSF0gSUXf3Milto5M3O3+9++GRar3e
	 NeCLby8hjE9ZTyohcoP/GfQq7EtqNvdznd891ImjrxZdXTeUkX4+fTtxcd6oh7e/FaXVK
	 bE9JXcg7SRpe0mHsIRz5s8QVhgSskMgdAu40gfyVTQCpEEJmRNXk632GQ+iDh8N4Yqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tp458LIo;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48657606C658
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 09:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48657606C658
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tp458LIo
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so1068913a91.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 01:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794303084; x=1794907884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AbsOE3Hi6gKlewU2wMeuR/7vabb3aztdvLC1eqNs0fU=;
        b=tp458LIorcr9gFqtdfQeXq+uyW3YYyMvq55fFfRNfalCtA6A10x3s5vIfDgV29Bzy2
         RgsrMj4ONyoqscAE5kLyj7s7ah9tM+xmDX7/1NoQ/jQBBfayTT0Q+a1vopKTPIpyHaRs
         nnouibvnB78hnS/Wt2JmnvrzoQXDVDOCTE4ThjtuSlYcioFJHhteMFy1bo1CEeb2N3gE
         pvZw9hTjSloLhQLOqbYdyYl13yg39xIYFCZ86l/p2ZIZVi1vYYCqYkUEX3xkG9u5Cl+H
         qo36jgENZxhvBsYId388naFXLl4lFCoRuwG9ThmmGnLMHFoA+dpqxZ48FWqWSyuYUhyO
         PTxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794303084; x=1794907884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AbsOE3Hi6gKlewU2wMeuR/7vabb3aztdvLC1eqNs0fU=;
        b=w406BeFlI2Lw4zhdQQFDQ+MwsXOgY5FKhpmX51WpxeMEOTUyzijRSs/b32ltUM6HcN
         b3/o7wvW5ruMq0H4vloZaw0VsaTpme4lQTiAyXvVyThYKoAP8vxz9/TIfgDywhH9gVDZ
         hmZGOFToWLFws2XqMnQqaMu1OYLbpY4A/S8lrs3fdend+xoFnv1PPiMwetq+tYiiVPmx
         nOktjKKNj6yiG44Y7r/rXzvd2leKQlgcYlTIUQOyIHl+nqi2WXaRmtS4xSfs3+nbFXg1
         KGZ5SrAl4K1DS3GCy2BHJFTtjO5CuNZA24wgOtvAqKUbrCwptLOTxxygIMqapJZeyD9J
         XWqg==
X-Forwarded-Encrypted: i=1; AL+hErH8ckt12Rvo/OXM4T45R3ruJSF3GSckmi2x+QF7nFX1VVfKmisob1PDYIvGlG/S9x2JYf4sq2coTizc@vger.kernel.org
X-Gm-Message-State: APuU4Z/+X57qRwebfbcyE3qZ17DFBLnyy9EKj2ju90KyyPE/QXdUjSOB
	Tx1YSyiloY+gT7VHEvcoz7GRgq4HkikFcgyM3ym9WP19pRE325DhmkGY
X-Gm-Gg: AYBFou2e5eicIkmKncvgoIkg6aHuYlEq9BHc82Q+4fkThb2pbPJGeOFxhY/voQ/ZyEj
	wDShNbNyHCRoPGJgR134JFBju0AVgzs5S4dpzZ171enm/UDqD+KjM85lZk1qApfq9ODUHBYOkAn
	9tqv1s2fZotW6dQFq3pGbsHKoSUR7bqHadn6ufff2bDyCCRJCwi6LcAyCDZIznRvyj3HHF4DMki
	mS2UxAn7GnQu5QXQ1wYgnpf/dRdmfLK9m0HIwXlVROyBCLbCMXkW3rt/+X4h3PBnkYyoZFceofk
	uuRSk+06Ik5l5IJVACr5ub29jyvtwEx2gd8j2v1TexYQz6iQrDKs9Pis1njgfjuIxBPNqFyhrUW
	YxhrrzSyOKtMd9dRi9/4/hjKkS/RHBWdU0bMCH+VM32uqT5lLiUq+18G7aIpklZmM1iAjid765F
	a66gaEShvoX3AoU4RDk10GtO7J1QOox9qHm9dwfp88fcZQqqTAKLREZ95wBzxA6+jfadIS96yJB
	RLoIP9xD/XDrFkVW8ezzLUsF1YsoA3ohHJf3zOt2ARELcWRLrnzTJJ8Z2VEsignKMY2NSUkN19A
	pUuRhzv3SHcNz4jZGpzFPgW+U2OdgUuxZwHdZkoLpEabTdXRuvM+bHL9DuHWL2Bj
X-Received: by 2002:a17:90b:5244:b0:3ac:97bc:4c98 with SMTP id 98e67ed59e1d1-3b166e3d9b7mr2046531a91.64.1794303084213;
        Tue, 10 Nov 2026 01:31:24 -0800 (PST)
Received: from fedora.lan (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16913b050sm1115979a91.4.2026.11.10.01.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:31:23 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: andrew@lunn.ch,
	robh@kernel.org
Cc: gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	klightspeed@killerwolves.net,
	jason@lakedaemon.net,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: marvell: Remove duplicate DS212 compatible
Date: Tue, 10 Nov 2026 03:31:19 -0600
Message-ID: <20261110093120.179318-2-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110093120.179318-1-artem122novak@gmail.com>
References: <20261110093120.179318-1-artem122novak@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Kirkwood Device Tree binding lists "synology,ds212pv10"
twice in the compatible sequence for the Synology DS212.

Remove the duplicate so that the documented compatible
sequence contains only unique identifiers.

Fixes: 1c5f2ea8ce7f ("dt-bindings: arm: marvell: Convert marvell,kirkwood boards to DT schema")
Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 .../devicetree/bindings/arm/marvell/marvell,kirkwood.yaml        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/marvell/marvell,kirkwood.yaml b/Documentation/devicetree/bindings/arm/marvell/marvell,kirkwood.yaml
index 120784066833..bca7f98dffae 100644
--- a/Documentation/devicetree/bindings/arm/marvell/marvell,kirkwood.yaml
+++ b/Documentation/devicetree/bindings/arm/marvell/marvell,kirkwood.yaml
@@ -55,7 +55,6 @@ properties:
       - items:
           - const: synology,ds212
           - const: synology,ds212pv10
-          - const: synology,ds212pv10
           - const: synology,ds212pv20
           - const: synology,ds213airv10
           - const: synology,ds213v10
-- 
2.56.0

