Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E1342A149
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 12:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783340281; cv=none; b=rj6Nljck72veVy3ynDz9TxyzIJsBWsYbtd25sse8khcfcYQgHCGbKtvh7Blt979Lv+fU1fajddRwhLi5WAsiZXEbEjguFBRxkhQj/5dO84TO2TXjlHv75/j+tBDQDdqcmxCJF7QgwF5sQimUxBPYTpbHdBLYLmL5uoOK4Hj/CoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783340281; c=relaxed/simple;
	bh=UeKAksBN5zfSjZAEQF0JGx3C89v56r7Jblo870pp2qU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q87asi4Rqa+04LuuiMPR/NeLO1pbDw5Fqw2io5bihdGyde5qBt5CplmEb7Yyrf04C2qCuCh0NBz/cFI0QlwSjOSzXEE7CWVaN+fZvQIz4M+Nu9brCLqVN3JpFWkeecjzgSBlT4ieI1UvgC/Y9VQ3YqkTE9j7iOgjudlYCUIT92w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pSGTY1DH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9/eEf4k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pSGTY1DH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9/eEf4k"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxGHk387168
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 12:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E9p+Q6R3xGt4KADVRrHfvUBsLdfZPt1kAeyded2iEW8=; b=pSGTY1DH9paxqa4g
	MireXaJaDAQBRHTDUoRhBGqBFV9S66pXXPXdjO/nPLHKS7fSKhhoufzi0L6Bpzw7
	hrviKIewLhTb55VzBJfzVapUG16dCYetqF/K6uqfaRB3LuW2EDIwtglyaSD05DIs
	OMzCpC5Zcoz58xq2eYxl1mpO+cAe/Xkls6qa5WDAuMPdRE8sapyRH94KRfUhzLJG
	nZrIvXS31CTY/YLSEgazaHQdNvwula53Dh32NIoGQ8sAsaYno2pb+uF6vLT8/7sg
	V2F+SwJkymkMzVSnfDKOWgi9dRMwAGcji9/T/RqgIbPhsH9k+a6iaiHJVjRD5aBx
	GyJw0A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r0hea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 12:17:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1e777a15so5636611cf.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 05:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783340275; x=1783945075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E9p+Q6R3xGt4KADVRrHfvUBsLdfZPt1kAeyded2iEW8=;
        b=B9/eEf4kOjdaJ0VYm6ivSrokT4Mtv7PZP0hpAIn2Lg8MEoe0zny+hf5Yd8S8v+Cxe/
         9KmJUY5zOwSSyXj0xUfaLf3O6IShuRqEociTQ4feZzayNxi0vvPA3WMlr8b+8z0dJFo7
         n8t8YEbURX1a/VJiYVv7KCdUfhjm9KSSy/1JqAmgRYqLZTM6JHnn/9k8LPiEYvsWZjTZ
         G+95IsHRs4ABGHogFEPJGfZmjA9ZzYdIY21I1mHitOR+VRxr2T11dzNiQneB+7l/0CkW
         g+HDsPVT8vka77DWHETzRqWycq8rBp6cpVbCMzUTd/4hECbtPxkCbqM4DzluesNp4v4v
         MRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783340275; x=1783945075;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E9p+Q6R3xGt4KADVRrHfvUBsLdfZPt1kAeyded2iEW8=;
        b=p5hc1VfdBzWzZHWc+gSsivitnw5QNMF3V4wi8fUBSd3dkZz8Mj4x1ch9L092AD4+W1
         2D3eXKBEE6Dycj9W7LTNjEiiW5Mla7nh12SgWDGgDOULGjIrXWTOZSWbA4yUB1VwYWxy
         9yekRmSRI9HRdZyH+ln2fjby8ViafxES2AXFi8otyztGOAcoSPkNZe48tz41QdGiwVoE
         H3wTONy1DK9veYnMlSZ0MZiB7tuFDO/ec4o9/b6gHNZB4mPeDnKTVoNZp5A+8x/Cv60n
         QKlmzeVmnRmgE27mEQ3DdQ/Fz4ozrYF1rnbp0EY4HFCgY9LVqU9tJ245XE7ydGINlmSb
         3zjQ==
X-Forwarded-Encrypted: i=1; AHgh+RrWJuKWhqOhNHXKQrREhPFmvBRCYCaaPoyBmHl9xXq1Ay0zlMtKJBbT09Khfv8LtMvYXiRM9cwmE/a9@vger.kernel.org
X-Gm-Message-State: AOJu0YyIxt917/LFIQRvdPhNn+/RQPVhkYuYjx8jo8OBbLU8TOAnnEIK
	TKumnmve6U/wDSRz/3EHPHMUruJ36jyE8ZqHMNpUlhmA0iNZKuVKHmy/d6EfrbS+zQuaxRVqJq0
	am6+bO9iICSb7UIWbIzTgmQX09zI0DiTVsVECoKAT52VlomvYBHJeZXn1qVkk3c5O
X-Gm-Gg: AfdE7ckHuWpG+yXXG6GdN4Gm/7dUu7zv/7YKSqsIMzo/LKVEHBQNwlNFteUnJtEU1pD
	qW7R+HLT0FDz34hA548Q2edvnyrD8DwNdjEOpFnP9b/6qKV5T2/fnA6oWZOsBYk5HSDIJuS380O
	ZiPKCBUY0eTLQQymY2HCFAHL3STTNDTc6sb03g3b7OwDBcLrKUUUSqtgytUWkGlwYibP5ifyfL4
	1YDVC4RRu0MHR33gnAJiC0Xh1NxDvF2VxDMSLAHejhLgmrdospG7q75kUzW//zGqLLXb21UAQ8v
	akLXeWEZbveVOpp2cqO9Ca5Al+TsDXX4M2uWoKZT1WFZ9/UvSKUHEiyxRdxhvbcQHjkmIqF7oH1
	Nw3lnlQryjWdmGzZBbCYjxa8DvqF0qErXvQA=
X-Received: by 2002:a05:622a:282:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-51c4bd95127mr86243171cf.2.1783340275247;
        Mon, 06 Jul 2026 05:17:55 -0700 (PDT)
X-Received: by 2002:a05:622a:282:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-51c4bd95127mr86242651cf.2.1783340274623;
        Mon, 06 Jul 2026 05:17:54 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19dbedf4sm3998959a12.29.2026.07.06.05.17.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 05:17:53 -0700 (PDT)
Message-ID: <19a78410-d11a-4ee2-a628-ea7a93f982b4@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 14:17:50 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: videocc-nord: Add video clock controller
 driver for Nord
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706-nord_videocc_camcc-v1-0-bae3be9e9770@oss.qualcomm.com>
 <20260706-nord_videocc_camcc-v1-3-bae3be9e9770@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-nord_videocc_camcc-v1-3-bae3be9e9770@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyNCBTYWx0ZWRfXz73LB9ZzyhoO
 KieVNqXh3iRvFzSkBZgoeJh/wcXsqcVugXgDXFFzExDg3ZvgC0c0RWg3HnW/l3XINR5j+hNrKgK
 /+LeVC+8yI3DS6BxauPUPN4edKsRHesZfjmZD14njdlbSmUUtp3xCNI/l8C5C6jKfwvOyX5Ajr4
 3giY0WbFrYh8j6sMG98zCQee4FBnhQfJycgBDEeBb4gmqzV11O/6kNRmVefAF7YDd8Ww2PiikQa
 ZT+fkMQYgZs3nCFynwoxiXviYfZWpXOe6P5NyryudVjDxZkFq+wBXgO1KaT8wm5U8JRa05DTzlw
 34/l/QsxlmgQTRIrlLGK+Q58KyyP3hw5gfoyJUIasnhESANmMv+nayLOwiFv84Q9oHjfffJyeQD
 8S/5YoBLPYlgdUkM9PR/ZjKEZR8eTFHSw3lmS8UlXqEtvpRr1BCW0AnMLtHOh46ZhSQSskS/fDZ
 7fGlch/i7Uhp9fqMJBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyNCBTYWx0ZWRfXygaIJLwRVyCu
 6dzUJFqVtPCvlQHYbNk2uCWrCVFSsX+WAtVuypfmkQnQcKN1dM+s+Yl+9bcSbbe+LymZqrYJP4g
 yLlfz74F2V2uSqil3D1oj4Uui3nw6gY=
X-Proofpoint-GUID: kGHRi37GmOkJib9K5Lsc2Cuib5G8xP4m
X-Proofpoint-ORIG-GUID: kGHRi37GmOkJib9K5Lsc2Cuib5G8xP4m
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4b9cf3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=d7ClhsmVZ3m4v3ji_18A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060124

On 7/6/26 10:57 AM, Taniya Das wrote:
> Add support for the video clock controller for video clients to be able
> to request for videocc clocks on Nord platform.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
 
Konrad
