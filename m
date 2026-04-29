Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCDB3F0760
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 11:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777462186; cv=none; b=oZ8JK1Ur97/zyMWjzSGyL+w/vHMKehfTLsRRSblg/koVVOvc0SHBUaR1FqMhhd2Uk19HKeeXHZ0UkMMxLHqGaC3NU+ZbROK31tyTfnydoPaK/U8z3TwMNCX6JYy02LGoYTpIz0sazJgQymc+Yf+MqgDct+lfcyPqyAJkgS/+c8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777462186; c=relaxed/simple;
	bh=OGjx/rpqLanYJw8wyMx1GZX57lDgWW7QcL/E9ij2zVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eCOSuQrLDLC0WlUfj51yHS/YGeB6CZstneRmfX6ACT2KTv7bOkjvpNuvxyy2itmw6it3uGUzrBm4W+7mJzYFSVvefVmDSMVSNZ8fRbbV/f/NWG6FExfRdPH6RliZu7NR6BqsJE0Z0gXUc7yYoVXYOnFw5D9GlPwaAWXEF2QKkq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=OFR3PCy1; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="OFR3PCy1"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35fb166b0c6so406505a91.0
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 04:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1777462184; x=1778066984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3ThBxdaxluBFioSVhIDwm332ADtoHWnIdue1Mw0j4g=;
        b=OFR3PCy1oI7IM7lPa2f8IScX275q0vkpIabpbNLvQX2Px2xl0paPcc9FAPLARMENcz
         Zb+BNWoAV4SKQdFGdpCD1fd2Fb53/zExFSVrfkaiAKmqvJew0uCty/JG866EODMRhHJg
         ev21yUxDFZFDl95nMs3XgNJLp3orvQySvmmbw6LBRZNPpvsExpaTg7UmmAzacjIMwiFH
         qj86abV288yq5QZ7DyRmoW4M5NGqcRON7CJt6TFpXF0uPcubm93vHsXMFWHURw0/ZUsY
         HqZefugvhcjAMzaJeqAByeGcaLR6eXTjKKGwyL4+bzbp+HqQFcBRoEfnSHgOn+moknBM
         5/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777462184; x=1778066984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z3ThBxdaxluBFioSVhIDwm332ADtoHWnIdue1Mw0j4g=;
        b=aHVR+vvtlS0XwIyoDJEs2rGN7aRZ9NQXIlG/cOEgCpsiv1Az10AWzrbabCO2Dot1Nm
         PYL1HmkV9JLAVbwfxJ7vEowKSSGc046A2Ygh597yk0tm8gAatjl+ErfZUpHbUe5bUw7O
         taN3poWVaZOMcRGtmXBcRMvJCDt7Xl6KcbDsYoFtyAw9iT2sC0km+17rNHv7c1oG/CfW
         C+ZBTanEwpwSpo18CGpQiO/2f5H8cae26aZ20R1/rBiaCSgx3jD8nMsu+Ntu8PKGB0Qg
         g39+upMZS12gJplIO2NQy+mPKWHq86OI3YBwNp1GZ8A8Pi5wiMfvtTo1ZAnKAhropmD/
         RV9A==
X-Gm-Message-State: AOJu0YzsnjnelXt9roGuENXzHhY/YA3YbYaZZ+l1ijW6GoVb0f4fEPhh
	MVVrnK6bOQxhXlLJukG4y6OW+b0IHvhKSmlXaZmDzPKVL0f5EZDrSOBqDn7Wkhnw1r8=
X-Gm-Gg: AeBDieu9XTEBzh53KLVUe1ouh7lUfMo4/zMEqEcC9f+zbku7b8kiVIarx4u2t0WjQLC
	owilp6ybCgYBYvj6GrBEvjCLqrveeEVCoH9xPUAIULHZp3Oq7bbGqqmcm2l+8LvqFPH9pNMTwSN
	nrLNe6SA/kJMOkoJfKnsyJ+NKgN6Y8xghZgi6Dl0Bax2ho71JCyGZS0noHDrlZx4eZDAinf2Mag
	HqaFFPtPNx+YBQT15lm+TaqgYlGK9X8TRGpwkK35jAAuqWxRexZ8YJR7aeVRSkO7YNIvAVsU68E
	vd9o5IMZqIos32mPzIn0tL7EbR9GmCWsEDHHMCEAcAmfcpXvEwrCuNxu7QtAzErO3kquSJZKJK3
	KeucczJa3xvcbIqOxZjZWsiKV9E6hyyHkh21945TJwC4hPiHla24qlCQPEiGDGIujG65zE/pi1n
	Vx9jToNjC3Z9VnPLglib1HHPFcFcbO5NFBo5teFr0x
X-Received: by 2002:a17:90b:2689:b0:35f:b9f1:fded with SMTP id 98e67ed59e1d1-364a2695f5fmr2309132a91.12.1777462184381;
        Wed, 29 Apr 2026 04:29:44 -0700 (PDT)
Received: from [127.0.1.1] ([123.51.235.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a41520dbsm1923048a91.3.2026.04.29.04.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 04:29:43 -0700 (PDT)
From: Brian Chiang <chiang.brian@inventec.com>
Date: Wed, 29 Apr 2026 11:29:36 +0000
Subject: [PATCH v7 1/2] dt-bindings: trivial: Add q50sn12072 and q54sn120a1
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-add-support-for-q50sn12072-and-q54sn120a1-v7-1-f1f83d2039f7@inventec.com>
References: <20260429-add-support-for-q50sn12072-and-q54sn120a1-v7-0-f1f83d2039f7@inventec.com>
In-Reply-To: <20260429-add-support-for-q50sn12072-and-q54sn120a1-v7-0-f1f83d2039f7@inventec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Jack Cheng <Cheng.JackHY@inventec.com>, 
 Brian Chiang <chiang.brian@inventec.com>, 
 Jack Cheng <cheng.jackhy@inventec.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777462179; l=1150;
 i=chiang.brian@inventec.com; s=20260316; h=from:subject:message-id;
 bh=371ndBFO++Ux/UDUOyIuv35ZzqLJAZsYGZPm32hIp6Q=;
 b=zucl2ZGby4rwo6Cs5LCVkf8Hj5atEBuyD2LeUMwSOhmXHoPl65un72V63KStsMG23EpO88vXv
 RvQP1VPtaxVB3tR4SUlqW2YLaZKO03wlYN23g6kHI0xx4lz/vX5F9q6
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

