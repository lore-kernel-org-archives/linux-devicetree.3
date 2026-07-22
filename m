Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D648481AAE
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717827; cv=none; b=OUvuWSqksME0DAooemi9YJ01m0dSh6tVA0bBYaGKiiSN2FL7m4IFRJUjTK8hOHHOk0NEBuStOxCVU8rdjRDPgdQkwgwzuJhOm0z+Bj55qLCzrijGYYPnCktGjLstzXirZHSCsQMdZEa4OmmDB4chEiQ1FjzGdZ/tjwqBr3z/zXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717827; c=relaxed/simple;
	bh=zt4ny4xMT5vbR/7m6SqjqzQSH2eBkyuBdY/TbSbT3rE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=srFLPEsf127PvhigglQwnWntGYAzhVQHye2stNPWenrXIqlFHBMAvgPqzhh+i5AmQ23IttwPONlux1pLAxzl2XwD/+XSNCfbIKU9dBw5JfozN0nj5B1R0vj757/F13BYVCbwr3OXYF5nJ+0whB3VdsPtLoMN+R48NkFo4dd+kTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eBIaeCCR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d0NkHlfv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eBIaeCCR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d0NkHlfv"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xKnr237645
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=v7V7ynyyG+fnkYeEmnz3+0
	j0SXRMrrVmr2SSh4X0dFE=; b=eBIaeCCRLFu/ECqUjpJodOYk2vp5JQv8pM5ee9
	XZfwxYMBgXuLLEfWxCgdvnkA7rBZpuupQCeiIto14DR8cetq3eCSX6XpoApxkJSz
	19YPNeug4CpbyCXHfYzzYA549orEs1azEA1IQipMIHIE8KBMwC+HWoRvhXztDCO2
	Xrx7cDGIwbW+hJLxNsA8sUkrTOVMMz9nD7M8/YFxCzXIaSkjuA0DmBbjenJa9cvo
	aLl2zK//iEhh//Y9zrZr7h4sIqXr5XH5GPW3+JnzRyeY5D2/2uAPGaJYIdrpMRSV
	gvxHV3U23XLS+2/mBk7JJr4QQGTWsI6mQHG+X36PrgSxAsYQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjntn1rgs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:56:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52827090cc5so8513751cf.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 03:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784717818; x=1785322618; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v7V7ynyyG+fnkYeEmnz3+0j0SXRMrrVmr2SSh4X0dFE=;
        b=d0NkHlfvJEe3aV/kWRq7+qDLum1dS6hokXwBobG0ODgYdGOUJOb4Xf4BUYBOqAh0o4
         H8u6zLkSXPnuLWERcj107kdIISB3j3/g8AHECXxZl6VgiHQGVBUv1dcp3FTbyX3vYFFB
         5b8ERnVkn8tZlisAFt9bvToSIbpHwIHYHsRXMQSQTiTi1kLdGmC+JN2N7XQwhW40jLG7
         5OVfgk+JrpCRYxm/nc8wxUlPmpPXA3Q9VwHHnvm3+rWH/Zq+HgnVMChLJkS+XsqCqUlE
         H9XoROIDvpcLvyHccv60fykJPirtn91hx6vT6CwOiv+xezJtl+mZTHXBkLG9LkwxMem4
         coRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784717818; x=1785322618;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v7V7ynyyG+fnkYeEmnz3+0j0SXRMrrVmr2SSh4X0dFE=;
        b=Qy5vEFiItNLGgX5a5E4kBdUtsIHq8s6tWOK0m4yYHXB5YwawKmCovWldeMbQ3e0+pG
         HBhhqLt84/6gze7GK1ja/JOfqFe7qNrNAiuvuVaskz7r8edf9SrMAV6gSw+x9WdKKczK
         FttVvTfmP3BTMCYcCUG/06MwkzGc+bD7SXjlnVuNHD6pro1TXjgyASCAHnjlHC15M6Ko
         cPCiP/61Yn2DKCXAvv883clVaf9auIUC0LdYFbfUsHBqJ1V55p3oGMFsT03xn77/mU1P
         Ngou+06gg+AGdNtOh5b/MGzL8FicTXKH5ERhJ7ZgqlrMzjlGwcIN+4wDemh49To0d26n
         712A==
X-Forwarded-Encrypted: i=1; AHgh+RoZBAivYFAsBiNJkQxg5xxv18KuFetBGtY021UvamG7PkUpWev5qQbgOgMQqc77GkrfbiRJHhtBgqjG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw743PeFybuAVRqxp6eBvnRL6969bYBrXbUONJ8KnrL9bdBCxqV
	GWbms6S/mpYWu4j/IZgYyIm1HjglCO8elt21Y3nTaVSLH/uOHB2etcM4zTSL8VYhlLmJI6tkzlU
	Nt4HK0Q8Jxr76hqoPiUTEmbNakMvRLGJ8hnZ7T6W4q8NxlhJV0wrAZ5bLqzNC1Af4
X-Gm-Gg: AR+sD121Ko1c+VrNDe8HlikIclRxmDkhHIIu0oKhELmNwKFbsi8iJ6Xzo0r1S/cZgHi
	PqfyqRA6ALW8H3Eu17RTHnxzQenRLqmkk/V++pBblLLFjxhVCmjoOMyt4LCPOn5Phq76ohUvoih
	VjCUhbEafW6kuh90kkebVn1LnCetjAIC88KymLwgqtUb+r3EdKdG84KA1GPD5zscKmoGRDIo1Pi
	C7ZIkXXTYb0Dlbm0O1/LyQdilTpmVLpPcJXQWe9N6X/SZivOyYpxH81daZpBtro9AqKx0vWx5dq
	OnCgLCcTx9h8NqLE9j3xCYxn3gZmvsrHn8j7DKJnlPQ2pgO7dHc25banOpD2n0dhlf654I0++G8
	zEfolLGqj
X-Received: by 2002:a05:622a:5813:b0:527:6d0b:a632 with SMTP id d75a77b69052e-527a836e0eamr34076921cf.27.1784717818284;
        Wed, 22 Jul 2026 03:56:58 -0700 (PDT)
X-Received: by 2002:a05:622a:5813:b0:527:6d0b:a632 with SMTP id d75a77b69052e-527a836e0eamr34076631cf.27.1784717817665;
        Wed, 22 Jul 2026 03:56:57 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956b0571f5sm36240285e9.4.2026.07.22.03.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:56:56 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v4 0/2] remoteproc: qcom: pas: Add support for CDSP on
 Eliza SoC
Date: Wed, 22 Jul 2026 13:56:47 +0300
Message-Id: <20260722-remoteproc-eliza-cdsp-v4-0-04c6eee70cb1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO+hYGoC/42Ry2rDMBBFf8VoXYXRy669yn+ULvQY1yrxI5Js0
 ob8e2W7hS5qqBYDA1fniKs7iRg8RtIUdxJw8dGPQ17kU0Fsp4c3pN7lnXDgJVRM0ID9mHAKo6V
 48Z+aWhcnClUFzGhualWSfHcK2Prbxn153fc4m3e0aYWtic7HNIaPTbywNffjkAeOhVGggqOpN
 Gu5VfV5jPF0nfXFjn1/yoOsqoX/gnF2BOMZ1gohlQSF0ukDmPgXTGSYUpVRDnjr3F8ve+wtBLz
 OueS0V0OMjkjXkE9NMeAt0W8VbC3qZLv8AU1hnhFFHqAMB0BWO5Q1atlKXWINwFrF89HZ8/gCK
 xUiCNQBAAA=
X-Change-ID: 20260713-remoteproc-eliza-cdsp-07701ba2b956
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-2f6f2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1441;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=zt4ny4xMT5vbR/7m6SqjqzQSH2eBkyuBdY/TbSbT3rE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqYKH0jS1LknkjQsmg8rrP6tlItkKzjrFzFxq9/
 9f4hE9kLnGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCamCh9AAKCRAbX0TJAJUV
 VqilEACtqTcbDOG0pFNkm8jSAsPTbylyiT891GbNk8RnSQUwrinsMafLTzij8R3uP+oGnG4C117
 D42G02DzqRC4q/idaTtoDk9l7alWzlhgjx22y5kZ1tbtCcP7d9zlepXgmeCZmcnM0AcqraJBrI7
 c/DyVQOf1D6K1kEKOpfl0bQk2Fut5x1MxoPbma5F0IpJ72/jAPU+aL8LSpOBqe94LSZnsOZtkso
 BI9jWo+CjlmppmGmTPBr3hlRAyFYoU4A49uoSM5icDAemyMB7FUjmZymt5wYvTv+fPnF6J4a6dS
 T8XnBzZn1Qk44xelm1bUmnFVFzFDWeqnqtWOaAIopzjChGE7H9AzbMITkw3/yYuf5lDgGxZSDMt
 upCwA/nf9C/8GsUlR/v6zlvpc+zWmEHpbxUEMINAJZu3cj9Jf3BnoAZ7622mW+ZVHBULEld0S+D
 AKToWNCgWZsbzyBHLFSji7XCawexCzkAKIT1LVr8klnW2bJMzZYzkiEJNP2tSGvkqU4XyLSm4rW
 zwj407IQHabZ3s6EaQwdyjvlYym2nq7Gntn8b0QZsLaVGW1jakS4Fv4VSoVzL88pTYKOSJseCDU
 eDpgFzG8U23KaK+qG4DCbPfZ8nt8JoOAqI+WLKInUOsGLK3XaOsXW8enw1mqaNbyDVeOZ/TEz8J
 7nGqzGxsM1P0XZw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=AJsSZ1gA c=1 sm=1 tr=0 ts=6a60a1fb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=UevxoewetnaWWcJ7pQIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: DXYGuhqX6xfFmvDzfjR6T6idncvCI_Vg
X-Proofpoint-ORIG-GUID: DXYGuhqX6xfFmvDzfjR6T6idncvCI_Vg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwNiBTYWx0ZWRfX594uPKWeEZ27
 ZX3Gy79ucG9TK6OMqjbWsomzPGwLmRqONcXzIy/xd6QyTXSxcK7UnUVoZLt2iv4C/BC0AEUT6AV
 rscsLfZyjvYPd7mjWqJukETmoz1VKc8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwNiBTYWx0ZWRfXxDJR2vM2iPYw
 PXDTx7OoBa3kdJ2MTzS8DWKb9figiyrcYwL8jvRK2A7Z2ssMdZORJzVbMU6Sbnp/sPfKfTbw79n
 tP5q5N3pmaEN0Osa3eaCSOf10+C6HbSTaw5/aCZh8llYI9SmtS2ezM/DVyQkkZSC0M/Ticyd5VR
 SiVzjyfuYGrOc8nukJfeXCpa/ah+UidcVkul3AAn5Tpy5+BDS96yvTp+foPDbjj3j3v1hEj9Epu
 Hryg0NIVpAGM/PFpr6Jo5Q36G6hjjIwZLvqyba4loCRhlK2y4bS2LeoT4WKc75r3jOmV4kflWiw
 bq1UWQBIG5yLbeInZjmq4vw6yYLT9zpFkfMt5ItBSbplHiidNqaEX7woEgmrR0VHIAEAkegfihz
 dhMNwrbgSRoCKI13yzhKmXUL9bWY91iQhTtkh24Voj3woVOMNEkQzoUBEqVVOTCEZppYwprwZ8j
 CfknMqj7+WTMb7vJN+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220106

Document the compatible in the SM8550 schema and
then add the driver data, tying it to the compatible.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v4:
- Rebased on next-20260721.
- Picked up Krzysztof's and Dmitry's R-b tags.
- Link to v3: https://patch.msgid.link/20260721-remoteproc-eliza-cdsp-v3-0-557b5d02fdd9@oss.qualcomm.com

Changes in v3:
- Moved the compatible to sm8550 schema instead of milos.
- Link to v2: https://patch.msgid.link/20260721-remoteproc-eliza-cdsp-v2-0-f3345405e4da@oss.qualcomm.com

Changes in v2:
- Rebased on next-20260720.
- Picked Konrad's R-b tag for the driver patch.
- Added maxItems constrain for devices with only 2 memory-regions,
  as per sashiko's suggestion.
- Link to v1: https://patch.msgid.link/20260714-remoteproc-eliza-cdsp-v1-0-32eb7a1f2c59@oss.qualcomm.com

---
Abel Vesa (2):
      dt-bindings: remoteproc: qcom,sm8550-pas: Add Eliza CDSP compatible
      remoteproc: qcom: pas: Add Eliza CDSP support

 .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 21 +++++++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c                 | 26 ++++++++++++++++++++++
 2 files changed, 47 insertions(+)
---
base-commit: 03cfefef0119410fc464d0d56e83626cb570b7a8
change-id: 20260713-remoteproc-eliza-cdsp-07701ba2b956
prerequisite-patch-id: b8ee3b8e05b200e19de49ea4f4a6e9001f52222a

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

