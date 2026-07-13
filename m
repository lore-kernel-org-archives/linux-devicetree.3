Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F303E9C0D
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938399; cv=none; b=cZk41av8sE4VR84hrnwwr35UmK7VBTnW6mW98PVusjRylBBRrU2Z1MDtKAMysjILeCUgkVoXs9jLgPzMGLVxMdpHGrg1m49jFjq38f/lXtJKGduIPiBLgoAlQi9S3/7GHyM0vuIOSy1eeeQ754Qc51m5u33JaePziG0tWXJ8V0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938399; c=relaxed/simple;
	bh=j7pyGAp0UgGpWoVO3bYW8vqYqwh9o5Oxzwd8e6+dfm4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KcS2H+zSYmphKIlG0hMF7CVpbJm4iNaEfDBbs4wgGikc2I2QjUkIPo60FfexkUtSYry1F0QPrqbzdr3tK8x8nNHwrZXGVKIi+1gH710fx199U2Rke0lGMwxGM6cY8pRjDVj2OMjsgkLwPiyTdCzD8cKTg+fyZqE9LMWuuh0SJ4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EOsGn+E9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J7BkMa1m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EOsGn+E9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J7BkMa1m"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NgKl731647
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nYDpM3yHEr7nEa6R+L2fdNUfr3gnkfkg7EwXfX9+5JA=; b=EOsGn+E9yMRqvHem
	SbCotkLv2xzmTfaMGgHG9xyJF2YqLIFdWLtat9mSyOrf+KLyvKm0JFRD9Jh79evk
	Tj/8/J/AREgYTyYfywLtt2M/IQOx5PLoOaiEycBpK33DqlPgB+cBjhT0fE6T9oRc
	kWs4VD99qeX5/nGMKu9jEQi1u4ihEvCPXpOqqYkU0et/5Ky6Ph4W9tK/bJDSBaNF
	eFDsCYepWEyQSRw0wIWST8vZlGMGHlQPyBBMRh4ctJl0CimWvpJOVEB6eC1DY/qr
	zvbSGSLiRwGBACuPVlnVC+9kXzP2Fvi0JWqVwnTuCr7kMwCPCJMVe+T4cRb8yRA3
	3RU2Mg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn3a28g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:26:31 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c890bac374eso7729117a12.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 03:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783938391; x=1784543191; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nYDpM3yHEr7nEa6R+L2fdNUfr3gnkfkg7EwXfX9+5JA=;
        b=J7BkMa1mA9kDMmjVOR6JLt9hE8GR1RfiZY0S9RcRMyzTY+cwyy/Qv/Y2vsiCANuL1K
         F6QDqmi/e8Xv93sOSg5S5KXF1kRtWcQwlwVZeCEZmzPKGL+MYwop/g/1fkZUuVM00f8o
         k/gqW9wJC1ApgJzRLwLvhgtVHGOpH212S1yJNA4WvLAjv42xhN0k5/FSxfo2UyObOQyg
         rK+/dBYh8DXgfdYgQqWzwb/wXOjLjqahU07yNFg29wV+BH1GLUleVmSXsWZzcAeextrP
         CsmfPT7+0u1nzZyro/Bu/bTietmweu+ivveOs6sndWdZt9qI7emoi0phPpFV5X1IIAJW
         YctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783938391; x=1784543191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nYDpM3yHEr7nEa6R+L2fdNUfr3gnkfkg7EwXfX9+5JA=;
        b=XbniwUd6Ba4wd/aNgIe2Nh0hwp8Tg/+Mp7/PSQkwhO+pqk962nfFKetZ+h576sT9bO
         kzmkrF7srcy46bL9y6bS8StoFjARSEWr5L4dos8ZdZaCo8LSodksEPpjIWHO1YRiao5k
         quya7hzOYB/HP4IHM4dJh3CI1IB54WR+DrE7xcQBqPN7azmPghRNCbltCk07SnfBjSjJ
         N96MR32Xi44jWXzdia4O08GOTnfJeWWHsj7rD5j4HA4IRfSOwTXmk09Jg/OG7iOFGvtO
         JwbMia6hCl+n4/+IUB1+GsWU0dk7AukNusmSj//VrKSHbthp2NByqeblKOX7tSQBbTR8
         09NQ==
X-Forwarded-Encrypted: i=1; AHgh+RrtZbTtXkkS12wpWJp0XJK5x95REWFNGvi0QK4j7nchSuyHbhur2hg89rNBw3w7j8wgovUrRwxPor8U@vger.kernel.org
X-Gm-Message-State: AOJu0YwBSqrBdoRTdFly8CQUYEpCUiYM0tJ705KRrLisBEKrKBAkvoNg
	etY3hRFS8BdZ3GImtUYHcwP5Ze57r7GRZl9ImVG+RfHEGIQN4+jTISDC7nTwnQ+ZCfbxOp+tW4H
	3GYLCkqpdkxL3US7vdg2LCZsxo4e3xUkfatC0jFz7QBaIfySsIRQW/IO5VjFnh6gs
X-Gm-Gg: AfdE7cn5FoOORjoGlYd5U8FBX+OwCRC0QRCc5pqSk45rsv1yzyZAT0xIdupd6Z7pUrQ
	vun4EG7E5Iy6BeVzj+c6IzQ4Da+b21yQs81FSnZ5SoGhXpY/FoIkwfweo9M6PzcLRvBwUf1ksRm
	z30XnWYzR58PwEXAr0npIMQBvWgQL90D8mWuHJQqoCUafPEIjz9fZyiFVUbYAxYJz7z8G5Oy9yc
	2K1dPRFEz4l27wVkf4WrNKR2zPhlPYs3VvcwaRESko6MA5DzWlQz2jb929F0CpVMquYOt/aV6F+
	PAHaaTQJwFpNxztKcXIgjA23khCTKafZBTDbikD9v4CVR8DbxHK6Z1DcsI2C2Wrvs//AE6D68rw
	p1OYCnUlfT26VHKBnZog3UdaIhXKhY1OmQxHlUw==
X-Received: by 2002:a05:6a21:730c:b0:3bf:98fc:3054 with SMTP id adf61e73a8af0-3c110a207e0mr9293568637.56.1783938390610;
        Mon, 13 Jul 2026 03:26:30 -0700 (PDT)
X-Received: by 2002:a05:6a21:730c:b0:3bf:98fc:3054 with SMTP id adf61e73a8af0-3c110a207e0mr9293543637.56.1783938390196;
        Mon, 13 Jul 2026 03:26:30 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311950eb930sm48465704eec.8.2026.07.13.03.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 03:26:29 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:56:09 +0530
Subject: [PATCH v3 4/4] arm64: defconfig: Enable ILI7807S DSI panel driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-shikra-dt-changes-v3-4-15102fca9570@oss.qualcomm.com>
References: <20260713-shikra-dt-changes-v3-0-15102fca9570@oss.qualcomm.com>
In-Reply-To: <20260713-shikra-dt-changes-v3-0-15102fca9570@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783938370; l=825;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=j7BjE0MMpSVBC7FmP3CEL416Fp1EqG4732WWyMo5vus=;
 b=JhajSjmbsaPUdDERWHOJB4J9crOTXwEFcg0Gohew0y/7MNaFBmwR0S4knEHCC3pJ/psAFdNYy
 TOZA8bjn4BDC78dartqEYeLsxeQbRti6xeSGchBs3EWf0ZKayd579W+
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfXydNQda9lAD3A
 oF2G0ZZ+OFjTdrZszuf3DXnZvBJ7FUhVKkh5DWONyHCMjX8hcZXgPUt9bvn5rOzcSQvH35tIe26
 khpMisRISuf9oJQV7cJ3DXn4GvKepef7DsvTmjwbBfzs5zPwa8vRuj3xYC4UC8m4mATAcAn8Ufs
 w+7T+h8gdQ39StG4itvNM97tY/qPlLjGD58hqfZOudp6ni8aOMEIN6iJpI/YS0W7LHssqs73Xgd
 D0r62ZrlTyPbbPCmQwanR8J5tKXvpdFUnqhCN6dwwSXwdC7pX/11/B0r0DGimzt6RhoL9zx5UsY
 Ry1YGi6L7zdoAE3rOqfhoHhVvnSbwLro0/9wN0QlofwYWLE7l2BHtTcvLW0gL3G/IHzhRboCnZU
 w2j+E7yl4/lcUoh7/NcQaNOEnvwj8dtBFNSmdcVErkci+OEu1WrxA7z5EAjWtBxnvFAEkxoVMJA
 hKq8GgCAk6rnHNd25Pw==
X-Proofpoint-ORIG-GUID: ebdLNm8n6_dvuKca00rrl67j5Irj9szM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX+yqhtnLQVcXG
 piKScOPMGJxY8KmXSMkuMJjIFokYugvtFYpmu76dsepnVeW68IeXvfFJS2QrttB9EhqpZi7J4SZ
 mA/hJS3/uX/E45qoe/1Ii0wFOTZ14oM=
X-Proofpoint-GUID: ebdLNm8n6_dvuKca00rrl67j5Irj9szM
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54bd57 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=aMhaXRkMA95IrCOZcTgA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130108

From: Arpit Saini <arpit.saini@oss.qualcomm.com>

Enable the ILI7807S 1080x1920 video-mode DSI panel driver as a module,
used on the Shikra CQM EVK board and CQS EVK board.

Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f2e6ae93e533..53f7b3d104ba 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1013,6 +1013,7 @@ CONFIG_DRM_PANEL_LVDS=m
 CONFIG_DRM_PANEL_HIMAX_HX8279=m
 CONFIG_DRM_PANEL_HIMAX_HX83112A=m
 CONFIG_DRM_PANEL_HIMAX_HX83112B=m
+CONFIG_DRM_PANEL_ILITEK_ILI7807S=m
 CONFIG_DRM_PANEL_ILITEK_ILI9882T=m
 CONFIG_DRM_PANEL_KHADAS_TS050=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m

-- 
2.34.1

