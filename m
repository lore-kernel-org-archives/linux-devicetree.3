Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05813D47DE
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785167235; cv=none; b=PwN6nWQKF2FPg//hKlRyjGq63YCpZAtYi90IVhzmibAk+hnC3Oh+3QqH++6jRILVHf4yLqhTUXlf3zjDeXJkg/HNbtQHzSVrShb7v0nGItjLvf90x77uH+2MybjXgtSd3W9X4xUTJ5+2oX7m7zOHVNlfwtbGDYYdPoejLaxTiGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785167235; c=relaxed/simple;
	bh=43kb05RaUpjRitjlYRocMlxAa/dQVEJYd5sjO46qM7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tn+wSZxrxaFPHMR2Afx4JJSeppWlrDZRiOd5jsq+BbghPmgjccffUAxkUGcUbqw4tC4uPn/FT0q78RT3Y70KuCLPYDBukNfu9q2HXup+cs2dB3frlKFKGTIiehDBrEydoi0P6nPORBH/yzISCJBsAPdOgLMlbu6emLocXRAsVKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kOytrHkc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WmVi1o4M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kOytrHkc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WmVi1o4M"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlT844065529
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:47:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S7mjFbopEGBUByQAtuhbKuVftRTpKsVvgzJfo+Z7UEY=; b=kOytrHkceeeRRyIP
	M6KMNuNHbpM/yEMt5GtmzW17+NOWCFCQg95Q9ruyJXG+QD0dyv4VURmelXqILu5Y
	DfO6sy1jfckW7sNY24bkyYYhDwMN2O/OB99dKWlIudTOPnytw3Y/zP6lcmWyq5eT
	VwXntfwk47wZeJ52V5FN7KCf8A/SlXMOt4P+juxUdVN0y4qrd8AwTOd222baYEEK
	phJauopWD+hn1mnM9Xr4geY4v1pJ5oAd8R7zsPsj+V2yqjZoCcSuGz1rKyV/S+yu
	JJCKKdFawp6AU2AbC7YPKITgKJy5K5p4txnjI50bd8nWBRlL1S2uhNVQn6IUVjPZ
	I4LemQ==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fngysvahr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:47:09 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81e8653ad27so65974367b3.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785167228; x=1785772028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S7mjFbopEGBUByQAtuhbKuVftRTpKsVvgzJfo+Z7UEY=;
        b=WmVi1o4M6150gOd+GgfixhZE7r4h6NchELVxEXUTReX16PtfyzjFHNOK1GNZK3EFgV
         crBzib8+7TTbvCL3Rg/j4v21fEkCHDjoyBbe8of7IZkvodEqG/SOIZ3julIJcmvksc+s
         8qG4rHS1YhfeZxQHZ+0348YkomvEBdem7DLzxkX3NKM0rV0J2fW3SpONU4iLV6rp679C
         +LpbAUZrsTVmVP/k9Hh8wP1GoY+3j1qXvMVJCaY+aJlCuf3Ia7fbeBNNWQktNQLIjqdR
         7Vd32mGW+dpvIHdoLxV4whi3diZvXrkwzGNqc5SUYAukBgBAopl127naiIp6Wuh+I46B
         CJlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785167228; x=1785772028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S7mjFbopEGBUByQAtuhbKuVftRTpKsVvgzJfo+Z7UEY=;
        b=fV7+VtIZ0fV4NNlSpq7hCrgWaLIwEVaIc75AyPZNmMymZONhgnODm0RlaRLtxxtgF6
         fUu9fSLghJpQqQpAJja8k7wrmXkP8HD0Rtb0YFjXxiEEdUi36+XlScsvCTCJXySR+TNw
         oFIE1JlFvnPSfPky1rb0/KZkLTELF0cs9uUIc9OTGkWrLUu8IP36jgUna670hkYr/hJT
         pj0U5DrSY6bP4Z2ju3BCWlkTTuyEdFeA9MO1XGUAcB2V/L9Wx1B91csl+s/irarB51qt
         apgR3wySM0C+ATGtCzs6crmHD+Zku02MBn7WFlcyo5UtiqSGgdgkOHrwwB2n5xhJXaOJ
         axXA==
X-Forwarded-Encrypted: i=1; AHgh+RqnzciadvB9BELO4PL6bIvGcTWH8B8D5afInW45/a1A3/PB1S8f9fFu8HeJTcALdeYLvB7Axw6GNsnd@vger.kernel.org
X-Gm-Message-State: AOJu0YwliScpycMCRLANHfh8Xwmg2i1tA4xgsiiN1JqoNJluw1VXda0N
	PADrAicykSE2aPGBn8MJVt20rUYP4IyELbrPvXTONaV7T+vIxZHHOj3lETKwhdLE6Ix2yLd+MMO
	ENfXBEiGUu4QIMdGrKh0hZrVq8pb3s19rWS+sl4B68pRHlIl+ivGIS+0fH5HHbwqj
X-Gm-Gg: AR+sD11jeXCK2Q+Yd5MABBbmJj3T17huRdxtGgYAjigyBoo6z76v/i9SobJxtHEaen+
	M+WLAiLN8bCncgAuNvjSJJ+Mvo9zpTM7YH+kN3DSkWNaTtPnvqVQo4Io+XnMWrDGOBrr3hVEHvW
	OtrWZji6IqwTnMzmznC5tuP5cRYIgN+qKjl1cWd4AuRMJVdm6q0JjD5tRd7sk2Jtq86SWL423pL
	1XHSGWOxJA63y5KqzQZ8kPUYdncEqNTeMUEH0TQwDznETp91lzyed0cRWmrlIpg7sxoXPvBP2HN
	32eu7uVzhoVTj6CR2HykxIYKAH6uXaJODPuw6T+NeB8pZK+bOot2b0LgSZVpYWJ0T50EP0IMrOG
	K+lDWEqK9KMRIbIcUPttgSg8qp3qULQ==
X-Received: by 2002:a05:690c:600e:b0:81f:3dab:372f with SMTP id 00721157ae682-81f9391cc77mr412777b3.12.1785167228502;
        Mon, 27 Jul 2026 08:47:08 -0700 (PDT)
X-Received: by 2002:a05:690c:600e:b0:81f:3dab:372f with SMTP id 00721157ae682-81f9391cc77mr412547b3.12.1785167227905;
        Mon, 27 Jul 2026 08:47:07 -0700 (PDT)
Received: from hu-samana-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f657c727asm33307617b3.19.2026.07.27.08.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:47:07 -0700 (PDT)
From: Rahul Samana <rahul.samana@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 21:15:01 +0530
Subject: [PATCH v2 1/6] dt-bindings: bluetooth: qca: add QCC2072
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-rb3-industrial-bt-uart-v2-1-2d100f30e202@oss.qualcomm.com>
References: <20260727-rb3-industrial-bt-uart-v2-0-2d100f30e202@oss.qualcomm.com>
In-Reply-To: <20260727-rb3-industrial-bt-uart-v2-0-2d100f30e202@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rahul Samana <rahul.samana@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com, quic_anubhavg@quicinc.com
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE0OCBTYWx0ZWRfX61Gbo+LcV5ZI
 ns2NCx1QJUctwAw4CgMhrUHAmWFWQGEWf0NbGvNQZWPE1bmoMZztkTKiy7ts8J3QoCPeMR2NPHP
 B6ul8eVT3VWqqQYxr9QiJUxGgE8y5698rx4EdzSVgZInLvyF2dqPsLj7CddWgtdJHuc+QAAMR0J
 UyZBt89ZFpIbtfFOpEfs3aCxNfcNgxvebDUon2jZK3NUN78N8MUPlpRivliPfHW3u2osii1YcRo
 yZyj73owb/fll5JaBmIogzqq4fUJr8DFBaXNVaHdTzoaDEggD7dZZO3WidZ5xH3BzZdXN+J+EaE
 F8js8AbNImNeEQj0lfcLm9st2cCTTDFa3NREZ0XRZ5Zvh6bw0EKB3Ko3OO84Jxcs4KMFdmjNsT9
 70XCusjWpj/tM4OZ5BkRLkxZyGe+f/Mo2yYCEZcxEtZUDNKcLmUDQsURSQYgiWsnMLFkBnN2IZR
 3sPWEEqUvbt6gC935jg==
X-Proofpoint-GUID: Bvp5aaNuajGmQQX39sM1kOFZoY85xJUJ
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a677d7d cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=o7QFpL2tXW9ehrA7-Q0A:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE0OCBTYWx0ZWRfX4wfyQ18h1IHl
 k/R9/lhLTXt4HGugY5c+aSiLZDy2ZhYb1dVIEdbHb749CwqFnhchkqUtFmo77dQ/N48+nC+dSGd
 rCXf86QAatkTwmN79H6sHTcsTlgOTCs=
X-Proofpoint-ORIG-GUID: Bvp5aaNuajGmQQX39sM1kOFZoY85xJUJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270148

QCC2072 can be used on M.2 E-key cards where the card power resources are
described by the pcie-m2-e-connector node. In that setup, the M.2 power
sequencing provider creates the Bluetooth serdev child after matching the
QCC2072 PCI function.

Integrated non-M.2 designs need board-specific power resources. Document
only the compatible for now and leave those properties to be added with
matching driver support.

Document the qcom,qcc2072-bt compatible used for QCC2072 Bluetooth
controllers connected over UART.

Signed-off-by: Rahul Samana <rahul.samana@oss.qualcomm.com>
---
 .../bindings/net/bluetooth/qcom,qcc2072-bt.yaml    | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml
new file mode 100644
index 000000000000..e4b281ef261f
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/bluetooth/qcom,qcc2072-bt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCC2072 Bluetooth
+
+maintainers:
+  - Bartosz Golaszewski <brgl@bgdev.pl>
+  - Balakrishna Godavarthi <quic_bgodavar@quicinc.com>
+  - Rocky Liao <quic_rjliao@quicinc.com>
+
+description:
+  Qualcomm QCC2072 Bluetooth controller connected over UART.
+
+  QCC2072 can be populated on an M.2 E-key card, where the card power
+  supplies and sideband signals are modeled by the pcie-m2-e-connector node.
+  The M.2 power sequencing provider creates the Bluetooth serdev device and
+  uses this compatible after matching the QCC2072 PCI function.
+
+  Integrated non-M.2 designs require board-specific power resources. Those
+  properties, together with a static devicetree example, should be added when
+  integrated non-M.2 support is added.
+
+properties:
+  compatible:
+    enum:
+      - qcom,qcc2072-bt
+
+required:
+  - compatible
+
+allOf:
+  - $ref: bluetooth-controller.yaml#
+  - $ref: qcom,bluetooth-common.yaml
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
+
+unevaluatedProperties: false

-- 
2.34.1

