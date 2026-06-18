Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8742322527
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 15:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781795560; cv=none; b=qosDCU/mRWXgUF0fqJd3jiHCymNdRFjMISNfOMdKt+DOGlSWBeIN7fy3zij/xB9yAObOmbi9ZJyn0v1dMoMb+0bLuu7b/UO1ZzoNRnfNZEporLsfAYyon1ny7/IcsQF7lk2C3WLV3w4I8V8v0X420JsFSHcETR6GsAjbVzbRERA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781795560; c=relaxed/simple;
	bh=1Nn5weT47gXh/2nfm2t7tY7Pstm1u5uOMrFMDzLqNCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pD9L3QJp33FlZoRlupefDNS97vGbkhjJdAJcgjG5seWiMSENkWIGnbHgifmPR8Uh7EkvEIhJ3WgkJhGH+9tIMU1l1wsrIju58N//kB3sZ04aUxZe4XAd1HnM1rvIWB8ICmbHoLMR2GSMud8ft0aMwJmKttplWGbDVnYp+E4kEx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLZJMZUY; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLZJMZUY"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c6fcfcdb2bso6210575ad.1
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 08:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781795559; x=1782400359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPN0wqmrsdSUYG6St5Jzt/7PWrAPs2sWRIzu+Bgh8z8=;
        b=GLZJMZUY28XEOo/wgeT56OI5E/vmNIvEJAM6nfUp4xcny781KwfWV8sw7rLHs43aM2
         4QXZtALetxBVnczfLoPDw610MXE6fEaZlQv7mYCM8jPZpOGpNFLLzJPlDMcqJqdAhQVk
         16BGoeh1lZBlr8KSm2qSrojH3bhgHm8gdllW3oJpOj8DFKlMxvxNP0QIp+PCN7jnAe1U
         xqAyq6HPPWt93fxI6AEbJ7ZQ4CGLMPixtf5M+fyQmZZCvrBD9BlIr+IionfrAFUKnzJb
         n+1BCRS5Yx8UxvohqWOmX4NzKwoy4hY+HUcBWpIbSV0v+9KgYvhu+O6AsdqnJu1wcYB9
         OMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781795559; x=1782400359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DPN0wqmrsdSUYG6St5Jzt/7PWrAPs2sWRIzu+Bgh8z8=;
        b=H4Q+6G/sy7sH6xzAYbv4y3cTdCGwcIK7e+RWEDV8mecL9S9zdlRh/gjYjRU3/Vii+g
         nS0Kfltyk8nrvKY5gISL+HS9EgQWgpS+TcnFOMwfohNKy2T8vz+eFIOQhQicGy4Jvngc
         xvbL4ggkaMxUXjzdbkY6LVPkiC76rKCtHN1opoe8iiiOHdK1E5fGm1hRlx7tzDx4bKqB
         YsDZcVShLfO517QhsO8qNn1ogyZL1gvA38hAUiTwsUSOd6zM3NBflEB/ePutTp9KFX4L
         xCBaomMGA35TgFxg2k5VKT819pedJ7iScsOtaBc290rafY0JLAg7Z41iEWBhchEzjhCV
         7Bxg==
X-Gm-Message-State: AOJu0YyL2ba3c5yezWRgs/Ng3hXwdJ12+B7RVfkmM0NCj6KJOaJLsxec
	U6SvDZOjyU6/nF7hSqZkbl8ekgTWAth0sRyuDdbnWp2O64/8/w0ivzyQ7EoOHLZ0
X-Gm-Gg: AfdE7cnASLsugsKUis7O0IET2JBNhPFMT2Hw7PO2tI8nzNjZhopSl3J1voM6Tj+7iee
	NnQByb6acf7CA95tOLTyCbEGT7SeqaX/nwAivEFFzhStBd7/1aAC6I1W14IOFLmjBqXegmsSrZ+
	gQ1JEVg1gUCjEILUklfI4Wl8c5sdj3TSSU5rROtwBqHuBf9OJNzyr9slCU4ZSFAUGrzet29tiaL
	F11+v++7/hah3RGM0sqqvrJX9qpPGAnKMHrKO0Pk5EAljQU5TjHEPPoYj78YUqVNk6EuNJffqNS
	iZy+kggaovVir03S9RBjnu1JpQLmLFVQrnqHJFhIsbsEiAvxKw1chHJ2zhxwxC9NbMMIo/UGZy9
	qUsHQ4Xp76zPXBLJdt70OLiT+Pq50/Bo8ZNEUfnXerhFrgQ/Sdrab8USTo3Blalww7VBEcJuPll
	CPbb7SxX6itvfz0Vg7oY+WIKfpsIU=
X-Received: by 2002:a17:903:2984:b0:2c1:e426:70f4 with SMTP id d9443c01a7336-2c6bc20b6aamr93059915ad.23.1781795559045;
        Thu, 18 Jun 2026 08:12:39 -0700 (PDT)
Received: from vbox ([117.251.163.66])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6a403b242sm82450325ad.31.2026.06.18.08.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 08:12:38 -0700 (PDT)
From: Tejas Mutalikdesai <tejasmutalikdesai@gmail.com>
To: devicetree@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sstabellini@kernel.org,
	Tejas Mutalikdesai <tejasmutalikdesai@gmail.com>
Subject: [PATCH v5 2/2] arm/xen: Update DT binding documentation reference
Date: Thu, 18 Jun 2026 20:41:47 +0530
Message-ID: <20260618151147.9438-2-tejasmutalikdesai@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618151147.9438-1-tejasmutalikdesai@gmail.com>
References: <20260618151147.9438-1-tejasmutalikdesai@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the comment in xen_early_init() to reference the new xen.yaml
schema after xen.txt was converted to the DT schema format.

Signed-off-by: Tejas Mutalikdesai <tejasmutalikdesai@gmail.com>
---
Split from patch 1/2 since v4 to keep the binding conversion separate
from the driver comment fix.

 arch/arm/xen/enlighten.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
index 25a0ce3b4584..0b7b7e3417e3 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -251,7 +251,7 @@ static int __init fdt_find_hyper_node(unsigned long node, const char *uname,
 }
 
 /*
- * see Documentation/devicetree/bindings/arm/xen.txt for the
+ * see Documentation/devicetree/bindings/arm/xen.yaml for the
  * documentation of the Xen Device Tree format.
  */
 void __init xen_early_init(void)
-- 
2.54.0

