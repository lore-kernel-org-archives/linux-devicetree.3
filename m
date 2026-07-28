Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E91D433BD9
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785240049; cv=none; b=iaxMgLEvrIRd/vEE71b4JWk1T+L595IruNATj+Cpzi/ekygbBcr/KPGghyxnnr+PYE1NtP1VY7fs6qBfuuXVOgFLZhEHZ6PTae9hX+ui5B86xA0rhaI24CRDxaRp+fefr0TMNAzdTjdX0qpXCqzVgKnyKVEtyofZhTLUHLwytQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785240049; c=relaxed/simple;
	bh=sW9mBhhxr+1qQDybpadrsCgU0ygnINjIH8i1kMNl+hk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ysfg13s00j2lNfitl5TSKV7lcuJTDfPy/BUwBh+7G8KSmLPiYI3GrMPrtUcIfOHuZKk8lOZpqY7mML235A2k8P8iSIN8P+cQ2us9H0NzQ2gfCMC7/ytYL/MYJUf8xSqK6jalUPpkrlbWNG/l5dyIz2L6u9A2XWxROoHx7PWNtLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OUCFAX+X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HbxOo3KJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OUCFAX+X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HbxOo3KJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBHLar2367372
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4op/fzpu59fln/5Cb5FkpKBJCsrVF9h8vTAyVAnO6E8=; b=OUCFAX+X+q+kDvBb
	i9XJi1osWm9evY6yI+BlY0SQkQAO73nJNp9Qk5Sd5YUdIvT8p9zXk89elByGr9Iq
	XR/vlm/u+cMbd0nASWUfACog9CZ9rwUMZXqeq9ebT7cncUyjv9zo9vnSYXDoaVV7
	y3fG7icmvgRut5COf+I2kgLdDLg3XL1myXJYPjhZ6cUonXEMDLyD4PKl1jva7+oT
	Ljh45MZU2kuP0SSBSgiB3GCCOLMX6a9YGQofJAWzXPm+s02KPaWkiobUwAxT71tB
	W6flrlOV0TZ8vYg7ZZyzvp8wZS81zY+Excc72LwYhc1KHdonXk3tqpol2f7hsij5
	tjXrIg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbp8c66j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:00:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfe48ca1efso39355235ad.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 05:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785240047; x=1785844847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4op/fzpu59fln/5Cb5FkpKBJCsrVF9h8vTAyVAnO6E8=;
        b=HbxOo3KJ7UhKWAzdBGAWDwQ/if89ZP+H9fFISOXRcyUyEraqiq48lyYMawiP4uJT7z
         Zjlb+qVIAPbz6XOz6mbjpKHVOYfQce5Ma11iYIWpFGBRgmKrFbP+whB9m/ZXdqQMY/YP
         GwK5+kVCjCtpng2dHcmEeeYoAxvOScE0u4UkoGF/r4KuTfeCeq0h1NfAOEm1Sx1e7vIj
         ANx1F8PHeEuLa+QEu31BujSdGNpR5nT/+CVKgJWfCPork+3H6j5hP3B/cwdG51E4JcMo
         JOi9rJ1Y4Zi26n2Es6A1xvUIBYeI/U3al+6MMldm6N2eXYYfDv1qqOsDhkt63u3r7u2r
         7CRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785240047; x=1785844847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4op/fzpu59fln/5Cb5FkpKBJCsrVF9h8vTAyVAnO6E8=;
        b=tQPc3toFaicT9qsZIZYPpcHmSwpF2D9uVjXJloiIxz2eJ3I0dZ6tuzpravnzLXWFLt
         6rz7rBqTlV7sfKo3sPpV2XceRXFJmsicdDdlTpbfl5rUxQ4vpPEe3L6PSZyCuPohVVvD
         1Kloo6G8KRBAUO6bbZgFNbXOUtE7e+2VyZ+83+aYvNN4Q6iSJ6F2xU2ggwVQ22vuqvib
         pExu8DhCy+Gi6k2dLvPfxus+vD12Y8h3notQDki1mX/l4BMHzfn2Ft6Q9FXTYAw2CIR/
         VXgkmJznvP6VeRobejbH/0ZZf/jdLhUqFhaaNxqfT0Bm0LAeGgel6ttIc/LeYsuvrzSt
         xH+w==
X-Forwarded-Encrypted: i=1; AHgh+Rp0IdROfsZinUcGI88FWZE75MbWh8tEaHZht66+BB2Ris0vXib7icVsHNng6cw3Oq3UGMGVtKTvUPSV@vger.kernel.org
X-Gm-Message-State: AOJu0YwLyBaSF18b21tDJ3jvUvXAIhuuzWtEFYrjnJqic+BdPNeML6su
	TihxjNehwq/AQPm45m4hUHIHu/Xl3Irn8wGnOb4RDuvLj24tofoW7jfV/dv8NWvH8w1+ZhKf2WP
	sltXvThHFfd+7Tx2gGK1qaM+zaLwKThWcJCMFVY2JU64ThBYouqnl/HY13wuOt05O
X-Gm-Gg: AR+sD11w1cBcSzjSxrvSucaDz3jBc+RZXTA3oEHbFOdFZ6Zfo91yP21d+QIgiRvyaWz
	IqLM5PqnswElV6vv4p27p5LV8yH2x92f/J/uUOLJ8OM2dC2Ogvo4+zKVNj+Dc1UFqaoFwrLYqZc
	euRAn7pkqxnEJh5XEzm2qsoFccSQHKN8REB9T7Iy3doKyYr+XnODm0+nEC+S3JbkK04pEVhIve0
	JJphCMmLgY4FydjZQIHiVWl7vEbJ8T8XLwdAZSIU3L8eB9kgHnmA6XrhWhqi77oiIKdtvECmqkk
	ozXECr1oAT6c8LqsOcLCz8E2bYZUIa27n2kG2IAhNEqnD/09l11vY570YOOA7lFRDGSgAfp02ID
	cY+vZ8zjX2pjyiiXkSND29yO1lg==
X-Received: by 2002:a17:902:f785:b0:2cf:a2d2:84c0 with SMTP id d9443c01a7336-2d015a09143mr23177585ad.0.1785240047196;
        Tue, 28 Jul 2026 05:00:47 -0700 (PDT)
X-Received: by 2002:a17:902:f785:b0:2cf:a2d2:84c0 with SMTP id d9443c01a7336-2d015a09143mr23174395ad.0.1785240043559;
        Tue, 28 Jul 2026 05:00:43 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bbe01sm51764895ad.48.2026.07.28.05.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 05:00:43 -0700 (PDT)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 17:30:17 +0530
Subject: [PATCH v3 2/2] arm64: defconfig: Enable LT9611C bridge driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-shikra-work-v3-2-e08c322596ac@oss.qualcomm.com>
References: <20260728-shikra-work-v3-0-e08c322596ac@oss.qualcomm.com>
In-Reply-To: <20260728-shikra-work-v3-0-e08c322596ac@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEwNSBTYWx0ZWRfX0Mwpu7PbHNCx
 HBcM5mL/oECJz10/hlqFSYMRn8Qmq37107nDYiAHkR/6cBZFK6nUorMSRHvetnt9tLy6mHOUNkE
 OTFw+cV7WCs7qGbKumzpvz4i4ZoaxG0=
X-Proofpoint-GUID: dbJwL3v3Dxzm-R3S6o_cvP6TnnrqpEDo
X-Proofpoint-ORIG-GUID: dbJwL3v3Dxzm-R3S6o_cvP6TnnrqpEDo
X-Authority-Analysis: v=2.4 cv=KLJqylFo c=1 sm=1 tr=0 ts=6a6899ef cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=JLjO1t5ekhtB3RsVtqAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEwNSBTYWx0ZWRfX+nDX9ce9qpW6
 DmuYXMVbw/tJcI+IcXlXmY4+Jno2C/qCccwCKnypqg4PNATinRWFFAnGIV1qe6OYyb+ICwjzFyJ
 dDERhnMCwsOm6jtoaGXyMurxUJVe2pQtkixKWBAghfoN+R2T73u+x4Dt3fcCs1IaO5BlOl2eKSR
 04TNd6t8Cqt/m2U8nvTgMlQgQ68ZfTIwyWiwEmC9jpLsBC7l/PW1l8n43TE/vPDF31j2IgI8h22
 B1+pTywNvqcrJhgMM5UpRAulEJ8L317+u1ptxd/uTicXHI6oVg97dMKhLe29h2VJ+ajW95PYNqf
 O56GWqvVtnzj72vIzxDsVu+JlDboZ62KM92kzrJcGEOQBpvjDFIYc6WXy0STuykHicdAD4YoBbm
 D3GNKWwVNcqsb0R+O7+nWr9f8PEMmjENx5KuzTZMWD0HAZhW8F2kyttDcgMMGX1M18/4i8gpVx8
 RIA39Ofy0X1Gk1GhIeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280105

Enable the Lontium LT9611C DSI-to-HDMI bridge driver as a module.
This driver supports the LT9611UXD chip used on the Shikra IQS EVK
board to provide HDMI output via the MDSS DSI interface.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e1d8e65782d0..8a6922199545 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -965,6 +965,7 @@ CONFIG_DRM_I2C_NXP_TDA998X=m
 CONFIG_DRM_ITE_IT6263=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
+CONFIG_DRM_LONTIUM_LT9611C=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m
 CONFIG_DRM_LONTIUM_LT8713SX=m
 CONFIG_DRM_ITE_IT66121=m

-- 
2.34.1

