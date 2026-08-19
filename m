Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5CA30C359
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144009; cv=none; b=Ck+tm2EQ1+Swqea+g2NO+ipBzpNT7p0RvZnQMSBziQ/DV+USKcq8ONcVofoyt2tfNgoX9UaVsGTrcyjgFqzSIm7hCDrKJMrrQrCYWeJoJPqaNAnFzxJ/Qy+1O1C36tqlZhkwIf48JZeEHgKp04BtKilxzXgBjINvbnOO835UcCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144009; c=relaxed/simple;
	bh=pxpAVZiQNGg9+F4l3ZammKWyfBzQ6T6mo3lR9dWZLn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UBuFsjJTXYHK8JcsqJq+qsD/aSc9mtmFfJPv8w9EmWp9pD0b7s7uVaRtv/w4FYbyO04oc9OEY5v5N/WprT819fzafGB0y2/FyZqQXDnvpL6gZmPdh+KDiiQZQOMXfjudefqCKKfITsHNT11/uDk2JV62kC10Y+++wTW3fc7bkW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QQmI9PSI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tqmn4Wga; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QQmI9PSI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tqmn4Wga"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JClZk9342036
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:53:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yB8oxZxfV8vpmBdTwDTa+cvxDs3cVLZHGqnfGQA+Dtk=; b=QQmI9PSI/8Eg5wWL
	U332pD/r8zMti3t8oVnIl8tH0Kqea9uOH/GNu27QityBGdLGNDRmPDpg8JFTccEU
	DG+3jtoxu6anEWj3VE/AZp8Pjn91acn99cFBpVKy1rwoVvsuzh4yBsf5s4wdQiIf
	uVR1BwQ+Mmqao74/Y7e71cNBR89K1fi0Bam3frI5+u/wVIYKniv8TJJGHMRxK/K1
	SyIYB/XoDohO6eMgO9VtY0KvlBZQ1CBBzJZ1tsjlLGoD1dBulENcGwRx3qqzWbAS
	MMUhcrM4EUP9+OCEk2lC7tZQR4F9I/YlYm37E4LJNduTTgymnG+dyPC5YXJtvRvF
	Gy5l+Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkb8ry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:53:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930edb4362dso106460085a.3
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 05:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787144006; x=1787748806; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yB8oxZxfV8vpmBdTwDTa+cvxDs3cVLZHGqnfGQA+Dtk=;
        b=Tqmn4WgaXJS3IB6K6LDdS63vTg3jJh0+68GhDZBCAh0uJK7Sarbr5ncxc/lu1zsRaN
         g09On4FhlxiZDS8SrJSXYey3RPOfUBL8OEZLuWT1vQ1e2EBJUxg8hDhkdL4IqksP3NDA
         ohTb53IO1iawZa0/+imNpeUHSw4Vb8pFxkSTqVFUcY81lmyJg2FNHU4fKODEki18lbJY
         Wx5vKEVcgmbj6b9g+IVaj16kac5/TPvPMo6lmQEhpt6+U2gXBOGU7rzp2GyXE9KSYl8g
         3QyLV/8qC8TmTTV2JB6Fl8OkOSPiie2/E0yMWGnX2NPDSjILDUVxkAq1ckGyMoFLdhUs
         XDFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144006; x=1787748806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yB8oxZxfV8vpmBdTwDTa+cvxDs3cVLZHGqnfGQA+Dtk=;
        b=VdOIIOkRsGFkbtigsJxQpftu0GuBmdy8jB9UVF86+XPHGhz7Vb1l1HfRcNO30ajUXG
         nhkn+iaWvpDmf3mvFaB1NdbD+Q9ZgxhSBYVH8dOmlfQzv8uUos6ly+xEidxt3QSpsFYW
         kszfDlyneZRhn4rK3TolJZaXEPhiyz+TLlR9L5GjGsVhkq4Abx6a3WEsoIMD2XPZTWQ0
         S56qeWzCAVcuqhhOEdtB79tRFb1cbIZiLRhesm2nxe+8t/OD9LfdjmO0e43Em3hy0zWO
         sjFxqZ+i3KfGpnwJ4gXcptExx4k7heeNvXkAIWBHITM/Vt6XX3aAl+J9QjxM1gfgGbr9
         wERw==
X-Forwarded-Encrypted: i=1; AHgh+RqAeN05T+kYfyXkwxKNvSh1VEkILAEuMULdhQ0LZ5yTFhvG19fDiIWBDyVXYSQsnWZhBTKktWxlZIGp@vger.kernel.org
X-Gm-Message-State: AOJu0YyPvFuiyaq8nJCkIrZ3Pz9hIK21DS5Uw7Zx070PlvuysIKazDsG
	Cf0KHzyro60meOgLS0cR73P5aSL4Wy8nJIFNoljYyWZCuoM4aaHU+kx56GlXNzWi56+FXBrdAei
	0AKZMTtMJ7SJGRiWlobdgKuHYvXmTrHTsm2/MHOGzLgHNITmiBi+O0WZncYMBRAy8
X-Gm-Gg: AR+sD12dZ4LQKgx4Wfa5q+A1V1cvKD9GBXYAME62N5lN7knNWZfvshlu/tq3jPE0dc3
	xevVWMbOD4JBxua8vrUw0Ctu32aL5zYQnA3bziPbd0b+pobO5miKeb8aRbXswVrkvzE1CX85ibv
	hIRclDYLksLG5hx/4Y+uaPZrxnFKFkXdpYhQolsLBc/eWvDCz9i1yN/D8dkLb9xzC5uw9a2gJV7
	TVEeN4LLRNfGXe3Nx+Kr6n/ATEqa7kv8kR9HTwnpIOfZWvz1gpEyTYxGw5/uFhGd4DOevnFSS3n
	K/nZg8fvQpIwk79yo0ld2eplq6pUUiBFquF3QCf4IJe7stm66ZC1tesBd0Enp4ewVYG4P5sDdYm
	E1zu6sKEn
X-Received: by 2002:a05:620a:800b:b0:936:dc4c:3bf4 with SMTP id af79cd13be357-9371e2d1713mr447360585a.28.1787144005622;
        Wed, 19 Aug 2026 05:53:25 -0700 (PDT)
X-Received: by 2002:a05:620a:800b:b0:936:dc4c:3bf4 with SMTP id af79cd13be357-9371e2d1713mr447351685a.28.1787144004914;
        Wed, 19 Aug 2026 05:53:24 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm77954795e9.11.2026.08.19.05.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 05:53:23 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:51:50 +0300
Subject: [PATCH 05/16] clk: qcom: gcc-sm8650: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-qcom-tie-cx-to-gcc-v1-5-840034124e73@oss.qualcomm.com>
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
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
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=842;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=pxpAVZiQNGg9+F4l3ZammKWyfBzQ6T6mo3lR9dWZLn4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhacCKSwHh6ZZEIRCB5+1S6mvgUkzNQPR45nbm
 HKtL2tA7R2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoWnAgAKCRAbX0TJAJUV
 VvhWEACtchiXx6Vhd8xL7AB/T3iYzbeBOqwQGToEEPUFVWJXotLfKtXp9wO/nzk3cMD8BQs8ILO
 +2gCcv29T/ot63WVWvEGU7kABi51IQN/28h7tcFAGNLvq8WCa5M5tzvFZBket0NsN0pU7cZuSjP
 1fb4Gl4/uhVc4AFL9NpUlHQ8tDSj5043kPJNaCTtkCtsXc5or2IxkIVqRpdGtPY+4lB6HXnA9pm
 pRRzfHsfIvWnzd44LHPV+X9FMKT+XXoIcBmmp9kKVbrmVtaR8ia0NwqpSYWTyxhf4lqytgI/Grt
 OWjkexCuvNRFM4qup95q8noSJXTf9EG2ciXcvJXWWgKXfcZPX3UEbdd/qfh80V3nZbT8iLHXuFV
 /6PtYVy6miADe8TV9aB3NaLvnzlrlbamWEym546HXJSBklJ1Xa2ovJb/iJkLXmBbH7bvXAucyE4
 t4tMN8v4HxM1IQ6sJZgGkwTb4aXlOXHrTwLDDRkH22HHFa10nQoxMSPlvWO+xVEpOEzaJyg24RA
 /3R76RSMNfuOw0tooAz2YM291L19sjhHFcvueoYid38H7WbYXYb5HSUWpoq0M3W6HD8E2G1n0iT
 budXu2eJkTn5gXxh0JMzpO3RvtSVWYCWAm3gLufcES8g/48CBcdXRqzT5hODVXFGdQF+eioGPfS
 frdRZP3Y4VlGgvA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: NZkq5j33-QmLUVHvyVKI5QeSQcDDbnxR
X-Proofpoint-ORIG-GUID: NZkq5j33-QmLUVHvyVKI5QeSQcDDbnxR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX4da5HUpvlbZq
 vnnUY8qTZ5ESpxx+Z6/dg+0dfsOG7y5tGT5tX/t7LLgwa0E+iPIyv1mNzQa2y07gnjV/t95Nw/E
 BV2DG3NTWQ9FDTrDVYFERpS+TYK7wzb3zKxmfAqmhfTTi38c60wh8hulg0M6DfGZ4qeBGp/EAjU
 lnUrpzzOHhonO1DEezdAGRdAo1T6Cp+29Mc0HAjV8MXtmindA8dYzhiGNWeVGzlwTjJi9JGorJ+
 s4U7XVTd+IHrmKl7oXBMl06efe+tsC4Gj4QpgLamPp63mBvUFjYpAmHlQIF0SYJO6B9RwnE/b/g
 8Ep9NNNYIXYAVvQ2UNhFQN7xPw1G0AiprNta/kuLHa9mSety8SRWgZ0/PmA1aukYf3gMrvbfTKV
 RB6X1bNfficV/caviyvVgJloy09KBSZkINCOZwNocmQCkOhpwytTk//YIPflv16txCodyUh8drd
 jfaQOBWRQ36BGkxpZ0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfXwJygcdo59pvX
 m1JkbQNQQeqN7oYao7QRzIabDmrYhogdpXjCOzw+IkP+AywX/O5ptUpocNpo0syALtGqnTOLA94
 EwuY3H07CpbG60MDXjiho0qoDOJRJCM=
X-Authority-Analysis: v=2.4 cv=fvfsol4f c=1 sm=1 tr=0 ts=6a85a746 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=s1Yi9tfhbzEvHx3U_YYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190100

Enable runtime PM for the controller so the common GCC probe path resumes
the attached domain while registering clocks, resets and GDSCs.

This lets GDSC consumers propagate their votes through the GCC provider to
the CX parent domain.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8650.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8650.c b/drivers/clk/qcom/gcc-sm8650.c
index f7e2d7ec60c9..b5cd4e3917b7 100644
--- a/drivers/clk/qcom/gcc-sm8650.c
+++ b/drivers/clk/qcom/gcc-sm8650.c
@@ -3784,6 +3784,7 @@ static const struct qcom_cc_desc gcc_sm8650_desc = {
 	.resets = gcc_sm8650_resets,
 	.num_resets = ARRAY_SIZE(gcc_sm8650_resets),
 	.gdscs = gcc_sm8650_gdscs,
+	.use_rpm = true,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8650_gdscs),
 };
 

-- 
2.54.0

