Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76A849D5AF
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818709; cv=none; b=TEyKQogtGV6UbhmJaS/gZnaRIj4/l+XGpnycPI3REtmlr77rxPfzgub9IoI0HayUpxKgm1dK4BUPE4rqYeCm35AgYcYWm38LNt8KdgL3GP2hChYoqWx2HMOV5eLOgpM2pEgyMn/SeKV2uivLVOFEpMi1Ff5o9Rn++EhrG1+ah0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818709; c=relaxed/simple;
	bh=NIV9vhYhi+Bn4r9nXOWmPMXYzPFmJuXkh8mVvNNHbcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iPZSIWUyjQYVzuxNAfdSDJLA2Edetsdy0a+n/vLI0pAJArEQdXPUoRp183R6/ZUnpUEASGrvoRDXUyGTZ9sCPZ+xXs4JYqqC59aymxd7SrjZJZw8XVjdi/t761d2K9SlZ2Oig8FTmC+MsCSFBe9MAoo6OnqDAJ0eQNuL8PZLDp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NBHK/CFd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H66r6PfV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NBHK/CFd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H66r6PfV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC09EU1686401
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NZe5apiwn/op4s13rCf0Ijf+H1F+RrDOUK2IOt7qJyU=; b=NBHK/CFd/ZrBFzWT
	aRJWhS0oEFo8PMHo//Ps1Vs36tFac1tmJGjQN7fgCwtol+OVmP+4/fx5B3BuPFQB
	EbOxccSkp5hFp62ycCh1v5hcteNRPmZR/JRMm1BL37vPh43jSmyTVvHehv3B6Ee5
	OApYBwUAK0nUyTRVLIppWCMuF2AfT6HkuoFvqkv2n87DmIvMPqxjIzyU9e/gWS0b
	Bp5972s/HfKn+OcWI64EQqZuxvJf/12K7b5hzDpBzf3BVk/bEfHDlq3xuL4U2Hzv
	Jv+bZz/GrkxjOB7xUJ/lLN/5PTgf+6HIUGeIHYwd2EAiKlvSqWuWHKbQ/cH4a6al
	WlZ4Lg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc1ffg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:25:06 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cb9f12d351so29138137.2
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818705; x=1792423505; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NZe5apiwn/op4s13rCf0Ijf+H1F+RrDOUK2IOt7qJyU=;
        b=H66r6PfVzE2BVRL+0x6sgFSdPLzuO5B+3NHITiAlgXTRE52AHDkCfKnd11umdV+VkF
         8ITZDcoRXVcmO8Ag5QFu2pKzELQTOVcVxVZkTY2GQf8nfKI6/kIJn52EiC6jJcnnewTu
         nu+hWc1GaS04543CvQZnUJtGpXp8Sy5sptGRSdYbi6mlUPjL71ePyNwECgVYK/Eac8Zq
         gH2uFEWH5InnVDKh8y52MDi1UU59w6ebicMDC/F5N7PWrDcU/ntD8I/P0WTd+1wEnowg
         Tm2AJ457yjjnAaOeXDCnLFNrIhPdsi0j91bu9QKXPHKrECzkG1JGwQCeOaqbmEQLvipU
         HWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818705; x=1792423505;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NZe5apiwn/op4s13rCf0Ijf+H1F+RrDOUK2IOt7qJyU=;
        b=1+w7riEjMMvcC5oH8uHkR4awVjAQP+29SsGAUVKFMfI2SiSlCdJu1z+zIVDvos5D9d
         mfQlQp8xhretJSbSnTNG6AGKqTIgTUx428HSNgp9dN+sV9cPLLRP3kDiWqYSqRseXP/3
         ZQFlyfUeIAYTb3IuJODu590DXaw7kpsiLRK7FQ/sBGRE+AWsOdkjK4RaUg078qdJjK/I
         JsqbGQHct/l9n5rzrHDdxXlglZA3j67D2gKo/k3Rf8RxqJ372uxOH2rDAIIivpw93Ve5
         GzPP6exgsZ+VZDH9FcbQHKCuthG/JQk/V4TJ2KKlE41118AetWs9bWmKjlsPvI0Kza64
         hbWQ==
X-Forwarded-Encrypted: i=1; AKwUvBx725wn7YXATKbTc7TdacAa3eZvp7EFThMRVnxNlVKRiYaiYLBko6CyePtfF3P8UjQ7fpBC3BkjqiV7@vger.kernel.org
X-Gm-Message-State: AFq9FYLN0lQDWWUVi2IsOcmWj1B07ZI9seNFJmVKj3SYjrwQfcuJvSmN
	vPW+5yXsRKJwCbSt2C8Krs/c/v8ZHSMM3BBVPWAIc1j9MhluS8lMJvcvP8rrB4emKIQxEvY/5wH
	11s/nR+7Zw4wHZ1Fjx5aOlBthol9KmyVQcQ1g1tthuLPqBfJLVOm7yP8ipfPJmf15
X-Gm-Gg: AYBFou39mEodGO4WYQE7R8H6lApi2uDbxZmE9Q3MdZD3oWgeVZX6gB6ja3RX19nw9li
	HfOI1cPZpCqQe7yo0l177XioaiufoJN29v4RMZVQXe5kLmpDU93SU3tw32vRLTGqlR/SA4i/ItV
	T0cuXgxT5OOYvyoBty6CUFXlWpZPMKVr32/6cRnIOjyzRnDhqrqKOfvlCY73Q07bM4iohnWobxM
	BGGk+xCB5C44ya8bosX7T/dw7kPnXfdoIwZFySUxbymbT5xmfLklFmJn7bAcro5JPKB0yx4klR1
	gUZGYJyzVZgdmJ5WRG0ziELmsCTtMoL0Ygp0MSTq81anVVBb7HofWcpySvsaZ8c52uP07/Bt6hm
	oSwzEpLEgohPXPAY4mpfTcA==
X-Received: by 2002:a05:6122:a5c8:10b0:5c9:ac9f:b7f8 with SMTP id 71dfb90a1353d-5e91ef9f2b5mr1351483e0c.0.1791818705145;
        Mon, 12 Oct 2026 08:25:05 -0700 (PDT)
X-Received: by 2002:a05:6122:a5c8:10b0:5c9:ac9f:b7f8 with SMTP id 71dfb90a1353d-5e91ef9f2b5mr1351473e0c.0.1791818704381;
        Mon, 12 Oct 2026 08:25:04 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9766209sm479310166b.3.2026.10.12.08.25.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:25:03 -0700 (PDT)
Message-ID: <95de1721-4393-4afa-a973-6ed657a0b69a@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:25:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/38] arm: dts: qcom: ipq4018: Indent closing brace
 properly
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <0436be338751fbbf30d8d6baee9b0eb8ad8d9938.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0436be338751fbbf30d8d6baee9b0eb8ad8d9938.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX2lu/p9FE/GcQ
 bjKj8rndxOg/+pNQfW+tjvHra2iBoVVA1xRWFNb0iHxs9gkfEbj3oUfjzKvGalGWaz7smxTwcMo
 rusjVKScJ97B48Z8/QENHcXjoTlE9X0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXzd480+eu5sVM
 Hs9Aeit6Fi/oubEAW8zFq6lyS15GlskP1msi03H0ROWyHrnDNefUqyVuAEiZNIpsJEBcDspWqrp
 WYywFgCLhDmUEs2XBK4a08ulQ0H5qbEqSrLWrnn7KQhY7xRszHJUna74HuQEpkTsmfp/3eiY5XI
 vpWnd4FXb8FuhG98sKF/qzBmhWKXCCoUYhqqoMxQE5uBgVXkeD3iSUPYc887v1QzgbsFPdGF1X+
 XPuza6aAeKEFG2vW2H8wPP6BCz9tTZkb6bNHfL68D/7N+UF2OlfxDe+Bc7NIvpiu4xwDBL/BxSF
 A0DQSsLAhWvSIdzhbDRcAFVszTHIDLfEu0Eau07CuyVjVmAQvisN/uiuM71qyYJzguU9LrISpLR
 G8a/DHhri0r5TrtPLbXbdvohV+97WNil4UilFgUVgqdmTayQ/sjHJa9eajqXefWocZhoZ8En4m5
 kGmM58rkdDG1Jo11dfw==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6accfbd2 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=K5Q5qJNcHL0jdGHZGqYA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: zVRBQIIlJHiR5VVovn7GYJERU6PHVrdb
X-Proofpoint-GUID: zVRBQIIlJHiR5VVovn7GYJERU6PHVrdb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> Closing brace of a node definition should be indented like subnode
> name/reference. Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
