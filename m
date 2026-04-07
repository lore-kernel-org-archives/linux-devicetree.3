Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6ABC378828
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 05:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775539612; cv=none; b=aLhjow3sib+x6fLieZMZ4n9xX7LsnsmK0xW/SeKJ/8prrLfkWcEB/TNT80/U7lyL5bAB8c/4gOTTIWjxJbPTA4divBymtsJYDwt6ZYfwB2mGkTsna9mdLkvtPcBS0rB5HB8anxFsTaf8Yy3y8RgOM7Dhm7okUwnL7Xd3TGjMRjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775539612; c=relaxed/simple;
	bh=XepUZxNH6MlR7YZKqwI1oLm+PWLU0WlCfqE2MzQ3H9Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UB+nUNusxxgKPNYF/Ev/R2/xbtTtP6eBE5lwNPNhqmDNXZulbijKjSUaDU8lUQnf9fjaGBcfjdxm35piE6cMjYae1yAp9NV1bjoH3tlepECB6STgGiVyKzzchfVl8P9TzStmXsJZgleiyLlO1cUqakhO3juna05y7EsMJU2QhBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P+oWCMi/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a4ENXPRo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P+oWCMi/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a4ENXPRo"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQ0mV1403547
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 05:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7xE/DwUx8zoNoD4YdMr3h9T8/DSL7UDdeXKwIFE3LG0=; b=P+oWCMi/jcpIhvZn
	Ll1Msh5a0E/SXHocZTW72KYK2onXTsqpTi42OjgETvbKarbTOpGiVvk0MvX702N7
	dbCzTB4/xEuuXi41FEHBbqW8Sp6QYPUolvNznaAis6Swn4bMYH34XOzqNmGhQ1Nq
	wMFH5xwbpmZfQ6jHXC6sGDDc/0oClacwoO3oDOh2gzoA7xjWIZ9GkMF1wAei4lhR
	AH/IKkz6YF/VYE5i8MQ7qqrQXW8DetScO9Ly4CSqldu1fmfkZdgkiUYEE7maW91n
	NicqsOn11Qfhgqea8DxHmAgKvLwD0EemQvSFUCfAqLv8TjKLBBhcv/QFw0xO6/+u
	/HtA8Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr895fg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 05:26:48 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82c675116f1so6671296b3a.2
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 22:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775539608; x=1776144408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7xE/DwUx8zoNoD4YdMr3h9T8/DSL7UDdeXKwIFE3LG0=;
        b=a4ENXPRojwRFa8+wxzIFCgFi1WrbGNX2vKXWyQ4OzQRfNtq8aSKxMjdLboFUEcv1E0
         XIakA6StPvNP6hOg1Eylwa5+TN4Oa987SKUOqPaCwA4pGjmFlrzJ+0b0nPRh9crfptbu
         DWOw/hPHDQafYCG3KqSwlOq3FV/DBrAflUr1eirDERbx5+P8h5+jgnYDzE8e+YlA5p2f
         3nP4Kt7vs/sWaZC/JVQJaroI2/b/kRO1h63RGv9qlEubQ8FlhJXpgP9Po7fMI5E01k6P
         Mi+2fj500tzOqlK58cZJSCNIPygiOA5CIBVOU/VjUuipqyPoIY9ywaFQiz+aXQZjHzTM
         4qwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775539608; x=1776144408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7xE/DwUx8zoNoD4YdMr3h9T8/DSL7UDdeXKwIFE3LG0=;
        b=bWXgMfM6/p31pNN4ygifWpYZO23UDZoPhKBpSozIOCTi2as1r2tmr02aq3aBEPYDuM
         f3pmJWrFvvasU8pTbMdn9OZJ1uZ+mkMENVLXF5rpSUJq1nptdTioAZBXEAvkXaborHj9
         /G+oUVDQW6xHumVek20If0MmNLch+Re8Xxj66DVKL2NtNZ64r2itAt7uaGyAGJ4o/Uc6
         bf8Z4/NG6ZhDNnR0RebB7qpX9RWFs5xllhVrb1ZT0bUNs9lzOw4molevzJUhMjWDmK4n
         rPBqZeWkK0tUW5tENAkEkNn8mi54MWuraJBFiLrBcU8S4XjmCY7J1QOWOfPM+Gy4TdlS
         D9+g==
X-Forwarded-Encrypted: i=1; AJvYcCWjMdcUzQCNFuUvSazqawBYbcYxk7mJ8A3DbaGVZptnXOpwhf5VHgzhxwEFslf7S8IkG8D964JjyHSp@vger.kernel.org
X-Gm-Message-State: AOJu0YzgK2ILZ6n24Rxrj85VIpr9rAzhJ032RxztgZ+yPDN8VBYs4hUJ
	r+UDhs7AMJxMpQRKoNQBAofEt+M3j3f8OIdUWRmLhH28IxH3VGHJqVj/eNpHU4Fe6hAKl2AZyBJ
	MVnbaZtW1pW0IVVeja8qpIJg7z2fPN38oEw7ydy23Kp3wHc+EWsHIEgTEVhx2pDq8BjY5eHel
X-Gm-Gg: AeBDietWPEqeUlkzOkOzlmFkvRPhfdIGtLKYtvUbBPY8WqS8jUFbbjTRZxxP6b4mo1z
	5Um4ajghXzvc02EdgD4eb1o5Cy1xnInjJnBhlBQEcDHwdAsuEt2qC6GuErsiLtAdht7XSqeAi0d
	PA9BcY7lVQ64sGTMjzxYdlxcfoJDzendUySTEzMwzH6O1FDy2mvFD2kXvZf7iteR81pLAj6fzn6
	ESe7sRmdtWSnY4Q3DnSJ/BdCPYXx4x6Of+jdCsOZQIPitT5/asQD4LO1JvwRAvby14zfjLSZPS+
	pxII2my0GcenzeOpbw4l+22QZPGumsjUhBFtDai2EMk+JReyRwFUgfJzyp66erzMZH0CAO22tAR
	rW5zOG8sCAIvYP1E1NUxk7SYyRjrDlxsk3qbWUWmqhTrwHfsAOafqlc2KiGluIIpLye9rLuCNCs
	15GtvNOcBPyi3MD3GdHoSa9TmDZR+bfUtWh5OKjXk=
X-Received: by 2002:a05:6a00:451b:b0:82c:24a6:1de3 with SMTP id d2e1a72fcca58-82d0dbdf0e6mr15003644b3a.54.1775539607587;
        Mon, 06 Apr 2026 22:26:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:451b:b0:82c:24a6:1de3 with SMTP id d2e1a72fcca58-82d0dbdf0e6mr15003622b3a.54.1775539607118;
        Mon, 06 Apr 2026 22:26:47 -0700 (PDT)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c68273sm19897219b3a.41.2026.04.06.22.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 22:26:46 -0700 (PDT)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 10:56:30 +0530
Subject: [PATCH ath-next v5 3/6] wifi: ath12k: add ath12k_hw_version_map
 entry for IPQ5424
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-ath12k-ipq5424-v5-3-8e96aa660ec4@oss.qualcomm.com>
References: <20260407-ath12k-ipq5424-v5-0-8e96aa660ec4@oss.qualcomm.com>
In-Reply-To: <20260407-ath12k-ipq5424-v5-0-8e96aa660ec4@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: SLRYitUUkfHnbO_ggOJ02RricRheUOUn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA0OSBTYWx0ZWRfXyKDHqGzvdFaC
 mqQLLOMsmxX/RAZSGGXyMFT+oUlGWQFu00dnA/1Z93af+IYGWRGM8nJYFE9Dy+MNx3i88I3WWgV
 cJqNkBFg5gygS56Tkn92jxHyOAfG+sgplBiQcPDENiKUBZiwTSQgRRzG2zu2QKsHrQim3s2Nwx0
 bYmPS8fUKtK7Nd7dHhO77scjISevedBr2qsVUyavETi2WGdVvbnTpSuu+bI7CgCsC4g0S9noRwg
 xS+p+N0/lIZ777QBczMRLlVFU8QlxU+UY33/dalNFTJ9cSO/ldiKGlMyJlMjsql95/B+qfNEtog
 ThEVZXkYswil6LA/3vpCh3ZyWPLdwTv/60H2W38uQbMXNcLyiz4594dAx48WM7e6a5h2wiGDbWU
 qv8S+Gl+PbPSZbAyYEktFjhFZNBgMfcQwg6QIiA+OlUAAcdKLkLc9uDsNLp/pWbXH8J52QpwYyb
 /wsFa62EEhhdong5EXQ==
X-Proofpoint-GUID: SLRYitUUkfHnbO_ggOJ02RricRheUOUn
X-Authority-Analysis: v=2.4 cv=A/hc+aWG c=1 sm=1 tr=0 ts=69d49598 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=V2VgLR5doq-8DBhT5hEA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070049

Add a new ath12k_hw_version_map entry for the AHB based WiFi 7 device
IPQ5424.

Reuse most of the ath12k_hw_version_map fields such as hal_ops,
hal_desc_sz, tcl_to_wbm_rbm_map, and hal_params from IPQ5332. The
register addresses differ on IPQ5424, hence set hw_regs temporarily
to NULL and populated it in a subsequent patch.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5424 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/hal.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal.c b/drivers/net/wireless/ath/ath12k/wifi7/hal.c
index bd1753ca0db6..c2cc99a83f09 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal.c
@@ -50,6 +50,13 @@ static const struct ath12k_hw_version_map ath12k_wifi7_hw_ver_map[] = {
 		.hal_params = &ath12k_hw_hal_params_wcn7850,
 		.hw_regs = &qcc2072_regs,
 	},
+	[ATH12K_HW_IPQ5424_HW10] = {
+		.hal_ops = &hal_qcn9274_ops,
+		.hal_desc_sz = sizeof(struct hal_rx_desc_qcn9274_compact),
+		.tcl_to_wbm_rbm_map = ath12k_hal_tcl_to_wbm_rbm_map_qcn9274,
+		.hal_params = &ath12k_hw_hal_params_ipq5332,
+		.hw_regs = NULL,
+	},
 };
 
 int ath12k_wifi7_hal_init(struct ath12k_base *ab)

-- 
2.34.1

