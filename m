Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6092C3CD8B1
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438430; cv=none; b=UErSuYA0l/0GjDjtGZORxubQSZMfE6SZNtCrcHinQIHYApvW+fubmDBh9e43LYAD/zI+V4ldWb9aHarR2HrfdeDQlm+WT5oJchQ1vFK+hTyQLrg2vxAew7IREI/XB1HMJKM+cFKHaJtq7s9wsLDirH5cRryDMmJeBr5buZ5NsWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438430; c=relaxed/simple;
	bh=zrTu/Fk6R5LsUpKkvhxFJueXyQGTKcxc82WecP7Bj1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t5HyScC4swngKB6kPFmhD+hzJdJJWKxgqO3hVAZ692AoKkTG9xp0xTtdDEJgm/Nx9k25eI6qWZFhm+ztShR9BG206omK3ACE/sD7TvfoaFXywcYfGZ5N8E2bEq1r/C2sT32kCxLU5QK1+BNLswn5mPjRgChhKPDQO+MkAn1KMWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oDLQjUn7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TRCLY1nd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oDLQjUn7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TRCLY1nd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGHBS2197445
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rj5/AzTuJ4vyMcaPjO0Gng38EceXd49d1VK/6ipC9lo=; b=oDLQjUn7PQCQaBbM
	l2/1sUxAIvkFNa0FmE7FkXoSDecF85GqndHd+u2p4AxReIWS1eKqI3hnDmspBVl1
	cIS/sEPMfzwnFlI5xm6J1vAmMk2ooI7V6KmNlXZIrJmJ83UN+RNVAkJP13zEDqbV
	pRVqOFXsPQ6+zyrm35yLA4rVLRlJFIfu69VQjdFrrhgwlEf1nASMXC8mrtDNWLkw
	sOgK0XKIMm6l5EnpuNUss1dOLbC4SEWYO2K88zzUchOuQdiiGOe/t4zOTYp7HXPf
	zHhoPPFl0p4POv/6/GE6LsxaSBLGsxYRwM3SuAX3Tirrcle8ted4BlTL3eRUcaJv
	dMiXNQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d48599kdg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:33:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5091782ab06so309227431cf.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 04:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774438428; x=1775043228; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rj5/AzTuJ4vyMcaPjO0Gng38EceXd49d1VK/6ipC9lo=;
        b=TRCLY1ndyQnGK5LPGl7Krlj62jn36qoWUAr0HFOUMqWlyz0dmfP4L4xtwVEmGCKEPh
         8hkRURC2yGK/HS0r9KTgiUP4h0kOZsAzkPjwTJTIkx7wRmB0FYxgErpSuexhV4h+1Srr
         oa5SlLIjtU4MrBEr1OFDhtaUz5lguvIbkeR10mwitiqR+cBzcXel/O9QUsuv3Smv+nco
         sYIClWM71WVMAFAt08QxQnP7M+76jYNeqYqQd1ZaHKUT3JSPN9LO76w/hq818CpxSU6K
         sGVA5JCHPCaRlrMuv317mq6nqO1zbX+zbgIJZNMa7eJ1CuaY0K0vc2UNWcNZD4ZJSrkR
         PJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438428; x=1775043228;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rj5/AzTuJ4vyMcaPjO0Gng38EceXd49d1VK/6ipC9lo=;
        b=O9A4rh3NNB9SENZ3lvNohGAYb/ae1TZcKJnphdY6oWzyzyJJIzpbnKsmQML3l8jdBy
         bKNeD53hgVW9Q+c30PqE0YKG3cRWmcv1PbNsHrODHMghxBMRiylRzilDVOTfvw22T8Q3
         sznHFtWyiX7GmcgGbb96p9tk6fBrqLxoWSxPeR0f2E2pKQd35UHNgFDTAbhMcsUUyQ15
         CXFZpGhMAcUOcoHPIyV3MyfhL0GwbskJaCCUgnb4pd3iuIYzX/rB55ETQzFkZAcmG0Ka
         LE+Hd1Rqu1xZaNBLM7XkZQ2Uj1vXjeTSJ1yxiKHCyqXUST4iUhEsaWzmb6eGlS9mD/X4
         0s9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXwdKg8gGK9ds+lkAf1AyWXdBgZWfm+2OsclJsH2cyP1sHyFmfOsYB5vf4APUO1xK5YkO2x6qFuS8eK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7MYAXytG0NcsWIEDsp3/1/kZ1UK84aBAYW5vaHLlH0Nuo/uQn
	Qapt+/xOoLjENP6zf+qAcfMRImpWHTztMENKGFVwrqzmk9IwjES1Khx65NabrHilMl8RxymMVHL
	/iw6su56o3T6JwSp401cI0x5+Rcu/mqZqsZ/kcateA3h2gV1skLspHgK+KYwlkkY1
X-Gm-Gg: ATEYQzxcsdrSDq34HtpP6FjGbPtLyE8sV4+NejWiLlZQy8fT01pp83jJy4bmatzbbU1
	V3bPEAJDOhC8oEIb/TWAjsftqhQq0Cub4m08ltaSXOO/d3YkhNLKNPpkVBIkOC/d2jRx0S8tY8i
	r67jfnMwquz/EiaYklULLRRQQhBXfSIthAtIXEKvFUAPiP0uF9GSa7O8PIKfxpxAcUR0D35DVmx
	V5MqZKYQn3QkuCeGBfqQ/EDvmPgRWhnOshEmPnnyYxanqh41JJSchoL+yISOhdsJH7sgDPkZjyx
	FkYgFfC7FIb4DHxTvefdCDktPaPv1F2C/ndgngVYOKdqV1L1rY64DcF2EK+Y7dk6zs8vrr2qoGg
	Nw680ejYVeHgbquKImBNHfqfe8Vq25jyDQUqkKKMkaMydvCRX
X-Received: by 2002:a05:622a:5c95:b0:50b:483d:3669 with SMTP id d75a77b69052e-50b80e82d15mr40947691cf.62.1774438427581;
        Wed, 25 Mar 2026 04:33:47 -0700 (PDT)
X-Received: by 2002:a05:622a:5c95:b0:50b:483d:3669 with SMTP id d75a77b69052e-50b80e82d15mr40947341cf.62.1774438427032;
        Wed, 25 Mar 2026 04:33:47 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4871728a19dsm40109145e9.1.2026.03.25.04.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 04:33:46 -0700 (PDT)
Message-ID: <e03b2cf2-08a0-49c8-8ae6-1651de301a08@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 11:33:45 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/13] ASoC: qcom: q6apm-lpass-dai: Fix multiple graph
 opens
To: Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com, Stable@vger.kernel.org
References: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260323223845.2126142-5-srinivas.kandagatla@oss.qualcomm.com>
 <61596b66-4fef-4bdc-93f2-a8639da79d32@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <61596b66-4fef-4bdc-93f2-a8639da79d32@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4MSBTYWx0ZWRfX/t3fUxrhxIXr
 izAN1o+YqdeVFkvk0xI/Uxc6K4o22DKpXYmDboo6G/SL7Tmm2XxUfAfckBKPTfjhRw8RhXxhzAn
 mKHBLazjf+aEG30X96g7MOlnQXGEcwGhO5KKGJvcDaiisY494RLUdu2ynaO95ihICe1j8iJTfvJ
 PYmik8Wx/RopaQWIbMTmA4gBai6NqI2pKl/m+KLHOTqlAWJON0YlNOl0jZaqS0ELnZnnWInPI7O
 8jaWscXbR5daiJzzLDf98fliWw72vWllgh0+EiB0PiQNzNWSBExPR5hK3+U6Ytrx6bAJrl0MGNG
 SfWV7F/J4JfYnfvKfMF0/7eahgvN3YjhowtyWm33i5bwe+LugkSij3wQuQaPGMrTmUPDDehE0Ci
 yTh3LzClyJhMZvf5ecusIxmxnbJyVM4FpDWl0LYpUNgbLxAx9GYX884kjokY4E1mQYHL5IXhDgf
 rwHg9uFaqlYUlIaXwTQ==
X-Authority-Analysis: v=2.4 cv=VODQXtPX c=1 sm=1 tr=0 ts=69c3c81c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=kvLm1XpQD2xK1ocldNYA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: XBFFUfbjJ9zYX11c5q58tHIScb6DCIxj
X-Proofpoint-ORIG-GUID: XBFFUfbjJ9zYX11c5q58tHIScb6DCIxj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250081



On 3/24/26 6:25 PM, Mark Brown wrote:
> On Mon, Mar 23, 2026 at 10:38:36PM +0000, Srinivas Kandagatla wrote:
>> As prepare can be called mulitple times, this can result in multiple
>> graph opens for playback path.
> 
>>  	 */
>> -	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK && dai_data->graph[dai->id] == NULL) {
> 
> This is an array of APM_PORT_MAX elements but we have DAI IDs in the DT
> bindings over that and now we're using the DAI ID to index into the

The driver has dai->id indexing the array in most places, and that is
how it has been for a while. This is one of the problem which last patch
is trying to address doing a check on the range. At somepoint we need to
move to dynamic allocation tbh.

--srini
> array (I didn't check for existing instances...).  This might be
> impossible due to system design though.

