Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8BB3446C4
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 06:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776149933; cv=none; b=AnsaLSQzgI2VbdA0o+Y+/FzHYN4FzZLN8hTDbRSaIOpqTGOR31Dk18T2DcNU2kFavmnIa4CjmO0bq119i6Ow7k+MdxoHVaH+d2GIi76a/mjzZ9CkTndU8tNYHUslVplfYvjouAq+hrqAyxbezNhsHUAk/3YGe4AezXJtJC5/4Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776149933; c=relaxed/simple;
	bh=OGjx/rpqLanYJw8wyMx1GZX57lDgWW7QcL/E9ij2zVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MzfjM4kQ0qztpfDeWI/Rxv9y7buyw/FDPTiAE4ObmZ6/aqtRYN7ur2jjQnzqpaVslMEOnid2BUdIAGqfgDiq9LEF21DXN9cGgVf+nV1J1oSQe6Yls6kCOdRuLKaKTin/980y0y3Pds9nOWMr1Z6Cc5El9oN9kluoDzLjJALfDfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=BRM5p0xM; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="BRM5p0xM"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35d965648a2so4373396a91.0
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 23:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1776149931; x=1776754731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3ThBxdaxluBFioSVhIDwm332ADtoHWnIdue1Mw0j4g=;
        b=BRM5p0xMDzM/LFkGjGjNodboDkvIH3iGoQPIv7WWdvNqYdATcEulH954wlZ+iE0vN+
         xx6uu+ah5egpnGAeCv5wl0OlXGKZ3MQ5bSoFHLHN6jPmCmRB2ZXrBH9rGBHm6UdNxkw/
         X/FWzJmUC5vW39iZcfIIZQWQtqwXTPunCXyh0BQgCSI/qb/cnR/T/8MxvuiTdnuJ2wmO
         saHD3UGjXCU5a1gu5K3cM71TFMa1bUsiKjbmNeU9DoG1f/XHCTpylZk4eFfSNSOwCFZK
         HibG+YZ0/uYpEADL1MAPI5P3F2GLfaPrCpPbCnwzSxFHkoJpnoeYCpoEs1GzGwSh/rCm
         TQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776149931; x=1776754731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z3ThBxdaxluBFioSVhIDwm332ADtoHWnIdue1Mw0j4g=;
        b=hdvb5w/T3lrzMSoFUQmqKc/wDztz1MW3TSLplKficmnEtCs5SXSFbSY4yJmvEiZrru
         /PhO6SMkINWt6eGKL4Mhs6nc3nPUSEddYkmpEyCaE/mAbQyE7kCu/NSNRmH/ixPm5lbh
         N30yHvYgjbGJ88okZnYjs0Utj6NjP0c5G7mPdpZ+xwVwkxi9WLhB/pz6dRYDbMnE1NH4
         dwDBHV8OQcj715ZTNMVIDRcuhu2MokUVHOmwZLUegjZttYJKQio3s8BqRJAqg367Tkhe
         fTeFkdXahuwdaKKO1ggcMHv6effe3cn/wElPtC8+CDBxvSsjKIiUg1E33AePftUL2aZ+
         viWw==
X-Gm-Message-State: AOJu0YxCjYinXSq28QwXxHfh9WIfXx3hfhTi19N0Ixa8i8WsWJSGeDJO
	gIxnaLTwR6PmQi/bjqDACk6YAwda7c9Z4P8Ke7ezGYWnQ+z+5SrRDK0yXQvVXu05/0qjFhJRdCS
	+BcQN
X-Gm-Gg: AeBDievK7DrvBgNSqGAaZAyIji4hyCl6uxAVqnGkbcrSA89Q3lH8zfvQz7ObXwE7kvL
	rHolruNhf+X9PQwVsMfJ5tU6Ve19YjlBeMn9vnzSEY9SbAkJ0sx4OINaIWYyjW6RU4XM8xXPiQ7
	2cAUfoPYb6LwE3hkgkbO23C8VMygFFzoPALpKJB17KI69xgzeRghVF0o1eXwvFpq84izRYNNVfg
	5kHcIcW6hlVUa3uxR/b03zFpHl0Js9S5EJZGnhaMTFI2Q4PfqzRiLrdaApENBH5IRjy0QIkg62b
	+f6epg4o1P/NprgfJ6pnRBM1LV2uqmcq6hXRL0d/98AFDS85ChEY37Js38O4A4+C8nH+D+R6mk+
	Ybuk8tH+YugdpQJT87q+sC84PNCq0n5wJIr0O7O7j/bultA3TVa6/PMnGyMYliOZHuU8yFk1uuo
	SV+U/LrXr8dqzrSHTaQYearkF2sqEuBnKJon3L5vagaMcGY9KstQfkv3q6tzSnKILmQQ==
X-Received: by 2002:a17:90b:5625:b0:359:f43d:4a6e with SMTP id 98e67ed59e1d1-35e424548aamr19819841a91.0.1776149930990;
        Mon, 13 Apr 2026 23:58:50 -0700 (PDT)
Received: from [127.0.1.1] (59-120-179-172.hinet-ip.hinet.net. [59.120.179.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35fc6eac8ddsm1019714a91.8.2026.04.13.23.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 23:58:50 -0700 (PDT)
From: Brian Chiang <chiang.brian@inventec.com>
Date: Tue, 14 Apr 2026 06:58:42 +0000
Subject: [PATCH v4 1/2] dt-bindings: trivial: Add q50sn12072 and q54sn120a1
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-add-support-for-q50sn12072-and-q54sn120a1-v4-1-b81eaea49df1@inventec.com>
References: <20260414-add-support-for-q50sn12072-and-q54sn120a1-v4-0-b81eaea49df1@inventec.com>
In-Reply-To: <20260414-add-support-for-q50sn12072-and-q54sn120a1-v4-0-b81eaea49df1@inventec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Jack Cheng <Cheng.JackHY@inventec.com>, 
 Brian Chiang <chiang.brian@inventec.com>, 
 Jack Cheng <cheng.jackhy@inventec.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776149925; l=1150;
 i=chiang.brian@inventec.com; s=20260316; h=from:subject:message-id;
 bh=371ndBFO++Ux/UDUOyIuv35ZzqLJAZsYGZPm32hIp6Q=;
 b=JlZ0OUSYbZz6ko6IaimN1a1WAlJxzt0csnzLIQ4VwoG7rUz51CCP7Od/brmCaPrficvEnsDt+
 myPAdtyWf7DCEYR/1bEtrVIEz4vSCtssoiUKPaGoGaY8H/knrbkDeWj
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

