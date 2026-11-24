Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527034;
	b=MffM2erJz3OiWhVODwY47qQ51xLR/hDesBqvBtinE5msKU/TQKYa4clMmSuj+TE3o56q
	 pheK69sDmYBWayC7XszIbtZxtS2cRSSyekA9jtGflVvkmGR5Al33jjPFE1y/uqx3sxFi8
	 LRLBgDuwJlkZ+GBU/Su5DshMafOWNk7r1wkpXNhV7y90gmctcLO2Mttw+EAFd/th/sOBO
	 ja5yxaelujOZ7XJk65zoDoKu7FqEEspYO/zCYBmfx47Kuv0tKNNhuU8bMVXaigrjAPyVM
	 3lvxhhW8hvW1YuMifjqW/DTFxKO9FTiyMG5I3IRqErY7CdC+83DVNOWZQIbQtzvvTgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527034;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LkTmPmwoE9TvZheDgfVIeiBbBVqnSljafHMjO7Tou00=;
	b=DpN99BiZy80nxl1FwAB/qs+QNFc6BzkfErNaxM2M0aeziZnykhgNaBfTGWu1C8C1bDsC
	 ri1mrVJseC05/7NbW/kq3gs5qF+78Elnuei2s/cM/q/cBgU8pptN0gv1tgI8ddSe9WMM+
	 6VwpHckVHKl/Klst79YuLndlcafmiZ8w6wiIB0Hv6QwhaFH0N2yt84ELWjIzsL3xOdDBH
	 6A5iY//BudeHsO80In+kICCDFtPL8VKA3/qNDpMBTWyKvTQcg3dR8QHD4RXlWDBR5p4XD
	 YGIV3q9oo5fqIp2tmuiuceJbvKNyWzU9mUrvowFdwhahmI0StVZsKxlNcyk8j3nMr4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RQK7mGxi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="W/npoRZ1";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DC2606A327
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 13:30:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4DC2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RQK7mGxi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W/npoRZ1
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAub0Z1991582
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 13:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LkTmPmwoE9TvZheDgfVIeiBbBVqnSljafHMjO7Tou00=; b=RQK7mGxi01Zl0xYj
	tvNOj++EndxGDQcCEX5ecs4H7w+1isHh+p0G1PcgdXKGEb6yj57e2t5ehyz+Hj+E
	49UWkUN1ScizDM2m8tjqZI0uClA4Sx/oB84+lJCRnNmVRi3ll9BK7GIDtWTZklnX
	by+5xKo3gWYPfGtw2r9WJ3y74ZERNho0phXMEH1F115h8TcOHMmv4ZtWFWz/jJc7
	yLnU9Se5G8iCg/XWZjvHlHBsIpyZ+HPXN13IHveab7n1dlHn4vkMdIC7bM6FksxI
	QI9YGCswpkpbOFBt/BWPejuSWQ43xEpI1mznyhG9Y7L9fChhyZPZ023ZNKBXbcvU
	XuZ/Xw==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4w6suj0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 13:30:32 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b30b51e441so2225407b3.3
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 05:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795527032; x=1796131832; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LkTmPmwoE9TvZheDgfVIeiBbBVqnSljafHMjO7Tou00=;
        b=W/npoRZ1WhnPAG4SdE/SByRngP5MOZbGyePKY/L9d94eADb1UYBZgsZcHXxTTtOPrR
         +mm6iKFmvHqvbInlk+LZAYef1R6HbbyoSj5T5mOW5F3e7aDT7iBjrSIuZ74qMoRlpREM
         sh1CAXMiR1WuKpQP+K9MfbbgAZiJdxxyrVeJqkv2JWtyGpQAjqSXjoZMuUTi2kxEakHI
         VqLYTHAMtigHNkgK30pNCnEGyC4OXGMrqduQXGiTGZZRGnZT8qZlfLxHrD+43HvIzno6
         zo4hgWjfccHzeZEbj0Onw4Yr6FYekYqVtuvyQfMnxuX4Iios8+uHc58kC9nTgxGeJ8Wl
         ccwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527032; x=1796131832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LkTmPmwoE9TvZheDgfVIeiBbBVqnSljafHMjO7Tou00=;
        b=phSy0b8+lBCzL5M8+zKSGWsBs/od26wX3gMW6JEUaozyO3WHbl8pPUFDBHjZiWvmIu
         gViOK+UsXA/qE5O8FIwjibuam5ihzTA1FHo500wQisMrtwNQgJcb81fGSkkUU0+hp2cp
         1aZc0VdFansPTcJsessk7hYPAjcjNOtOeUifLiAt+o2XbCyPaNz7W8KkHgAE8GjSnEZ/
         3zCazrnACOg0mm0mQXj4u41NHKfJAKO5mRtHoZoztiUA/8ONW3r9T5JttFs8kj5RT/he
         q/fFQSKDKLg2jMJC+7SsLa0SPYMFqeZUI9azrvAwYDxWhRaknCoxVyOMWZGpY5eg0eNO
         D6iw==
X-Forwarded-Encrypted: i=1; AL+hErHkWNW8Dnel6PYY+u3JVL9SL0j4l0wzcoQdZzfSbpTccx911UBllorOxBBzu2aJJ/XI8N53qxOI5NX/@vger.kernel.org
X-Gm-Message-State: APuU4Z/qv57VkBVMjFKKe+jRUfBCEJQWaB+6CXTOUcYmrpocCmJq7dEn
	2MGIwKXXvV1yXTlAFuDI4xoBwE9vWTckgBpfVqOHAtGylCrDcFIfUmast8NwY1v+CX9TJKFmBQ/
	N+uvqJyFWYDcUN67a4geLtwyfbWEkzqpeXK1KDv+O5Ak1KVQ+hjzmlm6eKaxKXg51
X-Gm-Gg: AZFdTZfvCKwXLLMqnatq3XZirPenDZggZN7qXh5pmoZakov9jAikrWucirqhL/6qZI+
	fzCPXzOrePv61uWKXYgvkTFaXd9ZLhzKBiq+SI8vzmOtl3mZhGCob9tDb/KFPzf0tqOC8WX/45N
	O5rl5SHZQ0Uvs8QYYPCX8vkglcx7sNsuoeDUC620FsN509mnpp6xZEVPQ1kzD5laFEoGwcZOtSl
	6eEOBzZO+UqF89l6IKfnuCP6snSRqUVkbDgkWo1HiSFnJUV3h1pWV/76Bvym/bcbsuE0udOpRcA
	ovaZxwrgoZDeJOlUF3ApvT0urEndGo6vzKEzpCT1qrXbIXLvitan/uNPX3yXj+l5afwxMVfBxjf
	MVsq9mztOvyGGSdLJ0x23thxEKq4On201aZYWXpnR/AzhxBlSmrDxwkmqklyepfq4IepLYftNi7
	g7w3GGASw=
X-Received: by 2002:a05:690c:a20e:10b0:8b5:3352:774d with SMTP id 00721157ae682-8b5335277c0mr53453687b3.0.1795527031861;
        Tue, 24 Nov 2026 05:30:31 -0800 (PST)
X-Received: by 2002:a05:690c:a20e:10b0:8b5:3352:774d with SMTP id 00721157ae682-8b5335277c0mr53453437b3.0.1795527031174;
        Tue, 24 Nov 2026 05:30:31 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:a546:3db2:3be0:87d9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b1ed8b6a05sm11659080f8f.43.2026.11.24.05.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:30:30 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 14:30:18 +0100
Subject: [PATCH 3/3] clk: qcom: gcc-sc8280xp: Keep USB4 uC memory powered
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
Message-Id: <20261124-topic-8280_usb4_clks-v1-3-be083a711eb4@oss.qualcomm.com>
References: <20261124-topic-8280_usb4_clks-v1-0-be083a711eb4@oss.qualcomm.com>
In-Reply-To: <20261124-topic-8280_usb4_clks-v1-0-be083a711eb4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795527022; l=1334;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=CxLKX6YJtdQ2X0/H7/YrcqnD2wFzAKxM4o71EKxBqpU=;
 b=go1HBHtGZBp1WY8Mn7YI1qy/1ZPfk9jG9b8Dj4RgPJydxDIl/B7N7szYh6RHXMy5G9/tG5dFx
 I9eQ0T0fS0MDjVbq2W2lPGWl4iBLdJtPQXltcCIBjLrpvMFHMtpVQ3C
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-GUID: iWHU_EjzQXyovfxKleu0VDlgVEpByDip
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1MiBTYWx0ZWRfXwqyfCeHx62bf
 YqnYxX0rxqzaOwZn6l2kFY443AwhsK+n8Zg9u++/SzEPhFY165sa89omykcngWQJ+PW2S5kTZhg
 pdr3e8a/X+egIR0vVKKD6uWv7uvRyGs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1MiBTYWx0ZWRfX1R6bZELXpnqm
 UgbEV8V/2Fi2xdAAGJBoJsyjVZgOicALDsHci8mxF6OaKLKcu9zhlG/g1Sg3S2Y5wGcDXl9mGWc
 JF1eZK/A6Ikc6P6ov1WLuZRt/Gu++7pIylLS6kiqa1eNDYCN0Eh/HoLqroYEiKjdV93bK4vY148
 dGFNCCP8pRvBUVj0ZDu0o7w1aH+IzHm5c8oOCu9Tx6RbWpk13bWYRUejHJCmGNk6vSvqROJeKoX
 RIreu+4vPy9+BjTrNkXsrIMpmjC0+cviL+liE82XpSNL5k+jX7dm23LzPmUZpYlxOOVpS5u+bfq
 bHcBkRtfseNdKdUKY59baAJDCffe+YSeeRYTKN2wf26i+t3M1rNOzDHZvBAniGeuw1ue6FTt4Aj
 O2w5VQsHisLK5Lh0bkuDnKm7bMYUpxm48ngAFySOFcQ0RA5LIaFm2LmSyYo9EtpgYUJO+FqFm+Q
 Xvp7tjcd8TNU7t8B1+Q==
X-Proofpoint-ORIG-GUID: iWHU_EjzQXyovfxKleu0VDlgVEpByDip
X-Authority-Analysis: v=2.4 cv=V8DoQuni c=1 sm=1 tr=0 ts=6b059178 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=e0QnMNc9jRWkZ8z8M0MA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240052

On SC8280XP, the USB4 uC's RAM contents may not be retained correctly
by default. Set the corresponding signals to force it.

Fixes: d65d005f9a6c ("clk: qcom: add sc8280xp GCC driver")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sc8280xp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
index 077dd28610dc7b2a43c358a99317435c42ded970..2191e27626efb204cf171db4575b55fb2a2f97c5 100644
--- a/drivers/clk/qcom/gcc-sc8280xp.c
+++ b/drivers/clk/qcom/gcc-sc8280xp.c
@@ -7541,11 +7541,18 @@ static const u32 gcc_sc8280xp_critical_cbcrs[] = {
 	0xbb028, /* GCC_DISP1_XO_CLK */
 };
 
+static void clk_sc8280xp_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	qcom_branch_set_force_mem_core(regmap, gcc_usb4_sys_clk, true);
+	qcom_branch_set_force_mem_core(regmap, gcc_usb4_1_sys_clk, true);
+}
+
 static const struct qcom_cc_driver_data gcc_sc8280xp_driver_data = {
 	.clk_cbcrs = gcc_sc8280xp_critical_cbcrs,
 	.num_clk_cbcrs = ARRAY_SIZE(gcc_sc8280xp_critical_cbcrs),
 	.dfs_rcgs = gcc_dfs_clocks,
 	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = clk_sc8280xp_regs_configure,
 };
 
 static const struct qcom_cc_desc gcc_sc8280xp_desc = {

-- 
2.55.0

