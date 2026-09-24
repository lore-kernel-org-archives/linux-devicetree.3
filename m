Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CEA49F122
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 16:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266350; cv=none; b=as5WzICKWqx4JPhqcFQaUXSS3G2nMomZuh42ZopcHyl5NKvRqYbUf/OlyjS2ZGdzu7eyVkZ6DiH7KjemKVT8+a+aIFo0srN1TFpGGr1ftVTTleXJJULL548Kf6Ls47zf5bcegI4y5Pk+5QHgbneXBIn0zuEeIJkArDfImtb98aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266350; c=relaxed/simple;
	bh=5zuG5UuS9qh0d8OU0nqDCnaVm1PSJ5zAsjRRiz8X1y0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QavW/xq+IuxqOTpWkBH3pOdA4M7G3Qzznd16Ek+i0uMSQNIaWRjGz824WYezsxMjFG9maNWV65dWhCsuVLEpwvzynjmrf2Mfa9oiNsrND02xB0faVVhVw/ye2K8GeaMVl3iMZAf02zlNjhnwon98kO+Il+1gc5g/9oQZOgxfKIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QOs8ohX7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z1ItwsFk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QOs8ohX7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z1ItwsFk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OFfM0b1279159
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 16:12:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=netTNOSNf1m
	B9nADQhFYC6zCCWZF+fa/FiwvU4W67EU=; b=QOs8ohX7LM9//DGcmwub4dRv3K7
	3+N4VnmrV2hvdhLu7UrxXuij/QndINHyZifyVNzKTHXMYHbTC7jWpN8GfnbygLjv
	qnW24PhK28JRv3D6L1ff2/KUtz1iU4k/Meg2IgI74MbhwXyuEns//YOsKG6Jkdro
	yDAInmzMDlIf1ThnMkPpzocl91pE47ktOgsRpmJafUaJpZBbAM55XHlwUs2bJ9G3
	TCCjhE+XgUbo0nT04l9s5WE0I1soQZACOR8K38lZHdTPJKnyRb0JK+eCj+yG1F3z
	SBxLVM865A0zsgToiCa77D+CpVMzODbr1+C78te8PIUktJaLRAtCfNDPpSA==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1sc9jw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 16:12:27 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-6711a336db0so84579d50.2
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 09:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790266346; x=1790871146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=netTNOSNf1mB9nADQhFYC6zCCWZF+fa/FiwvU4W67EU=;
        b=Z1ItwsFkkLHK+FQ7AQ3LvyBr6Z4kTVz5NCx5i5qljM12quzj0mKsaeYMeVTiG5Ibz8
         6nhi6SIbYaaTNuYTBeAYUzyQ4DpoRp8xzjJfHzED9rjBh6x/0skZfC5dFvhEVhaTc2QG
         sd7mRkEDvtUdGdOqffuLNXmPsFLm9UvdZSijJJ8lJQ7bGEd+0KIqtvbLhQLyMQagESL7
         vnIWp1xiK/CK727VY6fG79piyaaGUp6kPvdNFPTKFRPum/dKlrIQ9GcQYgIBJe/uT58n
         AH9hNnJKnHXGBfN+C7tHSFQIgrc2hwLV/o/wXK3rcxxNDd58wjDPU3wOM8knKaQT4wxb
         17XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790266346; x=1790871146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=netTNOSNf1mB9nADQhFYC6zCCWZF+fa/FiwvU4W67EU=;
        b=FofjsoHxGWALtZRoA9S38Kc5lYUqOmvFZx2QGlK+lJChN/07eclFq0ikJlZmxnh4vT
         XFuaC45uEwCpmqTmLZ/6QTkDM8ZPkunXaS8mnfjm3PXDIEUDzWotb1T/5ND/+JigvzVY
         aoHaWCoWZfCCrN3MIeTlEWm3npHjZ9DU2FwyBgB7V1xTTSyebwxXp41sh5AFrhF6RmuY
         Ded7WWwagTfcoDsAwhsxK2XqI6H924APT6NdyM5wyFz+K4WsNXdcZTezrB/HgFg7dOBb
         rEXOdez/05kevYRt9uTY87uC83lV4rd/WD6De4X4nErsTp+GodtCkfKBe+2iH6ZLXLyJ
         x7Lg==
X-Forwarded-Encrypted: i=1; AKwUvByz4Wh1KfHs5sywSaa0nuBHgaIjeZQKgC3TiihXqOBZo0iquryizYPQ61zq739MSwC1xJsNLLXNy72g@vger.kernel.org
X-Gm-Message-State: AFuF++lofYqlKp55CumE+9M+F7AEgRmino1vA1aSN9A+OTiWNUDD5WTs
	SV4gTYUJMRDcq9j45zaelWKr2NooXguy6FULnHfqrVdt/FznGFPVbxg85rdvRTnLlU3W3xkRVqz
	CRZwPVZDfTsIuaKL5v59Z7tCsfqHG+IQF55SH2A2Eva4H/021oBCqWVH76lwXu3Ya
X-Gm-Gg: AYBFou2ZrXQUW+2BjqhTeIJqjn1LQjX/swpSMFG3jeu2FXmbPrHIV8AeH6Q8oqdzAYp
	4XhY4AvEtEaGdvU+VBdNrViM1TnosFvxmxbM5t0PHLqQ4aL2Bdo2/ND1fUAsQOSvodao9XbkepM
	sXWJY+I4O82iHo4+NF18JaRrq8MR8o2/f8IXGr/XDCeYB1x7U9fV0GgwP0Xum1NDKOWJHPc10g8
	dZULz6oA5UW1S2XHupLLFarc+zFtup91cYhQeKoYt38gX5771eYjA+B0D5osJzw2ZBRygniGyPE
	IdabuOUtiY6JzL32B68RFlR2ngYFyWcKh1GCwlKDE7LFh6NY4AFqZnDUSnEnQ0KXXwmAx9s6xlQ
	ex7QtaCQj0TXEFXpE8OoHxVTDd86yYUZ9wU9F5Zv1fpj6O20d6vi5A7mqE84=
X-Received: by 2002:a05:690e:144d:b0:672:b007:dad with SMTP id 956f58d0204a3-672ed38252dmr1795590d50.71.1790266346169;
        Thu, 24 Sep 2026 09:12:26 -0700 (PDT)
X-Received: by 2002:a05:690e:144d:b0:672:b007:dad with SMTP id 956f58d0204a3-672ed38252dmr1795554d50.71.1790266345547;
        Thu, 24 Sep 2026 09:12:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91425cd8416sm9698296d6.17.2026.09.24.09.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:12:25 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 3/3] arm64: dts: qcom: sm8750: Fix videocc clock inputs
Date: Fri, 25 Sep 2026 00:11:52 +0800
Message-ID: <20260924161152.1162301-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
References: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WlsomiZSBF0cwIaWxMs2AZ1L-a9_MQ86
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2NiBTYWx0ZWRfX2At0OhxAktRq
 AhE40JIsMxPOhyhqD5Y8C9NENG23QARcALJcCyL2JYdzAqOaDpZH7Ww2Kwog2g3WrGl7ooBw3+E
 OCsWeTGFobpagBLIhTjv/PRlAq93280QxLIRTr7FC2OfrwomankU53WzryVmCAVaWsAIpCZPdwe
 IqnSSPb3MfCZ2ZJEptwSH8mXOi+jD4tZSDmBKHV1C0nDmS57MxjZdmInqeGBRlpJ0YpxQHWVam6
 ILRVhvRPGGq8uViry3xxgY4Q+F3thLkK8a/5Qi8NTb2hNfgZDE6pwRZzEjwi3a23TFjTYQcyJic
 VRHcoHBGc4z00g+zxwaqqHzkUI1vy4JUqMxEewyQoSChXnCuERj7fEiW98v64fs/UwIxQ8216lJ
 xMJEVeU19KGzV734IEqBVv4+AxJpcTxYMxQ8k2FaZFHpowVx9n+0Y+DZxPCa6QS/AwgpkBXKPzd
 2pdhqSE+3pXfhhuObHA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2NiBTYWx0ZWRfX6cJbmui5o4A6
 UzQNtMXpH/ToB3yqqAB0yhgd0BiMw/yg7Jk2Sa3AY3UK5//Hl4dUGBVVXTVwoZOXVMTY/gAuDNm
 C3RisjqRgcvK9aszRUvh1bJ7Uta7yeY=
X-Proofpoint-ORIG-GUID: WlsomiZSBF0cwIaWxMs2AZ1L-a9_MQ86
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab54beb cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=dhDJK-fFnsGTkC4caXsA:9 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240066

The videocc node passes GCC_VIDEO_AHB_CLK as its second input and stops
there. videocc-sm8750.c declares its DT inputs as DT_BI_TCXO,
DT_BI_TCXO_AO and DT_SLEEP_CLK, so the second input is the always-on
board XO rather than an AHB clock, and the sleep clock is missing
entirely.

The missing third input leaves video_cc_sleep_clk_src unable to resolve
its parent, so it registers as an orphan clock and cannot be rated.
The AHB phandle in the always-on XO slot is not resolved by the driver
today, but it implies a parent relationship the hardware does not have.

Pass bi_tcxo_ao_div2 and the board sleep clock instead.

Fixes: c0d11ff90475 ("arm64: dts: qcom: sm8750: Add Iris VPU v3.5")
Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 28cf22da854d..e092222fd8cf 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3117,7 +3117,8 @@ videocc: clock-controller@aaf0000 {
 			compatible = "qcom,sm8750-videocc";
 			reg = <0x0 0x0aaf0000 0x0 0x10000>;
 			clocks = <&bi_tcxo_div2>,
-				 <&gcc GCC_VIDEO_AHB_CLK>;
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
 			power-domains = <&rpmhpd RPMHPD_MMCX>,
 					<&rpmhpd RPMHPD_MXC>;
 			required-opps = <&rpmhpd_opp_low_svs>,
-- 
2.43.0

