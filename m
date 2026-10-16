Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467BD45D5F6
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141779; cv=none; b=pPAvumDUFHsWcmf3G1OtH9tM7kY5JMDCoEGeu79hwg+z4H91xcn/Gb9jXVygdeE7HuIgAKMRdAFmU8SQVzh1/+bUbzH5+Wxh6o7Yy9qItlSyFgC9ivSdHXwzX7Qh9dmYfTgE1UBE2MzzrrYzanznTGvIKCj9iWT875rcP2XStgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141779; c=relaxed/simple;
	bh=zoRBRCh+klw0RRHEztBmxLr3kasJ1/aZu+NJAAfj+oc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V13xe+UpY6+VFeXBG8aLwSYyrE67kmfN0oQYXx86m6TCSHKYgnu98UFX6wMwhlIgCtovB7QmyXp4jrUlvpZdjOHaD/qrFkwy/xXS8bQm+pb8/ceKFkGeWtmbULKsSwxfOTHWcvSrxi9mhAgpNNOYx5zHTrooF7BFaKkDZj5Sv58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YHdsQZyT; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YHdsQZyT"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso2692628a12.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 02:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141778; x=1792746578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wvlNIlYEgFWeMZAtJnAcYjBkprd3tjTExXS+TYQe1Ss=;
        b=YHdsQZyTrCsNrISRMw/nPtW0pA+sv0KsPDUDrnb47zXcwKby5/mssYSKNbIhwxtMNA
         qN5VcDSJINSCJfL+r9aaXdonQPPRgqBOp9E37AUGy9TXtzh/JXv88FBI2K0yEJJYtoPH
         lIwNk5//BH34kojH0C8eDCqU6oTfxBM+yPpr6DHvlvGnxe/7f7lR4GxvBP8FW2c2tnkr
         fyWkY9KKWu3WtC70z3M+6a/o3SKkNjPtyOcadcQaiiV93hVcygvqBUFjR6Jfm3mj78lE
         ESoqc6Eq0d+IAcTORTTnsmFpiVLxbWUqVDbPgCvSZ8cNxW7zmNx8sSFjDLGGJU4ZuzgE
         AJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141778; x=1792746578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wvlNIlYEgFWeMZAtJnAcYjBkprd3tjTExXS+TYQe1Ss=;
        b=CmQv2PlWOZmDtNSMGwO8aqWNHBBsL3dS+z9poeqORLQjY3zx5/0mLE8g7W/4dl5Vvs
         uR2BzSynk0Eg7L7vfPi5E0lUxC3xno+Z/Wig0HPxbxmU1V3gZIU8B4Cd8xp2+3jWI+bX
         w25cNsR03+S0eQr88pkuvRzJSymMj0bIYVwheblkxP3nW1dZYgGNIBT/yNu/VDLQAVjq
         3UnnQzWO6O3maQrkymqUp9gk0lR0GeeqFYG4KwUq+w24wxxmolLK8cSK3Rhy+EagU0h8
         9jli21dRpEz2ISSlDk1y+hfn360gJmQqquEKPUdEyXXtzy45aESDr2xM4lqQUjJtKJgP
         Jc4g==
X-Forwarded-Encrypted: i=1; AKwUvBw92E7R/O8QWMMAlEIbycoIh1+mezT6F6/xHyOlogJitfZ8cNOGzT6xDkBHJ6osNglzeYdmOo/mE6TY@vger.kernel.org
X-Gm-Message-State: AFq9FYI1SdsI9LqfIgB+EYVMtIvP4dOTv5I17sZlB3dpy9zCSzhb+sGt
	MGOz8SfR5xHA6dKbJ9rbOVk8pufVdu1OCWuOjRaP+qKIWFm09IdHSqR5
X-Gm-Gg: AYBFou1gZNv+pTy+WIsrChGtC6JaCakNyey3oqxJnjsKDL7S45JicLp/1nhPMMFtxK9
	LWeU9MgG4TRHs/xJpDKISp7K47ulFFjvtD2g+cHrN0ZtSlpBJNEvrOX3KB9AOx6DGLqhfIiqyiM
	9wp4Nau+kfv/fy2dpIt1sqSZPdYfUyoJij9vVKz/J+GkrBfLpgPRgs08SgMSH3E19yxVP2gcAdm
	1ybf48+fd0/tFIe1hvCZ7sE2ehmlQOdbF+9BSzZRzLz7oTUywzpnRoAC6/Gvberivg6r0SgcrPD
	50MfNOu3/M8wIthkwyAeQf8Zc52p7DAlpYDzpmmLIaJ9xIx90XJpPk4QJcFCKEeVQmR0diD3DMN
	+rTTNWY+IG8LaJaNmOoJWoU0imTBADhVN7slG5YaQw5HLPBn+G1NN3iWC7P6qBwtKRhh9ksXNF6
	MUIrkixJZDs93SrXg2YRwee/6WEOnDNi9iwayDCRU5BpOZc9cVwNQrcj+DITeDWWl1Ra8=
X-Received: by 2002:a17:90b:134e:b0:3ac:9259:122c with SMTP id 98e67ed59e1d1-3ac9259151cmr4962741a91.40.1792141777353;
        Fri, 16 Oct 2026 02:09:37 -0700 (PDT)
Received: from wyb-ms7e59 ([38.55.195.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc43a1981sm3269097a91.2.2026.10.16.02.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:09:36 -0700 (PDT)
From: wyibo6109@gmail.com
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yibo Wang <wyibo6109@gmail.com>,
	David Heidelberg <david@ixit.cz>
Subject: [PATCH 1/2] dt-bindings: media: i2c: dongwoon,dw9719: Document DW9714VA
Date: Fri, 16 Oct 2026 04:09:29 -0500
Message-ID: <20261016090930.947830-1-wyibo6109@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yibo Wang <wyibo6109@gmail.com>

The dongwoon,dw9714va compatible names the DW9714V silicon revision
found on the OnePlus Pad 4 (iceland) camera modules.  DW9714VA is not
an official part number: it is coined to distinguish this revision,
which shares its IC INFO id (0xFE) with the other DW9714V revisions.

In its register-mapped ("advanced") mode it exposes the DW9719
register interface, with the SAC mode field in MODE shifted by 6 like
on the DW9800K.  This differs from the advanced-mode layout of the
currently available DW9714V datasheet (Rev. 0.03G), which puts
SAC_MODE in [3:0] of SAC_CFG and splits the prescaler and SACT into
separate registers.

The datasheet-conformant DW9714V and DW9714A, used in their normal
(direct DAC) mode, are covered by the dongwoon,dw9714 binding
instead; see the in-flight series by David Heidelberg documenting
them:

https://lore.kernel.org/linux-media/20260729-dw9714v-v1-0-3c479b3cf8c0@ixit.cz/

The module-specific SAC tuning is carried by the already-documented
dongwoon,sac-mode and dongwoon,vcm-prescale properties.

Cc: David Heidelberg <david@ixit.cz>
Signed-off-by: Yibo Wang <wyibo6109@gmail.com>
---
 .../devicetree/bindings/media/i2c/dongwoon,dw9719.yaml     | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
index 8e8d62436..f415f2369 100644
--- a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
@@ -14,10 +14,17 @@ description:
   with 100 mA output current sink capability, designed for linear control of
   voice coil motors (VCM) in camera lenses. This chip provides a Smart Actuator
   Control (SAC) mode intended for driving voice coil lenses in camera modules.
+  The DW9714V revision found on the OnePlus Pad 4 (iceland) camera
+  modules exposes this register interface in its register-mapped
+  ("advanced") mode, with a register layout following the DW9719
+  rather than the DW9714V datasheet.  dongwoon,dw9714va is not an
+  official part number: it is coined to name this revision, which
+  shares its IC INFO id with the other DW9714V revisions.
 
 properties:
   compatible:
     enum:
+      - dongwoon,dw9714va
       - dongwoon,dw9718s
       - dongwoon,dw9719
       - dongwoon,dw9761
-- 
2.53.0

