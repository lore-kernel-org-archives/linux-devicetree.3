Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F6C30DEB2
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311376; cv=none; b=DzfeJtk9JPd9vu2zXjGQ8w9FpN7hM1mBAl1oURcGend5EZNzzlyv37d9bEgKuXSbBDuQfx5BhROQzAZ1FE27Hy+xKqKOc3Q88VUQwSry65v/irlXeXutUXcYpl61LvMxc2ROB3fvSgIXD9OrNjA6xt9Ch+byXKS4O58wkaGpPOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311376; c=relaxed/simple;
	bh=yBVN4FEHADdTSQ++LEmhmTEyByZ3pz1DEJtf2+BqO1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bchgDs0vmRM4gEHsunrxzfoK7HFlmiFoxDsYVPCVQ4KPAfclk2MaVdJgG7VuZKzUPCBswdXy3Vf1A7LoBlHm4s/EOgcKa6oKB0QHHSfbMWbnEIX8UfevpUZhINSW/Xa4LLo4dKQmCx9Lvm2UexbMzb1yVVvxPIcGoPesBcZPeek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gIabg0Fw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=akNrQzMb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gIabg0Fw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="akNrQzMb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RD5q3v665646
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:36:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PO6gg0/IWEmCTv8xrfB/fKl5SzRNa5BhzNOETtSDJoo=; b=gIabg0FwLPE9SRzD
	3tRU9MsWqNjMpmEiRRi/3sk83rdVBYVO5cpgUkPZDn87Yr9f4IT3fEMVshLO5U56
	9BKM+gB23Fi4JYl+Z5msoS45PR1WyxNarhcke91MbRu0tRY1IZ0Jq9QJRRX1JZMQ
	G+1MxNiV9OX9MjVo/KLF1wncTKJP2y7ZaqRAWIRhMNvBzpVqgfWWxEKpNmLGX9wg
	slxAeFSw+5trK6XrLkcoDOVLdQSlGy8j41NlGT9NZcT5l21dS9jm3S6DSTSmTO3f
	X5jyMGYUFeFz10iuXd5WdNrzhuXJUKz3Q7OK4V5l4rcluTtswwGen0Z9I49CNEyc
	+IUupQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt30n2j94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:36:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2adef9d486bso96123635ad.2
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777311374; x=1777916174; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PO6gg0/IWEmCTv8xrfB/fKl5SzRNa5BhzNOETtSDJoo=;
        b=akNrQzMbPhD7AX6Vp6RbVcbDEJqPbXRRzDJQ+iHkKs8lvdS6L7EGll2ku2V6aSl6bd
         gfvGSsaveJvkZLtvbxIvH5tO1Fof64nYIEd+/iOxeT484EoNNi21ibeDmtDYnG4qlNwB
         q8LdtsjIES0F0xJKiLeHlGNgLU02iuPQuFfILB+C+S54q3/T4LpU/+XOhwwNekGqAwF0
         XiNmfGDlsIWu1cBW8xlDXm13PCe46tmv6tNd0MPRpwzg1bA/gTCn1wTjW9iUv/17qq4i
         CaUVtxV/iS3KaNESWjQTr0aidTmYdoqu5ev7wNuMqe9BefX1GrnBHjMs6C0uWXs6y4BG
         3TRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311374; x=1777916174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PO6gg0/IWEmCTv8xrfB/fKl5SzRNa5BhzNOETtSDJoo=;
        b=NR48jlAZWm/tvj8jW5cxB/MnYcSmMFnxSY75MQC3kN8IJiCToIar+SCtzAPWtp4cS6
         gQoQGo3znMVwzf4x6i21aNqrhsgQltxEW/xklaLT5+Dxoo4UBq4R4q4bfDtxFCbv81Ps
         NGB1Zxl5cM7esj5wLnDMaUMr+VbcwGzAwBfzI6mDi41N7vKHRQFzvpLp+iziDgWOdmM4
         3JPCEcacO5sIa+q2lrhrC96cbAyiWYosNSWwC7cGaiZQmE9wZm5eTUpgranekssVqsKq
         FetlTDQdHsoQWV67tMGV0TwY90Y5ak9pX0U/UI3FrkO2wClz5nh7/ql05OMmkqqe1BY9
         M4nw==
X-Forwarded-Encrypted: i=1; AFNElJ8VSBBl96CBMaybTAUAXPWOymj9zovqwMUiLjA/NcCVkVVK/8XvzxBoH2iatcSHbFLhTVU2tCao6gVT@vger.kernel.org
X-Gm-Message-State: AOJu0YzymCtM1qpZLHM/9mWho8zpELYdiqPoDRQ3YG25ueK/UEau/GXj
	QeJDYbIfwL9uu9uMuWSz8Y1bM+PBULVLS7A0jXGc21yofzVPp4o/7iHg5++hyOM8wmMngZofIse
	DT8PSDoBbSl3+Vx+jig+t3SWi2W6/GnpwFYJf7K0IzhBj2AXY6LaW6xsh6rSlRzta
X-Gm-Gg: AeBDieucCJIt1jJ8db5oZHm85gtMmV7Bb7ekePJkV2iE/tTmMPr2xPou9sMKDyEs5Cz
	xWYeqc8BIRLAEGLxrGM4yL0CWKy7/yIZ8by1KTi+MzauHGyMINP2jLD+WtqkQwMfwVU/urHXPko
	5Gi6pxrGaj5e3uBbgsrBtAc+IPvcKzr4SGch/SyfhqSHkn4ic1iLb7HtazTPJ5wp3ZgdXX6K8pB
	oqZRwSLfOqjoLstyyojP3v83Lqamn3UC1glC45ENzKeDj0CWnhAnfMpdNWXDeJYeG36hKnZ82f8
	2x9dpbSlbu3M+UD6ZgxYQhS90uIvlOWvaDxEAIeT7YBt1NiKcgyoOhlLu/vjwoVOCi/xTO5VF2u
	0e+9zDzZuthAQSofQMBsPCv3ySzafiCQ6mMMToF44VYE98JWtgZuCSbxrGGEDR8P8zGoe
X-Received: by 2002:a17:902:c40a:b0:2b0:7d3d:756a with SMTP id d9443c01a7336-2b97a951600mr1695665ad.35.1777311374239;
        Mon, 27 Apr 2026 10:36:14 -0700 (PDT)
X-Received: by 2002:a17:902:c40a:b0:2b0:7d3d:756a with SMTP id d9443c01a7336-2b97a951600mr1695025ad.35.1777311373686;
        Mon, 27 Apr 2026 10:36:13 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aca8369sm329115ad.75.2026.04.27.10.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:36:13 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 23:04:46 +0530
Subject: [PATCH v21 06/13] dt-bindings: arm: Document reboot mode magic
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-arm-psci-system_reset2-vendor-reboots-v21-6-dcf937775e73@oss.qualcomm.com>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777311301; l=2477;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=yBVN4FEHADdTSQ++LEmhmTEyByZ3pz1DEJtf2+BqO1w=;
 b=lmkiWsLFoZiVy+q+yRqg9SpaKjLQxt8Mmp5CQJoF/Ii4uoBHHfeoTnxYq/6ce9i3yob3pcaPr
 anKDkGgjULpBrTuJ097A+tFD1/IfB8Cv6S2JKHq6y8M7Wxpx75aljAe
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4NyBTYWx0ZWRfXyFnpaGz9wyX+
 v+YpJ9+3LBYLFuQvG8XsbfdUiZBguhGqAM9Qm0ufZtpZAJmDke7mHNub9lez4Iz+mvuHVEGtYRt
 AMC2CR4GWAAzH7EDkv/0gYEdwGUzoIUeno9MfjxmACx7eXlAQdMAp9Gfw9329HayZjIGrgJ2//f
 h8m3KLYhubKM3mgPeZPqwLb+XzYQYrl6yDNG+i7tYtd+gTNqAk4SXNYRs3n3DyHlTNRj7pHtHIH
 KuIRj++oqy0+Qv4/rIJ7YQrB6kU0G/ixlVmCOWMMrFF3Cs0/5sWoWCumlWcosIRwOsrEVlj0aL0
 Lh0FpFUPK04ziJZblk16FYttfQqWnZ7R+NadQTae0dfSs9TcV+RZobzRa7dbWhWcmI8pMP261rl
 KrBQX2GeW21Q5G7oJFzkG0dAguWQmDfW2AsdKfpSWZpGmS8gnV4JKZYZJyjReQHfRqR9xSsObwo
 l8qZSpPEhlcgzl7mL4A==
X-Proofpoint-GUID: 1vTnDrAuxDUNx1wnXJxDBmndUHBygbDg
X-Authority-Analysis: v=2.4 cv=efANubEH c=1 sm=1 tr=0 ts=69ef9e8f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Z1E3qa2j_4PWJv3PNLYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 1vTnDrAuxDUNx1wnXJxDBmndUHBygbDg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270187

Add bindings to describe vendor-specific reboot modes. Values here
correspond to valid parameters to vendor-specific reset types in PSCI
SYSTEM_RESET2 call.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 42 +++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 6e2e0c551841111fbb0aa8c0951dca411b94035c..5fdcbf331ea5620363638feb6f8105427a87c00f 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -98,6 +98,26 @@ properties:
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
+        maxItems: 2
+        description: |
+          Describes a vendor-specific reset type. The string after "mode-"
+          maps a reboot mode to the parameters in the PSCI SYSTEM_RESET2 call.
+
+          Parameters are named mode-xxx = <type[, cookie]>, where xxx is the
+          name of the magic reboot mode, type corresponds to the reset_type
+          and the values should be provided as per the PSCI SYSTEM_RESET2
+          specs. The cookie value is optional and defaulted to zero.
+
 patternProperties:
   "^power-domain-":
     $ref: /schemas/power/power-domain.yaml#
@@ -137,6 +157,15 @@ allOf:
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
 
@@ -260,4 +289,17 @@ examples:
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
+        mode-edl = <0x80000000 1>;
+        mode-bootloader = <0x80010001 2>;
+      };
+    };
 ...

-- 
2.34.1

