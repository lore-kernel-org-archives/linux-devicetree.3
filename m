Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C058C386543
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 15:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781278470; cv=none; b=TG7OvZxWQM1zY5WCAqAISAybtF47JTEY7RZbdZWCXvb/IPGdIMlMtEfu++Iikz9z1CrScEPFpWJ4xk4ahb/GPUsCHEEL3aHdQiDmWaT9Bto/RZpwZr5cu4X6QC+HAqqQdGO5WuO+1JKTHwjshc4y2p4gYDaPKbET98s0lwu1IAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781278470; c=relaxed/simple;
	bh=ALIUQWDYA2tt/w5YoDnsfyeSNacCwhv9VqHFuMI+0is=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qu7kt3ylAJ5zG16KOF4tw2obKzT6DKlWIv09GSMI/NumN12Urd+TZ9dZEKs0c5XOJdFFjhPoNKbkSgxDyAfn2w2VnZ7oLg+6RRjAB0qDXmdeoHEP+6OjbfcpObDe8AQDfjXQe8ZiMpsyrBoBsXSetOGLRwPebLJVvYexXIQV3Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=bQ3xtq5E; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="bQ3xtq5E"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490d1e54b3bso14422365e9.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 08:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1781278467; x=1781883267; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dpNtr9K9XTNqCrkpUM3EVF8WuctLCaDVmj8vhM6mxC4=;
        b=bQ3xtq5EQpn5xcYpzVREf0XIYGHbXWQRO7+EKDVluH5UL0qptgvr+EpvMDYuMxoK0O
         lTGacqKsYlTP3ccTR7v5riHGM4RJDxKIfp5fEtFb/jgSlWNtlyKxPE+yG8g6I8Fc7p5U
         j78Kkuw0Rz2sc5/SXh7xhnxHlTa71lSe8n4TOXI7M2jQwhB62hwVu7/LUl5NITfDFL98
         fbkwp9d96F+AD/0WbkZLmedcP1fJ2eZfaT/jJPg8lSACMC0yL19/Fr7XGO2QIDGftPwH
         yxAihKfaWBRADGgzHUSr6zETtefSKRNM68GmcOne/AarOeNV3DyIhdOgrOBzSIX0lVn9
         ZCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781278467; x=1781883267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dpNtr9K9XTNqCrkpUM3EVF8WuctLCaDVmj8vhM6mxC4=;
        b=p+MsrJGKoLvdBhw+Qd/ak9B4NpxQIQltFMYxg63/mlXWg4A40673rT0RuTWcgXS/XC
         01SfBdP4vB/mhlNO1Vzt3CoWHuAOU6r9bWbZe2oArZTf1xrHUirEw3ePDVYXxpVFZ5Lp
         dkAHxoaTNIg6JvC276apUwqtN8zbh0/fj5BN0dZeHloNxafF4r0fWhapf9VAVLAzjJTw
         uSgl9oCkaBBN9+7ht9LsNuuQbNc9iKSkITjgdP95hD9Qr1gFwBDA903XQVzY6xo4vjhW
         RZlTrP/ONqV7DyYaVec8b2T3FfaJ9TwLxV8ONYwpi06ES54k1dgAQysYu1P518ZR3vWQ
         DO0g==
X-Gm-Message-State: AOJu0YyyRMOYJf9h/MgCMRT9Z2I6CJSz2fuX3w/zcMBMsL3iuLev2BVw
	phvihZ85gax9VmdWeSZUA7mHEvfpecm7RM5iXPYrVEwYOKMTcgqXFahf5Jrz0af89Wg=
X-Gm-Gg: Acq92OH+R5Kg3iaa184sEd//8t8q+C0tRYKkRZv7gQhJdEpYV+cYDtXCFVrj7G2qI1K
	Ek/aqhBD7xNNBuPbes4wGxu2zKdTO/3a8mEffpsivkSvjq6gVTZqd/dGiC5XV7QZT21tjVXBMjg
	uBGAq+/5wIsLQIZHk7kgnlu6GsoNmist/Ta3jTtKl779G83ed32UweBDur0MqyphA46u3+EEK8O
	LjMmu8AGz24m0CVT7cg1ObY+AGTIB//Q9EMC+tXqXFlpk+BS8ZHA240vUo5Kifw06VAPjFR+fny
	8G2RpiYxcIgG07moSMwTnhDI48/Geyv8Rad5n5BO8KZJ12D06CeJHylXxNr3EvLf8AKVmV1CY5f
	exGDMQFGlgUjbPaDVTKT2iMoKWdFm5ZwYWxf6XGSF3msbORkORLkZo9boGnujXvJk5NR+APypBE
	AdDfZlhfUfsbj7By7zbtWYNwTGnq9ahjM2xobvSI2m
X-Received: by 2002:a05:600c:8b31:b0:490:b28d:a6f9 with SMTP id 5b1f17b1804b1-490ec4a8474mr43552025e9.8.1781278467170;
        Fri, 12 Jun 2026 08:34:27 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.92.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0d28sm6916641f8f.20.2026.06.12.08.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 08:34:26 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 12 Jun 2026 19:34:14 +0400
Subject: [PATCH 1/4] dt-bindings: vendor-prefixes: Add Ugreen Group Limited
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-dh2300-mcu-v1-1-ab8db1617bc0@flipper.net>
References: <20260612-dh2300-mcu-v1-0-ab8db1617bc0@flipper.net>
In-Reply-To: <20260612-dh2300-mcu-v1-0-ab8db1617bc0@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=943; i=alchark@flipper.net;
 h=from:subject:message-id; bh=ALIUQWDYA2tt/w5YoDnsfyeSNacCwhv9VqHFuMI+0is=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTpqP09+abI9JCu1HVuYVMG5hWKu5UyVdMfu+rJcF+st
 5t4T3lex0QWBjEuBksxRZa535bYTjXim7XLw+MrzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFO9qo/hf+XzqQluPtP5J3jFSOmv/uEtufCL/TUtuRc7uZJPfVRaLsbI8EZE5ve
 sgqUW1q+rS3ezLJRSmHLNViT13K1qyT9p7bWvGAA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Add Ugreen Group Limited, a consumer technology company producing a range
of smart charging, office audio and visual, and smart storage products.

Link: https://www.ugreen.com/
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index dd94c50e97f9..274e52421a5b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1757,6 +1757,8 @@ patternProperties:
     description: Ufi Space Co., Ltd.
   "^ugoos,.*":
     description: Ugoos Industrial Co., Ltd.
+  "^ugreen,.*":
+    description: Ugreen Group Limited
   "^ultrapower,.*":
     description: Beijing Ultrapower Software Co., Ltd.
   "^uni-t,.*":

-- 
2.53.0

