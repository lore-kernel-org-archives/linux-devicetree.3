Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792651187;
	b=iDMgtxPVquj5V39LzEoRG/IUkgaksA5qshkMn5jg0LML/m1p5X7IiU+arLujG6tOvdyV
	 Rl+uPse7DT1FjU1HgFiPDZx1rzRDqbXjNjJC3O9Ey0xKiRC5ZkQKogtCGT05YEvacPs86
	 uPFJITU6zG/dqdL6LB+EZhbVV0WTQIyLU20ZPzDS67JM+eDFfoHjsSmBq3NXBbPdsDm/D
	 bC7iK1Q7AGb9AuMriguIrPj6pn7IJ1QKVbCoqQUBv5uYBWbZAx5gK5CILbRe+SQU02+CG
	 VZUFHfcrdfcVxo/dXc91quJg5YxMqv3P+4xOy5l87DsWsKjEzdrrGHLqV/MggSz3mJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792651187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Y11+vQFhjlxB59vrk3lIlPH7Q0J3elq3CyLWDXfXi9Q=;
	b=RffI7Xw3MKcNUpKcnve/S33VsHvm4lt9oCB7pF6JuYWAKF2gfeCpbhtmS3YDWJnvX1OF
	 K5FXJV84AjfHPp4xC8TAt4XLt8GG5EbXrWodat1ChLuc5lRd27y/KlUK3LfyHjprg/GlG
	 7ZrM1vcn9J1G1BEL4YwUcQXogYdcgGAKOmtRAasf/4Q6Q1Va3/QspKjv2yz8Xp+JWPjXx
	 OncrkVYZbR5LRBnjerSb3ORI3pZVh7GvHpWq88bq3UY/mbNE3mbd5eKAzEu+OKJ0JhGuR
	 vi7ZsBSQ8O7jjUCt4i3tmobs9NKM/HWmGVPGLwlwWOLA0DflX6KuFU8dWgva/TKB8Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="aHs/ahGq";
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C53606A319
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 06:39:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1C53606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aHs/ahGq
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd633ef819bso603178a12.2
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 23:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792651186; x=1793255986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y11+vQFhjlxB59vrk3lIlPH7Q0J3elq3CyLWDXfXi9Q=;
        b=aHs/ahGqZyXXT4FbFzTeZgubCwrmTF9x/WM3CtgJe1RjqeLT/GAHGwu3JDhmBEpPyz
         SYaKQzS/1qziyP2DLcPGGYvukoUmJOYQ4ucM/r9EaFK959YVM5T8NdhuFBzgOBjKW1Vm
         3jjkeofb/uHBoU93cdU7WKVVXWCKpO+DWHCQcCuQ1vFafzySGDPW4CgWqngIALrG1xtr
         GJiUuGN2UfWbTia0MdEU/g4VOaPUiH14BK+oVe9pWzll3o6e4RS3YiHwNPE2I2Hf7z4e
         ayFMKitEjV3MQeXsr609PdJf8VCAguvvifme+HETjTHCAGEWRUT6boqgjw2Wf98GGkN4
         MTcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792651186; x=1793255986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y11+vQFhjlxB59vrk3lIlPH7Q0J3elq3CyLWDXfXi9Q=;
        b=B1vTD4PuY5jCIaeXI1NljxkWB38qKGQWUa4G06wqk2qj/V80zisejmG7Ox6SWQ8m10
         MYVXjelu7/P8E4nJt/3ScL7DozMmpn1EkU6+WVAaCyvFW2807e0iMEpZKwHrtbTzT7Qi
         bMzlhN6b33R6U6xDeUeA4qGvmxsqfmOxCbeHKhrllYBi+nudmpcnNq6mNaImUJEZiBOW
         m0jidMuQ9MkNkwiIoY7uxjnspk8fTk4JUctBEzljK1E1BMf6Em6DO+EqBASuwjB+ZSBw
         PYrZIi6PbCncyJU9O2QxGnOyqNZmtjUGppaxt1b/fuFcOyPMwdSZLf8soipiKFnHSydb
         qXpg==
X-Forwarded-Encrypted: i=1; AKwUvBy8UKt7e1AE2io+yT7VlvG2Wa1DF9ZzseqC/LzSfJ2mDN3eci4e4M5kxyzKLPStI1uGbAEldfN9p+Ga@vger.kernel.org
X-Gm-Message-State: AFq9FYIEUBpjQO3eBZzCqzejV9lKW7ibVZfwJq3QAZ/zCi/t92XNDttY
	3H0pg8YrZp6hgJ4bw66JIXe7/eydtkdnVGgE6qUgoHOL7qIB3hR0FCut
X-Gm-Gg: AYBFou3jTVPqHSE+BpuQe3rSAZJG2rsvjZIFZiqhWI7bWoKSx29lcjebjFKCmNHpuhv
	oMnvIUCdfZH56qv4vvFf9SpZNAjMnMHzjBr1lYscIxQCf4TGOWF+JcHjm4pthP+OAWCaS5W+s9I
	IvSQhbZZxa4/YwMGOz/0c9BY02+HbpkW/ION/rU2QRW/lTAslagY/tffxLv6g2EkWbEGRmfd/Wr
	NhTotYuQHf/iHX22rbFORBwBHVMOfz49fHIucbj2bsaGVKv0mAWdVuNKZVZ5DmbzmkuJgtdwd95
	d1MwUemaYWFcsDUZrqSJRSB+ENhvLysW3QVL04hLU7JREG7UXC0GSvMaL+egSCH3rDYqS8IhPlZ
	Vw56+SlzLX5o5+gikEE0VUO5sr5XedbR0+mqX5xBgHa3sa4sI+r7UV4sRniR5Mnl3ehe9h5BQ97
	mf3JVw/mVc48Ruth3dJYDnEUJ+IOEylvJLpGC46duAYfitwKdAugp9D8qr2VapxdyKEp7zLdCOz
	HXBiZlDN5aT6dbXc5z6W1qfu6ovzR0iu/cjHHx7UGoA1XsYmZuSSIAm9Bq1KZ2j2jY4oFSLRpV5
	vCgsOacV0nTAwOQ=
X-Received: by 2002:a17:90b:5390:b0:3ac:9d83:8861 with SMTP id 98e67ed59e1d1-3ad86cdd7a6mr3323349a91.67.1792651186185;
        Wed, 21 Oct 2026 23:39:46 -0700 (PDT)
Received: from archlinux (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4887669sm2784741a91.2.2026.10.21.23.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 23:39:45 -0700 (PDT)
From: Artem Novak <artem122novak@gmail.com>
To: glaubitz@physik.fu-berlin.de
Cc: dalias@libc.org,
	ysato@users.sourceforge.jp,
	linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	Artem Novak <artem122novak@gmail.com>
Subject: [RFC PATCH 0/2] sh: Add Casio fx-9750GIII board support
Date: Thu, 22 Oct 2026 00:39:34 -0600
Message-ID: <20261022063936.472520-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial board support for the Casio fx-9750GIII graphing calculator,
based on the Renesas SH7305 (SH4A) processor.

The series introduces the board Device Tree 
and minimal SuperH machine registration.

The Casio board Device Tree binding
has been submitted separately.

This RFC depends on SH7305 CPU and SoC support,
which is not yet available upstream.

The board Device Tree passes dtbs_check, and the machine vector compiles using
Casio GCC 14.3.0. The two patches also apply cleanly to Linux v7.3-rc2.
Hardware boot testing with an unmodified upstream kernel has not yet been
accomplished.

I need comments, they are obviously welcome.

Artem Novak (2):
  sh: dts: add Casio fx-9750GIII board
  sh: fx9750giii: add board support

 arch/sh/Makefile                        |  1 +
 arch/sh/boards/Kconfig                  | 12 ++++++++++++
 arch/sh/boards/Makefile                 |  1 +
 arch/sh/boards/mach-fx9750giii/Makefile |  2 ++
 arch/sh/boards/mach-fx9750giii/setup.c  | 14 ++++++++++++++
 arch/sh/boot/dts/Makefile               |  1 +
 arch/sh/boot/dts/fx9750giii.dts         | 15 +++++++++++++++
 7 files changed, 46 insertions(+)
 create mode 100644 arch/sh/boards/mach-fx9750giii/Makefile
 create mode 100644 arch/sh/boards/mach-fx9750giii/setup.c
 create mode 100644 arch/sh/boot/dts/fx9750giii.dts

-- 
2.56.0

