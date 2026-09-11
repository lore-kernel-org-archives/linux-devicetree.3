Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620A948D896
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 16:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789145275; cv=none; b=A2Yq2ah2lP0+CFvlB2TMS26oR6gMwv/gylJHdg6z9FYUWvGyEJSoucxq8iTo7aA9TwNG0oFHLLEQQTS2GhSx/95ToS4d4M/wglO1OvOjGV0qEHaMButjcJJCqXGjTK5q1exJyL9gVamT8wx0iNTlWz+jjMTQWE1bkwmuNm824QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789145275; c=relaxed/simple;
	bh=Z2jYwdVQ78mIekMJDREJXS7gB+GTYgUB0qqzsFkFfm4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kmVqoRjyUA1CWGl6HE2yewtdF5o0ZoJt7HOVGZP9xhNQYKTzqH1409jqSnUz8XfvOgOV0Qyo4n+mzKGXw91/XcK8DeN6EKOiQ3ChCeYk2Sl8Ocl1xck34gdkvslCC8OylxC2AgAdj8/NtKPammgueU/TrFCqz+gRM04PcBM2PAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CNhBSeed; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PSZjZyIs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CNhBSeed";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PSZjZyIs"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BFfdeW921096
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 16:47:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4cEUKXE5DpqJx2/opT3X9YU+08mmezXZCIySb8mUzYc=; b=CNhBSeedpGW5VovD
	U1Ys8HrY/OdLzrABvXpUcZuEtw+/fmKlpT8uwEb2vRdozY46uy/bOzDWHesWEZ9n
	cFBwuQOQJZzQSEhIJdFuff7BBPfcGUPo+34Ck/MqQVR+81Uf6zyhKH623G6xdZVC
	BpT+76sNr+hEJS5rTkOounBjfusZbBoO+vQIePTJm3DjBD7y36xU+TOUk3VTuXba
	yNEVPxyelQGOZ1k++DeT6z8ZMjlT+DbulJHBKgTWxtkmcSbo/7ufNBcVxuecA9ii
	X4ZvICApLScQJ/3sZfEq8ivGBie7bSjd9Olq2rzjz4lPr0aqxujhlOqYhRDFIp3a
	kzCRHA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmmgv08wn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 16:47:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39533bb224cso1352604a91.3
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 09:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789145271; x=1789750071; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4cEUKXE5DpqJx2/opT3X9YU+08mmezXZCIySb8mUzYc=;
        b=PSZjZyIssykxO93nzt0lqKhhu3nHCD9iQRHhUvnvzq5PL/d7klYIxRd5cFPvvGXWVv
         iCgjv3xiXfeYD6IDEEu2Wih7T3Iop9AMFb9CGLfmWGE93GdDpWPcf+NfxLHcwXY20l2+
         fuEcN75IhuM3uPQWG3TbkIlfzyQK3+T43TBv9gocOWe31m4Z8egvIEUczjFUrgfTHvMe
         FSUN9ZVIS+gJbwlgzDiRekCy3jUmudSvgEvcmg1DPgoJlfF9Frt3EHfmvd8fENvEEOFM
         wIMMDKtfKu5GTawRzPf1mZ33//Mfwy4NEVAMJDbuM8hUXKlR2CySSitlr5W4pVGc5kcO
         xtmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789145271; x=1789750071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4cEUKXE5DpqJx2/opT3X9YU+08mmezXZCIySb8mUzYc=;
        b=XIfVwT4CdJfcGQkKGKG9ZG40918yE2ZhoKsxWT9nBH6N4VIQechevCDC9RXJLNlLPY
         F7avGo8FoKAF4+Qszhpq8ZEnbxHYI3QlZ5wCTLKifinYaPh7TuYNA7rhO6dNJTjZ8ho3
         lwdwzQvBPfInvDeiQCts9Gkt3EPmWpnEN386MFHIZF0WUVTvcpYjaiRZMJxJqS2vN/Z5
         +/wpAWHjE8tCCvgqQ5RxYLoJJ+yS80G82NL7VcR2n6lpod4zocUjcjtVk03bIJa0gN99
         C9Zc82stMvai/qFVCgNm65YTOREUnzQcmbQIjhhRiLmYV8/ADSZMFcyDRvO4wyDOXemL
         SUUA==
X-Forwarded-Encrypted: i=1; AKwUvBxLmHYtVxMp90XDfeGZUhH/k2+MGd7j69Zm8wIOl42UWRf6W4/4EprNs+d6Q1ujMROksxZeemzhpp5f@vger.kernel.org
X-Gm-Message-State: AFuF++n0pBof8jTvpBSSnAJGj1YeZ4Z7XoX5EBMehRhrazuEEYvUYmR7
	ka4EDS/pvLEl30t5lKs4BkLMt8FuRPzfjHxLhnc+Mdd2t9xHVc0Df3h+KC3vZuVrMs/J0QwTYXW
	cRds9GSjPrnJwPkqPxTU0bxa2zXXWR0DGaMYJimLcZkG6izTOXrgDopvSiOnm8TAJ
X-Gm-Gg: AYBFou3pY2BgvrNUMJGuV5B0REdgDYyyA22SyTpXgtqq1eHGe+pMVwNk4fUI3/27SMZ
	DwAGxY5MgapZjukU+uiQKtKFaqU0dtDx0WHJ2t+kGR157FaquVuKllZc+qB1jn/ou/lsPn79Fkx
	FicppS3aX6jM+Ajj25O7dc9KNkFnciX9I/jcISk6SJP/6keZ1G2FfivGwYJlebzlfv4KOj5dzVE
	uQuMWHd8mHHAYhcV0h5eKt6m+VxXlOSxO2uX3EvTJsacTCDAKPdlgC8dZYx2fJWhIXZZSOpd5f3
	b2Y5y7dTYUbJBxH+eiEnKGuVJT4wTl0Z28fQL8GpyGDdPKh+XXDjFpuXtVxrifzvamwZTbB1oae
	dOZfT9H8I52JS36d9M+TZOGK5nQ==
X-Received: by 2002:a17:90b:2701:b0:398:9beb:5c19 with SMTP id 98e67ed59e1d1-39d9c21b92fmr8855382a91.20.1789145270626;
        Fri, 11 Sep 2026 09:47:50 -0700 (PDT)
X-Received: by 2002:a17:90b:2701:b0:398:9beb:5c19 with SMTP id 98e67ed59e1d1-39d9c21b92fmr8855325a91.20.1789145270189;
        Fri, 11 Sep 2026 09:47:50 -0700 (PDT)
Received: from [10.213.101.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39da64d4bdfsm944193a91.0.2026.09.11.09.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 09:47:49 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 22:17:08 +0530
Subject: [PATCH 4/5] arm64: dts: qcom: glymur-qcb: Enable UFS
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-glymur_ufs_qcb_enablement-v1-4-b9fc5e2ee99a@oss.qualcomm.com>
References: <20260911-glymur_ufs_qcb_enablement-v1-0-b9fc5e2ee99a@oss.qualcomm.com>
In-Reply-To: <20260911-glymur_ufs_qcb_enablement-v1-0-b9fc5e2ee99a@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789145236; l=920;
 i=pradeep.pragallapati@oss.qualcomm.com; s=20260911;
 h=from:subject:message-id; bh=Z2jYwdVQ78mIekMJDREJXS7gB+GTYgUB0qqzsFkFfm4=;
 b=OmU0oAA9WSzJBwTnxVHTpInaFakIpqMuuTO/s/8Ko++RQJ555ESEekZDz7M/arOE1pZ9crD4H
 /kmMJyT64DeAAQ9w55hKfqVxc7lsByUmggGzW8cE5jdlllefXTOhe5m
X-Developer-Key: i=pradeep.pragallapati@oss.qualcomm.com; a=ed25519;
 pk=uyRUsge8nQMwf3iW/e/o0U8z9nWLCMm1MGKxEftztic=
X-Proofpoint-GUID: QrJbyDs3NUnyajklJs8kpDMvtUnV-Vgz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIzNCBTYWx0ZWRfX6cNP0WnbLV5N
 nlglKADl//7kJCzGWBnUV0m28z+FQYrCIW8UJrdD77UICeuBIyGPXM1p7BOHkvoeEqHTN3dRMmr
 I4YWTjUeDlbqy9pG0+LlRwbx3zq/Tz0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIzNCBTYWx0ZWRfX6D5WV3d4eeuq
 2YLoBj9QFAdoKyUuacsOnuhy6rgHQqiu+wr3qPbrk0PQCwD7lhjq97rZxrK5sM6nH9veVQGk8XS
 gFxppwx+EOlsipTK02zUWqkcnu+PvoeabajXrqysMs7RIdDfxyANlj9UWudulWzUU+ANfuY9ur0
 dRFt3xRcPEYFt1CG3yHNkPOz7cLu40YOTxJFjhLZJO88YG7+9wN5u/kgtY4AteVgbY6xG9V9naw
 3oY19p+6dXlYf9yTsYV6gPIviMfMaaGIjrpPeYVFBF4AVS2YCKaF1Qe35IR6wjD8a0T3AO86ilp
 kVXZKC8YYYKyt/yEKJfzK2D06+T7QgiwB381jrZFsV0dg2zZ/t5EbNsNVdL3o+FWdW5JjP9ZaSq
 rFGbZKOiRH8mjXK5ntSExTP9GQS83Uj7jz3p+p1KGfUlwLEBerEQ3PB/a/bqZnxHQ80LYwQJY3A
 b85A0dV1U/WMmJitppw==
X-Proofpoint-ORIG-GUID: QrJbyDs3NUnyajklJs8kpDMvtUnV-Vgz
X-Authority-Analysis: v=2.4 cv=EfFd0/mC c=1 sm=1 tr=0 ts=6aa430b7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=FwCcbryfLnLJMkbT1zkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110234

Enable UFS for glymur-qcb board.

Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-qcb.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-qcb.dts b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
index 17d8ff3aed23..b6e384024dff 100644
--- a/arch/arm64/boot/dts/qcom/glymur-qcb.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
@@ -697,3 +697,21 @@ bluetooth {
 		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
 	};
 };
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
+	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 250 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l17b_e0_2p4>;
+	vcc-max-microamp = <1200000>;
+	vccq-supply = <&vreg_l12b_e0_1p14>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};

-- 
2.34.1

