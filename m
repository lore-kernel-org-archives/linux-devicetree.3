Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F259A43079B
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 12:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600629; cv=none; b=RbumsvfxvwLVvvyjszr1EURiDew7SvrN+W0BwnybElRUuyIy9S7EZpdnYF7biFBfWRytJxiFWBPc+O4xFKi0GOt45tWmwFeR5jgijYRqgA5M2uOg7SbH9YRdDHMIQja4sdUONusDP4ETfYcd0eI4fxIS3mTvj6cv98oqTygw5pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600629; c=relaxed/simple;
	bh=fWkAbSCFblue3Z2AwijKMhW2CrasBLX9+Ror5e3etEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HLmiatokkPsN3/ZmonEBvhzKjPlz12dnnDcJp6oJuvAeaBVloa0RmO6W4h97zQwaDo6yo1K/449RUereEdasGNSXe/QkzOOSU8s16OdvZ2395O+vLPgW86Vs3fIkFZp8srvPZ35hYbF9SsM3nmjcWF41dJkHV1H57+qJa0kiIFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcxSinwf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XhZvemKO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcxSinwf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XhZvemKO"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BN7W81537221
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 12:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M0uWu4lVVItdOG/gQO6m1iFTqiiPl59WTuu7fGl+srQ=; b=mcxSinwfYlgk2Hm5
	6SMmZJI8+8G0YgkdIsU/V8mRcyl+B1GJXmIjj/OMUgk9kahd6IyUcrm3gGGkdzW6
	Iqt8IDeRwwXQAw1X7FYRV2F2B7/WSVUsrFEQA7aNl6be5RWzELMa38S2B21DEp2/
	Yi2u7v9oI8/o2yewuHwa1alickOZospSgY9UL5AYBsRVIX/4bNR6h4b7qtPVAul3
	JQooJrrcabKg29CB7J97PLRzbrdlhRNe06W/7O/Y3aRnLa5wFWqQ20aETiYtn6z6
	SpU2FjT7X81vriB+aMKmsjWO1TYs5Bfos7rp5wUdr/3+9SFUCtdT6HKbVuq2Beol
	yyCXyA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa1ydtpmb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 12:37:07 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37fc66ee6a4so3303578a91.3
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 05:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783600626; x=1784205426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M0uWu4lVVItdOG/gQO6m1iFTqiiPl59WTuu7fGl+srQ=;
        b=XhZvemKOKgjPaooslTXuZVrvOp5Fpli1eJ76YGV4c2ty6+a+GKQzoFAWWqIFz3uj0q
         zt1++YZ7Sw6y/SFfWqa2Wd16lx5UWupcH3Z/Gml6aojOYJeO3c3dj64Mylc5xci/a9Qv
         Ywm3eH2GV6GpPKrmbke4yVnMgOMRGQbJp8t0weVxeOHLiVxdc8Hy6sOjasZqeJVdwmWL
         kfgrbXD/quEjrm2x+sSvLvElrq2O5YggYWXHmI4QrCw31C/h3WSX6wQPMo5O6NRxxALX
         jbljM70Vxr7hSgamD/zA5yOHSdGQWHItbqJJxpxMd8D7AnivACQH4R9eDi8VHwCW6HWS
         cL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783600626; x=1784205426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M0uWu4lVVItdOG/gQO6m1iFTqiiPl59WTuu7fGl+srQ=;
        b=nZOgYXg4eS5X+FN+jXZtS05FOinm97P+fZ2Bs7zAWxaLb3zpslMFV38nJweSD+kDws
         o8Jv9go4YwMiNYsuFF/lfgkma+gyfjbmDvuYOD/OOSIpbO/QWvMu17Y8/7+BxznM0RMl
         700oTNzfQIzsm3+ppYGvpxQzA/c1zjCKn0zhgHUftjny4lzAXjMJgJi18x2S1aZfScea
         KxpTOmbcfSPKF2dObxUkRQVenXM4Wr24xP/2WkcvLPg/5kAd7TTZHqIshWM+lLecYl1A
         MwLG3a+R6OlxvVIUkczE28Z963z/bzB4xfRD41yqcuIN6TckT7FBYo5jVRsmwPRGVVsS
         eVBQ==
X-Forwarded-Encrypted: i=1; AHgh+RrzBBd5MEFgwWVdx7FMGaSMvL0zSg0ckBgmb+zFnGFjdg0PMXq9rhukZpjt/mflhSS2i/PAudssHDSe@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpp60YtxSnKnKW5oYxi2YrC+Gt9V+niKuhtrdy5guCM00tRGSc
	hkQnic/p0Ih+iMmDdiVw4rgkFCfCUVaNnTOdu+f3cz4jdu165uavx9aLNsinE+CuxvPo3W+GPjz
	nFW7ZRqepfPGmMjymgS0AdrScwPlno+qxDBh8VzFuMr89Zd3ILKXfGr/eePPbhy64
X-Gm-Gg: AfdE7cnOpOXVE0vuYoZrIYcsLLIAwRW0FgIuLN1RxXuiBVh68oWWvhVLqoY4nmvDYDN
	RKrux7LkfTv58MGWb/V+pBMppYPW4OHrdNYpyQXD8cpz7yxzweptrs/wpKPI9H/hex9u46fO64z
	SM8ZbrdoqbN6RIhyoepGw/OtAP5jOKyZEmEnbk2fcRfUhLsMx++HoQLHbhUvlpmnQCAAxotu5Ly
	sSKxhn/Q9DPbeIE5vKz3+3xmSOWiaTqeaKfF9j3uQyx2PpFsP88n4In4IOdyvIzxna3f9BwtjuI
	ofK4obs7xsm6npkgj2leBCsWpDJH0yAnbAQsZX9AIU/WoHfRMT4hgLI7WUMMmaNzzdB4m77mWv4
	pg5bOr08rdOIwPcUGSt8FrvZ3t2hQbYqUvHjtEeXXYiVT/Q==
X-Received: by 2002:a17:90b:2f0b:b0:36b:a4c6:da96 with SMTP id 98e67ed59e1d1-38941cc52a5mr7041369a91.25.1783600626347;
        Thu, 09 Jul 2026 05:37:06 -0700 (PDT)
X-Received: by 2002:a17:90b:2f0b:b0:36b:a4c6:da96 with SMTP id 98e67ed59e1d1-38941cc52a5mr7041337a91.25.1783600625893;
        Thu, 09 Jul 2026 05:37:05 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483941csm31456029eec.7.2026.07.09.05.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:37:05 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 18:05:56 +0530
Subject: [RFC PATCH 10/11] arm64: dts: qcom: monaco: Move Iris IOMMUs to
 child nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-vpu_iommu_iova_handling-v1-10-72bb62cb2dfd@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783600568; l=2086;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=fWkAbSCFblue3Z2AwijKMhW2CrasBLX9+Ror5e3etEk=;
 b=NBCO/pvurO3z2mTiBIbwwBIhoDTvIZr66UUgPwXu1X7YUVxIpq03suFlrhJvlbi5AfKtvt7Q5
 b0Q8GffIbCDD8U8KM9jgzMzCqo9i41ToLBHrYLdd3MP8VOWf4T+Un8d
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfXx7qSt2kgxVfK
 7JZ8aifdmivnR6yjo8kQZ67ao4jnxU0uuKmJY+zDikI9tFPoyNaYjVcWRbFeWNv3qkNi3OHfzJX
 SqFZVBo8SLwgGrZ8mzM7HS/dq7JiUCk=
X-Proofpoint-ORIG-GUID: Mpmct_jlKw_ehDe_rzAiAWgP-YOZvLwH
X-Authority-Analysis: v=2.4 cv=cOLQdFeN c=1 sm=1 tr=0 ts=6a4f95f3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=SdC2vBNBQt3qShdCGKMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: Mpmct_jlKw_ehDe_rzAiAWgP-YOZvLwH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfXxfebz3KBXCJA
 CsSQPmIefOEqjntYqAXoD8dZva6eeBPvGhyLtn+6Mj9G1AX4NWKuUK2xivoqDq6I+4IALNpPutC
 6a3z7NuklwICSExXqlM30H3q8Hps5Pzv7pzUWISmpxJUUpdKHbbe9MfsNDCkNOAkwS5CsrPAAxV
 i+O2DGaIRHsX1a+LIJaubZ7eTcTL1QNRK+QnPQKIwWCG+VPjbyDd6Jv2drmQiYZ/dKTPI3KX/MP
 38sWv730UlRj4vlPcMpQBR4R/7uMjtTui03ExialEhTZKGGEI8izJrH77T1tiL+vMLDPMg/mWCP
 80OpFFpFSMGls13zeVfqh2Dm+YOY1sGYCCMEPp+Bpzqgcuoc2UaIpYczXN7YXN/wWTe77Al71Tj
 hk615G2Gw38skDgISidFFagvWPyFsvNazN6kkiXJ2D2bLCuHS7EDqZRLukZEEVKIDBA4XTVsYNp
 SpM4hcc6RPxZmwG/MsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090122

The Iris VPU has separate streams with different IOVA constraints. The
non-pixel stream must be limited to the 0-600 MB IOVA range, while the
pixel stream can use the full IOVA space.
Using a single set of IOMMU entries for the Iris node does not describe
these per-stream limits and can allow accesses outside the supported
range, which may lead to device crashes. One such issue was reported at:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Add non-pixel and pixel child nodes, move each stream ID to its
corresponding child node, and add a reserved IOVA range for the
non-pixel stream.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index e0243901abe9c5748fcd3c448a0203374fb96c3e..d3c464571d5eee18fccb0e6b522ff0400e664cc4 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -831,6 +831,10 @@ video_mem: video-region@9be82000 {
 			reg = <0x0 0x9be82000 0x0 0x700000>;
 			no-map;
 		};
+
+		iris_resv: reservation-iris {
+			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -5423,12 +5427,22 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
 
-			iommus = <&apps_smmu 0x0880 0x0400>,
-				 <&apps_smmu 0x0887 0x0400>;
 			dma-coherent;
 
+			#address-cells = <2>;
+			#size-cells = <2>;
+
 			status = "disabled";
 
+			iris_non_pixel: non-pixel {
+				iommus = <&apps_smmu 0x0880 0x0400>;
+				memory-region = <&iris_resv>;
+			};
+
+			iris_pixel: pixel {
+				iommus = <&apps_smmu 0x0887 0x0400>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1

