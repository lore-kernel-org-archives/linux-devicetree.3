Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3074FD79C
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 13:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417286; cv=none; b=O9a9K/x/Aec33ED64qDjoDSsts6iM0x6owLT5HlnQSt9tb2wJkta+JQ/PK0jDQM+zFsmfI+cCO4vUF7WcVi8vHzKsG9qfP6Sn1kgwy3+WLP0xfYWOxYSHHUQKK1XjvbXZe56/TqoLTi9RmxL/LbSFW/iC9Mmg5Zk/HXkirwc6zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417286; c=relaxed/simple;
	bh=oEdznP6hER4p3RkDnlVcGRyaQvpsV5C34ALYggRgtLs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aH/ls+YXPr8ACYnhgkbrg17YyCZi7snpCwfxMqtbIMIKPZOMKptEw2hrFwETmeMGMVv662dWSPgHm6hqFsOHPoomadFbObiJ8KZrhKq7TeO+D+Oj12J91ZsjghlHFAD+j6u8SpsO81K4WENuwZ7qFb7RLj6BCc39cAMhv8v9tKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p5Hkgz1D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UokngoG1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p5Hkgz1D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UokngoG1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P2ga724563
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 13:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CXeRltm9E8aI9A97Jt7ApaQcsKf2+a0hl80xE9m/h+E=; b=p5Hkgz1DaS/vwmfq
	9DASH4aLQIrCRDQQi0W49OFKpF1t4JDKR+JUxnu964JlYvHgAXq8HapSXp/beMJN
	0UCBfRM2n+lXZ2qUILFie2KGmjexPRPZbfnJko7Y7cVvIv1xo5IQXvI9ojCjUp4f
	ddhBDS6Ciy4Y1m7GZtTQMVCZKnVR+DQcXknAERzpC498C7TbEmRvnnFY1TKxS6Us
	o8UobQ05cQkFYqSKRacUizoxfEy/R8q3/ve9j5ZLVEDfWguk6q1yXWA001yQ3As6
	1l+ZT7UQP32XsgT0h9bxoboTIE81qTvRoApejyVnWRMgIneF4gRNCadaKz9edeH3
	ba6Ccg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf65hayh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 13:41:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93dd3c3badbso508840185a.2
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 06:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792417283; x=1793022083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CXeRltm9E8aI9A97Jt7ApaQcsKf2+a0hl80xE9m/h+E=;
        b=UokngoG1Ant1Q0aZjr9XNrrVnJTZknxQRv5KKqTGBiR4EvMogD4TJXVpKY7dwQyjn5
         /OCvglXCXwEVmEGdP8/NgnhcckaVr92Z9gz01ORoeq92FbU1eZSX4xM5kydx3Qo04m1j
         h6LsZe0jE8DN4k99ZUvw+QNfCzN6OJuZSEJofx8f3nqR+ia74eChsKQkfQ1z39VmW3Vu
         M5c7MEl/vVAMlepRgNn8yYK12Wz/U0dpIwRO0HunzfLM69F6Rw9Fxa+kbpOddV+GMux0
         bWQjXqDx1WBOqHrP4ZtQNOJp+ZQ7rlJ2ANoyH623JTzxNVCOMOviNMbI4c+UL0TSqKxS
         KuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417283; x=1793022083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CXeRltm9E8aI9A97Jt7ApaQcsKf2+a0hl80xE9m/h+E=;
        b=Y771239JZ/R8FqzKWq8zeKhcIfFIsAZ+k/mScru6iThDkl+NRXsP088Iq7YdZeAHNO
         f4a+bOxgJxHqyXRFjq577EhgKapb3HJju24CteVuNjTsXK7MuCDDfCosudU0RaX3HOd6
         xMBOPCu0nBA1ovgKPCEXDjhCYlDAHZud2BOirR1+ylY/xQZl9aHFzeYwbjWNavbQTK0q
         FiwtG3DFlzD/TyjtgxR+0D9sRr3pLDqjBXhQUmOLGpNyinZ78R4/mwN6HJMqnZBMCOyp
         xY5b1Wpc0TkknMWvCvUvccgHg2GImA8qNWc+0PESHMulgWpPoAmND4HPWeL710/zXamW
         TDQQ==
X-Forwarded-Encrypted: i=1; AKwUvByxjprJPHVoXrGuTOJrqKUDFgmwyMEjSkP6i8DUlsUiFAuQKR9gyYXhTXmubvtVYrJ+fy0CjIv/xkVW@vger.kernel.org
X-Gm-Message-State: AFq9FYK8qzDAjeedsYF7bkGPn0TpM9QaNHXJXQs2D2g3jO/j9ia/oLn5
	byUo+0PSXX1+LEo9OrzxKuox6zaXm3XgUavbCMdPC9OAR79JQfAjwPPvb6xEWMF6lS7p1P6BHW9
	04WCgXryHwh7KCsbaNn7JgTSxrAVUCDosN7diLvZTRvOLeHFqwfEsIRiDai+nKO4K
X-Gm-Gg: AYBFou293EFz6JXBC93d6oI/FlOaaq/aNWg86CiatJk5H9H3rpGBY0iz1gRUTV26Jaq
	7ssm/seXrgdEpx3py/sq5qP7q+w1sG0Sej8jSnE2F+P+kmiyNwEisWZDwSgDkez9+pI6W5E5nRV
	0KZdQH69GG/m6fHixtM9e2dwoN5WgGIhyju+z1DUYCljQzgacg9n+HiiTMlfSu7D5oC1q5OtpZS
	ov/HomZjfo5kkXbySKpx0GtOOx13ulZjcs2bc50ak+Kz9eVXO/RShyogWgOm1HRPBPUML6c6zoH
	8yXpV7chZTDgj5OoWRn+3d4y1Hh1c1taMXscZmkR71yeAJ+jVFUHIjnttbgtIC8UOUL+jRpDNEd
	TKWlAe4L6vxddV+qneVufg8HbK3pRJ3cCLRyv3ncIRAoTCHpBJ9YMRiEcOWSyARdOs7LIFAp6ah
	4Q5ERcT8L/i5Tj
X-Received: by 2002:a05:620a:29d5:b0:93e:d854:4b83 with SMTP id af79cd13be357-93f29ceeec1mr1288553185a.22.1792417282780;
        Mon, 19 Oct 2026 06:41:22 -0700 (PDT)
X-Received: by 2002:a05:620a:29d5:b0:93e:d854:4b83 with SMTP id af79cd13be357-93f29ceeec1mr1288549385a.22.1792417282196;
        Mon, 19 Oct 2026 06:41:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab473d06easm4409851fa.31.2026.10.19.06.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:41:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:41:05 +0300
Subject: [PATCH 06/10] clk: qcom: mmcc-msm8996: keep mmss_mmagic_maxi_clk
 always enabled
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-msm8998-fix-clocks-v1-6-370949e4d8a0@oss.qualcomm.com>
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1578;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=oEdznP6hER4p3RkDnlVcGRyaQvpsV5C34ALYggRgtLs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1h3yOK8vkUokO+sXyGMj3EFT+PwQ4GkgQeS98
 kOcmDD9HReJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYd8gAKCRCLPIo+Aiko
 1fpiCACZR+kSwELBAoJRJ8lYA/yBYT2Mz/YKRZmb9j9jB594mGugObqXj2xnLdcAHfDKek3YGFp
 HF8yxi4JVCgPKJhNGZhcyjhv+jVbKqaUQYZz/x0Yh8cs76GNgFgA7kyr2Evn0is30ssbwbs0R4d
 wjTHOEg2iBTkdXkB0kYVCM4JySOqnB5jQs2UwuqzqX4QgRH5D+eKZv4pjWvBph6Ru0ArZgBw1Ax
 zNOhH3L0fpaoyXss5W1NNN/rZBZ3KsYQJ90A5txM9iK+vsjSC0ZibOaacWbpt6kgbdEfwhLjToE
 2G6fvwExj2zvnTWJBZXpmKmy4STT1wwwN1MAcDkZcFFphpd6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX2yJ7eviDzsvt
 9xkyHanfKwTgGj8VrWOFvX1/8xYpjSefnBcZY88bdssfO4g1HB5DWwmZyj/BikNbIi6SC2lYnnd
 vNWvUk1XlowDOpGB0T0HRLp6sWPmyKc=
X-Proofpoint-ORIG-GUID: oi46lwRmWF-y_7ICZsREZSl8yxcFBSFc
X-Authority-Analysis: v=2.4 cv=Y5ptIReN c=1 sm=1 tr=0 ts=6ad61e04 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=PFv3ho34_BknXicu4MwA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX5EGlrzu5s94Y
 XhQ4MSEoMb7d5JyuABUUQWVuPp5+P/hikCQT5kSJuzsWXzVQZ9xMK2VDb3AAgrBFqQQE+yse2A9
 kn4kGTaefd381wm6Isv4o6jmEd+OXrKSfSpkA8TnscmObbWWnwKtvqy+j/oYkDFARnOwEvJ8KS1
 idn0Ir0ldSJwJmz2D5k/jF+FCULfvwa0UUJbkQ2NOv6ZRcYIBvrZLJ0elv/Q3HzzPxy1gZRsORv
 X4aZjvt1mtvQ/ZF+ssLgK+0OOJOVOX9FEQgiFApdNscQJZBGZB+6RXascDPjLS5M8MFrPDeNI5T
 yuu03VEFMCOWg+Tv2KyLNH94C2Im7/Q255yUBmutgUnvoCk9AdCr+h14BR0NVrh2Bo97w3OQAa2
 q0m7chljKTFq2x/ZOruZ/vbIaIbWDaAL+WMs5e8eT1tiRiyalTKr1+ZiNVmTBWjAcyYfKLNCp7A
 blyxG9sBr1cMUhnLnUQ==
X-Proofpoint-GUID: oi46lwRmWF-y_7ICZsREZSl8yxcFBSFc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190054

Enabling vmem_maxi_clk fails with -EBUSY, the branch never leaving halt
("vmem_maxi_clk status stuck at 'off'"), which makes the VMEM block
unusable. The MAXI branches sit behind the MMAGIC aggregator, so they
cannot leave halt unless mmss_mmagic_maxi_clk is running.

Commit 7705bb7176b9 ("clk: qcom: mmcc-msm8996: leave all mmagic gdscs
and clocks always enabled") marked the MMAGIC clocks CLK_IS_CRITICAL
because there is no bus driver to manage them, but missed this one: its
siblings mmss_mmagic_ahb_clk, mmagic_video_axi_clk and
mmagic_video_noc_cfg_ahb_clk all carry the flag while
mmss_mmagic_maxi_clk does not.

Mark it CLK_IS_CRITICAL as well.

Note that the halt bit is truthful here and must not be papered over
with BRANCH_HALT_SKIP: touching the block while its AXI clock is off
silently resets the SoC.

Fixes: 7705bb7176b9 ("clk: qcom: mmcc-msm8996: leave all mmagic gdscs and clocks always enabled")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/clk/qcom/mmcc-msm8996.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
index ef7bde361fc3..b8dd374df2e4 100644
--- a/drivers/clk/qcom/mmcc-msm8996.c
+++ b/drivers/clk/qcom/mmcc-msm8996.c
@@ -1341,7 +1341,7 @@ static struct clk_branch mmss_mmagic_maxi_clk = {
 				&maxi_clk_src.clkr.hw
 			},
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
+			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
 		},
 	},

-- 
2.47.3

