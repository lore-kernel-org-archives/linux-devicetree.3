Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB463D3013
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 12:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776860763; cv=none; b=ThI+dlO5v1T3B8UcDlt7Hq2be3db+k9VYgvj+O9kUwZ8Y5XECfBgnxubX/SwuZBL5BCgCmP0X53kt4KrNTukUJC63qtdmYI7HZiX2b0gIOOSml50N4e4jr7yl4v22ayPOX2hlMDZp1DpihsmlHUF4oGCGl8tfJgpWk/eCY8gMyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776860763; c=relaxed/simple;
	bh=OGjx/rpqLanYJw8wyMx1GZX57lDgWW7QcL/E9ij2zVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VhUWFcXpvl8Ga5kE34fGQMgsgQdDGsJXBBRys6vLff1hSgF42Uo/gmiHyUk3Mdg+y2WhiGZUIryw4nw7ZOyaAtsaIBxzmlnARXQBKwQYmfhgYz0IoaA+kpCiCXbpyMRpyOdVlwXgip0FQw9XuxXnEKVcpz718oZTzl2FmtLyBZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=eKWmp9fs; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="eKWmp9fs"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c79506f3c40so1961825a12.1
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 05:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1776860761; x=1777465561; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3ThBxdaxluBFioSVhIDwm332ADtoHWnIdue1Mw0j4g=;
        b=eKWmp9fsws92fCdZBlrnpG0AZSn2VbtHLfy0LEoRoy2Vg9K0c+W3+3kZpe4U3o7Bp/
         b+TsVVOYh6U5U4PCOB065RddEpNNpWQ8Fxy2j1J+n9XNYhvApU4/ZIMxonMyBrNUdKeo
         3r28V7IWqPwjN1WW/go3OUYR/tzVKB7dqxmsE4/IWA3droPx4GI/KSJMrpxdrgHT75dB
         ua7H6/xu0l63v9LDuzZIQK0zrxwJEsEHGvVl7EsHT5BkE3S2MZUkJr5tskGgeWDkOcwN
         oKD4PITh6nRjhv/9G7U8JUzuhor7fwgLaZWMYpXSEU94QW5BkuGj5WKENGlb9V7/8oV1
         CJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776860761; x=1777465561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z3ThBxdaxluBFioSVhIDwm332ADtoHWnIdue1Mw0j4g=;
        b=KSPY8XVvSFnD1Szmkw7ctJUb5pUWl/6qv61mAhADdsvYcGVMSL2vQzCttwcj0i/Qj/
         sSF+ayv0aXP4azJUITPchKEaxpcAHJWpZKRuK6A0fIJRzBmEnPQcAtdTU0X9P2/JnTaA
         34wG1aw5ze1cnTh+bGLkpJlH0XPio98hZJwFKyvU7LrLKsabrBZxBqijon14pfyCmY3s
         tVifheqHjxq1z4QioI7IJHUdOSaYSioIGv/GV6e9HpT50aKp4OsTQ0wU+cwR2ycbiQFi
         0IfEZuIKoXix5eo2bb6MBCfy3ITzA+b+1wBoVMx6ILcOWJGtoZje8JMfVeRd68SXhEzh
         Z2gA==
X-Gm-Message-State: AOJu0Yxhitp9alYsfoMaBvS7DuC688uE2/66K+76Vpcpbu6RF4B4uMbd
	eG//KOV5fK+fQmILRlI0eC3A7S4VpkSpm5Yxno/1lO4D+eEiDkEbteqjmztvrFxcVGw=
X-Gm-Gg: AeBDietLvIGReyCUKIT6YQjOMsKVLTdsu44FQZcSO2tzIcBHQxv4+nFSQh00C3/It+h
	alBR6wzLBN/xo5D0OgnD/rTUqzz5gdpfwl6hhQ5pU23JtuerixOLoy6iekkEB9gPXK8+Rv6DE5u
	orMmesF/tJO19qPE1NCpeO/ogGjLLWbVxmqichqNPA0wcgd8DxDAQdbvs3VS51V/q5/7dcja7u0
	74/0cvnsR7EKSXQ8Rd3Z3lMHpQLA3l4c6D4P/GLEo9yOYPicB/LyOr3/2GQYdMLhmdgU34EnNiQ
	1La98nFkB8dSj9h4Y3iaUYainLAUQUFNntm7xbFydRxlsIP5IINxg9jmo9CTVheXK8qAbQ3RVDb
	8uzs3Jo+O6Fu6P+OsOfDTmiD7uklG8uZ3EUypBuY6U0JR4NGKg0S71zgarZDs8GCc9D96VjZAbY
	glHaSyMXHUnv/2JakqkKt8PzNnMKt/CTU4BPvJIF/Z+OmizfTO+dl+m3K/d23k5vWeKK39lkWnC
	Q==
X-Received: by 2002:a05:6a20:7f95:b0:39b:f12e:d53 with SMTP id adf61e73a8af0-3a08d732e29mr24158916637.18.1776860761549;
        Wed, 22 Apr 2026 05:26:01 -0700 (PDT)
Received: from [127.0.1.1] (60-248-18-139.hinet-ip.hinet.net. [60.248.18.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9819fesm17218079b3a.4.2026.04.22.05.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 05:26:01 -0700 (PDT)
From: Brian Chiang <chiang.brian@inventec.com>
Date: Wed, 22 Apr 2026 12:25:49 +0000
Subject: [PATCH v5 1/2] dt-bindings: trivial: Add q50sn12072 and q54sn120a1
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-add-support-for-q50sn12072-and-q54sn120a1-v5-1-b8fb87262868@inventec.com>
References: <20260422-add-support-for-q50sn12072-and-q54sn120a1-v5-0-b8fb87262868@inventec.com>
In-Reply-To: <20260422-add-support-for-q50sn12072-and-q54sn120a1-v5-0-b8fb87262868@inventec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Jack Cheng <Cheng.JackHY@inventec.com>, 
 Brian Chiang <chiang.brian@inventec.com>, 
 Jack Cheng <cheng.jackhy@inventec.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776860756; l=1150;
 i=chiang.brian@inventec.com; s=20260316; h=from:subject:message-id;
 bh=371ndBFO++Ux/UDUOyIuv35ZzqLJAZsYGZPm32hIp6Q=;
 b=IzWae8Mww4Ny97twVr3hE+lT7MvxDV3KUxI3KzINJ4tIlpgo+6l2rXIPh04etPbzCBIxDnm5M
 /dha8QRwdLEBx4KAmCjcL7xlBihhyLsW9mgh6d1EeTIK6x6s8o0pZ51
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

