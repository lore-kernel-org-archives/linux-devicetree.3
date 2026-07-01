Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0693B4B8DEE
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 16:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782921660; cv=none; b=J1bbDgaoMmOLTBD+dBeb8LEzbMz9IfW89X4z+1UeKp4+h1z73lOUXAbjgFPSCCvY78WMp7b/0deqodqC7QEq9KscroX9m4FbiIDnCJ+H4mpiTnT4de3ppSR6HJfQ4z4L468+ddJmYR59yl2ovi6yztNMI9HmOXKrxWUSRBhJJMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782921660; c=relaxed/simple;
	bh=xh4ucig5hPRkaGw1GggCAwEU1pqdfnGTPbj3vUFpt5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ttnls4HLxMJG0fOBcOYGbwDosHNZ11VylQ+Bvv7ZUfngjJK3haMS6F73E9DivifNaqY1gWRkGxe+DoKPNyf0V7/73EZR+pnraQIN2nT4LWO81Yza6eOFSiQqd4mTAnLPKEoKAi9ktAEQrSaSlnb2mh6fxA2Xl0G4RzOC96IPObg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NbIMQfWk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CPXHx/yA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NbIMQfWk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CPXHx/yA"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661FoBwQ1546202
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 16:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=; b=NbIMQfWk/M75Jc/m
	JJcsFsiD2oORCimjwwYEEgLE4CCbKa8/jk6TtZTAo2x1Chq82xjvwdmFs4twAiDE
	VmDSeiTYXtYJ39ntpwwchbR4xciMLf94auLLm5dXenL6roE2PUu4b2pcjDlKN9xr
	Tmqt2K6wYY4XM7zkpb8EEBtYVMordmmk8cH//v311NIYAS4Ewqa30tp56XPJEkxp
	NnUVh1GPoJ9JUr24MaNvUObsxb/pYWhBmwiTgocSru7GcYIPCxOqTEcs6tMXN12J
	Yoiz/RgXGsjpYOtHtjdn03/y2bD6I/b9+OrJm8s54ZTFl7pmFxudXQyCt6fIC9on
	tk9Efg==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sqshmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 16:00:52 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7ead32f5c6aso494703a34.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 09:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782921652; x=1783526452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=CPXHx/yA9SWZf/msCSHBnGg5vUirWSVlKMjclcdpQbz9wzcdoQZOJ3TRw+viG0Om1Q
         BYMARaWiEbNMkE/FqE27Iqny7dxlw5jiul5y9U83SnjXSFKQl5Zc3u33kb/K1k1+rkGb
         rL0yYGcZ9dBOpCcnMF3hf3fo5cT6TNKpHqnX9ByRFvJBZxbM9H6+iaMhOywGzV8axqLF
         BrvH+CTr1s2rXcnhJYRAR6Td0aoQe2zH/L+TTvkUKtZJQEoyTRDx8+EGHA2Su7O8uL30
         9GWeiHhqDGd43JNsdv+twEE87Ad0DuZFWSt+JlbK5b5lqGtYCGq6X07izwZFLY0BnNoT
         Z/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782921652; x=1783526452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=L4aLJ0Sn7oFaAkWV+I077xQTMGFapupTUFuCXubVrzx4rn9XKqkcmTCnwjh5Q5J8oB
         HtwYe/N2ibKi1qIugOL1C0QcI0Efx5MM04M3xhwqSDkE3ewcL9ty+UmN0+8UkWfD/FJO
         pBQoevkj0whvaL8STTMzn7R+OcTuiWmCXRj3p/b3EN4VUJG5bklJZFoz+eJVsDBVKhX8
         RFhbnZ9fgETOGKmkgu6kkwJikTTaKmmHmW/3ArQo0GZGMyKW66uViKlN2raCruC3G/Z+
         dQspmFVRGkk2PVDCTKs2tvY6rjsTgIqmE/efWYiHrFZgIi6aGIS3qvQeaeuXm0PtL9oR
         Q+fA==
X-Forwarded-Encrypted: i=1; AFNElJ/SCd6a78WILIGgo6oxVgYs6QA/W8kdoQ4FhZdgIhH1d6PNQhdXd1CsLCfPLcunYJ9Ohx7BvK4jLTAp@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8IoklbucA8ncbsS5dtrJ9q3KvZ+yZ02DyA2M/dP7z2ow0d/xO
	AVXqjnWnkTYrQF3Mkrvfk7mLNFCnibJT/qvCzI2258ozbWQ5PZ+OssqCC9xXZ7+uwcjy+FMuhwu
	VTWqcutIZYaiMsl5rUxLlEEzUUBgD8XHuTukM5Y7zav1kiD9Kchfzn5VpY89ba4CZqmMT9EcTcV
	3awA==
X-Gm-Gg: AfdE7cmARZgE8TmDnYbwulr+EaH8bhzlMC9627qLkVd2T6nmpwkm+Bvp2sCE8Bh01cW
	K9RH5uoJNF0nKsMbRlwRkczrSnUDKVt6OG9zRc7+EwD7CDt7DUuu+VqWAZFFuIAy5v5/rkrU0VE
	+AIuzxLGxZMgoD5mI0VgapsU+LGdljLltmvP+XiD/M0/nQEm6n5Y641QzRQTmE23S+x6jkw5QE/
	zW+JWUe0pehM/RhU0EriE5jVoGSS+xYYj2TAixWDiAoX3uxYU+m4PEcwlt6RhZE/H17ex0sJE9h
	iafBYLCl7dyTeJmT1TI2+YU81qZ4hy08EtQapXcC7CTwQaAPjHBqn7bKzP7A77OG/a3VKfxAybG
	4u8NSJ2UrtdHalZor/quzSNmYgHXRi5MVIpB0i1z6AIEE7nUC/K0XcinT6s5LUHs2smxjIzJbLp
	92hiwWqLU1juwwE8MFHEyRUYP5wGbaJDvoyKKN2Na4+r+/nmcE1bGl8tiSwqkTw5I=
X-Received: by 2002:a05:6820:2008:b0:6a0:e7c1:dbe0 with SMTP id 006d021491bc7-6a309b79f48mr1149962eaf.56.1782921651938;
        Wed, 01 Jul 2026 09:00:51 -0700 (PDT)
X-Received: by 2002:a05:620a:6f02:b0:915:afa5:725 with SMTP id af79cd13be357-92e78206c88mr299831085a.6.1782921639993;
        Wed, 01 Jul 2026 09:00:39 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d19e03sm296613066b.4.2026.07.01.09.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:00:39 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 18:00:27 +0200
Subject: [PATCH v7 3/9] dt-bindings: bluetooth: qcom: Add NVMEM BD address
 cell
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-block-as-nvmem-v7-3-3fe8205ef0a8@oss.qualcomm.com>
References: <20260701-block-as-nvmem-v7-0-3fe8205ef0a8@oss.qualcomm.com>
In-Reply-To: <20260701-block-as-nvmem-v7-0-3fe8205ef0a8@oss.qualcomm.com>
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
X-Proofpoint-GUID: rI3XylsE79ek9ZMQI8PldnttL-zdt0Vc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE2OSBTYWx0ZWRfX0tlhA4dhw3PZ
 21h1MM+NhxAqUHu82ReyQLBV5BgeoED3vahhVRHvv1n8oeUXnBFWWxq1S0++zJHT9yXAr2YyKW2
 zG89HOu/2DLZFUyT49d2GChpsiVVT0o=
X-Proofpoint-ORIG-GUID: rI3XylsE79ek9ZMQI8PldnttL-zdt0Vc
X-Authority-Analysis: v=2.4 cv=ceHiaHDM c=1 sm=1 tr=0 ts=6a4539b4 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jFERsaRKWwo8c2z-USAA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE2OSBTYWx0ZWRfX6/9zIkMPrl04
 T5P9B0mzHsf4MdaFHBTwuW4UWYnMxK4BvcdjNn0W8xZ53KXHZaMlHfwNNykUPlYR6Wv5W9oONgo
 T1OrdcJcPdMlHwq8PS9EDINf4b1y37yrIclfnDFhEvVm/3ECMTYd/nvQnCscHu60TuopQAqPKYv
 6TF6SLDAyuWEia04F7FAAN0uzrwqrGYCND/L4b58TVHno/sLEkvZqZRgU6ZoqfQ7yMqnY82X1/8
 lwyhVEOJqc8q3rVnfbRvDX4W+i84pGxNtCEKIY4qQXq+ycW0wh44wCvBoBcis3ezWKEsZ49DXb/
 XrUJp9EuBTmpEFbCjKMNAQonzAcZLxRGF5lGbgIQK3/es0hqDOai0eomCSErPNeCFiUHVf0X9pa
 4PfrGsp476vgtDymmowuLjgchsSvh2FNMe7OUDUD6zsM6hkh/49IsVVMdhKmOwUbddGBJTGi3Ct
 sqwQQlD5uwfGohn5e3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010169

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

