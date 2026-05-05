Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902CA3CF67F
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 07:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777964442; cv=none; b=a1u1wM11zEx14TD7Snjr1QhYAJdrYjSMB7GEuVISmBkkYzdikgejrHu8Y2zuCBDhhYtQjS+LNOyRlNnLP2aT9jvvUk69jVpf+/0fUBoQM8LjBvk85fcFhJHVFeQRW4dY3WHhacitI2fL8ly38yN/iz8joVQaDi/FUG9dZAUbJBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777964442; c=relaxed/simple;
	bh=XCLAciwoGLa2sJvy/DDGRqny4ifzNwzjaeJeVzt0PYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ku1UeCztJpnlPywHLAC6RSAY8ulyl9ctAqLOE29QPJkeU4E+/aoiICaNwltJExhMSY3K97RrLDFqfSgI5K4C1CC7bO9Sjy/kI4hd1cD1sEakSK/hRQm3jL30L9Gfxv1qHcII68wHIkxT43gbf/KlM37pZSNBSVBzK+nHOr29osU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XIYAc0wF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FzB5dxSr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XIYAc0wF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FzB5dxSr"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6454GVs61152055
	for <devicetree@vger.kernel.org>; Tue, 5 May 2026 07:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mCM0+/uGCzj/hM4vy1/xEsxuxsqzm+PtmpUe54/lVkk=; b=XIYAc0wFJxzEGvc/
	aUOolG4rOkBmutVXUNU8SM1/TVb6OL9iXDBL+kom2dgZnmX9RYWvTs4JOoOd2wvC
	D34o3YbCKlu+k/Oxen181/BNCJSusv0IsA/XC05XKLQb+6CBJQjARnClpb+GLt3Y
	im6Q8ddCxXFEF1vA3rO8rNa55ygB8vNsYQt34QxjrwVxjvAKSh9YNOvRAwc5vjk4
	B7wuy8MOacnb9VRXE1vIyXYDDQomFu8BmtVjoMcLoXnFrSpsqCHFf95bSFgEY73A
	8hfeTRsHWcGWCij8E2bBZc0+KKcHV4aVy3hA9aiWoSdUkO1bdACZK9YNPzeKiBj0
	/XrNyQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxscybujc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 05 May 2026 07:00:40 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354bc535546so5309947a91.3
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 00:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777964440; x=1778569240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mCM0+/uGCzj/hM4vy1/xEsxuxsqzm+PtmpUe54/lVkk=;
        b=FzB5dxSrjnUru1qrgWGOAuHMuLY06ElEVEiI9g4M52svqHIOLtMdCrLZE21XLdzcKU
         1GwLRKIw7k9tYks2+p8NJV8IjNBblqUhgPHUKouSeMaOu72EP6oe675F2EJgIwyfpF0j
         TgyexYcxjt9EOH+84lWza9/VuoBOzpCFSA6zAmCVWiYpD68ZFpD0TV4dkNUCz9HP+heb
         2Xw/8gXr1HEYDdmFZCURW3j7ayaj71S0Q6nLQ6e4X/9lK0LmIswHtYxW2vMbxjyi4xVe
         9+RqVu1B8LBAnRq+OeqUWmU0e5uFOwHNZ83fqeNqCc5A2HiEQd8hdrFFmJFW7+7AKPh3
         CGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777964440; x=1778569240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mCM0+/uGCzj/hM4vy1/xEsxuxsqzm+PtmpUe54/lVkk=;
        b=jWj+cpSy/LqtaQ+H9gDubdZ1Q3Xwt7g/RNL3nQUsyjjtqqXPWIBxAhChVJkemq22F1
         cVMdOTb0DAfMEoXOq8969uRsvA+2hqmzvzs8aIhkKO8dPNIWok19gVFq+ttVPXudKQDV
         e+KnXHtfw+4FkJx6mAe8/W2FDG5MpvQFVJUkz3LtRs2gCO2Pu+o9BskMAUOzRQS85f4T
         W+9NYLX6DFSj9bLH5RJ6qybEduY6xM+etS1TkF4M/yiC3XG+DfCzVv1w1gwiliT8Wt40
         fyAyvXuTozJ7Xgn6VTIdD/uVnYGp1ocHHmgL3o4wtQUq5/daVkzpYOuYh/hs8hIQ9tRK
         l0sg==
X-Forwarded-Encrypted: i=1; AFNElJ/Czaou8JOUM0svgDWOVFN5t8sOeZ24+zQKLdxU3dcqlWcih7Je+k+t1pljF0UwMIOY0CVOXW0xHNBh@vger.kernel.org
X-Gm-Message-State: AOJu0YyVAqLLLDTk6AWlQisIv6HOHYxxaTdiBf7YN0DWOo1qqqpO7IYb
	Q5XG3jPSlarNm4ThJRUEZeTCoj9nQ8MDjTX4GzkeK3OEDSFSyA/mIqffem4Bk92WXmkggWfilKO
	pJCKWqmIpGRpBmaIM/wkm7EtwBhPbaJO2VRx9dPOgWugy7KUu0ih3dOJVXO0g/3d3
X-Gm-Gg: AeBDieuMIjQmgVk38a5qRxqvX0eNjtVFuQS295Uc48Z/ho+j0x0lEc1C9qZkoW14erl
	u+poysmdreedkmYX7ACpP2P1sgs7A9JbQUhJC7c1pouGXMYCIjngde8A/K2ERRstL1M1kZZJZt9
	bTOQ0FhjdRwyX5UYYYfyF7FYIMpaKyu6U3hUxxwO4FDSRfZl6zaObJm9xjGRzJ5fsr+23Ep9RPn
	YdSqmIRyf5RknJ+x1TPhq+kZXOxtEgF1+aZ+KjdTXnWgIhPYlL0XpqlG5Gul86ySbEtyFzB63RU
	DJu8Vag4NYXVaYAW7hARzYMuma6OTnCC4qCXvqo16uG10+bNznp0z66MYya0kN0h3YgnSu/lB0s
	y01/QdMlk2G4SyS//oOIjtmfQxUwZBxicRvHMY3lfl9j3uVQdegSrVCYCghtqKlUalg==
X-Received: by 2002:a17:90b:3c85:b0:361:45df:103 with SMTP id 98e67ed59e1d1-365773ba9b6mr1998791a91.12.1777964435361;
        Tue, 05 May 2026 00:00:35 -0700 (PDT)
X-Received: by 2002:a17:90b:3c85:b0:361:45df:103 with SMTP id 98e67ed59e1d1-365773ba9b6mr1998752a91.12.1777964434865;
        Tue, 05 May 2026 00:00:34 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ebec73aasm13840146a91.2.2026.05.05.00.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:00:34 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 05 May 2026 12:29:22 +0530
Subject: [PATCH v4 01/13] media: iris: Fix VM count passed to firmware
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-glymur-v4-1-17571dbd1caa@oss.qualcomm.com>
References: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
In-Reply-To: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777964421; l=1361;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=XCLAciwoGLa2sJvy/DDGRqny4ifzNwzjaeJeVzt0PYg=;
 b=ktXf49S5sgx6u8kMejEzA6UiVMOHVQS4joL+4BEKP49XKZ4vQFp65+/vb+24gDkEP4GS3Qp+Z
 Jr0woULZO/2CoeWozlpPFfxeMfe4S8Akw5yLupWJ66leYOiL915/QLW
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA2MiBTYWx0ZWRfX75xxrW4l2edY
 k+J8kuFZO9C3gY6wzV3GL41Su7FSIwIBj20kQzFqiH7EBccZwBnWnl0KYoagyWErsKyIJJd6m3a
 5pBe04kmNcZFMUsY5lCKkTaJohSQ4SV49SJOxh4xU3XFqgTJRdspW4LA2t49JiBQWwpapr1Gnjb
 As+/jljLgH+ecFToasaZi/d0HacCbdLv37yhJ8CiefpKWl7uOlbo2XlJMMgqaiomekKNMuyimqU
 u84CHH/oD6mAaEjYOaSKzjU2A0uolMKbGwWvJXqArJkiWHrixmSVEAtDukIYGbR4ob6GQ9sUie1
 hmFDpy8Ikf1LJLP0By5TeSv4zky4qGFjD3R7gATYWvlZxOjZR/VMFgxuxMhxYZe9bc1DQg3sCeJ
 Og1NMdfD7KA60CvUUvScUdX/Ibq9L4Tir46Ru6bifIKLyQlatTQF8uC0QTa5N9cNnW1MGu9/fJa
 JPlhzdHsNaJZ9OhjIfA==
X-Proofpoint-ORIG-GUID: -zE5rVCyX70oq6OSnGtMl_ebvsS16qBW
X-Proofpoint-GUID: -zE5rVCyX70oq6OSnGtMl_ebvsS16qBW
X-Authority-Analysis: v=2.4 cv=C47ZDwP+ c=1 sm=1 tr=0 ts=69f99598 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nrYi3PkkErC94SPB-twA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050062

On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
the number of virtual machines (VMs) and internally adds 1 to it. Writing
1 causes firmware to treat it as 2 VMs. Since only one VM is required,
remove this write to leave the register at its reset value of 0. This does
not affect other platforms as only Glymur firmware uses this register,
earlier platform firmwares ignore it.

Fixes: abf5bac63f68a ("media: iris: implement the boot sequence of the firmware")
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

