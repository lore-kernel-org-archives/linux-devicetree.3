Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4387F3FD97A
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677471; cv=none; b=F5JX3ADlanFZLglQEV01kTLTdp2SslfJ3J1cr+GQOiSZGYHj4de+6WOgI607/pOb/XG2QedXiAfg+FEDNNZtgvQ0SezihipdEg77+7sJ9HzdTrDyRyfLOQw4wIZTLWrNAPKejwqEKQpbGU5TaI+rWIw8vgQ7R1z5M7BgtTfqr4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677471; c=relaxed/simple;
	bh=drfMTyafP5O0WHcutG+g8kfep1FgBIKDYHEt5UAf2t0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VZ3PEMt5HLVve4HpPeQFj9ZQI9l0wEuukSI8iS4FQjVkSvTVD7wq4ygg4JPQZdoGJ1RwbB9rMCXayzdpcuHPFXzNMDwwOCK0+VjcavvPTCfzjOzw0a/cbpfsPKFmSmVgYwTnb6fGStKnTa0IwZHULN7gXLijg+YofxT4bfcMBgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KUYNNWBB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V+PbbVCi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KUYNNWBB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V+PbbVCi"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dYk54194241
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uq3021KNWN1PDY5vGnxhuGlTpLYyxahRYp1yr2wnYV8=; b=KUYNNWBBIu1EkpFH
	sc98aZnmd3FGwpsVb3JlSf8DLXQXYQrd631LN26YnCa2tS9qFqzIglrGQ49aZXec
	+ePnCODA1M9s1OAy/Yevh9PrNTjXVzKKsgqt5jsNo2WN+5XVAOhjjOOzwd7Giid1
	i+JyBrX6FkO5Ny5CyDPVWXDJ1U6m98+DPAy3jnSm9pZzRmpmfIQ4p+OcLV4eZu1G
	+kr0F6r2I5tvcdHANh+7PLbS8o87koqOYUXL0whjbT71XIZD7502ueJcVDkAKwTL
	HreYLWKSAD7eWN8vanlwCRFjQtf40F6kAqCoVLK0b1Y28ekbx7uY6YDo3vs1nARn
	J/0QuA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf24uqdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:57:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0408254aso22004341cf.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783677463; x=1784282263; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uq3021KNWN1PDY5vGnxhuGlTpLYyxahRYp1yr2wnYV8=;
        b=V+PbbVCilWBSNFW45+Wvucm0WozUVfvAebh523qBewdhauoh0JFqCyFZEMZAxEx/RK
         G3Pw6HF5q9NZBKDduCoMPGlr8RDhu7VhsPUf1hXIpw2iAdkMhdaNM1TT1Kk5D39WQ4VR
         58ei8eRLhmJDyFBFRtPdAIciVSOGT4VCM0KoQwM4N7h67nlxqByvG523Qfz+geCjfH71
         L64FN9XqSo5hWTYPrpjmf7S8wn4/J6sFgWtszdOkB4S+592kRpE4ZG1Ina6ljRY+A/PU
         S/o/LtZchV9GrZwLdzLNevT9Vf1r5yaTJWyHwZXL3W5r3zOkDte10rkgnK3vYSinl0Q6
         +p7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677463; x=1784282263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uq3021KNWN1PDY5vGnxhuGlTpLYyxahRYp1yr2wnYV8=;
        b=DWaldLkl/flJ93aVeref68TkUDH6N2KO1dN2wuxTWNBrCWim7JfNyng9N3WD1RCgLV
         4kAAanGB/eizP841L8Xwpjxbu8Quza2J9EToU2MWuEwLMqDK6cXNCUNDYpkFucOHg2Jt
         8H38KCP+r7FQx3Q/U1u4WqS4Co+RpvxoD1DAYBUgQ5ETvB3EOncDVPQ2Fx7DirAm4ONF
         znHBubIP96DPuUntUyFmfNxQv0kt9IrBhT0nZJHtUkIj5SMfBxFECcF1fxtPqP8/jHme
         yqaMLxr2BP2+AiAhKnuhJPWGWW2TN6U394u/i3GBcKDWFuOvEB0chnX0UuK1brJa9LJ0
         u2hg==
X-Forwarded-Encrypted: i=1; AHgh+Rr8Qqw17NRMRLu/iKwilSnLfFjBrbOh0Y4BVS+rhHX6C5wiLhtknCm50PXd5UOAlMJI44H6lCiZXQIX@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ3hY6xdKzLmLO8mSk5Bofn1BIg2FBSqt7bOPptmQYUpg+vUCD
	b7pmIx5760v2Z9aB9/b5i6ZFGvgKDT4nI+/dCQhHYiZfxYpHokx9OWU0045pC/CGr9EIsTeSAOF
	0652tt8keOOcN40CBqcxOIqXx9VNHLidYteSwWvHCmoOlUXE9TOZTFDypKQ/1Ip1B
X-Gm-Gg: AfdE7cklmlCwnlW/O5JO3/V5SrvhTqL3Ut5Ekhb+vlB02dHQ7SlMul0x3l/XP5gAWzJ
	O1/VRpx+TJ9ab+I79q5x2CkgXRtM8NBpOWQl8EfVbwlQVxlBKmKgOhGfE4llTi+zGvRn+YjuN6r
	ZQScHSys0oAUo7L045g/sK17dqMr+YAWaua0LNAKAt6v+ZMJHZ/dXZRgz+8SKkUG9+kqWW3Ml/b
	KKQ7bc5KzABIjTlyU9q37Seh6vYvr6mGGSjxXDvGUHma7ZxAEgoVoVsSY72fJv4pOLSKiZBhp1E
	RBBttKKmgsQBKFskbIO+Xn1+5vVJLPRXHZVfXR/Co5sUxolGD1RmV+Eotiwjhdg/SNZCmzIpBZh
	k6WxKCVknS8T6nLn0sIQctAc5zw73piVVAJJNFEZbw2/Dp2zZmPz0Uwrx4CQBnfdHwfgQNRlmab
	KBHOr8H/QBrxXRbvf9IrsnDFXRxpOcIZ/ssjg8OmO4vOFJXuyW6lE67KVg+rJCWCyYZ0Xn5ebZ3
	vmFIIy38MSEQ5wxFqo9
X-Received: by 2002:a05:622a:1192:b0:516:5019:d27f with SMTP id d75a77b69052e-51caa0b5790mr27856001cf.18.1783677462751;
        Fri, 10 Jul 2026 02:57:42 -0700 (PDT)
X-Received: by 2002:a05:622a:1192:b0:516:5019:d27f with SMTP id d75a77b69052e-51caa0b5790mr27855781cf.18.1783677462351;
        Fri, 10 Jul 2026 02:57:42 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm265357966b.36.2026.07.10.02.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:57:41 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:57:32 +0200
Subject: [PATCH v3 06/11] Bluetooth: hci_qca: Set 'bt_en_available' based
 on pwrseq power controllability
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-monza-wireless-v3-6-46253587af64@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: eynp1et-SUhPNqObNZIN-56h0E9bMFgr
X-Proofpoint-ORIG-GUID: eynp1et-SUhPNqObNZIN-56h0E9bMFgr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5NyBTYWx0ZWRfX13MDm68jc1Kk
 29lJejwiXNhfaGxkq+uhKNCyMOuqALQCvLQd8erMoVQ0n7sWbFzfziPPI48lXU4eLTT9dZsqJNj
 gYOY3hnV1De+7tpX4cYYV0MueE32ujI=
X-Authority-Analysis: v=2.4 cv=daKwG3Xe c=1 sm=1 tr=0 ts=6a50c217 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=kStU6zbECEpzgAoP-VAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5NyBTYWx0ZWRfX2fqzEzoQk18y
 UD6qJ2kAE9OKmg5xcJgmye7a2KOrBX12kVZqoFBK9xq21OGCiWRRh/2RtNjqLzZCAWyHoFTxtLN
 3iUpkiZWZjGUn8QbgMNdPRIJJv4LwlGzT2PG1qcfZtW0/62tHRRAZNaFJ0LFHbtLMOMMeBQTH/1
 JETuWdkh3eoBkcLcwjYjeDQnKH1WlQbVZhTEqCKUR9n/UtpdPfFV0yaKCcVo8d8mju4cbqic76/
 3RHlNnpTlpXcIGtzaw4keej0hEeJu9/AQeLDLWuroOgHuvuPjFbaXcvfvntGL2icyFGo9XPA1Wd
 ATCt9qwWqhoe0K+AFKCeEValP1EcUrQyiYUpnvBpM9l1A6C9WDzqiav2IX7jqFInIvZIMkuHDZQ
 UimFf351fuVaxDW7hyjsWDPuZLyzvxLUpgTzD2v7MPuClqIZzWb03iHhsV0rfvr2B8EyEzngvZa
 vHimGgDeGFdRqRbs/fg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100097

A Bluetooth device only needs the non-persistent setup if the host can
gate its power, so that it is actually reset on the next power-on. When the
power is controlled by a power sequencer, whether the host can gate it
depends on the hardware wiring, e.g. the presence of the BT_EN or
W_DISABLE2# line.

Query the generic pwrseq_power_is_controllable() helper whenever the BT
power comes from a sequencer, regardless of which provider it is (M2,
WCN, ...). If the power is not controllable, clear 'bt_en_available' so
that HCI_QUIRK_NON_PERSISTENT_SETUP is not set.

This is based on Manivannan's original patch that keyed the decision off
the W_DISABLE2# device tree property, it now uses the generic pwrseq helper
and handles the always-on case.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 17f436484e1e74d1dd690ada22134315abb767c4..4a1ef316e715f4f1f0c8f7deafa971887af040f3 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2549,6 +2549,17 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		}
 	}
 	
+	if (qcadev->bt_power->pwrseq) {
+		bt_en_available = pwrseq_power_is_controllable(qcadev->bt_power->pwrseq);
+		if (!bt_en_available) {
+			/* The host cannot gate the BT power individually.
+			 * Treat it as always-on and drop the pwrseq handle.
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

