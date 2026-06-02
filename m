Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077A23C5859
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 22:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780439081; cv=none; b=Y8GBwQtx9ZdmafeSx4jks0bRG1NN9fDtyAQdDLR9JBZweBAPeeL6seCgX1e/QU7FaMeyOYUyglq8785nkL6KOV+wcWqqL+6VNscuMRJXHMqj0KspUYMpL3g1D3511a0JKfq+YqzEkSrr+1fNfHEXGn1eQtQfYSYXSdLQfLV6/8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780439081; c=relaxed/simple;
	bh=V18lkZ+mYtRW45RZQcZ5zGi4H7dZflBvwdwCuHqEMXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b9fKnTJi6gux5Uk4kCn5gWHyYtX9jSDWCcFNO9PBP4nHJoLSRRKh7B+swA53jrAKcakC8Ka8vwq1VxyWG3zRpjY1WtoPon+qnJ9uEMBE9sHNnyQocgnTmp4Zm6FmOrJFvUpNZg9n7icpRIYyPfGPI06tCNoW4AT68tXgVanS8D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z/s9qazc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dONhf3Ti; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z/s9qazc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dONhf3Ti"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652Ix6841316228
	for <devicetree@vger.kernel.org>; Tue, 2 Jun 2026 22:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A2btTWcfqlMf79K2ygn2F3WwB6X9SQ/bHFDltKt8bfE=; b=Z/s9qazc75eVm00Z
	hp9V2BaPvIjogFVlijZPwpE07pppmDpAQN9Dwugtykoz52kPiikfn2CrvkO+HSXE
	ktgFLHHrfgEkCajNC/YjEDI+uhDnDnwYzreKAEksO1i1NnYO7Hnrx3OJqKsWMqcb
	nLTPS06E/DgjDPn38l5tIENZexL9/o8Iiz/jkw68Mt/aEtvM1bLIVwNWeeQN5cPc
	x4fkIVBjVBwOKndXyjhsM8yKyT5zhGL4wMXBYSVi4VLelohgF0hfViRvvZSEXSKN
	ocFlENQhRtPqI3mpThO/S0quN2yrAQiqXhibU/njTd5nKvyyyp2eL4aJsRFuOhvb
	Kd6frQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehs9vv2f6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 22:24:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf0b7425bbso106414055ad.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 15:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780439078; x=1781043878; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A2btTWcfqlMf79K2ygn2F3WwB6X9SQ/bHFDltKt8bfE=;
        b=dONhf3TiY3CBkyDTjpZnSnAmgBpRBgV366J8nYMP+w+dlnDKkUA/eoWdPRF7JwPv2D
         s0uo9m22QoElSdgJEEUUgRqVDVVjJOyYm/yKJD+lY3pA7v8iqO8xa1KvHon00EzmPl9g
         IAv60tjqgfaiJHUTGBmqMTytun3Jyh2aPsw2crTgkhNMS5jFB3AH61PFXNiYc4v5FCu8
         6DorED/Uy/qajoNWEkvX6G7Jwf7BYy3+1qw161/ugk19LKAZttbjH8JV2/IRUu8trBXy
         Y3Hyq/lj10caF25H2UCcaS/lslk01jkXWzOHm6VitBTiRh76STBOX4MX7ZRga/QLeXWr
         d8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780439078; x=1781043878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A2btTWcfqlMf79K2ygn2F3WwB6X9SQ/bHFDltKt8bfE=;
        b=UZ11ucbCCrrzaKAcnuKr3Ft8qBdU3Y+i3OgBRtWrlToEO4BOZBNM9c7LsBtehXxdJG
         sCfvxHNa/jumR3iCYrzGfkpWEubZrsuKG/gtYr+e8pRJ4sM2p6D1Da7CM5Uter2qMm3b
         b1bv3f2UR9YICwnEF7zEQXHudXAP8FCf3c7ZVUC/Lcz3YS0FEupEK6sR3QTqVv7BPKGA
         RFVBdJfrhCXi3MryU+wnYjmFRXj1X2evWNEHf3Lc8JP/BksFYkmizBldmZHKcHUxFeJ1
         6W3MmFZ9E7u24AKhvqXpTKxYPLRqQGPWHcbEqvIxpSrxWd55fTDGe6zWJNTOAizxFAYB
         8z/A==
X-Forwarded-Encrypted: i=1; AFNElJ8IdYiq/W1N76M9t2xFL9dRwTFplHMBiNgPksZs2vtlZoB8Rmt3unaLZwTSC5FZ/53WKtb3yypLDi9l@vger.kernel.org
X-Gm-Message-State: AOJu0YxP4rNYKwnvFGxoZCFhNLafz5X8k0aOiN98Z8E0PDaXiZLExhzu
	I/10zJwX62JtV+DSr+bUTI0wckm+Wc4x9XBRpqLGXmCgp+HhLrEkokBsRidxkJiz2GSwPeLaRmF
	mVXblhwZE/0rrUjop8K2VX72f88512b/fjjXUsLM6aXip2d+Swd0Ra4kp0+WwOhXs
X-Gm-Gg: Acq92OEh8LlQi3hV0jw8K/J1GAl+Vedwbwttn6NvCZDZSXWS+fBbYNmsJ0b6tGG0J4O
	pXeSp4d+VK1q32DlOoEGZ6Uw4wSGniZlpCEtxpeRxL1I6kQ3jBRlP6ugMZEuMHTRf767QsUlxHA
	PUOkILXRxqdLXzG6HsqyMPlcjqTZgPZzFEDXfy6WikI/wtRnwLAvEQhfb5+KZstcyXmMhZNzvgb
	G1PtwzwzFPBm9XzGNzBoYBc8KnpmOEYbzPs80uwU0yTYRHzUGiLoLIGpyJL1TEu7hcd49FRjWAU
	zEK2z4BLpQD/fvHYXFBPQsa+DsBfEansJXplZ0W+bLj2hECzU0+1KQxcLQS9kx+2ONTzrIWDT0s
	5zD51rb/9HnTeIh4tqvpjwzbSOROT6vr+EkZpS8zqq5qORPvmK4ppAgGIHXiaYEa4SZSYmQ==
X-Received: by 2002:a17:903:1252:b0:2bf:2114:ecbe with SMTP id d9443c01a7336-2c163fa8545mr6071685ad.23.1780439078435;
        Tue, 02 Jun 2026 15:24:38 -0700 (PDT)
X-Received: by 2002:a17:903:1252:b0:2bf:2114:ecbe with SMTP id d9443c01a7336-2c163fa8545mr6071455ad.23.1780439077952;
        Tue, 02 Jun 2026 15:24:37 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e0ecsm2698035ad.45.2026.06.02.15.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 15:24:37 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 03:53:54 +0530
Subject: [PATCH v10 2/5] ufs: host: Add ICE clock scaling during UFS clock
 changes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-enable-ice-clock-scaling-v10-2-b0b728435356@oss.qualcomm.com>
References: <20260603-enable-ice-clock-scaling-v10-0-b0b728435356@oss.qualcomm.com>
In-Reply-To: <20260603-enable-ice-clock-scaling-v10-0-b0b728435356@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: o8r-32D_0gTUUNsUlndLwOyO5sLsstaF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDIxNyBTYWx0ZWRfX7K3Gpsj5MXRv
 YpV2Z/Hj0c88uKXf7htBJhbcQPonEpT7QwN0t44tjTp0g/NnkxPT0znl/m/zK71b3tv4obIRFFG
 LV6batVOn2/Zqs7gjZfwAzpvdIzNDrvHya9SrelTJ7fQ1bS9TlUTYB309us99RI14dzuyDGuzPN
 yG/ovrOxYYS5pWZTy8JZJtJbRWedDUFQ04ipWgKKuMQCLrAl1YSSCvn7jxJNOIp4qukk+wX4GZK
 OW5I8wm0FCOSavov7seiVgHzRbH3eS/FxCVgs6qoZLnNbvdeqTpx7OzlTgMLlvx4w6GqiqHeOZs
 TiuZFo5gQZBS5VUrPFB/8U9Yqcl1jnJvZCurc1lM11sDWbhwnISXqMa17y6VzqhSAmJvN8XOMFG
 Q9uB4TC4KrmYyLKpVKZK3x76yaJukIi7aIrVMP23N5bjZ9zmFns/q7uV0Y2SfnRWkveSq5ryCYE
 83t1d7na3DoE0y5bcnQ==
X-Authority-Analysis: v=2.4 cv=NYfWEWD4 c=1 sm=1 tr=0 ts=6a1f5827 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4vEl8bdWBwuQafGpEzkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: o8r-32D_0gTUUNsUlndLwOyO5sLsstaF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020217

Implement ICE (Inline Crypto Engine) clock scaling in sync with
UFS controller clock scaling. This ensures that the ICE operates at
an appropriate frequency when the UFS clocks are scaled up or down,
improving performance and maintaining stability for crypto operations.

For scale_up operation ensure to pass ~round_ceil (round_floor)
and vice-versa for scale_down operations.

In case of OPP scaling is not supported by ICE, ensure to not prevent
devfreq for UFS, as ICE OPP-table is optional.

Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 291c4344876481461ab958f3048db5405bbead62..dc15d7806c7b677d6890cd4b077cae4f4d5c9a41 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -306,6 +306,15 @@ static int ufs_qcom_ice_prepare_key(struct blk_crypto_profile *profile,
 	return qcom_ice_prepare_key(host->ice, lt_key, lt_key_size, eph_key);
 }
 
+static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, unsigned long target_freq,
+				  bool round_ceil)
+{
+	if (host->hba->caps & UFSHCD_CAP_CRYPTO)
+		return qcom_ice_scale_clk(host->ice, target_freq, round_ceil);
+
+	return 0;
+}
+
 static const struct blk_crypto_ll_ops ufs_qcom_crypto_ops = {
 	.keyslot_program	= ufs_qcom_ice_keyslot_program,
 	.keyslot_evict		= ufs_qcom_ice_keyslot_evict,
@@ -340,6 +349,12 @@ static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
 {
 }
 
+static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, unsigned long target_freq,
+				  bool round_ceil)
+{
+	return 0;
+}
+
 #endif
 
 static void ufs_qcom_disable_lane_clks(struct ufs_qcom_host *host)
@@ -1946,6 +1961,12 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
 			return err;
 		}
 
+		err = ufs_qcom_ice_scale_clk(host, target_freq, !scale_up);
+		if (err && err != -EOPNOTSUPP) {
+			ufshcd_uic_hibern8_exit(hba);
+			return err;
+		}
+
 		ufs_qcom_icc_update_bw(host);
 		ufshcd_uic_hibern8_exit(hba);
 	}

-- 
2.34.1

