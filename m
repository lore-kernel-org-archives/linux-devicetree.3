Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989638;
	b=MLsCoi2mgQqOvKkga+/w/rqKuBMdT2rX59jwh3HZ7kBHhEuiECwz6wQq+QckkUJdE0W4
	 bWMaOzLNh2vaiei4lysQv0NOpNgU0M2V4kaA2z8exaQz/SpmaKJG8zNtzf569+uTUu7di
	 KBwcT5+rELDg/8OHolYsPaNaqAadmSwv+GYE2W4gUxrpWrgw/rzvuL51gDxMI5eRhbbKJ
	 pX9eHSvvcjzDB81OjASZDxUOM5tqBue/wCY/ZLP4QagGxh9UJC5HRaJj1DVVfk31TKLJ2
	 nFXi4xT+78FSGK/USQIVPXZrSUZKv3+2Y+Ku7v4+ZJInPoGUKKTiXbn2/o1RX6iIkkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XJZ+Hdtk3ZgO4GcY5jYam6jCeDolIL+Wbgosemj6TVw=;
	b=F4w8GorFh4FGq+MCfakwozbpFQ4eo1V6U0pZomP1sSsCuBZfJdYvUNslRCHMSkgo4YX7
	 KatzPqjxcRLQOpM2Kiwwv3A1i2U1SMsluzu5f2XA23Gz5v/FL3JTDXXzyHxoUNPISS9X0
	 9mHNkI616wHu7kHgGayEzzC5d2zYSkdx5q61TioaT1tMcxiDnQ/uRnukcNeEwh7BQz/8T
	 B4NFtOga0f8H8XjrBtnNJ6ohnJ94g5CYlsCSgMCRt4auw/O53dhgN5ov08QLgLPIXdPvp
	 hgt6wv/PczwNbkSkP2m5aITadjF+5IyhTXfByOnAhAfAiLHZE1rfCV2wUtOKC8KsYXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=CIunQBLg;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63062606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63062606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=CIunQBLg
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso586380a12.2
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 00:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794989638; x=1795594438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XJZ+Hdtk3ZgO4GcY5jYam6jCeDolIL+Wbgosemj6TVw=;
        b=CIunQBLgc0sEPmk5ppffRBSZDZbkW76BiQOaZUO8soHExpBHJnYv8WDK4meLo+agIy
         vzIkRO+obk6Ot1fmhUYUiuYvABmbRemfhQuQUOV2jdimXfCnYvtX0z/+0uFTcD5uBq6v
         Zm/G0xUvKa7xXb3P6PtdF3bbeTMmH5XitnUspTjYLOWzUXJXsyh5ma7+MYGvcq/mCPES
         6GlWX5i55NsE+df9rb6hhDEQKBzvirUY7tAzV1kj7U3hn/59uBGkFtUYz8Xe95QrQqhT
         WySkCR11s4NpK6cZiPLtRM5nQIr9L0rcKuKwYdEvVTutvsF8xk7vB4ParRr9xy+5ClKp
         dt3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989638; x=1795594438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XJZ+Hdtk3ZgO4GcY5jYam6jCeDolIL+Wbgosemj6TVw=;
        b=yIncjRayRFsqdPuTBZP+ebrQTrBOxUnf46STpGVct9/NWQovtyXXcGEyFN5fEMjV0F
         NfFWycJjwin9k0rCK4Rvwni2+sAWSeprrsSaR2zL7XxxB64aTeW1ybU2kCJVVwsRb0PA
         LWe2RUj8s6Ej08PikIPkTrVcKJnZupR4WLWvaxSXllsQYr/7yZP0QMzDRNL0Ilq5lBjo
         KMhQH1pDg1tKfdQNk2+qr6dLZooAhZNYwDsjz9ViWUBgezT1OS1eimLbxAhUr3oh1jtF
         m4f/rAaGXf0DAxijP+JBgOjc+VgZOQJV6i8Cg6ZaBdWR/kwJMf3nSOwG7vcCqNekfoFg
         73zw==
X-Forwarded-Encrypted: i=1; AL+hErFRuAuxjv8WqgSJYRnfhBdI3K40xQ89IgSkFcAEAVKzTu4LwMXb5X1PlroHRgNzCWqfTXnIyfzYSmbJ@vger.kernel.org
X-Gm-Message-State: APuU4Z+Wroq41BqDaY1kRshxJNeBwv6PwR+Uxl11tylOOkOdvSxviG6T
	q7pclJty1eoK93GLXPSEDJjzzQXj9TW4XaE/Cy7Pj1GPG1uyAsdRMjDWKQa+My7uA3A=
X-Gm-Gg: AZFdTZfEpbI5gVmhxH7MoQNTP8TAOrhLnsrVooeR/n/V5ACZaflAWeCIbNmaqteagd4
	ggpiyEB6MjyTvlYl42kpTYbPRKrd+UkVYq0OXKhsFwYHREQiPb8Jjb4xjZnh1qk0AL+PYw72E+x
	w0YzvALOkSW91Id1faL+KcsYOkk50s+xEcqn20aB3n24Y+XuZ0KK2Pd3jW8Um9E8b0pN4N1jOZi
	GsWhnncfAZUCtNrTZFVVvB9BrTHvbVc7PNo0Oubw0RfSB0QqmvaniPOB8OxZ5VuUU7pjj2cuJQq
	VujYODbLXOY5zTZT6Z7XhO2bG393h8ZQmhgq74Q/evbdWGWj6gko1KJtXpXP7NTAVHqsIWAQoec
	zoh4kYykL+cGWASoQuziAuxyl3yzcDf7vkTW3T3h/nWbT2NqDTZSuXbM61N7V76iFRGH+nHcAdA
	d+NAPzfICbwdNZkOwjfOdcqVLp1jmK19Zf+q9U9jX5eBqqH9Rz4kjY9V397qBwyoH1h5yTbaGvD
	yMUrV/+DYM/K284co8wXeo1t86gXEfEU2qvzmm46gtKUQdQJCk6+f7o4Wdyc+22lLg6fm+DGlvP
	IXYFiKI08QYJ9upWfLbVD41F2/K/tqHTQ1Y9I4RnaY+sFWN4iiDvXqu+1Awub8Edkg+ar1xg0cm
	+6TmtDqk=
X-Received: by 2002:a17:90b:1e48:b0:3ac:9e76:aa97 with SMTP id 98e67ed59e1d1-3b3d0640e52mr1931726a91.6.1794989637815;
        Wed, 18 Nov 2026 00:13:57 -0800 (PST)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1acde50sm3254680a91.14.2026.11.18.00.13.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 00:13:57 -0800 (PST)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: linux-riscv@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	andrew.jones@linux.dev,
	linux-doc@vger.kernel.org,
	corbet@lwn.net,
	atish.patra@linux.dev,
	anup@brainfault.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	yuanzhu@bytedance.com,
	cuiyunhui@bytedance.com,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	will@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Subject: [RFC PATCH v1 2/5] riscv: Detect Smpdis and Sspdis ISA extensions
Date: Wed, 18 Nov 2026 16:13:30 +0800
Message-ID: <20261118081327.10684-9-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261118081327.10684-7-zhangzhanpeng.jasper@bytedance.com>
References: <20261118081327.10684-7-zhangzhanpeng.jasper@bytedance.com>
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

Register separate machine and supervisor PDIS extension bits with the
existing ISA parser. Reuse the DT extension-list and legacy/RHCT parsing
paths without adding userspace hwprobe bits or inferring S-mode access
from an M-mode declaration.

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 arch/riscv/include/asm/hwcap.h | 2 ++
 arch/riscv/kernel/cpufeature.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index b5952db9259f..0eea8158b4af 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -126,6 +126,8 @@
 #define RISCV_ISA_EXT_ZIC64B		116
 #define RISCV_ISA_EXT_SV48		117
 #define RISCV_ISA_EXT_SV57		118
+#define RISCV_ISA_EXT_SMPDIS		119
+#define RISCV_ISA_EXT_SSPDIS		120
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 72bce616491f..982231fa290a 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -651,12 +651,14 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(smcsrind, RISCV_ISA_EXT_SMCSRIND),
 	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
 	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg_exts),
+	__RISCV_ISA_EXT_DATA(smpdis, RISCV_ISA_EXT_SMPDIS),
 	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA_VALIDATE(ssccfg, RISCV_ISA_EXT_SSCCFG, riscv_ext_ssccfg_validate),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sscsrind, RISCV_ISA_EXT_SSCSRIND),
 	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),
+	__RISCV_ISA_EXT_DATA(sspdis, RISCV_ISA_EXT_SSPDIS),
 	__RISCV_ISA_EXT_DATA(ssqosid, RISCV_ISA_EXT_SSQOSID),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svade, RISCV_ISA_EXT_SVADE),
-- 
2.50.1 (Apple Git-155)

