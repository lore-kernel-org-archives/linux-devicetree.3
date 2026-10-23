Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738940;
	b=c737+CNXWExOkLk/2VJ8dH6vvix1seUcYyFkoUXp9/ml35nO/FE+8OfRUsFQwOzPjZ5/
	 /KuiTYAltWhr7pdjHoieIxHaTkpSwtyEBvECyzDYTtt4Ig5uSTkzTvNTyjwd88faxkmaJ
	 7wUIQfp708xHURDoJKpph7pvaapa2tREDcci7Qfy6kWX5L4DBPqXQQZwn6AWfwaZKKg9L
	 tdbW1jBORxY/Z41aw1cg2qB3A/yuFCWacMj7FfVDbwhBrxVtlsF2unzj7mJsjU77h5gjJ
	 +LoVrDCjML4wY/KdyXrxbNTs3OwJxZoArS7kTQvxVJlbRb2x4BxsaHTGypeRun+8oRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738940;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=alOZNhc/hBycopSj6aablVmFXgtwQwPhX17D8dTQR5Y=;
	b=PYNEQfh/utEa0IdgahvBnGdwNc3U7mdhao0sIQmWRMp+uTH/1L6IseM8Hx/EgK5lJ8g0
	 hQebondSOQYZKB5JTxaIIhQpzvp9XtveD/+q2YMAaYWm/Cys08GT5OZvvb28StXklyXPZ
	 vDr+ZGyrNN2r5p+garoQLQDtH+hycdB87lzJhd0+nfwpVHJ7i8Ee7aT5p8WvvqvwktFYN
	 Kpwz8Oe+XzKsWEsoRahEXsbXzbJsS2IVvcgjB3/I0vlDsz933HcuBh3LU40ywmAoO4mza
	 PdfaYF2Z1ONCf/laLviU9RAeiIHEQL/GNLsLtjCRpgz1iP65h2KlugOKuz/qb5V+Rcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bI6SmZwL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GoCnkv59;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6182D606ACB4
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6182D606ACB4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bI6SmZwL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GoCnkv59
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1Fk934008225
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	alOZNhc/hBycopSj6aablVmFXgtwQwPhX17D8dTQR5Y=; b=bI6SmZwLCFk7Z0ok
	Sn9qNsE4URzMOnntz1F/3GzPqys+FvgZKSAGJwNa1ILVlXQfEhArYnOwlOdzpLv2
	XKtvkoQD05IXAzIUrHEWk0sSxR5iiwDC13s0t5KrR2lmZTXltVJMrlMXv1j10H8x
	N+BhvbiaBgvyxFIG3o/G3v1DcUUlhfwWVfCAxN5z4XGu6/LLMCV6zUmfw66Ia4dl
	O6Kdf8VoanQdczSMZ2fCp09LmJHa/Q2PTQk5aIsdxHFzYzCIiFEnU9BQR2G+A/C1
	HD+rGp9Y/KWl/NzbihKqmyAofU7E4dcthGXOCvw2MTvyqbg025WAVbfJQ5TuAkwu
	A4wg2w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsmasv28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:02:19 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso423991a12.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 00:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738939; x=1793343739; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=alOZNhc/hBycopSj6aablVmFXgtwQwPhX17D8dTQR5Y=;
        b=GoCnkv59qK2VdqnYNVSgqFYzLeBeiXJtyHg5N6bJqC0bNIRdBV4qJrSpmPglQEcwRR
         DPDrWSlwPtNZ3L4TsgaLW5RjzRQEaRvoe370BttoXeBvUGuxyicOvSrYoole9+tur1KU
         yz+FvKDD60y36uKyALcPGfEvFC1u+a/1hAjFMX27pv6e2Y3uzgAA4pcSD1P5I1Mxeswf
         VHOo4/FYjdXcwF1NSudloxu9oaqpJTFKzdinKe1cuFFMAeifvnIrhKDSa4ToclI1jz8O
         6nfBzziwCPjxQvkagqIXHB7r5YLr+90WoZg5gZq+n5/QQzrhM58tciYwUBFgq0Pc8Nhy
         fVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738939; x=1793343739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=alOZNhc/hBycopSj6aablVmFXgtwQwPhX17D8dTQR5Y=;
        b=vGkluCGAT/RkwBwrKVh2yUEqRt+GJXOQgFEqO6YvIO7NZ7oGgRvwNXyRY+NtGITuc0
         WSdH6tPTkR5HliT40xRlfuBhXxvOLhZ1JNAEdbHPu2pLVvYgL1kPCvM4JMsP8lz3PYhO
         TAjy6dm3Kqs65ekcc/zQXYDODJ82yAvPnjX6+mxIYzh6fhaEzzutjXuwOK8zdGJUC06W
         KJcX9FyKMCyF99eIvy3gph8T6JCV4BsTVSv7207VRFmWwBIPmqMP4Tcrr8T7UKatDfXZ
         SxHVNuQYLbmMJXCU/Tcqcfx4+X+/X/pzQ1oc6SHYlC3ogy3p3OCBG8XHnz3fHT+ebxwP
         ZPqA==
X-Forwarded-Encrypted: i=1; AKwUvBzxG6wbfl91Gesih+GXbO+e5Sr1ABNF90J/U8P9rX5X3A9gUBmmXezZkg5KY8hEnjK7DUbqTk5pZTL3@vger.kernel.org
X-Gm-Message-State: AFq9FYJJDWwoaIlMKUiTOgGuOxuOGumhnUirUUpdyrIHpTttXMccPIdT
	IvWYRIKmquRXR2X4BUHp9e/5EWCYJlOdkV38rGZ2DZnHahYunjPxoVDdODZtMAJUvPGGX4vdjsU
	6paApxu3IKimUImxcpq6Pvb4RDv01G8fPdaqNOLZrXmYcljYuc9TNO7CZrL4LxLA7
X-Gm-Gg: AYBFou2uHgz5Q1XRVrMQoRyG1+OwxWD1gDeqJxB0ln7iC7GcPFi1GkGn4JH2EBO2tG/
	16xM7XVFYwn+WYjZRV8kbYyiFX5KnQAF+qKv6pKR+nTPvCBbT9vqQcRhZ+zvS6NSuHJc7jmOTGy
	vTwCqOu6VSOJ7HfUUPSL1oH5TeLd8ZQE3HBlHVDCcNqidSDUNUKoDK93KyQ93/ea0dzidHea00P
	RrgWfjw+gjn8He1WJw0s8YOYDktfCWFi3Vtk2TtuGx7NE6Tnak0OyBqUU/H+NyH5V1B7GtqDW99
	rhIGEBjGQSUN3tzgDWQWGxNrKgY+RgfVyiRo1fduw6VAsGnV0UOqupdijPLDoqjZaMK0WMcrr9u
	q1bXOtuGd71MFoIWU26Pf6mnBWvc8IHfClgcEzSCyOXTkrbRxAcqz0prUiVCb1cq3N7YTmVzZc+
	VKKwZOC0z9o6IdnLGV/82PXQ==
X-Received: by 2002:a05:6a21:7e03:b0:3e2:57b7:4d7e with SMTP id adf61e73a8af0-3e359a4a06fmr983839637.10.1792738938921;
        Fri, 23 Oct 2026 00:02:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:7e03:b0:3e2:57b7:4d7e with SMTP id adf61e73a8af0-3e359a4a06fmr983816637.10.1792738938254;
        Fri, 23 Oct 2026 00:02:18 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:02:17 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:31:18 +0530
Subject: [PATCH ath-next v3 15/17] wifi: ath12k: Derive QMI service
 instance ID per protection domain
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-mpp-bringup-v3-15-19f3fcbf7b5f@oss.qualcomm.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=V7LoQuni c=1 sm=1 tr=0 ts=6adb067b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=1lU9L7Y0PnsvXye6yGIA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX83S7feNZElf+
 KFiBVjm74adRM2+uAM2p9O7KV771+9+YTVBde1fi2+SyaAeQsfyUugS5TFjs6r2uo+thamFT3l2
 TlyBLuJ6dCZEXghXE3u8pjjicn+LwnI=
X-Proofpoint-GUID: rK6UFYW5HCW1SsFyoLozZibL5QCPrzrv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfXw4Qzcv9i7SQP
 LKtOozgj5Ik5W2oznsBDvXHjPei6pf8JXQmpHAipn6ZhlehFz/O1Ze4uswLQKm0GkLYTtANFI5S
 r/LLE+ZbLplK2pTizGUASbKGdqLjnYfeJA54DOEWcCVbaCmlyj6RllFrSJSel8qf3Fyq7ILJMGo
 RJt+VSSRswRsyUJeeTiMlDAwFH7Gu/7AvS4+ZEm3rmkWyoG/N4uZHCXpGUojh4/f/nBWsIWHxkJ
 CkvR1CFdtsjfWqUt77PCp4FzdSG6y04QmWg0v+VsBFGfDZ4x5leJW/AfULj7z4teN6f2YRiYkK5
 d5DQmbsAqwAAzoIjNA6w2r+wJtxAzaPIZDVvU87nXi+Y+OV3HIFx+WfcQNXoyC5ez1j5QFUA5Db
 kK7AMB+ubyIWPlD5g+lBvs30cRYtbs0qwQHknzzt/zxiE2TD2XKFoyjQysDiRclNz7twQ29Qsvn
 qls1R0xcASi7YrOVXIg==
X-Proofpoint-ORIG-GUID: rK6UFYW5HCW1SsFyoLozZibL5QCPrzrv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027

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

