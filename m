Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6700C43E09A
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 12:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786537311; cv=none; b=siC0MxF8w7H9pv9B5Qg6Ngk0O3Sb/JQxzu0bxXT/C71ruSM1MjFHMnvGwpn5QK4P0Bk+BakLAisApqolNWechishAR4+I8iaerFGnkHMcdn+HsPzW6hqa4GhsrADVRoeNkEmLi9zVoMYKADYs5h6jgQ9ybUoBKdh1IHD1eSKEBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786537311; c=relaxed/simple;
	bh=zCYTZEw6BBSMhECq21v+gXOI76+nu/PUwVKQ7phuzwk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SrUsdSVQ7++YUFV5/aeQlrSRiMA5HUOwjtygyXNQ+te5ULbxKnVfwVxWzNMgdXNmMPF+3i4mm/PhipFJnv+KDXmtLqlow+aE2QnJf+n45UiFy7IFU4lZ1U/pQ5X3kYfaMZZKtO8gGwE3h44zOdWr8/aF1Nbnpv7cwv4SOsy4dYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=Q0nwU6kK; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Q0nwU6kK"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso15702835e9.0
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 05:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786537307; x=1787142107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UeHBK+ZUVXf1IPAtpZKQyvyBgKkify1wwk6CszLJxIk=;
        b=Q0nwU6kK/biVFruwB6QUFJDAu//T3X3F+LJ9JvKrBZOy0WPWeCQcFusGuDxpsWzbde
         yLhWNrV6LBQWFFJxdkPbTaqf/chpUnGRTpRnpqraV300KEMntEE+D7y455YrAb97dBwL
         RKguSX1+1je44WC6CMC7y18+xv/PjIjW7J5bJunpSL79Sl44q/g3Q05uAoUsYrWKjfsC
         +F6XmgL78G/AbgfpGuANQBiB03z/boWzsD4hVPss/Geqfabjoe63HXxZF+egYk7D85+h
         k5J4LB1yhGL7yRdDY1sT5vCJ5XM83AJ8kUVbxq/E5ZEs2kWL9dLd2pMoujLgdV+wjGS4
         zUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786537307; x=1787142107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UeHBK+ZUVXf1IPAtpZKQyvyBgKkify1wwk6CszLJxIk=;
        b=ani1AIz4odwe4IrJnBYXPJM1Sr49GnpkY45/jx0/FcZE6N3YN65TgOVUal/P59LU1R
         R6mDLmwOg8pBeOWFbS5mgXJKghZnOsFgLzo4Ujw2JCMmPQvVdYnAScfbX003X1jUk/M+
         KBtu79RjESepUU/Ua11XIBLSc3RG3mVq42SescS/LcDronm+OdtmSSK0m2qnzas0hedT
         KGBb8gdXTaId4hdddfb6ZpmDi8S/d2J6NRuhyHo++D7tGZjmh8cIyX7IkDe4Ql0IKFgW
         jV3IqacUmQukCdvAREzn6g7GqDA7v+ZdLlXiX26kap7xlOAgTIIqEEMN/DSV1hrF7whm
         AJkA==
X-Gm-Message-State: AOJu0Yyoul9R7HQsz7p+x888Uwi11clgmkJnU1d9v2Z9Ekt6pfL7z9mA
	kjv9q9fWNZI/aS0+CqTnIyMVHGJCmLT92nYHXUDEUp7IzEgdia5iXonUkR/qxGbCYVjjmqz+BzQ
	uwH2tUV8BhMBh0cyva+I7iW7dr3qzqeQKvIBW8HzswoVJlVCyjD74uOVFvjTUeHTCOoVPq1mRsR
	CoGzbmkX54+jvaSJxXnInFi25ufDsafeZjq3reQinvHFZW3nGWCNddsP0=
X-Gm-Gg: AR+sD11JoKGakbJGjvhjw+yf9pJBo4DOTjSCiYAt1O1MCQBMHKIX73+I5ODke8fjySF
	oDcnHXaapbLeyc4FLFo6nzGYOGlv+V0RtV4KpfgGGAOme5VeMjVE9KfoZFlb6Wia9B24mhTbpQ3
	MxrBQN+LYIGf7I2byvEgm44XCWrWufxrlFSNfA0kj5GgsfNEcLdPOBnEqYOjliiwOA+GUMh+CGO
	+uk4Zjkh6yXk/ZCQXCYrcVdEcFvNuQODVnV/mzXYx2JElkMXlb/ArH0kyjjqe1OuU+lPlIOD+Rg
	9QWI4JkL4xto6omMY9c+GZm1Ef3zONIwTuGs66uNVlJk6x3J6aA+6EacizVUZRw5VdVhKcCk5OT
	6kOPJtVKn+69qotRHZS/EcgY1g7g17wfLj5tpjFydS7ApsUdXq2cQCPFICN62w9+1mOe8+gvC68
	Q+Sw9MQA0JTr7ljTVe2doxI0xDPM2fXTEuA8b/A03LP5fdmPYvnLY9mhXOdiDXeB1tll5MKajuM
	+I+ULI5BzBj
X-Received: by 2002:a05:600c:524c:b0:499:596b:2e91 with SMTP id 5b1f17b1804b1-4997c393b0bmr52627565e9.3.1786537307508;
        Wed, 12 Aug 2026 05:21:47 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aaa5d04sm65858905e9.2.2026.08.12.05.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 05:21:45 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com,
	dlan@kernel.org,
	dfustini@oss.tenstorrent.com,
	michal.simek@amd.com,
	junhui.liu@pigmoral.tech,
	darshan.prajapati@einfochips.com,
	akpm@linux-foundation.org,
	zhangchunyan@iscas.ac.cn,
	luxu.kernel@bytedance.com,
	pincheng.plct@isrc.iscas.ac.cn,
	nick.hu@sifive.com,
	jim.shu@sifive.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	robin.randhawa@sifive.com,
	scott@riscstar.com,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	anup@brainfault.org,
	pawandeep.oza@oss.qualcomm.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH v3 0/3] dt-bindings: riscv: Add RISC-V Worlds and SiFive WorldGuard DT bindings
Date: Wed, 12 Aug 2026 20:21:28 +0800
Message-ID: <20260812122131.1534906-1-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series introduces device tree bindings for the RISC-V Worlds ISA
extensions and the SiFive WorldGuard Checker hardware.

RISC-V Worlds is a set of standard ISA extensions (Smwid, Smlwid,
Smlwidlist, Smwiddeleg, Sswid) that enable hardware-enforced context
isolation by tagging each system transaction with a World ID (WID).
The extensions allow platform firmware to assign WIDs to privilege
levels, execution contexts, or isolation domains, and delegatable WID
management across privilege boundaries.

The SiFive WorldGuard Checker (wgChecker) is a hardware firewall
positioned in the system interconnect fabric. It inspects the WID
of every transaction and enforces access control policies on memory
regions and memory-mapped I/O devices. The wgChecker is based on the
access-controllers framework, allowing protected devices to declare
their access requirements via standard phandle references.

This is submitted as [RFC] because the RISC-V Worlds specification
is not yet ratified. The extension descriptions in extensions.yaml
carry placeholder "TBD" commit references; these will be updated
to the actual ratification commit before the series is merged.

Yu-Chien Peter Lin (3):
  dt-bindings: riscv: Add Worlds ISA extensions
  dt-bindings: riscv: Add Worlds per-hart properties
  dt-bindings: access-controllers: Add SiFive WorldGuard Checker

 .../access-controllers/sifive,wgchecker2.yaml | 178 ++++++++++++++++++
 .../devicetree/bindings/riscv/cpus.yaml       |  44 +++++
 .../devicetree/bindings/riscv/extensions.yaml |  53 ++++++
 3 files changed, 275 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/access-controllers/sifive,wgchecker2.yaml

-- 
2.43.7

