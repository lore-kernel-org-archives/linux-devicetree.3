Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253712FF675
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 13:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527370; cv=none; b=XO+CWAUo8ftrhrEfsT3Gm+aqEWl6B8xjPXS5/P3FTQ92bwJyUMqGCMKjCMz65WzS6wULWxXmiS0AljoHBXWJWBxSFRPUARqeBmxDHrLYGW9Yys8riDrQ2uevqbH0V+9Phfd5fxWHyS8iRLHq+dp6rfmbcWiIFSJrJGbNuPKJCdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527370; c=relaxed/simple;
	bh=xW3BlnlVGWV5PkWwqN6FwojNoL/psHoWMS2ENDfENlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZwH947uICxz5gqDmDVew6k3y0c6ed7v6/oIfefkSt4frg7vR2UvS1UrqGllfVmB0I6e5JWLGAV3lxjnOXgACW6gDGc3vbJe+3EA541zG78zDbm/veFoNgr099ur+QCfejpQbKCwxyJ9t9WrawG2Ci7wSPdAIzUr3wL7NX1UhUg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bewhmzVs; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bewhmzVs"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-499db1740e4so337105e9.0
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 06:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788527366; x=1789132166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WkYtc8Zy+X1nQtQQfmPXyE49NKh145BAfNH3nX3cWHM=;
        b=bewhmzVshE+vs5j7IvSVKFK19ZN/1IuctXlRo2B/+dk2+lg8IKmenp3ym0ngoYeSyY
         nZCOmU27GuxUXBa/fJsy8KFfPQ2XdqUdjzEnxKV6Lrwq8NlgkPQGjr8TPIQONU+MK3wm
         WONkQ8QYQLFccwCghMX1kBrlFK3n0jY4DOMu6FR3xj0lW2cuJDO5Y+gsKhn4BaxH79NI
         7CG2WKH5Y08g9ga+GbA1QpVYZ9A2zHrfWa7Iiz7COf6i7is9OPP9fVuv989Tlb9iRyRu
         +R0SXQwHhzsKSwjMKrJnMqFXQrxV8uTzzZz//PK0LHs5ke0v7o8LfeC4z0H32JwwCtXM
         9USQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527366; x=1789132166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WkYtc8Zy+X1nQtQQfmPXyE49NKh145BAfNH3nX3cWHM=;
        b=q4L4LjCxIHh3jkNyhdEQ+F0UvLO2pHEhBQDNoa1bCnhhp9gEOmINRayN+VJXZRCAzq
         jhz0S8oiWwiJyF3mW0gZDTJSlB6bqqrwgWwacSlmy3FWh7EShd1t22sAj5SzRj1MW5JI
         zP79SfUuhUVB/clD59fIXlDVGkexIFJVlFu0vSy9Iht4rpCNC2YsxEI8yRvTnsYfcY2v
         XlG2rYjHxowbjwf0pLX9vmWoZ0WZuyeUDkvcB/9lZ80sWfYLuqA375AMyB1S5dYOy5BI
         1Wf0mdaHdrJ0EaMd5oGTL4eULFSfUhxEjAkJdi8i+RX/8nxmMZjGOMPWIOkUaGo32uY5
         Kufg==
X-Forwarded-Encrypted: i=1; AKwUvBz1O3NujEvn8R1XtZatKujV6zJ7uq6oJxUuWN4coNcWK0al6CmRC86NqMg3o6wsbSGhbDY6zTev8Zgl@vger.kernel.org
X-Gm-Message-State: AFuF++l1eZCIm0bKbKD2Jag2LrN42K80Kw/eHlNN1hrW4aNDRiIW7lNh
	zh9NPHkufVOVg76e8XMceDSWl1XI+t1jyFYc1l/TR0HwWT1Gi+Z4jhJ/
X-Gm-Gg: AYBFou24G8ZNW2NItmu2xDW/nWZ8M1nlZT4X76sYjdFRykrHCDqx66N2KTOEhroZtx1
	75/4qPOt2sI/8/NMndzIE5zjoN0qFYO51p40ietX3kyAwuX9AL6uQvEYHg5KybwopuyaJnHTyl3
	pzAIqg3Gp5wMnWnBF3oTsUfHE1SNZSQnBQTynDxohOPljhilUJg5njN1cqz6gX5Dck04WSc1HFF
	0+8nBBYMe4RUKmgQc10zdjbVFUBx+paSKuN8R/xq8wfeMVy9KJ7Lo0RQw0hByrchGMQZfIKe/MT
	R9YRZPJkv+D1OsKXYEsXOnrh2+pqqzeEi6cRPVv4vYlZjiYRbS52pExsCFAq4UYEjE431JXQn2A
	USDT64KIkoFzE48eEEvfPWR3V9CEiuiNRdhtGhR8KT4BprTXP7NA7LmFfXdwJ14B27by0HTeNlT
	WnOqQv09qYX+5qlNYVqV0xNStb6G8W8p60hIUphXnpI1Ian0wdFO0qCuTLCFx7iZODgTFN7Suxs
	bFGzRxYhRcn82ya4yRhjvVqWdRQ9nAAmqg9BsMgal08fRQU5XmVamdbur4SlS4DROFky8xGM3yk
	5pVhjog2RF6173E=
X-Received: by 2002:a05:600c:34c5:b0:499:cef6:104c with SMTP id 5b1f17b1804b1-49cf823c012mr41127815e9.1.1788527365941;
        Fri, 04 Sep 2026 06:09:25 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B871500CB6EF488A18F9C42.dsl.pool.telekom.hu. [2001:4c4e:1b87:1500:cb6e:f488:a18f:9c42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce554d52esm135575435e9.3.2026.09.04.06.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:09:25 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH 2/7] dt-bindings: npu: rockchip: allow DVFS and thermal properties
Date: Fri,  4 Sep 2026 15:08:53 +0200
Message-ID: <20260904130858.27803-3-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904130858.27803-1-royalnet026@gmail.com>
References: <20260904130858.27803-1-royalnet026@gmail.com>
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

Throttling the NPU from a thermal zone needs the same node to be usable as
a cooling device, so allow #cooling-cells too.

Both properties belong on the core that carries the shared clock, not on
all three: the cores have no clock of their own and cannot be scaled or
throttled independently. Naming one representative node for a shared
frequency domain is the established shape, as in "Cpufreq cooling device
on CPU0" in
Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml.

The schema cannot enforce that placement, because all three cores share a
compatible string and a node name pattern, so which core carries them
stays a devicetree convention. That is the same situation as for CPU
cooling, where cpus.yaml does not restrict #cooling-cells to cpu@0 either.

The example gains #cooling-cells; the operating-points-v2 property is
exercised by the RK3588 devicetree later in this series.

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
Assisted-by: LLM checkpatch dt_binding_check
---
 .../bindings/npu/rockchip,rk3588-rknn-core.yaml        | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
index caca2a4903cd1..595aacfbf8608 100644
--- a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
+++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
@@ -42,6 +42,13 @@ properties:
       - const: npu
       - const: pclk
 
+  "#cooling-cells":
+    description:
+      Present on the core that drives the shared NPU clock, which is the one
+      the operating-points-v2 table below is attached to. The other cores
+      cannot be throttled independently of it.
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

