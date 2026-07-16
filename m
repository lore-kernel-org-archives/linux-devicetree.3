Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5AB3D1718
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784224371; cv=none; b=M9f6fh1IMM0BUpzLD3DS+f5gp9YYwarF9xWRhyRoL6VUEEj1HZ+2bT0OdlxoeF0lmYdc3w63XFJ7x58Kaun5EnDiaQlecGlAJf5O64FMCeteBxMeFkFws9UmXTe5pzzu/K1WQAj1iHA74fwFxAaEZVe83Yrbfuu5LT8oBMPP6kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784224371; c=relaxed/simple;
	bh=NZCNiYO94KvxuqiQja332pdoXlvA9ioYr+WhJl3k51I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kUzC+pAa8qEDTg/OlkNrZ1RGpxddvpvWLmKXbyVNgyRbWon4gpBTJWB3BYf24T85hGirmmJxun99nmwhp8lomouKZ8SfgToOl//j5Uvl+vRDXR+I6bXtdktH7jPDdG2kIwVvsJzo+YhFRl6FHDMUW22fsMHDraFLFU7DVKFNxu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hNv5KO8a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ADNVFIMR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hNv5KO8a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ADNVFIMR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GGScYG3002048
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gw0Z1SHVJFulCM5qmhp13k8lFUDxKyCXU7hcyfpRyLI=; b=hNv5KO8as1Wn9/Im
	tAQFXR5T0bEUkCSG/2enZbrl6GXyJAyQZymCKMm675FWCkPO8s/U5iF4cn1k5IfW
	m4tENieCARqQB7BIxdumj7mZuEgPzs4CPB35XBndyYfNpqViDZLQo4f8I6sWJa7L
	OuXnotAIRbSaZuSiZ6HghlZYgWdeBdmfkUYTI9Xjtv5hkJ+EGr2Iw6BTC5x8YSYj
	Gch9K5Db+Kch03UBRo4xXPGXxtumdSVq/fHArv3wmiY5XkGT3Q0TwE6FosdKO6Tf
	gMl56bVlUrlIlWpuH0pvvIAMJhplUfBiR3JQojOLFBDK1OOYcEm9OPnZA5O13jJm
	2lH85w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff1m9grcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:52:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51e9d892f0dso3608711cf.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 10:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784224367; x=1784829167; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gw0Z1SHVJFulCM5qmhp13k8lFUDxKyCXU7hcyfpRyLI=;
        b=ADNVFIMR2GJ9UZzWGylFkBguwFJMgCm1P7ZEsRxGPNCtMr1evAy6Uxu6Er8RRegIrc
         zDaebEKe2Byk14LGd7pnMzTBG1g/dc7DpRAsL/NSs29P6X/WOH4cHsRb7TjfDNHffRLS
         7aSGqTuvyzqHUcUSZV9piPa08+mJqrx/jMe5b6H4iB7+vK8HY99sZfsAA2GfZEBTGzMz
         GNMlvS+3jOf7nyhYRzocalc50/qeyqbc9Bp7aLiRd+4u8qND3KI06n58x9GUCAqyI5VJ
         o2U9m9JOdEJy3vhxO3PIdUliHUSIq96ieW2i/Udq1NSeGFpvbtPM3DI35A6q7Pw8cP92
         jqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784224367; x=1784829167;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gw0Z1SHVJFulCM5qmhp13k8lFUDxKyCXU7hcyfpRyLI=;
        b=gGu/fiKCVW1W64j2307lpdus11W3nFb3sy9U8A63AyNP7mTTrZghRAzLZYlqszhkju
         H+l20ORs8ck9epPcfXSFtikaWDrA7kBmGpntl7QFDBusUtZNOBfAIpDQ5dQOaiPvHmKV
         gdiiTbagT20igd6QRO7MB0zRPZigv9mexa6wK/QZdQ9gU2fxfdXsTDyKymaIaOq4bJNC
         glb6s1akM4bsDto0OQs5Q2F2dy0FAocM7uTZSe7uHM0q4S7jKscpOf461+6GIXbSRpSg
         c+/L+9x+yx2noC14mqkss1mGU634i2cAXB+KY9rtgtZlxC3T58up7NxkH7M62F9iL8Ur
         lCLw==
X-Forwarded-Encrypted: i=1; AHgh+RrMuiCBjdhSGHXqgZN8aHVvTfyyqJmeGwau7hkGUrrlnh0Ht9fMmQUtkzMiwBnAH7zBrYQxzRHTDvvS@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9YzV8YYR1tUlucLeKEBPB5Yje5021NWPDClLnBgj4wHKGxWvg
	PraBa2luq4PPLDMeJSHbKTm8k3cIyKC6aTU3cd+k/mz2/QfO3X+YqL25vP7UKAgpgRV8n0FHJFd
	19zzRJPCLrOHkP+TjBK9LMzrmrA1reoxSTSMSoBq8skV8JSRIyYFkwknv5bJmsYey
X-Gm-Gg: AfdE7cmWcqD1VJI0uoPFZhKo4rMpid5AxXoCy4cwNcRgadEBgqLsmWjYhbeIutmkX7b
	/swki69+ZNGxDIbXPSvNJSE8Ic498qr6Xs7A60wTaRGhyhJ0bWMk8mweBI0edmGDol1W1K05FGu
	9AYhRrw56R/Y38c/2IIIDjIr0nGlYv7YI/aWZiHb/4X4nD1UGDzQkeCUW+v3p6otUP0Ux3Hhayv
	z0stFfZdA2cuDfDwBEazfzaqP49Rz4E8lUEVQwQQcsznP0A1BlHHFJ4/69kwGbT7xl7sQPx3Myl
	haPmIPO1UBWPU9bU2E6gOB2xat5aXiTuTbIdQK9EhgGXuMJZUDb8NJOc1jCiWa/nPRbPpZJOugD
	ghX/Q8leOARCwq5ASigF8yqRW
X-Received: by 2002:a05:622a:55:b0:517:6162:daf5 with SMTP id d75a77b69052e-51cbf0e6270mr189443371cf.3.1784224366756;
        Thu, 16 Jul 2026 10:52:46 -0700 (PDT)
X-Received: by 2002:a05:622a:55:b0:517:6162:daf5 with SMTP id d75a77b69052e-51cbf0e6270mr189443181cf.3.1784224366386;
        Thu, 16 Jul 2026 10:52:46 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168749d7e8sm245027066b.54.2026.07.16.10.52.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 10:52:45 -0700 (PDT)
Message-ID: <2dbeef11-9572-4008-9171-fbd075f5a459@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 19:52:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: ipq9574-rdp-common: Enable quad SPI
 mode for SPI-NAND
To: Md Sadre Alam <md.alam@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260716-quad_dts-v1-0-74d86792944a@oss.qualcomm.com>
 <20260716-quad_dts-v1-1-74d86792944a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260716-quad_dts-v1-1-74d86792944a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IMIyzAvG c=1 sm=1 tr=0 ts=6a591a70 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=GgUwph42HZ_mPWe1onAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE4MyBTYWx0ZWRfXy0pZHFSDJWGJ
 RYsdfW2PRW3tIi0NyeZIgJH9ah1pvvrj/JJvffTPIH5X4E6EvcHULirwPh6lHfwoNjk3baHxfUH
 k9Bb124e8XtykbqMWYRchjx9qkNy/lAaGQqvAoyd8OATOtbfqfew472eJV1DbHUVSOGlbRjBmNZ
 OvkllSbgkugS4S3pLdlKd/lwJ7OuTMov6kC8V8+JyJ1jdLaSZ+SgSEcc6ODwrd9WE+BHTfY3d8y
 5P8amOde2fJL3VSy+McKtBAmCop3JcWsZq/78Eoo0fZ3dbRVrzDt638OMggsZ7swJdQLPKN6UGl
 qGiXowVrMzRXfQ14Z6qjUKUW7e5ABn+EU/68MxSD6N2bgZFcC6eW8G2cO5RQ8+1u4bzLtaaDNC2
 3S388MoJvf9lyD73PRxatmUaB1Fv3YAB7fOLGu/DoNbAJlkWX72ioEnKUSBANLNr/0vwoICeR3n
 XbmeMIP2FiHx6XJdFoA==
X-Proofpoint-GUID: q10Sx0_L7VuJT74dBmw_DC-m1ndF0pqW
X-Proofpoint-ORIG-GUID: q10Sx0_L7VuJT74dBmw_DC-m1ndF0pqW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE4MyBTYWx0ZWRfXxRiq0Y7ZbiT4
 eN4nrrMygE8lCHcDLLsmGByw19jXvxkSTHla3sgbRD/1U0b6G47/HrY6TH+QfXIYTF1Vu/q1KNe
 jBuNjaFLNOkFZ6+lOHurXqlj29ddlUA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160183

On 7/16/26 7:55 AM, Md Sadre Alam wrote:
> Set the SPI-NAND device node to use 4-bit transmit and receive bus widths.
> 
> The board supports quad SPI transfers, but the device tree currently does
> not describe the wider bus. Add spi-tx-bus-width and spi-rx-bus-width so
> the controller and flash can use quad mode instead of single-bit transfers.
> 
> Signed-off-by: Md Sadre Alam <md.alam@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

