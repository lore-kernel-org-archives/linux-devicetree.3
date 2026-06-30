Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5763EDE42
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782812832; cv=none; b=EX4R3Ntwn0q9LoNSJssqCdm/pSIJBK/7dkBLpqpFshewuWG4m8LGEoxWec+c1M1zW4MoAoVx0BjQLWBvDhwmQym8u/9CwNCm/U/WROcoMOL6vREkirQcK247gFEik/xuk/eD5o8zOSeKF0LaQ9NFds6PaLrthEWzO5N+L1K9mUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782812832; c=relaxed/simple;
	bh=QoNMGIUYb5ckj3iodRy9nthm6QrHS2TBc4gwTKRkf4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VUSCB3Ta5jqsC7MgrllK4mQTGKEfcnoAChr6LADaFCoXb6H4Kh7cLfzPh1szjwIulReJjaNSjZ7u7JuysVAp690TLM8AinVmWHR/JW0Oi/VEt+Ka2HRkPx8lOXbJFK6BDWI3R2+NZRWr+3Wvt0hz7ZetVvxCRdtMqJyagIaAL3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=KkoHJq1n; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="KkoHJq1n"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c9bd2f8bf7so2953125ad.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 02:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782812831; x=1783417631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uoDvUFSbpWFWDFAGwr7Cb8xFfiU1BKwTjMo6sTAkXFQ=;
        b=KkoHJq1nOuC1bSaJgz/A9KFer9cL12ihXBQF39OD76WM429hTyQgMuXsMwpkzFB8tY
         EuY6c17BOfcyb5jZmvdNMO4zCvrdnl2wcz/E2/pbh1g15nyCYJ+2Cn9Bo80Z/CQfuZSU
         8HZBH9Pybt7kYiecC1aoPfs1Hb93++W9LS42dQ8e5XTWlBobiUcWZXkQrgaq3GnEQJx5
         DYdsCHv23o4W2vsBkgE6eIcpdBYerY/xM0dxpRS8hXl9wiUBaco3uHm6WZLPxx3hlzIX
         XqZR+KZcQC+a8e9p79F0wiWqD8ayXTiZmhb2TkDylxx2/HxLz+YVvYmvV8UjL3v1J7NE
         fQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812831; x=1783417631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uoDvUFSbpWFWDFAGwr7Cb8xFfiU1BKwTjMo6sTAkXFQ=;
        b=I/Ytinsr1jM/ltHEzVLeZbaXdMzMxNkXyNg4/tR7AGfjqsY+GrAZPQpiWf9+b3uGiE
         zq5+/Vuo/JWgyW3ZsEPXaagMa5kwsq0fWVdIrspL2oXYcQ59izu7IxUU9cPqZ9MjvCxR
         Iu7MOA0pGx72PPYNA1Dr+GzNTdNDufgP0K+5hF2g7xbEvWlZx5mAB79S1PbZgnURxSNM
         5i4klbZ8JFhbry7FrlINSBUouI4ui44f/uLjZTJp2DYiYHMVjM5sX1/SHf9GBYP5CngJ
         aoquHiQtAzclLv9GphplTSPAIuwuMUmn3DNv3a+sMw9XbX7RC5wSsRd0qpKxpIoOdjhl
         4a3g==
X-Forwarded-Encrypted: i=1; AHgh+RqhE9Yk5HfCUkIwyLzW0UUuTlYH2Ecst0BXprOtVLhCE/W6MuISY4urmDnb1Swmn5sEoTI3WyTsJzQe@vger.kernel.org
X-Gm-Message-State: AOJu0YxOEEnI8R4aAPYvMm01CSXd7tLTi/AUulKHHbLX9Nw0ucIbiMrf
	b3coXmbvmh0h/am0Ja+DLqqCZfKdrTob569m3kVMd2Z5kvqGTVXUbK1SRLRH5bl4maEMfKXsSkr
	omnv3rUOMvEkymDQxrOo70T5ty+JlnGUaZTIP12ljIshDTv2ZcwhO8sV3I8E28NiVva+5xr5qb3
	kBHfo6Ox7u9rSHx4qwbuaufVDr5qIt8lx190eK+1dt+V2ubntxMlyhvQ==
X-Gm-Gg: AfdE7cmlHov8QYuopZWft7lk+LnHEl6Y89Bj7B+7XkcgeQeudEUQ3yd6peP/ueUTtUg
	ooeVdAIgZX5hjgBN+W6sSJXxgGs924D6CNw9VxtTxnxwVdCUqGMBAuRk77/UlzaC23KpYvOe9vn
	6EZPq5BMc2sBNVJPLc9p4ZQ4gOAuiqNpvWc6AYSczP8z6HV/YmPn3XAXyzAHC8tfQHeIz2fYEIE
	CwFKUQMG3qC/1gc7dkIQk9wMrMjEK5057bSx9hZ1HwOkua0eNfhQlwy3DiLho4cmpcnHBZTMWbr
	N7bge7nOYz4aAklMyHvnwMotjMQ0Vo5NzPAdMJ0K2lCt3M2/aWjp0bsEETxEjJryijO+zuYAym2
	z5EFEKrs1NHaN7kWIEGKvuHv3tO1LjmlsbF2uyTaNO4z/QfUMlKcgPnV8SjcfGPlKXLzdB/tnNb
	Kt7q+RvhQ2OLHgveZqsB6XQrrCzispEWM=
X-Received: by 2002:a17:902:dac2:b0:2ca:5023:f983 with SMTP id d9443c01a7336-2ca5024043cmr2642635ad.29.1782812830607;
        Tue, 30 Jun 2026 02:47:10 -0700 (PDT)
Received: from EricL-ThinkPadX1-TW.local ([136.226.240.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c87bb8sm10144675ad.30.2026.06.30.02.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:47:09 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
Date: Tue, 30 Jun 2026 17:46:28 +0800
Subject: [PATCH RFC 05/12] rvtrace: encoder: Add pre-ratified support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-5-c9c1ffc64e4b@sifive.com>
References: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-0-c9c1ffc64e4b@sifive.com>
In-Reply-To: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-0-c9c1ffc64e4b@sifive.com>
To: Mayuresh Chitale <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Greentime Hu <greentime.hu@sifive.com>, 
 Eric Lin <dslin1010@gmail.com>, Eric Lin <eric.lin@sifive.com>, 
 Nick Hu <nick.hu@sifive.com>, Vincent Chen <vincent.chen@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782812801; l=2855;
 i=eric.lin@sifive.com; s=20260630; h=from:subject:message-id;
 bh=QoNMGIUYb5ckj3iodRy9nthm6QrHS2TBc4gwTKRkf4U=;
 b=axAYvX5FAxovTVQcAx9nJEbghhz8lRFT+KV1TWlo1K9KXq8vpVIQET+BK+hsKzBCwbwm1mcTb
 y2p+lqIszsgB2XKqeIMjNFdOemHCdTsKNxIFIdPwnF7gP44fq0Ye7th
X-Developer-Key: i=eric.lin@sifive.com; a=ed25519;
 pk=RLPQN6uNJ1cSM8GhP+L++2j3pf5ohznFbkNdwIO1XDw=

Add pre-ratified version support to the encoder driver and a
pre-ratified match rule in rvtrace_match_id(). This allows
pre-ratified trace hardware to leverage the rvtrace driver
framework.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
---
 drivers/hwtracing/rvtrace/rvtrace-core.c    | 24 ++++++++++++++++--------
 drivers/hwtracing/rvtrace/rvtrace-encoder.c |  2 ++
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/rvtrace/rvtrace-core.c b/drivers/hwtracing/rvtrace/rvtrace-core.c
index 12ffc6917c70..153cf3ebffff 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-core.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-core.c
@@ -70,7 +70,7 @@ const struct rvtrace_component_id *rvtrace_match_id(struct rvtrace_component *co
 	u32 comp_maj, comp_min, id_maj, id_min;
 	const struct rvtrace_component_id *id;
 
-	for (id = ids; id->version && id->type; id++) {
+	for (id = ids; id->type; id++) {
 		if (comp->id.type != id->type)
 			return NULL;
 
@@ -81,13 +81,21 @@ const struct rvtrace_component_id *rvtrace_match_id(struct rvtrace_component *co
 		if (comp_maj > id_maj)
 			continue;
 
-		/* Refer to Ch. 5 'Versioning of components of the Trace Control spec. */
-		if (comp_maj < id_maj)
-			dev_warn(&comp->dev, "Older component with major version %d\n", comp_maj);
-		if (comp_min == 15)
-			dev_warn(&comp->dev, "Experimental component\n");
-		else if (comp_min > id_min)
-			dev_warn(&comp->dev, "Newer component with minor version %d\n", comp_min);
+		if (comp_maj == 0) {
+			if (id_maj > 0)
+				continue;
+		} else {
+			/* Refer to Ch. 5 'Versioning of components of the Trace Control spec. */
+			if (comp_maj < id_maj)
+				dev_warn(&comp->dev, "Older component with major version %d\n",
+					 comp_maj);
+			if (comp_min == 15)
+				dev_warn(&comp->dev, "Experimental component\n");
+			else if (comp_min > id_min)
+				dev_warn(&comp->dev, "Newer component with minor version %d\n",
+					 comp_min);
+		}
+
 
 		return id;
 	}
diff --git a/drivers/hwtracing/rvtrace/rvtrace-encoder.c b/drivers/hwtracing/rvtrace/rvtrace-encoder.c
index f0a4ac46b6a9..f3be47e448cf 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-encoder.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-encoder.c
@@ -98,6 +98,8 @@ static void rvtrace_encoder_remove(struct rvtrace_component *comp)
 static struct rvtrace_component_id rvtrace_encoder_ids[] = {
 	{ .type = RVTRACE_COMPONENT_TYPE_ENCODER,
 	  .version = rvtrace_component_mkversion(1, 0), },
+	{ .type = RVTRACE_COMPONENT_TYPE_ENCODER,
+	  .version = rvtrace_component_mkversion(0, 0), },
 	{},
 };
 

-- 
2.34.1

