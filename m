Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738181;
	b=CDWwlfHXw59SIp4GpfbECxtg2lN/eM3JftbnMYw4RCZHCVRPZmTUa0jcAMot+bD0pnQL
	 HY8qel9Ow9KKiap5zHSRUmwSgDKMYkNAXmGqRNFahb2golTexU1sKF+VJe2vKv44/wCVU
	 UzT9PIR1/tCiIi0USC5hqHXnNH9dgrCfE3h/hkqcQ/EDOmG6hEOn2wqPipU7p8Z5+2vEx
	 MlwRS8EcPfdrpDJQPQc5Opjay5OZk4pSYV1qb8GA0cqZO6TGW7WTr89Zg6n72P7IRbu8f
	 84Lzm3oPREa9bSoAwa9lXbbEGY7HP5+aHzQ3lq8JhfN3T0ovF70dAiu0uSL3L9XvWVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738181;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=NTq5B2Hm0FOnw+vWb0Xc3ff/4P/VqEFyOk2WyaUnR5I=;
	b=QB9dMl1mckXaa8NYfoJ38s5knUVJSEbdrWUy+bjn98Q9k4x0AVmy9d4Xp8dajMBq2+as
	 UV5+JoteN8PalzAxMcnqpdlZwDWdWz9wgOjG7xwYsg2ewUZD5nVFxA5UmTnkAvZeung5D
	 Ayd99fhkFF95qahez1uH2SJiXayRJEIpeAUd9EmkpQjS2ztbjORaE8FMZjv6BpPYOBaTk
	 irkWAOfSQJwr16ex6oajkfVX4h1DfGdrDYeSuaQS8+I2Wv72I0ihSMKcfij8Ms7XZQFvr
	 rWiSfWGIyH4vz9Hlt0pBz3FLD1Ftwb3ybu37+ZKkTfoiBNmEtm/Sr0ckc6p8ZM3JYUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BTmF3BTk;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1894F606A320
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 06:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1894F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BTmF3BTk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792738180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NTq5B2Hm0FOnw+vWb0Xc3ff/4P/VqEFyOk2WyaUnR5I=;
	b=BTmF3BTkhksy9U6Cr1orQlHq1FPEEpixNV5qNwDq4Tn4eaIXxEY8apcKEcFxvQYBC8U3h+
	35DhyTw6e13z6ONV4u/Xb8tqq34zU6It9W6YH+JIpxbxyO5SVWME7t23ndtvJrEufVfeN1
	JoKuBV4pfItIkwrCPcDVJENEYPw7eZc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-462-Tk87mULwMgur0MjOnfTSaw-1; Fri,
 23 Oct 2026 02:49:33 -0400
X-MC-Unique: Tk87mULwMgur0MjOnfTSaw-1
X-Mimecast-MFC-AGG-ID: Tk87mULwMgur0MjOnfTSaw_1792738160
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1A65F1955F05;
	Fri, 23 Oct 2026 06:49:20 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.48.42])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0B2AD19540C2;
	Fri, 23 Oct 2026 06:49:15 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>
Cc: soc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	devicetree@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 01/13] of: fdt: Replace __ASSEMBLY__ with __ASSEMBLER__ in of_fdt.h header file
Date: Fri, 23 Oct 2026 08:48:38 +0200
Message-ID: <20261023064908.66707-2-thuth@redhat.com>
In-Reply-To: <20261023064908.66707-1-thuth@redhat.com>
References: <20261023064908.66707-1-thuth@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

While the GCC and Clang compilers already define __ASSEMBLER__
automatically when compiling assembly code, __ASSEMBLY__ is a
macro that only gets defined by the Makefiles in the kernel.
This can be very confusing when switching between userspace
and kernelspace coding, or when dealing with uapi headers that
rather should use __ASSEMBLER__ instead. So let's standardize now
on the __ASSEMBLER__ macro that is provided by the compilers.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/linux/of_fdt.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index 51dadbaa3d63a..72b452e388eeb 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -16,7 +16,7 @@
 /* Definitions used by the flattened device tree */
 #define OF_DT_HEADER		0xd00dfeed	/* marker */
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #if defined(CONFIG_OF_FLATTREE)
 
@@ -103,5 +103,5 @@ static inline void unflatten_device_tree(void) {}
 static inline void unflatten_and_copy_device_tree(void) {}
 #endif /* CONFIG_OF_EARLY_FLATTREE */
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 #endif /* _LINUX_OF_FDT_H */
-- 
2.56.0

