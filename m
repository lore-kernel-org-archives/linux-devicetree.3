Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779708;
	b=NfzUT+PyauZz6+57HipoyT0plIlTS7PePOuOsTkKS4YYt32EMnWmuo2vOtCCJG4jSbn4
	 QLWO0vetNpyDcjJhYk2r6MzzWabLTQVSNyvzbJFzsIuGTkxCe9jKPAKrOF4ZuHPWJdYmb
	 gTS9V4MTGqX+3EsKxwkhbeb/6R0Mu3Uk+VoRUStBJ9uEBEJ8nmcFTHj2Pq7BD2QrI5kHE
	 GJm8XGA3ynS3KSSFSRU/7k2Ukq5F43pcA6k5mFRrK1DVEuhtN7xv7dQ/XehFUqVs5IBHy
	 mK9Us5hklwGuvX+8I8+IsAxA/QL3L9LKoJFOfSDZKCdl6aDo7tO+KGndnN9/L/MrUqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779708;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VlvsZhKQ5bte9z2ki1x34C633JPVJM4x+mie8ldYyLk=;
	b=eus022E5WZPGtarQEV+UztaU1pos5xNo76vilcAkxEZdx+uEe1wfR0xeORkC69hKrUKI
	 t/svRjnw9rt69wuXt/MkdVQCVz2/Ib97y4Eteh77qj6xSDfiG7X/L/oXnT7+a356LbhOu
	 LPcX7dAun82DTmDsLdl4KPIUmvbVt0y4RYQV8EgFJ4nOnHOqSykF2/IpqdKO3svZVRlxW
	 SzKuszikwgnRSItu0vP0con7p7sMg8QNFaIgkSOk/seJzc6jYr0vpv6GxqVUWPRFnLGkX
	 zo+VIcZnoNvSI+0djNs/Cp0DqbK2yGOE/8WB44xxydvIa0Kbs52ARUx2U03g4B4wdCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=emAeV3+B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OgDP9Hv+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949C3606A6B7
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 949C3606A6B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=emAeV3+B;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OgDP9Hv+
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApAeJ2268663
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VlvsZhKQ5bte9z2ki1x34C633JPVJM4x+mie8ldYyLk=; b=emAeV3+Bpc1PnQp6
	VRf7r0qX7MoO5wXmTY/dQVSIXFKgAD1iYdydUzAbOYtlQ68YbOJUrLUK4TX6B4St
	2NkSZF21iZdoWiBPuXPI6qkjm02zPD+ViUvxq56JuGqGcnm1qs/O9VDEuZJJFbCf
	pXEaNe0zfBrgS/pSLZDGG/asw93JEKs2zjd5Gvbm+4qMKi7Zh3IHD8tYB23NB3s9
	gfbEBegMAkocF+6ZNe2uko9p0sMeMw4PPzJlW0JcfXqf2WjLDUo7ZVvYAs0FK3rz
	JR64o7NeK1noiXMLRoPEvH1RdjfDskb7XHdw7xRnBq4osXGwoSg/a1BANsimVOat
	k19gpw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhhdwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:41:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-948d83322f6so673417685a.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 03:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779706; x=1796384506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VlvsZhKQ5bte9z2ki1x34C633JPVJM4x+mie8ldYyLk=;
        b=OgDP9Hv+7kjT+EJK4s9oKTgMxB4rPz5aT7EvmRwtKEAuVlr0l7kZttr/VIqgVAbOhB
         JUpCveo3lES70ZvnQLj+3jVzLHrUd8+Kj+/r6G5UfOiFSIlsbR5muKBC1NEgA02aBaNT
         KsaOxLdN1MCUzWc98HcdLBdGir0dbvXFiujPLVHi/j75I+NSyZzZWDG4mRI76n99Z9ud
         JxQVenUOFWxguD9gqedRXFmNskwJ7CJB6rBtxP7NlVI4dBtiEf0l5WYDaUzskwbpK8+R
         gEKcPIaf8j76e/QP0EJ9fzat+hy9s6WJ/Ul/n/BOqcq24K9zdbM4fd7LGKHv5bZfhPYQ
         N9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779706; x=1796384506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VlvsZhKQ5bte9z2ki1x34C633JPVJM4x+mie8ldYyLk=;
        b=ScRgG0ZaHTk3ZeEoHT7LzERA8OMsy20xiqNxG47Fuwlceqp/ZTJ7E0FrKt6Evkgy0V
         QIWOXLH0XnJlOkTSjBoWdPFgSpJF9XfDXHfaycrgmXvY3mUJoJX11V28L68jK6jXkENG
         L2UXhT83jPMfSt69dLjOU17RyCgsBUCg74sT0fAvCtu8oPlxeNiCe1h8yB/7EHsy3lwc
         INlf7PAxqWj++SGDTjjmKvWNVRo3Xs3iIo6jO40hSvYrp8NQBUY5UsAjs3NCmFkweftD
         Aon30XMRmJCWU3Po8uHw1ULfm9iLyROlMIQ5xHRcx4mM2YGH4ParlykmZ7qhc8NlcUlo
         +RCQ==
X-Forwarded-Encrypted: i=1; AL+hErEiP8cop9BxU4CDibY9pzPgKFJU35YkKZI7XAlHEM40zd6DynT/PBRY6Gv8X51Z9IKu+n6bkA3Y2JLK@vger.kernel.org
X-Gm-Message-State: APuU4Z9i+M4SgFcLD378+TghUfOAHHegHq0Cb7lo3QJsrZmifObmGDAL
	tIc15K89KBZ6fE24VNkmU+4bZx2r2IEmMFOb2JSJRTsQFNcrVKdk3iJBxTpXgUWrTQxeA2aovGE
	dEXZelhaq5DPvoaTRqd3MQaZfJJa79au3UtswWQAhopHoW5sFMJi7Mq07kCnWdbI6
X-Gm-Gg: AZFdTZd3U+8/DyjWL7DfJHgupSQLCfsmJgr6sWaVgAMhTyC1T6wjIE02lBl7izJ1rg+
	2Ia7+4gO87khtWejZpjCnfj7UJUNKnwEQ7rny/Gv7C5+KqfAIyzMYhQ4fEhCPyqr/5RFWn+ArEK
	n+y3kBfkT6sN89tHfczDrzGTNNRdybaXRHLKy/ifB7EnWonmd7BdeZ3iwf2/Tfc5SvhLHiZiOdW
	19c2D+DEgcHHmT6fenIVwrjxpit3F4M8Z13b6ab36rFiBy6rxUJNTLMNPQcq4bjhjP2KX8Aw0vC
	+b7XnLxrJVgtWvG0seIfEIZ09LgrtqTcchZE+xJnq3gGtXg93sQqFLCX5O22OMbFwCRaDUqwm02
	AhgXuoQywDJqhGLOi2XJ65B8ROe0LoN8hkTmyQxvA+DfJO+MIpkLTzF3ypokjDKUV9BjpoH3kML
	vsCihLV/Ri2pAz9ihlmUC9Js1R9s6x+a0ihS4SiLruu+KPl8VJlXJGz59j2U4R6oc=
X-Received: by 2002:a05:620a:270d:b0:949:8109:8bcd with SMTP id af79cd13be357-949bab6d24dmr4114418385a.77.1795779705811;
        Fri, 27 Nov 2026 03:41:45 -0800 (PST)
X-Received: by 2002:a05:620a:270d:b0:949:8109:8bcd with SMTP id af79cd13be357-949bab6d24dmr4114412085a.77.1795779705324;
        Fri, 27 Nov 2026 03:41:45 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm45137049f8f.7.2026.11.27.03.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:41:44 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:41:32 +0100
Subject: [PATCH 3/6] dt-bindings: clock: qcom: document the Seca TCSR Clock
 Controller
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
Message-Id: <20261127-seca-clocks-v1-3-1781298e658b@oss.qualcomm.com>
References: <20261127-seca-clocks-v1-0-1781298e658b@oss.qualcomm.com>
In-Reply-To: <20261127-seca-clocks-v1-0-1781298e658b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Tyler Baker <tyler.baker@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3511;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=UU3EbnJaLdHT0l2zmjczzAnpGAGzw6I+1J+L+nykF9E=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCWxwfy590nfgqX7sjByb+r7MdExcTAoxugkiV
 vuu2zCSCUyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawlscAAKCRAFnS7L/zaE
 w8ObD/9F59keoAIFgmv3etoAvDTpaxgoVCTgyH0PIKzceesdu5c+4Aj5Sb4YbsplXdl0X5qTgXf
 y7vOgRz0pVvnbolF9ccfDYRKwTiX6Af8CuKnDqxeiTxmVY1V36OJQZJq0lpSqBlTUsjgCxFPP2j
 Vr8wrZaWtj9KqakvaffOLEEO1IikjyIrHBLfs0rtJlPWvy6lN6qXRIUInkr0nsVxwWvSb2odC/Q
 esd+dNwGZSjnSmkpaVUU3FLFYv6GmS5vh5Z/11egKboXlwEt/Sl26snJ5TILxmD7K5ulX6YCzvt
 dkCD13I77zdCm44W4bau2PPwHZhAhab1jz8W/dg4/PCTgUsSx/Zi6BSLUl6ujW7K7FV95JfThji
 EEzZ055SW5esI+yiz5nlpNPevn2jmHdtrIM179uqW5k9xuTBZp+f5/6GAdQX4wQS+3aLG+PqpBl
 Fy5uVF5U1E42zkhMYntwrUDTBfwSPGABZlR30eg1XEI4ZgRzQkDk9UUIDfi2UBiCR2kAcEuOYb7
 r2w05BWxshS3kIIOv6Kqm3YhsTZx0nHRpJqYVSm9CvZJ7cNgZMjFReBdd86ewHKZJan4ps1HtAk
 8bWbLapSKKpAprBveAgRJjfq35rm3HB+ElHE6AZHEeH1nc6rUfn/pVghRO+IG+S0eVoVsdbIMO/
 hxZGxvZSRtK5Grw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX+QVlmAK0QDTa
 bXtVUoBUtBQGwOzagx7jyPcGtzACVVrOZrIeRE7ek+8L5dhhZVW7mUF5wuTz7/W/SeBysvpsI+J
 2/6VqswL8nm3/x7lvj+Y9Cp3qsWsPe8=
X-Proofpoint-ORIG-GUID: EROPKHYo01fVfGW1zcmoJfxIETc6fDNo
X-Proofpoint-GUID: EROPKHYo01fVfGW1zcmoJfxIETc6fDNo
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b096c7a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Eo1YCTbVZX2S2jacn6oA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX/aaZ8IEzEiHG
 DzQ6EbUXwgdAtw2oNpWZWpv5DtCHZ/DkhOMWqWYM714u8tXl1aQcj1xaxbzB/5jT4tQrrSn7p8k
 0WkryQvm8875P2WPuqCb0bcuF3QOtSRaV12l6jlDgQT6SN8SMm+QXySr8VuDfyO/Tnf2XjIliiS
 EhdnFRR2qPa9oVra7HPPaZ2HeaWwM6M0istnAxwqe5HWWnUGb0U3KuTwoeF4bQgxTFbwaYq09R3
 rBJwb7/0t0sxXUT79HRhfkTltYZb2dY75YTVWIwAFlI/Xf5xxywxqplC5PkPPK5HmjyzNOQuWGo
 mEeY8PSOBWkfEp1vIukFlLtbjhVNDAUIAYLOXypdXxOG78Mzhk4Vl+e1Q8Ltq5LHZThhRnFN9PQ
 YB3JLvIuUbhxwGirOB+ezdGjIBpsuYQdVVmTf03gDdc8wEXY1sam4pVLofTqaA80McpL2IJUiqW
 LIAPtpZJKMCYNdi9VkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270046

Add devicetree bindings for the Top Control and Status Register Clock
Controller on Qualcomm Seca SoCs.

Co-developed-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,seca-tcsr.yaml  | 65 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,seca-tcsrcc.h       | 25 +++++++++
 2 files changed, 90 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,seca-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,seca-tcsr.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..1349f70b5672a2de4e9388056e4c560cd1eacde2
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,seca-tcsr.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,seca-tcsr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Top Control and Status Register Clock Controller on Qualcomm Seca SoC
+
+maintainers:
+  - Bartosz Golaszewski <brgl@kernel.org>
+
+description: |
+  Qualcomm TCSR clock control module provides the clocks, resets and power
+  domains on the Seca SoC.
+
+  See also:
+  - include/dt-bindings/clock/qcom,seca-tcsrcc.h
+
+properties:
+  compatible:
+    const: qcom,seca-tcsr
+
+  clocks:
+    items:
+      - description: TCXO pad clock
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  vdda-qref-1p2-supply: true
+  vdda-qref0-0p9-supply: true
+  vdda-qref1-0p9-supply: true
+  vdda-qref2-0p9-supply: true
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+  - vdda-qref-1p2-supply
+  - vdda-qref0-0p9-supply
+  - vdda-qref1-0p9-supply
+  - vdda-qref2-0p9-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+
+    clock-controller@f1d7000 {
+      compatible = "qcom,seca-tcsr";
+      reg = <0xf1d7000 0xf00c>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>;
+      #clock-cells = <1>;
+      vdda-qref-1p2-supply = <&vreg_px11>;
+      vdda-qref0-0p9-supply = <&vreg_l1h>;
+      vdda-qref1-0p9-supply = <&vreg_l1h>;
+      vdda-qref2-0p9-supply = <&vreg_l1h>;
+    };
+
+...
diff --git a/include/dt-bindings/clock/qcom,seca-tcsrcc.h b/include/dt-bindings/clock/qcom,seca-tcsrcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..ab77bb343a607813def35276fdbfda927accf346
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,seca-tcsrcc.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_SECA_TCSRCC_H
+#define _DT_BINDINGS_CLK_QCOM_SECA_TCSRCC_H
+
+/* TCSR_CC clocks */
+#define TCSR_DP_RX_0_CLKREF_EN					0
+#define TCSR_DP_TX_0_CLKREF_EN					1
+#define TCSR_DP_TX_1_CLKREF_EN					2
+#define TCSR_DP_TX_2_CLKREF_EN					3
+#define TCSR_PCIE_CLKREF_EN					4
+#define TCSR_UFS_0_CLKREF_EN					5
+#define TCSR_UFS_1_CLKREF_EN					6
+#define TCSR_USB2_0_CLKREF_EN					7
+#define TCSR_USB2_1_CLKREF_EN					8
+#define TCSR_USB2_2_CLKREF_EN					9
+#define TCSR_USB3_0_CLKREF_EN					10
+#define TCSR_USB3_1_CLKREF_EN					11
+#define TCSR_UX_SGMII_0_CLKREF_EN				12
+#define TCSR_UX_SGMII_1_CLKREF_EN				13
+
+#endif

-- 
2.47.3

