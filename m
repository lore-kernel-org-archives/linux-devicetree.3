Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7414F4B95AD
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 17:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791998332; cv=none; b=WeE1upMjHRYcoPJvLwq1MRUqG6LT9PdNrxZTfjdqUD27T9qA5yErqsjw8xgGszRO65WP+vK3N7NqDFI7GcEn4hiQffnPoQ/fE1x/sB9qvgBrWKaVqBCUfjKlEulHKLyt3Is35is0eLHHnELsrd+yETfICX+rsXAcVDiKkNIHOYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791998332; c=relaxed/simple;
	bh=+A9h+HrciS1jUyM1n3Niv63g7pLYlAidJxXoLzyQlhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GxBS2qE67he00+zM1sxbM8QAYS+QeRTPHOCUlWfDTdjzCldp2hGgx8281+XQ6IHk2H4l0qLxdal2psbAy+WMCNUAmX2o/oznqXmKepGtfKN2BSJWz3rNvd3DNp4nilY0Zqe2bD9DCQ6ZrpwxDc8KeoHtOoU1iEG3VC5wCaOkv8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gDUHVz2X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XcIYGrEq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gDUHVz2X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XcIYGrEq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEb3Yk1013196
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 17:18:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y/qCByzycn+B3kkz2skwMI7OpUktdspIUK2ccIXU2BQ=; b=gDUHVz2X2N4nKlK1
	9d0GfbuuRhKnWi27WLFsjAk6144T6WQv4gFJE5vaspnGCxv/NKVLvoac51xnLLNa
	WrOF9bWbmyYvznGq87RYwgHAoyehPSo+IdczmyjE5DG+uxM1G2gpzwJooEtRVtFD
	nZF+ve/mSOeAKMeoVQ+NOyfLpO2Ph6IgP7JqenyWoduoIRsOD4wFmBYvUxZqXxwU
	niKX0iOgAjSRqTSBOjkxn3FrIoEtANSyGMplhabWpHmo62Oh2HxhKQHhpuuDX9vJ
	6YkcZ7fnhKbc3kR48x/j7sd3u0ryq18oyaGjDzmlDOSLQVUwXsWUFqk2bvs1tHJz
	T1fC1g==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha80csn17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 17:18:44 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so16668890c88.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 10:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791998324; x=1792603124; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/qCByzycn+B3kkz2skwMI7OpUktdspIUK2ccIXU2BQ=;
        b=XcIYGrEqFfbWpDBVhJ/KxGC9djdguGflnpUDIxoK2u8QsKO1kSnxlIpLV0d3qzO5J+
         dcgDM/0hML5owCURkfdaL3Nwo7dG8PPXbTuPy7spwDIqHzVc00/PXBXmJG8unmZXTt0A
         Ok2DSIiVNdv7zvlfkHTpWvovPynW7FtWybcNKfnfZc1Mgg099/7d6oue2gjmXuP/4FVB
         Mz5lwbmcc+TSJ2MtGAg2co0RX/PCYbGRb8hBpoCBKgyw1oJYX131XzSeDKcQ+NvMZC3n
         GOo6sPjppbXONDCkBNGRbYXmZk94rEAu8s9jP+7cRvb+Y7WAkW56LI31sKwVajt7y4Mi
         0STA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791998324; x=1792603124;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y/qCByzycn+B3kkz2skwMI7OpUktdspIUK2ccIXU2BQ=;
        b=sqpKGQJPA1ylnV7+iUBCugMSAEiKEteN7M+5zlu8ATwn7Jv5gE6ia6HTD6KuB7LB+F
         Mfni5ZGJDSz+6Glc6msxrsw5kee38zFjSup/OFUy4bacfmeAOd0PXA+jBn351merbELd
         naTMWi8p1dO6fPgav/fwkMhImD6BGwR6wgE5XZ5FBbG/ZxP67EUdOBfi3Ok1rWQ8cxLL
         +sLifXbE2Ca/Q9vz8ihIGzpIhziW+GvY8+ZRQK0P+gzl7wBxQl9A9n9ATeUmzAPMVHcw
         2drytE3LY8D05U+4x43AgCkTNS1LFFTeshdUBWAYK6C9q7XOXkQzfEt1tDs6YASIVIwc
         yBww==
X-Forwarded-Encrypted: i=1; AKwUvBxDhcN8tR87T6y08JHV5zSyBsXlgE3aiXrfU5I1XpQ6bu39XFNIkVdNoUzJ288n9HvUqRvfK4DVkvJ5@vger.kernel.org
X-Gm-Message-State: AFq9FYI8SiCIjVzXVfc2m0lLbUN6VZZZq2wbad1PXKZisKVsJupbIz+s
	/vW3OJnrrpjZUUKtPACxdqbp9qW7gXh6cQST8UaXvpEtl8r83ol9YgfiwHNIf15UbMPZh9b4Yuu
	nPMn54FAvEF/Mtup1cDq9HUQN6vU8CcF46Jdv7zAELDQFSd99QEBCVOfFtW2WKfwI
X-Gm-Gg: AYBFou1aQsdcx9Z65sSVCNIKbj89mUjxPqRCPXFDmidNXOalyzSzZjxW4m9S8vwtJcA
	u+75m4PozUo2UcEfOxgHP9czfRNWV1Hdna4E4eCTl0NXtcgabtPuaw3sQwaovqEaaY9fNhd3iBs
	75TrwcA9O9hzNv4CJtXTjhpKmWRwCuVbw9lHsAi0CFkT7lIZJ6o3PBDV5AcHz1RpB9Mw6Y9jfuR
	LoaGUNXm3z7FwlG3PibL6eva9QB51I116+pkaCOz2vpbbSOGchRvMfRr1rFeaHXJEKqSzlKu2EJ
	JsH3QpTV2YnGN2ZTsgKSjRIqirTwOb9ztdIJPt2EmUw7enXyyLZyznYv2vGObey2Jx5dgTjkbAj
	BSHDi0f2QHVPwExj4BVT+MPBnezQZMFNKPR4LCdg=
X-Received: by 2002:a05:7022:e806:b0:178:4a98:8751 with SMTP id a92af1059eb24-1784ab70e5cmr10483780c88.37.1791998323756;
        Wed, 14 Oct 2026 10:18:43 -0700 (PDT)
X-Received: by 2002:a05:7022:e806:b0:178:4a98:8751 with SMTP id a92af1059eb24-1784ab70e5cmr10483748c88.37.1791998323154;
        Wed, 14 Oct 2026 10:18:43 -0700 (PDT)
Received: from [192.168.1.5] ([223.230.101.206])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a2f17feasm62844317c88.9.2026.10.14.10.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 10:18:42 -0700 (PDT)
Message-ID: <3c40a4f7-b191-4a04-8886-7578fe3baee2@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 22:48:36 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] ASoC: dt-bindings: ti,pcm1681: Document the
 PCM1681 supplies
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
 <20261009-nord-asoc-driver-support-v3-v3-4-0c1897f21ccf@oss.qualcomm.com>
 <20261012-aloof-cordial-starling-4accc4@quoll>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20261012-aloof-cordial-starling-4accc4@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2OCBTYWx0ZWRfX2B2Dv3r76ujc
 k6lF3+97pi53A/8mLljyLpsdAAuwfZ9sVRZom/SVDx8w2ucTw1otndOVqs3zVtJCfh69Rpr50fz
 1GJngkHRoJHxOlCUWqKYsS5X181tPog=
X-Proofpoint-GUID: -zlBQCSK_qoBMUNHcqfdl4L0DAdCfLE1
X-Proofpoint-ORIG-GUID: -zlBQCSK_qoBMUNHcqfdl4L0DAdCfLE1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2OCBTYWx0ZWRfXzGjWKMM40E5c
 9T0LmpKp7oerM7cJ3THbYc5k/O2qINgclNHZJJlSUJgn9MNoHWLUnSgC5nm6BYQTJsmwojbZ8+/
 GuYKa668GOXnpUkgpyB0zO5ahe1G/ftNndqqPIfU5HwW28nbUCjAaV+5J5RuMfMzJiL8cmYpLHf
 i0XdApsAAbjxab244xum9f/jXyzMMVbk1FyarHOz7L/4Sri+iq4cZlJmJNkpc74TUb0TQoAWS6y
 SbGrowm8ThusUtjrTnRU2C1q0jdzjVhrluqowdkYUVQfij8njdLnJG7iyBBrgAlxGf6bTepH2s0
 gbCKmXxuZnLnDD0KoJS9mOeahhZoVjwWO7u9kThbndrnKvVAStk70kSsV7s/e0S9Df9adCPoejB
 vF7zbtgDRANGO5WmDnz/YM+GTreDXI5j/0IFqHPqEE56CUtxMLe25F6J5nZzTlYPSJnjr6yPDPB
 ztMoxSLCwaosF4+xuqw==
X-Authority-Analysis: v=2.4 cv=JegpPkKV c=1 sm=1 tr=0 ts=6acfb974 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=89gBhgtN2V0NwPD6rb2Hew==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=EeIf7S6Bmj70s5Vw-GQA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140068



On 10/12/2026 11:55 AM, Krzysztof Kozlowski wrote:
> On Fri, Oct 09, 2026 at 06:42:50PM +0530, Mohammad Rafi Shaik wrote:
>> From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
>>
>> The PCM1681 takes a 5V analog supply on VCC1 and VCC2 and a 3.3V
>> digital supply on VDD. On boards where these rails are switchable, the
>> codec has to know about them to be able to power the DAC up and down,
>> which needs a way to describe the connections in Device Tree.
>>
>> Document the VCC1, VCC2 and VDD supply properties.
> 
> Property names in the bindings are always lowercase. Please see DTS
> coding style.
> 

Good catch, will check align with DTS coding style

Best Regards,
Rafi.

> Best regards,
> Krzysztof
> 

