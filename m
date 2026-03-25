Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD173D523F
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 12:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441023; cv=none; b=HvWj67oNn0N67A3v0ckBjSn6y+UmvxPafQOl4Cs3/XlymJp6T5T74lxv6ZazFKZbSygc2e8U3F9mnFqYOoHwoTp8WHKsQ+jRz7hmKcj+Rmv8grhepw+MMFCD5CNvI5XIl+JEPY64u2bzqPMpIJc/PtdZYKkBTQ9vRkF94IjFaQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441023; c=relaxed/simple;
	bh=9HqjZjYEEXxWYNOsK1BlNwDe2qJ0g5GNTghb4mwsuPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YYUxreYBitKwAyaCeFX6Ua9IHVNNfyHmjzhXOimAQvLvYTa2dwPSy9c0/icjbZXxBWJZ0RZYRhR5fUIlwHkllgqE5GY5nAqIuDa/pWKPpY+DaIUv8harfXvx/BoXXjEifXPqeot+vJVz0nvJ+91xVFL+tNRV0oRew0QG1n72v5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mlhXMX+j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M1gZoYmz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mlhXMX+j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M1gZoYmz"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGaYt876452
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 12:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6bHulzvi8uj5fqRnkCJqOhZgc0tBVSXYzU1jRVkjfuc=; b=mlhXMX+j56Bj66vG
	60DTQy7zye4GPRMm3d1tO8P54tvXJYeih8E2BT659jKcSHx/qmnDAVIbUrGqf9kO
	nR18i5MHGxI1DOU9HVDSPZxSdDzVy+1EluW0txFqHDPcKJ6t58pBJRlWh1fgpBT2
	xhZyCdQ1AuomT1RM7CJzQVsaTLb4GYX7bE0nHKjBTRY+mEZfEOlTX5syrGgK/Q0S
	ZaTvm5n450J5JXFTjVZ8LB6lw19WXalC1VAEjOMAFws59cR99bIrSNHh4AtKo/iV
	xtMFXmO+H5huicvTZytoScez2mfUxcNrdTFuPYUH6rHr39xU1WlbVHh929EAnk81
	tbOVeQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d40f4k43e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 12:17:01 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ffa63f874aso9358852137.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 05:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774441021; x=1775045821; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6bHulzvi8uj5fqRnkCJqOhZgc0tBVSXYzU1jRVkjfuc=;
        b=M1gZoYmzlcHcMuGSXAfrF3++uOYgV1JBtBBKkrNYfOLGJxefW1HCc/6d/yqnDyRCXt
         1AZ27VUkSaQxiZCpwUmCxhcuHBKuZ4yH36Oy7o2xxoRKsycaqC+p4cLWPs2aCkSdS4tH
         VOv3l0FFUhRpRoWnt8ZP4w0bK7TVgdHpVQr+Ix9C3DE8Ubk0BsvXlYJFOI3F3whpcmWx
         Er530wQG/Z1slvyOqdodQSvtcYdPJU7YLQNpmwnrDncIGpwd5sPA9S7Wx/kz4I7pu8y/
         YiMMcBz1021+OE3bUr6QZx45S3ioRGaFv3ogjQ7zjN2467pMPzo+01/n+jbwBZUAzVoi
         BeOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441021; x=1775045821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6bHulzvi8uj5fqRnkCJqOhZgc0tBVSXYzU1jRVkjfuc=;
        b=Zl8u4LX3kSV0+edFIqd/JE23St0UcJ7uPa7yH61TK7DlrLOsXi6QJRqq/JNNtUVu0C
         6tUjZITAFen8O4VLmFJDbMTrOlCCRQOmGyVmVwtz+ImpTIfu6JumvUPe/0Ejo9SHEQMg
         FiCeC5Uy8TO12xE60xrH9Q9+IsSAKa+Dd0p5EU43/OfaH5UxFX8dwQTNvqr97UE7goGx
         sE8ftGPPjARAsGlQTImQRA0ipx7loM/3fGXcE2FXOZYn1XQ6h1P71bn8G7zOg98sOWEE
         G8ALmOQ+qONvpiWWD49uxiwdgSD9v1p+BFC0ioRPBewoLIG8KJh1YAumTMALhPA5pK1O
         9l8g==
X-Forwarded-Encrypted: i=1; AJvYcCVqHXC7Eon/PC9p4MMDQLOhLXzVJuWtr1/b4idmphEA1n+xkK47PasRKLwqYm42HJ4nHzj/Qx9zE3oY@vger.kernel.org
X-Gm-Message-State: AOJu0YyMxiPr973yh/tFvDVRy6CaZvS/bUe7++4XE/4yDzWKBj2B8Hmz
	Kn7UFmHlixwfJAnrSAe5+GIkT+cf2QtLjE/3yu4EyK98CIborCWfmdMeu5pCIDzEswHWzNvjQMc
	DIAeHdR9A1CHmCxZ3ra/aVWVSn7CsLGiGQM2MGeL8nXPSOJZUQxXFHABApt/kw66T
X-Gm-Gg: ATEYQzz6Cn4WzCyEHjl9sqTO7ltL8PFKn8LV5NyNnNchYNpawDjzkZ1FfziLUeUCYxF
	vnMVqBWByL9+zYFWuIMJIZt/w0hRfJ0Q6cMskT7EEnJ3MGLK/sMOtXF6/E1oHO6CvPmgXqqduWa
	wrb8oYxqbcyipUH4YHHJu66Y39FNiCHZ75jcSnUvbj+mPLQCMVOfnzT4AQS3wTtU7kRgm+rjSXV
	H+ZvZxz92Hz3go4rNXDjLZLRdIfkW720VNV5PhgS/zbHRg0H1HwrcZEE01PWMDv8YusXU8KZrOI
	/nDDptwRNejf3uhnq00quDUWqKH45NffcScwkv29Tbs0QA2XWtmDnLdB7iKZDMA1s5GGCOVt9m2
	kfiD/FDMagDCTW2Id1ceQaeNHNUfnSM6bNoIAKuBx/KoW
X-Received: by 2002:a05:6102:2c0b:b0:602:aac7:b8c3 with SMTP id ada2fe7eead31-6038790b9camr1337423137.31.1774441020487;
        Wed, 25 Mar 2026 05:17:00 -0700 (PDT)
X-Received: by 2002:a05:6102:2c0b:b0:602:aac7:b8c3 with SMTP id ada2fe7eead31-6038790b9camr1337403137.31.1774441020095;
        Wed, 25 Mar 2026 05:17:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b8a106339sm6480356f8f.36.2026.03.25.05.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:16:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 13:16:42 +0100
Subject: [PATCH v3 1/8] dt-bindings: display/msm: dp-controller: Add Eliza
 SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-drm-display-eliza-v3-1-dc2b2f0c74a2@oss.qualcomm.com>
References: <20260325-drm-display-eliza-v3-0-dc2b2f0c74a2@oss.qualcomm.com>
In-Reply-To: <20260325-drm-display-eliza-v3-0-dc2b2f0c74a2@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1106;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9HqjZjYEEXxWYNOsK1BlNwDe2qJ0g5GNTghb4mwsuPA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpw9Iw5L+afc/dju46TUr2s9Lq2I56+t6xkHzKm
 Q031EeScWaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacPSMAAKCRDBN2bmhouD
 10BnD/9HuRUfNWdBCJAgc4h4Lhj+HceKAcROYA4eYTZleik5zTcVA2+UoRkuWgVnayYohOp91tH
 +IDCPUYeYVeq/puwXOedqh5gC8e3WUj38YAePe2UWEu9mVsmWAbmkZoq2x13ccL/tPU3aj3RIPK
 kXouMO9KXy1YT6KGcWJjQa8ApumirU9xZ/fThPhLFskgVTShheq6wcEFoO6uEig7FZQzj7v9K/n
 JU1kvj9/hHgTFJnTAqOJ5QHy8c7ivSOhKDt36O5/eQSzBZIBxxnsBvYMRkX+StGC//ro8HPmH89
 M07tkyAjK7D/pgOVz5gKQ10vGjxGTANHzlYFX87padmWaMdIduaKeUhD2soDJSrzrpWDPPb6Ad5
 vq/D61tWXinvbV/7WFXPxeXNWKRz2joYrpaui5CZ3oYdnTkL/QXHebcFITHXFQ0NrupCjV72UdD
 kJ2AMspRNT3par6p/tfZtBlbSs8TOfIjLJEi1v1qoH2T/gfUVctgtcHh2xbLjvhweg614PqT1rU
 kspSJ5Nd5svksyMzI3zlUpFzTYypbob2pUADypVlxFLukEIC90nlslvzKS3/1Bp8YBwJzi30jod
 iHq4bM3+HNL7PH2y8/JudbkKjnUNUIVXoIHlHQk4caI3op96ee8HMA6DQP2PNl2ZfDjaFw5D1MK
 QstMS4EhmQw+K/g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4NyBTYWx0ZWRfX+PON9xIjA7PS
 6IjUg3dElgmHyHZGm3jZTyPCyY3DQ7s9uzmtgymUKRzsK09KsNamFlHgaVAh+myxP8vnBVotniF
 p8eGM4QW38tmSBxudmm7RNXSHW8Q003HO8xf/VHiZNyWscvNSATxdkow7K1c7+zfDrfkHVPist6
 bHfzKf/6pRfMOdjeTdwH09r9sItqE4BaZR2OioDBn+6QGXZdQ+kBQQN6Hwpd9XTqFB2w4k19ol2
 HCO53K6bb4MYaUPhT6evjoSUAFRExycyWv+iGYHOI36LAj1I3RmbJLNEAA6CHeXF+N60acRHNjB
 pY9Vh+Mrn9r24ra9zKSpCBpN/xCo9eQu2B+mQ/OywnPvyWcTSOofjwH51bHT7cY4Ix/JDFYVGO8
 Vlk3cYGx0za7pXbCCY1suTQQ+vKrffIpnk7UmVedz7lqF4dV3+Vl8qtEPAxmx0eWvExwDz4XYZH
 mzcKW6UiPIodDho7q+A==
X-Proofpoint-ORIG-GUID: p8k5s2Am-zbcJfyTGOF_8vWQVS4AD0qg
X-Authority-Analysis: v=2.4 cv=Cd8FJbrl c=1 sm=1 tr=0 ts=69c3d23d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HHm6X3FrcUt9TeXg1a0A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: p8k5s2Am-zbcJfyTGOF_8vWQVS4AD0qg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250087

Add DisplayPort controller for Qualcomm Eliza SoC fully compatible with
SM8650.  The device looks very similar to SM8750 (same DP TX block
v1.5.1) but with a differences in DP PHY: Eliza and SM8650 use DP PHY
4nm v7.0, SM8750 uses 3nm v8.0.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v2:
1. Commit msg
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 02ddfaab5f56..8239adb7f7d3 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -67,6 +67,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,eliza-dp
               - qcom,sm8750-dp
           - const: qcom,sm8650-dp
 

-- 
2.51.0

