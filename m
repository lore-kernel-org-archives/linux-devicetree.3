Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E4F4A3F2F
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 09:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549928; cv=none; b=G7G3ieL+ficWfBgTFB2vDD9otOBlppC/rsbzH1YQT/XnErCeoHjH7VG/7sArNklEJ/g/JJ44l3SbdHb3mV157+xL+acWWJ1DAfDRF3tf735g7o45jZ60ZFBg+SjCg4OJcuAr1uo/QxwQPC3tmq33XrlwdS+RTRL5jtrEyLGDk5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549928; c=relaxed/simple;
	bh=TF77Q79zFWQi+Fntx7XSol08DnELnNGQgAP7mdKGCQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gwN08eikeQjMWj7moQpTG/wmRNH1RYjJqVe28uWbw/DXZ/pv8lvPr3PcmVnQkz/sZx/Cw9QDwgNmha0tHb2zu2DRfjFQzgbiHo7JkDoA0BRXiZ3ts7/Q8POm93CHoKEMQQTUq4fTSjrETSSJTGmpp3Eawg4c+diVjVccHIESQN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Td4JnIKZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kH2a2hze; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Td4JnIKZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kH2a2hze"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92sCX1552921
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 09:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xY2nZ+rb+2TgLQPRkuxCOGDJub+v+1UgrrA3cohnLn0=; b=Td4JnIKZXafV5ybZ
	KfpGn4rirwTJyjJUs8kG52ifICMmBSLbBZlZUaciAAy3C06OPdWl42k8ke1fTsyq
	OqoGu6ID0CIYODqUWshYvMgtDFv26fkhv+R/92RnumoIAzjZe0BfoYglUv5j0luW
	kdJGDysy7mKc8EKDxh0xagsiQbN3iO83YzQlHBe78bJHLwaGNMa1vjC6Zy744EjS
	jnt4Uy92737aLfQsvgpQpzsQN3OgQL8HMpzIYnrBVi87h2L7XfnODhRMUSwidCP5
	E50ttn0gULD4oidaL8BxuJ66QSI5SMNqriZ8EyUp4I9OjaqL5gKeY0aldxak3Gbx
	sQyVEw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq9n63ta7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 09:11:44 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6c1a8f2c565so6942581eaf.2
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 02:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789549903; x=1790154703; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xY2nZ+rb+2TgLQPRkuxCOGDJub+v+1UgrrA3cohnLn0=;
        b=kH2a2hzeb++VGDRzmlzzA/94fYR9fNgf7tID/1E37nO1StqWOB+Ye8VPT507QCSpRn
         GRormGYSHpFE1ZBU/DJmaAEywe1xhqZcWXcaoI7QO1TiVixb4rB+KX10h5wyra+lQuHu
         uhx8xd5Zvzit0llFN1x65KE/nAAjmdyqWUEpAHg1yCGX3khhdgeErZMnolSOsYg4NJZc
         PnveVi1vaqCQVEyVygvB5jG3v1KdaPN9ValIvuShsqTO2UFgTj91xoBtm6Y2sncAJLbE
         hVqQgjCpbqBiYRIdVW5dpfv2TvZiAnhS/JSUjgnGrtjNzIF0CJKkY8EQ+Tz5IYR3Q26o
         DIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549903; x=1790154703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xY2nZ+rb+2TgLQPRkuxCOGDJub+v+1UgrrA3cohnLn0=;
        b=UnxkmWCJ784YhNTAXi84IxCyDibPPzOtVOqukPKAvyHo7iAr/7/SfQYKXQGeXLYeEh
         ydUGKFMd/NJ/D6WXoAXozwSZLfGtbnwdGg8L3rsXRGnB6+aB4tq7PXaYjeTY9mYkrpjM
         SqEZHVqReQDuARjGA41r/Z1EgJewCB0VZu8KhwQZGFNGeDAA5jSpyTMuvz15AUvwYAEi
         +EFYp6l6o5rNSVqEXKHDPdoWutOR6plmFBYE3ApUp6DQMMRZm9SzbAo70xRA2Kel55aG
         oHPptHKwqUO2dfEBZ/3BR/PTVhQLnIyPSirTHZdia76T0UtWLWMuzug6r6+7xOX+jRle
         6PYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmATSYPcyqD2MnsTiJbWLInVhwEOaQNI/Z8W/+kBSSiLldx+lMaeYrUW15426KROfW6FnCjv4EYXU/@vger.kernel.org
X-Gm-Message-State: AFuF++mR3U1JPzAnm2MqmvhMZIHTnIdNgiNsxIzkwXQ6v/iZSF5hcVrO
	NJkBKZsAMNjYb6FHEtyuNf1CpuvgiU5ileeNFyRL+N1cAbxp3tafE24xVz23hb4n9/axad3qUWF
	BZEy8SpTuHS+Xx0eGmU0t+yDU9nSqn2LolbMLY6FFt1FJQkKwM74sJzh+xdiiDUGU
X-Gm-Gg: AYBFou2Qy0+1N/PAK+6HSOCU7bh+GmVMsNQUyLC8LJ4p1V/R0/cwKDkrSlV7nKw8vRg
	nY3s6SRXcZeDGeoatL+oe+3W8j3zrd2+/WYN4UyQkqTVxWQ9W1I2bfdgIUe3xkTkwtBsMMNzJrc
	S+YP/KrW11QrXiQkt1xGuG5abPOiNAVBZOLpdLtozTg5XxKq1RudbbBgcmJJfTtEn27yo7AY/DZ
	a7pfjXLhjytbP4pjyJGf6MpGBbOLAWELop2RNmMRwX9VODSF7DnNARQLb53W8SJ5tkRGvRosbdU
	DrbNd5dNwpWcq44aJEfni8pSEETQNiY4166tOS8nbxTisygqWAOITc/w9EYIO5x2Tz9tazMOBIb
	8Hnq48ZV6uAk/oF9yZbMd0fkIzEQ=
X-Received: by 2002:a05:6820:208d:b0:6b7:83c5:fdf0 with SMTP id 006d021491bc7-6c7d44e81e0mr1694075eaf.49.1789549903359;
        Wed, 16 Sep 2026 02:11:43 -0700 (PDT)
X-Received: by 2002:a05:6820:208d:b0:6b7:83c5:fdf0 with SMTP id 006d021491bc7-6c7d44e81e0mr1694056eaf.49.1789549902883;
        Wed, 16 Sep 2026 02:11:42 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d3a31asm4779492c88.9.2026.09.16.02.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:11:42 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:41:21 +0530
Subject: [PATCH v4 4/4] arm64: defconfig: Enable ILI7807S DSI panel driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-shikra-dt-changes-v4-4-d5d5c3ffe070@oss.qualcomm.com>
References: <20260916-shikra-dt-changes-v4-0-d5d5c3ffe070@oss.qualcomm.com>
In-Reply-To: <20260916-shikra-dt-changes-v4-0-d5d5c3ffe070@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789549881; l=826;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=pjvXxkjE7K36h37LhIJX2wTGw0m6XqoLcx3Ny/40vyM=;
 b=gGpOF7+ZisxNgVau0+tPAwSQIR8kNqmBt9jSDw6ymVQjFu0J1RiPTwCcN1lA/f4Io7gLpxX1p
 9TtGoYpOglTBu2SOf5LAq4LanNW0dRbOsVY8ECMIYfeJKwMiWdN/zGx
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=BdVNQbt2 c=1 sm=1 tr=0 ts=6aaa5d50 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=aMhaXRkMA95IrCOZcTgA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExOCBTYWx0ZWRfX6wPMeAtK3tox
 Yqw0VzJt/7mSZz7Knlax0L/OJTfoUDQOE04IJ6HiVXbqlDhSoeu6t/j1/CRzuFwQCZQDeQXQI8a
 azbIiV2SNt57qHUJuUw3SsEmYiZvA1i8xGw1ObBfEMCbBLp7Z4Gfre1izR9KGAtE81Ug/NrqyTC
 hR6mapsIyle4wn0aZOozoV3EBz45Cd2UzkkszzILiVByfN81nYSNxH0t9e90JTG0FSxf9hzoFp4
 whSVjcUtQs/uYtABBIiD3UJ0ndPbNhjGrmNF6/OX+T7r39pNMACLc9unIJBSBxTCCgGF2vetN58
 JK5DYXow/6uma725W3NZDXma8UEwToFH+wX1wKkybbBXcObrIpvwkvGrZuUBviuoK67rRi47HZW
 7zzpDPX/orIqeDgbHVAvdG60ao5MNinFJcLkdc3vYW23fmos4MVTl3e/nmTWTOODWvVmbyZEspy
 V351tKt4c8taYO5rhsg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExOCBTYWx0ZWRfX/bc5HvEB3VrK
 hzq+ueftEPcBsvYpkaXtaiUtlDfe+ZddhCOK95cYLjglRvVUKGRysFtNqshy+sJaH4dOKVypeP9
 2uuJGPtz2YvODECL5hxmaEYQoRAO1yg=
X-Proofpoint-GUID: aariINcSCUXFfiCfORXjRZ4PPS12rDj9
X-Proofpoint-ORIG-GUID: aariINcSCUXFfiCfORXjRZ4PPS12rDj9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160118

From: Arpit Saini <arpit.saini@oss.qualcomm.com>

Enable the ILI7807S 1080x1920 video-mode DSI panel driver as a module,
used on the Shikra CQM EVK board and CQS EVK board.

Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5217de386edc..00dc52c8d87d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1021,6 +1021,7 @@ CONFIG_DRM_PANEL_LVDS=m
 CONFIG_DRM_PANEL_HIMAX_HX8279=m
 CONFIG_DRM_PANEL_HIMAX_HX83112A=m
 CONFIG_DRM_PANEL_HIMAX_HX83112B=m
+CONFIG_DRM_PANEL_ILITEK_ILI7807S=m
 CONFIG_DRM_PANEL_ILITEK_ILI9806E_SPI=m
 CONFIG_DRM_PANEL_ILITEK_ILI9882T=m
 CONFIG_DRM_PANEL_KHADAS_TS050=m

-- 
2.34.1

