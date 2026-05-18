Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05B748BD5C
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114057; cv=none; b=KosHNfcyua2YbJuERuZ8MFWypavfz152QRDtKtUAcAIS0s2daBh/3ANTbs4ylJ7opjLGfgvoNjZl6MfaBwbttmO7IVjQUkFD7Y6YawOS1w1b+NS+NFq0dVCp8g+8UQ0A1fuUzzhwGm7quV53vdELDvmth96f/wVHNdSYNPWV98c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114057; c=relaxed/simple;
	bh=UOu2JEslT4hHw1qdD3OaBg7jNubP2mSA3+xT5lT11eQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=CJ4tQoKiRY3Lem5Gid2uP9H5dds8e9BMkGj4zcUETSDtoiMWxY19OcpnBxSKjc/XT/hGwdpIRiZzyc1XOyXATpmgomud8kAk2SxfqlnIFGw6Y+SWtIwjSauVtJTzftgdvhmmryCNxn0mHxCfBq5MNz9hxScWya1oeRdkJ7RdYoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qA/HSs0X; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qA/HSs0X"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so10667715e9.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779114050; x=1779718850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iRP2fIWQaYxshtS2zUJf0bQFlYorBjdu776VGZvLBAI=;
        b=qA/HSs0XmVIa3DPkIWqWqm+njEIINlMOczf79Ea8CDbdx5yz4Mam1Z8C78NuC0H7wB
         kABFCNBIklob+tnA1ANl7SfaFkq5LmSjsiHzNhAe2bHklZK7kdqcIcLlUIJWDNh13nyL
         /3hiY5pRVaJMxBF8vlBK9YpL6yLDakfeVFDC5llyfLFVQdqChDmdcU0jhEQQ+AZf0uoy
         AT3UBooX2DYHN95LreAWQqL+R+WDKBlq8fzT7Ai2ar0tyHGT1HohKyUbKwRnEfEyyGVJ
         L13HSRPq/JwLhWB+f7yuGfkmC2EXPTAKWkzI+CZu830APh5sDq1Ed6csTxBpq41+vAoz
         C2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114050; x=1779718850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iRP2fIWQaYxshtS2zUJf0bQFlYorBjdu776VGZvLBAI=;
        b=Fv19zRlJgx3cJV36EYoX75wQFr4Vul/GDCPWo2yb3gSQ/ed8he27kqQdUX18tXqZv8
         GPTUlCjjgC03HZCXBj+RCBap1ucEp9eND24/OuxszikoDPphmpzDe++bVNHuyArKnGI8
         neye8KsfFH0RRc4ceb2v/BD+Fuh/YtTVT6cwXIP2g/E5uh2WwQEEAhS/m0bMPw8u6Qlz
         RUUIM9fpD8M3NXKdhHfBhIDYe/SiUs8OTwEGgiB6amXnaVMnFcF3hf00kzPf8KmyyuT6
         UaCrtd9YH0V0+zki/8J4b3mtR1wzMIJUQhQxNaAIqKFWwSYsss189xKBuPFBugR4pZbJ
         Xzyg==
X-Forwarded-Encrypted: i=1; AFNElJ9qn5LJNXLwRuY/lOmca3ijtjRL3s9D5Xo4qm39vnxW0hZ+JnU9JvhFuClL8kQNrV0d+Yw4aczdNJmM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/Ia1GS0lZhgRx3faK1O4eTIu99lWs4vdLu3HNllGLJHJ02BuU
	mtZ0JTD0AO9FctdWTl5WzfIHCXKgw1shGf24H88LMs8HGY7XfYT0/V7G
X-Gm-Gg: Acq92OHhvf/napClRgF/35aB2saOvqtCBQzmQ1QuKx7acRwfMdV0YufZ8wrRvzCljQx
	YtNe0vaKsBnRsIdJIt+JQjPekPftA6TryaK1pkc0wYD1mSvyteG2XpL/W7zkHFfERi3Rl5jyPJ9
	apTdp2kkps9i9Ei1XeUm/xueFPmoyPlz4ZBLXijIk7+9zkjATbf+PvSJAuvNNnMMgXprQYbhCsh
	VaxQeTq8y2ShQcnSV1WaVJKotm3IM5c2+cFsno+vj3qDb9qwOLGCzUI7TQW+IezuMycB5vw+4lb
	SL3ptMq+zm1g9PT1Yogvp7ZGXGowzXrQL8sH8EdSFHWmn3uFlFH691ctkQB5mIAppm9GgSiZ4w8
	AmC3i+4SXARWgcBMhsRB3NaM4bMB5GBnKUnEnYlvuZVdj6TfY+9PAa0ocCP9INFAKIAM7UW8HMP
	INrUmCTJUb59x4cBNopBseOeCiJU/onQAVuHb0TLOFSymAheVG6BD53fmeAoI21zKk6gM5HFs=
X-Received: by 2002:a05:600c:608b:b0:488:8bdd:cfcc with SMTP id 5b1f17b1804b1-48fe5ea04cemr244346985e9.0.1779114049674;
        Mon, 18 May 2026 07:20:49 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-55-252-101.retail.telecomitalia.it. [82.55.252.101])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45da0fe0fecsm34905626f8f.26.2026.05.18.07.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:20:48 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] nvmem: airoha: Add support for SMC eFUSE
Date: Mon, 18 May 2026 16:20:30 +0200
Message-ID: <20260518142042.8331-1-ansuelsmth@gmail.com>
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

Changes v3:
- Rebase on top of linux-next
Changes v2:
- Add review tag from Rob
- Rebase on top of linux-next

Christian Marangi (2):
  dt-bindings: nvmem: airoha: add SMC eFuses schema
  nvmem: airoha: Add support for SMC eFUSE

 .../bindings/nvmem/airoha,smc-efuses.yaml     |  65 ++++++++++
 drivers/nvmem/Kconfig                         |  13 ++
 drivers/nvmem/Makefile                        |   2 +
 drivers/nvmem/airoha-smc-efuses.c             | 118 ++++++++++++++++++
 4 files changed, 198 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/airoha,smc-efuses.yaml
 create mode 100644 drivers/nvmem/airoha-smc-efuses.c

-- 
2.53.0

