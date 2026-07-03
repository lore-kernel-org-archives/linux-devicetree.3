Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63733D891C
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 13:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783085700; cv=none; b=pQjwxHZ+OYb02C97ekpo1Vwbo/P9RjkNlQUBJjiHVWybfLMc/xAFjZOpojXcFJKLokrRgcdZprgutjLnqGThx6eKhXBKP7SFdY6S7qVRq3/BtMCoKgCaahgDdL2Fxe0tBS+hbXzof8clUqm2sIrJKuU+mODoMlGta1CJOU6Tz8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783085700; c=relaxed/simple;
	bh=JkM2UpcqPx9B58KERsCPRysPzuvuZFFZnEq4O6HEgvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TADc8MwLPAApm/qRzS2GBs8kdI6q+uXPbjEUO0DgeDhE+hWSiA3V4aC6T6fOjvUAi+eDgs+ii/DwwFaFV4eMu0G0UMAv5i0mCI6ZGQczOiSOmgM1Xe7Rh7aXys3GdJUx7WixNiZD2D/L6r1ihFMJzkZHY+dvmHIVI2w5HXzEfzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M/B38wVV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GI971ERw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M/B38wVV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GI971ERw"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663CaN3G3144487
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 13:34:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jqBviRqbT/IMeHZ+5dUpYAxMnFNQlS6hUXqs3HiclKs=; b=M/B38wVVR2ZBTJNJ
	0ZssfLIzOZ61rloETCwazrJKqVm8MtOjYd4Oz73cQz/r4eesfTL04uW3QCFU0IQZ
	hoKsP5MmRqikFGF5n3cLY5rpiejRhWZF0rCfpwU7G560pH2bvm8KQKIHDyiDJ3sg
	lzIwBS7ZyoPq3YOmcwbxcFtxp9KrCSVbAjUofZRDBEeyNf4MynAKZ/CFqg7ac9/9
	er3Gd86uj8ECqPO0icuYXsVvKqLykXIV5Nice1MifhfjKPrK+8HWrqE5FiIDJUWa
	QbnlUH8+TJyShD4xktedH6MymMLK5C1RXd4FJzBtlE7n0ZlWGgwKZzQ3Pi2IWh3g
	7bVoyQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682bsgyn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 13:34:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e4ecd1ae4so10565385a.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 06:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783085698; x=1783690498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jqBviRqbT/IMeHZ+5dUpYAxMnFNQlS6hUXqs3HiclKs=;
        b=GI971ERw+lnNa7rVOfBIbHNEh+H0ZR9aMR+6+zYNnPyoNhtXyseOqqOwBE6UNDPnl/
         Qa5mbOfw8d9+qfi2Weyujqxo8cBjNF6oE1zFn07oK/ZqBm2+A2xDTaiSS+jAOdnON8h9
         zX8FkfU3dx1J2NntRE/vp7BkKJwuqT3qGfD+7NGSL3wsuvBLs9pFyBH0IkrQCeq5sKOd
         m43mGNMukG9gGZu69G+ZVQc0w52QJFWy0dUIgX1Od0HvACCegsWL9AZz5IifC1uBbUMs
         n5P8O0hWRZbMgNPxjBEIDXv0ggONrAQpuEsaKyu38aU9FhiWR7J3OXMZzAVzxBX7RyXL
         M9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783085698; x=1783690498;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jqBviRqbT/IMeHZ+5dUpYAxMnFNQlS6hUXqs3HiclKs=;
        b=hEtx9tT3/oiPHyUJcKc9+zyWmCF0Vb6/Bw9nF/Bf1S8s3ftuWVIAy78XW9cC9t60iQ
         slaScP0K8ChLoYQO2DXF3Lzh1xFqtKRKNTCKHTGJ6yHsDk2ZVyy7mPcltJ4cGt/g2okL
         wfpFZkddjl4MY9Vp+PJYAkwBylyou9zRwLFo2LL4er5+OOIYlVqshliYB0yaEstda7Ou
         pGrNIfcXwavnbnFwwFFB+N1gvzbAW35f6h33S4ZbWl9Pot3QaVmmVEem/LKKL5m87DKc
         Z5LJ/y3APztdTLRlJwAbCv8/btGhqzvtbLlBV8kkFCU10/NLaTkqlVqZYKW9VpjdM/2i
         52KA==
X-Forwarded-Encrypted: i=1; AFNElJ8xGWyo6Sga8L0I+9AoSg6kQsHx6owgjkHdVa/beQh3DaHnChZJLxqOFbATuIE9A2qZMZFEXMrNiiNu@vger.kernel.org
X-Gm-Message-State: AOJu0YxfmqfsnNGFRWsTWbWgrVyfh0N/67GSWWDSN7B+tBoUkr7S5jOA
	ahw/hvv/nA/TWTDcFSkdvFxl26gzViHypLdIFA2CpW3oVrNLpFyxvIQAdQi2ievodZkvnBEiUOH
	wmGgjE6tC6HEN/hO97GfRmXM++y5QU7NVmWoEEt4mQlBLaZ4asTr91tEGcvYgPKxG
X-Gm-Gg: AfdE7cluT4vwaOLOML5XURjx/Uef9G4O/lWp0uVr1G+Hz25D0U/tak1RXCaK4wv1zkb
	1WT6ik8WqNcK/ta0IZlAR6gnwsNHseiRHLDP8ecUBJpIkLNwCao3ySc918scT6cHVYOTcxO3dcN
	65y1sJkQ+dkZnVa+WZo0D1yw8TUL9P7IlKWr1zFknitvALXGNygDOaOEBKAmaSxrxxGNjfvjkj4
	fkZCaoxruAdY+h/7NguwCvb2DEDsKzNgsD1teaXN0z+SxPWlefr9pHfUK+7e6slsWkNsY4tF0LP
	X9SqCeb2Vb7LkQOpGTMOBAmHZscLdwMELbxtXGxxI5ad+6Cf3cYyMglrp5P+zZDWNw3Vd/OG18+
	fqEPks4Uwsb21gqSJ4e1D3mssgmpboSnhKMc=
X-Received: by 2002:a05:620a:1a0e:b0:915:6433:2599 with SMTP id af79cd13be357-92e7821f763mr867425285a.1.1783085698005;
        Fri, 03 Jul 2026 06:34:58 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0e:b0:915:6433:2599 with SMTP id af79cd13be357-92e7821f763mr867422485a.1.1783085697647;
        Fri, 03 Jul 2026 06:34:57 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6054a97sm284606666b.2.2026.07.03.06.34.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 06:34:56 -0700 (PDT)
Message-ID: <a862f1d4-dc6f-47cc-b56e-3b54b32c7443@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 15:34:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: monaco: Add passive polling-delay for
 gpuss thermal zones
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260703-gpu_polling_delay-v1-1-132de4dd3cad@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-gpu_polling_delay-v1-1-132de4dd3cad@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEzMyBTYWx0ZWRfXzJpnleA7xYa9
 LuuGFAcxuPNRk3YbEyQmewpvSG+XLdNgwddK21M9V7vPfHY2mQYTCThCjOp12gF9gYcajANJoWx
 mlEucw5TDuzmdmS/W/t1wirBvCIt+E/atK8mqjqmmT7SIyJL1S+txk1oEYkM7qj93goR/kigDaz
 d3B8C6OCoW1tpWUdwB6B7HBbjhYLYqjlnR7XvUYqGVDSmzosRd8t3JH8Gd4aNRvWHarO3Ehl+oQ
 C7xIXGT/SeZhzdf+7hI/nPknX+FL8lQgBIb227FMdh+g+Sx0AqSS5m3UcyrX0fvX+86iD/z20Tf
 QgtjNK/UxWSRpVKwF9d1p995/SupADXPG2Jc87o40nyCHqxiwwPnMBSh7qEyNw2cJURzkZ03C9U
 7HDGTvGn/V/oCIZ2QzTJ+sEfge6pviy3BoYPVqRwPh++OHBQwqupLVekA3vTOHt2+eRfte6c3Zn
 xGnNQTxs7MI6lgqYVvQ==
X-Proofpoint-ORIG-GUID: PL37RmOBNNDv1lkh4X2qbeEdBYja6X2A
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a47ba82 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=3W1yRxDTcY_M_aWfLUwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEzMyBTYWx0ZWRfX+461A08PGi8c
 NZqQKjJsRCdloxKQDdnZ51lUc6Mqg7Zy2TzwWurCocVm6QGB0BAhcF2BW9+LPIxSn3P7Hu8+T6z
 v8EcgOfXtJHZrcqXJV2YPXPm+TUM97I=
X-Proofpoint-GUID: PL37RmOBNNDv1lkh4X2qbeEdBYja6X2A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030133

On 7/3/26 7:23 AM, Gaurav Kohli wrote:
> Introduce a passive polling delay to ensure more than one "passive"
> thermal point is considered when throttling the GPU thermal zones.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
