Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BB2423788
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888467; cv=none; b=jBP+Jys/zAAWl5udc6j/4bwSR062pJdwkkeuUdNo4mBN3FW9hy6xAhVSvjfw7QXlUcvncpQCfu1B0IT58IzxQAV8jF5/bzYV+8uJ5wwXAUr0kB8QuLz/LHWzpoWwQuEKJGfRuc/ypb8dQ2fofFj2pGIBPNce8zno7RBsxULNRHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888467; c=relaxed/simple;
	bh=WjLZXi1FX0UcNEp42eU6MECBboq+YbKJiJcKN/N+t18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nVkR5NZOJwlYL0pnlF2wiz/pPkq0jYX8fHxANE9ImADSr+W3HscJhApsF6dxFJ+k0dKSyvWxJqh7Bqp+/8MvYcvrFkuTusF2+Yz9TMEIzOS7XVUbw39tZA53OKOHuISD6kfCYm23vZUlk5Zll0z3ZUR5n9lRZsLVi+5gHHm4jEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZicqD6Vk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CgygtYf+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZicqD6Vk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CgygtYf+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADsBl2616247
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:21:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	to02Qk7qolpxRS+ATYje2c5XrkHZ6G9GaW9aYIJaIjw=; b=ZicqD6VkrlnKEbY6
	qK/zPf+7qT8u3/x3NZMx2F+5e9kq1ldAXFh6/iMctdbgUcLvHKqx8VXM5/b5/YRh
	HyMjm6rAZmiQM9MJSLHhFmu76+xOWY64w0YGtpLeco7SZFtaNosXvxDGXLfDMD7h
	MwN7IX+9q773EYD1g6D1AsJ2x9ZS3GNYPaB0AoCGHeFQ86uox7WiVRGL81T3kwjh
	sx6b1Tlgy5RpbNqrpjKZGdWfRJpVT8o+OU3Yid3q6qA5XpuyrEEbX3txua79uUCf
	GbkCoTIGLfDBB0pUkErxdfpZYynu455Eam9Z6Adbl6oGOdyPrdIFKocxcMK8plig
	vijQMg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0pw9a2c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:21:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e4758ab46so289954a91.0
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 03:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784888464; x=1785493264; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=to02Qk7qolpxRS+ATYje2c5XrkHZ6G9GaW9aYIJaIjw=;
        b=CgygtYf+1U6fESlKYVS55XMVkYj4eCwfiPzuZ5qQuTxrBTgggRwhMXF7MsBu9gyE2p
         9ajt+XuYrEef/HU3iEzM2Uoidbwxh937IdD1zqXXlYxCpHX4ZW8737W+oxyY4quaDpT7
         q3xzrdW844+vBuGi4Af2+KmiXEyx6QqbqufKRUlpNwoowweXhS12kUrwYIjN4gVReTak
         olHb6CHX4OFyk+UDPlD3LxwPdBAboqObWZ5lx4aZDNQBU/F+EAIpWuYvpMWJNtvLGdW5
         fuYED9oQruknzza+6BZ5EW+JYErl/oaSgp3RKNN1rRAvfi8CpHzrRMb8yknBpRgUkQZl
         Jz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784888464; x=1785493264;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=to02Qk7qolpxRS+ATYje2c5XrkHZ6G9GaW9aYIJaIjw=;
        b=F7EDCiQGaO4W+mCIhmOQv2F3IMnbSeQOkjOPnXfmOE/U7YEM/OkZObreslyt+DVG/v
         +damWzgct3UItO3dB1KwcreZRfgfl2r3ScAkjbW9zwcrl8KDasWEfjiCjGibW6NcCUoy
         kVuPYV5oJsTzwvNrGazvA0GyinRuCB9pSFzkxR6d5sjbZV4JrDIIUukUzVb/g9KLYvjZ
         nqjb0axdVwM0VGEBi2K+V1TIoyi6WnU/+xOwbToJablqI9kB8eljh+k3PkQGo1eLLqLj
         9KuEgGxvyTYuBZlBK8GURkciRBdvWjkwTYY1vfJZ2LK/bVGJfNxT6/eFc5etV4GX1SNq
         XN/w==
X-Forwarded-Encrypted: i=1; AHgh+RpEUDEreMfIkrDRzH9/Kaj83hNBxXuMGSnxyr0TuYHb9I6meziM8ezPIYLS51SLFG6qux6kOnol12xy@vger.kernel.org
X-Gm-Message-State: AOJu0YyAitCzTJUgn0kLSnhfmEtB/CnRlqrwQEGIcJUnMjqnWgHZQ7Sg
	IgvzgOU6ZAD3V6e1z9J773XbsfdoiVpfv6hzDnMNANbKhR8XNwa3+vyNkR0krrtcPuIDu0vkxN/
	46lFtY3jxS7z+qKQJmvOkClHybtHyLz2TvOhndL1QtAVIBXL9tLIC0jOWmfv7Osbx
X-Gm-Gg: AR+sD13CMfywGCJNPnSJDC5OUGHSEyNJugdNstdMdljv4RIJCjngJBhCK/cu8Q48SVc
	20R8wKI1GLg/0LobbqhtEGfDtcg+0MV5zfweRbSBIQZXCslJPieguLadxLjzNAqpUOrlKsjgyxj
	0PSd91j8GA/YxWM1LSxUVLDYHuLD0Z5QEmiTd0WRocfxtV6/VOm6tV9l4TDwbG8SCbVGnmuMXUg
	6bezw7pluepbaZNVUIEw8EMZ/Wi/Q7HFMhSOp4gUch9Ms8V83l2hInIzJqLBkd0VuQZ4yJu2XWE
	NOuQ9xsf4wzU8/ai3fnKMsSr9fu6R/XgHHvv1xfcZpeKcP7lnHOytSXtwcf/6YKgv8/t1hZTo+h
	qkcjFSuZ0bhYJTxljLy2sxgzCze0h
X-Received: by 2002:a17:903:907:b0:2c9:fa31:850c with SMTP id d9443c01a7336-2cfa6c7985fmr77481715ad.39.1784888464372;
        Fri, 24 Jul 2026 03:21:04 -0700 (PDT)
X-Received: by 2002:a17:903:907:b0:2c9:fa31:850c with SMTP id d9443c01a7336-2cfa6c7985fmr77481455ad.39.1784888463875;
        Fri, 24 Jul 2026 03:21:03 -0700 (PDT)
Received: from [10.217.217.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf9c8b7a7esm38913135ad.3.2026.07.24.03.20.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 03:21:03 -0700 (PDT)
Message-ID: <9ae581b3-52c4-483b-ab54-90f6d0521ba1@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 15:50:57 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] dt-bindings: clock: qcom: Document Nord GPU clock
 controllers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
 <20260721-nords_mm_v1-v2-5-17e5a445a512@oss.qualcomm.com>
 <20260723-enlightened-wooden-partridge-c938c3@quoll>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260723-enlightened-wooden-partridge-c938c3@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MyBTYWx0ZWRfX9jpq7et2QAGe
 aJXZAz11d1jQ58uvT4IctPSBhjSl/x2PTNFJ9civJaFmFBjpPYpxo1nD6x4GaFoH562ZB7wwTdj
 t3hsZGtmiGc3f/dujM3MFKWwJIIi0uOxBEPntODu1joIwFiYMXLiu56ObcJvsnxkAVesQvrD2rD
 yKIBasKtqQCLVJpzXAY/GJ8TSAw+xOIuVXaWAgTsI/mWC8D2RwvQMIXlZ3sHLVpxV7Wb4A1lrGe
 hFR2dsgI+Di4XdcmhCart6fMg63ZV5nTVM3mx3W7//iF8JPrGfO/WsB3PV1TjqTcE7TDKo6pQvk
 4TB6onhXlnmJwFAc+tC+WB30aB5+JCd1f71uQGNfZ+jxK53RJEYQMQPBl8Z1iD3h/Y98OfOgcYy
 QPXx0wDoTT4XKnvhNqcF0cTMJ1r7ZjT/j9hrHB65lJHVMQ62CyiFoIJMFRio5KTMU7gAtF+Q75p
 VlBm52EtQ6lLUdwvp+w==
X-Authority-Analysis: v=2.4 cv=RJeD2Yi+ c=1 sm=1 tr=0 ts=6a633c91 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=c2WS_Og9x-8VFuS5iNoA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: PuCw3foR5pWUUWSVesX5An_0t713rAdQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MyBTYWx0ZWRfX3enmrrHTowL0
 Nx15SpOgTJJHUVTwSo+J5GIFWoeusDI1PZNF+pkn7dDX6n6WVsmnfFLkxaxpcbkjqrx3kIJ58t8
 jlt9+QgAN66aRWl+2pf6SKghPtaIacQ=
X-Proofpoint-GUID: PuCw3foR5pWUUWSVesX5An_0t713rAdQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240093



On 7/23/2026 1:25 PM, Krzysztof Kozlowski wrote:
> Mention here second header as well.
> 
> With this:

Oh, sorry, I missed that. Will fix that.

-- 
Thanks,
Taniya Das

