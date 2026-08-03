Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C733822B7
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 09:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785750341; cv=none; b=E0MM8+W02qGDWOAWLdDLbGHjSXWAeMHeBPjsmOxb3K/vkE6UJQe335pYdp5TiCILwmazQoRuXhOkW+ysDl7aszhmdp1Mvyb/RYAAI86J3nQ9d5VHADkurHJyBLhVo5jZkVvQ+fpAXk701/Uw2ivrZlva3u4x/m2Nx9tGnzRwZlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785750341; c=relaxed/simple;
	bh=jx181RVT+Xa3QJe2eg0re3HefIe2r4k0bcdeIdeVIYk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aCG7Zc1s4cRD/hHxlb5kkXSrwSJQXIw7e8SBPLQedSfnjgihdi6cqCHQlzUcHie85sYhVAhORckStr9FG4/1fs5SNcU7FNJN98JpElInPTwMkE4fdyenBC+zA44ETiP92ATr3uuUXvzW8WYYQJHy9nhhyQ+puZNPIVWm3XVwbTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CLhBfX3A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qjyi66Xv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CLhBfX3A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qjyi66Xv"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736Dg1r3882726
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 09:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yv45iK+EJbGOlrtao0TiTSTpdAWP/+S9LANR6C5Wz5c=; b=CLhBfX3AmtRTNkLt
	iIde/hqO/gts/Wqk2Mg8iV4Yoo4OYdP9JTLto7pabGM7TDY6G33LADCMuTL4TL+K
	9ci8OpngdrQyJqhnkhzlCEOqSyf18HQ5IIwFZhHpcauoSlPNdp4DxX7ntJimVTw7
	/MvxD0bYNzZRCyBbKGvG4A00iUXCUvZ8+gfLpXPn9vG/2eNDeKNzvp0CA0BILxYZ
	totClmRlREic6+ovDIMAluL/Wdz+m/k6pRTSqQdFbYZ8fQhgkekboSazWf2jgw19
	Kfh7oqzMALT82IpI+90f7QKG3KlqdU+mMK/OXk6K/ew3r7fzalDuhBehE+ExBjYL
	BdRiIw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhkgwem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 09:45:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so5214102a91.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 02:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785750335; x=1786355135; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yv45iK+EJbGOlrtao0TiTSTpdAWP/+S9LANR6C5Wz5c=;
        b=Qjyi66XvxLWQLzFRZujiGXg3hEwIFxYOfvSS2pVCIXTy/mzdwg1lE6rS7n+1MqjN/m
         uqRSt3oe4xeuHqc5/TTwf3iX5B9pOsnZ1oQWzp5SKGuf7d42rwJgS//6W0MRV6Hq9LWE
         yG4JBQ6B+gzKJjbz0a8ENuB8ukYlLZiJhWQZjJ9EgTq4mptMlHVprSWj+1/PoRLAW64H
         nL5NRmufafZPssKcG9/61TsrqEQbjIkJi/i8LE4c/Cqm0Hnojg4ICU9xV/o07YiqNxH5
         sB7dIVSTY4b+tLgRdhYYjM1RgwB1l2Hu+EVEuIJFGqjz5Qh77PQWhUrA4fHaHgRiRU8o
         aEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785750335; x=1786355135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yv45iK+EJbGOlrtao0TiTSTpdAWP/+S9LANR6C5Wz5c=;
        b=AhwcFAjjbRXqSZtog2yN2DXmf3ZTWDoiN8xcvkUGFs9gHAgMbAORQPz/ty9/5p6b5T
         IIpKxiNwdLfY5UdN6Sac8r9RU8dElb1LYZjghoKOiwgKRZMF5840fZyMM1+ZGJKX0MzL
         ox5E3nPoMz8baG6n8SQwBO7PNg/8zurSkWnx6zYETaSrxU/vKVjyOCHwDQg1WQG+qmoG
         vAQWBR96T0Z9NDTt2Ni0Ryjm+/3S3EhOY/2M//qepPvIQk0FhDk81fqoIkPPYG0ZeoDD
         AigdvMZMITIqFDbzimYFx3WQM0e0fEafcfoMFYFDhWyz8CRSqg+qdyD5Y+nR+fwdr9Kq
         9w4g==
X-Forwarded-Encrypted: i=1; AHgh+RqP0lkgVZaWgFLS4/i3kFcVILh4Uv/z9+Tkud+MrXTtrmp3ieoNboxunAwrXUipdaFawODoGtT2KFQ7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7nJ2Pz2Dz+Vv8c1fv71v40rX3iq/md5jehCaTootiHWSR0W0T
	pnlvCc+OBJxIZrzKwiyxDRwUFdx3kk96x5yXSTEr1bCLOAiXeZw8PmItVKejo0D/8QE9HXU9nb8
	QwDkb48ejb8H241chCXgPDk99qe6luLJT25a+Abxm/g8aKEu6FucgeBaY/s5Ez7QQ
X-Gm-Gg: AR+sD10vrojiRqvmRBVM6ySuF83+MEk9zNQf95gSB9SXdHpBaVIRbQ3zl5A1gCEptwl
	MJKTHL5BR4sWGodG8EgvQ9Ed4BLWLFdBGF9nZBTcKNIFeNYWbqOjsbtgKV/14Vua5MzQzkqI8HR
	YBBO0Kk/jqyrBIhMq/aX1xsjoIDAOd/wbe3AhLVZ4lOvNu4UKg1VOjNhc16Ux+4f5LvVjLTJGz7
	7CPWGpZ0yqj3M/2EaTT9+rU9sz4H9h2nekRulVq/uQhXLg1dgXfIEmoEqgrBiv+cReJ9O+G/yaP
	/o/UzaJ16ky1+u65PhZN6EXCdh1w638if7B8fs6FcT0spP0QMruB9abQjPs5OX1HSESj45EHJi5
	2Ay1doHfrGnN8RhoPbeusXkVnhcIb4KAjru1r
X-Received: by 2002:a17:90b:3c4a:b0:389:8f6c:4d58 with SMTP id 98e67ed59e1d1-38fbc579dd9mr8679810a91.34.1785750334580;
        Mon, 03 Aug 2026 02:45:34 -0700 (PDT)
X-Received: by 2002:a17:90b:3c4a:b0:389:8f6c:4d58 with SMTP id 98e67ed59e1d1-38fbc579dd9mr8679766a91.34.1785750334150;
        Mon, 03 Aug 2026 02:45:34 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2be6c8csm3660671a91.13.2026.08.03.02.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:45:33 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 15:13:36 +0530
Subject: [PATCH v24 05/12] dt-bindings: arm: Document reboot mode magic
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-arm-psci-system_reset2-vendor-reboots-v24-5-889281373870@oss.qualcomm.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
In-Reply-To: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785750274; l=3217;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=jx181RVT+Xa3QJe2eg0re3HefIe2r4k0bcdeIdeVIYk=;
 b=ZUjomEzxGruYUFbeJModicvv9K3qeDt+KCUFH3eB+ladIDrsKzjpKb5KbaPCEB6A/khOSHHtP
 VPUuqmEgLKlAAJBPJ9GFsYbZlfmyR95GIt/pHlobN6539b7mgJz2slj
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: bWp2TcW7HGI3WVe4fqBWJAQDXnqQBF66
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4NiBTYWx0ZWRfX1poa+Fsc+wo0
 Da5VRSaXqWuBCGgxS9M1jxyERfm5zwTJdstcSW4Hfc7WVGgHXsSqvXnPMljnCz27cR24HwDuPqz
 ITMynModprlPz77V+mtmI/eD+JJf/RznNk3dNhG+SXeDO/WcnxlJ5ACZtsVq2mgjPWU3Woowh1/
 NBdminZlb5bcgSSnlpaxd3xtByy7PskgF1XVBGseWN7asChQ5xj0g60WDywafZckFnFwk6NRGRw
 fvkoLe9u//aFkJjKaEAsZeKMOiCt1umRwZHI0+XBC4xHKvzpbU9tIFENDiZ5cIAtomPWC4BCEuI
 swbFcRAHD5uVSy7OufvGlfUE7Bm6Eyq8zuxPub9wXqbFEkV/3i2oUfONUqsMhhxk8vKz9YBYwl5
 GmuwFyZBudmxtbn+oVHg6yxf0U+xZ18m5VSa1TQXiTG0H9/Tk6B+QCcL+HL2IzdSyGOvRb2BYv0
 wB75CeLZsnMhNrvtToA==
X-Proofpoint-ORIG-GUID: bWp2TcW7HGI3WVe4fqBWJAQDXnqQBF66
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4NiBTYWx0ZWRfXy4b+03DX2rJP
 HEntByL5PoS4dqNPaAbDgvfDrdAjeglDPfiB1DJsPmFiBvxlCO0rQSZQoHCWPCv5Pda7S5JnwUA
 DwOVzpJ0OZ2Vno9sC6UpkWqSGt6KSpc=
X-Authority-Analysis: v=2.4 cv=UIjt2ify c=1 sm=1 tr=0 ts=6a70633f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=7Vk81bxoM4tuurpRRsYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030086

Add bindings to describe vendor-specific reboot modes. Values here
correspond to valid parameters to vendor-specific reset types in PSCI
SYSTEM_RESET2 call.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 58 +++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 6e2e0c551841..7d6a86690a2e 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -98,6 +98,41 @@ properties:
       [1] Kernel documentation - ARM idle states bindings
         Documentation/devicetree/bindings/cpu/idle-states.yaml
 
+  reboot-mode:
+    type: object
+    $ref: /schemas/power/reset/reboot-mode.yaml#
+    unevaluatedProperties: false
+    properties:
+      # "mode-normal" is just SYSTEM_RESET
+      mode-normal: false
+    patternProperties:
+      "^mode-.*$":
+        minItems: 1
+        maxItems: 3
+        items:
+          - description: arg1 (vendor-specific SYSTEM_RESET2 reset_type)
+            allOf:
+              - $ref: /schemas/types.yaml#/definitions/uint32
+              - minimum: 0x80000000
+          - description: arg2 (cookie_lo in 2-cell form, cookie_hi in 3-cell form)
+            $ref: /schemas/types.yaml#/definitions/uint32
+          - description: arg3 (cookie_lo in 3-cell form)
+            $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          Describes a PSCI SYSTEM_RESET2 vendor-specific reset type. The string
+          after "mode-" maps a reboot mode to a vendor-specific reset.
+          A vendor-specific reset takes two arguments, a 32-bit reset_type and a
+          64-bit cookie. The arguments are encoded as up to three 32-bit cells.
+          Each mode property is encoded as mode-xxx = <arg1[, arg2[, arg3]]>,
+          where:
+          - arg1 is reset_type and must be >= 0x80000000.
+          - In 2-cell form, arg2 is lower 32 bits of cookie.
+          - In 3-cell form, arg2 is high 32 bits of cookie
+            and arg3 is low 32 bits of cookie.
+
+          All values should be provided as per the PSCI SYSTEM_RESET2
+          specification.
+
 patternProperties:
   "^power-domain-":
     $ref: /schemas/power/power-domain.yaml#
@@ -137,6 +172,15 @@ allOf:
       required:
         - cpu_off
         - cpu_on
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: arm,psci-1.0
+    then:
+      properties:
+        reboot-mode: false
 
 additionalProperties: false
 
@@ -260,4 +304,18 @@ examples:
         domain-idle-states = <&cluster_ret>, <&cluster_pwrdn>;
       };
     };
+
+  - |+
+
+    // Case 5: SYSTEM_RESET2 vendor resets
+    psci {
+      compatible = "arm,psci-1.0";
+      method = "smc";
+
+      reboot-mode {
+        mode-edl = <0x80000000 0x00000001>;
+        mode-bootloader = <0x80010001 0x00000002>;
+        mode-vendor = <0x80000000 0x00000001 0x00000002>;
+      };
+    };
 ...

-- 
2.34.1

