Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD693D301A
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784534672; cv=none; b=AI9Z5N9HwigONDptgdnCMsFqK7EPrtMAkogXzLLYHf6AAZCvhx7Dvvigk9K/4HqZP5LXAnvA58QsusLU0RgK6ie4Osuv38snWKAFsRwltsS6WiWyLOH/7n5mLlLdzbvMQoSg85F2Gowy1TQUBCQFx4HCQffFmKmhbjr0njulJK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784534672; c=relaxed/simple;
	bh=Zf1cAa5b0bNP3c/K70OfmcZ/HBkFtBvo/OVNOd6Dz4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GIJ5vLpkNprX6jokbJnedFuGA/Tk30QIkzrMv2NulFgSVIeAq2pGdnsMhqDkHnpmimce9UicouAhIlk7DTAiNenGuvbbgEjlEfxAzCyUJJvzn9iPzwItJ9y+9UihpYggeKIZ1cIgMzqQ1N49hzT/lv7Oqb7bJK1l4v1CE5OfgvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VCaHag1j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RtWqlTRN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VCaHag1j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RtWqlTRN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RTRm1665545
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+v6DYK+7R/PwBLwFZrKIBzxEvo+v4Yk8qTFPX7MFv5k=; b=VCaHag1jvVXQ2BOH
	uwzG4mXIJwSoR2dCt1iFW90dEHbfRejWBmRx91BcorV3V6Lzdj2MXQWZ3004v4mM
	sWwUu9BVSJiRGAs91ItKhGYM46qxuy+oolDkqiwnBVP9tdkl1XlXu20ywic/CU/3
	zdreB3C6EEHTkFQIO8u62CUeYfmZW8VSsgme0yXTKLmkgGVtDQORxZ89DIl1YbbF
	1x+8gTjhlhlUvBih5DD3hGiZM0eYKHHzZjGPhi8XPvEHxCQm74lAhcltqvUPSRbR
	U4ce2CgkNFPsb9E9oi/zebGnahunvDEaepT2DnIPSKcslhcW65EuVOlxfV26Yyuh
	F/TE2A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fgd04v2ud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:04:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d7886cdso82819891cf.1
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784534668; x=1785139468; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+v6DYK+7R/PwBLwFZrKIBzxEvo+v4Yk8qTFPX7MFv5k=;
        b=RtWqlTRN1Y9Lejq8UtOzJrNhqa+5/th1Bb+FuxE2GVRwyyfyZDFLUtbNgbyCi3hG2D
         G6gOpm2x+ZDk4pf8h/JBTCn7t74E28XPmWSt3vAZIBEPNRLgSAU9lTt/xYn44ytE9ZYz
         8oYp9tjo2nph+9yw0OOR6gJdDvP5idG/OaPUXKoYtb4vWYYlQjf1I5yQw58iwkT5qbSD
         yd6F11yuB2xkmJGMhLfB4cUOp68QOuwv7iNZG6KtZVuXQFOWkc77SrJvhI26t6se4l4V
         pNUBLdwYPoEFLqv3nTEVR/rzz2BRnxrD+H4/bB2reEz4I0GpRqkb0gnTZwCmDGBwvnVR
         4DjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784534668; x=1785139468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+v6DYK+7R/PwBLwFZrKIBzxEvo+v4Yk8qTFPX7MFv5k=;
        b=EQQ8lelpY1VLWNH05ZBBJX+q2Rh4tZFC7H1nMHmugN5t9uAevzH78atEKMSt6hf0JE
         JN1lKaJ5pUeGOKKPK6khbPs66zB+8buNSskAI431F5BZuaq78CaztXi9R3hdt4vBPp53
         mMY0s5oL7uKxub1opGRuaKvhpngzWxXbiLhviVwYsieFsYjKOGWin6dJ0N5VSa/xoZRB
         19VrmG/JbDrhG3FH3Yqh40C4lt70C2fk4yOuo5O5u8+cupIBuxSrktKUyhQE1IVJNhS1
         x/8GRyFlcsjw1UqlByp8/fQBHCyEZ6uQEKlxQFzE+cwyfQnTxH59cPh81UR1BkNW9qjd
         /uow==
X-Forwarded-Encrypted: i=1; AHgh+RqjWflWjJ5GaK/ahebzerHKTIiPbYQSrfWJmxBYGsUWrCnS4xct78KMlkCtwGPgMOw22I2SmAFI3BwM@vger.kernel.org
X-Gm-Message-State: AOJu0YwwugkHF5NcsUp3O/BDdKD4970SA/JrX5Q1sg7GPkvWDgyEuFTD
	tMIEHL76IrvBi6tQsVY/rq2GtIOApuSHm4rb3uPhADuC1c72Hv4COi11IhJh3DenkCumPfyhBM3
	VVl+f+Ic3wLR53RwLypaixvyVwkQouwEKMke3jpi22VPScStu/z7rithuVhjoqPaq
X-Gm-Gg: AfdE7clG2n986unhI0Bj3zUFJGxlksvMqPSCaBjFDtnGr4zb10vMCMpopA3IWTfqmAI
	LQKKGDHkgNRNz0AflS+u05s0gkOFMVsLoS/MyBNUPBAKGQEqPJ52/FN+qpEwXmNypz8LQG3UMT9
	j2zFdHvIcQMLFgHiLfBduj29E861CclH8b+Pf+icSSu5K0E/0SPxMk06rOKvSvtT7ZIhhUvB7ol
	Eov+SMjG7PSgcttmPPYuXJ9SkJAB8ub2PwvKkyqGX+Ysa/kJTGcTBfA9YenHobGuQ+t1ljA9pcI
	P8LDEna5IaNB31cOODptqJrZOMXHP5fUPyysEYsueQ2sBYcZHboURMIljBLuQj2OVDxka1ngpvY
	10H8/PxgtMkjHI4z+27SSLHZ6lSGrQoxV3Fl4x/sp6M6JmPhxjJ6EN8LlguVRp3Qscps7u/Kklb
	OyEnEpga7oWHGD8QmEwl2tSt0gcwSnlExDnCLxottMCxIZR3zznE4=
X-Received: by 2002:ac8:7c42:0:b0:51a:6feb:dc8a with SMTP id d75a77b69052e-5213a384365mr116966661cf.18.1784534667907;
        Mon, 20 Jul 2026 01:04:27 -0700 (PDT)
X-Received: by 2002:ac8:7c42:0:b0:51a:6feb:dc8a with SMTP id d75a77b69052e-5213a384365mr116966311cf.18.1784534667416;
        Mon, 20 Jul 2026 01:04:27 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e7000c3e2sm4256542a12.30.2026.07.20.01.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:04:26 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:04:12 +0200
Subject: [PATCH v5 10/11] power: sequencing: pcie-m2: Add QCA2066
 (QCNFA765) BT serdev ID
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-monza-wireless-v5-10-69ec6743543c@oss.qualcomm.com>
References: <20260720-monza-wireless-v5-0-69ec6743543c@oss.qualcomm.com>
In-Reply-To: <20260720-monza-wireless-v5-0-69ec6743543c@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=POs/P/qC c=1 sm=1 tr=0 ts=6a5dd68c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=hhiJJhbhXc7jC-Wm4KYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA4OCBTYWx0ZWRfXyr28hXwyoZXy
 6CxGSD4xHxIs80C/TmYYoMB+GPPyDMfmEIRNJ0IodR3UkEmJhtgC5a8/H/spndxJFVqH/spL2ae
 ktaHs5YmJ3+8hE7AtiYSCXKt4q2N5Flk4JqcgvD77Zr+Pz6SKMI6Nzer3Ms1+GYy6KomEwbWulv
 Ft1YYK5SiN7IJIdc4lULYd/9fJP1dAy1kcR6YPmvYiAEkA1ZzwnROLEVEQwQ/137UbGt2DlLYJm
 2KUgqDnFWCZdnlxkI5uJiyb1vYw1gn4BrL0NWjTX/PCL2IJvlmQDln5LDbybT0OCenuJmVsXf0D
 ZrMGzKtkdNa9bjAA8uRr0NpiBUChHDvQW8p3cGCh1fzZV+CV9/Gi/BJoQ7eYreuZ35cmDi508P9
 B6fY0kbKedvsqe6LAddsGvu8Y3AbKrGjBgvnssLZ75AkGGtItiFXbELt+ryfuFLjxB1pemWnRWD
 UZ4jCVeeOU2gV4I17Qg==
X-Proofpoint-ORIG-GUID: XmEjN4qCeAqnZ1ieMfOBhcT1PuPfs9Kf
X-Proofpoint-GUID: XmEjN4qCeAqnZ1ieMfOBhcT1PuPfs9Kf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA4OCBTYWx0ZWRfX1VsqtpjA6dZo
 4YUzSkyUNvNk0e3h/5w21TAZ4jiYPwpSJ4+hlhMkuI+zvDKAqaANbtEy0kLIDsvcNfVCAuDci5O
 gOmH4iD9WtTwcyQJEqkOg8JWROJeeKY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200088

Add PCI IDs for Qualcomm QCA2066/QCNFA765 to the M.2 serdev ID table,
mapping it to the qcom,qca2066-bt compatible string.

The Subsystem Vendor ID (SVID) 0x0108 distinguishes the QCA2066 from
the WCN6855.

This allows the pwrseq-pcie-m2 driver to automatically create the
Bluetooth serdev device when a QCA2066-based M.2 card is enumerated.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 8e4cb778e31f66aa171ad9831d4213e17d2e6145..741bf593d1716d55494cae99d4452600555e53b3 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -216,6 +216,8 @@ static const struct pci_device_id pwrseq_m2_pci_ids[] = {
 	  .driver_data = (kernel_ulong_t)"nxp,88w8987-bt" },
 	{ PCI_DEVICE(PCI_VENDOR_ID_PHILIPS, 0x3003),
 	  .driver_data = (kernel_ulong_t)"nxp,88w8987-bt" },
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x1103, PCI_VENDOR_ID_QCOM, 0x0108),
+	  .driver_data = (kernel_ulong_t)"qcom,qca2066-bt" },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1103),
 	  .driver_data = (kernel_ulong_t)"qcom,wcn6855-bt" },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1107),

-- 
2.34.1

