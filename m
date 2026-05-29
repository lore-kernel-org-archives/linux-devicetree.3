Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B57C39FCB5
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 05:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780032174; cv=none; b=befJ12Ytunbaih/wTP2gzuLRDDaS73TgzapydO9ZHHEojM4EXLsdb0+HyiamgVJ5Hd9khjHk7k+7LAIHnZD49f+b788uPn8HlUbY5b83D/0WksJJJNI2KIEwRCF5TBdVk9u5B0mIcMC617F/fhv6sYdeSb2jN86+fs8c96fcj/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780032174; c=relaxed/simple;
	bh=yjNeNKwVqAVtLi5UEiEW0Wf45yTXODU2c+e9fUnr/SE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ofBag6ND2wOd+6t0Ks1f5BZrxkvOOpooP6eCyjhNMw1JWABZG3lIs9W0JkjNIreOt1Jw/1kr1OLmAnEoK6RC7pk+UOiXt3BHEN53Byb3zGABry03QlakcSIoLy20A0O19v8w5C0X4TBkrAPf/hQO9ZLZ/G2CtAr+hc488ouUnSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n+s0MVyG; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n+s0MVyG"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7dcdaf06498so8760823a34.2
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 22:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780032172; x=1780636972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJH/oTSFk2WoNkZ5UrYmehv04y8AoFIFW3mAejVdYxw=;
        b=n+s0MVyGMGbb7vdyDuP4gcKzqJbs+oJFhFXV9Jc5NBvYrwmVbMEhKG/kPYAr3I9mcM
         uAT8oVn/6g0PuL7LAeOVtMOeFOtcB4xkqsgdirvRhejIEFzNzA579Pby6zdcyBQ/548g
         qoQt4WZ0XrxZ8NkNwUuJdkjhPTWGoZqd0jaxJjEG375THqucLMZh6C3A26jxQV1d7Qo2
         wdAbXOjnC4Dmn5+88r/dH2DrRHZpBqLlYEoFpA9buBmisRJsB7Q1ljgg0X66nYaA5F16
         jCMYduWCxgOKewwHpSMf+NyNQ1jm7l4NBvBcBWbgyD9lAKj8AG8xZZL7wBzodeY0oiNa
         5vJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780032172; x=1780636972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xJH/oTSFk2WoNkZ5UrYmehv04y8AoFIFW3mAejVdYxw=;
        b=TlbkQdEt92m2RKMbE+4hfO24xmVXHsVIMWeixcJWmWGMr51IT0FdSo8apvomWfQ5Th
         4Fr89IhaewED/xLKv5GaaXtUFuTeA0ixOdpPLFlc5URp74EWpR0lMPtdaUEjw/DLNDlN
         MPXWPVqPSIsNzGJQw6loM7DGeqNpNU0DHX3JmyO3wqRZZ+OjZiDuRObnpTMIj5pQ/r3h
         Y+MhBo9ydiD1B1Y/rmbsXStzLDEHLzpmJeHfHaM78b/3f3mGj9/K7TScnz+01wOlevMf
         sP3l2jSeXYqddi4hjaXCCPw7RQF3E4GLYBh3p8zUIMsTjgqQGyuFrL3/eCYMawI+7crX
         xvZg==
X-Gm-Message-State: AOJu0Yz3N7IA+CM0amBKK+hoQG25A7m1VsiBLHhkwXjTGTj+ppU69YuB
	E1XpndAweztQILC/XBJjowTvW2OZBuC3HliF44VIiWhZRqsZEkO/GPOFywM4kQ==
X-Gm-Gg: Acq92OG1RZksO1D0lWE667k/3oSkNbpZGasL72UuwbCYZSraRVdzvRBktw6UYlAzQey
	mJ6G4D/blLNnykTzjBxFURevp112p1BCe5hgnWjYZAuFLkQI2f94VAczAsRvTsvp5qWY+MxtoWV
	8nfb40zI1iDrputaJhjjgYtzYglHOryCPKDoJUUQYY5Lqk0//Y3mdsr/7U/Nar23oyfpAQDCs4c
	JW3GC3rrwW9YXxr4shGLstdE4I5457zXra/g8p6oHikAT0dKUZPWnX0eohSjD48Fi5C0zjErBv7
	ckDnxpFlShng3yFB/Hm5D/RcjHGh3MvWf0t/VUuX2rPS+EbOO9gUV3EV151TyVU2/s8AyHJFC2e
	tFuzdx5XUJz9Lw/cnkTNk2n34uAsMq5Sk00+bDxHTlTFM3wraIpjXcj7Hg/QnpFeEI5d99IlI2O
	IyCWLVHPYvbYa5AihMj+GPy9kB2aK5dHsMhL0pzBD7WXMC9+3r876B
X-Received: by 2002:a05:6830:67da:b0:7d7:c96c:c5d6 with SMTP id 46e09a7af769-7e694bb3792mr1003529a34.1.1780032172437;
        Thu, 28 May 2026 22:22:52 -0700 (PDT)
Received: from fsh.attlocal.net ([2600:1702:56e9:4b40:e3a9:78c5:641e:a58c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e695bd790fsm760909a34.10.2026.05.28.22.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 22:22:51 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: net: remove obsolete mdio.txt
Date: Fri, 29 May 2026 00:22:38 -0500
Message-ID: <20260529052246.4934-2-akash.sukhavasi@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529052246.4934-1-akash.sukhavasi@gmail.com>
References: <20260529052246.4934-1-akash.sukhavasi@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mdio.txt has been a single-line redirect to mdio.yaml since
commit 62d77ff7ecbf ("dt-bindings: net: Add a YAML schemas for the
generic MDIO options"), which introduced the .yaml schema and reduced
the .txt to a stub in the same change. The .yaml has the same filename
in the same directory, making this redirect unnecessary for
discoverability.

No files in the tree reference mdio.txt and it has not been touched
since June 2019. Remove the obsolete stub.

Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
---
 Documentation/devicetree/bindings/net/mdio.txt | 1 -
 1 file changed, 1 deletion(-)
 delete mode 100644 Documentation/devicetree/bindings/net/mdio.txt

diff --git a/Documentation/devicetree/bindings/net/mdio.txt b/Documentation/devicetree/bindings/net/mdio.txt
deleted file mode 100644
index cf8a0105488e..000000000000
--- a/Documentation/devicetree/bindings/net/mdio.txt
+++ /dev/null
@@ -1 +0,0 @@
-This file has moved to mdio.yaml.
-- 
2.54.0

