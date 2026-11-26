Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684048;
	b=T09fFe3Jaq7ooMGmNjpbyKjSy1y5+nBlzbDn0RDvNv5lmlACmLuRGkXnKmcutRdsqvox
	 Rkv+YKp49GfxeEbeODxb9trZ7kEepZuFakWjT779vSnkVR4bMCVNno+Krms6Bzgpxwc4k
	 9GQ3fMPIcUqeBJl/5wCR6HgXG65nDAB3RJy6dOlwhMerD2cwpOPRYLrtnrbSs/gsd4UwK
	 v6yxHuOlFnZr5hJT++iOdKDWVOgZdW2qwmqjdTCh+99rtExwiKkRilO9C5BBg+DAb95tJ
	 gjReoa+pDLaUlZSP6sVToqEBkL+OHNm6NKVYVG6VAfyke+foahnc6F3/hA1Xr+M6qjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+TlTxiGjN2I2Df5Efr9+11VWHUXjBjD+ps0uEd++xWg=;
	b=HsNnW2xM3PSaQSuOgWa6RbGZfeHNxPExXdVUwyghPtTrAdgL3/KSWAxVEhhWm8DhZh77
	 ykQ+ER0RUvA/pUQEtCi7Mk6warotYD8q5AHvo9b30OzAbrr8+sKMKXaOTKpuM4nQ1CCnj
	 PAZT0DwUhOvHaEqUq7H6e24uzYZvIwicQHMDAeb6rH+a5J5ZHqaWoCAC3iWBlTFB7E+ag
	 ccXgvqwvr0W8PtmDoe6FUwhBMJ2aBJY6G/CFFBQyS5v0NiXYkdtQeKH49IeQNqqtN2PUJ
	 CZlOJ5RaVhiEUN/+I8W6iU8K0xOHfBcBjNt2hd2GGvaNN9HEARdK0V1KjPskrKbJ5CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sifive.com;
	spf=pass smtp.mailfrom=sifive.com;
	dkim=pass header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=UEQSAZcI;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B4D606A6B9
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0B4D606A6B9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=UEQSAZcI
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b3acec6677so10285399c88.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 01:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795684047; x=1796288847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+TlTxiGjN2I2Df5Efr9+11VWHUXjBjD+ps0uEd++xWg=;
        b=UEQSAZcIa546zCzCqTUO2ZUh1P+O+jja379HiVFOBPN9s2YBu9VpyQpTNfrO/vJoMS
         TtG3AMNxvJ5n+SWPpNfuCvGZ0IosWryyeughJ09e9pnAuTjOx8PMcBsgM9pYh/Z22I1J
         8tGw7WXiY3ZBLhK+eqaTPU/zU+eqw5m0i1ZBzlnd0amADx3yFApYdfyN2OY2otFLJ5PO
         E8t2qePffp+NZYXaY3TriefAJt+FEcMsUu4gBa4vnyWM1eirueLRmat8R0O59BMpII/x
         O1PH2WIuVKIzR2BYzKiDlswNq9wrQ4jgEYpZz1mX+3iZeYn0EIjqUqOF4KIEBOzGwAAB
         K5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684047; x=1796288847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+TlTxiGjN2I2Df5Efr9+11VWHUXjBjD+ps0uEd++xWg=;
        b=obujtldsE7R6EC/iBoJ/8uQ/5in5MMSyLFWCykONaxuXtW8FTHTgJmxfPxgcXmW5v/
         UezdKYq0CfNColDxqRcMnhVt9VUqe3P9JH2LseN+9qIQUNkfwpw+dGCGBXNEsGUjBA29
         69kPGpjPWAjuYupAVJfnCx7pmGe4ZAkiX5EY2UpaA8U+e4UB74KGcbLyVs4MUaUm/a6d
         2XFHcxXA/JYECehJ84YrgXLcwdXMEwC4g/MgNtIhhWTIgU3+d4T1WxUrNml1nrI0dh+T
         7nwmHiYJ0xC/MtarAiWenJRixY9naVFzDjl4D6BnQbR6om0AUv0x5xuEK7wl+m6BEQmi
         cltw==
X-Forwarded-Encrypted: i=1; AL+hErHV9MhpDf7/VsnhB4oBrxxWjFL5CK5OaJSdG89w2qFVJnaQZJIuhRzNp9eSZPwx30eruTvVSJk2G8EE@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ur8+JD7pX2c9rrtbLCzZn17UH4eP4Amfl5or2efFax+RAT27D
	mfIWanCHU6699L/JQGMGL9TTGq/uyG8kgGR55TKTkIMpIq99egtaRu60L+2L0QCYI3+5Rr8LR5T
	nXbURscx7bWFz7FJvDXPVfC8TiDIlnZN0vC38kMYFHu87SgSDfjEkbr+ITzk4U0rLeEcCT6MUSl
	4QswylkiYHbc0PT+crLOH5lZH/WheN5nSUW13bcfJZXnpTe8R4GA==
X-Gm-Gg: AZFdTZeCGsgo1NAJcofxnScIvcm+IPs5NEwwf6aED7nLy6ybu0Qtsm9WEHvJU4AYC2B
	WFgC5UVnVqFXiCa3E6oVduR7kUA0hM4Q/TvrVmiocfnKrAG2l4W3T8ZOh4An+DE6CX6qdc8jcCj
	h8ogZzReCkfpvJ/O++s3CHS49zDi+XsHlk5qAJmHGnQEqHIFg3wtjlZfeWNGMBfy+3llQE4SVnP
	FS7vxknMPC24fIfPYW4/QNLBtEXS1ADfjeUQuZa/7hx++GrzSG44rtzax9ahyB7OPRAjCPms6a+
	5jk6Co8PsTnmIEzaWHgbyy/1rP5Bb3gUS2li7RTAEM05xXSbKSUVRT9+pKVMILDpM0TLuIrCle0
	skWU6guEnbNfEKDxChxxJrp02E7P+Px+YvAs/EtmPJdsunQniYrYgRuZ0wOzmZDBOFL6Q/NJcCR
	achV/JKvC/gsqqpiuyij34bzeI8OULLAxuPr8V9Y74ONC7itftZxA9KeXyJQwTkARdojKwuH0sW
	3UjBMTzo84W/jTGRJt9Z1HcfReywDfQ2905os+4YtbIu8Wkmg/2MX6uMmc6edC2o5uYhpwmJnkq
	PNDPX3a0iTLjVYtXhVS4yhMi4kaKrGOPfVUaZL8Ii0QC67UXKlLT3KjNoOy02ILDiQ==
X-Received: by 2002:a05:693c:37c8:b0:386:a0d1:1b41 with SMTP id 5a478bee46e88-386a0d136aemr22307891eec.34.1795684046741;
        Thu, 26 Nov 2026 01:07:26 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm54058730eec.8.2026.11.26.01.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:07:26 -0800 (PST)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
Date: Thu, 26 Nov 2026 01:07:11 -0800
Subject: [PATCH 05/10] gtrace: Terminate id_table iteration on
 GTRACE_COMPONENT_TYPE_NONE
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-send-preratified-trace-v1-5-1e686fd75be7@sifive.com>
References: <20261126-send-preratified-trace-v1-0-1e686fd75be7@sifive.com>
In-Reply-To: <20261126-send-preratified-trace-v1-0-1e686fd75be7@sifive.com>
To: Mayuresh Chitale <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yu-Chi Liang <leo.liang@sifive.com>, 
 linmin@eswincomputing.com, vincent.chen@sifive.com, 
 luyulin@eswincomputing.com, pritesh.patel@einfochips.com, 
 ganboing@gmail.com, dongxuyang@eswincomputing.com, 
 pinkesh.vaghela@einfochips.com, nick.hu@sifive.com, eric.lin@sifive.com, 
 huangyifeng@eswincomputing.com, darshan.prajapati@einfochips.com
X-Mailer: b4 0.16.0

gtrace_match_id() uses a non-zero id->version as the end-of-table
sentinel when walking a driver's id_table. This does not work for
pre-ratified components, whose version is 0, i.e.
rvtrace_component_mkversion(0, 0): an id_table holding only such an
entry is treated as empty, so the component never matches its driver.

Add GTRACE_COMPONENT_TYPE_NONE as the zero value of enum
gtrace_component_type and use it as the terminator instead. Existing
id_tables end with an empty entry, which maps to this value.

Signed-off-by: Leo Yu-Chi Liang <leo.liang@sifive.com>
---
 drivers/hwtracing/gtrace/gtrace-core.c | 2 +-
 include/linux/gtrace.h                 | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index 034987237abc..09b200bd1690 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -103,7 +103,7 @@ const struct gtrace_component_id *gtrace_match_id(struct gtrace_component *comp,
 {
 	const struct gtrace_component_id *id;
 
-	for (id = ids; id->version; id++) {
+	for (id = ids; id->type != GTRACE_COMPONENT_TYPE_NONE; id++) {
 		if (comp->id.type != id->type)
 			continue;
 
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index da8ba3779193..b8826b25d35a 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -19,6 +19,7 @@
  * uses the entries relevant to it.
  */
 enum gtrace_component_type {
+	GTRACE_COMPONENT_TYPE_NONE,
 	GTRACE_RVTRACE_ENCODER,
 	GTRACE_RVTRACE_FUNNEL,
 	GTRACE_RVTRACE_RAMSINK,

-- 
2.43.7

