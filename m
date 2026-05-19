Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6434D408000
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 15:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779204497; cv=none; b=e0cW7LrQg/20a7frh7rhRxjYzEq6ARJIItkBAKTQBBSD3RWS22eF0b97pRuoAWGRjCY2ZJ15J4SfHWsxOLTQXfNccclxKoAJjbZ6DM88kQx8qPyRIAI+mu1ank8ay4/skFE+iXJ2ftgLceoj5R3PcKnVwiH6DbR/+EAtm+nXpsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779204497; c=relaxed/simple;
	bh=sMfs/oTl73KfFai35XZUrrBIteKUihcLzmWi9u5wqA4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=NUVCp3H91fay1Xp2kvl7J3CDPxewSn0QIM7obuUj2lAcI0tiVhRPVmbjY5gb9YNJsGTg1tusCZ49L4h1Otech+ZrhWhbCWO1Efc+FFZYEV9a1aGJGIrP/MJiIWw+xyFAems91ZBVSZfzPCqoir7J47wo2e9/HppR31zW3Cjq6Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ATJ/9ksp; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ATJ/9ksp"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43eb05b1875so2069978f8f.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779204495; x=1779809295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FHeY9JR0M5TX0zvtkHXOhKFutDugs8kDAXZj3q1hARU=;
        b=ATJ/9kspDITzdsCUuwlpAYz9JQ6t2ufAk8O+t1UEstKFOel9eJQfCujuF6mFgwEO8j
         bXRIBqNEUhJnlE7mJuUbu5tIp5ROp7dwavcKMroYbN/AMI7YltB01RLSYBIDCdMe94Z2
         RT83JxmIIxMCezUISMjIETu007Svc84oqoxABr4BIcaqIjwYI0TlTYk+tLJzsdhnx5K4
         fE1u1FrAJ07FnntWw8hAjvvc6E7ziHXNYcMrYbhomhntracLxjkPA/QhXMlWAYZGi9Vw
         3Sd3xoAUdY5yCqQXF7RveFHtAKn9F05AGqlmYK3QoG51TcQyCbfu92Z193MlB4gukr5g
         4gXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779204495; x=1779809295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHeY9JR0M5TX0zvtkHXOhKFutDugs8kDAXZj3q1hARU=;
        b=Buc+y+uMUJbTStc2rj92cQ23dJuNrsYsFAn68fIDBJhhMu8vI0xHfTesnxhK+ioxqw
         zJtHbwQp/omLGrpLKvA3JecS2yfYsHu57PGakW7CHNsw1rN29m8hY+dnb3wUyqYB/5kw
         DERPIITznmRBB8AeUQdEdi3NCTRcne4xbfjy7t0OOEJq1REAFYlWeAxjJk7jgKycAlzl
         sn0HpC0iMRNe3YKDiLsJnlKJERsAY/AtVOSZzh6+KE0Lz7D93hBj30lgW0DFMSabYKR3
         FYNAxZzuqSpEUk/IlXKjDcDUa/YQcvbn+E8XwFhjsjok99PZCvMN9TJwgsZdaW3C6lZd
         3z0Q==
X-Forwarded-Encrypted: i=1; AFNElJ9kRCncdHF+QGvzzKKSyOpvwH8AVYN7fj2IDWCGikzrWbfARkkeLzLGu9sGAiz9WwEnNsMvgDMOKD5T@vger.kernel.org
X-Gm-Message-State: AOJu0YxxegVc9ITrbFcQ8Oc+oIU5Q80xl31KlFVmVlvFjpC6aTQW0Qpv
	jAq3k9vHwvC1m56vLHFmZcn6+qT4XfVEEI4hzGYuzV0ivI3s+MmIBtn8
X-Gm-Gg: Acq92OGRTUJ8ij+2uvh8JDHw9ZWm8vOfbAT6nS6IJIbSGj2sUmKAyPlLWE/xC5rUTzd
	Q2AvFjwyYPYkQc25yA19hCOLEVo/epataCW9lcw5y0HobBkIzHB1YVHZVCvVKNrIX+obkkXAuRs
	4XAh+JkQVfS7YvTZZkSl5acNP6gc9fk/KGr38XMCV9hyH88cSnWRFk3vWRrud5eAwqmabjLRGms
	BI6hNhfac7l9efcwZLhkI/8slK2SUMX34hijxQCjCoerPliBp/KZUqgfm/FqvUev8V79XkHY5cT
	34NwVub89HS5dUfyKalfL9mwlaZblJ9sgU272MoswL8KjapkJust629WUHM1tfQVZC4Rljcs62j
	sO1bTQqOsgy8IyreCOAaYExf9heSdT6cY+4KXCxrRYZrwFG4SOyUvYB+hi39yK5vXqrBsfDgL5X
	mm8PJdX0zdVI0MJPO1Vjw00mlGbvtayqvUORkl3IMqNfwLbpioJnn+nxfPMtOLtUn9jXpY2uE=
X-Received: by 2002:a5d:4449:0:b0:45e:73b5:1ba9 with SMTP id ffacd0b85a97d-45e73b51bdbmr15036963f8f.20.1779204494441;
        Tue, 19 May 2026 08:28:14 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-55-252-101.retail.telecomitalia.it. [82.55.252.101])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45da0a178adsm49005662f8f.18.2026.05.19.08.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 08:28:13 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] nvmem: airoha: Add support for SMC eFUSE
Date: Tue, 19 May 2026 17:28:04 +0200
Message-ID: <20260519152807.29407-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add simple driver to read eFUSES with SMC commands for
Airoha AN7581.

Changes v4:
- Address review from Sashiko Bot
- Use u32 for bank_index
Changes v3:
- Rebase on top of linux-next
Changes v2:
- Add review tag from Rob
- Rebase on top of linux-next

Christian Marangi (2):
  dt-bindings: nvmem: airoha: add SMC eFuses schema
  nvmem: airoha: Add support for SMC eFUSE

 .../bindings/nvmem/airoha,smc-efuses.yaml     |  67 ++++++++++
 drivers/nvmem/Kconfig                         |  13 ++
 drivers/nvmem/Makefile                        |   2 +
 drivers/nvmem/airoha-smc-efuses.c             | 125 ++++++++++++++++++
 4 files changed, 207 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/airoha,smc-efuses.yaml
 create mode 100644 drivers/nvmem/airoha-smc-efuses.c

-- 
2.53.0

