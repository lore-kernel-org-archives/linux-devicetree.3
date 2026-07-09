Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EA52E7F2C
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604528; cv=none; b=i6tTfRznst6SERHquYi+4hdW9HK831HNwsjmq4WZLe36nVyeGHjrlmSUFv6ByX8HrGMLDuLeeGnaFpGZIzibyztGgjHo5caLM5kNg+rhi5MgbjdROLaDrC+24BH8lmjAgKuVvxQOs2fQXQOUcTR0jWFalmIrMXzXioBFGC4O5WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604528; c=relaxed/simple;
	bh=aFCxwN+s0nObB9dYmcqshZUCs9EjeMcuhwbHJaldKhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WHGXUq9rhjFF9nLH+lgHh23rzFPd2Kh069T8UAdk3VfvJzx2CjX6ri1MgaXbXW8WO6QutFPaQojjYtkpSudnnp8xq7nU27f/KDYD6BBnMjXgn8Ysy8BevqnsQBcDlcEBPLSISYNdKjoy19i/nevUHi0iQ8doKEXuyPFinO9fTn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DVBOweLn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KrqcAauz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DVBOweLn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KrqcAauz"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNE1K1488714
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 13:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=; b=DVBOweLncCEeuBQp
	aJn6atifK7NkVSTcYRiVTQ13lJlSI2gmjv0vWXDHXSzcINvH+vOMBXZ+RmW0NqcM
	w4b/DyqYNWPHOXUsoQj0zWJoA1sZTpxiPRXD3cphnw/sVjr2kbDa4KNOyM+hmAuz
	gig5LvdXjvoJe+tZQde/6cZYdaUjl+fSwF6IvcR/8GZOtYMirHwd/kMhqwESLWsn
	iXs1mMBvqyOD+BYuFWKieETYus3jFc/Vh4s/FJnqxZcQPUMITasdNkGGsWGb+UgI
	WcyKCpwtYm+AxyyrradSbc5vkDPrgJzqYToqUH34zPcQWG+VWQIUQUykhEAxARVO
	Mhf05w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9wwfufr5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 13:42:05 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-73a8aba30a4so858496137.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 06:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604525; x=1784209325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=KrqcAauzIl2Kb428LBZm/HnENWqzsncN/WZ6j/zfBLdwYCPWDDgifyVkwtZSSIwDsB
         c6LV//6JA1Uer3J+8JWXXp228lRTvPrb8K+I+hL7PR4mdWLFqIe8i5YC7I4acIAX8oxB
         xe21vckOsBCuZ/F75KwTC2BRgDLko+Y7kw7ex/HU5JErl3JW1oeJ+fhEYy9PW5MANq9y
         uLoEAvYdi5CDF1JFA5jkVXfb6wMZqRIGfipt9LGxDlY3j9N0An1U1oSXngTySJtrBqBt
         PzPpWldepgXKsIFQIpQfhqnKtbuwxkuDQQ1pui3Bni7mgwvY2+JFxEbphhOrO/4vKQkC
         7b9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604525; x=1784209325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=qt0PuGLKxqW2VxEsvR91FvTJLbYik6U+iDumNIL3BQ0bpyWMTj21lNiQO0symrQiQl
         fAmy6cDGLMg6FWu57FVm/Mkxk0IdQlaVvIt2W0kDQNkJF1Rifvc7cDMhiSytBwEWjVme
         BDCZOSXBgMRnlvz8WUBgSwbkwye40A6WT6KR36YzfghDDzLyJtVPDJ1AinkgcxLtBbGe
         X0DP2p5Awkw5MCQFFqR64//ydl/y+Gz4xQdGRX4ro8nl9Fv3a5DQFkVPq6Q0kAjmrvMo
         K7XaqHVFmZqxta4jVPAodObRC8YJe5I5P1XmZvv9sFWpW7g70QxiZyd7K6gpvfSxbfNx
         hzow==
X-Forwarded-Encrypted: i=1; AHgh+Rq7TrjJhLm3FNMtuneYXW3opiOPV0ifI7Y3iydu3NbJtrq2Hmqq3nQWajtM/pYJggfxC2u7/qxl3H9b@vger.kernel.org
X-Gm-Message-State: AOJu0YwT5POBe2F2C5ubiW2lWLdSNUhOx8a6DWX3kcooH+BHkg6QPBo8
	/ycuJG9MsRGHgVXjNkQmhByWV4wZOu1opvbgcVZJaECBxc7ka9lqSocGXaUmbyShnAnuAZgO1hG
	7afAtip/jjBFWA/61kT6kl/gDJjoWTEPbuidkp5wMhmnqH6uS9xa1j6B6TWKa8DnH
X-Gm-Gg: AfdE7ck9JWI8GPSeRDoxaUoJyhQ75OmFhyDcgGumSFTL/JdFx6AFVxdA0c7DOMH0d+5
	yBJdVexW3KJ9W9XeI7GcQRkmQlxKuZt1U6zmdh3qTdW+5uwgI6JG/XPJqDuA23T+Ww73TtFKDH/
	JZYpA6zqlxgLKqpqDNDr5ko6sdpz6ruSmR5xtQvB9ZQaskQ3Xhu1cNwkHC39984Q3OiYiLfzTx6
	T8vIWzf7YMy3+1OVAlk7hNItT+DSFXEhi+vQD2JwD9ToNPrOOmm1GTcmfXoNq/Dv9MpDxHJ8Lmg
	UUcSpwlhiTjyAjYG03LQQI8/jUP1vdnkRGLhlMlHdFaf1ncYUW7OOsogTUkCjOe2dmgzGVJJ410
	UrKd2vJtMKdwMAOzeswFjCWCrQPSRI9voLb7uot0dMLC5PNoHbRqM41Tg5OUEyyk7cak8RlKY/E
	d1vLCWK3j0y97qpWMApLaS7EtZ
X-Received: by 2002:a05:6102:a1c7:10b0:6cc:e6b1:7f84 with SMTP id ada2fe7eead31-744f67bda98mr964027137.17.1783604524949;
        Thu, 09 Jul 2026 06:42:04 -0700 (PDT)
X-Received: by 2002:a05:6102:a1c7:10b0:6cc:e6b1:7f84 with SMTP id ada2fe7eead31-744f67bda98mr964017137.17.1783604524468;
        Thu, 09 Jul 2026 06:42:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849186e1sm3345151fa.9.2026.07.09.06.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:42:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 16:41:53 +0300
Subject: [PATCH v7 02/18] media: iris: Skip UBWC configuration when not
 supported
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-ar50lt-v7-2-76af9dd4d1f6@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SkhEj21efbGwh1OhN+7NneptPnsqOcydi7iGjY56ptE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT6UkTyltGm6klk6UVSEKXHvenw/SwzjIU97dy
 buovZCU3WGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak+lJAAKCRCLPIo+Aiko
 1ajjB/9eEgHNKl+uxgKqYjT7r1nLgFLRKkiwjoiDtq8fhPz7YxiolvrPgmBDy0MOSldgFB/Abez
 Y4heJx0O0QUGlSbqFm0E5SOkNdGZPH0n/gBHSw0odJO4IlJfVCT5geAxu+OQjvY4Hl4M83oU+1g
 SHRGiX5a5uvPYdU//Umfj2sdNaqfxgeF5RZ3KXXttMJaXgVMdZFOEbMRe/hV7z1p9ORVLE903YG
 bUv7bHqBa2qO78Us//3sMcDrSQ2lCkOu6QBI9Y+Zp6OABzdPXCao6j8ZhQeR2SOtyUb9PYId+rR
 aJLU6FW77WWSGAf3mG+FGgXvInXZTPitZaCwuP9hWgA+2uTM
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX6BRYnjrnRaA7
 P2b9B+kykPYhQ9B2Hq/mZiZZyPF/KtZT52xSCdlJ2M+B1bLq3A5yMvJfDL6SJGBfUzWQy4pOdRk
 3oa8lE/sOryDdJACxi9n5vjmSkWacswlTFGkrJyU54sGXj1HNsteuF+U+bQTgon7MF63/5zgFqF
 /NyJLw39ImRkGoiJeauiBDATmMFi7Z++ssmuqcmcNoPKns30tRQGRoRk+CCoYNvKkexjuQg0vHD
 OuuIApCGpVfztJLdsWTaIlk+OM3Jn6nPynjXKdNM4FrbXbEKdLjjopZZWnfwjGqnbJHCBTg/xSR
 jEKwPSRYDK5HjNaq3BxutMWzv0InYBE6DTr0fnsfCo/aOZOy0OTMqKSC44MqxrsE7br1imVRtw5
 TRbRTF4Vy5smltm96rJgAb5G/K/NLP8FKR8yG0OyA3CLZi6hPjJtYnU+t0/jxIT/9NRjKftUsrh
 zxnDLPukUG5C/LOIC8A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX5C5HfE8VLNJX
 wkmcqimmgPkxCplqCnERDWRXCrBXjwKtZfcjTckC0z7+ILijVmVUZCq3B/GvepdiRoo8O5HerKe
 1XVi1/u0D5/MnBFwnlr/8nLnSuq5+nc=
X-Proofpoint-ORIG-GUID: eWk3Wo86xLM9HiY-SM9eu6C-sLlR5r4d
X-Proofpoint-GUID: eWk3Wo86xLM9HiY-SM9eu6C-sLlR5r4d
X-Authority-Analysis: v=2.4 cv=Krh9H2WN c=1 sm=1 tr=0 ts=6a4fa52d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=wrkyJH6U6m0Jdbs6q_kA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090134

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

UBWC configuration is not applicable to all SoCs. Add a check to avoid
configuring UBWC during sys init on unsupported platforms.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 0d05dd2afc07..6e04175eb904 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -140,6 +140,9 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
+	if (!ubwc->ubwc_enc_version)
+		return;
+
 	payload = qcom_ubwc_macrotile_mode(ubwc) ? 8 : 4;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_MAX_CHANNELS,

-- 
2.47.3

