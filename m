Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE45F372B4F
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 12:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776340912; cv=none; b=Z18Q5ZWFtFVCrKSgxeNsenZExcLeZ28h/sM5vvjll5aIB1Orqcs6qDkESwDC/N+79EeiFe8wT48U0Ji4lT7akF+GxQNsYeZhJgrgXRwZmPj+SQ5yT4Y/FMUjCp7D0vFocd4iPNf45Bx2HWNEmdw4xMTBLcHueY+poqpBLWtT8HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776340912; c=relaxed/simple;
	bh=VX5sSr67MU3/CpnlojQxc1yhq5+mYZkwNEH+oRw8f8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RINDM9Y7aeuspdTFaEhSNOswldPnWrZU0KsPimN2WZH3ouENuoLCrkDG0ILeGzwaVWIFjVLg27hYjvZhrJhPkYSnld9Dq+umE1UixzHTfF73n1vN7h8BCJy+7AG4JtVbaZO72Q5T3pzCxvxYNwCDJw6879bYVGyVDXIGlaXnsqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TlSDBoIw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h0TSbkb/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TlSDBoIw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h0TSbkb/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G90egR2979330
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 12:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GJ1T7dVN6bkDufKjyOSICvcs5KgSIPrr4Xb0nXCC/yQ=; b=TlSDBoIwKB/GqkZY
	jZLHurAn9G/osFtmtPUsRisXUB2Loo3YOHUya0j0awCXyS3APayJQNaQWzR7iDt3
	k96sTxKcDXnkDzKflGCg/4AaW1HVUGdezFA1I6wIV220zzpVVXwb3iTXH2JTJGuf
	p7LFOwd6d5sXZj8pjGDZf0WS65hbWwcX5mmRomnD12BJYjyTVDrcnTR91iyvyEgQ
	KnlkvnM5iFJGe1Wq8Q6TwEwc9HS9tA+zssQ0xBVTZx6HxpvVIq8sDj1APpDF0xg4
	htEfKBANs6Hc/3+ISTyuOZThZBXaaavT29r5saiKc4dmTSA5yhLmSgYN6RyaWMw6
	AOt6rQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djvru8krj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 12:01:50 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7965975ed0so439142a12.2
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 05:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776340909; x=1776945709; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GJ1T7dVN6bkDufKjyOSICvcs5KgSIPrr4Xb0nXCC/yQ=;
        b=h0TSbkb/7GfAT+5yAI9ABhgLEqoj72iWZS7Vf8S2xWS6sDBHpy/9f7SYcIfQqWmPmt
         gpjFu+2XPj/VculvW19iGqkMuS+Rv/pRZInys4o3sB+IbjCoF2g8l8Si5BH7lNJ5Xe8z
         efK6Tewhrib1bjrKKaBk41WVoXeWvWZ5wEbO6tTLq6UqCFlGrjDKKnSYwVSh54HwZZ9e
         AHYEAxawujM7vQdagaC8WqTP574g9lR8gozNBqChiHn495/k7kDVJH14ZafhZzuW25fY
         8ekHDUPzlzyZIgnQTJj5oMRifFWHy4aDVggjdoYt305KMwje/i/FK9VaqAfXGrY0tHri
         rJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776340909; x=1776945709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GJ1T7dVN6bkDufKjyOSICvcs5KgSIPrr4Xb0nXCC/yQ=;
        b=OFuU5MP/T98lGxfajBnsX0yjSWXscweHM1JzZ6sKz47VyamIuEMt+RYvid169omNKv
         jPSFZeM/AwlHfUh8RfgUuW/rbKoNIM98WW0DilMrOKxBENc0V0664bPnqxANg8kvDPHn
         e5+KIPrM3/pXe87dqubGYJWsVPt8YIIL3vv+M+cMFCeF0m0Ka47pYwGf7t7EE2iOd4vC
         2VixjjKaUHDKk3A9LkZLonK4k6amnpBq2Rn50OIiDLQ4vcfDPDNFKfXD/Ycr7UjdzXGk
         03jIrFd8UqrJJ3I/Jbh7B/dmr8qBz9GjfvRd37RJeTAzfjX3ZahznJFWaJjHos87OD/w
         iD8Q==
X-Forwarded-Encrypted: i=1; AFNElJ/I6BYbOScxv2FvMySxOnE+/qtNkauSzCaGicmDPs50sh9JMUcMpsAravhGX0jHJNvtdvHrhy44AyML@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6ylSAScPUgqBiyiQX12+91oQLUx95hyP3pFMhfJSOm9Kx/Zj3
	WAxTaxcwj/LbwENIG3pxUP2nRMy0nK4PNnPlUiNWGq7RvFb9FQ48wE6g8qdHWKQWf+yQklmTmWo
	GWqaSUExOMWM7JOA3JVoSAh1acsu9iTukXSgy515ZrEvvHMxPE+NNJ0wPcQaRM6wCDxTs+cA8
X-Gm-Gg: AeBDietaZL7AO7Q995623XcothOczDM/H1og4Z5kGtM95SvcXEPwQxocsVGaPPkLl06
	9zgiRWTNB++gqzRAblBxdAFDrk00TkVTTv2mswPvOaOC8QlvLAm1CFPGL7Za3a8fTGgK8/D8Nr1
	8ue7V3koRlc4ZU+nVW1VBt/MaYNxfTEzGDKclJ9xYuQ9tV6kdZnpiCDAMhw9nt64zUoaNR4vcMM
	D2BjEELDHESOOCrbAV6yScn+pXCBte5jBBM3bIJndOcOE4FilYovCNu8fu7qaNmHE90Dx9WFFOw
	RaLQ1TXLCCau6rEiPp1pO4dvlI5kd9cJlDPP2lvzDffl2eirnjPkbhiWRw1P79jIhLxqM4OocV/
	jIuY2R8qtprmAis3mA0b86hImfQJ615Em8lTxi32ide2EcGBZwot/YhL9dQ==
X-Received: by 2002:a05:6a00:886:b0:82f:592f:2ed7 with SMTP id d2e1a72fcca58-82f592f35f5mr10651268b3a.45.1776340908818;
        Thu, 16 Apr 2026 05:01:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:886:b0:82f:592f:2ed7 with SMTP id d2e1a72fcca58-82f592f35f5mr10651206b3a.45.1776340908214;
        Thu, 16 Apr 2026 05:01:48 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f673e0f15sm6335937b3a.35.2026.04.16.05.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 05:01:46 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:29:30 +0530
Subject: [PATCH v5 13/13] arm64: dts: qcom: eliza: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-qcom_ice_power_and_clk_vote-v5-13-5ccf5d7e2846@oss.qualcomm.com>
References: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
In-Reply-To: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776340775; l=1388;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=VX5sSr67MU3/CpnlojQxc1yhq5+mYZkwNEH+oRw8f8I=;
 b=M1qOa1hwZmKz1mi5IFUm46eqntN0RI7xEMv6TyeT4H3YLNyB4ZYvMjT+ilSsGkwud7FusKpU2
 haes6YfXDd9ACWrx4HGp4PkPp8JlraGY9WdBlte2btIV0x6Tx17VuPa
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDExNCBTYWx0ZWRfXxh7wTmXLR9+S
 tukaMBBBh3MSEGVSAOuck+IfxIbxfCl1mVYJUqlTGBrk8AhRDibvoup4Vk/dcuDSf6HCZWBSBln
 TvACPTFsZbJBIYP5RzP5tJcrtoIbVffEnKkqYdDKR+Cr6v+2355qWg0xKJqV+Bgxvy/smRVHsd0
 BpL156IgSYDz3zVYFOK64SovjOqrAqZFnkx1BV9XdOi+o8x1CybTnvChhQX8cSecEkGYFJNxhkS
 P0S03Whb6Iz1fg7k8dxfIkKPXVzaRfmQgtNQpT9yNi5dOwcIiRNTvB2fr2bofhyPcEzQuVM5k7L
 vz819ZxBFJbqG+JPGHse1jAwHOqwjAUIidj+10RiuDifT0ErxEJtRcE7j0QKl8Q+/lY+IF29ddi
 XtyUbSgxnhHzGhhrlDC1qLn0ucw/45Xr6cmfSedB9EA0TeJYt7w6XFrDyWSI0puRPHR2OHfhwFN
 YxzOS7Iq6M6bQiD0Ylg==
X-Proofpoint-GUID: OHmjpHS147wQZyxCYYsnPNdm5n9COSkh
X-Proofpoint-ORIG-GUID: OHmjpHS147wQZyxCYYsnPNdm5n9COSkh
X-Authority-Analysis: v=2.4 cv=GcInWwXL c=1 sm=1 tr=0 ts=69e0cfae cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160114

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core' clock
the 'iface' clock should also be turned on by the driver. This can only be
done if the GCC_UFS_PHY_GDSC power domain is enabled. Specify both the
GCC_UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for
eliza.

Fixes: af20af39fc09b ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 4a7a0ac40ce6..7e97361a5dc5 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -843,7 +843,11 @@ ice: crypto@1d88000 {
 				     "qcom,inline-crypto-engine";
 			reg = <0x0 0x01d88000 0x0 0x18000>;
 
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
 		};
 
 		tcsr_mutex: hwlock@1f40000 {

-- 
2.34.1

