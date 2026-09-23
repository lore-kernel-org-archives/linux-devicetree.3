Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CE648642C
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159198; cv=none; b=vFwXrFWP6wdDuJn3vKp1Wwy5ZWSuHF+4In0WOIsSs50z4IOZ5YCKo+gi12lrEsNiZ7UmB1XawIyZMcVz9a9R6oelfd2Zn+DXbnjyvi/yMdbOfGNFBXNrCi9r9SQrj8OElQM9Y249o8RaO24J1SKlu6Jsw11IUPsoxRX2MHdifBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159198; c=relaxed/simple;
	bh=AdlzOXzfWps8eRCoOYaMQ/l7uvyFxG2Tx0xeFEPHfFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iwavUtjKLFIrD5XgakTyUcL1gdyWYVCiqJ1oJFaaocygdCpoBI8vqKDwLss3r9MDuBNszgc7Pb5AwiuoaqyhTqb2uwENzTIYRpfbdVqsEHO1RYDz6uZE5BmJ7XuI1y+xV1WQe7LxmI0n7GoQUqG0sMCviGVqe42NtQN800fzqxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kTqYTwaa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ISUa6Orr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kTqYTwaa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ISUa6Orr"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA30WF4087726
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KfXoc3zywC545EGvmiJ11HJfhJTtfASiASk8KbvKnIo=; b=kTqYTwaaHvHCRQGt
	/fmGtTwhbXNV+ma7qkgkx0tfxmSralV3ZhoUyjoYLbKk1ub1yxXo7tWg6ucGSJKA
	+a4gYNA1BypvYQFNdICyF8fTq0LwpkVFu3xUAbwvWJnG35Bki1rmekr4K5wr1aBZ
	GSjzIzgn2aPmWrbgXrHg7bYelhUYfbRJ9N4seJUXBxbqto8YQylMRVtjpJ1k4KjD
	vHaKYfez46ydfjUkAN9UucRPAREKK/dmZh46M+KI6P7aUwF0qxzECL5cgN3UFe6B
	s9Ve7ciYFCN+eYr6MUXIH+5LJGpER59vGjZCBQAuYqCt6yK9kNH1Nu56Ml5W/12v
	ArrS7g==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c3vea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:26:27 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-143580417b3so2703030c88.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 03:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790159186; x=1790763986; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KfXoc3zywC545EGvmiJ11HJfhJTtfASiASk8KbvKnIo=;
        b=ISUa6OrrY/0RtCWmtKRaKCw5iRrdQrl6eo4yjD1n+wS/gVVucKBzcaHlqB0z3NiaEJ
         bTdFceBW+wk6JbFeBAkulP9SoJajDx5M01mkyayUBVLJ+n8LBE6Xu8XrmcgRa6QuSu+n
         VBt64WP7u4wNNbj2E0Xr5L+9DOsnFBgnckxBP70TEdReWDChtiOYVgLMDcnkSF9JD2r5
         nmJIaoxXc5qRvO5I+EptDrDvpXfIk7dOuTDYkl13uMSocrAcdfAbW2r2YJXuhhM2Ak8X
         zs63F8/LAha+EUykenGhcgvQruxc09lteSpkJToQxPIDOAqHtwogBn1kGYHWm9zBuYMg
         d+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159186; x=1790763986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KfXoc3zywC545EGvmiJ11HJfhJTtfASiASk8KbvKnIo=;
        b=WM0zRPw+TPj3RsHKnJ3Vobf/vj9twLuFGe3LVghZUH2tG3gpch5uUNiKqgFyHyHued
         CC++1vv6hS4KKczEB2B6umQolFoFZHkBz/DRP3ZRMdAYXeNRZKMV8c2wd1UFXT35cr0s
         7mF3LfyqwkItEpspmltRAcqpnCUx1o9NURrOwryROFqPVa7OLBGUZaz7hUi6lyd/2fnB
         /j1gs6PzP9/Q1YGocjNK93U83CIVxNhk4Dg7//Q4T/xybtfpqXVk2TNlQlmwpYOLWFDO
         g3ToTy3POJcQjLEODxzsvCbGYkSpMEK1quBt8QZVY7BTBP4EQOuZEiamZnv1xPryVYQz
         0iaA==
X-Forwarded-Encrypted: i=1; AKwUvByMJhc9w4hGue/RMf7TjI5MTZ7tO/tgaRmhRdT0r0V3FgV/yil3NzfuH9SdrbhPYt2WpVUOrts+IuNU@vger.kernel.org
X-Gm-Message-State: AFuF++niheHSbrNuVKbFDF5dy0b2b8xt3rm1ps2qTBOz5xrkd7VX6g59
	9wQRa2M8LFv38V4WbHOzCc2s/F8BADKU5Qh97Oz0TQV3zEAx+eqo74ycScqVD4ij4zVbiCmTE/h
	f/t/oCveYf7ClFw+EpI0KlAN6QQv4uNUUkwVH0w9FfJP85eCXktYJVPzfDJ0K8vd7
X-Gm-Gg: AYBFou0SN+X8Mbhcgrkd81f8NUSultqtrE0MfPJcDsSJO3kg+1fN+pnGoJhYjR/4oor
	uS+AqGt1zxHvvVfTZwBdzhJ57uD3C8zc8TWzIF22Pp8QFgFuO96QRkVjVYin3Akphv+5JHXpyq/
	Y0nTHZ0N3OnCXDoPxm5TqZJZ5nIrjWqEqThJAXQeqs0F1uUtdS7aQ7xKkUHOtv3DaJ2c3wBIl9P
	L4OLDRgRbtysiMd4hEWeuWyW35j4GGM+qYWnfcLoFNZU58ijErGPAUY1v6xxql+ZyATgCxgzfj8
	QYZwerLqsQzRUyjxv/RKou/S9qSMDKq2uhppdTTOtCey7G5bjZqH352cduLAKk84ktOI3DHvzn8
	XIsCPYDuX+jf4RDpjE9gYb2M=
X-Received: by 2002:a05:7022:7f0b:b0:13f:c02f:60b8 with SMTP id a92af1059eb24-144f9166ab0mr2194599c88.6.1790159186403;
        Wed, 23 Sep 2026 03:26:26 -0700 (PDT)
X-Received: by 2002:a05:7022:7f0b:b0:13f:c02f:60b8 with SMTP id a92af1059eb24-144f9166ab0mr2194543c88.6.1790159185820;
        Wed, 23 Sep 2026 03:26:25 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm8766646c88.13.2026.09.23.03.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:26:25 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:55:42 +0530
Subject: [PATCH 02/15] drm/msm/a6xx: Fix secondary rail vote in ARC votes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-gpu-v1-2-0c3c79a1a470@oss.qualcomm.com>
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790159163; l=1328;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=AdlzOXzfWps8eRCoOYaMQ/l7uvyFxG2Tx0xeFEPHfFk=;
 b=693AYB6XLlB5c/XlIXQsn4I8z1hx/Fde8dopx5AR6kyh+CLc53YeZ4IOWJhVIw1DcpU8qUYVE
 VpO0wOoGjt+BExCh+kqDZEZMmMlzfiDkfjAEPFo1zjUt/+GtZvBjL6Y
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX/HQzvQGcd2fn
 QBiqnpEN/gzb+xGNBcGWt4SuQr+BGtJUgVNdIa2pt+0nnOljSIrkEVlmfuzRakejhOgYoVP2wG5
 Y7C6PYst6GA1C6EAJoPkpe9r+W3kDIcGft0EelvQQwX0PbljCI/JqMjySC2/jtXAjzRU4TKWaU3
 Z3+Grh6a2HQHtlsSr9AnG8ckIp1JWAPIn1MKX4tIfwEFD0a+y1jRmqbspp/r3q1+IefMLjFPwWe
 lx59OqQDWJH4gjrRrQj2y9o1giZivR8tzVGDrDfhKYCktHxQYKI47d0EhH50mbTIoS/rnfMufmi
 GH58iSNPi36v9a3QYePivUPOLhKWcCoNSzPdFJ5WLZIC22HrGtwX2Aw55/iaIE7ZjPOAEXcwVNb
 QIV3zKql53NqoBFg7qyDunJCgH6KJ9WjEJPnKtAoIyZHcFz97fiEtfdbO08sbvnwKTadl8gW/+i
 UDzbAL+ulO4AEzbteRw==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab3a953 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=vapu2bkIsq-odsm9enMA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: BEwX4uHWo-MXxQ1OdRXx8Z-rDc6enpYj
X-Proofpoint-GUID: BEwX4uHWo-MXxQ1OdRXx8Z-rDc6enpYj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX73j1yyOP++BQ
 5ZDUdVUnabJdFTSRX8+f07o88CH9X2vVp9jzE5/DsaNnet7H5dZAiPie8fPBwdQaa+XQLU6Gcql
 whFVodUQ3+1hybdVk1JyP0M7FVZWjGs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230041

Using the requested level can pick a secondary corner lower than the one
required to support the chosen primary corner, under-voting the
dependent rail. To fix this, match against the selected primary voltage
instead.

Fixes: 4b565ca5a2cb ("drm/msm: Add A6XX device support")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index baf77a620572..d072646093a1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1765,10 +1765,14 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
 		/*
 		 * Look for a level in in the secondary list that matches. If
 		 * nothing fits, use the maximum non zero vote
+		 *
+		 * The secondary rail depends on the primary rail, so match it
+		 * against the quantized primary voltage (which is >= the
+		 * requested level), not the requested level itself.
 		 */
 
 		for (j = 0; j < sec_count; j++) {
-			if (sec[j] >= level) {
+			if (sec[j] >= pri[pindex]) {
 				sindex = j;
 				break;
 			} else if (sec[j]) {

-- 
2.55.0

