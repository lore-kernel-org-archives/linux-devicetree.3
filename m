Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2983FC5A5
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677456; cv=none; b=eG3bvzKZh32sGkNxUOFQryZCaIAk0k1jqHMuF9hluEhOeZlGflZ9M2bBplMYI8KVUhMk5nWuKeniETZb+hsE/ESTRlSIdsIuI4XccTtR6scSJfeKbUyKkU9xp3SxlVm6YmARFfihuYP9A6geX2sEtH/qElENY4hF16/roA/VWg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677456; c=relaxed/simple;
	bh=KEpaGYLJg/HFUQ4VCnAAAa4/K+FU5Ww1paHM4mUD9UU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YCHyrmut4O/SDcYI/ZViJPC68KoLA/qvcD/NFhDN/d/nZBEt5BSvnkhFRQGC7MgG7FBXZN/p1+jhGYLHY9oHQ657LFFffEMHaO/Q7yoRdBInO7JaaZMsnS9KKancnbYW+LvD/1yg69QBtw7EOYWLRe+iRHNVJ2hxg/b+bSW44GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=imSWQRTa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PyUzAL8E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="imSWQRTa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PyUzAL8E"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A9TS79291931
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9xHOUNHGElRK8fUN+Vx3VXwXih6zrlUor3vLrF9tWE0=; b=imSWQRTawQRpzQNc
	mwknADJeEsLPlR3YFJePXgE+g2CgMtH6PhCsxzYu6wd7US5Nx69vYJpoMoZIt7uZ
	ydQPQQXaH/36mm5o6bTGsw8RUMelB+QtP0+646R8Ysv/anT/JPfsEa0737vDafR/
	syB4JF2ODhttzmyxQ3Di+cAOryTXkiWl9jzHpF5QjWvMjYq8d18bipucQBiO4QXq
	0/z8fwx0WM/zO2yfbM64iDJba7CvX7wwnV1nt2CO7N6/4YaKABMuRBFTcfCWv6GR
	3v2NzycAq7TJgQrJlyycdYS46QCtw9/euhWSr4U6z2bMuYovgX8AoTDMyNXYr6LY
	lNmHiw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5dg3jd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:57:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a23afcbso7122441cf.3
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783677454; x=1784282254; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9xHOUNHGElRK8fUN+Vx3VXwXih6zrlUor3vLrF9tWE0=;
        b=PyUzAL8EIpQpen8yYLJsDoF02JJal50kHQNDPB2OcRPVu05MZE7R9bztwGQBeONOxc
         csbL2jAtLCSZInY1AxxdxfPDBd3SOQxp+qFtG2SU9oz5xPK7Yv+aehkvGTdbdbF919ka
         FEjRcHkNe6tnLvxP2XGKf7x0bz8+haiHUyTOsjJ/UsW46ByTS5OMf69J6SeRric8AziM
         rO0MO1Yspkxgdx7M6qEIUKyJJxcoKGA+7ifO8HSWmdNxE1H6ZhPmHL3NlNLUIqo1koxD
         6KNqEE/wdiRhGE9QD7yI0UzLiCQiQlmrYN0bTKO2p9xkkGgSop81JWwbMSqTzfFjrexC
         dp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677454; x=1784282254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9xHOUNHGElRK8fUN+Vx3VXwXih6zrlUor3vLrF9tWE0=;
        b=YUJrFMjKOv2s1lYWInPhJb+EMalxE0Wlh9ZgAs/7GO/e+Tt72uRSoxTa7/QQcfSDo/
         USaLFo/gHzyAwfstHVGULLnRmH0g7oSGY3A7/grCA9bYuiVcPzui44FvutE164eUZvEl
         qmqrSWRLKUiaWQcVvbJoK8/FZB8aQ9rahqBSIGiRmOJSBobRWV2rOVAVTuxlRKG/ebCB
         s55C4neG25JWUd4t7tCI9xj71AkDLr0s3MSl7sGTwB4AOvdqpXwx1vJRgmq0EMcMWJf8
         F/zjWixDluPWgnvX8QJB/KHOvSw4JXUwxSjAaHWmA07EAN9EqwxNdIxAlBiUpGo7XxhX
         fCUg==
X-Forwarded-Encrypted: i=1; AHgh+RoK/aUsrML5wYpp2aNIj6l25fauvpdwVr4mZJBSEGJBu1/BBkct2DbAraumGDroDqPwxc6sO5EJuf03@vger.kernel.org
X-Gm-Message-State: AOJu0YwKJRpDlo48fPTE82xWh91fP25LP6DLx4GWc4+9mKEZaWjuIbyK
	VwDfSh+jEQ6aZ8a0aypr87sSNnH0Z2CZAiUl8ojcf1ovZoOkPAPdoSAZSC2f5VfDv9/K8esMSoX
	9JcBp36s7iDP/7vbeLF4ulQamd2JZInl/rnn+X+n49AX5/VN546smGQdicnivg3Y9
X-Gm-Gg: AfdE7cnXBKTZXPpb6UKQhsSWBlPWkiTFYkB/9PAkwrZWHRP0Kg1Vb+lHJjJzv6Mvvbq
	NJCNB3NgCFbQVXeHGPzvqO4CekpS49cs/XE9F65GeVpGOPT3LFqHNvk76wwcgkUoX3+cam4dlRj
	udgXaswL6rywlM+E03CKQ9+dqzGQXdtmVTCOL6D3mQJhnWhyVBJEEXweaCHvdhJlHxxqY5Mrvob
	r8Z1nLZc+wJzUsYxiPLDhvEpGRR69JgCAchDFDc1ifc4rrg76YmhzJ1pPdA9oALofoJiuGZNLmu
	AZtYiX4ZeGuig/XLnETWH5ikzbc9ztWdloilGxMPuK2GSktMv9JhO8tbctI9FmfvTL0WkTrWm/B
	znaj7UN7lijI1XHugK6lbQ8biO99pP0Cz1jCynMewvNlBlockc/BYotpfuf11U77rphNAI67zK2
	oF1mNfN/q98alQgOQ7LZrKdDrApDpxs9565soK6QhTi8sgqfj0tKjKpBOjKpEa+t2Qut9GphI1b
	sS+ODUL9Lt/YTGedCnJ
X-Received: by 2002:a05:622a:114e:b0:517:6435:c4ce with SMTP id d75a77b69052e-51c8b3e2e3dmr114665071cf.49.1783677453736;
        Fri, 10 Jul 2026 02:57:33 -0700 (PDT)
X-Received: by 2002:a05:622a:114e:b0:517:6435:c4ce with SMTP id d75a77b69052e-51c8b3e2e3dmr114664921cf.49.1783677453240;
        Fri, 10 Jul 2026 02:57:33 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm265357966b.36.2026.07.10.02.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:57:32 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:57:27 +0200
Subject: [PATCH v3 01/11] Bluetooth: hci_qca: Add M.2 Bluetooth device
 support using pwrseq
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-monza-wireless-v3-1-46253587af64@oss.qualcomm.com>
References: <20260710-monza-wireless-v3-0-46253587af64@oss.qualcomm.com>
In-Reply-To: <20260710-monza-wireless-v3-0-46253587af64@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5NyBTYWx0ZWRfX5MDZa9jfQNuY
 j50R9CbBBLF8XxziYntTYQTH62lPqDWLatTGllrsxXlcDA3u8z12Zzqsgg1Czk1eJXH4fed+hbZ
 w4whQNnuvqzFrnGoKSHodyqUlGPH+e8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5NyBTYWx0ZWRfXyXcRiR23nH/o
 aJGfcgzpDN+0iQ43y6ttTU3FnYaBpsJSWaFgXOKlPVlRKcUwA/0n6F/PeUAa7ALmOR5CXhaPoyr
 rWvXoI14o4a61/y+ZRhGwnE77ZoZLy2syiJx+vw5IrphLykBPEQdMmNykhIGbfRXCQdKGkpLE1/
 i4OrIo7wY0T+Kh4PNPN1+mcrXxkzim5p1qjk3caZADbYBK48kmIMaSDgpSBZA0WwHZdRwewm5LY
 j0g0DoAp21SqREMNjp7GTTdUdcxkIYrxB8YO5wQ3MU+VIFlmbztJyNq+9Mo9T72f3H2Pv0GPn/u
 6GjIoogEYRVuu4alH8EwDvrbDLtcQ4FZRPXiRWryzMBNaLlAw5Q2CjtrHiJ3NV/dzJpx1ZnCVfL
 pPwB1Mp+uqZx2cKf5j+oESPVPEc38DQUYfR2zOtCTeUZn3hmvlLg8HIePtFeUzrQKmhpvIvDach
 2mifHy1I9JBzIgP8o6Q==
X-Proofpoint-GUID: vslz_Hv4ffWMEmuF413x5lFLyWjFenHN
X-Proofpoint-ORIG-GUID: vslz_Hv4ffWMEmuF413x5lFLyWjFenHN
X-Authority-Analysis: v=2.4 cv=M/x97Sws c=1 sm=1 tr=0 ts=6a50c20e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=14bN-6-z4zEjTU3E0XQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100097

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Power supply to the M.2 Bluetooth device attached to the host using M.2
connector is controlled using the 'uart' pwrseq device. So add support for
getting the pwrseq device if the OF graph link is present. Once obtained,
the existing pwrseq APIs can be used to control the power supplies of the
M.2 card.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Tested-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 2444471956197bae62a1c4c3a776c5591780ec02..135c79e696aefe2b37ee7a7a668715360a1e2d75 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -26,6 +26,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/acpi.h>
 #include <linux/platform_device.h>
 #include <linux/pwrseq/consumer.h>
@@ -2445,6 +2446,18 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+		/*
+		 * OF graph link is only present for BT devices attached through
+		 * the M.2 Key E connector.
+		 */
+		if (of_graph_is_present(dev_of_node(&serdev->ctrl->dev))) {
+			qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->ctrl->dev,
+								   "uart");
+			if (IS_ERR(qcadev->bt_power->pwrseq))
+				return PTR_ERR(qcadev->bt_power->pwrseq);
+			break;
+		}
+
 		if (!device_property_present(&serdev->dev, "enable-gpios")) {
 			/*
 			 * Backward compatibility with old DT sources. If the

-- 
2.34.1

