Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CB03DB65A
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 22:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785192797; cv=none; b=dPuyRiAu6I84WRdAuAXFe2CRAySshm2zR8UPbTCYY1exWiY9oWcp/aMF6U4ludemBIf+p9fwcKygu+NOcjyVuOBChT7JG9XEqeZNGuuKnZgCWkY2o6OXS6kJ9DSVpfL6P7aaytxFutre56ly7dMut/vGiTk4W05Idm6HqO/RhBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785192797; c=relaxed/simple;
	bh=mSN/efPKVmVi+AcOqZJZ9SPgOGC/AZ19K1EaT+rnT4I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nfpAZiENQj79QYiVN3LH/fYODfft18RnakNR5UeUz27R53u2DLpfGABzC5W/iVT5z05xcQKRt/8apL94O+ULeEy4afZOhVHWI/EvVsk/5xqaGgcXURlzVh9iB8dUfw1bpXeL3UoEPxDArKm6W44SGq9SOo4KW0Cqqz11h6G4MOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eb2qVjQA; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eb2qVjQA"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8453427d3f4so3319399b3a.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785192794; x=1785797594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9c2bNkM182eWtMQSsK53z2vdCBlwj9TY54Z48t5tnuA=;
        b=eb2qVjQA03Rb/z30D/Yzbs+zH7aLm0Gb21TTR8HPe0Os1lU94X8yrFf+wMJItMPLl5
         ahRnsJSzvMCnmOqH+FiJ3O9dKzXGZ8KEGFbTtzclU+giMkk8J5cWHAhwciF4ZagOIYw7
         FMJorK2xqjr32o76UTk8EZ39nv4j+7ejRhi11o2EIM0Pp2nHCOkDZUlS27uYPxv7e1zo
         HtD2K9Jd5YJ3ySJdw9zhULXw62foimvQ9VA78uzM5xLEaTiIkVFLZRKjnl7d1NTAuiJl
         2b13K6j90fxLztn4cdeGKLNC0hwYFfaEJN25epgs1Zxf4BenbO5ZgI3gFTxBVLNr+xZ9
         hO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785192794; x=1785797594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9c2bNkM182eWtMQSsK53z2vdCBlwj9TY54Z48t5tnuA=;
        b=mkhU970LV6oi3LZpFUSyOMIrtcbwMH6T/KIqxMoRmhKRqXLddoi83QmvhWLa+M1IT7
         Zx4JqYscRFD/j1Y814U5gB8hHrro+8mzSx4USp9bJI+pK4On+x+/XbsWyyMBBCKJ7ZZu
         HuZ0cnQExNBiPrkSWgJ3yfoOezEdJpgNOXX5f2vGtJvPRQ9a8ipfqcPsd1RqCAJ9VXJY
         Df867rNy6TuS7NQyHXMoLu/9OtQUaKZZfvOxw0C1DQcafXBCIRqfXXaSpx3QbLc8TRzu
         DgwO49UNJlIXer9fO+rr7k0Xq/4aIXxYkKZ9AcWnEAhfL+PgTMkmnbn1MxqSqICxhRDt
         wIJg==
X-Gm-Message-State: AOJu0YyxOPQgHrNs+j8FICW3/V5T0nUzE/YHCsOR3NC84PVGaPJWb7mo
	2h4dYxvkaL8q9/kjh7nGiqgdbGoWRHt+gIkMQaozdjFEP6cKmzs414yfloawPoHC
X-Gm-Gg: AR+sD12qXYWRBMY1KPfqXWWyVMmtGJ+dXh426VtwzdeUCrhkyRLdkJgR3Rc2PdmX5n5
	n+rUWsz2XgEB3o4kJ0sVNwZB7tjB1cXjWYa7S4GewF1j3WWeauBHy7XhtEWQLtKfKah8jNT+Ir6
	FJdQjeOXGIhKbQxXv1ATqHrnYYwU1ww0CuUK3lmVKqg00pgSuSE0WVS/w/2tEe2zSl0eek7GddJ
	nZVqq+hmaZsh8/1ZaBWjnZbz/zRiK0GYQyjdQOVGlNNwlyE11boKSll18DppPUUfgGE+6L0UyVc
	1fpVTrHz1HZ0kW3hkC2xOzLuYY2JYcrsT3ijA3sioyXkFLwCuU+VK+acWkQRb1lswZ94LOy8GR0
	MZFduQ1nmCjI25DsmLhsXGKqyGnD+tIwu2dU1OZPdz9aeVfWdekHuJzzKW1Dq6HfoQ5oDwwIzQO
	rVd3ZVsAIIRHD/SEnk3YOWyzrm9NlYFCA3sbtQkseBm3DiWMIJh+7kR2TwpC1wOjEKhX2ByzE89
	XOvzsFSC1ln77QeMlVQmVcxdzNtub8D5vy96+j7Pv7cFOSLkWraq7sg8r7KD8YmcA==
X-Received: by 2002:a05:6a00:999:b0:84a:29a7:f650 with SMTP id d2e1a72fcca58-84e928a9ab5mr39555b3a.0.1785192794215;
        Mon, 27 Jul 2026 15:53:14 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e532ad19csm3601949b3a.26.2026.07.27.15.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:53:13 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	van Spriel <arend@broadcom.com>,
	linux-wireless@vger.kernel.org (open list:NETWORKING DRIVERS (WIRELESS)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dt-bindings: net: wireless: brcm,bcm4329-fmac: add nvmem-consumer reference
Date: Mon, 27 Jul 2026 15:53:11 -0700
Message-ID: <20260727225311.266596-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The brcm,bcm4329-fmac binding has unevaluatedProperties set to false
but does not allow nvmem-cells or nvmem-cell-names, which are used by
DTS files (e.g. bcm4709-linksys-ea9200.dts) to supply MAC addresses.

The driver already supports nvmem-based MAC address retrieval via
of_get_mac_address(), so add the nvmem-consumer schema reference to
document and allow these properties.

Fixes warnings with users:

['brcm,bcm4366-fmac', 'brcm,bcm4329-fmac'] does not contain items matching the given schema
from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
Unevaluated properties are not allowed ('nvmem-cell-names', 'nvmem-cells' were unexpected)

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml b/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
index 81fd3e37452a..5d87de6a17bb 100644
--- a/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
@@ -17,6 +17,7 @@ description:
 
 allOf:
   - $ref: /schemas/net/wireless/wireless-controller.yaml#
+  - $ref: /schemas/nvmem/nvmem-consumer.yaml#
 
 properties:
   compatible:
-- 
2.55.0

