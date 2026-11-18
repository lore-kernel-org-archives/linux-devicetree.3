Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989630;
	b=p3nvbhdJm9T6vZ4X+EkYmvQFSxhVMce7m9bpbH1qOD/y0fAds98PHEAGdSlzj4E60nhT
	 afefGTgRp6zJiCLvnnTHIgWQyMrU23BBkJbFURfjkbW5K7rdCPCxCCbZ0gNSKOLtU3OR+
	 KXKzxVUWTkKJ2phTUKjMC869P1pIsyK6pXe221XFD7iW8sNm6+gN3vImyAeu2MmHReMiV
	 JUlJ+NU2+0n6OKlMkwfR9u5xxe9uwI8tt7MeldMZfquWIMub6HE/DDTeKk6NJkYDsyKV7
	 /dld5YqLFcavozOvrTcS0oEol+Er3Lx3WY47aYgt52PwLT/IrWhxUYvfgbjcvSH/18g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LrvbirXIkv4em6QifUd4OnpixRUwowvXHi+8bl2oRk4=;
	b=Y0gXIgnCadyXrhSaqMesksT3eDzXxSq+SaOExq7HgfJKOerrDuTv2hV97luT1cNRxjr0
	 BbR3TjgD+CaKRU/r37Nhqh2eN1uiO2BjNiZ4HRfZvEmFdWOXbCjGilz86U4FeaW9tFSmv
	 8zVle5XjzA398SCPeAXUI4zPq8yHmSHC3witmpJLaBdb2JuEd4Cey2cGfdp3mo+U9l0mx
	 szjoXW9UkLp2qobcvynotamhpTUKEikxZj5hUF/j+ifb6up9sAA9n8XYqEt6IXD+nQx0L
	 GJNpenZUj0N5dMy9J/3rn45azW2DXKIAl/ZsetvoiWBZ872oA3Nmv4Kccl1+3g47Ysw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b="F16/qyxe";
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA325606A337
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA325606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=F16/qyxe
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b3d4d3bba3so279430a91.3
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 00:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794989629; x=1795594429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrvbirXIkv4em6QifUd4OnpixRUwowvXHi+8bl2oRk4=;
        b=F16/qyxeJCnpp8cEUhvsIzwqbJ3dET3mcVkZCGuvG84FDRLSUKSXvBkFC/dcL95h3O
         nH+PR4V5h9u/CXPhFMsj2uTIAQIRtXn9Cs1Qc/obD1SHjPm/7cFXYoBKt0lWew4PsVZv
         Nkpu6WKaEpUTkfV/bxzun+N3aGLK08cjIVlgVcr3l+1DTbZCgg/jynXsSXRv4Tb1f8Wd
         0jYwQESDhgu9TfRoJ8wWU03yiHbjIPY74faHqETp1xJiWE+6/NB0rxJ7NGS/x48BzyGh
         1H1KNf+bmnqCe57I/4C9YZGtKmqRqeBA9oS2Uu+UmUlnQiI0uSKN2Rv8yBHqPAacLIN0
         yjgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989629; x=1795594429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LrvbirXIkv4em6QifUd4OnpixRUwowvXHi+8bl2oRk4=;
        b=0AzkykfEEJhYdJ6KT3hkMqe3bovw1+vEYoQu0MlaFI00nSBSqcyXnY87aXf8PBfNuv
         fqUxFnugEOykenvdD5FMDbnAbyKg6EK4spC5kIVXRNr6/QeaiFIWGuSQ+vw/zbCOXOBl
         cZktKnd4GfZqA2mwDju4HFQyNv5kXb79C6TIQH6NS9k8FDzj2VMgHZfuVMDGv6MwHn45
         qBS2J9metqGf7rZnP/U8IVWM2sYD4GqVQW3pdwAV0+OHaFze6gZVtzeA7RlKFfmTq1jF
         AU125hD5ltBp6En9yzlHDHo6DzrfdVuf7QV8pfsWJRTwKfBik1TIWP6mx1hDQi9casuM
         ZlsQ==
X-Forwarded-Encrypted: i=1; AL+hErH5YGE9wEVn5porSAIMI47ZeZabkzk02Enmafw0J8ZvjzdrW+cJf1rY76OjI1amWqPeuxAm84DYd9HO@vger.kernel.org
X-Gm-Message-State: APuU4Z+lTOPa0Ug/i1WZU5QQNi1jSyz0k/1kb84RdYrVHA/tISH+2rdH
	OJTXl5qxcEsqz0VFlzx7QQ2O8Md2a1fdpmZQsZliLLOCQmagz/ce5HefdfvwJqI1VP4=
X-Gm-Gg: AZFdTZdw4rKcc4SiNzREkbSWWlICWiIIlRq8EiCf2ZhUlNqkStKflNY2XpOMDfDflnC
	+5qcrV7wPe4v9nfAfRyTt6hYW0ZquE1sLG1Zbv+QsCgThYBW2l7rcOZNsanb5MWstQ3mK5fVwNv
	Fn6KWw2PgcdDM3Eo80cQHkurqvw7TUx9TJqwE8Q8w+B8AfkVRmtSJRXvYYrawtVNYLz0fZ0STt7
	WiaWQuxXLlY28Gq/gzjkMChfUetJLIHTXe8E8W8CxCP5hXjOJdZ4CdmP1Ic3eCuwq1iJ4bUmhvq
	dcGCMftAppHfVoMu0zCWC/ZhsVCtdg0/fs095JzVK9TFznVuEsd4Fa4V+nRiCMfFJOMbrqeqx/r
	7LjdY2A1zyD72oTpdrdZVq2fudYYIpdcD87e5X1ca78SmBT04nK+ps1KmKBhtIY2pwLU+mfYc5g
	XPRblxem/CemiE6C1xggwcEJC3OqNsGi/IkHVWw+Yd32CFNoxt11sDFSmY1m0KMrSM+OCVwKkN4
	lPUYjQPUso1S2awA8KvXBZmsUXskgn97aui2zWSWR9Q1LtiFR4ihlcx3Y/V3WMfFep7f1qZI3p0
	ybw7Dg6/z2nuJx7LVkS/j9YS3ztGJMWLcfJpMFC3P4MIsUaN4gkGeGAXJ/OQelaMAJXHlBQ/Wr7
	zYJdbJaA=
X-Received: by 2002:a17:90b:3943:b0:3b0:a7b5:c046 with SMTP id 98e67ed59e1d1-3b3d07e09f4mr2098689a91.54.1794989628976;
        Wed, 18 Nov 2026 00:13:48 -0800 (PST)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1acde50sm3254680a91.14.2026.11.18.00.13.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 00:13:48 -0800 (PST)
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
Subject: [RFC PATCH v1 1/5] dt-bindings: riscv: Add Smpdis and Sspdis ISA extensions
Date: Wed, 18 Nov 2026 16:13:29 +0800
Message-ID: <20261118081327.10684-8-zhangzhanpeng.jasper@bytedance.com>
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

Describe the machine and supervisor PDIS extensions using the pinned
sampling draft. Machine support alone does not grant supervisor access.
These are draft bindings, not ratified extension or CSR allocations.

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 .../devicetree/bindings/riscv/extensions.yaml | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 79491ef8f86a..afda76b9c7c4 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -214,6 +214,15 @@ properties:
             ratified at commit d70011dde6c2 ("Update to ratified state")
             of riscv-j-extension.
 
+        - const: smpdis
+          description: |
+            The draft Smpdis machine-level extension for Precise Decoded
+            Instruction Sampling, as described at commit
+            2de60e18118ce78e2da82ec33296345c94d8560c of the
+            riscv-performance-event-sampling specification. It defines
+            instruction selection, filtering and sample collection across
+            privilege levels. This does not imply supervisor access to PDIS.
+
         - const: smstateen
           description: |
             The standard Smstateen extension for controlling access to CSRs
@@ -269,6 +278,16 @@ properties:
             ratified at commit d70011dde6c2 ("Update to ratified state")
             of riscv-j-extension.
 
+        - const: sspdis
+          description: |
+            The draft Sspdis supervisor-level extension for Precise Decoded
+            Instruction Sampling, as described at commit
+            2de60e18118ce78e2da82ec33296345c94d8560c of the
+            riscv-performance-event-sampling specification. It provides the
+            supervisor-visible PDIS registers and behavior, excluding the
+            machine-only state. Firmware must make this state accessible to
+            supervisor software before reporting this extension.
+
         - const: ssqosid
           description: |
             The standard Ssqosid extension for Quality of Service ID is
-- 
2.50.1 (Apple Git-155)

