Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82864DBD70
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982958; cv=none; b=H7rmKFU99/6zSlfTykLe1QGZtA6USpqvgQkcZznSz4pcsA0zs8qdAagAmQ+741LV0iptGKXtYCYzidsmm2iZKk9Adf0NAxhmhh5HzB1+RtfNSgI24EaSed5BQE3Sa4iwOkURsZ+TKzHMbJ6zCWXImMFYnlk8FHL52oBjTwcne14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982958; c=relaxed/simple;
	bh=KXyvJPLF/vSAM/caa10lK9dv/v9bPIPN3s2KWGEGFA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WC0mSc42nJ1oB/FkwVDBMl4j5Zx6eWHp8aT7P2PhgwOFvkff2VTo0RZedKNnj6o0FZ/xfrnfUG49PWp6N146jr/yuJdbZNEGFYR9UNKyWI3559zcbUJ4dtsmT7oWkQ4sa7m2yEvKfuA6d4b6p203ft0gxCLEJ+T2LzeU6QFZ+5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=Osn5aoT8; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="Osn5aoT8"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso2615613a12.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 06:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1791982955; x=1792587755; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vxyKhbcbGfXBX8NmJ5hn58Jy3BwI4hVbi59p47lfNoI=;
        b=Osn5aoT89xgl6N1me3v/pIUPzTPAhP7pc9lzs7Tby6k0o7XgnRvQ4h0GjKmuyRxwBJ
         eGj57wr+WmGsxxGdXYnm3dq2H4sej96PXIZ2wegskGvGt8UljnQWzYQ6mlCaZG/9RvXj
         JQTYwQEgGUjPjNZcXphcrDz9Z04w4vgW1cdpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982955; x=1792587755;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vxyKhbcbGfXBX8NmJ5hn58Jy3BwI4hVbi59p47lfNoI=;
        b=klzi4dfuiPZMqWNumEhLtSiQ+3Y4O2nIlPWCmYkNDaXmya9NWZgcaGJqHKz01roNM9
         W/c+iV8Ibjur2/3VxUD8Jg18c5Zz7keqcqphkuYxESgV4YnjLHmahy+kDnPgrpRvLpAx
         +MmfNz9iVj/Py7jO1vOEgnIOq9q4B9FKAU1m13ZxiGg2bb/4RLAUjPX1IfE0tLyRAK3n
         frumaXhLU2AuwONiuCieKfs9Z2UxwwFzLlK/CVTQ2xQJafm48kSWBxGdtmQo0+K1IbAr
         GnMbrJs7f+CByl0zzcGhRF5m9ihgAFAAgTHTywM2PtwXPwvrj/q/Ad3Rf+onF091BQN3
         954A==
X-Gm-Message-State: AFq9FYIlEbILoU2bnBrb/MHU5jHvsRC0O0KjwkjyYoXQCE9stPYE8bgf
	IvG7v7gHBPT7v6VBjIJsdXdkxROjZRMH6uaxSo/aEATr8uncg1T1U/E40ZmDmjSSg+A=
X-Gm-Gg: AYBFou2yDYpyeWrWwvHsGnD3rh37WTnG9n9b5ScsWHQipxgt0Kv52owOj3nscRBrdF6
	/Kkam56OCVrkjlsusk3IaVAex1YK/2bcEIP3krcRdhF+2UXP7kgdWSQee94BmVZPOm+zeIMMQ9Q
	bxDklyYJ9lBAX1/4Sf6IFvvyKurdLY7Pw4Tv537cIDE4oFk6JzV6twpVjP1r6UNKXBnw9rSbrIl
	vYYPF+slTqiYVSmrGN9sNrv+K+fg8aSdlp7YcqFGSGIV6pKDD7odTQOecDd7ZkjENvIRlDvtScG
	0lZJ478DDvCJJgO4rnedhQ/7+oAUOk0EfT5MVUSjJi2BjR3KkWSJTu8PpUopiERJTWuRhPJLIN1
	HLccbGbjI7oQzcP00YuE1ZmZpRzi0Pbvf5S6My2y6KzYluThytbSiHIUYSjrWYfzyoUZvaDNl+1
	rawkvxYJp0hLU0APo/ovY6f1iVIxTUZbxWIaxOBM4/dsg4Fg6KkaYCEBCvD0o9NtKq6ru+TGS0q
	/XUnHdTBdQJ9W7VDbC1dXc6Fg==
X-Received: by 2002:a17:907:3e8c:b0:c29:519b:3aee with SMTP id a640c23a62f3a-c31a7125b30mr1550342066b.33.1791982954660;
        Wed, 14 Oct 2026 06:02:34 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab5b03sm12608292f8f.30.2026.10.14.06.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:02:33 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v9 0/3] arm: dts: altera: add Draeger M48 CPU board
Date: Wed, 14 Oct 2026 16:02:23 +0300
Message-ID: <20261014130228.2780803-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adding the device trees for “Dräger M48 on NXP i.MX6 (Q) and Intel/Altera
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the
same carrier and they are cross-monitoring each other.  The SoCFPGA boots
independently off qspi flash.

This is the SoCFPGA devicetree part.

news for v9:

  - remove the name property from the memory node;
  - fix a typo in a comment;
  - attached phy-specific skew properties to dedicated mdio phy sub-node;
  - add Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

now in v8:

  - modified draeger,m48 to draeger,socfpga-48 because it is more consistent;
    with its other imx counterparts imx6q-m48 and imx6dl-m48;
  - dropped gpio3 and gpio4 bindings;

new in v7:

  - replaced module with board as this seems to be confusing to some;
  - add Acked-by: Conor Dooley <conor.dooley@microchip.com> tag;

Petko Manolov (3):
  dt-bindings: vendor-prefixes: add Draeger AG
  dt-bindings: arm: altera: add Draeger M48 dual-cpu board
  arm: dts: altera: add Draeger M48 CPU Module

 .../devicetree/bindings/arm/altera.yaml       |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/intel/socfpga/Makefile      |   1 +
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 100 ++++++++++++++++++
 4 files changed, 104 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts

-- 
2.47.3

