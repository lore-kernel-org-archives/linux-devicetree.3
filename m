Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EAE23BF9F
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 01:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790212444; cv=none; b=Jx5jPoXjjyNlH5M0GOkzxWFJDOBPmMohfAyN43NyPIrD0oiPTKAzYvoq5ATxFpSfoFMPP3JDbpsGboYRJnY09g03p3JxbccDgTjr3VJb9e7TbZd5/qdhDFvq79XSXd4OdaiDn5gMMIHHmWBi2JZS/ngICA1JTevOAwxtQx/7jso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790212444; c=relaxed/simple;
	bh=5k0iMuygLlFXQn9BbSXp9oE5JmPJd8WYIsrUNr6cbXs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hRgNSYrYIM6F1BPFE4dZ1/Xg/OwGpVBp26Zlr15shoTTfMVADviEa6t/Dwdj6AJDXhbTq/KkccI2qj93m+ohiLRic5oVQ9v8DkAiz4o3z5qgT3o+poaG16ypRt7yTXnzT3I3Jp9D5hhckMi9kGTncjiolDRu45MlxfQZ8aOBiCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dHt8JAeT; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHt8JAeT"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93be6d3f424so34731885a.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 18:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790212441; x=1790817241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R/tOsz7lRmLwRWBhmFynbfnzkjixOzoIc2AF6i3L4yA=;
        b=dHt8JAeTPsRhBdE1bhXc+IW7qMbodJePmzAE8drY4kjnakNUrPIT37N4QFClNv75Gr
         jLKRVhvYq7ysi73lTO8KJ9863XCf1uqjAA0415KS8Y1I06s9AxWP4RG60TsoKevGltXO
         IB0ZFSqUR2yEJDgG2J8mmM/d02OHeNJIn3QDo7Nc/oiaUdDhFTWGfOg3YS0rVur2l80H
         UTKA7IS60akegNWc8xANxsEc9ep1Z5BFnwjPgt9sfEd+MlxbaTpkCd2Cs4M2zrXB7BqH
         /Q9k8Y6l7X8qh88EO7Si/UyVrnH8W5Tlxqz1Bm2n//qh/gtZqSkF5LMKZtgo8TvK8mt0
         /g4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790212441; x=1790817241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R/tOsz7lRmLwRWBhmFynbfnzkjixOzoIc2AF6i3L4yA=;
        b=nsVtbisl8XAfz+g5RHxKSnUw2bwKjaZbXIdI9K6eC1rthpEHdwN5MHLfkgUq9cjJxu
         /BD9zax8jCgT8Vd6QrDyO/D03z/w0KO/8V1wspOyfD6zCPjFTFL/949AIKMAK+QvKTks
         vTV1nMi8rUOkAzFkbtzoWJdiGYys7Lhsxqesg+ITkgeaeVracbbPhagy0YdJFJ5PfrZ7
         62WGiZZqFCwblrbxEtkUoglwJB1J6inSqinIXBFylc/fTKIcT0Y20Eibanx5sBM38CEp
         CQlH88v2wA3UxwM+BgjmYOZoXEg3S+4tsaO74kzEEz2F3n9ZLdiv+66/1XrljnLYRlLJ
         EopA==
X-Forwarded-Encrypted: i=1; AKwUvBxo/W6y8A7eMJYaRve426U9cmnj+n8R2uLmIefiTRnh3Lf344AN+XaaHeZ3ELwXOxDvfd9cHinBH+cF@vger.kernel.org
X-Gm-Message-State: AFuF++kTlBr/12fjDgszaDg4cMxHNGcy1DlXeGbzjt+3D7CBPQBsP4wm
	3j6291lNw6zqmdck+accj+KbNR1PBwYyylxddxConC4pCQIUvwFXJPG7
X-Gm-Gg: AYBFou1B4XfJsc5X8PhoHoKaOmFYfgSIrCpNMHdx7q83PQMsdT5XQT8ca/6cd1YFCvU
	Wg2Q6nWeASOYsLA0ArqbkFxsnvgUxoMAikMZAv+CW+HT+YYP8JpCGXPO1MYo5Ev5/hqjM1uKioV
	MeLM8wM+MPYlBD20WEfQ2v/Ggb5kPxcexKomTO/6qvTtT8YzCxHgZciQncwCud7ao7DnfOKQmqG
	06cVEfdI9eNqmyjISz/h7kMr0E7GMQJOvIKFIIAHpqPQvvz+t4PkSNGIaEGMU18GNdPUTTFAOi1
	hDGQLpOChLGUnw4RKxFY+ZcMvinevKeqZta89ufUMHJu/qCrLpL5tkj3LPt1MvfzS4xc2uNSyCZ
	LnJJ2OqmQmjH6q237kXdQqSJN+obZOIAapQJKclZAj/XbTrrlUH71HGMifSdA3MR74C6KrSEnMs
	Wpp+BoB9rJKyliUPU4o2BmAAPRqxObekJh/zHPDwfX6WsFKg0RBJ3Nb6cqg9wSjErWVdoQIJZxV
	/bb7tJGuCXmMByzclV7zg==
X-Received: by 2002:a05:620a:3187:b0:939:a1d0:b5b3 with SMTP id af79cd13be357-93c36670f5cmr55343585a.11.1790212441496;
        Wed, 23 Sep 2026 18:14:01 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c24822e3asm349372485a.16.2026.09.23.18.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 18:14:01 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v2] of: Put coreboot node after compatibility check
Date: Wed, 23 Sep 2026 21:13:50 -0400
Message-ID: <20260924011358.734722-1-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_find_compatible_node() returns a referenced device node, but
EXCLUDED_DEFAULT_CELLS_PLATFORMS used the result only as a boolean and
discarded the reference. This leaked a reference each time the
address-cells or size-cells warning condition was evaluated on a
coreboot system.

Use a helper that checks for the coreboot node with a scoped reference,
so the reference is dropped once the check is done.

Fixes: 8600058ba28a7 ("of: Add coreboot firmware to excluded default cells list")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Changes in v2:
- Use __free(device_node) in of_coreboot_present() (Krzysztof Kozlowski)
- Switch to my oss.patchbox address

v1: https://lore.kernel.org/all/20260802023821.494178-1-dbgh9129@gmail.com/

 drivers/of/base.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index d71ae0449360..f63a9486b130 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -96,9 +96,17 @@ static bool __of_node_is_type(const struct device_node *np, const char *type)
 	return !strcmp(match, type);
 }
 
+static bool of_coreboot_present(void)
+{
+	struct device_node *np __free(device_node) =
+		of_find_compatible_node(NULL, NULL, "coreboot");
+
+	return np;
+}
+
 #define EXCLUDED_DEFAULT_CELLS_PLATFORMS ( \
 	IS_ENABLED(CONFIG_SPARC) || \
-	of_find_compatible_node(NULL, NULL, "coreboot") \
+	of_coreboot_present() \
 )
 
 int of_bus_n_addr_cells(struct device_node *np)

base-commit: f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
-- 
2.43.0

