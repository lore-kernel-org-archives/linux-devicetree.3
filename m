Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5454FECDD
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 15:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536564; cv=none; b=Ju+G0/8GNMSm8z7SF8nQ1pm7GeHIUAc0oqWadN7qfYQwMhoMRjQHpTloKqy3ADQ42DbxsmqtmdhchqZ9JfPAawuNeRPo+0hBTbwfm/nydI73xNpBtWum8EQgf7WAABnBfGjMDVABcBCEq+rLO9u7sf6+DGDgvnNmD/k4JsFZWeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536564; c=relaxed/simple;
	bh=19QULZ5mc7UMmZUZ7tuvsXXvDMzyVLM7eK1cvidnb+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yxz6qrEcmY+rLMkYxyfZbfzJHce7DLok9CUM2Ocl+hM5SJOphAF05C5iOlEg6DbQI15JGBGk2lZ0q2sfNyfGAC0pDblJM4OjFWGSrXuQUNRbqs5vnZHL27noZNC4MiA9RKW5kS0r5HZkJh4AeXOoSYWvqPFTUiAAVd5jaAyBbOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y6JoBLVM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ceNn+G4d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y6JoBLVM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ceNn+G4d"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684El60S4163747
	for <devicetree@vger.kernel.org>; Fri, 4 Sep 2026 15:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wu4aU4+aLtX2c9UIKmkxVl2o/Ry3P2/k4p1oqgR901A=; b=Y6JoBLVMuh8timkm
	lujZVPaIYy2/KFW3tvZ1/aNQYBdB14v09wVVReNg58HyMcu7DOI8hnxdIvv1gU/c
	i7tkrFG9XvtohBsTMv/TfzZ/TV+h2NYeYa3pEovn2/HZJNiaSqQz9JQFYEpKfJIC
	aCKfEJPNDMoo//jECWQQbzkCi7adPwP9ukydwwpbLuNhHs0ikfT/wjAQZ6utwR06
	iz6NzM+dF3yhUWqhGeVeDCTRLEj9bGN4tSIFRjea3OTY1cOXeRhP9G1SCAv3oSC8
	F0GOI5H1Nzoat/82tfV7z+9IHZo5gt+PbZTqLSX4f1YXecTkwyeHIxyDczM+gnCJ
	aQBo2Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg011gh2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 15:42:33 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-744e80385dbso249713137.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 08:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788536553; x=1789141353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wu4aU4+aLtX2c9UIKmkxVl2o/Ry3P2/k4p1oqgR901A=;
        b=ceNn+G4diw6LKsjbtzrtswsFJnzqXZtS/LU454JaA+m1V9iJAMeXttVorowpPMuegB
         XkfM4jPeQN4V8cEfDIuwM7rsjmScHaC/Qe+vMkHwL0k7cCueaNS4XLP02kVPj5jBchwI
         rCfcdzFYcUbyqoswPcBSm6UQfCSq0EosJ8GPgAzyEvvUJhVtyjAtXMfmxcLN9TJZmXaR
         Aws0Q+SKmUbsCydj2N6euqj4tBIcPHaoUeo3Z/UeYcX6Vz3vJdsTqV0l2CbzXJsFaqaD
         KhP4/0iF5NxOvpsydrBiCNIIqBQXra5m56nxaByc1pNIicVe9wYY/DUeSGYJDvH0/7S7
         ewWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788536553; x=1789141353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wu4aU4+aLtX2c9UIKmkxVl2o/Ry3P2/k4p1oqgR901A=;
        b=ZU9P4pX8oYD7mv3XHtD1OV3+c3P2CZm2BE/JOxZH1PxRHdFoZ+exVJRNTs8XNBr3vR
         DeboPGF8qDU0WKrrgSkjz8/U900qYTqxjSzgfEXF60hgXZUSoXXx+lBfakICsND1pAew
         D/+S/yucjmPJOkbFR80xbvgeCpLdG/hPJI3Qve5jvzr+o6F6BoC0sGBMkfWXiHf6rnor
         BtWgSPtg7MrML2JbXNhntO/h4fXGIwpBr9t5uhaKmkvzfNLMjLAIx35+SEkGo+VPJOsC
         cKiN1kzAygJoQA4aTDBJHNqRb+rph4e22sikjAQ9dpgbpOjF6sWtLmiHhC8LFCBOIsj/
         UCQQ==
X-Forwarded-Encrypted: i=1; AKwUvByWTkCVMBEWagnLwfwTnSRFnXIG/p2KbP+m31zrl3gxgfXM2GK3xw3tbCXfa/OH+L/R9pCjRbK1Uxaw@vger.kernel.org
X-Gm-Message-State: AFuF++lgFWiLcMw0trc8aYPTZoMDwbGL3EGxk7n4dJosiPlm3Z2V+ToV
	HdEOndq+FVGefgyZnyqpvm6wgcTjvbjZDcanYrGuMzOGX+6KeplDYHecXkR68zxygIgMih0ORsM
	S0QDiVSa3Rpp9fWrmZKM/v2vQztZxp1j0uMp9Ij+KwEOynbtj24OhpW8R+N00DWRW
X-Gm-Gg: AYBFou0eWhRrGLW2yKpqy8Rfq4pjo8PE+DMCPKGSER0K56ZGXXvwhcBw8u/buCeE2Y4
	Hs/tdAxrCQej+mJgVrch+vU32v9P6bxYBeCq6HPmzIaroYy4mWqPKzvNSrRhVOx3jpugl8B5ZZe
	LET4vgWVlu4IZV9BQ6zEUkruUw2YV4ons39XS5uT3X8xl04aVOnnKIe5oF/Nk8k4w6YQ13npx4L
	OfQsqdZDqTTQ8z3EG3eSaUKWMO0ES5Lp+J7athI9VXzOyc5xtlnWMVM60zmkzUXEElgZnw7mkMy
	dZlgoqDPQmktvhFAjmJycYeNhaVCxdMhvxYw+NyDidmmhjsI6ePb8vkDCXRQIUfWRhCjHfMKgX5
	xjORG2RaXeKlCibuFbbE8Zv3RjUKfKbZb2ukOvPLYe+WRbxwaZvrGnNwJ2eKD+BuC0L9ItaM1wE
	r3bVDJPUPvX2x/dJrv9Dr6NRGSnIo6/fwEnQH1nTFw68SotAsuJ2M=
X-Received: by 2002:a05:6102:1606:b0:778:9e3c:5760 with SMTP id ada2fe7eead31-78a4a9621d7mr2056912137.11.1788536552850;
        Fri, 04 Sep 2026 08:42:32 -0700 (PDT)
X-Received: by 2002:a05:6102:1606:b0:778:9e3c:5760 with SMTP id ada2fe7eead31-78a4a9621d7mr2056895137.11.1788536552421;
        Fri, 04 Sep 2026 08:42:32 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:e90a:787f:72ea:b218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm160668505e9.3.2026.09.04.08.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 08:42:29 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 17:42:21 +0200
Subject: [PATCH v6 06/11] Bluetooth: hci_qca: Set 'bt_en_available' based
 on pwrseq power controllability
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-monza-wireless-v6-6-d8c5042b3efd@oss.qualcomm.com>
References: <20260904-monza-wireless-v6-0-d8c5042b3efd@oss.qualcomm.com>
In-Reply-To: <20260904-monza-wireless-v6-0-d8c5042b3efd@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE0MyBTYWx0ZWRfXzLJlxVpOa6QP
 Tp1jS/wyX7tFVQVFxbcbE3kRBVqQSyAyqM5jdsPPpANthcCnduBY7JjMUDlo3Win3YGUtQoogbG
 aF9fBes24uXboAcpUvKMzv7RtZnwasC0J8s8l7zE1Uy7NSWRRaDFOeiMUZn3L1teRKgVSAG+H1K
 9Zt01qj9DPgD/oxhP8204Dx5i5r09PM3eGd3zVtmPk/aK1jgIA/6o7KYS1+R/B9casGPnaXVX2X
 BjW5EunxUNnJj53Hhiiw0MbNrRLx/FaOSk8H9eyOMUMDo2UhKOiw/er977GBt2KZ51EXi7pOJHV
 CJ6y+/KAZIPDhc6Y4xsC2UIAhX0CfXDSPXPw/SjoA9KVBjRYrBbncgOl3xCD0qzItt3j+97RMoh
 3ir69uL6Ed+TAJjwG5duq0rdvyED80urbAahQRRsyGZeOFDZOlmNNaYZRNWkUfUK6K+ki01Fyk+
 POaZuEQKkqcgNyfGAmQ==
X-Proofpoint-GUID: gnEI_zk3zP6g7ck4YfwV9mDq_-YUiKXX
X-Proofpoint-ORIG-GUID: gnEI_zk3zP6g7ck4YfwV9mDq_-YUiKXX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE0MyBTYWx0ZWRfXzV7xBZBQAG8p
 hK0vwIsESrXlhU74XQB6LEihkcLtyBVYktiv7C4oHk+PscFupI1tmbtMwp2DoxzezOaTUT4/Wkx
 AehdHfyqDZLeBZzYM1/gS40oQBJJOUo=
X-Authority-Analysis: v=2.4 cv=Ibi3n2qa c=1 sm=1 tr=0 ts=6a9ae6e9 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=8YyhkPy0JF_pzLATneMA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040143

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
index f7a20138cb742e8f6ea51d565aa8da8751f21f37..9d27cd851b4a685ce42201b0d40ca6ecbeec9cb1 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2551,7 +2551,20 @@ static int qca_serdev_probe(struct serdev_device *serdev)
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

