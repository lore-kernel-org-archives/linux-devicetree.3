Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D42034FF41
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 13:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785506107; cv=none; b=DQ4u8f+GHi+aJlH9VpI3zks039Y0t3XDbTAbrI95y9FCUeHQYiQrAUUIgu8KoETcU/tmSep+RVYEZbGAq5YqprOzDOeP9MXZcBs/UpVat7pWIRAHFjrv6DFM9Fb+/+ZgxmUtGAftyFx0vYeIKId6fNUB1n1E+xTJuzfFrVresnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785506107; c=relaxed/simple;
	bh=qltHpxWSsF36DB0YxP5qnxLYpnR0OtZqg9/S616ug48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FazP/77po7pcyNrWlg/97rABo0nMoSBJ+ElnHbSSL1WqQaj2jJyDgBEMnw9Hh6XiOyHZrEEtuGRyrgvh9Q1afj2CuF2Eru1C///bsTOKqtnaXCueRpiGomFXxXbUew6YyA5kV5roR2L/0IC3DrEdhqI0UqaPqf+glKMwwymFqhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HHcBfJe1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fp7zhm/r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HHcBfJe1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fp7zhm/r"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VCGpMl3978379
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 13:55:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ClB/brBzIH44bySys+RnRDOt5bjtE0y4OtU90FT2kac=; b=HHcBfJe18xDQ8nQ7
	F7UQ4EPaD+M4Qi/Br9WFAhU9YtMcM1JY1yn2/kVxImJ/AHH5uUZry2bwh8O7WfNj
	gjEzqHVT77YU9Zi+FVsdDtBC9Bbn/s8943Z9AZ1+axj5gh4dDbegsFuHilnna1vm
	pTnPXfdjalbG7LujSS+x8aRF09x951ZCmZiSSjt7i3IN7YvhgaIEyWr6EYEAKdvA
	4x2DDYACAXrpcZCW90tr1Og5YIBNJccsT47fbRHjPPysnK/OHt+SnB3aPz9wjtDc
	UZ+klotby0MX6T9+ReRIMtXdiblmPa3XgIVxnryjZuUPmraOSR6YQxMmXZ86zQ32
	0zfigg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frujure3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 13:55:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51e9d892f0dso3070591cf.2
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785506103; x=1786110903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ClB/brBzIH44bySys+RnRDOt5bjtE0y4OtU90FT2kac=;
        b=fp7zhm/r54XLb3yr2tdjYqcMaT8dsz+bf60blO1mA9gGL7+rZ5xFsHEA2PZC2YsqMa
         xspPDI4cBuazKkjY30YGcTBXKp7vuOV1CNGceUDDr45GOmoTeBCvsLgkrzcWsKlbqVYt
         8U2dmk+4CDIGMBRyb3Vj2IYl3hrsDhU4FePvz4kkWSrVDqvF4fS8NPQDsIVJgE6CvRa6
         FjfTl7BiYTjUT8fD8tTq0PMpKGgRs6dcGCOEompzbAPON/6plT7aAvVTkyy0InAk/ZDI
         gg8/S1N3bjG5OGgL1L4qCW6eUM+ju9+QDTnztD0vPloAcCztP9sY8lM24VrDJ+t0+IPH
         cWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785506103; x=1786110903;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ClB/brBzIH44bySys+RnRDOt5bjtE0y4OtU90FT2kac=;
        b=WZNXmmYmW20jo235GnegAupFkUtnvuhTMXXcEpyfztoXyR9povj1zFrVWPBnnvxmnF
         Pz/+bCjIrS4ZQS+5UvWTbF2N5K4avU0YtgJk+6C1RqPl6sPvEK6I5mVljwFx861TRR5S
         FXQqQJRz2+WlllwG8jB+6ZNUiferCL2GgslP5kFAgAK+PCjzLbolAghnRsOlJ7hu1Lci
         zu2sUary5BcWWG4anXo5mgxd/YWzcV7KlI6KnKvufHM0mLjA5pqPivv7tc72idygyRke
         nPcGu8NMBPKdh+PpQ9Se5Yut/1hQNRf3LnWPEgsVcwpDLD8G5FIcEBxZWRGoQIpbDlTF
         3U8w==
X-Forwarded-Encrypted: i=1; AHgh+Rq64zOx9qGcJb+vAzZCNARt4wumwRkAVcV8oinq/3R/4j5yEUZXnPRRdIP+g4AXJObrMaaMdbxuunxA@vger.kernel.org
X-Gm-Message-State: AOJu0YwD9bQMhVov9ZwMKz1Wcjqvj+g3hjTTjVZDFvvHceQAZntJer5a
	F7pQkD5h3OkPgmaSBvooUIzky2GXCl+dXATLvNWCwWPRNdxppbdBH3yDiQ2v8XGBPQ4Hfy1ciz3
	iDG65opC6Z10oziTvaDt9Z4eJgBDCxeqYP/5XsXG3opTpkqOGyMgQTRnDROuOc2nq
X-Gm-Gg: AR+sD11H6rZJHWnL3cNVzMWiJAaWIuYRQVwUEK25WiKb8tdhqkDYncE9VGnY4OTOch6
	pJiNAVY3DPgoVSyXWH47BbCNbMsKxaopB33i0T+ZnQRbCIgFy76d/DkCyGAVxY0IFfli6qOsRPS
	O1OL9PmSl3oihxGONHjGp4ICkedhxzbgvN04VPIaATe6LSVN+3cfl7/JxNz1ENDtgy8UGHWsoma
	9c4SC6m7O+kCREMs1xyYe+VYgI4gBEVTc8lVc0E/7lZc7YK4h8WWROpFWTbdpEEBhwsM9VW8twL
	lt7i8C3yGrpov4L42maF7k85rQ8PFZuuNEQEnSX2bd4b1ejEnp/HU9w8UFET+ctMWlCndt6QUA8
	X7OG/0lEMGOkQVQELLb8+Goeg
X-Received: by 2002:a05:620a:640c:b0:931:10e:befe with SMTP id af79cd13be357-934a0576703mr11144985a.0.1785506103322;
        Fri, 31 Jul 2026 06:55:03 -0700 (PDT)
X-Received: by 2002:a05:620a:640c:b0:931:10e:befe with SMTP id af79cd13be357-934a0576703mr11138785a.0.1785506102770;
        Fri, 31 Jul 2026 06:55:02 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c63d9d6sm2033821a12.17.2026.07.31.06.55.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 06:55:01 -0700 (PDT)
Message-ID: <fe431e27-4d26-4c92-9d50-d4273ecd151c@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 15:54:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: switch sound
 card to ayaneo,pocket-s2-sndcard
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260731-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-dt-v1-1-0528ff6ffe38@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260731-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-dt-v1-1-0528ff6ffe38@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=U6Giy+ru c=1 sm=1 tr=0 ts=6a6ca938 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Gbi0VzeWitClxa_Z-XIA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: qeWJ2kvMfNIpltf3o3R_qOA7vLsSfDn5
X-Proofpoint-GUID: qeWJ2kvMfNIpltf3o3R_qOA7vLsSfDn5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEwNSBTYWx0ZWRfX/QshNOqW2hby
 y317HCh9wPnTTKtR0Z1wl4q3sTeV1sSgcU8CtUJ0SijqgGmC4vxfA8KuyMneUb0zSt5/v5sdppz
 clDN5rFMtZFRHzrbmZD8Z4XMb0QHJL3qbOFNwN9D7V4kp7nb4Ka0PAjMkC/oviby+QAPRfY5G7w
 KVABRAOVUnMX3jZIypxppBlYjq7b3fsWySSB4xolYCprh64NopbFi0XMG+Go982AZNRMgm2ujW7
 Soxj/2balIulSzP6TPdmT8cQO+JWvE/Vre3Ap1OfnH78cKm9WqrZfhn0DAsA3A23Tq7LioIYlTg
 UxtVcom78QbRvIizolVs7m1Qa87171Fyg7UNVe+nS0ap6TKONzhmD/vO3CvrDABnWlxDjSAWZOh
 BsGsAzNnbBcaYLZXmIlodJQSRXXrA5guUaRIxt4D1jB3dLWQyOZf/uCyf652JHtdjIX2qvJlu3T
 z40F15N3xD/xLX0ZRGg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEwNSBTYWx0ZWRfX8fEEHydComhc
 r/b0W9Thwgtj8qvpkFl30daynnAbDi4k42eVg8OtJHOw373NNInvB7PbjfGj+x/5fEcqs+K+FF+
 RFQOIXTbssA02frvzhLCdO+3UWtfKMo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310105

On 7/31/26 2:36 PM, Neil Armstrong wrote:
> Switch to the ayaneo,pocket-s2-sndcard since the hardware connection
> of the WSA speakers on the WSA2 port only makes it is incompatible
> with the default SM8650 generic sound card.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> [1] https://lore.kernel.org/all/20260702-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v2-0-1ef8ceb8c9ec@linaro.org/
> [2] https://lore.kernel.org/all/20260728-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v3-0-b29f44720178@linaro.org/
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
