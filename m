Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264527;
	b=v/RBmxeUD6Scxv8nMTrzT2HIgI+ehLBQNTIxg2lALb6hZqcj0aSnNoitHWsi4wLu1RMr
	 /lHuc+H0Auh3lm6p8+E3UjQEdExpOcQUWgwk0kxZBz+ACs8j4yuilRtI+vBtmm1pTbWx5
	 mPhP6aTdQiz65BCzsN7HgHBiwsleIMK1w2dwY/aEZzn8LE5HSjogzOaTi+Hzht5SG+GNx
	 9buBiWfRnxUjLH2Hvvr1QYfJtbukZc4QAwXXGyky/FW1SeAAA/pZvReh2pxSrBRPkwpcD
	 tsB5ZfPaVHsGRuifgNv/ihjUdqJuV8JAcCJiphKvzxV/Vw/5FPLSvs42k6RF1rNrtJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264527;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SaegZ9+Myhai8ugI7bQJbLZnEb4ZbtFQqLe5y8eXwqc=;
	b=OP54WSIKwQfSrO/98hOakBiqC2VgOgC8IbxjbCdvX9sVpaTKrHlBH9e22abMMNqCbsL+
	 V1m+0d+5o9TPlqiENopAuQlZpMckxDMY8zzljkItl7nBCXDtuCHeMUbMikje1MHZuUbLS
	 Wtf0wtms2na3sCsG8HLiSMYccZQP0p319O5G9aeZ9nWMQ2eOwS8j+D/KY/3fiBguLcJUD
	 Ye9L+YRdWbDh0ntmimp78Z30qAg0oLQ1i8vH1wvrF+8YCOtUarim49dNJHmGoQmq+vtYV
	 dXvPB0txTyjDwmrN8K5oEH4vFbvLeGTSyCG9fRMkJIRHWcFJuVGVpx8s03ORfIeStyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WySbZcI+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bguCb2Jj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857BE606A322
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 09:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 857BE606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WySbZcI+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bguCb2Jj
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8v9Xc2725081
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 09:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SaegZ9+Myhai8ugI7bQJbLZnEb4ZbtFQqLe5y8eXwqc=; b=WySbZcI+8afrzpQk
	ML1Y7Q7bN5nEfvXGA+Jj9n5kryGtvJzhklTEoJVHe9P3fQDJ7mfXqurHBecdUlbH
	D+k5LTwoBKvoxsmkU5GB46KyyPJJO/M3ojDgXutVYOZoB2YHNk+9nmGpRstkV1uK
	GMd2sS3+bz2POenyn4tgd0abhzKcwZYnRWcwL7iBToTEMF5ong3kIRi6GsjIq0Jy
	71lUD9JiNcV+Id8yAU4cwEcsdY33BV0ipLrjcJhVppUQrJLH7UEUzvdV06jvBwGT
	EG8i9WuymuT2CS5nUdSPVg9HrROSD/EItOcs9SLfpx8BrrIxGGoexZy8dEoWP8qX
	5KJf8A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hky5s8wdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 09:02:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae1d132d52so1802080a91.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 02:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264524; x=1793869324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SaegZ9+Myhai8ugI7bQJbLZnEb4ZbtFQqLe5y8eXwqc=;
        b=bguCb2Jj/UNkoJ9f1YU8i9K9reLVjv7Ali8ycVXUi28v9hobyZYcDdjZEjneYae7Q3
         ATOdo6yE91UPY6Nw8M2UaVXldcCifQ87COA0b+nKDVLIBHDO3f+CixgSmkc4w2IoXBn/
         xcp0dmuQIAvRIqpwQQ/H+UE6+KC0M1QONh2983pj1vBVzRQNp9uGEqhi9pqun+2drXNN
         OEn1M1RAsLW06qOrCuBAD9pVw6LtdLhegHUsD9XmNbdSzr2UljN0JLw9BEOnsfKCyL/e
         EDiO9W3yDX1uIka22FhkYSl7EuuTok+R/AGERNEBossh9iXiRCl3335vFmNtI9gawugR
         4+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264524; x=1793869324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SaegZ9+Myhai8ugI7bQJbLZnEb4ZbtFQqLe5y8eXwqc=;
        b=20heL4HXJ5YwuMLlmD1Nlt+Ynp8EiCsdWDt9xMTi4oFgcxfHc56MFBHSiaBTigj+G5
         SiZUOZ96dQ6gDukGCO3Vg8cdQUR09jpLflA9fM+lrgVDTbG9Go3UFdcOKc4ecdDFK0Ds
         BVT2FctecyFTpxwOyIqZW5hPZvMu5xX7djg75hiz3FEE/zdhbsr6CtjCB/3O605M0n7T
         YVq4XiJ94za1Una7oaw/+c78ZiBpCLBeaoft+m5lWglPIfJP7BDNVDqNECpK3LIW5XsR
         d0eGPMGVLcEXOomPoEIRZgmHGrT7yX66yhNYcrC9LGzZocwubne8aaiwLz92gE0jkDYz
         HWhw==
X-Forwarded-Encrypted: i=1; AKwUvBxfA3Plksa48H6LMBoIBtmoEl1ONJs/UhnUIuntHcYpFFqZayNjqLvJGCYN+DvkSzEDW6BboWwbhwz7@vger.kernel.org
X-Gm-Message-State: AFq9FYKWh+i/JBD+nXq21zf5yd4yvxLIH/YnCtjNp3f12blohckO2+jV
	F5t3cS3eAWv4eEIxeU2SswbNaxXfgRoogr43AuVOJDq89igAhTpvFWS+Rup4jq+FBoULA/OTX6a
	5V2xAkq2eRCIJ06jWuAtwnqItxr7BwR8ofRUvFcDmqL1q7R1pJbPRcne1VXpCYwxU
X-Gm-Gg: AYBFou23GKPGm6SNS73QDU7cEdm3T6e7jAqWcOCu6dg3gRj/zIxFdCyU+1bTLjnjh3Q
	v/a09jzDrw+B8LrkDimNpiY7OHjOVN9tOOpyMk2unozuGofqmcPKGY6yNsep6Ni8MAIKkfEhpZl
	61tDMrLV03GzI5cTTNkEip6ayR/DdTE0PJ7ovAkHkxA4fnJtEXxko0eO12Qp25h6/ob6SnFqoBc
	S7L17BBG/rRAbmi7Ty420Wek9RIvXr/Df3xosSPDuAtlwfx8yG8rfdAG1ovVx2sdVoV4gsukV2c
	HCoz9zpI+t1OBoAF6LsEumP3hyIU0Je/PvNjhy+bDlN7HTTUbN1gAYdFBtLLynDjWVhTVytXnQ+
	M+/O1S3YCn7APvngB9QcTzlJEwXigZpX3z+aZ94uMMcjFvhX+9X2bulaGByss92f7KBa11eGyD+
	7hAFzLoHN5
X-Received: by 2002:a17:90b:5386:b0:3a2:b16d:928b with SMTP id 98e67ed59e1d1-3ae5825051fmr3869171a91.46.1793264523897;
        Thu, 29 Oct 2026 02:02:03 -0700 (PDT)
X-Received: by 2002:a17:90b:5386:b0:3a2:b16d:928b with SMTP id 98e67ed59e1d1-3ae5825051fmr3869128a91.46.1793264523384;
        Thu, 29 Oct 2026 02:02:03 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7ad710sm3197385a91.3.2026.10.29.02.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:02:03 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:30:59 +0530
Subject: [PATCH v27 05/10] dt-bindings: arm: Document reboot mode magic
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
Message-Id: <20261029-arm-psci-system_reset2-vendor-reboots-v27-5-fa4b3ff1359b@oss.qualcomm.com>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793264458; l=3109;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Cocw8yqxYsC8f+LcKoCIzML/tmVX3vxCTN78aew4Vgg=;
 b=CndWAYSCONDUqL9nIiAiDUAvZM2ja3u7IKu76ZeNE5zbHXufpIJ6xe2m/zsaMxyDqVINOzfbE
 TQ6JqtfIfTAB32c1gOkFYjPzY3i2fxEW1DztsF9Q+t+7i/D9Ommnj0f
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfXxHZjEjnqtpjF
 ZWGOv4XQz+qpJPNl1YDSvzYh+DD8RLmmDCEk0/z55JRn0RTnuotUK/ocsecjCv3PlVzMJxsMrVn
 TY7AgAXsCLzqqa9EgPP/FA8XsuTOw6tmItw4lPyCSpZuWs6iD34UwJekDxGzu4Q3425IQEeqRsB
 onE4UI9hTjGp96P2undtuDKGQD/YdBfauqu/bLnqZ0Joo3iCPCpins4G9VTFNlS7fbI4FZRiD0I
 wRkLG/skahGbvBOQYgJcLeqmHOo8+3hjSwURrVajATw4Hh+kujwaA5tZEulqDlsqnfApKznqTFb
 DJyzE/SfPtpfOPENIkT6coWzQt+A/LFXBnkxcu+sF547/QWQN+7NTaCwTmg98U9YIVJbL1FrMx4
 DzvleHuXU0YjsjoBavff4z9Ss6PXUFjSrhzfSifx3DB3MUps3N4NLartGjmWJtwwmaI5lwUDuBY
 0N10ZffqPv3gcvmabng==
X-Proofpoint-ORIG-GUID: 2T-s9qroU5G4_OZYpq2rTOv5eIqvvfOS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX4eeuTpp1Q31L
 7NTQy0Yki5HExZI1U3bR+YAdBYdo4Rpos+TO8i/RCJxbMv5VcgfcqggSN7O32tgx6dxupNgAlW6
 /ucxBpWMKE0Or3MqHrchkkdY9Mv3kDY=
X-Proofpoint-GUID: 2T-s9qroU5G4_OZYpq2rTOv5eIqvvfOS
X-Authority-Analysis: v=2.4 cv=f/vdl+yM c=1 sm=1 tr=0 ts=6ae30b8d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZjyxHfqtAiH8XHGUigUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290034

Add bindings to describe vendor-specific reboot modes. Values here
correspond to valid parameters to vendor-specific reset types in PSCI
SYSTEM_RESET2 call.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 56 +++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 0d04389c81fa..82ae25e7a338 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -98,6 +98,39 @@ properties:
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
+            minimum: 0x80000000
+          - description: arg2 (cookie_lo in 2-cell form, cookie_hi in 3-cell form)
+          - description: arg3 (cookie_lo in 3-cell form)
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
@@ -137,6 +170,15 @@ allOf:
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
 
@@ -260,4 +302,18 @@ examples:
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

