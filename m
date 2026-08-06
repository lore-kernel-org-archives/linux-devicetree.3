Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7038B47279E
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 14:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786027140; cv=none; b=ljUV1wLpooQ7nfy9L5XUoAIW4C0BwZUvQHfDSfkmKraXDeClqyqUbcJYn7EZ8qsXD3KrORAlR7Pa5q8mimP2XePv7JIGFMomWquFwz91PVs3Wt+Adr4kjptlSyFv4bTUop3r/9h0Z3BnvcV9/Iqsd/icmQhv0GewIfnAAXDRY78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786027140; c=relaxed/simple;
	bh=xh4ucig5hPRkaGw1GggCAwEU1pqdfnGTPbj3vUFpt5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jAVH+A4BiFsITYFuDH6Egi40gu64aY4P4hMYHgfniWgA5MkwTm1oxpRyy/+eS1tRkKFYlkSC4fcixXCT6hhR0g5lRrzYZopDOvNC8IUclQNca8cy/Vd6W4kIZKTKqkMyiEHrSnRFzcujPn6anSHukP9kOKOXq27D7C3j7proeyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d6ElbH6P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fx2dpWx6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d6ElbH6P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fx2dpWx6"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769ncu11580560
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 14:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=; b=d6ElbH6PPCz9QX/b
	BLbUMMJyIPdBUt6nC/OUVYRJu70FjQUJAa7LpLyG7zhEwsScwo1NGcXiHmzKgeSg
	DYU8w0xqtmCJIWKYgCXBfDx/xfUTJCdzL1u29j6IC+sObGK/yHh50oe8eSIAOlvk
	976M3BEoKD5MoE4SNLDq7BNxKXvDUfxcaK1YJAd6nzdZwvKiZFSXQ9vzebS9sYel
	KFkMqqoT9+O0OtQNIpNFVm1w692AacBXnc1bZO2Net0oojLqeyRhN74XIV1ZKHFG
	Axe12rUOHhUNYN1nxi/bgL7bUO6lLRce7AcRCt7F/rgvB/jLDwlU3Zyh+00QU14W
	HuUzJg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvmrjj8nk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 14:38:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1a97644aso24832171cf.2
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 07:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786027134; x=1786631934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=fx2dpWx6Ffu/uTDPCgJSqlfPHnGG1eN3KFQd6nA+4fyZFOsBVdAgkw83aFZeif3AJ0
         MuJ2oWCTWEQMeofGa9C7v2WQr5wtDON21MiruUOqmoHyx/ITIhiW/XztE3eGtRASRuSZ
         M/FcQyIIYXT1hNuvTbIM3irO+h3CLPqmU6xSbC++9Z8J9yx2Nws8p8k98W+zthfU2WQ+
         BQbFyxY8pOflaKkqn8Pb9Zw9t0+gjsymdO4nslE34xgInuFchglxWMLmxyDe94GxNmB8
         0S16i0SvnEKUfzU2JkEabDIKa/B7eKore6sL3dTQbT261cA3hKCRRSZQlpeEDPoz9yc5
         ge+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786027134; x=1786631934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=n6XZB20bB29cQNsVnPGZSVYqKhlAvLDMGpdwCU7SaIfojSU3/T0yOfVRJRVk+YS9pD
         1TWB+Zxupxt0OAyljODBPOeMgm5ruVt9waE5rY+p1wApnvZ/B0Vww40SXntQtSzBJhkK
         ccauOY100rEqp1CXe4jjDN9Tv/bRK+RR6HWtrhIkqVFHfzgUeMPKcoRcK43JnQOeUmpM
         iFluVK9fu1TvoJ6eXf5kSABuBSv/k6prMGh/A8K6UsRXpdjv/scS5C1d9XJK1IMmKmOF
         cvN9D3OZNhZpft0Ss2oQRDCY3IjDS2VMe/QkI//fAMXoWp1HxKxFWc0g5W89f2ldFcfe
         9wnQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpp5jWf5+JE66G58W0jlem3MirR+3xw5qSBLPjG7YhH2X6oGh0k1Oo7RpWhedQJIorGBJ0RtTUmrqA0@vger.kernel.org
X-Gm-Message-State: AOJu0YwL0wZhEjmi152uPmYetEhepIauCgpI6YfLhkP1jhMOXP+3LhlX
	mmizSc5tl388pd+76Jii7uz8VvOexLb803X+fDqeo7xNgscrNWkmGTDWu1MlSlCHXUrEQdGntdb
	j0sUq1y1UsqfzaQrEMFw7jH7UG5VESkuE6nDVwvIsBuQD0oEMcgUZ4rA/toZyusDy
X-Gm-Gg: AR+sD12YaUtdBWhACRGhrUwXk7+2xBEBo6bIfZWNXRk+vqPHEZqwGcCVeZszkIQ4noz
	cgYm32BVo9y6U8mJxX2blwElvw71D/YPO8w1SVksgirTzQARksXpq6kkvhF8ZqBqXxYjJr7vCUz
	lQS5D7eI9ew4LtXfdqvqR1/ND0x3wH+vCpTfJVGCEt6HgH6v5Ex9hyo88klaGqvu4LtrVA++583
	XoG4Uj1DqrBvVflj6Gcn3X+Fccv6CVZU/uqGDw/6EEaoz2dV/Gya8OkCe6GsPvPP2jNCnOeVFGo
	D73wZlIVBjlB90knjZjVzfg2vbFQSkjZCJS4YKZn5BpZqb9D32G8+SPmknMxZpbMEpZp7fkGQx0
	ntSHHQlMplqoig9sYdKNu1SVvURXb30ho48wqf3+FYdhBkVWlSqjD8HoHCO2AuOMsdqqJ0NV+Hm
	fICuzBT4bxsWpRs+rx2SZPwuVn+I8ExuP+uvJFLeHrljeeHOM9ag==
X-Received: by 2002:ac8:5cc3:0:b0:51c:1532:ae93 with SMTP id d75a77b69052e-52ce6146122mr164305381cf.26.1786027134280;
        Thu, 06 Aug 2026 07:38:54 -0700 (PDT)
X-Received: by 2002:ac8:5cc3:0:b0:51c:1532:ae93 with SMTP id d75a77b69052e-52ce6146122mr164304391cf.26.1786027133693;
        Thu, 06 Aug 2026 07:38:53 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([90.85.108.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2036276e58sm270552166b.28.2026.08.06.07.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 07:38:52 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 16:38:36 +0200
Subject: [PATCH v10 03/10] dt-bindings: bluetooth: qcom: Add NVMEM BD
 address cell
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-block-as-nvmem-v10-3-be598b2a5606@oss.qualcomm.com>
References: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
In-Reply-To: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=VNPtWdPX c=1 sm=1 tr=0 ts=6a749c7f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=JDRa4Jy4r6/BpSpxP2cCow==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jFERsaRKWwo8c2z-USAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: kSAbN8yJRJ5bMe2i2X3f66mRKJw0EC0z
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDExNCBTYWx0ZWRfXwyw1Y4pN1p1O
 InYuQDaHiQJAEpUqijfjQQGsKiVFRR5HlJWe95IwbQJo75OGopTPtPh9F/qgei1FZLHGvbBjHXN
 SZ+GM2yddX7FWoesBKrpmjS/iMTbDYA=
X-Proofpoint-GUID: kSAbN8yJRJ5bMe2i2X3f66mRKJw0EC0z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDExNCBTYWx0ZWRfXwzeMej2mQ8l1
 qEqBrZMQVFd7V+SQaONBDd8Dd53ftomPSDtb9qj8W3yXBZIcwwmH2HkxojZuT1qaoqpgz5taKpr
 Xx1F0IZjaTiOKxmW3BkYoPQjUJUwfKC2861D08KCmZcXsNBKYP0G//c0s/NwlWQw2VfM0m2dVq1
 zdBham26tu1NzLHfGS+0uXUiP1TjOt0mOUI09c0Faw3vEbr2MpLZhBNSinTWQrQPPuGs8y1oVIe
 Wo8t+r58ttBNtwd2EroMTE2c6e1sLpgCwyV65L/xaqCNndel0uShT2Ws27ASXhsVFDtTYFdwwwz
 YRxOyqEkD1kKahK1Wpl5U5L/TOg02AXf44Nyec5pSigfpmkvBdKdSagRKa55tTkYnkfn/ovOESF
 kLf/JWuPeilRDEN9esGeswwPyH16Nam495anDI/0Zo2ZFerFbEUQswMdj1haAa4ujr4YQvoK23j
 32WuwQ1a9UKNvZ9+Nsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060114

Add support for an NVMEM cell provider for "local-bd-address",
allowing the Bluetooth stack to retrieve controller's BD address
from non-volatile storage such as an EEPROM or an eMMC partition.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
index c8e9c55c1afb4c8e05ba2dae41ce2db4194b4a0f..7cb28f30c9af032082f23311f2fc89a32f266f17 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
@@ -22,4 +22,13 @@ properties:
     description:
       boot firmware is incorrectly passing the address in big-endian order
 
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Nvmem data cell that contains a 6 byte BD address with the most
+      significant byte first (big-endian).
+
+  nvmem-cell-names:
+    const: local-bd-address
+
 additionalProperties: true

-- 
2.34.1

