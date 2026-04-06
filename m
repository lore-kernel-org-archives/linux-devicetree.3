Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32E739FCA0
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 23:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775518050; cv=none; b=O9cUPCCnG09gq19t59ta7qjlnwNvSFcr1qD5zgprvFAVGtq89HY2LXkKaUsuN+dU2Ga0oTUwudO4UMXgjKUprYknwHJq91K+H7F1nf5qb8VyAEPVnJuUJ6WULH41l606vVxNe4bKs3N1vpyVXveHPvSoi0wMU2m+byf6I0t5fnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775518050; c=relaxed/simple;
	bh=VO2qT0XRHPTohWZq/ejyApwBoPTcajK5dyel0/L0Eps=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rzBH5xWnEEpM0laYaAWgEBvLdRTSglVpk45ehv0K1IHL7SDwweYdkJp8yBPpFTJU7BB3gM0s8M+7QpyYbKYdLRvKCmxeNHntG3Njgjsm80Q1zPtwMOIYlcw2NuoaNXnv6oxP2H1tCbqGJALt4dK38hzv8WSmEuxY0F7izfGznc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YbFvGGT+; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YbFvGGT+"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2b23fcf90b2so43269365ad.3
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 16:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775518049; x=1776122849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=50N06dk5rv5+IwRtcE9Xz5zFkvyVJbkQQF12RzsxXe4=;
        b=YbFvGGT+LwLvXl91Kd6nIsD1RPyYoS+SrAH0XKsmYEaaUWecPO0B+wBoHEMLeInS8l
         BbeBMgqlvmlshu9mSXZMkTnmUCg27J3HHn/LLjgUpxX+5/6ewLot1X7T5wXi3xL9Xgq1
         o3POLTOYNyVRbvBAdHi48VwZM3oxRN4/Rjj0QPqpJoDrpcup3yusjCJEp5UF4kQFUxMK
         N3PKTO74ZgGH7pLJyI33Mqr6xheQjGI1IwpffJzj+2rBwoN/0LYhV0kOky5r/PLE8yHn
         F+x+SCqU8H7zY4yyGc00uBmgralGVi8O/Bvg/1pmN6AhYTrFqBsidvULesycFedLTaaI
         AzVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775518049; x=1776122849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50N06dk5rv5+IwRtcE9Xz5zFkvyVJbkQQF12RzsxXe4=;
        b=lBG/Vz+Q61oDJXYmniuBw4TNbRc+lAW4wUyBjm+ZUsbG9tCBc88Ps1JHNxcQxsZfMy
         1UWWPI0FNa+GL40I7aWbf1/LP0iUNpuMicwoVQT0TkHflwZddjPWIIGxji6EGctSarZC
         RV3VsjYRRRhEEwjIRv97kJO0XVKkCwFfzd7Ap7EsRUAMjrqKrwkaXKpjOxmJmCKrqkEg
         qS7GQIjfcxzQp0SHu3+rrnXiWtkBStfJ/hbsAVCoBzBTaOVWqpKm4IAgj/jNFYFuEija
         Orj+zVYFdWfKuvp2rnWMaoL/7d0nbK4CpPi7Yi3UKvbQgWM6xaGrUki0n5IhfJEPHVAZ
         1hMQ==
X-Gm-Message-State: AOJu0YwA5i6yOOOrOzcnBKLkF19y9GdNJwWHXRVdvyFTgflIwrAy60g8
	wWR5glphj/Ubp8BVyvWAPZNf0OUB0AODBLNS49BSd5Rv5vP6oyHPpK0zXT3HSKRr
X-Gm-Gg: AeBDieunYRcKkXHp7HSMEZufSlcO++eh+Fhdkt1UqwkHJhc83I4iOji6FxpcYcxx6HB
	tjyEcTl0BpI3nXpazJYP8dJjjppMgM9BL1a1o8E8+NB+iDRQNFNb0mQlTton1YyRl8+Jb/R/rd0
	5kCL0L0fmds/L8hqPI8kaZlmQqcso9GlJyNlDByVyKW7Z4tnoXFnAUvjQiL30zQfvzFRa43/AJF
	Q30UPzimXNgO/A3Ne5Cgl4vxtrC6UAITOyYML+MEjeGfifiZ5FfdB7a0BmDn5ygdqhBLW5yTn83
	HLcuaNCeYwB3lei5/GYF45lHMdONu8FALZj2l6yD0wJuu0r7oSzoTSKR21YTHZ8Z4iSZA61sMuB
	S/VbIzirHTL+jtZG2cS0mBGAmj1X5LWDf2wKHBQfs22FwTOv173bXPEuAKnVl4DCKBHvBHakDAC
	IQilpm/Hsbq/eLRz+hGVBSzXY=
X-Received: by 2002:a17:903:1b4b:b0:2b2:5c31:24bf with SMTP id d9443c01a7336-2b28175bf51mr156601865ad.19.1775518049008;
        Mon, 06 Apr 2026 16:27:29 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749a4791sm149536625ad.66.2026.04.06.16.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 16:27:28 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Nutty Liu <liujingqi@lanxincomputing.com>,
	Guodong Xu <guodong@riscstar.com>,
	Guo Ren <guoren@kernel.org>,
	Xiaoguang Xing <xiaoguang.xing@sophgo.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/2] riscv: dts: sophgo: Fix CPU unit address for SG2042/SG2044
Date: Tue,  7 Apr 2026 07:26:53 +0800
Message-ID: <20260406232655.144043-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CPU unit addres for SG2042/SG2044 misused the decimal number for the
unit address, Refer to this discussion in the Link, it should be in the
hex format.

Link: https://lore.kernel.org/devicetree-spec/00ddad5a-02f5-474e-af9c-11ce7716ddfc@iscas.ac.cn/

Inochi Amaoto (2):
  riscv: dts: sophgo: sg2044: use hex for CPU unit address
  riscv: dts: sophgo: sg2042: use hex for CPU unit address

 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 236 ++++++++++----------
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 236 ++++++++++----------
 2 files changed, 236 insertions(+), 236 deletions(-)

--
2.53.0

