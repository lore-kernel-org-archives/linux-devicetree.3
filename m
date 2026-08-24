Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9604119E1
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572540; cv=none; b=q3arYa6jHnvNB7FD/OoGLMHmG1octvi4OfHOOTn9L8hm2Q8UOstUc/vzZ7n+X2zn4iLIaMDLvCQ7JKL/8IUjO38wIkCAkoAUSo/NNJh2oo4HgEir2xBxmu+4U2xQCPyhM9mHusSH9dSokWbAljYjJhnlffZiOuYFCFNLs+5U784=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572540; c=relaxed/simple;
	bh=3PG+8pzZrRsl1xoLIbdwVtCtK9o6pwfuixMqEuKn8n0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qGRby16DEUIu2bnOGuGGMFAut4BxScII4rswUyTv41XiqcjMniszqvlPEw+sRY2rjLgkmWed9/WPiP3oCwkMFgI3iZn1kqOwh3q3LQmkunldinMlq4hNjXh1Jnqndf7McOELf3ctEjbebLesT+dKGSerlpW1EeBL1cpLE5i4tYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FGuxhK48; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VjNtsoCj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FGuxhK48";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VjNtsoCj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMmSE2865074
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v/ympg6kMeMlMMAtCOGkGblawvs88Q3zczsXdXxfpSA=; b=FGuxhK48hIJ+qT5y
	YGSi38eWO8nD9GPSkPx9klXybvE9sdMw39nWm1/Yyf839zABAjPjQtoUYlT9TU82
	L2FW2+URPQvkc29jYxHep3K2J1mlOiF6+s/+Ih02kBljEyUhi5Xy9vJG7wHp2IXS
	3w0m1R5gtbuxBGA1FPZg0tnfAZactk5TdR3PiICVXYaYI6BNFKXGtmW2b64GTF32
	xmWuaw/0GvliS4vMrxJ0D7ezyAU4VzZ3EB8q+k7SMfQ6h0C+Tf9swdWFfF+VA6R0
	44IB4lLdhLNODjgTN8Eq5t2rCHoOM3TPR2C1jT5/UHN5ZeiJ6N3SLVxu+MVHBTCi
	eTg4Pg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8bdr29q8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:55:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93494cce712so426137385a.3
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 04:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572538; x=1788177338; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v/ympg6kMeMlMMAtCOGkGblawvs88Q3zczsXdXxfpSA=;
        b=VjNtsoCjDfbeUWanhKv244rT5z1KivaprZmZt4E0A2wnJqxrLQr0JpqzaF0+OrYra7
         6pGi+iTYfbxN7Nsc/e5jSFfaSxSisqVcI/HZ4UkwtPj9nVqzzPzOJLeJk8StiPmQ5LNX
         cmVhbpEvlUfgbjkCol5+NvIeuS9/+lZAOstwIydkisODh8VQu9puD2Z7TsCV9scGBuRU
         EdH4FEE25ExHAlqY969pQ/w9bZYx/pas5RvaImhDM/+92+U1ubSwoFoTE+MHV4GxE61B
         Nh68hp5aJqGTvyyZI7z5wGG6gwobps71/28uwWWSvcrfvVWH83WuJ4QdbVOqbWmDJ+R1
         F0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572538; x=1788177338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v/ympg6kMeMlMMAtCOGkGblawvs88Q3zczsXdXxfpSA=;
        b=bEYZg0+X2Y5uBUG+6hEqsWBPu6wXyvR/0fN5wYdxPSxDxwF2FJd03izLuL3S+AoTmV
         WXH874hLS1xthmR0Clyx0jHvp9Lbo7NFc6RW2FUcKYSXqvVy61rN2v1DGBUmHewmm8D6
         nybFKCpcHtqRsgqGMk63DFfO9f3wSKhZzAms1CLg1ynShfE3id78kv1gk45CqQM1loGa
         0ZOwrIJjkKLxqlQlwMSC1msy/Lc3ltfBShUo1xYtrxOAX0RkjcZWHKw7QxBmCRBLfdja
         Zm6Q7glnkYYARZdBvwu5MBuZCLfmtrWtZpJOM2vpzNaAGdcNw1VWrNLxK/GIs8HpW/Ps
         rUQg==
X-Forwarded-Encrypted: i=1; AHgh+Roo4SNbDQ20SBf+tS1nNb2t0zSARUc2ApA9aKlpKk+iak8TWEaLDx1j0q7cYrHrBhRR6fOwFf4b2gQ/@vger.kernel.org
X-Gm-Message-State: AFuF++ntfTXLOT3Yte0IxGlo+lspzBnkh0D0Hfgxft4lxhsVD1wPXZJi
	LLjcrW0Md/XLRW8wUdF5DpLKQL6b1mbxJwzASrhQmKYfpTajAifSYWeY2Zo+D7Im3Hisk5voZXs
	vgaiBGNGGW8kKBNLDHxGKezSW7tNaNDMqUtv+CopVU/Y97mxHIlHTnferbvB5tnpO
X-Gm-Gg: AR+sD11DZHiviwTntg7zsVKyrfJRXVqyBk6xcQjtmmM59Ipytq3py1K9J2GIO/d4ICC
	S9noYeAmDLJe/DJAAQZh3ipj4ZECd67NuVuPxF4NWqID3W83lQEpwa6AiQjM0dLBivbITbNxsR3
	qLIBiY/i0oJ0MyEAJuC3cLDf5DWuJranOenzOGwjqzxxhEQqUPBfELQbwZ834rPOrEtlP2YUZnD
	AbFTvOmwlrOs5ORF8SzOqRkJrsx1VXtH+hr8tAowkGuzOAIPzYyMX6HqgIO6ZqJzlpr/Co978nb
	jNA1qnQZGqiAJaNL/7/hgolaQYAlxEenLQlruiq7WU9yA8IX19lUbRNEitKqqoXWyJmEAdR27Wv
	FsqVPwM1u
X-Received: by 2002:a05:6214:501a:b0:8dd:fde8:68c7 with SMTP id 6a1803df08f44-90c80ff04camr255164666d6.30.1787572537421;
        Mon, 24 Aug 2026 04:55:37 -0700 (PDT)
X-Received: by 2002:a05:6214:501a:b0:8dd:fde8:68c7 with SMTP id 6a1803df08f44-90c80ff04camr255163736d6.30.1787572536822;
        Mon, 24 Aug 2026 04:55:36 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:55:35 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:05 +0300
Subject: [PATCH v3 18/47] clk: qcom: gcc-sc7280: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-18-f1205a92682b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=765;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=3PG+8pzZrRsl1xoLIbdwVtCtK9o6pwfuixMqEuKn8n0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDmY2hh7qjGzxIsb8lmqUt6ZKS8DG/HWHebm
 ZJOV9ei0giJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww5gAKCRAbX0TJAJUV
 Vpq7D/9vr+QUS7UKyHxlTeB7p6Rf2pa8+fvbgYGPAbV2itoiKyLNT+v7478h8/gNV++M/GT9T8J
 6SmsVnQUex23GdRwS+HWXraS0P13O+ygtLopGnJPdJrgolfIkCi8lqHhRovxXypzm8rx6eMv2MQ
 +9MrcvrJ6AGqOHcO1BhSAHLpDq8JaWcK0GLlikY/miwkkvylbbq9fx03WprfeNaZHtW3MNTBXqJ
 yuQY2F0XTxPWRcfyrra3fW++firxN/EbcI/06SffrVWtIa3t7jQ/C1O/vrUJhNSNnnxeyOeGQqe
 0lE6t9HZvEWkgYQaQnUVAG8ofs0UjPOqpyLLiNy011ITgkLd1jLWTaY/4oYyd5Dxg5oYsAEl12u
 gLULVvRa0s5LbXCbJy2ayIzyykiXw/6BqmtZMFJLMjEveSpPDBi9QDvfQsk0N9G8oOuHa7zmctA
 /uaUAgXDyMNPR9LPGXBdznxeQ2ItWvY5ypGwToMWQucowpq3/v72MvMDL05UtzH2iHec09Uw2XI
 CPBExeGKaYcKE9lrIFkUdh4VV/aqts1RZ6cBNQ3zW38LsgKNA3wuyhFhDU/pnDqCDFqdTAnz1Eh
 tA+sT5nuDYXNh6fnhVo6NKDkh2+cBDTQGbG9ATM9STx/uYlRLcGYvEqHUb8YjjUORfB4rG4e+ka
 YJg/CKABJujYeuA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX/8w9yDF032gM
 S94qexBsHKLHc/3FhzchPcrsYT6Ci2WYiA3sbScHYIvKmXi3GGBDpUUfJ/p26C8tIuRxt6/L/0o
 eS2gRHXcLKCzl5VXsZmHunMDL+zL9YZDepwM4T/X3dhYWOYsqIT6oWEmFSR/CNq5XQ+8XyBA+XL
 KqUTOySyH+JGa4fMx+Ncpi95b2Pjn0LWNwCre9kPnKUNtaF0hhXH1uLoitRxOZ24NnF3JJ0gc7u
 RSdTlUPYt4gutIvI0sD48mpCLgnxvMa4ZzZvgRfO7OZiwvPPcMr3n820DyVP3PeFpVr425EjBiX
 SyIOBytd5lc3Fs88jHaZ+YevGfQ97lDWLyTruoFXky5p0Pfw8lOA0xSlI59HuLho23sBJ8bBv/r
 lX1w1Jqm5KjRqglTEibkD9H380iFauKaxvscoip6wzKjBTrXGzFMcZcsh9GpKlOe+HnN5gOWyZ4
 yK4/eDy+NdHU40FABJA==
X-Proofpoint-GUID: znzkRTDVuZ1mvPFgu3D-f3MbrDGeAgXF
X-Proofpoint-ORIG-GUID: znzkRTDVuZ1mvPFgu3D-f3MbrDGeAgXF
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX2SeTNZJ/bYQi
 8LXlONHXguWq7KRw3tvFjNMqo07QYFJyHCuC5HH2mtbXRsE27zcXCt+1qPLd30SpTGCUHGYbtqr
 ukqPXPJxHsSEV9v4LB+VQNhvJkSo1aM=
X-Authority-Analysis: v=2.4 cv=W8cIkxWk c=1 sm=1 tr=0 ts=6a8c313a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240099

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sc7280.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
index 4502926a2691..bb8f6efb88b1 100644
--- a/drivers/clk/qcom/gcc-sc7280.c
+++ b/drivers/clk/qcom/gcc-sc7280.c
@@ -3446,6 +3446,7 @@ static const struct qcom_cc_desc gcc_sc7280_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sc7280_resets),
 	.gdscs = gcc_sc7280_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sc7280_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sc7280_match_table[] = {

-- 
2.54.0

