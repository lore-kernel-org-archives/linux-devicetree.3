Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794945345;
	b=grSZwsS5kJdP+cAE09+s30cDSauUeWINtkkrHmjSjLeIScpkrdJzvgurUZqOS5hIyeBQ
	 gWDuMhZ1wS2B1gHRSkT7FjZCOUnWKGNcM2KzafLVwnzp6mOLlg6P4HrUhLgaA2VZ1fnDp
	 eQ995JAAiIfRrv/hhd4xvczpEsKs2cpnrdHA0MqzSHeugdnOF+/5sJm56Ho61zoNhA49W
	 YTglfBckSlrnm2ML+LrRZKWQDSEJlYILchcfbxl75WUpn47GZr6knUNzz37LSVy3UVBuR
	 SA6d+T/S09xtXhtmWArdAAFBD5rSYjvr4+6bXEF7fLz6Bx6+2ZSVYf18bP/byA33mow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794945345;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4LbBB/2g75fJnlM1nVGDOVNBXnNl2+P7T1zrJSjDCkg=;
	b=o6xV0UU6sP/qPrgZ87Hl2+J5RBVMcoWXLiov8gKLC8WYx/Az9cksVxWGrWdhC39RKKIn
	 KEoGJNf+Wwg1E4dsznjh7cJxjSbYrCTeZtdlPKpFX0A9lTED4oySgw5ag9RUgH5MJsaNh
	 FOjtEidEZRvfIJlepBoe0TGMEzxRaoAi+sVVr6bmFG7MFK2Fh2Zd07uPFH9RHJbOC5UkD
	 QEuhuDjJgqi0zg1Gu6uHLxFsVmdmhut5vCs17M5LDLywmqU+0kqMoYv4inlyZNEu8RM5X
	 aJAD2OjGkHJGPh+VqpOuwkGoHJwVAPgUAuv/QfmzN08bBEAfQkoJvayX5z96jqZWTqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CdFhx3Xl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6FE606A336;
	Tue, 17 Nov 2026 19:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CdFhx3Xl
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794945345;
	b=mINK896MFMx/Wc84p3CFqcinDUJwSRHdbJWFCTl0Upmkua8Qs++rWs/fz5CYDq00YWBF
	 ZMODnIogiy5GeovBjgVTNTzj43QXNDuFiT+cIfrvHLBlHGwBsMjBr7v98S7ymy7HQF0A4
	 pSAmqYIswDIifYg4IBGFBrBSP1/JNhekzReveXXR6GrWoeVrhaIuO5q3Gkkfr1+WVMmj4
	 KHpN8I09GEg7htveD94hXsloOGfMeulQqeZXIx4nsFRNyhKApvx+R2rHSWtpxng5YDupD
	 +/zs4HSzQKg2LXKJtS50QDOfp4ZKD75l/CPSMK5kjt+Pj/4jlomDdqdOJ959IuCooqw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794945345;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4LbBB/2g75fJnlM1nVGDOVNBXnNl2+P7T1zrJSjDCkg=;
	b=H2ujLAIAeQN8NaB8v79GcNNyRX3O5tWJJZgvDlwZq+CzynJnx3EBXu0NOpvA/bJHbM1E
	 1XBnlr68ljlIto8rYyn32ICKw4qrjz8kEM5jzyeMOnFme+Rq3GFKYlbAWTJbCslXsmSrk
	 gdWHH5kyThhif4CPhfyXKEOL/jFgZ32JnTQtd46Gl7Z/FDMIu6xSn+n0aMZuxDeZ0Z4Ww
	 G6qeDaOX8uElKk1DLALGFN6W5jOWEo7M7Y1Lo6aCXiGTMVr6S+OYgz5v+k2Ck2JrXl26J
	 fwTDg6VCZwDzGr5pKxhDiMp+OjnYG/dVUFMiHe/K2x4TOYPPzadmj7Ciq7t81XHzOXg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7ECFA1F000C6;
	Tue, 17 Nov 2026 19:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794945345;
	bh=4LbBB/2g75fJnlM1nVGDOVNBXnNl2+P7T1zrJSjDCkg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=CdFhx3XljhOECfsUvYXTLOmQn2K3NcBrbYjaNBEfD6mOrQF9teB9JK82dcxQUmmpW
	 aHrPam9Of8OiJuFkLqsbrC6sn/szLv4he+QlAPehNzTCg+Yud+9kdOUa6IlmFUk0s8
	 84uotyl4AwNRpMbKc1piyTOE8aOS1NiEs7GXIEcFUGkG5w9ZJtg5VbsV50QRX7b9TR
	 3uBDsDIFLgunUYg9SgjWk76jRO71RCPXjfNWvVuira8m3KhoRprDc4OmkhvSjNrkUz
	 kabC1+8JKgk+69uGj0RLoxpQqHVJ1RAZ6HDYvVB8qu6oQr7V8vaefApfHIMHhUvvQn
	 UBpn4+jLMrngw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 042F34AAA6;
	Tue, 17 Nov 2026 19:55:44 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Wed, 18 Nov 2026 03:55:31 +0800
Subject: [PATCH 1/2] dt-bindings: riscv: eswin: Add Milk-V Megrez
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
Message-Id: <20261118-eic7700-megrez-v1-1-af8334b88336@iscas.ac.cn>
References: <20261118-eic7700-megrez-v1-0-af8334b88336@iscas.ac.cn>
In-Reply-To: <20261118-eic7700-megrez-v1-0-af8334b88336@iscas.ac.cn>
To: Min Lin <linmin@eswincomputing.com>, 
 Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>, 
 Pritesh Patel <pritesh.patel@einfochips.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794945342; l=781;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=yEGqwvhItikCOim9M5s0hyGEeXn8c2umboDlEvC4XcE=;
 b=vJkJCHW1LYOknvi8cBGwJUp6g+DVOC4baz2OHV6esjchbFUr+XdmFwmXPZ5hydiIC++gZ6zdH
 ah+Dnw4H0SgA9R8ycE9DfuWS32P90YnPFhFfxzcpJi13THi2FcGZa1b
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn
Content-Transfer-Encoding: 7bit

From: Han Gao <gaohan@iscas.ac.cn>

Add the compatible for the Milk-V Megrez, a Mini-ITX board based on the
ESWIN EIC7700X SoC.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 Documentation/devicetree/bindings/riscv/eswin.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/eswin.yaml b/Documentation/devicetree/bindings/riscv/eswin.yaml
index c603c45eef2252e760818e830e9dccdf0fdae6cf..f730f5ff91797d4c2f0610f9024a74611ffeae63 100644
--- a/Documentation/devicetree/bindings/riscv/eswin.yaml
+++ b/Documentation/devicetree/bindings/riscv/eswin.yaml
@@ -21,6 +21,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - milkv,megrez
               - sifive,hifive-premier-p550
           - const: eswin,eic7700
 

-- 
2.47.3


