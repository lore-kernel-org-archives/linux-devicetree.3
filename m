Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E3A3D812A
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 19:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788462187; cv=none; b=jOsaz3C+jVDJiEPxT1e48p4dUQ868YCwSXBIOv8EVDBuOi6021jeR3rHMMEfN8QcvSLGXj2DS+eQD2gnSZBZVjakzgtHpYuxJ9rhRM0ixcKwhPK+is/03Uffv517A8qsmhhg1VJ5moDpR3pSp5p0BmGfVFb2JxW8OXxlofk1wLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788462187; c=relaxed/simple;
	bh=Av+Ccu+qywSP4Z4y6HFs4D81a3D7FkQfr9mBxELay8Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sl/sMJrJGJH8/1/3mDG3+pjL5VcKjhwsrPmbzrCpzRtYO1UlF/HsZX0t2hfLhwm05yl5xYmXtfb7aEdCTHesJOi+t9n0eU8aTqBPxk8W5cQ+RtHCdvJ/t6P1SlO+MFzB6umZstUGuSIY7YrHbzc+4QQ8XSWADYpw6NcDy4VWdQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IZo/CuYr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AppJtzah; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IZo/CuYr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AppJtzah"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G347s3958092
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 19:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4xGweBqCCA5QiHSvA0qStGRFMzMmgoroskX+XtaYuco=; b=IZo/CuYrTpW5faji
	hWievtY3uFaYyripF76Bn2w8Y5mLeCN/vgWaf/YxXSWVIuENrDCJsqGeXlctTkAN
	JeQnaoQ/nrqogbgoUZ+IyZnAy3opIXHotBY02+BmX6Qn0m9jZt5+IfBIjPNm5Mlh
	82OMr7v+NLN8mBZoNI2frUBmaH5YBtom/1acLgXH20ajZCFAih7IYtUtfe4iTRCr
	BdVR5hay93DxsM8Gf35jxUTNcPSsMsh9UrzXHH+zgrWZ8K01iRnCk51uDuo5G8Dy
	wJK91kKxwS4P4RY9rCAjt/2WwhSfHcm7QxpuhOXFMKmwEGhvizTkn7KWD1IWWZBy
	7PYd5A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5d12s8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 19:02:53 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc132709c76so331087a12.3
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 12:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788462173; x=1789066973; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4xGweBqCCA5QiHSvA0qStGRFMzMmgoroskX+XtaYuco=;
        b=AppJtzah7KFX7J5VqUr9tkmWh+FahdHLf4PUz4I6od9nYE0TNEQa4W0tl8qsFIBnZP
         ed+UCrrHgvP/xiziTtD97KgMP9mqozA4ALNiwrIfQ9s3EKpHKbZVkNHOp+qTvXu3c0ZU
         ABOeaOHHupz3nT1xaQwv2QHn50bTICW/KxIx3TUTq6c8nJMlnjWRoH9CEhZVH4Cxz/tw
         MHfBvFnh0644mv/XLM4BF1xELCTIIgxvdKtH9CQiXBa5+noyACkW4u+kErmlZri41sxy
         7y8mi9ITECzITixVnmDbPU2dwW+TDVOr05Nx8vWUYtNKioBdx6f1F5lVH9sgXk5voSSB
         SL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788462173; x=1789066973;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4xGweBqCCA5QiHSvA0qStGRFMzMmgoroskX+XtaYuco=;
        b=D1bzbghFl8vbFojqnYBgIhCJDG/AvzxoDseg4SLh7y63/mkbhX7ckFo9Ri2/lDeZXa
         a9DCuTVfT11p5oxFgnvhU+r2U89IWVHtGCixPrqB1U7GJY7hgzrhhKqITLiXNBRZJOh5
         Bzf+gnFl4oxAcij3GJPcduEhGoYUrZhq81NvHPISm8H0Ludhh3xlgwUxdRjIHJdSyFM1
         BbEUnp0thnYwm+WoEeevw6I2FP6IDPoxcHtmyeUQzm4izk/r8C7YijLYjrovxNk77juQ
         JU/S3NPKTxYBm28k8WpPEl97vLZhJx6gQHHmggkkdjydV1yvE6zpnvWuAze7sREcn9+C
         EURQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkLYVBcCDKLQxGB8Cu2hoS+UbYa0pxoYco56tHtkNItAoQ/zZ/ElucNxlJCdzJ/H/GC7NI9qOvzTFK@vger.kernel.org
X-Gm-Message-State: AFuF++nO4H1nWRAb2YLXH8R7v1hnWQ/8+3Lb4KYVieYnBF1AIiuEaIyP
	9l9B4tVfQGwfwo5oUNDhf6n83wk4q6wNRTHZY3Pq5JPXCECRUBsqub6zstYVXjW+Bo/RxdA7guo
	3Vg7blIYynlvAe8u8+9IxToJAqEhGgmzySpNSKgZ5U/9DiQnwQSAuRq8I880ejkD2
X-Gm-Gg: AYBFou3A57sWz8+/py3aojJRM0WHgQSHfqkYePCOrZnqGN61s/WyQaMsQl5iPrsR1eF
	sVLFTgbr3XyiQL2wnYz48oV4uvXazDaSkyIXnFb6KEv0wTCKqSIc25LPYckTkaqKjIJLlpCBLE7
	HpukshDJLFkk8t8t2T+JOEOTgYUG89TwcGthaJZPgNTsBtA230/gUBubbVlpNMzLBir2eh438B2
	wA8B/7h27h0O6uwLXZ3Zt95Wgh9+PODEx1iy8Cl+jER5igAZ1YfDqzuQZJDKd6btVMQu9vjYny6
	0npv+OX0jepC5tjqMV1eWMz96PCBCCzjy63CJwpw2Lnepk4eSm8RdrLiZFF1QC78Pw+/wu7HvAe
	dYcrO8C76/6AqQpeKb9p8xNPvuYMzGasBvjqx6926Y9poZJbas5l1lRM=
X-Received: by 2002:a17:90b:4ad1:b0:396:635a:9b10 with SMTP id 98e67ed59e1d1-39b2616ef8amr794428a91.11.1788462173214;
        Thu, 03 Sep 2026 12:02:53 -0700 (PDT)
X-Received: by 2002:a17:90b:4ad1:b0:396:635a:9b10 with SMTP id 98e67ed59e1d1-39b2616ef8amr794309a91.11.1788462172645;
        Thu, 03 Sep 2026 12:02:52 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm1230164c88.11.2026.09.03.12.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 12:02:51 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew LaMarche <andrewjlamarche@gmail.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ernest Van Hoecke <ernestvanhoecke@gmail.com>
In-Reply-To: <20260630133001.1426824-1-andrewjlamarche@gmail.com>
References: <20260630133001.1426824-1-andrewjlamarche@gmail.com>
Subject: Re: [PATCH v2 1/2] wifi: ath12k: support calibration-variant from
 device tree
Message-Id: <178846217113.824911.11446976488422487073.b4-ty@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 12:02:51 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfX1VsvcVP92Xiv
 1FFF7mzj9T7fMKAFtKMykF+71MyXIQ3R4Zwgv0vdS3DDbVTLduUUylAMD96u9bqj7HSO4Tgt38m
 KekuexueS4nvY7R7ZeYn/YcZNJWZmYA+xjy7fe7SrBNNoqK3JSMzRPDGfGGQBxKrc6LRPmMBd8e
 PDW5bayF4CEsXJbcsv/JnhKQYN7NVo/+U1f/avqRNxvLmtz17Z81hZ1bjunLlGNrUMKt7m8PA/h
 B4w5InWJdGUkcmYsBGJt6Fy/AkTz/oejWtLjDsEMCGlUbbe5Fa2GIoHxkMd8exGQreFxqsMebbH
 l68odIWNJBx3UrwblSe1hfsegZ7r4AB+0gPb/tBZ55ITBs0E/JiXfhKqyibViIyz3dRUvcn5juf
 1L8G9VZBcICABs60oi8ICnwkQHo1hKyIP67KGk1DoElQmORFfJRDChy5dm6G/GQZMPMLIuCCa+l
 FDVrCVijpkglmXketyg==
X-Proofpoint-ORIG-GUID: YxojTSlmA3bYdfUnWJPFkqzP2XdOXSrS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfX802RnuaKlAce
 /FwRuMTNJ4NiNVgtUnmup4q5HWZPJyKmMWXcr2GJIj/NRTujOAEWo0kKREwAp1Qz4Ysc4/M7myl
 8WYEWaz76gZHxzYKH6yFeAJcVaYDjXM=
X-Proofpoint-GUID: YxojTSlmA3bYdfUnWJPFkqzP2XdOXSrS
X-Authority-Analysis: v=2.4 cv=J4GaKgnS c=1 sm=1 tr=0 ts=6a99c45e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=erCTOyO-HGHO-QmL5V4A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030166


On Tue, 30 Jun 2026 13:30:00 +0000, Andrew LaMarche wrote:
> ath10k and ath11k support reading calibration variants from the device
> tree to locate the correct Board Description File (BDF). The ath12k-wsi
> binding already describes using qcom,calibration-variant but it is not
> implemented in the driver.
> 
> Many ath12k designs expose all the radios under a single phy, each of
> which typically require a separate BDF. Without this, the radios may not
> come up or will not be calibrated correctly.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: support calibration-variant from device tree
      commit: 06cca100ad083609ca9cc2d1f692546369144189
[2/2] dt-bindings: wireless: ath12k: drop qcom,ath12k-calibration-variant
      commit: e6c2d73f27b3948cabec1017c9443fba24f1dcc1

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

