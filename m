Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794175069;
	b=ChBnlIPyTnTGPiNQPoth5vYY6M7g1T9RxDH7RDIlSMTWnF6IFcmxKldaminEaP8qC4gy
	 CUqSqT3BXw7xfNjnVIXRqPfXF8IVMWrqGnxu6cZydlBgkSyA0QugNULIYupee4n3X7t5s
	 Tnjnv33beDu4fAE4GxnvXAZRsB+AAkHsND5UQnhIJgiC7eaNT1HihRbGtvLFIzTlkbSIq
	 Stf+RJaPrYwAgrDHijerYl3sRw4JN8TAOlp8Eg2QUVJ4E9iX3gv51W0UJfNVNwVQQY8UB
	 WizqWA1apocG8QlEM1qMhqFaqvjasugYLvsgPqx+/bx2yFyfUiZZbKzMpvInJM3dB2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794175069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AyS5UId07S/P0XVdwD+qagOLSX4Ppdf3Pa4ETDTv2/Y=;
	b=eRlj7XC2DUaWjPNboNhpiodYryNJQJWTAtH7n6iDfUXXUuSFOvCPQt1qGNHqIDbOSbKy
	 2gHyeAEMnUGhfc17f2dpxDO0qLKCiRW3QmRjkIffoeDNttU0ZsBIS4tcAU/8g3kwpCAzv
	 Tvzoc48IdfX6I8EHfCwlHDiGQIyQyfl5x2SkpQvkNDghZmzULApAaQVrKse4M8DJp2YxQ
	 L8PP4rTrBbBJEda4hRq0un8yuRI8j6cTU9zkETLnHrYfTgio32shrvCg0uNexkMzrtksB
	 Tn1g5f3k+SJojLeu7Ee6JR7VcAJSrOuAgjCmElT/D1v7XHX/ugveTEeDdoGgaiebkIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l+4hqDev;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F43606A33A
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 21:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42F43606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l+4hqDev
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b0d09df973so206982a91.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 13:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794175068; x=1794779868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AyS5UId07S/P0XVdwD+qagOLSX4Ppdf3Pa4ETDTv2/Y=;
        b=l+4hqDevVqPDmyPVmJXMFgwoBBedr+Pp7izQJcKTkuT39n4zCq6+mRX1ImEs2AOP2T
         oWTKx86o3IAS07Ip4U5tc6jYEwAHWPG/EO8wzpg+PNxh/mDPZCZRRqNcntxJ/xr9ZwsG
         p0b4MumJjGCyEpcb/xTNEeaseSPMyP/DhwlrYxdMijLAKrLFYtAnj9qMuWvOTsTBq/dG
         bkyJmPjGVHFNW4dPMZDlRKGwdakOCx3GfmsFVIr8LyyDzsFJKXbhhbDi9DDq1scsV9ZM
         aFmvnp0xAFEkBuuE33Ad5TJCbu/1Calqgp3gvCaXOVmZEAbOraQzmTkuORshr2wxPYmC
         wSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794175068; x=1794779868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AyS5UId07S/P0XVdwD+qagOLSX4Ppdf3Pa4ETDTv2/Y=;
        b=FugoN0PcWqwv0HRj+NvvVlAFWmiXTlbF77pSuxfK61MqI9Fr6tl/CmuNnSbXMBunjD
         usvxoF6jNptiM3QbbDDvgx9Mx1Gn7oihGxaLSQ+Mc7kjugUqTC46WMiDVmkZt2dfKe7U
         JzC919abEQx1uLf3PFX5G/U3J8kXj9JZucbwgG2uy9jaQ7jeqHRLQ0upLcRgXmkc7qP3
         P9Zvquba7tob6f8lKAB1EYlHjJF97jovkRBf3H+rOue80qVZ/Lgw+4s0Lw81lw+poPh9
         9vs5yOMGXyhsR+FfEPheMAgxe5q1j0swiYAbCAEkmYfTawn39yibhNQosowIoIEDU5JX
         FRug==
X-Forwarded-Encrypted: i=1; AL+hErEJe/NNnonO0LmMVesUb0r9XLBcuffoEEZO54fQ3ClpXVPk9vaIc1cKTu5x6V8uLohGGlWnFhDBfWuE@vger.kernel.org
X-Gm-Message-State: APuU4Z+Lc5RMEG9qFHQMbf1CMma5KS1U88McbCRQL2Xqk2reQOWCdgmX
	J+NOfi9T9zlVT7IeIiKn5ihKaRCOSpBtYOftYbCAHG9iRJukfrJEvVV/
X-Gm-Gg: AYBFou2iVJZUv1vyKytESV+aJcaCCeTPmuBDT3uVzbqprbWcOR0UxL6zZ3wylbscwPU
	QTuWoMz46oOtn73DVsjN2AGjN7LW+sj1GQDswg2rnDHPN2dzzqc50KFHQV/1I+XzKkDWirqaOqY
	vISINf6+149HpVvSM1JqQLqYuoDykvuTRHJX626ykCqZzlY9QuwMUr6ZQHARcdDAOBdHcJyLI5v
	0lciE6gVUTXvmAD/f2hgon5UFccg+wWFfeRc/E6uDF7OrHw14XCFUw8T4un9ATXy6sxjeTSxY2O
	abPc1d2gCMn2rsL87xOlRgqreZ5w8dvcJTYjYRCYjRebPgvT1ocUnKwzio8q9OEuHOnKQcW4dRL
	C1NC3WKF2xghvPk70v63B7AzyKetHShJ2lfqnt0q4ml0aZrb0r0Vsdq+7XDW7Z4zMXLhiYgPQdn
	iyj6cpuF6XJAz364s5YA43/DdUgU/KugZ9KPiXUwkHkrIj+dPoo8t0xmModLwkTdgf8U8r56eyF
	JMCNlEiLjaHVvENA1md44+D0Pdd/0vnake7gm87Ei5NQKqUM8GBVFCJaek9+Y5skOLKj3uZvDqC
	m1cmfTA8G1NBXyreaSQIXi8BvqP0L+y9TivJpcuTPE0CoMkkCYV6smVAzI6kHJr0eD17A8vmccd
	35tKjPw+xdj6W8X72TaExWNqg/ThqZZwz3uD+vxKPqYbHK+U9GAfPs9pCk1UcDbNDBzMnMvxxOt
	BfbA==
X-Received: by 2002:a17:90a:ae0e:b0:3b1:3598:f881 with SMTP id 98e67ed59e1d1-3b13598f942mr1243857a91.53.1794175068525;
        Sun, 08 Nov 2026 13:57:48 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1152fa888sm5692976a91.9.2026.11.08.13.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:57:47 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Alban Bedel <albeu@free.fr>
Cc: Radu Rendec <radu@rendec.net>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: interrupt-controller: qca,ar7100-cpu-intc: allow shared write buffer interrupts
Date: Sun,  8 Nov 2026 13:57:36 -0800
Message-ID: <20261108215738.113582-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108215738.113582-1-rosenp@gmail.com>
References: <20261108215738.113582-1-rosenp@gmail.com>
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

On AR934x and QCA953x, the WMAC and the PCIe root complex share CPU
interrupt 2, but write to DDR through different write buffers. Document
that such an interrupt is listed once for each write buffer, and that
all of them are flushed.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../bindings/interrupt-controller/qca,ar7100-cpu-intc.yaml   | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qca,ar7100-cpu-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qca,ar7100-cpu-intc.yaml
index ab32a91af4c4..becec88061d7 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qca,ar7100-cpu-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qca,ar7100-cpu-intc.yaml
@@ -29,7 +29,10 @@ properties:
     const: 1
 
   qca,ddr-wb-channel-interrupts:
-    description: List of interrupts needing a write buffer flush
+    description:
+      List of interrupts needing a write buffer flush. An interrupt shared by
+      several devices that use different write buffers is listed once for
+      each of them, and all of their write buffers are flushed.
     $ref: /schemas/types.yaml#/definitions/uint32-array
 
   qca,ddr-wb-channels:
-- 
2.56.0

