Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F6E3793BA
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 21:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786310976; cv=none; b=Cyjdfsw1fGP8FD2oD/GZup+785u2fPtBN4H1hgVbW469KtQ9dL4VrAPrMoAWJMtJmm30n2g8fzJ/UR+rafoHwJEpp7iF1k4l3SJok0OvjDJW8XO9q4n+Y8ltIcmqwKqHjCx5FWfjtg1V8twfcwui1nWQtn33MIyaeXkQ3WHLGZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786310976; c=relaxed/simple;
	bh=jgf8SXZZdg8yn7G96UMAuhh5WZwvNapKXO0ftwAr1TU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GFrc1qsidu4d2hPjLCH0022ET+ycLVIncsnE8y4FEih71ehxp3d2oxFyp0jWkyrazpOFfv2X3AQfsDDZ5sZSk6p7g8sJEauYDc54FHKz+xXFgFb5fDyGjjMNcwlVttqeBcqjgHzDb0Qp5g+fS8lzwA0k55cThPiykQkkXTdV2gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SiNqxopQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A31EK4QZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SiNqxopQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A31EK4QZ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679L83bN3050084
	for <devicetree@vger.kernel.org>; Sun, 9 Aug 2026 21:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cd3jtyg6s34A2Rwus7U5Bm7U3Mlc5r7JJzTGY72wPKk=; b=SiNqxopQ//VndxA0
	HLiXXfiFyZxQWAqk2xZsFy3pnm8j8A7d0sswjVlPqmxqHxBM2LH2dFFHcjOEY1n/
	jH2wSEzjF9PILMPM2v6X7yEdmwMkJfQq57eCurswhofgAUHUJ1g7QSqeMwK7Wgw+
	X1FCo6R3mr/zclAwL2kcunbYSzOjsi+2VWP/Y1gx8Y5qdc/ucB+Aj9358y4ZsRGV
	nwDjkEwpXf84Mwcjc4vZR36JH3yq7PYT2xCwqseSxX3B9y/oXvUutwioYVyyV3bc
	sDXhI7PyQZ7vyYM3uGDjGpMcyr6EuOrSEE7iLb1ehlLtZRKw++n77NrWDKEfcbAu
	9g0Qwg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwwmgufv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 21:29:34 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81df8abfa7eso37346697b3.0
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 14:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786310973; x=1786915773; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cd3jtyg6s34A2Rwus7U5Bm7U3Mlc5r7JJzTGY72wPKk=;
        b=A31EK4QZUdoogW8njkbNB3H8uHyxqDEjzOHtfQsT6wAIAh5FRx8t02EKjl1U8JsBwL
         odfY4t4s9W5/U1bVkVBhsqaN3jmBbdOmkrXtJi09kWRG6wZSwleijUXxVxMHXuY7p0MC
         TYA3eiEcML/2u/F/W1bKVplJUeWQxm1bC/UK2ZRky4eLoY37J5q88XTqQiTH0LEiDUz2
         K5AUQV0fW4qLaB0fvlq4zXUPE9ytVetPkYNKKzQFsizt+74NbYMpPhMuHmINmFK0fdVo
         gECnLW66mHniCz+LIoRxRNVUoDLR8OTFE/9Z8FVUcC/mjyKtJQcsLMFXbAfTtIlu+yMT
         pEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786310973; x=1786915773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cd3jtyg6s34A2Rwus7U5Bm7U3Mlc5r7JJzTGY72wPKk=;
        b=FfxBXohJgrDgbc7WRe7C9mNDnmO7ej6zSRS5y7WztG7tIMJvOWzXO4qH7ys3zbAlOn
         07pIugTpKvuPvoHPD1F7X+KTGmpoWw+iT+qMK8AtNs+HZZMt7b2rXI/jGfXu8nqOsll1
         Ip9o1EvdAlYYxldYoE3NMlPoOBGVLqg5FQpz5zMK2db2wt8TSYT4fm4b6EiFqIpn6us1
         Atmzd82AG1szOtK4ROoFGrKgI9+eLG1Ns7IbxH3/VFkAUutcmmv1ZN9VhhWqJAySF3uu
         dyX3U8tT/S4risFsrl4HLWt5UVLxG6PnPFOHGfucwgDzKJivxcaA9NtO8qKbit1qC/5m
         gptg==
X-Forwarded-Encrypted: i=1; AHgh+Rp2b7PThtFAMUw1el1ST2jrSRY8R8bB7hyR5CAjvNCsb6Iy+D9Pzsm1oVLNzUt2YcfUnDARQ9Omdnos@vger.kernel.org
X-Gm-Message-State: AOJu0YxIR6PLcAs0OrDKiB2rN6rQ7tfIPNsL/kf+rg33bRQ5ZcmnM0s+
	GOO/6Qy7bDddxqE3IQGxJ0pVUtwAbLUx2KFznyPrdhtGMNBFafNrb5RGcg8B/jzGg+qHD7sYxyh
	fMAI7keHLLZzYxYeKOu8pa1u0xugB79RsmO8rByn784ob6Rj9saVMaxi0w8mfw5Xm
X-Gm-Gg: AR+sD13RMzqzo2DmOlLMjQSDNbRSn6z7W4uxFRoNw0EOya4334GSs3fHnBqH6aogvdW
	FkjQWYC4UMPPkIR5yqqlv14sshSrUKMPe9vSWbfuhsSf5XyVc/OMeU5pgq/6gCou2liIBccyObY
	Xh9sEMjJDphFRIVd8D3CBZqnNKC3IaIMMnqIomckWcr1KL1ukrZlRyU5yw8PvDmjxAuNVnhLlVP
	evG9rjhszUPzvA2Z+36mxDngt690NvpCr2XXX6KQcDOS588yn0s/7Wf7zzZRKDU1d+BMMzY/Wrs
	xNNddM2XZpIHSKx2Zd9/oCpVVGAi2b2GRzNFzI91Az4ovE2P0XfznV62BdDILkHSQ7WaGztYJCQ
	LwU2d/Jde/NjgNXwh7K1C9dWyDiH2Eg7RMuHQ3IZ6yd2c4JnUgrCDjsLdVbZ8t2tXmDg6eEqtZN
	+/5V2STfdXrpmq21rO52wO7c8Ggc7/+NFjKVFPpTyq4v2+
X-Received: by 2002:a05:690c:4882:b0:80d:c9d9:e1a9 with SMTP id 00721157ae682-820229a0978mr225020397b3.27.1786310973218;
        Sun, 09 Aug 2026 14:29:33 -0700 (PDT)
X-Received: by 2002:a05:690c:4882:b0:80d:c9d9:e1a9 with SMTP id 00721157ae682-820229a0978mr225020197b3.27.1786310972907;
        Sun, 09 Aug 2026 14:29:32 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:1700:b450:a0df:3150:772c:4c26:ea11])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-823f75c1c17sm45248167b3.47.2026.08.09.14.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 14:29:32 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 14:29:23 -0700
Subject: [PATCH v3 3/3] firmware: qcom: scm: Allow QSEECOM on HP EliteBook
 X G2q 14 AI
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-glymur-send-v3-3-2d1ed10e3a89@oss.qualcomm.com>
References: <20260809-glymur-send-v3-0-2d1ed10e3a89@oss.qualcomm.com>
In-Reply-To: <20260809-glymur-send-v3-0-2d1ed10e3a89@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE5NSBTYWx0ZWRfXyBFRU9ke2WIh
 602FKl8ca3kdWYd3H41RMw8dJLZ9yYG6bq+7E6CbJK+p5I4tym7ab2fkRbs2aDsJiOA6o3Bjcmp
 7jWlUzqFzwJuazDsUEYsGRSWKw5R4rY=
X-Authority-Analysis: v=2.4 cv=HodG3UTS c=1 sm=1 tr=0 ts=6a78f13e cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=UXNKUhSJZRFg4A5DIqMA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-ORIG-GUID: 9gz-Gsu31A5xj0ebPHMkke1G5zQ_yz6-
X-Proofpoint-GUID: 9gz-Gsu31A5xj0ebPHMkke1G5zQ_yz6-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE5NSBTYWx0ZWRfX3eIXvJv4Vuv3
 PeMqs0KbckroOhM5zluyJu7nvXP0glqkEs7YFFxe/koPq3mNW+r0DAjH7zANM0tLl5V1FdBUXXD
 Fx7qzRg4WE6eP0NM6mC+KsmjL5C1dUvIVS3Ajo9ly5PSdVPYxd9zC2WHcly723tcgONwB8FTY0V
 PBRgzizPr4+epTIQ20l7Y3RIQQ3MPGKr5rUxS2dIs/hPAv6KWLLwWPDdOy/5H0rs+UvWYKIL7KA
 DOGm0+oXMaK65diovf4GcA6yOrty5QQ68PlLp9Mh3Jm/LrTARp1Jy5TQvzEKVLZTHDB7EMyjd8W
 Iz7nYWPrA2eDkNzp3nWNsJ+VkD3WEjNu2aTFgl1gnE6/VvVWjVzZ8cLscAF+V66aOH5osYTy4xS
 MOKp6Xc7oiMlIxwfkd21MelIrazq4FOEhNSy8ZVeYtFVlToU43MnYrklBw0BOdjMhQrigHbXzLI
 TJhrrfqYIJdPrQCHRmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090195

The HP EliteBook X G2q 14" Next Gen AI PC is a Snapdragon X2 Elite
(Glymur) laptop whose firmware exposes EFI variables through QSEECOM.
Add its board compatible to the QSEECOM allowlist so that EFI variable
access (efivarfs) works on this machine.

Without it the kernel reports "qseecom: untested machine, skipping" and
efivarfs is empty.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 3eaa4c9ccf3c..c44c63e1c20d 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2311,6 +2311,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "ecs,liva-qc710" },
 	{ .compatible = "honor,magicbook-art-14-snapdragon" },
 	{ .compatible = "hp,elitebook-ultra-g1q" },
+	{ .compatible = "hp,elitebook-x-g2q" },
 	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "huawei,gaokun3" },
 	{ .compatible = "lenovo,flex-5g" },

-- 
2.50.1

