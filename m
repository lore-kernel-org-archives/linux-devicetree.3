Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075F74EDCDA
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 15:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791475059; cv=none; b=MfXvHHDNc0BMRK+cR6LMoEZk7nzO60Ibon5+O9cUoZ5LeYBk9Y1nq34bUsrXTWmM6al/8azrUOkHvhky/epT2lcc9sALrkxgsbuoKcWxQodkgUbCW3xxmov/Ef5CY4OoxVwP9xSLdegVrC92xA2w/tbCq+11Q7XAS9g6lJj1M3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791475059; c=relaxed/simple;
	bh=g87w9t8vnCLzrZ5kYjjQ10CHlRMA3AZMTXdHP6HQ6dA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q51ggWwoXjDktFUxP62wRUUpuImxERWZWcMhgFP1POs1reL+P7QL34+WX78yGj30ieXGQwCZC6dNIycJbVJ7nIrt1j2OzlA3OANBbSXtru/Seumm5cD3xZ6/InXdVxg/Wgz0uxU9EG8A+yekKFSEPCDbg4rx/+rB93KZ1MPxfZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xnq/CdA4; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xnq/CdA4"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc4b1f7e8f4so1553106a12.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 08:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791475056; x=1792079856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pvd67Pj74nWibOAWBO1VBH/KQr45t03+WGbHxBJCBV4=;
        b=Xnq/CdA4rwWXL59MOKFfbFlktylPJWrMeUjMIoyMZrSEuRpTHvNu9Y/ONPTIi/en4r
         rZRAH5nBz+BD3MSlG+VKRpQ466MlcGMEJknPkz5UmRHrrvry/dipyXUOsyNsv3GCtE47
         R+VcUoanA2jdgelgwxQiD5tuhabQTkmQnGw36jmceCc6uIjCNWFZFQtEg0xtLPpKXWfo
         PL2mxqPtyrX+2uW813EaQfs99SN9vPvlh8lnsLgIVSoS/C5FS4nkt2PzYJFhsamU3SQ8
         H/0/aE/HleJnmxeKPDgbnfrNwS6eIk41n5WgaSBCFnNdyu4d2Qr+LKtEbkwHjYlUwtA0
         yRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791475056; x=1792079856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pvd67Pj74nWibOAWBO1VBH/KQr45t03+WGbHxBJCBV4=;
        b=P4tS06BLBXpLoL8z1jldwMxF4FkaiRzGahligYpEVa7RN8DZj55p6TPd5Vgu4Mhv8g
         6+QiSEgVLkWIpIOzYzN2rJemkh+LQ1rFKvvT2HmB7UxZpD/V4GKU2T4cjR3Od0hXbhht
         661uctJnImstIB6ux7ZgckpDvt9F3Fka1r8SgV4a1ApfiAKq9FW7E21EY7vJ+RTXGjco
         hUnj1w3ZTsSFFLAE+2yhkw0RCXthkdY/3p3zOqLt2+eCTnrUdOFLpwU9yLpOHYaFouq8
         eymb0CBk0X12yI+Ues1sPOe0ZfsMHanBTLyn1D9BMXVoAQ8FdV+I855Hg4OXeMssjWjX
         PMhg==
X-Forwarded-Encrypted: i=1; AKwUvBxPJ9IpBBIyJXdxW+Mb+Jg6Fzvo35G14PCcUtAGLJ+vxuIVZcXdkt16mKKDnj91GUboaUHX7vSoWNnQ@vger.kernel.org
X-Gm-Message-State: AFq9FYL7pv6Vjv+bLInvKj4lXZmqGSR2rM5+garNhqoGYqFMBhSP8Syx
	uNXCsKCtzv2Z0YJh3zyHJkAotINCtI+QsESIyAX01PMNzzrUaJfNuZOZ
X-Gm-Gg: AYBFou1nIOG2COgI3JbhofuEl5kT4Uwhz3NhkiNh3zNW04oZPnGhxzxp5cUjppnVNJb
	JlXnblO8AK/u9IRa9vCilOb+LZhC1AdBiCkVGCbT2PBIBAI6nfpFe+wD223z+v0mL5lYhlQnSED
	8UGkygGQ6PrmzekzySjbeIeXqBmlRUnOxd4fzlpPTGd49+3BqxxXYddbHE80i/SB5kX+2FjGlp7
	fQnD1mdQbU4coC4efL5nCh3EemKiRKWgbsWtNOpod4rK5zY0+ZLJ5j+ZWZtPnBpX24O8idI8rSi
	waC0YdgRHCLw7ZiDOrx0wsYvTtPEpkY9qalHFQEblVPy/gRUGQWeCtgiYcIi6nSxqEmCZv/YPIQ
	4WC6Fzw7nZVunzLjgF8tyynIwSDVMgKO2yJlQhjfpF4bpw6+kKRNFj3K+fbHqhxuwAV7O+CyN0Y
	20u5X5z7ZTepspCwWXoFgtp85n4W7m5PX1oNjTaiuoxP5D3E6ToDycddGy6xCNd6yTWKah+bzgo
	lhcIsE4zWA4kwkbabLA6ITqhg==
X-Received: by 2002:a17:903:2a84:b0:2e1:2ed2:7cee with SMTP id d9443c01a7336-2e600540d3bmr43995655ad.52.1791475055891;
        Thu, 08 Oct 2026 08:57:35 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661c:1246::1d2:d1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe0aesm27694045ad.28.2026.10.08.08.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 08:57:35 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: David Yang <mmyangfl@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] regulator: support the HiSilicon STB PMOC voltage rails
Date: Thu,  8 Oct 2026 23:57:23 +0800
Message-ID: <20261008155727.3801095-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HiSilicon STB SoCs regulate their CPU and core supplies with PWM outputs of
the PMOC block feeding an external converter on the board. This adds the
binding for those registers and a driver for them.

David Yang (2):
  dt-bindings: regulator: add HiSilicon STB voltage regulator
  regulator: histb: add voltage regulator driver

 .../regulator/hisilicon,histb-volt.yaml       |  58 +++++++
 MAINTAINERS                                   |   7 +
 drivers/regulator/Kconfig                     |   7 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/histb-regulator.c           | 163 ++++++++++++++++++
 5 files changed, 236 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/hisilicon,histb-volt.yaml
 create mode 100644 drivers/regulator/histb-regulator.c

-- 
2.53.0

