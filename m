Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0173C1F3A
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 05:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550838; cv=none; b=M33i+yyr3jMpXFyeL8zvY63kOHBQMWTv0pm3L4LCS5Xsas0dKzW4LqxRfQAn8980TwQNFyVmhewUKumwLfp/O5fTgh/sSwX/fBlQrOk/mtU6OHUbm4oBp4W4m4cdysTy5Ss2o0phwTG8FdaysLXxZhfmJ9mz5xPVa/R6cCSvX48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550838; c=relaxed/simple;
	bh=rLybFr1nm3KqTJtJoM4+U3ZrfAsIkDs2LbS3+BLktrE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HZNEWl5ihebnAvWGDSL4oz2eYokjFdrfls5qK6dT38s09LOIX/sMIRwCZlhMJzlv0NUfaP1DzVN0xWDj/hHWwIio7WvA7s5fHghlaJwRw6+23xsolkW+IXa/MtL9AJr7bm4NS7LVNiE04kcmleS8HfVj9WHFA5qIxIMM+2bDl54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O5rX6+eQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HQRHBa27; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O5rX6+eQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HQRHBa27"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6542MQf52368045
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 05:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PMyEHNl/fqkgrWTiyaG6A/NMiRKAiN12ZYqWIjYuh2s=; b=O5rX6+eQEVwIo6g6
	2l39rAuAiC4AGMSMLMnKQiien5YGJ8WOaXpi9shsijiHQm4CRITGTu9xXMYjlW4V
	wH4/qnAIgv4OXqkKdAND7dCYm5xpujpa8LuA3SgYcxHLhmKVpbDfEUuScsC2btpA
	5m95RekHKn3keX6hwRu0+sxprqwNBOLEEQMAG0usOSjZoL+t3lO5EAAEuqWlvL+w
	i2G0HZuna4GyPaReLQBZudWfI2HCwsU//VpBC7VWsUGeDpIqwXjf3zeP6VbP4u0B
	za3s6fR4uziLFsZ1MCu83Q7oLd4IOFRi5vfiKaFReriRPWnNJeh5fKlFDhZy5UbB
	Qh+kRg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj3gm5dc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 05:27:16 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85dcdbe502so279430a12.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 22:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780550835; x=1781155635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PMyEHNl/fqkgrWTiyaG6A/NMiRKAiN12ZYqWIjYuh2s=;
        b=HQRHBa27CcIwjZsbpdC+X0RLCJ/Obq+1n1agEZzi6IEDRDZm8tSvruMoeQKkeadz6o
         suU7Vsxhxy38jamKpnoPj+TtlQwKiJTGrT0rlQCMdoGfjxgC33gq5B3nM5B8BRsj2vjl
         MqT9/3s0zIigRreB6j2hfu63e290ndxiKNcGEs1VLeA9RetAi1w6JV4UI/gYgywa29IM
         SpCpXz/bDmeqAW+wB8KoWjv8LKzbDGk+CXFBKEcyGyVr+WWsiUZgiKJJ1RU6bu2QUwPs
         x/NXQtvgFDj9n4lKEm2+LMiAGR5KvFO4PIyexj1d8QtKH8FLp14GN6NqmuYdmMYf6lsZ
         syUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550835; x=1781155635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PMyEHNl/fqkgrWTiyaG6A/NMiRKAiN12ZYqWIjYuh2s=;
        b=KO1KkOqE6kJmJJ1AJ+F/H971+fv/CM5UDlcNlkeqvjuKtZQFwYhm64KsRei+yEag/S
         diGtRWMZObQLxOqNYpkn0beh6sWTYFerEDqCGYwlMBSx+FDqUbQpHRw1lj82lVzCVe9z
         Sz0g/lnOWHzPboc9HDwQEWzlVsqlDI+s/psXemHVIsN9ESNuylGBvPnEzStrBgERQBt+
         +JvPZtzdTjcsUvf+FUPOujb0AiQNajdW7zkJfWor5/GJxbdEnsY6XMvE2661cOwHFyNy
         67FhxHjznWHPiQXiM9SeDqCOpe7avEE5xl+Ckm+1dJIgxn4GghhWvxweyzo9EYsS3m0X
         WVxw==
X-Forwarded-Encrypted: i=1; AFNElJ+Xv0n/bvzUdWWD+o85kscUstcyt2mFGilCaCZR9+dCTeI7md8uMREn+ikNOjuXav3DHWsEhOzCrt+Z@vger.kernel.org
X-Gm-Message-State: AOJu0YynozRJmfXP5Kj0T2AtrAKebnCSAcIcHmSqYdfrEuwzlo8Oru/V
	LTLEiMW+Yf0eO9CvuyARrIWTzffwYWb4CZqlMNO5pLrPMQjKRqWKELLb524ab+8A8egnIHsYhzG
	0FKdKFOGDCaCvCwezk+9NpmbxUoEchBBDnDLfYDtlcCwqKftCEqupOPVMWh8nP4c+
X-Gm-Gg: Acq92OG7tgnT36gBMHMSxHg31xzJNMXe565qNZ8qhbtDy3Ycd5JN4pwayd5GCswYJ5M
	57Bf0+TYkOc79WmiE5kkM1ePZ03B0bccsfC3HSrCUkAQkEPNEfuO+7HsXfTbKH1RTmfE9I5/kdd
	tcor2MWQMyaXyCoEstLOGdJssMwGNn220eLN3d0KDLzdInRWKvicJ0gWNQz/XaGvdfJjLgewH7H
	GMd5goCx1gBlymUUpO+6NdGp1urGoGXvQumNoDUYYqM8MYQR0KO1CwlSWRTc0LL6a04unvGC1WW
	GDDhjT9DLdk1Aszx9RQf1bpLLkg+I6Yd2jBwZWDlRsMvccwsMvwwBuJI9wJOh9EFmfFIjGHDaDL
	bP3R3ViPnMs+yG71Il8NwkcLWiBHRmzEpi1tmDOucqFzFUh1bhh/rWtASJIAICpQ=
X-Received: by 2002:aa7:8887:0:b0:834:e5a2:d089 with SMTP id d2e1a72fcca58-84284f1bdfamr6387416b3a.33.1780550835152;
        Wed, 03 Jun 2026 22:27:15 -0700 (PDT)
X-Received: by 2002:aa7:8887:0:b0:834:e5a2:d089 with SMTP id d2e1a72fcca58-84284f1bdfamr6387379b3a.33.1780550834671;
        Wed, 03 Jun 2026 22:27:14 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842820e8e6asm4493678b3a.0.2026.06.03.22.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:27:14 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 10:56:15 +0530
Subject: [PATCH v4 09/13] clk: qcom: gpucc-qcm2290: Park RCG's clk source
 at XO during disable
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-dispcc-gpucc-v4-9-8204f1029311@oss.qualcomm.com>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1MCBTYWx0ZWRfX6DB1zEY+Lkx4
 La4/5kjrGjfBvipjO4vZraizjx+Qd8O7VMox+UDPNmBSbzlb5+yr4YKKfpSOMtnZVfqzRJ0QB++
 GZRFdhp68BX+Vgus1GWxjniJ4w/XslXh9S+sUmpDxa2YLbpC1zOGwN7H3wsM7toGJQ8t0riSDGP
 +joNdg0GJvlq3h7H6kDbQByTrOMNE5R9Hkaoiy1kuOpGkkZHtmgDcVGVAuZXDnJd2WNxoLMzhdX
 goqf+R7xGTwCg6AZo2LwtrcEWq+joleLprtG1i/uTFkCNJkXo5Ar8vt9ocxWJGyvjYecexC39B4
 AeGk/PcwAfPoJkv4Bni6Tq3VutktOWMVtGF9wZPu2fzCNG2nG3mjLZUZJF/Aic2k1fcy7bB7Avv
 HA57f2k+8Ois3USMqfIZCJFtbY8Qykpi67B5aLdHkXIVNUI+4KECeG75Oqt5kg+pvWWGFhn0goo
 cLZFUtRpwBc+21ayPjw==
X-Proofpoint-GUID: LX2ZszkrMeU-1ce70bGDR4cejrzd_N5k
X-Proofpoint-ORIG-GUID: LX2ZszkrMeU-1ce70bGDR4cejrzd_N5k
X-Authority-Analysis: v=2.4 cv=UvhT8ewB c=1 sm=1 tr=0 ts=6a210cb4 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=zEYBLtLDRKTvQvC0xrIA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040050

The RCG's clk src has to be parked at XO while disabling as per the
HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index 1c8ed12f6bf8154596d031347540ef621314edc6..2150b94ad0ce5146c47ae21fae4deccdaba20673 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -144,7 +144,7 @@ static struct clk_rcg2 gpu_cc_gx_gfx3d_clk_src = {
 		.parent_data = gpu_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 

-- 
2.34.1

