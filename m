Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167013BBA0D
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 21:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782684001; cv=none; b=p9Md5JbU8RKrb81zxhrzvDq1I0oF12P+/zg+ANa4GG4iAcsk+Ce2Op0OV1i52cXh1Z+ounhfjdakH+8PCfJcKkiXpcvTq291VR4/YgmdnYCtkpoC/3NifFyddR0ijvq17Gn5Xb98dsm95CIvph0Ce/Nok8/FQ/vy1hGGn+RuxPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782684001; c=relaxed/simple;
	bh=uk95VwGs9WQK1gVzsUnLfuwM7OLrJAtdHN8wEaZdAXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bV+FnVMBUmmuFvplO6s310V5rpyU6m9ltbZGhiZ1ug3BSKDevcCaE7y71k2GY+nFldByeDhkJrcyb4ezdyzLHPHX5ETbgCJwyeKQtSKS9k3fAgJ6ebKJ/zNPPVKZvWpAkKAFVYPqNrAe87shpRtKI9483LBUKwgJDDWygg9mtAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=osNBj4JU; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="osNBj4JU"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so19058095e9.1
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 14:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782683997; x=1783288797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBpy8579NAN+gLyiVLL7RVHF+KuyRakjt9rrb/r+QbU=;
        b=osNBj4JUew6nT8Tn93t5ZyPR4c9mlnVImJDRLD5B67JEXprcghMqYWXAtEKXdeHJgW
         uKOVBloFm+MolcVHXR2Pr6xtrcS0OVlJpJUvlHheOdaOeyaKwOfKV8zDiPZWjb0XT2sm
         RsRvrd0XAqMJrcMwS0zeJB+8he5jhUpYpg2keCk9B8PiH6WNn1KLC7CuYVBPNTWR/bh0
         5nXR8ENmdVnwC4OliFTAh3KrWCbTzjhtGVtpfd1VDCBpUzNDvIMbQVP/jRHqa8j5/dUW
         e4OyIck5U1q5g2jRCphD2vzQfPG85E515JTBc7avJ1xokPC0/XsifnnyHXuapTntm8ct
         biWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782683997; x=1783288797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SBpy8579NAN+gLyiVLL7RVHF+KuyRakjt9rrb/r+QbU=;
        b=rJgzt/0L57gKjfj9Q7KMG95LcSvyZvMhkChLRds/qpQMJ+oUejEOf6cRWcyPvPPdk5
         f8hrrlnTJsR1bJXM1BbZ4VXAlUmZERqEuY7xEYPGQZPL1qHXLysPFnVMs3PRiG/9ZQU/
         Dz+3ZyW52dWl1ewWYyKSRe2jypRAFmFDTH0yAk8qf4SVrdpqHU5E34UuCJNo/SPlaGBM
         e1OReDs7jZ/2rofe5qkNQp9M9+6y8N0eRWnkXR32zoyqAqciW8n49jDYOx9y+9M30eJn
         kd4xWvd4n4SD4R4S8m0lEfJrBIiKIx09T2cpoTNSDo+7wbkNx5ILkclrSb8W8rVyXfNd
         vnvw==
X-Forwarded-Encrypted: i=1; AFNElJ88HaRQEykAPOjJ50jIV7+qIYqGEYmUou1Q6poHZbxddfwL7oL0AyprRUxlspJO+PIQknwBfqON0wAA@vger.kernel.org
X-Gm-Message-State: AOJu0YxO6G0jcPulgFN8aOELa93uow8fVK7wEtCWQ8g6b/9dZxdRslDB
	pl26kIGCgYroNU4qHCuGtw+jOKXa7l6INXLBjOH8jbukYoeHI/+qEX3QEi5YHHDa+h4=
X-Gm-Gg: AfdE7ckRG0eRpo/Cp9m8cHv1qUIWP01KNX/D7nPPpl7QU4wn8280o+C7ojXHkoSMBvy
	6dePUw3qDL+1qSTt697hzsa6NH96emQOkD3ys76Q0T0DZNmZRgOuwIqSKgBtFoNC9sOpjQoZnPU
	FPXQXb6eJMZIJs86wI4XjtZVr09OrnbnbqFTZucVoKMfTN5mngWfknb0S3bZLmJw4PfpHUMTTTs
	sUewexBezgDzkDI6yhpXuXggXWI8k2sFh8z5epsAvQ5CiKGD/4QkVf1Z/uQJUW8RW8IzBUyYaJa
	t0go9qjQ6eKv9719fjhrbEbFasFOHvkrccJn1SO/+PtUfbQJSO/ih2Wg4jtCClP7KsLHl01Gd2j
	foPd7LdZCri5HD68qChK4E95HGqeYPSaB0fu5J2YF1coolu95KnbRsNCsYpqHLfJx5DKRNrSB76
	eE370EU7GsOId8VBoz8A==
X-Received: by 2002:a05:600c:5296:b0:493:a938:7884 with SMTP id 5b1f17b1804b1-493a9387c2dmr42740895e9.22.1782683997622;
        Sun, 28 Jun 2026 14:59:57 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:559d:eec2:887f:c200])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49268f7670bsm258950955e9.0.2026.06.28.14.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 14:59:57 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v3 07/16] of: Explicitly include <linux/types.h> and <linux/err.h>
Date: Sun, 28 Jun 2026 23:58:42 +0200
Message-ID:  <b6783e713ecf3d15ee9ca261c24b53e18d4bbfba.1782682124.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782682124.git.ukleinek@kernel.org>
References: <cover.1782682124.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1100; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=uk95VwGs9WQK1gVzsUnLfuwM7OLrJAtdHN8wEaZdAXA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqQZkeD8K+LEDVtRC+aeuBruaoLkuastqtMzcSq RHVKpjIguOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakGZHgAKCRCPgPtYfRL+ TknACACO0UXdV+goovUo2i8VjUHsKK5ZYlkUhAhu88qcSoqlj8PeQ4/tUnUbVeqwQLTLmKJ97Zk syzQ38SHGU3+/Zl5OY6PKDZqq4B9Rn7Q1Pio6tGyF9MEIQYpipuQA/V0r2xT/O/0GjwhJhlXAG0 DRYU8b0lORI2A3IUWxYtOtdeiPFuANKylZSSOY1fkk2ckFx9eQUaELUJ0wlGnMCdJs1ozhiZtsv pkkcmFR8RfacDpkSRneKgG4LWeS1SXJo9KH9CcJQc0W1ucyh+0jlSARHTbyPT0BScaQN7ZvKTSf 7WgxFwlNjeZTeZVvghHZP9+gO7A/IkMdHnQadLNFTtrVnrv7
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

Acked-by: Danilo Krummrich <dakr@kernel.org>
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

