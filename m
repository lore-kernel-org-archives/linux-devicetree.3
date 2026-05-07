Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334A744D6BB
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 15:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778167495; cv=none; b=lG0q25ybeCMkEafOxa8/WbM/97qMF7ShvMuGSklhz8ZX+tPZSSxq4FR/zW7+qyXOveT/3nbBZ/NBfBAsN9HXuKIFMQAdKW4rQNkM3j/Y8vcVN9MEyQZmfSMMXWne/V5h7wTIJo9+lBE0ecaH1JthHjJkmWF9dmWfgr+OWfCduag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778167495; c=relaxed/simple;
	bh=aWIeQEdmSLhgx88ywuNXkmaIu8+4RM4LnE64b4MEZHg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DITxsTCW6jrFc3aAhDwx8ls5WWusWze1IY45nW63mbtmtSi4juHnO5RSxN5fPh4euzDATdMV0GUyWdX3py6gDtrOI9yFUuLMaB2ZijaMLnrRRhdGVpasDJGow2JpCHYRbHLGM1HcFRmn4S7EAjN40cEyIbg1QrmxmeH1EWqBBM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A2LhJinX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ww/ZppNl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A2LhJinX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ww/ZppNl"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647BZ2DL682842
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 15:24:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BmKkWNysoQOkzQVu0/HpO6GRxwgi9ndXDewfJyYIvjs=; b=A2LhJinXkxFI/S96
	9vte8eeCRxFZ/E3ZYfrJQhuW21ihoIaeeqWVGUT9ZnEWt1g9Nqjg0us2pQSDCU8o
	puKLgB8ksgjnhr+8qycY2wZEqtnKH/wo64eSLK/DgtapCF9gGyZr9Yhp3EEZqXFX
	AOFJ0tp4dfPdwVx6xtbBZfSxwIRsO9nzFdFO2ewf9zbsaanbhqgC8AM9eWRPGm2n
	4K4k+eogj+kc+t2F5nNkwR9xmaMXKzfNi2t0wdIAw6RVTViVO5T8DfxVaqIr9qWK
	na8BUQmp9zy6TMKuJ1pgBd2WFa3Q0sgXHSdsRyFv8baE99MiF4vyAAK78VuqhYAN
	Q5COHg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhat8a5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 15:24:51 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95cfcad1f82so469779241.2
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 08:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778167490; x=1778772290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BmKkWNysoQOkzQVu0/HpO6GRxwgi9ndXDewfJyYIvjs=;
        b=Ww/ZppNlaLFL0EqBmpKzQputg8kT3OWojN7Uhvdi7r/V8ZJ8eiC7qfjreIC0wmNfdG
         tcpUMaMwDm0CeJOvWzXz9qTW1RA1Sk22grbaLzpEA/I6V27sm4qVQDph5MYITjF0fvLh
         QhF1cJ7oYjl1n6bIL2pOJ2SXC7lJUoNox9Gc6DoWeP2xTHqdWiRNG+STKERJMSlpHgqd
         WolNlsgfG91zjsj2M6S6pvT5b8wSGnl9UWpBPP+L+ll9SFoHIT4gIbxUqB2c+DjHT7kP
         ArqKwd52mPUb4Utufn8Jzw89fLUm02NFK9hN0Ro6a8mJZm3cjoopdhnvnq7c+Wt6rpd+
         VvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778167490; x=1778772290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BmKkWNysoQOkzQVu0/HpO6GRxwgi9ndXDewfJyYIvjs=;
        b=A3T2R28jNfR8lNiI/PQLqoNYnQgCZ68FfJnEM3JYz778GJUiSNMhfW0gA/vKXW+hkF
         WuExarXOfO+lDzIdh6f8P4AUE6vLa5nsjbI6ieCTTLLjuEfV8QRQdT4P4a1yvZdA9NBP
         AtqIVLZmEbw1eBM+c+On7VkqzTWEnf6W237WLzoFUMwXXLLE163x6CI1SjitVHnpKj1m
         hRcEUPNwfIcEc31HpYwpBk069+SMKhbXE152jzMJWWxUDhxDtxJfc0/XX2TIC1b+UWSQ
         oeN92+59QVonfoL+wJsqt55P5a+GyPvqts3It2U1udw2QMxHwZLrgLK9Vm/EBTCbD7wp
         S4Og==
X-Forwarded-Encrypted: i=1; AFNElJ9s3n0iF5wORTfxWNnoGPdwwG89q0AjteNxOU3B/A2vX0ZOK+W9l4fzxo3ZMS3H7JE/hwcejLL4+tdh@vger.kernel.org
X-Gm-Message-State: AOJu0YxhbTaYHSiGI1F6IjFqn7w7QQ3/DOCvJ7uZIzxlQ6IX7LgwhF3/
	TeP/rMs8y6ZTXatHl0Mlh0CB4I+vYLXyV7xG4KzoGTGgcZmbSB0eJj52Ecjx5amd0xaSNg1wX7S
	i6zI+gmFn5ZTe99/muHmG9Xyms+eEawsqIuVXaILmKlrj0i973eW5Pt66EAsLnMG+
X-Gm-Gg: AeBDies2d/mKSTbPWPX/NpnW0K+BY8avt3W4IPNObpGD/pl++BAI2wvgRPR3iUt1137
	05RNhTnU8RzHZbtj1nJfXvWpYcper6/4dGZrAVnOSN8bPhZ4n6RFPuHS1E1uivYbUgHM6454BNR
	dgv//akr0L0+VNBd+rqIjsqANbm4FbGK7/5xP5+KO4RRg8CaxycwQWR6JA5INZwuIZKYwJXiV/a
	McQqSgYCvNSJO3zsTmaVo2nSM2b5NzUY9kfzn3OYr21SFINC7/QMwuIoK0YZavOiAzB6lPH1hP1
	wMPYqQ7I/WjfB0hnfs0bDVmVuQWFm3uW55nosR6QeGfQGYj1S+pkyI5zyywbKF68HLG9V/NvEqw
	SLN8NjmzK6bczkn56mFmmX1VQFvShXJfnnl0MD3+ymgceZ5Utc2Gpe12/9qWUvZ9EGHUzHwtbL0
	hICKAnh+Nkd1b26SGiCarGWrvcTuw=
X-Received: by 2002:a05:6122:3a06:b0:56b:8e1c:582d with SMTP id 71dfb90a1353d-5755974b78emr4681443e0c.14.1778167490332;
        Thu, 07 May 2026 08:24:50 -0700 (PDT)
X-Received: by 2002:a05:6122:3a06:b0:56b:8e1c:582d with SMTP id 71dfb90a1353d-5755974b78emr4681359e0c.14.1778167489785;
        Thu, 07 May 2026 08:24:49 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bca583dd7e4sm240966b.58.2026.05.07.08.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:24:49 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 07 May 2026 17:24:37 +0200
Subject: [PATCH v2 2/8] dt-bindings: net: wireless: qcom,ath10k: Add NVMEM
 MAC address cell
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-block-as-nvmem-v2-2-bf17edd5134e@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE1NCBTYWx0ZWRfXwNYMbqjC/VC8
 iMaQkcqp8FJZ46iHV/yNOWxIpnFZuK1WKn7GDq1vM93DoTGrisUx93UF6of+RY6HznfeJfAFh/p
 fdByPCwcGcxoElZNcsFpbldpmJ02M4SfgILHYcqh8nHEnbIuzL/m2wJjmhN2BhW3IM2sP2gwFc9
 icesbK6i2a8xW3cFkt+QyBGc6n3qbJzPTNoRRW5Fer+CUzaoBX7MxEgnuZSYkwcVbdUawTIcQRR
 GEDjI5E86hz9ALVRzJybfEEeJbC+2dldeygR8b87uwxf07v7gyxpbwdiVVS24Pmb/70zEGkZHDT
 61rkWNlrIDS0IiX7GJQWY0vfkUPurye48vanaEnLddXgK01pjjOYns9kNrfFSxCO7ms61KbfcJG
 AWW3OVka6UxozfdQRmr6+zN1xWoRAi8F4CLh8P1zkWJgxjCZvFcfyuF6XTiEOZys6OplPJOc2tB
 Y6sIp3uwuPlVHbk8hlw==
X-Proofpoint-ORIG-GUID: 9XyPm4_-FNFOPgi-dAZ2zzuZXOn5s-2C
X-Proofpoint-GUID: 9XyPm4_-FNFOPgi-dAZ2zzuZXOn5s-2C
X-Authority-Analysis: v=2.4 cv=ReWgzVtv c=1 sm=1 tr=0 ts=69fcaec3 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070154

Add support for an NVMEM cell provider with the standard "mac-address"
cell name. This allows the ath10k device to retrieve its MAC address
from non-volatile storage such as an EEPROM or an eMMC partition.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index c21d66c7cd558ab792524be9afec8b79272d1c87..96e025cd1e3acacf3da270ed43955b0d6acdb7de 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
@@ -92,6 +92,15 @@ properties:
 
   ieee80211-freq-limit: true
 
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Nvmem data cell that contains a 6 byte MAC address with the most
+      significant byte first (big-endian).
+
+  nvmem-cell-names:
+    const: mac-address
+
   qcom,calibration-data:
     $ref: /schemas/types.yaml#/definitions/uint8-array
     description:

-- 
2.34.1

