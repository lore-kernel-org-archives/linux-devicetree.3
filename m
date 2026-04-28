Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A9A274B23
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 05:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777355828; cv=none; b=nsr6WZBUIxn/QL8Wbqa3fPcs51OkBPf3EVMKcmi7Dh1Vnh/rZ3EVpt2gztylNLds96pbo5JeYdAeeGL+ElJ7Vo8fYLEy3XYWyL1X8I/1qDxv0csqxBkt3DvM6sBe7mUxhMZO+4kYwMp8RVw/dp+G33dbavLGrcClBJ57nw6SDn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777355828; c=relaxed/simple;
	bh=LcsFCgCP4R6KBEGDNcumdoG43Kb4ysX4yrxLJAHaZio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j9cdHAtFU3YRquamaNG/cd1FOmOGU2MlVKi/i8togoV+1JxyNB8rn8D/fVaE6YSSkcVxD5jw2caNXXOpQ26U1osEAulmSNikxX6dl76/OOht/2WCQbP5TYFOoLbCNA/C/PZJT+fCzAC0bDk5EpBvLqYyyQpYnBvrS5AByJGu8p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JJF1NJGO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XdxHiT8I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JJF1NJGO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XdxHiT8I"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S3Gd4U1237232
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 05:57:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cMT9onZy7Wk6dCOLu4+Qo0WwTxabZn/BHLlu2ijHpt0=; b=JJF1NJGOIZBXJ1x7
	wMrICmNnwrmaDKkH0DxKiYTvU3ZPMWfLg2j/6qzFj9PHO6tX68lIsh3iBJM9EpeK
	XMMMrj4PfRMWWjWmdOlrkGB18xpfDIGYs6BlUfkBYOKtL6txOI0t0PF8TFO/Jjpv
	9tSO8LGZk9ZZwRyOme2dsdHJPgHlCA9f14PKICtwVcRhrQx1bBzOrN1rChq868HC
	peWkzm9oPhKuiyHXcyhcEsTRrnXf8UDAa9tMLCmIUovIcYH0uXuc+BeERKHlK6fo
	5E/WDMCbsAjTR7w0Nr2HGLdKgGTt2whSd4Hg+zMHz2oaU1FztxcGk1my6sIgiWrc
	f5tx3g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt6n4ksvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 05:57:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b242b9359aso110347015ad.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 22:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777355825; x=1777960625; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cMT9onZy7Wk6dCOLu4+Qo0WwTxabZn/BHLlu2ijHpt0=;
        b=XdxHiT8InWj38CItMBP6diaHKKIOAM9FTNz6DpUsPS9m3zCgPZsLm6bnCMRLN3kzQr
         +4SBpREM49jZQviLao0sWFLwrsTOuvoqJ4xUp+bQbPyE3RQAs+idFnu4jQ78lqL5WSfj
         lSDz9uTfC6lVNb7TPAERm5FiZVYQRiFI+yDD/lo0w+25qBb9/LlvdTcIvollwTysz/LS
         Ow3S4E8azIxnekaa0s/AlR9CSJGenUwonc2yH+b0fkGN9P9e6r/FUHvCOo3vBcbeuvJi
         AG4QFtmSB8pnM5Vq9Wbm2ULfUWj17Ch5apCbG0Buv6a8hHvJAM0PyQ0S/wZ2w1uwFFzn
         /H0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777355825; x=1777960625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cMT9onZy7Wk6dCOLu4+Qo0WwTxabZn/BHLlu2ijHpt0=;
        b=q8X52V+dfv4ycybZHHoH4nV5XqfgXKm/x+pOz8UV2vY1c74UnyXkWfjAor2EwWr6GV
         7qnPhfdJtQ3YbaPZjOwwhuWTZMQrpgR5/qpzWaiVnZhKCqOZSYXwD1jPOOqEcmfTf1zU
         UJD40tjFFBAcWNE3PT4j4IEE2+t2+abaupRHzetJMSqqclH+UcpSotdBUGIDc8TgntNP
         gm3bVrSB77ZwfsEBY0HZbuOckv6lM0CU8WwCmUjOh6sE6wOQU5FRHwS+3Ag/wovN1xYU
         d6dPSwrMOuD8Hql5m15jKC1L/7X9UwzHSV3vFsBXsvPV/b4lgRL88rG3zHrpyy4zmhzc
         d2+g==
X-Forwarded-Encrypted: i=1; AFNElJ8fQacANtgapzeLnS9BZCaLfZxWszeeIDGTCojqF53mLtJiNo/yPqHKAiGcgbsuTInp0weuZ/mxF1w8@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp27cWFkKK8w47Gk5RTnliK/gXbiqaSaK+XLw9rxF97FrQwcc0
	p3RQ2j+h1zporKxGsRJonQ6gKBDtJS4MG91DqaA5/scoJ3xSDxw6dqh+YLDXHkqDLErsJCPXfmT
	ZDoNPSouuFum7qxtrQeaJI8oId2T6FQSh0njCALQinmxao+4kpXK6z4ODvGGZmfsE
X-Gm-Gg: AeBDiesQ9pLSpRDH1InAa9DXpDKp5tPSV7mpJjdwoD7RXmxuSnGDKvOISygNiOn8Vlz
	mg/fxSEbuNC09YEjcYgoTFpzPwROidfZtQ1+UGacialezdG5WRLCGIikuu6vr+AA9bXy+tWuWKD
	KW55Vhjw/DBbIohVw8SELeuN3ZjmgRgAyiHLzBO7YDCkYqvZ1XVNaCB+DbKlXCH9YsPvPNxPbX9
	a4aGgbn1ug6nB267n6TWgK3rDuwv13XKo2Wl1zZkhZlnq4RJBcwSyLclYbDLW1KQlxN6XHKJ69X
	9g+a0zioxj2S92FS88uNSsSqeiwYu/tCbB/9pOF1P4Na9fojLVEEaifphXVgCtp+OUOO5Kvm3Ju
	ZSO/4sCvpfwfdHq79hfGGp53xEvhTTXUkn1gEHNFc+0zlOmIVE27V1BUXlruSk48=
X-Received: by 2002:a05:6a00:4f8b:b0:82f:8332:492d with SMTP id d2e1a72fcca58-834dda8c564mr1904135b3a.2.1777355825008;
        Mon, 27 Apr 2026 22:57:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:4f8b:b0:82f:8332:492d with SMTP id d2e1a72fcca58-834dda8c564mr1904096b3a.2.1777355824524;
        Mon, 27 Apr 2026 22:57:04 -0700 (PDT)
Received: from [10.218.21.127] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834daf3121esm1295298b3a.38.2026.04.27.22.56.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 22:57:04 -0700 (PDT)
Message-ID: <ccfa913f-4fa5-476f-9a17-32ad2392e532@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 11:26:58 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: dma: qcom: bam-dma: Add support for
 kaanapali BAM v2.0.0
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260424-knp_qce-v1-0-813e18f8f355@oss.qualcomm.com>
 <20260424-knp_qce-v1-1-813e18f8f355@oss.qualcomm.com>
 <20260425-handsome-papaya-porcupine-d42df7@quoll>
 <e00eb12b-e8ad-4db3-b4f3-c8a81f6a081b@oss.qualcomm.com>
 <2d79d1b6-be1f-45ad-b673-c8b3b57f1e15@kernel.org>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <2d79d1b6-be1f-45ad-b673-c8b3b57f1e15@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bxXEA-T-KSqWajMDP5Ow5vnJx0Oy2DqA
X-Authority-Analysis: v=2.4 cv=Xba5Co55 c=1 sm=1 tr=0 ts=69f04c31 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=XH5bq4SrENkH0BnSGEgA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: bxXEA-T-KSqWajMDP5Ow5vnJx0Oy2DqA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA1MiBTYWx0ZWRfX7s8VBS+nt8J7
 gpxJrPvqW2MX9syX58CTcUqukYJpEWd36/EUZhxlvu3Aa37P6PSa9hu2JTe6YzKwt7W8TL1rYHH
 KGMX6H+y8wuBKZb/vwvPGni0ECA/E9Uj5kd0nDNmACVdXTkyaYNw7yu5uZf1midxc8OAwWwp5bv
 KyzkA7GyJ2HarRBsGbkSaesUGGKf1Xjx1TqlooVLWfjH4iIyTcVJofOO+cC9Fe0gmR7PNRp9rsE
 cT6+JJqIgFhpKitLL6u3Yofh5BvHFxbq3CH4nltNa1wTSj/2V3GSjmmemjqUvf17Ucq6tkJGS1C
 fJDoxgUBfWhP+Le0hqxgvuQgfpkMYlOBRKMYGx4VGF6+mKkGd6MPJ8UMsnpN7j7TQGrBzWl6+8p
 /aGOx2F/ZAyC7+f9t6ftw3xn5C9s7yrubTrKHe5IGLvY7pWhaL23nkMhfgmLpy+B8qm3rq9Q+uG
 ky+8FwlgNAjZorps4Yw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280052

>>> Drop the example, no need for difference in compatible.
>> The current example captures an old instance and doesn't give complete 
>> picture.
>> Example, doesn't specify iommus, qcom,controlled-remotely etc. whereas 
>> recent ones don't specify clocks and reg address/size cells are 2 not 1.
> 
> That's fine then and should be mentioned in the commit msg.
Sure, thanks for both feedbacks.
Will improve commit message and repost again.

-- 
Regards
Kuldeep

