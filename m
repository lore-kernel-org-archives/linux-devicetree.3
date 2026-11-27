Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795818780;
	b=R3u0J6hHSZCcV6fKX3pgtJZ0zALvwWZU8E6KuQG/gBiiFk7OmHlYmqyEBAWg8CxaclFm
	 /R2ZmvAm54LPPZpEL2ZZItOL2WpLH7K4XJfkHGt+PnuOxlCPChRnTKFJg7+BVpkr1dlB0
	 JLpeTOuR6qFvBhZwzk9uxLYc8XDJJ5INf8dN1jdP/pGJn0fANqkvVFpUV9J9a1rsSpYRZ
	 gg7Lg9Y+ULGaR/zPs5jJH5IPIHKa3BdA65CchEnkVQdXq5aDE6NkmVxw7fpP7wPlyKQnf
	 iKdNtvVyOHzrSyXGxRzMda9wf/aJRwf/Vnp7xhGXAITOGO9UimNIgCnPofQ5WmXYVpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795818780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=TInPcOiZ4I4+9DBJQQCS2zeJrPMFR72h+olev8lti9k=;
	b=JALmW9epGPLKeCwToLmVJv/FsricdpTRw1hgyVhUxU9xvAJqOX49Xm9XDDfGfIxJrMyl
	 9maawzfAw89+9Ovpm+roF0cQoLec6W1W3lR9abc8MGXRDzSXXyiO9vzTvkqj+b80E5Oxp
	 Edc42HH7H+YqHOnjdbh6g3pFxv7WywW6r3i1+qsyErBeoJsdTRHfiO6BvA+roJBwdOJUE
	 fWrsZdajgp1rHxN70ZjJrVETA1cPZ6Oek+Crxo3ty80kZosGo0Jv28EqzVmcUN+Dnv+eo
	 GRORfCuYi71nFv0RKSyUMxElLOxLm6PCb3x16x1p/UHLp0mfe+u6lzS9FYDOlg/e2TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iVAQIjl0;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533CB606A32D
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 22:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 533CB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iVAQIjl0
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4a42b34e930so7488607f8f.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795818779; x=1796423579; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TInPcOiZ4I4+9DBJQQCS2zeJrPMFR72h+olev8lti9k=;
        b=iVAQIjl00Fz2PZxLYDy38wZ02cyQvqaIXPLXjZcdKiCpJX6L0ioSlDpNVvlNGMhjk4
         jOJEakan5Xrt82wON/W9DAZuqFdhC4/g9z1/AC1/Ee2TnooVnhYZ/BSJnoKyDKe0Rsci
         8np+SL8iE6BJi2x7WLzQod+xLixXTqtcXY9xy4ra4YF8xNVReMyDmCcodPj1HhbdTAwU
         75gaz3QPu1WR1BtvBG36giJgCCG3EydQ5/Cf0psQylxUh+vpEEO6ioQGJ7hpEGUokq4N
         5fHm+FygwkvMnJAOME0KHS7UbTJMQbKtDrn7/SlrrAUcACSR9fy/k5gU29Fqp6+Ou5Ac
         olhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795818779; x=1796423579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TInPcOiZ4I4+9DBJQQCS2zeJrPMFR72h+olev8lti9k=;
        b=S0WX3Zw4vNczBbz4TiugVOuGKBT8PeN5QAX6k/aYi8ylOJ9EweWDH9qz6+6K+rdd+4
         7eCqPLwVsu2V0ZKdhKEYZEzEatDL7ftHHHQM02qBNyR71HevdlbHuQSR7oxde3UAHDxw
         a/Ug+5db8+yRtPDKqQSDcO2/R1dpcQJBw1qb29YNoPvR19yL8JleoqXQZgF0bA0WC/C/
         G/He1VB1Fhh2uQcMq3zOsk2dQ7Y3XMsnrvIg4b/nk0bZf/+LRStex/g26oXX+gmnxh+x
         X8jCgn6E1EEfoFzJRrz2u81JRk4KMSXvT6Eu+eHRuBkbPDkZ7BoffQ48Q6GA9AHGOkcc
         d4CQ==
X-Forwarded-Encrypted: i=1; AL+hErGfogOJ5IhiSTNpmUwJKRTWYwCL++snYDiQCMrHdxkoghWPE7rnJyqjrDgAYiFjESAaraI4aibzvi7P@vger.kernel.org
X-Gm-Message-State: APuU4Z/ltfjRRX7oJU+CJ5yAc8HRtLliFj4P+myy0dga90+RIaAhkY4k
	A7EXwFN0LdNyaWuk5L0Nm+Ga9+2THUdGVmLKCSyxenQ9INhjKpUwLHTzWurTXqrmWqOInw==
X-Gm-Gg: AZFdTZctiR5sMtbvIHPNpY20ACLxJKX7E59GfrWPOxtYtJBvoiPaxhUxIc2/sLRd6Ya
	rkEFfl0lP42zN5O4g1GeO7s1lkV0Ql7bKHZOdQE2VYK1DFUyT8C4zS8d4Ffk2kzSaMMz+2q/A+4
	fPnXx7vDgXhK80kxFbjNO/rbFHM1RJy/ah9Gx54odXBcuAXPcSgbqcbaDv0EhSZuCnJqp/dFG+8
	2dE7dmM5FCM4F4vK+NgTrB2EIUQTDgJLqa0IUZJQzDpPExggw0htpjq36xTdkOp2JtlQuSPzP1P
	Bq5Gz7GlvY1yjyv74QJ3REdGfJpQtwJ7QlmylcNImdJARHDTJjMiBCVKfw67vK6dP8hc6v6E9D6
	06L1EbWBquQUn472W2888OKLUN/XMjkkijOeLvWniju4doSRG4EN+FhtN27SPYRbD+7IKNqkPmY
	pCa303Egewpeq+dSKD9tZ2b8WuMa7GrKfD0I5dFdkht1FeUWQcp+TYLCZRowAZogG+A6jW2Gc9n
	FWs8K/l2retKi3fyUi71cg2RomgtqBNBGIX/8l1G66tGxQOA/W1AHIOHLZXu97FnPcNwuF7md++
	9gyIT38SAuoF/gWzv//lKJm94nvAzoNM
X-Received: by 2002:a05:6000:4617:b0:487:27f9:840 with SMTP id ffacd0b85a97d-4abb59e2898mr49754885f8f.53.1795818778612;
        Fri, 27 Nov 2026 14:32:58 -0800 (PST)
Received: from [127.0.1.1] ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm50430285f8f.20.2026.11.27.14.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 14:32:56 -0800 (PST)
From: =?utf-8?q?Adil_H=C3=BCsrev_Tepe?= <tadilhusrev@gmail.com>
Date: Sat, 28 Nov 2026 01:32:53 +0300
Subject: [PATCH v2 1/3] dt-bindings: power: supply:
 samsung,s2mu005-fuel-gauge: add S2MU106
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261128-s2mu106-fg-v2-1-2c3142e05aaf@gmail.com>
References: <20261128-s2mu106-fg-v2-0-2c3142e05aaf@gmail.com>
In-Reply-To: <20261128-s2mu106-fg-v2-0-2c3142e05aaf@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Yassine Oudjana <y.oudjana@protonmail.com>, 
 =?utf-8?q?Adil_H=C3=BCsrev_Tepe?= <tadilhusrev@gmail.com>
X-Mailer: b4 0.16.0

The fuel gauge in the Samsung S2MU106 PMIC has the same direct voltage,
current and state-of-charge registers as the S2MU005 one, but lacks the
MONOUT averaging registers, so it is not fully compatible. Add its own
compatible.

Signed-off-by: Adil Hüsrev Tepe <tadilhusrev@gmail.com>
---
 .../devicetree/bindings/power/supply/samsung,s2mu005-fuel-gauge.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/supply/samsung,s2mu005-fuel-gauge.yaml b/Documentation/devicetree/bindings/power/supply/samsung,s2mu005-fuel-gauge.yaml
index 05e420316a2..74dbfcacdbd 100644
--- a/Documentation/devicetree/bindings/power/supply/samsung,s2mu005-fuel-gauge.yaml
+++ b/Documentation/devicetree/bindings/power/supply/samsung,s2mu005-fuel-gauge.yaml
@@ -16,6 +16,7 @@ properties:
   compatible:
     enum:
       - samsung,s2mu005-fuel-gauge
+      - samsung,s2mu106-fuel-gauge
 
   reg:
     maxItems: 1

-- 
2.53.0

