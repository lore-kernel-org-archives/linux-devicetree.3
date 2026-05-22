Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C6437AA78
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779452084; cv=none; b=hAsShZ/fIMVz1pNWEmpNXwUIN78YL1e1PoXX4N6VgQaVgxdEFn3v2+v2jJ5eThjwH4S9qLm+TZ5PrI/Eoxgj3u4A8nP/hJzJ3c7iMYbBP/fjqoP066jCoC6C91Xk3Wg3RquCqfPhqkDeJm+woQVAvyWvOPfKGph+h91swDoCVbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779452084; c=relaxed/simple;
	bh=BoewX65LG8Pdfndl1vDtiqts2qaJrLH8LBPXD1duB8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HGegxwj/X1bESnq84lxG0bchpf6VXnl5eFerF8K3ZcF9wIvekKJV8ocnj4+c9SOoL6+iZbHLKdLql2i4uSv2x5jEWvwlOe8VQ33bApswR7qpxs5U8D3kwy+4Hi2RvS27uaglJDexQiulND6cGVvdZZhCnFXhQr/GM1rLTetZ4Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FugQIAt0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AT0CMmra; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FugQIAt0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AT0CMmra"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MA4HAJ3947594
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FrOX2NAuJ/71Lo50yoEFGRol8WMdvMuDoXrsc/R/vY4=; b=FugQIAt0Y0vZOnpn
	3T4xrzy0T2ZCd59gvPtKOItV3Z6562kZxq6ne01WslIBDaqAwycNCG+jBxqLG3fD
	76TRkOJ7WqqH/W8YxcNQ9jyci2SYoO0DDv356X80oj6MAoAiBLco0NwYRdkm5TEH
	Mxt6oUoE2ZdQi85xeRce42m36z0uJEJztVeNOjRYlWWk0+7FxW7wUAovxXm5LmoL
	y1vwJe/xPBlAeplVlRb8Nn5jiHZBIjZsvA1rnWLxUQViUUu+mHM8hoKaPo5Hri+1
	1w9mNh1G2rqFbOE++tWXIQBVfo9wj2WO5agXSJ72Jw7exjsuR1CX75tkvtXtVmb0
	xPU+yA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean2ngduf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:14:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb39de5c54so173671785a.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 05:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779452081; x=1780056881; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FrOX2NAuJ/71Lo50yoEFGRol8WMdvMuDoXrsc/R/vY4=;
        b=AT0CMmra04gdQS7TxPA2TwODQeE+eEjKn3n/pccRmJXWHN8ifSEAgznU3t5ZLpV9qp
         K+H2QGLFOPfxNLg5Vai0PV6eEvgrOphRn4nhs3ttUW63mikqjFOmmg++vgz/H7SfXDFF
         iaZRB78MTWfvLQw4U94T8ObQIY5m+YvPeHTX0NKK/PbCyhiZuAuPDlAEUN5ymqdGj1vM
         w4MX+ieVTLSTkqCBTHyFBpgG4khz/ijEh5SdswLfleNE6FQYJ37L515Vk8mR9b9zlMTW
         OXPAxVhFhC4JA7Rk1kH3hYivmUjoYQzpRUkc5GnD1Q3iwGqkBXEogIdVrUOuN6+aghrL
         ksBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779452081; x=1780056881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FrOX2NAuJ/71Lo50yoEFGRol8WMdvMuDoXrsc/R/vY4=;
        b=S78Q0Sg6xSrOmY1nJ987p8fHKSEGeqG/21kt1w8ZM0xN6S5RDRAMwugCJPtCFH+W31
         2SX7TAYASjQPE61i6GWNwVx0UyjERj7YZCgCuo7+TAj8yb0vH2y30Ayop3ovWqGgoSbn
         VZP6Dyub+3BapBwwItpF5exYtp/mV17lkUzrWM8idRGnL5P7V76hA32gr9RbRXdkfsis
         MRwv4P3Aq+N4GlXyaEwQ9O77msuffD1FrN0Z6+tzH4YxNKkjMDTrt9SDR1PCdbBNUcX6
         hwhtH9bH44mUfuxZB8vTLc2qw9UZ2xflwyw7uVzUX+oyQMlMqORyL0rOHADvvsu60sy+
         N4dQ==
X-Forwarded-Encrypted: i=1; AFNElJ9x0zHlWT9GZoB0lCSfoowztcWPqSTINCK2XG4NvRdiExPEV1XHiFqrV8v3Sna15UdT6d+KzqvUZqa3@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjf0PIQ4ApznvpI5WB/+DJuuNtW8E7HckOvfLHzLzg331ecQKY
	UVy2PaBtMa1/7uWeEaezyGvf5vrwdylW4zRxmLjFppjstDDfi71fV/idQp4cO+TAfSqn4qkcj6z
	weemGyzGSb8nb1sQ2SrOm2Y7N8LIHZ4liup4LgYGg2MhKXN5Rsv7eC96PHoVzrgEy
X-Gm-Gg: Acq92OEujI8LN/72sXhZPZq1g8W+qu65iJ2bz2lrneeSFXOivrWtepjJxXwPsnOvZXu
	Y45+hFUXdNk/7lIeFD4m97b891Hoqkw4LYfq/j8Rw0osjInoi03/6X/ZwQmzvE5ImP4fzRuPxhv
	Q6DXUVQfXKwgDlb2OJd/PSBHeZsR/UxaIvAz7z8W0YFefvLHn2dgh6/xWmLhnRwdiXsVDK3P7kG
	WtgN4HZCC3kXuT9rF8h5zyJiLetanR5G1+JLz1vnOpvO9Tt6sNzt/Bc3lLgR0geZTLLe8mCn9Qy
	OkXzGTtOA2jYQf/fj/AglZ5NSHEqu6mLQ8LKgJTuIH7/DtrzC/SDWvBvncyA+CWQiMBLi2MFvQw
	sc8aKoqDJa4kx8Grpgo1Yxk2C8QiTvSK4xktU3TUn4Z43Zg==
X-Received: by 2002:a05:620a:2985:b0:914:aa0d:aa79 with SMTP id af79cd13be357-914b4a2ac9cmr338174685a.6.1779452080916;
        Fri, 22 May 2026 05:14:40 -0700 (PDT)
X-Received: by 2002:a05:620a:2985:b0:914:aa0d:aa79 with SMTP id af79cd13be357-914b4a2ac9cmr338170285a.6.1779452080513;
        Fri, 22 May 2026 05:14:40 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc264dd5bsm50436466b.5.2026.05.22.05.14.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 05:14:39 -0700 (PDT)
Message-ID: <5f5950f1-397b-4a7e-b88f-b6b74388e310@oss.qualcomm.com>
Date: Fri, 22 May 2026 14:14:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sm6115: add venus device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
 <20260515-iris-sm6115-v2-3-2ab75229de61@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515-iris-sm6115-v2-3-2ab75229de61@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XvDK/1F9 c=1 sm=1 tr=0 ts=6a1048b1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=N9Plf5D_esIoL16y4e0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: kAzbSmipyPvQJsTXvLnduuac2CMElZzu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEyMiBTYWx0ZWRfX45UjmabojbcG
 JE8bRPIzMi8xjbcyjuzLlSuxoLdIEi2q1+B+770pX80NQ9K1mIn2GLSG8uwppeMlEltiJBICx7C
 L4I9zlm4IjJDQjqHJpdP5Xx5T0d8Y5lMDrbe2/MJw2foIJXyQ1M+PESokabzCzmaJZAkdlvO80x
 gjV1gM9jmbDNPWV4QcxxBYVADgvZN7MYnyghdGLZlMWi1VPX8/3bk+nE6YEeAfGZz3xoU3cvXt4
 Fh1ViqfXEpprZZbqQCMKr6GjD/lib2EyZIZnXuJ9bDg5ffMGO6sz0v5gTIVq0mKTejgPCxBMLyX
 b2wyiKeLwNLgB2c7sKnnqNFGrd0mW7Dpsrkt9O0OLEChyjx6ax/69pyCSzKHAL+pXxi/cwHW2tz
 BOj84mVoNHXDGbI+f4yEDsAIy3kF1QdO1UWgJMjbAGmzTv6FzOKech7UBavzM7KPaqj7gsOpWyk
 2qFVl6orRWbk2ypF4Cw==
X-Proofpoint-ORIG-GUID: kAzbSmipyPvQJsTXvLnduuac2CMElZzu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220122

On 5/15/26 1:59 PM, Dmitry Baryshkov wrote:
> Define the video en/decoding device present on the SM6115 platform. The
> core, AR50LT, is mostly compatible with the one present on the Agatti
> devices, so it uses qcom,qcm2290-venus as a fallback.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
