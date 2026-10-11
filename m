Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12730221FB6
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 09:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791712491; cv=none; b=Z2jOHVGfOyHxHUCpZARd11kiZi95AnrmOx1HtggoYzjqBnOqCcun/mzROvxrjCOiMWEu2tpWW52E8WkrINUKzD4ffq2qclEstwCxllvwOStNvoU0kGljtbz4B80IKx0C9CluocDHg2mDn+4NdlxZ1QUg8dq4HZz3blfxZNqQWsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791712491; c=relaxed/simple;
	bh=U2B7BU0Lxs3FsucnZq7AS8Yh/09iEnWsum1PYUMmvv4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bHS1w1sINCBTS0kUSg/i73Ubfep0+fD1OT6D2kgiVpf4ZgvGc3z+gruliGZ00tBoJUJKzJakbmG5bXvD6JI6wpa81g+M/EjkBUW9hFSc5DVWdF3MhheXCB3gsJLrmoPTI8Yq6Oj8zXHeR8aSU2m52B/h1VJ5DSxoGrB1D3U2fxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AM6A/a+k; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AM6A/a+k"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a168355946so6892735e9.0
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 02:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791712488; x=1792317288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QY/EzmyzTauwW5QelrR89nN81T0UYxkWsgWg8RAQUTY=;
        b=AM6A/a+kiIEkbC1HcxD2S9+zSHPsIeM06GrzAXDi+/cPJhBRR8ap5Vp43naBKP0SPO
         6N5zc2tp4OBLTZ1rXEvb1yiKDWui3voXcqXI5cvtpBtf2MFDu0yUEu+kca2HymoQS0ra
         bVATxnSOx9yt5yE9I06JCIcFxnqE0/e5JKTA4Qd6qoZHGj1ZX4m3RPUNFpTPnm5FF9MU
         NviYhitZT2NtdXr/yJEtlDKdXBjuoLZpoW/+Dnx6SP2Z46WDjPa+wq5Oy6iNy0c6sI4E
         5Sd+ePbcNizljEE7ZZVjT1k/FIp+ZDpgUqeMMGIAkJKAmAMIT+qH/KJxgStIItkljwCM
         Wt5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791712488; x=1792317288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QY/EzmyzTauwW5QelrR89nN81T0UYxkWsgWg8RAQUTY=;
        b=WF9YThFT/+8i9wD4IdcQvNM20l/pjJ2mZasnAmXK+WgAiFW0g58/CMBEuK9JX8OJJj
         zo0Ml2QbiRmEvjqS/tO0/pba8/UYjxuyG0DvyTpUf7XZFJiK7SvaU0/QgGpjHZcatYs0
         w3RjEqZt5HR7E/7qY7wT4HlW4pA0xqx/QbEm5yYu7DWdtGMM1/m6iobfFbuTC8nhLbcq
         IXEYfFAZs/LE9vFq1rbJ/CEs/JYAa6xjlGGGjtR4UPmtY6+APN2FltTfjUlt2iacfA1c
         9+8wcBhUHveIh3FPaoqECwNTW9medo5DPaTKVInXziidRMrX4V63KnHEDUCbh1g8w6Qy
         JvvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzeQLBzThSN5qVpSEeX3yg+A287kzVVLGnGIfeo88pNfXeHmoCxGyNKilk/oyXW8J6f53EgqhMmeVW4@vger.kernel.org
X-Gm-Message-State: AFq9FYLjGdAteynz0lavz4Q0xnJ5GYLO7jLBQSIJq0CHbCQTEFtW8Icq
	63roi0hJ4Ua3PaZVowg1HTeUFJ0w57t+1MXDbkLJ2bd9MhjdKsjRd2jM
X-Gm-Gg: AYBFou1yjzB2IpQZBLSoHehV41s60JlJ880D3zd4Mzxk4BKP0CSUXcVJYzZb0DDF6R+
	SIqlVdrDPaMHwJCzQ6VkBg8/sDattpET85nLVK+Aqh206ALdn22DQ2qgt34fqNe0ugAGRtBMT5Y
	+NcCRLAoJ9Uz0hv/YahKopOmYImg7oO1MzHOl4IhbCafm5mKDvFoBpD0qhMEMMz6Vu/baALhWG3
	mZ3BK6xedAJPKraCHg7H1QSwLAXEPWBatFPm9NmSIztpdPCGER/BRRRAB2Xyln20u8LqCy+VKcc
	eNTVhoAPPDfSIEYxqRkGsgN1sBokDRW+QlaO3gvgkbqd30X+msLv3qhhtyTeOekwrAATVXnJdyN
	jjmkqetheHvZ9Rv4jD7elbS4eMhOzpJp9HKqlaAfFzWojKdfoJzCFjcV1Zey8ZGx4JoDqa7qQ+d
	K4QGNChtodPXZO+AK2/237VqraXMjDYM3AaZCf/+IQI4H4vzbOGZiBDY8iM/Q3M/o1o5Lir0/0d
	wY+xzz6lrAKtoc=
X-Received: by 2002:a05:600c:6297:b0:49c:fa21:1c84 with SMTP id 5b1f17b1804b1-4a18e4d6853mr119440645e9.25.1791712488276;
        Sun, 11 Oct 2026 02:54:48 -0700 (PDT)
Received: from localhost.localdomain ([151.27.249.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm377837785e9.9.2026.10.11.02.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 02:54:47 -0700 (PDT)
From: Oleksii Onchul <oleksiionchul@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oleksii Onchul <oleksiionchul@gmail.com>
Subject: [PATCH 0/2] arm64: dts: qcom: Add Nothing Phone (4a) Pro support
Date: Sun, 11 Oct 2026 11:52:19 +0200
Message-ID: <20261011095221.24767-1-oleksiionchul@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial device tree support for the Nothing Phone (4a) Pro
(FroggerPro), based on the Qualcomm Eliza platform.

The DTS describes the UART, GPIO keys and reserved memory,
including ramoops.

Boot-tested on the phone with Linux 7.3-rc3 using a minimal initramfs.
GPIO key events and ramoops persistence were verified. DTB and binding
checks pass.

LLM assistance was used to prepare and review the DTS and patch
descriptions. Hardware testing was performed by the author.

Oleksii Onchul (2):
  dt-bindings: arm: qcom: Add Nothing Phone (4a) Pro
  arm64: dts: qcom: Add initial Nothing Phone (4a) Pro support

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/eliza-nothing-froggerpro.dts     | 157 ++++++++++++++++++
 3 files changed, 159 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/eliza-nothing-froggerpro.dts


base-commit: 705529dab1fa872d8b53b09c95e1b03a95573376
-- 
2.56.0

