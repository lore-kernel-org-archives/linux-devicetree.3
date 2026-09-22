Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C84525A86
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064109; cv=none; b=D0uJ7b0UV3tys8zwF22hsPbNpSoPB1g8OOseZNx3iZFnVFBBX8fL1OItwoT2W0/+QRyHF55DAjQWL/qLhZ3pSqw3t9HNK4RlkYunHsRwXqOVanuATil+NcucGnOj8HPeYEot8TGPO1Obixkqi8HQlyPPx+1mrfI6NGPxo6F1AGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064109; c=relaxed/simple;
	bh=4fAmXMpgpOU0t8UQuei0xUmAiikImQmBQYIZpvHFWWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=grctZsx1wRP4tokQlOVAwTs0Ea3C+svUC6JpcRbZj6KunmcM6eu4jI6+2IMB0NyLvAw5k5RwJ19jpcgZfJ5sgbre0ogaPi8B0GEHJtbbpk11TGPp3YQVv1H5eLXHRP5JloHVGfQQW+v1pJHKckqt8Sss7nl3TzLEQaqxtKvSDLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EfDMltdY; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EfDMltdY"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843178b1c8so405663f8f.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 01:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790064095; x=1790668895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gRVzD7/e6IROrFrMTSU32rtgAKkxa5C4zngEyHP7gSA=;
        b=EfDMltdYW1PUQlnAdKSDFTENYYpdIvKawKc8C9rs+DKMwvsCdWQIM9NgveLCdQ9D2b
         2qUmsrkWVEAEAJPeoNx90PUOVkAG28NIOTcpnt2RBMUwCxnG0SRKQ32mJk0EyshQ+5w/
         TOt4oEGRM/sV5bJWj3flKbOvrJ8DWL53IuvRAV8ECGSzOBeIrCyfHjCJ7YVrogzDbeHZ
         5QAXfiACoTfaIpiAXn85aPyaQAq435plR2smwwL+wTNkU9cS9yOZ3zbAZAddroAKYsVr
         POWc/1JmzFAxmGTLYggl3VuCNU8te+IWKuSkoUGEicDezAZlnopKMNX3ah1wdR3n1Njo
         +2aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064095; x=1790668895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gRVzD7/e6IROrFrMTSU32rtgAKkxa5C4zngEyHP7gSA=;
        b=XSVgQX9ugqLlsFxJQUhxE3TkYp939s65hFXjgzHoEb1di0u7flOnZlIxNgOxDN+iG1
         8zGQPsGUEjrjWgJoxR/SUcWTtFtD0EZMS9Ajb1Mg5lNdwE6JgCiMryd4W775wfIUYgyu
         QpqjqwSYqKUn7K8Wa3xJC62rbCYU3uPm8EgOAlPSaZiHi3yWbmTVWwCv6jlfq7usYzUT
         OT4EBXGmrBVyPzCdgtNhJe+eWGJdnby3Vh4G/yHznxA1VO5lFgbUnnIEnMzRNWO3N7L5
         7jRO7qbVfmXXRyJnZmjrtHN68ZD/duXZ5M+zGf7hdAjkaKYMibVmPpmaTGkhfUo3P3OX
         fbAg==
X-Forwarded-Encrypted: i=1; AKwUvBxI1t2Qw8biguiElZdaLYvNzAUS6RoVnkugrqojohxAzrzcvPPlOYgUkDj1prlQ5vtpdaWG4iLYUiSR@vger.kernel.org
X-Gm-Message-State: AFuF++kfRz9SyUfBUdRp9o/4EOB2ZM4m/ukL0ItrFpYN+Pv/X2OwzM4Z
	/ZS58e2jIslmoDB357QWsOWJ8QvCqH63fFk7DZ24jlWCVKFeqVXMKjam
X-Gm-Gg: AYBFou1C3BuMgnFXhLcqEkr1G073FNTGVqdaNvUVSv2lxGhRHeFs1fr3A47LJQI24zv
	oWBrrg+fKzZTJWSDS8+ACqg9/r4VanIrahicAJHk109LtDPqiNgs6tms0vn7ss9wdNaTVYYmu+R
	cyS8TPtax+l6vRbfHGgTNJqOj9JLygkilFq19RJ80MaN0KEXdy3bCVavd0IY0IclKOUewf+YYIe
	UQ/mOWJl3vm17Qephgtrv3WHf9DyfTRKGTXXfNlF1HXbrUDWLYymHYGSSqcZielU4+optV4H5I2
	rx47Vy+2QcqHd38WQNL+q/quYAVFLeSfavXD1o0z2jt2vUbDYRxj1HrUt5Cf6DiCvkxvLb7Wt/7
	2Oo8nV0dhapSZl1YyqqI4Kxn4khu2Qwvub19MZEKCD4mCrUX5e2WPOD/CAU80VfNjgWPAzGy18O
	B8yDUxz+oOBX73/86MkO4w2vf6zzOFZj9HLeQo+mf2Wgp0lQlzgp8OE20gV8r/1lb8eZlMIg0vS
	hxS6skInBYZClXaI+TQc+K0CDdBpvFSZMVAc/ovxAwJskHkMfDF0+wFGR09yr1bvgWJy9FgzgXn
	DGc=
X-Received: by 2002:a05:600c:609b:b0:49c:f9b8:bae0 with SMTP id 5b1f17b1804b1-49fc7f2bdc8mr199260285e9.2.1790064093776;
        Tue, 22 Sep 2026 01:01:33 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B80530056971C6280202175.dsl.pool.telekom.hu. [2001:4c4e:1b80:5300:5697:1c62:8020:2175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaaf97e2sm18248625e9.2.2026.09.22.01.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:01:33 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?UTF-8?q?H=C3=BCseyin=20BIYIK?= <boogiepop@gmx.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v2 06/11] dt-bindings: npu: rockchip: allow DVFS and thermal properties
Date: Tue, 22 Sep 2026 10:01:09 +0200
Message-ID: <20260922080114.44662-7-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922080114.44662-1-royalnet026@gmail.com>
References: <20260922080114.44662-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The three NPU cores on the RK3588 are fed by a single clock and a single
supply, and the firmware accepts a fixed set of rates for that clock.
Describing those rates as an operating-points-v2 table is what lets a
driver scale the NPU instead of leaving it at whatever rate the bootloader
set, so allow the property on the core node.

Throttling the NPU from a thermal zone needs a core node to be usable as
a cooling device, so allow #cooling-cells too.

The OPP table belongs on every core, with opp-shared: the cores have no
clock of their own, and one shared table for one shared clock is the same
shape a CPU cluster uses. #cooling-cells goes on one core only, the one a
thermal zone's cooling map names, because the cores cannot be throttled
independently. Naming one representative node for a shared frequency
domain is the established shape, as in "Cpufreq cooling device on CPU0"
in Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml.

The schema cannot enforce which core carries #cooling-cells, because all
three cores share a compatible string and a node name pattern, so that
stays a devicetree convention. That is the same situation as for CPU
cooling, where cpus.yaml does not restrict #cooling-cells to cpu@0
either.

The example gains #cooling-cells; the operating-points-v2 property is
exercised by the RK3588 devicetree later in this series.

Assisted-by: LLM checkpatch dt_binding_check
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
v2: the text on where the properties go is rewritten for opp-shared on
all three cores, following Nicolas Dufresne's review of v1 3/7. The
only change to the schema file is the wording of the #cooling-cells
description; the constraints and the example are unchanged. Conor, your
Ack is kept on that basis; please say if it no longer holds.

 .../bindings/npu/rockchip,rk3588-rknn-core.yaml        | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
index caca2a4903cd1..beba1896156f5 100644
--- a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
+++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
@@ -42,6 +42,13 @@ properties:
       - const: npu
       - const: pclk
 
+  "#cooling-cells":
+    description:
+      Present on one core only, the first, which stands for the shared NPU
+      clock as a cooling device. The other cores have no clock of their own
+      and cannot be throttled independently of it.
+    const: 2
+
   interrupts:
     maxItems: 1
 
@@ -50,6 +57,8 @@ properties:
 
   npu-supply: true
 
+  operating-points-v2: true
+
   power-domains:
     maxItems: 1
 
@@ -100,6 +109,7 @@ examples:
         clocks = <&cru ACLK_NPU0>, <&cru HCLK_NPU0>,
                  <&scmi_clk SCMI_CLK_NPU>, <&cru PCLK_NPU_ROOT>;
         clock-names = "aclk", "hclk", "npu", "pclk";
+        #cooling-cells = <2>;
         interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>;
         iommus = <&rknn_mmu_0>;
         npu-supply = <&vdd_npu_s0>;
-- 
2.43.0

