Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794681807;
	b=RT16Roc334Koe00jI86njzLR6vPpQFgUGlm8oAOK1U7R0Tcvau2cwd10Xkn47viPkoyN
	 xL/Cpsoa3CiXLOcC61L2+aNsOONSCt3C+wltoLqqLHgh6EP5X84eFAs8pjnaWdHNX3Dgu
	 07cU144CWkzO7IreP4sUpJqWLvzOCq7rZTLkzClTsq3McO96jXu0SewKSybowFo7ZqmSX
	 kaekD04sspUh8qYzW3ikJFyQIyeHctDjqX1xWzhoe2NnjWcwWV0eXXWFbLVYy/iDVIDDw
	 qkJPYapYgf8mbRJ9S5xWwI0llQazkrCfWw79Ksko1Y6wTyGPGKc43zSZqIX5T2XKrgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794681807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5TfgGwSvpWd3UKEyFfVSx8qLB6KqQDyrVVkNkIiwI9k=;
	b=1BNnBPm1tTEwCcjtyVzwX7tL5wMuwOXfK2gUvxc7lW4qmzVHcND7t2FrtfY06uTyx6O6
	 AM6q+KZ/fUBQgBpBeug0zNkuBITb9SQ1r2snuslu3JNhH6mGjfn5Z+5EaSp4N7RRx9nN6
	 d6ietfz7ATt2+i0tms6qm6bfvyWx9Cugatt+juDRYuYc5vtPfH+gtUKSsP9ioLHMfwesW
	 /3GOXUjCGhuGzNvzLmZhhUWTZvwzXHVfZF4WtUsPGH4Az6soPCtorC3DCY/0DrhwiKiQp
	 8TbKzu5oviTJEQFMwfYXdiL5sU6xy08vj7MWcyXhToo2uw8jlwX57I0v4792DtvgooQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M2GHqvF7;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE76606A32E
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 18:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FE76606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M2GHqvF7
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso12307685ad.0
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 10:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794681806; x=1795286606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5TfgGwSvpWd3UKEyFfVSx8qLB6KqQDyrVVkNkIiwI9k=;
        b=M2GHqvF724wS0kGiBHtx8IMO9pTfsh87vMMtqrh0TRHh53vXAGtSa6FsoFW83dLeV2
         un9/GzDNYTMNeNa9ffERXaSfmRfXOo/Un4ca0Rgqo4MQep/6R5F3PxNbkc/BfTXC1eJ1
         72BJBfR8k51ReNpQmJ+Ht24l+iVo3gyF/YKDRl5C6vKWLKOiLfzOdCQa+5a9QOlFlSEB
         rzSeQIUV/ZsOp7QU+s9e+fcHGxJmr5LjP8oW6/JimEV2zwWVHU2nV/sDyutx+szaqZyK
         QVxygWK/FbebtiJYQYDwQuEpkXJT+Uf3tqGkTYhBN8Apz0GwgbFqdVZKVE6RAQttshvi
         RWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794681806; x=1795286606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5TfgGwSvpWd3UKEyFfVSx8qLB6KqQDyrVVkNkIiwI9k=;
        b=eqCQdsjPOW/7u+VCZdK8SOgBk3r6cqgGkfu3RoBL1cD4aOknIvYYC1vTQxEWDFOq+k
         QEvq3JzIp00RY7SPbMx/d+kVbN1mkShgVd6d+62XOP07qJwvRfN/I3P3GgDwLCkcVLH6
         h4cY0qbQqLQYlXZ6COx7jW9mV7mtLoqomfNA5C6Fr5UU9l5eLuyPhKT0TR9aWQucbfB+
         gWWeDEch1bWappNgioSEolLrSYRDP+24OEaDbHWib0ACvKEH+mNKqXT2XlUJ+XUuBfsn
         LMz1rW/Z/4A9G9DhCCRmElF8tBpKPYLW149Z2dw7gPnYJBPxTu/d5Myu/Fhx3KJcJ4vN
         10cA==
X-Forwarded-Encrypted: i=1; AL+hErEQd6ObxKCenbpYJyHNCS2+P9gLeXMK6hpgBskac8e9rv8IdqauZ/APHIyPFXCa0nkSwGC2IJN0+LUc@vger.kernel.org
X-Gm-Message-State: APuU4Z8bwG4hPdrg4xafga4+qWRhKx29I8/mz2BSRm8Xm9kaLa/BJVbZ
	siQ77/lroNXav0D00G60Hv1ePNcTqh3ZMOs3Qkl6wLD4UdCLEW8m4OqJ
X-Gm-Gg: AYBFou0svXwbtDGXw+TYucgkTxNiReLrBelx1P1z831TBAxXowV6sK+LYWTzHJt2sK4
	4n89U3pqpEAarR58U6NXjZ7KBAIqDpO6dIlDq7BgpPF55vqirP23ODCN+zfNcLKgco4PBtErEoG
	S0LOBO42jFtG+raU7RWUdiSWyTX3tYdU3hWh9Pg5Ye3KtwqZS3ReXrW4U4txvHl6n/XIXJxVI7J
	3tKhZ0Z2z+x8wF5YsvlTtIXQGRckmdYiSOuTlykkkIpiPIg1u5iPb494A7eau+sSUQ3fzhEYxO5
	klhctknMz1QWUJq1K5q/7/Rp/y9vi7crNbrgWyiIjQLgOZL1nP1yiL1bJcP7LgouMJnCWjbSCPm
	pU3WD3Drof0yD2QvcQVwjTQxc2FDbQQ2Hyig/0RhGcY/KoTdYIfbPT8qR8Eskw1uEaK8I4UXUqF
	jnpxzGNf725HM7pdq6DRJZU7Q9MQhIZmRe+i9K4j4hDPGYd+JPJAhmMg6ybtX/s1+HB469u/1xT
	4lS8cc+92S+p8WalJxaba6ZzpwSBFXQta2pD3E+uxEUb9XqghWEVO0Z9f8ly76ap1ehk7bomRYu
	rDymMzthxyWzhIBNokd+zysZvACShCHY/ja8vpQX88P+Q+B7eWdcAFty2x0j7mW/lyQ5jAhlAkQ
	=
X-Received: by 2002:a17:90b:4c10:b0:3ac:9e76:aa9b with SMTP id 98e67ed59e1d1-3b1b07fee23mr6296426a91.7.1794681806420;
        Sat, 14 Nov 2026 10:43:26 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:6e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb17853sm9700940a91.5.2026.11.14.10.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 10:43:25 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: watchdog: arm,sp805: reference the PrimeCell binding
Date: Sun, 15 Nov 2026 02:42:33 +0800
Message-ID: <20261114184257.535546-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unlike the other PrimeCell bindings, the binding ends in
unevaluatedProperties: false without referencing
/schemas/arm/primecell.yaml#, so arm,primecell-periphid is not an
evaluated property on an arm,sp805 node. Two nodes in the tree carry
that property regardless -- watchdog@a2c000 in hisi-x5hd2.dtsi and
watchdog@8000 in mps2.dtsi.

`make CHECK_DTBS=y`:

  watchdog@a2c000 (arm,sp805): Unevaluated properties are not allowed
  ('arm,primecell-periphid' was unexpected)

Add the reference so the property becomes evaluable; both nodes then
validate.

Fixes: 73d3e43f9813 ("dt-bindings: watchdog: sp-805: Convert to Json-schema")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 Documentation/devicetree/bindings/watchdog/arm,sp805.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/arm,sp805.yaml b/Documentation/devicetree/bindings/watchdog/arm,sp805.yaml
index bd7c09ed1938..690456839fcc 100644
--- a/Documentation/devicetree/bindings/watchdog/arm,sp805.yaml
+++ b/Documentation/devicetree/bindings/watchdog/arm,sp805.yaml
@@ -16,6 +16,7 @@ description: |+
 
 allOf:
   - $ref: /schemas/watchdog/watchdog.yaml#
+  - $ref: /schemas/arm/primecell.yaml#
 
 # Need a custom select here or 'arm,primecell' will match on lots of nodes
 select:
-- 
2.53.0

