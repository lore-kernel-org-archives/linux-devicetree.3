Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.111.35.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794044134;
	b=GeZvjkTMBSXaDrypvjIRLp7bnKvecglA3gqIagvdhdlOqvNpRTkjyO8vrGecJmWlXj9C
	 ypNDJn1xdMq7PPjopv9huxlv68aRzgKoxRoev/gOHMdvq48Dhb/I/PhfUDv8Ic+iCG2Qk
	 3ptQrtUT12QoaPfWpN9E2HVrtsyVf7zJBgm0c34HtFMKsHhisil/Q5I+UFJEyhx9JnYB3
	 DxmcQ0smVapy7eiMkKAwU1fmn6vXjpmr652cV4mUEUWFK4WRWmObsVohRLbOgcBpq9uNL
	 ZGn6kBytL5HeS3Rq9T2OsP6AgBzcE45nsewikplqdwktnoVi0oU2t27Aiy/MQmck+YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794044134;
	h=DMARC-Filter:X-Originating-IP:Received:DKIM-Signature:X-Session-ID:
	 X-Originating-IP:X-Works-Send-Opt:X-Works-Smtp-Source:Received:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=V+XhhLUmqc8hJ+0DTpPK53z0wW9fth/qOBlo+Kljc6s=;
	b=WysbJ2MSotxRlVGhz9UhWSg5S8VfMsgjlqlTvytJjSFQHpSSNag4ZU4EdUfSiP8pUl5+
	 hHntxj8QYi/dvehAGSWrptKBvYKbqMHves6dmKw072FWhEEd4T60KalShYJcNsMUArB08
	 pfmREhTYQya491KHrvofSuZLRxXLOHZW6PxS4rQus9TG3u2jcDfpZ4mO2PIBE0cbeyc/S
	 oZV5gY/PBqyQXeGTQp/0Zjppo7v2DpKsbk+lPUbR7Jyb4+kPZyqpNcGGGRll5aaKuffCn
	 4iE7oQOKtc1v6VnSyVXUseV05ELNNcNv0UFJ/kyQqGLlU9ahPYD6H6zzK+NqGXgUjBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=naver.com;
	spf=pass smtp.mailfrom=naver.com;
	dkim=pass header.d=naver.com header.i=@naver.com header.a=rsa-sha256 header.s=s20171208 header.b=GndCP92s;
	arc=none smtp.remote-ip=114.111.35.112
Received: from cvsmtppost26.nm.naver.com (cvsmtppost26.nm.naver.com [114.111.35.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6918606A326
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 09:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6918606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.a=rsa-sha256 header.s=s20171208 header.b=GndCP92s
Received: from nv1m-hmac-real-8 ([10.174.201.121])
  by cvsmtppost26.nm.naver.com with ESMTP id q70-Sq9SRFqt2zOQgqzT6A
  for <devicetree@vger.kernel.org>;
  Sat, 07 Nov 2026 09:35:25 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1794044125; bh=r0jaUQdPSQ5nbYmFvihIbXns8Yj4dBzdFpH5fHsS6EU=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=GndCP92s1eFRJKY2b+AIIW5pvdK1SA963RHFKOXVihtwOfF9F7eJX+T4/SmTLRoTg
	 PIxQcj78pjX1ccSkPIbahkEiom6qgalTBmI9379AxLiMjeAPkTkQaT78/JUUF1WN94
	 /rasJfFU+3cDISgEO4Rip/cppN8xzFF577TkkVtc1KDfTolkR9eBb/hY+k9zggTcn0
	 vGVhBgaYDUJCuMhEcypm83cl2NyhAwRzqXjmrzFjwfHKnXJTB0zHxDgHiT3//z6NPb
	 2QJG14t8zHnnsCXtqYxJCL3uprkFlBYnpsyXgMEVSjVrBC+iQOHeOrzfnJEz1DsMT6
	 9Is7dExTacGDQ==
X-Session-ID: mNnVSoGKTu6PA+Qzuhpj6Q
X-Works-Send-Opt: OlewpzGdjHmdKHFOMr39Ko3YKHmqjAudFqM9KqMqFxIYkEljxBmwjAg=
X-Works-Smtp-Source: rZYwKAtlFqJZ+Hm9Kobw+6E=
Received: from localhost.localdomain ([115.136.205.4])
  by cvnsmtp009.nm.naver.com with ESMTP id mNnVSoGKTu6PA+Qzuhpj6Q
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Sat, 07 Nov 2026 09:35:25 -0000
From: Sung Byeongchan <tjdqudcks0424@naver.com>
To: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH] of: fdt: reject oversized unflattened trees
Date: Sat,  7 Nov 2026 18:35:19 +0900
Message-ID: <20261107093519.618896-1-tjdqudcks0424@naver.com>
X-Mailer: git-send-email 2.43.0
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


unflatten_dt_nodes() computes the expanded tree size by advancing a dry
pointer cursor, but returns the result as int. A valid flattened tree whose
expanded nodes and properties exceed the signed range can consequently
wrap to a small positive allocation before the full second write pass.

On a 64-bit UML build, a 157,133,160-byte FDT expanded to 4,294,971,394
bytes and narrowed to 4,098. The undersized write pass left a corrupted OF
tree whose property pointer later caused a kernel segfault in
__of_add_property_sysfs(), reproducibly in three fresh processes.

Reject the dry scan before its cursor can exceed the signed caller extent,
leaving room for the following alignment and four-byte end marker. This
prevents the write pass from starting with a narrowed allocation.

The fixed target rejected the trigger before allocation or write in three
of three fresh processes. Normal, near-boundary, malformed-header and
recovery controls passed in both lanes.

The demonstrated impact is host or VMM boot input corrupting and crashing
a guest kernel. Information disclosure, controlled write, code execution,
host escape, RCE and LPE were not demonstrated.

Assisted-by: OpenAI Codex

Signed-off-by: Sung Byeongchan <tjdqudcks0424@naver.com>
---
 drivers/of/fdt.c |    5 +++++
 1 file changed, 5 insertions(+)
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index ecc9231026224..135502b882020 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -310,6 +310,11 @@ static int unflatten_dt_nodes(const void *blob,
 				   &nps[depth+1], dryrun);
 		if (ret < 0)
 			return ret;
+		/* Leave room for the alignment and end marker below. */
+		if (dryrun && (unsigned long)mem > INT_MAX - 7) {
+			pr_err("Unflattened device tree is too large\n");
+			return -EOVERFLOW;
+		}
 
 		if (!dryrun && nodepp && !*nodepp)
 			*nodepp = nps[depth+1];

base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
-- 
2.43.0
