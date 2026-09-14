Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A7B4252D1
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378806; cv=none; b=fEYRR8GbzVooo8+qPq0kG+s44gCLnqxQS9i7gusE0fxm7ET9bWNaqmdim1IbAMNvZ126AT2hJFH4YErym3tDTB/Oe1EgubOu2tA/zuUdVGWEOap3M2s2SzaVSdCWSf2ArKJSQtvZ4NwGuiCODhZ426zZTATTBJFu5YSqIAkaVsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378806; c=relaxed/simple;
	bh=Q1SO6EtCR75JXe3JpYCv7OaNJuuMIm0WdKd+5Zw+RCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z/uUftdKu0rpN07byVV7eD1+g23Cyx+h1uDYgnsDOMoz+Lptp2Lt7sdaecpODGmA7wTH7rg6rriojrdHXpKDE/h/kf+t3G2WqBXuFeuEtYrlgxQ8F4zBEcoavmF+dMNmiW7jD8TnEW45otpUufV+c8tDCf09yzteCC6szn4Udms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aHJFoUe0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pe0cetSX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aHJFoUe0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pe0cetSX"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E8KjvK403872
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:40:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tcHuExv7ntKhJgMZFmAB7i1tSGwudIpTtAVbjxinbE8=; b=aHJFoUe0U4P6bmfz
	PX35JjrmmrCaMDJgrPYCM8t6MqWgKnVtZPZn+ElJXhrlO2zDuLHzlyv9JwvQtS9/
	DZJJHAFDfsDnOZhZHqdoiBd2GVHn2436wVZ72hME2o+Rc6q0la07TWZy3DXCQIQR
	Tnz03X0XVhws0gEWvgmHAB5wZZutMe+Raa1d25K5eHh7mMYrwFO9nv76rWfdOizH
	5t8LiOnQamEB9AePp5T/yUilh4s+s4nW8OW9AzfQ9RSzWJmijeL6r1KAuHLyeB4x
	Z41s5ONEZtJdHI9oxmVyYAMPYEQ+2Qur92p54RJ4GY6bMuGS4dvdBIOZvW0AMalj
	Wj70ew==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5r8p1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:40:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so789953a91.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 02:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378802; x=1789983602; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tcHuExv7ntKhJgMZFmAB7i1tSGwudIpTtAVbjxinbE8=;
        b=Pe0cetSXygOLNUnzKciieksal/7hdCQUH40b6VE/gEIe91/qTYHeZtYw2cWk59bfpA
         f8pq04PTjgP9Yaj+P4FWlI0etz2Ar71WX4wmfqeQWlazcr40Pbuuz/x92b8ITKG9ZopJ
         CW+xZT4/HcnV4GKS8lUVXYqLrg/CgDOvhGR2HJiLVbiil4iSTjQRLXd25in5DHmjIisf
         H9xYsUcGEv5Z39yxFP3Ouw3WnT7l8vQzC0Hk/z3jQaX/ScPw/0iAyigMEcJsfWUAZ5zN
         o66tugTDo8IX/pfg0+tu26NCsUNLm5j/CwqfMYa7A1A4ha/1CNY6SaiHiHMqbbkqhUEF
         aZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378802; x=1789983602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tcHuExv7ntKhJgMZFmAB7i1tSGwudIpTtAVbjxinbE8=;
        b=o+/l1LEQTcF3m7o83s0Ju9Ef0oNRmoOqRQyqX9s/Y2B5SESBAipoPr28VvayflC3yN
         JxwiZrSZb8Jtj8FCcm9MP4KjHJ6fxFZRGtJO7m1yF5YFZxZFRw5kemg8dQjH/pH4tf/S
         RycWhqM8OxwTJ803kx+W309I3J0TWcZVAPTmdr4xu7CFr+Y2iuOc401WYuiVk2TR0DVr
         6vUkvLs85LsR4QOsHgC1uvJoBjiILBSoI6dxTeIqKenrS4UrZmteVYLv+V5CE4IyH5+O
         tKgx3mqSduQJd3K+Wku+LjWJCg5GT+H2dU4z/sxTbBh6dNj0VJRIj3ZTzxFP1phGOBG5
         Rzvg==
X-Forwarded-Encrypted: i=1; AKwUvByWv2fJ9Vuw321/CNDTtQwf//8QXIH+3clXtaknaxXOmEp43Fos8tqNv/SHvEsTiVcHh8VQs7u/QH1m@vger.kernel.org
X-Gm-Message-State: AFuF++li6eW4e9qV4RLQvLImC8MxsQjcc4xkgBBpLZ9vtoWuq+GWGeUc
	hWeT7r7sxeuUVMG5GHWTRNT5d5Ta9N96fEAGo3WC9W6Lz4I+6FuqO3/qV4x3tV/CmcwAvjnhyYm
	G3gqAaBkxGJpdX3D4wEi1SdsKDDn6GnhCt3ZX9ut8uqN0OMWymldCeUBYx2SH276+
X-Gm-Gg: AYBFou0vAgsfpNYAzpXgDJipoTRrD6LxwV8rbAfcO59RTUK6nGkySjsUKpF/phGxayZ
	YPmoInVmpjqtnzJY77kuMTAh79PwhImDqDDhCa6ntiDkwnPb4R2jlrZDQij4C/zLZDaYqrtwJSB
	5qwixMR/nmOkjMbYIcmOm4V6DNRVT3B5gLW1qJLidvt7PlhBNSXveYgXOGVbu7El5xcPUWo1uOs
	Omc6GU/LOC6a++hJzJixF/PH5Oy7zehjLo78Z2IwauFnGplVcpV5IZRhG2TVGGR0yKx62tTa4RR
	8VYHXhKuo+a3/ETuYzyQhlgtFeQMBaz5cYoRKptq4Nm76bYOBxmGhMtinKjEW6vnDUn8uI0bBCW
	B7Nqda+kc7mepBPZA3tt7xXq5hbYD+HaGh1PFtflvUlFqxqI267OGHrP8
X-Received: by 2002:a17:90b:4d0d:b0:39d:efa9:cd25 with SMTP id 98e67ed59e1d1-39defa9dd52mr2252573a91.2.1789378801904;
        Mon, 14 Sep 2026 02:40:01 -0700 (PDT)
X-Received: by 2002:a17:90b:4d0d:b0:39d:efa9:cd25 with SMTP id 98e67ed59e1d1-39defa9dd52mr2252522a91.2.1789378801416;
        Mon, 14 Sep 2026 02:40:01 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm19488728a91.4.2026.09.14.02.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:40:01 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:37:51 +0800
Subject: [PATCH RFC v2 03/10] dt-bindings: arm: Add MPAM MSC binding
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-mpam-resctrl-dt-knp-support-v2-3-bf6645bb2f65@oss.qualcomm.com>
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
In-Reply-To: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789378760; l=6447;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=Ow6nsjOKfT1BtZK/wCsIgEjpwtBp/p95hFXIvpOx3ZI=;
 b=x7FrWzfyQw20XZhZOBNhfYnWn2cwebvQR9HvUByeGHDRQbXH5+wbqauX7T56oAUlGWmLaBnLR
 7FCUZSHVECOBeI4oK7kfIhrK3ztCkPOMmNwOfkX+ArlwVuMcgKU+H3j
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfXyIegnOud4r1B
 GgbSdBd7PcesjcvPScoU0B7xQ+A7Q/d/5h7w8fvRM7WiTbPVquIjD6Ye/1RIQA2iL+jXGxSgo0D
 gOj1L1zTbmqPluCfZlwlY6TuZLBsm8Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX5A9s1yoYwa2S
 uWbgp02q5sSP2ctgAVpErZFX2VrG/7IoDcncBRffQh+GM8zJZDOyES6RU5VKjVlUyPKWCSbEEnQ
 y45G9Dl48M2Tsr40VDl1o6Z2pphttbkJP35vs2qOqAVEuw6CZrC9iOgUYPpRxHlnlJ4mHJ32UUE
 ZUaANb1nlsfLlZfpRpelQr9KLrn/3CAmHWBsxbW3aatez/ruvVYNHM7BAYySFgY6vIo2q8s/91W
 haG7sm5aayw3BbChvKHKfdqUjs06Uy+6RMydK/96SKRaEVsjaPgXGk6zHqbX7VcQzJT5OlVpNXR
 SwCkRXZTsWRyT5VbjE+23sZwMxt/9Iou62Zh/f35nyaUY+O07pxJxPN4faxfYzTnuDgYOAjrx+2
 vCrKk9NcoR6acUs4grtftTlaEuMSquu+viLysnaft1OPKDmOgIGe2wHcAS+nObmxk3z1OA3pCZN
 EM9gbse3iRfhFZzBl/w==
X-Proofpoint-GUID: MDJ4SGIz1ABrL_XGULh51I_-QeH-nudT
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa7c0f3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=FqHZ4tX-ONj_CKorFbsA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: MDJ4SGIz1ABrL_XGULh51I_-QeH-nudT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140137

From: Rob Herring <robh@kernel.org>

The binding is designed around the assumption that an MSC will be a
sub-block of something else such as a memory controller, cache controller,
or IOMMU. However, it's certainly possible a design does not have that
association or has a mixture of both, so the binding illustrates how we can
support that with RIS child nodes.

A key part of MPAM is we need to know about all of the MSCs in the system
before it can be enabled. This drives the need for the genericish
'arm,mpam-msc' compatible. Though we can't assume an MSC is accessible
until a h/w specific driver potentially enables the h/w.

Cc: James Morse <james.morse@arm.com>
Signed-off-by: Rob Herring <robh@kernel.org>
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 199 +++++++++++++++++++++
 1 file changed, 199 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
new file mode 100644
index 000000000000..53a6fdbbf05f
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
@@ -0,0 +1,199 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/arm,mpam-msc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm Memory System Resource Partitioning and Monitoring (MPAM)
+
+description: |
+  The Arm MPAM specification can be found here:
+
+  https://developer.arm.com/documentation/ddi0598/latest
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+properties:
+  compatible:
+    items:
+      - const: arm,mpam-msc                   # Further details are discoverable
+      - const: arm,mpam-memory-controller-msc
+
+  reg:
+    maxItems: 1
+    description: A memory region containing registers as defined in the MPAM
+      specification.
+
+  interrupts:
+    minItems: 1
+    items:
+      - description: error (optional)
+      - description: overflow (optional, only for monitoring)
+
+  interrupt-names:
+    oneOf:
+      - items:
+          - enum: [ error, overflow ]
+      - items:
+          - const: error
+          - const: overflow
+
+  arm,not-ready-us:
+    description: The maximum time in microseconds for monitoring data to be
+      accurate after a settings change. For more information, see the
+      Not-Ready (NRDY) bit description in the MPAM specification.
+
+  numa-node-id: true # see NUMA binding
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^ris@[0-9a-f]+$':
+    type: object
+    additionalProperties: false
+    description:
+      RIS nodes for each resource instance in an MSC. These nodes are required
+      for each resource instance implementing known MPAM controls
+
+    properties:
+      compatible:
+        enum:
+          - arm,mpam-cache
+          # Memory bandwidth
+          - arm,mpam-memory
+
+      reg:
+        minimum: 0
+        maximum: 0xf
+
+      cpus:
+        description:
+          Phandle(s) to the CPU node(s) this RIS belongs to. By default, the parent
+          device's affinity is used.
+
+      arm,mpam-device:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        description:
+          By default, the MPAM enabled device associated with a RIS is the MSC's
+          parent node. It is possible for each RIS to be associated with different
+          devices in which case 'arm,mpam-device' should be used.
+
+    required:
+      - compatible
+      - reg
+
+required:
+  - compatible
+  - reg
+
+dependencies:
+  interrupts: [ interrupt-names ]
+
+additionalProperties: false
+
+examples:
+  - |
+    L3: cache-controller@30000000 {
+        compatible = "arm,dsu-l3-cache", "cache";
+        cache-level = <3>;
+        cache-unified;
+
+        ranges = <0x0 0x30000000 0x800000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        msc@10000 {
+            compatible = "arm,mpam-msc";
+
+            reg = <0x10000 0x2000>;
+            interrupts = <1>, <2>;
+            interrupt-names = "error", "overflow";
+            arm,not-ready-us = <1>;
+            /* CPU affinity implied by parent cache node  */
+        };
+    };
+
+    mem: memory-controller@20000 {
+        compatible = "foo,a-memory-controller";
+        reg = <0x20000 0x1000>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        msc@21000 {
+            compatible = "arm,mpam-memory-controller-msc", "arm,mpam-msc";
+            reg = <0x21000 0x1000>;
+            interrupts = <3>;
+            interrupt-names = "error";
+            arm,not-ready-us = <1>;
+            numa-node-id = <1>;
+        };
+    };
+
+    iommu@40000 {
+        reg = <0x40000 0x1000>;
+
+        ranges;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        msc@41000 {
+            compatible = "arm,mpam-msc";
+            reg = <0 0x1000>;
+            interrupts = <5>, <6>;
+            interrupt-names = "error", "overflow";
+            arm,not-ready-us = <1>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ris@2 {
+                compatible = "arm,mpam-cache";
+                reg = <0>;
+                // TODO: How to map to device(s)?
+            };
+        };
+    };
+
+    msc@80000 {
+        compatible = "foo,a-standalone-msc";
+        reg = <0x80000 0x1000>;
+
+        clocks = <&clks 123>;
+
+        ranges;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        msc@10000 {
+            compatible = "arm,mpam-msc";
+
+            reg = <0x10000 0x2000>;
+            interrupts = <7>;
+            interrupt-names = "overflow";
+            arm,not-ready-us = <1>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ris@0 {
+                compatible = "arm,mpam-cache";
+                reg = <0>;
+                arm,mpam-device = <&L2_0>;
+            };
+
+            ris@1 {
+                compatible = "arm,mpam-memory";
+                reg = <1>;
+                arm,mpam-device = <&mem>;
+            };
+        };
+    };
+
+...

-- 
2.34.1

