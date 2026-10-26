Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792999489;
	b=AMzDkwguyTEsaOSPx2j1rr+FxBnqEl74GbrcZzDP83uaD64g1oMsiDnMyhnLumnieBjW
	 Ye0GxHtmHIn8YYZzjKp3wW+JFCVOVCoIX5gqOvPQsIamRtPXpuBXaC3If8q0BW0JBA9Aw
	 LRboGOP1EHrGQX5TXu6DAUTCG908zvr3ylCKWvwgSi1ByuYMcwvRFII2ZPX3EBttRJ7Ng
	 6r4alSRIlCiyf7VOj0y1ppe8A2cektFio3jSOSWkUL229Rn5icU5dE01zJPOeIdI24Krd
	 mMdgd8QjNUyCCRf9HibsevIWuPBQgNbXRftk7+m5b7zNSHd7MfvpE+Xyy/my0NbY4HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792999489;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0Q9hZOGPGHQItfvB0KvMGoubShfJzS8NO1cPSm+V9WQ=;
	b=ewl4jsgl3VFA2+Os4e7QWTM3TFdUb+VgNbyUVJaurmf0ae6Znv9fQg9cpJXGoOAb7gR+
	 tESL8CL8nsbvbCe0qaX/RzshCMJlMZpbCevN8nFzIEhuwKmNhLBOqxoVXzD3yEkmECN6n
	 EJItJt5xkWzi0IpsivMwgS9nM0uodiv40PH7bDUoCLnCr7pPr54MzimECkCyamc/RedKY
	 YDNKmcoLG2uuYYWH7wXPGYhb2o5DqhqSbPwLnp+Y7vY9grU624Pz2PXnOEQtw4NP14CBV
	 /I5Kwr2TnVPROJUyS3Q1m30QnFQT8Lg2FUiuNNOV5DlEF/q7eTnT9G1AqAvNoORLe2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bxh0UO8g;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uyt7s3cl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3EB606A325
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 07:24:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA3EB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bxh0UO8g;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uyt7s3cl
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b1eC2806332
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 07:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Q9hZOGPGHQItfvB0KvMGoubShfJzS8NO1cPSm+V9WQ=; b=Bxh0UO8gpAPiz5D5
	E3S9mOqwI0wTzEfGTe4C7thJEq/v0j0LvzQoxntZrkv0a1xWzZh0WIFGhxUoqp5b
	qQgKnhgQXT+zjrmOYAdAwalHzLHt+FpeJt25pt2sX3cMwXfumma+HWOlqTYk+ITB
	zfGJsWkXBbhSTur0ONGZW5nSxaZcCm7g0laj9se2wuzmxsroP7ye+tp4GnlPDXbG
	PkIdTUT19X4xb4Nps8VB+8xBybbCd0QjTBms8BAxftqFxuMAj+OdYvru1iqlJnVL
	vVJxGkkIG04n3Xn1zjbsebm19izIdAUyrTG/lAF8Mh+5n/YCrSFmlW6au/R9lu2e
	ngYnkA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm8xnbe8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 07:24:47 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36998507c13so1565188eec.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 00:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792999487; x=1793604287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Q9hZOGPGHQItfvB0KvMGoubShfJzS8NO1cPSm+V9WQ=;
        b=Uyt7s3clcyOJanwgjk6K7xfZ7MN0F45sfiWW2AS3MWXjvrzmCvg0RTBCe8ixNDYRam
         7o7THnY9AcvJqfjXtDRLUBOaM0HLmL10plz2s9zNnv3FYtXx3osNwzEdVZPaMeM2B6O8
         L5pJoELuwkztAlM6BeONvKbi4IinMtOvnA/swvYfbU/yDgezSYybp5a5fjbHq2RKHICr
         d9DHCRWH9QtLwR/pkT0041YQtS2tNcxXNxU5YvbGJObiKzkJFEpDDG6yvW/GrPrcZWIs
         czHC4X3QvQXn5oxg6J14RQ/1YMnBrB4/0s56+mdVpX635LfyrdOEGDsMaUS/Cek96VO+
         KEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792999487; x=1793604287;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Q9hZOGPGHQItfvB0KvMGoubShfJzS8NO1cPSm+V9WQ=;
        b=0xx580Cb35qloeRCqLRwOTa2lUz5HLvheUpLbYgBvCpdb0bXq+WGFKzryXzD066lWD
         6Orq7JU4hYhjTfHbvASafzTXVt7NHOt7q2u7SKjvLRdHPj3z6Xxmij40OCymxgIH9WFu
         zKKZsrNQf7dGl0rNZMgiLUFR67WdtSkSdbMQlwQkCV7yPe4hZ+Q514I6hZNwTiugywhn
         gZQek/7Eq0tBiQTDCy7aSLf6uFV0wrlh+JDb3fzUB1AkSZMbaCa06MFBdtkDOR/5Kje6
         KCmAGV+dX0KBNEtpbcBWN3WCcHelLZfTBJpqa0wSMxDjKRUvU3d1ORbldMFa9q/8Eszj
         TIGg==
X-Forwarded-Encrypted: i=1; AKwUvBywY7i+e+mbNyG6aAWrV6wSSL3YZD28igbExfCKpGhbWlZeocapZavi3XsltLL19jQDT4MpZuUQlMU+@vger.kernel.org
X-Gm-Message-State: AFq9FYLtd08ZYeXYIG8s2VHwwR4xozVBVUXH7XGtXeNZCfSz4rSvglhm
	tmvITAYR9jW4bGmfSeiJWxx/SNWQDGMuYtpv+i+FdWo9br93aHYE9HOP1kyjpcuaHKrbOQooUt+
	KRkagj/IYiAdNamXqUQb03gn5cD2ZWqFLAzr7aTdN6T9RbINMVcQvk6HfMjlbp+gf
X-Gm-Gg: AYBFou2G5w3UVDb/xYwmJStZYtDT5P4xt5hW2bMJBBgtgQPODlYB5Q0kXerOWCuMOck
	4ocQTOVLzI8XjJvq5Z/xb5P7w8N4s9qraptLQQ9y/qF0uZ02gQ0y6IYLApaPkwDXPIUgvQnxV7Q
	vzRiwykrP1rdFY/LCpSNamRoAG5xnQNNy+L07nZPigIWEDyWo39R2YzzXFJyY80wv6JfPDMb2zG
	71qLh3DtOs8hKkQ90WecM4OHnWT7qG2+mjjeVpFrShG3wXbi6nYhufbgacYFHSWN2nxnvkPRxLJ
	Ez5glMnOJajEBA/PCh/HACfOU2E5iPYzwZCzo3nKxmmrK+hxUez2+0HGWu1hTHYy92yfsrawfII
	4ibpkLha2mML3Pk0cfOaOWw==
X-Received: by 2002:a05:701b:2501:b0:14c:d8d9:9502 with SMTP id a92af1059eb24-19933f05474mr9361008c88.14.1792999486565;
        Mon, 26 Oct 2026 00:24:46 -0700 (PDT)
X-Received: by 2002:a05:701b:2501:b0:14c:d8d9:9502 with SMTP id a92af1059eb24-19933f05474mr9360973c88.14.1792999485793;
        Mon, 26 Oct 2026 00:24:45 -0700 (PDT)
Received: from [10.219.3.4] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm13556700eec.21.2026.10.26.00.24.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 00:24:45 -0700 (PDT)
Message-ID: <f2467cdb-e4b9-47a9-bf64-51eac8732b28@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 12:54:39 +0530
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
Subject: Re: [PATCH v1 5/5] ASoC: qcom: sc8280xp: Add shikra-iqs-lt9611uxd-evk
 compatible support
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
 <20261022094313.1074873-6-karthik.s@oss.qualcomm.com>
 <4e08bcac-66ee-41b4-a2b7-65797ec0e3f0@oss.qualcomm.com>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <4e08bcac-66ee-41b4-a2b7-65797ec0e3f0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XA1ngEDWLorJl_U58nn8AMwqWSlPwMnO
X-Authority-Analysis: v=2.4 cv=Ra0FmFtv c=1 sm=1 tr=0 ts=6adf003f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Y5lwcFhJtQqtPFhOBPcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyOSBTYWx0ZWRfXzI2BAZCADtjX
 vGuIkqxMTovxgqpNKvpZPJEy65hPTnFBw7WdSmWhgyLTqY8frCMGtnYOGRJVVVaB7ixs0ZmEROq
 5NDMzc/KzCS+c4hqBg8wrmlMCfc7FJ8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyOSBTYWx0ZWRfX5xdLzsr22mzX
 LIUYqyfj7EIDL29h4+sXTp9zv+Z9+1DqAWcGJ6nfTN5w6AniRNTtX7EhsGIEH4VrGoNHSfaXbWP
 WlKw+99pVKKxlcdKIbHVHiihaiWdPK0bF+xGYDdH/gG9iMEJ1aQ7yoL/fWVS6zXHCsYeTeErBYC
 op+l6YFymu70kwoYkVAhDC5KqpQ6AL1EdIueGZv65piXJSnemqQIe5PWmuF4/2yi0ln7F2X0Mkd
 FVSkuR8A2AeGunEycw1bgYn/C2QWCLdG7ZN6d0Tjp2r3lyRNOXTMbKwUpTEPdAjZBzN3DXOllJZ
 GRnuT1cQCwPIon/H45BBm+M4yxJyRpu3hyN685c/wocQ/O4co/F41p+ASed7u4LEq77/THNfNYQ
 LjRmAqpCtF1EfBkodx9P1ETlciN4rIestIzKTtnm2I1Y/3hhjUVXg4nHmjYMZhej6m6qLHAQ5iP
 9Uo//XpdlDVDM9V1bzQ==
X-Proofpoint-ORIG-GUID: XA1ngEDWLorJl_U58nn8AMwqWSlPwMnO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260029



On 10/22/2026 9:37 PM, Ajay Kumar Nandam wrote:
>> +static const struct qcom_snd_soc_common 
>> shikra_iqs_lt9611uxd_priv_data = {
>> +    .driver_name = "shikra",
>> +    .dapm_widgets = sc8280xp_dapm_widgets,
>> +    .num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
>> +    .codec_dai_fmt = SND_SOC_DAIFMT_BC_FC |
>> +             SND_SOC_DAIFMT_NB_NF |
>> +             SND_SOC_DAIFMT_I2S,
>> +};
> 
> Since the codec is configured as mi2s_bclk_enable, shouldn't we also 
> set .mi2s_bclk_enable = true here?
> 
not necessary in our case, use case is working fine.

for example in case of qcs8275 using max98091 mi2s_bclk_enable is set
but mi2s_bclk_enable is not set to true.

>> +
>>   static const struct qcom_snd_soc_common sm8450_priv_data = {
>>       .driver_name = "sm8450",
>>       .dapm_widgets = sc8280xp_dapm_widgets,
>> @@ -608,6 +617,8 @@ static const struct of_device_id 
>> snd_sc8280xp_dt_match[] = {
>>       { .compatible = "qcom,qcs9100-sndcard", .data = 
>> &qcs9100_priv_data },
>>       { .compatible = "qcom,sc8280xp-sndcard", .data = 
>> &sc8280xp_priv_data },
>>       { .compatible = "qcom,shikra-iqs-sndcard", .data = 
>> &shikra_iqs_priv_data },
>> +    { .compatible = "qcom,shikra-iqs-lt9611uxd-sndcard",
>> +      .data = &shikra_iqs_lt9611uxd_priv_data },
>>       { .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },
> 
> Nit: please keep the compatible list sorted alphabetically.

sure thanks will update in V2

thanks and regards,
Karthik S

