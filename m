Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795445265;
	b=Liix+l2LEVmPxKKbHtdqdcmdyqP3u6dfiQdhAeMdLWyJiSP/uowIUm6nLeIfdEdAGq5l
	 KdF5Yd80uRsJqHYbH1etPKAjaD8Wkw+n2oVB7OAXEju3IMaxnmlCr3YnLS2/F5ziyQoyE
	 EOrRS0H5SMyd3Z1Kxfb42aJACa24GBznHnA+V04sqPyuUT++9um7+LusJxqqE42rYdwM1
	 Dmsa7z0/OMfA+Aj7H4w2//l4uG/0aFZLfATgGUTIxsQC9ckzbLZ/q/SpeMg3Ma7pPYean
	 Os/HlnKedZYUpyjr2MnzeH7a8LGCiHSIN0ljbAkcg/c+Q4X0xR8r3Nf6CLsskgVAGpA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445265;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=O8IElzxjqMQJ9EmBIa0/9YgZRkTTB3zoVA/QCHT2JbE=;
	b=BMFqHpSjQMpUTpvMBevff810C5Kk2fTdTmgh+6LILS3k4gdK810gPpsbfZy1xTzAjtRd
	 XovxvkivaziaVPVSWomdQpffo5jE2SBhLyOSjYYQwscX2aUqkw86RxQj3jquHjnwoMOfT
	 Kuc+jEeufVO0QtYksK/SMWHRKC6MFbV7vNfC4gOU/s3WJN4mRcyyylOjNbUFVk6/j6POR
	 XV/aQryLzTe5Fh6DR6aRWQsdr7Yg0UL6mJ1WioMDGvIXNNXX9DqaIhnK+ekM4QN7VWwFE
	 FLPXmBwLb9BYk2DI7Qd0gvkP3fdwdA7zIsEkydhFQ0lVbYrrQCJUS/EjqX48sQOSUMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XWTna261;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB94C606A690;
	Mon, 23 Nov 2026 14:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XWTna261
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795445265;
	b=xIMX9GUqAhoeu1NdxIjfJJHDxyUm7izbfPXTaCKG7reLHfyTxR5fMA4eAqVn6dZ9EkBh
	 Td3LkXALsX1GlPphr2zFwwhS+fqZrwou4aDlHHyyUDWjIJNdtJwdkEOGbXFbxGyNHIS8Y
	 nVGOwffCtfCDU17NBeBmZsr12BXSYFL9fKvAY63oblGBbsAofbLs0PEDYr1Bo7ITajrdC
	 iFXbfc7jTvgDF1JH1Z6uexMVYFxMOj6RJfpjGgermAXPr2+MakxT2kl43xH2+96+uGaRv
	 hBaS23frvr/kHX1xcr3fpiim+lfkHN5UQt2fYXeHrFd8iiPI/O5QLxbUqzEQSwbzewA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795445265;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=O8IElzxjqMQJ9EmBIa0/9YgZRkTTB3zoVA/QCHT2JbE=;
	b=fVmcCKhHBBpKhcHwwPWoF9jRWc2xuRcY39p0j4wKjbqdhOyxc/q3NnGv5LCRpEjV4Y7o
	 B2aeSgWP4w29GEZZPn+/XbIlZK11rYquTA+xbrlGddwCPuanWOH+Ec5PpgC+EqFy0ERMi
	 Ov24JcD8eg8LmNNcGId31C5ahirueqSGHTIk9ktE8XpqIvVTA9Yt41+IM2Z3ZEAxFdwdy
	 s/0EDEFNKxtdGmx25LqE9bt1BnR0FcIpc2oppmdh4zxQ81I1DKTeo0kAqtcS7nF2ZhnsO
	 8C8uDDB70I/sZAP7id1dsRcv1AkA4ZR2QBxkJMfdGsXFJGu8/FbDshwhHvlVpIGbGYw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DEF231F00AD4;
	Mon, 23 Nov 2026 14:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795445265;
	bh=O8IElzxjqMQJ9EmBIa0/9YgZRkTTB3zoVA/QCHT2JbE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=XWTna261ovKUmPo4uJtMphVWiZl2DV+SsoukXA52SyldP3T2pwbVo8K9bw8YVSBC+
	 sSnjPYQ+JDVWjHj/K+2YXamP2A2iKNO3sI1NE+mtP8qX72R9cwW3M8TzBUFIICIa0z
	 pEBNiL2NvjFDBK5i/tNhZT+TSqW+RNf2sQ6zU8qZbYBcGi6pFsZlKUMCeTpkkk3acS
	 8TqHppdECVm3pMLpDnzWzsMxiSj9a7nWDxaJcNiYOancz8n9UZSxYs4AX5VYzrraJp
	 4JRrEpQf4151FEPkUGIGVCNzxe6B7O5x0VK63qEmDrmvO0brQ741kPGpaUt69Y6Huz
	 /hE6oS/98S2QQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6F5134C507;
	Mon, 23 Nov 2026 14:47:24 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 23 Nov 2026 15:46:59 +0100
Subject: [PATCH v4 4/8] dt-bindings: interrupt-controller: Add MIPS P8700
 ACLINT MSWI
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
Message-Id: <20261123-p8700-dts-v4-4-60bb7bf8a7a1@htecgroup.com>
References: <20261123-p8700-dts-v4-0-60bb7bf8a7a1@htecgroup.com>
In-Reply-To: <20261123-p8700-dts-v4-0-60bb7bf8a7a1@htecgroup.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Inochi Amaoto <inochiama@outlook.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Joel Stanley <joel@jms.id.au>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795445243; l=1430;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=zFOUG0JTBN6Duoy/8XI+grpvovTujt3/U4G1NG7BFIQ=;
 b=yapQy4pfohEmMI1MIcyUSEv5C1YOH/dKfWstHIDHzFj406vZJxU3NW3gEZzLE3eAFPYx5bTb2
 JKs0+MhbKKyAoe1KQl55eI42wNgoi/Hbk0pXqhNEGHeIjXND2sguzO2
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com
Content-Transfer-Encoding: 7bit

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Document the aclint mswi compatible for the MIPS P8700.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 .../bindings/interrupt-controller/thead,c900-aclint-mswi.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
index 62fd220e126e650e3800d8eee2a749fdbbde6108..3255ea666e1560ccca239264786fa49d444e8101 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
@@ -21,6 +21,7 @@ properties:
           - enum:
               - anlogic,dr1v90-aclint-mswi
           - const: nuclei,ux900-aclint-mswi
+      - const: mips,p8700-aclint-mswi
 
   reg:
     maxItems: 1
@@ -46,4 +47,14 @@ examples:
                             <&cpu4intc 3>;
       reg = <0x94000000 0x00010000>;
     };
+
+  - |
+    mswi@16150000 {
+        compatible = "mips,p8700-aclint-mswi";
+        reg = <0x16150000 0x4000>;
+        interrupts-extended = <&cpu1intc 3>,
+                              <&cpu2intc 3>,
+                              <&cpu3intc 3>,
+                              <&cpu4intc 3>;
+    };
 ...

-- 
2.43.0


