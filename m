Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4834A25DB12
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 14:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781100064; cv=none; b=UzwlO2crhJuWJf8XecATCYDGRUKedUyP0N7wep4WdquuBVovI7MfCbSgXfNkE+0io63fFTnFkDnRvmYt/W2ukuzd9IZrSxpMBePOanrzzR9ALzsrrsHfcIM1vaq4xQ+EVg/AQTXl6BBzNoK17WjAoCFpvjXw6fsqE9S/QsAo9XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781100064; c=relaxed/simple;
	bh=dICuJUbKjN8yyJmiqAFTChqS0W129mTdI8rEd1NL2mU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lq5K7ZtND0n6W92psrNHRqT6EVmF9egDyKR2i7AKE+WdCDdKHUaJWi5EVcGu2z15JZCntBZT/TwjUmyOIDJAXDVPmjLMXPKJdkrL3oonuZgXLF6lRVNZyqa63Epmd0XsD8lp3HPAmvZ99glmEjL8zse+Ojz0TuI9eO5kK6OOf1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IW6ZvPuq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OpMZ8tCK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IW6ZvPuq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OpMZ8tCK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBmVa1169802
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 14:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dszW/DFBP0oRONJf2F/W8AVh47nEouB1XjBuJ8A7lfk=; b=IW6ZvPuq4JXEPrBg
	6pG9lTkxZ9RqTQeqBEviwT7ywvq7A7q84wRG/glysXFxe6VnvV+9ZXwWU0BwOKQn
	olDaGUPryiynnhNV2OxUtN34GoD7YIAfHqf2I2PBqYT5UAfzobVa8miy4eX/pizW
	goK2L9iRMabLYt271S/WC8kNFOE1sFakSC33PUxdvgI5xcGDawF1JqymCWYmaUBz
	bo1z2V5pQCdvlzFjPErKP3isi8pYhJQUnzWIygez+XRBJvsiFGhc7tA6DSplsain
	RsupaD72z+SnFfgoh7KNZVe+5otLsmPk0jduROq3iY3uoyg3X1KksJml/RV/O9A4
	aIdyVQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq4w1s447-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 14:01:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5178ac43d27so18771001cf.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 07:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781100062; x=1781704862; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dszW/DFBP0oRONJf2F/W8AVh47nEouB1XjBuJ8A7lfk=;
        b=OpMZ8tCK3z2jwyR0b2RVLI3S848fhnER5WfS+4NqNvBndRs08d4LTzGcDDD6tc4mxQ
         pIlxNm8X23IEb62AjVX6noMOzJvW6Tt6XMnVWaPa5JR8ZcjyQtnU0yGs8CMKqioTeU10
         NL8Cw9Y6vA9jlzysOnWJkaHcYWZkaTi5FgikroUx3/CnnMUgOy88m0Ggm7ftOZKtZGeE
         pyUJ3BEOp6ykDSaAph+ZJpHiHQY4RtdSMmshzaVFyhZz8B8JoEIfYVYyhQvVgP/bQxtW
         iHxFP9geXqt+5e8oDQzu301m69lVHWTCMusM3cQd+9E240MxDZ322CVwBRndH6tpoevO
         rYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781100062; x=1781704862;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dszW/DFBP0oRONJf2F/W8AVh47nEouB1XjBuJ8A7lfk=;
        b=IK3LsY9PGOZFbDGVro64kSo7xt7F1MNbrfjkFzYpSWDOZOfWqSutzaObFqIs/bI0Ef
         VDF+FNZRAHuDaj3MPXFsMyXNV3ugQwGS5N9oQb9hba3tBnm4kBsUas+0h6bLG3c/t/0/
         B+o0t3FBK34Q2z99XqhKMl+BB2h7qUQs0obXfFeO2kJi4flTWhSRRPNMHPSTnhQnoKuh
         PKjGxDKj8fJKmi6Ln2xTEbBHrm6PuaQM9nO1uaq/i7O5fSjfSoJd9R/knsG00Z6LDko6
         F75KPODPgE/C0lO0P88QYNDHvB2p4wXIxC8GpytwNbLvuM4wKQUnyawwCZ98vRp6YKc1
         fNFw==
X-Forwarded-Encrypted: i=1; AFNElJ84CyRWTC75ucPgNRo+dhItLLo6zJwKK3YEOtH53tk6fgmvzrmrfxKSUuUebzTvzH0MibD4Yk7JvPVS@vger.kernel.org
X-Gm-Message-State: AOJu0YySV6LR1kVu6Gd9IA+TmTHWctidnEavo/0gilluBqZgBFCvEOOV
	H7HO6EbMVaShkpn//VpeGXRXpHNmh9L91q8qdnc934lku+MPtEAXWnzccIJLzzewEpq7GVyGLOE
	rNXDeYyP6UggGw4cL4IhowbwTNMK6S7Ct+01gmh8ilCmBAjqs5yqmD2lSMrJZUWU1
X-Gm-Gg: Acq92OEEKQJolY0HW9CsegZxfgDD3wLVkddgbR18dW++pLHs3tw0WTpgg6/cHBIacOq
	P8ZnXVDHi9AFt1leLtzY+61Vs5+HgBP51LtpOVoRHxkZE/wl4zxSKeMeSmn9MkyxkvKmzR8+7P+
	LzOIYKQgvNt3cGo4N2lYfVNCKaesRjhCyRGDGHp7tyE49k1sOwMXIi2zRfCNIpsh1MRnUNqmdx9
	UaLu2NFsEQStz+vRv8n9qk8snvImZ28lLK25iJufBUYVdVIhT7LmWVAyB/u4a9yhzk/8/GU4BRD
	27JbnUmuSsQCYfAIrnBdy/X8UtYuZ9ew+SUG3XYoEBJryR7pNQqjyC4Ys40A264rytRhHve3jXD
	WLF2coLYKM9UutUbX2KKZfpafldnPvyg/3ZMEBIQmurg6iuC4z2JIaGEg
X-Received: by 2002:ac8:5a52:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-517ca3faecemr76089071cf.3.1781100061431;
        Wed, 10 Jun 2026 07:01:01 -0700 (PDT)
X-Received: by 2002:ac8:5a52:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-517ca3faecemr76088431cf.3.1781100060792;
        Wed, 10 Jun 2026 07:01:00 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf05176e1b5sm1195871966b.8.2026.06.10.07.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 07:01:00 -0700 (PDT)
Message-ID: <6e46d3c8-984a-4a24-8847-5f5b6bb9d51a@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 16:00:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/13] clk: qcom: Add support for Qualcomm GPU Clock
 Controller on Shikra
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-11-8204f1029311@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-11-8204f1029311@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dYe8rVhWdfW4XUywxJZAS6fU1k9J5K3a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzNCBTYWx0ZWRfX+rlx29EtyEgM
 puDnMMjVfWZdPmdsT1UwrtGAJiuBSVwVvg/dJQQmFn9XbvDse+v44BfV0uAzHopdcSySounvFqj
 UGJCSgQoH3nuLTuQkmAdKwjYHwZ0GdPiib++vOJf/KG0X8XqSMeJXdoRsCJx1Y8nTXKCfKA/67O
 64t2LJa2hsSON4EXQfvd5mKcOW8qlfw/5ZgkoUHU4r6Pv5gHAg/OgjxifOYLIt0oE2RNGzgOBKa
 /ZiYJhHb+YFTEUiV3ZwzDvrk4580uW3VmxC0Fy3l2MOqfH4enUS5OUnTcM0LUPBFtXrwbx/u1Es
 JQ0tX0JdW3H3g4BchGXR3ZEjK/bMrJP61ojOoYH27joGYOcWjuDxEiBkL+nLGgRphjTrXwgIFJZ
 uZgxCN6TPvu1tUDDdRODq6RcS4Cc5tJKmTaDxow82kA7nrEPfZSLtTmmiyQWIkUTiKUdET9IXz9
 ODcZDb3vgRq1utLzmRA==
X-Proofpoint-GUID: dYe8rVhWdfW4XUywxJZAS6fU1k9J5K3a
X-Authority-Analysis: v=2.4 cv=ZfEt8MVA c=1 sm=1 tr=0 ts=6a296e1e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=IyfWUWnWmjsiacPjz4MA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100134

On 6/4/26 7:26 AM, Imran Shaik wrote:
> The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
> hardware block, with minor differences. Hence add support for Shikra
> GPUCC by extending the QCM2290 GPUCC driver.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
