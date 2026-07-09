Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA649351C35
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604552; cv=none; b=AmyIVk6dS6a8rvhlxvK2c0lCLKt86ti4p1gd15geSr8eZlwvghWLscTLuC9x3b6pOQ8h5kKfgK3maVlMwWEbRhdLUVJni1qq02q90E5hbeLQg/eWCUymEjhYrJQ2F9CHqwFIPiK0KufREREA8p8WRyJOvDc0voTp9guOfusDNCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604552; c=relaxed/simple;
	bh=sUPB9VJRkRZ4see9KcmUKrC+0hNnHbRSIZoFexQREuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jgyn9SBZMXOVTThbBJ1g2F4B207mV3M/SR7B0GWbkuBj6e9iUBpIclYos3cJuyb4dZTWJeSVvddNxlyhiem/hKZIIgQeYZF9jxJheqePpC7jTWA3UKMOGkRnk9e2SJxN7OYv7908N2J4I7dhrW0IdlL/0qsOI+t5UHHX/+F1miM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HZLYIpnf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YriYE0SI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HZLYIpnf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YriYE0SI"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNE1N1488714
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 13:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U0gyuvkccvtpcfH79fJjPBeyRgK2qdZ/uoYlWvMd7TM=; b=HZLYIpnfESnQK3N/
	LgXYva4tv2++5bjrwdATe00vOwsQXT/98ekjMNWaLlHbfZSisGSAZg/o42ZkKy7S
	0JT5LVp2Bbzt+Xu5hgqrPAAgQxBeSORwcf2Oll5OYLIjogczIVkRJC64g2ypqp6b
	BnPo9y6bOt2D+FHX9Vn6yxPs0FF9STUox4dCUBjkPOijuiHnJ/rMyyojBi30TAkG
	dpO+12MCkLjHMFSyqH+/6QMcpA8HGMkRIyjogBou0feoD39vCwx3nLmdRoOBqzfP
	pq+ewYx4tL9I7HgsekBS8LVUmZ7zv826uP82v6dk6xO6zlopfmd2GS6WHzKGuSsI
	ariCuQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9wwfuft2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 13:42:26 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73883529f72so1929487137.3
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 06:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604546; x=1784209346; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U0gyuvkccvtpcfH79fJjPBeyRgK2qdZ/uoYlWvMd7TM=;
        b=YriYE0SIC1q+75c8JNB9AaVb05xmC3kb1MW4pZbj/aJ+nyFfc1N3Ur2jPL6IsIf9FD
         RgRWPx0QwQ32uh75cl4JEb4glmAa0flcEtbvseidZMvHjtiSW8imqlhjnBDw4EfvXfNg
         /VINJceIYZKeZkTcD7ZyXhWhY/6JnDzNUKzS2Us5h0hQALpvOeqnjtnTFS3hXPJBIryF
         Ge15RUG9f5xzj98+o3HdOkyWqpRuwAg3JiKuqdHqeMkpV7BfXHKtBj1oPRv2j2abLq2F
         etrk/N2/Wrwm719jlI5a18tIrWm+x/SosHl3BHAW8lEvLXK6yT+68EsgUQX7sZ2g/UKI
         FT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604546; x=1784209346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U0gyuvkccvtpcfH79fJjPBeyRgK2qdZ/uoYlWvMd7TM=;
        b=MyLTHmRUVHmS0RuSbMgEJt7ydjzWTQcNAUaY8x3I1/WiuIbmfCAA39er1ZDa1bjKp4
         7sF9PdH/qlqo2Fqvx4d6vWxN2v0qHsb8X62sKwdfOuJYtpnOL35/enXzqHw2Ic7ruQkW
         kzigSevAEk3GLuhhtxW5fXnzcnPGFkbunUMJR85iGFUVRcMEBt6hznK36Cv9Z6xAzrg3
         qGiNaSnCRYKKP8zb8lfLVzYRfa9V7jJrl01wAG5HsSKnrmmvsT4wviC6lNKr+keSz+Ac
         gSpWjtHcU+Qf+f+3v7CH6Pg1g+fZBOmoxI3s7RdGOAPOmiD3QtHpMKviRgDthMXllo7M
         Fmug==
X-Forwarded-Encrypted: i=1; AHgh+Rrg/+HcRu2xYxlV78W2ZoBStOMrBGE6KZsPB4Ksp/BuwHfmeTUJ+bXoPXqqIuQJ4xNitIf+iJ+dgAgg@vger.kernel.org
X-Gm-Message-State: AOJu0YzuF2u+HdDG+Cnk+G3mcOvbCqW5xwoQkRxehfZ2WNrL1XKrOIzZ
	fnh2k+De+UoiyxCZDxCFl1VLyO/a0QO9Kb3EFv+jwpN9PFnLubna4ki74hVo3+cxuMnJfizyOgv
	05Y9hHaWs/SW1nkyfwEmMPFz8eaJkPYs5t87Ab35wYBu1pU5vFdPsHQfb6ycGVs4F
X-Gm-Gg: AfdE7cmVWmArQkenXEx6v0iuLXu4mJRnFmPXantvUHz7UftHDDWdt7drXji8Sh8TPE8
	spYaIZPWbi5KfAyyjsbLnMBlmCA6zGih8miqjL/RQl9qEmLVfgGCDJhkh9bRNZlKDZzwiYtLcT8
	WUsJ0LGBgT8uG7oa6X7ghE14Ts+ptTyH3PKQzt9Tq86InYZrr9RzIxZoghctyR9+GDr4XdyUZHE
	ZxWSGTVwsOWYA5+6fI9jhH6CD/SGLOXoqSjxfWdc4P5uN8TW3EW5qe8mWpgqpylBqY+aNTdwbm9
	xYCAKL8XbmdpdvWqjpFP68+RupTm1rerNiUydTn2PUVrtJVYWC0J/eEAtg8vro6TefHH9JKWWj9
	abd2JDCl8hc5kHQsqt1IxC8t9DmO1U2mS1vLF0ouHfsZssrw2QMPH78DD4kjhRVquttZrf8aTeD
	+dt1zJDfMBnLzD2xEuPMHwLsk1
X-Received: by 2002:a05:6102:6d6:b0:73d:cca0:a220 with SMTP id ada2fe7eead31-744e0091664mr4685326137.12.1783604545991;
        Thu, 09 Jul 2026 06:42:25 -0700 (PDT)
X-Received: by 2002:a05:6102:6d6:b0:73d:cca0:a220 with SMTP id ada2fe7eead31-744e0091664mr4685309137.12.1783604545522;
        Thu, 09 Jul 2026 06:42:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849186e1sm3345151fa.9.2026.07.09.06.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:42:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 16:42:01 +0300
Subject: [PATCH v7 10/18] media: iris: skip PIPE if it is not supported by
 the platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-ar50lt-v7-10-76af9dd4d1f6@oss.qualcomm.com>
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
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=sUPB9VJRkRZ4see9KcmUKrC+0hNnHbRSIZoFexQREuo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT6UlX/9RVSn3JDVBEyI8Qd/76045hV44oJk/7
 xJ4zKI3WYSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak+lJQAKCRCLPIo+Aiko
 1QtuCACSDz73theotU0s5d442S4yoLd4Qdst5ADMzPhvxkuJNshOgDJte4nD0bpQ73/VAGHFj00
 sanez87mSGnqz8AFTWd9jJvcr+xnCRejVXoN2Kn9MRUWFcGQpjh7dpfPS/tr6aC1/esbDEEwXXG
 nvOaMP4fgEMfZjQvwPaldcxjzD2n+vFQoINbgj6QoUoJlA12N5Zo7Ns7iR25wTpdyEusp0klsWw
 BH82tuBy+/hccgAq/Udg0gY/9OOO7nRlZypgbixB26FLgFrAAgHj2qfSbZ+G+l/LoRh4UKDBLVh
 GPjit74mpEMG+r3ajEOEzvpwFOa0YeSLHFIKAibgiBJZj7iX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX2QW0RNxXNyxK
 FEiOlCbigWcjlazMmcg3sje5IMhZUqPa/oPmPbnGjZSeovS3vKCdlGfdxUIlMNAAi/Tl/0We8aw
 muPLQio09+b3gZFQLuh7yZu53RyAHwqwwCft+6sPVdmFtnEfWlNbhXehbnDG0k3XRXqTzP2wqxp
 8Mt4iA02bD/u14Yqndt+R/0ufnZAKYZhaB8pdizM/qG8I5F0zaLMpVDTSFSGqi/pbAFZ8JEZv6k
 0nloGbpE41G2OuROPuYfUFCsuLLUr7htgYdmSg4bmcLtIO0hhdS1shU2wGU1dfx1uNVIQT0Mtzi
 mXvnHjl4eGBRqqWWe3Bs4CpktQFtwcitp6fu/AnVOj4mawyQ1tcGju33hTbJpjKdMy9zwliUYzR
 B1RCOMGf6yeBwIbR0RFCn7IvuzoRx5h7TbyzBMymsMTapUvpTkxdKX2QpFyZT5aR0D0Mhl2Ci45
 C5FPzTJuudzLQdj6GDA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX8NVm896O2YYl
 uYseE3YDnvrBmHtaqCh4Jevm8ZO5Ufy3PtYVLAdsIhpyoIk60vYW8E5rvoJd08UFhd5nsiXCaDq
 9ilwHy8dzIX18Nwg8hUfiFTOKPWwRdo=
X-Proofpoint-ORIG-GUID: Wyq7nUTBkjNkS5gbm06masZh56xIT8_d
X-Proofpoint-GUID: Wyq7nUTBkjNkS5gbm06masZh56xIT8_d
X-Authority-Analysis: v=2.4 cv=Krh9H2WN c=1 sm=1 tr=0 ts=6a4fa542 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=9TuWGWrZIemhly9L:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=DRvvl89rPFtLv9ObwM0A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090134

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

