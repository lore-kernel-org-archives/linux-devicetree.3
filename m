Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776644;
	b=QaN8REp2OOdngFVhNlvwltloN0ZoMatd6loOilnaCv+vpOzfq4JnJ1c0Uh5p5dW9Vb4W
	 8lyi/Kg0r4E2HYX95kAiCO4pWgD63sC4YQUbkk4pXbNHogLmgMH2XTLBSeQGMg8InJU9M
	 sBnbNcSz+EByuU1bzO5FLYy/3X2fT8nVaDQXSbNxiC7qUFYz0BiyJEeXiYeX0zxIp9j0M
	 hNQB/4vkOvLCegGs1B/1foZAs8AwXOiQfUhehYzbD8t3nv8KlSC0w+bxvgb0wyLs9qyib
	 bqhd5Qw52yR+kMMVAV3beuXBV152Kx/R2L7rdPMWh4CFlkSr8HcSH7ZS2jMMGkJzOtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776644;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1BMuPZZADtXOH+BS9eoCo5w3mmHWCYZjVhrpqJ+7oKk=;
	b=hPZbZBGup/arkMHMbfSFt7Ru3n5h42z94YgKT52NH2ZEV0zbos1bB8xUaZiBmHyURLNZ
	 c5pMNIQISLZwGZl7aMauAmhQ7VsfaCfk50h1D7gYMAFY1M/mWNuc0GfGFcNwYKtVo/IkQ
	 WS6wtf6HvlYre52B4gNTCni5dqv9mcy15F8LiFmi8Y5Wlh9ageaEAy070UeJKpfYCKcBk
	 9TJDsakFe4WY8a27GZbDndHxkQE+NrsEZ2J6SUmT2wITtJDEYY+C58/j9N+rfkr3n1L/e
	 tUFis5Qsbz7/bWNVRidrAu7gPSeduxFjENpCHGObomiHGt6gxTKVgLcH6ln6xWL8kaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kIyRG5j3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GlSIT8gE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC6F606A32F
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 21:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EC6F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kIyRG5j3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GlSIT8gE
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFIQf963421387
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 21:04:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1BMuPZZADtXOH+BS9eoCo5w3mmHWCYZjVhrpqJ+7oKk=; b=kIyRG5j3dYGOflKz
	T/SJjWzn5BO2NwkWRAPPvcI0paR3tQ9SoO8w2rMVBEPh9gXicFfLqYUkBQdAFUzA
	PjoZQyi9pWqdZ7ia2WQz1JhlYRHQ+d33XHAwCMsfGVg7F50wmOog7dZCe9kBiW+Y
	bBzkCiBFrzx+DfWdPAfM2x00H3xt7TeuQEw+kTG4G9aYI2QDg55JCMAjS2dJ1aQT
	xegBQ8GmK6ZU6lE0+7clSV+lrcXh1XiEhwyqXyR1UTaqUPx5400lLNRZid0ghgn+
	SS7fedKzqVIfQk67OkECg8QBxcZmna/0977iJHgUNhwBsdKDhUyZgVFstZnzgnp3
	cThh8w==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhjuv0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 21:04:03 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-990aa76e3daso268154241.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 13:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794776642; x=1795381442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1BMuPZZADtXOH+BS9eoCo5w3mmHWCYZjVhrpqJ+7oKk=;
        b=GlSIT8gEX9eSZ261jD8Sq5nbIIktFnSK6z/TuF7GqMC5uazBU+Ptgq2LFTCTb9Wc1b
         QJh09bCMizRBBvBlgA56m7pl7Kj6mLuXR79F23T87wIesd86pSyozl3f8eG/maAKvDHo
         aFPb7PgkbH3i7WuN484k+QxqB55RsfPmh5p2gI6cWZfb6j49Kx4Mtlru0ubC+KT6Fhcs
         K9e8VoPf88HhUjzYvDKgsYzCtrEgDhOWI+/ue/vMWh6lK2y7v8eAMwsxsnvT85dXl+08
         fCyYMjPYoy9/whx9kNPO5hNiawDJXz8trH954TGXw3mhMXgkEad4htegWnrFPRHvNoc1
         iL1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776642; x=1795381442;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1BMuPZZADtXOH+BS9eoCo5w3mmHWCYZjVhrpqJ+7oKk=;
        b=lm/SreajXhAngVT37Uh9lRSLlodfhj7XSBaeHwmeCySvPDFQYWTvsFexSMJoa40prH
         GKV8SbU9tVTv6KqiUWHa8e9HlmdFnA7UDMwDrZ4PKyYZVv7XuaUMH3vxuvJySeaO+fBt
         Q9sFxX/39NKGv2uA/sS1P4aLZc/nFOtbnouCT7fSvuoQj82VVukS2VxTD6slk479iwnO
         2GlirgxQAZgyHgn4OyxfIkUH3d3ySSvTflEDv1OwFzc8kZ64V9xYjilgI1Uqsx9f9j6e
         YI0oz7uDCzOMqPKyIpfn7hjoN0+KpP2IRXUfZ8NYfm/J0nvnaCeUsshIT5o2M/YwPGmx
         XJvw==
X-Forwarded-Encrypted: i=1; AL+hErEtObKPKr+eNSpKJhzkmRgXrk5mFup4osqiE2ArUu8M5EKO7Mq90QXuDrxu3Q8j8eH1W2tohzeMgyqC@vger.kernel.org
X-Gm-Message-State: APuU4Z/PitNiww6ZhdZUQjpB+aVvnY2Z9d9f29XVr77kqrO7XG/idYWA
	rUVPrTU+KUATDsCW+uJc0aw+dDVWGZj6t8/dBlLjTm0FF6TI6BhEUMa/q+RmtTUcrDLDN33r9PR
	nW1kdhTAYfRzP8zqfnVn/4MMV/kyXv2+smD4mlsy5pb3h/Uvz4zVe47esCRhYyfvz
X-Gm-Gg: AYBFou1ul/E58fAMiojoPStWI3U088l3DK1/Dj25jdPPRKjhgm96j2cziqIqBI1xkpo
	H42TEEsRfghiP6MVaIw1mAIYDstF5sEdKxqGXB73kCCb9ZGoTxbBUbtx03rhkQd1PflG5Y6scQC
	tBpuknM68wQgbYnPA53LzWtxpKdnRoc1So7k9Ophvsn+Ne+2cLCL2huURyrGeUmQuJ3007HFzbq
	lBHdw2tTlCJHnRQBoGQBT4m4biwFL7nN9sSM7qfdvY8PodnCxgJJ+krHk8KB2nSf3EvCubS5Hfw
	M1R4bAgKRoS3lfnSygGmbj+LEnTgPiX4sXbfq5m9DO5qjqXFRYAmkBlwvPjUmzW2aBZp+8Ak4+e
	rRfOgHWfWwkq8j8LIzFOft1WFgLaQXZc96J6wCUgZkR7Do+7L/j0m2/bqon/Mwzx6OMkBU3LmBt
	cL
X-Received: by 2002:a05:6102:94d:b0:7a6:a24e:8140 with SMTP id ada2fe7eead31-7d64d6ef8b8mr2317668137.14.1794776642092;
        Sun, 15 Nov 2026 13:04:02 -0800 (PST)
X-Received: by 2002:a05:6102:94d:b0:7a6:a24e:8140 with SMTP id ada2fe7eead31-7d64d6ef8b8mr2317658137.14.1794776641568;
        Sun, 15 Nov 2026 13:04:01 -0800 (PST)
Received: from [172.22.9.204] ([217.110.90.56])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb65ce005bsm156345935e9.14.2026.11.15.13.04.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:04:00 -0800 (PST)
Message-ID: <c86bb364-0a7f-4c7f-8ace-586f5aa85adc@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 21:03:59 +0000
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
Subject: Re: [RFC PATCH 05/23] ASoC: codecs: wsa884x: add VI sense capture DAI
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261023171433.820092-6-srinivas.kandagatla@oss.qualcomm.com>
 <179476416982.140154.10822957842494469444.b4-review@b4>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <179476416982.140154.10822957842494469444.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX1ZGZdCwT/Xh3
 nPDSUBXBEP90bmf9ceSEPIeGcYEiclcB+TLOEUbC4hIN9gF8xpZaYDXesf1fJn6DCV8+/kx6wYj
 5XTwbNx7wXqegcA/D5Y1bWFjFGUR0meqnwOtL9g9N5EX1WoRMhNphm2hnS/gIwC15pwUVKDs3Lu
 1hXolqKzdHFSqXNPRBJoa4bI/wSn3Bl6STUXY9SBwrwlD+DivJ5fXZpRt4tERLGxlg+lGtWRY0y
 oFzA7k/cJHi9hV4BTtdC7EWoQiOFO8zy1W02YmkCZwU0QRxFgz3Uuqmpf3E5SpVGWiXeZIYOekh
 GSuuCgue05neHFD8qEmREb7b/F1BU+ASZpaO8qj+GPTH+3EbIcfveTOdmijdWdiXZwS+3dkIjdA
 Iv8FTtqzJmNREKYSXrJGW1cE1VGMJgIXEElMDiwS0kfS/Zc5DKrmHclyEr5qEsuYZTN5wmuIqrb
 9/zSb4RPaNQh83Mo2pg==
X-Proofpoint-ORIG-GUID: 4FrLkbgdeQBczeu4nsDUedJ6bP0WfSAl
X-Proofpoint-GUID: 4FrLkbgdeQBczeu4nsDUedJ6bP0WfSAl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX++TcKsinl7OI
 9V9HS1HxRo2N9oMm/0RegmR9QOebRS0F6HpyCZTSEy1qupWKMGwfJH4uCADUVW+WjI4E90OBe+3
 +P1bbqO/L8UvbuduTihpbCbJ48ULKE8=
X-Authority-Analysis: v=2.4 cv=X9rHu2Te c=1 sm=1 tr=0 ts=6afa1e43 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=hzUeyGCwRGS7WCfWEAyTKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=I4NBp-wbhaHMoEEwmPUA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150083

On 11/15/26 5:36 PM, Mark Brown wrote:
>> The VI sense port carries the voltage and current sense data that DSP
>> speaker protection needs, but it is described as a sink port next to
>> the playback ports and has no DAI, so nothing can capture from it.
> 
>> Make it a source port with its own capture DAI, ops and stream runtime,
>> and leave it out of the playback port list. sdw_get_slave_dpn_prop()
>> searches the sink port properties by count, so pack that array densely
>> now that VI sense is no longer in it.
> 
>> @@ -1795,7 +1826,10 @@ static int wsa884x_hw_free(struct snd_pcm_substream *substream,
>>  {
>>  	struct wsa884x_priv *wsa884x = dev_get_drvdata(dai->dev);
>>  
>> -	sdw_stream_remove_slave(wsa884x->slave, wsa884x->sruntime);
>> +	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
> 
> The VI DAI has it's own ops so it could just have it's own hw_free()
> which would be a bit less fragile/surprising.
Agreed, will spin that in v2.

--srini
> 

