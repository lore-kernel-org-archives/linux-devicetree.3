Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35894A2E1A
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 07:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789716363; cv=none; b=a4pm/JV/FVNLX+AB2AHWPoEr+PxamgnQmxABKb98r3KGxFUANDJyM9V1+cj7cbJq/TDz3nmldRza6f8Udoc83WSKr+agoAZS4zuuTQX/haijjYX85QflWgW1lSCWEPF3iCAbqPKvSHm/gUyEmpC6ZubhUkjaPJZwcZfUjW1mIGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789716363; c=relaxed/simple;
	bh=EIcHz7r9SwgQ9xfhs7p1tSOdcaWcUCLZ3GAYhdRGBLA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DnxTJgCyT15eqdM0GVfAxOqaNfDb/LKG7YwAOYalYEfth1qpHhamG/mtoeyMRQ5g7Zlnj0PMOLtNDfxsraVjpMznlyWCviMtP2lJsP7wi/RxmHkTtbObbsgthbNP7l62OYNBCCU3X7i3JRPiKMN4g7y5j1hE8M9M2lu5BTcx1wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ki8zrb7c; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ki8zrb7c"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so1996115e9.1
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 00:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789716343; x=1790321143; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BVjmlSNqtkbu5Qw02HVgZP7ffavDj/nhKRMIeX7I8Eg=;
        b=Ki8zrb7cLatx26hYShpaPUZDeaccGs4SjaHvHQlFHpW9j33z3st4ydUsntyEOc+kvm
         /P02NJgg/xhdkj04sT+4HPsG7UBjXkmqIqZmrzQ+lhuzBryOi06p9HdzecXHEna3gALb
         XsRZkpZss0wRYbg8EpuUZ3CKnirxwVhh3s1pTNmhWdnmfsusuBCFkKhvHBLNxXL8AU2J
         FDcamQ6qw/wcsKxSBjddnePPLD9tHyLTmghdT84UdL9tIiifjwuIphMsxYo7UdbULPab
         rQ4CgYvvkWnciiivJkY5yfCLmhWWjO6fni0WIznuSwyua6M748gGGPiMv4zvfNzbMjBl
         xFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789716343; x=1790321143;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BVjmlSNqtkbu5Qw02HVgZP7ffavDj/nhKRMIeX7I8Eg=;
        b=oTuI75iLD+hHq6jqnN9mZ5SjugxCNrPQMt9XmOCQJIwCazNNREEndTxTBQ6EOash8L
         fl9V2rI+y569Xv1XUoLVi1nZXtEE/zLVxLcBXLfliCaiplLYUKik4zRy64IJdmZzO5dS
         wtC08SMh47F9rt63JRhW57LBrH3SbMPNu/dlF2Ti731rgNLFTvgeKyPZC217qlwnfC1a
         oSEHK6rFIKuFn79S+TlZH8tPXpoRmBNXYmeiEiVf5MZ8wnMxR90n2BsInUxzmAswdu4b
         nzDzpZoKUMhEB7w3symwGA7Mg9nrFZj/X3IvuvSsYwCJTcs9eynmtr/whqfHkHs/xUlS
         4lRA==
X-Gm-Message-State: AFuF++lReJWL6dP631FVwaLkwgpFsWO/89uetcqaCGKgv6pbCO6N+hjU
	jqx8/uM7dGwhWxRvDB7pg/X/iKy8y4nlEfd5odHzjGuM8UDM/nFtpjXqw2F62pZsNTV6CzNtihT
	6Nd0o
X-Gm-Gg: AYBFou25L/cjuoB0F7wRFzcEiBoTC0q/95ka07xMBkmqZpi5sbdScSnjpdryGwkRCAF
	VGBQAHVRS4BWoDlYCrpx9V6aUoIAnVor49rgekHigB3wpqmS7g9GdmtjK/9BYmmVJUgoBOQObVw
	iUZqehVR40YRL1E+NmfuxcZtAdDZm48AIiZN0p+E5d5Y9Z1CzjZ7CYtfuXe1TR3zSmuoTti2N3+
	TCaRcGZVal63pN9WD5j/0WdQ1w/0xpoj0H2cA9Q8XLy1UnkJDLKRGuCiG5/DtdCX2t+O8vXciRR
	ht9PDXgXo+CH/rCxU9yRTB32nadgg0TUc6PgA6FdjoM09G3duYtPBOSXBAvAnzMPi16107nTMB9
	krL9eKqMgT2ujfKYpwmQK2/1ZNhH4KeoiTuGR2JSrBOp59H9JcsdcLRCm3SiMdHBP34ijOejUfd
	G5MX4ZTPtmLl9xGVJHCiwxZGUpd4xT7vQv/NmVEiWeoI72SrjJr4mysarha8Zo1JsjavHauim/Q
	2kiKXNfUzDmEG8=
X-Received: by 2002:a05:600c:1389:b0:49d:2936:8ad1 with SMTP id 5b1f17b1804b1-49fc4f71c7dmr20760355e9.1.1789716343451;
        Fri, 18 Sep 2026 00:25:43 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd2160c2sm139523555e9.6.2026.09.18.00.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:25:43 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/3] regulator: add support for the Nexperia NEX10000UB
 dual output LCD bias power supply
Date: Fri, 18 Sep 2026 09:25:36 +0200
Message-Id: <20260918-topic-sm8x50-nex10000ub-v1-0-5afe06bace03@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHDnrGoC/yXMwQ6CMBCE4Vche3aTFoSgr2I4wDLomlhIF0wTw
 rtbdW7fYf6dDFFhdC12inir6Rwy/KkgefThDtYxm0pXNu7iW17nRYXt1abacUDyLm8buBohfSV
 1g+lM+b1ETJp+5Vv3t23DE7J+c3QcHx3GKkV7AAAA
X-Change-ID: 20260918-topic-sm8x50-nex10000ub-3deca3c56ef4
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1387;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=EIcHz7r9SwgQ9xfhs7p1tSOdcaWcUCLZ3GAYhdRGBLA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqrOd0mhL6FOYWAWXX8YnrZus06zPjs9OuKc++Ilyk
 /AcnCqaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaqzndAAKCRB33NvayMhJ0d5REA
 Cut5N7ISVUK4INtGOvm/8PnQBbASXIksVDaZViZ+CpE+FxhHfblqVV6KPuh0YiZeHezMX1tGoEM4Kq
 Ehp8+iRh9oaUbcI2s3pT/hRzkEDO9coDs+TPCTCBjz9RiAqq+4auYmLXEF9m2dqRFu9WDvmnoNdpRV
 Otz3G1uKbKcyJS+16qK10AGjViLarj847Cw/dHv+qygQwSgISt9HsDZlaIrxQVhL+xnnOxti4CNVZ0
 8YRlDgtXsc9YORMGXfYPqNf3S6t4kOnBwDOHz+NEy/CBqD2atGs8rT3ev53TAVaS5LoBkfmiQ2/wCT
 TBCEoUjxeojkSU1mEf+g24B3U9W9Psr9AVYvcO1Q8kMCwUSfBgBlIBpLI1eNyhixMiAu5vp/T/7pBu
 PC5YRNlAUWhsYGr0I2iMIFq5DTsp9BtZ+Y7C6ASi0k9IMr7rKSlt+QBBwznyR8zjqrIYUrJ4oKoSeF
 0IuHxwgkJhVDk6xx0IsZ3Dnpjtc5GCstb3s53melskskmJ4h3ULTZ5uIwMm7Y7sLGKSZ9Xcst8SEpM
 NvPH4sfE/o5ocKZynNu7LHKNSDxYwj3wtsymqa509xmtlWmtoYQ3yRM9pPchTuItsCfm5Lr2t53G5s
 PusUveg0m0hh3C7EApx1EX82/m8LR9Wnf9L3W0X8ZkDiZa+Yixscp/gD/KmQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document and add regulator support for the Nexperia NEX10000UB dual
output LCD bias power supply which provides programmable positive
and negative output voltages mainly for display panels applications.

The driver supports setting the output voltage from 4V to 6V in
100mV steps for each output via the I2C programming interface and
supports the enable GPIOs for both outputs.

Product datashet can be found online at [1].

[1] https://assets.nexperia.com/documents/data-sheet/NEX10000UB.pdf

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (3):
      dt-bindings: vendor-prefixes: add vendor prefix for Nexperia B.V.
      regulator: dt-bindings: document the Nexperia NEX10000UB dual output LCD bias power supply
      regulator: add regulator driver for the Nexperia NEX10000UB

 .../bindings/regulator/nexperia,nex10000ub.yaml    |  66 +++++++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 drivers/regulator/Kconfig                          |   8 ++
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/nex10000ub-regulator.c           | 147 +++++++++++++++++++++
 5 files changed, 224 insertions(+)
---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260918-topic-sm8x50-nex10000ub-3deca3c56ef4

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

