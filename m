Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C86E49365A
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 06:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787638085; cv=none; b=i3GZ4LLTHE82LFUaCWHsGPXro43VoA/XPiGDcXWGqJLBnsZd+ARRSl87FL4G3lVLoI1XQPKnT0qFbxNqPkUSOJEClYsyxe5Gv8uAL7X+IHBivtfTXEnhdG3aCooXLjKxCpEDExuaKMiPtGjurJWiAjVZBreYBG8x+yKAmzZzfTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787638085; c=relaxed/simple;
	bh=RLEloRLuD+ixdMI2Y1Po84LFsDM/JIJXlVNhL8C4hrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y2AYEyXMB0L8pe3qyCqWaLPg+uhpQI7BGZksasfbvw35qWrogZfxC1bnliYgs731W/HMPwfB78f3e87aaQbZKEKNgsvwaoP3PEQwE7CyHMMrPhM7phA3XOwyiD3wduFugpyiGzvm544e3reI2XWVjlbWrJVsO7TYfBLprR6+fQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bwzApbAV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KtfETq9o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bwzApbAV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KtfETq9o"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2Qv0w1633627
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 06:08:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5hD4rH1wbx/QvdxTxVE2CBG63Z9YbrYWbrM76H+HcC8=; b=bwzApbAVBYYkcvtu
	UCekxB1/01Mecax2Q7Q0GCEl89PG4fGiB6QSRLG6YzoX/ayTW5O4cy7qQJeoULkc
	uL/wZKaE4XrrSNmX4HAmZLmeoKtO+wVUN1a6tOAgvMn0cEOGK2XT1YEgHIhKiewR
	5aFGwFUGDsRB5Er0IdMLvDexg7DbelL519EA4AKQMWMDRGMSL16BRwXcWHy4D8Kj
	u8T90pHbjvyuE6upKJehDFRYGeaAAo3tNZgRJaPHQz1welghjhocfYXC1tJKxbFd
	3F8eTfMlUc1stA1y1o8juFiyi9YSTWaaKrJJhhdnDEvdKUbRtaT+mzzeZ/O7PqXx
	Hl/oWA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8swrafes-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 06:08:03 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-739b4a4301dso3771095137.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 23:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787638082; x=1788242882; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5hD4rH1wbx/QvdxTxVE2CBG63Z9YbrYWbrM76H+HcC8=;
        b=KtfETq9oZPYy84E6V39QEkODe5C8p235VlYAgtpUSgDbl1UnGxrmKA5H/VfGM5laIJ
         iIiNWOUaLErjNIZBz1peGdX6CidBcOqounTiroGOGtQjXRDVTUOIA1xxj/6b4pMnfcWa
         g1m4rSKa4qgUjhsXwVEu7azA5KZp4NiJOUl78lfjJwy93AZhiXKFA46DPTk8+m/4TAgE
         5A2oYnFX+ywK4trge3F1fj8Qt8k8h1gRnm7q6Ti5b9EvU3UStHTRQ60A/n33kawlaUG1
         AcgKThzthUZuRN8sxcnSxUeRXzTbsJUHfgcLpS8vbUaj2hDzOJSa35t1E+1vPnE6mFTA
         G6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787638082; x=1788242882;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5hD4rH1wbx/QvdxTxVE2CBG63Z9YbrYWbrM76H+HcC8=;
        b=WmQ/Yn2GwGU2XBNIVVdVQOI988kNXyHrL9oX1R+vFXkDjFqQdwLuvlB7xD61/hPvus
         dob5N+EDm/mC/aetH3sHqAW72eckN6PUn2BP0WUVEx0ULZ7NKYikwmI7hZu0ComrB9nR
         nFzq2zDob8SOs5AdNdmMsICApLl19jq1OKNVP50+BTJhlmWZHucGI+lVFEaFRfj46MMH
         J7SWzKRRYzuYPQHPOf9r3JYP8v6nD5Z4jxqM1XlqX7EZG6Sl/BZS8AgKq4z9+fJTZ6gz
         jwYwaoFsipZdruwev5XhIYu8JjI7gh7CjbZvwn3K2qZQv8QEXNLVZBjRypn1uP2aqx8Y
         9Eag==
X-Forwarded-Encrypted: i=1; AHgh+RqH5RfuvFpz+rIbOgwwDIonbO0qYwq/oMMZW306pcPUqL6Bkli7BAzBDGRtg6hLd1FeQEtaV4ckAYTg@vger.kernel.org
X-Gm-Message-State: AFuF++kYwfYkPd2vId8cKX1jzQcstJpymBIim4icaX+FjOf6vFSDBIKD
	IDyGR+Zo41unqZpzbk3tsBUDgbU75GO4fp1H0vu1UeRC4htT8/BtM1VzJnpMtqTUjIKjjtcg8bm
	0QsrJVRBal8E2oM7F/T1Ro7c5kBgGFxdh5RM59q+RYzdA8pYHQmrw68BvD/KGZiSE
X-Gm-Gg: AR+sD13DcVaQoVZUamo01cFnxySq+ACmezIwc5JGcbcrQ3MeOs/mfrYBOYpoCHG5gU+
	wMRGGeTbYUnKNTgQbLjZ2p/q9vZJ/s7/ziCWGM0kQ1UIP01qp/m7duFaiFLpTbUg9nBHs9X4YKF
	autx0r+2J/+qZ3jjsppA6xjoX7Gzpyfe38lch4fgWICQAzhk9juKfk7AM+fxeqWZoPiqwvHxyKd
	nW8X9CYL6q830o0fwkuvJMLaITScMhQJ88KvOJrNHYxY7ZwSDN3KN21V1b5WYnCG6IJZlqCf1L4
	OcW6uZp3MGY7QZRy35YVSXEbapYQVo9FnzNsKBb5hWUkM6J6rdlh8fiSYBKI/mYXdNFIxnMIyFS
	XaFouwaHGb41MlUgIPIH/t4eh5Ncz
X-Received: by 2002:a05:6102:a18c:10b0:77f:fb50:8820 with SMTP id ada2fe7eead31-77ffb5090a4mr904674137.11.1787638082281;
        Mon, 24 Aug 2026 23:08:02 -0700 (PDT)
X-Received: by 2002:a05:6102:a18c:10b0:77f:fb50:8820 with SMTP id ada2fe7eead31-77ffb5090a4mr904668137.11.1787638081946;
        Mon, 24 Aug 2026 23:08:01 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e00108asm18214296a12.2.2026.08.24.23.08.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 23:08:01 -0700 (PDT)
Message-ID: <dd8fea71-3b12-4c37-a1da-4b75b4c48760@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 08:07:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] ASoC: qcom: Add QAIF PCM operations
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Takashi Iwai <tiwai@suse.com>
References: <20260824063627.3595610-7-harendra.gautam@oss.qualcomm.com>
 <aff28775-b27f-4440-b7e8-01bb5a8ea906@web.de>
 <CAC-tS8Cxy9b2CwBTno5fAcjeXBd4jYj7KV2NqCjOccu9i5HxmA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAC-tS8Cxy9b2CwBTno5fAcjeXBd4jYj7KV2NqCjOccu9i5HxmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Fgm1c7pllEml_jW68tERMmTortZYK4Qo
X-Proofpoint-GUID: Fgm1c7pllEml_jW68tERMmTortZYK4Qo
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA1MCBTYWx0ZWRfXy64lyJtkDjtc
 0YtlECAWUtGPNhwTLAKTcUXSJ5DXw8xE1PN5KTjD2+YqUfTFrhwmRJ4k3xePQwuuuiH7prkeniT
 NTe/DhcrfAB7xfVevEYac2SBsjB/2QE=
X-Authority-Analysis: v=2.4 cv=TqPWQjXh c=1 sm=1 tr=0 ts=6a8d3143 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=P-IC7800AAAA:8 a=L9GsOlX-8J4CZk4H7QYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA1MCBTYWx0ZWRfX3KFppVsZm3Rz
 vFHI16xyPVibCv+k+/KQL7akAF6T9YKbzjp2aQ7K0+XDG4YRvF28GHCUGmZ+DqJkyAeN9kAJbSE
 EWz8BlKCTGE4CVkQrNPkLP3flcfOGdUcWgruILD+9ukJFv9YZIei5g2+zdhrwpDUlUF1QQ9bvhX
 DVgpVD6TJ5Yf2FHGOhRtZ7AZDfA/dVF5C+/8maWYBwqM3cNXOWToWLNcdMqt1q41HidCg2nDqRp
 EJHJL7+qrPNgoaAJ3feqYQlw/hnwo+p1v0KTakTG0t7dqaqmDJvEUflP7i2ASaI8QOi+vCwUPp8
 FWdgvNhnsCOr4p7/MmyWvbsVE3+NmziD58N/YE5BSMVAWejgMiELXQUSeSFITvYCoGXxjAHYMIk
 eNsMtqTBBVsOSOc2b/FaCwu1ll7yz0zGJY3fB6Gt3fcKSMTptdYwGkqtrNbfjYmYbuWNRr3sOfH
 rOTm1nvnlJJBhevVctQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250050

On 24/08/2026 12:10, Harendra Gautam wrote:
> On Mon, Aug 24, 2026 at 2:55 PM Markus Elfring <Markus.Elfring@web.de> wrote:
>>
>> …
>>> +++ b/sound/soc/qcom/qaif-platform.c
>>> @@ -0,0 +1,544 @@
>> …
>>> +static int qaif_platform_pcmops_close(struct snd_soc_component *component,
>>> +                                   struct snd_pcm_substream *substream)
>>> +{
>> …
>>> +     mutex_lock(&drvdata->stream_lock);
>>> +     if (v->free_stream_dma_idx)
>>> +             v->free_stream_dma_idx(drvdata, data->stream_dma_idx, dai_id);
>>> +     mutex_unlock(&drvdata->stream_lock);
>> …
>>
>> Under which circumstances would you become interested to apply a statement
>> like “guard(mutex)(&drvdata->stream_lock);”?
>> https://elixir.bootlin.com/linux/v7.2/source/include/linux/mutex.h#L253
>>
>> Regards,
>> Markus
> Thanks for the pointer. I believe guard() can be used across all
> stream_lock. I Will address it in the next version.

No, not really. Obvious code is replaced with more complicated one.

<form letter>
Feel free to ignore all comments from Markus, regardless whether the
suggestion is reasonable or not. Several maintainers ignore Markus'
feedback, because it is just a waste of time.
</form letter>

Best regards,
Krzysztof
