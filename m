Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F1E24C06A
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 13:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790517108; cv=none; b=qIIGhybjYmDR9y6c6V2Eo9/gGW9Unm+VePVrkU0KUuxfDL6E+KsDdUAUSi8hFFX7zSckibGmRVceZqbbSfF7dhPIAJlK5/6fECO+IqOiUXbaNxkFckaylLqoqkX9ct5T72v/dwuJ4kL5Q6mBvIXX8D5HOAGWYID7L5Tio6//QHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790517108; c=relaxed/simple;
	bh=rh1RYeY3m8KADD4dph8IIykh/7BHkZrewmRIOU3ioNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References; b=lPVTZ7dinIRCCmcEwMKT++elQRoUPXoeM/ja+lg+f6EnxUB172Y1MbC1aK0zjR3kD7fVBYOTKOGArXHehaKLrll+/oWBDfIq3EO+cjQCCONCCpv5FcllEDrcnMS5VCq8EVJHJN+L70tqkBQIJB3NndfLyRqfkeBxc6BFHI/htIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=eyjhIqBy; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="eyjhIqBy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID; bh=copIDOk9MPWo/ov
	98Kor/uunS41vMva72FnQRKJ6hn0=; b=eyjhIqByEb7NWcYOuRw1WM89U7ynErJ
	AbdwcUOtGjoVYbZcb4aU+6a63pWFjJ/EhooZD9bq38TQ1Bkb1ddTQpqjIDBlqEjI
	Lb0CdcP2JrJzBfzwt5xi1fRbZ1oyyxQsIh9GhgTliA1DSeQYn277gFySRddjorC4
	PdsLcJNdNRWs=
From: BG9OXA <bg9oxa@163.com>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v2 1/2] dt-bindings: arm: rockchip: add ALIENTEK QuarkPi-CA2
Date: Sun, 27 Sep 2026 21:51:28 +0800
Message-ID: <179051708845.31632.10915026963421643453@163.com>
In-Reply-To: <179051707448.31632.10412780322071844492@163.com>
References: <179051707448.31632.10412780322071844492@163.com>
X-CM-TRANSID:_____wD3X6FgH7lqPRllBA--.6436S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xry3CF48Cw47ur1xCr1xXwb_yoW3ArXEk3
	WxuF15uFWrXFyFgw4rAFs7WFyqvw42krZ3AF1UAF1kA3yvkrs3KFZ5t342ya4xWr43urn3
	CFn5tryxWFnxJjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUj22MUUUUUU==
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC3gDoVmq5H2CLkAAA3X
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Document the ALIENTEK QuarkPi-CA2, an RK3588S based single board computer.

Signed-off-by: BG9OXA <bg9oxa@163.com>
---
diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -182,6 +182,11 @@
           - const: alientek,clrv1126f
           - const: rockchip,rv1126
 
+      - description: Alientek QuarkPi-CA2 board
+        items:
+          - const: alientek,quarkpi-ca2
+          - const: rockchip,rk3588s
+
       - description: Edgeble Neural Compute Module 2(Neu2) SoM based boards
         items:
           - const: edgeble,neural-compute-module-2-io   # Edgeble Neural Compute Module 2 IO Board
-- 
2.43.0

