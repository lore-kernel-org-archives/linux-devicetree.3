Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080B6481A86
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 12:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791202915; cv=none; b=bGfcMJzuR8AcCT24AsBLpHT2TqCZkZRKyI8dNWV+XNdnJSZIIFrnRItqbXFjhu88XSSrDEcBSGwDlj9HbW8ijY6pXpm+TaUVcbzXJzmy2l0+UC5XtCBXpzz8TVghQWgaantfKemWtnEKS6X/qdfnCoI05jQdjQWu7ou/E+bA3+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791202915; c=relaxed/simple;
	bh=eDxLstZ3YgSwfZ0PeFuQrJ+uoiKZuKQRYECamWj3BTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UBRI9aGL4+8dyVY9gsU4V/rMgR3YCYYBSFMLmxlDjUIFum5kX9Rh/XWUQMJo286ojoD/xXCogHxYvLVIs1alcsdE9mJKoY3qqASEl+tAU9PQsYYlVh0AMF5L7NbkLiseLChMDAC3dXJ3Z+LFXxElEtA46kUBlPeyUKmgRfntKNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dLZzHG1q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bE2+0KfX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dLZzHG1q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bE2+0KfX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFTPk1925916
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 12:21:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3rpgZ8Wulh6l2hs5o0xl4E6pGMgHsW9mZuSvFezpNgY=; b=dLZzHG1quqkM18Cp
	Y0SJ1SO13p7c+TaJjFR3d4zZnO6mtGsrmTx3cTsSNnO//WK1GvXjJvI0RQ7KUYW/
	mg6pJ+StKT/cJZVUQk4VbVPxmdIWHT+rLgZdEioCg4kkXjksdcFFT6Mlv7F/68j6
	tJG126ouUHo3yjoLtyjsTxe4uGCwnuhMCpHbIDBwINNcOH52eXJ8BxJ7wblVaFks
	Nxk9IB1PAxoaumJlHGGs4Hso6m3yNZcBiEkSeevF+YqLbgO4boXBf18erVasRD8s
	CXU0fARtLEYL7nev0e9K/J2hgqDPDOqSn5lhwfjM6azNS8r39AfiltPw3SIDn3JA
	/aia4g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xgyt1hm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 12:21:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936aa34873bso330965985a.3
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 05:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791202911; x=1791807711; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3rpgZ8Wulh6l2hs5o0xl4E6pGMgHsW9mZuSvFezpNgY=;
        b=bE2+0KfXlquQXVjWM2E0rMWCqUm7q2gDK4taw+Z1qugPPJQRtNj527gRyDjlA6kMrL
         7JNZ/KLgY2/3WxGyfj5eagaUl+2KXbAe4fqiXNoWneyUK5V865nJhCPxbizQTuIYOjCq
         e2mgf9rlOxjtQMnmHDxdiiFOA5RZrQBjMrVaViQ61Kn06anNPjb76UZNlQZH84n5SZTe
         nem6Z/9hq3LYut8Tf2LpT4q9XKAptm41Nu+KH/rOH9hUmTIiO8XP78+UdFcxSmcR7ccb
         uQxVna2vNW9AOO+32wTY28RLfLPEUO2lJkwlQ1lMsOjHpAoMEFgmSRe+hfhMyf9FV5vE
         vYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791202911; x=1791807711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3rpgZ8Wulh6l2hs5o0xl4E6pGMgHsW9mZuSvFezpNgY=;
        b=XTFHj84WKhUiGbYMHLMm4gJnWfB8xIbVAaDolMXWVLgbQXeckcDBd25kqCLbMD+LLH
         BJXRSE4jqCXQ3wGJ9+lSXX9NTUSQJCTJxk+eAkzNti7zCkhR8DEpjBcq6cxablcMBgai
         uZme27LO5xvaMt3H3l7/RHdwJU8rSl7MtA3RojQoNyXXhSxK/TP+AcCfIvD7BlwBDK0a
         3G3W2GuFDeqJAz2NzokC2aZ6FfayoW+M7PjFYzwh4DYdcWp29OgnHoNW8iHg0sgYmAXG
         ZObv1tM1HPz6i838dkWruK4jVf5rWlfHe9Q0RK0bcruWmF3wZhEz2apOqUawcA+tLuFB
         T4cA==
X-Forwarded-Encrypted: i=1; AKwUvBz/SU84BsVzODNfUDcy2en7Gb9mmgjIx5c+PtrBnfpMxmo6u5A32YgAQx5zG+0+w44cBUUh5JnaLsgX@vger.kernel.org
X-Gm-Message-State: AFuF++lHWCLlvRKKKWXNoDQDQsFRP2NYhSVWGHVDEHh8H3lhFUT9NY/7
	UiN3xWIJTAj2j6+s5rzS0eN/Ysa+Vb/CQI1bsvzIjH7KufZbUg2T9sY0iy9BNYotCpm9y5fbWSz
	dHIeWn4EklpR/YI5eInzRDQKeeK1lTeUMbwPTM4gxWyeLB7amqtGrnT+hNcXiAHy9
X-Gm-Gg: AYBFou0uFICFtWWI8+TknZYh8hkJDVlefnOAH6gnMCBkJXQl9j93VcHNpiXA7fZQjr+
	bbfEFybvslGnO5f+ziX3lRHFfnVsf8YK9RqU+tvYeck1Qqrg52BZdPk13UJGsDRSf7QO1vF4AOG
	TdFVFolO0ssaTceEkCsZjv1gm8e9SW1iAq1oXO00CmxsC62SKMMVV8zM/C2Fq9RzKERcuraA/Q7
	Ej+0w19S4jBpG0h1ID6xaapsSRtduUfOOkiAcqgsIp8wYyh8AYC4MqPw96LFoHWWbi7hHjRbQPc
	o/av//UCDqWS5pgfq8Ee4ZwU7wIqr+foyhD4AR/y2VUi5uJRvBsmRhBXpnJIRukWk9nGMQQDaQl
	j03ilbyQh/r0L4QMvw5Fja4q4o5Ht/1eFtp00FLi3qVZbQw+dPUWshGVHEWy7Um2Z6x0X7NzW4r
	ICvMAPA2FwlhB0VRFl69d0e0AUwpD+unX9+1Wls0TNDKbvcMeds0N/DHOI1jNfVWKRBtUGkA==
X-Received: by 2002:a05:620a:17a6:b0:939:fce5:f6d2 with SMTP id af79cd13be357-93e50fe9ae6mr1314322385a.27.1791202911126;
        Mon, 05 Oct 2026 05:21:51 -0700 (PDT)
X-Received: by 2002:a05:620a:17a6:b0:939:fce5:f6d2 with SMTP id af79cd13be357-93e50fe9ae6mr1314317685a.27.1791202910624;
        Mon, 05 Oct 2026 05:21:50 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027698f13sm324157425e9.1.2026.10.05.05.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:21:49 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 14:21:33 +0200
Subject: [PATCH v7 3/8] Bluetooth: hci_qca: Set 'bt_en_available' based on
 pwrseq power controllability
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-monza-wireless-v7-3-5a6de7662dcb@oss.qualcomm.com>
References: <20261005-monza-wireless-v7-0-5a6de7662dcb@oss.qualcomm.com>
In-Reply-To: <20261005-monza-wireless-v7-0-5a6de7662dcb@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: WNkJyaKqApTUgk2E4Xn3GJgxN2r3orQF
X-Proofpoint-ORIG-GUID: WNkJyaKqApTUgk2E4Xn3GJgxN2r3orQF
X-Authority-Analysis: v=2.4 cv=A6b5rKWG c=1 sm=1 tr=0 ts=6ac39660 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=zRh97aRZNhiOMYVz81Er1w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8YyhkPy0JF_pzLATneMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX911P13+eO1VL
 wKwr4P8tLhrQaNGgQAIjIf8stN3ziu5cjRtNCgM8L2LKDKgaCVNtp1dwKXRKoKLwqIx2+GDT1xu
 gVq5KegWiCFfmtjbxzrevy+YPWxbIQlUtAdjgyl60rjpPRKAzuKsuWwU6ilvsK71Q60PB7atF9r
 s+hViqiwuxoMZjGBU4b5JnSjvvia6CmXrGuZMPtyQ/2kEyFhces3BICa+HIcdkfxEdel+2X8KZL
 TsyEn5yRpzXtbONvphNNIm11yvH0qWGn37okIpRli3XHoGaumVfyw6Uiofgc6aQ+GNEzQP2DXEg
 Y9JpuhyD63ZypxSubdEJj4ISdkKlMq7Lb04DOUXESjWzDiiM79o7dca8JHQEGaSSBtzjBZFrNIM
 Tc6/Z1PQ+ULVx1haXskjdFERfLFZckfF6AcBJP2aEikn8RDwEqS+iFnkc/lJtWt5zxcNorEcrcw
 Rxp3+DaA/UNqJcDtusg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX+SHLbsHb00Be
 ZSr9izo550Ehs+dWssEn5Jk9ZEXntmogAVOQdcgyAWAdS4aXF7PfvwImIPrs996dARJ/2/jSvKz
 3LRQyJdkzvCl1Ks8iLNGMUEtLzofeX0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050048

A Bluetooth device only needs the non-persistent setup if the host can
gate its power, so that it is actually reset on the next power-on. When the
power is controlled by a power sequencer, whether the host can gate it
depends on the hardware wiring, e.g. the presence of the BT_EN or
W_DISABLE2# line.

Query the generic pwrseq_is_controllable() helper whenever the BT power
comes from a sequencer, regardless of which provider it is (M2, WCN, ...).
If the power is not controllable, clear 'bt_en_available' so that
HCI_QUIRK_NON_PERSISTENT_SETUP is not set.

This is based on Manivannan's original patch that keyed the decision off
the W_DISABLE2# device tree property, it now uses the generic pwrseq helper
and handles the always-on case.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index f53f95601693dcd8356b4b825776317061050f1b..20d8c5e890a8903a07c3e7e37d037c44d383e8df 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2557,7 +2557,20 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 			return PTR_ERR(qcadev->susclk);
 		}
 	}
-	
+
+	if (qcadev->bt_power->pwrseq) {
+		bt_en_available = pwrseq_is_controllable(qcadev->bt_power->pwrseq);
+		if (!bt_en_available) {
+			/* The host cannot gate the BT power individually.
+			 * Treat it as always-on and drop the pwrseq handle.
+			 * The descriptor itself is still released by devres,
+			 * so dropping the handle here is not a leak.
+			 */
+			pwrseq_power_on(qcadev->bt_power->pwrseq);
+			qcadev->bt_power->pwrseq = NULL;
+		}
+	}
+
 	err = hci_uart_register_device(&qcadev->serdev_hu, &qca_proto);
 	if (err) {
 		BT_ERR("serdev registration failed");

-- 
2.34.1

