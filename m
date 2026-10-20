Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792533938;
	b=DN4KEcRY7TBHHXyvHiHShp1ZwjOnkS770HZ9XP9nFbyArn6pKViVuiXipaZg8LDmBsah
	 AWgk/r71e5kAk1PReqPJv4sfdfO94ecJqG1B110V8SWmDL5mB2sUYJS12AknjXUZX8Xqu
	 PGKGWK2o6X9l/fOd8ll4lAgQieYKDai4s+A87uIR3eRAIcffC4lsF07BZLBswx2lxZrIA
	 e2OJHRV4ygDRkLyqKANTR+VBU+Hn7BR7kOM2NMfoS363FVoZ+BI7eCcIODgEONipS+CfZ
	 kvnzPq2j3neeFc+KQOBWDOXnVw9mESxVfjHYBdFehsKb2rcw6m9ef+JZIrZ+yj7MbPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792533938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=p4RNd2i8xpZ0CJfOEJKH1RTYHzI0AXnVPwuk8UaUecw=;
	b=zZC8RK8ZL1zcjLlLV6NwkON+aUVL8zUVVSoptMIYRWMj7vTlpi9eSAeDRBRrqYkwfrIb
	 gkajUJoo2CGIT5TN9cCSm5AGhhwTQRD7RBjk0Jeo8MI6wdrfEDredQOuHkIPj6J8cKaew
	 Zzvx0CyX3VwVv501e8uuCzRrrV/R2eb+IXWDtCuOkXbtQmRiy8vUfY9H97gkx1W0d/O4L
	 1Xe7le32F0kyefmlipdDzSXoHJECPbQ1xfqYUmKiE0b3bxaw/R8B8FpXD8o3NBRjRYgaq
	 0a/BvPfCJNNdIyHfs593dXMnzYT5JX5N5Gucsh+kp03e3/A/UGwuRTrOU7W1MiqRbAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=NPwPE6Kx;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE3E606A322
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 22:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAE3E606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=NPwPE6Kx
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so96823eec.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 15:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792533937; x=1793138737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p4RNd2i8xpZ0CJfOEJKH1RTYHzI0AXnVPwuk8UaUecw=;
        b=NPwPE6Kxyq+m2RXE4/kcOP4buIj/UN5TdSWBw5siUz9I/NaQ9dlqu3Bgx21vt59bhX
         Sl1uKFljcjeQQga7TzMiwfqXKp2tfzS3wdhICW/obgjIpT5MKynYNds8CO4qh8AbskB6
         onT9l3QVU45cAokS3e4XW2M6IBD+GagxwoS+jK/zWeR1AqJRLFSmh9WGAU/N8ETqWsYs
         orZeZLJRUYEfHTifC8DoZ1fmjriQMrmmYy5PLMj5gg5eqChkHPYzpND4/Zfonz7U//x1
         E5D7cijLfTPrSx+8HhMiegzt9BO1NEsr4i3GyMJtJvSsZqN/FuPWyo6jtKwhVahrHoj9
         00MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792533937; x=1793138737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p4RNd2i8xpZ0CJfOEJKH1RTYHzI0AXnVPwuk8UaUecw=;
        b=Ji9GA/VVq0mvDi89zgl25ipVOnMtOjbkdolrRS/3pR6pMZ53vuDP+cdTY1ZE2IHHE+
         rR1lYW7inAW82Y4aZ9PUQxBJ91irLvUhefoMgTpMlOaXnJGp7QoXG1BSO1AExyA5nklF
         tNp15b3RkYueaHA8CVsFbo0f/LVKtz3fHOpcoRgPC0AZtiMO21BsJKXgmj15TXlRV/H/
         EN2THwrHEUb/S7j1QDkKOmkCRjuHjkmI4oJT9RsXAxU6nTriLbr+YWM6MwXVjf9gvYSG
         ISWr9XuRrn/MfoW85dyxL+ACnKY7WZk6f4ggiEol4e9Z01T7VCjXxFqA9LpWOBKDRV6/
         +vzA==
X-Forwarded-Encrypted: i=1; AKwUvBw5ehI7ddKXQl6GEBwDoZXxzGHvEO61PB6dcvB8S0Zgt2/AYmikIKIXCKkBM9bCplrT5zM+Wmpze9QE@vger.kernel.org
X-Gm-Message-State: AFq9FYIEBzLT4i0j4cCfF85IRS+AgGFqTr91+SXADomkFlt/Lv89KrJY
	e1CDGd5poQXYX21Rtk3AK4zOu/LGLM0jP+61UE6gW01A0UegbRCGAvsJVgcKUpit1h9JRSCBYen
	r+mig/qI=
X-Gm-Gg: AYBFou2QsUTC5CCtB8NvETMfW6wfnlpNhAW2fkKfl70jwudw61sBxBjiOvaM5cpPDzj
	U1cwQP78IsQQCaHRoI0SwGQGoVNBHI3eAdpAVG0UeJ5Talqv4NeSZwPkFFGI/SV4flaN7r+iU68
	J+GQvqpuXnLwU4WWW9c7JcpLYkv8WvmlYf8FSPTI30QAFwg5FtvkWyp04ALyJK9uVBgj76fkTSz
	OiqzQ3wrSwiIeT5FmIFDxKSSSEiwlX2i3S5PKkf1k84SnXtVZozcFxxlYqcHbD6g4+Ks0jSTUhf
	CgtAcncuDymHkWUfF9RedlpacT9IX73vQW+nZlHU2HiQA0Xg/6ayax8ZJiM30lTMKek14ZECojj
	RlYeVQFizNCOAFItoBGGbl7NVhdf3JgjVh1aBSYbJY5vNNDnBLrrrFfmceHowjwmfAS62s1jVo4
	58Ns3/QCm0Roj/C/AHnGu/I1WjrZnMBE1dzHFzIxEZX8hsEwYj5fh1fB6UILUy9f5FQGQqcocSo
	A==
X-Received: by 2002:a05:693c:810f:b0:341:5da1:7851 with SMTP id 5a478bee46e88-3674c63d98bmr751792eec.12.1792533936541;
        Tue, 20 Oct 2026 15:05:36 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1d8sm1917021eec.24.2026.10.20.15.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:05:36 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 20 Oct 2026 15:05:29 -0700
Subject: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add TDK Corporation
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
Message-Id: <20261020-hwmon-pmbus-fs1412-v3-1-51df629e13d7@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v3-0-51df629e13d7@nexthop.ai>
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v3-0-51df629e13d7@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Lars Petter Mostad <lars.petter.mostad@appear.net>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792533934; l=969;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=lNuNT+gSUpQSUsDkNUaVAjvOE/3h1o85CLNGkLI/j7o=;
 b=l2kS2EcpDnhnFD/N9cvWATlaQCr1yLIqhT8XqoBCuqatXxny12JqA7U9ERy/zmBY7cxBSMgn6
 q+2S73CAQJlDD4h9tItzALF/JEuO3Td0tO+SCm/f1Zx6WEq6nxZotYC
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

Add the vendor prefix for TDK Corporation, the maker of the FS1412
point-of-load regulator.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

