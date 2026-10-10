Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E08388879
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 08:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791620358; cv=none; b=WW9txTlIiXjZ0CQDX1aLZfZGdd1a8UK0HPdxDMdLurxtQ0yKwpMp9NhxMjtXG+AyJzFgEaSjboUCw0yvyizoNxmGQf1t68bjRm76xPvc8sH7lYK2SieeU5OTNEBtGL3Dk25vKFKa2aGAc17pzDFEibt8Kn/XWae01bESdtD9WYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791620358; c=relaxed/simple;
	bh=0nIngpZp+inShOASYSj886fWfbkUeZYjBtrsY8Usq7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=isiZ4eYTD21SXgWE1zh08LJkUZm37kZDCN8rw9yPySiIyDovIAiqTM4T4i/T06r3wRw4jao24jyrhambCQu/4eAX39dmXxb+yK4QPqk/kGyWKUQPJvpmITkRlWf9O3b+1WkisdQ7nI3oRWWe0gUOTcO7VhyIm1FqsYsQbmoPew8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bV3Fr2PU; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bV3Fr2PU"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ab3260b2cdso149563a91.1
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 01:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791620356; x=1792225156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6k52INFfuvMm/tjJwSTAbKQML/NWkmAz6TpJUNRMaqY=;
        b=bV3Fr2PUmixZ6BhEY/znWdntjnSZwEiZUWaANPbSpvmnMg6VsG73BKTq1kk5H9itjN
         CmJtUY+B1BDalspG0GEuxmZMu16ZMU4bdpVALzlKWHoiW3K8WQ/PAb20PmMZed/Z9OMb
         hRjtDkOYHj/sWkNK2wqJFEAOsp5J5fHzYmhMaQuEioMwQloTmbmog2TrL8ti1K/k4TET
         3BfZa/FmjevvI182MCgrjFXqUYkWJrl55Lao5vtEJSeinORdKqAzTSVjjPDprb/2otR+
         dpXcyMbDi4irc+Ji9WniOItPigCuNphXGa98HfBPADPCzb1/nMVkQcOcHqJYqotoHE5f
         lp1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791620356; x=1792225156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6k52INFfuvMm/tjJwSTAbKQML/NWkmAz6TpJUNRMaqY=;
        b=IlAI8FPLkyiA2sZaRoO1Cuv9U7ZJWxK6Pwh+9KGkKDuzImoP9nHk2k7UvA7/jw+lWC
         ag3E6py6LzYOCPhsNfcfpQ98UJ8yJEtC7GPhIAwi7lRsEeIN6/S9MnWczVpscCFSPnNs
         yojSx3tFi6XxZWU01fQAHh6rtLUZVqjbuJxVDwAa5aJFeR3rIGMMW0C3i8PsSCOTa2N/
         QkyUFdKijVswcCYZ48QFLcTa/RRdNNYliotKAbZeTpgfPRlgF7BZi9Q2Ood6VmkYBtCc
         QevRbpTcN3YqevljDXOaxfUCb92vqd1hVjvQUN/SkAHs7p+AffUuiX0JagD8lgwcReQM
         cJXA==
X-Forwarded-Encrypted: i=1; AKwUvBzfhRApbLZmxK7WYSocnzZFkg2SYZJ+3zILtY5bttmkaCnu+VwLwj8AqI9grieApuo6Cwzz3394IB3O@vger.kernel.org
X-Gm-Message-State: AFq9FYLvZrvr9kkqf3aK/G8feVE71yvyZFbmM7+dIQRm9/uAaElhvGxK
	dC8Wt0locM8yXCfVYAEnVifqJQ1Jz3cc+7lZcs3XjpBIDG/1TbbjsKQh
X-Gm-Gg: AYBFou0KKp+Lx82QqQ5rXdnmSrAP7k8MGEUjvhXgXYrMM6+eGAQ24C/bbftwXV5LyG5
	wANxs+Z6nJ6cf1rJAsBX57nAmL5ijWkHBVVQsXTKD1xRCnLWnsF8GeRH6bQf6LuceissktOPsO9
	ERkwv6saTUvcA4FqjwxsduhHeyKDnv4nhqOjjyYOt7CdkQctgDJueC2GIm0WuYW6+KI4TL2Ipn8
	ySt7d5SoTNS9MJ7+RtFMNEScPe1ZmnIiMI0NUgxcerS0mV/Hby4epJb5F5XuH0Gn0uvcukMeIgp
	bMDskfPe7Icv1j8e7VN7sirmzbf4ojUQpL1qI6kqoDsL2xlbwlbgMCZzUH9pJhnnrwEeGGIGoZ0
	yeg1e95jpHw/Sczs7+j8RkhmnUptGMMdB+JKLk1pyTwsNhSjKEmRnX+/64gXGSXen9GhX/o73Jq
	dAOfzuhk2Ycf7L7+z9mDpfLNISWSYt/x7WKC3g3juibAIDXzyVpW6MozIjIlJXrNC0+xq+DDtUg
	NdrKNU=
X-Received: by 2002:a17:90b:2886:b0:3a6:fec5:c186 with SMTP id 98e67ed59e1d1-3ab3acf7535mr3661751a91.46.1791620355561;
        Sat, 10 Oct 2026 01:19:15 -0700 (PDT)
Received: from arch.localdomain ([161.33.202.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed0332sm7744574a91.3.2026.10.10.01.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 01:19:15 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Auchter <michael.auchter@ni.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: extcon: tusb320: add SGM7220 fallback compatible
Date: Sat, 10 Oct 2026 16:19:06 +0800
Message-ID: <20261010081907.479226-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SGM7220 is register-compatible with the TI TUSB320, even reporting
the same device ID, so it can be described in a device tree using
ti,tusb320 as the fallback compatible string.

Link: https://www.sg-micro.com/rect/assets/bec47c84-84b4-4015-8d61-9433e0d76583/SGM7220.pdf
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 .../bindings/extcon/extcon-usbc-tusb320.yaml           | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/extcon/extcon-usbc-tusb320.yaml b/Documentation/devicetree/bindings/extcon/extcon-usbc-tusb320.yaml
index 126107dd57b1..f88486c2fb09 100644
--- a/Documentation/devicetree/bindings/extcon/extcon-usbc-tusb320.yaml
+++ b/Documentation/devicetree/bindings/extcon/extcon-usbc-tusb320.yaml
@@ -11,9 +11,13 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - ti,tusb320
-      - ti,tusb320l
+    oneOf:
+      - enum:
+          - ti,tusb320
+          - ti,tusb320l
+      - items:
+          - const: sgmicro,sgm7220
+          - const: ti,tusb320
 
   reg:
     maxItems: 1
-- 
2.56.0

