Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6561536215B
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388677; cv=none; b=p+8VAmbckG5l+NxAaqY/Uy0wtjzW9Fl4lEgwYidGe9f4rhAFuRKBzNyNlfQjF8YWa4bv0MFgkHIsmEKH+Iq1aaXm/UbrtFY2C273U7UEWA+GiCZAThJBP89zOGJOiVL/kaozQKDyeRWDynkxcthX0D5dLzCMocesro/IwdWzQoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388677; c=relaxed/simple;
	bh=j8t37Op70xO3ccHHgecocecHx7T+OUfEWbzmUZcFqW8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NmESCNE8TtHoAl8o9BdPvOeUXRak4ojnAw0PQduGHhxkU24AEL5VNyoe+rmjM3DXgmwCiA6XB3719z5ABuj900z3yooqqI/7US0EhtzsLJ75ZLvrevSap/kO2TdtOA/weX8I8uSdOUNhH8Y7KnESjH58Udq2qi8la1EMVKPv4wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nA/EglJy; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nA/EglJy"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71974de4so498315e9.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789388674; x=1789993474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iOr4uO1ECTMyXWd/dn0EtDp/RbsgaL9j1XA8SLnYrhY=;
        b=nA/EglJydesQ12hQj/apbUZzCXTgFKSCltDyRxZW9HDwilMYbvXa91ZrC9U59zSuAu
         rV1KSbbLC0yppmxUgzlsFvwQG4BHHLcdw70NUtXi7/3iYhEdKJ5BRPu4YvbZfaOGJaXJ
         u1Svu6GQmeMaxf7plTH6d/rJsw8mljsH9zHBaqVTUCcbQTlhBDPrNdK6elcsz23LnDH0
         YKz9ROGtzux/OC2ZOqA8LKEvvvhB3oLKbUneDR0/j1Vc9OmoIqq4cPek6AWEJT/lXDJ+
         x2ZFcrFBJQ4adH6qFbq/V+ebVGnId0QoDeoyMqsZG5t16ZVsijq7knb8PDV1iBuiZTie
         ZHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388674; x=1789993474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iOr4uO1ECTMyXWd/dn0EtDp/RbsgaL9j1XA8SLnYrhY=;
        b=RmvAV6oYZJwPzh6jwk/9Pg3wX1Pkl2KTrDKVX10Zp5L66cC3uansCXwVMyBEj0J59B
         vaqIiTQjMsdiKQ5NmSDpPwyjoGlCqCvKoAQDOOXRTIXYb60i31GpFaDTRKlI3BUPRBki
         MrbwnCZUnkNrfB1ZSYgCvhAKX2IWwXo5nPlK/kZ/TdlMOhu2xEKa8YWmvB6UO/I4gokI
         l2uNMVOY9L9mXZ/8XCx01wnrvzWSOsw9gDMnjt21nXBwL/ZLJBfwKaF+89/NhvLkfx+0
         9CA6oPjdFnC9kaq4SCtz7NXC+446uQ0ENLG9dBDVgwjvseAOmmYp0M9ocw71AAb+K99a
         4+PA==
X-Forwarded-Encrypted: i=1; AKwUvBxhD+BDC78mhcXCrfuib53e7cILWlp149RNZRzqUc5oRi1ls/rbZy2VbbNY+yACjrsaJZUdjxyFnbkh@vger.kernel.org
X-Gm-Message-State: AFuF++lsgotShlfO3mPY6JDRmdnK2a98bj8n8QZ8JRAMw63t/qdYCJjI
	rRTG/VSAds1zyuJRSuUH7jUsRqzP4BHoD0t9Yos8jDWe36ywu+AhB2mi
X-Gm-Gg: AYBFou0MA6MYXCzqeZjQPjx6uG4MdCa15Pf55zOVv/nU5hl/u9niZHpLynMjiUUOlF4
	EDD6gnJH8Aflrz/9Gs6vQBKC8OePvCtnnfttqdlpnM9Jj5Al2KZvCq5i3DG+etOPUmBkUwT48n3
	zCVBGdW1rZe6ORd3m8h+YI85WW2f/XLn0x+Z2NddvJmANdewk0JUv6DazCjknTMDVK2VRbxipaR
	NGdhTKOOqENIqB8HJQG2MGrx8rwDbuDS34ykYeZrc5ZBhxh35UoiWe8HoqQgq0ornsWpmgi5N3A
	bjZGA8U13NJ6QoF7CiQi1WlEHAmj4AVnqG2NaSpUzsmFzSee9aMxKfVKvoj0kpc8Qx2DrvaU8Yq
	tcbYwFQqx7MXry/gtLkjZwUl+tIX279fEAinVnP+dLD12VgOgm8oJBGRV9LMcZo5H6BjsMoLwUZ
	k2HrU4/oqYBk9mP5LMXljjlcDXkD2NpnbYjnA6PWkGMz2S4zdzv6cf9pDzzx7p5hY92jEYG/lV4
	8jOhs4lmv+RrA==
X-Received: by 2002:a05:600c:3b9f:b0:499:d95a:41f with SMTP id 5b1f17b1804b1-49e7a5f41a5mr33423485e9.0.1789388674287;
        Mon, 14 Sep 2026 05:24:34 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb360409sm25161438f8f.36.2026.09.14.05.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:24:33 -0700 (PDT)
From: Dmitriy Okunev <dokunevdmitriy@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>
Cc: lvc-project@linuxtesting.org,
	Stephen Boyd <stephen.boyd@linaro.org>,
	Peter Chen <peter.chen@nxp.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] of: module: harden a call to request_module
Date: Mon, 14 Sep 2026 15:24:25 +0300
Message-ID: <20260914122425.137413-1-dokunevdmitriy@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In of_request_module(), the string 'str' is built from Device Tree data
and passed directly to request_module() as a format string.  While the
Device Tree is generally considered trusted, using externally provided
data as a format string is fragile and can lead to unintended format
specifier interpretation. 

Fix this by using request_module("%s", str) to treat 'str' as a plain
string argument, not a format string.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 9c829c097f2f1 ("of: device: Support loading a module with OF based modalias")
Signed-off-by: Dmitriy Okunev <dokunevdmitriy@gmail.com>
---
 drivers/of/module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/module.c b/drivers/of/module.c
index 1e735fc130ad..592377603c24 100644
--- a/drivers/of/module.c
+++ b/drivers/of/module.c
@@ -73,7 +73,7 @@ int of_request_module(const struct device_node *np)
 
 	of_modalias(np, str, size);
 	str[size - 1] = '\0';
-	ret = request_module(str);
+	ret = request_module("%s", str);
 	kfree(str);
 
 	return ret;
-- 
2.53.0

