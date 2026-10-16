Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468513B5302
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120981; cv=none; b=IoSbq984hyilXpb7GIikv+l7cEQqPPgblmLoYfoZfj4ZTnEZCS3cdfqOKGfPNblx8OtRYC5a8VJKDTGWN0r7eotqmiUrtt1TCWwFBITJ2iEGbmVUCJoDt+amUT33Xpw46tVIHOXwkEjNoXuqz/1dKlvaSL2JxSUxuU98O/5Byag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120981; c=relaxed/simple;
	bh=0rgxn5r9GoXYq8qPP3L6F2nxV6da5rGl6uSIyp2qv2s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vEpWN9or/kbVDGjS+MLhKOcddmaiNTrYwqMKhxgp5UREXBned/50l4o6/w9j+sxpuPAR6kTWxbE22pXn/y1RDzlwk0ntgoDTNjFsByrSdtszCGxlbnflq/N0IKePY/4WFPPvW4JdX+qI04fhdzu1UPVXKaqn50hZw47GY/Yv/jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V9cQwHtG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F99oRpCq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V9cQwHtG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F99oRpCq"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FKKLAU3800192
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	alOZNhc/hBycopSj6aablVmFXgtwQwPhX17D8dTQR5Y=; b=V9cQwHtG7H4kmGlb
	MMG+3KoQmqVOJgthF2mfGHDSw/qVwyXK/RjAsNZuq6QJQLvb2XeZ/NJfYycdG3KT
	wa3h0C3z3wIIHm6KNBpnvYx5pCK0pBPmTDhW5d5d3kgdiHVPKtloyhJvsukefiMK
	RqMcS86F0burvx/9qDvI3zOU89h01PIfganbNMIci4fRj7Nk4IoEU6RQtt1xgQcD
	pVczQGkdsNEzqopEt7iD4bavGk/HE4DkE0Ft61sI7iPZK4DUbGQjuTjUTeZnoQG9
	LQMZ5FDb06LeAxBAGtBPrj/4ObfSh63CLmavXDn+YiEWr+NzUpPSEW1hKEsK70mF
	IQnlSA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb5se99sv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:22:59 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35cbea41088so4049681eec.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 20:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792120979; x=1792725779; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=alOZNhc/hBycopSj6aablVmFXgtwQwPhX17D8dTQR5Y=;
        b=F99oRpCq3rxvo/WRpnbYT9nmfxd/Ya3yqKDgFNzdGigTvilJ2XdCQB+A6IlsVEYgcZ
         RdcapktwmnARMMqoezyYDd7vIAVE2LCh0RSC2GGkAD2RZ1Ia8ZE+CdEEVFcUxgY7FDdR
         dl2GdtXEtvkpLILSl1GfPXe2nkwhkqqGOUaOwTsNPd3+oPSNqTu4z2pWhdepI3Ys32VR
         pDwkg56wAvqzzzOkOJpfhAkiGsMsCJbKbF+WEGrEGVpBcVLqh5IwsO2zw5gXTrcDNeAZ
         fjifR1pEihj6hPkR6EEU2XjhVSXDC6nj3wyFW6409+NXrZEN8cts7XvMo6UO1Z4AfAkW
         EDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120979; x=1792725779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=alOZNhc/hBycopSj6aablVmFXgtwQwPhX17D8dTQR5Y=;
        b=X/geMvFkwAYUDsf9Kp6Uz1NUJwXfan1OrnQQZebDW2+1uMz11Hqmv0Ged+Ogl33aQo
         WKnreYdpDwPUn0P3XutnG/SqAubf9qqE+SmFTw4QCt3d+o1k0VqUQBY4eF/nREoeSF5X
         GXNjKaNeVR73Uj0SeMkP9EdApoC4bnlD5kGiVUx/il16sjDhn4vewSctJ2t045tQ3D/O
         UEGE5tQhy8Lwx8TwrUaQO1wSxeNeG1BEXR2RGHyQ9e6grunVc5HAOeNWzGmOtTyOtabw
         +Psj1m+TxWFT1+ihomuDvyA/hJwvIGBQQCfXgYKwBpvXrognw62JSc1s2zJjn4pmd8aT
         OJcg==
X-Forwarded-Encrypted: i=1; AKwUvBy5Fz2KR8G2+HuIeRMXolbqmTuv6vC/b9n2JizlzTqKseE3OGjpewi3svWbJg04JHkezHI1Ria02KMS@vger.kernel.org
X-Gm-Message-State: AFq9FYLUkepagzrF5w3YcdUYrRdtoo1pqoz+uoRHu5D8mxd9ARiMPaLq
	OZaeXX7c7d4XuV7lCdSc0tPRkH6hFA514FdR+EgSd6ZkEclrF9u+xicVb8H7kT7AU9GZvQyJ3Zi
	3lfmlcCwHw4kchl5rNSWXA0+iIrh2bmSIzAivDqVwr2XZV1FkRYUOnGCB+ZUpc184
X-Gm-Gg: AYBFou39pwfVBk6BrffaqlJwxIr4l6h+gcz+VoNHQhkNxYrxPnxuAmWt1bne8xSBA5m
	XNHn0kJPTwo7wKBFCVpvUkEbg34cV1s/dekd66TP3X7mIqvnLlNIvaK3LsXv9T3yH4c6iMKoTMt
	KRqCrBccflUrA2XUShj0AsED+2H35ca+5xvO+CME03mEzpRvoAiDaDyTc72F2Y8QyK0VD6abR5U
	Fg/r8jhQFhSwLdEpfP55TJKLK5+rfL1RnbleRQgHxJxxyf3T4r/MztrGlzv9jqDFf4l2lIltq7g
	hXSyFL15uhO2KytxiR8z1Y3tLRrSp1y+7VnimjKdOLjFbrH2lKHegWHKELnZn5FFeThQHLvpYF3
	xC6lpvLG2KLOJ1CZPpluHne0yO1b5NNjd88HqTqCa3Llickehv6q74KuwQ7GeIMQKTA5UkxkLLs
	/g2e2ed4eT7YHOLPCHcVpGFg==
X-Received: by 2002:a05:693c:20d1:20b0:35c:e696:2d4a with SMTP id 5a478bee46e88-35ce69632e9mr11810181eec.24.1792120978693;
        Thu, 15 Oct 2026 20:22:58 -0700 (PDT)
X-Received: by 2002:a05:693c:20d1:20b0:35c:e696:2d4a with SMTP id 5a478bee46e88-35ce69632e9mr11810126eec.24.1792120977713;
        Thu, 15 Oct 2026 20:22:57 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2256698eec.13.2026.10.15.20.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:22:57 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 08:51:52 +0530
Subject: [PATCH ath-next v2 15/17] wifi: ath12k: Derive QMI service
 instance ID per protection domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mpp-bringup-v2-15-f510c33bfcf5@oss.qualcomm.com>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
In-Reply-To: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX0FSyigslAT1z
 zUO6EPkWkZm9et/1xSnn9M4/y4wW39F+8HeeXo5TguwW1ysOdJyVn5+tGu70L5Scmuw+NBPywrW
 U49rT626Ucyr99h7+xZ2brEHF6l7OFs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX5T+Ld4LH8wrV
 hZr0cYgzx0Q9GBmHXIiabCZlCIGoC3uPSnCOqVyL3hsfNKg5jcoKpn3Rr/zZhZUdCzxdGldRWtJ
 GGxHbWaviwe2wdIWb1/E4wexpwAbVddn7WdXO5zZzy1ZaRzry0hSS0+vUqLKV3eltpiU1HWFKP0
 rpGUkJ+1ZdqfA4yNrstalUeLJ/P3G3bTZO0WQOlBJeMBAyxnNLRXtrl54koEb9Hm6f5xkkdsVwd
 Qrirf+0ztOpE0Ud6dvlihZpceP97srRAYOGKxFIqZSNkFjxPStvTImWFDqrKxEswKId2G1fn9LZ
 ZQ47qmcUcXkolqFFr9Vu+d9Q2rrWbNcboHKflo8cHpNWYbEdpwlmeQRi8bEnjXCh0owLTftJRiq
 qoi1UvkYy/Hlr1zDjPfT66gqn/pBuzDRZiam0yVSNlgHOeGW5qi51pRIHcxWldO5F/2cZ1qHUov
 nrGRr0aOwZs7frs9zcw==
X-Authority-Analysis: v=2.4 cv=P4yvFSAu c=1 sm=1 tr=0 ts=6ad19893 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=1lU9L7Y0PnsvXye6yGIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 06CR1zQW23Kqy60tDrD1wC27wGN4QqbK
X-Proofpoint-GUID: 06CR1zQW23Kqy60tDrD1wC27wGN4QqbK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012

From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

IPQ5332 platform variants are supporting multiple Protection Domains
(PDs), each PD exposes its own instance of QMI services. The current
implementation uses a fixed qmi_service_ins_id from hw_params, which
results in multiple PDs sharing the same service instance ID.

Update ath12k_ahb_init_qmi_ce_config() to derive the QMI service
instance ID based on the user PD identifier. Offset the base
qmi_service_ins_id with (userpd_id - 1) to ensure each PD gets a
unique service instance.

This avoids QMI service instance conflicts and enables correct
operation on multi-PD targets.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index b9ec14e86def..cecafc12e8a8 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -567,12 +567,14 @@ static void ath12k_ahb_power_down(struct ath12k_base *ab, bool is_suspend)
 static void ath12k_ahb_init_qmi_ce_config(struct ath12k_base *ab)
 {
 	struct ath12k_qmi_ce_cfg *cfg = &ab->qmi.ce_cfg;
+	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
 
 	cfg->tgt_ce_len = ab->hw_params->target_ce_count;
 	cfg->tgt_ce = ab->hw_params->target_ce_config;
 	cfg->svc_to_ce_map_len = ab->hw_params->svc_to_ce_map_len;
 	cfg->svc_to_ce_map = ab->hw_params->svc_to_ce_map;
-	ab->qmi.service_ins_id = ab->hw_params->qmi_service_ins_id;
+	ab->qmi.service_ins_id = ab->hw_params->qmi_service_ins_id +
+				 (ab_ahb->userpd_id - ATH12K_AHB_USERPD_ID_0);
 }
 
 static void ath12k_ahb_ce_workqueue(struct work_struct *work)

-- 
2.34.1

