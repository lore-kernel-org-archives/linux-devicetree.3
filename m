Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD8F414420
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 04:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791952740; cv=none; b=bZHD0fSIaXUaEnvB/6Km2CI/1HzHK+I48WftTxy0oDMONd+tppeIG+NCYOnTi+YIM+BhfqWiR/GauUs8lhv+sTBZ/kE5kzSajWfZb8ovFqAUCTdIk7wjUdmBoKJWwDo6DuonpcqT2p6s+HnK7LOInv633RGBRgKTaiEQVsaKHeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791952740; c=relaxed/simple;
	bh=0e3qRwa0eUGU6w/ynL5P+jJBBY2ZfPskYSfmy+rlycY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tRxf1wSTTTd3hvaiLZQRFvDoSFVpCsLfU+9vZrzMERVr6wASawJygy/qcF4neO6ioE5q2OZt0H/LnMUPuXWooQVryrM3xNhqeB9D3bz+eEeeI41geGOfDuQ89xrL4NFE0ZS78nkD1c4DLTCNONmJxxdJfzrGI9ZhFO85BJcSWiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uq9QPDTz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fQ6TKSju; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uq9QPDTz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fQ6TKSju"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DNCo1G2088171
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 04:38:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vdRIw8it8cCmifIaL+Ne4/v9Isf9Dn09v5JwPLmDqjs=; b=Uq9QPDTz9JEbOUey
	hoRiGzmZ+W/fMiP/ZHzW6rYMwSlmA5iUMWBVvXejbWLphsL1zvTUTg1F2SsBrMYG
	PLgvWIXIUDPXz/MQwnDU2qnOIH+Ge3y25vDJd7Ho+8rr7WFQ8tTczZcD/TrGU73/
	e6qnzfubx6qLIADxJFEnEr6qasm3v4gtivPUcRTGkrBk1CStsQ0VdVDKVCN2NHGo
	4ghg05C9/XtEId9kHSA0Uz4rG5yixIdHsYFh3UYfexGHTJ+rkWx9YRTts4gBX5Wx
	IJ51U6TawmfqDL+h7X6LvoI9GpGZOuxVF+sy05Tndt0LpTqBnulu0x1mokx2ZdaJ
	OwImOw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9x49gyvt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 04:38:57 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b937ecbb4so40159786d6.2
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 21:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791952736; x=1792557536; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vdRIw8it8cCmifIaL+Ne4/v9Isf9Dn09v5JwPLmDqjs=;
        b=fQ6TKSjujxAKBIVCtlaHifctYhq/Cg4RpsqWqBEsEOm5cY4NJ3s7PD+Mmy4rWDTThN
         8oiQijpcuauaQ/AqJ3aYpENlhySKHjpTtaLI6QMTJUjJX/fDzppP+p6/Hv79S/6QWTyV
         VMzJvCRiHRwueKn9QdOOUjvCFQ6FK+s8T2iuPGTYtBqzaiPKUJhA+OXXpK+491uU07QI
         Pb92YuA21ufL2xLYa5Hno3Xu1w1KXkTJaUIUk28ukd3jAki/IJ3QyniifN4WcI5F8vmw
         KLUW88OSs1h7Mf1bE6myjpGe6BkRUbpSPGfkNQ7kJ4qXCgbbzVEEOwu+xd4lrligWb7O
         hG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791952736; x=1792557536;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vdRIw8it8cCmifIaL+Ne4/v9Isf9Dn09v5JwPLmDqjs=;
        b=XyjL7fwOfS/iUqUYdTCfkIBV4yJ4eyAD/Xp0zD7vttFwIwUN45QYQ6o/NydZ99WXKK
         XFDoZLfNrvxu8jaTC8IsD9NN3r994rilFThGryz2CahF06QSN/VUnbvfFWhRzQvyufVV
         B5Ba7Sav31yS2d2CAHvld8Jev4Sllklui9wJKxNWsO8dZ6s6d4R8gvmTLQuSP3YcSQ8T
         vkZuiGnZFIhBP7HUcO8OCrIxBFsTdxgEQ8/fFRmNmBSiN3VwOppMShPQWGuSqAxMl2ig
         ThlakwBLGLLJ1PLHzD0EjxlEeN8GrA/oYsNKGggxc9y5HzO1cUbqf4CRmxi7V+Bk4xca
         p9/A==
X-Forwarded-Encrypted: i=1; AKwUvBxSukSAw7McM5GrJ4ltc6KHP1r5Ga9MhKQLTRkze3paB3N7pOlASgVi3V3C8ww/onOBzoL9CxdgHi/G@vger.kernel.org
X-Gm-Message-State: AFq9FYIGvvhq4CVlMldVKRkuh2F8c+Kxv1kJCUwKOaOGYQJYiNvu945L
	zSBT+YvMf88+aAxS82s9VvJGokAIN2Ry87kkEUyAuWiaQGb1vLIMZUK64IJ5NWW87/rGEdL+ehQ
	p08tg+g36uMgD3STXJ0zKNOFSHGJjXUdCsRpa246f+pvney5PVzN8RI/fw9HVX4LX
X-Gm-Gg: AYBFou2cl4R1Q9kpsCACuGHhsTmtWwbkrrBf/bizdIxSSfBDdcoi5vkAZhPIc77RIM5
	akQtap4JvQFYPwLZEuGMBx5XaEGAH9WXMSSSU8WZUi0S3wpiUQQWgkSnAbImVSzBQjni1q0BDUT
	JXLNBzanEbCj6M3khdfm0l6DELDRjJEtSYBl+46TVHI9mhZZupIJ6C4YYmWfwRk1PvvLJNrS6w6
	ssLaC7ooQLOu42vS42pXZM/mPB0Yx4EWbcjSJ2kglnYUYGCJ2kJgL6oVFjgw/R1SgY0WX1HOeoZ
	h6KzGyXqYti3nO+ixQ2Ter20AtjnsIV68JIRmRWu2qhEdOqEV53goCx1pIaIXGlG9QaVp7PdMIR
	ipvalB6R02UQrc0XGc7HL8XZz1GMnmR3wU2AlozZWBvnPJugnA3wULdkjBlNQ5g==
X-Received: by 2002:ac8:5c8b:0:b0:535:cd9e:c12f with SMTP id d75a77b69052e-535cda02393mr140894431cf.32.1791952736388;
        Tue, 13 Oct 2026 21:38:56 -0700 (PDT)
X-Received: by 2002:ac8:5c8b:0:b0:535:cd9e:c12f with SMTP id d75a77b69052e-535cda02393mr140894301cf.32.1791952735942;
        Tue, 13 Oct 2026 21:38:55 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b755c35sm116809651cf.15.2026.10.13.21.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 21:38:55 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 12:38:18 +0800
Subject: [PATCH v3 3/3] arm64: dts: qcom: Add INT2 GDSC to Kaanapali DPU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-msm_gdsc2-v3-3-f1ed69014416@oss.qualcomm.com>
References: <20261014-msm_gdsc2-v3-0-f1ed69014416@oss.qualcomm.com>
In-Reply-To: <20261014-msm_gdsc2-v3-0-f1ed69014416@oss.qualcomm.com>
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791952700; l=1229;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=0e3qRwa0eUGU6w/ynL5P+jJBBY2ZfPskYSfmy+rlycY=;
 b=nLHkNGIq+1409C7efOjQ0ye24/TubeCctCYnlKQVPsYz4IWDslnDyJpqHsNg0CNmnDPIMIe/B
 fwh6QCUJ3sDCMgX2JuSgar0OF7ybsgzRqxuAEjSZtu6uNll7w8rGO2h
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=YJcKWhGx c=1 sm=1 tr=0 ts=6acf0761 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=GwFvbCpr4qPuEswRa30A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAxOCBTYWx0ZWRfX1yKMvXMgeGQA
 44iqTZzO3dZc22DL5hiuF4kJXjFXdCrRNBa+rwcbYCqw99BIhjRbBjR7C7+oRS9W+lwla3PfQoE
 ndhCTbCFW9sA6y0Kqv9zTuGdqobsa3M2nAUSa6clm6sSczsNnSiOgjvlKsmhsDmwSVEFrm37emL
 02Q93wXwSq4Vp4wIlHaSOhJtxaIaLVV5SdLsXdzRW8nowtkfsV7q4X5EEzECa8KWb49LIVTLG0g
 vGAGKMFYtRnzn7wo+uXbC/DaFZUUpe5QtLZypeH33D+BDt/C5cNp10MthgdPdPRAjsAHBbTlHAo
 PLLA0v9Hqsvxz+XVKF6tQClF499+Y9lBP9qrAKwTPvfPTRTK0HdJDpcm5Ym6dXDvJkATWA/OVDG
 z4Nh91PUxSPhGzvYNvqHv+BBhXnSWnxJdgTCBM3j7B39U2j2HYGBPeS0JSFrO6pNIOAgVWwXaAs
 Q6UPML9iGAFiancQ/Bw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAxOCBTYWx0ZWRfX3xm5zPZvzqql
 wqLnCwsQ+A1WmHHc+8owHJeAWbuF4KGGeU3HwTYCbyy4tkTN44XdXpC/TTAY+RCnl/ND55Ga2/+
 mnuYPrsF/IMVrBK9F/kSBlkGxa4Dz9g=
X-Proofpoint-GUID: 5VdLyAQ6tlIjnBqh-scH7rMfOI_d1qZ8
X-Proofpoint-ORIG-GUID: 5VdLyAQ6tlIjnBqh-scH7rMfOI_d1qZ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140018

The INT2 GDSC on Kaanapali (SM8850) powers the VIG2, VIG3 and DMA5
source pipes. Without enabling it, these pipes remain inaccessible.

The DPU is supplied by both CORE and INT2, so describe both GDSCs as
its power domains rather than attaching the DPU directly to their
parent MMCX domain.

Keep CORE attached to the parent MDSS device because it also supplies
shared MDSS hardware outside the DPU.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..98d367b9dac7 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3674,7 +3674,9 @@ mdss_mdp: display-controller@9801000 {
 
 				operating-points-v2 = <&mdp_opp_table>;
 
-				power-domains = <&rpmhpd RPMHPD_MMCX>;
+				power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>,
+						<&dispcc DISP_CC_MDSS_CORE_INT2_GDSC>;
+				power-domain-names = "core", "int2";
 
 				ports {
 					#address-cells = <1>;

-- 
2.43.0

