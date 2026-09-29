Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD867423EAE
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 03:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651882; cv=none; b=dfeoJoV4ZhuqaP5SMhGSuNAiVEobXno+n6QrRsNNBNbfZA7t3mQfDHQGZgO/orll/xsi68NazLvgED1mZmgZ2MzeZQyXJyetzoC0zaZUZsItsjcIK8KWxmRo8XIli/CkklnlY4Z7InW+lsLeapNQ3CHZdLen4jIK/T3j1oIwTgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651882; c=relaxed/simple;
	bh=uFKjlolwn1ciafhDBmMwI2akc2BNZltPTKgmRmWckzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k3ToElc6b7mkVToscZAO6peECx4xugg2MdToKRy0/B7egBW2a6k2HrkRCHYlX6rmASrB5KbwAbpo13vwhWokX8i+TrlsplOHTnkAqSbGgkViB5G/XqD6qIo+d4pvJTxM9Fi+393kCGzqoRAaE5pCF1/QHHLs3IoAp/PcdkoZkSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RBYjQyfQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aRHSdKNg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RBYjQyfQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aRHSdKNg"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T0id5A4079181
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 03:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dASJnt3k+iJPNvbft15iYvw/242GHxpDWKpgPsBPFKM=; b=RBYjQyfQIm0ZW0Mv
	9bx+8E+EwcRxCBq0N4hspGuNB4YGuxsej+iq4FDqh+o/F9nCFvq6w0rJPK2QVJGV
	ui/0zYqKJIBWorO+gAPf9Tnoa7aeyP12imF+MqWLFJnd1PfutZKgwLFl9UVm5f3S
	vFEjp48hpL3uubhkjYYa2HETFdhrlVOiS9oF9B6YRqAMllOJPI7Tt8glf1qIsyLm
	pWM32xlNb8rsq4ajsjzeHb4N4u4+K9pEj1Mdq76hJLOEdvUWz/DJCIhGwsTl2bxm
	slbiNmIu2kW0nyhd0pTxkKBhIvqVrDtnj+V/+HDbj23L7AfzK7U3VGdsaAwF86hJ
	EdaNkw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyw03hvyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 03:17:50 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3437d0cc8c7so1395611eec.0
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 20:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790651870; x=1791256670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dASJnt3k+iJPNvbft15iYvw/242GHxpDWKpgPsBPFKM=;
        b=aRHSdKNgGFQBrHtWUTA1iQ9WUSf/ipoI+/heW87EMQ+OezCN+wu8rcxl9Co+3gZecm
         c0MVb5uGO5mhFHFEHuVq2NwNhksNGGYZZIzFEZd0kgFVQk5eNLP7wBhb/QgFAqqbT27q
         0Qb4VZes3JhxHG+HO3BmQh61ApGP8D+KR0sfuwN31XXtg6xXcqzktOl7x/f2t5W4hzmG
         vFjVGgQHbnQOv9KaLXi1ejk8w/e9VzarwjqeReKJsAxcPmMfkK1FwPSOfeIH7jv/tzpf
         DNaB5B6XZAZ5Fs/uSulwACO5r6LgeoPZiyv3AKUYAnckgCufo9GlYyq59Veeq1P+rfU6
         Hirw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651870; x=1791256670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dASJnt3k+iJPNvbft15iYvw/242GHxpDWKpgPsBPFKM=;
        b=BGxFfpRSYXudCO31g5Re7MpIEJBT4FtoVXkwLwtBq18t9EFDvxlTVDU6Aq3LTED2WP
         dgpxDpgLfdux6JfZH5VSXd0jcJae7NwvOmavv6OV6JjeZsOPyBVIeAukCRbC5I07NmjV
         pdnNidngohENXICM9mz0KhTKd1J392ns3mNmAA9npjtWczKencsdAkM3qmEP/VxO48tg
         3VnvevubYIq7OLvhjcPVXIWKWvDRjMvG0uZA2H6kYCh2IEK40B3XErumZ4RoSPOKf75d
         EMh3Twlg2oKId7txneIiMSP9NFWhGX4PngyCuyelJBmcIZAO8GMFsQVThA1oh+MEBFcz
         pXvQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4abc9lNYR3+s8Wrd5WhgPt17zQTCpKZYYPcdZ15/6f7uQbtZTpBGrptkk0S1bGnXliLvhaRwUuu8D@vger.kernel.org
X-Gm-Message-State: AFuF++kmT+AIvJ7J8llyJ4EwzQ6mRpd/sNQUb18ORr2TSFKovUvn/5AR
	dMFw+mODyTnA9uSpGylmatB5fw5m6sdMeMnVdo6rW7MgXLdTBxT/oHZpS9bSJ66KlgeDtlmUmgl
	itrKJLayLjpQdIbDOZkqvQYk42+FZXC3p8Cbf4ohM9ypHy/Ax69QKTgd+BbfuXjQ=
X-Gm-Gg: AYBFou1pOGDovhtYm6N1j+2yWqJ2lyyf+FfJQj4yqHCR84Sxp5p6T/Xa5Ecb1L1Dz2m
	+E0LiaqLlcRUYldknMu4zK0vmVLLGm3Ez1swXf/aFc1Iu4dwdEk2RGzW22YThFljj/ZPgD+kHgb
	/pY/EIfX6W2LnkXBPzKegCdbTW4ky2N7b8oR/KffSQwXZ/8dpeetOuJVLksWrwARxENUPupk2Jv
	Q4sHHN0xeO+mBl4SLkSZZtXEsXyu80Bd51TGI12DaJc9uxfRTeF6miWh4j54nI1W5oimLEG50ra
	DKnZLkhqHwY9BU6DRtEngz83v/j32aVu02+EhKVeWTfoovXPZlcAfSyMudcxx/yTTGnz3PrN2p+
	U/HtPlfz7Rlco4YcCHp7t6Og9Z69U3fzxC00rI73vVAFE2uIsNwYQtSEFuck=
X-Received: by 2002:a05:7023:881:b0:143:2984:6516 with SMTP id a92af1059eb24-146d096b3damr13332471c88.37.1790651869986;
        Mon, 28 Sep 2026 20:17:49 -0700 (PDT)
X-Received: by 2002:a05:7023:881:b0:143:2984:6516 with SMTP id a92af1059eb24-146d096b3damr13332436c88.37.1790651869421;
        Mon, 28 Sep 2026 20:17:49 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad4028a9sm24789368c88.11.2026.09.28.20.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 20:17:49 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 20:16:55 -0700
Subject: [PATCH RFC 04/10] dt-bindings: firmware: add RISC-V RPMI TEE
 transport
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-riscv-rpmi-tee-abi-v1-4-04908b81d885@oss.qualcomm.com>
References: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
In-Reply-To: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>,
        Anup Patel <anup@brainfault.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amirreza Zarrabi <amrzar@gmail.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, op-tee@lists.trustedfirmware.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfX7UvswKVh2ufZ
 eqR2RlccddWqlhn+oIJqeWxXzms4RRlQSyv3GVl+T6qgkI3h4RcWfcTqN8CSHJtCG8kGlUQRMI3
 dWHeT39FOrStsNabo5qww5Xfg4SJJ5I=
X-Authority-Analysis: v=2.4 cv=SIbXx+vH c=1 sm=1 tr=0 ts=6abb2dde cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=X9k_jdDNchH65YliorYA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfX9DJoNgMa/4Km
 2Kz6EPaKXj2e37C/hIblpx8Y4KQourydpVkNGOuVsmBf6CGahuK7unpVyjbs3DXdTkG2PLbYxBY
 QhlC+O9ceEhZiWu4q9+1NFo8KXA9ij4wtA4wr/ABDQIPkOqg30I+puBT2GngQzcXho/69HU87gY
 3qq5NApXlhFL7IaqXSxBu7nPNuZtPe1DfUpDEW9l7e7FPPiTYhGIcb6PenAFX40/wy1oyRJgliL
 9SlAGDwSVNEAnFKF4CntdOQ+/dPS7LsWnvnfUCVXZm2lwLd9xanoFVaWlR1uImAMy0rqALuzsdG
 p8gp50iqerlQeba9rENvskVCgqsEHw/nhGCICokwNEtf1AT9U8e8SQCk3kxA+7QAZ9oELVZyjoo
 LswXfGoz4HQZW8az0K8Sk13JQquJnGj/c9AFAkmLLbf3VbgcLyhKJkkOxBGadOowdf3HUts1sEV
 Qhkle1pWu1CbewbP4aQ==
X-Proofpoint-GUID: _ybQ2-oj3H1jn0KMpXimhRng4USF7hEk
X-Proofpoint-ORIG-GUID: _ybQ2-oj3H1jn0KMpXimhRng4USF7hEk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290012

Document the platform device that carries the RISC-V RPMI TEE
service group over a single SBI MPXY mailbox channel.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 .../bindings/firmware/riscv,rpmi-tee.yaml          | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/riscv,rpmi-tee.yaml b/Documentation/devicetree/bindings/firmware/riscv,rpmi-tee.yaml
new file mode 100644
index 000000000000..32287f27a625
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/riscv,rpmi-tee.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/riscv,rpmi-tee.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI TEE service group transport
+
+maintainers:
+  - Amirreza Zarrabi <amrzar@gmail.com>
+
+description: |
+  The RISC-V Platform Management Interface TEE service group is carried over
+  an SBI MPXY RPMI mailbox channel. The transport discovers TEE services and
+  creates child devices for their endpoint and UUID pairs.
+
+properties:
+  compatible:
+    const: riscv,rpmi-tee
+
+  mboxes:
+    maxItems: 1
+
+required:
+  - compatible
+  - mboxes
+
+additionalProperties: false
+
+examples:
+  - |
+    rpmi-tee {
+        compatible = "riscv,rpmi-tee";
+        mboxes = <&mpxy_mbox 0x3000 0x0>;
+    };

-- 
2.34.1

