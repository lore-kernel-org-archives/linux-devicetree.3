Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2157947D444
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790327417; cv=none; b=Y2t5XWQUbu3KLNRjfReYbyybO61W0woVzniYf8hutvm9lHwNSL0qvwEguGi59xOPozXStUHN53a2fSmYQ6KUVVtsMseto7bp1GsC85+8BbILQgwl1j+xVOkPG6i/9QmmfOaAKUNUPz5oo0z+PFpqCqz4xBJoT5qYss83tiuiwsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790327417; c=relaxed/simple;
	bh=Dzpg26Vur2DCvULsTE9E1JAC2Y7NSf6GVeoLlup85aI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tSWX3JlqRkNMD2cYPL/Ty5I6OEI+OefA/iN8kfrZg3cYKyIz0NcBpcffrmQkkhI4xjVPR4HBV47btE9jk2ZGGwG3u9rg6VnTAxjH32pbaYn8DHLX5dT3NoIjeelIO7MOso6DmM1yO4O8CilgiHGHPqKIj5F1Z0NtAMe/q/51hRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VCXfdnzs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JzoufsLb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VCXfdnzs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JzoufsLb"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YbMF3532122
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:10:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ooijHQlhry9x8ePNW1MEInw6PQc9F5ZMCpXfK0l0qXU=; b=VCXfdnzsBuAxysu4
	O6uJHtTkow49ha/+RPdqHJab41tX5nEczGltusQP0GLq5MsO4Nt1yHTL09vacODl
	OVmcsrgON/EaByj2NDK0DIcw7vhOe4+wHKJWp0aAUKkn8zgXLrlasPU0eNPVvRgs
	rQTntLrm4AmkJTowsjg1cJ14Add6dE6IHzwhlginxV2GxGzY4wo7mXoKyuRz964h
	A46AOhScf3JcRZmV76f+3mlqnJOQKUBxEJ9hgYDuD+mmb13ou8TwgDj/yN96MeDN
	oaDgBBcaP7GAtNIchR19Ypx0UNMVLWTU4+R7ZZ+bKT0pCrcftaEkBJjhPJeCYqKC
	udwEiQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw94kah7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:10:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9393ac4961fso98445085a.2
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 02:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790327410; x=1790932210; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ooijHQlhry9x8ePNW1MEInw6PQc9F5ZMCpXfK0l0qXU=;
        b=JzoufsLb5UxdqOwzleu+U9pFWZBruEMSvF4m4Eikw+FjPT1FhFPXuvsmAYz46R0eMa
         6VOP39qYW4va0yMNTCo/m4+YytY8xlEKakHrV3okD35Nx6AGjdn+KCk3XLsrzDMYdhZ2
         v/h78gDs24nRcZYjgrw5t3fsFO+o3mDBStJgFIhOeUnxP6SMKxp5FDmGz9s7l36ztz+A
         8w6IKk2tlpsxZ01upaufzvIBgbj7s+D5eXiwpKjhzUhg4SDSSEnQ9bxiYOBjk37fBQLb
         4RYO+qO2Y+Nz+gx/NJP0ckV3ximmO+e0SULtUyaI9kxXuphaWF9ZFebn9Vxi+88d7AOY
         fGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790327410; x=1790932210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ooijHQlhry9x8ePNW1MEInw6PQc9F5ZMCpXfK0l0qXU=;
        b=bm1PS29/aoN8sJx9R1BlQT0a6bsQzQbM0sb9Rb4AFhiIOkkpmY2MJysWZNRXtpMC4K
         W9pi+KfLQjhAMf4sT48Ofms5gh8hE8Wak4DdgeXDbaWXgNr8+RSYiozjeJfOQ1syHJWg
         EikcJxjOm7zKFeKHiHMsD78ej9MdN8VyIcbdfriXh5HDCqRxc6JP0al6pJ0UTdF2y0dD
         VRVFB0w1vHoHnmQqMGvgdoM1BxZPI+4fLvK36MbzaFlE5TW73u+pKi6+ZyzwVQjyxQpQ
         cpv1gfNq9eYb04xO84e+cPZlme3Y+PZn9luHeBX500r5Mjq+ahSvMeZZUGHh+IkY3lTj
         DkUQ==
X-Forwarded-Encrypted: i=1; AKwUvByWkp1jGf9iDIl6ara3+qsJVUWbPrbNdiEfKJWJWYsika0VJzPiy1jYY6LHFkCaovKN5ILvamkmel3x@vger.kernel.org
X-Gm-Message-State: AFuF++nZPb9GcJqH0IAcMvPUgIxR4r/YRf0nexyM4p6Us/OVvXkPfg7l
	6Z92iklDg9xYnmOBzZOfgxBh+HfoGl1XexF6FmTsfRibqMD/aB51dbwiKZEJRPUm6JVMeTgzNJX
	Opliavmej2lTXK4TQcgdWlLGInF9bR8ZIOtDfGupJ6s/IDZf9XzyYm7MMvqL2dOV/
X-Gm-Gg: AYBFou0o+OXhnFSpESsG4MMDkelFzZUrHA1M+dRd5fP77S0/kaXHU0uyISf+tpLuc+4
	iv90Yd5mykZK7QTCosBgL0HvtooMd+KjRPpzj9ynK5NhpBSg2b/1hsCA9IOQ6atodwsTNUsPSEQ
	4maKIuIWcPHn8qmoXRm7WvZSRIlhUSRZ5YGdwits/3re3z8jt2TcIkfucN1FWKcIaF+HAxForch
	FLRJenZwBN2BjjcQyAxJ0ps1nJoy3s9V+vEZc3KHUvahpOX4ztlpozGbc0oNoT77gutGQOyPPU6
	mVmhG2HoHp0ai5/Gjg4neC/rGvBNJ4nR/h7bV5RM7EFT2PcK7y5Irm5bLl2OU1duquCKAVqTQJI
	nZLdnqVq8zfv1ZEgDu8ME3wstwk9nbNIRii7xodPoOVEJyzA1m4kfbwi5dZ5hKoWZtm1NboU0n1
	ykQYxPQrTKkhhtyk4EijH1kGwuMIjIYrfkR1m6dZfxX75uHaC/1zs=
X-Received: by 2002:a05:620a:199b:b0:93b:e917:6888 with SMTP id af79cd13be357-93c43cb6c72mr320196585a.33.1790327409493;
        Fri, 25 Sep 2026 02:10:09 -0700 (PDT)
X-Received: by 2002:a05:620a:199b:b0:93b:e917:6888 with SMTP id af79cd13be357-93c43cb6c72mr320192385a.33.1790327408916;
        Fri, 25 Sep 2026 02:10:08 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5c1f:3897:a4a1:99e1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a638sm5269890f8f.9.2026.09.25.02.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:10:06 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 11:09:56 +0200
Subject: [PATCH v10 9/9] arm64: defconfig: Enable Qualcomm CAMSS OPE driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-camss-isp-ope-v10-9-2622411034cb@oss.qualcomm.com>
References: <20260925-camss-isp-ope-v10-0-2622411034cb@oss.qualcomm.com>
In-Reply-To: <20260925-camss-isp-ope-v10-0-2622411034cb@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=aaj0Dhot c=1 sm=1 tr=0 ts=6ab63a72 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=BUwzsxYIp--Ly0ysDZIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: mBoIfr6lR2uBZDqcN2oXA3x8ypyGsnT_
X-Proofpoint-ORIG-GUID: mBoIfr6lR2uBZDqcN2oXA3x8ypyGsnT_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzNiBTYWx0ZWRfX31XAdkpIuJdI
 fGsL6/aGpkCzozdPD9ClMkuM8rDIYXhbaDrh1+hCh3TA6zBzqQ7DJKyy9/pZLNgLm0umSmv35Ib
 u2f3rIJjPg0vZF1oigujRKESZjcA7V+vqoqGCArSL8xbTcEXe2DNe5lrxee3drKGft8Lrb5n2uF
 PKouggDDGgTYiTHAjbL75ZJUgvKKI/+9hfP1ISlI/AggM1FXmH79u4jEbeR66WVHH29Yb05f5aN
 lItCT27CZJkRCvNUnrzuJfURrX5/6KcV6ETUlythY7CuhqhlM5tqJK05jzsXFprMgzqWNOC4F/Z
 386yjzPzLvgxC/9MjtTRNA4vBZ/j+9c5evyhzPPA42g9j9s7BoPETtcWXwQ6VqhMQNYfjUe6FGD
 o47IkeIc9Rim8aQNrX9GDdxfHcIoNPHsq0ezeF66NI8o1VsOosLp/TD8d4zQaCwA43oVWS6NXb/
 2FjBtH05S5bhpum7Tog==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzNiBTYWx0ZWRfXxv7e0iuN6qfx
 6dny03GQWbw2msBC+yuzQ3HxcsuTLY13W/R0nG5QKUdrsgfjeZOVemp+iaTj1na7eCfjL2B7tSq
 4m0I27EF6tJ8dzAMQBeQ2yks853e4AE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250036

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add CONFIG_VIDEO_QCOM_CAMSS_OPE=m to enable the Qualcomm Offline Processing
Engine (OPE) driver, an image processing block available on Qualcomm Agatti
and Shikra based platforms such as the Arduino UNO Q.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98e0da38465010d11166bb0e058f4a..604a0d58521dd6a1df8718ea3fce28cc727a08a0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -931,6 +931,7 @@ CONFIG_VIDEO_IMX8_ISI=m
 CONFIG_VIDEO_IMX8_ISI_M2M=y
 CONFIG_VIDEO_IMX8_JPEG=m
 CONFIG_VIDEO_QCOM_CAMSS=m
+CONFIG_VIDEO_QCOM_CAMSS_OPE=m
 CONFIG_VIDEO_QCOM_IRIS=m
 CONFIG_VIDEO_QCOM_VENUS=m
 CONFIG_VIDEO_RCAR_CSI2=m

-- 
2.34.1

