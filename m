Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A673FD121
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 19:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778266878; cv=none; b=JILosSqNKvUOCFKMp+GG115lHUuhoXfhyRYLVwrNiSLgYipDXzEYfEjfCotb1fzW6xk6R3dQfDiJ7u6nu8yOAOgNXXpJXs0PUKD2ancXW6sSq0E9/JXXSwMqNencGX/pdZ0twxeOETSRJVdZP3sunTacxHIhLWSMNUEWLEbVH6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778266878; c=relaxed/simple;
	bh=+CwAWBT56Jm+jcj2Q4UQDmpUtoIH5fpiVgKBMPwi0cA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f0yI9Zngy6RkxIi4tw0bw2SVlYgwA7UGzu0z0gOChN2jMTp32+2HpjFErp0fqJwT7lIShl1d3zSEaDnOgTgF+Y4htcmRg7zetYflNCH9vJogzuplzgbWQbN0ZAStbEeTs4KbNHK5OaDaWToiCPIrlm4QXKkVhQ9pj08zr3i5ruw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AsQqT+jJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PjHj7C/r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AsQqT+jJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PjHj7C/r"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648G4F261093702
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 19:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p/AT+OqvsZEGAlm5HKdKcAksd7hTIew5HyAoZ5502Tc=; b=AsQqT+jJK7OarVWi
	ZhySwme7r59hDAWJcia8xqZu71PeYYkKLhiWLwB9iPEMnF/ZFHaRVI4twNgu4SyA
	amYtJjue/VI/DZ0JvSTX2WZqKrj/i/w3cRT7iO6umaUPa/e0Eg1YAO0d6lhvomlI
	I+KfGWGTqTSWQCoQuqiDKa47huf/lwtPSGmB8sj2pXb9u6fFjayKAnmj/s/Z9iyJ
	YNqXLMj0WQgloWGtFGOz/QYnbWhwx2yALtyrpzaDwwK8PyBzbZz24FZjE/6D1q8l
	UuknzV7/IRXcLNTdAMxtf8suuC1wqhwkiTPYLWP3mjZGTHqgw8eJJsWuGdOluEn/
	5YliUg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1k1d0mgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 19:01:17 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f6a5b4f88so2744398b3a.2
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 12:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778266876; x=1778871676; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p/AT+OqvsZEGAlm5HKdKcAksd7hTIew5HyAoZ5502Tc=;
        b=PjHj7C/r7j8uBfGdhvkR+ZcT7lNrQULOPcqZ1SMVGoBbH3xqnVpRv6m5VuQwzfYayb
         8NK5M5vsDAtSw9Y1ezxjjy9/YGR+zTlD6r1KJYUcll5TSKs9o/T9mnIX6ZGZBLJfm6O/
         +oxTZL0LcJozNgc6JPl27krVbJau18N1vauTRcb+tTLWnoRj3z1oFBn+c6Rsc5sZtagh
         s81lFSI+SXwa1NOrsffwPN5J+6UlNkYMTxza8e0Zdbue37oXIFd/rpK7QRtOOuUtM5LE
         gOSLfhxoE7HxOZepNPL2v9kwpxNxcmt7Hh5BOJavs8jYA6aoCcH8TNL4cZ44EeyQgKrV
         zFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778266876; x=1778871676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p/AT+OqvsZEGAlm5HKdKcAksd7hTIew5HyAoZ5502Tc=;
        b=i4vvQrQr+ZshOlxVeoAgUov1KlQZer+kinZcE8fCGz/v3jdJiRtg0B+GD2KiNNdkm0
         cWp+OWj+5n0rdbPidVi4FIrxhl2klkGmXUf90lQCQI9BiGHrIclURtp+fX5v91EyQ++2
         9oshP/W6trQX5QonYgdimRM55irwUDUZX93QceG8DvkTYzWohrbSXX4+juNCdYwUk7ro
         AgALgYRek7qDt+CPmRg7OTMg47kDk/CeydDh30KQiWwfre6P/LiAOrttM+6WpOKc6zmT
         jw16V25qdPNbCPf2cNtu15yRD+luoVtc+/5GigqxasW+lRtIhQBTkG8Xazkw3dmAr4Di
         sxJg==
X-Forwarded-Encrypted: i=1; AFNElJ8zyeN2u7dveOxgOaM/6oB6xIRD1Lgw27udkYQpETdI1bYm4YwuLFdrdb3bIRJiaUAb2yvUZZCqYdJn@vger.kernel.org
X-Gm-Message-State: AOJu0YwMDQZ/xjuLc9Y6GallkOBor22f7tuMEuX6J/YSV0HCVdXA6m/K
	QNymJYTAgBM/mSv7ESve6o8IK8ulIy7py2JqQnrkSVbqu+e5ZOat3jBCOI/1nFO8d6pnNIV2zBv
	dHv5nd8AGg6b2iG4Jw7u96ec9cqUEZYebliimQkRp888GpfhBi4L37mEDk38rF+KL
X-Gm-Gg: AeBDiesfWO9vrGtFiBuoF7Tx3JQQD2r1dg66JLyaGXonKiLbeqf2bQNbDxZcfRR1pgf
	dY35wt45tXoOeHS2/qECJjJTDacynzMxPexp7KKthnxGYLjHOtW+20nbfH2AeVBRh8lAv1DqNn/
	ReGDAyyso1err7FdoS7mfURHCte2Fel/TLGds6YZ1OZ/ijINvqYJJ348HJy2OSqdWOHoRpx5oii
	MNittuUEPBZk/qp3wYs8CN/IEwhkraxHR+34hCHrl5HB9wYp844dvwJlKbSYJvmrFKIOBMj1KRi
	MMIb9RYFxYwVUBIyuWeGnoEusk7jc8Bplsf7KWdWaCJ6m68iyFA7CvaXrhKhZ8Kfwn9nlKN0Qvi
	y7W0FnIoRjPxIkviCNHNMTyfxbbY9cIOEWNW4GuLRWnDccP6qXRo21j0=
X-Received: by 2002:a05:6a00:2411:b0:82c:e0d7:2682 with SMTP id d2e1a72fcca58-83a5df487e9mr13628367b3a.25.1778266876141;
        Fri, 08 May 2026 12:01:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:2411:b0:82c:e0d7:2682 with SMTP id d2e1a72fcca58-83a5df487e9mr13628308b3a.25.1778266875588;
        Fri, 08 May 2026 12:01:15 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965a3e3ecsm13395550b3a.19.2026.05.08.12.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:01:15 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 09 May 2026 00:29:52 +0530
Subject: [PATCH v5 03/14] media: iris: Fix VM count passed to firmware
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260509-glymur-v5-3-7fbb340c5dbd@oss.qualcomm.com>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
In-Reply-To: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778266845; l=1360;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=+CwAWBT56Jm+jcj2Q4UQDmpUtoIH5fpiVgKBMPwi0cA=;
 b=kW/HQT/jSDBpkCUfRBqp0A5Yj4nOp80+ZwEGYSAUFspkAjZt561MKLpQwFXZzmu/dKkzVWx+9
 B7Tjefd1OYNBH8QV/X9SfxHeKATLIdHunm8LdBeO6zpdPfvRF4/MdRn
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE5MCBTYWx0ZWRfXwoDtECkGjFH+
 BXrSi97FQ0eAoWZw9yeF7RrqARm1hoPvgh8/4UX28zeYx9L0R659ELocgQxiY5ycuEFmBm7qFA+
 T1qNVvQNmpkg1Hu0FRqkvCCV/BUp00nu6/7WgG7lWyRcRS+IyiqIODgZjbAl0WTONTtrzv7NsMh
 7u/arMpcRD62lJ3xtPKXUerTvz2kN/jSuO2W+cJxqY7ez1OBM11XUa7cPJe8TZ3tqfRZQ1cieri
 TgZ/qbfL3Ps480f4S/7kBum874+24CyIb0VLan77BCSG5pCu6g8CwgH1aPD0Skf817HobkgmERk
 sTmwerVcVtDq1uMY29y3jCjFP3hPuXYOMok1xN5GxVUUU+ZNF97tdj3yn0+VHiRbCw3uPA+SM9m
 GCfO/hhQPspecssEi/HLOS0f643/8bF5g9VGw01hhgTLiQ2cOUWMtoN9nsbsa1myoyX6hkJGOGV
 IBrwU+P/g3aXUXxxC5A==
X-Authority-Analysis: v=2.4 cv=GLU41ONK c=1 sm=1 tr=0 ts=69fe32fd cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nrYi3PkkErC94SPB-twA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 6PYYamMUYdWIOYl737DfQ8aLuOCH0SUp
X-Proofpoint-GUID: 6PYYamMUYdWIOYl737DfQ8aLuOCH0SUp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080190

On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
the number of virtual machines (VMs) and internally adds 1 to it. Writing
1 causes firmware to treat it as 2 VMs. Since only one VM is required,
remove this write to leave the register at its reset value of 0. This does
not affect other platforms as only Glymur firmware uses this register,
earlier platform firmwares ignore it.

Fixes: abf5bac63f68 ("media: iris: implement the boot sequence of the firmware")
Cc: stable@vger.kernel.org
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 69e6126dc4d9..f1f9e04b7c31 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -78,7 +78,6 @@ int iris_vpu_boot_firmware(struct iris_core *core)
 	iris_vpu_setup_ucregion_memory_map(core);
 
 	writel(ctrl_init, core->reg_base + CTRL_INIT);
-	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
 
 	while (!ctrl_status && count < max_tries) {
 		ctrl_status = readl(core->reg_base + CTRL_STATUS);

-- 
2.34.1

