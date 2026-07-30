Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7247A411665
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785455337; cv=none; b=DP7CkrKhhsuTiWFwMVmrMnWIGql3utBcWGq/qxnt2F0pKVXOxZXlMVMpBqe39Fpq6L0/p2v+JwkukmBx/GqYOmTXA2+WyqA09jfJMAcMB2xruBYxOoyiEsTTcG58Zj7GrRorWuG8EpXpfsXBip9Yw7Ync01VhQptEQZ+8pMFAcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785455337; c=relaxed/simple;
	bh=hbMAj1Jtog5/mdC3X9nKWxXuxrcta9axgsc6lLpIR6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UrfUtf3whpp5UqAXt1OMdkFBXxHFYL9Ph5MMlyRvCCncIiLdXukwuv9ZhHtN8RJkcZmblbobY1h6gesYb5hbHBUMd4pjJ5P3NwO9awWuRVHsOei1AltcaKMbh63J4g18Dpg0VL4NBbYx4ZgarxMtxWsgOqLxlW0uUfVKWpCvv8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CMyruUs6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c8MIHbjt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CMyruUs6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c8MIHbjt"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UMr6hc2007982
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vwMZlMHsuQHU1UftifWPcDYujlD8pisCKUyAh3gzrqE=; b=CMyruUs6pSjVleig
	fZUeC1QfwymVb/x/tMjdLzbRNXmY/SySMkHQpZdsoAkqfut1HGS6tCVlolz+B2tL
	P0QZvIFctKG7vZxXi/jvkRk0oVRO5rG+xqOu+ii0vJGTkZuWidXoFm6SnPfrO0VL
	nSZ3214UVQU/3c3vOSzxE2i47JgWDvtDe5nl86q+v/S7pw0sZvrW6hQGWViEwIdE
	md6IbodAqbjjX60oWOiFI7M6TZLUjlfDgTkBI9DfeWwf/xC/QxCZu6UZ4iOmzL/x
	9Mx0z+41+J82q2X7yRQL1bGR4qNZrFMKLIgYX5pekQan4QHVUoAxJJLUEkADYR/L
	k9KR7w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frfmh05m1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:48:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1a97644aso3679921cf.2
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785455335; x=1786060135; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vwMZlMHsuQHU1UftifWPcDYujlD8pisCKUyAh3gzrqE=;
        b=c8MIHbjt+FBPDNpXY4boFPMJefCyCzP7Ryf7bKV+YEjs6XVUq8hXW95fyCI4T1vom0
         LiQDRY/HmVB+z3khBw2mSJtxa1ltDrGpaGX0g/5sliXk+HacDjqQNL90baOComG0DBiy
         92Q6BbkyT6c4hc3yU1OzZnwpBa/WkDjnj+bvjTDDLvgPzQOEWSQA9ZXpfq45RwcWjUfA
         Hn1Q9D28s614Ufrc9FVsldCqArdm+8XDOm4pM1dPiU87HDgclwnCUKMWu7cFmdXqZ+y+
         pgR0+Il1QhhpT04Fl0LUt0aolRfszATAzmMZL+OuCY1VTxECloA/Rh5Fj9avL3VQu4kG
         E8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785455335; x=1786060135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vwMZlMHsuQHU1UftifWPcDYujlD8pisCKUyAh3gzrqE=;
        b=IoU4yYHfBB0aytvRgePGFn+3rb9uqc7AhXwHF0Alvstg7zDDtGMyonanjGuTl7Hbep
         PIOm4OdFmB8fnNWggYOWXIhIquKFkoE1ZhtMr8EZrouq3MAWdkYcjfsDFxG8a185qxeB
         hS8NEF0RtY5c2jNuCjX5fUYmWAeo61lVM3Xy1xGVKiwaG61ixKifmjMR8Npp2OMFBPBR
         oTZbHJXRo/3n2I1pQIAWY0OAtDLK/5I8WXhN/CCYDZeZm9ewc8qoSR754tGhney/FJEh
         FPKJCoStVhJOb8ngnkc1RpDgOd1W3OfM7qxiwu31iEq4i+iS448kqDBXWjc8OPV/v2RY
         7jWQ==
X-Forwarded-Encrypted: i=1; AHgh+RqkqRX1iVL7kbHJt6W4MpvSLSAczfGdXHYaK3Bk52zdPYN/RG0ZjVffjnSTfqNqq5ATGqtIJUzKW7g9@vger.kernel.org
X-Gm-Message-State: AOJu0YysuVwFg6DLLtkGwyOCVGTxGqHosOjdkROeuv3jjAeepdVvf/4f
	Iu7gG1ZyWOyEcC9ggF5+Jh/2PgBU8Tgl1Yq777MhLB9THZvo4dINrYEK36nfWyaYgAiXoj/EHo4
	rNLl6M/pDaSgCOv4tDSaj5/8GqZhwe4eZNLgcUU6tLlnT4axivOmQL1BIXn6WReEy
X-Gm-Gg: AR+sD110HfydjtUkl2VCuEYIMuxlbfNTfgKSX7iZhXt9w0o75Jerxb5JSi9iBLYScXg
	tOVKYGQahJSQmqV6NLJqJ8aDiZTaQ87eI2Qhz7Hj1cktfwxawB2Ek4a01pv7tG5fguPHn4WhyeE
	5Fl9motQ4vn7dZmWgfpWHeCPi7CYAjEoUZtWH+zsYj37PHhaABBKFgKcEYBqTUl1WlmwNNnPprU
	x57aMX3vVlo7WvCjWzBUFZxLovBrapgiwiiNKKXJg+hxopvKK61rWLEGs0Z90mgP02GjKIpnNV8
	2vJTYzaLF5zzz5kPot656pV2o3bEmHdZLJO8S2J2DSxQNvX7Zhfg9098m21qdiokNprynsb1lCe
	SreAxV420JSTBJwV8Wxz0pcTjjdwt8VbjAMWao6zjVhxJFuFCctRkxb0FVbwrKflSo2sZKz7lk2
	s/SU4kQbcEzKqvPA==
X-Received: by 2002:a05:622a:5c15:b0:521:5c5:f986 with SMTP id d75a77b69052e-52b384c918dmr49314731cf.33.1785455334822;
        Thu, 30 Jul 2026 16:48:54 -0700 (PDT)
X-Received: by 2002:a05:622a:5c15:b0:521:5c5:f986 with SMTP id d75a77b69052e-52b384c918dmr49314531cf.33.1785455334440;
        Thu, 30 Jul 2026 16:48:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ba724sm634487e87.45.2026.07.30.16.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:48:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 02:48:32 +0300
Subject: [PATCH v9 11/19] media: iris: skip PIPE if it is not supported by
 the platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-iris-ar50lt-v9-11-d71a782001c0@oss.qualcomm.com>
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
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hbMAj1Jtog5/mdC3X9nKWxXuxrcta9axgsc6lLpIR6U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa+LLWJdVGnPX70QBCdbtc4J37CKRjhhzwPzXb
 mi9cnYmK5mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamviywAKCRCLPIo+Aiko
 1UrmB/0T1YgXOqC06R513be6YkDazdHaLEe2RxP1Nu2SZxpwGibKiuwVb3yntD7F6oHWgQBx0qz
 IsXu1O68Aq9HihFJryCJxjFbTlOPJaz2dB7zobhZRVn3m7dtgQBWT0kev63BpqrOxw34UyVFZsA
 bjAKvA+G4LcMu3z3uctCJOelF2itS9HmgTkM5/hXII51OQMj+uO7Kpny2tjCtictZzCyyhYPUua
 MDraS09AWrQaxT1nvNyvqf+zy/MFFeMn6TbQo6U58H8R7TKzXCGIoAaaQrkmP7HxY6EDfhaYYrE
 fn/e8YFoCtvxK7H8gwL2Sh+UOWPGIlNsrezpeIjCqkoM3NmC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX0Y1XSJwi2+Go
 FL1mKSkvJAT+BEBOUQWR+4cVS3ejuo8cjyV9c9Jbe5sf3GHugDlLjBZgHPfr0sl9VmOuW3TKQdN
 umkJK6al4rWyz5+cbcL9qBQ26hT8JKA=
X-Authority-Analysis: v=2.4 cv=evjvCIpX c=1 sm=1 tr=0 ts=6a6be2e7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=9TuWGWrZIemhly9L:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=DRvvl89rPFtLv9ObwM0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 4XmSJCV9ER5Ck_55-UL3wuUlUoL0X9Rg
X-Proofpoint-ORIG-GUID: 4XmSJCV9ER5Ck_55-UL3wuUlUoL0X9Rg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX5+OuUuDG1L89
 iEmIz5+sYQ5fA9wZknyTQMTDyhE9q4Gk5Dr60LKw582VSVFl8oRD7QitmdP81aRGCnL4nyimWEb
 Ot7de6pf8AOIkqI7vgnH1rE0ZhTeDk/vlGr24WDxNODPYCNJwLs5oo6r2YYeDFFX2XBk/ziv6OT
 yBt4wOemkVtnhURNfRlBSzPUXKmPJKrSpyqfOXOLu0P7V5+LaQ1AHv5gq/Fhi7nX/Zt732dsxIU
 AwAks05sDVa5efzt2U5fcF1KaAvlfwhniwDzhQb3WiL+N086+a3mGDoTeNLPimVWd5yl2VH72EA
 8+8BCVgj/6YL981lZeMfP5JO0mcXfqw6ve9p3vtlc2iCN6up1YMGN85JTCMDausxO3YrgXEJUWO
 FsNTsUuS0uwMYmo18S8O5VxNVjhl80GgqAD7AB/hsXcVul+otoT95SzGMOC19otw+VohKYISEUp
 kxZeReeDtIFPAz4eWyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300168

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
index bf17d310eac0..cdd02328cb71 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -538,6 +538,9 @@ int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
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

