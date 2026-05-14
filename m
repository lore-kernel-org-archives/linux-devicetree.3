Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF420401491
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 14:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778768883; cv=none; b=Icgl1PtvxCNpYCIOvaEoGUv/Ax2majNI+KdegJePLJhce6F8B4b2dNE9H/1g9q+mvqn9XLjBviCooleK7Q5lvdJ2JtAMbs1RMB+SQPqxKlb/XkEh0ArFDS1mFe069BJQGIdTX92suOYOt7bSZtm0SMTOzv8yHIsKMEtcPAllL24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778768883; c=relaxed/simple;
	bh=jyTFGQNuJYDeqEOF9acNm3SghnFKZKEJruoHnHRlxUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YU9I2e0bwVI1J8Pc2EHDb8xbycOPiVi3tEn4RnRfLmJqtzPIfqE0JLZL1bxEm7q6HcDZgJ1rWciqHvpJA0Iqe+qx0jcDGh5YsFzB1+6saC+lXv0ByMlUN6YY+vnLUR+XIg6A7SZ3+dEopuoP/Yid6EgzU0kpcKoEmwl08GH/W3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PPeFw+1i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDnypQ8o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PPeFw+1i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDnypQ8o"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeZ772261600
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 14:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZTI9rMPHkHzypbPrqZDsxdlgYSjaGzo8RGPBYAYLgmI=; b=PPeFw+1iqoK7i4yD
	fpYlsdG3ljxy+3sh4dPRJHCnF1kZZGq0pbTpOg6NpRdQnSQnalBmZl2m4VZwwo1W
	MfzxtHAegc/+9SunKU+Yza9G09LpF1+4WTvkFp276pddt5T/Ffest7Agvw+WrGVK
	Qz/pH7Opwlpwx6PHf7TVBEmoBJiyXGRD+YRmn0crjUbP+XnTIxB3lpheVxqZM7oE
	eBntI/3hF1xM5qoKqAznBEJJKBoHgbh1TQNYfKaO/a9SXzL86zUNhyALPAU6FvYI
	P0CUSed9YbKmaj4JA5KN/+HqBZgNFHcZlK6KOCQg0nu3UFAGQ5BmyxunGVcpTB7T
	9JV9Sg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e563hj7n8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 14:28:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b4654f9bb6so83928815ad.2
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 07:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778768880; x=1779373680; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZTI9rMPHkHzypbPrqZDsxdlgYSjaGzo8RGPBYAYLgmI=;
        b=TDnypQ8obk5EeBGwP7HCeAc49QoTJIEMYjJspS4+Bpf11VvWhnmIfQ8Yf1Gvlb7llf
         uVakMgSyUeVE/C0HvWlLSn/ccexQbcRVvkr/rwhCBYA8kM9BOfXKWA6TJ7cVzE1HT2rJ
         s/B/1CdAIbvrSWrBsWm1pHQzsf9UkNiUe60rsql6Ki+FWYINK/9j//tbFDZs7GvhpwwI
         aad3NHogekUZaoWqUV7dcd/iXsmXElxMoQcMhzRKPaQPfemHl1KeubwHfowe5I6mkGYL
         dDo3aulxXdrQ0iM8yNjQU+CqVExsfclXBhhAYu122jUoj1ZFqOH7CwiO1sWOOAJj9zqL
         xXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778768880; x=1779373680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZTI9rMPHkHzypbPrqZDsxdlgYSjaGzo8RGPBYAYLgmI=;
        b=Z/Ya8oN0FyQ5X4M02tYvAqJfQGzB3hewK/N+hCVkk948B9r929XAyIUs7/vU4sSv3h
         DDkX+jSixeneTt03ptsLVrlVNBR4KOAGi5R9DwvedVGCksXz78nsGobZVcCc3rWII9yt
         6r8P8CylzRud5uArsJ0MfMF0aSg7INplX5arx9dX4shKU+8Ttn+lMF0PUGaHdZ7GQQa8
         2dvfzKUPDLZwStOSffXskhRU+r1uREVgpx0Z7WOzIWvKxXDYNI+ErXFZKKanr2biUJJz
         cwlY5lrVsUrFStcllncHu+wKFlN88rhczBaTOyNUAHnK/j+MmwB+0gtIGiRW+kAJNChh
         aOHQ==
X-Forwarded-Encrypted: i=1; AFNElJ8fwkF1PDBJ51ysdkjmjLByyK5DzXMlCPJKloaSTFfa7BQSWciAnRBVNw+lSKiuZ4aoLZOid47jOFte@vger.kernel.org
X-Gm-Message-State: AOJu0YzT+x0pVWIZhatRzLFXxLqYR+amgSDwlaYIEwBUDY9hJND3pTV/
	AgW+zxGwX2cVIXedQxFywUytC3looAOWMlUcI7TK8LCa92hqD4O7Zgb58mQ8kIPgBaxI3NicPZk
	CMTGFcfnkoAAwZttawFnRpVxRESRdMOVn9p5N/EaKXwPuWSVKEtj3o66wT8ELxGPr
X-Gm-Gg: Acq92OHB8/cebpmrK7/1grJa+5BzMMiLDCgl4F5JEKyyIbVAX0w8s4Grt53B26b3DKi
	VMnl55YPPbHNgr2SSqAO2sts0lBFe7Py4mxIqPW42P0P/LdP+4ILh5/+CWtTEJyCETRw4F40EP6
	z787kUc0Vc/dLEGmRZ6Wc/fDGjRXm+hLnr5c8yycWdrHM8NhQDuLPfJueKRUqFOQpeTlVRpbBTj
	A1VbxGMuVpGksM2e8NYcddzjrcNLploCirHwMBEa7ZRUbcatibRMrJOn3MZYFdDCIAEDeAICE1C
	UTDWmFlNXxIo4rTEUN91gL9TZjP62ZRt86NpjWziZRcoK99GUxQFg+rhOzTUVh18/+oDLTMiIIy
	mvYtmpj84Gc+02DF1JCztEQnTH9ILsTnruE+mLfLaAUtly4Yd7n5G3pFprA==
X-Received: by 2002:a17:903:2b0e:b0:2b4:689a:e411 with SMTP id d9443c01a7336-2bd275c658bmr90014215ad.22.1778768879581;
        Thu, 14 May 2026 07:27:59 -0700 (PDT)
X-Received: by 2002:a17:903:2b0e:b0:2b4:689a:e411 with SMTP id d9443c01a7336-2bd275c658bmr90013575ad.22.1778768878890;
        Thu, 14 May 2026 07:27:58 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05ffbesm28566485ad.27.2026.05.14.07.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:27:58 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 14 May 2026 19:55:47 +0530
Subject: [PATCH v22 06/13] dt-bindings: arm: Document reboot mode magic
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-arm-psci-system_reset2-vendor-reboots-v22-6-28a5bde07483@oss.qualcomm.com>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
In-Reply-To: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
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
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778768806; l=2550;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=jyTFGQNuJYDeqEOF9acNm3SghnFKZKEJruoHnHRlxUU=;
 b=nou4cMkQGTWvLWiMi0xLAiR5Ug05Cqvd2yNDa5Czcy0sg0oQS4mbWoXgsTyUQkZGu/yUH68ck
 NEZsvAztiXxCcsCVfzuUP+ujvrxuvi6T/yc1+H1QmvujhSyFKS83E8u
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: 2Qn7eIBw8kma69C9uefOfEupqCGU0V_9
X-Proofpoint-ORIG-GUID: 2Qn7eIBw8kma69C9uefOfEupqCGU0V_9
X-Authority-Analysis: v=2.4 cv=DewnbPtW c=1 sm=1 tr=0 ts=6a05dbf0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Z1E3qa2j_4PWJv3PNLYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0NiBTYWx0ZWRfXyHNcr1GE0cBs
 ILE2OfH4sdy5FzJ3D2PXuPKfxAzry23dTSsfUCO74Rl4mJvTrx0CV3X1dvRZPRj9cYoIOmnLuIV
 21/q8HyNMmDhzc+SlB/gEJY3Vktf89uVxaV7GClWwy5+ugKqLmEYjqhH4bfg4Va/wloGFKh2kfF
 qVBwBTUY2bJ9my4ttG5JB+5J07ouoLRKOZKo/Z8PhdcX4qLpQA6474TqIGJ+QZ1zVhUzpEzTTrB
 X3jN5vbyVw9mZiqXF5lRAT0ef69jkow9XliEJHIr2QJygxIPzDhGYZNT92cHdoISx9kyHIvVIOK
 aGO3iWIyWbsWWMxc9FRlvYD3xLPEfSwiNRC2DlCXfX3C6cZ6uoULVJUr3lfMUgFAA0l9GQ2F3rr
 Gi0yZj3ztwtuFrz4PTKsRP+7A1OmSwqQT+TXSLm1syH4ZuzaCWQAjpCqMy0Vk+Q9gPri8cPlWxE
 ZV0vVVvjxHKwTPokDjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140146

Add bindings to describe vendor-specific reboot modes. Values here
correspond to valid parameters to vendor-specific reset types in PSCI
SYSTEM_RESET2 call.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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

