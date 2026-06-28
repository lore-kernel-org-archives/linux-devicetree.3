Received: from outbound.qs.icloud.com (qs-2006b-snip4-11.eps.apple.com [57.103.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60F62DCC1F
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 17:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.85.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782668199; cv=none; b=EnDrIaqvYbooWmj68wjDdNfEekJHlAAaAo7laLEFFFU8Q+Ov/RP4BH4Cu7OGr3Mrxebcmiif37qi3lxnmRTwZBLFt0YIPRH9NLNzPcwnmblBUfW6igleAedCICGpJHj3ZnuAqmvkIU63MVy2URiZhmbQXjBqKoi091F2cle6Qg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782668199; c=relaxed/simple;
	bh=l9QTiFilDIn7JPYkYIDGEiNlq34X6Ld96R9qDh1I9No=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LsvaiYyUtmbu+cflx5e3KcFGV+acKrSsJyI6/T+7KRhV4sYq+3okxn5CBcAC2dKSAagwzRwmBlZ1wvmfMYD4BkoX/GwTnuv8jCeajYj0TWIjDwf3fGn4SnphvH0AKRaEw9SB5RYmw/KZ+T5oIEu++NJ3Kk9C0xCbpqbhjVKhWLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=YXtjRiYA; arc=none smtp.client-ip=57.103.85.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b="YXtjRiYA"
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-100-percent-7 (Postfix) with ESMTPS id 956D6180061B;
	Sun, 28 Jun 2026 17:36:35 +0000 (UTC)
X-ICL-RepId: 019f0f4d-f6ed-7f81-a1b8-ea885d31d25c
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQtJBEMGXAVeDU8dXA9fEhVdRV4MXgdyFU0dWxlEDlNeVB0TC1NWVwRcEEceUgocHVxYQQ4KWgJQUR1fAgoERwRbF0YDU0VDAxcRUAFYHlZeWhdeTUcfQE1iSQFaGVscQBdKbk1TDw8VTR1bGUQOU15UHRMAXg8PTAtIAVsHXQBICE8BWwNbHEIKSQVaGlkfHVgRXy1SH1cYTQtWDBkGV04ZDEodUlZRBUoMXABoD10dWBFd
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1782668196; x=1785260196; bh=8qhWEmWa9c5bN8gZc9nJPSieeNw3dWEH3UMfOnNnQEU=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=YXtjRiYAGwAWOi12ycknTSvNDq7y271d7AQQmPcnfxUWe6IyIcJdhVoCMPGGNR3byIWa7+hfV+47KhqUuIAzIyfTAHj40BAadbpQBwwcQMD7TSCVlblUws1eVex5JjfpfoRcWSLNCGSAhzjLNSyp8nlPGyVHDJT7gvGZzlbNnygjgrmktxy8nqPLa0Eh8wVj2XsILATa+Pur4rUgT9KhXe0Wvf8hioB8RBXOBn+HhP9Q79GVBHNSmZujkLPI7p/KyfjcVnPsisXI4OY+RiPxuzbt/Rnrd1Rw+hAwPdk4GoYHkWR+V7THhxUW2OhZ0p/Hv9XZ+SrWNEcSDxEZC2+IhQ==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-100-percent-7 (Postfix) with ESMTPSA id 947781800289;
	Sun, 28 Jun 2026 17:36:34 +0000 (UTC)
From: Konstantin Shabanov <mail@etehtsea.me>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	valentin.manea@mrs.ro,
	Konstantin Shabanov <mail@etehtsea.me>
Subject: [PATCH v5 1/4] dt-bindings: vendor-prefixes: Add HONOR
Date: Mon, 29 Jun 2026 00:26:37 +0700
Message-ID: <20260628172640.23167-2-mail@etehtsea.me>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628172640.23167-1-mail@etehtsea.me>
References: <20260628172640.23167-1-mail@etehtsea.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDE1NyBTYWx0ZWRfXx7q0egoymnSj
 rrtF3IPEf09yd8tHqbMJGxlB+lAJPYB/KHxT6oS5V0gYEbc4CR5Ek8ihCxCt8XLLtF39CXzbRhm
 jsGy2sWsTZZCwJYMIyQ1MukKPonrWuRdN3enDWJQRkgcOzlWj0QrBf6BtSTXZGIrj5Qb62lk+Ee
 IIAjDsFM1AzaoKPnPi0jqOnr7DEXx8or+tIKhgvCaQH+RY3KW/wxLESn/969qu1RIs7a+mzLbLg
 yl8FxZZXxHtB8vHdiX+6f8MbbRzZa3grGjGGYGJhafXpwhDdZBSRP5lPz7lbo8UJa3DMzD0L8rE
 8OTRix6CLaNG+CAJatV
X-Proofpoint-ORIG-GUID: VkpOtQC9yWG6KBNkG-h62YPiTxfGm47j
X-Proofpoint-GUID: VkpOtQC9yWG6KBNkG-h62YPiTxfGm47j

Add vendor prefix for Honor Device Co., Ltd.
Link: https://www.honor.com/

Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e7..9ca2508f531f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -735,6 +735,8 @@ patternProperties:
     description: Honestar Technologies Co., Ltd.
   "^honeywell,.*":
     description: Honeywell
+  "^honor,.*":
+    description: Honor Device Co., Ltd.
   "^hoperf,.*":
     description: Shenzhen Hope Microelectronics Co., Ltd.
   "^hoperun,.*":
-- 
2.54.0

