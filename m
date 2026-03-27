Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5413E95AE
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 11:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774609774; cv=none; b=VH6dIzCrLQbIYrihPlZrBDsMNJK36tzlo4S5GxfFAgNX7X14o+lSnbgC6uhWfPD0PhwqaIb6nAnhHvhgpVWRw9Qz+iin8C+kzFvvGSusXTSUEWJnaUYtSp5FT9iTnR1YvCiFQsHkJaafRnctti4UMQb9z1kLHeV47MR+TkhoVeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774609774; c=relaxed/simple;
	bh=nqDbSWB9uFpQcEl5dGVhJiozUd8PVgjNGSp7ucbBGys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gF4f2HNXJ7J1kHJDVhKagw1Q3e/qkTFVUwyD689c5Q6Mz4kbyDJUskdSccnme+dk7jTEbDhSPAEAVfXiRYncm9Ed2QFnQg+m4B93XqkDHCMEu+SGh9+/Z3ZE/WxD6y5viYgpzvnbaIEMIP/jctfWIuosm9HHBo9/3sTJx6IRRwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fLIOKGy6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dN/PW56b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fLIOKGy6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dN/PW56b"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vfZY2379004
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 11:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mxItrxDuYz59hTm47Ed3KaBPbLn1WnwD1kHgQZB7uYY=; b=fLIOKGy6ymkQfNBW
	/Uo87F0UZpNHPRcrOeaqS5zvk2qjKebOSyqRYhxGEJQB9SexhSot6HJV2zMdmZnK
	RahxThQ1oi5W2sLjDxqCS+wG2FJ70XkpSGFXlFM3vMtjmv6QbHR5rfVjxMcT7T5F
	0JB0r1zQhEZ0KKlaSQoKU5ck9JVIH4o2bcNK5/tPU0WCVkTF03UX5mT7BMthZT2C
	fTkaaq0b+pVwbzgGrlpZYyAD4siYi1MHHPbl9/q/+llAKccCIPY5Ih7Cc88aVDaD
	OjdMMNb8ePyEw5RvMbJRUAleXwqZegP3SQXVbYYNW3piwYE9P7Z/WUOKIq2UojvL
	NqM9Nw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5jcx1jwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 11:09:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4bd8e77dso5447841cf.3
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 04:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774609764; x=1775214564; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mxItrxDuYz59hTm47Ed3KaBPbLn1WnwD1kHgQZB7uYY=;
        b=dN/PW56bGhlXbxTpmc9h3UnWk4TPA1+hAHyaaTJfMYJD15kbeTAtgEMMuv3cDYM6dG
         0GJ3kWUosw1fwg/QI/YHlq4yZUgGcQOeN4wL/zWjF1R21hiUFhbXXW3yYnXEkvEVvOFT
         xDqStmsXeYR0ST/SRkqJpesgezzJ43LNeOGq10SSevjt0L6ebdIazP1fMk5/DTdeURwM
         aZgCFj/6rYEsEA1DOCwai7kaKON4JoNjyN+m1KJkW6pwRb1S8lHeUnY1ccnOAQqLyX32
         EQuAxquqy7BFh3TmpM7hTmJ0ZsM4cZ9Xn/bZX810mBX4GQZVQpr87ss+RY68YGc6ytSm
         dJPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774609764; x=1775214564;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mxItrxDuYz59hTm47Ed3KaBPbLn1WnwD1kHgQZB7uYY=;
        b=R80VHm3xxizqDxyL8I9PDoKgwYRT39lg4UZ5I9eKS1cYvKTs49k/zLC5VaIH4ciyeL
         m+mogBLgbN0SjqzpYaXx4ndU8lkERxCRfqzrAohsufs+sn/hH6Bi8zVIp//noxGI2NuF
         k7jaNpEK16SgoMFrlmeYpT7DACuNZArAxcOz/Ylp18m1N9+C7IxzZQZX5kGV3uiC9ziW
         Xbc9aXZnJ+fKb64VpaXQO40GGPo48IZexKKky3BrNnEJOHIs6pC34/NoBJ1VD+Xaz7YA
         lgc9ISjaN3hryXLGHEAIlUqYn2ZkGQs150ukMt6oUu+JtZyojvmfcFKPFrDm29y6CSAF
         7WTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeGXIh5MoKKjPFcu1ExoAJjCu74/4zEl5x/46ht/W/ZnlmaWRc52DBi2eiKZHKUrWdrkSpbHGYzfva@vger.kernel.org
X-Gm-Message-State: AOJu0YyVKb8c9L8eTg92bdpwPn6W52InKjU138zZuRWbLtGdTfZOBoi/
	y+ZjRBBzMGZ1FmQA2MCtfeLU++otkINx5uaI+7DZFTXIQM53ty2v72C8IfSV8O37RswC8bse1r+
	XxqeO9gtbk6WpMjzJUcVt0EfPRZbs/XEy676TfEYGV9RQ+kuGn4ZzFYQowLFATeBs
X-Gm-Gg: ATEYQzyeghdqLBAPiEvx1ZByF18dgYq+FYF5zHd2n9r/2wylJVk3SL0RwzeFLaZZCf5
	cuwkEVnsHZrFiOKghHZwK/LkD1FgVwfPox1tTfV4QUcJOEKF/aiwoqBgcCTOB7IM6tA8H2eOOQd
	XUzH9RYj/6DreuYMU7a/tVExogHuuLJsYO90MYpo/Hp8oqkdYHQlWZaAkiVfTw/XcCeVlGhLvYL
	iWeqHNLhMUoWpyvmXuTJ1OlS+G2jLAGZVjZvueWHqEeHY8tV5k/dUYQyqes4b+azW1myrZOLCOk
	WVOemXqge9N3QX1b6hoVpxzQb2Iw1LPlkuXYGb/bvbnJ3JfKUuEoqZLYVBYFmpYTBLinC9UFJ+Q
	FQz2bLU5bgH1y+E94ng+66Eu537XDPOaltKjsfh2WMygn6uJHmT7Awj/B+FdFGj4B4K2JEBfx+z
	GvAWo=
X-Received: by 2002:ac8:58cc:0:b0:509:3601:cbf1 with SMTP id d75a77b69052e-50ba39a9dc0mr22325801cf.7.1774609764411;
        Fri, 27 Mar 2026 04:09:24 -0700 (PDT)
X-Received: by 2002:ac8:58cc:0:b0:509:3601:cbf1 with SMTP id d75a77b69052e-50ba39a9dc0mr22325391cf.7.1774609763948;
        Fri, 27 Mar 2026 04:09:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b2044274dsm230081066b.59.2026.03.27.04.09.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 04:09:23 -0700 (PDT)
Message-ID: <08e43485-7570-497f-9f2f-1ce4fc7ed6fa@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 12:09:21 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: hamoa-iot-som: Add firmware-name to
 QUPv3 nodes
To: Xueyao An <xueyao.an@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260327085318.2771771-1-xueyao.an@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327085318.2771771-1-xueyao.an@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NfTrFmD4 c=1 sm=1 tr=0 ts=69c66565 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=B4HikTB3W-0rk1GVoTwA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 93DKmZ4qYAPr7LLx-t1aQJ8uBPTV9LwA
X-Proofpoint-ORIG-GUID: 93DKmZ4qYAPr7LLx-t1aQJ8uBPTV9LwA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3OCBTYWx0ZWRfX2fcNsQ1WBgiP
 IWeS2+dXsTw1eDaazZ0e0Qz/AayNFMlQYvQH1eftMeJzsg8RiIH4z9focGAKpz+NwpFiPulaCen
 UMRonvr8ftwlcSSj5E7VOEQ/g2KEVsSbO1vxx5ZCv9MmBzezeKrXWl2+RQgWBwPWEDIlgPWXObF
 Q3g0Pog20FrdVVcAv8LRvbTmKCUKMplxNifaTh1gffMAKmuVW7+nyqlqcm94fixZBbDR9GKN+if
 WNzUpeFotQNXNP56fm6IoLsA2QISEgkmgi9o9GFwZHrCZnahKUQoHUEW0X4uO7qFkfI2BrhDhNs
 p/sPGhtZvZQA3H8laf3E+vIklbbmKbnXurtPRh0Xz+RmArInStZj3eud4Vvz4aHNtspUhx2bp7w
 /ed/tfoAUWwvMQTxuEKUVvegdciVfon4FkDiugblOYJEj6o1cnh0Ztf5wOYEY5gO2PuMQfL4iE/
 53cOq976ExjtwkRWvzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270078

On 3/27/26 9:53 AM, Xueyao An wrote:
> Traditionally, firmware loading for Serial Engines (SE) in the QUP hardware
> of Qualcomm SoCs has been managed by TrustZone (TZ). While this approach
> ensures secure SE assignment and access control, it limits flexibility for
> developers who need to enable various protocols on different SEs.
> 
> Add the firmware-name property to QUPv3 nodes in the device tree to enable
> firmware loading from the Linux environment. Handle SE assignments and
> access control permissions directly within Linux, removing the dependency
> on TrustZone.
> 
> Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
