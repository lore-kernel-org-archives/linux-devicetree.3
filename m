Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476D4436BDC
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 16:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783357040; cv=none; b=C9wtug4OGNNy06PqQAr8FAjwNWw5Aw4WIZ4Ain+X3s0DiIF/qT/QbjA50MYuBj5ItYw/jAdTnAAHeIMo1w1H14vSTZ7RJer9bV9d/a6pQQbRlMgVPS4OcnrFN0SZaVuBzJkvjFZwMww50vyVFxl+nUUNhvS1kkKMXnnJlF23u5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783357040; c=relaxed/simple;
	bh=08vr6cxy5ZZ+9RWNCtExcFI/JcQWlwcxowK+x8XsFaM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KyxePbF9Nx1EpJfh1sa326A+FZ0wV/ub0RBsaGvOyw556jRRnBINp/6/nEgSzMwt0JnHyJurhmE4/LBhuLiXsmsRnRU8WzBbqQ1Wt8U7uDzInHbOlY2iPIXAwxCucfBN22/V0O6c1E81GRx1ffTMQpoZkHzA8rqOrC//YP8j4M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NIwo0nFg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gOJVmU9Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NIwo0nFg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gOJVmU9Q"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF8rG990257
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 16:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IvXc0//BOtPwrceNXqPLWm6VM7eQI+cAM0eRpWoytQs=; b=NIwo0nFgjVYs78GI
	/xbEprZ2h/6NoCvaGe+APXZxcYLiTxHwSc9U84Y9vleZ0Q3wUIyckLMPG13KlSNP
	GRdJS8f+Uh8m/qV0Ucjboql6keAxSsL2OmRAGSEqUUsYHDC0ixqAaam6UH+2DWoH
	tzr9zq46NZoMilu4w6yUCLgbvGbV2/sKkjGGZEbJq9MQed9KKDmXVbj/WdNqfb9h
	ii4tG/UQwvukIeLJ2VACNXk0B8rtSIJQ+QIrHn8JlwGPZ+CS3/ItwEBGgl3MqMSE
	zK4u99GOFBZwUShmxllvKDVoM1x7doYcPSjnNem9iD1FmOkoJZ9K2j7ea9v8TDDH
	1VxIaA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gsyq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 16:57:14 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-847a00bcbd0so3893156b3a.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783357034; x=1783961834; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IvXc0//BOtPwrceNXqPLWm6VM7eQI+cAM0eRpWoytQs=;
        b=gOJVmU9QZCyuKe5y//ROiSlfZ1c7Og6Thubj/4MxcvllaMqKTp2zJtbIA0yBYefzpD
         5eAMiphcZnmkm1gqXhzFG1o5uUTne7EZJJFSOFUcog6gyUfFOs0JXgfoGHP2GGOpkAmf
         zaXYWlqsL79Vnv83g/XJR9VMcPIEhxs+G8eA1EycP1P876qnE0KoWDth09zGUQT8+cb0
         b0GKDs5wkLesmwoWIMGfsV3H3rmWOjBL0Bv2SS7Z8z6R40r42WBF7o2MPtbVYXfLMqxp
         cESe/wAx1Y34eSYSf5QgrPTdv39TOCB7bGWMT82DoJjsgw6dWL5aNIUqGzOZkaN0upi4
         6Z3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357034; x=1783961834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IvXc0//BOtPwrceNXqPLWm6VM7eQI+cAM0eRpWoytQs=;
        b=Aw8lFucsaxm8AOxaK1bcI4LBHkkoLPLo0vBfpHJ22LH2A1Ib5l/0KI+05E1pa6gZPk
         jFb0sabEU7VI2g/PA08QBHcYqTnqPU3y3icqF20/icwcacP+JCf2ZZn6yPTAwZ0ZJRWt
         nzJymwnVQple4etor3tJMTPT62DzWmxmnwjhrZwkYSy2eWW7xjE0c1UsSCD1aSZIJZUw
         5XMj9ePLhShllVRpXdXs82YPa8ADkbiajt09b0t5aWu5zkBrq4wWui1IeWJWkXwkRX9x
         2hQvHIkYWsaFrchcumLZyTpvHLI2GNE/5BK4wRwnefXE3m9TVcZ2MUrgWlFvz8VxhvU7
         sSYw==
X-Forwarded-Encrypted: i=1; AHgh+RpD0626Y33V+Rk42JsiaTe93ez0oAdn1fKNPQrcElF9bDTXvQv6eb+lPpNphxIAVNWatk2PiLM5tJlv@vger.kernel.org
X-Gm-Message-State: AOJu0YyG0mbrA9f5NpMDFiMtuX3TZNu0U6lOtjgXchcAkJ6xZWhchkzi
	Hc+U+OdrqYgxh0aP6ZYRrYlb4BtHfoWCBtqlpVsj4+LWzkYfk6P8ummrrYTQZcudr5otoWRCGfV
	PM7NO/VEAbCUEGnYeP8JpVR7C8d2Aups5Ye9zwWXgTlsFmN++OC+cc0WmEgublolg/e91gpTW
X-Gm-Gg: AfdE7clylNyla9K2p70JB1l7bmdL1n1sgX7xq0k9HTrotqLU7UZExLzdwLVt25zy5dc
	nmWivTKESwTjyTrf/Y9lY3wlYHgzvJq1xFtPpF1Bl1tCBdZ2cLqtXrArLiBDXI7gts1/NRGMM4s
	vRO+eks4M90eXt77Va1RWl8jJCd4xS26lPdxtX0eiGgZlhVbp/Dj8R2UAwMQ/8I6p2vOYtoztGa
	j4f8xmMhRcPgMWXMVa8CNNPpJJk3l36iBU4dzB19deJd5zIAftj9JD3UbVeAOFtta/Q5Sifm0nY
	j4ZhtXeleNJSE1QEUtv2ffeb6j481Vi83nIu44ZlAg4eMmB5DKpqsHndRFfSTItVI2w/sFqh2m/
	bO7aqcAFFCxxTgE0i9B7B85oXmshpV1AwV6oRj0D6aA==
X-Received: by 2002:a05:6a00:2381:b0:845:dffa:3740 with SMTP id d2e1a72fcca58-84826d1260bmr1409313b3a.4.1783357034283;
        Mon, 06 Jul 2026 09:57:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:2381:b0:845:dffa:3740 with SMTP id d2e1a72fcca58-84826d1260bmr1409261b3a.4.1783357033583;
        Mon, 06 Jul 2026 09:57:13 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb0efc8sm6960604a12.5.2026.07.06.09.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:57:13 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 22:26:38 +0530
Subject: [PATCH v3 5/6] arm64: dts: qcom: monaco: Add GEM_NOC interconnect
 for adreno SMMU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-smmu_interconnect_addition-v3-5-afdca0125a65@oss.qualcomm.com>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
In-Reply-To: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783357002; l=1018;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=08vr6cxy5ZZ+9RWNCtExcFI/JcQWlwcxowK+x8XsFaM=;
 b=xbqyKoHGYi2uTsIV/EYwj/ozpnriCZVKxtUa+xnUuWnwLuW5YiEE5ZRyyGolLyLSafYzSELC/
 dnYQyfyM39DD93cT2B+RyV3GBdtoOFIAmn2dbH9tad4yH++VMXsVxlp
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-GUID: PBfSjxhAl6-Tkrzz9qlFXmViXLcC2C1S
X-Proofpoint-ORIG-GUID: PBfSjxhAl6-Tkrzz9qlFXmViXLcC2C1S
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4bde6b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Jjng17ChVe8r-G2aFk8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfX6X3NTlND9i+0
 VoaMU0ykeqbDfKP3T+U/VDHF/cs+/vGKDI/4hgbCycb0g+Db9vEN3qCKHoSyr+lGAjR26frPki4
 fFO8lcHX4dZWLuM3+blxIcB1v32Ah2t4W/nN489UKqE+Gak7GJNt//H8UYY2pV0Y4WezbzP5BU+
 IdomPuWO1FXTCIGrirESDuC2VgGhsWo9acNOFpLVDvGrhX2UiIOr3Ea+p+c/RtZRhBHM3OGRXxz
 EUXZ3OYyG7SnDC7E+meYrtS2SmkRW7LX+mG0j5Y+TIfKJmzugguVDvy/JpO6CJns3IScOqHIUr9
 EJNgCfH5FfVnyWl9UkLQk7W6wj1rjW1hCCj/NV6XU8bN5GrxOit5KjnA9WjK+UYz2l12LvH4Cuj
 +Hx0ma6pL3L3h9IajQVAAUf+qASynpt79+kJnO+czmwKzpq0zhetIXchzSjyqMnS90/AEFjCZI4
 2F21U2791OkyOTtkYYg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfX83lU1uN31x6V
 VF8SUGc6UQrzHlPSTkmTg/i5YLw5b3QX3phcNYHFm++4CLaexepIdkdSpw3jNVRnhQWyGXoVCfO
 PRommqKhbk0wA6Ts5zskNjegtJdL7Ng=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060170

On Monaco platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 400c75437978..e3713c2b6236 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5117,6 +5117,8 @@ adreno_smmu: iommu@3da0000 {
 				      "gpu_cc_hub_aon_clk";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		pmu@9091000 {

-- 
2.34.1

