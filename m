Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DB435F8D2
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 03:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784776795; cv=none; b=RP7DYVWuFaHrx63Q6H4/PJybTamh8rVyRlXaXFcgj0hz4o+5mISpqSzywRNEhIm1uGjO5hov8OfrmYjcbFRnV3xkyU3uLu0fgiX5LvX9oBRBkQyifhBzFbe9X2PkLPzD4tcVsIiSNC6XCfStcGWpt2mYfE5MT29Snif2JRQ5wR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784776795; c=relaxed/simple;
	bh=FJXCevPYrSwYv+Fgo0XX5Tikn5UQNsOn5GQBSuFOS0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZiRRzwEL+CcKGA1ERcJL7MVm6us2cxAAvz/52aj7uz7q9K4tLddOghHfaeXI/dyFc0pjlHhK71PU5nuv3+TZQTKqksGqPV1EOKy419eJITrYQ8og9An1YRkx6Trw5xAlu7SgtFYqMRWK1TPUlyRtXNFwsxQ/l6mlGXZS+txcg1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=FsbR1geG; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="FsbR1geG"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cf27856f9cso1818895ad.2
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 20:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784776793; x=1785381593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dEMNIYa17ALMCA3G5BQkwztf7SHhY+1D/nHSwLmqxWI=;
        b=FsbR1geGa6xH7VzJe67zbVXKuacuDTTuvyl/wENvGpylohJ/ZFJ/4eTNtDtajdI8Bf
         QMZKB7k7xnOuPREKyOYo4ns1P2Rbzyq7xMietH/omI2RTKsPCSIkj8jHhB8zvA8LHdH8
         pZSrFMJKdWASAdIvqyR4+e4MgZWpL27OHDNDj+AsS2bBLW7b/t+3N5KpJPsXIhsO59WN
         MeabvZYv6Oks0MYXir5WHOyhIVslu9wp/FhoJ+PQfhyqfhNp2G2Xk10ojCjOaeCPlADP
         OMqrehc4Cht4nBOUxi3ZcvVapMktkdChF9f/jmhMISnVVWOEm/UN6Dj4NYe/+dH8TdqS
         Ydjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784776793; x=1785381593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dEMNIYa17ALMCA3G5BQkwztf7SHhY+1D/nHSwLmqxWI=;
        b=fjL0D2piWny6ORe9/9cPI8Kgxqf3wbrE/dJDvA30ap+n/0Kcycz1Y2R+CkRuP/WzRW
         x7RwL/qz1EXh70aKPcJKDFvaFopbC8gXNfIlEXG/JBrQABzgltE3XoN0qDq8Ee4rlHY5
         GajDJUvnomOWGgc3EPAvhUoCZ8Zge1y8Npw1zFFv3JQU9lxb+quZgI/6WS8trHujc9xI
         MX6FZxMXcuZaDKs5eHt3H1Fpu/bKlpqYpzLL1PpcIrAwNfbaXozQDzGZA47gzWBfHRgm
         L+DXYrosXWtoylcvrQEhGYizyFcfYsLb/ZV4URLQaDu+dogZGfc0VNJm8RX2xd2sqyns
         xkYw==
X-Gm-Message-State: AOJu0YwojBDnotb7nKM28RQIer1Qbue+h9jycRsDgM9kHU/zPgm/nMif
	iuOeAXn3gwKhBsRrQE0c2F8Gi8+JblrBFcRZuMwpQQPpwxUC+cSLCcaZ4jtiJIVRBf/tGmU7KwZ
	U4Dp1EPw=
X-Gm-Gg: AR+sD10Kgybw7B3guuzzhljAtqwbt39ppPLNdLPaeKNPPC0NBloIPXgoPyw19tUom3S
	YOVlf2CXrMBcpnCXk4AOSQspJF34Mj09lztb2IuhQ/UOAIF8glaFKtSP6PyS36xZGUiNFQzz/YK
	qz+7QUUMf/jOOVZd1O2I8BJ3Y47TKyAj1D1aveB5bJUMyPuhYFrEenTS21FMrWwClJPIKwpIE3a
	ammwHy41s6cY6dg2AV8k9eICC+t4Qar/sZuZEA2FBR+zYPIaBe4mX3QMo+wfYnTYRvG/mw8V5eX
	mLOFOMdn9rfWjYSqVunmGKL09zdpll9UfsN++g+ESj2DVe9XQT94lEhXm/0GuCj7sN0Q8vWIgR8
	pBS/j8vwbEcG3ocJs6LUs+e7XL3ud8M8dBbIDBUpuNMZ1sc/FXfBfvq928sTWo9ReDUZZtE+ck4
	CkFlHT
X-Received: by 2002:a17:903:22c7:b0:2c9:bd37:ae76 with SMTP id d9443c01a7336-2cfa6f7fc67mr16618365ad.47.1784776792932;
        Wed, 22 Jul 2026 20:19:52 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1bc886sm13826080eec.26.2026.07.22.20.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 20:19:52 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 22 Jul 2026 20:19:46 -0700
Subject: [PATCH v5 5/9] of/overlay: don't keep a negative id in ovcs->id on
 idr_alloc() failure
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-nh-of-alias-overlay-v5-5-2abe2bb9cdbc@nexthop.ai>
References: <20260722-nh-of-alias-overlay-v5-0-2abe2bb9cdbc@nexthop.ai>
In-Reply-To: <20260722-nh-of-alias-overlay-v5-0-2abe2bb9cdbc@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784776787; l=1193;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=FJXCevPYrSwYv+Fgo0XX5Tikn5UQNsOn5GQBSuFOS0c=;
 b=d+UHW6wZ5Nee8/xiGWLc3CBVKpCDCBMvNLEo3ZQLq4jPTOk99Yj7sT/TaxmGnrHnYqUpManki
 7zXqgmKVEMBAozBPOrM9fE5HzBd3+Bief2/xJ2gnGt07cVVdn4iDJpp
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

of_overlay_fdt_apply() stores the idr_alloc() return value in
ovcs->id before checking it. On failure the stored id is negative and
the error path runs free_overlay_changeset(), whose "if (ovcs->id)"
check passes: idr_remove() is called with a negative id and
list_del() runs on ovcs->ovcs_list, which is not initialized until
after the id allocation. An allocation failure at that point
dereferences NULL.

Reset ovcs->id to 0 before taking the error path.

Fixes: 61b4de4e0b38 ("of: overlay: minor restructuring")
Assisted-by: Claude:claude-fable-5 [Claude Code]
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/overlay.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 284c9bc6c9cf..f1aa8574069a 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -1038,6 +1038,8 @@ int of_overlay_fdt_apply(const void *overlay_fdt, u32 overlay_fdt_size,
 	ovcs->id = idr_alloc(&ovcs_idr, ovcs, 1, 0, GFP_KERNEL);
 	if (ovcs->id <= 0) {
 		ret = ovcs->id;
+		/* free_overlay_changeset() treats a set id as registered */
+		ovcs->id = 0;
 		goto err_free_ovcs;
 	}
 

-- 
2.54.0

