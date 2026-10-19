Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792435545;
	b=SdQaFqB7ZtyKPGMLy/V/O6uIeMBNIFy7JDwmenaHf4RqqGZDT/IBDvUhlEPa8h+IUU/X
	 MiIHOWR0h0zTx3UmHNFwUxQOW1ljxKklkH0jLvyd1ncHpDt90cZNfZ9BlErfoWJEYvfpm
	 v9WwWUvIbNzAlsViD2jGS3pHzPGZK/m6NFW00asd965ilI3+A0VnPio/hAIXczmepfTma
	 hpeSC3xNiYrPFkLhbWg9nh88aw3FLbsbeYD6vh56sJkfzJjTXPu6aiGsUuRrPaYJqgw+N
	 p/XL+xwMt21+ikh3E+U6c4G/QvC3lmKOuCJJZmyPW5E2M3M8sZ6HECbPOXU6Pq5OwEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792435545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=tPcVFMHqz4mnw3Ff/F/mneRQHFwopYrVpU0RUgxr0Ug=;
	b=ReHB766Hm4mIXYQ9jqvE/fgeUdCSb2qYO+2m2Kj8t68PIeLwOZEXP9riMe1nd1sPwxZ5
	 kk26WVdHYMCCqu2jJxMpIGyynHvXyQBcTUle9j5j22JZbJXYkDPV9DSJJ1HfX518pUngr
	 Jc8oq8mpJ9zXkYahsyIDN0hzuVSuEHbt51CjxylotjaYwaeRInSkumGi6Qc1++ZoUALS+
	 9MYYOKzxE7wlGcmMi1oQHcdcZDPi1cbZAZ0KCO3hnCA4+ahsmc7l5zuvcIAc0c0eSkL7K
	 5ERKsEXGoWrDMwlLDJw3RlSwjXw3GIdqDohMM8AkodMPXN3KxXZvUGgI7FsZ2ntz2mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=hnv72qRn;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B646606A32F
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 18:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B646606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=hnv72qRn
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1517bda04a0so1905850c88.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792435544; x=1793040344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tPcVFMHqz4mnw3Ff/F/mneRQHFwopYrVpU0RUgxr0Ug=;
        b=hnv72qRn+iUt8O6TzLPtByCtiweKT79pU7DeP0K0o8D57V9G5RGqQtTG9IvTLC1vXi
         BThZ2Em92lZT9s1v2Ha8bNY2N+zOEZ6UR2+/XvXgvPWzM417TglE3oK/k3Fzcqm9L7W7
         weeRPCUIbozhqJbA0+KqjZl8gFI/1GBUHjKV3yQSH96dgPE6bU11eLtZW1kzLAckFGi9
         SFBjTAABE6B8dxttC77t2tQMpRBUFWN8GQYDs5+PjPXiUVhe6yqAogEqwE/wZpMr88/Q
         zm/+btYsav1BnUznBSUOHHHEINaoGDZGlhTquZBQ9xi+7wQ9DcPdEOOSg69Zd2r6rkhn
         79xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792435545; x=1793040345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tPcVFMHqz4mnw3Ff/F/mneRQHFwopYrVpU0RUgxr0Ug=;
        b=1tZag/F8yapiITV1ozU3UXDrwk4336fDYT6vSHwXHXM2XCG/2Qcbvf/0XuuSTlkkhc
         xeoA9KxtShc3r8SCox/nxvZjj7MghfN5z8OiH1ORBPLuXgSp5E8GuMFixhNidi9gvvOF
         9lp1Lm8iCIZYLf+7jz8Zfmukh5I/UhU9Vl+U/aSjWRIsmMB7cvn3bhe5dvwHaTcTDzYm
         T1cTOaNTVuEkE8p+idygyPcRON2niHsKJ8xPmmdk7xbzQL6/sb6DZgVJyGz3jgY5QD8Y
         FaSbfZYoEYs38K15HuaftwkEnHE+56nuqMEVFYHifvQCsmZmaPlz5JQGuanxcEMNUT7N
         22VQ==
X-Gm-Message-State: AFq9FYKYYqEgohPLtfl/nC2x2BA/BGd/VCjLyvlFyXb+8Mi41ilup4jf
	7PUToZ/zsQfzxHANNmkRjAy0vpTE/rggiVqzHZcP9SE0Nvv2wbOsIB6wCTMY6wau324=
X-Gm-Gg: AYBFou0gGls0SJaK+wZVWB7P9I2UT66cTHSuAmT/Hokf7+LlQ75ib3I61McLsAdilVx
	NF3QWBASbRkhCEBBpZe+RJwXI61AflO+/Lc1nFoo1D/DLX2xU6v0pNU0XekXnLBfnW89UBPJGKY
	1P43YfPfTjQmkUN8pi7qdeeyOeUt21YGOhLJlJCZ92JDW1oKe59lFEcq8uzUp4DjlN3uPxpuaXM
	Lfk6yxsSJf7Y/GlBeqr0QwcXgSnsYYj2h5hRJAoyU8bwi/4XcMouWyl6i/9hnWGqO7oiWG6fmBq
	OUx2zEidPxdBmx2enmxgNqhnJiFLLv4TzQpAVk+cX0E6dzSs8TGRuKjPT7EZVHDG7V46TjBO4TQ
	1HqeMx+hdCzr3yzROKdUSPS6qGkF5KeEmaa1tqxObhMq9M4dS7hAdtPmJ7T5WfD76xhGcDmDEwy
	Y5k/3blA+XhnkNQ849XVMM5AdAaTKrYJvhPWLNxkMmA+UVrs6U/9TeJyz2JOZhqojV
X-Received: by 2002:a05:7022:b043:10b0:144:c128:4c4d with SMTP id a92af1059eb24-185139aa945mr12351075c88.38.1792435544338;
        Mon, 19 Oct 2026 11:45:44 -0700 (PDT)
Received: from [127.0.1.1] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c4d4675sm29907576c88.21.2026.10.19.11.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:45:43 -0700 (PDT)
From: Kevin Jia <kjia@nexthop.ai>
Date: Mon, 19 Oct 2026 18:45:14 +0000
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add TDK
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-fs1603-v1-1-8adf972386c1@nexthop.ai>
References: <20261019-fs1603-v1-0-8adf972386c1@nexthop.ai>
In-Reply-To: <20261019-fs1603-v1-0-8adf972386c1@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Kevin Jia <kjia@nexthop.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792435541; l=858;
 i=kjia@nexthop.ai; s=20261016; h=from:subject:message-id;
 bh=RLHUZiHjILnHW2rcudg+5Lp4bRYjlbIHyQfQJMexFWI=;
 b=Kh57j8s7DigWfkjHFM25DugGH1/bTpHjS2ftggA6TludMkXbm72al+7MlNKKvjFQkZ2BdLHJL
 cA+nHKU/lXfD8+FFfFBtdWxIKqrGJKB3rxBJfK43MXO25pJmZ/UkQJ2
X-Developer-Key: i=kjia@nexthop.ai; a=ed25519;
 pk=TcHV4RjX7qo9R0iryPJ/gWzq3O9yq1SUw0VO2QXQ3Zs=

Add a vendor prefix for TDK Corporation.

Link: https://www.tdk.com/
Signed-off-by: Kevin Jia <kjia@nexthop.ai>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 4a5cf436eb14..b82311759c47 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1682,6 +1682,8 @@ patternProperties:
     description: Shenzhen City Tang Cheng Technology Co., Ltd.
   "^tcu,.*":
     description: TC Unterhaltungselektronik AG
+  "^tdk,.*":
+    description: TDK Corporation
   "^tdo,.*":
     description: Shangai Top Display Optoelectronics Co., Ltd
   "^team-source-display,.*":

-- 
2.43.0

