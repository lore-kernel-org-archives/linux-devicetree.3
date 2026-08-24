Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B7445A297
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 15:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787586945; cv=none; b=F650NqmCTk6w1TYp/q01CDFfkEikSBQq0AfbHC2IOAU9ddZYkvB0BUJVh959+gdueXl/GLhIeDdVCYrjesSKpRSSgxDCNhnc1xhFr0eYxuUl4yagGcF+Y1xleExYA/KVkFzFuev2kbfhLsJPVLY+wtZIS7Z9AXNFu/oOumNxyz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787586945; c=relaxed/simple;
	bh=PNvyjChKn3pbDTthHstD6LZXuJxaV2eJcVcKFdqaIM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WxA/Tl4qAvzChsklCJUCp5wAOY9t1beKH8PnZWzZeyiLpF35F1ZcJpXYUYrfNQy5tw7146U8gVNhV5sW1vEhF/bnVTrBuqRN6aRg3d1j+ri4aETW8dwdd6MppCAC+U6FJXmJeBsU/I2TdYSiPnPFtJ4z8oxDKcPJPVQ8mvubmrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mswin.me; spf=none smtp.mailfrom=mswin.me; dkim=pass (2048-bit key) header.d=mswin-me.20251104.gappssmtp.com header.i=@mswin-me.20251104.gappssmtp.com header.b=FC4V2hZ5; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mswin.me
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mswin.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mswin-me.20251104.gappssmtp.com header.i=@mswin-me.20251104.gappssmtp.com header.b="FC4V2hZ5"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c1c26d7e951so548471166b.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mswin-me.20251104.gappssmtp.com; s=20251104; t=1787586940; x=1788191740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+2zxKlrM4sl+jf+tWEo+93mp6Ls/Tsoob0YEldv6RWM=;
        b=FC4V2hZ5tr6vMLi4/QgVOn8N1qzXSv9iEzIwZcNLZnVL+0Omgc77xjSVr/QuZShybY
         rCReg+JkA7TWLLYkmWj8i4jFYRmiwW2A8ueQXUamZd0jZ+r0PzK92xL3E29ZZyxjOMaf
         vQ2bfY12bm81xvrebuPkNlG7DrOC4ZDjULKpxRLZPj1L03DGFED4tiSpF9brD2EgrrQB
         0TDN+j446lQP4z5LzY8Xq1AWlbjBveJQlbs62Qhs3AB9G8yioy23DdD0wzVa5Nuo9e0H
         1LcTJqSPVNLT+uctZ6BIJwi7f1sT4L6CsSTQe20XhMksONQZb08+rjtKjihRsgTo/5+0
         HUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787586940; x=1788191740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+2zxKlrM4sl+jf+tWEo+93mp6Ls/Tsoob0YEldv6RWM=;
        b=XPFDP9QlauYCSlXvHfdb9AnGH4PVZRsyppQ0idCtKPITfU6/KEKB4WAOd6XpI7be4Q
         VqZc3TQOhuJprFiA2SLXTDvjPoR7PRsGztyjteo2xWSYBDydPhUtqSTes8YLvXowtrac
         S+BsomcvwpqX0OAwJo78uuNj0YvQ8PXcbxfBzi4/n3HlkjQ3c3zW8M3vaZEM9tWz+gR4
         cdk1ukJc14VwCHvUOZ7mizjyrx0/zL6yqu4gF/LD+f6xXu7jvB9CPiMOImEMJbipMQ2d
         TBvhPlJOvCk4RZGpV58msPJLZDr5sETG9278IoHv4FG6kMA57/9HRfiFlDEiVzy8O2A3
         3Ndw==
X-Forwarded-Encrypted: i=1; AHgh+RrfDlPepRXP8lgDtsWMBTtO44dU8y2TNCtNZwRzjS26XYFcQv3nPecwksHR1p9+5FIVSM4xVjicmaZp@vger.kernel.org
X-Gm-Message-State: AFuF++kvKKRDzZDZQmgyXQgqxi4EtRuOR3tgc/Y1dy5VBh4ppba7rDtE
	T/HEzPO+IIa78CPvLUhs2K0pUHjBPdx9wQUrxBkxOo/m+ewG2shLPRt2ZeG/2sUlusE=
X-Gm-Gg: AR+sD11U58uC4ciUKthXr9LEHgyv1cGeHJysg5YQTDqn2HpbQM6gjF+DbRFTHdWz5RE
	CDrMrHQ9OwzH7vsejlnfU+IhciswnmuPQ/DnNZ7jEr/my52hl805aQqaUp2bJ5SRl4tU/tz8QeV
	OEHGv4J5zo5URqDsLeLtnhv4dRvRGG0oqFgib3nMhRCHCnn1S+JY3D1wSfQD9ETLT4H1SAXI+bl
	WwzZt6lRWafDjxiIvmV3a7cGt2rVKSb7cq/iwjpavxTDL52KCzEbMcoRF23CrwQ0hvKESEoal16
	+/BBiMfWJV0KlxtRzBpIziutxQhMFZv3Q2+qic+0o3OmBsmCI5h/2TXY4ejciP0yIa7xllT4FHR
	bXAtpVYj405VMwvCrfXr3E7B4UKKLngPU1wc/kNSMsbM0Q0Zxs8utDFPTEzxDqVEYmtgsp1Wvww
	BP67dST9uFowt+PrhDvieOyyIf3AaLUbYPZS3ruOG1wtAGWF+mYFppyUoHUwwGv4nsyH0=
X-Received: by 2002:a17:907:8b8a:b0:c05:b9db:68cc with SMTP id a640c23a62f3a-c2469f7b668mr3038453066b.0.1787586939427;
        Mon, 24 Aug 2026 08:55:39 -0700 (PDT)
Received: from zephyr.int.serkovo.ru ([95.135.208.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24967383e5sm1266270566b.45.2026.08.24.08.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:55:38 -0700 (PDT)
From: Roman Linev <admin@mswin.me>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	barnabas.czeman@mainlining.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Roman Linev <admin@mswin.me>
Subject: [PATCH v2] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: enlarge reserved_mem1
Date: Mon, 24 Aug 2026 18:55:35 +0300
Message-ID: <20260824155535.335494-1-admin@mswin.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821032541.1856299-1-admin@mswin.me>
References: <20260821032541.1856299-1-admin@mswin.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sm6125.dtsi sizes reserved_mem1@46200000 at 0x2d00000 (45 MiB), so it
ends at 0x48f00000. On laurel-sprout the firmware owns more than that:
the downstream device tree describes the same base as

  removed_region@46200000 { reg = <0 0x46200000 0 0x4900000>; };

i.e. 0x4900000 (73 MiB), ending exactly at 0x4ab00000 where mainline
places camera_mem. The 28 MiB between 0x48f00000 and 0x4ab00000 is
therefore owned by firmware on this board while mainline leaves it as
free System RAM and hands it to the page allocator.

The observed symptom is hard lockups under sustained buffered reads,
where page cache pressure eventually reaches the disputed range. Before
this change the device wedged at a rate of roughly one lockup per 59 MiB
of buffered reads from the SD card, reproducibly enough to fire on
demand. With the region enlarged, the same workload has run 691 GiB of
buffered reads with zero lockups.

Booting with CONFIG_MEMTEST=y and memtest=1 confirms the resulting map:
17 free ranges are swept with no bad ranges reported, and the swept list
skips 0x46200000..0x4ab00000 entirely, so none of the firmware carveout
is in the page allocator's pool any more.

Signed-off-by: Roman Linev <admin@mswin.me>
---
Changes in v2 (all from Konrad's review of v1):
 - Resize the existing &reserved_mem1 instead of adding a second,
   board-level region for the delta. Same bytes reserved, one node.
 - Drop the now-unused label.
 - Do not claim the range is XPU-protected. As Konrad pointed out it may
   equally be claimed by hyp or TZ; either way it is not the kernel's to
   allocate, so the commit message now says only that.
 - Add the CONFIG_MEMTEST=y / memtest=1 confirmation Konrad asked for.

v1: https://lore.kernel.org/r/20260821032541.1856299-1-admin@mswin.me
---
 .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
index 139f2b4..027c009 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
@@ -324,6 +324,18 @@
 	status = "okay";
 };
 
+/*
+ * The firmware carveout at this base is larger on this device than the
+ * SoC dtsi assumes: downstream laurel_sprout describes it as
+ * removed_region@46200000 with a size of 0x4900000, ending exactly where
+ * camera_mem begins. The 28 MiB past the dtsi's 0x2d00000 is not the
+ * kernel's to allocate, and handing it to the buddy allocator wedges the
+ * machine under memory pressure.
+ */
+&reserved_mem1 {
+	reg = <0x0 0x46200000 0x0 0x4900000>;
+};
+
 &rpm_requests {
 	regulators-0 {
 		compatible = "qcom,rpm-pm6125-regulators";
-- 
2.55.0

