Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794235678;
	b=w9RQBcjksY17WhTOTi013CAtFg2D2cmgxnYuBHwzFMT44Q9B35UrvuCugvo9CTMl9FTf
	 N3WaLKEmXQcUBMGxPOS4T7mweeKHtvdvXhimVZCuU94Gs+i5NZWt40OnjPUbvvdpGqdPh
	 ifXJty5o3K1AjQ1KRdSw2R1vAiMZNxPZsASX6JHSqTIqkEYNfq8ipm595PuCYFi6dlvZ3
	 g96XO6Q7lffttWIVStOT1orvf7sEcMbLXjEm2xLHFE7R9IN5yD4q3wAJtpXwXh9WC9RlI
	 DaWjZUqUH3kOEFc3M5rTbPswyNV7NqPYDV6QmTmdo6k4EhaYh2OAT4IMEly4JyycNcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794235678;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8S+tQBGffx4GavU3iQOwkuWydZ1DqkTiSiHsOGPzy7s=;
	b=tNV9eIQQx/TjD70HEuUQXQVxxHPaUNBfQu0viK+q4CIytxNI9s3viTgfI+ykEsepgG8m
	 edhgLLf/yfRVfLMnzcTGXZ2QdeLQs/ChIhaYzFH4J6pJvivYrcT9AjEbQ0tq7Stnn80qD
	 cXFf0BppqlAR2ij7QFV1IZBOpDuQCPnqBZSGfhiRNmMj72WInGWxYxNDRLD6zIdYMDvag
	 k9zt44j+EN2COcbLCL2l53KjReMDi92KLSXSJPm+lOfUpmqxC8LBp8N44CZ8oEf0ol3rc
	 Ao7GaZ6yKt8jw+otb5ooKAbZV+4tyd3S5hok0aGzYUB9YpE9W8mned5MOiV0dYQberw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V+4ERrG5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S2pjMzPR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D489606D827
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 14:47:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D489606D827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V+4ERrG5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S2pjMzPR
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFGqZ971371
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 14:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8S+tQBGffx4GavU3iQOwkuWydZ1DqkTiSiHsOGPzy7s=; b=V+4ERrG5i3T8g0Fd
	Is/6bobd+s8g0yAgT8c5rZRtQeeTMs+UNr/k0xVQZu5BNGkn07kkYc3GFwGBdtfz
	JLXYbROt5NleJlGxig3qsGMChILhk5Z4FCqqRbrIjzagCTEvdWQdFS/fFFk6WTFI
	uDzWWSpqUNF3Hw1uQD19qXqneF5LTVK/saAZEWmJvYq4kETLsY+77mpmi18JtOuv
	uvkrQ/fOKX9yLnC34jXUpzvfpbh7xR7hHNljYZc68x91gD5lrHhVpp0SNtUDceeX
	XjACTel0HmBAMWfM+WOOsyhq/wl+9SLTUdt/OC1t7YgQ7ofQTdZgLoEFYxi7cp5u
	fF9ibA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4htuqm3mha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 14:47:56 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ec78f43e7fso46240e0c.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 06:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794235676; x=1794840476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8S+tQBGffx4GavU3iQOwkuWydZ1DqkTiSiHsOGPzy7s=;
        b=S2pjMzPRcK7PizpyndcnuqX45dBp8CIovaRSNNuBX7eBmnD2i8or5Bs1QPDfm7cILf
         zeH1OA+T+P+genmzKRje+D1g6/wK4iFmYjluBKLit0GlNlICEQkrjG+GhUo4WNMyy/Hg
         C/P9313UDQ9175k2lkmYHIWL/W26i91i2PPDnHDd5q1ekCCKVr/+A1WetLT1mR4U9uJE
         K1ISocMQghQApfqDJgK74CD3yERp2hj7Clo0MlbLoCb9AG5kHTAMxijxqXBNua2WV7cm
         OgLEoo6NugNaQOS5lrgmEtwE3k8gI7bJq8jT+3dOeiPEW182wKipmDpxEMaE1miu5FSG
         MK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794235676; x=1794840476;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8S+tQBGffx4GavU3iQOwkuWydZ1DqkTiSiHsOGPzy7s=;
        b=SZ7jayBn7Fc6saZ09JfLF+zsSbiQeKaW2i3/9Opaaxbu0oFwdyvAKFBn7L0DaIdUnt
         SIdUlH/aTL+4erkItUc+73gQl4Q7Bt6vUlXSKj+uAy2pL2ygUm6q3AJcrtDFDci3yaLw
         QbHIzc9w1EC8TErTwWf9Jquf1y2rZpcS7pk0Xz+rX9bDXI+/i5mtp3CmHJ5dqnfz7w/u
         JtTRgNvsjF1ep2h7W3s88+IcjcqmQTT4EAcg/AAESRbtRI4SCIG3qk6ZEQxj20gAr5ue
         q9OdAh1IfNskpdciDiUvALpMbskd39JYVhBX29XIfJbAS54wYDfg/oRyMzf8vJuJ0bEN
         J9aQ==
X-Forwarded-Encrypted: i=1; AL+hErG0ijWX1Lt8rf11Tc51/rzehe3dMAvEBU2Dys6svydtyrIJc4D90CjuhPXKMvDiR++ZEUsXar765GLM@vger.kernel.org
X-Gm-Message-State: APuU4Z+gkZSkyU4mP2ulT9c1hqu+QjF6b3aOSl03GDWw1nUNW4E7w1jf
	zf+gIFqVYTZ6UfOxXaO8auG85Q0Abm8dHnSVBSWM1ugrnA+lOY+uS+hEEfKxm16AnGvFIeV6uDO
	84Yd3Hx1bvO+4NwSK8qyKAfqCvH14Q8l5AbFMDgQbuwyHop4vwbFSIP2tRivuc1Ph
X-Gm-Gg: AYBFou1O7/yatXs8IPAcCsHSK2CfSxcby597UPtxi13vrA4inhhVIDb/ziz7+57yByX
	8vo1ACiHQBOokftcaarAGrwA5V90x9AN2HllKoK4PXJqk/fwGgfRQCQM7UM7KIlxDDGKhvlm6rg
	FzpAbNLQowGwbCHcy1UzOt2SZC7YKUl+sueBEpNgbIERa2GosQh+j65ZQRxNDpOEl7+a1yv4yMF
	RrAL1SwAWKkJYhktErGIz+tGKPyWRofQ+kmy09fbOKan+LjxjML+0m7ISKXpXWCbrThtUDxr7qY
	LE9g9ldm/B7reLUGxp6CcGhbf67637Fwkyg8wrAoZGHWClgWJ6SgrZ66Rl2FDdYw/2d4LtiRsEo
	PITjCdMHXo+O/otOFxjxbDDUaZkTjZXBR1v7kLNhrk33MKtzmptgyhX/yxT7Gzj0xR068dA==
X-Received: by 2002:a05:6122:62c6:b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ece74072b6mr1736238e0c.5.1794235675547;
        Mon, 09 Nov 2026 06:47:55 -0800 (PST)
X-Received: by 2002:a05:6122:62c6:b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ece74072b6mr1736221e0c.5.1794235675113;
        Mon, 09 Nov 2026 06:47:55 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d69f9384csm180195166b.13.2026.11.09.06.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:47:54 -0800 (PST)
Message-ID: <8015c245-5bdf-4088-bdce-7e81b3fa440e@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 15:47:52 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] soc: qcom: geni-se: Define the QSPI firmware protocol
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
 <20261106-qspi_upstream_series-v1-4-21f43042dd60@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261106-qspi_upstream_series-v1-4-21f43042dd60@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1OCBTYWx0ZWRfX88WwxNp5Ej3U
 4fNvnoOyvTd+sAWJra5JYi/5yIzkIutc+uItekEJO1aoxUqM4XKIOVoPVLKO8tOs7OoVv0gvnru
 GfwqjP23wgNFo4Ok/2Rdjo8pJegTlYw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1OCBTYWx0ZWRfX47RYzd8cxCI1
 n7H0PHXho0j/6CDFdZS6MHQMCTEq0kFYBXZq7hOvFO6kJDK+QAlLLg5CRGLlwKFBZ0iD5thQf+3
 BmkIOC734dq6dBQxaaH/zdGomSrUKS5n8lAv+rL7jy9vjSovly5Z3dnib3/oCYqEwHKUrrR+HSZ
 ytNI0XfF3ebPMG2xqAFXtwhWBLNRbni7C9d/eV/zbo/nNanT7ExS8Wh3asNnp4Lgp8EeLbOPPfV
 eBYUEhIskgp2mYJ8ctIsPmvwuVLDq7s5kH6URnNMmVCWZOxdwPEls5KrEDHQ08AXK1SOw4mP0++
 TR7FAvt8xyjkpdltX+uXNIdhVEKJd5ErmnR0Rp7seaQhKzn5NR1r5rU/oorG/XycX5iy/Wt21XI
 anB0dNl0B/IlW1JcnQBJn5O1BLBNmilngHWocfXas7izNuNQJgp1b+sFUCxywedEtpGhmmb6E8s
 H4EVTvvSaOCCcNLhAnQ==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6af1dd1c cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=AQxZ4Z-7SMcdX-UDKNcA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: gu0eOukdfnF1_dhCu45GQjXyEhI00D1y
X-Proofpoint-ORIG-GUID: gu0eOukdfnF1_dhCu45GQjXyEhI00D1y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090058

On 11/6/26 4:01 PM, Jyothi Kumar Seerapu wrote:
> Add GENI_SE_QSPI with firmware protocol ID 9. The GENI SPI driver uses
> this value to request QSPI firmware and validate the protocol running
> on a serial engine.
> 
> Extend the firmware loader's protocol-name table to accept QSPI.
> Reject unused protocol IDs in the sparse table before looking up
> firmware.
> 
> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/qcom-geni-se.c  | 7 +++++--
>  include/linux/soc/qcom/geni-se.h | 1 +
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index 873bfbd6b2b7..396f3d81d292 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -122,7 +122,10 @@ struct geni_se_desc {
>  static const char * const icc_path_names[] = {"qup-core", "qup-config",
>  						"qup-memory"};
>  
> -static const char * const protocol_name[] = { "None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE" };
> +static const char * const protocol_name[] = {
> +	"None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE",
> +	[GENI_SE_QSPI] = "QSPI",
> +};

Please use designated initializers for all values here

Konrad
