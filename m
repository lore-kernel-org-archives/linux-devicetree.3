Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA6E48381D
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 15:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398019; cv=none; b=VSoY/mGdPTN5iaXMrJ0L+r/mmv6peMWDjFhAJivfsYBBINW7WWZjDudBGOAqUWpYCG2UG6ViJiA+8LYPdYsOGuTz8A1akvNRr02UT2fNyXkM9wy4dMkCMFoIsWraAtxkIClB4NQFXNQyKWhIvf7CFSSfPIkdb/JTEx85eJmRz3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398019; c=relaxed/simple;
	bh=1LKdaQC3O+xm9aTmJtKPrncrf8fJAOhX1XLDI/B4dnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OAvEWRDsLChci/zrbCqnR//sC2G7BBggkjV32sKLMgy4NIQmvIxxruQXdkyWAd8ycBb9tlODJXMunsuVOHfYE94M7pij0j19BJ0dtwRop6BYJXwVTgAg2xSXJWqBt3iqzx/IxvVIMOFKi9gWDYxdp6hnAaZ5wp8fsmYHTesibvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S9nrs0NI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KGueaIQ2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S9nrs0NI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KGueaIQ2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0Ye2674516
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 15:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DHDwEn+WIWhQ0IciLdsAkajeCelVa0Flp2Kskcti1Lo=; b=S9nrs0NII51EzlaS
	oPQDWtpnPaQQRLUIa8BGGsCw6DbMcjf6l2hropH0DVPM361GXEM7Bdfw8uKwdZot
	5dOgiLl6tw+aB+VWElqzrMmfCq1GH88Sa41UbYxNA0bYRzwTWYmxS93DiKmTotia
	mQ54DderMnj43hGaEWqkAwXXi3K/j6rpsGhQRXwbjH04nbzWP0BZhZza/lfcOIMp
	1pNrHYjjo47G5xuwQBxuKPBIzyWyFqSXimgw7Mm5av/gpzxNL3dG3wV6JYUqHGlv
	Nz6KPv8wCjTyjO36EN3wNZEWB3aExOdQV2sjiMZ7alXNteBk+XLP6itFWwR5O76z
	BZFdTQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpecs99q8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 15:00:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dc92350888so56833775ad.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789398015; x=1790002815; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DHDwEn+WIWhQ0IciLdsAkajeCelVa0Flp2Kskcti1Lo=;
        b=KGueaIQ28TLlrCw7oMSBaWfyw1ExxsYSRTlBZuANNKe4KaZZRRMhzrJ/GwSYNwRE6d
         +i6RLRUO608keZsPf+7Aio+XJoglUHTtoDQhqYucHvHElrNnqgbMQpQehIgNP820l8Im
         TCBLhVdBsgvaWsvg1q0Gst+1kRN9qFArcMcdb2gAg7ABcnhOtUtHhov+wHvfwmW0LePe
         7Iz0PxUHJ5gqn7yofX8vTy5TAQTDj8zr6A2wuXihbHGCAEMTDvaabIk/QvvBpxhIE8w4
         iNO73i2Teu+FpfVsmG6/tyXMusOXrWDipJPAvrj6tN3nL6GE6/tAlhun6LA9ApBMqUdj
         +G6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398015; x=1790002815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DHDwEn+WIWhQ0IciLdsAkajeCelVa0Flp2Kskcti1Lo=;
        b=rNtqbYQb5rva1IQUFBBTPZXPOTDFo+vImcMtlgUTjylnRwFsnaaxaosRVGLzcRkWWe
         MbBvqnjl9GoeYGmvxtF2gFHvVt+cvYO8bmBnSHI8GdcOyyooRIZlcaDaqm3Cp+bTYcAK
         4kGZODWK83zry9B8/0ep1Xx7rXS/xe+nH+wBNjQQDR4NCnDeoJCVBMs6pnJZgcAXGcNn
         uvGh6jVSZKZWK2uFFdtcv5lcJD8L8eifUR40p0nkMcOnvwZgOIM8floP84M2GDgWIBDU
         C18loG3J6g1/Qg52zLCVvH96qNCUtITqbIDKvmcL8IraM/mGnOSH5gWH1imisz4S9Fnc
         3vLw==
X-Forwarded-Encrypted: i=1; AKwUvBzYrteSSbR2U7oS0iruPttqc0f47dOhW4XlnWawLXyeAlxNuV3GMVpENKIDE2AJYppVmIL1ab2gQx2Q@vger.kernel.org
X-Gm-Message-State: AFuF++ldjIfYek2RmpHDrlk1CZ2IdFBAlS4QYemohI3gZd9MD02HjJrK
	ZZ8/mMbsDSMYVlCuf0t9vDQVxgj97+loA3tN2N+Ecuwguvuxlt9m3QD7qBzRDFT4S+rb4+jcCp1
	ZP/I3B48CJOHiz06Jw6jV72qhQvoTrsSRAxtexnqXEOFB87q5QQHPxG+egFxPubmc
X-Gm-Gg: AYBFou3sZTm+svd5c/YVwJf27Oe9QoGPwx0ikAfZTDzAMaRCnjYFqP7NV63SolTef4V
	LmiyndbTYbQ22LJLZre+STRAJm348ucrrdhuCXdtuE+fvb5a2ojoA/7YgBRaEJ/r3t0CTp+ymR6
	9dwEIbBBNVvYsDY7EfUxPe4BnsfziyAOPnasF7ckhzecWXjkYQZWmEcVj0cZE04GBr/W86cfH8Q
	cEJA/1gGNcqZd/r9EDagbo66vkZ3M4agmK3vDK0p1BYgAsVagrkIKeyMy9Sg4wmb668yzARC7SO
	yuv/Bpol8YG4g3NvT5AzuBUXFat+DBkjNVEA8gg8ksyzhgmRRGquW9Cf13HMpNoXX2DimmiToAJ
	TngkqdxQvRPjVP3s/Xa2qujujknEZf2RKI1cy
X-Received: by 2002:a17:902:ef0a:b0:2d9:4871:393d with SMTP id d9443c01a7336-2dd6c741d36mr64686505ad.21.1789398014857;
        Mon, 14 Sep 2026 08:00:14 -0700 (PDT)
X-Received: by 2002:a17:902:ef0a:b0:2d9:4871:393d with SMTP id d9443c01a7336-2dd6c741d36mr64684915ad.21.1789398014250;
        Mon, 14 Sep 2026 08:00:14 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd4007bd4dsm42943345ad.4.2026.09.14.08.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:00:13 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 20:29:09 +0530
Subject: [PATCH v25 05/10] dt-bindings: arm: Document reboot mode magic
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-arm-psci-system_reset2-vendor-reboots-v25-5-4aaf5c09b5c2@oss.qualcomm.com>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
In-Reply-To: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
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
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789397948; l=3255;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=1LKdaQC3O+xm9aTmJtKPrncrf8fJAOhX1XLDI/B4dnM=;
 b=9f7VltXLt86w6F9+EGr8WWpUIDOdDKEqN7YWpUaS4nIV6sFJpeL13CNDFTmp4mRqRZO347vQt
 fCuknKj9CbwBQX5SYiQx+DzSwdtAWrzVzAFYgN2Gc7+Nd//a8CWe0qk
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfXwaxdrASahGmU
 TrUsZyhr1XEaYNoBgIW7ADwtLHrOlFQFzhkP9lRVuIEsIsxii3afMTlB3WXOrCSDCrBAOuKfIHy
 CPRvnuyFhu5wHcBE6Hi7/0+CZ4ppBIM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX3eiXRvznTXUE
 v+HaYSbLE7qddGTdHriE90ACNUPQrnp2caD7uMESCPsN8PJQqcc5mM7vAMkcRVgvcsapw/hIznZ
 vOcPkb8KcBFe/V2RSWKJLCTUOjZsFlK/RGM6mzbTycpe8WeTm+nHbxuRK995GiKcnQEv0cj8aYR
 w4EGGszbOMm1c+Hz1V9iAJItxXxQ6JPikuhr0/63j5IEIpfahiDc+TqKwNCegTQi96tYwQZMKzf
 Nbkx2qjbuad1NGTXm067Q+b/c3QH8jvEweTmTKsxJn7bMvfjNhAKIrSrnnCwsD4l6kH1j/6U3ty
 dwLEyYpveQJ2q+hV6JQQI5TooG/jqJhfMAU1XjhuGK3vfhfxBJGwjKgCktyCqkCNZ2Turmzo4xL
 AUgrhzEtFleuV2ljPh4SWOwY8wlOtrayhq52YSL2Oa50qdSKSvBoYcsdaEjxafsZRdnzDr3Fprs
 Ol3PiszMgO+U7RPhzEQ==
X-Proofpoint-GUID: IR76pI00CS8CZxlbVS4IEcwQqmV-88YI
X-Authority-Analysis: v=2.4 cv=b/cncdGx c=1 sm=1 tr=0 ts=6aa80bff cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VHtpXdJELXZ9Nr0wy4oA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: IR76pI00CS8CZxlbVS4IEcwQqmV-88YI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140215

Add bindings to describe vendor-specific reboot modes. Values here
correspond to valid parameters to vendor-specific reset types in PSCI
SYSTEM_RESET2 call.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 60 +++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 0d04389c81fa..8b6a28b81ed7 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -98,6 +98,43 @@ properties:
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
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 2
+        items:
+          - description: arg1 (vendor-specific SYSTEM_RESET2 reset_type)
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 0x80000000
+          - description:
+              arg2 (cookie_lo in 2-cell form, cookie_hi in 3-cell form)
+            $ref: /schemas/types.yaml#/definitions/uint32
+          - description: arg3 (cookie_lo in 3-cell form)
+            $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          Describes a PSCI SYSTEM_RESET2 vendor-specific reset type. The string
+          after "mode-" maps a reboot mode to a vendor-specific reset.
+
+          A vendor-specific reset takes two arguments, a 32-bit reset_type and a
+          64-bit cookie. The arguments are encoded as up to three 32-bit cells.
+          Each mode property is encoded as mode-xxx = <arg1 arg2[, arg3]>,
+          where:
+
+            - arg1 is reset_type and must be >= 0x80000000.
+            - In 2-cell form, arg2 is lower 32 bits of cookie.
+            - In 3-cell form, arg2 is high 32 bits of cookie
+              and arg3 is low 32 bits of cookie.
+
+          All values should be provided as per the PSCI SYSTEM_RESET2
+          specification.
+
 patternProperties:
   "^power-domain-":
     $ref: /schemas/power/power-domain.yaml#
@@ -137,6 +174,15 @@ allOf:
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
 
@@ -260,4 +306,18 @@ examples:
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

