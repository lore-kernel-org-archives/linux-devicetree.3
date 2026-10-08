Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8064445AE2
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 08:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791447071; cv=none; b=PDJocn605HgsvkOsIgGnY3az1qzEFPNKGSqYg6OAey5O2bdL0LKAurWSwzQJrFUc0Z4z+ZtnCj2wLNbtCz1VIEFgQTwq/zJ7xHdiRahmM9O+wsaVaa0/5KQHwJeyfIErRh76hjXSqXGF8irWqLAAKCAxv7gw8ikah8vMVOA1haw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791447071; c=relaxed/simple;
	bh=u/PW08aRrxDDpWBnDNET3ssO+UW7wTEeeUrFIy/d3z8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XqnsX7yKjJnd8sOqoh842uoWgugxW4ZHetBYGUSr/ALxas1dXK9YhBLj5MM/m1nB/KXoiOcr3oXBMkLObTUa33/xYnl4ZluTC8fKnIgU6WFUfJ/It7mH4t/whzH6EElc0JxQ1SZOd5gBqjJNqigM+kKAJ1MvbucXstPnn9qwr6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BuoCQLgS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IxyHufy+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BuoCQLgS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IxyHufy+"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987K48v2189845
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 08:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Xa79qxnOojd
	qdzhevM4v7FsqD+kJqqEikGCHIJRtyNA=; b=BuoCQLgS92IRygsnI1NQbtIP1wh
	JJlFI1v6NY0e247ZA3ROfD8RkDkb7tk2Wd5bBT94Uq4kuSiweRYicmcp3hWqLQPr
	mwQIK5Ck0jps+RiTEo4t3qlOxVxxacmdyTvyZfjz9pnAjvYE6io3qTOUGc5uiB/i
	8IVVYJ5zKHT9PYtQcDb9lfi4O82FYANZ3xzNPbQI7J3jgx3aS9kOD10s6BKCNOXu
	mpyjMvd8K2mGVjs4JY13wbNs+bts9ZgLv1/hK0dJBdW4w81VnYBt3NXvjUEoNGTm
	p6r7S+m5HkV6a8mlmD/hUXYR12dJ9N2tV2pfLgfCRRjFN4evsk8ppRKJGMg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe39tvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 08:11:09 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso9548221eec.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 01:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791447069; x=1792051869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xa79qxnOojdqdzhevM4v7FsqD+kJqqEikGCHIJRtyNA=;
        b=IxyHufy+JvkvrCmpUT9u69v54uU8FXqoXSLwwDWVOKjnTTlgYkiZonXvhOVytuoYuX
         IH6tXwrKbJEoAMzcJpop2QQv6x31FYOljpX6XjEfp1GK7KmC6CIrZwlVQnAVXdNHBy0E
         0b5T5PYHXbaHBsanQoAyHyccu/3hsqtbiGtupEizd+BuX4PYKsQBSltxOycRvaqU84xB
         u0cbuWLSK6qhR5qHoZA3lwuVWJOdgy3X44+ztCR3Lr1iYrybPF9KIvFWJ/EiALwwNxOp
         iQLUz7oIUrs9VYT0EBr+KrSnPf1KhFPmzmU4yb2qsux6nkIILdOHk/Xi22FuLPcdxhJa
         8kmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791447069; x=1792051869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xa79qxnOojdqdzhevM4v7FsqD+kJqqEikGCHIJRtyNA=;
        b=OhLpVFFf7DKEdejAA/4Ee6pEpYBdSPneSyKKxheWQgngXQId6REndupkQZL7/E6Lif
         5P141v9mMopFAFJ4wf71yPc3btxj7GwdKtFP4ArQ5fUfk0HwtGS6i8idd2YD/f0iUKDa
         1UBncMHdQKonQH7eOhXEGr4v11/fr1EyT2+jvv+IGxzx5fmIB08gNWaGkb5FODRI2GzA
         UIE2v9iaLBJbQh+H2QVi6fZOvua+lai9xYsNAw4w2rx0Zg7AhqTxSX9gztRIom5/1KEw
         S20mJ6gmM1pLryTAw/DEsiNayeHXRspuDLZ0pBL+Y/lpdOD2tdfGcEESs+T909N0XN5E
         W9Ow==
X-Forwarded-Encrypted: i=1; AKwUvBwyRROPrsrDzzwWehDKPx4EaBGR2rnL9dq/v72f3oWz0at54IfxC8Vhx67ndZPAZXpgQlpha076Sqki@vger.kernel.org
X-Gm-Message-State: AFuF++m94jDuzX6A7XBS3J+l8NlEC8HSwV6SbNc4PLLyyaDEAiPsM5Pd
	uReY+zbZBjoD3+m9gWD9IWBwHHuuc+nWD6Bs/+zGHDFpb/UJrtWN2HRQ/Ee15UA9UMPB2OEX0FC
	LLRahUKtL6Sc7hbZoXtWFB7kccaawvZUiNRqMGRu2YTPWB+PoNDhRBXPaF2shl+Dl
X-Gm-Gg: AYBFou1GphvlmFmhFRqrx+4RAu9lHhYxqYVcaycIfss8DicAcA6zrD40Q4IYp6y6B42
	hcjqnAKU9LwbUTXMoONKGXNgDHySzgLRhlIyMy/GuMQA2CJw7DY8Vh6Co+ONho9BKw6yDfL2LW0
	vGMB5fHAd/Rx65Nu7/awkxRNju207Gyl5CXbJmJILsfv1oXEp+cMvBNKxXsJIz9LO/JZtP5UT7O
	hsmws9xjDbt3u80qBBQqozQ2C1wiIRA26fJMLZpN/3htzPLdF67kCs9II8LOB+W3mVsEUcwKwws
	fKzO2mty1sHA//H/zhipziAf9dkHktL2x91ly0C6hH41FdpI7ua25PCztN2RTt2o06qBdDo0Z3k
	ypOCe20WbwBqECV2ccC0K8II4iaROTAEI5LoQvwgpArx6Xo7Md3wAJEvPmdQ=
X-Received: by 2002:a05:7022:fa4:b0:14b:992f:c168 with SMTP id a92af1059eb24-161fdfc675dmr7382762c88.4.1791447068530;
        Thu, 08 Oct 2026 01:11:08 -0700 (PDT)
X-Received: by 2002:a05:7022:fa4:b0:14b:992f:c168 with SMTP id a92af1059eb24-161fdfc675dmr7382725c88.4.1791447067829;
        Thu, 08 Oct 2026 01:11:07 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16166121f2asm14522277c88.4.2026.10.08.01.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 01:11:07 -0700 (PDT)
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
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 3/4] arm64: dts: qcom: sm8750: Fix videocc clock inputs
Date: Thu,  8 Oct 2026 16:10:35 +0800
Message-ID: <20261008081036.3492003-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
References: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ac7501d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=PKgm7S4WkqlbYhXdoGMA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzMiBTYWx0ZWRfX3Z+p0NzWFoNe
 xvwHcDAuPr2b+CUhXzkdY4lKFGHx37XSbJAbyruZfjij2So2RZbdS2lQ5Akn1eNE+xrV++qlRwT
 /EL8wDT3mG5kVcQTQRTltZVTPDSIuCE=
X-Proofpoint-GUID: 1RyLQkDH1absXcS5xiG7Ynykkm33D301
X-Proofpoint-ORIG-GUID: 1RyLQkDH1absXcS5xiG7Ynykkm33D301
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzMiBTYWx0ZWRfX3oAabwAWZebb
 MK22sHBCfZVu/8GFkaEKgrROwGbwtTPTegm6gMMZphV7ncQv867kP2zasa+85EWm18zd4/2MeJq
 2QoYSaDQVWLfg6TLahADU8BpCAA8pl47FDzot/OViI233fDJ/5/6p5y59j50ZkzC6BcCIgalW+v
 RkUw7ihZKR8uVg03oH6dD/HMvIFipHViivbFjoKeuvqlguReS+HU0LQN6yYAy3lX1wfENxSip7w
 8KFaNyGJXUuEXpGaJvWh2bM0zMRotrO4j53LcqZmcROTxE0G/3cYcYF7yS+8xyCWHIT8uTIdgIw
 04nUlt5RjCoH88StKcPmksAKCv+8cIyslxnTzI4KLLABY4KCoHiQ9XRFxW9io+q7zblZnxlJCG2
 btqNb5luWt6AtzDdtMThRMRiz6E3c3vie25i56lGwdVK84xS4nalsq+e3fQz7KayiGM7VKYystf
 Xi84I3DmGd6mQ5mKuMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080032

The video clock controller binding describes three clock inputs for
SM8750: the board XO, the always-on board XO and the 32 kHz sleep clock.
The videocc node instead passes the board XO and GCC_VIDEO_AHB_CLK,
which is not an input of the controller.

Pass bi_tcxo_ao_div2 and the board sleep clock in place of the AHB
clock. No functional change, GCC_VIDEO_AHB_CLK is enabled independently
of this node.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index cf947acc5760..678e6e167bde 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3338,7 +3338,8 @@ videocc: clock-controller@aaf0000 {
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

