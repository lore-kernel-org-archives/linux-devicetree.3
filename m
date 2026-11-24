Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795478549;
	b=0Xi4IcfthG/PhX/6q1CK2BDpaV5IbASdNyM+jrXaILkt7Fv9tauLz2AbGeo8Q1xrRhPX
	 ju3461PbxQdt/6Ilir4if46/qlgCChanMwzK0jJEK8QsftjGz015Br3OVChGpNehwRdFB
	 icoUrUqLP6EOk92A3QztIPMPmdOD+wSJ9s6X+7VmpYVMpi4SdNC9y98cFYdKvQsvh/4Xu
	 1APXcnUa2MNdfXQ04tXrGVydiu/dCLCOMH+gEOsumzX34kfmlSIJZ9Mu5OHZBqtaRQeqS
	 4nsbz+XU9UUIcUWCKckupfZmXkXcg1erQrQkkHZ308R/c4jJBGZxnIlfu/VexrOzlQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795478549;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=8MaWwLX3cvqigHT35k5vI0q6D8vrfBSl5m+5djh9nLw=;
	b=l21WUTlXzNPpaMsTUPYZhIcEHJ7R7NApEar3b9fhRa8fwGbLhcM2jIXFLP9dCf0Wch3R
	 uDZMiiFo6qr8CdcdSgoMmjvQ7bHp28j0q2OnVDQQQ4oiehGiSOvSP8Sx191mX5X3sG4BS
	 RzbltkT+NDBsrVy6gnBXstFNBqsszG77iZC+uwBS11OO4MsRpkyUmXWAM+sm7oOtqa3O4
	 TFJEjj3zaN/7WoobR6aWLak5SLKaADFWILQAqa8ECHMNs7UPkYHduwzwlGiTSiUzLtdDT
	 2hHTfN6o8EXI9w3OuDdM+ivXydLFjYui0v+iFrfkF3aePTv6CnqcT8f8ALfrLFi026Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gahingwoo.com;
	spf=pass smtp.mailfrom=gahingwoo.com;
	dkim=pass header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm2 header.b=BMA63C6z;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=pJS20yV9;
	arc=none smtp.remote-ip=103.168.172.159
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABEB606A322
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 00:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DABEB606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm2 header.b=BMA63C6z;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=pJS20yV9
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 07BFB14003A5
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:02:28 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 23 Nov 2026 19:02:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1795478547; x=
	1795564947; bh=8MaWwLX3cvqigHT35k5vI0q6D8vrfBSl5m+5djh9nLw=; b=B
	MA63C6zlWBFAalgP/7fwc1rwQQmgneQYkvk9+GMvgZyrz3lXxUHEi9cYKDUgQAT6
	uW8w0w4yuZ2f058v/8LSlMiC+bvtrHszrDN07es2m1BQIbQFGiL09/taRWwA5zDc
	G8zrjnAhlKm+k4rO+WxQOBm43lvvjillunNbGcB57INcfw8fXJiaHOrV7iyApcCC
	PQ0LLe5fj493cNUaI+Ev5t41n/sL00zWkoeLaLv/cKh7TyXfQVofZ6Clie41FA3i
	hivA7pgIdzow7+uqZeMMPcBrbygmVzlhDizQYe/iXHkGZ2n+OJLrOhx/yu14Q98Q
	aeFSHm8nkiD3h7AXyxbug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1795478547; x=1795564947; bh=8
	MaWwLX3cvqigHT35k5vI0q6D8vrfBSl5m+5djh9nLw=; b=pJS20yV97n+YDrMIB
	2MDVY5jq7wK+ZcepdZCBUZTXZq8MSMVqyMpQc9I36QcBcYST8rGa1PUYMPPNPjqi
	ZggUibYdg4OFtDzzBendu5l6PWNFqV9w2u0y3+9rKwQyrydhLO0SYYLqt84SBjMq
	GzI5jNNlNZpZ0LzeN/KU6e4KD6/y/ySIjh2Dxp9CSVHIlOrLFyqVvirIUhv5AFUW
	t0HKJ8HTXJdFzrfHB2Uai5pluwtYOkPSJVqgwFC+SBbXpyfnCsThWZsOTIYxOB7P
	X01HrVgkspaKkxwznS4j0vIHgP6Z2u2e2t9XWTEdU+KjJ40/f2L3oTOcqWuYGCV7
	278Tg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=gahingwoo.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795478547; d=gahingwoo.com;
	mf=PGdhaGluZ0BnYWhpbmd3b28uY29tPg==;
	rt=PGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnPg==;
	s=fm2:rsa-sha256:AlIqQrM2yr2Dmbl6YUDxsdSd483JWoIbsqv4goz36kanbpB
	qvasyUOBCtH6ZCEVxqcPmATYI+6weAYIfsFzqCgDV+mZX5RBz6e8BwRm1gJQY1fy
	yCihMcKCpRRF3bh9UTcRns3mixDse9y8v61cGyd1HUrywDNC26+ZDn3upCv/JCfz
	415Ped7J99nVqEql7n7UXuCU2PuwrMpGe2zlClQ2zRCp2z4uy1jt5ILNhcrfTvJ3
	N6jVyGh2C7rWn1PJsop6G3Wpdu6HD5Eeo921Ehl1/UDT9lJ2uF+uUa19j3V2REzF
	8YYbh32ND7uFO2TREzUaZLaNPfjpLVyUz7MLJlA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:LZ9zBWbAheslYKhTjuQGFcOGRMI69/1Z+vf55VwAtQw=:NYJCNTHvimgXVOCwEztu16OEei3WmDPKM3/uhDJ3V+o=;
X-ME-Sender: <xms:E9QEaytAUPqPsQWmtnezfVNis5iuLOVo5GdJrNP7QxYRetDEVV_INg>
    <xme:E9QEax3c5r3k7G1vR77idjjVm0mhl1TniCPrmwPvX89yEEXKKc9DWk7u0sTe3i7z-
    2mJkxzr3hmNYI_sz8SRi6_RNgLFyrqN-PSU6z_tYJT9qNspjbO0Hic>
X-ME-Received: <xmr:E9QEa5VHo_HBMdvGHxXQAEhYxOWtMjD-8GVuawMZDjio6xwj1r62gAcIqyxPgZu2Z_j0pOM9>
X-ME-Proxy-Cause: dmFkZTEIvCBAqgUEloIsFZ3FkPJniX+pdPbA8lwmlIZBO9hGOTGGz/x2Hl+7nFbV5nyvKp
    t925nNRn8DutQCQinVZPr73dXFznYxFvXbL116jqCZ/GfyonUZh/Db8T2FiyXrfT2tvgmY
    iobzatdB+GcoyC0jM5VyW//zQbbnDI1hKnSbxsDcxkUlD4xzycqbxXM6vvDpB+AvPZI9PO
    U/XSWb9pjObA40eWatkEvdJBkQEqjCEU+A4urP116L3cv2N0DBt76GIBJcBDbwZQhbIQjC
    SOwjlJv+Q9QIaSqFf9Kz25pG8hZtrsSllc9yq5WXEJr9X0qGFNbX1Y7L6XZjelykM9LdqG
    HnKWsDdr84ZbAJEC7w8MY5m2ihxoOMmdpsENx+adzCYSZjHUXDkWhh0l5piCPDMMHoRxwV
    bDHrDmgw5eSmNgGBeo1hvOR19KaiyhM6ilg0rmGodpE/pCNWnsSpiqOSxrVhFLCI4d6me7
    Y1X+BDotxGqY5KyIiHv2HTLRLHgUh3WYDkzFEmDYDo/y+MREe37IxlxJREhOOh46d4En8B
    N3M4YEN02ASI+SFYXoxYmZucPvgxDWxua/myPr2jF0a0dLEtSj607sCqlqPNc0V6UU4YRs
    Hf4hSaeBh20yVBY32s17hSUVR7nlyjdR2H1fudDrGmCzos5lnEtnrdX1zu8g
X-ME-Proxy: <xmx:E9QEa3MT0RVMpzRs1xWoLVD8LoFBI2nPim1tE-DN2KJMnSYvG1qOQA>
    <xmx:E9QEa8wru5hyrUIa9DB55M1qIY6DN_HDkYOajCulHWkPvhdPinaGYw>
    <xmx:E9QEa0i6Qkv-AsMIdwREnwkI-mFPtxITc-CzTQcGMCfzvxk06VTtww>
    <xmx:E9QEa7S4DTN08Ssd5l7JXe2a13KdwaZqcvx7JLY2xGte6JIlcg2qhw>
    <xmx:E9QEa_YCRuoM2WCfI5HeKZpORo12duwe4nuABfy7jUWjO3Qfo9dG2rbJ>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Nov 2026 19:02:19 -0500 (EST)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com
Cc: ddrake@baylibre.com,
	royalnet026@gmail.com,
	sidong.yang@furiosa.ai,
	ulf.hansson@oss.qualcomm.com,
	abel.vesa@oss.qualcomm.com,
	sebastian.reichel@collabora.com,
	chaoyi.chen@rock-chips.com,
	shawn.lin@rock-chips.com,
	finley.xiao@rock-chips.com,
	diederik@cknow-tech.com,
	alchark@flipper.net,
	leonard@lausen.nl,
	vlwwwwww@gmail.com,
	jeff.hugo@oss.qualcomm.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v18 3/8] dt-bindings: iommu: rockchip: describe the RK3576 NPU MMU
Date: Tue, 24 Nov 2026 13:01:38 +1300
Message-ID: <f44a5cb03bf1ac543d35ff30a8411d1ee95525c3.1795478392.git.gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795478392.git.gahing@gahingwoo.com>
References: <cover.1795478392.git.gahing@gahingwoo.com>
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

The RK3576 NPU IOMMU is compatible with rk3568-iommu but needs four
clocks: aclk, iface and the two CBUF clocks. Without any one of them the
IOMMU reset fails and the NPU does not probe.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/iommu/rockchip,iommu.yaml        | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml b/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
index 6ce41d11ff5e..e40c9ac2b463 100644
--- a/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
@@ -26,6 +26,7 @@ properties:
       - items:
           - enum:
               - rockchip,rk3576-iommu
+              - rockchip,rk3576-npu-iommu
               - rockchip,rk3588-iommu
           - const: rockchip,rk3568-iommu
 
@@ -42,14 +43,20 @@ properties:
     minItems: 1
 
   clocks:
+    minItems: 2
     items:
       - description: Core clock
       - description: Interface clock
+      - description: Convolution buffer core clock
+      - description: Convolution buffer interface clock
 
   clock-names:
+    minItems: 2
     items:
       - const: aclk
       - const: iface
+      - const: aclk_cbuf
+      - const: hclk_cbuf
 
   "#iommu-cells":
     const: 0
@@ -72,6 +79,25 @@ required:
   - clock-names
   - "#iommu-cells"
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3576-npu-iommu
+    then:
+      properties:
+        clocks:
+          minItems: 4
+        clock-names:
+          minItems: 4
+    else:
+      properties:
+        clocks:
+          maxItems: 2
+        clock-names:
+          maxItems: 2
+
 additionalProperties: false
 
 examples:
-- 
2.43.0

