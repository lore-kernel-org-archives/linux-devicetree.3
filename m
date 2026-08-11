Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234BC426438;
	Tue, 11 Aug 2026 09:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786440284; cv=none; b=p6VOmWkKiZjJzi4DwaZHx3IbtZZsfdHkmJkJPsskuIsl8Oo0ByBfVlDsY1zq3NVDEa1IkMeYzQCrtY4OmxRsbgty/ZJV1kZRp5JEBR4e7+ww5GkURPZ6oz8KetwUWFGf7muEhQiv3CwzGWvJifJPVZmR/Bx/C7fMaao9xPRHVVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786440284; c=relaxed/simple;
	bh=x/SeHVwsadNzlbkVRgoWMC0yBQKLeIeOtaz3aYoNYSU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vChwllUZIHMq/bfTuJoKp/u/gkC28Ei/h05Oq/T6kKaMsnUTGsUy6kBWnJFaou6OTgDw7sxy+1FOIYdh/YAmQN5tTWGgFSRteWBAw30iD88hydYUI9Uyo+AMRIY3xDsJmbfg8rrUCJei48V5DlDYVm19zz7pZnFPPNkoC9zT09g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D44D1F000E9;
	Tue, 11 Aug 2026 09:24:41 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Grant Likely <grant.likely@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] of: Drop of_address_to_resource() and of_iomap() duplicates
Date: Tue, 11 Aug 2026 11:24:35 +0200
Message-ID: <983aad13742965abc2c26c9f12a776ea19350f52.1786439808.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If CONFIG_OF_ADDRESS is enabled (which depends on CONFIG_OF), there are
two forward declarations for of_address_to_resource() and of_iomap():
one protected by "#ifdef CONFIG_OF_ADDRESS" and a second protected by
"#ifdef CONFIG_OF".

Drop the former, as CONFIG_OF_ADDRESS depends on CONFIG_OF.

Fixes: 4acf4b9cd4534aaa ("of: move of_address_to_resource and of_iomap declarations from sparc")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 include/linux/of_address.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/linux/of_address.h b/include/linux/of_address.h
index 0cff9036539168b0..eeb7dcf2de3e28f5 100644
--- a/include/linux/of_address.h
+++ b/include/linux/of_address.h
@@ -60,9 +60,6 @@ extern const __be32 *of_translate_dma_region(struct device_node *dev, const __be
 
 #ifdef CONFIG_OF_ADDRESS
 extern u64 of_translate_address(struct device_node *np, const __be32 *addr);
-extern int of_address_to_resource(struct device_node *dev, int index,
-				  struct resource *r);
-extern void __iomem *of_iomap(struct device_node *device, int index);
 void __iomem *of_io_request_and_map(struct device_node *device,
 				    int index, const char *name);
 
-- 
2.43.0

