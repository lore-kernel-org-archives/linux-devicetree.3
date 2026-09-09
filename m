Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8183057268E
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 14:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965824; cv=none; b=JOk1AzYah7Y+rVyWBDPUfFg6VeNlyeC4CUdfQxAU0vJETE/+l5t3n9/q86zU8eTW8KECeEza/XveRilaVwr6BZibMrliYF0Y24McFtkNG29rr+kDN88eORrPUF2MUUN0f2FUgN7pInb3IxcngUcngfzpVk3L9aCzQVIjVXz5K6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965824; c=relaxed/simple;
	bh=XggMInr4p/kOChUVji0s69UYgrNeKmtuSko7TtQpILo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VBWTBSQW9OO+j0RWAYeC4ljG1KRaa2HueS0iYG8+fkn4CbzmBYjrzt6qz9GCpduB+0tjImYRpOzof9OAeMPcuxSYNS1BDHE7jOzmYVpmczJh+9s8VB38fa/gHIzxiVdm3Vx9g30ne/w37i8JRLU2j+nRFqn4aJr4xeeblg2o9v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DYCibMWJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VpyqHxif; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DYCibMWJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VpyqHxif"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689CCwvg3053119
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 14:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZCGZQ+i6grmulaXko8drMOvUQkeNLsh39m6O+zc/IiY=; b=DYCibMWJFOOBEBJF
	/M2Nt3jUPp8Z3fcoPwUf1odz4T/m4p7+MjViPRiLjGSU4Lt4Voe5zHqSJn5iszVu
	M5C+iiohVOFBVStNKBrjJVek6RhoaehRDax9e06tmUAUbQX287THCYey8xORRIWU
	7MBxQOJ/atxJWCzpxCyZARpksoNc/D8mMrK7f5CDRyyb+EJwDqAzjUxyLqgnZXUM
	TNv4vW2LN44FADMf1gaXv/ymezqoVS58h3RcjptzniyAN40NbAJz9wz2mUBxoIeI
	rsNmP+ZlJXIaJEV8wXmdDDoQKYexIZKrTMHoG7jIIg3zd+ZZxCcFETQ+D3RNYkqN
	Bq0TfA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk7920qkr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 14:57:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93918756165so1019007185a.0
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 07:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965820; x=1789570620; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZCGZQ+i6grmulaXko8drMOvUQkeNLsh39m6O+zc/IiY=;
        b=VpyqHxifxQe8ZEfoayja80rnkCJkFw5cvxyHjDgXjRnAc1r0qQG70L7D5HqXxGHoPX
         s49on2N3+33qvVGZpFG+On9G/+fVNK4/cM2Nw+ilxVdjNDAgWTfvECHehXUPqA/59OWt
         CJw2CSqHhQWH0P1ykTqf94MZrH8O+CkpQs9LrIvPyjtk3wtiW3QUSGfi9q2hqwn11X1e
         77FEZtGiqE6Fi40RJgbAQHy7ya4sISLOxcwr6sHE/L45dgPMSNqFmnMNUmHuHFu9DSMF
         9lveQ6ukcRm9Xq4NHDlFJozMFu+MmnZ1A1kXGkQ8NFYs8T13zF63NSsWZdp3EOgQy/Ln
         9Agg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965820; x=1789570620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZCGZQ+i6grmulaXko8drMOvUQkeNLsh39m6O+zc/IiY=;
        b=nIkyhfQcDex4dFXa5zxWxgKoTUUgcQwmCeTy8adRPGYnzALBQRDiBIfek6Fo3mOUN+
         LecUFVqMlQ5lkighpKBhJBqvvYyra0m742M1nBnW5VBJltcFYHgVKPvvcp7JsmSpMIiR
         p2/DnObepfGW0qn0D9wwDkEinGJtgyiMKt9RV9/elm+uEsjVxWEoa6mrzhXOKyylwnfP
         jDS4LRLshMhEUEbAQM6nD3uFuz1ZkHulkBALbQGohogLG42WSfmQgX5y6UbuTsZTDnpf
         aOgRPJGz8IMgLfy4hCOoeE2ThO/jMa0rdy24uuyO4lrltjbNpaUe9hwOxDEoQ6dcm6vs
         2Q6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzowonG0wzX5bZHKzEmm4Y4MdMRyC9y2LoCmoNTtlaKB1cLOb+ARbq7AKxdr07T/RS349z5uzNQAsps@vger.kernel.org
X-Gm-Message-State: AFuF++llQgy6xZAJoZH7WYSbe1tHHSKIm8nxFDQPl/XnRmAv28+ro8O0
	FEHdU0PMeYq75A1qaqt9rZoHDohMvkE783q25MxScX6HLScRIu2msRICDia8hH19uLGN/Vk1DBU
	yJoTIampaiA966r6t3FUqE9DrrJjLDXQZlSg1tE73cmwXTIoaxMoFgPT8YS5QEHxr
X-Gm-Gg: AYBFou2l9DXEIrg1IRjscXTnlbmD3VGKA9elRyp59YkZ8Cx/GGhZ9t4cuFgvWQ2OGw6
	IDfoJzlaodTu9CFNxsOYqDsVGso31UfSixgj+M576SwRU0hWp3D1amrGjntREzOa9M1HZfFCqlP
	scTklLVj8sGydGLezfuga2ltf+IjVn2z8iPnQwh7/3jHghfwzz3X6LC9jlRo+XBCU7Rp/O2CeTw
	d5NySuMzGFL5Z9sjITp1bYB+KP7vxn/JjFLySfD/yREtmkPS3VYr1eyJJg/1JAX4mP0fIzEyd0c
	MEAksc0B9VTqSfbaKkJk526oKIgdzWzy1n/JujwzIyf0w6JVaIjUi+5XLYHmt4UXWtfB6Qg8VTM
	DI2m/BGtR9xbmVA==
X-Received: by 2002:a05:620a:4449:b0:939:3626:558b with SMTP id af79cd13be357-939d4924cdamr257053385a.5.1788965820554;
        Wed, 09 Sep 2026 07:57:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4449:b0:939:3626:558b with SMTP id af79cd13be357-939d4924cdamr256984485a.5.1788965815365;
        Wed, 09 Sep 2026 07:56:55 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883acd33sm44453692f8f.18.2026.09.09.07.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:56:54 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 16:55:53 +0200
Subject: [PATCH v5 1/5] dt-bindings: PCI: toshiba,tc9563: Document embedded
 GPIO controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-pci-tc9563-aux-v5-1-c9b33f56c8d3@oss.qualcomm.com>
References: <20260909-pci-tc9563-aux-v5-0-c9b33f56c8d3@oss.qualcomm.com>
In-Reply-To: <20260909-pci-tc9563-aux-v5-0-c9b33f56c8d3@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, Daniel Thompson <daniel@riscstar.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=bd1bluPB c=1 sm=1 tr=0 ts=6aa173bd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=eKs96njmx7wsaJQT5x4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX/ApnHVZon74K
 zSoOb5sCAvKeLFovHhC9pAYpK+qbn0Wcpl7uzsXLnEGVHighJE3ggvA3SQix8QlLFGjyD8CVhau
 EdJblgNl6gupAJlHI8tUSqkAGWrvrE/bdFkVsVwzQ2zPnyeJBkYjlR0YuelF4DUkzR7t+24m3Ws
 iWkDSHHtgOtOEXA/jwpdpq9MOc9C0Oqpr5UhNh6gBR19LYk/vyH4WAtVMjoN8GYi7Q2BRVFmqqK
 BQdOECOR4aink8/Ed/VXwxqnwtW8C2moYFwbfyLG7Qdb4HdVxKTDBsPehLCEGzykzrTlMoEiX2c
 042zq/FUpIgIrRUufBEIt0C1CKbGo0gob0ag6bUBn/byvHC7kyI5Rja/NmPv3XW6BwHsc0nkbrH
 j3jxcXvJLa0k27uGPMhn6VD/WlWY7lokdcixT17YjV1dXWCvS/juZNE3RuIUhvHdAAsXkt51SZ4
 UtW5vbt8lx26mcBGEWQ==
X-Proofpoint-ORIG-GUID: -e_kbIw9sQ6fPPNQAoWSQwLPxhYRIAMi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX0Rr4g/NceSaI
 KhYAf77P2NucQ+VoxImHu9Xb/KHiq7JqtoU28OfN5JLxaFiXXCWYrE08MvcyuodLYT/7Z5b4OXN
 vrh37ROFA3gFQvI6cxMg6LUGxlLDAfc=
X-Proofpoint-GUID: -e_kbIw9sQ6fPPNQAoWSQwLPxhYRIAMi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090167

The TC9563 PCIe switch embeds a GPIO controller providing 37 GPIO
lines, accessed through the switch's I2C interface.

The controller is integrated in the switch rather than being a separate
device, so expose it by adding the gpio-controller and #gpio-cells
properties to the switch node itself, and extend the example to show
the downstream ports' reset-gpios being driven from those lines.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
index f084830c6d0c..c4ebb99f50c3 100644
--- a/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
+++ b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
@@ -31,6 +31,11 @@ properties:
     description:
       GPIO controlling the RESX# pin.
 
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
   vdd18-supply: true
 
   vdd09-supply: true
@@ -128,7 +133,7 @@ examples:
             ranges;
             bus-range = <0x01 0xff>;
 
-            pcie@0,0 {
+            tc9563: pcie@0,0 {
                 compatible = "pci1179,0623";
 
                 reg = <0x10000 0x0 0x0 0x0 0x0>;
@@ -149,6 +154,9 @@ examples:
 
                 resx-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
 
+                gpio-controller;
+                #gpio-cells = <2>;
+
                 pcie@1,0 {
                     compatible = "pciclass,0604";
                     reg = <0x20800 0x0 0x0 0x0 0x0>;
@@ -158,6 +166,8 @@ examples:
                     ranges;
                     bus-range = <0x03 0xff>;
 
+                    reset-gpios = <&tc9563 2 GPIO_ACTIVE_LOW>;
+
                     toshiba,no-dfe-support;
                 };
 
@@ -170,6 +180,8 @@ examples:
                     ranges;
                     bus-range = <0x04 0xff>;
 
+                    reset-gpios = <&tc9563 3 GPIO_ACTIVE_LOW>;
+
                     toshiba,tx-amplitude-microvolt = <10>;
                 };
 

-- 
2.55.0

