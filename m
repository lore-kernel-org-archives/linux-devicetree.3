Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10C13FE67E
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 11:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778670680; cv=none; b=YnUJCPTDOXICjZxIODiMqilNp3aGIhxoM0KTbN9WH9tt4u/IMsG717huJpZ0TOHtg2m2oygLvGEuO3IVcK9xF6RPgYfRFERhgYJR/zUBQq6aYAMF9zck63IxtqumpAOiNMFUctTZZGdavsMdUuZs4b7WQIVA+fmCcHlGVLajlz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778670680; c=relaxed/simple;
	bh=unXHxR8eI7CAM6X0szEWP1oTO5FFWCiBiOJlDhM8DpE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DIiWHXTEiupyqFNGQ627XfKVXvjGWWf12hotWU9n6JIjmsyx7EtJWeRyVGEesV43ItXAmbkp6u7L79OrgNb6EuCYnLLoTOBKXbBFfWK9xxLg2RrbPw3NKhp3w+8lyzwzgtQrzxWWObltjh9CAUsQDuRPkirvX19+62b4EfQCEBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D8dvc5Qj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LmArbSKm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D8dvc5Qj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LmArbSKm"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8xgSQ4161718
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 11:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yWOR3fUfJrVm8giOm74Q3ACbFE1SY1ILKZsEeCZoq5w=; b=D8dvc5QjEerq2VZV
	w5DPb1gVfOSmtSjg4zYZjmad59xUDlr/rDDVOoqXPPkDvx8c3UWHnJQ4N2ifGpRn
	0v9OXCioRlajEkEPspB1fRfjR0HhZ+/wuEqmIRl6W0yJz7lVrEh3s42He2Gnn2Ra
	VOBMYzzGUAVHQiys+mT3v1391b8XDwrz673mbGQRBAwo8pLNDHiv3TQ3OlMsyMGW
	va0ig0mSxa/g0cEvdP5KQ7xh4N0+w6y/HiH3NrhismOTwiyqbOaemA5CQP9euPss
	roJFd7SdOUSjMzFFL1ndwbgND2FGMhTY3SrbqpKakrOPbm7fDVRIXwafQi+A0YjG
	tfgkKw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91rft1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 11:11:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d9a6a853bso125984101cf.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 04:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778670677; x=1779275477; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yWOR3fUfJrVm8giOm74Q3ACbFE1SY1ILKZsEeCZoq5w=;
        b=LmArbSKm0mxvU8skeN6wdV/YKogw+mvIbYfM3wHI28HINkQNxro9lKLpBKF15X0P2e
         Mpp3E2aG4FN0Timxb8gU4jlyQPtzCUzOe3Ik0p7H+x5ta0aeKYXcvSTHWAu0kVH2vOkN
         hZLgWj/xYTs1DUMGW08opCWLwrhodQ90nBi+iZEAxLnptsafrXsgFXCUKaOZi7h/KFdB
         vAm/6AiXDPGu3B2L7D42aOgWklrqhThzX/Da/age592Z4IZetgjkwbpgwTe8f6skxLU2
         q2zvOB+HnqJRKdt3zS0D1mjWXfVx++5t+Fh3rPaiQ7doBEYL6hwuqVR9Uj9cQq1Sqq5Z
         hEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778670677; x=1779275477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yWOR3fUfJrVm8giOm74Q3ACbFE1SY1ILKZsEeCZoq5w=;
        b=fo5BsfZjK6OMPW2teey/l8XwahAnrxiFC63BcgYdlpaohsEGcqp+mJbY3dghSOwG5n
         Mt24NyALRuPKPm4LWwq+A54FdFp0EVq/ijMVUh2MXQOuS1oeSOxcMLpHewhipmVvCcwn
         PvsMcge2cx95ODFZGw0OS13LmAlXaG50EntQVH1d8ArE22rAwgFY32sL3WuWE1fiKGuo
         l9+W6ZnKHKr+v2CadnK+P9scgGLVl8SHgJE1JahdvA0mUqA7OaWU1/0vpJV5t4GpMX7x
         FkGFTj07qFieHjfLdZtMEnrg/WUKfOrr9gS+E2zUwWADrWj9BYEfcYER6HRPVnYrKUQ6
         SjMQ==
X-Forwarded-Encrypted: i=1; AFNElJ94dBgIfmXf1ogoMmqLchndm9oemaDfiBaRRp1mGG5rZZ4LP0MWYlb6oHIypgxiZat50un4Q2THCQzG@vger.kernel.org
X-Gm-Message-State: AOJu0YwTVJ0R16repDp5F7U3d2Cd962On7mL/86LcCwizcODCdHV6V1T
	kvVxaARSsEu1cFY/uiUNR2H/3EpTlLme4nOn0poFaDZftO+bUBvtQo1fEUXEL6fVGnuGPlvKbQz
	7wL5xQSwtzUR+hU9DctjmI7zwRs8IM2/36rr6V4ZSWCbwITmguQ23noMD7euPgEpC
X-Gm-Gg: Acq92OGwhsizcFdaMuw442dry0VurzHFTaeY9HNPmjQ6ziWB65xo7fSYknua9newoqf
	kGtUTBnGYbH71cR/tuq+9sqkDgRKBt6meY79XHT/qjgTW9RmdDhkElv8iosuFfNFnqje/GJcmqH
	lCyOrUsIXokQCbAdhf43LOQgpyQBjCg/aV8R3cireAXEZ7cURlcWWC13WLTYXeXgraXiAuFPU/8
	WEUOJXwg63lpdwVMppJ6h+rLKPtHGzWdsQuzgP8SW5Y2r+YG3XiJQrkTd+iq1OXxIQRHOZiTizj
	xSFHjDT/tsBTRMvyHNW9TdBNmTLOLj0Sj5z+SII1DTgp6S9nGvtmmNM23Gbjj44pVnEgfARdCLi
	VSjr/7iklUySk7da2CP2icaOKwL4vdw==
X-Received: by 2002:a05:622a:38d:b0:50b:4337:179a with SMTP id d75a77b69052e-5162f42300bmr38982251cf.3.1778670676766;
        Wed, 13 May 2026 04:11:16 -0700 (PDT)
X-Received: by 2002:a05:622a:38d:b0:50b:4337:179a with SMTP id d75a77b69052e-5162f42300bmr38981661cf.3.1778670676261;
        Wed, 13 May 2026 04:11:16 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8cd49fesm72081355e9.0.2026.05.13.04.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 04:11:15 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 13 May 2026 14:11:03 +0300
Subject: [PATCH v2 2/2] soc: qcom: llcc-qcom: Add support for Eliza
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-eliza-llcc-v2-2-27381ae833d5@oss.qualcomm.com>
References: <20260513-eliza-llcc-v2-0-27381ae833d5@oss.qualcomm.com>
In-Reply-To: <20260513-eliza-llcc-v2-0-27381ae833d5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=5303;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=unXHxR8eI7CAM6X0szEWP1oTO5FFWCiBiOJlDhM8DpE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBFxNEndCujm6yY9h3LiIlhGZCFG/d7OoTgvB8
 5VIhwnEHJ6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagRcTQAKCRAbX0TJAJUV
 VpDnD/4m0d7E0z/VlyQbfX4DObdkwd5UuuJRdj6PKZTvhhviTeSQPFQ+XYH1J1lGoQ1DsCzrQJc
 OXBuTTxBcLHQZ6QQqkvgdi6/L7BaLrRnYH5v0Cji+2t3n8X6hvcRXE8ew//5XOrDBWTfvU/uT93
 VEZGa0MJgURrsajgX94bwcdpV3FW7KS5TVq9JWYos6aB2CThI4d0vZRMNsyQr3994abLmJGyYSX
 QARb9fSulijxeMFyLUQUXI1ZKeA6iG4qa5GKAIGrNduKk4Ep79T35QPiwkAs7HsPDv78H4tLhPp
 CHgK2jurvQy4QBbfFe/JwoNrOpKCZiZzY65rC7t9t2yFkWS7aGNMxOGgw3G3GUV5/YlydW20PIM
 Q73CpyC76p5MQ2o0R3JTZei3hI0aaencbsuZImH6CNdqtoeVVfD1G6h6mQ6Y49msPvrcck6u7YS
 3UnxqB9Hw+w5yGqHQ5IWOvsyVMbjrytVwJEulzLnUY1DKYP9rHPOmAR6r0SyBEOH4GEb1GAndUO
 W1o6vKiy9+YFprwWR5MJMY95reiePSFpw6loDFlb4d9KtEqS9ixG1qxjddrg7N66hqkDrK6a8Es
 mpo9X8WyPjSKRdCl3EPiHQAqcbOYDy/ATG1Yi5NGZlg6DwVxxzO3vFn82iNkCX11499VySyIye7
 zbWFUCr23P5jiPg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: A5bS_mKnrq10QDfgwYxKhJNah-IekVZE
X-Proofpoint-GUID: A5bS_mKnrq10QDfgwYxKhJNah-IekVZE
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a045c56 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=wb9JsppOdc8xHW6LZk0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDExNyBTYWx0ZWRfX3wdP3t9PcweS
 Mt8KZyoQCq8K5pzGkVHy8SEgRp0HpNuJtioauPZ5Cv8VEzFr8+qWLLQ9ZW2QYFj2ZLluxKI/JD4
 then29YhShgOjRUVybXxcy0iXPXeDDyRwdr7Uv0EX+LzeaxN+V95rSqZrpqx04FtNsqiTPx7A01
 seKl9Kqur2domYJm7C+BP0+SRJUEOaeEwSL82K1D/wZfJlY56cqm0lNgf2P4bTCI7KgYXfMqskv
 t8GDN1ilkobqpfZKJVL5AvOj60rl/gQSdgBlHSiK9lI0bradxBJWu/S8Slmc6qk3fo4WlPWnHiX
 /7DqMD+gP+wFPorYGBQwTwzsekv/SqOR36QhESUEez7dtJA36pfkfpRCAOjCEbK5IEiIqX900zE
 hEbfhe0iibvY+COgxP3Xz4BQGrEemTdKb/sG/8t9PIlVbjL2Nv5DQYDiZ5K66TvCcCr3QEASPNl
 VmDui88CUtauGGVXnfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130117

Eliza uses a 4-region LLCC register layout made up of two per-bank base
register regions together with the broadcast OR and AND regions.

So add this SoC specific configuration and its compatible string.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/soc/qcom/llcc-qcom.c | 180 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 180 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 0161ceec8842..7c05cb3619b2 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -181,6 +181,171 @@ enum llcc_reg_offset {
 	LLCC_TRP_WRS_CACHEABLE_EN,
 };
 
+static const struct llcc_slice_config eliza_data[] = {
+	{
+		.usecase_id = LLCC_CPUSS,
+		.slice_id = 1,
+		.max_cap = 896,
+		.bonus_ways = 0xfff,
+		.activate_on_init = true,
+		.write_scid_en = true,
+		.stale_en = true,
+	},
+	{
+		.usecase_id = LLCC_MDMHPFX,
+		.slice_id = 24,
+		.max_cap = 1024,
+		.priority = 5,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+	},
+	{
+		.usecase_id = LLCC_VIDSC0,
+		.slice_id = 2,
+		.max_cap = 128,
+		.priority = 5,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+	},
+	{
+		.usecase_id = LLCC_MDMHPGRW,
+		.slice_id = 25,
+		.max_cap = 1024,
+		.priority = 5,
+		.bonus_ways = 0xfff,
+	},
+	{
+		.usecase_id = LLCC_GPUHTW,
+		.slice_id = 11,
+		.max_cap = 256,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+	},
+	{
+		.usecase_id = LLCC_GPU,
+		.slice_id = 9,
+		.max_cap = 896,
+		.priority = 1,
+		.bonus_ways = 0xfff,
+		.write_scid_cacheable_en = true,
+	},
+	{
+		.usecase_id = LLCC_MMUHWT,
+		.slice_id = 18,
+		.max_cap = 256,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+		.activate_on_init = true,
+	},
+	{
+		.usecase_id = LLCC_MDMPNG,
+		.slice_id = 27,
+		.max_cap = 256,
+		.priority = 5,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+	},
+	{
+		.usecase_id = LLCC_MODPE,
+		.slice_id = 29,
+		.max_cap = 256,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xf00,
+		.alloc_oneway_en = true,
+	},
+	{
+		.usecase_id = LLCC_WRCACHE,
+		.slice_id = 31,
+		.max_cap = 256,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+		.activate_on_init = true,
+	},
+	{
+		.usecase_id = LLCC_LCPDARE,
+		.slice_id = 30,
+		.max_cap = 128,
+		.priority = 5,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+		.activate_on_init = true,
+		.alloc_oneway_en = true,
+	},
+	{
+		.usecase_id = LLCC_ISLAND1,
+		.slice_id = 12,
+		.max_cap = 1280,
+		.priority = 7,
+		.fixed_size = true,
+		.res_ways = 0x3ff,
+	},
+	{
+		.usecase_id = LLCC_CAMOFE,
+		.slice_id = 33,
+		.max_cap = 1024,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+		.stale_en = true,
+		.parent_slice_id = 13,
+	},
+	{
+		.usecase_id = LLCC_CAMRTIP,
+		.slice_id = 13,
+		.max_cap = 1024,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+		.stale_en = true,
+		.parent_slice_id = 13,
+	},
+	{
+		.usecase_id = LLCC_CAMSRTIP,
+		.slice_id = 14,
+		.max_cap = 512,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+		.stale_en = true,
+		.parent_slice_id = 13,
+	},
+	{
+		.usecase_id = LLCC_CAMRTRF,
+		.slice_id = 7,
+		.max_cap = 1024,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+		.stale_en = true,
+		.parent_slice_id = 13,
+	},
+	{
+		.usecase_id = LLCC_CAMSRTRF,
+		.slice_id = 21,
+		.max_cap = 1024,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+		.stale_en = true,
+		.parent_slice_id = 13,
+	},
+	{
+		.usecase_id = LLCC_CPUSSMPAM,
+		.slice_id = 6,
+		.max_cap = 512,
+		.priority = 0,
+		.fixed_size = true,
+		.bonus_ways = 0xfff,
+		.activate_on_init = true,
+		.write_scid_en = true,
+		.stale_en = true,
+	},
+};
+
 static const struct llcc_slice_config glymur_data[] = {
 	{
 		.usecase_id = LLCC_CPUSS,
@@ -4141,6 +4306,15 @@ static const u32 llcc_v6_reg_offset[] = {
 	[LLCC_TRP_WRS_CACHEABLE_EN]	= 0x00042088,
 };
 
+static const struct qcom_llcc_config eliza_cfg[] = {
+	{
+		.sct_data	= eliza_data,
+		.size		= ARRAY_SIZE(eliza_data),
+		.reg_offset	= llcc_v6_reg_offset,
+		.edac_reg_offset = &llcc_v6_edac_reg_offset,
+	},
+};
+
 static const struct qcom_llcc_config kaanapali_cfg[] = {
 	{
 		.sct_data	= kaanapali_data,
@@ -4397,6 +4571,11 @@ static const struct qcom_llcc_config x1e80100_cfg[] = {
 	},
 };
 
+static const struct qcom_sct_config eliza_cfgs = {
+	.llcc_config	= eliza_cfg,
+	.num_config	= ARRAY_SIZE(eliza_cfg),
+};
+
 static const struct qcom_sct_config kaanapali_cfgs = {
 	.llcc_config	= kaanapali_cfg,
 	.num_config	= ARRAY_SIZE(kaanapali_cfg),
@@ -5238,6 +5417,7 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_llcc_of_match[] = {
+	{ .compatible = "qcom,eliza-llcc", .data = &eliza_cfgs },
 	{ .compatible = "qcom,glymur-llcc", .data = &glymur_cfgs },
 	{ .compatible = "qcom,ipq5424-llcc", .data = &ipq5424_cfgs},
 	{ .compatible = "qcom,kaanapali-llcc", .data = &kaanapali_cfgs},

-- 
2.54.0

