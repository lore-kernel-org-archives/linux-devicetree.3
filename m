Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F10449B01
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787045093; cv=none; b=Y3A8UVlenymjlf/JnLfCdh2mR2joZ+yP8eQ2ljwc5Tr7/2zdH1F34wlM16r4j8n13ARRqCrJZgT0gBPRAvGfvv5S8om9LIn0zFYYloCm87F9/LJFoTD/p1cBKkccaAsabW38El0t8tl6z3NWe/fMwU0mH1L4Vi1UwyKAMujs5LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787045093; c=relaxed/simple;
	bh=yd+K1Uo+/8kr+Dz5o7vzi3RnXV8sT8wqf8KMY1gJ5nE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cylhzf8MyXwDHGFdKXijKoc7XpLvw92OjbfipodJHfcv6d1Ohas3dWBcYj4sEVXpq4eF0mWplk1mJDytKh7Pi/CG+rKCRQYIE+Q3WQa3SyMPnusMw/EE5rwtzWlPpH8K4Ryd9bMvnYXZMTYuAs1QnykKER+pESYgqteEdoCk6y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kKNTPXat; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kKNTPXat"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-8486ac3f347so754881b3a.1
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 02:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787045091; x=1787649891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9v55YoKHog4sYMlVLVJ4eD+dGmtcRqfX1CYvFqTElOI=;
        b=kKNTPXatPMA8T/u0DD8DNTVkGcHEZzvSw6MVrktfPdMWZDfgIVg9hG+zmf1pGN7fRV
         FH/12BLUlquHjFqKZ4tdo4CE2JWovuQLIUI2oy/xT77/tUbBaOTXgSnRKFx2p2f5rLdK
         h8ZO/KPvg2YhdX+XCgs/vnE0PBi2udPwpVX6xGiqCrsFfmb7XRv1SUtxtkq+y3ra4cDa
         5s+wpcCqaw2+MIBMR08/vE0ANMUw4DG5fnejs5SKQVg5T0R+QIKpKHz8sc3bvMiDeT65
         Tk7cnee7sb7mpDA206Q0IvQ85iJIjKU+34o3wuQkwQ1iEoSEeYlWqYY7tXF51zKYPITo
         wq1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787045091; x=1787649891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9v55YoKHog4sYMlVLVJ4eD+dGmtcRqfX1CYvFqTElOI=;
        b=Y88oybRB3fO4b1C41X3hd40kfE/0yI2dzPlK6QZdHk5anVqdGAlWQ8YM8Q1rGH1WFW
         GbIZaOnHhzX9wvITT0RwxZ9Igh2q4dbxQES8RQt2HCNtqiPhTFmGuZ9ke9O908JRPm4J
         HX4QZB+RT5Xon//zP+EdOpskYTXJa9IZVARvoFVCB1PHkhTKd9aHrb/wg4yBEl9SJOnR
         /l2ZsRVJxeJCGDkrnU5pzjx3Iz3nFWsJ9vW+tXfKJiOLHWArjiz4NoFJWRWhgxQh0FOv
         GipkCv+J20DmHz33N9RqVWTg2B4b701Qk9j74BX7vvv114e10Msfhr3W2hPOusBoJrd1
         zfxg==
X-Forwarded-Encrypted: i=1; AHgh+RqudT0nCgUkyY2VzSvW1kFK4kdvDGI692ecqu7LFVCPI53ZDjxcQBIZa+IEtg19OlSyVpzV/YM9abrM@vger.kernel.org
X-Gm-Message-State: AOJu0YxLQvIcQ4E2g8nHAILu5lxklF1yZdeDwnMlrUg2/JJIwFbhxgnI
	OYVKT3YAq31t3GQXd9olsRQUoCqHX6WfmNU0jLX/9MsJmkaWFX3IXZWv
X-Gm-Gg: AR+sD10ayrpvts+PLiYgcrRn0SEGdekAznnaOKa+27K8pVjuJAhF0/JuCQRMxdTUkI+
	lIpyPYu1dbSP+XbBqxEaFfbiZoFGuqK3lxslnqrQW+9H0odn39FXs/wHg308zw4FngVz6w2lUva
	MgnVLpI3r21y7PTkq1QCHtVWr9nYRUGlNlfNlDiSFKb9opOFuFMsU2M+U7e2auw9K2zaIOp8aZz
	s6eLLuY7lp2+8WOvE5WRfMeV7+Vo1Zjw4D149ESlIrKTMeeSaa0zxYRLX4PvWwgNWoMaEtvYC1+
	oiTwgc6ib1U3WTD9PSH9b/7ANb91xMPtSFBNxJ6XoLCnbubHcPmxpeqsFnVGuIZDq7WesKrMS8M
	z6tWcphh559qdF9jErGrpahgQctrUooJwr02ghxLdVkjBfuzO9inXGNpQIFHEHE77Cc5IDRubVn
	hTkPC2fdAvc1Dp2PfPmCXUx55CVGv2kWICkH5CsFuepdbOf6u9o0nQFp9ZAXyMlFKN89S+XSZye
	OvUqTOnrGc=
X-Received: by 2002:a05:6a00:1d96:b0:836:6f2e:bb6d with SMTP id d2e1a72fcca58-851bc3cce42mr4379051b3a.14.1787045091103;
        Tue, 18 Aug 2026 02:24:51 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc13c036c50sm1855975a12.26.2026.08.18.02.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 02:24:50 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	saravanak@kernel.org,
	rppt@kernel.org,
	m.szyprowski@samsung.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: akpm@linux-foundation.org
Subject: [PATCH v2 5/5] of: reserved_mem: retain static no-map memory on init failure
Date: Tue, 18 Aug 2026 17:24:20 +0800
Message-ID: <20260818092420.2859026-6-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818092420.2859026-1-chenwandun1@gmail.com>
References: <20260818092420.2859026-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Static no-map reserved-memory regions are initialized after paging_init().
If initialization fails, MEMBLOCK_NOMAP would be cleared, and the memory
is available to the buddy allocator even though it was excluded from the
kernel linear mapping.

Clear MEMBLOCK_NOMAP only for dynamically allocated regions, which are
initialized before paging_init() and can safely be made available to the
kernel linear mapping.

Sashiko found this issue in [1].

Fixes: 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved memory regions are processed")
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Link: https://sashiko.dev/#/message/20260814090305.4C8741F00A3D%40smtp.kernel.org [1]
---
 drivers/of/of_reserved_mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index ac5db19dcc93..0090fa86dd10 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -709,7 +709,7 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
 		pr_info("node %s compatible matching fail\n", rmem->name);
 		rmem->name = NULL;
 
-		if (nomap)
+		if (dynamic && nomap)
 			memblock_clear_nomap(rmem->base, rmem->size);
 
 		if (dynamic || !nomap)
-- 
2.43.0

