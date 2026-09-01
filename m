Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CED32E128
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 12:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788265951; cv=none; b=oE1gX3RFmoN6qM3nkZ9SPyxA1WwEp3SErP/kR3b/Pz9EGNcHMjq+a5O5k8vJjOf/iNsFrjUSj1DDx4o/558tjZylzfp8Bc/9gMHu4K+IliNYNnK93yjWN3mlOhhLAgOE1vydRrHnSixibwa+jv6w4QR1BvEdUvfmZZkcHnstKuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788265951; c=relaxed/simple;
	bh=L/1GqbI6CVNHTOL+k5Bs8hxag5TXOK8IKP5ljcwCiiU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sCV4IC1zEDRumxKdPyiHBw8Hwli8tQWOo/UaVqkmHEYjpbSEXlqVemISkDE1W90ClI3yci7ALyG6OvUnxB5bwedVDeJcJ/yvZQJN1+DEcp5IM1gqJ8bN636SjQz00WQHHN7GfgCwUeKHZgJL7FIe3rbdxWyMGu8GnNX2+W1Bt0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=irf9zcoS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c/brrIno; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="irf9zcoS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c/brrIno"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJcxO2406413
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 12:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UicsQCF2CHWzuvo39HPg9O428ToJvHotIHdRWV/p2dg=; b=irf9zcoSmiDPinKB
	60PluqS2vnI1lsOxUmCHBUVLANxeE5+APsUjKskvpzQEekTcbKXSncLl5oeu6M6Z
	vAUA86FCM7dOMEBoReY9kKpEK07FFOS9ELKOwDbBgObeS8uQWFee8prHRvR96N2m
	r2dLGBV/COzhVJFapfVPAIVKdhNuHx370XD5bS+vCH7kRp5BH9aJRn5jagnWc7Nd
	fQ6TyVfbbJxYaEqT2FfALq2dprYxZa1YM9yhy3EOu8EbRCs7RN3xvoYgy2e3j4yL
	Vgx0oTVGXkMC8gQ/Az8NcwaclewhP83CJv6iIryVS9AxRVTAdbD4wlrK7YDGpENL
	gt98Sw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7r2a5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 12:32:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-395543dc382so6709355a91.0
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 05:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788265946; x=1788870746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UicsQCF2CHWzuvo39HPg9O428ToJvHotIHdRWV/p2dg=;
        b=c/brrInoJKxkzbClhPcfhxsegHuy6BKKg3M4YsW2ASz0Q9qfmuWdDkjbpV0dV8E4jo
         c9OxMrcH+ENj+4NR2bwiwEr7DAKOIFWKk2yND9QrO2SBsOV8RQtyDj3bJFXWYZZ7eozA
         t2K4blrQ5sC/ACE6OAqHe8NrZUf06v/gT6pkZWlNK0TFXnvSj9HZY7UTl0Rz/dch5ZBA
         tHlVbZLLU7e4PKbCcVZIu/6xwCiB590VjAnTWexgMSFoOrjF6FxHUoXBe2KPs5gZsERM
         urb85LynfiT9z0r20tPEKDAjUqDhvSIaLuoPfYPLKVuySSRaQ8vuiSipzZSAqwk6KLwJ
         0mUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788265946; x=1788870746;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UicsQCF2CHWzuvo39HPg9O428ToJvHotIHdRWV/p2dg=;
        b=jEIl3BIQ+g2ku1gnffg04qfUDeVNQmwWmDQBOCYzo9xeMEEVE6NUj5GGZghaE9UiGX
         C0ci8qJtS6mZBQv8evTS9gObkIW4YHW4dPf3RxFpK9jXnzfKr/XTKDjqu0su/R6Y+8Ta
         8uJUYPhvr0Um2hSC5v25mFGRj6TI7dt1eXGps2N7pYPoZXBAres1vJpENcQMAmyzhHw+
         XjYXuJZenBIZxqlKYX7p+PNuzJmc3ZIpaXgRh7QUWFAnzY3hBM+FE5YxDXdfci8+GwxP
         xAVuEcQYlMAdFXVjkg3ItUv/O0APEOgggscKf10JuC5iO8qepKMwDdbKgenv1jmgRS+b
         JZ6w==
X-Forwarded-Encrypted: i=1; AKwUvBywdabaj5Qe4LvFmIuhsVrqiVDGr/l70dYtDV7EarP3/djAJ7CzFE+JaR+lkqPGqLrx6+lhKo+QNa0+@vger.kernel.org
X-Gm-Message-State: AFuF++m/fiP4SLb2dZDWY1Cx7tWxeBtoforABiN2vcKSm0dDO94idIa8
	Sw/mtbVfqoRIntNJQwYvGt2tehq1l7CqAZgtzSnFVzBPuJkkjuZngVAv9WvOvgoSHTzqIzq2EOS
	lmPTNBvawmoZMAg9KLPyCREaPwKpyS0Gmow4p3ECXZZlQ9vJNqS6cRKzFDdV7Zwj76fVE6v0u
X-Gm-Gg: AYBFou2T0JDFY5YxdSLR5K429IXpdI7jxG6As5bYmqL8IvM8ymfOODRV1DNzRrcdut9
	cHlYGgak9gdXAjpJjLEwXfokRgHevuz3PwdvgR6bURoyXeydzMhFFSU0VENX1klvHzbWkSm2Vnf
	fCFlP2gmk2Qfbk4kKJN+mBCyffZXIzgH1fslb1R+XDU4fp3MT58zS4NEFayGYiLoQPBKzFnIdXK
	IZKk1Z6mPPSTgETmFF53WvDi+7qMVkb7DLvqPiM3QUF4ZMDuOMvKpfjiXLeXYRPxo19gclLBhUo
	jruDn567Qe2VWRkj3PTydoHOz3BnoeJiX+ymkJwVLYvImTPTJeie0lVWnHVTXDHkPxBED4d4CNe
	2OXEqrzErvZJzDTlj+dlICYBtxmUlKxDXMv5VqFP/VJfk
X-Received: by 2002:a17:90b:4e88:b0:398:a145:5d3d with SMTP id 98e67ed59e1d1-39907b17a4dmr12472454a91.6.1788265946417;
        Tue, 01 Sep 2026 05:32:26 -0700 (PDT)
X-Received: by 2002:a17:90b:4e88:b0:398:a145:5d3d with SMTP id 98e67ed59e1d1-39907b17a4dmr12472352a91.6.1788265945902;
        Tue, 01 Sep 2026 05:32:25 -0700 (PDT)
Received: from [192.168.11.105] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d18eaasm39622866c88.1.2026.09.01.05.32.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 05:32:25 -0700 (PDT)
Message-ID: <0fc0b82d-69c6-453d-bdf5-c51a9237035a@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 18:02:17 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] wifi: ath12k: support calibration-variant from
 device tree
To: Andrew LaMarche <andrewjlamarche@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ernest Van Hoecke <ernestvanhoecke@gmail.com>
References: <20260630133001.1426824-1-andrewjlamarche@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260630133001.1426824-1-andrewjlamarche@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=beZbluPB c=1 sm=1 tr=0 ts=6a96c5db cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=erCTOyO-HGHO-QmL5V4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExMSBTYWx0ZWRfX6KU9sa5OALon
 ZIydkFAG7IGsjGTlq1RXpe8wEOILmMcHxK4T75HHqRttVEQ06GKaeD2LU8X8pQUxmuAHsiCP4mK
 1BkgwFB4C/LgsLvTtQp/XTD/d9vBcVva+7gaoVc+uBbULXKpHLeCDdrqRoBGRvh6hz805bcOf0v
 wmPFgeFdR17tmQE50/MnUaUN2jfBtM0fZAuZR3iLgbjEbxdBRej/fSkUbqgp1NQweNSf3i6CTBx
 BwqyvpMjhyp1n9FrdZN3kLe8ri4q35LnR6MfeggfYByGpFRShNJ+WjRlr/tf7Yg5Bg82YPZwM83
 +bktg2tMCvlbz3plH5OxWKRxuVEOCjwpzpF3d3r0fphkmqc8JwM9q5/6mNRgiqJkQKCDWqXU/YH
 1DhPXM7ra73z2icK/FwYp6A3rMhcONk1QZEuMVRm0GSsM3Pqzw3vaCvtid5caq514bzoLaRHDuS
 xhT2YznZmTMn2bSy27Q==
X-Proofpoint-GUID: zWGdSKVFucTDED6UbeWdIFFb1ZcKS66y
X-Proofpoint-ORIG-GUID: zWGdSKVFucTDED6UbeWdIFFb1ZcKS66y
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExMSBTYWx0ZWRfX1GgnMEV/pTnn
 qxZa2jlsnmsA2xTQ3l6WmBHb02r8PklkqtxIGqDlpUBo5HqzjHwcXJxieeo0lPJOhYtowCUjCCo
 LNOoMms6yzlMB9N7iw5zA7ZUv0CntoE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010111

On 6/30/2026 7:00 PM, Andrew LaMarche wrote:
> ath10k and ath11k support reading calibration variants from the device
> tree to locate the correct Board Description File (BDF). The ath12k-wsi
> binding already describes using qcom,calibration-variant but it is not
> implemented in the driver.
> 
> Many ath12k designs expose all the radios under a single phy, each of
> which typically require a separate BDF. Without this, the radios may not
> come up or will not be calibrated correctly.
> 
> Fix this by parsing the device tree for the generation-agnostic
> qcom,calibration-variant. This allows the driver to properly select,
> read and apply the correct BDF.
> 
> Signed-off-by: Andrew LaMarche <andrewjlamarche@gmail.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
