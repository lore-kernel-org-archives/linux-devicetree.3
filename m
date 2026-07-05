Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E46A2D3733
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 19:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280443; cv=none; b=cmm8fz9G0icV4PB8fhzZVFsrdoG3F2wnonTP/4uEhKO3hx4wVkPUvTvu5EaptWW+N/XkYOrzUySEyzzzIWPlsXsgxD/r/jCFKkhoD3CmJjauVe1pZg0wxef7eMSMvIDIERMqPaX+pfiKra6gt/zP5ikopccRg/XZsuG6hyosfa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280443; c=relaxed/simple;
	bh=gFgKgEu5qajbHpLEFwwgM/A3QPsBxXRqQi+CF+ZFu9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ru7X8nwNVg7ATlJPMnY2RUXwyU8VaifJyGw/0VFxu9S3NufS5gKATz1D5UJ+lcPpKKZrCAOF0+ZNOEO2h1ZuNkMKzOkm7rB9sSdZr+UM8tSi+Q8RZnnfDNjxHpYsxQFHH6+uc+W4lJU1gliZmzR5KNCIqxTZlyK1esZT/xaltn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BbBSGLsA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NoxJN4Rt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BbBSGLsA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NoxJN4Rt"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HhZC02351641
	for <devicetree@vger.kernel.org>; Sun, 5 Jul 2026 19:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WZiFjnWLtnN
	smK5dA/42zGQp+sVNdR8iWt1Gg293cw0=; b=BbBSGLsAqnWOATGTpRNCO1gHtgn
	+/zw/8wXZTNlV0J3BkwSreM5wcmTjEIf/OTa3q53G3k+GmVKk2WvAcGb1Ew8Q+8E
	QrpYExNDDivaknI9UzYxo3JTDkbOWqzrVRq+0pWix+SzBwl+OC9alMamMCk86nPx
	bmTcN5MVq2c1dhjwDSCMvlPP+5gNlCOpgfXdThV6SMKQM+0ZTQPkQ4Udmvt+mimB
	/CiyDPPnOPppMy7keT4n98UkPZmn2g6GcpUmf3hrAlfVAqeyUVB9oeO42PhzzgZB
	p0LNoVgtCvusL9jOPJlKPYe4pVrl4XUBs3oqCO5q6awivbcuGKDA559+r1g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4sudu7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 19:40:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37fca5f21b1so3305756a91.0
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 12:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280440; x=1783885240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZiFjnWLtnNsmK5dA/42zGQp+sVNdR8iWt1Gg293cw0=;
        b=NoxJN4Rt0aOyL7o/soh8i2SoA/DEONsrberzO0bgtDpIxKm4z/lvYJyyuYPsU7nrvl
         UGaZT3gpclOlEnkSQlnF/Tql6RI/ZplF6ErLqAKiqecsb4EMqlEW9A8X6/iEj/4vT/Sf
         betVQCio6gqp1w6vEu0b4B2RH323fEtyy8FJwu7Kb2H3VXuCW5LETIGhbPMvxokfHt3Z
         kgM2yt/rM9NWPCeeomBV8VYyhChC4xr4DoXl250mpb45G9avOTKitS37y2jXnLJ70lFu
         cnsCHXPS5gMX0trVIV7fFaiyoTMJONNT25UUUY9+VsqI+G4vX+tuVUR+4nL0Kp2Mfp4M
         I2Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280440; x=1783885240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WZiFjnWLtnNsmK5dA/42zGQp+sVNdR8iWt1Gg293cw0=;
        b=KzEJIdnC/9dUs1ctam1cOnbD+rRg+F7QsGqYNBGLEAwS8hFK+1npWM/dikPnMwatI0
         IW9QFqbJvT6yqNXEUFVbyBNFUmf4o3Dv9RgO1wdM2XpqQouFPCRhsBSficD8SO/2IbVA
         LsoHXKDD2W2DnwUQ3dbmBNcYuicJ8bICvI+PPHAaGgvlaIsGZWbjQ5/hRHZx7J6XIa6A
         +yluZRHFTyoookiP3I4+BpBLu84+4bVr/7Uv2hpAq5KoRm56MqbtxR9k6N6ldFSO/SNL
         vgboEnkFTgSjRgtwG0kT9GLKPjut9dlfN2NbuLSk5U8zryZxl4dXFOfUBskE33/23kXW
         EMTA==
X-Gm-Message-State: AOJu0YzxdJPF4ZdA/47bR2uPkxN6G0+meKUnz5Q+yJ0lDckj2xQhlNcC
	1BAF/yZxzkZkZLGOlXtr60asc8LQ/IM0OpOnocX9qbXv0/DGBOWiHfh859NI5O3KizI4iD5Stg5
	JNqkStXwbToL4buihS55O9DRrmPg2+nXvw3c6yZzpyBNfSeHI5g9HXaBx5UvlVtPjYjXsQmk6
X-Gm-Gg: AfdE7cmUXTp4f9k54iBWKUCXx0nfaZDtK5QfgD+cGOUTtA8Giug75d4T6//bLWVSKOR
	K8C4R/tMAUH3IxdZBJgSHOA+G7QkH4s6Gkzx53YWgUshgrtyKYIpxETxYjUgAOx6P6NtMSF2KpK
	juLMGiAjhuU+fjtF2Q7ypsookc3YkLzLu7cUD8ATt9r1HyFE8o0zkoOIskudeHnHtlJAPurIpz6
	hJOjD9GEyNBfSGGuHwGKE2jfLgrLfwn4bx9Hgqjxl3+P2BM30X4gg+flHQUSdG57VpozoVV4mdl
	/ym2b3/mjZ3UzJlP2WqibTe+QpCwbMr7zVXrINhv7mrI6yZOH2OW9AkkkoK4xbJOtMgYIKm56RK
	98Flz7sie/QC6D4mK57I7QB/iLln637P0oEuqNA==
X-Received: by 2002:a17:902:d591:b0:2bd:5ae4:26d1 with SMTP id d9443c01a7336-2cacb06f287mr116872265ad.17.1783280439589;
        Sun, 05 Jul 2026 12:40:39 -0700 (PDT)
X-Received: by 2002:a17:902:d591:b0:2bd:5ae4:26d1 with SMTP id d9443c01a7336-2cacb06f287mr116871975ad.17.1783280439045;
        Sun, 05 Jul 2026 12:40:39 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:38 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 34/42] ASoC: mediatek: mt8173: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:10 +0530
Message-ID: <20260705194019.2565498-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX6gaopB4hzuoz
 vCuYZ2eTeKqYlPaxpdQQHbU1yOrSz/hU7BHD0Ee5fh1gclr72oOlBavINN4ODdywY7XwQLhEmJf
 gckHsmfeoRzlKrETuI/A/HQfYuyxAtE=
X-Proofpoint-ORIG-GUID: SFas7dG69Pg7Bmtg9GqjP8bj0-GKSgvf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX5IwFKtn7wE7C
 gv96usT9nNuD+rQ/Pd+OmrnTWQWabF8joaqXyfvJzSh+/U74hwg5Lt8lU+qsBq8XjR4DZEwX73S
 IsaKybrTLYDIHnmcSCMX9gpHtVlVStSLk2xCgh0ErJlnm+0SGthzt1T4cBPLbKPH/EvpGi3koff
 MC+fCRr6/uCidM2vnM4czQDNsyh0GevctS5/K0rWOQ+3yhSSnG9WKG2nkwngXjx1HPKWrsI0MrR
 Kyj1f+IlV3mATMn1ap/HU4y1AkOSWFvhyWeF4TuvCUQezuQGU44qqamm+RdxrYft1ijDaSzPk1P
 h8dykg1dEMO5uieK3evXkXeyxAUoToYmp0CkW4lAu39LJ1K91lW75Jh8vqIlPfdwEqa0cOud40a
 kOmkT3NePPuidiAIBQXPu/DaoWaXrqUlASTHuArnk8BlzR0KNb2p8ADL3WYAAnQjBRzG1LdReEX
 AnACfoLqxzc2buUMLDw==
X-Proofpoint-GUID: SFas7dG69Pg7Bmtg9GqjP8bj0-GKSgvf
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4ab338 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=2-kJ_DxirqQsj2pPc2sA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index 69cadc91c97f..0424d79bc9b0 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1072,7 +1072,7 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	afe->dev = dev;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
-- 
2.53.0

