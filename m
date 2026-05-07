Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BB13F54C4
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 13:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159007; cv=none; b=JJu8IhMhf0p8/SO+aMT3m0BXiWuk3tnx0VL1PbgqJdYoLrLsgLiwoxXIC3bgOa9swVxhv1Unxk1SkE/6y6enMBAiUfQBEEP29qSq65z0UOlX5WqD6edhEAPu3DdjtiuS8NJcdqrqF+YUabruBizj3VsKThpnENDvGIiwt3y/W/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159007; c=relaxed/simple;
	bh=vJiIH2pewqKneHp31TdZCQ+a0QMzbohY+H1SKY4b1dM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eFylfzgYjcvgXl0nJgpI51DIjAPPvzDqMWQy3B4r7UggdRHvoV34eWMSCjZGCjhotNXnEXWzxt74j9MfURj7zkbAsGebHdbtv0TSrh0RX16Uuo/2rFNsiO1sPs3IZVG4r0G02ypZkQohKwUBMRz2AAlLCBASM5JyepERRXKWJfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QUaWZ3pR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ddHQSnUY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QUaWZ3pR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ddHQSnUY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647BxUxk2734045
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 13:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aF+Unu9Vo3GgQV6EEPlfZ35/SdyjsFQJgg1NBm1vk3Y=; b=QUaWZ3pR8E53eyfV
	pcyfe6Zy7wOmBCA7TQFvnVTgQI1UM2TmpzW2FLlYAHlta6FCoz6zPYcDg01thtLD
	Zc3xTXUY9JACO79ERnp6ETDT0vMA3TEUmPIubUq6Lpfa1OrfCOTG5zNx8E7Brl4U
	jREd6TsABSwTHHYxWkRr4sYXiis6lHmLMA1jABR1aFsIuY2o1ateoGea5YwUWZj7
	u/H4PxyZGIhu+vDYTtkE1h65F5Yt2t+lP4lXAuEsUCIk8D9n1QvpyS2alp5s0fMR
	VgSVUIF25eS6ljUreTVQp52G9KY+nE9wp6zh+lVRXNV0OYnolRBgOewFiLcPloZV
	lX/HKA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0tbqr6ym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 13:03:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-365faf6006dso948440a91.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 06:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159005; x=1778763805; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aF+Unu9Vo3GgQV6EEPlfZ35/SdyjsFQJgg1NBm1vk3Y=;
        b=ddHQSnUYAxZ83dQrjD+18swp1zfrTAxk01Hf+zvCgT7AELg9mhBGEfSGPall9np1tk
         HigLfZJYF3QydsU+TC0QzuquHpQWSmfQO/fIegrNouFnlUdzA/uz6SW1QNZqqg/mPRRW
         JICQwdlpkcyv4a7lmGs5+MHH8FICgqtPf3AZrYDIKGfnAVER+XEqTvuuPqjZGuBV6xWJ
         T17CMe7PKW7x7XXu+Dmrh3q5xDMXyQKegEMlcCWYK2EG9xGuBo53FKqtPvQaXBdtmFs6
         siHrO8VO46cu9JnQrhV1MeOAdZwJzLWZq6kG7JXYRq0FbBSpUINJbk1vI1Uw/g8qlBiN
         iyBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159005; x=1778763805;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aF+Unu9Vo3GgQV6EEPlfZ35/SdyjsFQJgg1NBm1vk3Y=;
        b=ddoTMmiuxLgidnQAhRqeOK4dWBkzh1J1rVZeEFkODFDCfdLv0gasDLwOG2h240mV7H
         o5l+5LgGPVZCHMFMWLYNpRdv/td+xScXctn57PitpZIpcvmUsCLZRYxjMm1IzMmySYwM
         nlMJ5FyN0xpxo9o15kh3+doiFiTxQ7mBEZ+OAmitrbZmkzN6aqdnSAyZVm9ODalCH1qv
         8W2e4PaKsPTDLz+o+D1u3BIf1ngqCm55WtJKVH6WdwMUdpHsxTE1j520zqmKg9kP1tg/
         z1BfAbRFZ7XQsdpISWnemO7X2E4eU/K9wdkBpJnkyuMUA2gS8bXRRQtN2XcBU9XFMzOI
         vSHA==
X-Forwarded-Encrypted: i=1; AFNElJ/qaZigzYktflloPWMU6qV0MyK8B2pczSn8iQyQZraQNcXM8RvFfv87zy7fjFd7UiP4aH5Yl3CPiM8a@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5bmwM0usQ3gjdGLX0gCXnmC+B3sg+nByDoajPYLx9rH2FECKf
	HeC8zjLyx1r/FFC+Ar970tDF9YdItiw8uUxQI4QXurRDimFX85htdKaEX3kqkKM0zPmxVAEhfCT
	oP3+nokhg6k9HWGOGYkTdFye0AQK4DEpeq1Kg4Q+pGTcuMoryj9q7u/m3Cu/SpT0M
X-Gm-Gg: AeBDieuAM7IJJnDESF4b5kSNlmQ84PNwVq/poeLYmo1G3QUMoi/OGbR9VgTIXb/Teex
	DRqoWq4AmjdOFiCHsp2Yrl6fH+M8rCH3QiRMo77xU6IzardkmCF+4zV1xHHkFvsqvOmpKlIOTgP
	BzHvp4aWY17F+eBYXfL6Wq7y5j6yWAJPSzBK1Ke0MYyWXAkU/ZuaSIx/ky7hsDpYNOs4o2FEN++
	ZwSCNTxcthnOwBtXTSBJCqaChPQGZ31yU7dZwzVXCMWQAGbfOGRxp7x7h1WIZypTupAT3EbwgWA
	Qbpf1jWRfXiy22DS7iACOVhW5ueemeLTcsnftD16ES/z/pMRe9YVLbvCHXhii32FyNgUoF0R7Dp
	xanv7aTIFpGOfclbBctlM4Ye/2qjrM3oAHRiPiA00mzw9EAPrxn81sGr+REIi62JH/CE=
X-Received: by 2002:a17:90b:5683:b0:359:87a8:e65c with SMTP id 98e67ed59e1d1-365ac080573mr8033190a91.17.1778159003690;
        Thu, 07 May 2026 06:03:23 -0700 (PDT)
X-Received: by 2002:a17:90b:5683:b0:359:87a8:e65c with SMTP id 98e67ed59e1d1-365ac080573mr8032897a91.17.1778159001761;
        Thu, 07 May 2026 06:03:21 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.248.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b4bc7558sm6142429a91.2.2026.05.07.06.03.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 06:03:21 -0700 (PDT)
Message-ID: <f84cbfdd-4f48-4554-91f5-72c90384316b@oss.qualcomm.com>
Date: Thu, 7 May 2026 18:33:14 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/16] media: iris: Skip UBWC configuration when not
 supported
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-1-d22cccedc3e2@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-1-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CP1TJIy4cDlW-xi8r51Iw734kAl4CvAq
X-Authority-Analysis: v=2.4 cv=SJVykuvH c=1 sm=1 tr=0 ts=69fc8d9d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=EkRsrf7Hk27R9rd+nIzaeA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=dl9dPoTF8b8Ju4ANzBEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: CP1TJIy4cDlW-xi8r51Iw734kAl4CvAq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMCBTYWx0ZWRfX1Z6Qv61Y/oNp
 ExBSs3hqrlV+uLflH1+lqNcqXBhmZMIK7HTiS8w3nXodWqzMcV6UKALAHujqzqpt75Qqutgztnq
 SMaflfWEqYjCPn2jcmTZ/iJb6KF+TsFvRW81P3v0mYvAca9qxMQIfaEqu/BzAjA7kzD5coWg8Aj
 52LRXVmIu0OYcioQbSRa2PvawTkcvTQlXpnIRIqGoMYy8XKeLVQjVaaUHLJbZ91CHzt2m0Psajj
 Bu62c+kwIGtTBD23tLe0Gn6LYkaWoG1Py/8iwFl5o/XJLIrKWHW2d0xW/IYErjsoTlkfehcI+WT
 Ks1yEbn1PWJhGCQhTUGK59f+H1m61x/rua9ogfyGb0OTlEKGuFtdwLrOAvLjxTDkHcszha8XdgU
 dH5cThT6S1CKxcsFKIsdJn2wCpPSP8gYyZNFTUxQVAcwEF3by8/a+DcvpJLBL7cAYleb3b/T0Q4
 Gdrj0JV4Kbt4L5BFgoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070130


On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> 
> UBWC configuration is not applicable to all SoCs. Add a check to avoid
> configuring UBWC during sys init on unsupported platforms.
> 
> Reviewed-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
