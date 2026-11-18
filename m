Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989739;
	b=Zrydrxesr4nP4PPWO5ia1+PUkSInGavmV887MTfr6zrKZWyScocHpBlX9d5LHSltmF2J
	 Fii8I71ydNICNW6OO4oHcoLM29gwax9uNaKIc283JhCEC7p/iq6mHm4V9xGNoZRxHaFQX
	 36/VsYZHtHsX+MqXiVuOvyM7bojl84AuHBctL1mx5QJPx/HiZInxBW+XIh3dAub+9OZZP
	 VKtDj42skHur+UiZ4d+pWoKOXMh2CZJUFHU8RlQsO/ba42jDHJfvdOQzkNRtGdzSmGkZS
	 CVbz0q1X9gEDGTu5ZKX7LRqDgDVW6LPiglSZ0gPHU/XGFIVyeq5cvlnS+j09DSrTYnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989739;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=;
	b=yajeD6+OWtzRaZo5TiCPeOOtiU37ptXeT9R1htmNAr8g+z21MWMtTNfhLI8wG5MYDPBc
	 KvXSsB1vrkebeU5hWyfhuP/wVb/a60YoSIKJFS4ofNOGsu6xuta2PVh/ZtVTNYoPOsxPj
	 ht//d2PCPUpLJElZSe+zqV5HkPlzcYlv8Nc4pqEQ7jYYy2VjB8N6cTqD+5vA686EiRcNh
	 XI68iKZKH+6cKqFuVbO6BEH912gORsFBJhowG3I1dP0jdMuT+pCh2WIxEh802vhTzGVdf
	 9i7hldF04gBjFQd+Jn+0cMfPMFO/2GYTCcrzizjPRA7YV8VIFJdhk1DBtru4lvvHwxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hsav1JFm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mhtt8hqw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210E1606A333
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 210E1606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hsav1JFm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mhtt8hqw
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V3Qo2453769
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=; b=Hsav1JFm+eHuNh9f
	ltj6VIwk0l+z5kUBBl1BWoPUOHlFmLfmwQyiu+IjbCvP3mS8nLsSfApZOi96G2tz
	uXfGsZZxV3ZSS6R8/WRHgGZfRG7g7EodUaFkvRzfLnqY8XpuYgvCXZfUHjUIGuij
	eCCvsrmbjydv1hOStFf86yWFhIlVS3hPgYvoZVilK2Ushp5b0HJJdUPIN0TopjGN
	3a8dFQyS1LXWdSHe7nmEgW2dd9ofSMRVQjeqjRh2H1oz+u3LpMxsdxiBORvNXFyz
	KMaH76bOnpyvZQJxFJqUg78UOBUoOFBia8/CKzqnxohESC3krJAR5cyIecHsrhqH
	aE762w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv99y4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:15:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b167bc8e16so661757a91.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 00:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989737; x=1795594537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=;
        b=Mhtt8hqwmoKKIEt6PPzflC3Oqbme8g8TxxPOJkIZPobD9Em2cnfjjKOtkWHl55I1Ph
         gJdB3vQslQJrUPLoWaT9uOzwEdLgQjvK1B/L4weoLkl1PF12IyhaibytyJFLoKl5LADw
         hfRZ1vsbGdOWmisGvNWwwoupNcLx1teCiHtPW4xa/JJIxKCS3w7KBLs6FjE5ti6VzGC1
         NUiya1cS671Tbdb4iZPUFQdF/NOLy8j0CRZxkF7wQxTawcW2/g4umPJ2GcnHzlhlAkXu
         dYHjRx+ph9PIWJ/XXJKYbmNF7l4FOAXY/LJSXVXctPHi4JNDEqTN54Ove2mJqXc/tX9K
         xqyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989737; x=1795594537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=;
        b=wzk5O4WwXV3dQqqN6chamEHwBsJCQ37ZjdQilqHB6XKqPocGvFXGgiYC9owzijckcJ
         pA8XzF16t4eILgueo56lWPvbfQT1unePiAbhJgUwe3QY5Tn5nnE9+ci1ezm0yrKIWWXx
         xCJ8hFsk2L+N9DLuBICUW5kvAhTJFb9MBVjXiqFJ697u+o7s/tOrXcG6RQWSaiU8bEK3
         ClcH3w1aywANdynFoOlVvk/2k+jHrs/ZFHhijEDpJyr2FxzJ2w1OHzzFoQwfIqQG0Cs1
         N4HhLOE1ZMAVH0gQ6st4fRMQgPd2MfDer6Yvt57rhp2LhTKQ+1H/DRZOMac0MU7lsF/5
         5bBg==
X-Forwarded-Encrypted: i=1; AL+hErHB7UVl9mwjfLf1YPIGBYB8M2jiyEhZYN06jQJ4v1SBRhHk5UURkbIpPI2FAWWxyEqiCpylbc7iyuDO@vger.kernel.org
X-Gm-Message-State: APuU4Z+ynvg8NLDR1edp0TNnNEHwoaxCEnuoLhKeMEmmxuMLCRDBY63V
	RlqloaAOMo0YbiN5Wp0iKF8Zqfm7Lt57a/0uRPgWn4FeYRjRzRB7IebCdcJNGWT4VbuaUHAn6m1
	xKpSmMv/vl3Gue2UNMUwdhMiNsFE7MqrfUuxsGsXyOUtv3jK0Go3QOj7m1dEZElxC
X-Gm-Gg: AZFdTZeql3dvgpP8RCIX4OnT14CL9XLmjmEAR7lMuJQMUqm/JrbeQAOZrsCAdtRewR3
	IjdCrtaLi9xm7BPmGBie4A5U92LdFeoz3Sgf13a2H9kgv+75hJ0qH6hb/PKdrgjrd85XHpGhciI
	4K1v04P35YZPiCo6FFLppXl0dvq3D1TX8sNi2XSdTD0MDPKsEShZmlBp9u5Hne+mGiefqoYaskS
	Ioc728NtMUNO2/QzK3cmL8X5sexPAuv3Zy6c2oORa5fl35aCX5HP/hv10vvUZzyEQ8DjT+TaKlU
	ciTd1jGAt+BIQdJItwr/I7/hYfP8vBYisRiru8aSBm9cbrBqzbQRmHoIj/HQwDgYZQDRAYkv65I
	EHh6p7bRyCunrRbgpVZMO/NTI7irhOUgwlzosIjb++D5dyEZakrehmpSdB2Hjlq1/DpWhIMxXoo
	QheQlHfWjIfQ524Ih4q9XoTMO2SRAUKJNULJE2lMS4WRb+XPAMiGQrsMn4trFPAUO0tx8z/OkX+
	A==
X-Received: by 2002:a17:90b:1a8a:b0:3b0:a3eb:759d with SMTP id 98e67ed59e1d1-3b3d07a2098mr1995819a91.10.1794989736674;
        Wed, 18 Nov 2026 00:15:36 -0800 (PST)
X-Received: by 2002:a17:90b:1a8a:b0:3b0:a3eb:759d with SMTP id 98e67ed59e1d1-3b3d07a2098mr1995795a91.10.1794989736199;
        Wed, 18 Nov 2026 00:15:36 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:15:35 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:24 +0530
Subject: [PATCH ath-next v3 01/15] dt-bindings: net: wireless: add ath12k
 wifi device QCN9575
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-1-9875d2a3953f@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfXy2pxbrKuG20R
 ow9pMikR4tEXKAoh4GsJaQeotzjLyD1S/alsvhiLHDXSySqX2RV4MC3Eh5T5XAM7QH3KrCojQ7j
 xXk1DG0JXdJQKVT5wJ+fW/xpjPDdtvs=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd5ea9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=cIo56A7EWjM9ht75lhUA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfXy/tkdfYrcTwQ
 snofbNxDjEwFyTyH3FzsE08fImOvgy+vQM3p9GdYO9FHBd0lXPST/eWiGqwBPTZHVajp4rgcEBt
 tJ9zpqCTQ/oHKb+m3+U92ognsDuki7gTKYodK/fLuh16KT9npkCTI3y8oI5P9yrkAZlv4xKp2NV
 q1rhb1qnIf5isbGPqtu1JATcoZOCJtQCA8xkBlSKsOBCzKccqGaZXFz0MA+XGHoR3worcFOx84Y
 xmCItHwgA2Bzf0epa6lhYHvG73yUOQum7czAAeNQWKRhVfUMc7e22ZigEIJHb81odrhXaTJ6E6Q
 bspg4FemOKWx/J97RnFx4ENlVmUWOoEpMQfUST/uIvXPG36S0zk1xfBGTzbC2bMw5EEKW6wgtHu
 mHx6hGtbZ3FOj9QgWRP9HMtAtFN/uF870st80Sm/aAMS8CT+OYBAvbiaDMQ63VofbIqdd6SRJnT
 4VZIvPZCGNkHHH+TXUQ==
X-Proofpoint-ORIG-GUID: 5J3gg3kkqQXWHROGTlC0nfO-f6A7D-h0
X-Proofpoint-GUID: 5J3gg3kkqQXWHROGTlC0nfO-f6A7D-h0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180032

Add the device-tree bindings for the ATH12K IEEE 802.11bn wifi device
QCN9575.

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml        | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
index fa64c8aa56f5..dcb846258e47 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-# Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k-wsi.yaml#
@@ -11,10 +11,10 @@ maintainers:
   - Jeff Johnson <jjohnson@kernel.org>
 
 description: |
-  Qualcomm Technologies IEEE 802.11be PCIe devices with WSI interface.
+  Qualcomm Technologies IEEE 802.11 PCIe devices with WSI interface.
 
-  The ath12k devices (QCN9274) feature WSI support. WSI stands for
-  WLAN Serial Interface. It is used for the exchange of specific
+  Some ath12k devices (QCN9274 and QCN9575) feature WSI support. WSI stands
+  for WLAN Serial Interface. It is used for the exchange of specific
   control information across radios based on the doorbell mechanism.
   This WSI connection is essential to exchange control information
   among these devices.
@@ -48,6 +48,7 @@ properties:
   compatible:
     enum:
       - pci17cb,1109  # QCN9274
+      - pci17cb,1113  # QCN9575
 
   reg:
     maxItems: 1

-- 
2.34.1

