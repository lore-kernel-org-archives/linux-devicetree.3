Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188086;
	b=hfTtuoWviuZ4kXsz26fQdASZ2xA/2NI82biegGpNw8SJ5Oulab+bmipijWzVuSdga1WL
	 CLiUAKL9jqJwps3zgquTH450Wji/4Z7kCb6e2TKtemjUPd+rNPGT2vSkKdMiBH0O3zGaA
	 Kh9+TITzOnDEVLuEj5uL6jQ/PpXPsKEw61Qz1F+IpJ3Cfw6GXdKN6BxvJZutlC5sDqg43
	 KhAMnMhB2d5Wtxyl7NNzm5jQD3k5YHSXR97monfEwzfY1ElwbvMAJpybfFV0nHy2NZGTZ
	 7QvAjxaB6z6PPkkUslO7qNkHwmVjHCmwQfg2bgwLgUTQ4UrkmJ4wttOMe5Fq5RqLpAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188086;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LswZd/ASoQRrZpqIJhj7fW6h5DTUVttYSjl6IDr3+oc=;
	b=Ih/dSTZa14Tt4DkE569Sd3hfKFr2QeYT5jLcueg8MrSeb1OLUsfEQ7/fOAm6QRSZGaHE
	 QJLWiVS6pGmsO+iH56UUqq/RIsgX0YWju1FafK8vDpmpgz2hNyeE8OGkZcyAG3uZJR/t8
	 HswrXa9SsN71dnt9yQKFzkvfrWIQ7dmEqUNFTZY1YDaW+RECFbFGOHHkhCO/hkiy1Bb7y
	 MUPcgVNorB8kdA63cnITaCDJgQJ6HOBFS3sOonm+13Ys2IIehy66Z6lNO6HjqX7c/HcHz
	 +8mI/LTQPxMqUZ6upcKHhERnCMHm/cqQx5XGnZrPHJ5uQQo0YZlwG2X8Py4c+NUi9pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G9EIYHDe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FHsgE+oH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F63D606A31D
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 11:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F63D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G9EIYHDe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FHsgE+oH
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe5lJ3704261
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 11:48:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LswZd/ASoQRrZpqIJhj7fW6h5DTUVttYSjl6IDr3+oc=; b=G9EIYHDewyZC9pXP
	3ju6CGwJZw7Ujww1sHYT+7aynqaUpNLbRZGPsv8Tvphc+FWzrHLfL2hTrN2KckI3
	Oszeg5JA/y98c7nOsW3wXj7f6I+CFMreOCcM8TaPc/lg8vF7HO8WrzxPgdc7bve4
	AiwMrBA6PCatm4XTdvgsmU0e/NJCFU4yA9k6D+7gbtzTSPTsl3KMoIG5Z++jQC80
	Rdp/2OBbHcZvKxBmx2y74+SWfwPvAJVW6zYX7ny3q0Shr8cvTOA/8UuYPjjQ9GqW
	FHsT0qT5Atlr9KEjg0Yq0Cb4J6Zr4z83MwZIE0nZKKFplvzyBA0UsxBPXL6kdAUV
	fPOT1Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy7140gt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 11:48:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e601800e58so14549215ad.2
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 04:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793188084; x=1793792884; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LswZd/ASoQRrZpqIJhj7fW6h5DTUVttYSjl6IDr3+oc=;
        b=FHsgE+oHPxF6fwPXh8csOkFeVJ/yCmitzkoP7QmqqIbUALg97H3BAi5pRWCwMPqex4
         0YoZSmQ+ukDSYhna45YSYARwm9PHnIWF2uPFGro91gBqkEIRe4F7W1CRJpeVDI4qASOB
         zUaeioYHuAxoXtsq0lcwMRVf8J4mLiFtRNoddKWYmDGcTmwEJ5NMllXJyC1+Rt+vA4rf
         jeKQZtOA72T5sqKNDNQWiDWWpC3mSp+iwWkYT4izsKtjVxemha7LkdPUqwHdlAkv8U6l
         ZXM9cS5pXMFGzz6FrFqWaXj4tsWyrwmXP6jYUw6idPbMqwMd/jjkg8vRktFBRKYC/dLG
         xIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793188084; x=1793792884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LswZd/ASoQRrZpqIJhj7fW6h5DTUVttYSjl6IDr3+oc=;
        b=C+9hRLYaD1MyxCyvQ1iC5zC/KTyIxIxsWIMk6aHTnaggn27tR8SlNi+UCujXh4YzKM
         77qYAz3g/lqhjrencDenKbXxvkG16FENEuIr+3g99wVzYNBwrsAru/YkvAXWPAdkqn/V
         89wvNV6Vj75M1cIM+XsADa2sn+Dh55NRVg0w0emykdzmhUo1V5WWqTjiYgggwZ6wG2WY
         zjNvTEh+DR5FnRk0cs+3sVU/ZqBkE4Q7i8ETNPHCOx+WeEuDGZy7DceN2daO8Cr/SIbt
         V+a/x1hTSAC4NzMr3QsQouXsEhQkO0gEjZN1PcrnnymU05E/YVl6YaT9pHI54oxJwShX
         F2rg==
X-Forwarded-Encrypted: i=1; AKwUvBySYpBCA+pbEOrTRntpdj/wSYMecNtFxFsbDvRpnyNffFaF3+GQ2xgpAWH1jp0w6PBzq3djZGWpDwlD@vger.kernel.org
X-Gm-Message-State: AFq9FYJmwX6edPMzl4MY0VRjRlMWqjp2yDIqQWLf3Yv1HJDEco8aXYjM
	AzboKcZiK9DCjVvhGoUAcKao34tjPf+XncyLi+mBKpIJnImZzp+ynbfAHaNGzst/dAvi7sU1yYJ
	csN+NBh+KbACAoBoZkXYSGK3gBxtEwJ3Lx2WMXDWGBZ2n8iKOgY416djyTUh7MgW+
X-Gm-Gg: AYBFou0CHXKILQNJvVX/jObjSRcJDiWXaSzKvYp7yMtzicXXxwny0+AkPzAp8YhwAPn
	9SFHh19PdVoKbM12QouNUTjUlYPs6IZhlE/4pGjRUYCLXlj18be3CI3dZgITp5hKYe57uUZ4faD
	Dnr6A5EfsuTrCATQUpZobg6pbnPRb4ttV1XP4MVYgGlvz0ap84kOQB9mbsRbhcwknHn6JfdlICH
	FZ6DJ1yM1no+J+cje8MhH9WIQS/5wyfQqACHtsCx3z2YefaRpc6ILr6qC9vBAHQbpJEVIP+Ab9D
	99FRy6DEuG0yJHLTIgKUsttt9bG/EzK9zvwyc2NqjpDWyUv4V53SP8UwVrSKfjMOw7UUqzI4UFJ
	LM9zV74v3S0HaNf1mUQGxL/L7Kjz5zEuPtqDhMzk834tycHHlJT21PaxqH4HgP54LwB1oTMTsH0
	WiPnNx9avxIyAikjv1+46ghfiX+iyk
X-Received: by 2002:a17:902:d4d1:b0:2e9:6645:e9a6 with SMTP id d9443c01a7336-2eb005a650emr19174675ad.59.1793188083537;
        Wed, 28 Oct 2026 04:48:03 -0700 (PDT)
X-Received: by 2002:a17:902:d4d1:b0:2e9:6645:e9a6 with SMTP id d9443c01a7336-2eb005a650emr19174475ad.59.1793188082951;
        Wed, 28 Oct 2026 04:48:02 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c37551sm21207715ad.51.2026.10.28.04.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:48:02 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 19:45:43 +0800
Subject: [PATCH v4 3/6] dt-bindings: arm: Add MPAM MSC binding
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-mpam-resctrl-dt-knp-support-v4-3-bdda1e445cba@oss.qualcomm.com>
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
In-Reply-To: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793188046; l=3009;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=8PN3jSMZ/mskk1bxkWM3cKZzjFP8ZqH1EBcyaOMTbg0=;
 b=QWyVLshjnniVm9WIuAHK9RFKC1Ym/nBG3lrXTz4mbtssrfXDgAXVJPOmpEbKpFuCoaLZgBk2I
 SFDmSOAvOcGBmxG5nLAbhKzjZmoTp9mAxYBABXBUI5GwlvpR6riun1H
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX4en2JvCa+IKA
 2ixXIJ3a+BlwoEkd9IzeJO7Kc4r79/EWkxBnJ4RzScJzKhHpz+2supKUNCmVDB5khUVHFGNGAlk
 r1sswBsyk1Q7Qogkzcd8sBvNKJY9GttixHAC7oGTXWpSCf0sybUXu1lF5f9N4vdca5I9uDTuWKL
 PXciXVU5ecbcykeNDwFk6qO5Gdk9ITm7Pc+dcRSSLi9AtM8ikPG2K5RGk14T+XT7z/UP/1ci2m6
 WRt6J4dTyk6NsbytoKtQcD6MRApuw5th+4vt8ETUNZkVPKspshNJAeX34XcRGRV08lyHPx1Yf9c
 PMoA0mL+VSiy9toTqeHRJE5rXiZhZq4zMoKOf+jNoTclx1aNbyIMd5nugDwdjS+AtW23dx77zwe
 +281ITk7YieTcMTXi2TqUY0OGkpR2UjLaYkUPMXaRpGw/j7N/HZuHX0x0VUgC4fQCaDpDike2fH
 JRhekgusIpf1ZMNqdNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfXwYNQoXySp6dr
 Wv1HRuWwPBddS9PF5tYTplI//GaHB1qMw2eMCIcTCwllY3qvIBcH08QsukjE+cfXdZdsNnp4q0L
 NppRkItpyZvsqkIfPb/FOBozvOqA5H8=
X-Authority-Analysis: v=2.4 cv=JspkP84C c=1 sm=1 tr=0 ts=6ae1e0f4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Iyi0AkbGYOnUpVGOj9oA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: AY5r524k_Idxa7_q0EbNEA4ofJ9Fwkuo
X-Proofpoint-ORIG-GUID: AY5r524k_Idxa7_q0EbNEA4ofJ9Fwkuo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280046

From: Rob Herring <robh@kernel.org>

The binding is designed around the assumption that an MSC will be a
sub-block of something else such as a memory controller or cache
controller.

A key part of MPAM is we need to know about all of the MSCs in the system
before it can be enabled. This drives the need for the genericish
'arm,mpam-msc' compatible. Though we can't assume an MSC is accessible
until a h/w specific driver potentially enables the h/w.

This binding covers only the properties currently used in practice; it
can be extended as additional features are needed.

Cc: James Morse <james.morse@arm.com>
Signed-off-by: Rob Herring <robh@kernel.org>
Signed-off-by: James Morse <james.morse@arm.com>
[ Yin Li and Huang Yiwei: fix schema field order and yamllint spacing;
  fix example reg addresses; reduce to minimal binding covering only
  properties in current use, dropping RIS child nodes, memory controller
  support, arm,mpam-device, cpus and interrupt-names ]
Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
new file mode 100644
index 000000000000..523978900d3d
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/arm,mpam-msc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm Memory System Resource Partitioning and Monitoring (MPAM)
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+description: |
+  The Arm MPAM specification can be found here:
+
+  https://developer.arm.com/documentation/ddi0598/latest
+
+properties:
+  compatible:
+    const: arm,mpam-msc
+
+  reg:
+    maxItems: 1
+    description: A memory region containing registers as defined in the MPAM
+      specification.
+
+  arm,not-ready-us:
+    description: The maximum time in microseconds for monitoring data to be
+      accurate after a settings change. For more information, see the
+      Not-Ready (NRDY) bit description in the MPAM specification.
+
+additionalProperties: false
+
+examples:
+  - |
+    L3: cache-controller@30000000 {
+        compatible = "foo,a-l3-cache", "cache";
+        cache-level = <3>;
+        cache-unified;
+        reg = <0x0 0x30000000 0x0 0x2000>;
+        ranges = <0x0 0x30000000 0x2000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        msc@0 {
+            compatible = "arm,mpam-msc";
+            reg = <0x0 0x2000>;
+            arm,not-ready-us = <1>;
+            /* CPU affinity implied by parent cache node  */
+        };
+    };
+
+...

-- 
2.34.1

