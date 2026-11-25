Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607290;
	b=iqVYTUM3yVFZenbcpkTfSWUUA2A2H59pSf8/Tfg5OPgVnErMJ+U4SGUE4xkgh5/fYr1C
	 r3Fit5olTTqm/iHgQ1AxpjdtYxERhxeRJsQjdnbeS32yCQVHNnopU/jC0GI759VEVzLwK
	 tNUDVkB55G/N0Wxhjk70ZTJn5kddrim6XUPyIVJt84xdzrfsp8ygm/AZoCt0xf3GYwVbW
	 w9nRbPQqYJLJx29EFx20ydWMGPIYaylfTjyv8TCQKgpRElWASJ+urQp50fF+tpQ+0MFcJ
	 1aCv/ZJXghnfl661kqMp/2eyjDDhvTrenx5xb/Gs8GtII6qEHtxnShNIvxSAXBU/3bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MbHDGc/ZnLqrXna7v29ToXIuU9r0qh7j1r49D/8WzWk=;
	b=SH9nFT8iWBQtv/9NxHC5hLsrqSepwV5BjWuBYJYEnvNWY63wbL2ichtaX5Xz0I3mzUI6
	 Z4ULxhIWzPxsWYmcW8oiKBtpSfq4r1eGNnv5lawiAKBKcg+mE+kfmlY0Q33xhr2RIwvsp
	 76Fqoo+4RaoyMz8QJheuAppcboIdtta1LONjtGjCzfHQUO3WZ/APMdEcQWMSBfgMDaLRy
	 V14zFmUEKgxajDaLaetQa1AmB3V992G5bJ8VT4pWK1povxZChoHdU8cLneVY06NLo8td7
	 1bTucocuIyGKcYz46oBWBwEMt540RvQUwx0iwacC7OQFM2aYP/IIb+DeVNVGkWe4Srg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FVdItcBC;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54207606A323
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:48:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54207606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FVdItcBC
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so58081295e9.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795607289; x=1796212089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MbHDGc/ZnLqrXna7v29ToXIuU9r0qh7j1r49D/8WzWk=;
        b=FVdItcBCvPKPXwXMlqcjPV5hKb4joi47v3BrabwbjGKHWijkWR7ISfiEIjOplHiMC4
         LVxfeafDHfnCJPRP7wbXhFPYr5ZnLx03kQ/qHSyK0dfS7xV0dbtp/XSoTXokgEEGUV1W
         Ey4P20B5hXQiO0xFLYJ6kZccE/C5K9QpU1doZX/YM6hQB3ftM9iuPx+2HlCjUeDPxkpw
         U3ZZT1/ZOlx9eeqS9vbDTbVyNMIWSCt8+c9gZ9QQJRu1sEYNRdGuM3eSXl/mthIn3dFk
         uICqsRqOvZby3MEEHC65z2BvXZxy54eRbERrvFYIqAV/SXwu/H41q6ghSctUmHQBfRWy
         M41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607289; x=1796212089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MbHDGc/ZnLqrXna7v29ToXIuU9r0qh7j1r49D/8WzWk=;
        b=tHJSlY0s3hKV2lBJ/T5q2ZqbD5rwoQvszPqrWsYrX6RPs8dUGBbjlWN4wgHhzMhEdM
         9HwH5Pa9s+TA2+uy9UWJrITc66tUdTLItEDYCOaCDfkqIHbmPL/qcyqrc21BE6kfnXbO
         AtKTw714v4wKN2bLmxvLLQ25XveaHk1o0xybrI7vtCVoctMR91fxzRms+Txu/w9oPrIp
         hMeYoy4Oh15kRCLj7uoooHILhz6bwDVr1dImTlmQcF8Jjxr31UGC+UnJgWmE1x/qwWjj
         PdrPjHMOICPXmzsMm13/gHariHeTGCkw/1pftp6sInyfpZJKgKr0YRUyxggXgtaVaBml
         XS4g==
X-Forwarded-Encrypted: i=1; AL+hErFI1N3+MSOqW3bzLeGYIeJRi+G5+bHP8+NfIsexw26nuiKJqy8MF350nTi/LbRIb6pzWGCezruBteP1@vger.kernel.org
X-Gm-Message-State: APuU4Z+LRIQWvFWV3lehHf4gJvteJP0c0g95Srpx8wZ5VhvOcaPMmRB9
	C+1t21JhDiu7fKe+cHXPHfW7O3TTUXm74vETFr7EBoL+cQtWa/03eRjt
X-Gm-Gg: AZFdTZeejOQKo78nnmfG5VFkv1gZKQZSA7RCMcpgiZ/4dXb1+Znacno0kXqH+6t5NGr
	VS5M1hOO/2amONQoCEReZTL9dhXgK9ThdSJfvytWWCgmQsnNcLeRnFI/CVsBe6uWOJ6YB6cqP7C
	h6EeoZKFkdsAdDYebqP2MyfHRNvVhPdDkhlnl6jI5M103DI2gf6QVwFNEs7RTgDZpwvFLhDX3SA
	pYam33JvqRK8NluUcfhMbMKFp5Laa+WEnFklNxvrlmJUqWOJIqNR+br+AypSDHwjgGtJh8DG+LF
	zOogf+RotIj6Z+xD0CmTKOSPs/zPz/8u6gSzcsV+0iiVp6yb8kABxR9zVUnPwUE/f7ebu7eBIxK
	xWYmgiQcEW0R5/VEZv8QpyxDXCM8v9HclZ4jrAHtoItzIfjcSzmiFh/C5GBS/o9C0jMiKCQSHM2
	Rrm7cUDqK5/VoQKT5ji6s09wahf8NeV+lMl53mGPjOmG+DQ55OyVgXnEzyoXVIfhwzr9EPB4pbO
	WPUnFEz+xudr4sE6xR6YvcZVD/cwcBCiJbFA6WhQ7qR4w8QAJEAV3sLcHgUuSinKnFucr3m9pdV
	lrJZOTt/PHGzz3xnDPrVk5S71lWwNhjx6WJJ0HiFiGD0BKdhOjECzbBczw1JkhrsvAGHZaJurdH
	Xqgszoxmr9dBCmW14Ong=
X-Received: by 2002:a05:600c:6748:b0:4bb:6a2d:b42d with SMTP id 5b1f17b1804b1-4bb88824e64mr347991015e9.31.1795607288615;
        Wed, 25 Nov 2026 03:48:08 -0800 (PST)
Received: from saeedvft-ubuntu.tail2d4112.ts.net ([46.100.16.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm514068355e9.15.2026.11.25.03.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:48:08 -0800 (PST)
From: Saeed Nourian <saeednourian82@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Saeed Nourian <saeednourian82@gmail.com>
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Add Firefly AIO-3588Q
Date: Wed, 25 Nov 2026 15:17:56 +0330
Message-ID: <20261125114757.654051-2-saeednourian82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125114757.654051-1-saeednourian82@gmail.com>
References: <20261125114757.654051-1-saeednourian82@gmail.com>
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

The AIO-3588Q is an RK3588 board from Firefly built from an iCore-3588Q
SoM on a carrier board. Add its compatible next to the other boards
based on the iCore-3588Q module.

Signed-off-by: Saeed Nourian <saeednourian82@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 744b364fb7..2fb93380dd 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -260,6 +260,7 @@ properties:
       - description: Firefly iCore-3588Q-based boards
         items:
           - enum:
+              - firefly,aio-3588q
               - mntre,reform2-rcore
           - const: firefly,icore-3588q
           - const: rockchip,rk3588
-- 
2.43.0

