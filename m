Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4ED1450F2
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782828102; cv=none; b=QDFAsfhmUC7L0zNkY9/dGcXTHdU8R5rD1e8vECENco8Thv9MMKdHOHF1x5U2hD8Ic5aiG9fxDFbo+1Xtw/97ITYyEdR2W5fcwaUnusoWAkv7ns1vR0FbVSIFyEH4fqlv3RoMy+vJXZg5gR4HoTJKksf/fizO4PilkHIBEzjcCsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782828102; c=relaxed/simple;
	bh=wFepA8lChInmQE7Qa7ZSldjWP0jFQi119n1G5pjN/Vs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fRXatUcU6C8VM58PUCmPga2jAyteztkOmfhSaaBPMpM9qorgMkROOeIXqNUmes/kK/xWhVUkDd67zybMwLwtoIj96uQr9PN9kazub+MO/WwkuDuxC+bW9HkhmU4C7sFF4ihnL4qMM0cAaP8deiInnqNxmpOnTSQHIOHCRjYRB1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OLJe1G8j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kt/5/eXi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OLJe1G8j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kt/5/eXi"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9nCcR1590600
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SZfQLMMjSJHdOdQ3Jm1HrpHymvX/x4ed75IUzx+Y/Zk=; b=OLJe1G8j2+rLPLkq
	rGD2eZB0wnyPI4cG1+Bp3SkmU1h53hXnTcXSScYoiKToQMemTQjS9KjTv0HYqilP
	iU3fBWtusysB50/wrDCK5VeVr+BTpmP0evfcHxx0yVqavVpfBjECoQL759UDkxI2
	kNC9ldybFv43iTtkhrEj8SsiMeaxhvy7xcFbfc+zVvr9bW5uyaqrYD2ZNN4amMoW
	ctcqUCs5YpBmPkbBSK2RDs3yp9CXG+Mvw7XLLX0JuYqrCUufqE+7by/Vlo5ULAeG
	2O7bb0s/5v+NGmLlVFWtF2/udhoNaXyQiG3TS1J988D9wSWm1+qtlEteelDti9Mv
	2a5A/Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9k3vs0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:01:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bea07880dso8320011cf.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782828099; x=1783432899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SZfQLMMjSJHdOdQ3Jm1HrpHymvX/x4ed75IUzx+Y/Zk=;
        b=kt/5/eXi/u4LIwBTPlKbpA+sSoEuN1wod/0rFbp0/7S/hYzIkG4IecaOEijnADWcRz
         QdewxjbwscH+sASzw5OSVSeCWgYlxjhRNn4vPyq4ae7Hw0Kr6aSBGq+X2ErNU1sTb8qX
         7ea+o5XZVbe++W+3uRX4aVBksKfu26qiBvdis0m49lFrMPP3Z6QG+Ta0U+8gs5e3Imfv
         cUFowlVMlZaAS9ewqeff4IqsZG5DBLThCqW1WoASivWzs6sit7iYlTBWKb5xHSzJYeH4
         XYfx+Vs8mU5QfAT8OwoSwo2SalZcV+yHT9lCQaRua2pDItEwH+b68VUuC0sfeEots2T+
         nEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782828099; x=1783432899;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SZfQLMMjSJHdOdQ3Jm1HrpHymvX/x4ed75IUzx+Y/Zk=;
        b=A+Hi5Jhh/GrKmnqi4RhUxeQcK1rjgV7GP+GgqXtGSPfzKw0a22lxJicihiloyBd1ri
         zemUyxWfPOQ+6URYq+X5dpPd4c/IiYnRiqBkcMLIC7VHYgvK0xMqMJ/jeWSw326d6JM4
         k6MeMwES7c8AvCdBmnwwjcrLkIGqHC4/II4AVR4vDTPPImuzpjjsfzcBc2okBdTWmCf/
         +mRuDHSGyrLseFfwMBFCkj9U6Dl9+s3zKPm8SLpK1nbhJBhkBYIctYLJwN3Dfq+5xTb9
         GpLj7Aer1axpzU3F+7P31OyGXj7mUMQCMpCzcIwvGbZLRVmpwFkJm9VAT174fCyPJkIr
         ZJnA==
X-Forwarded-Encrypted: i=1; AFNElJ+456oW5AoRdj22h6o6W+dHxoWjaF14fxFZx49j6fFgbGwsv6qb56yH1JJy5rl1GN1Z/T7bylZsYLH4@vger.kernel.org
X-Gm-Message-State: AOJu0YxIywVLBxLuPch2JC2xtvWX2fEYqCTgHIkk7ZulNsXmjbngCvyJ
	Elcz61WlauofrwM+sHUP4UFOPTyZMh6paGVhOCneXrJZDKGC7zLNtpNwYQP8Od+ppinWHL7EECa
	dkrNTWjrwULjOcl7OXb4EOPU+vp7IaaxqEp9usVZ7fMNvJnUGkEvwbuAP/k+j5CeI
X-Gm-Gg: AfdE7cmT59234oz4SrR49FbtpFZkewnbUQ6Evw4p//Godt3DkZy7AIxD9aRKt5nkTAX
	JGQP69Dwg4I8jcmTSGYmnFtVo6MR9mvtO1cmq9vSqnSAo/5j9wUeRu3Dx7Q4FH4auZPzgcKUSWb
	nkDC9ij3XS679sVSR/QfBqRKU8ClRpoixjMLQAP/+3Ebc/jIM4h65ZVDFndz6NXJfUeOCkb4xOo
	6GB83yoYhsWUKJkwi1QQZ96UuOpmepSIIsQLT2p/P/w57xgXykIoS/b9JIHm++fZ38jTEp617XQ
	kyKjrTAv0erSMQ8c//LJsnrze7Lu8k6skjxcpacZwMwomxsW5vtwa70hYelbiG0uHe7eurMO6YG
	9splHOwzrvPBSjVN2zp4IG3wQl34z6RkrL+M=
X-Received: by 2002:ac8:7dc4:0:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-51c1078dae4mr31650281cf.4.1782828072833;
        Tue, 30 Jun 2026 07:01:12 -0700 (PDT)
X-Received: by 2002:ac8:7dc4:0:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-51c1078dae4mr31616421cf.4.1782828044057;
        Tue, 30 Jun 2026 07:00:44 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aebe4b1046sm607897e87.81.2026.06.30.07.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 07:00:42 -0700 (PDT)
Message-ID: <37dd1dfd-a3b9-4dfd-86d6-20ec2c80630a@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 16:00:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/10] arm64: dts: qcom: shikra: Enable Bluetooth and
 WiFi on EVK boards
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
References: <20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com>
 <20260608-shikra-dt-m1-v4-10-2114300594a6@oss.qualcomm.com>
 <64691236-178a-4fc2-a9c0-f053b7944e66@oss.qualcomm.com>
 <e11f57f2-bf15-4c06-ab3a-ab2843818a41@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e11f57f2-bf15-4c06-ab3a-ab2843818a41@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzMSBTYWx0ZWRfXxDcMbBvmCVc1
 uMANaujw0FmtK1gAqRyUAu/Vin7Zl0TwytTyHQqiCfdXc8adPrz7tqv2BhzUnCbsmkYV5f+H+tM
 Abq9JYVJV3LbjA6Bh2vPVhJGDO00G9c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzMSBTYWx0ZWRfXx5hIRW8UTuX+
 bGlYn9RjH6tioOA6YtgBuQlJTNg9kWx/XDm14QpdwoM2jLW4zK/rWlu73+8ZTMQyxw2FGjfGMLS
 2bc5IspIi8RagS52B+0Cz6T6V2Oj4lqnKk/rAuQXn44p34EdWMi2p4oRtGXoVIgcdIseNOJrQ/L
 eCw5BVHzyuf/U4Tr3kH6nE0+QKY4LrnCPoTMNLBJng9f4hrEQU9hsogki8Y+evX00p1wgbi5r8e
 g8aKeXdSINyiouRpSwfjgkzCxpqG5eOTeCSSKe1e5gdCjfMjeJpafFGK6oAxtkg4qEsYrcsHYLZ
 zH18NvaQ2UhUKgescNp03nQDWobGBgnlyE7IAlPg/TF9re39BlzjKuXGb0QyUEJ1d8uPpGGIFGh
 Hls7ygkNos+LxMmNXTzSkDCXakZKsQ5FCcsA8sR0FLvNpVcWRWRfkNfI/oaJioIGZy5VmnXjDIC
 BgHh5GtixttIP0QmZjw==
X-Proofpoint-ORIG-GUID: F3bX3az7yt60BxfT7_xC868lrm0keIhW
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a43cc43 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=hCizUYdsW4M4JRnaFA0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: F3bX3az7yt60BxfT7_xC868lrm0keIhW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300131

On 6/30/26 3:34 PM, Komal Bajaj wrote:
> On 6/29/2026 8:04 PM, Konrad Dybcio wrote:
>> On 6/8/26 3:10 PM, Komal Bajaj wrote:
>>> Enable Bluetooth and WiFi connectivity on Shikra CQM, CQS and IQS
>>> EVK boards using the WCN3988 combo chip.
>>>
>>> For Bluetooth, enable uart8 and add WCN3988 Bluetooth node with
>>> board-specific regulator supplies across CQM, CQS and IQS Shikra
>>> EVK boards.
>>>
>>> For WiFi, introduce the wcn3990-wifi hardware node in shikra.dtsi
>>> with register space, interrupts, IOMMU configuration and reserved
>>> memory. The node is kept disabled by default and enabled per-board
>>> with the appropriate PMIC supply connections and calibration variant
>>> selection.
>>>
>>> Co-developed-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
>>> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
>>> Co-developed-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>>> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>>> --->  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 59 +++++++++++++++++++++++++
>>>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 59 +++++++++++++++++++++++++
>>>   arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 15 +++++++
>>>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 67 +++++++++++++++++++++++++++++
>>>   arch/arm64/boot/dts/qcom/shikra.dtsi        | 23 ++++++++++
>> Split the SoC and board changes
> 
> Sure, i will the changes.
> 
>>
>> Should most of the board-level changes go to evk.dtsi, since
>> they're almost identical across all boards? You can e.g. simply
>> override the supplies in the IQS EVK DTS
> 
> For wcn3988-pmu node, I can move it to shikra-evk.dtsi and add the supplies in the board DTS files. However, this approach will be subjective to per node, as other nodes (such as sound) have board-specific changes beyond just supplies.

I meant the board-level changes within the scope of this patch
specifically, yeah.

Konrad
