Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F513EE1C5
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 11:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778066908; cv=none; b=scK2k2pYnQjDCfVlElV64VW7fwEXcSPh9TCuRV+zoZWjxwRbd1oq6kpkuY3MVdGvxJ23xFUAQnEzSIcifyjsgCC9zd9AVc1y56TyKpGnK4ukas0ENEoD8gQhykNch136turLrd48FziHqaB8qErUfTsZTfVCrUaXXLkYABUkwmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778066908; c=relaxed/simple;
	bh=FZdQB3/FsbYQjVBORTAIL3TzbryCdtpamszl5QYad3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=swY+d9mn8J42xx/+iEVB7Ts/5ZNNN0B6y7nu97lF+1VRieOcp8/X16G3suKDhCiHQISY0yOjYzkBXNblN9786wbmUf74A2kCrxvzPUs+JxnNALvPP7IOARnnCCYUyQnrZ2gVXu4uXAxGQoAvJ9+v1ddOylRIDsiTOudiLSMYx3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kKF+OFjO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kCfzF+7L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kKF+OFjO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kCfzF+7L"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6466xTRQ1515371
	for <devicetree@vger.kernel.org>; Wed, 6 May 2026 11:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XIVvCag5+qHTXfZfw4sjt+95kJffxAurMP3XU4MOgXI=; b=kKF+OFjOj0ly2Gqg
	hOV2AQlQtPG896p5oCmC1Pg0znphnzTUjMdFriP7jVFiD7r5xGKO/u1cpXqREjN2
	S4ZkZdQrKXc/bhEfGZl/jJiUETw4cbymRaOJnlX/yYOVZT012teCdFhhayF6Xbe1
	KKTIcaJqXWhB5/rogJ9HiEIWBr1Ir+JMMvB9JWvi/t+6Yt1+5uDDx6q5l0ZxX/MB
	vH0uK7z+VScbMiQhOiCZswXcfDVqfAlgzvJ7iYJNQ7d2dJ5yPfj21BozJ7iwrk1P
	Ls6K4SZL8+8MPz6Z/pRmgCgV/11gX7BABZWpPaifjrTnTGr0mdSO8RNDCMBfJpDz
	oL9ilw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e00v1s38d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 06 May 2026 11:28:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5104b861649so39309631cf.1
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 04:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778066906; x=1778671706; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XIVvCag5+qHTXfZfw4sjt+95kJffxAurMP3XU4MOgXI=;
        b=kCfzF+7L/AI03BgzGCpBrSJWBgT6DIwWEC51SlVtfyiIgHPgzmBVqnN3hvw8RrBP8x
         PGB4KqEoDdUq0ryJ7N/s9q+1j4qZrresqRAWiwpwtb+miC3NtWbuMaZiX9N/DSF+/0LI
         0iGDHSX5NdbLOoLFs7b16rNb7W0QPjuP7NWYBaSD+DlHKHkfvcVmhYo6v5jqB6ChaDAo
         DWqDy/7sK9/4jLlmOyj1Yid0SjTENqrmdSIqpR4GNRac3KKUlCCnzfOurMZkyZogq9V4
         Wq6YYgEpPDEI9EMsaVvTL5dCGGCjNVlGJ7QcVsbUHVMPAGQPCWfg41WmTAMJ+Iqttn9O
         iDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778066906; x=1778671706;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XIVvCag5+qHTXfZfw4sjt+95kJffxAurMP3XU4MOgXI=;
        b=AGlI7+pwLXrojYGTxRLXj5F0Vnh2CrsoWt05hgopJJwcKcMuI2YJXMiz6io35Rr8xx
         xvadeKFfjSspSo0ippq1FSb4QUYlWzEupUvdbYDYntsyTxo/kNypvffoorot93rEWWXm
         ZBCLgwMApUTGSwDXe4prQioq/FSE2o4QcsbH3LJNdhSMrNHMW8sXSMrOp4lLn+Gf6QpN
         SsREYc0JnEsOr2Rqc1tH0FSCA3svSRXouJVzhQg+4u/1DLxg6f5FV21v4Ka8K+NEOpXF
         KySPxddbdNlSs86WZkz6HdxyMOwxRB8uPKKBmuJX52JfUzDsyvS9fuA7hVLDP1L7an2J
         FT4Q==
X-Forwarded-Encrypted: i=1; AFNElJ/zLpe/NPnAhcUXoRTXJMl15ic05zF0z5lglsoakd/O37fx53MdrEp0MF/Lvzfb9ndREzn+YlJl4zXj@vger.kernel.org
X-Gm-Message-State: AOJu0YwOBebdG65oT6/x1agk4mVB8Oi21z6lX0twd1ucH6ehtBB6A5nV
	fiuY4MEXvBKq1Qo8AXYXGugReu1LStzFgJpA42WfgUXHZSWUJ9/6E+v64qIwGfTXcyr3HzE0dqG
	XoSIhEVVW1h6Uz9z64TtiIKYes6QLRZz57EzQ+Ti9eYhGcUjW9uSAMgrou4XZVORa
X-Gm-Gg: AeBDiesqbFIuZXTXdgh7g6kwdQ3nTsZyJyL4Jt6KI1ueNYQn6v4Rigm554VcZISYLNL
	MbvOsRoSOeK5cB2YOMURB7PTVN8dHFvmV1MhO10cQr8o89/yqAtYjGWfBc0J8NHOvurImCjx89/
	3KSuciwRqde+5rHTX3kHOlvaoJdVBHfxoJ3H6LPfddQ3U2wjCPRcwg5SSAH8m6Sz/DdXpSV5V+U
	eFnz2emBtCHfr+n4ssImtbGbfm4aSPtYykaxrCCqoTALqqXRxioJJzPtZGEYwqpyG2vNfb/ciG1
	eXe39MHRhrE7yCv2dSWjqIZUNfgQUaOLw0jUJr3nmApUiFMrS/PQFtc7//jcESlYZLgXIu1h0U0
	osi4/c0u9vENygKIbUY1lpYidGPUuHxaTNYYgS/2PxRRLrxdtfK7Lm7KSszxOejgaFkBEP6rGW7
	PaZ8ogrXtWc/ZYnewTOeY=
X-Received: by 2002:a05:622a:620a:b0:50f:c26d:f314 with SMTP id d75a77b69052e-514621df688mr43427351cf.57.1778066905705;
        Wed, 06 May 2026 04:28:25 -0700 (PDT)
X-Received: by 2002:a05:622a:620a:b0:50f:c26d:f314 with SMTP id d75a77b69052e-514621df688mr43425951cf.57.1778066903771;
        Wed, 06 May 2026 04:28:23 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:41ef:7b80:b3e8:2c1a? ([2a05:6e02:1041:c10:41ef:7b80:b3e8:2c1a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45052a48c04sm12287193f8f.15.2026.05.06.04.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 04:28:23 -0700 (PDT)
Message-ID: <9ca77795-ebd2-4157-9e74-1fa1001e750b@oss.qualcomm.com>
Date: Wed, 6 May 2026 13:28:22 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Add hstimer support for H616 and T113-S3
To: Michal Piekos <michal.piekos@mmpsystems.pl>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas Gleixner
 <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Maxime Ripard <mripard@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Andre Przywara <andre.przywara@arm.com>,
        Conor Dooley <conor.dooley@microchip.com>
References: <20260428-h616-t113s-hstimer-v3-0-7e02178a93ee@mmpsystems.pl>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260428-h616-t113s-hstimer-v3-0-7e02178a93ee@mmpsystems.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8aF4cZcIh6QquBsiLkK5edYAN6ZdDxr2
X-Proofpoint-GUID: 8aF4cZcIh6QquBsiLkK5edYAN6ZdDxr2
X-Authority-Analysis: v=2.4 cv=cKXQdFeN c=1 sm=1 tr=0 ts=69fb25da cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=I7hbHXdXhLuFcQShn1MA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDExMiBTYWx0ZWRfX1cYZDzHR7p4h
 U3EuWvDjT7p+fPW3+sWc+AYXpjSY//B4CahcMMlV3vczyHhlIDm/u8GHNeVpMRa6LPIMafQyP6J
 7RrsRz21ikCvGKv//nKUM0KPMKDavJsfxL3K0zg/R+FjnJKw2bBc2UVEInlj0ALG3ghAMAMJC97
 5+kbi+YWUamfNpOegvbA3Inz46+SCzXW4GdkTwCY5AFO+w+v9jkepooVxZPeJ5U0rd36ZR68M2P
 75BqSViMSI2OMtb+LsrhKCp/XNjngifLFyMilNFYCSj8QF0Ydxev2GUjJKIk/e+zpSRaMWU7C6p
 Q81DRboaJFoL8WcNAha3+4dSKNYz66g2aP7uQuEc2mb5pzVFkXIooTyWPiFAElvLGKsxUSHvHXV
 Qrpmmhp3zchHX0LI/KEc1LbJiLElN3NnjpQThLt31rSuLsnXGJMEodjEmuKS/2aREsz5vWgYWbP
 aMB7flGzITasRxOBCnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060112

On 4/28/26 18:26, Michal Piekos wrote:
> Add support for Allwinner D1 high speed timer in sun5i hstimer driver
> and describe corresponding nodes in dts for H616 and T113-S3 SoC's.
> 
> D1 and H616 uses same model as existing driver except register shift
> compared to older variants.
> 
> Added register layout abstraction in the driver, extended the binding
> with new compatibles and wired up dts nodes for T113-S3 and H616 which
> uses D1 as fallback compatible.
> 
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---

Applied patches 1 and 2

Thanks
