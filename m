Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100CB413D69
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572527; cv=none; b=nFTLkzEkBrHuYm3iJhyolJ2TIjIXjnd3tzE/N3E2a+KCJTeAkLsKfUl3Ty9I3MqXwl82k3X+iwoeoIqNFeqlja9useCYur9jpmi6rxDx3ZnOhHzzsxs5YKAgbmkSQoz/jfdeTsFK6mxI4/PHfpN/nm2da4yqlEMzDwp87+YWaoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572527; c=relaxed/simple;
	bh=7uWaiOYG6E0w9tRAZQPw4yJvrzhGulLN3j7SoMA1qvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NrpXdQqA4ZPjGpKB96Mg1Q/26r3bGC4YsT9Eql1mli3IM6Vq6GEvjeb2coK+D7w8ZERb4jA1jYW+bhVnOQLVpiEIj8Ee1dhkhH6mlWctBtont+ywTJrLPq4blO3YGkw+7qKuEzUVjnUG3WPZNwdXUYZPvV78cbyATNgppmU20DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bmm6tqyZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MDVVLojW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bmm6tqyZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MDVVLojW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMepA3407080
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TABm0P3UMKNtQarNWziPpf5uHr62vIw/jx+cW+tqSy0=; b=bmm6tqyZ4ee/jVYU
	YPkdgXa/p4Z4iV2MiZJPbUFLuBdZ8o2AHpQf1A7B4rsAIMK88NhFRXPbAkU63oup
	HnXFD7swgRQgbKAqdgb7tgY4TswXxqKfq61F6Ahoqp0P7MEjMCaCJ01/xO/YT5mB
	xRRU+zY0oQnCAfROhd2+prv1w2uj6ZYLj4fIYj0otP54/KFsbjk8YfIn5CfH6HcI
	LZzr4RADK/NJrXwTWuS55OW8mm0mVXusU/9gg8hX7Zv6G6aWut//5Uu4qQNQIGft
	O7ViXUMBbS3dTJfmxsTHxww+MvTpPJMq5V3GN4ladLams7RIyJyj6r24eUzc2XfS
	TGrrQg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8jgk0uem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:55:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d7886cdso69828711cf.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 04:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572524; x=1788177324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TABm0P3UMKNtQarNWziPpf5uHr62vIw/jx+cW+tqSy0=;
        b=MDVVLojWLkQt2U1iynAJeL+k6FP6DGO6JO2X3WPwwoYtbHFXGzRpNJD27eG02GFHz8
         yzQX5WHfAyYN2l5zQ0QMtGCG7PNjKCiedlvbK8TYLbC9HsQ+tkCuXlr4thOyGDsKBf7P
         QBEK3mFqw8iOwAzOi6KzoeNreg4Z8x6HK7tx3NMF3/vW5mvD78e87jZf8+tlzAzwe7IT
         7r8norfqgf3KV5XQGk6Rv2MlZc6baczpqoI0ADvgjhv/+9Kkf7wX/YY6n57bZGaOZit6
         7gjkJ09w/DL6jMN+vgh5UX1gwotqlbaK+Ia/wkGtpgj4jXiaaaxSt+6DMQuQuQE5f+TX
         m+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572524; x=1788177324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TABm0P3UMKNtQarNWziPpf5uHr62vIw/jx+cW+tqSy0=;
        b=GaA0gybTeP0GVdvpJHe3Xq9rl6Wd8uM5zuiM0R4P3n7oBtlHw5kIREa43Hr/v/FLsn
         vZG0Pz++1NK4fc0vxlIw+mbLu1/aIMq3+KTJPcCfCjvLnPHf/NATQ3vmnQjg5E1L3hPO
         IcICTl929UPXJB6XW3A5X9bZx7MFM2LaEraET7fPw2t55FAdx9vOG7+VJCFyKVujYYLP
         /RlICKvoTKyy6nes4Zi5ttRGbMW4cro9hd/TGxrJ4jwUBKZeANNP/kIaLdZe+MwBqLd9
         vJe2p3ZONFFRIyPp6kvQaBqFSpFiueSIa5MSC17dAYS3TwlOfdZU0hdlIFHvG6hITUVH
         jwiA==
X-Forwarded-Encrypted: i=1; AHgh+RqKannV3NGAe7S0eAoJrQC7YiTQQKdO9AbGS1AMw23AmMuOKogFOfoIkV0cAdBZ/dcqpLgWM+PSwCwy@vger.kernel.org
X-Gm-Message-State: AFuF++mTerj+UhfXFzVLTZyA9kLl31WMReQER4nOiBdpENglVjX/34qJ
	Juk/tuRLRSU1/2ncjOktD8GVgsxEoIxt6ibGL0IPFgcl7kpYWwaWPang2YkJudpaBBVuk4AJBtb
	aYwTJ53iORRrKjr1nX6fRhPrrjHfNsZWf01BrWPvnEMUFj+xPZGgvOWngw4RpsbXF
X-Gm-Gg: AR+sD12vvadcXu0xJ2V1rlUb6CqSU5sSBAYPp2LCzdQH/JQVQK0ZDpeotkvvdunxyO7
	PBlyFrYTmc80YNk0xywX83X3Yp7nCyIgrIrgDfL2aPDgwaQHPpPmLSEe9MXvhnchmsF9fXzEHUJ
	cDotCQUleILm5LxeZsNZUrKNQONuQML3zCJSdHwZ2DTC6WM7vmNcN7TobGuUwOZaphboN3LIHZP
	EweVFwgLSlX24ldmSNWqHOerCLOSKe9LoO0KCFaXEyZiB84HP2tk+udYzTfH1W2B1n4vLd7bu+h
	fXvY4FxZbyo3Dhsj0tIz3ZVm9jh+Mo+6xjhBBC5j/VM5DPUbr8SsImkrsmdKU9gfCImrhGvgU4Q
	qg+R1FlIG
X-Received: by 2002:a05:622a:4d03:b0:517:2c1e:8b6 with SMTP id d75a77b69052e-52e09d0619bmr191668851cf.38.1787572524193;
        Mon, 24 Aug 2026 04:55:24 -0700 (PDT)
X-Received: by 2002:a05:622a:4d03:b0:517:2c1e:8b6 with SMTP id d75a77b69052e-52e09d0619bmr191668341cf.38.1787572523714;
        Mon, 24 Aug 2026 04:55:23 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:55:22 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:00 +0300
Subject: [PATCH v3 13/47] clk: qcom: gcc-qcs8300: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-13-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=775;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=7uWaiOYG6E0w9tRAZQPw4yJvrzhGulLN3j7SoMA1qvo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDisRW66w+fFyq4Z5mZpVTxpIwMAhKPma3jc
 MULkvQpsZ6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww4gAKCRAbX0TJAJUV
 VmPND/0Xflnx4gdWZRUX5C93RaJThabvoDwxpyOdYNMoDNbYdWncc+gcFggUYxcfbf5Yx01pKZw
 PO09QcDiJbHrR/Ls2yKKxmJ8lSMOnhgwSBVcjHpoc1ZdLAC76In/Mgos+ESpYqXkTKhd5LxMsCJ
 Fobeb1PWDgXlvVQlnLH2z9O8ohETcNVaunl+ugKpGwTtmllG167hUq3CLdaBzlvBADovkU/UqWs
 oSXoeOByTv4kNAKhg1nxNhtT0cNrATHIfMmgo64C/Z05oRTpiyQ42h8M/YwiKdkaXvxjgr8u/D5
 evkTl9Xnz+1PgRY2PuiWfUkTsVzAGwYN6O37CT/eZSIp/XQnaQzKp+OKq8uzvS25OoZdktXFWGN
 iFkeO7DDJyj6AUzbwItL53DEzcX5wuAHCNLW/ww8Stk52mnINho82p6PgPJ9JNHDDWJO5klF3IY
 uvWaKf98zq6g3sERb2UTb3psaW2krbtlrhzs5t7CQsVG17opoYzpJafOpPgEqDBHxSXiTw/Wfmu
 FGMfc0s7F7ig8fgbaHDAwciQZsKnJ1UvAFId7MPRq7oUpren/r6MbydySSRN1jQIkLmjN5UdUXz
 5K4IarUoJEQtqh7Unign2TfQUDnnwQy3R4Mrew1Uq3k3sU8GyciS7A/mpJMPyUKO2W5MbGdVsbh
 jazHVviaD6CiLYg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: DOLq6Et7-Y6AUl_UE2S24UFG6ZSqHjip
X-Proofpoint-GUID: DOLq6Et7-Y6AUl_UE2S24UFG6ZSqHjip
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX728NHyNtsjNp
 hsvkp5HKj56wnd/7I/poHOPI4E6xBA+AUKGm0tlJlNTG+s0qNYzzJLT5sIXqzlJq5JfdB4/+Ec9
 mfaF6ksSYEf91B6rmcH+8aFMNnpp9ZQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX8HaNxfqoNqMj
 hNtcockKlbVwyp0lqrBNFcV5wEq9JS3nBZFAxfdNx7VimcnbRSPUPGxReNk8j0HVn/zzQr89hXK
 Yf2Bl4FYRJk/furPrSQsoVEWXHusZ9pXqN3ApY2vF7HFq7NVPDULp2qcEOL81fnrzZJLHjwk4/3
 Rs8ApCN73zAsIFNYPYN4iw68r/30t2/cBk2x2zkJAKGYbSepw+ZW1aXk0Euki0V52wnKWAW0Lv9
 fWBbipRvkpVY7U2yQLip8N5aUS7aQEy8ZBjDWVFuUyxg8F4NfUIzCrjayzcFYxIGgIad7FlvqsR
 LkFZgCtckuM0TC+rP77O5inAYzGo4WjDR5zCQuVdY0QIAQmWz89qsFOaMeGBgd/97jzEVGH3CPS
 QRI9yqoeo06FgN7F862o+NGItExanhMkl0nBcBqPOZsmSnK1A6dpoMRvA87Lj9E1jsF98bnyN9U
 IEy0dXSmsEjTM8U3Lhw==
X-Authority-Analysis: v=2.4 cv=KcvidwYD c=1 sm=1 tr=0 ts=6a8c312d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcs8300.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-qcs8300.c b/drivers/clk/qcom/gcc-qcs8300.c
index 146b3b5dfead..d04980e4a0bb 100644
--- a/drivers/clk/qcom/gcc-qcs8300.c
+++ b/drivers/clk/qcom/gcc-qcs8300.c
@@ -3681,6 +3681,7 @@ static const struct qcom_cc_desc gcc_qcs8300_desc = {
 	.num_resets = ARRAY_SIZE(gcc_qcs8300_resets),
 	.gdscs = gcc_qcs8300_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_qcs8300_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_qcs8300_match_table[] = {

-- 
2.54.0

