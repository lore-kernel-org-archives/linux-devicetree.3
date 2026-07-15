Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2454282F12
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784122358; cv=none; b=ZNucHk6yMXcD/jLEW810fryqY9tuN9XkUjq+dz1bdAak89kM6wZdl+Mj6FFnRLBtswHbirjBoo443B9vfCqKsjBue1RtdgIiwrw2bBxiGp0zBZkFndBswf32Pv9cICUlRbjMQZf78Ucb9JQtiw3LiqaC0mh4nKcFEfkI8VM0jIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784122358; c=relaxed/simple;
	bh=B5EAiHhIw2D460y9Gnuwzyi+cBebaIxhhASpI7YdnNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q8j/F5m9QKBb/GU2fz1L7VMXe5OL2Zw8jQa2iD7OhEFo+UJ8z1lXoaTPze/mcDrg+gT2XHt+St018Hp4I+FVQpGtr9EOgam50QTbMG7H5wBzjTrle6aXziJPAaRcMgaE4JBTmWr5y7CJTNlLVa0s3D6NvJq18gVcamXYMKmv06I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RDLiRBv+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FZWwiW7M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RDLiRBv+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FZWwiW7M"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcfAo3707596
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SKsgbVf9LkH3xtK0DQxDUDFutBkil+OfdglqS1bQ1us=; b=RDLiRBv+5nqi/APX
	sfigrVjwvJrhvTb8LZVq9bbCrPDRDXDtEnU7mKts+x5LM8y7jf/Hz05MoIYjoHF2
	D6Jc3Y1B+5gaGPzElG6NsX0TiNd36PsukEaTSP0A/b74MvMlrwTS3//GL00RcfKc
	NFMOVSafmVFJdpCwPKUH23+6RlgP5OpTeQbbHMKrBKpVLLaFjqt51EHBkTZEMgzt
	DvHIoHfKblTt6DFyA6Kvnq+jmx1xhMS6ytyTr5dDPbPpHjEnDK+rOvKy9ecROxx6
	fyIX63KWa4wXDHlaytU+LlJy7nshK4iub6M4ubUYZIPOyzoYKiyLyUE7kt8+VO72
	4pYXUw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7nmgw36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:32:35 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bbcdd9a269so282362e0c.2
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784122355; x=1784727155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKsgbVf9LkH3xtK0DQxDUDFutBkil+OfdglqS1bQ1us=;
        b=FZWwiW7Mnf2rMQXVE9/Ler37zoemYf+AJJH6/cdYw0Tcwax03+ipMACUPjCC4zmalf
         Pgh9vdMR03fAyVs9oc9UCAP485pccepu2D8qnrqqp6B9I0JNJW2pAMHRFRvE0333hD0L
         5d3pLlwv+8HRUVcf5G8GrmXNfIwePSHES35BIb2Vz2dV7spccZMQE36hN4Fdb+y35uSf
         UyOXiFX2T2kRCJ8nJCI5jBuKhRF6eY3C6PgdZODSK3pBHy8JZTJfq6P6vWmXbsFZxwsJ
         k8FpObx988iJf84UocBxArX2UWRT83S9WIKOtlgoCK9Hn2NHc9H0GVSSdbs9imPJxHXS
         6FBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784122355; x=1784727155;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SKsgbVf9LkH3xtK0DQxDUDFutBkil+OfdglqS1bQ1us=;
        b=doLUji6ZDyYFJcvnDX/IBTxvwobXVNfuFxAjXUKzWJwG0dfiMOZqEGLZTwJCFbjoJc
         4a6LRv4pa2PdXcflubrkLN9vDz+h6U5qpZMcrKQONqi2VgqBvPINjeInXe4Sv8TYwfAD
         /LZOAKtBl3udX7XNXoecNKIxGkqQ/t6MKGA5t7vFlu9c6DVwgvLSfnXkgbB0X+dF5zLK
         eVx9NFOdn0WNx1g2nnDjrNFIhdTk/V9ISfEAyr/TJ64N5vTJl6EcVu16ciUuVWx/6TBJ
         rR/uF/+/gSas4p2pPpUs1xw9QuDhAlku3kXgyW7u4kQMTdAB97XKRypNIpT17NdYfO8e
         FsNQ==
X-Forwarded-Encrypted: i=1; AHgh+RqvIwHRsEmvWaJMByuxvkl2F98bnP0Psm4NkyylzTiYunmXdkBFz1TOg93+XSTN/WAYmnN5ttD7FvBS@vger.kernel.org
X-Gm-Message-State: AOJu0YxDZDalsLC+y+gLygYBF0nq9Q1HdNSyAFow+4h+B9J8uwFosHGf
	KpllrvoqkAvSHetb7xyKWdO6uVy2UZZvuYxxdydSLExrsxQxZvETcCIFn9kmhX/Kj7ShabdX0zk
	RWXdffMa5O8AwuL8XWcKrzS6A/GYScFFmnnu3ARvMj4zhCiNyRoPlVy3UNeRBfLSy
X-Gm-Gg: AfdE7cksScan96MTCbQtbAzktdnQFpj+Ogc/Bg04EYjT2som3vPfvc6cYkZ5JVIDt9j
	A+MbEPUtwtK9yOYly0x0fuXAvA0R9zo7J+lftkc0LY8PPdKF797Fx0nNp+n3VoopVmcCNe3vfeX
	/HJcjJrmaEn9nJfezsDzEyJj0VdahpXZrCRPARln0Y+lAF5W/XbNOEhajRy/2OVAXpLbyvK5DYy
	tzOqQPsBd9QspVu2qgvebhygqtkrsoaqg7+Oh8QD4BdNiaoFEqmEN2KROANJp8CSnLyh5OI9TdD
	khfh/uKLdmeyeL1+Dw7ti83AcEsfNTdQIpNoNx6JOpAOX8w6cpZbTUJGFhHZn80qF2fnJCpgPjM
	qRepIzUkD8KvQX/7E399/NdhaDzsqzYI6MJA=
X-Received: by 2002:a05:6102:26d5:b0:73a:322d:1bb3 with SMTP id ada2fe7eead31-74533dd8e48mr3933351137.3.1784122355125;
        Wed, 15 Jul 2026 06:32:35 -0700 (PDT)
X-Received: by 2002:a05:6102:26d5:b0:73a:322d:1bb3 with SMTP id ada2fe7eead31-74533dd8e48mr3933339137.3.1784122354623;
        Wed, 15 Jul 2026 06:32:34 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1687318a72sm26803366b.30.2026.07.15.06.32.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 06:32:33 -0700 (PDT)
Message-ID: <40464948-1cba-4384-880b-e23862b3cc4a@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 15:32:30 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] purwa: Drop the Hamoa PDC workaround from purwa
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260715-purwa-pdc-v3-0-be08934dc916@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260715-purwa-pdc-v3-0-be08934dc916@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNCBTYWx0ZWRfX6CHhmnoFja3A
 /32sF14IvHF8sGZw9G5SOZNZ6dU98SMHBTAjrhC05cvzCzhyyFPcQrKYBn9utzrzyw8QikeFBUk
 cjix+WydI8b6cbGUfxbHV0p0UEJjh5Q=
X-Authority-Analysis: v=2.4 cv=cuGrVV4i c=1 sm=1 tr=0 ts=6a578bf3 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=-oYVUopcx5EyTNeoV0YA:9
 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: yMAm9fr-J8xgOpxanXON4ppRiLjLK3Kz
X-Proofpoint-GUID: yMAm9fr-J8xgOpxanXON4ppRiLjLK3Kz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNCBTYWx0ZWRfX34FiP8nCdbKU
 Wr3qK6Xb6Sum9d88kS1jTEBUNo+5PqDoNyyZJHW641XtAto4V9ozQlHzU8760Djzh2fEh5dXLzs
 F9azMiFrfp+EC+BP+LjVHnyxQPQncsEt2o58Y/EaiECzfjLa4/GxeC7WbCJWZ3SVom9HRAjFgkr
 iBJu1ts5wmkvkKOHS2/cW8sUnAtXiMM2nT+oM0BU6OqIkpKL6EZNsLF/WkH2XNvXUtF+ENHpcny
 sNOIDvdOBH7Gg030PBvL8tOR1mXOPvnIvG23PqdJDteaM27QldOO4OAkxkyOxmq71li4l5e/hpC
 oEmTalfZQM7CGgQms62Xt/2Z16lVIZxxbFD/yVdYQ/P0cWIUr16AWIwVVysq8e74/H/1lHcOPR8
 6r+3IU9Cp6gDGnvBCzdviV1O/ZuLOmJE3WhsrRylRywNgEXNmsK85Bu0tzAckbs3f5eBaC7Buoi
 W0BcU8231UvKqfU51vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150134

On 7/15/26 3:21 PM, Maulik Shah wrote:
> Purwa shares the Hamoa PDC compatible. Hamoa had the software workaround
> added due to hardware register bug mentioned in commit [1] which used
> Hamoa/X1E80100 compatible to apply the workaround.
> 
> As the hardware bug mentioned in [1] is fixed on purwa silicon add purwa
> compatible to avoid applying workaround meant for hamoa.
> 
> Patch 1 and 2 are not dependent while Patch 3 of the series was dependent
> on [2] patches which are also already pulled in linux-next.
> 
> [1] https://lore.kernel.org/all/20250218-x1e80100-pdc-hw-wa-v2-1-29be4c98e355@linaro.org/
> [2] https://lore.kernel.org/linux-arm-msm/CAMRc=MeU0QuRozMscv02M59+a66S05Jm18CyvNE-qSYrY=S7hQ@mail.gmail.com/
> 
> ---

[...]

> Maulik Shah (3):
>       dt-bindings: interrupt-controller: qcom,pdc: Document Purwa PDC
>       arm64: dts: qcom: purwa: Drop the Hamoa workaround for PDC
>       irqchip/qcom-pdc: Add puwra compatible for PDC secondary mode

If applied in this order, we'll have a regression

Konrad
