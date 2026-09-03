Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764DD4B5153
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 14:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788445158; cv=none; b=r1P+ynuy7XDjyUjoD4wd5F/PUZ6yWqiEjepudXCYLopJDD4KdaawbiX1VG+sNtRGUnziNFPrBnSeIFhuE3Gr10jB35LovZ+ht6a/HcppBcDlQacjQQeLLQAfNLdeukdOVIpapOySdU5hPBoDZmhxkDJo2LDSbyGX6xq+DiNzkSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788445158; c=relaxed/simple;
	bh=aVsxz9DXw9erp/s4chS8cIt9Jc1QDB4z/C35yDdv8bM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SznHu26X3n0y++BqJaZGcq9TzfoXztXJrTGkt8MqF84pC4ilfyqyBEZgWBAC6wqwvw1H0zP5q8PNh8uIIydvKqYN8+lZmziXJpDorza+e2BcctpwUTd1ehj86feY4m6dTUfl7fshqJJi4XwtabfA5G0yNAXmhI/Fr3w9goBctLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dFJG2Q2E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U49K7wtw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dFJG2Q2E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U49K7wtw"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAcDB822639
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 14:18:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iPDaGFLS/lLjdSaKwQhej7CnULXLtZrtQ6LDHRChrzc=; b=dFJG2Q2Ea3Q/O0uV
	4VWysPTuNx6UJAoYLkIrMP3BS49zSf5l5cI1wY2ndMVHTnbk9ywEHAz7o2hf/qqt
	FuQdzmyLMtDOzDMOn02gK03T8P6SsGIksIfhcm3TESWYfvYL9v4/VL5eOaHSVxe5
	dMemujhyR7aapXljovopp9N/TqCGvxSK+K5E5Qy1VAe0VgzIvptiTBWx8B6AkRqn
	LI+hDf4kM/dUBCMZta9Bn/DYk4cf8Uk9oe/IZ3oqgH2hR+lE+cjt7SHBVH6L1B2I
	8QA95ditJbvJZCQxbosyR2Nm6bFFHUv/ZYaBb9tlFld9qdrlySQjg/2vfByijvlo
	Z+zg7w==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6p7126e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 14:18:59 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bfc08e95ebso114864e0c.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 07:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788445138; x=1789049938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iPDaGFLS/lLjdSaKwQhej7CnULXLtZrtQ6LDHRChrzc=;
        b=U49K7wtwcI5IuMHkiS/wxoOhudEp5wTwnczMJJAC63XVwsXD0Mda0MZi3ZLLHcd93S
         4y1BM/jjdMD5O4fqrQbnpmI1DPzetg3mWTrjJYuO8u0YRWMMvdJ2CAkaE8tynsPTgIdd
         TjfMN/rBl/Mw5hNz9oaIX8L9qkFS8SYbl4RugJ24zigz1t2jJ6x4VurAReQyTtmG3SDa
         KJQVJiJaUBWXXEXTfg2zDUx5xz0GGbeo5QajD1QJXccnamn+DOJGwGe2aH78FTDleJLi
         X+XruxNxMAlDyekSeBFvchFiU6fvbqyKUDSqdyCZj/rOjaW3QQjrzq5QeMUIGrcVEo59
         SaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788445138; x=1789049938;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iPDaGFLS/lLjdSaKwQhej7CnULXLtZrtQ6LDHRChrzc=;
        b=RdKGNjzmVojTABiyDZK9Ej88nwIYhrZODLSKa/GCs3jBkNZIFRLUjojX3++y/LF/LG
         XbqeLeVqT7x56g39/+HJ93g4LpFklhHrA3j6PvpFOdaukWMla+6vVpfMtXOoZ64pdOB3
         0TFBsD5v6exhxzmBJ6qPZVDeC6RLK2Y7E73ZroCOp9Tp3vzx+prYV8gwYqWcMqSmE5Lm
         E881J9bQNpUkPqF3xIrNJPb9n/2GEHsmU2XrpeTjeQPQnUGuzMXDy7bOxKYRqsdaxtlf
         bLvem9ugyH8eVDuytOsnC4YzDOVlTBm2XIW+EbnGWThnPhMeL3Q4IE+tx8ZPO5N3zOR2
         KBUA==
X-Forwarded-Encrypted: i=1; AKwUvBzFf4oIWkQblQH+kLNehAp42AaCWvPcejcgV0sTE3/A+f5Ir5Oz4zmWtuCRmQIREdonab7JEuBuWYA4@vger.kernel.org
X-Gm-Message-State: AFuF++mC3lfK0JBUBGzi5YYNhaAJHX/ReZoUE5ynr34aVl7ZUJThLrKh
	UmhoyAGN9X+fJ1TwvUezzMCUqmr9UY78mqS1TFo3igJ6x7AwXkVEo/ZoKSSAEwjnXeaaVYifppB
	AwYCU7oFtJWP1lK/LxL6CXhCW9sSHlBTA5rXI2vzc0lS2Qkly+smbyxe9PR95LMrP
X-Gm-Gg: AYBFou0EnOOdCa7nmvUsge9osk1qb8e2884ZXdehN3IXHoOj2ayCCFcI8Rpu4VVrrwo
	WyLTnfOy1ZgvSsb0p8wTxECejrH/8xmPNEz4dSmjKsROmSmlHu8fv8h3tRjyFdVfwCzWlmm5Oyb
	JKelxbzQ5W2fsFxnFB5A3cCJmmkkMLHbYYahT0gklRbzSsJJm9OWekbOQzuBUXkgDR44171xCC7
	XI/xKI06F2ZvwohBRz01MlNPu/7GYWoXYOBDtTteCmpuTEhw9yXZTRS6lK10Pb5YlNysTP7Rzou
	TBtoKOXGygBqGcNVFXkM3wXNDE9Y2aPniVtp5qQM0qvHL86cnDNNcShBIQqcQ45R8Rf22IKV/CD
	KeUzJqubqlOmrEblAopaFTw==
X-Received: by 2002:a05:6102:6884:b0:786:8d84:5aca with SMTP id ada2fe7eead31-78a1f339246mr2199026137.2.1788445138312;
        Thu, 03 Sep 2026 07:18:58 -0700 (PDT)
X-Received: by 2002:a05:6102:6884:b0:786:8d84:5aca with SMTP id ada2fe7eead31-78a1f339246mr2199014137.2.1788445137740;
        Thu, 03 Sep 2026 07:18:57 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f895e14sm2261636a12.3.2026.09.03.07.18.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 07:18:56 -0700 (PDT)
Message-ID: <97149d63-4b74-4bd1-a9c5-798088316df9@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 16:18:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Fix up QUSB2 PHY description for MSM8996/SM61[12]5
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Iskren Chernev <me@iskren.info>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260610-topic-8996_61x5_qusb2phy-v1-0-d7135980e78f@oss.qualcomm.com>
 <b05e860e-ace5-4399-bbd9-493f7bbfe74d@oss.qualcomm.com>
 <cnyhnyoce6v4d5roijrceuzd3ujvvw7ozklulaxkibptvjancm@cqbqu2aa7bz6>
 <852caded-eacf-4ac1-8fe5-83dd9285ef11@oss.qualcomm.com>
 <nrdf44ixzjqdyxdjnf54ucotpbncehjxjqygqnrknc66pyqfau@vm3emv662bub>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <nrdf44ixzjqdyxdjnf54ucotpbncehjxjqygqnrknc66pyqfau@vm3emv662bub>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3YFkB_slo-MTFUCYUkiYGqJpi0eVHeG2
X-Proofpoint-ORIG-GUID: 3YFkB_slo-MTFUCYUkiYGqJpi0eVHeG2
X-Authority-Analysis: v=2.4 cv=OZyoyBTY c=1 sm=1 tr=0 ts=6a9981d3 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=sT_kjUCmaLeEptA-OHkA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEyNCBTYWx0ZWRfX+gm2GoWX7QOY
 qAHmZJY/f7EVXJZevt6FyMmgdVADKVpSjnj0i7ivz5/pN/JW33IB1+bEIsTjfftVb8A1Kx8jwhE
 sNWKaraBWgenUZCgDrInIv7CVIzIYdk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEyNCBTYWx0ZWRfXwcBif+j2EVcz
 +BTTXYZtYs4VRf957TD3kb2bFcAVDOPCt6lODyXwCnYljdyhliJKHkl2n0+NkSoI8yPf70zlId+
 B1fYSeL8zXj2tPRvJu7R/kWQyqhFZmtu7KzP50BUBzTZJ0e2nXX5u0TbtFZsfaBJ9Eg4RZHPItF
 Inj8OW2Yo9ugeIu+ZFvyBRGpIb4foLmLu1zKCGx2s1C7HYnhV9L4uetO0CR32R7qA2C5J7/fJAw
 sQBHRjO7qtmQvZCPM9OXDA9D6LApvAPQvyrt6FaQMQdpoXzzUHZY1VjVSlBIy+OU9rW7MGn3j5l
 ThqkT7DZ03LfQl2yfJVkgiUvhwb5deD1XJbHbtgAQ6H7TiGG6AuNH5aF4gkJcATfj6AoG6oRcXS
 zVwcJ0ofs1a/fMxxqUAMTgFISqxlpG22IplyczemaZfelZzynKyUT9IN6l3Y5RY9FtX90sfVG1C
 IMiOfZvTW9UL6Qh40sg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030124

On 6/10/26 3:20 PM, Dmitry Baryshkov wrote:
> On Wed, Jun 10, 2026 at 03:13:01PM +0200, Konrad Dybcio wrote:
>> On 6/10/26 3:03 PM, Dmitry Baryshkov wrote:
>>> On Wed, Jun 10, 2026 at 02:49:31PM +0200, Konrad Dybcio wrote:
>>>> On 6/10/26 2:04 PM, Konrad Dybcio wrote:
>>>>> The MSM8996 QUSB2PHY was not being guaranteed a power source.
>>>>> The SM6125's QUSB2PHY was believed to be idential as the 96 one. It
>>>>> wasn't. This series tackles that, freeing us of some dt checker
>>>>> errors about vdd-supply not found on MSM8996 boards.

[...]

>> reg   96   pro
>> 0x80 0xF8  0xD0 [!] QUSB2PHY_PORT_TUNE1
>> 0x84 0xB3  0xB3
>> 0x88 0x83  0x83
>> 0x8C 0xC0  0xC0
>> 0x90 none  0x02 [!] QUSB2PHY_PORT_TUNE5
>> 0x08 0x30  0x30
>> 0x0C 0x79  0x79
>> 0x10 0x21  0x21
>> 0x9C 0x14  0x14
>> 0x1C 0x9F  0x9F
>> 0x18 0x00  0x00
>>
>> apparently this is indeed SoC-specific (via docs) but also apparently
>> may not be very important (although should be fixed regardless as
>> some designs may rely on this)
> 
> Would you send a patch, please?

So the tuning differences may be taken care of through a separate table,
or by adding support for overriding parameters for the QUSB2PHYv1 (8996
-class) devices. Currently the overrides only really work as intended
for V2/V3 (SDM845-class) PHYs as the register layout changed majorly.

I think the real right solution here is to fix the overrides.
dt-bindings clearly created by an LLM :)


I implemented some of it, but I currently don't have the time
for finishing it up - feel free to take it further. It would also
help adjust the specific OnePlus init sequence that was originally
used for every SM6115 device (patch 2)

I also discovered that the interrupt mask is wrong for V1 PHYs.
At this point maybe it'd be easier to split off the v1 support to
a separate driver? Anyway, up to you.

I'll resend this series as-is as it fixes actual issues.

Konrad

commit 792eeeb5d43428cedc72c5778f664a33c4cf2b30
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date:   Thu Sep 3 16:10:36 2026 +0200

    [WIP] qusb2phy v1 overrides/tuning/fixups
    
    Assisted-by: LLM

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index 39e796cd5dc6..13a5c08fdb8e 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
@@ -169,6 +169,22 @@ properties:
     maximum: 3
     default: 0
 
+  qcom,man-sqrx-dis-value:
+    description:
+      It is a 1 bit value that enables manual squelch receiver disable.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 1
+    default: 0
+
+  qcom,squelch-eop-delay-value:
+    description:
+      It is a 2 bit value that specifies the squelch end-of-packet delay.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 3
+    default: 0
+
 required:
   - compatible
   - reg
@@ -182,10 +198,17 @@ required:
 allOf:
   - if:
       not:
-        properties:
-          compatible:
-            contains:
-              const: qcom,qusb2-v2-phy
+        anyOf:
+          - properties:
+              compatible:
+                contains:
+                  const: qcom,qusb2-v2-phy
+          - properties:
+              compatible:
+                contains:
+                  enum:
+                    - qcom,msm8996-qusb2-phy
     then:
       properties:
         qcom,imp-res-offset-value: false
@@ -196,6 +219,19 @@ allOf:
         qcom,preemphasis-width: false
         qcom,hsdisc-trim-value: false
 
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - qcom,msm8996-qusb2-phy
+    then:
+      properties:
+        qcom,man-sqrx-dis-value: false
+        qcom,squelch-eop-delay-value: false
+
   # On MSM8996, VDD is supplied via the MX power domain
   - if:
       properties:
diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index c34d847b123c..a9435b6e1637 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -51,7 +51,22 @@
 
 #define PHY_CLK_SCHEME_SEL		BIT(0)
 
+/* V1 (MSM8996) register fields */
+
+/* QUSB2PHY_PORT_TUNE2 register bits */
+#define UTM_HSTX_TRIM_V1		GENMASK(7, 4)
+
+/* QUSB2PHY_PORT_TUNE4 register bits */
+#define SQUELCH_EOP_DLY_V1		GENMASK(7, 6)
+#define MAN_SQRX_DIS_V1			BIT(4)
+#define PREEMPH_WIDTH_HALF_BIT_V1	BIT(3)
+#define PREEMPHASIS_EN_MASK_V1		GENMASK(2, 0)
+
+/* V2/V3 (SDM845) register fields */
 /* QUSB2PHY_INTR_CTRL register bits */
+
+// v1: 4-chg 3-dmse_high 2-dmse 1-dpse_high 0-dpse
+// v3: 4- dmse_high 3-dpse_high 2-chg_det 1-dmse_intr 0-dpse_intr
 #define DMSE_INTR_HIGH_SEL			BIT(4)
 #define DPSE_INTR_HIGH_SEL			BIT(3)
 #define CHG_DET_INTR_EN				BIT(2)
@@ -443,14 +458,17 @@ struct override_param {
 	u8 value;
 };
 
-/*struct override_params - structure holding qusb2 v2 phy overriding params
+/**
+ * struct override_params - structure holding QUSB2 PHY override parameters
  * @imp_res_offset: rescode offset to be updated in IMP_CTRL1 register
- * @hstx_trim: HSTX_TRIM to be updated in TUNE1 register
- * @preemphasis: Amplitude Pre-Emphasis to be updated in TUNE1 register
- * @preemphasis_width: half/full-width Pre-Emphasis updated via TUNE1
- * @bias_ctrl: bias ctrl to be updated in BIAS_CONTROL_2 register
- * @charge_ctrl: charge ctrl to be updated in CHG_CTRL2 register
- * @hsdisc_trim: disconnect threshold to be updated in TUNE2 register
+ * @hstx_trim: High-Speed TX trim
+ * @preemphasis: Amplitude Pre-Emphasis
+ * @preemphasis_width: Pre-Emphasis width (half/full)
+ * @bias_ctrl: bias control value
+ * @charge_ctrl: charge control value
+ * @hsdisc_trim: High-Speed disconnect threshold
+ * @man_sqrx_dis: manual squelch receiver disable
+ * @squelch_eop_delay: squelch end-of-packet delay
  */
 struct override_params {
 	struct override_param imp_res_offset;
@@ -460,6 +478,9 @@ struct override_params {
 	struct override_param bias_ctrl;
 	struct override_param charge_ctrl;
 	struct override_param hsdisc_trim;
+
+	struct override_param man_sqrx_dis;
+	struct override_param squelch_eop_delay;
 };
 
 /**
@@ -558,11 +579,48 @@ void qcom_qusb2_phy_configure(void __iomem *base,
 	}
 }
 
-/*
- * Update board specific PHY tuning override values if specified from
- * device tree.
- */
-static void qusb2_phy_override_phy_params(struct qusb2_phy *qphy)
+static void qusb2_v1_phy_override_phy_params(struct qusb2_phy *qphy)
+{
+	const struct qusb2_phy_cfg *cfg = qphy->cfg;
+	struct override_params *or = &qphy->overrides;
+
+	if (or->hstx_trim.override) {
+		qusb2_write_mask(qphy->base, cfg->regs[QUSB2PHY_PORT_TUNE2],
+				 FIELD_PREP(UTM_HSTX_TRIM_V1, or->hstx_trim.value),
+				 UTM_HSTX_TRIM_V1);
+	}
+
+	if (or->squelch_eop_delay.override) {
+		qusb2_write_mask(qphy->base, cfg->regs[QUSB2PHY_PORT_TUNE4],
+				 FIELD_PREP(SQUELCH_EOP_DLY_V1, or->squelch_eop_delay.value),
+				 SQUELCH_EOP_DLY_V1);
+	}
+
+	if (or->man_sqrx_dis.override) {
+		qusb2_write_mask(qphy->base, cfg->regs[QUSB2PHY_PORT_TUNE4],
+				 FIELD_PREP(MAN_SQRX_DIS_V1, or->man_sqrx_dis.value),
+				 MAN_SQRX_DIS_V1);
+	}
+
+	if (or->preemphasis.override) {
+		qusb2_write_mask(qphy->base, cfg->regs[QUSB2PHY_PORT_TUNE4],
+				 FIELD_PREP(PREEMPHASIS_EN_MASK_V1, or->preemphasis.value),
+				 PREEMPHASIS_EN_MASK_V1);
+	}
+
+	if (or->preemphasis_width.override) {
+		if (or->preemphasis_width.value == QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT)
+			qusb2_setbits(qphy->base,
+				      cfg->regs[QUSB2PHY_PORT_TUNE4],
+				      PREEMPH_WIDTH_HALF_BIT_V1);
+		else
+			qusb2_clrbits(qphy->base,
+				      cfg->regs[QUSB2PHY_PORT_TUNE4],
+				      PREEMPH_WIDTH_HALF_BIT_V1);
+	}
+}
+
+static void qusb2_v3_phy_override_phy_params(struct qusb2_phy *qphy)
 {
 	const struct qusb2_phy_cfg *cfg = qphy->cfg;
 	struct override_params *or = &qphy->overrides;
@@ -840,7 +898,10 @@ static int qusb2_phy_init(struct phy *phy)
 				 cfg->tbl_num);
 
 	/* Override board specific PHY tuning values */
-	qusb2_phy_override_phy_params(qphy);
+	if (true /* TODO: */)
+		qusb2_v3_phy_override_phy_params(qphy);
+	else
+		qusb2_v1_phy_override_phy_params(qphy);
 
 	/* Set efuse value for tuning the PHY */
 	qusb2_phy_set_tune2_param(qphy);
@@ -1136,6 +1197,18 @@ static int qusb2_phy_probe(struct platform_device *pdev)
 		or->hsdisc_trim.override = true;
 	}
 
+	if (!of_property_read_u32(dev->of_node, "qcom,man-sqrx-dis-value",
+				  &value)) {
+		or->man_sqrx_dis.value = (u8)value;
+		or->man_sqrx_dis.override = true;
+	}
+
+	if (!of_property_read_u32(dev->of_node,
+				  "qcom,squelch-eop-delay-value", &value)) {
+		or->squelch_eop_delay.value = (u8)value;
+		or->squelch_eop_delay.override = true;
+	}
+
 	dev_set_drvdata(dev, qphy);
 
 	/*

