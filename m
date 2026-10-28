Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206950;
	b=gsbVkFzFE05HkVwC1ZQcYqu9js+gul928Xs5L6Xbnx9AHCs5hYB+pPRzMnTslHzNNFde
	 pr1B/ZgnH+9E+HRdUroDbw2lrsQjAJHFIeNmvQe3uYekTukSc3e6lWLyLkCu/yIAcqQnq
	 8YoJUlzwl49fsBMk4AkLdfDbiz92wYue9BY8w0hbz/VkKQrocGOMK+Okq7/UEH0iRPw2v
	 2skkOlKvLJKXKnIdOXAudQ26JIHNiBg8X46S+9qvVdPV4vmhANGj0p+hNHldcwP+dmsOD
	 vbmWcR5PFOIuYhY5BJoc4naeVay1JRnDSEWmJGNr94WMgA+VNbmXho5R9IYULgktLVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206950;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=r59FKrnAgpwtFUEMnG3WnE+uI3opwTysJe+70bauFCI=;
	b=HqklxeqSMqijgPv6rdTHOle1OSi2l8g2yGSzUNESrkiHBJn84YbBp9ssO/w5PrIlGYDq
	 YQBUqQKTT8iicK+lP1jOUKQWRRk4LUd2TKKApVIehcm+2UoTSHjjYeemeOtjQ3AhxZVLm
	 FNiflBf2iQcjDHOX/hRhKkoujZezoUvb0g45CExXTO4IQBlG8/JEwimRH6jqlJHjRxS8d
	 EX2iUpH1i6PECMvqjG0nnPO88prmnixPj76igZupL1BRMMVLGygMLz+BwX0IwaD0bi5WF
	 d89NMu7qdBsI4+pi1L+8jr72aTPgqKCRmOYbBPd70Ge33At3XJjSjw1JkVNaPhdXUyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GgxTOODj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QdGl9bVR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F05606A31D
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 17:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48F05606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GgxTOODj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QdGl9bVR
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFB5Om2070782
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 17:02:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r59FKrnAgpwtFUEMnG3WnE+uI3opwTysJe+70bauFCI=; b=GgxTOODj+CQTvzoa
	+iMMYh4OZDS31jfoUd5g7+3NVuiEthNoiK6u4AIq3TkrJ0QmcZHsdHsrfpot+iD9
	wnUIim2fvXNGWdjH5837AI+T4Yvyx8yKFF15elWutpv4oX94UIMtXq+dyJdDMzyk
	qzxlVdaqk6zBddTv95/QIkfDjnaBDid7qTaYrJC2AVk+83zt87fzYEysY49bxsSp
	XvdBW1YI+WpI/AQNP/eVkl7WvFjuQmgsApTbFaIu+tq7Am6A9+EZYngaWc9SlQ43
	d6Da2sEyI7RpH3kr03b0vXxopqEXSxmgaIv0oK3LXrgXjfTo+jHt55TbRBKTJPkX
	HbTOwg==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7kc5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 17:02:28 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-46788f14fe6so200836fac.3
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 10:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793206947; x=1793811747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r59FKrnAgpwtFUEMnG3WnE+uI3opwTysJe+70bauFCI=;
        b=QdGl9bVR3Z1QKS9Nne1jXnwgZrVVvTe5a0nZjVaGe4pFWd7/2O5ePK6s+MMJ/r5pKw
         EAYwtweGTJRgdXFsiqD5SMNQBFPdwrLfdAbhHrG8vqT08uKHhW/ruMnJM//AOnhQvZOu
         y29heBTeJJjOtXl05RY3n4FV5GzdyDSJx9qkN1mE3UCSq48f2Uv9u0z7cxAcKSfLxrca
         FEdY+wOunD2IKBejkDGOZgB2Z4AcIwwESocHK43hY6zjZxduw0Swg+W4q4zrdDIL0wuF
         JrFMEgRkL5C129tpnbY63ymyiROziIXjNJfSh2HMPUh4wTEqAftRN4FLix19ptRhgtDg
         HwXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206947; x=1793811747;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r59FKrnAgpwtFUEMnG3WnE+uI3opwTysJe+70bauFCI=;
        b=zDCbiXzokd5t14aAXqybIAdhKw8ndVEH4Gc1R8Mgm9y+RVMJ4lX8MatLJ6TYJw6Jme
         xWaDdtxWQ9ovBWlbqyRdGL48uhB7X6ybhYNa8B+VZjxl0ul9mswBIDdtMvK9PG3l289y
         O6/0pXNNCbj4/K6OxrQvz4oBIQn2bVMoX2+XLsCFGWVxmpeQBCCl1G0AOkHOkUkYbNUw
         f2pkvPMXHDFbI6WbiIdbc6ABnuBTUaQ6IUMzqQFHWmKmyPjwtdxN4IH6Zmd4b2gQa3il
         Zl+Cfeb9maySjRDl3o3TncrT+JVR1dI7xP7YzTF5iiQpo7uAojhEn5lQKlcnh/w4+u1B
         hDOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxviDKBb91I1dtbvbnqgJVo2WEi8nv6NNm7bd3zk68PnMf4y8ql/aquHv4MwafxLQlv0s7NQwzzdnCx@vger.kernel.org
X-Gm-Message-State: AFq9FYKIrgNt3Vsn5SAANpR6ppurzlV474RZp5W07nwQPfoQZVT5L0gj
	ftCOhoc4at53qKB/9yPzt9uwPLb50/mdsIEOSt6M6Fi9/AFRCIsGfAhApT6GQmcBGMa6tuqEaks
	SdVbbMECJS18DfAJBY62ehxu0aW52mcXsdz069jeiFePGsO3OCHwfv/UtUT0nGsSJm6PpP6Gx
X-Gm-Gg: AYBFou0rCvjXZc/QktPkrk15W6yZbDY0bAuPfIPBddPeaUo96W4IFBcTuODFxJBeYUA
	WKo6MN7LFzJ2fauq5x4Mr8dvdgy7+RSYwYdwOIpcg6UKKAJIJWzyB1oU2IMU4WATB6uo6B0i4mj
	ry7MZIKqM/ZHltsZJfTktoMYjiohOYnv4O6i4o3DIuNuG/LRFQwe+tjTxFM++S8xlT4jDyKuIyz
	XlnEpLuZVBQaVXKMo6x4ubmwV78Dih2Ve7D4pnXVVGJhXVRw6gYV8v5z9zlaBGnGxW96bP5nkMW
	NR9oIZPr4WPhHUPZcakeBqPwBe+EDxczOp0KVcS9EGciwF93yQ+7bEHxtI1rfbiJ2n2ahjoq5uu
	qdH9MPpubqZt2bfX5QHbOLEuvCWEACpO0mZBnn3AM1S+TRePYqiOxAhcztw2jLpS75+vPFJc=
X-Received: by 2002:a05:6808:bc1:b0:4f8:4a95:991d with SMTP id 5614622812f47-5637fee0c79mr2973080b6e.2.1793206947305;
        Wed, 28 Oct 2026 10:02:27 -0700 (PDT)
X-Received: by 2002:a05:6808:bc1:b0:4f8:4a95:991d with SMTP id 5614622812f47-5637fee0c79mr2973038b6e.2.1793206946735;
        Wed, 28 Oct 2026 10:02:26 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4964203bcsm1733841a12.23.2026.10.28.10.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 10:02:24 -0700 (PDT)
Message-ID: <efe7cb6e-f4cf-462f-bb04-e3aa162b1158@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:02:22 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: talos: Mark USB controllers as DMA
 coherent
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20261021-talos-dma-coherent-usb-v1-1-df0400a2c64d@oss.qualcomm.com>
 <79ade748-b8fa-4d9f-9ac5-7f1635cf8109@oss.qualcomm.com>
 <fdacbf99-6d6b-4eab-a914-ce629b7c738f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fdacbf99-6d6b-4eab-a914-ce629b7c738f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2NyBTYWx0ZWRfX6/6ZJp20j47l
 8muxk38SPm2Kb+siOXwokcnV50S9/rCI/UZAyOm03rLxRvBobHZ6qO7WZ9N+9sBQOZDoKEBGjcr
 2eQi4aLSVg0Xk3M311I1qBBYqjX45nk=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae22aa4 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=d7WKDHGJSlPa2Yu6rV0A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-GUID: cpfmbIrAVvD2c1WedvoYv40brKpinR3P
X-Proofpoint-ORIG-GUID: cpfmbIrAVvD2c1WedvoYv40brKpinR3P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2NyBTYWx0ZWRfXxkWqQ4+bH5wX
 xPjRCuZoCKt7Fn4Qv8VFYfeCFsklVS6I47Zc8nw55gZnS5ZEkMfzIB+Ym7+1Wt54bjAd67TI6K2
 +wh0tvcAbqvTCce0ApIKbBVLLYLH51oJLGTXyrLOERlI8Kj8WKB/C9N9s4suPWSPXaVk1wmy1Zf
 B6KBL5g0ES1GiOBY3F7/8lrgT464xPE6pcxKlu6gDMPlZd5jM8NXX/Y1+fYet3cm19+Yw6VPbZX
 Q8kpQz20rOoXcScY4ew0G6ukBzWha6Qs1mzX07DCTB6W2LQNmyx29ToqT/a5d0y11k8dfLzJab7
 kJao3Ty5ITZVwYaSswW3ZW3PE04gtujMtFbYxWYCfpMFJcQEPIvP196sGYVcM3LVHG4Ze9hMVtu
 rm/M1GyhA5zVO3afvJGOuXMCRvrkdVxb+vYc3rfTs9QWiu3UnPU3V98/UoqkZ1P6rhNydUD+ezq
 7Zt9CuA2g+lG1/Dthfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280067

On 10/28/26 6:01 PM, Krishna Kurapati wrote:
> 
> 
> On 10/22/2026 1:51 PM, Konrad Dybcio wrote:
>> On 10/21/26 7:28 PM, Krishna Kurapati wrote:
>>> Both USB controllers on Talos are DMA coherent. Add property indicating
>>> the same.
>>>
>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>> ---
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> I asked an LLM to find is_rpmh && !dwc3_dma_coherent. It gave me:
>>
>> - kodiak
>> - lemans
>> - monaco
>> - qdu1000
>> - sc7180
>> - sc8180x
>> - sc8280xp
>> - sdm670
>> - sdm845
>> - sdx75
>> - sm6350
>> - sm8150
>> - sm8250
>> - sm8350
>> - sm8450
>> - talos (fixed by this patch)
>> - qcom-sdx55
>> - qcom-sdx65
>>
> I am sure for the following:
> 
> sdx65
> sdx75
> lemans
> sm8450
> qdu1000
> kodiak
> sm8350
> 
> I can send a series for these patches if that is fine.
> But the others I need to confirm.

Please send for the ones you're sure and please follow up for
the rest

Konrad
