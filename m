Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D1D383987
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 12:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779713711; cv=none; b=rjlYlMbm9IOHrBc3Y6ZKbPK8Tdj6Zu78mHYqNn8Cvc2hwJBotK2ZLPxxBbqadHregoPQbKJd7Ey3EZVm4Jnd9dt15kL5XxIzH4NpipRr3MAFZgJ5N04rOJGbHTnrQPz//d7M/4qnKKmwWnWqf/crTjf9mlzhhzZGukTVIqOh6mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779713711; c=relaxed/simple;
	bh=jrPHDUm/+lT1kV/7BLXHI5qniXBpJQbPWvYor1QGy8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o8CVxDMgX/wWbysE3lzwx1k+zx8CNCpgfasoRzqRYea6iEAsSViv0kKotF3oI4kPCFrMVwqN2tkK7Yzu4nk4SFYy7naZT4cmGOIFxjG+8qkf8eAbuz/vYI0MT4sN7M7ixvnrT034aW6fUa/FidnumqETMSlOIfibkD64gPKqrJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c4WijiTT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kvXxRQpr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c4WijiTT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kvXxRQpr"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P9EKTf079199
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 12:55:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V8RZuW+ZV8JwXDg+pkBPy+nHPlIxyE92twuTWRnC91s=; b=c4WijiTTAlmEp0+w
	/W9j6w2M5I4CbSLHhOQhb+GKTEYs6b/OyTaOphOP74L6RDMMf3sEf4JnH6f1Lb4D
	Gbad1SpCEyDbZNfP/3IEQKmwxEziephhfeC6gGKPOxzb3Ix4mIXvPXJV662XC/1p
	gnf9FCQfPD8KVVAauCuWkLJKmnR4m3jA11oKs9BYn2Xca7R+8vo+f77CfwNKuq+l
	BvHCltqO7wwY/JKd3jpNZgfBKOhYoyuxZ/oc9AGEyXVDa4/Ds3/meBl29qAIaeS9
	ohsd4NVxhiPI3Vdeu+MvPhm8l6uqv50zNVH7lXYN5l6Wj3aLA1xl62uM32hC74Pv
	onstzw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckma8pag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 12:55:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-914ae48993dso67518885a.3
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 05:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779713708; x=1780318508; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V8RZuW+ZV8JwXDg+pkBPy+nHPlIxyE92twuTWRnC91s=;
        b=kvXxRQprFh21m87JzIZHdzrslb1EVeRg+FDQLLY1UZs14BhoBo6JfmtcijT0HoifMu
         woJmWQk47P2iWqace2TfImQ9kopGb4FUyo+FQJTUEGZxnt5EfciCKvd3YyK8JYj/zu0C
         kbUKbaOgRMqZraNvm9t6rlIlNjCFixfNKwaA/bNqZbQ1vlZmC2kZoAueTE3+D8EVMCEt
         PGXmR9yukg1jzeMerTaHL5TPj6mdjRaB2KWZv8b+sgyU8MiAiRzXXoev+l1uxzLJsKtW
         EDECNp5Cd8Jg5ADfBT7JZv4J2OxW+JOOuKIBer64+4lmuq54pLBqSWLu3f8DvRAK6ADS
         wNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779713708; x=1780318508;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8RZuW+ZV8JwXDg+pkBPy+nHPlIxyE92twuTWRnC91s=;
        b=tUE3ZVdTc8gcaiUG3G+heJEr1Pjm8sMCqHoL6Hr40cIALvAOsYej7s7pTKITPkK9r1
         X2VtbO+6kSDlZn11qhL2LxBcFKhfjXVve/8kRKGQBroSZW9keyJG66DGX6Yozwqabn6L
         5T/RyufWQyYufCJ1CwtzkjP0/bw3xhmROFdFbxPyLUb6ogl7vECyL0Etmx46O5Hu5kGV
         ePyFAm7y07kkddoh9qM/gLcyKYxi1xKTxV0Dw7AIkboQwoU0Bmb8JLcYPmeHOfABz77Y
         JNAzny0aQad4/hZf5Ta5jljsYGHbNovgDzv+p4McDa6LbLQ68txAJsk88U3TIgjR0FrC
         ORdg==
X-Forwarded-Encrypted: i=1; AFNElJ8ZEoWnTkBsf/IttnnnyBKOvjqKHyV6kd1GyKw4wKZovWBuESpbYS6T7eRSyh2Xup7LMcJd5mQgIAVE@vger.kernel.org
X-Gm-Message-State: AOJu0YzrJtjsBt+2rL5sg2jPDIs/E27tK8sM3pTLzKn7lNd86DN7CCFm
	8ZK3n16ouRNMm5eNji3TEjRjXTMgKqyxKxem5MOJLG2NUbiv38O3PvVz/9hJUTIiE2IwI+0qSqW
	SGDQiRx8yjrtt1Fq5kTZD3U1a4mvspT9BdE03C0Y38JoaPa+IsUxme3Y2vhuN5GZI
X-Gm-Gg: Acq92OG3aB5ChqFzfAFB0TrPH31i4kSVpPibLmJcZa7FRLf/LZCJbuDyBbrDeRX20s/
	33Trp9Grx1B3uCmiDCelZRzPG5yRe1nIk3hzG9Iw7D/aKiSYydQLJnK8or7KvVtBEivii9+vX70
	opLbItVY41mMffWAvPhcqnuvxUaP6x7J6VjMlbdYtO5Cux4WDnwLgJQs3qAhUAExr9sSoG+UuyV
	v5gAfcsNr6aEUzpVnlVTAMGhY3RbirOv8TbybTc9GrK7pVi+ykA/Mpz/phPPrl6k5xsEfxnRNP7
	slrjBve5kmemVeoAxO6+kUaL5XFS3MUne59mG9ZejTHVfpUXj1EGYZCLh9gd1UIR7b2gqDlGDJd
	I5U8DuCTQG8llzudZ7ov/M4KjdT6o9V2Oc+33tiKTXW0koQ==
X-Received: by 2002:a05:620a:6230:b0:914:c589:7945 with SMTP id af79cd13be357-914c58983dcmr702816785a.2.1779713708487;
        Mon, 25 May 2026 05:55:08 -0700 (PDT)
X-Received: by 2002:a05:620a:6230:b0:914:c589:7945 with SMTP id af79cd13be357-914c58983dcmr702812185a.2.1779713708003;
        Mon, 25 May 2026 05:55:08 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc264feb2sm397057366b.10.2026.05.25.05.55.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 05:55:07 -0700 (PDT)
Message-ID: <78ce80bb-e8f6-427c-9620-53ae1edcb3e8@oss.qualcomm.com>
Date: Mon, 25 May 2026 14:55:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/16] arm64: dts: qcom: shikra: Add cpufreq scaling node
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
        linux-pm@vger.kernel.org, Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
 <20260525-shikra-dt-m1-v1-4-f51a9838dbaa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260525-shikra-dt-m1-v1-4-f51a9838dbaa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a1446ad cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=gR7PYC-x2pxtVi67x8UA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: N4dzqGl3sPqvjJkGL9gm5LrwHnjUBTj1
X-Proofpoint-GUID: N4dzqGl3sPqvjJkGL9gm5LrwHnjUBTj1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzMiBTYWx0ZWRfX5DWsZ8j9PeRb
 WcxlaXTa73czT5cT+cwruqkuMZgkBn7pHM90tkovWUa7dFc2ySawuDfVCwaC2DPeMTeeMSkjAUR
 oytXZ0hWmLxyiHtXQifuQg3l8/RflpbUsVRJmp16P5RKFYRFc9cDomcIHgXpQO6PprBfNyb92pr
 MRDpo5aG2K3CfaeowT5s4mAEVyxdzeU0vHRYzniRYVhEkYzA3xtwTgMz4tXtpK11DWd+xKHYei+
 aqW7PzeVX6kcvVUZwW0v4KpZoki136SO9zWZ3wJfXsPbUQv/GHUZdRTWnkNeO1fUW8gCdVco7Lu
 un3wHkq3S1EAPKCYkuSZhfQO8ctiqx30qCsmhc0iVS7hfd8QfTtLO7eJYC76vrL/J0L+THFCcBn
 CmmiIFmcAVQe2XcHrMsesBXDjqYqnuvlAzJvofxqD745gLSbHl3HEzB1Qo8sP/KtwFplUpZkKGt
 esyaitcXCDVl1NjNNiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250132

On 5/24/26 9:49 PM, Komal Bajaj wrote:
> From: Imran Shaik <imran.shaik@oss.qualcomm.com>
> 
> Add cpufreq-hw node to support cpufreq scaling on Qualcomm Shikra SoCs.
> 
> Co-developed-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
