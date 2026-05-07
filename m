Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73324338906
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 06:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136134; cv=none; b=uJNgD4+wdkvujvrdFgb2S8OpnnGM71sq6nSZxUHYBfu0dQcE9uVJbmZAiTP0dAcC6+CIzVdTxium0rh4Z6POkBT4PP0LWczHvBlFJkJX7snBApV+h8qURsqt+1xm6AW6jE2jSjSfJICx5L9XRTDBCtSlHPfHs1Z313YDBnI+Vv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136134; c=relaxed/simple;
	bh=jaIRCRQ3d69KBHmHN0Ry0EKvqFuijis4q6NGjtukHfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r8fuKt9TRIVhNjipCOFsEPVdKawNO/znMIYyTgnQ8CzkqYJ9U8XrHmEYiShlyp1ZCJMdz52F/cQT4c4edDajBZVyxPfPFROjFFa7wbF2uhg1jJBAEl2tA/kum9k3bilYsqJnt8kf7KX/5FOUUSi3X+t5lwYaZo4NXX3dbpC+pPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sqb3+cLB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zv/ejK5t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sqb3+cLB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zv/ejK5t"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475wvB51927314
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 06:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B8G0+2ZSIN+qIPIG7cPGxhr6UssK8Trq7L9tfiuvmrU=; b=Sqb3+cLBJX6M6a/Y
	jociyz9Xcge8h6fNurnPLQfCC5TPZusgyVubo93xQ+Tr4D0W8DUCrUsc2Fw65PET
	uA0g0lKeP2PghiHKIMg7JH1GU2+7U0esn0gdC7QeT8CR8BupACk0OVlvrDYgKHUp
	QCJMAy49L3ZEaX+bTPw/NJT/0gL3+fxPwfG+X+rj1FYhvD/HpM1N21NYNGSsbttr
	X6C8XdlrEQJMmklSb3pujVmjk31TF/3wccjscx7AU6YiRU3A+qgl85BbmE9f1LbT
	DWdLMbHvXaW43qzTvp7D0L4c7FXp7KG2Fl5KjCsZe1XZlkhibrPDHIjRf/7o0YlJ
	4l4Dtg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0n2g84x2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 06:42:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b220c72bbso10818631cf.1
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 23:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778136132; x=1778740932; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B8G0+2ZSIN+qIPIG7cPGxhr6UssK8Trq7L9tfiuvmrU=;
        b=Zv/ejK5tStG8bKpmUkr1XT0DqGK8ZCRX3gQxD6VMnUNZ8SE3Pi4pHdCKI/RLeyiWwH
         9TT+efqYhLKosVUuo58YoGFgD8CJU58XaMUZ0x7UmqpARXeXwUjM6BAF43G/HNILAvO8
         A+Gn4IICN8nZntIMNCM66LUi9pDfQz7y51qSq4mkmoPGItbVJOu0Fw4YMepL7oxhQtUG
         /GOsnZCVi/tVR8PDYe05IPhfUhKMU/kSsDvtDKTVu0imXxqbweC7zli/bs/ZJLROu2hS
         P6fivPLn7aWEOd6DqUoOsjDzYzJgUtSiX/fI7u1kP4oEon1OefcBJFSn6lkzRpdGK/gI
         260w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778136132; x=1778740932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B8G0+2ZSIN+qIPIG7cPGxhr6UssK8Trq7L9tfiuvmrU=;
        b=fnvCl/nRy6m6V1pk3ojkEWa2E2yMgdmpqehHCpO9XW44aoyouD3225RuTJpHJdnaj4
         xifminxYzG28IURBxXYSsw+9uMt9fFQvk4OOdVigCOwSe3l3KKfiXAhr1LzDPvnKWnyE
         3kmON0tUirOY+lO/u5WOsbTweK/PnZuJa6ZNvVpGji22N/USFg5jSK1AezzCNj/25hvQ
         gmt0hLumbCbD/jily7r4UZ3zonKi3htAS+qmkVJ69uChXzvGEGu+BD2oA3cbIShQJCeU
         8oSWYyu/tvjdB5kXSr+TI0s3I21EZKsthbvGRNPoVHD2Ph78AqWd5Z/9DglP0JTbe7rL
         SR2Q==
X-Forwarded-Encrypted: i=1; AFNElJ9Gz4PURNHYiKM5dkBLRZjGBRVs1QYTmURXxQzBQZhW4ZjdGECUrW7NEeLiLOlDTTHl2xO1yj4jh37x@vger.kernel.org
X-Gm-Message-State: AOJu0YwaDj4o+qsq9tDi1ZUxiMoaYY/Y6vgCSS9y82//ZpZVc0DjpoXh
	mFnmwUtWvV0gLa4BOIJKrmpTnTadStNKxKKuFDjLpToaA89upMYJxhmpVJsS7e37peuJEPQOPJ6
	zlcCQqoSJwNJwUg6YeAmKa2FrWCyl/rpQjZLNyx17Dkc9KlFErojw+mNkGwzpRWQu
X-Gm-Gg: AeBDies1dItHtOJYGwLzQcDlca0pZ/Vrt6hrBeqkMOjLtHjukHJHA1jCyXnbz02xo/Z
	CGgdIdKVd0p9CrBBMl8EbUwVxeyx5Nfn1KEfnU65dqgkLMmcUX370AW5bhtbcmGRmDBR5M2hDFu
	EAwfQ5xQ1yfI+AbCRDaRQR41ym7Rh1gma9PHEe2lP6k4HQX++vE7ywwPSZuFeg1xb9eCJEG50Xx
	1z+ppeHa2BT0PSkehABW9ufwu4uOWm/XdpC0pyO/Ji9QLNfqZtbwcnnOS2xncNiMhv2Ck87citg
	W2XGtO940w6nfBxkxpRRDKiTtUdXUfow8k342kuEaX0Wo6iKp+4nwrt0tu4Qdn2g2OOZGgtl7ul
	Pej1G+Vjl2tws1JiH43aYwxhdew7eNDq4PPcwfX3Ex/BpI1iaIRRDsfPQoN1kRiI/1JTqXnz3Me
	z31VRzXvAM1z3Qjrw92umXHqPLS+wMxUEMQA804+Mb7k4BdA==
X-Received: by 2002:a05:622a:4d8c:b0:50e:d316:fa33 with SMTP id d75a77b69052e-51461fce4famr95530251cf.39.1778136131605;
        Wed, 06 May 2026 23:42:11 -0700 (PDT)
X-Received: by 2002:a05:622a:4d8c:b0:50e:d316:fa33 with SMTP id d75a77b69052e-51461fce4famr95529971cf.39.1778136131205;
        Wed, 06 May 2026 23:42:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8722c2d43sm3334694e87.40.2026.05.06.23.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:42:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 09:42:01 +0300
Subject: [PATCH 01/16] media: iris: Skip UBWC configuration when not
 supported
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-ar50lt-v1-1-d22cccedc3e2@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1079;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=53Divj+Z2S6t3+tbeAUvd2qjozMuWVZK/b7AyLFa9bs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/DQ9WEne1cLGwyNkAVonc9IE9/EVCM7kGFClO
 lpVTKdLAkeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw0PQAKCRCLPIo+Aiko
 1fdcB/44RBJLJQ0xHeBwE8QYUivW+pUw5XJmoYLwZSqHDfcZ8MsMZchHgMfrc7Yhu8PRYmy1/nz
 WcK4zYVEtouSH8sMk27IICKPgF1Ixh4B33J/+a8BwoLV73rfr4gQhFVqMyVROf+rRQHtQiywqDf
 xHnv3kugeq68RbYjbSLE5paSrsBOiKW6DFFysOR9mZpka5K0d2B7/KZ+s5X0FNE5m4HQP1A6OQk
 koosVq2v27bHQf+pf9vpgo49zMVz8VZ2sbAS9DSjvAxcPzEAgArioFWMYrsZRfzjRSFK2VAI3Mr
 8TbPDXzoEFGZ++vwDilk/h/EaKEZtibPrKau8qJjPZw0+l34
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Wv4b99fv c=1 sm=1 tr=0 ts=69fc3444 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=wrkyJH6U6m0Jdbs6q_kA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Secewh8ZSO_CbdipQt_SUh4LAzQmk1N7
X-Proofpoint-GUID: Secewh8ZSO_CbdipQt_SUh4LAzQmk1N7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MyBTYWx0ZWRfX2+KgU+kEruKN
 OqOKEbLGiWNtqKPj1VYDeD50u5S1Da296AzyV/RXgYW/QPM56WkxZnviNCAq2Dms4Wdj2Cwsz6m
 sxIqWe9xbLDy80r11eBRHAevRXNX7oUcK0sw/gwJHQlaonagZLmK0i+QMtqY0VI74vMRDRTiAGc
 rieVwibhdcZ8STsHrqwrT5VgYcQHrOpVtApOPMTR+wugJjqEC7oGNNsbwYgrYK1+Ubxg5FFz0Nt
 XR74oQcmBMGjr4KveJv5hae8AVRWsc2cCwrmGLFs8fqkqxIua8WvCnnUFOZrp9Dh6PzFysLpUFO
 yDIh9LSRqlSF4oY+HHDskNIF7MlZtBTXxjJqgMODqAUM3oTQ43K8n0oPPFPUGLPr9DNBAjlzLwF
 6PI8CPkIGPq/qakLWKeJxq7Ibvj7klF4U6MI8x0+oqypZ1vYLDMgRWRTX0qKzafhPRecaFuziRw
 6L0PAHd+I022nOGG3bA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070063

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

UBWC configuration is not applicable to all SoCs. Add a check to avoid
configuring UBWC during sys init on unsupported platforms.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
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

