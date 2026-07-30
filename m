Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410E0473C80
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785455526; cv=none; b=VlP60qq1GAiHpwprMPGiv8m5igAnPVbEUm3YxPj+yN/lDS6tEHp0bE+CzEGNl6mZgcdGCWQDktJ+0OUQ2Pc/Jogkk2ojIy8NDVKnwnLzREbiK7i6vLhCtqAmeHNMaI8M2qXsWX3zH4GSaP0LKkm1kaRIO+RwOsGr1yDt3xDtlrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785455526; c=relaxed/simple;
	bh=7KJFUkK3IqBdyfiDVBbWS5wZfeNsRT8SMeMXT0iYUtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W6Jtw4nOR6TP0P7L+lStXPSq5u5rUzXDc28hEoZ/yQoH/GBzyYPKBG2GAlXYMVOjTwUhQMJ4oQb8gMx9ceCq2VK64h3o2kWt1stoS6dOQZ6F22dwh+opITUPUe1lnLwLkG2p6AJHI/bMfq2hx8uzr5Coop8Gt8crdD3xUXgA/+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lQDqIqiK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PS/dYtzz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lQDqIqiK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PS/dYtzz"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UNJJ5H1760873
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:52:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XgFBMuS+PB0NzgKzGKdztjxhr9r6FfGOR7K8XJ478Io=; b=lQDqIqiKp4AybRsq
	w4vvDaEHIj2depOj7nPvbYcirAGUIyN9xQfLHBozYDKGQw8a6j0S8FYorvilaIdE
	MwFNLv7LWj8WFKPer1oD8lCM8PP4bD4EvBlRY3oZtunMwR32KUfIMMFafDdvvaHB
	fkEB7jIGMCQ4EANBZ5UF+tK5gB9R9P6DqLVyOjmjDJaD/edwhPoLoxIBj3uI6Psq
	KRsCffCOWe8mb0ABGooE2MZzfFUEZ5rgJiLnn5Ti6+cusmbTI18ZDwZFb74kSsU9
	Sk+15UclF2qWA00ZXMWNFyKQdZdqfv9+9KzJnjRpVPECm44i6HJd9BD0ZKgLulBj
	9ESEUw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frg5v82u4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:52:04 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-907c59bd65aso3661966d6.0
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785455523; x=1786060323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XgFBMuS+PB0NzgKzGKdztjxhr9r6FfGOR7K8XJ478Io=;
        b=PS/dYtzziKVthtKCYAUieP7uUei7CTqHd0g8dWoU1hQwNsa5YlQ/VzEloM/yJX//Fu
         VS6kEfe5G4ZX/I1eMSdETo9RXvLJhZ4HbftOvrGxVvx2cr0dOv9IQaQ1+mSDXe4fhEtv
         a0spz47DXjXwrTW38BpXbO6SvBxpdcEY/gR7XlYnjW4LwvQz7alF11Wfrzlnn3nu9wH7
         xTmYTu7xmIG+1PMZeQW0X6UtckJgGUMp9ncFDBMwmt79PgjVVKv89ToU4UOtauke7hE4
         ykA+uKVr/0uP6daaBc5iaHDh683GLlScS+13s65M11XXBr224mFPnFnS6NCtIAQcNl7/
         s8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785455523; x=1786060323;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XgFBMuS+PB0NzgKzGKdztjxhr9r6FfGOR7K8XJ478Io=;
        b=ejp2uZGmKW1Lz2IdKf5SqDzXeZCeQk5ZdtWirXc4zsxxF8WdiBUE2Dd8y4BXEi0Y/z
         Z64aGBpujNfUAWWrzRCc+Y8X9H5M4KsaQesVQRAcecg4AIWOA6A2fdj5DiTtxpR5vC8+
         szinyvnsYKJQ7EGVZGgX+CNR306WpsI99uwzwdhpDucfFWo1uyH/q6DZabkwY5MHIYPt
         m/5KayoL49EyWJbDF8koQkIwXJsoe6gsIb6r8VkG6S0nm4oITcbrPyYnUEfodhTCiaYS
         AfalQ/xPO7Heu5sb4tj2q86EswFXbMQ3vyVVhrfaZ8vt7dC9hOzYcf7UB1We2zTms1LY
         Siug==
X-Forwarded-Encrypted: i=1; AHgh+RrbV75yJOCHRs07Zq1rCWU+5k+XR9kyIFgB3OVRcA8aBXqis+UmNNYnqcWtRhT/gQap0HXD7KfkEd9V@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3/o5lpVMSfIJToOMrwuZiLTN5XNSm+9QtK4d9lo6/fxlUb2QK
	A6kqe692UVR0RR7GN3QpNtsIRajMzw2tGkU6W7JutyuVOdobWdKo/6WFtJWSKYgb5jEfjCC2srg
	w37510VN3dDYwB1enR0EktoEm3gJOCbQv1Oxy94PhkgdW81YUujCeqJLImfx1JO1xRq42p31G
X-Gm-Gg: AR+sD13CaSjIRVrKrRwq60HwHq8kebV00y4Juxbv4UdMn8Et+EffkDscCRjKNn/FwCC
	A3I7p8nI6DkT4f+YytiImi2kqcDq1T/dOHYAVUTIlmXodjHaIplZa5Sbiw93cEm5HRmdFO8midY
	75EgbC22+invWlPQrLOHat6VslfWj2OMDCb7l7K5NfljGIMuWFty+vGHDfO0mUjxKVS7+I1YtA/
	uAsiYBbpEq8lhAZmtbnEtkMBHLgVWmTjFcwlsswGNS3qfWzsUFSv4FV4e97KsxZ3B9tpCMp3nYm
	YL6jvWjCaqH9i5LeJdMtLP4OEW5+OhqnxTjGKQri8PVOSsuH+cIcDKARLwnPRXpi0czlbEQ3c73
	0hrETVDx0NVo3/GJWO67JNJ++OcrhytW3kvHFAy5rxNvQxF8ZXqk8n+37NgP93hnhbsrzcecGY1
	wjHqY1EdZae5iLmQ==
X-Received: by 2002:a05:622a:164e:b0:51c:b91a:33fe with SMTP id d75a77b69052e-52b38700b8emr51649041cf.81.1785455523372;
        Thu, 30 Jul 2026 16:52:03 -0700 (PDT)
X-Received: by 2002:a05:622a:164e:b0:51c:b91a:33fe with SMTP id d75a77b69052e-52b38700b8emr51648781cf.81.1785455522907;
        Thu, 30 Jul 2026 16:52:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db952f45sm613789e87.29.2026.07.30.16.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:52:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v9 19/19] media: iris: constify inst_fw_cap_sm8250_dec
Date: Fri, 31 Jul 2026 02:51:52 +0300
Message-ID: <20260731-iris-ar50lt-v9-19-25bbab43a436@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260731-iris-ar50lt-v9-0-25bbab43a436@oss.qualcomm.com>
References: <20260731-iris-ar50lt-v9-0-25bbab43a436@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=964; i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id; bh=7KJFUkK3IqBdyfiDVBbWS5wZfeNsRT8SMeMXT0iYUtM=; b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa+MuBlOl9n82gSaw7A5rRdOg6s6vZ0ThhgoXn cqdC/I4hNGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamvjLgAKCRCLPIo+Aiko 1ZoDB/9shlctZEAYdOX7hh+LN1GFLylH8KEUBi5W88HbJCx91E/hyD3qZ0cn3RKpwC1SY2mXwZ3 Q/bFxzhMnQSUhcvGiX/0mJLago8Otc5iSd+p/Who4GxI2xLO9MJlr4mXtHk18hU2C626XvTMjx5 eu75KSeJZ+N/dPELa2oCC4nkh797nyEUWtwiiXWVfHWw2hUcRLkMOIWU+BGdumMK7Kaoac/+Ok+ qvu5O8FW+HVL1ZWmyZ1PGAt3LLoe2eGq1JVr39aEkohs5loALT0WHq87OPqYwj7Azq6KktBJTzN ED5Cz905F34YLSevy95JOQAySfi44oKDx1yExF/oDP59LoBv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp; fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: k2gcBEMewjLe1qjvsH-caNcyRvqjenwI
X-Proofpoint-GUID: k2gcBEMewjLe1qjvsH-caNcyRvqjenwI
X-Authority-Analysis: v=2.4 cv=JsbBas4C c=1 sm=1 tr=0 ts=6a6be3a4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=aSZcYj2XgHFsS6ESuJkA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfXywHwDvV7/41E
 dSipNEX552iaVLd1+Eh+Us+OzaO4pUG2UW/nStAX5dVQsxTxwxzTctCfEJQ0BRY6cCRcpWDHk5V
 YzZXmQA/zBwM5P054SW9/ZJs+aJQxAHeEsNLg1TeigWIGgXh+JPPAWpICOXbVku6gf3rRQW4PKc
 0c9HXJflbL0rCyFNLbhYwitnEtszoclzfXxIzCJ3IiqT5cdEupKwLvd6Z5Go71qBk9isceysLnN
 1/d6GSZ3bObGXouBcOs9HdVYYbsEv2uoeDDTiTr5LNey+nXOlpcwS/E7JS6PIg0njGEqjDUcE+o
 luYxaWIS92/gU0SrAxrE4evpg0hLCel5s7nBXICL7vxdPXrcgA5Zcx0wIg+wHs54MEyURKgyjmK
 aIakGE21elvhpwYS7lICi6JVvLHIZF+r33yq8+3FM6GEaNSBVXjsqwqW+yUYcqT6cXNfcIKql1+
 sFHpVyzOaPGT/GQ2XyQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX6t0qmWvM8nO9
 y+uN1k71LxOwrYIGBYfcSJzvwde7835yPRyocCs5icGARx0ZB6i3O8OyMEmjiOZVW9RQRtBFHyG
 4Udu72ZUUMeivh6UzP1PYlBG37Sbk7A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300168

Mark inst_fw_cap_sm8250_dec as a const array, the data is read-only.

Suggested-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index 548609315b85..1f87cef986ef 100644
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

