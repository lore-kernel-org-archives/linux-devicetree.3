Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB38138B143
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819103; cv=none; b=QdmJsTd809nY0ooPpnZqFDifEEvtOkdro/f2UhRvG1emgQJtcvy4Fem1Jhkyuwb8+vWJ6Xwb8Z7yuPJju6GYKwWQkg9wPc9yBQljApFvZxaxOhw/vhMNwdoeGUYC1l4iA4Rvxg1nLopPkzRDW9zZ/E4pgLMibsmGxZuDYwumJ3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819103; c=relaxed/simple;
	bh=NII8/DvpqZvskuTyC2R0uY1SUxGgGLheGvOiAEFExD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VXvLr/qv6fxD31W0wgh4bozvU1YFYldQevm324tSSGjGwkq2Z4YZcRzomBk6KnPo7oqWqMQRaqBC/L0svXl0i4utPa0oGexKtqbI/CN4Wt42smqYqNHCgJOE9k7mZ3E6oL6Ba9x3yVP01row0qeUIIMY+MGIKmaolFitfB5ZG3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YgChnls1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AlzzrtFT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YgChnls1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AlzzrtFT"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC01U92785828
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FTbbiR4wtSkmSbiIjGz9C42zpD3RSjcT/iZky4rnXuY=; b=YgChnls1v6APMnOz
	CfpwMi4/W8O1NyM5mDb1nmrHRVOlUyMwOzIQlHp2tAPYtoB0UX6CQ1cMLengXVH9
	LKIl97FTOhfscwGK8nbUFFjmW9mF+VDQkNCFt4yyQraKGLQzDsY1x43RYdii5bD5
	qphBZlnwu71kgwqyxesItpIiXtrJ3JgWEJOjf6FldAG1/HFOFK8AK22/8HKrxONk
	Lz8njybC6RbpmVeC9+keKvZEVvSO255QC40crcNY6thDluRJGOC1CAI/83XWY2Rv
	Tg0FzkwBAduCguvqOEqNfrhbLoP3CGJ57N1W1FFryVil4KQJZC1lQeaCAs8QHHWj
	tHk3MA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wffhd79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:31:40 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cba2460f8fso30590137.3
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791819100; x=1792423900; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FTbbiR4wtSkmSbiIjGz9C42zpD3RSjcT/iZky4rnXuY=;
        b=AlzzrtFTgoHk7dR8z4KGCP7nOZYLpWKB6BEgU+9A5YjxBHuCvYZOCOq6I5CjTAUXBl
         LwqBiOB80JAs5y+1aJVbAGDtJpdv+PnyP7mhsUpPUdBdL+nAq+tZ9bu16kXapOT7gWfp
         uZy7mMDqISxS4QgA+mNlw8bAXe+U5AUqMamuSFZR3pIq3lHJG1WjSTRUvdZhlDDoITht
         RpqjqeWCzKUDK1GBEReZia5mHDTa5kJTjE2/oLhPFkO5hzFxZ9BwaQc1FXkiYw4BRh4I
         OenrT2g36NgjvjiMwgpY4waOshzXeMY6hWzHpaQkfuhZcWAOXKXwxQH5NQMe/MmMUSPv
         bjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819100; x=1792423900;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTbbiR4wtSkmSbiIjGz9C42zpD3RSjcT/iZky4rnXuY=;
        b=WxtJCZyXrKcO58J5txnKXozodPakpNJD0lzFxt82wDnoj87be56+uvRwUMMSQm3v0f
         R6r/3nmhplgoxvm4so1XOdw0YPhNNOsfaABz64OPKEOWPG6ztmsjQb9/H9/f8hhuWBcw
         1t8fXxGDRq/qPzZLD/F2PuD+P9Smx/ZQ/B0K/E+dk8KFF5pOE7pVmGdkWrBSisnxMgoO
         U5eu2W+CJLnWQrvNvJoSRuiBp66zxLU289tIP4nTeffUln4qQ3SN75EuogZlEqRu0rGj
         uMR82GWvcbNlLqtrU29lXGeYpYthUMZPxsg7vOosvN74cE/P9rVm+Qmg2qcNgWDXrRdN
         2EYg==
X-Forwarded-Encrypted: i=1; AKwUvByAv587Zd/Rlf7i+hyqlq5KgzooGjME/CAovyzIJ2gSccmmReDmgy2gbgelFRv0eyBDa3X7EgsEs5zd@vger.kernel.org
X-Gm-Message-State: AFq9FYJsJtDjp1D+jETa87ENQfeTn7DQblqIn7YxZaXs+ktKS2KA3IZv
	CaGgWhg1hReUQkCCW//Y9PPrB62YT2WoqBe6pZ2blX+EncwhDGJlbYH1RW7zvUqrn6UyY6vLq4b
	6elN4VuuL3O2x+OgSJdICeEugnVYqZ6IWqJCsrhbKA8VNpL7f9yQtHZB9Ht1cXeqb
X-Gm-Gg: AYBFou3er3L/H6QffM03XuEjm5aXqjMExgNpF5AmcarJOSERKeMMkTWZTSoK2kEy4PW
	KY6vuwTZu1xJ/TOCTIQUvUAnBYXGwTt130rSLakJCk5e82QpciAw3AwQHjo7UowfPFtxS64YJOd
	JZSLH9zvv4nkSoTVBIVqyUNlIqE9A5fy0QUKMg284rOBpPsgrWSWQcXlGCOMqNMBJsmLk8lrNwF
	XEP5M/Rj5nhFVKw576vsxiSLE16Tm9oLZSaNiKC/e9g6bGniTvJv9q9x5dj9omxLLbzckKNswh0
	rKcpWIlYI0x2ZCTJ8zWZ+NNsB0585jDuaFMD/loNABeyKb6nWuNwatG0mzqopjgN6ypINdBAWCw
	W01ETi9N7iXHWc3vKfYGPRw==
X-Received: by 2002:a05:6122:8704:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5e9397db6b5mr1470221e0c.3.1791819100143;
        Mon, 12 Oct 2026 08:31:40 -0700 (PDT)
X-Received: by 2002:a05:6122:8704:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5e9397db6b5mr1470181e0c.3.1791819099635;
        Mon, 12 Oct 2026 08:31:39 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34001fbda1sm203669366b.66.2026.10.12.08.31.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:31:35 -0700 (PDT)
Message-ID: <0ad55730-8ce2-4cff-a84f-689ec5716d7b@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:31:33 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 27/38] arm: dts: qcom: msm8660: Remove empty line at end
 of node
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <737de4712f52d1ba198f9201cd2581ccac7b938b.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <737de4712f52d1ba198f9201cd2581ccac7b938b.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXwlqEvQzCV6ud
 S/+wZq47PWYdC6O1kyRp9JHuBQKfQxNpyzlgiBzgg0U9EoG3vmlwkFB3bVwtVQdrN5O4EqfDqf7
 cU3snqeBylPiEMMqMraBTayEEWAkK4EL/sSWWUzOzlmQaqvbtw/oBYVU35BEbFfjxG/rpzhqpuT
 8d37gugXufHOWM/EWEOzDPCMpwR65VsZLTQnNQBTb9mdmKqHFwufRH1fojZ5xX5XiNnn/NVdK5P
 hiGtjqKpOlUs4XeXMc6qucXAaq4iHtnjKEaAN2smiJNAJLw/H/f9jkorek4pKvM8rT8kFdpNPpE
 9vYHtflq9CahaJzlr4dPm1zFHyr0SMuEQCyuVFT/djqR560ysMpQfo3N1mQo6wDCdTWjXeLqdKm
 +/L+zE5eAZqlslt/mqQqp00fecRFjFjjZ+foBYb6Hulu63WKjvahPQjUYjhxTcnyzbR4VSwVOtG
 ZRZjIqnJGtfFvXo3wCg==
X-Proofpoint-GUID: nn-eOzjPiU48s00nbRyAGdxfFH0t-TWh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXyqkOscBg3ptv
 RZdQHjDW5Xwi3ShaAUJxDfC/mm+iqPPC8EoRLzv0bwAS/ElMfadgm8mVgkz6dKMb690keu9uzd+
 FE6uXMgu9UcfgbvV+VRzw3scQIT0m5Y=
X-Authority-Analysis: v=2.4 cv=ZcWIpcVA c=1 sm=1 tr=0 ts=6accfd5c cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=cfbp-VlG0RD5cB8OVJAA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=gYDTvv6II1OnSo0itH1n:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: nn-eOzjPiU48s00nbRyAGdxfFH0t-TWh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There shouldn't be an empty line at end of node definition. Found/fixed
> with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
