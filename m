Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F11A2D5A01
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 14:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785334599; cv=none; b=jY2WwYaJQ99x5QPchMfnKRr+b/2KhJdDHhbcwy5SoMwqYtHS0twMG2uI/UiZYbd+/IOIo/N0v96ozktDN4kbv5NqmgF6/uRRGuN0GQIuAUSk9q6rFYXgZ6+DhHeaqtR4vXn2cG9/aCTBmQytsjJd++U4NCLkGk/8jgFH15p1YJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785334599; c=relaxed/simple;
	bh=SXR8KMmnzVF/8QVSHt/J+Dh6oizq4Ndks3Cg7bpT+cU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OUmSKLmw5n3TN5IRxXeuyhn5tciaOSowAIYC5zcPkFZhpdtXhQtexo3GfxJl+vKlJT2CVV09LCQAbtDkXfM7Nq+HkTTvf5NCmSaHPGYzl5NqIfohWqtaM8WuRqWL13ixz56i69RtTwuyiWkOsAR/qjhGRS8rsclgblVWhb61q2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VTDvDKaU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QwIHM7/y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VTDvDKaU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QwIHM7/y"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TD8Rbs2324863
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 14:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QmsykY21H2YzhEss0AqhUihWRo2IwBf/1SvAhRgBeRA=; b=VTDvDKaUrP1F2wP7
	WX3HaPHaOC/RmWXOT1AMJr75dqs0Z+L69g3ieM/Jl3EyCUNJ8WFmAapo0C0tgmAt
	o6u8sIIQ19mj/RcojblMFzTZ7Y2d9hHG+ekmyfJpnbxnBgOd8AhJxpNzTESOaiXD
	i6WTrU5gO+ok+BiNaR+Qqac65fWPfzIC0MNmuUV9gpgNo4vnm7zH3XAHv4lJMjjQ
	oZTYrZgDRKoTY/F0KznqK2GRXZYxlDLbDr7ZBbNC52417gm/HD0uAOE34dz+8cfD
	VLes1jOeccGgClQvFgWS70vje66lm+Evv77P7sm1aOF2HxWPq3/PBGAH3IFLzLo1
	U7UyJA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgx80mbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 14:16:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e661ce1dcso17214785a.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 07:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785334597; x=1785939397; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmsykY21H2YzhEss0AqhUihWRo2IwBf/1SvAhRgBeRA=;
        b=QwIHM7/yubz/jZ+RbSYH/EO0gMs5EUj5prcii9J46dSRry5VydsLobqenwzE68bNAr
         QtbeXgHwdPtiOV1mfI/Juo4ZeVcg2IABu1p/32Dv4adCeUAGCWVrD3n2ncihXEPnwwSH
         Zc937p9zNLCc7asTH2P05gaKaWl41BtpES39XqVIr9Fd27UFgdlX+YJVQvbU5HSM/2+k
         PAUC05VFwALpdiAaI+MAna/3aFRSZIOLst2mN09l5YtURQ78UUnaDzBIzwEQClcT04DN
         H8khz9P8pSsX4m5XlnV6W80gZgEUNNTdqvaJqGPtuonEwMjWo2u5HitRt/Vp9MtfWX8s
         eR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785334597; x=1785939397;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QmsykY21H2YzhEss0AqhUihWRo2IwBf/1SvAhRgBeRA=;
        b=NlD8mJdmPuR2tvXJc4slQNPgZ9on1W1Yft/e6vREgAAp3s53Hsh+aps+kN9MWpvUyn
         DPmgw0Q0m6XznHDOQhNyOtRXi8uHN1VVlr4otinN8yOkaSHm102/5cavKtcXwzjxNfPZ
         9Zy83x4u86Ngto5i9YE8CDt6UQ92uWT0WoLBSrEEqZxGm9HtYfTavNgvQ7pkd4B/xCeB
         odEWk7Q3TMp4ynDFXEvQhAi56SHH6F4p0MJwVw22rx6bjCivU4n4yX+xtC2gfnVS91Vk
         nafOTsRlyU6M1hHERnxxciheWMprZI+OCHRe989nbVjyrBkgu0aJNCjzHm1io/mp8PRl
         jZoA==
X-Forwarded-Encrypted: i=1; AHgh+RrAZFzpkFDW0jQnXL2VtzoKhybxzXgrohOg3wvk4LVy43XeoPuNLAjDMqZ8h1vBew4hmVvZwL366N9M@vger.kernel.org
X-Gm-Message-State: AOJu0YwGlupZthZGzj9wqJl1VDv+eT13q5iYDq/xUyNGPGYFsWjPTDfE
	3A6P+OLZ6/zN8aHq8VhnQMqD5uN2t/4M8A7c9veqEjHmSt/GeZeeUvjA78Hiv0M/lw9iL4U0oft
	GpuddtTQodyl1tRq178isKqws6gCrto6s4GBxawmTxy5vuMbruVhdMlqreUa5mDTz
X-Gm-Gg: AR+sD10gL5OgGQrjit2PRcjBYDPNSdzqu+nX5lvdnxKKrKImvIKFFC6NkewwOrKNGFf
	LsebSpY6uV03NanPaWqyAyKAHFPszCUlwoBpnxeRevuD2zQJnwvbBLCOiG0g8iyftM5jMD9qFAn
	XylYfP/HkdPwmDfGQLRtz8Pfxh3x36T3dDfao/skqmtMZdG6rrb9/VxcuD1McIdNLyG08jjGtmh
	MadCzdJk3mH5ihSPbDmboufzjk6MBCd3v9ZWsSgvv5krXAUTDj4Bhs6i2+YtFI0P/pirdPqB/MC
	rWGnlq9ysFknw2KxW519CMqzidiYQaXZ9nkiC01FIlJGRmxMhxthSpSFCxPGN+qVhTZWaqiftel
	kXaXm1Av43Z2c2+zHoWKMqlAw
X-Received: by 2002:a05:620a:aa19:b0:92e:5272:4e3e with SMTP id af79cd13be357-9330239e7c5mr564206085a.0.1785334596839;
        Wed, 29 Jul 2026 07:16:36 -0700 (PDT)
X-Received: by 2002:a05:620a:aa19:b0:92e:5272:4e3e with SMTP id af79cd13be357-9330239e7c5mr564202685a.0.1785334596443;
        Wed, 29 Jul 2026 07:16:36 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f5d69dca2sm4948701fa.35.2026.07.29.07.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 07:16:35 -0700 (PDT)
Message-ID: <470d18cf-ec29-4f45-aee8-64c5bf492599@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 16:16:33 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] arm64: dts: qcom: monaco: enable inline crypto
 engine for SDHC
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
References: <20260707-ice_emmc_support-v9-0-701c86f3c25b@oss.qualcomm.com>
 <20260707-ice_emmc_support-v9-2-701c86f3c25b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260707-ice_emmc_support-v9-2-701c86f3c25b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDExNiBTYWx0ZWRfX9mbV9TFt3Pu8
 rGkrcZvYLPEt7KoOHF024srW6RiOaTVdVYdMFJ2/6fJl/MLpoSXPaH9tlWhaj4aFwKIXzCryi4Z
 Wf1PyD1XaXp0s7vhqFXDPJVaFKS4slg=
X-Authority-Analysis: v=2.4 cv=MZdcfZ/f c=1 sm=1 tr=0 ts=6a6a0b45 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=fDCyUOZyI66MdxFVymcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: nQJoJlA7KacfG6umzCvQI44yyMFoi68v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDExNiBTYWx0ZWRfX+MHEvs9E2zfX
 gFPT3P1n9C2qVd86rNAIaLUyzhbsViqRaUfpssCW2ncs+LgLaUWB5r9X+oiqVLgV+ty178y+ilH
 xYBS6VvKlnhjs3PRuzAj2zSzIWXSlmHKYwroSQciQ8zdn7hWmMvdDmFmmFDOZ0k1g+T7VRcj98B
 ZRVxZOP/AifMn5BNnKomVE1C+C50ASlVnvx64yQPyC3SCo+pM3rzsOJIckhpXEmnTRHka2sByVW
 caz/el5YqpIyvZlhnxqAuO2yxbCo35OUxyM6g88Rm7fdxYkqBs9zaW6BhUXrIn4ymhOOadfxwGO
 xGsbiS5wF3s9WkBMg6TOlnT7hKBghlFAE656Ai3rtyDxehi4zSUWtiGe5LA4GYO2PCEsaz6TFRy
 CC2uzO6ZVs6vTfGTC1d/I1hjLNa0li1Zj08PysXdOihfIbL+Whk/wuzoisPQLhR6FZM+WvdjBjj
 u+8U5fglkod51nZu/Sg==
X-Proofpoint-GUID: nQJoJlA7KacfG6umzCvQI44yyMFoi68v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_05,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290116

On 7/7/26 9:11 AM, Kuldeep Singh wrote:
> From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
> 
> Add the dedicated ICE node for monaco and reference it from the SDHC
> controller via qcom,ice.
> 
> Also, define power-domains and clocks properties similar to the UFS
> node.
> 
> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
> Co-developed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
