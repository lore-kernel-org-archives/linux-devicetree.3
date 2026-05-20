Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86C6407571
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 18:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779303006; cv=none; b=nTeH9agfFlfYl47J5Gw8kV1TdEvE1W3SDNVNo8UEvUoRqoBW8UcBQTNOMnyTUN8qpvhZ2BziDS5B6exTfNCH+tasczMhzresDWQsu+wzw22nb/AqZ3bIpS/868x781qZ3/BFNBKKGBfvBb0vWGZoCi3DTtm/VwWZxpNPaonLlhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779303006; c=relaxed/simple;
	bh=dsX7mPtc6UZO3QTszlsq1hqCn0zQ5ralcn1l10GSUHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V+/ZvO/R7I8DC8GLC4e16qeKPD9vFekuOy5Eyd9NxcjgDmFx7UL5JJkSgJCOrt/pH1eQxwvjJ5q2rMGnz72DiA7HhzSEWPBFJLIL8S2jbub7AdUkBmg3CK7S+2fkn847dviDS8HTfHi1ZQb7TRCfW7IBc7vzQzZgaaoGiflST4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HwrRy62Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dFoa83pz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HwrRy62Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dFoa83pz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KF8DRx748397
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 18:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j2EyYli48Wk
	369qyzRCcHfeTorNILU3kKBlz9M6tYnE=; b=HwrRy62Z/uw+fCv6Krt6nJrxVin
	wgq1AkZTLm8XL5rkbsyZPGo083R7HH3PPiQNVOsUYQTKEjmQJCcxPLjF9jRJOqwD
	qI2cFVHn6yUGW1wmJGU6RUBe9DThYqYoltdLinDB1aTe8s787W/IYQ3GFMpNMLQi
	hIo7onKBzBtHkoXlf4kqE6U67B0nI/3m/XD38kybTTOIsW3wYpskgg+iyFhbRaFc
	IthKtw9Clw9CXPvOTJdH9jGXd2VvWeoHvPbGngzTNKAFNHru9EW7FMYFhAa645g0
	Q6a0PCterTN00yCKqvxDhT4M6/tgkgg2UvZmWd6hMe1ZXhsiM1cGOC7D/6w==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9fb6gxsx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 18:49:59 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95fc24f7dbaso2083424241.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 11:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779302999; x=1779907799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2EyYli48Wk369qyzRCcHfeTorNILU3kKBlz9M6tYnE=;
        b=dFoa83pzO6yGdhIOTndAUyx22b8k3QxPQfEcXxp5cbMkUTLzQiEhD5254E0SYFyw6M
         jXgGmvkdylXNmMeyKUT5DQHHFWCC1a7xaF8fw5myff/oTwxB4AhxxzAXd/zlpkZg3xn9
         KtQ2e7m3x1hMiZ0t4SF4Q+zUoQw+/ojsUjNQU9TJs5nQsP//XGlTrtxE43Jh5CyzNLN5
         zIKq4IosYTJRObT81k8MbGQb4vD0dPTu+vL5nnSeJFhqobjwjBMgYcjQ4OqATE9F0Xr+
         kiLodMBUiiF6ZhvDtt2tOUSZq+YYofTP9E2eloh1XgcAA0UmHJ94jhUFcojPHi2R2xpF
         W6oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779302999; x=1779907799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j2EyYli48Wk369qyzRCcHfeTorNILU3kKBlz9M6tYnE=;
        b=shhg+SxVwwk95wwTT75EqVxE0tnOTU6Cg0Oku+nnp4NeftjitsU8YLhPg017jvrNxx
         bI7eLDJmHroFcmHKDVJT0yEEmE87oT7331+jZETiySL+dA+aKQ8qTbEDQ2KT7bCu6Lju
         c3IV3gcgNOIE7ugabOwD/Kk3IDKx/sHY8Tmw+ogD6o3Z8nRMOYSAUMCGVd4+Rud2dn/Y
         6NWv3yecLn11h2SMIzZwhp+xLduNJJ4yNgYx2Ijw+JVDZvcUZJPikCCYxE3PsEHQjXcR
         KSY4kdv2MUMTUAqXiViR55xnAxYnRI7W3faXv0Zvl93x5T7i7fkNOlAPLy/BUBdhZsct
         QVbw==
X-Forwarded-Encrypted: i=1; AFNElJ80aTYqFSzBpOFU13E4Wd4Z5aP8CadyS+cTNZXEKs5BQNa/qRFIaDlIxQuJaLiDAC2I1pUO31uwkqfy@vger.kernel.org
X-Gm-Message-State: AOJu0YxQXvElSrqtuqQmpzdfB4hVJ6J1ZZ3SbqxpTUdeaQO3JH1uRTJR
	5KjZsR7HIwmjk12J8/vlWJyPh3/k7WpwIvEBvGSGH4t1xkH4+xXDvVITbR2k9DNurmMqmfxyTG/
	zjUtzCM39ylDdkAAjB0gvzlXPmEKjuF3wtnuce+B8scHSHZVfZou8wWGSQpzh4KTK
X-Gm-Gg: Acq92OG0C32l5u6ewAhiqckGAmMvi3G7kaRldGsV6dyhflxZVtyCjHsR89vM6/RI1lI
	zezQomkku7oaYjXHWWBZNpGhV3AKCECoo4kEC71B4zJhyonjAxYw7A+7DvIFExGjX0tbIRJwbQn
	En0jvsDhFMec5wK+We+5gA6u59ZmHZPCYh88Y8zXAw8cG99VaXvBsXwtHZ9/YgsqVl7oVPc9KDL
	5VN198tsOeAwr55Pp/eDe3Yl9YNrLsrfrKQSr94L9F/tEn6x/NhWw9hb+XS7vSH3FyOGt8cthu0
	iamN39ftxuAYyETXwVvy/QSWPoCwNNYZ91HPGByqEK5o2QwhxvO2W1sX4B5Y1XCdREDDhD4SMV4
	HylGqjyrnDTxaFny2zV0P3PUjxX+USPQyjoeP
X-Received: by 2002:a05:6102:80a3:b0:634:b86d:d904 with SMTP id ada2fe7eead31-63a3f392905mr14455618137.17.1779302998844;
        Wed, 20 May 2026 11:49:58 -0700 (PDT)
X-Received: by 2002:a05:6102:80a3:b0:634:b86d:d904 with SMTP id ada2fe7eead31-63a3f392905mr14455335137.17.1779302993624;
        Wed, 20 May 2026 11:49:53 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb8d838dsm139584905e9.1.2026.05.20.11.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 11:49:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] dt-bindings: interconnect: qcom,x1e80100-rpmh: Revert ABI break
Date: Wed, 20 May 2026 20:49:46 +0200
Message-ID: <20260520184944.182148-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260520184944.182148-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260520184944.182148-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2995; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=dsX7mPtc6UZO3QTszlsq1hqCn0zQ5ralcn1l10GSUHc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqDgJJb7ODGOqqCksFwhqMbUv+gHsyKp0CN8xo4
 cM4YmFWzzqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCag4CSQAKCRDBN2bmhouD
 1zHRD/9tFG8tp3zExu7gvBVBQ7mV+j6qOvEEBvZFiQpNlIqnzzWPE0xzgVxOru29x1pNu1eWbz+
 OY9AnFRcpCJw21kWDdPR4/G/foLng0ZPkTZTZlsMOt0L+GaQGMbEGSCPyBf8vyesLM9nVu4k/Hs
 MCm61wfi8Z/+K2pcr3oCnYvAW/yvQOaU+M8zGISCdIJqhyvSZ2/uaTh0SGSY+WAKVgGWLHvQdT7
 DU7jAip/WorYWD9xh/j3Q4JNxF0iEL4MvG+G83PkUchWP1yKZZYdnVONgFSdeABfIAC1TKqbbH5
 kAfGcbxnzW9N6oqmdVA8u6o5qtVWXWoAD1OTPKHRmqM5S//AwmwPFNF0bqvmL8Br7qA6apPrsBD
 BUCNT1fQfZjfE9oq61tlAwXmEmg6jC9WHoDbmztMvoUNJVbD1RnwXDKzNVeA+DXFuWSMg1VteQ2
 7c6rU1K0ic0ANRMxUkUkVCtTvai4d0np/+Vw62DPr5fTysNnZLQoWRf2Eo0Pn0PwwYuzvnvUeKQ
 ThsuCna3b6nasU4uBk3vCXif2atm3rkyd7rb745tiBM+LHEsyylsNu88Xlri2LiYRlSguxjCr+0
 UFqNFRTWLZSm351LxBaCDZUb3ZOiEbD6e1qI/iwpjfjDCgld3HPBZvoYQkH1H2v5A8/3wpsKsRm /LypivquGLwCQ8Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=do/rzVg4 c=1 sm=1 tr=0 ts=6a0e0257 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=Qe6B47XUAAAA:8
 a=EUspDBNiAAAA:8 a=IqiqMeszhnCddq1rSTkA:9 a=o1xkdb1NAhiiM49bd1HK:22
 a=QWPKR-PWjQKaio0naagv:22
X-Proofpoint-ORIG-GUID: aeF00cVqRWxyN-WptdHGW99MPU-zLGAj
X-Proofpoint-GUID: aeF00cVqRWxyN-WptdHGW99MPU-zLGAj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE4NCBTYWx0ZWRfXyN2uPrTbkqYO
 9Ovh5twQ1YO9WtXx9z46CSWJPSUYFzrVE3M72clhTcNwiLwUdHfwUNYOiMdjNuqEqewAZ5TrQKm
 JAkY2/jZtovPK67EnMRzjUFxO4cB0JNKUoaLms4jRcVjeplLffze59QQwDzgtFEAJKwz/XNlztd
 eJdvKany4VJFwY2KJhSOA2MBj4C6BDuauppGRwETPphAmxD5IObwdruZzJH1+BK+zSkR6h4h921
 MIBlnbje0pWtE0/CgnV/fwgcQn3+t0y9S2ogeuoKwryNcGMoFKnx9DrmtzvpgcLlDe4uuWIuFya
 YVHUgWy98TFLFZhRbtswSOXnx1HFOXEkj9A34Xetb2rFCRsOd+ihO8vKJdtC30qQxWo/ICGKSpH
 lvhqBvxLKczJB5mNy2K6wj5BLS+LI+BIBDPxR1vhd+0TL3Gm6ZjpGyzF6RKFIh9JFh4Gw8uv+eI
 ngwvCgrWr+jI9dmxuoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200184

Revert commit c83cf1b1c6f1 ("dt-bindings: interconnect:
qcom,x1e80100-rpmh: add clocks property to enable QoS") because it
breaks the ABI without justification what was broken and what was not
working.  It claims the clocks are needed for QoS, which might be
correct, but QoS itself is not a mandatory thing for the device to
operate.

Fixes: c83cf1b1c6f1 ("dt-bindings: interconnect: qcom,x1e80100-rpmh: add clocks property to enable QoS")
Closes: https://krzk.eu/#/builders/102/builds/70/steps/23/logs/warnings__3_
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../interconnect/qcom,x1e80100-rpmh.yaml      | 62 -------------------
 1 file changed, 62 deletions(-)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,x1e80100-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,x1e80100-rpmh.yaml
index 27d9234bc762..0840b0ec6e27 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,x1e80100-rpmh.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,x1e80100-rpmh.yaml
@@ -46,10 +46,6 @@ properties:
   reg:
     maxItems: 1
 
-  clocks:
-    minItems: 1
-    maxItems: 6
-
 required:
   - compatible
 
@@ -69,63 +65,6 @@ allOf:
       required:
         - reg
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,x1e80100-aggre1-noc
-    then:
-      properties:
-        clocks:
-          items:
-            - description: aggre UFS PHY AXI clock
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,x1e80100-usb-north-anoc
-    then:
-      properties:
-        clocks:
-          items:
-            - description: aggre USB2 PRIM AXI clock
-            - description: aggre USB3 MP AXI clock
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,x1e80100-usb-south-anoc
-    then:
-      properties:
-        clocks:
-          items:
-            - description: aggre USB3 PRIM AXI clock
-            - description: aggre USB3 SEC AXI clock
-            - description: aggre USB3 TERT AXI clock
-            - description: aggre USB4_0 AXI clock
-            - description: aggre USB4_1 AXI clock
-            - description: aggre USB4_2 AXI clock
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,x1e80100-aggre1-noc
-              - qcom,x1e80100-usb-north-anoc
-              - qcom,x1e80100-usb-south-anoc
-    then:
-      required:
-        - clocks
-    else:
-      properties:
-        clocks: false
-
 unevaluatedProperties: false
 
 examples:
@@ -141,5 +80,4 @@ examples:
       reg = <0x016e0000 0x14400>;
       #interconnect-cells = <2>;
       qcom,bcm-voters = <&apps_bcm_voter>;
-      clocks = <&gcc_aggre_ufs_phy_axi_clk>;
     };
-- 
2.53.0

