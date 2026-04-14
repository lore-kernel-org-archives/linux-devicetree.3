Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD28D3A0E8A
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160481; cv=none; b=UxvKPuUbDx42LaQLsVBCaY0yEB/JtTw11RngXHZvQttW6M0/CTJhqDmFGWg+kksvrn5OvgHhhlAnn7ZoV7HYacmds/3MufJkNH8pN5SbeZ1T/xqc6TRBWLLZQn6MEML9I4bjbvycVptdvRDJ0HmjiQfkYw5y/RO694vOrwiITno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160481; c=relaxed/simple;
	bh=SmdgCecZ05O6sZherrUw+e5DRBJjM/QmfEfePAPaQRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lMK64DVvGbNhQcXz+VQgFo2VQehN/anfk3T7ZusPZWE+wZlt4+6aL2/nNzaYDI2zVQKX7S8J7Y7ms8MyCBIwtSuaz0PCqYD0WAY1ZPY+guwHLzLXMRYnlJWCe88SOTptDTKuG9b9qSlTGw7XdLylasFjR0D3F9pghtj/UCO5Nq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CdW9PDFi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fz57PK/u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CdW9PDFi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fz57PK/u"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6eckH3424963
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:54:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n3WAJCPT/Q1T1ZUm/0S1VtzFJvEx3c7vts2cu3MyRNs=; b=CdW9PDFih1dG57+5
	k7Z2rfKf753QH/UZVsp8WxfmQjTvdwY0Lrwl/MoRMnIBKCH7lSydj1BShbzRCN9M
	XKeRSdhp+6C0m7h4T7BWbCDLUZ5nQ9KLhNZMUVuwJKvetcQ7KvH3eJz/cROfrOwT
	hkln3kwyBuyvWOhQGJuDuT/QSMD+0jnWMDBhEyXHoVI2AoHiHXJxQWG//DALEFX7
	P+zMCm8GtQVJuuAckjSEb/ZyxUEsSQ4E0UWdu5C6PCyDJGvJlYlx0v+QXLVsTpQu
	4+cmuxArzrY2wReaUN4UkiBW5fkKIhDScD0grTA1A9bzBh2ig38YsKkMQ27kq2J1
	IvqRbw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87fa6d8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:54:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d45ebdbc9fso108698385a.1
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 02:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776160479; x=1776765279; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n3WAJCPT/Q1T1ZUm/0S1VtzFJvEx3c7vts2cu3MyRNs=;
        b=Fz57PK/uCTgSpp0rZM6ojuSxNCN9rnR9TCVDXgWqiYWo42ZkQuRVop16Py0FxWZwka
         S8L8h36Gd29I+CVfbzfQq7d04JpAt4iOkDHwHr0xE84iPkcY/vtWl9Z1TeXb9Yu1GgQ+
         /ytVoGihzlcQ2cWrRdWugQCGJIlot5he3uiP+IlcSKLhhvYNNkSLn4mIykU8KDIaBc1T
         RhHuSyKKrqR1y1jeQ06hKcaopAHYEb3QyH5BwWoPX8cE7/Fu0HZ934qXU2MUCZRxZhMR
         26/QXnJlGg7z43k8O1DU1Fh3hF4XKt0xNOdyG9CwPryYKjPyjg8hY8QjwuSgjdE5pLaH
         fWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160479; x=1776765279;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3WAJCPT/Q1T1ZUm/0S1VtzFJvEx3c7vts2cu3MyRNs=;
        b=SoZJfgcU/aBwTOfekRLfTJM9LSfRJ7WFRyCJ25FacKegSUu9yaYJlIIfKtB8/pZWvC
         YLNZjU3ie1UC33c03suV24f33SEuaI/mNHn8i2ygNVNd9p9Hmg7hHSqHkIvpTy6AYfVS
         3IoKBKEDxM0vXXKgMOBPsuPukKjFScJxXNqp5JFOUhdSqroteoVJQNYRYq9ThRopPL2e
         pXK4mmaq9xIaAka6ZnIGRPdSqMlcWYmwjJb1TXTxANE+q5cqlwd529En4Ho39k/U7SFp
         T9k5hzwtLRSJTaDvvAqZmdQBZhCQPHXAQhEKYcMtJ117Uva/mfsbOZFA1M7PHEt9HJXj
         DXeQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Qv57XEJyiVRiaPTkLKX2FwzKBrTyLL+eJVqDenCb9G4DXKXPFfcxvL9/CUU58Nt9pfiemHsrbT1t/@vger.kernel.org
X-Gm-Message-State: AOJu0YyNhTOD/rLHpDprboztpeU+PKTO2W5u2kD80JRGcohsk4xz3YSC
	rTTExPqf5P3DcET+jI5BEOZRJAxemDZqBY/3Li4Dg7rijz6sT8KE3D3LMc0GCbyzml4tRyM34Nk
	m/TytmD4pL4ekCeVH9xUfqhwtjTNjw0gadyiAAc6RoVvxBhKmCDzRkZIVztbJEKQVbiVtaL88
X-Gm-Gg: AeBDievbfiq+skWZaLAaeO1NE1Eo1WDWdi9UyWFnhh0sSm8TnDi5R/koMz/L2lgE+G6
	C7rarSOONtdyu9wj3ZG0/0K/bYfKudhA/KQgmQif76s1zm1vnDrbbbiDNMZalLnluCWcz82PgOO
	3Ga3pDweuVns8KY4Q3wMeowJTp2Yhozk0dazEj23xaouIJbppswY5EDa/xlzwS6UcDNqwkL/JWR
	SaJwM4u/gVmYXQPe1Mll6qUK+Wv2tzKlwZmpQdjuldqMqE6OKpKOsWzuhgdMr1/zv4WZ8HAK2v6
	A4Oj7NHGaR/e89HdNGRFoTKFoTE7ausXbf77OldAxNSt05EPaU+hS23v74jqqVA6A8j1pPLMF9N
	228cUxyYqMnBVxa7QUzVyKmakyRCylnM9+7ahJ/jFtKrNsSd4qW/t9nysHuHFrd4yL7WIg/95lc
	fb73IJePLrMvlmdQ==
X-Received: by 2002:a05:622a:1827:b0:509:a3c:e390 with SMTP id d75a77b69052e-50dd8236028mr161421651cf.4.1776160478934;
        Tue, 14 Apr 2026 02:54:38 -0700 (PDT)
X-Received: by 2002:a05:622a:1827:b0:509:a3c:e390 with SMTP id d75a77b69052e-50dd8236028mr161421461cf.4.1776160478302;
        Tue, 14 Apr 2026 02:54:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c8a4fsm374169066b.54.2026.04.14.02.54.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:54:37 -0700 (PDT)
Message-ID: <04258901-1da8-42b4-9d39-29969c5801fe@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:54:35 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] ASoC: qcom: q6dsp: Update bit format support for
 secondary i2s
To: Kumar Anurag <kumar.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260413091937.134469-1-kumar.singh@oss.qualcomm.com>
 <20260413091937.134469-4-kumar.singh@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260413091937.134469-4-kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5MiBTYWx0ZWRfX/dRk+h51HMLY
 hEnJ7gCX2Pech7jfrvU1CJ5ITAIej9YW845KEks1tjEBnR9gaCnXi8UX5VmqUNdD6kWvPKQJvYQ
 VZpH/BDFNaKF+H3mMzYEM4SgnA2+mR5u/P6MySS8an1b0J4v8D9NHsMxZjUKUfPHn2XIprbgBj+
 3SIC7yoDXIGZSiaYIpjtbTrZz4mC6HkFNjfBsey9nfAb0tuuHZAfWjf1MWlnwq68IFFEn1t+D9u
 seNqGu8tS2XR22muPO/bFJg0RmkFtJTIBQOhIyzTmPUfSYII/Yi8/Qqh+B+dPYXsTekc71j1VUM
 tUynnJuPPivgBsYpv1ahyLjrzP1Cmsy+8aukL6DnznV7TObejtf9QG9LqOE+tMqnWk4QLJNykdU
 hMZDZbakQlhmGvu0LeGZB9bH0cLuhnxBQ4kiXZaEoGYSdYnKdj68bQDgN/uP/kIP8XeqkEsvoRa
 noYpyZozHBMDTpRHwPw==
X-Authority-Analysis: v=2.4 cv=DaYnbPtW c=1 sm=1 tr=0 ts=69de0ee0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=FztgSbPjC0Y9QtkDo2EA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: gRKO-ai2P6SRWjmwisMXThlQx8jzShs7
X-Proofpoint-ORIG-GUID: gRKO-ai2P6SRWjmwisMXThlQx8jzShs7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140092

On 4/13/26 11:19 AM, Kumar Anurag wrote:
> Add 32bit for playback and capture over secondary mi2s.
> 
> Signed-off-by: Kumar Anurag <kumar.singh@oss.qualcomm.com>
> ---

Would this apply to the other 5 I2S ports as well?

Konrad
