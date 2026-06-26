Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DA73B3C05
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 18:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782496900; cv=none; b=KMVa0O1Qd9DycxgD1Oceu9+Au+RiRPsnZ5rtSQUPtN4KJw1cZ8v3Cwykku3X/rXwSvN8xSudnM3OvOauCqV7xG+2a3cMVirnwxE/5H/LZ0C6qRusw25ReRY93T454PGBqIBnkxruRGyN9p2ONY6rBOMqd+8fzduJ1I0Wa/1A410=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782496900; c=relaxed/simple;
	bh=f8sPUvwE2RQypFKnf1Z+8TDigNlEwDJmq/NIQm96WZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LGNxV4xn6WHsN//UdLw+ZTGG0gLXMWEmCtN1jMPiVdZ6RrB9/rKtuDK11rF8UIDdqSsDyFRKuL/N/U44UsqnJhf/ha5e9FWHb9EW0+s1v5fWA62vU8vh7Nbm+Rqjok495UIl/QAGtOJ8D8z/ND9tRN9ogcYBucqQSVuxczFcXSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=AF1D7RHe; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="AF1D7RHe"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-46e22950091so756561f8f.0
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 11:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782496898; x=1783101698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=juv687pPywWyRPL8HASTSuiCRoldLgHuHcfAycgHZtA=;
        b=AF1D7RHenJwI/kcQlWS1Vf5/gNmWOMKlGJiV2xef8rkpYZ/CxV9e709FxYv/4e2ymt
         J8B06CIBc2ctzQQ/EEApq/hehwx2S80hKe3i2vfjhFa7SiX5l1zD404sscNleCHVnrBH
         /6x14rpDrzSC3gc7xTerKt6Cb21DDoHuG8oAvV52HP2Hfp1gMaGmI5AK55ABIHkAhO4d
         OJUrLnGHiZgHDyaue4Q1Y/d19QMyG51oYxuttuNb2FDZN9ffhc0cY3RLkBLTVU5csBE5
         7WRStdlRRQXyN9+BjUjJ6nL5qeILQRevLhNXEOmgzEaelm33UM2cs58V44+GuqdJtUI0
         atvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782496898; x=1783101698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=juv687pPywWyRPL8HASTSuiCRoldLgHuHcfAycgHZtA=;
        b=UKLjGZwirUf0g3NsK/UIT04bzjqVRC1rbEjnYCKINfGOwkf20RJ3cIiVAQs0mMlXFS
         EQuA0WGtkrSP2vQYEAVhKmBsSvk186VRdwz5YV3fGsgwPYeIMCHjl1bPakPtWolZg26y
         LHFqzi1qd6SWgSocNXLciNVOH6PmUQdItVjrInKfCh+FEeU+1L6qrT12e7rbzDmc+8U/
         VBkyIagYNmX2+trbc4FlfY2h/s0L98FWHcOErcdK2BqfPGiumfhBgiN9PWWap7pqQgLS
         G1wDoiWSbeEbQE+Q9zWzwsPQiJpN5ar3QBaFNBYFRw73ZxW445gxWE0wlQ/hTd7g8PZq
         LPWg==
X-Forwarded-Encrypted: i=1; AHgh+RqrWgFdv3AsTorGWuDXXS8UgQc3+rEP0w7xKAPOq+oeR8s5k5sbuui+iuh2Y8q14BfXntGFjCmNdd/G@vger.kernel.org
X-Gm-Message-State: AOJu0YxpJhLtUn3MRCv1wvFFh+BqF5ABuu1mLabPc9J9AA9aV/tCW70m
	lgGgtkXeVZxEPuJ5FCXM8eeZ2V+St6DwvmNKyciJtrRUeHG5Dvokl55QjO6O1zzwDmo=
X-Gm-Gg: AfdE7ckE2yXbKqygVgLzNjitt94tsVhsmGIByjSAbW8jSxxoapKHDMad+jjGZJZv3P8
	IpJ5F7zoHN7Fnq6W9acuD0q4MFLr9sq9R3jlGi/U/mcXozlvomIOGcCQhSdnP0smGmrampeCSTB
	R2sQozXe9mZGKWxO8lPq15TBBH+Q1AKHnjeBnp/J0X+6vIUvkWNAc0fkOLi8nVSHPWjUgmHv6gc
	+jMg+QyIirGi6WAFdACP4JesYCrdD8e60XfH1gqeJAszJViC4ijTlXIOmlXhcWNxvZMDb+uDHuI
	8xODhm0Y2jR306GYZ6hGo4DTmVMfWxhguJ4Ew7yeBvA4kpWsFte1eiwsxi0z6Ke0xkzuPJJ8RAq
	loQcibemerrp2vnEu9e25PRXJVAOBqK55vNt0rmeH5VDN7JNOB05Og0F+E72jF8jKa1Y3navcVu
	Yibela0jnUXLzhoP8zDDKaNzkwOZCe3fuhh6UR1moqPRvMQqEw6A9KNQfhoPaKDj9gyDv6kX4ZJ
	qx8
X-Received: by 2002:a5d:570a:0:b0:460:71e6:e3b with SMTP id ffacd0b85a97d-46fb88c891emr2645959f8f.27.1782496897904;
        Fri, 26 Jun 2026 11:01:37 -0700 (PDT)
Received: from localhost (p200300f65f47db04b3606a871f5f1c38.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b360:6a87:1f5f:1c38])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-46fe25429d5sm2062897f8f.7.2026.06.26.11.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 11:01:37 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/17] of: Explicitly include <linux/types.h> and <linux/err.h>
Date: Fri, 26 Jun 2026 20:00:27 +0200
Message-ID:  <c2acd0e80d89b7d8d5fe6bb430efac30d5ec2e52.1782490566.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782490566.git.u.kleine-koenig@baylibre.com>
References: <cover.1782490566.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1054; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=f8sPUvwE2RQypFKnf1Z+8TDigNlEwDJmq/NIQm96WZ0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqPr5KXOU63Vye5sTS5R7oc5UW3S/hXMoK2qVOX o/FVVZd7QuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaj6+SgAKCRCPgPtYfRL+ TsKJB/47ziZkbwaZf/MrnfsyFMuP7OIRgGNrSV4CmdTJ7agSeoVh979w6818NaK2p4iddT6CXTX rDSDsJBSRcnPaDczsJgYb4sZe8VBFzWt144o+c7BdzcfQCIttpkAb4iES9ZRspQ+5EdNqRmYOiH 1YdaLp6Q9+BUDwzgMhSxFHioQaXAz53R2R8gVCvKHwvqyrBP/Gv6XTPLsd27tjUYqQ0j5j98quH jQWfMUkto97uWQHYsyfAYi2V0NCxDM4IzFiss8Uc93PIB2N2ekhXhs1+2lqdgtmQLhPoS0lQtA/ wSzgYS8sfXaagtJ9aO469S7xj4KlujHDDwrgynh3FktRKDXU
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

<linux/of_platform.h> uses resource_size_t and relies on the transitive
include <linux/mod_devicetable.h> -> <linux/types.h>. It also uses error
constants and thus relying on the include chain
<linux/mod_devicetable.h> -> <linux/uuid.h> -> <linux/string.h> ->
<linux/err.h>.

With the plan to split <linux/mod_devicetable.h> per subsystem and then
only letting of_platform.h include the of-specific bits (which don't
require these two headers), add the needed includes explicitly to keep
the header self-contained.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 include/linux/of_platform.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/of_platform.h b/include/linux/of_platform.h
index 17471ef8e092..48f73af88dd7 100644
--- a/include/linux/of_platform.h
+++ b/include/linux/of_platform.h
@@ -6,6 +6,8 @@
  *			 <benh@kernel.crashing.org>
  */
 
+#include <linux/types.h>
+#include <linux/err.h>
 #include <linux/mod_devicetable.h>
 
 struct device;
-- 
2.47.3

