Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F36629A309
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 00:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791507372; cv=none; b=PgoGgL/3dRcV7d9qd3YsiKNZPX51NHB3w4CPtFVlZuVp3C6AHcTBuca2bmGe6oLRA7fCTh6QJ9p1Wg13fcgJ5Dtl30VWJ7MN6xYVirQJAltu4hY3Sei4RX/ImUiAst89pAAsWI2TSTwCsb9Q8a2A0TMdgPizbqLnqPg9glgZiUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791507372; c=relaxed/simple;
	bh=yy63d1ySOFQGedeCRXdnVMp+NykFLNzr65iketikEgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gUGAB/wwguToEFl749A14aTnDTWX0DMsUmgbgsMXW4QjMbKjkPowIMGYzK8p0/Yxs9Le8ApyFnL8mCx5FMdpsd/vt3FIVelUpMFmq+KwYMDJyynB7Q3ibkZ7ERdW6osJ+4JQwLUKZ41gFsktJJT3b/eNbby0knm7cYVniTHBduQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=AgpMKZLH; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="AgpMKZLH"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3115c4451c8so5010060eec.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 17:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1791507367; x=1792112167; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ski0uA9iXMK3c01MK9RAwSltkfrOdMZ7bYUX7Oaxv3Q=;
        b=AgpMKZLHm46SBcoVPlb13Et14TDyyKEgdg8vxDk+wuIx4g8HguzhTOyLmyZc7MDl5I
         SR2H4BpW6E15ARyb6adCQIWppNLOpgB4J8WqLtfhaDPGL/ddJwkmwCYOYi9ov+K28W85
         VgJO774iW1x3dj9NpFYIriRW370U3NzFKMN1PTR7JXbNan6sGtRFFkq17WqH/j+mduBD
         NFRppLByNscAcXiiF9ES8cFmUuxMzfzHK5u8Uo6p/GPnhYf42KoNWYDI0E9rgw0zikxF
         gXX5nvQ36ZL3Km19S1KEzFfdtNUnAuegWHfrPF8sd05Et0TOt55JKevFflUeFLOUsVcG
         6jMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791507367; x=1792112167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ski0uA9iXMK3c01MK9RAwSltkfrOdMZ7bYUX7Oaxv3Q=;
        b=AKpvWj0j53hbrFexAqBymMBnp2QS+fCtrRUmtxRozsbw1f/657lImKvQkeSdR0KAxW
         UAQv2ZitGvQh+QlGBvEMMyj7e4ds0D6gLbc7Pg7+x+0kjkT0mGS5LKXbZFCaFv/hNYJV
         JPjY13QRaQlzAaU4zoFUBFQJSIJfk8YFsa5cS60fejmjfhJdZUMPiJ1oxjRIvdErzK2q
         7MZ8o4Xb2Jgl/MNzfYOjv2+tTBNsCUgihy2CTlxPfZ1WiulpGkAh5SDjtaFE5loPVdEH
         AymWqgSgs13jhnejWlXd5DxaW+kQwZRVY/LkMbgDQxR3UEDElo8AfPR5SzN5s0R7zf72
         CR4Q==
X-Gm-Message-State: AFq9FYKpNKiH1jEQRml+eyg+8UrnXNXoHo+PRP9dnuNO1Q5Z16qOjP37
	j8jDyqsrb12mGuf5dIBCwfQJP2ncAtdav20a+A8RQe+rZQNI68CHRuZKsumB5gj4kXPx2uIT2/M
	J9T3GgF4=
X-Gm-Gg: AYBFou2FIezJ78nLi3jEx1TnzTafTAdizA2uLifQxlui1O48hTQ+lKmEUr2TjJO4RJa
	cZXAFNY3lO6+WuMA3ZkL+pPitirFq0Es97rx127RlsUve0tJxYQRMhszocU3aO9V/6KnuZLghsI
	095wixexsrngsfYjTdw4XzCY1i5NFnqju6dIvxgGlVOyISwFPALCCkBQxBlM6v8u+BiwW+E1izT
	2CnZXtKl9i/DxWX/oT69Zq8XVoMzHsAy2kSusDd5OsAHihtkIE+UG9XRWR6GKZjq9op138nTE6D
	CFGvECBasVn82ZXUVWDNXn5ldAvgExnBhWrGtHckXPW+MXvDJQbNUqdoaNFlwZpKX49vUCd/ZjN
	hPAKh//FIX0/sX4F3nFPerqudoiPg0AnilX7cLLM30SUtx1D6xzfPEvbBeqaXphovsLeXUq7eMu
	nflEh9geZ+nznMhNDy98TnjpYP0zE5ylaylK/hh8aKplZJEcTbxf9uWCpoHX6h3sb8yw6awc3VK
	Q==
X-Received: by 2002:a05:7300:601e:b0:339:851c:4c1 with SMTP id 5a478bee46e88-3536c593e70mr1308972eec.18.1791507367192;
        Thu, 08 Oct 2026 17:56:07 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb61asm1760205eec.21.2026.10.08.17.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 17:56:06 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Thu, 08 Oct 2026 17:56:02 -0700
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add TDK Corporation
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-hwmon-pmbus-fs1412-v1-1-0ae7e5ee4e41@nexthop.ai>
References: <20261008-hwmon-pmbus-fs1412-v1-0-0ae7e5ee4e41@nexthop.ai>
In-Reply-To: <20261008-hwmon-pmbus-fs1412-v1-0-0ae7e5ee4e41@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791507365; l=899;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=yy63d1ySOFQGedeCRXdnVMp+NykFLNzr65iketikEgg=;
 b=CWMjSE8OHUG5p6XT1QboxHkd/VxQbJxvEmdWkIGcaaJNDehDcs3fHs2t8zbEQi/i4aFsI7j1Y
 UDZ7edbIvDqBH/d0wIB32JHBhUCNiOPPI2zgI8zVgcWuC594gZIMm20
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

Add the vendor prefix for TDK Corporation, the maker of the FS1412
point-of-load regulator.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..a7c484d1113b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1680,6 +1680,8 @@ patternProperties:
     description: Shenzhen City Tang Cheng Technology Co., Ltd.
   "^tcu,.*":
     description: TC Unterhaltungselektronik AG
+  "^tdk,.*":
+    description: TDK Corporation
   "^tdo,.*":
     description: Shangai Top Display Optoelectronics Co., Ltd
   "^team-source-display,.*":

-- 
2.54.0

