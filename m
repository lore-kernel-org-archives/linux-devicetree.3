Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234820;
	b=iu5IPnS0zGj1YUiiv3uKHdLFvRHYDnVboMWln+kkPVrM9q8cAlswiceacWDnxceZBoG0
	 tEoMHRXY3OXHSIZ4B+/dbi6uAgIbbQ/pVL5eTMAIgqZqdXGD9+3Y0iKaofDYfKJi0Ijon
	 vwXWr7dFDz4LSqIAVpiGUxe+pubLDSII9dmzkGBHtsvh/qabpfRVlckkaoRs5zEyK73zc
	 KzXhKPZC0hEtG4d9maCangjOBtqHzKr3mQ+zjzmK5G4JlgARoHIlx/a/QXzeormyJTE7F
	 FIBXN0nc+buXFDKrRKAFNRuXgdffJZX/iSQnwT2clkGjRW397iefUCfZrdHFIx9Oetw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234820;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LzdcUGnHa1JcIxlDEp+JQ+iXSi5nkLn3zmwF0wQSnvc=;
	b=Y5YweZQ8HsE1u4hjCB4f+R1TBbmecUOJtryUhzGr11i0ncMmiAJJQiNHcNvEIz1SvMkN
	 veJq4HB+6umqvdzk9itKI6ZLjD8WWOxlnDv3KG9QSNLexKuTYLeLQHoPd1h5iRUa+zhBI
	 b6+A77MLEUrow2i4nBIugP/LO2KdFMqnCad9gacQvNnompH/2TRYsBfPnAW60lb4BtgxK
	 Pzgry+0vgPE/ZrPoQKpmspMTnQRJy5qPuoO6L1sCqOghmTBlyacCQQLK9HTY1J4/FN/z9
	 6F0lN+diVsbdTw1DN/IKpi2LZuOU0rUbbkjmev23vihq96diB5jfUSU8DX8uQcZbkHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LA+1xtTA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RdLsQJ0Q;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AF4606A33B
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 14:33:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81AF4606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LA+1xtTA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RdLsQJ0Q
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DF9wE3461077
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 14:33:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LzdcUGnHa1JcIxlDEp+JQ+iXSi5nkLn3zmwF0wQSnvc=; b=LA+1xtTAJJxIVMht
	l/U6UzdQc712+X62A61o2OXNbrxt9nseabB8UoVTwbxmp2DMA+narMHLKqgv21S3
	H+GcaS+du0uQSGd8cprO9d+g/ncMNIl00x6a/XuBgWAZUKFNBB+HOeMuHJ7l0vQm
	FIr5Ow9i+7mPHkze15zhbAlB8QX9ayArzdnIvv74RZXkGSuPi1cVA2vI6woR8Et2
	jC7ZcbY4VR5TfD0Kx6obAkKlNWa15YSvRHVOHS8HSNLcTMctoNhtiL4jK38usNQo
	VRJIkytT3TCG5ndGKreTXgrY7CzyBubG/EUeRN9lH9RpYfhYaOYRiI0XiVdWHKf6
	j6oppQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0rrg76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 14:33:38 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdb990c283aso613627a12.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 06:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794234817; x=1794839617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LzdcUGnHa1JcIxlDEp+JQ+iXSi5nkLn3zmwF0wQSnvc=;
        b=RdLsQJ0QoD5g47jXPNlzrBbjVFvMAJvOADAZFfzcVMPhJFP3b8cI2kHPgYhsw1jJFM
         cMbhLXOsQ+ISJSW/anFsHuJUecH65Nqc8VQXKV3SRZzxemL4Nzdb7bqbrM3LJJYk6P6U
         Jdn+2omj5m1/oXANbr+vBgUK/Mw//3Wa3dKzKeGiHc0HDAqap52fTlelsLVOF5ezb1q2
         5hA1hPIb9smPO1Th73O8CXFVjg/mB/7LdOrH+TqLwyg3vwH3Xq1JSeATHmkI8YozfCQK
         9oBc8gXjJCpJN3oRYwl0Cy54nR1lHOyn/KslANgq8oIq62besZOfKrq0j/Ztst+KVvtn
         E7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234817; x=1794839617;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LzdcUGnHa1JcIxlDEp+JQ+iXSi5nkLn3zmwF0wQSnvc=;
        b=FkIaLchwebFnBXYI/Vvm/gxjdn+V8NAfAh1gvp56THXfSx8Qt8zHl4azInMnFz4FMy
         2hQEwPE9jQlL2ZsleXnUQs+qtGdLqVKHN/FKB4lJRdyA+u9X1sSYTF82vbyGVYCKuJEQ
         Wnl0OOiYwvXSqZ/2PxPCv3lKHnW4t6zfWvQtQY1IuEhPd8rUQFyHqZT/SmE9OKTbr+Fu
         ZmmoVbqao+39tEpj8cqyOqpv3sVNfb3B64QQ3zDU4S0V9/vSSN+xD0GxRtJEYdZd+4ZG
         cbIaonxyhMBAT72ekXKE9M6mgM4NKHj0unDnFo/3QZFDj9MrWhfg1quyiZYn98LiU2fw
         pH2Q==
X-Forwarded-Encrypted: i=1; AL+hErG/kcLF7D8mAV2cjDP97YCP4+oGi5Sffdhl8JyvhPq4sIjw/dNl/cjXST7+w99qwR1LwiTeoCnWoDRm@vger.kernel.org
X-Gm-Message-State: APuU4Z8nN+fZaHPXT/8nCY2RXEkXmUTSJmelKE5tovukNCmZajD8XZ0X
	KVNY697JZWbLMgGlW5YrUqkyEM3KFllWWNM5ahEJV1IVvkQA6TnGJ1fcrFibE9b0aB7tKOQ3cBB
	5+hKUB9gAZ9CH3/9FMlClt8ye88eJx2b2O3QDq8BLnqRqCEwsqU+MVWPeOIsHqdvq
X-Gm-Gg: AYBFou1OAi+2Pgp+8QHiHqRnBCPQRTsVhBG0qXsdTR91lDzuuWDnycWvf9zFAanbiFz
	r+6E1RCLmDd2XTsyHOFG3Eu23zsO4rVo00G7oJj8LSol9fgKzPvewD8F8SbET+eK53tq8Gns3Qh
	0y8waAl1dhZP7tlx0xGSrq46230lDZWLsj5eDdEagbuYGMAsaFtK209ELMOeFzx6pzXT4SeodbR
	Fiw52sBdWhzpioeXkevGUPppm8ru6hFOeB5yRtyCG1BoqCO8WJXEEo3GeRmoTBGnUaZWvB7gruA
	tAh/QcK3qssroIwmhTi6dB38efmKSpY0LC8J3xBK0yrMZtgJsT5TmhOnQ9scvoyzIm0gZj9Axr7
	/vdTFIftREhUTaXlN8n6Z9vn0EgyvjqDjWEXOF4BYEHf9CzXW5BnEGsENjDFAJxCxE13vt8rDYI
	B9+A==
X-Received: by 2002:a05:6a21:71cb:b0:3eb:b2fc:bed7 with SMTP id adf61e73a8af0-3eed2024dbemr2536983637.16.1794234817547;
        Mon, 09 Nov 2026 06:33:37 -0800 (PST)
X-Received: by 2002:a05:6a21:71cb:b0:3eb:b2fc:bed7 with SMTP id adf61e73a8af0-3eed2024dbemr2536968637.16.1794234817107;
        Mon, 09 Nov 2026 06:33:37 -0800 (PST)
Received: from [10.218.50.86] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b648e54de9sm1408883b3a.14.2026.11.09.06.33.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:33:36 -0800 (PST)
Message-ID: <2fc8f7ea-651e-466e-9346-c47e0a38c5bb@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 20:03:29 +0530
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
Subject: Re: [PATCH 2/6] dt-bindings: dma: qcom-gpi: Add QSPI protocol
 identifier
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
 <20261106-qspi_upstream_series-v1-2-21f43042dd60@oss.qualcomm.com>
 <20261109-wandering-miraculous-mamba-0cf21a@quoll>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <20261109-wandering-miraculous-mamba-0cf21a@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uCqDV1Kqcn3iHCbtBkvYr2OJTbuWmaRh
X-Authority-Analysis: v=2.4 cv=MpfHeGae c=1 sm=1 tr=0 ts=6af1d9c2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=lXLgDm0nUj_2s8HzTMgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfXyp9QFHq+QvAt
 0bp1MYcU/yM5TVrWCy9hVJgNbdaeHXKowKgJ+zmJSLRXzqqY9+/MabzkblFvFkzlHbckVUMpsbR
 w+8BqDHkCGd2dUFgUllSTfehTaafuQ/UGiNBdNRfXFkdm1ecyGG/Na3qp96KndEpB7RIx1LhSwg
 l2BbODuFXHVz6nYCelG3H3LFzr08pZ/P6qQWHRj/UrwNr8R4UM7ymijNbBiuEMJ8aE1Aoe4rIQs
 bm6COihNR0s5w6+W/yP/Y76ePVTOz2wR2oL1T0QfgILHDUg5VQKAjlgPJrWAn58wUkfcMCZS9iS
 CjFQpsL1pIfSlsvRd7hoAZJRNo6rF/q7+oAuyXUxjRWw03X1h4WPronsSSMrbukzdu4ajnCqLUX
 6Vy6homqW9sKK+9WMUoZuGr7TyjUobA35+Rh186TBHCm4w5mcRX+60+eo5AvCjFu4oojRCGWa8Y
 IUjYqN5xVARbo1FSdOw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX+iuHRoyrADzv
 kLdbuYYEPLARq2I+ORRtZNu05FDahMd+HrHwVWeA+8HH7Sd/cez/RMmwXgXBVDfHTAF0Y3MQ9OG
 SiOYkeqRAeld1/u3ajRvU+vkw8mU+so=
X-Proofpoint-ORIG-GUID: uCqDV1Kqcn3iHCbtBkvYr2OJTbuWmaRh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090057



On 11/9/2026 7:12 PM, Krzysztof Kozlowski wrote:
> On Fri, Nov 06, 2026 at 08:31:20PM +0530, Jyothi Kumar Seerapu wrote:
>> Add QCOM_GPI_QSPI to identify QSPI (Quad SPI) channels in GPI DMA
>> specifiers. Its value, 9, matches the GENI serial engine firmware
>> protocol ID for QSPI.
> 
> What is GENI serial engine firmware? How does the Linux rely on it that
> we add bindings for it?

Hi Krzysztof,
GENI firmware runs on the serial engine’s programmable sequencers and 
implements protocols such as SPI and QSPI. Linux configures the engine 
and submits transfers to it.
The existing GPI DMA specifier includes a client protocol ID. Linux 
programs this ID into the DMA channel and selects the corresponding 
descriptor format. QCOM_GPI_QSPI adds the QSPI protocol encoding 9 to 
that interface.
I will clarify this in the commit description in V2.

Thanks,
JyothiKumar>
> Best regards,
> Krzysztof

