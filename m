Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678897;
	b=RFCXSg0jmOV2+cRK9UV2rOpG8Emz1+arlvyQ4BrOTeIMuK5Zb/KGiRlN9GS222DiMQzF
	 xvUsePgAZO37oC2f7qDhQ+daMUDWP/4AwJ57ikEcPFKrpttDgLtYVtD+vH4Vj5waQCM7I
	 pqFG1D29mjDVXYxCrFXVXfjxOfYOYf1LLOfjQHqNg6bXBtlkC28b7hsc2iJBirxr0hYge
	 JVvofg8Eca3oQ+sKWMZD0CIiN+l/DWP+3OjNMxU0Du8wEZQHmabBAMoNjSjIfTykTEHiN
	 rWNJhklbaCBmwqdsubnrb0TnnGBmO+xVJp1X2S2xJUocsA98kUqPQYKaCNh4SsssHYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678897;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=T9jAmjlpPJzKEesHQGiR1/l1Z0EuOSLOuEzosz2QsKs=;
	b=xmjyKCiN13A+WcJpQOnOlDlT3sWfdfUXLRJEZtU5/oIupgvgNkZa4OfQ1Bnv4Sh3W1xe
	 PyrDg70GBbBfibHGUVaO4K/rWxR+or1S239EKn8bgQde1qqNglQx54cjLb1sttrJpMasJ
	 I2iVZo68XH62FOApIYLrGAflYmMtwptDKhkWhbEIty/89UCIW6+8bTDUvx+pcT7gZlhUT
	 VGxWqqYiJnPyxNbgUNSTjiMj9RxKFKwfLhcCVygU9mpKXLlR+22fSKKoi1Aqboq7+dc+B
	 Hiscl8xKQ+JIob4T/67z2CuM840D7OzpRY33b1MvQC/dOTPxkf2YzWc6FjpT1VrpdqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E4AOo+dk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HWFVF7Mw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489A3606A898
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 17:54:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 489A3606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E4AOo+dk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HWFVF7Mw
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEHpGu11146483
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 17:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T9jAmjlpPJzKEesHQGiR1/l1Z0EuOSLOuEzosz2QsKs=; b=E4AOo+dk9HBpmuCZ
	PCk3NfaPzeok0qV1FH4OUSz93vxqG/od7b6ejpk3HWu+wvReYZ6qR/7g/ZkafhE2
	x9jqvRNVN5NF83HdV8X5v/jrkaAVJXXoJqpUeTU0pNS1YSOltNyGvJvxBXtu9h1f
	hx8/PuxCSn9Byh3bRCkhhE8S0vyZrqzQFC9uLco4GpocjgAevLQSiYWd+xCenFWG
	nanQd3KN9t37qIJ2SuSeNZ5ee34+6qH0FuitvHPhfbd20iYxTfOXG021OW65xkdV
	pK1RbOswUGRern29wfkIwABwIvNM34k48sQ7WdnWlhs/DYVOA3gsV/YjUX7Xi6Ci
	wJ20yQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmahbe4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 17:54:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb7f9bb86so506072385a.2
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 09:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794678896; x=1795283696; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T9jAmjlpPJzKEesHQGiR1/l1Z0EuOSLOuEzosz2QsKs=;
        b=HWFVF7MwYCk6KV0Ux2eqY56CrXtsVARf0XTb/R8weU2MpbNESJ7Qq40y1QArvHBwh+
         E3BsKBZfMCVjFcv385Z00wi9ZxALLsSCoWFPaKggNTx/8ymowbuVW3hYEX3IjrXLkQT0
         eE+eVulF7/8wN5Iaz6oA+GCiiQAAqa7Xu09B8P19bpPgE0Xgfvhrtn6ZoWQziOUJtpx/
         VeYKWKErVqGGYoStO1ZVauaYi/XfCEvgwKsCaMgEoe8iXB6ZJG1ZH+DeBArVjSbhlz09
         mtMQ0JXPqav+lC3bc7j0iiaVco49cyvsYc8iQlMRMObs08I3DuljPJH76NYrDaZYt9cc
         FISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678896; x=1795283696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T9jAmjlpPJzKEesHQGiR1/l1Z0EuOSLOuEzosz2QsKs=;
        b=KiANIEzGXRdD/N9/rmcjyZsuncBvplF0TDKrRHwymLBi2zitJGqRSWnZsg5YGvkha8
         jW/K2kBp+reUm/hceaghca1+2mhQhIsWb0vVUGltT42amOTMVlDWhvp3G7QskwVlMoJc
         gd6CbuskyWE981d0/klfujaQoa0OJQSnOSyvFI4Bd9xGnLOK32DlXyHetdFA8HLPIe05
         akknFDUG1gxQ0ARUGmW9icmj1O5Ht38fex5qYBYFzO8aluqrAvo8Y54GfaQYV5r3/pBe
         uAmT64UlSRZ34S9jFCmsQSMz/th0LqPIqwpkU+WpYLcRjSblfoKVoSBYCaLFlJEFBqBm
         QZjw==
X-Forwarded-Encrypted: i=1; AL+hErERVyGwg1ihjpdtxBfTpu9hD81zNUnH46pt7gmn1P2moUl9oiPBEz97QrcmfE/r/DPECo8bnPUsdefk@vger.kernel.org
X-Gm-Message-State: APuU4Z/vDKH3Lq3YfB7zkZzJXIqBzJatOykshea3wUcJzrXv7PjmVi8v
	HHToThgJ4XiE+CdEe+sB8N15OB9wE84LQhJeVW3iPK6RJTj9OQmTatF/c+ncoqRwlo6oc1rQgyq
	1CsPxzxDFWxg6D08EtPT1Sy+GHNTtescKoJhsMLAYluHasCymdXB2GD4GghzDXzIY
X-Gm-Gg: AYBFou1SGjY+Qxqsqk06SnZxbZ0r+xx1d3MSVzvAfCgdrUqBPtM3zaFkQdQH/QP3veQ
	T4Po3qBmW3jOBCNldRgAgdVksqaKo4wmXCqBh+yEBTFoUIY09oZ3nAtML76Eavj9DK2FEkxbvgR
	EEA2sIqmKpHFpVWtP7YaBCVoZVDeGb/CHwYsM5gucgKC/ElFlaKkHY34v/bEIbgM44116MrPcN6
	z1CoFMLNNYNZvbqGriqLSiIye+0ZdjJ2AGRXB83vuZrRtdogwKVVGYB88jMTj+UnZwbIT77hN5/
	SQRgpjmu+Y+BoZc3PP9SNW/TBF1Q6BNgtbPDfBAgTwATvLGDt+ZH1H/JpepGDuqyNjsU2T4IohX
	KmBHZA044zsZ6xfxlW98nt2QnU9SGF1C92qhIDakKVFqj0sOHU0gP2KTdr3z/bAxlufjyqw==
X-Received: by 2002:a05:620a:4152:b0:949:6e5f:7395 with SMTP id af79cd13be357-9496e5f7ecemr179564285a.79.1794678895425;
        Sat, 14 Nov 2026 09:54:55 -0800 (PST)
X-Received: by 2002:a05:620a:4152:b0:949:6e5f:7395 with SMTP id af79cd13be357-9496e5f7ecemr179560385a.79.1794678894960;
        Sat, 14 Nov 2026 09:54:54 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c888b90d4sm11060292f8f.9.2026.11.14.09.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:54:53 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 18:54:37 +0100
Subject: [PATCH v4 2/4] arm64: dts: qcom: msm8996-oneplus: Disable
 disconnected DSI
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-display-msm-of-graph-v4-2-b8de044c6c1b@oss.qualcomm.com>
References: <20261114-display-msm-of-graph-v4-0-b8de044c6c1b@oss.qualcomm.com>
In-Reply-To: <20261114-display-msm-of-graph-v4-0-b8de044c6c1b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1033;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GCFRCKJTBF0tDduwhG+AEpuoFlapsyUUwKoJTS/2B/I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq+KBiwypVbiB/+sME4U5cLI8rqkqaraxGTw7XS
 AfLuhR49AOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavigYgAKCRDBN2bmhouD
 1wE2D/0bw3W8hvBUayS9i62tP7e+l38ABke7P4J+I+RrzXqTv4qtL2nDYgDgCdSaGdxPJAGDerh
 w2VaQ9FXPoE4vbgVdEnaKxlQmrWVj5T/8SXLJBHqj8lr0y2eUKseeMXf7lpcIsiF/ZY3HWaK8Aq
 YuzazYF/QkL7BHFWp/LmhrAAI88rJ6tg7WIqu8tgpoV60niC0JZ7/65Crz+ob5wgqGQC+wQg7+L
 ZmINWEkF0uGLGqWN5FcnoZiMDBpeeqFRwojEeYLeJXK4Bou7uQGD9EsK6J/qL0yV5tFgzgofyrQ
 ExiJ6q0yYSIGvHEdrM5ickJejK/QM1s7zdw7FnWwVc3WC6qjiMJDcP+OGCJIZr4IUZM4WpyMMay
 WZh8l8eQXdKtOhdjZPLFX6KolLmnThXTztldaiyrNV3CKI5epagPQ1sErtlsXQcuZZMbw4eJ5/B
 w/3e7y0oSekT/4DTdeGkGd25ZjLwsjKo2t03kREhnXdnUWZ+GJQUHYSQjTJLaf/Tbz+SKOFJkNt
 70JiMBzyK0vi9MOMrtD4ew1od/Nt7ffKgEXNUI6F7nkBjx+IYzPx/HjKEmoCuBcudPQB+xHYc+N
 JKX+XCiAiDct136ylo4tPlwzVu3PW+ALvv//ANwlq4G9Awn5SBSFIya9mzbHgynvCuX44RzB9/Q
 PPyp6kzg0WUSvbw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: SzL6ORwBg1ycZVms13ULfomIhLi8x9dZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA3MSBTYWx0ZWRfX234EIizU03yt
 TWDIc7KMKDU2luh8pXX+bYOImzMNHOZ7b++xreRuH2RZ4lm2hW48XCTpK2eRchOy/C+HjEmiZ65
 YD2T8Bw2EyXkVC8twMs971HNM3jZrF/p/T+UFzZxEWfTlNTPxh5j7EHslwK5OC9a7ey5DGQwc2L
 XALjF0fIxGlr9Bm58q4+KII8zMq9nnHtu/A5OvypnIYd91pCnzItoztb36FMJB2eZMLNfTbuutj
 O6Pz9FEK71TTU+mamlUD7Rb5gGTvXiZdLTSakylKkooNJYa367I8qYUgHmj0o7ch7RTzV2Rq5Un
 rUN/TRDp14bvtEBYGAktNu5odO2pILgjeE+Ecl94JlMumomttjlR2aSmmKp+cLYCcCZIV3kmwa7
 ZAtboXWR9VDTd+ZTHSCCzPRBPogvZbXI9SuURPbxDIca2h8hBEvB1LBG6FxZmrk6YlxiSAzY+Lu
 xcbwFtfPoTSECywG7cQ==
X-Authority-Analysis: v=2.4 cv=NdhzRGD4 c=1 sm=1 tr=0 ts=6af8a070 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=eMlgcxtRJz0w_Lr9rQYA:9 a=4tUkUnfIpJ8A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: SzL6ORwBg1ycZVms13ULfomIhLi8x9dZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA3MSBTYWx0ZWRfX5Ppe+Xk4Xo0G
 GWpd4E6tcGND6Jufld+2Wb2NfThHvfw10sb8uYVzNM0ieFO2c6adHYGkTp3BoABfGsLpRdkOp8g
 pBe44N6bvVJ8KLJeWjbOYqkmIIJq2jc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140071

MDSS DSI and DSI PHY are useless, when nothing is attached (no panel
description in DTS), thus should be disabled in DTS: no bridge will be
registered and no component device will be bound.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
index 7a3f8afae22d..9c2cef11e7a9 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
@@ -189,7 +189,6 @@ &mdss {
 &mdss_dsi0 {
 	vdda-supply = <&vreg_l2a_1p25>;
 	vcca-supply = <&vreg_l22a_3p0>;
-	status = "okay";
 };
 
 &mdss_dsi0_out {
@@ -198,7 +197,6 @@ &mdss_dsi0_out {
 
 &mdss_dsi0_phy {
 	vcca-supply = <&vreg_l28a_0p925>;
-	status = "okay";
 };
 
 &mmcc {

-- 
2.53.0

