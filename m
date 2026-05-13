Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E320F423163
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676555; cv=none; b=QrEYfiharaPJzYaqw//KsSzyy6VJUmMEczO9DZsOnozvdacW3XFMvt4yUUfKlLTksJQTRd0BTiIEAIsyUqgs1q9EtxN4Iv/f4hXwQjbxdA3EoejtD9AE56hK/6qvF9H8ROxNk4gHpo1cu91HFprm3AN8oq5H23h6snoToq+GioA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676555; c=relaxed/simple;
	bh=aFCxwN+s0nObB9dYmcqshZUCs9EjeMcuhwbHJaldKhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lgJW86iUF1IkG1iHRQ+1jmEehEMaW3VdEKL+HD9+cGkLud3XGQIKroRjgtBU8Dr0U7JRgugcADjblBEeHAAJI5kKUjamkI/X+fCsOf4PvKWqWRR+w+Wc/qwlJ0T0zjOpOO7tLGYjPzLaT4lufl6wUx32j7yak4AojDg6KYAcmkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LZz2zBO3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i3ML+IOU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LZz2zBO3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i3ML+IOU"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8wpXb4159634
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=; b=LZz2zBO3WvwG5GSu
	UZboHoj/9K5fYP+MJlpPj3zQ47Z/FXuuf391DqarRxVkV/nDKIR6BQlVPa5XWTJ3
	XBtLQyChaTifViHfmG7TXivLeGgbB2/tp/n5FiRjpY3xBI22tFnTILzfVGOiOip8
	q8mEnmgbhun5L6MWsz4OUFC0RB3FE8gK4/nGysUw0vIJzNpkypHLlHecZLEbcN+e
	Szd+6pSI6JqS4dFhaZlAXw6Y9oqV8M54M9ak2HK4V2LOCE8RN/D42sRg5RjhQ32K
	hSuOvTYxT4oJ7MELgghMopLo9+oRNED21NmzUq7A7tmEGCfSWlOnEaokRE8OVnxd
	DI1/MQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91rtan-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:49:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e575a50bcso52422921cf.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778676551; x=1779281351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=i3ML+IOUFO2dlDkgcK6pq1nkzQW9DKWc3GCy5KMAwKEULSfH4IawTeEWwKdXOX5YZH
         bOqv9CgcjyEuD1fVDHL0Cifx7agc5WVAM4585OqsyBK6QlbrsH1dlhoyBTxl6H5tHG4W
         gnjGAK+LhZzv7Us+vZTsXFjTkxJIbspcivpKfvN+AZtwCaj2HnFqi8aLBB8NUTeSfdyq
         vrekd2VUF9YeOvCzfKYu4/rXaXET7m5+Q1yGtnWM/WwCFrcRGYE4gCfHOWv6i0rDb9zJ
         ABCL7WDjRkbiHiSIqHr5moVUXe7IflpM5mS5fXH0z/K4VFWwM5yAW8LCQeKMY1ujOwSa
         mz5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778676551; x=1779281351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=AJHza8ZQ+9gHtclBcxOoKKDFvmH/akgkJpueH43fKylqKCK55BScKroN5VzEVjgjQ6
         He5DufnrgneUF8CiF8z8PivRomWHKmmdCFFKWkQ5JB7OmYLv6KsF9EXwckJyx9wBZOLo
         L/BnIpcZVx+JjPBqIJOIwtc1HiPRG0Neiyit1OEO50rioGN9Qev/fh6SAJdh12yYpKP8
         ONt59tYf9DRCEqY6nsPDqZfUgeMKpIRe53WsdFEs97UBsimpaSeh18Qehn7WW6J1dXLC
         D30OVt8R/mMTSmmxfNoA6gTMV14d/zM2BnazwufOiQEj3035o2dAf4Alct2gAUMQDDI5
         I4/w==
X-Forwarded-Encrypted: i=1; AFNElJ/ETAbVsCc3/9POeqcw5t7mW2+qs0iDtmh4xG+NDSL/2yTLdGn3BDs3OSiKK1Vl71FxTYVSbEoCVy4e@vger.kernel.org
X-Gm-Message-State: AOJu0YwMZVa4TWHYrvcGBlJMnCa4W/jKB0msu6ssFW/d9bygGS4gBZed
	ELDdlVNGxVgz7mn9wsmPELTipzkkeAOsRAD2AS2VkZDs94YrAWU6bJW3/21VTwFo4jS8uOU0ZtR
	ZbcyeuMWmxRqBvrL/ySxiCGOk2uXBqlS7jULQJLVlwCaWKtDaecZqnpvNaEwLo8Hg
X-Gm-Gg: Acq92OFlNJ9bAwVI3H15NODu6zofJqLZub6+JuCQu0owHXacGRiJX+i29RFzj3Uj2qd
	7vQKW+U5bVlXdPPbo5EteR0AAgfUfmM9gyGg6bAlRl98/P0LauQYzLxAxLmKVMpQPF+3KpYx7KS
	P8qIQN+ulT5QY7/Qf9UjnKhobfovF7GdAkdETXx/iv6vn24NhHug++By/gJA05ITzG5Albnbcnb
	zY50O2mYpQEJy4pztZXHxOvVVEXomFEBqvaawPb5b+45CXXlIxKXHeZgmBD7lJjwdhptjHhaEjZ
	/y29chV4EmD0j7WVMjGPThBSfEmYnUFC0Z4d6Ise/up34FhxtyV6exl0JsLvun1eyn3iZ0IGZwR
	35ORFmcR7LunYgvqbDqvFSKXzB3oR/Vllcyry/BycWazBdYGuNB9goggy67cdkwbmv17dwVPKof
	yTGA8qvHkLPFuOXiEvn4OIfmslS1A7HzG9Jic=
X-Received: by 2002:a05:622a:410a:b0:50d:8e2c:6a68 with SMTP id d75a77b69052e-5162ffaacf7mr38825121cf.51.1778676551128;
        Wed, 13 May 2026 05:49:11 -0700 (PDT)
X-Received: by 2002:a05:622a:410a:b0:50d:8e2c:6a68 with SMTP id d75a77b69052e-5162ffaacf7mr38824701cf.51.1778676550615;
        Wed, 13 May 2026 05:49:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5f15asm41106841fa.17.2026.05.13.05.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:49:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:45:35 +0300
Subject: [PATCH v2 01/16] media: iris: Skip UBWC configuration when not
 supported
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-ar50lt-v2-1-411e5f7bdc4c@oss.qualcomm.com>
References: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
In-Reply-To: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
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
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SkhEj21efbGwh1OhN+7NneptPnsqOcydi7iGjY56ptE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBHM/s/8saB6WEquRXdHgG9IkigEC1aRVfoTWt
 D9nJP96mr2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagRzPwAKCRCLPIo+Aiko
 1a9hB/9JsCjFIZQGxzpWMB1i9vzemX6fopt1L2EIJv+V/OsLNHMGQxTU3m0Cad3elaCrs0j52h/
 PFmcEBofEzAoS7F8P9hBndIY9jiDOv2IVnNnTjPz2JAB1cfScs+kDeM+njDaAmtalP/8d3GxUrp
 A0YOI2XhUJ8sDZgSA/4MxHL/ecyfN9BR1x3BaceHtAubDnQOEBrIIpLu4WkYZ3G4tOISwvw8ivx
 N/F2lEke+nGOIKWX7ToapIzjD+gQKzVf77iWPSGtoOqFK091OKWkvT3aTn5Xnit5h2ZXPEaAj2D
 ebiz4L7Dc+/JoVy3es5OUCEpY2XJ+FHrWu5/pa4C0SpibmqT
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: k7aRAoi7vwR_s-vgA5okZ_DXu0DOStC2
X-Proofpoint-GUID: k7aRAoi7vwR_s-vgA5okZ_DXu0DOStC2
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a047348 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=wrkyJH6U6m0Jdbs6q_kA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMiBTYWx0ZWRfXyhTcOE93x5od
 /xIl81PphGZDN5rsmHAew2SkmuDy3Dc7F/3yg2+1puWtPU/HG9AmtBfcfBFPNtZZSqBpcVxFPaK
 oiC80eXwzH65DtWTtm8bVTBRkOHsqMXzXeFxmKE7f5dlp4ZZ1UutqjRRsknQ1QCNVETamRfa/6R
 2b290ogE/wRVlUO7syElLw8EvYUht6AyOT2cgRLQWOagaecxRI/6WyMIyj6UCUj7W4IogOWeDY/
 0DmrsWAhJSrWdCSZc5pVGOTnivuuSeaZ2KZ1WZYOVKUhFAQbop/aeQK1FeLIOCVayrnaYOWwtc2
 wmEuP7rgMtiAVjBEo4E8j3AiEz6W6e6Yji21k069uZYYH5T8b20w8ToPF6lNNq+qel9IABFH5Ei
 MNygE7a5JzFVslK4M0ypNW80mlNV4f8Mb9F1tmZnOh0HFiFiyGdCwkJtNQfhw0aiIT3l9VTD2Kf
 a/gPlB59ZT7EB6H+hmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130132

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

