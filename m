Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3A714F70
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568314; cv=none; b=Pxo9Z9oUiVzZ9288QG/AKdfXcAm85K5N4CC1HM1jJhVaqmEWZSwLxJcRcp9qE4Y7OWMrBgXvIokqzNtCrGI+cT/mXE2xbLTsmeRESEuDlg2ggJ3UL0+naTn4lJVZnCyPWi33kHoLvmIuS7qcdd08Sxc/CqO5IRizXYNCN7/gT+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568314; c=relaxed/simple;
	bh=sUPB9VJRkRZ4see9KcmUKrC+0hNnHbRSIZoFexQREuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cOELEfP9OOXdfxyXql7wo5IIbR+pL0mcxubPY6hUyQ3zNR2ZZLZEVxxPaNjjMTNhAeLQ0+qieYZW1nMhDBImfKJJPHfvRPyabJQrx6IpR+8m0HpEmBWSX3w+tCj3JGgoUXhKvHk+8IUgh36KclPB940kH63w1LoqpYckTK2/fQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CjdZlHKz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qnr+xUG+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CjdZlHKz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qnr+xUG+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIxE6b882163
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:05:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U0gyuvkccvtpcfH79fJjPBeyRgK2qdZ/uoYlWvMd7TM=; b=CjdZlHKzuveyjQw7
	YwsNi27RzrJQA4UsbEj8mVq3pVbDXcfgSPCw9J3QrP5wDjPEHSsXAeUZBFCBKRlW
	uFmAaN7tDru6HwT1uEW1CDfWtvbeOutLlPanmBuuzzIkuVVOQeqpot4aTxKH+fpe
	YERg3RrnlnT0dfSHIkSgyD840WnmqRhGmTqw2dF6awOuT476SyZ4Lt+juHsPiUip
	X0v46uda2dZ+oB+jKDmazCcjrvNvT6zVJyEd0JbSavV5P+ZJYDddiuqzc2InmyXJ
	wqdHMn8ylN3iHFhFIGUsVwqyMK5OeYq/ivYklFJxnQHecGEkNpdJ7RAwjo1VSbDV
	Ebz9Xw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etew0kq4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:05:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51776d4355cso19537621cf.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781568312; x=1782173112; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U0gyuvkccvtpcfH79fJjPBeyRgK2qdZ/uoYlWvMd7TM=;
        b=Qnr+xUG++kmSAYXelfilaC/iUXWZp3UgPvORvAVKBxRgJV3ZXAl1lorxkD9LxyLfdT
         7W60TycvDLb5hcm+gGIDdUb/5VfnMgi0upv0M2dKHNFB9DUpAebpsWsuICGzdTa+4JGJ
         RosphjAepouLXOEcZuVrqqU/LjjEq7Q1ioIL8pvkslBKK7i7He5osc0DL+7NT4TyVOGy
         cGA2Gnmxt8Oa3y8i1MOcylzprJ/21ulj/IfCAVOyg4a/w/SuNwvry2B47rHhopsa5p7B
         MabMc+rxS/E1urgeFQmSr+7DOU8Nbh3WYZF4ydbW0cAJgogVT3rkeEEaXrDC6BE1o+Zw
         JDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568312; x=1782173112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U0gyuvkccvtpcfH79fJjPBeyRgK2qdZ/uoYlWvMd7TM=;
        b=HhQk7KEmd/jLBkTFRGuUQbYOwFGt2bqmihT4At13U0y95LPkyPiN/3xGW27VekZ7oe
         8DXekhZLlJbWmGM9mAxbQe7KvTAgJl5wvnK/T6fV4gE5ujjTzNx7MXHVj98KqkLLw/OD
         /GsnHuGYL89RmC3qsPS11+ggGAF3Dvwla3geZ8mWurwRVvH3GsAWUPAswJ1tNJ2ALR7V
         FKnklqhDYvU1d+nCA2A7knWRRLYM8hCgmu3M/4n1vsZs6U9ywN6eELxJBc5M4A741BK0
         MkVzGq7kTJv1+kE7D1UPqpFOhlGXJLDOjLeKVW4QDH6juy5fn1aj0jJMoUsb7yIc9JEP
         8TnA==
X-Forwarded-Encrypted: i=1; AFNElJ9jYeErfbEtAttIKsGFTqi2tAq0XERlOP1VVUH9TRrvKDDY+haCvA9+Y9CY/fiDfPLLpw8m67GkuUNi@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7eq9L4nsedfk/Z64Oi8TVf34J3nWIcEs5BUoKPAuV3EGZCk57
	h5rQQFgLkeqjlXrum2owDnivS0/UVoSyXexFQbgjtTizVDwPjn3BPo11KsL+CjWgvfXuNvavFyL
	lBSHtRcrKQF9aruz4TZeaSw2ehQWhFWkScIgiuRayZolDB2sj/Pbt0Q43iLM7AdGy
X-Gm-Gg: Acq92OGdc4sEH17Jcrg17F1GLcS0u32PNzVLSKO/XloqBdu3Xs2lfgn6h18KAxSzn5k
	wFmXDXGECf7THrXT0eudvLWWG+YXZueOJDCYxMXQkjn7oETAbem7rx1cYgABagOnk8U3awtwx0I
	ul19BnavZSAFZwi5e7UY82OrXDODcH4DYk310BmyXTTtVepkJ5yAMDnffkWzvApOIGvcQhz/6Qy
	e/QmFB7ST7IZTyOefH6RBb3RwK5MSNjmJRlS5nbac4mtqFli1Et/yEZb7F6xp+EDoE17aoUo4/M
	cdsaV6mUN1fRuvG7avspig+mgTCT3ybK/W8BuScJ+/2JdVs0fERVIvniVW4Ev+xcbzHvsJEOy9T
	FviDJtQJLS+sA1vj/94XMg0TN7wks0xbBmCB6D10LZCksyQ4m7dPX6aOK/6ZBQzqYL9WGeR72dp
	QLGhsB0XiIUgOxdxTuP28lw/UAQx0wOu0a0Ss=
X-Received: by 2002:a05:620a:4542:b0:915:ab5d:6763 with SMTP id af79cd13be357-91c2fe7f3f0mr239109285a.43.1781568311687;
        Mon, 15 Jun 2026 17:05:11 -0700 (PDT)
X-Received: by 2002:a05:620a:4542:b0:915:ab5d:6763 with SMTP id af79cd13be357-91c2fe7f3f0mr239104985a.43.1781568311253;
        Mon, 15 Jun 2026 17:05:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7092sm3015731e87.50.2026.06.15.17.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:05:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 03:04:35 +0300
Subject: [PATCH v5 08/16] media: iris: skip PIPE if it is not supported by
 the platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-iris-ar50lt-v5-8-583b42770b6a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=sUPB9VJRkRZ4see9KcmUKrC+0hNnHbRSIZoFexQREuo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqMJMPIuHDGDZAVSivYyEtXG2etJ47LOrQXsXzx
 AZctKuIPbCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCajCTDwAKCRCLPIo+Aiko
 1YQkB/0VGV4PJPIn/d60fP9t7WHD5ubQ7btS3FVmtwmzuj7EJumcknjG1dBkfSGvazVI0iK3Ix5
 rPINo5Ugw14owrtvPsFmX5eyepWLwCMvu2Rrh/3d3W2UjFYTflSXHRqlvscAgVrGwu9VgazquGk
 V/lNmn6KigDeIYrOICLL63KYK53rEQbow48A8p6GVBwGL6jCkDXLVkY+0jrSQT7rJ0uG4/qniPT
 XfFaVhkL/1zuGdW6uc+OphKbBLRNVTTlra8oUFcg+gURp10804kJZnoTEMWDsYtT2O30mHVpmuw
 bnU/dW18pZIULbaW/J5hTrWfMFxs0ulbeydiFgDc5YHyeFYM
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfX+IwH9w1USTLJ
 0HN0CcVMHeWqkL7EDNT85bUz4RJnoz91VbxkSWPwV1pbkqHHIyWWf+8H6U6WkheKu7Inl+exghd
 gFQBWQ8+ht+i8PHOSvOqBr5wT1TJh9k=
X-Authority-Analysis: v=2.4 cv=QLlYgALL c=1 sm=1 tr=0 ts=6a309338 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=9TuWGWrZIemhly9L:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=DRvvl89rPFtLv9ObwM0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfX5agbNOSk9YMi
 rjWDzohculrKZL6DH/qHKU3uBFURpdmB/ctThoCWQWbJIK/aXYCJC3N9sZYa7dlsVRPNdJ+HgfN
 zRLmAqHFUahMMTkVz1xyz6WukR9p8vby7EKOwrXRRux5/+5l1dx4awORj/LNO6DtL11QPnZogcD
 m6YeHmgxIY40H/mPJJOTfn8iTgtjRbuu2MghJwQJ/0/Ha32dSDbVSt/GDbgNmUA4AqvfDMhh3Rq
 10ZYlHh9pPzTL6FHq4GnePv8CYpVia1oRYyCFvwF0d384jsjcIYPD5W3CSfgiy8zQa3tL47s6Qo
 TGkfJgBxg6JLpyRKOztNmBCzb83xQz12JRo/2C49qHbz3+uqe4r7DkUeowRqWO5QNVQzY5PMDNK
 wYyc8d9sWmG5gKlSuRCrO7Yl/QZeUIemHfLc4bxJqoqrhADZzasSK5m5ZVGwhyGOky5IJkx+LLf
 lbv5tjoiboZSLRISprQ==
X-Proofpoint-GUID: BcE0y1rGUBh5vfsvaqgnvNnT3p-SJKVw
X-Proofpoint-ORIG-GUID: BcE0y1rGUBh5vfsvaqgnvNnT3p-SJKVw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150254

AR50Lt doesn't support HFI_PROPERTY_PARAM_WORK_ROUTE. Tables for AR50LT
won't have corresponding entry in the capability tables. Let
iris_set_pipe() silently skip propgramming the property if there is no
corresponding capability.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 10e33b8a73f6..33a34573391a 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -534,6 +534,9 @@ int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
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

