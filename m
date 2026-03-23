Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D709A3815C7
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 21:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774302872; cv=none; b=h+Tur3CIXJeEOa48uHVvv125LqbAY2064Pbi6MDzfNjvI1UO/csVksIt8VtuAOqiTpmPI1BWL9i6Wkv7xfxCWa0mdUVYyrFDqC/o9Zkplvh0XKTL1RfhP2gnsmv21cPd5vd4zK4Yd4w73hLlZCOi9yY/EywwnCJVByY1gU0p25I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774302872; c=relaxed/simple;
	bh=TQpM8ZYMbSxXZpcqP8xZsRXe9F2SBg0etEpBLmcn9mU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TfrPUh+i5ya3aptuWAWR8chvfwH5TlZ7X+xVno9SCp9QAfINbe8ff5xbZq/aXVGtQQzsr7YxQPOpO9DuSHIhPE+YyMovlnM8eSwWW+UQ5++MaxEpOGVAIr6JPuDljsnJwYE8TKIXCel12rP0ojPfgAosgU8ABCl29gz6fk16/Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XOEFAbdG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KMJ1HMmJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XOEFAbdG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KMJ1HMmJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NIYpfk1909072
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 21:54:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Aev42t9lwy6Gs0aGpanm8SSlUN0xteCCmPHE0nknkDg=; b=XOEFAbdGZXAoLfyW
	Oa5t+MHsWnHPi5wY2j+LYRqboNaz5D+zdsXikmZ7KAcDVmiO8PyMOIT284MB8dGu
	g3IvWcZJMui8O1VE7qy/SJ7C+2yvy/wh9sbItOMS9E5SY98VsCB9Ec3qLKCuamb3
	7cRY8nyioYPcI5mo84HYlKC8RlnY2uTPP//phP8U1WwWebZscK+lvA/30Hcrrj0s
	FkluY8L1Pm/pT9N5nbcpIQb74ueFJMj/SrFLTUnLIyrZ6tGV0JuOCZ1ks7h9k2nf
	Ruuzdw9lb/w0oBSp2A0Mh1AUEHoseM/60LqxmEbfpHDpKecs8gyvpOFRJJb4PIXM
	ep4I5w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3awyrj66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 21:54:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b317c40acso46544611cf.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 14:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774302870; x=1774907670; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Aev42t9lwy6Gs0aGpanm8SSlUN0xteCCmPHE0nknkDg=;
        b=KMJ1HMmJxoZ6kZR9CCEVXbrIpUZDOns+bKi5V4gBgFSazGnP4bsBGxgGsnAvSjfDuF
         nk3b9MyReALhrWKPbr+CIqjXLmb9dzyWdC0CtYdX4wDPNvJVCGff9Jtqqgjv9fSLIQ+n
         Rde0JExmUI0Yx+U4umLGS0JLwUe0PAV95oKSmSF0zhg/7KCYTNPYBKPJNBZuwVPafd9E
         WzOOacM0Om5xcDkBoSr2aWdL+SFWdr42Tw7HQFgzZxUWGY5UDLOXmccfaOqWu9MVMhSF
         XPiK/fp9JOUR8kULCJ/iapuTBriL8NF+/5Q7JwStIRGxUtBkaJFc0RbDb0HOSxVwpi8L
         CnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774302870; x=1774907670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aev42t9lwy6Gs0aGpanm8SSlUN0xteCCmPHE0nknkDg=;
        b=Oquu9zzbt2BPRuJ7GMx7CJYYCAmPLQLoLuHnHuU4GwVVdpr1XuFRorvXalPmzleFCx
         1kZFbC6KkVg4ohKhDilTKtrzzojZf9bXRj8t4VhRko0sykRI1sprXTST4bv9vXpzwROl
         WBQRtNWDKEa6CsrmjqfS9HeOFi39JDdGlzSPlrsW9vq6VaZvjvN34rbgyY6D22DpUSgx
         CIwPNYK8JaBWWiG3+GJbTFqwMtCaYAmqYOGPnsxisB016eS0RnF3JoRcKXtsnV1JBH1/
         KOfuyM7xc5ITF7wgRaOslUaDPk7KSESGpariHDSlH6bHr8wDGE0IcWylKIYJGyrbzpkb
         sHig==
X-Forwarded-Encrypted: i=1; AJvYcCUX8oKrfaX4yJgerNLb7cUY0S4a89vQoF4TdHLTI8SmLxVLoiC6jfGvqg/NFlldrHR5LXqXBZzcAEco@vger.kernel.org
X-Gm-Message-State: AOJu0YxXnmQFkavcjFE7rWAQFrxMzA297j2RRoFelnEKJQzza119/qgR
	XXLj1cqbOt0sfVrcrWz+I5qqdM8XKJgwyPszPNPl9C5fyknCgt1HoqK4U/pZ/mVmzXLnWBw5CgJ
	b8lVdz4MDyqs+s3ODcSgLTxjfqBE1fh6+n5DyUq4BcUet8FBMyEWJ4BPQfKI7I7Vi
X-Gm-Gg: ATEYQzyaCoeeVVzP92GY3pW0bc3APfbDs/sk591Nk0Oeatcve3BkKzfUvNb+5jFlTEY
	tHhW+xURhtE/5PBejTSiolU+A9CJiwpzeb1Me5SK+qqHAQ8QC1XDMqBo0TtlxuGQE3NGoBLskaX
	yKtmW1r4PUsV/XeNPm/iahWkGVuRcdSl5W3NZ5oHrrwZbqOJV/ZctsyI8zKYHEiQjDR2BR5jXZM
	n9WLW7RbICbMx5DZxss2fWXwSrBVKivLzXDd8W9+VXkXpApxuD7Nf8y/dnaLlwwXRdV4VwGcfxz
	hhuvIu/aIM2aQSqNS4M1kKTC/avvdz7aAnFNc1anqeYAW26QDqhtgPNg6TIlQ8hYWhELd0iePNW
	I7jlsNlE6KgFzjn5Uo7s9//0WqEldWLwVaAvh+nLo2sl63qSL
X-Received: by 2002:ac8:5c96:0:b0:50b:5258:28da with SMTP id d75a77b69052e-50b52582b9dmr118725241cf.5.1774302870305;
        Mon, 23 Mar 2026 14:54:30 -0700 (PDT)
X-Received: by 2002:ac8:5c96:0:b0:50b:5258:28da with SMTP id d75a77b69052e-50b52582b9dmr118724971cf.5.1774302869902;
        Mon, 23 Mar 2026 14:54:29 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-43b647177e8sm31794487f8f.34.2026.03.23.14.54.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 14:54:29 -0700 (PDT)
Message-ID: <0006e814-1369-40bc-81cd-241a08080002@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 21:54:28 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/13] ASoC: qcom: q6apm: Add support for early buffer
 mapping on DSP
To: Mark Brown <broonie@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com
References: <20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260320144918.1685838-14-srinivas.kandagatla@oss.qualcomm.com>
 <73bbc9b3-d71e-4161-8d21-496433c24300@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <73bbc9b3-d71e-4161-8d21-496433c24300@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2MiBTYWx0ZWRfX5K7PZUbIS1Qt
 tGRijv27f0BHsTHWoP4xAHZx5k6kXOk7J5eMA3jZEsXdY2y3HCIPGCRksQXmLD1RglGTrkP8OHH
 n/RzdKYeEnhkz5Tww7xbjKRjofR7kaauGYJBY2ivC6H5VBNKRIj8c/FPk27stEH6UsM+OK+nmdL
 tUgJcMUX/XLREBWNcnfysWMNDF9GCzdIEiwOAvAJAndFFKI9cpODF12Q2HxYpjz4NZizEuU/ADK
 qOk3Y8IOgN5WLz6QWwvtuj0l8kOBrZDPbC7xbT6iH1LJNTQnKdKCou5XqPR3+RgDITREVPABiNg
 D3OCWXHa3vpjT9UoGyIZSB4a2ExnJFFhAedKeb3mf7PemqUoVwQXcHHofN1KUEAWf0vrFGOl4Ug
 B/mTgnko7/G5G2V+ycrTylDJS5D2NqTi5SZ4nuH2fEeaRr74MAFDpoydSkAg6/56CASLvLwTsdh
 PY5CY4BogQJOii75mFg==
X-Proofpoint-ORIG-GUID: ElUTDuKujcX668NQdVqDlRv2YJBBdZqZ
X-Authority-Analysis: v=2.4 cv=KuhAGGWN c=1 sm=1 tr=0 ts=69c1b697 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=1IEi6xrr0DJqppMnr98A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: ElUTDuKujcX668NQdVqDlRv2YJBBdZqZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_05,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230162

On 3/20/26 3:44 PM, Mark Brown wrote:
> On Fri, Mar 20, 2026 at 02:49:18PM +0000, Srinivas Kandagatla wrote:
> 
>>  static int q6apm_dai_pcm_new(struct snd_soc_component *component, struct snd_soc_pcm_runtime *rtd)
>>  {
> 
>> +	if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream) {
>> +		substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
>> +		q6apm_dai_memory_map(component, substream, graph_id);
> 
> This doesn't assign ret...

True, should have collected the return value in ret.

--srini
> 
>> +		if (ret)
>> +			return ret;
> 
> ...which means this isn't doing the right thing.

