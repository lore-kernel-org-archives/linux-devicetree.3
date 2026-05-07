Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA6B451054
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 15:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778167498; cv=none; b=E66UII20v5ENNzrna+7DL2uJCr4oCatmFK+gYfh1zB7jCKAKSkdkEkYiris5DU4d1D+6m5V1NIaOhhgb3zquUvvSOtwJLC6jrn5EHYaan7w06VsHhCSihN7vixfcY9a3X83vPVoSlbhOcXGh+NpTi8fpM8yluazeRaiIcyPdZUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778167498; c=relaxed/simple;
	bh=RjAXLDtyeqYajrszhA7+nXfORAO+2o+t2+Lsa/IoOi4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E3gRXcESnm7PLQT5dMmTM5lGABOCnlQv76zeepjNB05/BHrk4/b9K06s699sFztGu8TpeAeOkxsGGfkJdEQqJhW2/g/ZW6ifm5i/MSGFNE2uo+fukIPsEVwmA0+KfeFdkryFJce6MnKuCjh32CqW1DF13/m5YguRiTK7zVC9qLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pngJchIU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jxI+G6b3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pngJchIU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jxI+G6b3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647EOuMc1424459
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 15:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q7Clh3n6Vth4q3WERt/c3dsM43tyAEU24nXfs697yQY=; b=pngJchIUuTR6hnjQ
	lUECzDHVo3pz1dlhpiqmaq1DuAFQv80gbFnsc430vvYvth4mo1bwdyR6UWKw5WdL
	WOpcq2EHSqx0x7SuRWqWe2LCyY625A/6sKNH2CPBz1+ERlw6lSn9VmVhjg3m2AjE
	9xjqaSAc6WqXXEOq/Srh54PIvF9/IBE1T0VyqUIqyRFa90B/3Dgo/n+591Morvba
	unefJ2L0hLpbQtFvm9AZTpw+nb43cU0FWeITrCo5GCw5BvFhhlt8ia+b3JuFJtgM
	lcihyLA5QdlvrdltBs6JtiQmmkeQ7kGuSsh/wQ29S1Y3j4W5t0tX7JFr9FIvJpJx
	E+BCeQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0pqfsqv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 15:24:53 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56fab6d9242so2266895e0c.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 08:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778167493; x=1778772293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q7Clh3n6Vth4q3WERt/c3dsM43tyAEU24nXfs697yQY=;
        b=jxI+G6b3mTV3gazoiC4aUSTNbP5wqPMTene2mNpHXaXsW7p1Onp1Cp3VYHxEi1ACdj
         NGv6mZSC2cl5w5ZkYaK0AFfSCz7XzDMNjVk2soWHW58RUjNSwPaSofUssRXD7uUc7oIZ
         5Ww61+6zHtUUvujAIqaCTRHRtvyY0Mmw6BKQM31G6jgDY3j7jcaOgfnhRD9MRi2LDDeN
         6we13Oe2MnNANU2vhdnpgfbs/keHR9uTU8W2gxxLgDa/G+Nh4YGn8e3U05OyID3+ycJ4
         mIqAjVk52B85l6VQmIuxOo1jlKVt8PV7oTAZflvmlMBOjlki5XwhZrkqHWjcDDU0QDP7
         FXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778167493; x=1778772293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q7Clh3n6Vth4q3WERt/c3dsM43tyAEU24nXfs697yQY=;
        b=dLs3zBzZZ33YEIwmIYUldf4ZPAuUTCpPC6wWEBOcoI7cwEN2HrFG1rXNXclOSnJdD9
         EQxgJOdNAij68hGJY9TFhrlQwe5NQ4fS76WEuxVqTJpC0qIm/cM0EX+eLwcTk1xByHED
         UWYT5CIYCr1rO30TIr3KSpOJKBOBNmfJ3W6TipBEUl0BI9hbUuaVo+Z1fkL+7WM3/WsB
         oYaMokaPp3A4H+mU4MfvDCYjCjJRGu6NIZyfU5R/rCvLQcXOqKJK4bhC7IBGNUO89W25
         HfVGbAD5uReHOzaJB6OYgHudee3Igf8eHV7ZNCb9NJ+ypxxbgZrvX0cN0j62CIwaKG05
         C/zw==
X-Forwarded-Encrypted: i=1; AFNElJ9bkIV9U1Fr22BmYGA1K2+Y0vlsI7yTxYQof4b3akG2pkDesYO0CwgXLg2oU8l3gNyByNv6oRUcv/Ks@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0XPSTm++v0MlRZ7v33v8Gde8UUfpryhNS5gBx8Zyhccdf0PjJ
	+s5tb1zfoyZavM2gNIjwpbUl5JbyvimrPJH7WobgYATYzhUbL53VHLyNLOs4DAWndwVYZQzlzJf
	TVzFM24MFTiANoKbJeoYDFqVBRQd8tIMR9ko0WHq+yZxUC5soDnGi3z8lmIiDTcAj
X-Gm-Gg: AeBDiesfS5Xyh/KEcpMsCoqxcmUF3xfu+iXcy1TiG02112nqk7++dgYym6gW0GcGoKW
	Uruq3W0ugcsUIym1QX0lYo6m3n1pWJCmfdAyG6D7wgXcmG6mE9qTBpmrDEoYLi0F1CA+91dNYkU
	D6lX2JBJrHR6OCZolpWQBb/KdX03jQd9u+SKUqYrSUMBkH8RnxDd4EPAuP0luzj1W81SitiiM/B
	HhOpRPFCavjBjIlJ3AXz89j8v5dsAJ4uPGDIbKKz8ogNwV4QMBDUguE3XttfQDIu1cc+ULk4ydd
	N6yjE1bKgPW2fbbNohDocdvU6raXR3d0L4U1I2HKdVFXqDEa348mZla3WI2mb6Is9GgLP73we2v
	bKOh2YugsfVPQiuKTOtQJAjR4q7i0QRtzryhsIgUy5UkYyGbT1VEnnyCWwGA7HYXZpyJVQcfJZZ
	L3w4lLCOBPRtKNffbr8eb+TtTz8NU=
X-Received: by 2002:a05:6122:da3:b0:56f:b0bd:2276 with SMTP id 71dfb90a1353d-575591f7b22mr5439003e0c.0.1778167492593;
        Thu, 07 May 2026 08:24:52 -0700 (PDT)
X-Received: by 2002:a05:6122:da3:b0:56f:b0bd:2276 with SMTP id 71dfb90a1353d-575591f7b22mr5438965e0c.0.1778167492169;
        Thu, 07 May 2026 08:24:52 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bca583dd7e4sm240966b.58.2026.05.07.08.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:24:51 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 07 May 2026 17:24:38 +0200
Subject: [PATCH v2 3/8] dt-bindings: bluetooth: qcom: Add NVMEM BD address
 cell
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-block-as-nvmem-v2-3-bf17edd5134e@oss.qualcomm.com>
References: <20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com>
In-Reply-To: <20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com>
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
        Saravana Kannan <saravanak@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=TJB1jVla c=1 sm=1 tr=0 ts=69fcaec5 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jFERsaRKWwo8c2z-USAA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE1NCBTYWx0ZWRfX9VU483p8wfgi
 xUGuWSttAEN1aDh3fTk7aasIVctrOIw9KfLH1xw9n6gD6cVY39prpo4SiOSFjKIn/nN1nQJ4ny2
 QfGMyf+61pavcjoAP1t186s9Xrzx7uIjarV6YH+LgkEXLc0cHJl8osUAZhDD3dVe7CruRPUrogh
 K8gwnCIv8wg6MxB3isWlO5IeGGwGAJ+83Pb7sTXTOITx2f716+IMGpX0B1eMT6cVMre5zJ6nyWw
 dSU9VYZ2RKEJCezftkz0EosHZVDtvitqDeJt+rpph4zx+mTNoMWdDjy26Mju7YyN3asir9dJkB7
 WXzeiMiZFEJvoAjxSH+OVqNfDL5yYlb2AOsrKei5S4rTY972+ajAVhTRK6hLCAPlljDS/GI4scG
 EfyXH1dkFU5+CtL3cZ0qKNtXsyi3nTghqfg/PL+j8v1VNKXWIDYIJ12fgGmFp2cvvzcKFexsgof
 esy1s+47uQpVmOPEvTQ==
X-Proofpoint-GUID: d_A8NsxcXI7KsxEMUlOtW2VpVWpKGXxM
X-Proofpoint-ORIG-GUID: d_A8NsxcXI7KsxEMUlOtW2VpVWpKGXxM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070154

Add support for an NVMEM cell provider for "local-bd-address",
allowing the Bluetooth stack to retrieve controller's BD address
from non-volatile storage such as an EEPROM or an eMMC partition.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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

