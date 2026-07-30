Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8708740DB5E
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785455324; cv=none; b=fhioes0VVcEMwfNZmpBO8ovB328cO7yJmn1+W/PitjBFYHwoB4WwD9NHlVjU7MP97Lic1QL5QlAf+rdazYB6spyzd1f8jGqvhTs/fKAx0jbHMgU/U7JWtOQkKCmUPVAWnrNhIFT2VSBMc7J+a6m7Hjdvv6yD1VvMxAx2vHGbRhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785455324; c=relaxed/simple;
	bh=aFCxwN+s0nObB9dYmcqshZUCs9EjeMcuhwbHJaldKhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NVJ11HPW7EG0A1jo7BQMDOh0PMLgoD5wPl+2YFq0ADU4VWBa7koYDZzM+s+RuITg9cBmkvQT+VQkSgKwaggQmY7+c2eJRPpyrYt4AneISkODymDII/QFh25mmFuScYqxzW1onD1RR7GQhF0aq55do9UHpSJfB7dUcVQ5FeJ2GoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hGrdyrOG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D/2uB7px; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hGrdyrOG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D/2uB7px"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UMrKmS2067495
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:48:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=; b=hGrdyrOGBLwcRxLd
	IGSUribNLUqfByr9XxBMVMUGqI1gyqzCYF1gtggrtXjr8xmBvPsnKsLuiwvNVffb
	0TrjMYPJ9jvVNigaXEvj3fytJ1j45b/7CVUQ71fHdbe4erl4G/LdAfW+mPLBWlnO
	BxpBTvi16EF0HgDcTaxWK2mOUki1s1r9Z6aDl6DLLHym9HoSBxX19DI5GulaUBMp
	Bvy4KmQS4128PszNGFt1x0jFdw28waNPMjCntl86eYqYXrAfeHEjLs+fogqKWlE9
	1m2v2St8VCdLy64Gy5O3sIZl7aqB+jeHfbp+AdQ3Lt5Epy/Idi3ypgtnmzrSm1KP
	Zdi+bw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frfja85jj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:48:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c110a3b6aso5221471cf.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785455320; x=1786060120; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=D/2uB7pxlGCoZbEOsfGtpKzP2c1iUuNF3Xc1FRCmCpUqi+yl24zILQmHzTVDUtU4Du
         mfh5RnHAAaAP1LLDaSjOoGwIikz7Y1EmmY17/AwdlbUylsjaykBFE/TX3D7zNwTgBKI+
         WuAxJ6CT3Sy2b35Sx0B90G7+uxXJFnA9361sACrlNOhJXzJ+9J/yiQJePxwjefm+iu1A
         YsHWx4BeQfeJXv1nr6xoiZR2VEXW4EdC5jr59spqCwOWIUwnSxrjXnkxn/Mh64M7/ZmF
         bw6LFrlZhSM5hPTLRZEhsngB0USGxJE/0oSB19nP8/mv+1/2EJ7xTiZxxK1erbhBal5c
         Z6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785455320; x=1786060120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=lYlaCdl06scP2s9OAV74Y4UEz+qyxa8AzqfO5rnMRRNsEgxYWbtMz3lLT5sKsRLHgv
         4mKPcJr0RVO612jiE3KCE4SVaMan06B9Lh5u7uGyDqLALrzZ+6EkSzlMsqh78Ittn5az
         eZ38ICbpLLeqV72zpiz8HREkObMvB+vVflNwqTg8zIR3sINnwF7rdIjrNyHyuYgZvhKQ
         zKKxYIN5hZXwd0oPM2tGlPu7uez6y8XBfV4JsSQLQn7hgl20uratgHJxb2es+JXW4rjR
         QdFHi+MlCaDERdlmHagZKkot2cYN1lNvpZ5SorBbnjmsurUJybqaL3dlT/wFCKpZ4m2u
         +qpg==
X-Forwarded-Encrypted: i=1; AHgh+RqL4le1lhgTrrPigzpNViHDfDcvkAcKcx1OLQ20pja8e/MkyqGMpYuQ6FNUlHRkJ3Q5sT3l9tKaLXU3@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5WSOjGYQo9/gvWw781HhQkwFbE5ISWneAO9OPjtfbaNI1AYre
	zdOIkdCTQbycPlf7TuzupAyec1KFngla4G6ZuEh5YgbRY5s/9XM6MjfuS9QRBZIEBilANKbU/ch
	DIOJ7OU0RA4m/V8IAbaf2pwiKZp9GuAUpyGOqqXcf2KO0yS8q61cTe227D2/EZBLT7MHtWw4/
X-Gm-Gg: AR+sD10bG/xUzsnRP/W8hsMAQwdDaMzCyXZ7gECZjbKzuBTqQQqb6sJjE89k3eRQSJ9
	pr7SrVee52XErDqB3tioofjtBXjOhRzY6ihacq3JMHsRbl40wyQ6CYIAuqCILZvctTPMQ9X42n9
	YRUiY1FQ5f+KcpbEp5/gO8PCNIIMbhJWbLumuBVl9yv5XynCBDUscPsjOPmhzUReNYyOHySvqjD
	HqKVXNeoaWnOl4KFk0aNKTOaoCndLUTbjDjW6IcddCFBzztSUwtuo2Pki2Jgz+wukup8BRmMnQN
	CgAsauKC7nv/d0sti5IvXYd44kgSIhQLAgFGeKuW8z1fC37NQuUHIW2DCHZwx73rpqF+xxrO9zA
	rRJXVJwFm8MYblq4PaYn1dl+Z2zWS6lwvgh+asao/I9LigXoBj+qb1y38VW3EERXt+vYubjLdMI
	k/FHzH+EVARZ5pvQ==
X-Received: by 2002:a05:622a:2611:b0:51c:257c:8166 with SMTP id d75a77b69052e-52b384c3ab0mr57569291cf.33.1785455319671;
        Thu, 30 Jul 2026 16:48:39 -0700 (PDT)
X-Received: by 2002:a05:622a:2611:b0:51c:257c:8166 with SMTP id d75a77b69052e-52b384c3ab0mr57569131cf.33.1785455319257;
        Thu, 30 Jul 2026 16:48:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ba724sm634487e87.45.2026.07.30.16.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:48:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 02:48:24 +0300
Subject: [PATCH v9 03/19] media: iris: Skip UBWC configuration when not
 supported
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-iris-ar50lt-v9-3-d71a782001c0@oss.qualcomm.com>
References: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
In-Reply-To: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa+LKqIP3rXIJpdK1F4/DYlNSjb10J2CiKzkCP
 26vfq2iGbmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamviygAKCRCLPIo+Aiko
 1eXnB/9rtGaAUpkLSqm2Apz9FksXprYCvFgna3L97Qo4WnL5wZb02ctDTinYSnQ+X3PEzBC9K0p
 aa/ZT4BaUhi4vWxQcpvS7hzE2eGsXF6/hgUVn2nQU/obzmh8/DjoqzLraJCmqJroL3rNXG8Czxu
 0FIfYR7KuD0oqDoP/uhRGtMbKmP5/7Zy2CX2pNVgwAqad0rbLUJL212zxYWmjqtVJJOsVi0R6vd
 XfAXPFrWwaYiZNZofTRob4lGNQdhDWZcKz2PWupnbJgf2hru1LkaV82ONQ997MZDH2eqC05legi
 0JdQLgEk4CX9esFhhXJNvZKdr/z+lZE1DLuJxAcFfdngNLI3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: JK5CC47dRvMahM0SndRtijwmStMmW3fp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX4PywcXb0FVC0
 kUn7UbEklc5h+6/1Xwb+de2haRTfaVYByvJsaNZi43+MhDC/HNBKy7LGPU7eTSpyE8RUI8G6lE/
 jFpCSzwlUhSGmz80AuerQPGSg6LApw6qQMlHZuL0o6QMRKJZfYSWlSlkvoNPXAmNr79Uvcgtg3c
 r9e/ji3uwOoDxjVjkH4GrM109zgOU/eOBBLFIFGJvEAUMoVacMWWoLh6GPMtDrZpikgg2PAd0Qy
 b5shENFkjQ/75Hw0Z5i9G6474qqLG+XNFhBN80u3YsRSpV+Sf8/AM5it29e1azHUxqgSb/oXrw4
 dRvz5szbDU2gPxvR4dQ5gC5KyfQChFgmrvAeLaTdpR5ccePAav+PDKiIChsLE3kMjPBGxWqoVKx
 Cdt6e23bm+1gBI+IzJNEmi9hvAoVxSGaGi57J6XI/2k4vu/TZSz8dcXr3OkNQbyMN3dnv0G0s++
 mZaaE9XDqRcLbM9EWGg==
X-Proofpoint-GUID: JK5CC47dRvMahM0SndRtijwmStMmW3fp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX9oFWSpme+4cA
 ChP0bW7b7EDzh7MlOmbg5COLzI6bG2TS6Kf2zJyK/U4k7YDcKQ3eYvJ9Nj2uggApSd6LcYvp5Ql
 lDz/4NCr/L8cgH1gi+GpEJKMtDp+kOA=
X-Authority-Analysis: v=2.4 cv=XtzK/1F9 c=1 sm=1 tr=0 ts=6a6be2d8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=wrkyJH6U6m0Jdbs6q_kA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300168

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

