Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738906;
	b=0vtGRm5EA3cwt/COomwyCDjgTTNBxwnnJ83U9BQIVev4+9uL/uG1+kE0Er6UspL7+uGX
	 Nfq1dhkH7Fx+nmSYp8oBFL9sKta4RO0Iyxs12p171QIGZspQ0H+lmwSp0p/2cF4nnGK+F
	 Da4nbSRdza5qOVjOs4tZFlboYCaQghRYnLRtnnyhgte/ZwabrJSHD1axH1ZcEKn9i31cv
	 SBAkfXukvPAaPclo8kdvZo5+RTvKjVHcgFA6+E6CvyPVQOrDBpF7fOBkLPkBVlpNCTeCp
	 0iuCxFpkc+2F9vlnei8wgPX4Pwtdp7mBa3Z0GvdQYIqbMVQsDWyahXJSoIYnYKExGww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738906;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JPK8TpslLB70Y0ZK7uSlOz+BfsMVxoZ5QXzjmcBIqTA=;
	b=Y2enxtMy/rg9X62pBeymvGuuGq/ySybcQQt6cLg9KhrRrLpCUlJ6snfpfxGfLUmAHulX
	 kmfm8ywAAM8Z4Hv6N37K9arOJvsBDcAgm760aN93RLIfBD2OtSoggu6xXhONm/5n4oM8I
	 iGM9W9XHlH2MXBGju9PThQpcCK2ESHU4FbiUPi2T0ChM5rzdye6B/DS03mCLYQoxiZlYk
	 wznEmyQg0dzhaO38yI+Dj6IQA1kRkmGq1y5kYDpSavHSDDjgQu1Uyhqc5VFWzklI+wzjv
	 4kHRw2GVnuWs15c0b7nzB+cBTUzpYXayE9OlQdO9T7h/eR2p1IN4WNbnIbhjdpIkKtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gIx07uIp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DlmfepYP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8E160A6F50
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:01:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE8E160A6F50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gIx07uIp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DlmfepYP
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1FZEB775990
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JPK8TpslLB70Y0ZK7uSlOz+BfsMVxoZ5QXzjmcBIqTA=; b=gIx07uIpAk0MAa3y
	XfM9O9xdl/hoqcBEf02hqOhSPN2l5cf0wK0tzBPEPz7dRf1Mpk51Nf1hzornWqf6
	cDubKLQnk6/lTEUdG0rISQYZwQSp++p47xTmMCTgdUFIUjkhW1SuD+Ur8EFMjPUU
	IX7zzrHmilfv4vAViXxwnrdXi2dD5wK6rdhtvZvPk926BpjDURWJMeGq82Vgfv7s
	Jp2z67p16pl59Wm1UNBhrSyuIxQDUR8W35OrNEOoeU8x4j9WDQ2jMfZR7aU13p7l
	U8o6BYT8DnwPErGf2cK7RueV8qzIOWfKuacki28+v2VgV7Bc+Qyhbms858KZiGNB
	0h3fpA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmttbnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:01:45 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd5fd34fee0so402929a12.3
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 00:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738904; x=1793343704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JPK8TpslLB70Y0ZK7uSlOz+BfsMVxoZ5QXzjmcBIqTA=;
        b=DlmfepYPMt+X5u4r7L9v8VH6shAWHvgK0MrVJFlfgpFiCq3F7l3GCtXI2CS8U6m/Gw
         cQZPoKrPzjtpOZXxD+hpns+tMLprA+zzX2nHDmixY3QSH15VBaaa0KlOv2VUJ+CvuDjI
         PILASu2xpgwtCyRRIsCyfEuewSSMZpcFoVXYduu0xqdiExb6UWOFaXhp/jZlXiGETmSU
         OTGyeFNErW3F8tvYcfTAgo78ZOxc4WJ9kbMM2uksz4zGku6e7J4M4GoKqyLzUVb+0mw0
         zN7nDLk+v8ubeQl5RLiiP6Suf5M7EE70FILkBs4BSD5dUq/v3a1dQOaXdcFvzgCrW2PX
         HKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738904; x=1793343704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JPK8TpslLB70Y0ZK7uSlOz+BfsMVxoZ5QXzjmcBIqTA=;
        b=HULmZu6L7nDdT9VuC1HAR/SYw/4om2kdLm02DS2W0ZaSt2IPvc4scJm3AsC0Or4HnT
         XthHGSU7lVE3h0IeCP5BmEpqZkoJOdan1BnH2eoPyZAZnUxTrBEOr+kB8q9p0CSFXXHM
         HJrRREjgcX4DBJIJ8YG/mLarJThiej9WM6VqoIzb7RLPvrAr/S0YdO4AlAL5RuijiCYV
         dymzuQ/vWdUJw2RO1spB2Te6Yt+/MbHrBWEe0YCJZrgs49+lzP2xwG3agNyS5jOcfqyv
         70sK6LruC/nwPKLqqf3qkT1Fh7iLtI+ozds7TpZzdSRCL7hb+/mwrzB0ulUunbDwfJtD
         vPww==
X-Forwarded-Encrypted: i=1; AKwUvBzNsIol7jb05lfbOobpLXsnXMTE4M1Vkcej4QNRkqTy+H7vlDlzpPQCRNdxeinZkCLA9PUbj13TJMXF@vger.kernel.org
X-Gm-Message-State: AFq9FYK0qtER+rIYdy/hBC6ogwvMfZH1mlHzTPLvU4q9Ng0JHNvJlC97
	x7s3mhZvkP7qyuPBESCzENI0WVhW1guc509t5ZIsWN6fjTbSfhHGEeD57FHqLAHmh4Van/t2F+k
	E4nzYX7fSV72hibpydiRJmzqrz5IDu0A7iIeaABbtiWXZ0NA3rZme7z7myHrtgCRh
X-Gm-Gg: AYBFou2YTa/2H6xYNZg35bTUwh0D5b70G3k/tNDbSJBokiGO7MZh5B7jI0m1HDCR8JH
	k/DvRLp2c0S1/ennkulM+Iko5R7vfyp8MfWxtt5+xdepFi9mLYMvMb+Nx41s+FIefZHH9ys/6rS
	77EaL0oTZyjWKmzNJE8nS8BB7UlGyEpiCGNmLsLLTN1usXXPZsvwBBZBMa0ibmDTQx/7IsmwFFr
	XFBcn0ZHqpBuWcLUQ1tf/uTaP7GWprEwck8A/qkZrgiUCBQ13MJzNiaP8Cac6XS77OuhsJRF9Fp
	q1W3VhT3ebV1D32fLGcfkE8pCv4gq8QhqDkaVUycNjji3GN4MIbcW90Xh/UjUAxFlofMJjPGW48
	XP5lfXrBePpOQ8IrTQV60SFHKtH6kurZUmtC5cbxQrBmCOAs+mAloUvriNQ3pd532eNcYAkBNdr
	c97yKo8XbOiN7mLET4rjVr9g==
X-Received: by 2002:a05:6a21:7704:b0:3e2:a935:8bc4 with SMTP id adf61e73a8af0-3e369227495mr1035874637.13.1792738904444;
        Fri, 23 Oct 2026 00:01:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:7704:b0:3e2:a935:8bc4 with SMTP id adf61e73a8af0-3e369227495mr1035854637.13.1792738903977;
        Fri, 23 Oct 2026 00:01:43 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:01:43 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:31:10 +0530
Subject: [PATCH ath-next v3 07/17] wifi: ath12k: Add hybrid_bus_type in
 ath12k_hw_params
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
Message-Id: <20261023-mpp-bringup-v3-7-19f3fcbf7b5f@oss.qualcomm.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb0659 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ZOe4Ua_9D0VdX46zIBUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: ns64RSALvlKwte5JwkAAKN6BPY9QUDNg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX8NzyzeC7S7Pe
 ha94hoF0GIC6VWv5affrUQFTL+3SiAz8ngqyeomUJ7hihfU8RwXw05ryser+qethHKOFlvCM2Kf
 bhOXG0mZ/OZ16lYI3mN256s+oMEVbLpUWmn8iO8gPaGhqusgWfxINkp5rjoTyp1pdt8OSWoORIa
 TqiceLBtmf1q/j79gbxRfZvmnxA84lUtKs2AliKTVSpgA/Qco1B3dMCqDQ4bzmiQpb2W3qzFPyn
 99AUFfMe5OlXizCXBgtvIGd7p6BpIJHL+z9UKnAF4l7RQphoNqD+Quoa3m/MXi59El9JbgXtalk
 76bLsdve1YX+8tFtCsfgPAdpUZLnHXGxLgtZSBmfcNGk06k1HKOhows3EDWvaIGqnfbyAFnL4TL
 7LztLJWsii2chj0YvYa20vXnj/xzIz3JS5XgCMXfvHj8woFfDME8HJgOYKlo8JY2myql0LSDjBE
 79ofuRq1br+83eZZZ0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX62P6mbXEAQjM
 ApLFeTqOkMwvydZ5WoPmfkJuMzBL5/Dz2UyCgHmVHWVVqXugIrwr7SwELPTU9WYXqjuWlDU6pPP
 rpAGJQzLB1DyedVJAqWYPWcbyzKiJ5c=
X-Proofpoint-ORIG-GUID: ns64RSALvlKwte5JwkAAKN6BPY9QUDNg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230027

QCN6432 is a PCIe-based device attached to the WCSS Q6 processor,
but it is registered as a platform (AHB) device. It uses AHB APIs
for probe and boot. Because of this hybrid nature, it is called as
a hybrid bus device.

Introduce a hybrid_bus_type field in ath12k_hw_params to indicate the
hybrid nature of the device.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hw.h       | 6 ++++++
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 833aa6d43ce4..fb807d5a6ae4 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -240,6 +240,12 @@ struct ath12k_hw_params {
 
 	bool host_alloc_ml_id;
 	bool advertise_iface_mac_pool;
+	/*
+	 * True for devices with PCIe hardware registered as AHB platform devices.
+	 * Such devices use AHB APIs for probe/boot but PCIe APIs for operation.
+	 * Example: QCN6432 (PCIe device attached to Q6, registered as AHB).
+	 */
+	bool hybrid_bus_type;
 };
 
 struct ath12k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index acc4eabcf2bc..f7992f8c917f 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -498,6 +498,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "wcn7850 hw2.0",
@@ -594,6 +595,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = false,
 		.advertise_iface_mac_pool = true,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "qcn9274 hw2.0",
@@ -686,6 +688,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "ipq5332 hw1.0",
@@ -772,6 +775,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "qcc2072 hw1.0",
@@ -869,6 +873,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = false,
 		.advertise_iface_mac_pool = true,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "ipq5424 hw1.0",
@@ -958,6 +963,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "qcn6432 hw1.0",
@@ -1044,6 +1050,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
+		.hybrid_bus_type = true,
 	},
 };
 

-- 
2.34.1

