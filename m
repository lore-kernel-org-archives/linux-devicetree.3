Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F59634C981
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774518070; cv=none; b=jBAov7Vsy6OmvbBYNYUlvzCB/grpfqWaMJ5nqFTpr2NiGWsks3nP91o7yBRrlHKV/iF7DpwuTjq5hfPtWvZaU4/2ufB6NnvCu3yQIzMLt04tTcHBvBUikFemqaAVc6e0IiByoqVRi46GLYJE3Fy8FhRFEDW4BIKxz2btC/Opgf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774518070; c=relaxed/simple;
	bh=Rv5UhyIkY7LTM34sVRpkamMs3/VFT2zqxDOaYbDuLtg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SKC9HfNHVfzqAHKoUSF2pJQ+6P57gYlpGmi/1UrE6QQq1y38R6wAzAc4hEtAFRNOtYtunVAzx2gryJtVxoxCRm+nCsYNRIlBMUjAMLzW2m/kBan14G1yLhr270xf8lj8Syq9derX1bF9VsArFznvww54uVmIzmFaxNoUc6SEBdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oaPi3zxs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KVMQHxar; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oaPi3zxs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KVMQHxar"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q3a0AH4015126
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LMKFa/gZ/0WtlaOoCfp9i4fst9ROmtc3ezJMiPBlmEI=; b=oaPi3zxsIT4NpBYJ
	bw6CS2FHFtyBZGnNKrhUKohH32lG8VHBHOCVMkU8y6fvLtZXNRAeDYfxxdBNxyyF
	shi/PGumyUgX8zAqIoplLczOPvcHJsz/sXZBkSZvDvU3/YbMoFbfyPpYwNwRsUJS
	FRjWg+RTbtZw7YeWwsEEMoiijjqCaTOf+T4JkgCSZvBq2+fYalM6D+Pd6L0s2VDt
	1zqnqlFeWRlQyf4czl1XmQJAYI43vXKajhROZcidfgUGOPp4Xf6h+j9/GK5NcvbW
	C295A7Qs98awyd0lxLIPjbmgvonGH5U5wR2gSrh+Ker83nwPEHASs1yX2owQVr3A
	LuG85w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4w1q95ye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:41:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50947db2e97so2819541cf.3
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774518068; x=1775122868; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LMKFa/gZ/0WtlaOoCfp9i4fst9ROmtc3ezJMiPBlmEI=;
        b=KVMQHxar8DN1/nJ+7oXouR00s+WFPPsWK2bfGclBC9dscbW4/+AAmuel6L5/P3IN53
         vIgJSOcs2MbDxYMDsuf1O8z5vqGruqy+rTvpuT7nA+3UdN1D82OkXvYlngT7jPgS0nh2
         YQXw6XKHfjiBelglmQaxfDdCtyKeopGlbsS3udZybHg12b6pSNgcKd/0eK70g2pfOXQ4
         VdeOU+K3eOREsoA+fpEY6IZPYPs6dUe5CR+C9G7EdfxnmPJJyQHVqXNJr7HZGGMs6hKz
         Zri2OVDm6rGJbJd459rMxQw7dAHxI2XlxP45B2JngJn1BSvohMUndbSdsCxOxycneDah
         amuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774518068; x=1775122868;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LMKFa/gZ/0WtlaOoCfp9i4fst9ROmtc3ezJMiPBlmEI=;
        b=hO9WOS0jT6exLEAK8I4O3/snHT3YW9ImfswghVyPa9Vb/7mBIHD3Rze8MxecjshanJ
         zhYsWZAKkElVs6C29rX+bpxDsBNdbJia8k99VgzDgbla7kF4Ss8iGYT7MQFvGpudb+XS
         tBuo7PsgH2UmK4jGG4mrdMPrIxxLbvkrl7xoI94JDPAGqkv2L7bFg6ZoltwsR9ipU5xx
         4ypj/QVCD/pueANzAgXVrPJJuil4BTbsSJv9hCPHndbhUvknrjpf6lW2kwVuQLOn2hjt
         hNySWiOwV4xAN+4qe6xQrb28qAgvM80riUEi7Rh21U3qIuz+ZM9Dd4gjtMp51tSJ0hMS
         zHng==
X-Forwarded-Encrypted: i=1; AJvYcCUfojLr3yTXATbepZVXGS2dgjV19b1lNK/ZaNc/iramVznCaxMBPPOFY2lbF5V4w9t5AfluAIB1IBXj@vger.kernel.org
X-Gm-Message-State: AOJu0YxzKM4CuaxDAG4UzwJT+Jjg36hUjFNYnrM3whe7JIaJRjZBCLjO
	8okBH0fwoeG6XRQslQL8plXam/gbF9F4iV9FtvlmGbK8UuOeZ1+7hucHYjj2mRhIkjinHvgUwb4
	a89HmVfGoxTuzzqqOxHjKO2HFWDmy9KxfQ0m2K/3uQg9m9l4PmMTKiQigkT1BlVMt
X-Gm-Gg: ATEYQzwB57IaVG0OWeDA+j7VMBL3mjFtARbGNCixsAG9qpURB1CKXAVpGy153VOI4Ft
	aGwl5e6th+qenmDcHYmOYlvkMzhIHK9wBWsCuN2iCxX0r+gdZU+RjC8HhL/xUQVYmrXhgWPmtOH
	L1HAOlOcgvepg/vn+HEm/M3U0mfXmGf81BKEcMS76ViQM3aKf4n3C7q7SSXa4PeDc5EcS/SwBMh
	t9a7rCvJuG1xAYYprT14loX20q6sfOXuN8turOSDlvf+8PmF+zqWpHw8kW03v8G6xEazWQfRwNv
	7khfhDaF9TaGwQUJc+njvULl2oSQLNFKj9MxtNYcBThsUpEIZjf7AYjAOEaQMhLRk5+5wwlel3h
	wvTaHjCSkL0H1MrAdXK7h/EToS6I8vVuts7ZmuqU1z1tnlqx0ZTNur4v5FTK2BabsD7RarPmb/Z
	m2DVY=
X-Received: by 2002:a05:622a:5915:b0:50b:8ccc:a41f with SMTP id d75a77b69052e-50b8cccaab4mr45595011cf.6.1774518067681;
        Thu, 26 Mar 2026 02:41:07 -0700 (PDT)
X-Received: by 2002:a05:622a:5915:b0:50b:8ccc:a41f with SMTP id d75a77b69052e-50b8cccaab4mr45594771cf.6.1774518067265;
        Thu, 26 Mar 2026 02:41:07 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203ee83csm94343366b.43.2026.03.26.02.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:41:06 -0700 (PDT)
Message-ID: <593b3801-a83c-4132-970f-5075ebca2bc4@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:41:03 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] arm64: dts: qcom: sm6125: Enable USB-C port handling
To: Biswapriyo Nath <nathbappai@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-2-446c6e865ad6@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-2-446c6e865ad6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GI0FvuaKmSTyx3IwJc968Ovefs3wwCm1
X-Authority-Analysis: v=2.4 cv=HvV72kTS c=1 sm=1 tr=0 ts=69c4ff34 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=J0hDaVVMoxkQcXr8FO4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2OSBTYWx0ZWRfX0VXE5qr7aHfq
 YydgsbcfSMWsxoTXGoh2zEZMF5ZljBJBRCK79dA7TwTCJeEX1Ty4T24ase38XICVFIu0plJmSJg
 cUfrmlKEQe/blDCbAoODM8o5vmkemB1hAp1KqYzYXGxvwKY35nrH8yv8q57SG63+pJDS3T4xHe5
 vLO68/HUAJ9S94U3V0DBob0VlGh6eEyR/iLH+wUG066+HQYIUAbc4PAAWXn0c2luVs1uYh5xB1K
 s/dgILqJLfGFn3C0rFl1hNbM+cIauyIVJbcrH7kFSjnOd5JV0leo7uq2Kewl0mUm+4w9msA+vGG
 2Y6G6qDjMv0OHuED8Bvj3zCXpOqFNC6isOBbWiXU4K6MYIORW6TN+mXH5wtXhQhZ7mgw25JrzEW
 2smBjxIIJFhUx77j/l/BYLuJOpU/+nM71NUT5NltnEp6cZeyRqd+o35YgoUw0XcA7VIlLcEb+rP
 v69cOe7nmEw6HsrMnEQ==
X-Proofpoint-GUID: GI0FvuaKmSTyx3IwJc968Ovefs3wwCm1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260069

On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
> Plug in USB-C related bits and pieces to enable USB role switching.
> Also, remove dr_mode to enable OTG capability.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---

I'm not sure what this is going to do for other 6125 devices
that don't have the Type-C infra wired up.. Does just applying
this commit alone keep peripheral mode working on your phone?

Konrad
