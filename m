Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F11448AE04
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246502; cv=none; b=IR6X6zAUD7Sqh+Zl7ohGtSO4DPs/hlpyAbfkuDG9CNvC+icH/b/KxdKVoicwd01WnYRrus7wBSI0TnZIlRiCXxzcQ8fHb+ze/Xy1x06xwhnDawYlf/ycDPBZpE2pCNCDs+KdAn2gIjSF5UlzKx/JZTzIIxOilRMcFx5Uc6URzDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246502; c=relaxed/simple;
	bh=67xdo98Lw2n5IQ4QNQeBtdkFwF9GpDdKirBYMES5dEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nBoHM3CdtXNOleMScOQW6+nDu/2OACSFwX/QvV3rAE3mnx28LJvmmcluBVrRritC0Kap/a8RnCwuFQ7pVqwauj9IYwUuhl8t4ii7s6czeTVKSvdKinnB7bPezn0yqmoJb4gsRhqQfv++RMVejDydwRL/U2Tv4Axuhd76WL2mRws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Et6B9Fh/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C2N8kv7e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Et6B9Fh/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C2N8kv7e"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PN542919281
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:41:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WZKEwiJKJvvEwEp770Bg7jSOR7ui/EKT5qHlpiE7oxE=; b=Et6B9Fh/ZgyWgkdl
	btIIeXweDR2nqhOJrByvH90i2JVQqa162MY1Q45Js10d3rrCTIrEIJYJ0kaGzFbn
	n+MyF/ldGjw2gikYItqvHolYqD5VcR3sjEre7KvsQIgjHEBGgIeQJz98tXZS9f3n
	37yuT42E65YhWNaPRpAChVFzX90YPZBdeu6jQpcUOFuz0KcFvg36es9LdioCb5d+
	u5MoCTX1omEu8izo2y9yirwtLw+aD44IZ+zWp1yngBvZNNwye9XU8ihJZ7+ZVZsK
	66SHBY8sqDDC1K3aT1BL1LIaYkRKtTqOC+Izi1KcM31yOxUg8zKDNP0WfPvT/vqa
	DYNGOQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvstuj4h1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:41:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a0050a554so354682785a.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 03:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246498; x=1790851298; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WZKEwiJKJvvEwEp770Bg7jSOR7ui/EKT5qHlpiE7oxE=;
        b=C2N8kv7eDMfYPpwC2kBma1qrjViRKvRMbyP3gVWPqnBJZ3P9kTay6b30lXE2KyrRqV
         t4rWGgiQPkeZQZu7LaTv02CBQbqlTVM+q+BkQxWGiqpIZ73Y5jIGoSa5bAWOZtO98rYS
         yrVWF2zMyDX83XXMU2t7yG6mLAS9dJYE5+GyT0IOEA8+oLicuf7O7kFiNvL1Sb6jtpA7
         t1bipimMrcK9SSobQDh1cZPTPSyRc8kRG0xGvuwJAiicRgGkDv8S+XPiX48KO0NqGzJa
         wVtFmigYUcmCSrG/xV82pKWYeXMWylO5CqdBM00IHM+ROVp4z4fDSMHyxmHievqBrCIR
         dnUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246498; x=1790851298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZKEwiJKJvvEwEp770Bg7jSOR7ui/EKT5qHlpiE7oxE=;
        b=m1CEIty1EWajqSv5RuOPQZTJzYZPHWTgzlHe3i8/UIp2viY14zT8vDtB3QnwchUhFk
         jB/Q7JK9E2PXjZLxwp3upqV1llY9GKKUOnqrX+1blLV3nDwM3oLAfQrOxblRgpGh4h5b
         2OU7eCPwyCdivWT6zJ1zKTMuZjAT2ea89psKyrELd+rIVce33Vfj6epPpXmtdGCXXQ/0
         UurcgPSfPcvIVAJA3/25fdunCq6GBwqWjF2ah5YekSIBNKwipouC7+HRHD9qpT22IK0B
         TY6buI6GwLgehWiFiIOfk71dU8E8dnOqqL+OPRe3eobXj4B9PE+bc3XzhD7KDN7Fu+n6
         m5aA==
X-Forwarded-Encrypted: i=1; AKwUvBwhFRLs0clpXZiik+SS6ZL60RA1oVF6D1oaRa7ZvA5H4E/LqH1VIHQ7iXu4SJQqC66ZTnWcpsQv6L0Y@vger.kernel.org
X-Gm-Message-State: AFuF++kVf2YqOWt0mbrwBVjZF2WZlg0HRMvgAa8h2naIdLVB/tAWkSRq
	RtgZ5GSICm3kHDI56W07ViPDj0OKwVdL4pOMImR/IKcZhKqSrDpnt/36hQPgG8dTSJuxU1+lAuE
	gcq9uWw7R9z41+cPmNNW1SaG+/zPcYB0VmyuFqYjRuB1fYokgC32+J3i206G5mS/f
X-Gm-Gg: AYBFou1bj/T22IAt60S6GZezKF5HBapmUNos0c7LxkTPeU4kRQba36wXopp+lFW+lXV
	HK3mhK5roo5sbs9mawVBUUjzM/jY63Q0538u5iZJm1DCZzT+xxA1+DJvMDBrgB7TGeq/AlE8AXd
	Y/x+oEUTjXyeek4Ic+db+Y/szQSVPXf4dGwrd/ypFcpl+iDrifG7AnlNdYmgOLVbyiu3emkrEP+
	5jVrCfb1xpBhwclN8+xjdEPdGBih1PrOeUhLAWALamblWdhnFiNq2Tvd19qjPjrjJU9e1BMAydu
	5pAyL878AFHvtXviQkz/RG9Uv2bCC3NI2fgMbA5IV/b27woofORJk+BXkpIvslPrzuHi8jaLeD9
	OJQ0GwhC4
X-Received: by 2002:a05:620a:2951:b0:939:a6eb:735d with SMTP id af79cd13be357-93c3624c7acmr229120985a.10.1790246497408;
        Thu, 24 Sep 2026 03:41:37 -0700 (PDT)
X-Received: by 2002:a05:620a:2951:b0:939:a6eb:735d with SMTP id af79cd13be357-93c3624c7acmr229116585a.10.1790246496699;
        Thu, 24 Sep 2026 03:41:36 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:35 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:47 +0300
Subject: [PATCH v5 31/42] arm64: dts: qcom: sdm670: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-31-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=920;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=67xdo98Lw2n5IQ4QNQeBtdkFwF9GpDdKirBYMES5dEk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP34ajY1tA0w98yS3hw0XA27huw6oCAxRCgr6
 rsOJnKD34uJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT9+AAKCRAbX0TJAJUV
 VneKEACELGI47loMvflyG4FFK/wZKy5oxDtS9aF+vm2ffCwbL9oyfYKp7vnIYFcOUuwHyvdi34/
 2iZ9wDdWPtsnj68YN0/qhjx7tr6DcCSzkl40v8R3L6zqBg0SS53WZ+JTv0uFekXx0lA7D6UYdBY
 JdEuOZQFXTPCZifDVrFIZ7iJNY57nhdi7bVJ5rCMcEBz0M3SWr8gyD4om68++E5DcJE3pULIiin
 A6cBNT4V5xZ7lHSaRH8lQUTIZegUEP08dwkDt4eB5YnlCk9beE/lzGMpDBbdIaVVgRV64VM3+ot
 DmTBr1A/e6ezp3zgfVt8jZ3iIJibVNnpiuSOj2VMWHkyLsdDoIr5cwuo8GdPuFyqWwt7i73+ghj
 ajjjSquI+nhK8MQ198kfthWRAEm2fjDaC40l0J6wFpwrhvDJl/TfON7X1odUqZFsZ5YFGRLAKQ1
 H0I8/Ed3Rp3kJosw8gNE/xdu7dGRbCHaKkUjgszKNmIGvCF8ys+UdwkcFALmgWajhHUFpJ42F7p
 ft4xMOupM8jT1IaNpMqt97XnQdX9fD64MCZKYgHEtMgtFuIW95d83GLdSj+H7aLNkRvAYK83v42
 v+44wI/MAQpDxG/8LzEtWr9LOGYcJQCFznwt9UrPaRP5saWhfLMoYPhUOoPf0v2pdJlbF6HYtZT
 Ep8BaWr9+VzghbQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX46wDT1DGvPHX
 CLXkPqWU8vW2LsIYFh0ZrXNBMeBAfaEU258o0I8YzsCX0oMHopPXTXDiHI65qvwx3daqaupilSp
 jyHZl27pVER9rs0KK0+ycRnS4DHBCrQ=
X-Proofpoint-ORIG-GUID: tKVt-fqmpWl3Se7ev2vPy4XGMDnoLgmN
X-Proofpoint-GUID: tKVt-fqmpWl3Se7ev2vPy4XGMDnoLgmN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX6UAwi+4kDWrD
 +KutFnwrigR+kVAakNqlcHpPquzpEeZ5L5+fR0RGNPTywuduv/lZHs5uvUpmbJaVsHk7sVRiLlz
 IXN+L7Ry4RxdIa0MZtUuN7KRZthHjEcu6mcMqchsXdjsrEghju1PjcdHz6PHoXzeoMiRLygBULR
 9QlcUu05+LhQpE2LNrpSfnL/eT2Mn9DxdstCBFa2FxCNShbO/QFtR5A2zXvfSpYOM0oXKCFgIvz
 6Y9nVqmpNXwOCSwp4x5BD5je891GTAs6XVBl/1BWGWtagnZXO5+LzF60bAKfgGtoaquELkLCb8D
 Ea+uPpLbY1AYddLIxHwr79IGFRi/ojlfzMEqRmIRPsmA9Ik6oPCdkDjr7IM8XQS3/r3kiQng1Xs
 /PAwmCgdKQmrqMK8sGprF/Rrj9QwR5DSEOvzbtFZg5PEWmyhmIqTloJSs/GLT6g+llJsuu0eFYp
 K2tIYpjtqvDRNHhEA0w==
X-Authority-Analysis: v=2.4 cv=cKp1IVeN c=1 sm=1 tr=0 ts=6ab4fe62 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=82sHzFGN3NSTCjlL1roA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

The GCC GDSCs on SDM670 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 5c60ea36f04a..1978a54db23b 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -626,6 +626,7 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd SDM670_CX>;
 		};
 
 		qfprom: qfprom@784000 {

-- 
2.54.0

