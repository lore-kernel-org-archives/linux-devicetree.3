Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794589991;
	b=G22TLbsenNbcirvmVq3Att1RFVvyOhoNgF0sheOnlrK5DEkj2RakfIEK8sAQdKu+0Fhs
	 H2WEIKUMmyHGYL2PbRPWLdjFzzgZxYKnLnnba0kbqLYTOBYAcFUqQIIalr0DcDkPtA8Ab
	 GJihWWBQEx0A8Mb6YSRC/yph2pWygA/qDDzU9FICip5bH8IZuQYQtxpiNNrowb7Ip+wd1
	 CIv2QwnP0gO9ikMLtPqjep2BktTxHCnbhbUMpl3W/JdqnUh4OmdBySW6p4rUhLOZqprY7
	 jQkitSKpZCcq4VmlEWXgMAHLLXWm1aqM92FrZVl4kiqo263YlqCSNlGpL5DOHfunADQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794589991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ifsfeTgNrl5URRYKRdF9Ak2jWUcinyCSFoIExBuQmMQ=;
	b=k2Fhu+htlS6shf7HNwSVeEzKWufsV7pZbPmUXmgoye2hL6X4Gf1Xrsfj0ZPERorQZ7Il
	 4ecL18GK8PDSo8L6jss8I3XD5JtpQKD/sNHKi4eprOIHjYes/3aWopIPLNNpfUgvWz9Q4
	 YUzQjxl4zEmjeeVbiYG26AG1hCr9X7qNUDPGp8WI8omQ15Q3y6uLuNlZIce/5xUqKi6rb
	 5fZHjF2f+0QXQ99lNFW6RrN3r7jzkG/J373lJcXos/+wWYgGMuAn0Y3a+9SXTn/sqSjX2
	 E9WuKH6wRXw0DMO1NsPvFyMVgWeZ1L9ctocwAKZDIPQ5EukhAAEYVlvG0kIGXPFvpBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=osyx.tech;
	spf=none smtp.mailfrom=osyx.tech;
	dkim=pass header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=C9Ott7as;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8244D606A33B
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 17:13:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8244D606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=C9Ott7as
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e10a70540so590034f8f.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 09:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20260707.gappssmtp.com; s=20260707; t=1794589989; x=1795194789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ifsfeTgNrl5URRYKRdF9Ak2jWUcinyCSFoIExBuQmMQ=;
        b=C9Ott7astulg5pcDRttTVqwKCCSW8gYhYkZ47KxsUqYuT6tK6SDyAhFKsa+pFqAm6J
         gDv9o5mwcjFUCVImS7uyYyhIPYEryfhKty4hDp9qofWHVoKOPloB077+MZclv0cCq/aa
         5/TCld+qr5EfAsy5GaPQbDNt+HjRiWyIV1rvMsOKS3CV8hEPSv6XP/49nsV/cALFKThg
         7oipOaS16QaJmQzUKpAl7TRjY5YD4yR7MjLZznJ1TLWLUlyTrve3dIOtD9v+Tv3GUOr1
         L1ouxwEkGliw1/dFLxN256PesKEckWyfKN88fZjmi2j9OXnfd29nQkwr2UL6RCeob+0R
         UYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794589989; x=1795194789;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ifsfeTgNrl5URRYKRdF9Ak2jWUcinyCSFoIExBuQmMQ=;
        b=dY81HdJrv8Y4eiByP9QU2bhq/TIg1MiF6Ol5TYqKrIu+RqM3jGqMDp4RxnebugjpKL
         BCF+cQCIPXoNoQrblVO9x8jZFWbu8pL+RirZZWP1x1WYWcfo5Yw2hLNdJut14uZa7d4F
         rVEKnSrY9Rr3t/mZNZivRTTz6j2zJ7xrlhZujrqSo5TTvEE3laVejw7YT4DyvKnZ0mX/
         /JysbM4d2RmdXS39rvk3EN/SP4VwhkWiShUvCm+meeZwQITFnOIaCLP8HJCD+03phYLN
         qSRdWFDH7uNnZ0yMFZQLssWMt4oh47ZO7+ZnUrnWd8cNlJda9HQxG2OVt2r9aUz44lnL
         Lp/Q==
X-Forwarded-Encrypted: i=1; AL+hErFHnNzzyzi8tTP5oFpAsUTqvLeCN7Rg+cPeOk2qw+mHGQhSHOvXfvF350G/mxaDvkgqU8Y+iabCR2CX@vger.kernel.org
X-Gm-Message-State: APuU4Z/XMkB4zFdeLE5bKnzgPzLzCNeoG0Q3BCRkmlnEn7EdHRAmNPi1
	SRRpPPaml4g1d1I+GPdePSUugtgNCwLqYBl4IyQ2g1cmmBD5dP0AHttwnch4d7uNwUMQ
X-Gm-Gg: AYBFou2V3wJ9WHSi5UbGCQw/ckd6ruBHqoPqSLThMqCJXFo+fw7wmTOPXSbqFTDmHOL
	no3XuYtLl+l4HHeZWgqWVNb9xS4/oD3JvfTNMMdhxKXeA9P8MR+xnsrikfzCYoNBUby17EYfMvr
	S5e4ReB3s8vFcMAT6BI1kZZXcPsHgPkmHiETDoRQ4mbJtllQat1ZXy3e0WBk6U9U0kSH9L581Dg
	l0bndfuLv4uGBao9sv2U6ULcxfyymrZnv/5Rg+7nHXukR252TquMcXdTvuSBbg9YWt0xSBW17NE
	KSgrSZGpWaMKyF58hi3RE0BoYpDL7sq8WHSprEbqIS38VDfE0Dh6cswRMlfC8e2i3pE7rDXQUUy
	N28ug2KMKrEZyOx0RYyl55lWoODKqvAJSVcD/rn5V5OJx3Qez6qgCay+rJH3tZ0wgGM7HmswkeG
	3G4Wd4X7y9OnYcikfUYOq8pNWbegXya2dm8U3LVrbiSFkHe04sNNfaYxTiC6Po8nCU1blWrH3hh
	lK5irDjtb8OBX+7NfmBGdQKameZovwQdlF2IlbNMmmN211VQ7OvlO1pOn9xqEZJTqJCTplEcMoh
	pAHgAa+JAEvb1gVmFX1fTuhghJgQdZBkkQ==
X-Received: by 2002:a05:6000:2f82:b0:48e:4e3e:45fb with SMTP id ffacd0b85a97d-49c73631148mr6928682f8f.22.1794589988794;
        Fri, 13 Nov 2026 09:13:08 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:b5a2:ed52:66a7:3ac7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c69406640sm6001643f8f.12.2026.11.13.09.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 09:13:08 -0800 (PST)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	will@kernel.org
Cc: catalin.marinas@arm.com,
	andrew.jones@oss.qualcomm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	jose@osyx.tech,
	davidmcerdeira@osyx.tech,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v6 3/3] MAINTAINERS: add Bao hypervisor entry
Date: Fri, 13 Nov 2026 17:12:55 +0000
Message-ID: <b50bad38d3e5c045c1c671be4c520c13760c5e38.1794589639.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794589639.git.jpeixoto@osyx.tech>
References: <cover.1794589639.git.jpeixoto@osyx.tech>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a MAINTAINERS entry covering the Bao hypervisor drivers and their
UAPI header.

Signed-off-by: João Peixoto <jpeixoto@osyx.tech>
---
v6:
- No change.
v5:
- No change.
v4:
- Drop the arch/*/include/asm/bao.h and include/linux/bao.h entries (the
  files are gone); use the directory form for drivers/virt/bao/.

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..dbea081447e2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4712,6 +4712,14 @@ F:	drivers/video/backlight/
 F:	include/linux/backlight.h
 F:	include/linux/pwm_backlight.h
 
+BAO HYPERVISOR
+M:	José Martins <jose@osyx.tech>
+M:	David Cerdeira <davidmcerdeira@osyx.tech>
+M:	João Peixoto <jpeixoto@osyx.tech>
+S:	Maintained
+F:	drivers/virt/bao/
+F:	include/uapi/linux/bao.h
+
 BARCO P50 GPIO DRIVER
 M:	Santosh Kumar Yadav <santoshkumar.yadav@barco.com>
 M:	Peter Korsgaard <peter.korsgaard@barco.com>
-- 
2.53.0

