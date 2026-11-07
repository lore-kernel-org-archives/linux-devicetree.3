Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794038836;
	b=YPRGuoDrRMYxbfJ2+e/nvW01NJplKbHJHyNDBbq3txuYIKSCrmIQoZzrhwInDDz8nE3N
	 kIjUQVMnte5onGRP559CoFdVBNNDCbJd7oBtXXEZluXyOxtF5htP2TrovOYEu3LWQWWb7
	 rjsECGSKPdAf4obsHli1iFoC51EiUkL6CN00w0WrtXZsdJhkky/GMM9EV5zwtmkwNoejA
	 GY+ymZ04O6NM/n30weYdkitPn34BdPV5zlsMoiKsaFOfE2Y523no7BPmVXdrCWCmaILkT
	 kKtH8Y73QJtWM6x2yKFZn75B3J2W6GvbBOizHJ8ol+ZIdJ08ph/WJvElh+vNub1S0MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794038836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=x6OX6qz/WRgS6n3RRGF+EeBHclWuHgdA/NrgibX9lXI=;
	b=XjZbkjc7dpDjBDjP5suQdShPIbF9BXt90CxnEzjdkn8RUbN0dccQ5DDAr+nBqXtZmK43
	 Ew4tByJGcNzy0g941pTO91PjDw9K1hwtD7JPWU3/PyxhkLZ46y6Xfm47XE+1xpZSMpFWP
	 559eABp8GDPYJWYkJcJxwIBKrdrKXp2PSn4v/c3nckERZ2pfFwlA05yfbiew7s6/Ddij2
	 KmErtsLjkw+fG1yBL1rmrQIqExGCJESNS5IyirOoNY1ulMomMTx03jQ3/uX8+J9kNaNVZ
	 wGfZoUxhyhgkuLq3WQEp/XHfqaO/cieyf5/lx6Zl2X/ANR8fpaZOPEEFk+WLvJmsdow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=osyx.tech;
	spf=none smtp.mailfrom=osyx.tech;
	dkim=pass header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=b5BMzb4C;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB46F606A332
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 08:07:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB46F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=b5BMzb4C
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso12804225e9.1
        for <devicetree@vger.kernel.org>; Sat, 07 Nov 2026 00:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20260707.gappssmtp.com; s=20260707; t=1794038834; x=1794643634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x6OX6qz/WRgS6n3RRGF+EeBHclWuHgdA/NrgibX9lXI=;
        b=b5BMzb4CKP+DlmGkkuc3flNcQ3ZI7xbcs3yZvaluaBeG83K9/VtBHGJzJ6ijYZmcxN
         HVCI2wvvYO1gQU21f2r8u8rTc9YEbfkufMyXByhACRgUnV60nUiPBiFtnl6laFHuJpLV
         EGpmxmksCLNhEyrvzLAwPG7X5eNrgYnBnONymlkPnn/Z5CF3cQ/WTytoBbIQBUwYXtel
         oeeMD4+/bwSJQ1SWLVwtAO1KJFnx8OzWQbEbjViTUrThGxoui7P0yZDZv9Dvq3Z9yXPu
         IQM5WRUY5V7Y0MJuVl+GrYIWO/Rc8cj2dwHZAGyS0GKOyeOnAcKYFfRVhrT6HCPasrig
         L+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794038834; x=1794643634;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x6OX6qz/WRgS6n3RRGF+EeBHclWuHgdA/NrgibX9lXI=;
        b=JCkdh64WwRMY83h60sUtTwfaBrSD5fD+hzJv/1St3HnGjwka/xKAnIVlBpnR2C8hDM
         3TRG7sT57D/i+6Y1Aa7O6PFAe1c5LLS3M8FVmPZ8b32y80hD8tWAwAcLIVwIlt6Iz58P
         ZnX3McGEJrvdsd6I0YhsI3dWQj1W5BM96jJtDuPkCrIYIbFARxZ6TaIbUeXl0ZGKKH/R
         3J7kViHzaCeZL2vyiePsE4fCte9WMG3Mq6EOGlRoBm3TQBjFz8VbwtzZMDdsWX+m4C4z
         JZ/UfHKArxrGKf1mR1CXcPZWbe0VQHFBSo5eU6gBqFGBsqM4H2QVAR65TmSIkqEgsCOg
         N6TQ==
X-Forwarded-Encrypted: i=1; AKwUvBxof8I4FQJhSw3E0ekoux0awSs3/z7TuMZYYG3QqOjOI29g8ScYkrPONwk+kaRJuhyUSuOZ2Pwdq4vD@vger.kernel.org
X-Gm-Message-State: APuU4Z8fnEoqwNbV567Jsj8ZcTJ278t7dmYUQ1a/8HS5RiCGBHvHmoWA
	3mSY7eYgKC9lSjN45cNAXWMQtVYMAuhFLC549XuJq3ASLL0+1n+PV2DcaZv1ON7/9UeG
X-Gm-Gg: AYBFou3PoZAgEz/7aWNNrMf+UJFNox49PVKF/8ZUI01c1HjX18lu1at/fbLj+73qMtl
	jwRKCnN+PWyHU8SEfF37y0xWxhd5HXAA46GQ1X1POVWf/12UGrPED8Gz8R9i+sWzBzaaJuCM6XS
	/K+dy6sjZVJJNpDrsgIOWmP0zvXyN+uduntpzi7paBEdUACeswanwVmu5r0aCBixWS8dFfo7C0N
	Kcyui3y9ZfS3CvVW74mJzrIMq9V7atRgFTMhkYtQVUs9/YkujQ+WNfffTmjuS+jkNhrvP+qpb1c
	+pZjL+F/Gt2KQVRNEKIak/Mw0LnIqf/KLNr6mbJNlbFzxNdSRXA0cWcUbJDDQdGJvQzhqyyTu4l
	1YoAhbXuihjxjWAoBDYK6FN5193SfUGnpzCqVi28vxyfdfVN+brUNwFrBHGBKcM7oUBiNjRcBJL
	4cvZUszW0Y3K/sgW3XtjQz8C1I+yEev4G+3E5PM5AaXNaNTvEvCfPqzwsBlRf2wEGjFjsj4yPZv
	w7qVHYlC92hCfzUeRSsvhuULi6q4YLdlH3S/yr3HOql57e5ar1yNIQXUaFSbfVfhBJ31oF0pdaE
	lczg0WO48S+JyZbWbuzeTwhLJ+kQmg/5L3ueG8q1F6oTX0oUc8JC
X-Received: by 2002:a05:600c:3f0e:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4b6db0d060fmr83181085e9.2.1794038834255;
        Sat, 07 Nov 2026 00:07:14 -0800 (PST)
Received: from jp-linux.tailbfef0e.ts.net ([2001:8a0:f59c:a900:ea06:fa16:f0a0:9d64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e327a652sm43927455e9.7.2026.11.07.00.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 00:07:13 -0800 (PST)
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
Subject: [PATCH v5 3/3] MAINTAINERS: add Bao hypervisor entry
Date: Sat,  7 Nov 2026 08:06:52 +0000
Message-ID: <418eb111fc016706fb64ec91cbfb077ce31e4577.1794038390.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794038390.git.jpeixoto@osyx.tech>
References: <cover.1794038390.git.jpeixoto@osyx.tech>
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

