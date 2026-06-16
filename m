Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E7426B2D2
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568346; cv=none; b=SMeSjhyqzyGzu7zWIv/ZzSdZwz5YJqXQUkABa83F9/wc4tJF0MQd2VLa+GpieGrZjcLnb9IVxfDNashehE6HaWQ5ebn+NcNqXGTvTcefVlLL7z82ToAOtKSbNnACg1NgoXdVpRdNDbcrJQGSVUXp1LPVyCj7OOqQyOEH0cht79I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568346; c=relaxed/simple;
	bh=RfGmISJ4Tg+rlJIDtM2rxs9yeQZR7HuRyIw8EI1Vrgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QqZoihdTbmNXDvYuFrRJTDpsQNQWt4iGSRVKT/J/z6G8Oue8LdRUb6Mz9qy940gV3xSVLON1yZvQ4GidiBxMJF68pUqZ1XtR+r1I5wc7EDYcsTOAK6EJSNajLfxt2cdL88MpK54qqUQOzeEmCMLJxa/ikGwpNA1VRAQmhRDsuCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AVrVNFy/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=df6Zx6od; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AVrVNFy/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="df6Zx6od"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FJ1OaY1220552
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+lsgrKk9p/S2kXHtUz8qoicwfhLPPm3xQs1fSPkm5/g=; b=AVrVNFy/q5uNNgMD
	y+1pVvyChCIaRBhxOlMYvyHRzVjEiJOkrOvEhrfpkOvGM4vh9spCMKsINc8Slmma
	fYo6LfatAaJXHbLYa6Dsbu0kB46w6eaozRnZ3kHztDsKn/qD1BYKaaal9uP7DnCg
	E1KOFT3dRH6GBcIpdf7e3MWTV2IkMIqW+yq3gAF2pLV9yXOBjxbgQlsEJ5yruVck
	60o93tfbN2W8+3EAvBXyTgCPjzVjqeftAJhDJRj74yS1uCrd+4gRgz7ANfYv2+zo
	Q7Y3wG5I1BZKXhHPMFXhNOinPDo0gVxUEo7bFFXczSS8awGm5SVddoeL/Fh6svi1
	azuocg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etevx3pgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:05:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91565f8c589so691857485a.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781568343; x=1782173143; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+lsgrKk9p/S2kXHtUz8qoicwfhLPPm3xQs1fSPkm5/g=;
        b=df6Zx6odEloYDWzu5So+EupvddhRe3+CZc1ptotHO05KGfTkbmaYZm+vXf/TxyJ8oe
         gvGU/aUT40zt3Ma2Nqb+BEuOmqpU2pukcC4hWnUlRlE/92nlVuKSFnzxtib17DQwvYTG
         p9kGo2aIGSmTnOFOk9YH7QrthCcgiSu3E6Q+EKKED/DO96oSpKB0J18q8tke2vtig5F2
         9HyWHQyarJZEvckJFv+sPhh599mXpYMlCwRGVI2nquErCp+wkvDR0KGMrFG20kf6yquJ
         d7GqjcmdGLRAiTbUMzr6tl5MCqHsYlohTUUKvZM77zlnzBSsfgCUOlYZdv0fkJuA7axZ
         ibVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568343; x=1782173143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+lsgrKk9p/S2kXHtUz8qoicwfhLPPm3xQs1fSPkm5/g=;
        b=WAqjd0M/GW8KIPw2dMDxLrnbeSouw4OubwB3cmsuPOBE3EeMB6BZ04k/X7y9zebFx4
         Ub86QhSZIo36GTak1cjqYTJ5ieu29Ia5bXhxoWXwB9sg5whaqjnUx385gZQqgGhB9COg
         eDPs1RjRrhGZJFjZWKLLMZNWQhAhmpkkiWzAImh9A0l27QzgPNHvVfOQO82cDcC2jvoM
         /TrTDov4AxZqBNiudFajIdI4dPcEgiDWQIoACAbtA9anG9Er3aGbBlNFg0sv8GgOYWDh
         3OFrnNWIoP8cA7m2oRAzDNsP8XEy3NcntZwxkZqoY+YbHRSom6gVpXl8AW5fQ53xmJCg
         qjhA==
X-Forwarded-Encrypted: i=1; AFNElJ8U5etf1NeoNPhnL1UTKnFFYFw9z6v/ewqm2fpAQRYugagYm7NkNNAG7NTjKm/B8c13sAy8yAujCS0t@vger.kernel.org
X-Gm-Message-State: AOJu0YyGmdSuhO0l83arE30NdHJvBqV3kyuzfo3aNZfby/kKRPLJn92z
	0oXIlgsK+/1iim/FEPsLK8Rc8ghC7AHIW4SCwFotFmfd7ielI1hWcR3LmRcSdG23lF5V4NilpoG
	u0uxKtvdX3HQ2uSxGwKxmciyxmF0LituxXRuW8PgG0ca5tace8TQ1C134gyHBUchs
X-Gm-Gg: Acq92OHcStqsewsK8uLxm83A+FMd2iPMbBE2BoBkcaTW78OEVVHfinxuJIqY1/8jE8T
	v/M3LROeY0l90dGqbEdGxkxum1Ti1ovGcKoT3oeIa4QRxf88HgbGdIVVw56t6VgjNBQGreUGRqG
	fx4STPLnqTEe9vYWiWyb5otBIv3xNAizOJB3fVBmf29hyc0k71LCXfSX/Hyh0lfMUjyWklKQMbo
	C0G5EwZxDCRhH+MnXB84RHTQTrlLNyaZVJRDHNFfmiMDld1gKfivgztZsyOyRishLjKZ2UCOxhk
	ywhteNlJMQCU262XUTm4YdOIzMisBkDviyLi5YBslTc/h3DjQHsOzTbO9Z0Wf7kLaVqSMFQoEso
	WXt5NJesVm5GqqnhUJfigmLoq5757jsNlIAcqxtg7k0poRDEymngrbM/cIwIm/EWnvuPzdqiXO2
	1vkQvPokIZ3vgTlnDperFdjBV+8fOSQmKYiwY=
X-Received: by 2002:a05:620a:25cd:b0:915:4c9b:4120 with SMTP id af79cd13be357-91c2f8a532fmr237278485a.37.1781568342749;
        Mon, 15 Jun 2026 17:05:42 -0700 (PDT)
X-Received: by 2002:a05:620a:25cd:b0:915:4c9b:4120 with SMTP id af79cd13be357-91c2f8a532fmr237272885a.37.1781568342274;
        Mon, 15 Jun 2026 17:05:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7092sm3015731e87.50.2026.06.15.17.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:05:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 03:04:43 +0300
Subject: [PATCH v5 16/16] media: iris: constify inst_fw_cap_sm8250_dec
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-iris-ar50lt-v5-16-583b42770b6a@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
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
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=901;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=RfGmISJ4Tg+rlJIDtM2rxs9yeQZR7HuRyIw8EI1Vrgc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqMJMQ+9/MTBoo8zy5/Eect8ALxjYmFFWBT0NOa
 kTUllzxVvOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCajCTEAAKCRCLPIo+Aiko
 1TY4CACSG/THyXnQ7tfqFwmQG82iyICvVWfIUH3JWjZhxBfxF7EDwfjQQEjMniu8MtUQH/mY5Ku
 IJxujjZ28QvOViF4qQA+7BBrvJBTmmbcHLbKuDMSkPmqSoyOk9ytPtTikyoeSU7IxBXq9iIdc3x
 UYswZ7tFZYj4YCca6WCKCdcIEawOCZoW34B+gh8V1k4upHSnp0Py70UTrTxwKiPnC75D0RaBllT
 dkCZOIoShVBp1bsjVKgjEFp68N3aCxrt37gS6IS4r+P3lWsa2Epdxedbp8Fspl8w7haGYx8bYgx
 Zvo5oyv4fJ0x5CpV4r+iNteciGNZ4uriKalKVmObd80sYGMJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 4rkAYX-lcSZ4-3ucX-1PUx4HoHNjHSaQ
X-Proofpoint-GUID: 4rkAYX-lcSZ4-3ucX-1PUx4HoHNjHSaQ
X-Authority-Analysis: v=2.4 cv=f8t4wuyM c=1 sm=1 tr=0 ts=6a309357 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=aSZcYj2XgHFsS6ESuJkA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfXx7cHRM7XWO3Q
 7eKP9psPot1qclX648l2mFsw9xSxoxumoBhaaLkQieY6r49YtpugTQ/9oVIgB1vjAe5iJqftlCX
 2Ff2PQIMbXnXz60+yWJ+x8pvmql4RUA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfXzPrGZkZv41LO
 UQOCqPRB843D+LTnzdyy3bq2NlBx5ppbgJBeTV3nNp2QwTlXjUQ7bVMwz2EqmWuJfCML1IRpeXc
 105AS6sHkspQlmslmDpzX8P8pbswAcpyY70bPqtZkQm72I9tTGjkH/F1J5IJlIx42hcXnGWXgea
 NAHWMsXl9S1292ChmZcgKV3eq4JXBx4hqbCEoIpeaqJ6O2lVAztSsbmoGgrSvTSJLk7LeC7g/TG
 R96RhZYiDKnMNvcCe/s32Df0Z6djN4r/lzdUq+lV2cTdMpIx11mxrVGwEa9imZlNUYSHqz8pEXf
 clipZad4Cs6Ndg3jEy1BHL9s/DPl7XQS6UPnB5KcIu32Ob/tEzXe7Zojd8aChMQHA7wmMDBrPUL
 QxeE4udfj4JgEpRdIB6YBvlRE/Xb0lyfdzAMv09ugnwB6yrwiNrsise04ZI6yfLjQFhOvpxSEge
 uTlvsOQAGWFh3rlux7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150254

Mark inst_fw_cap_sm8250_dec as a const array, the data is read-only.

Suggested-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index f57af31dbd9f..a8819470f703 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -13,7 +13,7 @@
 #define BITRATE_MAX		160000000
 #define BITRATE_STEP		100
 
-static struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
+static const struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
 	{
 		.cap_id = PIPE,
 		/* .max, .min and .value are set via platform data */

-- 
2.47.3

