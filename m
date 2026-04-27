Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB2D31AA94
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 06:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777272149; cv=none; b=epbtLP9ALPLq7T/mKtJPgblDH9Rq3a+CUh0do/ANSbrmZcjypsimHAEr3mVxKhg4jRobTaE1atPXtbNXxoJ7SyQluH+K0a7LmOxV/uXyP0F9CNejZbopD2kpNXBtgdI6CglYonesJshjt5inCJri+XipN61aGSGo27pIRYFNmnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777272149; c=relaxed/simple;
	bh=OGjx/rpqLanYJw8wyMx1GZX57lDgWW7QcL/E9ij2zVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D5/DSLclA/tyaXsBzaibyXK+b4YSjrJQ6aCK2I90KVH9uc9v254zsp+PoKsqMM2r6NShkcYPD5clEkFSM34R/i/B4Y592vei5wGBpPcWgAFU/IEZPDmZajaNQXp21u2WXB3mm70ufCYgin6X8wU8gHcizFXsyOiAgvTE/Me5t7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=fail smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=IKe/xs2x; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="IKe/xs2x"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82d0b68837aso5911417b3a.2
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 23:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1777272146; x=1777876946; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3ThBxdaxluBFioSVhIDwm332ADtoHWnIdue1Mw0j4g=;
        b=IKe/xs2xhxbuqrdm2+wFmAbQWkrf8uxKkSJKfvsP9hfa4T4zLr8J9vgkgZ+7Tt8CxI
         +QVcRQPkQGpsexb/onopc+ri8uMXhXF191SiuUsMjzY3UUI68LN5waEb57bNiHnOvch4
         kegCASd8Y/IJiZdTwfV9KifcjTDX3Gb0kH7bcfHNM2rRRmb0WAr8xxNBnnwD3j2VZ1hJ
         jATp64OJ3yQgiVddlwTaAzMv2gUMI7qRFE3JrVUlKcqKOf+EC5fe96P3Er4Jrjg8I6pE
         wQPoktFqB4Hv8e+1UcxUpXRtYdknuPGKDkBgRyHCZDKCmjLQBg8mucaApeZstnayhmiR
         LN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777272146; x=1777876946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z3ThBxdaxluBFioSVhIDwm332ADtoHWnIdue1Mw0j4g=;
        b=Oiub8Kkk9h5KDB2b/8gJmtE8iNVlowrQeDOl6JIj/NnIv6hwx06Q1zVmWn/zj6A+Ny
         Go8JOmHzCw9CkI+RX6k50myv3GsCtssRIzDZmdb7i8onYv6nTV+qjYYPLgrb5jU0PiS5
         w3p1PafknzTq6Sm28ogTtl4UGDgM5hSW7C8JKD29m/vOSamBxLuguVRm0yNBvyEYP3BH
         VOO6p/h/2ombRxL9rS9wEndVrZCiGYAQY082hvsSfvJi/bSXS2uQfgHkfhooGoXpeYP2
         xjZIH875RoVYN+6/tXkGms1gKBxSr/6mf6RThThAavuP7FYhgPPw2vH/1JQ06WekWky3
         RqXw==
X-Gm-Message-State: AOJu0YzoartUz37Ly1dGMOtLtON3sTOFAZZV8liunXNT8i8+ybECWUbT
	ZTuiqt8Rr88Ud+76fqnrdUCczPhSyugcsxMUoK/9FRmYCyxkDm/K1goeRCfvGoO9SaY=
X-Gm-Gg: AeBDievXRV2CGd+wdl1izRsgh8rJ5K5duO2Pw2GZhYHL8BhYGVOWvPpbeQDQvhnR/pF
	N9Hh68wJcPzNxAka4Kb1+ndTY1X37t841FRDL7GR5VpKayclJ8GTdUq122Y53iTB6XEnXAS9nLh
	cMDfewy0Y2C945QUDaYLiKqfSYFW4VYjQZqgsmN/osnF0PHkJWWYfoBdBDpB3h9pCy0F7pulxJj
	xxCK9KKXR5ym3NNPIpFE0ZU+rP4pQqE5yAUXD+YcXykFiYmyYLFMQweTuc9CJNksO6Rq1xV+eM2
	CeZoPs6+Bd8XBLtzMMcLHZaP1Duj445aNEAPqT0ed5S+3PLBodH0BqKSeVUHFYFjs86wqS4Qp1Z
	rDkiIjOT67pVcVReb+fskpV84zTZB6QWGDLhbFI4JUtEu7ljrr/yiJfO3qGRX8FdqSdytc/FrnJ
	fbShZkjJuJfDdyZATy05Y07HLEQLXctUbuu35HTwXY6a3XxiS4Udr0In8t7r0/mj84DSJ1VuzOo
	tYs
X-Received: by 2002:a05:6a00:1c96:b0:82f:1aeb:fd60 with SMTP id d2e1a72fcca58-82f8c838f93mr41143126b3a.16.1777272146651;
        Sun, 26 Apr 2026 23:42:26 -0700 (PDT)
Received: from [127.0.1.1] (59-120-179-172.hinet-ip.hinet.net. [59.120.179.172])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec05391sm32209315b3a.56.2026.04.26.23.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 23:42:26 -0700 (PDT)
From: Brian Chiang <chiang.brian@inventec.com>
Date: Mon, 27 Apr 2026 06:42:18 +0000
Subject: [PATCH v6 1/2] dt-bindings: trivial: Add q50sn12072 and q54sn120a1
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-add-support-for-q50sn12072-and-q54sn120a1-v6-1-ffa77bfa65e7@inventec.com>
References: <20260427-add-support-for-q50sn12072-and-q54sn120a1-v6-0-ffa77bfa65e7@inventec.com>
In-Reply-To: <20260427-add-support-for-q50sn12072-and-q54sn120a1-v6-0-ffa77bfa65e7@inventec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Jack Cheng <Cheng.JackHY@inventec.com>, 
 Brian Chiang <chiang.brian@inventec.com>, 
 Jack Cheng <cheng.jackhy@inventec.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777272141; l=1150;
 i=chiang.brian@inventec.com; s=20260316; h=from:subject:message-id;
 bh=371ndBFO++Ux/UDUOyIuv35ZzqLJAZsYGZPm32hIp6Q=;
 b=ibT1eMLWzWgUxQeXo74bGaCtKLb1EeY56CjGi47FvPmxG5mdP/PltdLSVegRag5o0bjedqqZI
 MtEzxn83IxhC5kigq5Y7DOJiQlQohIxboIqqxCg3Bbeq3vQs4gxn+gA
X-Developer-Key: i=chiang.brian@inventec.com; a=ed25519;
 pk=q+NqJYuJbGpA9KS9941D7f+8PVVW+k7DvaGgFykBiUc=

From: Jack Cheng <cheng.jackhy@inventec.com>

Add support for the Delta Electronics q50sn12072 and q54sn120a1
1/4 Brick DC/DC Regulated Power Modules.

Signed-off-by: Jack Cheng <cheng.jackhy@inventec.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index a482aeadcd44..d4b78154df82 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -96,7 +96,11 @@ properties:
             # Delta Electronics DPS920AB 920W 54V Power Supply
           - delta,dps920ab
             # 1/4 Brick DC/DC Regulated Power Module
+          - delta,q50sn12072
+            # 1/4 Brick DC/DC Regulated Power Module
           - delta,q54sj108a2
+            # 1/4 Brick DC/DC Regulated Power Module
+          - delta,q54sn120a1
             # Devantech SRF02 ultrasonic ranger in I2C mode
           - devantech,srf02
             # Devantech SRF08 ultrasonic ranger

-- 
2.43.0

