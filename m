Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D65347C7
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 13:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781444298; cv=none; b=BrIL4X6YZquyjVzm/T7Vb6Jr0k0t7hnDgdBLZw8FNarsSX1uWg8/Es/zG9Lj2NGL2bbH90bNciTm+eDubnWCNnwDE9HPGS8BKvq/Ads0u2GjEz3yIpYshFlkptCo/EIzy5s6nUoQQHixNiBe4LvyiDP2WvD5HulLQo235oa7KYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781444298; c=relaxed/simple;
	bh=jtMMS2o7dsbp/nFe3E/8P0x8ALtKX+Kq3ccaZEtMfZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PaCuEQ++VKLBh3W0XyPTfZ6V6Ufvx2Mjp0+WkWtg4FdAxbYnQVXXAv1Id3inrPY8xKS8E4gPNu+yuFtwnIhmO1UlEsR7LGebUnBeBejFWIr4giXYV+0888VEtriddEqJOBwins/x1yYalJD6wqbBWHPEwyXV5of2zBQAjr1MmRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMDo6vkp; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMDo6vkp"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c40397e746so12986225ad.3
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 06:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781444296; x=1782049096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3v7kyk93xScSWNN+RVNzjcdObdCe6+cJy2cWMGVN3fk=;
        b=gMDo6vkpN/m0o6/sZVQxvOVoKHq9D8oJfV+atgoCZWd6Jrqo3+/Cg/yr6JWCiPqO74
         mz2ImdRHD3uHOVmCJ9JGLMKiiCNKDNHIPoRfAvBba2Kx8P7Qyt7VCScRrtCIBzKIbV6M
         RoS7bz0VQra3WBMMRXHcO+35SuDubRMfhftzRrnNmfOVb2P70vrCksT721pLF9sHuakx
         mD6aBQX/5cRlGyAK4+99koOmZal8X5pG4kA0DMAVWJJprcPSD/dM4P4LbGbPwM4NcbL+
         cNvA3yxMZhjEXgPotdaMZxGfduxK12wx1I9WgtgEUU6GxkBqyQ85lbWWHlSUgf9bdLul
         u7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781444296; x=1782049096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3v7kyk93xScSWNN+RVNzjcdObdCe6+cJy2cWMGVN3fk=;
        b=I5CjAJKpBqIvesBh6TYiP1zNSgF1ocJsR3wjGXpcJ8XCboo3cAgurS8xhQ/LpNjcHi
         ZrJddaphVQKaTxzmj5Fs71cF/3xBnHLYlCM6K4T+2ntPsYW2ZcdP0L+sM1oKxvDq1gD4
         wNAE5eBprFb/+dtr7c57anVJQQancmLV/Mgdt83eLy2yddlleVlo5IBzjXk6s1cSoq1b
         RCJznZoITuo38Y4yNj9Qs/eZCa+VRsVmGwuOgiJRqeXvbVT7T5C69eBfjpHMNI60mj32
         CkUPU1jQ6rLYJ2H7l+5UlzWOW627mK6kBsVWfQ5Nm5LwU9zEx9KxOyb9rJmaytDPdJc8
         +hjw==
X-Gm-Message-State: AOJu0YyM5B5g96N/dDiTTZPuigsNVh+DSEnnNIHG4l8BIbfHgEk4Vszh
	YpjBMiU3ENuZSb1+L8iJMi40qURC6cSk5basOanj9+IakJNYcOQXxclP
X-Gm-Gg: Acq92OHWex9vUlvvdOokjB0BNfCq4zlV2kkw2qM0pId/drhTWvjlQKn/Gg/OGeEjzWg
	3J/nSw8r1m/ps+b8DBY4RE4iHZYwAB2ARJL7QQZ9VUhRErXDvDjWtQF+1dpaNUIVUIFvIth42X8
	5QZxgU005opYASpX4Nke286Lf9cr2oxVcKbf1PBcr+zySiLzcSIgs9YeU6ABSGQsWheTW4b+upL
	OEG6NXrcLg8in7Wj4exxgEJBTihvn/2VivJxIUfjZjIqrOU8XG3pKIV7J4h4MfZrd73zqsipgZh
	LDPAwnV79vUVZ1EFbJLX3n749jiMm50UgmuHIN3F82a5ukwHJ4lFr3EOF24RxJh84GQNdEdYRM7
	Wy31gUP/CMO43e4LSWxOs/q8EjyScKTQDg0nf6mTC0va66pcPp2Lr1M2JtjyzMyzQm3uUrxvB8f
	jAng12o/hBnd2tlYILFQ==
X-Received: by 2002:a17:902:f54d:b0:2c0:a711:539 with SMTP id d9443c01a7336-2c410411179mr123189555ad.5.1781444296341;
        Sun, 14 Jun 2026 06:38:16 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e535csm69043585ad.6.2026.06.14.06.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 06:38:15 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: robh@kernel.org,
	saravanak@kernel.org
Cc: devicetree@vger.kernel.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>
Subject: [PATCH v2 0/2] of: reserved_mem: fix OOB write and name skipped nodes
Date: Sun, 14 Jun 2026 22:38:05 +0900
Message-ID: <20260614133807.2165124-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1 fixes an out-of-bounds write in fdt_scan_reserved_mem(). When
more than MAX_RESERVED_REGIONS dynamically-placed regions are defined,
it writes past the end of the local array.

Patch 2 names the skipped node in fdt_init_reserved_mem_node(), the other
place that drops regions.

Changes from v1 [1]
- fix bounds check to cover the missed case in v1, based on sashiko
  review
- print skipped no name error message in fdt_scan_reserved_mem() and
  fdt_init_reserved_mem_node() both.

[1] https://lore.kernel.org/all/20260603152709.941788-1-ekffu200098@gmail.com/

Sang-Heon Jeon (2):
  of: reserved_mem: prevent OOB when too many dynamic regions are
    defined
  of: reserved_mem: print skipped node name when too many regions are
    defined

 drivers/of/of_reserved_mem.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

-- 
2.43.0

