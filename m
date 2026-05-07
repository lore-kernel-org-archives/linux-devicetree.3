Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969A8342539
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 06:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136151; cv=none; b=LGu1HrhDxB6P72dl9JPLmtxnunV0BKVc8ZXplotKZPVuaaZqLnCAYb8rhWWdonfyQSQBUrvnbwdbqstCm1TKJ7EPZBnywfP8xxFeW8mEbj6zsxXGaZKXQgVhohHwXPyRo6ByTBP4jUyWBpYV10AiDvhFop3P1AD2WEpXK7Gu7UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136151; c=relaxed/simple;
	bh=9oShd0lxeYZuc1TmMkA1ib+fm0aaxdo95GxItjv0DYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GM064mJufME73+NR4i6LXSkGec2g3+eIXXpy+YjyfkWM/9eTm3M+WAqLUQZOQ7smiKWUhYypet5iyUMdBV/8m0JEKpGsJZGVncmMUHOxaJgbaHADxgpeV0Pr82o3Gch+81QObdBuFC79kA6Igd64MzZLKR2wWSXHkLaUCXukJAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KkcSCxZU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dWOH34C1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KkcSCxZU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dWOH34C1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6473eOxb1669936
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 06:42:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	300UemiTb6OIGpMleRcRM+4rK//nXn1aRMrTuOv8PbU=; b=KkcSCxZUnVfAEb8F
	4yhIz0Ll8ZSyBAVTJC6cvHJY/d8lAwoyPFppva65GZcZYZEZoi2tv3nnfZMLvDX0
	iJC1x0XF+a2T1RzHiNEP9nNEj4tdPppnWfYDRjnGJb7Ol9sYMESCG/bPbtLYjzHy
	tp5uIhO6SSggUetMmFSG0TDiqQuPAN0zTolDsFi+CD2JVglOO2JPwhfx9txrbF2v
	/gjaG38hn04KDySmUHOHc3kjHBzWjq8AsNIcV/JCKQZDypTSavxNR2N6zzTI4pzN
	TLjj4E5wqUpLPnf88WL8FNT9ESpntMeHz6brnp01kZK+Gb2hl5iYyse6knJyNz7G
	wedihQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1p0j8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 06:42:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d5d1c2289so10506641cf.2
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 23:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778136148; x=1778740948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=300UemiTb6OIGpMleRcRM+4rK//nXn1aRMrTuOv8PbU=;
        b=dWOH34C1GtakmbbpEqGNC2jhsfCoiBZmF3TEsF5WHZNft7wHjFnfcp9EAd2kRUotvP
         bFVB2Stjj6zkSBiRcQm8hioE6fexfQhAH4ZL0SH2bxoPkxvdzxn6ngFr2+DzAfjZqGb/
         4s96i7bCGZx40m7end135+Y2PkfoqKKObAfzyp2HTeuDo3Kw8hMrSumviW+nS0qwiNzX
         PCwYa3KNDRTzLlMNaaw9gszHymousujegrvN4Lp7qIgZ/dICNlRORAFDmF9eZX2gpwzC
         Krsb8huW5ZfuMFKQ6vPATI9sYJ1W7yZ3Mw7XJ0XkoLbBJbQHRBJ0yhExZJE7FnO2FlBo
         xC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778136148; x=1778740948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=300UemiTb6OIGpMleRcRM+4rK//nXn1aRMrTuOv8PbU=;
        b=agCgFJhEoX4Qp647O3TVL0WURwcQcIdi3gV0zswMCgqJKiyF5Ul1m66YXae2myRr+z
         AFm4VFaQv4CywsJ34ZdXMHbymuV39KASRxNXP4Z7AyJZEMbmDGUxzOHaoS56sGuAIB6T
         KilCT8TwXcV5w85JZZsvvT4mrUPjKpQTNWoHv5pE9OEJLd86uEFaS0BHwMsl4nPuyUjv
         h98GBb1cOgmQSUQvoBY+iIpJZUBsQP/q+2M7ywyI49Fell7cepbU4vsAt/LFyi6rYAiL
         rjQCMpTYPdxDzFQe3SzOrcfGpNoM7QCXqHnyZjXFqkY6k/EznuLwEmlnon00APzse05l
         z13w==
X-Forwarded-Encrypted: i=1; AFNElJ8bO78groW3B2efArBIPtBfBlRt3m3Gb+vjHDm6SwOCSTr7ZzXMidUpA2PNUyQTOsporziYSHUuHjyg@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7jJ9Bj1EHNQb8x/a4fL0/2v94vKzLzykfO1hXSQlf96f4oeLY
	MPsthQ7ZSDrrZjbI6qqb83mquNvYBPUNTVAWThvMituA9sHsbmYEGag/tnB7fqAolBK3aXzXFeo
	SgTvcDSmw4jpiEwdXXOQlV/L8sJnmD1v/IjdCSciq/kFVC+zFfNThsl+sHtP0JcpJ
X-Gm-Gg: AeBDieuUfROCIVisRwkWAsZvdtzta5Mmf5YKyFiXarNbiB1NNQMF3AXugJskLpfYeOm
	A2P/zZesdLrZNhOJhXSydehJpDcgCM73vaf1OiF5eNk1+7rF5qpkB+pdhsBbQ/ct/+HsPoPB6SC
	UfsppbJ/6fycT6yPWCFgQWjlcihJEPxpNloCNNK6BFNJbBu4pzz1xX6Dt8l0b1ulWIHLhlNNPuR
	ndR4wjoYtBNZ/eow/neQXPYGke8819xXmFh9fyXFLtxlI94pBDaoJ3f5HrW8YBsbSCOsIkeOQ/T
	DJwCQVAShB1P5k6bg+91lnVoSFj1pZOYtLo4EcTFmpBiBw3kA9t7rKP0LBT7I6oR8pL4/I/Q/UY
	vJkTBC0tRTV2v0nHEmbI4QbOwrArf7tvMrbjq5p1t7snLELmxA8JrB+3Bz5udgIyphQKtjid8mJ
	JnseZk0LjVmadd2EVEtka2s0KQM2McBvfZ1xvO4D9YQvoEjg==
X-Received: by 2002:a05:622a:6204:b0:50e:5fe2:83aa with SMTP id d75a77b69052e-51461befdc1mr94387931cf.12.1778136147934;
        Wed, 06 May 2026 23:42:27 -0700 (PDT)
X-Received: by 2002:a05:622a:6204:b0:50e:5fe2:83aa with SMTP id d75a77b69052e-51461befdc1mr94387721cf.12.1778136147520;
        Wed, 06 May 2026 23:42:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8722c2d43sm3334694e87.40.2026.05.06.23.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:42:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 09:42:08 +0300
Subject: [PATCH 08/16] media: iris: skip PIPE if it is not supported by the
 platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-ar50lt-v1-8-d22cccedc3e2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1036;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9oShd0lxeYZuc1TmMkA1ib+fm0aaxdo95GxItjv0DYo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/DQ+E88fbCRiyGMK955bjuiw2fsdCyCEHHF7R
 7aLwQwisJGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw0PgAKCRCLPIo+Aiko
 1Y1zB/0ZN5oWIvaZjrlCAvAy5ojTx15Q+TzPU8LD5zkRYk1c85Qmp3OE+n5wDxfZPFil8CSLkms
 aIYy3SSN+VmlIPyDf/uCqD4imPZ/2sX0LcAjiT5C17B+N0j/PAjtFVBj0/n8VfOSoxzoiDuYnNq
 JejszHPwbMTTiDqlhmhGs7k4t6cXhj+wiVduxOynDywurFylGrSmNxF7Edhe38/WZ2MJZ2EVErH
 fVdlh+d6aqWG8Vo1qoGQPnpqNSdtokuyfPtGzdxaF0X1HfQx8OgSSdL0OHTUaELg4ddFhxNnJmT
 6ijazendjw8O5HlWo2aPrAoGAjbdaHCf3a1UXROO54PFFOBj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MyBTYWx0ZWRfX2nJN5QNA5cPp
 k2M6cXBd8JaHCaQeYpqbjUEgiEhIoT5gevbj4UPbD2UKqTuMngte37YMz2vnJRzWFBI2fCQhbWI
 1XYFV6XkiJ6wIr1ZOYsChbbjrjbdLE9lJdaL9TwGAiqNnFR8RWJjkBPlAcJqgw0Ek5RRU1xdcDs
 t+GuFjWy+u55U/4lJy5srJ/3LxWXQfTpYJYaauJpaS7Do/YAtETZ6wTZCWZNCLPSMsSx5uyDsM5
 +SCeMfUNdEDNWgfPK5uy/xosxcXlVkDpd/fGAdGaJD4lNpETaUAOwBefjzBhaPJ2yE8oMVb7RAX
 EvQNI0TIgk/OZyO5CAvRlrTO7prM2PMdImhvvD29xP31sxigLOTL3POsI1a/+w4YrPhK5S26LpE
 RlGFNZX1EvfUGejWpsLFIdyA6sMAbl30UPorsba1KpnRzBUsE4Rf3pU3RJ4si2mXYpUuUdcaq8V
 hQI5HW9S2zaEVHUnYPw==
X-Proofpoint-GUID: yUxoN9404rzRU6Ousypt43nK2fTBVkMP
X-Proofpoint-ORIG-GUID: yUxoN9404rzRU6Ousypt43nK2fTBVkMP
X-Authority-Analysis: v=2.4 cv=K4IS2SWI c=1 sm=1 tr=0 ts=69fc3454 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=9TuWGWrZIemhly9L:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=DRvvl89rPFtLv9ObwM0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070063

AR50Lt doesn't support HFI_PROPERTY_PARAM_WORK_ROUTE. Tables for AR50LT
won't have corresponding entry in the capability tables. Let
iris_set_pipe() silently skip propgramming the property if there is no
corresponding capability.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index ef7adac3764d..f438dddc19ba 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -450,6 +450,9 @@ int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 	u32 work_route = inst->fw_caps[PIPE].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 
+	if (!hfi_id)
+		return 0;
+
 	return hfi_ops->session_set_property(inst, hfi_id,
 					     HFI_HOST_FLAGS_NONE,
 					     iris_get_port_info(inst, cap_id),

-- 
2.47.3

