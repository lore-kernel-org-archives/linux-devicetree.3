Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10903AEF33
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779268762; cv=none; b=n/pgmILdklgDFitxgvQvc1YK6qMUc9hgoVx1GdzG/MfMK2MldzbkETeWp9yw+d8oiwsprE6ghzr03BO0/st+DjKKgVjc/KoIpLd9lkTVOyKtkcerSBPi6L/eteSZlCPJHLgrlWAo+hk3Rn/8XcUUHGtCGMvpEE4kvxQnCsLYdM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779268762; c=relaxed/simple;
	bh=1mrJpHLdgZoQ9z8hnMeKjo6Nk1qat8gxfyVXkzyrD20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mUVHRM0xiTz7S+rf82IV6B0HuusCCHO4lfl4nUHDC9HkKS7f0qiCwcSkfKqOCd8aJgaMXDhGWyVi8kBylOm2HY2d0mhRP814RGWOd6384xi/12Nz2yFru/kZv517ZdBkPCDRwJlgs4ircwQW9ti91Mq3u3PwWu+Myw1bg7D8vj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GwLq39LR; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GwLq39LR"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-82faf871346so3619844b3a.0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 02:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779268761; x=1779873561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9oyw9vanLGG7tQ9dBSW9pJHSWXBGqZj5GxnQmef6pVg=;
        b=GwLq39LRIUNkKgBqO6N2HEA8OiLYOWUugIClJQwmCsqqtyLOAi9T6hAxa/XX71i7mR
         mQk+G2B65k2NC2X34EYv2tE+BrI8uoQIUr+YX0mSbVCxkD5BA7LkIKx+hPkod5o7IaEb
         Wt0X2WIiZvw256O2xG5te/wPn7hZO1Grto6iloLUh4q5p0lu+LlOHJyFRElUMVvZrG2E
         zL6MB9wxVoA6906DbxHOm8tOwV20m/PqoHNNX4DRS0eaGjurrL4fwJ7XaNQ8ok7NOp33
         2ZTbe/gRnMfud2GBLhc2xcY0lVHnw3t9045R6sxkOjlnoXQtEtDOte86mfmrB+WFF4Nn
         ho7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268761; x=1779873561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9oyw9vanLGG7tQ9dBSW9pJHSWXBGqZj5GxnQmef6pVg=;
        b=bWqv21tAfxcfDF2bEOFlHHffhfg8SNcbWM1gbxnopPOi6ILJVooBFGoH/hXEsmNI/F
         37V9E8Fc71p2y8IzuyaMvPOZ1ArX3raURByF1S74dZkx6rfhs43wXqxJJvhNddIBlaAz
         YV9RMO5lQuIQz46elTJNixL7H6yvNT5caB34Z3M6uhRH76v58L8qLJ8OyiQWcRUXp/sx
         IWGrGEvDInfxKW5v+93Y0h3930MoMfKOcotsR4zkBqtFGbdnF0W5/ynHDYuoHkjT58Le
         ddaADxNIlX4oEch3RXwZaxF0uBOHGz6ljVGzS68AN8acE4CzbucPF0+eI096xgIXLfUL
         DoQg==
X-Forwarded-Encrypted: i=1; AFNElJ8SIP1j/s/zJerZ/8DTe1CKDy6vrBFsC86+KaJSXpMhLXf18y/xFt75/AeXy9FXD2459SwRDSsjOagD@vger.kernel.org
X-Gm-Message-State: AOJu0YxEnIOhn+jgGOeFk4Bq26SZaXQbPklZ+dxb5ZpTtu/yba9nIo3w
	xXTPyMJcu53l0ejK/2k3k3Ch3z3eXbT5cX9g74xX4AvAToFgY9ZobzI2
X-Gm-Gg: Acq92OFvIRlDnyM1km1q6YTqXGy9L1Ej3g4GggrtW7iwNUR7JfPxHyxBE0lQNzHEtDe
	PvhbldVHLNwcK00zNaMTw45H7xagcptPPCvTXS6xBwFpMa4ZrDCQW0W4oDu9V7J9hIymRSPL2Y7
	xDM+mptA13D8Fzwy6/2jqvC5kvOtUnlg+FsQQcLC0WqNonhiTL6nDMLcbScBK6QQXGB7JM0wtPm
	WrdPPsEEqwznbvjUDEnox3vHORuYq0gOuoSf1TwqUowiqQrnbz9I8eHvARrUBlGT5ovhY+moMQN
	ngDW1u3W2HuoEcdFxT8tqFA3fD2oVQCV9gnEWQPnX51sb4/qGZZtBM4MOEBQl+XHf44ESM5gnbF
	2P+56r2BEZ8xuYGOq5SY48ree3wbmgcUDR5b0/SyP4Xxa+ro3AGOqDs1ybbp5BD68oE/dEHMJdG
	wQdAzvBCM80qs/vchuFAPDe5J29dax8YDUdrEAbg==
X-Received: by 2002:a05:6a00:3289:b0:82a:7aa3:a2fb with SMTP id d2e1a72fcca58-83f33c9b2dcmr22248125b3a.37.1779268761111;
        Wed, 20 May 2026 02:19:21 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f63bb986dsm10208967b3a.48.2026.05.20.02.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:19:20 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
X-Google-Original-From: Wandun Chen <chenwandun@lixiang.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	leitao@debian.org,
	kees@kernel.org,
	coxu@redhat.com,
	tangyouling@kylinos.cn,
	songshuaishuai@tinylab.org
Subject: [PATCH v2 2/8] kexec/crash: provide crash_exclude_mem_range() stub when CONFIG_CRASH_DUMP=n
Date: Wed, 20 May 2026 17:18:38 +0800
Message-ID: <20260520091844.592753-3-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520091844.592753-1-chenwandun@lixiang.com>
References: <20260520091844.592753-1-chenwandun@lixiang.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun1@gmail.com>

From: Wandun Chen <chenwandun@lixiang.com>

Prepare for an upcoming change that excludes non-dumpable reserved
regions from the kdump vmcore and will call crash_exclude_mem_range()
from generic, non-arch code.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 include/linux/crash_core.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
index c1dee3f971a9..0033d4777648 100644
--- a/include/linux/crash_core.h
+++ b/include/linux/crash_core.h
@@ -87,6 +87,12 @@ static inline int kexec_should_crash(struct task_struct *p) { return 0; }
 static inline int kexec_crash_loaded(void) { return 0; }
 static inline void crash_save_cpu(struct pt_regs *regs, int cpu) {};
 static inline int kimage_crash_copy_vmcoreinfo(struct kimage *image) { return 0; };
+static inline int crash_exclude_mem_range(struct crash_mem *mem,
+					  unsigned long long mstart,
+					  unsigned long long mend)
+{
+	return 0;
+}
 #endif /* CONFIG_CRASH_DUMP*/
 
 #ifdef CONFIG_CRASH_DM_CRYPT
-- 
2.43.0

