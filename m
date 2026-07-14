Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73AD424D41
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 22:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784067877; cv=none; b=tZcthCddurS503RPd7JtcMqESdTks6MGzeIDvyPzg0IwAKqgjYA/71glfq6NBNz+dh3B5kxNd07ojYN6sw4V8rHsj4n77mxYH2mjHsgOviltxzr8bPjvkNTsJr6wuXkzK1X1FnTcqyY/z3JSBpvVx84oavfAuVvchqERbQHI6Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784067877; c=relaxed/simple;
	bh=9EcvQ7bzdbbpYQtywxOuWlPXMV8TI4bnO8pzl4xaPPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Whq2f4ZjMIgpcNDcDiCeOZR3KjFV5IhAfchLXy/T9p00ScYEDWRVmzd1O8B7cuw3ghqwvJAbtPKw59tdb2wM7GQrmcVTuQMmY9y0hyWAv7Ts9wLG66quLQ3EdHjGmdui1JlXGT03tVS8uKPYajULB4RjoWo0DjHCacqNMrmiHDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fFgGYWXw; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fFgGYWXw"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38759bcd877so4184964a91.2
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 15:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784067875; x=1784672675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uns/By3GJ6ELjCtz5l0jrpnosmKAdWu2Pl5uOFquXDE=;
        b=fFgGYWXwnCDGM10+eVvLpbTjtBVwgRF5Zom1+Ye+G/D92/oPwTU8VtFO+fZu3rkuUA
         ycwvF1gLmj0T9VI6gCTo7efAlyOOy54SJUXzio522E/lSo7ZMbumwx5CHqNnSdZih9Dr
         YTDts1EoUwwQe2KglgbQEfl4b/pxaLMGzI1Z0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784067875; x=1784672675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uns/By3GJ6ELjCtz5l0jrpnosmKAdWu2Pl5uOFquXDE=;
        b=RLCNwMzRlKGaIPwQvV4KITWwO1khQon6Hm5ubMo7ADaUjKTXtl0iWEltC+WoYnMrlY
         XvfsMYFzqBKx5iLVctkESkfRY30y0G+XX+jCeTN6b505uVwRzWPTH/KZ92bHz2d4G1/c
         2DCmnM5klDOvf+SmJfyiH4l9+LTU/27MMQW4T0dXnVP7P1yXOq674YJO7SKOcEgO5OLT
         bjj1XSjfX7sJTZfSKo53qOFCguQKuUHijmxX8j0z/Giv79x6pjm0M5i+ieiCDmun3QDg
         N8uFHDU4RD3ouSsoHOukqyMJ9SYUuwatAyPNRuYARTxtcoO2MlJR1WPCk07nlUIMlx8u
         jg/Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqap63AEh6A8DfE547dFFI+EwgdUNmtAMeoWihuPkMs3U9TgtZRZQlZyG/cW1aM2NGDO236q3vLPj5K@vger.kernel.org
X-Gm-Message-State: AOJu0YwMaNKV53swlyglgcCu4+oIbFNFu852EK59YSqcMsL6Z4RrBhy+
	o/2l6fL96NUtfX/f60Xiw/Jmx5LvPr4TnaqBgd2bU9ovfFs5j2brB30sR/C9HX3U5g==
X-Gm-Gg: AfdE7cnRp1hCESHIsqBOWGIwU8tRXh4gc78/gXEWh82Me8/tWbhtY8ZmlZVA5rb/d+k
	FgU0IHevJTexVI96dSqFcg79JY3RhzYVMFAszDMcoBE3zM/Zv9ro5219qxUKha20zo758NSAn2N
	jKeSIy5Gnb6uQzb45A4+AVfcmOmm45P2J1sOTeOvE9ymgRZnMO/o8ArBM51XxdmAlqF6xSY6CX4
	+d13F1aGQ0+ITWnstoyZD003ibVF6UQF8mRUiXEnLkHEg5R4EOwGQJrzkPUKUQ+R1Fd/lDMzfpA
	Cb9qKN/E3nDeHLqdpThRlmQ+zCCRIPYtYEf05zizjqw+gjxdHVUS1pxvlXEo5nj90XOgXBT1Wj+
	txpGTs2Ee/XRdxjnKX03BJZ6QKK+OeAFI8fIml34GKJYLLu81V7sqQ9alKwy9Yx8HVl1qw6y6wv
	X0r2Ef3DPGG6suWWEnrr6qXKHUThWqgALoY27htK6PGBGCNOVdS4tyc/KV+3A0z3LIZsvwmw==
X-Received: by 2002:a17:90b:57e5:b0:38d:e7b7:5125 with SMTP id 98e67ed59e1d1-38e2a030175mr400186a91.17.1784067875104;
        Tue, 14 Jul 2026 15:24:35 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:32cb:eed4:7c:dc87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31189cd8234sm76540741eec.9.2026.07.14.15.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 15:24:34 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Joonwon Kang <joonwonkang@google.com>,
	Subhash Jadavani <sjadavani@google.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Lucas Wei <lucaswei@google.com>,
	Brian Norris <briannorris@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] dt-bindings: mailbox: Don't require #mbox-cells to be 1
Date: Tue, 14 Jul 2026 15:21:40 -0700
Message-ID: <20260714152138.1.I814d768336e8de933580d467140ce340f3d4f55d@changeid>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260714222338.2965707-1-dianders@chromium.org>
References: <20260714222338.2965707-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Existing mailboxes have #mbox-cells and this makes sense if a mailbox
only exposes one channel. Update the bindings to match.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I assume this is worth doing (?). As noted [1], mailbox bindings are
already in the core schema, so what's here just provides extra context
and descriptions.

[1] https://lore.kernel.org/all/20260322-mailbox-v1-1-c6251f18187c@gmail.com/

 Documentation/devicetree/bindings/mailbox/mailbox.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/mailbox.txt b/Documentation/devicetree/bindings/mailbox/mailbox.txt
index af8ecee2ac68..f50727e9686f 100644
--- a/Documentation/devicetree/bindings/mailbox/mailbox.txt
+++ b/Documentation/devicetree/bindings/mailbox/mailbox.txt
@@ -6,8 +6,7 @@ assign appropriate mailbox channel to client drivers.
 * Mailbox Controller
 
 Required property:
-- #mbox-cells: Must be at least 1. Number of cells in a mailbox
-		specifier.
+- #mbox-cells: Number of cells in a mailbox specifier.
 
 Example:
 	mailbox: mailbox {
@@ -19,7 +18,8 @@ Example:
 * Mailbox Client
 
 Required property:
-- mboxes: List of phandle and mailbox channel specifiers.
+- mboxes: List of phandle and mailbox channel specifiers. If #mbox-cells is 0
+          then a mailbox only provides one channel and only a phandle is needed.
 
 Optional property:
 - mbox-names: List of identifier strings for each mailbox channel.
-- 
2.55.0.141.g00534a21ce-goog

