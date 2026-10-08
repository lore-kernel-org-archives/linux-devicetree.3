Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D80497394
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 10:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791455067; cv=none; b=PrcYGkmq5lp10n9Oz27pOnNHQ32FVbORLU2QkVacXdcTdPydht13QLSCWDlBsk4DrsFky0Y9EkzvKqBtEfB6KB/Iq3Hcaj/obH9GmCk4YTinSn8GxNSJ2urV7f6geKhY9XioQkiqydgt4thZQ06Rx4DWWIzlaUMFCxeE7eqq1XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791455067; c=relaxed/simple;
	bh=8sjW42bQBGMAbDmBZcK/pVg/lurB6DK9e+EF6Fx/Qag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hlEnnvcESkFhJxCKgYmDe9R0qHz2hJUW6lyr6zRc5jEspE4enb3l9KZOXl1QdvfEXzLoUpbXhxON7xKUwVOmZwYVKXn3Dp+LJhjOL0MqDfz/+Q9Xlf1HuXdLRcI2/w684S8wHBPGiobXwYcBHb5OpuIeVrVXVVg7B7RuSYm7NCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GJNU2cHV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j7BUYRts; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GJNU2cHV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j7BUYRts"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KPLn2167108
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 10:24:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wa7DmZ6ssigABhc5h5OgPyDj2/OGW3Y/6mK5cRprqeQ=; b=GJNU2cHVGO3OPef+
	Ku0yIzdByH/lPiwxowruCtBLrFkptUk03FtqS8eLLlIfWz4Gjeyzk4dYOx5jFCbm
	aXn1C2zieZtBAm3/wz177j2IqzQuLiNEciojVWp7rK5LukyUJ8dzrqB1kgo7vGy6
	fkyd5Y0uubcsAhN8hujibSwSD+H8FEeGfr1emSLWPADQFWOLjp2R/uwz/UEVE6UX
	4AO31WJX+WuJAi5cWQKcJdv6uU394tTiNs96NZyZXstKHj3axEGWv+iVM3tScdm7
	LpXjjfMxLIfz1yr0eLHbXldkyWU5X59X0UbmaqT8d4vk2vpkMmpCOzwHXgyXs7I8
	m4FXhA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2tj29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 10:24:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e605efae40so22143145ad.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 03:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791455064; x=1792059864; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wa7DmZ6ssigABhc5h5OgPyDj2/OGW3Y/6mK5cRprqeQ=;
        b=j7BUYRtsWk67H5BQ8V6O+0OVr1l5Ky41LrtWD8Kb1pebluVHqwBV+2YNlo5jnXHROH
         J2+9aLuMskuJ0bXUDzwmhHQXHilER0pY98fbeIiE9gbOUOlpFSHHgYB2a4ZyZOnGh3Hx
         hCWMBk4fE0YbOY1I+OvurXcHe95Okjcbukf5tb53XnaQWPqQusrCaBE3AuiSsECO8rfZ
         /pDyacwdKa2x0STRuJrH8EHdSYZiJr69jaaMH1/FGaGYvQ6wXJemWc6M92LWab2qjk7n
         50hEqVk1wpJaEs1AVj0htwzGvpMVOuIyGvWlgbhldA+YlGcfoksJPKa/JGh7pNwPk024
         sMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455064; x=1792059864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wa7DmZ6ssigABhc5h5OgPyDj2/OGW3Y/6mK5cRprqeQ=;
        b=URXD3P54X47gCLxJX71V8CRCt3ExvjROlRyhRdHWd+wRAfht6RRkV+uuvEArkTVPLd
         YFVh7RyY6C8UnW2342rUhbUUUPmL4lOdpCAFKohqLDKnS+FeJ5rQGexUZ0hARVKRyGIL
         mrwp4tvVCDMv4EHhOsAD734qCaePkTiWB9Guwq/38IPpqY3pNr+kln4Ntm/9Hdp9/1IY
         C9LpmBRE2gEULbHZrwRrd0kXU001gDfiuf0qHWpFpjI9l56GczpfWr2LdMvLzErJ2XDG
         twIOi7IQQeQwCUTG4/96W/ZDNNKMnQ+eENKerppeYnpko7ejJ1fLRRQJEWQNsCqjMhh5
         lgZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMQ0LQupKKm68MAryvolHnRn3Zkx63XBxcamXmPwTru9Sn9lCUS41cU8JUunktLft7ANDDaH1FOlDD@vger.kernel.org
X-Gm-Message-State: AFq9FYJmcB+kOoL1rn76pf1fbvx/gd9eJD7GahMe/rs7jG3ys0TIK623
	Qjnnem/0dQo31LzYHExMGxE5vWf9o1/+0quameEoeqY++XtWlUGnfvm8hQVzeom8uoS9sqjK5Ie
	ncdx6SLoVSehfIJ8PhvOWPNkgh5IVXC3ouIBBea/XXartk8RVJUBAkLkeEkcEWqsV
X-Gm-Gg: AYBFou19oZdTdycZxXOxQtWOryVLQ2seH/RwZqSyKx0VaeF1PzSBT4p41Mrzq9z48qi
	gc7ML3Sa4tp51Wbbmu2N07v4r0jsBU158F/VKuxtmsGlSEijeCGiMNsBFhyxkR//Lni9nIz3g24
	Blu7CMZc9ncgTUD+InveC+ZWwobZsyWu2a0gZpc1WvHM+ep0NIfzAvjh1I2rz9n8xLfUPF0yeJM
	HBnPfgwb8CJx8PelC84Iiy+EcCxLhrZWTZRwOZ7y2/jFKMJ6FJ1YetG3qf4+Kkmu2wd+7KwCtVh
	UAsrlmRjoVOrdEW+9KHuQRWxKyEWb4lbYNCs2+eTYWS9Yl2ASBVMCMkX4pw/Z97/kj0uCFbCMeg
	W2z7ogaNTIOa7CFUYa4ajgsBYK/xPsUsLZzDAkzYN4bdf3dZ376xqOGSs6/Zla8IAH/dbnbNPlr
	VTzCjNNQrzFUi5oAJd8Ny56A==
X-Received: by 2002:a17:903:1a6f:b0:2df:8382:918b with SMTP id d9443c01a7336-2e5ff84c27bmr43532955ad.0.1791455064327;
        Thu, 08 Oct 2026 03:24:24 -0700 (PDT)
X-Received: by 2002:a17:903:1a6f:b0:2df:8382:918b with SMTP id d9443c01a7336-2e5ff84c27bmr43532825ad.0.1791455063855;
        Thu, 08 Oct 2026 03:24:23 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe39csm22081655ad.16.2026.10.08.03.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:24:23 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 15:54:00 +0530
Subject: [PATCH ath-next 04/17] wifi: ath12k: Add hardware ring mask for
 QCN6432
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpp_bringup-v1-4-2c5797b5e4ac@oss.qualcomm.com>
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
In-Reply-To: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=AbMkjHXG c=1 sm=1 tr=0 ts=6ac76f59 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=qBdOBzyLVJzNEwNtDhoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 2BtxEd-X0haMrR3BGSm8OJr__EFV3zyg
X-Proofpoint-ORIG-GUID: 2BtxEd-X0haMrR3BGSm8OJr__EFV3zyg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX0N2u9QE0gZcV
 IXm+vBcTOFfVrTaOucvpgkmqakUvGuvOcAutp+d215MV+gYgKu2WMj4LsPZCeDArZkcaJeoama2
 YBielFmk9huQUf3S6lThq2hhfKJ+XNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX7+XT97z5IrcA
 0FYd6m9D08CqVG6fni/aPvpmOLpdrQlTW6A0k6LT7AvxTRx9mq5FP/46RK7apf02BlnR5vd/Ihc
 1OYlxrgeM1moGlTKqQEay1bP5FF3bS+JusPIdi4Bl9Ro4MXky1w+slLJ5zL0ALwl7ORW0fl/dou
 3m2jUjXB4dtqrz9D1e2MV/FmcLWQjvvbUJ0Qnf41JFCc5bcAhf6fWLxREmvv1Om/Ps3WFaSmDnI
 S07H+icqHTLggSiQjDCOhq9dX46uyiI22fIss6KjJolYjfRnskl4/NPqyk1dxIHi2LaRJLHprqv
 x/Y8VUvje8gEk/2nMFimCDiLqs7q7czBc0nvZD4iBVrZQUUj3wRg3r6he+/15AfSMCqoADRAPZw
 eToz6elYkoiwnfltWVbCK5IrtYt2vSlnfmAwGLkyEqlbwvVF/0RnCKha1quJSAkm2TXou3Q5IFD
 JQFbs7KJfHIhiBbyhFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080041

From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

Add hardware ring mask configuration for QCN6432 to support interrupt group
mappings for various hardware rings.

The QCN6432 requires a different ring mask configuration compared to
IPQ5332 and QCN9274, with support for up to 12 external IRQ groups
instead of the previous maximum of 11. Hence add a dedicated ring mask
structure that defines the interrupt group assignments for TX rings,
RX rings, RX monitor destination, RX error handling, RX WBM release,
REO status, Host2RXDMA communication, and TX monitor destination.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hw.h       |  2 +-
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 52 +++++++++++++++++++++++++++++-
 2 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 1e652dc0d247..2e585a42dd9b 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -127,7 +127,7 @@ enum ath12k_bus {
 	ATH12K_BUS_AHB,
 };
 
-#define ATH12K_EXT_IRQ_GRP_NUM_MAX 11
+#define ATH12K_EXT_IRQ_GRP_NUM_MAX 12
 
 struct hal_rx_desc;
 struct hal_tcl_data_cmd;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index f57adb2107df..408844024dd6 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -332,6 +332,56 @@ static const struct ath12k_hw_ring_mask ath12k_wifi7_hw_ring_mask_wcn7850 = {
 	},
 };
 
+static const struct ath12k_hw_ring_mask ath12k_wifi7_hw_ring_mask_qcn6432 = {
+	.tx  = {
+		ATH12K_TX_RING_MASK_0,
+		ATH12K_TX_RING_MASK_1,
+		ATH12K_TX_RING_MASK_2,
+		0, 0, 0, 0, 0, 0, 0, 0,
+		ATH12K_TX_RING_MASK_3
+	},
+	.rx_mon_dest = {
+		0, 0, 0, 0, 0, 0, 0, 0,
+		ATH12K_RX_MON_RING_MASK_0,
+		ATH12K_RX_MON_RING_MASK_1,
+		ATH12K_RX_MON_RING_MASK_2,
+		0
+	},
+	.rx = {
+		0, 0, 0, 0,
+		ATH12K_RX_RING_MASK_0,
+		ATH12K_RX_RING_MASK_1,
+		ATH12K_RX_RING_MASK_2,
+		ATH12K_RX_RING_MASK_3,
+		0, 0, 0, 0
+	},
+	.rx_err = {
+		0, 0, 0,
+		ATH12K_RX_ERR_RING_MASK_0,
+		0, 0, 0, 0, 0, 0, 0, 0
+	},
+	.rx_wbm_rel = {
+		0, 0, 0,
+		ATH12K_RX_WBM_REL_RING_MASK_0,
+		0, 0, 0, 0, 0, 0, 0, 0
+	},
+	.reo_status = {
+		0, 0, 0,
+		ATH12K_REO_STATUS_RING_MASK_0,
+		0, 0, 0, 0, 0, 0, 0, 0
+	},
+	.host2rxdma = {
+		0, 0,
+		ATH12K_HOST2RXDMA_RING_MASK_0,
+		0, 0, 0, 0, 0, 0, 0, 0, 0
+	},
+	.tx_mon_dest = {
+		ATH12K_TX_MON_RING_MASK_0,
+		0, 0, 0, 0, 0, 0, 0, 0, 0,
+		0, 0
+	},
+};
+
 static const struct ce_ie_addr ath12k_wifi7_ce_ie_addr_ipq5332 = {
 	.ie1_reg_addr = CE_HOST_IPQ5332_IE_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
 	.ie2_reg_addr = CE_HOST_IPQ5332_IE_2_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
@@ -919,7 +969,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.internal_sleep_clock = false,
 
 		.hw_ops = &qcn9274_ops,
-		.ring_mask = &ath12k_wifi7_hw_ring_mask_ipq5332,
+		.ring_mask = &ath12k_wifi7_hw_ring_mask_qcn6432,
 
 		.host_ce_config = ath12k_wifi7_host_ce_config_ipq5332,
 		.ce_count = 12,

-- 
2.34.1

