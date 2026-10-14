Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D23D51615B
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982994; cv=none; b=Y9X4oPd2VKBa97FnTkZs0T6WIHLLzaIVUIPpY3kqJDoHTLOZDcmOS3fBHHB64j4u7NUAMP+9PnDfSnNAggoocSl9mbyI9wk0rRy+z2RI5U+mZA+EYBjFOyK2Qp09OcKaoWXhdrUJE29uTpPV/+LjdIr3k+QqC5kY7abqi8rzYlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982994; c=relaxed/simple;
	bh=o3CLylce040Uzmfs746UWO9V4mjo6gjq7klcNZMuAik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KiUNVQ+jR/5WHg6VGudmz3NfftmG9POmQWYkyACdaHub8XMCqr1unlJ1EEPD0PxbfreXjzBJK/GjN8nzFe/0PpQSyzIg2TIhlttu8Hs7AVGKWFxNmkQr3MCyb7/jgvapLLSWVQU7bfNdvhTmJxlCErea+nEGM8tUL8AFDPY+loI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NqIEWlTp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GkPh8xla; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NqIEWlTp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GkPh8xla"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EC1XmC2087990
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f6GuRcuGOLcIK8U1i/42FXzU8VT6SBWZltoaozE4kyo=; b=NqIEWlTpj31oiWxd
	VyDcdIJj8hN4vD5SJQx92tB2Jj0meGvtc5ahP2salRE/mmW3MQAtDCcaFPJTdwJr
	vIvMOXNk3Kz742RCCT+YsYQlm/msQ4yqYu3RtVaa9oIOlEnzNzSZcuXAbIwkSGjm
	c/ZG06+0CuS5FFLcSn/Gl20RMvMhdtrZq0nNhM3fLab+kr7p1KTTcHssRanQ91Mb
	JdQFe1QiICXanOb2Gn4u0na/EKz7jMblM30ADgHkEYeiOy5i+GR+PUuCbCNvz4Ce
	arYcjFUwHepDgIcFfk5j/lG8ekSRfJtixneLEHFz/HzzoDsd1RgS4VO/Sm8bwPbs
	qIve4A==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9x49jxsn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:03:10 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5d777524de4so7466274e0c.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 06:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791982989; x=1792587789; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f6GuRcuGOLcIK8U1i/42FXzU8VT6SBWZltoaozE4kyo=;
        b=GkPh8xlaEYANPreK1pJP3uyeH00xjvFBwOuYLCord8gMXdGMW8saXa7sosguJUCRB3
         NQ8JyWpM8kcfHzJvfba8JqZ77NA9F7PBn6wctyFdjJzC7prt68CLAcJHCyiAw2I/bAei
         5cr7yxDJiuZbgYS17PHR5/DsGwvQW8iXXGlXtT+b8ruKwHi3AttWX9CvNEH+SNfIS2xi
         UV9LB39WnFJBiamiMBaNW4T04qaVxSO5Ve2+RK3yVkxu8hsC2Vl7zOdRq0YhbDZHPM8x
         SiK/7Du7Uv6PAbLS67j/pUtJ+Xd8CdelwtqfNoR19vPx8K2O+k9AwKoejZjiRfQOOs7u
         cqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982989; x=1792587789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f6GuRcuGOLcIK8U1i/42FXzU8VT6SBWZltoaozE4kyo=;
        b=AItnCOB63pnkRLYxQZOBiz6AvOtZthjr4ictmJTArHsb0+tSNHzGCvUCqRTGGD+e7F
         Z3j9LrLQ4Y6v6xbOQrm5YO3dG9WDIFwbmOO93JAp5lioGSSvpMu1yT0fySo5jW9WUFCg
         xji/sZy32UQcslYNVc62LwEDzu35tDcev9s+03dIGqUxBDl0KeLBSFMzjzccgsM5aO2T
         BESX1P2DDQNFRqYI75Bzao5kCGnVo3guZ8u0t0keHB68jT8Tlp9fOK4zxSBIsQqyhUT7
         3bDh/6JvudNp5bfxmF5bUbBxmBp89Tt4fnpr19mWPDtiRaoTrVyxGfgyg8EbhSIpKk9z
         k+kg==
X-Forwarded-Encrypted: i=1; AKwUvByyWRgseInaYcEp8mkAFYshtwTrY7GxA7xUdU4cx++EMPW4H33EyUSpFhbQ/W23zVKHURabJrG6QzhJ@vger.kernel.org
X-Gm-Message-State: AFq9FYLPHv64BWnyNcusVhj6daF3gVR1WjcXaUSg91JrHQsZMu9AG/5j
	6Si13ovPXY1P0s6pZYEI2HPTspWGrGt3cvfRfIuMhtToXncuJeqlpM1oJllwW6slYz8UzPUXZpL
	eRBEUZzxKekEzvBwv+mYam2TdDqBqdzuB40Aof0Pr8MPG7YTwqkx1fpHhxsMPuouT
X-Gm-Gg: AYBFou0Cc0nbRrBYjT54qzL1lA8E/GQ31Ycr3pq1q+OJuGNs5+qA7//9xuJ9SEQQJY0
	X6+BdS+tSQPHRUIvhQeAiRpRjl+94fVAnAYkh4gYdlmRKcKde4OSZF79bEa3U+AtgJbVIXVJFlz
	ik/HvGcAyUsKMRsgv8mxAh0n7CwLUxiBjKwXFq1DyaPoZIDUlRHweKlLfxsaaPz7e7V5tPiGxOS
	GxwWn8ant8ukRm33oZSL0dH10GrrQxAkNGcId1+U1iu5B+yRLZIPknTtNpQTkYsDGnFIh1SP+QP
	uMPYBvuTbaX3E+Ig0cVfdNLOGNBa9wEoC7kD65bv9fgPdfLc+O3oEltSC3xR5pjMvVGlHtxy3m6
	RLowvVp+uLg==
X-Received: by 2002:a05:6122:6004:b0:5cf:dd67:cb32 with SMTP id 71dfb90a1353d-5e91e5b32e8mr2980459e0c.6.1791982989272;
        Wed, 14 Oct 2026 06:03:09 -0700 (PDT)
X-Received: by 2002:a05:6122:6004:b0:5cf:dd67:cb32 with SMTP id 71dfb90a1353d-5e91e5b32e8mr2980426e0c.6.1791982988613;
        Wed, 14 Oct 2026 06:03:08 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcece106sm567795e9.9.2026.10.14.06.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:03:06 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:02:42 +0300
Subject: [PATCH RFC 4/5] wifi: ath12k: Support MAC address from the
 firmware node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-b4-nvmem-efivar-v1-4-187c85f65018@oss.qualcomm.com>
References: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
In-Reply-To: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2249;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=o3CLylce040Uzmfs746UWO9V4mjo6gjq7klcNZMuAik=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqz318DQUQZj2g3zPetmcXTmEY2JotdT6sE/6vQ
 tfCBrH1k8mJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCas99fAAKCRAbX0TJAJUV
 VqqnD/wP5JoMwF0ih0vuQgLKP4VIUS96MyhSknO+sjN/Q9Q0BrULeCLswkUyfHTEpsR2Ck1Uevx
 Da3W8gUrShICjvJ4HUdEgOa3vej4kDHzMvVWof6koUhvLnFoeTP6gmyuaNI0e46aFhaqsOroVgu
 yQUVpu5+grq0ES9g+Rdz0Xp8T5sF3iU9Pr9Rk9xcZhZc7hJFdjeriffHikx0qswUGhg3dOoKIHd
 dOIdJAQ9H222ZSuUCOSyTLItTNs6lOb7vDo8OnLIfcakNC8Aywh9AZZnjT8va7G2Rk2DAoDwVYa
 iTesV0M+K/CW5ek8DOSiCwfOFx5cU0EoQHRQOmphakzLzQsU3nMV/gKmgbUeLkfUum2jn8z+38+
 dvu+0FsKanxH/fzteGSNH0QUnTYIDO2vI78BqsqW/RwyNl9bSDSspaisBgbzLosu/Avsfg4abQ1
 M2oia5hnYq9HrYApIxBtivHJLVD7D7tPAu+TFTKW1EDLIEsClDug0TspuRAwpG7/Dw4ZmVX85ok
 4afY1xGZXXvSjUU7RWHD9j+OpsLgz/JK38pL/bB3wPI3zlAvmSI7WAu1JcHeluS8AQ8bjbZf+m+
 JTUb/Q4nAq8SfY/7o9IgJH+rdO1XZHPE0WaglSCFiF9X8S3YGz+t9R5y8HtRu7uuXBhaw/P4jo7
 vnrZnX8znYCQtRg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=YJcKWhGx c=1 sm=1 tr=0 ts=6acf7d8e cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=miyTlQIDcyHKYiHs0IUA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfX70Aoxbntl698
 LOWwXqjBVMlgKmjQvH7Nmo6aU9R/3ziDJUT9siuCt+RloxoNktmlpur5IijKkZfezJMBeMvVWse
 YbbLuRJ5NoVqqW9ghKN+hU3SnFzZ1KEqR+Go4JxH5u0+a49bZYrg463gq+vtoHg448djKz8lnUP
 PmOBj2UCPyBfNNi59TJ39Iu/jQK+0UPjCOx6/5Q5JRuDKes+DveVlvjnxtoMSB/QpwTdUZexyb0
 8uIImdqK8NWRZI7gDzdF1qZ4DuP5iHQgjy8hG5ffAhAOg6IeFpHxEmIfulh6ppzefsGq8cvBYjB
 iwiOadudrKSaYG+6DavLtlg3pjxxHuVjVJ9/az7fQj0XV1uMnexzptxKY/O0DiM9e5KGJ5MHUh7
 a5N/hOwXg+RgMsfEYjWfroLYUTQqaICAfYWE8NvbG3epLCaYYe3ccl38J/bJ7m5kW+7iNUnFIiP
 mYMDKsXyc8x4Qp9YtqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfX6hhVyZm06n41
 dWqgiCXcQUtilXdK9O7Kw1MmdhbUEN8Oq8PFOVeF5c/Uf+FgGfX6aBdMkzPl8JJ1J6X2kbxpX1O
 wewlOT2n2nA0WmZqFWpV1WLlHLP32Xw=
X-Proofpoint-GUID: VpW5-ftYk3C7Li2KVm4XnE2_EHaGuZBv
X-Proofpoint-ORIG-GUID: VpW5-ftYk3C7Li2KVm4XnE2_EHaGuZBv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140051

Read a MAC address from the device's firmware node (a DT "mac-address"/
"local-mac-address" property, or an nvmem cell named "mac-address" via
device_get_mac_address()), and use it in preference to the address from
the firmware board data. This mirrors what ath10k and ath11k already do
and lets the WLAN MAC be sourced from firmware-provisioned storage such
as a UEFI variable exposed through nvmem.

A device tree / nvmem address takes precedence over the board-data MAC,
so an explicitly provisioned address wins even when the firmware reports
a valid per-pdev address. An all-zero (absent) address is ignored.

Note: the provisioned address must be a valid unicast MAC; a multicast
address (odd first octet) is rejected by nvmem_get_mac_address().

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 01f8c6572f65..f4d2d0377c8e 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -14878,15 +14878,27 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	u32 ht_cap = U32_MAX, antennas_rx = 0, antennas_tx = 0;
 	bool is_6ghz = false, is_raw_mode = false, is_monitor_disable = false;
 	u8 *mac_addr = NULL;
+	u8 mac_from_dt[ETH_ALEN] = {};
 	u8 mbssid_max_interfaces = 0;
 
 	wiphy->max_ap_assoc_sta = 0;
 
+	/*
+	 * Allow a MAC address provided through the device tree (directly or
+	 * via an nvmem cell named "mac-address") to override the one from the
+	 * firmware board data.
+	 */
+	device_get_mac_address(ab->dev, mac_from_dt);
+
 	for_each_ar(ah, ar, i) {
 		u32 ht_cap_info = 0;
 
 		pdev = ar->pdev;
-		if (ar->ab->pdevs_macaddr_valid) {
+		if (!is_zero_ether_addr(mac_from_dt)) {
+			/* A device tree / nvmem address takes precedence. */
+			ether_addr_copy(ar->mac_addr, mac_from_dt);
+			ar->mac_addr[4] += ar->pdev_idx;
+		} else if (ar->ab->pdevs_macaddr_valid) {
 			ether_addr_copy(ar->mac_addr, pdev->mac_addr);
 		} else {
 			ether_addr_copy(ar->mac_addr, ar->ab->mac_addr);

-- 
2.54.0

