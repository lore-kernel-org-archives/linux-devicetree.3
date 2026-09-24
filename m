Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41CD483BC6
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246479; cv=none; b=n7X9fSLYfxkOzDGrqNA8oQCr6/yQpxhm/StxBeD6hFQiyRB1K5NUfZiIs5MCQpL6giJP1PFcQS80JxbuaeI7B2D/MIFrqKdBOJxjlO0yOnMqO9K1iqC4fzJdxFZ6vszGTnYsSwokGm8hSk2cPloVSC2Ly60apD9DZhMVzuQKawc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246479; c=relaxed/simple;
	bh=Ve9iQLgnDMsA2g8SuB4W+BubUPBR6RQwDcIDTO0O/O4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WfhBNFJfroB0V9cmDKLLKn8M4VgTp7DochD6ftHQLBa1aw44bP9Ku0rDAA2T5v9J/p2QLZP27YLrBRa00CD4mMln6vFfZTJ9/4Loh9KmamSOq9owQmsBYZZvvpho7OPHdyBLEvUm6TJ/fXFOeYn8wUKWu+T5EdyDIEGd9aWGg5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mxT+ElWq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jmz7R01q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mxT+ElWq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jmz7R01q"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9OuT21063435
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4ds6fKH7tM2v3P1TXKG8+wczMeC3eKAUm1HM6VrIBks=; b=mxT+ElWqZAiI9Wou
	lUi/IDpkISIIbBKZuwhA37N5VhZyQK4okCfbFEGS8+CCCGePiOWK30tnyATI/5BZ
	UVA5U9uZp7cYVHnlZeVtIo09iqC9LHtRIgvXgHtnPApE/ebkau7DYfzAuC0CnYb8
	eL/so+4KL4b6JmBrcGUHYDHckCsDbsEGnqfPfPOzldXEG50fXbI52EmhFX+kYfk+
	r3xtevEtPW7V6VAWQ9m1xEfQdFkETfsVkMcFd/wvD5hMJ/IR/etvR0D5Ch8HR8ac
	uu0NI4oIiPxZMu0aELw1tpXEfTvLYxgUEJvbyGiZYwVEl84Fm3XGhqy26KCa6sSa
	kwU41A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvvgh9hta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:41:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a01d1d1b6so306400885a.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 03:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246476; x=1790851276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ds6fKH7tM2v3P1TXKG8+wczMeC3eKAUm1HM6VrIBks=;
        b=jmz7R01qZzQGuQwcIRIiPnGE4RU9MavDrA3CibolIJsZChWB1DvDZFHi5c+TZu0pSd
         VMH5aPrD6Fjoh2p1og79V9VC44KG8cFF43qucEE4o+DSkQcfXFjilxL/PyIZPWeMxAGG
         etYuCLY7lePGdPUbY8yPidWQa9zPi2kV4N6pKkbk6LFESoR4MOkBW+toPkIX+Xr1ekgV
         Dce8BDexAEEML0tuopJl80u8xMXfEw6GCV44zQbb6TJ5r9ywf6i8jLiSuNCTULF9AubO
         kCfXWYRXeKn5OHb0PT4u3JQaJAsoEGeJKjuMy5IGAAsHU9SCWtbeokKTT5fhERm0ALAN
         pFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246476; x=1790851276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ds6fKH7tM2v3P1TXKG8+wczMeC3eKAUm1HM6VrIBks=;
        b=ri3gljXTBhFw1F7LoZgbkc6Q5HgFZGKLYqREcRdKhLiqNJXsR1TjEo3giWV4slPj6w
         ZbLFfJG0COfd5IiV6f3whApqcw2HEJX3NObxaPwKiQj4RHRNYmR03QHBhIPArP8zCSfL
         H9A0jsou15l+6dOSDM+9k0HodyG+x82/2biIJhw/du0LblwSrvC3pOlyFGz6LZK2bBdL
         LNbOjMWo5K+EOPO3yO81AAVH2Sl9cDxYteZvez7PY15M6T3sQ9TUw9Zgyu9PVevTSwFA
         Y6DGrBXUwQM1pwkomQYp8WMLDr+PpON/mvpodxA11txYH1p9aW+Q1/WxBre+MZWP/nVY
         ZvhA==
X-Forwarded-Encrypted: i=1; AKwUvBwOKNZfPpexvcb4e2z81thbQT8uiLfufW3vec8/CN1y6WlpRAZQWXxDjW6JYEWMhUJLJy+El+M88E0x@vger.kernel.org
X-Gm-Message-State: AFuF++nsM4TakQVqbh/PlykDnoLXeDRktjtplQPiu+3DlZR9lKyIyPWn
	DmNbz9i18JJkUl2fMuSM4J4/xSdbrAmZVUkP0LZKt9vfs7V7Sz3IOz0q1Luxe+bcgy9DmEjuXTF
	z6xUiDoSaZSOTUwdSoy8U6+W2BNiAEVZsUO5dF7dX8guY+uC+CHteNkoMcapqjXVh
X-Gm-Gg: AYBFou2/vfuXVuWhRungG6fg1M3SMU6NgV8XgRUYkVQyzANamJdN1KY4B2Yad8k0gFS
	+jG8mFcVpf72zkeVxbimhvtWBdO1qRj785G3wvNV9MewsiD+qHKM+k3xiK4URe8tGhxjbZ3IUcc
	2qnGPMekmFdg/xnvHFMjvZuGzKxCUhVR+9fTWt8Z9c9ZM/Xn3+IK0++eWMBT+M+lsdsvo+iWjHw
	rpVuapMxQcFnh6maGWFRxVkfYK2ZEItnAQR9UsBtyeuUt+xJAu90ZUpkCxu1cjaPOjBKDxoh907
	OD+/q0YWXcg1h6X/jCAteZEDBqDmvsBb2WqqNQRbhuCIK0Y/Nw9iWNAqh4yQ+OEh6eEELcQcK9a
	Mlc7anqNy
X-Received: by 2002:a05:620a:628c:b0:93b:c332:3d9e with SMTP id af79cd13be357-93c36355307mr224185585a.30.1790246475948;
        Thu, 24 Sep 2026 03:41:15 -0700 (PDT)
X-Received: by 2002:a05:620a:628c:b0:93b:c332:3d9e with SMTP id af79cd13be357-93c36355307mr224181085a.30.1790246475363;
        Thu, 24 Sep 2026 03:41:15 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:14 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:40 +0300
Subject: [PATCH v5 24/42] clk: qcom: gcc-sm8550: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-24-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=826;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ve9iQLgnDMsA2g8SuB4W+BubUPBR6RQwDcIDTO0O/O4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3xzeGhSWAgWO3A/ats7kDGH+TKzVsN8lfRO
 ddy+iOZi92JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT98QAKCRAbX0TJAJUV
 VsDZD/9HVSHTWltqmKQUTWh2r5Iq1n2qA7LG+cNJ5TR95mYahYBk+7oMuLORATMUTOOKrQlP85b
 dZhHefA3UIPoDu+uirw+NtKUTj7OEOe7ix1jxfJiIq8vkR1e5StiXDZXpEvXayLwJ7b7dWwtBan
 b+cKwaHTnGJ/2ORwHuVMmRoTVd06CYvdBynv0Wf5OCyDio/VxOVC5dqJV5UG9E1OEm57aebPN1m
 5pJCRk/8reDAUidT5QYi5dkQm0SVMPxHYm2pPAjhVxC8Nf9ydCx3cYJbWbEAC+2fywiWcGKxHR8
 uYrOmGbOlp7+imSrcDQxyHIMsBIeLdOaY7G0LWjvwJfV57elAFgYXIiEvYLT2fLXJhdY3x7ydsg
 qtMHAqKBNszHZhaz0PctZYosiEx+68PvcXmyIlZVyGyFFp6JVZb4rM2ObzXgJiDC2AVGdAz6xV7
 lrhmTB7zSCwu7uCadqonEFsD6h8USOZwoSxayoT3BQxk7TSlz7PJHSFu2e+2QtMwOzqfesWV+1X
 LlXSGlYcp2FznwVgQO1ZelwvaL0lRvr4LhLJKQQ6Ll60XBtrsOEe7WV/3NbVGWhea8pw+C1w+rG
 Y204ymt9N1qhdG3BcEeIdY3gQqCqQDHhjxtduwU6vp/lBVY/kBAmGLs2vlVvtYHyPZSkEidX5Rg
 uVk47dbHD35WnjQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=KYhHIgYD c=1 sm=1 tr=0 ts=6ab4fe4d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ESHVkgNwe3RMy11JppAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 5zboI6dPrG0hGqQ7OKOEsQQqcNaIlNVH
X-Proofpoint-ORIG-GUID: 5zboI6dPrG0hGqQ7OKOEsQQqcNaIlNVH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXwY6J3tsOG/rI
 Oqs9gloeGzleMZCB99YssaSTqE3rS4+lSLkiBjScBwpg6Z3/8SKa41YFW3x0Khrem4hfBPNlNzJ
 cUZB19Oc4GNLNHFTIJtlaw7fILwoVC4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX6i+do+lqv8V2
 sOXBg9v9vHMG5IsSRmWt42OlF+S96JUQjsgyKwnLUOrSo1/eI35quacNxE/vxltsHuySQQ5+YUi
 eUUol31Fy7PAnh86zgb1L37B1dHdZiKvZ7JozxRJ/837P50UpMoRxbYR6Nq17Iqa6nU4iRUDNrL
 YJgqZD6LfFrZB/cTJJ3sZgEIkAJFForUmi2KKTe99mIHgBxjqU7XQoMInts84uMkG+d0v4f91Kw
 WY6acfVvLv/w//sx72DP7+sp3CTuDZPUdiAbweDwHbfq4EjQVGTaiy1cBtZyaDFAcAutY3Jef1V
 mEdKaDs+ISWFPuwdj0doz2r+g4X6KX3toeJSNMQakYvxI6+TN5cDlbea4vDYtH5/zZ/DRq7pXiI
 2jpzihUYPWnNtOrUY4licXiQwizL3QTiCIUB8bkA0mmNT4vt73SV6eN3vdtO5vlEXWdYtBAx+Ap
 2csrxrbhseMbojxPPoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8550.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8550.c b/drivers/clk/qcom/gcc-sm8550.c
index d83a7bb5356b..fcaa4cd82b71 100644
--- a/drivers/clk/qcom/gcc-sm8550.c
+++ b/drivers/clk/qcom/gcc-sm8550.c
@@ -3327,6 +3327,7 @@ static const struct qcom_cc_desc gcc_sm8550_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sm8550_resets),
 	.gdscs = gcc_sm8550_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8550_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sm8550_match_table[] = {

-- 
2.54.0

