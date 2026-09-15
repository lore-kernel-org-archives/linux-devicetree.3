Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0B746F489
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464510; cv=none; b=V3KxrdjU2Zkbxdrjy+ddgbIQaZpGJmYyE1s65oNfKtHjGtdBwl5vFGThR38a4DLyg12+LqYPvp5+Bg/3zeRbRI+JrsvcJervJJJs4BbBIP8zNPH4yGW26wgs3dEKo6iVs/erzFps/O00WWoa0uqUmFsRhcQF6eyZadsIrfYWwlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464510; c=relaxed/simple;
	bh=bXRmq/LkVHl3Wkzce7EKsFKSt2ADGnLeNMNslKPB/Js=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=psDhsS3iBPL1BLWsVafnczurlmxJMFAcEXY76Ubr+0uXjPf3KMIDIpD2GGD0C4pcz2xBnKOLg30eWZdYDCJzHxjPABXKZQnEJMVcMYsYiHz93fJj2CQcDuUVqJn5vxhXVoz4XJZYHHsRS0Z6t03XDueN0ABl054pTpAtxXVuBvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TsL1ASB1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nnqr4tx3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TsL1ASB1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nnqr4tx3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Z80t2415179
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K/fI3x8NiNBLG06L2ufKw48FjISxnkPuNyMTEtA4Tb0=; b=TsL1ASB1A+lZ/1eT
	LBJ9E2E8PCnI6ZHCD0cHP2aJRS13h7sw/uNwbdc1f/1wdebirFjchywIGCeFXLsf
	mIReachwmLdmCl4xj3Lf0iZXOk6zV8xvgEUi22eZGWj0half/PFs0+3v8m+wTd+y
	g16L1O1WbSioFZRS11P6rOT8i9i9aZcBk39wIqbt+y33wD9AUIGXr20/Swa4pB/3
	4On/NZaNuVDcN8DkmqQkNs9ACsrvirdrGPiO8PF/Dh6UY2K8LkYuRi7GHVnm4DP5
	AkouD21x/wcssxd+w+0gFo1YoBgUm2yLzxFNoHP+6BTTlYfzCPsD8iWV2/b4Ciz5
	sw8+UQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpxyd943t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:28:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9393ac4961fso488848485a.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 02:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789464505; x=1790069305; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/fI3x8NiNBLG06L2ufKw48FjISxnkPuNyMTEtA4Tb0=;
        b=Nnqr4tx3hNyjnLFzzfaCb9cn8D82rgSgvI6fIxWFpsLFXu8AxUljvnE+7XgW9/TV4N
         OM9P01TMDTePtTbn2hZ38QOjl9g15LZDfDrtnXcZlHao6HxEDlWAzrGCDUcCr2Uoe4fc
         temhkhKAyyKEZeY5TohpFI2LHwv0qNLC8f7YBiyBWbJnyGI29lse38VJMnT5JJrxFDlE
         KfFHor6tjfSv1L/LZM3HaG7Of11uSLQUhdF+qe2mM+6g4ZkTTCKO9dXP9Kl9rbgFg1js
         5K8ME/s7o1Gfl7Gwm0PZqXat0zxgB92MD4tLOo03XzFyUPkRCwbegD12aL+FwhDm2qtr
         I02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789464505; x=1790069305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/fI3x8NiNBLG06L2ufKw48FjISxnkPuNyMTEtA4Tb0=;
        b=0A1kSgPdV01DMc3VqVl3AoW2eU6VYef44sUV1H6Hdz18flrTmoo1L3vYpyG5vyxP17
         69U2y6L/wNyn6cod4QzK2PrWi8x+LCXSaD4RTaQcOg2My3N7fZmE3IeRDyr9fYYy7qfV
         6RAGHGNy3Spflpz+CvDsvw2+tleVVq5AONm0nt3/GYM0XJzJxH31Ls7Rwfc9LSA231rq
         cYGOhRGsxmoo33kN/NowwXtFfy9syXic+2MyQjJxWCqSDg8Gtkel4iZdPbGaYAN3JmUC
         JBXSTaAbwhtQCu3lF0y1rxKIYjABuiQKXJOMETaFrq/hNXJ9zloYnMq4jq+Az2XbgqOU
         KLvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQzuKLlA0J3PzuRnvcYLtB10/7DjPJ5IejpVJOObRWfRa0hXwU9XQaema/yiFTZ71lw+EtKy4lgeTb@vger.kernel.org
X-Gm-Message-State: AFuF++mGOw6UZ2cw/IdXpn07w6A54do4oR97T9ebxRwyFwxiie6JvTe9
	HCdwj6zg3267UZGSsoXPvgn/l8EWQEejrzmeJ182cTDB7RtYahw2rIbJamTUqPGrEj2tIOdzhv1
	V5lyjzu3RWZOB44hyFJ7CFo/DKlKKikLQXBsRix+oY2uyL1XlM64o2N5wY1ufZEHM
X-Gm-Gg: AYBFou3u7+Kumq5UamBJsyZQwsC1ioifsYgnTAX9DWBS6AYXkIgCcJi/FFu3tMs4Xdi
	C9snvUmsPXvT+h+gvBoESzzlrFirecDor2qJ8wc1b6ZFPCvPc6bH+EX+0T7t9b+7QjQ4wheqmhK
	+allt2aBtkwPdl8vjvP27d95lweV+btyS52hn6v2E0Hex8RHp16XLVJdJz93rMmD49kpgv2jA/h
	bW4cQt1KM0omUP0MJZZfrwZMylOL4648fWl3OStKfRPjR3KhVZ++cJQwkQw7sL6JEefRYS2hGvf
	lyKCjUyKJ/KBYDDkr+wywyTjTZDMa3/m059DEYodESYVYe5qQ/NGnrPjajvzQS462Kl6sO/CP69
	gOFsQcwbl1L7itfXsd7+xzedolYcmNxW4RZRlaBvUpHbGXUCnEFTdSBAv8TFWYgE=
X-Received: by 2002:a05:620a:4808:b0:93a:12eb:b632 with SMTP id af79cd13be357-93a297e5c8dmr961288285a.10.1789464504610;
        Tue, 15 Sep 2026 02:28:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4808:b0:93a:12eb:b632 with SMTP id af79cd13be357-93a297e5c8dmr961284685a.10.1789464504190;
        Tue, 15 Sep 2026 02:28:24 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93a3f467566sm18939785a.39.2026.09.15.02.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:28:23 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 17:27:50 +0800
Subject: [PATCH v2 3/3] arm64: dts: qcom: Add INT2 GDSC to Kaanapali DPU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-msm_gdsc2-v2-3-9157237b8382@oss.qualcomm.com>
References: <20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com>
In-Reply-To: <20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com>
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
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789464471; l=1099;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=bXRmq/LkVHl3Wkzce7EKsFKSt2ADGnLeNMNslKPB/Js=;
 b=pXi5y4Y0Fm69ZEAcS81pYwIUOtYfvuA2eymuS8KiMJtlmzTHrX7GfKEKbi1NipcnkJiNQqRSw
 vSSUuKpKEFVCyy2NKvGiSs7QgaYWpj+xZScpuo6dRvIffTF/9r+cMi7
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEzNSBTYWx0ZWRfX5eAGOMqgvrBC
 Vv1/qrKr+6lc3XJeno/BrkCY7l+/JJowXtjAnGir3UYOxwzCnOGDe+FweFozDZ3zfBzgG3B3vMC
 P336qST+Q3wikOCKLn0CNYySH34DgaU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEzNSBTYWx0ZWRfXwOB9HIrLCG2K
 Lq2bfnCkRz78V4I5wPkRYalV9qu/49HACdtCMC6SGLZu0DhUuCKA+HJEauOLN6RWFKZldjwNJ0L
 JJm+Pi4Y7WB2SkTXGRsJdbxIFfelVebxYzQ/2pePfegpbh/pjH4U0PMnqtisnLf+chxtskmEdx/
 GUjs/kNQDu3sf8eb8h0QxvgbzZ9D/LPbiTZtecz+K/WT6DtOXId5w5FMJABtHXQJ8YHLpcARX12
 Wsy2TJDA6XfBwPwJqF4lARWm5LmcB3l+ZoCE0Sq4qVVRevYtw0VR/q/9HduMlFi8e0vVmMaidj1
 g1xmYGTG73au+m7Ofn3AewBL5pdGgR7f5nlhajscAq0J82BscxrYLNnGCLK0RYHvRb6zN3+6gaS
 +c5SiYLhVxkUGX8LNRl+QlN0TB62ZvI7+vdnXyeQGp4RhRczK94NvppIMUtzgWBMlg/Uhw50Fe0
 qgtr1Fh5CsajXBmRlRw==
X-Proofpoint-ORIG-GUID: 2pwIEV0rrA-JQrZVoajG49fZpUVmIuL3
X-Authority-Analysis: v=2.4 cv=LYepeTfi c=1 sm=1 tr=0 ts=6aa90fb9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=aCRQ4ZZDzeq032jGe_cA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 2pwIEV0rrA-JQrZVoajG49fZpUVmIuL3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150135

The INT2 GDSC on Kaanapali (SM8850) powers a subset of the DPU
source pipes (VIG2/VIG3/DMA5). Add it as a second power domain of
the display-controller (DPU) node, alongside the existing MMCX
performance-state power domain.

The MDSS node's CORE_GDSC is unaffected, since it continues to power
the rest of the MDSS hardware on its own.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index ace19b8b12d7..b3e3cd1d311c 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3619,7 +3619,9 @@ mdss_mdp: display-controller@9801000 {
 
 				operating-points-v2 = <&mdp_opp_table>;
 
-				power-domains = <&rpmhpd RPMHPD_MMCX>;
+				power-domains = <&rpmhpd RPMHPD_MMCX>,
+						<&dispcc DISP_CC_MDSS_CORE_INT2_GDSC>;
+				power-domain-names = "mmcx", "int2";
 
 				ports {
 					#address-cells = <1>;

-- 
2.43.0

