Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1B1472783
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246458; cv=none; b=KwWc4g8FqZnhOC7ZNWE6ZDfprooK9HGOhkp3D6gcezEvP1yMTQPZ6gauV4zo5s0WZRlKDSDe09dhtNsLu/05ngmxbUA/d2iyW5r11Kz8NO0pBqjLJkaVdYTivuPBwRQ3IxpC05i81weEi1axvBbr5HRhylPAlcuNezWs+s3awAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246458; c=relaxed/simple;
	bh=pxpWIPYAAKRdf4CVHCE4SHi4Vq5Zm5vjxhNSS8g8qOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EW0WLc7zbkoARdtqrWfReV0XqQbPI0bQsXSWZU31TR0U6QAPGFxHWMp7ogyDNK/yTFWFQ7Qu2Y2BMw5baG/vLudIRJiWLCRNEu8mwEdMVUASs2elwAmHJNpH0oA2ko4K5n9SRypVed8kUvqaT2BhD9uHpDyq9VpnjmNLin0H3AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nQwF3EZR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VvngVGXJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nQwF3EZR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VvngVGXJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA3LSu2483651
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yTxapWDRt6RSXBUQ4A+5zXCQbxO8Jl+SiQZjxhT6iys=; b=nQwF3EZRaIwJkoRB
	ezt4LJ2rTm3Ksq1KZBPuGvdKRCy29p4SqPde1+0wRpbzP87cj5iz3IbzSux7Z/EO
	92zlP/SO/l9FamUkSYgwvozPHyH+d93wrqSvWzdspmb/fULUysUzSac5Ko8Kds58
	oui/A0NM9NvPjE7tfzpftmO3qiQKh84kFoJcqWbLxpqLsF86phdVRykf9hfot5JB
	lhuGZ+pvyzxw2WIn0PTmHLAr10VHqXKerEu4k2pgELFgqX4iQsPxpptSvW9Hvjtp
	Yo6I72g6gQXBDn+J1ByfZ0/lTckygeYC/f3MOlrAW4ks4Y3vmmzroP/ldJY5Q8bq
	QC/vyg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1s904e0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:40:54 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97e9e1dd7fbso1518498241.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 03:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246454; x=1790851254; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yTxapWDRt6RSXBUQ4A+5zXCQbxO8Jl+SiQZjxhT6iys=;
        b=VvngVGXJD5soVWeDe/mrQTdAdPq0/C3DW9bVSzMjr35QhkseurwCxkdLhdaGlAN/+Z
         VModWQvlM0E00lNtUpX6vr5zjsrsCN4Q7YQQ9DjpvwltwxV6ykH5ulPaOIj4XqW+87aB
         Da6lb1iTGEqCPdcw2kWftGwtcgc9+UwzZUeGfzYbDjO5R1BFn7Grv+V6b3t9SbWiYqgB
         JAkrAKtoIBFti5KLxJsPcWO9kPD3UL3b+mi7Wl0uQj+9ZjdKZpQEu22jJFlMhUYHvW9m
         0KmO9fh5sGdTJg3FA69rEWUFhqpmbkB/L7DOY0GcpbDCfGaMpP3Wx7RAGzRDK1yL0fHE
         YLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246454; x=1790851254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yTxapWDRt6RSXBUQ4A+5zXCQbxO8Jl+SiQZjxhT6iys=;
        b=W9UVcBJtp/2llgl3QqQX8s1+3b85je9tYQE7gdXpMK6QpU3h9QIoAtpD0JoAYJoPY2
         TrGu7zqWe4IwrsOP17Ba7JZ6KSkx7QUhAt7y6nOcrtK2dTgUAyV/jZl2PdFxO9EUvIpw
         Cnpt0ovSaBscSGtGS0S3z5DzzBUdw5NB21fqs84sT7Ux3jOaQZA4uZMn4kzfBw66pRJ8
         406D1dKtaBZpxYhygBYBuqHSBOCa6yU80fFo5+SrMY8gR2kOPqAjzzcCYGWlfHNeqRJ1
         mMjyOpGj1mqwNChEDDzpD9UT8ujXu5l37srn3iv9JqUu96ZDfmRAexzhjndTUtD70H1+
         Ezgg==
X-Forwarded-Encrypted: i=1; AKwUvBxwYV9No8n/jd7K3VWLcoztXb4eju0X+zPZUuEy1sLBygtYD3PMAYVDMUu8ZSHXkbfBjwAUjg5D8LMV@vger.kernel.org
X-Gm-Message-State: AFuF++kOAv5ANpRoJOlhEA45LpMAeSFxyUBn1H+qXcPFRitgc6Qk1HX9
	IK5UNLM+zNKbwv00jHEBeAUkKGyo1Ik/V+WrJQ5/cLeNGPMeQUVBzUj7g3WnY+0fALQtyEv9ePc
	5hJ+NgJBrpN5BoOEKQ+cRrVUlJO6PFp/pKxwx+5ary4iSUrUq/e7FoI6D7siM0tM8
X-Gm-Gg: AYBFou0NX9RcVfnTe8w4kP/Hl/1eJJOJxCB9b7m/Fp02t+fimxhOCCIyt7iQy3m+qkE
	EZWnY1cNakw7xUqkD1vrdAzqeojbZJwx+FYmb5ET78Gztwnb+9AnNvmJzhEXDneYNzFDBbpAWCB
	DEE21VRsCVaqYP0MhvCjiQ8h1Vq32xB0+YUhRALKNYA9Asu5o/icnnMbPHXJLE2k3e0XmDAhjqi
	hTy2f790LtYHfKZytl/25TtUij5zb0wkMPMPVQb64N0L0FBsUVYs7Kmoe3i9S/Jr7jnBoXWZLos
	M7MV0QHh9eU7HfoIIaZ5z9R3/Dm0sZSeV32j8Rg5wA4JgHgeCIt9bZ9rRe2jXTfTErUId+G4lAl
	djr25sNuk
X-Received: by 2002:a05:6102:3750:b0:7a8:d959:bd76 with SMTP id ada2fe7eead31-7af1e2f30ccmr1173998137.33.1790246453808;
        Thu, 24 Sep 2026 03:40:53 -0700 (PDT)
X-Received: by 2002:a05:6102:3750:b0:7a8:d959:bd76 with SMTP id ada2fe7eead31-7af1e2f30ccmr1173981137.33.1790246453300;
        Thu, 24 Sep 2026 03:40:53 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:52 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:32 +0300
Subject: [PATCH v5 16/42] clk: qcom: gcc-qcs8300: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-16-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=775;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=pxpWIPYAAKRdf4CVHCE4SHi4Vq5Zm5vjxhNSS8g8qOU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3p+ZmrOqdYWrQJ7G9djCHjGLgXj+ko6yWl3
 a1vCqc75uSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT96QAKCRAbX0TJAJUV
 VgmQEADMm0B5druO6aYKKDtd/DTRDtznUHo5vuD5E9UzGCBrtSFZLwSJRrusvsD0RcmbtvlAXwV
 5iutS+kJJlz9VHticm3LYz8ZBuewzALTqZZlCxZ/t1deRMkif6O68Jmh9iqEBnLWZhUbfzccYpZ
 sBA8B3HyALAUj3kuf4iOim3IfMdhllbWupdRNbOf6ob2xLBDA/6hsl7BMC1a3i1M+KOZeXeE6hv
 i/lSbFJ+y7o6O8NvRLuODDCkrcrMs8rRD6Ht9KInTDc0wnmrPn0ppBS2w30o3ZZGoacRGc0oRHf
 sLneA0ETO0Z5RJl96h28t9wGmT7Z+bpxnB2YAT8rHu5m24l3PQ7bcePdINsx5bwF0PH5CbpNSCs
 dgo542iq8BmTbQNsPoagMKNI2yztII7w4FfmheXI2Gc04/AYfEMENzhB3ogIZDcwr5KKEuxB1BN
 0HEPpgbF8bk8Doj7xIu/9GTdObJO1RjOR4IqsotTm66E3rE4EFsCzLFxEfRksZtAlz6Xx8+XPLx
 jlyqjGU0Jl0wEUXG6F3k5EX+DUqD9+s0fktYlOQVntzDKDHbZZla05w0qwqfKthvTUNQ6tlg5E9
 zegv7X9xY75JZhnp68XaU7ROi9eWW3nKxrk/PWvvHWs0IvWR2SnLcjWN3sbyOdURdJRJ3Ueq94H
 mbvF4/IiQpHtmRg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX7nKmXk1w+ujP
 HGGNLcjhfe53ZF5z8GcdXvFv8LuAIBB1ztXgDcMsV40dhZ01zzHL4ud3G4SVylP6pO3vTkG/Lud
 QQSnS+GHek7sEyTUrnZI9ehXCpze5nhU33BwYeeuBMKZAsSF7QLvPodEx2DxP+DthvDN3hwiADP
 Hz0xQK2cs08yxRiNTUrOqcpG++9cQNk/nRvVIVhUNwy0gJ9fKXZn/3abqYpGDUREEloebShJwfV
 bonrzpIkbNgu2G2uw7mLmMV4Z8pBQvcB8VG1rmD7g+LGUx2UNi0+htJpjZtbgTo1deSd+kyNjKX
 Fq8t7lypfEx2p6sav5aJV99eIuVRI5IBMfijkixU3ZYQqukV+IOQQX9s9yb+h/0h1xnFfeYCUsU
 T1N4e9v4H/0JcB8c7pepcI6wJr/m1HyhjtJWAktLHjiKj3oJl49UaKKiMPPOivH1fCneLWSeeiu
 7n7KC4xZL2Oa+n5wnWw==
X-Authority-Analysis: v=2.4 cv=VPxIDNPX c=1 sm=1 tr=0 ts=6ab4fe36 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX33npI54m7y3S
 knmV6iRCuCh22CmTukezbqYbIGkVyrVDzIFPmML+Omn3KDdpltOmPCBMnC3c75vG4RqTg0WQCof
 RmgIJRCLRKkz1RAiKy1Ij9hIZ96sHDQ=
X-Proofpoint-ORIG-GUID: jrsHYGszSK5d7jliCjXyMwDTf-zwrdaC
X-Proofpoint-GUID: jrsHYGszSK5d7jliCjXyMwDTf-zwrdaC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcs8300.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-qcs8300.c b/drivers/clk/qcom/gcc-qcs8300.c
index 57014c4f8c6d..fa57c3989eb1 100644
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

