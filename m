Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F014A0F01
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048541; cv=none; b=DooLq1NwTDzl5k2GqOnXuIM+7JxoLz0pKMubcunuJ7YIASYzfJWyZUDyAqSjYs7soRKxcSEdmwmPO0MA0flXmSPBn/JAvXOWaFltJrHp4vOefNhtBYeznjcHKCa6iS6/uk9WwmMdAre2w0c7AWRam1mYW47kh3r93p4GVw07n3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048541; c=relaxed/simple;
	bh=fMCM/EJ72WgLCh0VQxXmiSA4rBjnJY2LoLwbQn2sGtw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hl6q1hMqyjVivHyV8UaGmpQFKBtcGmlY9Ji33QCkOO4PUgXhARIQWtjBbtWv4K0/gGRkG4irETtPl99fwgsCudL4SfeNou9q8YnpsbU+/PT0mXyuUtdQoqnNDphK03MH6mmyfKUJnSTv8S8Th2Q4O//tXvekO9toZxIWwK84xy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UNSVTqel; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gS663qyl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UNSVTqel";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gS663qyl"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6GjJ4644870
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=++KZLL3kpeg
	YS0V9HP0IjvHnsmw1E79JdBNilYSKGWs=; b=UNSVTqelSyqVOBQckw3fEUzRYQB
	f+ClcRa9QvQnS9Vzu83wyNYRn7MTAzhduvcngPFXgANf9tzGivSmH6ydVibmTbQF
	7Q7oLaf9WBdUCvs32oJ4L5rq1yxx6xf9kFBLAJBvA86JyIpMUKmPsjmTx2TArH/7
	nPtgDffjsV7mlAotVvdhK+wmJtiClc2fMHm+CZcFt96Z0PlxKszPzDCLv2Wcupkd
	atPH2U+o+cXstG/Zm4S8IMvdJ1e8dwcTZVoDP3sQUYEHVf+YXISSNy+Db+tLNp6W
	W6hyN6KnS1A4iFk14wkvgkPsZMRN0yPn6ZbMLynrs+ymf+2SxlZyaqQbUdw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmy9ntt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:15:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so2596563a91.2
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 00:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792048530; x=1792653330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=++KZLL3kpegYS0V9HP0IjvHnsmw1E79JdBNilYSKGWs=;
        b=gS663qylTgtzYb91QmfMniTH3ZH9VAaFHlhPAvHx75EhPiU/RUzSf2l1IFMjxzCPn1
         b4Lfux0it8ALzQ+gWlHZPNUhQbNl6y8ir6wxUGW8TVh630ZPt2N7rvcnrHIFh10oC+cW
         Jh17ujXModb1fmYvwB8TZidmo7/Zzz7jezscoaMZRm/3bc95D/9/ESzfmFLtFgwA33I2
         1KlWwiYTEuESwU9frbb8hEW9UBXsX/bLcUBF13o6GdWqiI/HLwmyUgymhCr1oSpkn46a
         MWT11EBfFDxBRk/nuuy7bV29OOcNyPVyFeKB2dnA0vaitvo+AKnBFrLszOcnSIE3A8IT
         Gi9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048530; x=1792653330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=++KZLL3kpegYS0V9HP0IjvHnsmw1E79JdBNilYSKGWs=;
        b=kt3PuMWSIA1O2Sbq7kFsE/PdLFa6sbxSqfUXOU5vWwdduqTWyyoBP+Z0niomHFMUaw
         COfbbC3xsnqbp57/Wc/r0BtZa2ZddtqPEKgYsBlfmyu7iYrBS0OmmqibBL2Rk0uHNrn2
         ci9GOGK1xkhw6hBlWSw5HzRhpS00Xbm7Fal4bxQl2yrPC5sVwJVVtxirBK1zm3+JDUBn
         8Akqj1cD1ciH9eT/NYnx8kF74SeZYtnBqQqIt4SPcji+wVXMoJZausGpuPXr/TLCTyTa
         I7OOdnvqm5fREoUpyM4nCG13bPAd0rykKJ1rUJCDyv3zpBAFN7+lL0w1VQg3QPkj39nX
         yACw==
X-Forwarded-Encrypted: i=1; AKwUvBzGshIrT1m85fVOsciVZnslr8yIWUb6+heiE/4FQ38y3ouJ2tSBNQZEbDFicO1UX61SIlU/dK27BW2D@vger.kernel.org
X-Gm-Message-State: AFq9FYJptX6dMO5BYW++8xuwymhju9eSKMLXyrg3VhKpZ+16DP191rEy
	1oSSEmbrn/T7iImo5vah0cl77AMKXRT+mUK8WGlY6O4WAnzcAIGGFfuzs8IEkxGDy4/LHfWBtAa
	lsbl1VGcrP7ANYk3+ixDBldTUWh4nlqKqYTIPmuQJXRdm4i5evIk5eo9mQO7pFIVi
X-Gm-Gg: AYBFou21zdJXhpDEtTbi+4vIUhQkiP8h0aOdazbkPzqmf/EYkZTVdPMUfY7mKDdA5Md
	7URg9gdBzeLw+ovQAGHa4GCnred320Vwytt4CchcmhTN7TncE489ifTYVqvUYvBfMoKBCVd/3Aw
	FTm7oI9kD5oZxqekfQk0Mwvi1EP0/F3f5HsbhLffy+3pP0Wx+JBYwncjMPjfUv5dFzt+O4ToTTs
	eptFCzUqt2tyfxl46YNoGqTtBLoz6+wVQkdm5bjJ3PdruiOD3r4NgrKpjM7iXITFVO4IyibqW5b
	WfNpYsX5QtUp+yKqVZswgxVi1BTiDSqvxs5Gsu8CHgCYhpNqqonqHFj2LPazQF3p0qkm9ArcI9k
	geia3Tue1K+Iz7GdRUDY/zPU/XIxGii0zPXWQYIuUQV754x1RHEe2UR6Jn8LW7W+XN3+YVh+i
X-Received: by 2002:a17:90b:3d4b:b0:3ac:945c:7f69 with SMTP id 98e67ed59e1d1-3ac945c9996mr1593989a91.66.1792048529502;
        Thu, 15 Oct 2026 00:15:29 -0700 (PDT)
X-Received: by 2002:a17:90b:3d4b:b0:3ac:945c:7f69 with SMTP id 98e67ed59e1d1-3ac945c9996mr1593971a91.66.1792048529040;
        Thu, 15 Oct 2026 00:15:29 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944511c7sm3223475a91.10.2026.10.15.00.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:15:28 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Jianping Li <jianping.li@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
Subject: [PATCH v1 2/4] arm64: dts: qcom: glymur: Make the ADSP remote heap no-map
Date: Thu, 15 Oct 2026 15:15:09 +0800
Message-Id: <20261015071511.977-3-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
References: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8SL1upg0RVKCb0tVNkHiCYWYg_gR1_W9
X-Proofpoint-ORIG-GUID: 8SL1upg0RVKCb0tVNkHiCYWYg_gR1_W9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX68RkbH16scNs
 z9XckZhPYDl8aKpY/iWDFPwVCDNuLrA41UJz66DGXelthnOXu6cOWB+qvDq5fj4HhIB3dTvs6+0
 LHpd9yluqtbT6Ql+SZj5FgsDVBoCUJk=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad07d92 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=CgcdhG9ooiE7Jmpo-HsA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX0Fov8RF8jC7K
 Mj7/Kj+64qzwkayjWIjQVQ+ZrPinZNDx2tpdZXK5yWITHowmZbEP8XLBBiAj7eZv2e1UpqHuCTm
 4OgIxsIN24h7+YGTba3VriSPZcT6Uod9h1UguDRHmiR+QLrS5BOS5jteNCTNsuBoZMCuAw6Ne8u
 EqeGQrWXucmgKQM/KMOIAhPJ+C+qyDXZ0I2ojwR7MzGTNjHz11E0HOZVeEerMmQIi5RHuZ79VNS
 O9xhttHYBkWVRyzQ7HZLTPcbEL5ojgYs6L5cudbXHXPLCflrhASjSC0JvaKvyCy7ng2YMuYzfFh
 3c+2rysi/1K7t2QPamJMUaPoUhOGki1GoAn1732RWcKEFcUBaW3UY/sa6PIFeuTj8r2hEuKGM3m
 EOU3mVs6hgPYgUA0C/pTUPB0qYtCfYLd6SRObfRxLerz8VnH2P7hRbfcj1VRlJ2N8pL0naPBvZ9
 po4Apgvz1BJowoFeFPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150028

The ADSP remote heap is declared as a reusable shared DMA pool.
Allowing the kernel to reuse this region is incompatible with handing
the entire region over to the DSP, as HLOS allocations may then access
memory for which HLOS no longer has access permissions.

The same configuration has caused synchronous external aborts on
other platforms when the kernel accesses pages within the ADSP remote
heap.

Replace reusable with no-map to keep the region reserved for the DSP
and exclude it from the kernel's standard memory mapping.

Fixes: 67641246eabd0 ("arm64: dts: qcom: glymur: Add memory-region for audio PD")
Link: https://lore.kernel.org/all/20260701-glymur-audio-v1-1-2c3862d95a09@oss.qualcomm.com/
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 65a398c0a992..4b7907cf9c82 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -690,7 +690,7 @@ smem_mem: smem@ffe00000 {
 		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
 			compatible = "shared-dma-pool";
 			alloc-ranges = <0x0 0x80000000 0x0 0x80000000>;
-			reusable;
+			no-map;
 			alignment = <0x0 0x400000>;
 			size = <0x0 0x800000>;
 		};
-- 
2.43.0

