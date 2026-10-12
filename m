Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6754B49B465
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818541; cv=none; b=hpOUEGrxKrdfT3s1va4HzS/KhXwo1qY37x6ASIYlOJYCvGMnOxlFiv4F78tbbhgWp+r6pIqClyhu49KAXAzNoBb4ICDvelParqMV9l9/XzKjuNoM8Szbs8tjw1rFxmXVDAiV63geg/24LAemmhXWLJuBZcJ0lUnNmkqklbOLPTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818541; c=relaxed/simple;
	bh=qUHymudqOxW+3gFMXOSDY6oK6hbQI+WbL7Nv0bj65WE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZIvhk5ZA6K8sx1sB1G90emHUx2vt7lDmv90/P6J2kGjzED5b0/qgHKvKqt1XxKvbjCA+552d51CNmgZcrg6sGx44UKauFrrobQpw3mQieQleY1HkrUfzijniR+bh3+6l+RANG23RJZfPgC5+1UD4ChQTP69NazDuCBGAQx4SZJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SccBIs6D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XC6bOc6S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SccBIs6D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XC6bOc6S"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0A2b1686404
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:22:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ea55xuV3lMRyuzouV+ZXNafd1uMXXbKmpclQk9Yn2PA=; b=SccBIs6DECs4Kq2W
	oHzyREKn3F48Fg8gkF8EnueIHU9Qzvlw82xshElEdbw1kcuL+o9iSM4QyJe+6Ee0
	WGzfWSYEhTjb6Ai2kvRFtJvP1ONxcSTqURzoufPMtSl5DOuu0vjKXFNtYRXskOXQ
	V4iJKX6Iy9cfEe34Zlu5CsJ5v2gxYXofFuVu4UVM+awbPvmI48c60qtj7w0lzApJ
	xeH3S/iB80DGTfw3VkbJ7nbtv05pru1Ku/4Q0pGLm7aRyCy3Flm6PWmOk3O20zKo
	FVlzbcGUJiulq3Cn9HZEbJW4Rm2Y1AJS7KwEGtjx81QJb/U/ZJqv9bgcdnwnCLdr
	UaqvLg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc1f27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:22:18 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5d44237e2faso57378e0c.3
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818538; x=1792423338; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ea55xuV3lMRyuzouV+ZXNafd1uMXXbKmpclQk9Yn2PA=;
        b=XC6bOc6StbL0muNeTbzD3xIuPcE77jc1LJFmv8M1uV66JMCqYyjG86yKlITFI2XW0l
         g5ARfHxFT5CCaiXwsD3crIpc7Mc5locrELVyiWkoSFuSZ7rTfKwfo1Ps+YWY3/1h3uf9
         1vYbrFmAJz9EpAXWQ94uS9SkRzDVp3BiqCpI+tadaQCq92OmHSXsDRWUx72SuAZMZxN5
         49suDjK9sEEohxbFpEjTAgdX+PQIZEVrbSBulOz4tMokPwGwFn22S+qLQKDAJVC6TIZx
         ie2Ke6WF6d0bkx8dVsTvGYBbzaMtdPRFVT7VolS+TEl6k24vVEHsRzWkDX34as62yfcF
         q8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818538; x=1792423338;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ea55xuV3lMRyuzouV+ZXNafd1uMXXbKmpclQk9Yn2PA=;
        b=GRm9hBDFdsqjkmQMNf75sYzJvYfJaRP6Bk+bW8ol4hDgbD3dlN1k/6/E6HYfMEWIVq
         sVp4/bcWZtmXq4LWoiIuFXowLfpdktM3E3eE2bLD2HL1BH11+g1DdJIS/9z2ZEaXxT+f
         ukurtsvt52/EH3Vg+61/vuOo8DM32a7sdhPeIDSH5M8Lac5Csl/mMfnWIno4QKDgYDBG
         dynwEpcpZ4094vStf79kl9OX8imfudLKSiXhDcIcWTwXzxnggXAKrsKFVFnRMjQi3SyK
         co8mFvX2nI5TFZTxIzngaeLv3ayKUZ3e0W6XnARI8flCNE/QwsQCE1pol8vL0xi9BxKc
         Dtmw==
X-Forwarded-Encrypted: i=1; AKwUvBwNFTsPQ3PIxFdGrhsgwXi750YIHH9CcmGXVKwD/wDkhGxU6MT5A7n0WSYMeG+x31SRyHklL6I0p5tC@vger.kernel.org
X-Gm-Message-State: AFq9FYI5znqL4XPVb15wRR7a+SI3LsBm9c5BQNZtVAW0qSF6ryXWFIir
	CwCb+Gw1b2eBrcSyKfBRJpqsAqLmAgqCkoqHlhOF7QCB90hGmpFkR3q8r2ftSOwmLLNyGFHOXo2
	IC11dMeECF2MQxGGPjPkbRKn5XAOMFFFQgaEsG5qzKvgAZ1F1Wj50xvVzIN/ZuLYfTG/WliOg
X-Gm-Gg: AYBFou0+gq77s7nY+WbyPhqNf/hscCyDdVzV0Zi6+nfnxoo4FV9eCvNX3OKvLlQVfC7
	NSWyQv+IxzCMPjj81f/7hWqdk0vLNuiKoZep0+dZHmrAjWtfvICJkrlFLoUcJkugBoFi1yeqxEG
	qlhNZe9XJWMKdR47IhnWqihDJrP44tAcJMlGEq1uNh67/0EMlmOYW9MSl1MyDedu0ZMS1LRkWIX
	cikaghaim4i/w5vYwFPv0TT8+vZfraK2oxJVZ2QO1YIPVOH4hb0iTqBdjnmrmMf/Hb97bhARHDo
	17YZL9PHLYMmAssT7q+AaL2Dp71kooGFzrpkyzIL8nK4cONZ7N4hAg2MdZ0/WzGY52x/+bOFJol
	tYZ6lUS6WQjorgG2+q4zdAA==
X-Received: by 2002:a05:6122:8111:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5e91efb84camr1972692e0c.0.1791818537614;
        Mon, 12 Oct 2026 08:22:17 -0700 (PDT)
X-Received: by 2002:a05:6122:8111:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5e91efb84camr1972643e0c.0.1791818536862;
        Mon, 12 Oct 2026 08:22:16 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a74bcbsm478161866b.38.2026.10.12.08.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:22:14 -0700 (PDT)
Message-ID: <23e3afd1-2aa4-4b49-bb47-3627792a0a7b@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:22:13 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/38] arm: dts: qcom: pm8921: Remove superfluous empty
 lines
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <3ad783a0b4f1f51e801b7c108df23f5b28893f29.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3ad783a0b4f1f51e801b7c108df23f5b28893f29.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX1J5QTgUTyHfk
 X1Osli9NfIBhrRwZcKwm3CpBloLYQAkIc651inj/uBL2BYvAM20rA2OV+I2RjGOszbJb5hUlVE4
 CyHLnpUoyA3dYdxhTtPgc6jyjpZbUd4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX1wrVEJ1oubAE
 Aiepnk+xCf0WikMkX3ZpOL4R72gEzMl5gjJ79FfXf1E3VGv6EsRoCtW2Cmk9oMtyhvxy353+8Jl
 KPhR6vNEOYUm6FD+/MoQlyNP8NxmEYsLmcir/nrV2gOpJWgzcKm2L4Uo/Cuya16YVLRmSvRCcM/
 YbVrF0scIKOknOFuJRGA2zi7iNJqMV/y3o4dfIV47eYmlvsuzIBab8p249WW38ZFok/8JUSZAcG
 35jFREqzChhK728etVEQuYJQVvWttkhlekKPPJ1SzaIzNf/YnjETH4vfgSRLqb369O+WuWJ157R
 PiQYISGPPW6TtdLEjEmC68tj6CY1tZOVy9culHvJeKvm0X4WIobQY3NA0im5FM+3tg2GDlizApa
 2jATyCfEZYWSNpzg+AqsrDRkVSd7vISeRtk9jVtVvP8HlIg2oI5MialdLoaMB7VIbXz24lALtaM
 Ngm+WF/v7+jw/R0RTqQ==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6accfb2a cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=YXrApte7LvgGaje0e3AA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=hhpmQAJR8DioWGSBphRh:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: wcV0rNEtwJinwwMPE4xNUnFKO2XNDJuY
X-Proofpoint-GUID: wcV0rNEtwJinwwMPE4xNUnFKO2XNDJuY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There shouldn't be a newline at the start or end of node definition.
> Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
