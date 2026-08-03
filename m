Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AD935E1A4
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 09:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785750008; cv=none; b=rjSqiq5mfbwsAgsSxS1pcQ30b/j3kUFTMR/0X/uEPN0Yuj2sANbVc5kDGOKT65o7PHfkEStYCFTg2oUNmsUDCVdQqvF+u+92Gtff+79LBHB0TQhCsZvVhOGZmF4JWXDmVGdgn+4d2LY3d43asjJOEPIEo5WfTwM6O27tBNkaln4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785750008; c=relaxed/simple;
	bh=RRWgcT0TYgbIRmpDLa+Wa3goPdp4+rE0NIOk5n647+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xh9yNCV0DdOha8deXmqfzbiJmW4LTXyy92Mzs3YNLn6GclLg106pLVyQtHyXPtmkjMCsrVCtCxXjgcaIvxkgWkECOxNzLu2OwWHEQBmUDWOufOjE8ITNX5AoAgrR+3G+C9MOiEtEz1p3VMidSfW8Ttbu5600Y42/n1zF+j0yJBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UGEHqhUr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fVHrKMbF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UGEHqhUr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fVHrKMbF"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6738F2WM4178981
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 09:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d6AUI7o9/3m9Nx0dk1Vjh5FS62SZ3AH1cQ8tSlJIEdA=; b=UGEHqhUrhwPrxWCi
	b3gaLTfW0SuadX3nB0yqEQWpNNGeyc0YK0ErpiJ+1xfrWaAWDcogoF2WbyH/KHkX
	dNo6EiZVXWx8WQUydq7nDGWOfTsf/xdjiA9vEco84M9R3Q6leoDIvTc3vycHWINN
	4g2DYJ5YdKstonGGFu/lb2GYb9lsiYJ0YjlJ07ciP1wsVHknmUMtXWrkE16B5DQu
	wLAcLn18t8ronIxAEr6PNV9UxeGmsMPTGeTYOLnO0nfH0gnnKB487FLRVv96mjDu
	ntv11yqvp7DzjD5u7N5xB3u/itDwdGtMqls3SG7ON7R4p6n/WxQMISjWyPMMdgE4
	JUEtqQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhkgvse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 09:40:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cee1ec30f2so36415785ad.3
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 02:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785750004; x=1786354804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d6AUI7o9/3m9Nx0dk1Vjh5FS62SZ3AH1cQ8tSlJIEdA=;
        b=fVHrKMbF3/PEZFrpoGNYw4FtlKNR2cxQj0ZfRA4Q3mQzZBeJng+7dtPp5M91obgDff
         utaGBMBuanD5UaHF8gurRDPbM71cJ+Yirv385rw7KzKgvjo8v628OPMGR3DwxWBzLkYq
         bvW5AppwvxqRY00h/ChK/CBWiDPB9qt81UXsZmobcom+OsV3cEFN2gmiAIvy+bQsZbeb
         cE2gVdNpFexnYjkJfJ4n3RJYsuNstf05RxTOAbbRdMGoB6iBpH4uizA0NSXul+1K9om+
         ixgve+1RwkeGhsciQVgF4LG25TiJI4YqEisyeUW/OhsdxBxH755Sahm+c1gyXnY8iyRE
         c99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785750004; x=1786354804;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d6AUI7o9/3m9Nx0dk1Vjh5FS62SZ3AH1cQ8tSlJIEdA=;
        b=HZP0gH8lEKX1MXHUkT/YHUgMI/9To/mnV2fTGJ1mvTqGKg/l7q09azDvBtIjHa6y/j
         qXvwi/xLz+sbdSEHr7ut7df4W0s4g3ip0x+qN6jIfooBPaCdUjzBg1dz+lU1OfHsgoG5
         0KfrZBMSoAB/5pUZUBFhwjSfqG/adSq0Y33eVVpaYWIyq2vzwtU/riTnfpHLCqG5jBHl
         91S8Y6MzXyFJSMv1jFC0BHexBhJNZNENZ7oywrCi/TrUcXJ2DM8/4tQvjPhHQt5IVZvA
         o43yKkQhcSXM/6d/ftB0eECm+UaWVcKS7mPUwoswYcHTo79EqurzaWFGzxo1LMwcyzmh
         Vh5g==
X-Forwarded-Encrypted: i=1; AHgh+RoMXHeGvXn25rdEXkFn0hfWk2Myac2VU/teD0EDjJs39S3elbYL3Rpzz6KU1S7ruyX8cajw75VkD38r@vger.kernel.org
X-Gm-Message-State: AOJu0YytnvF/1Arj3oRX2i23+65kqJHjVt08HwkCuA76kaF7A+VVDb+c
	ikmfdZRQmMFKjm8DW8J5wD+SonixgpCyHVGbl0ZssDX+HK5eDdV3fXDUwLq9tOS5p8hsIYD8cxj
	voHLtONK43xCg29pNOSF7kgHDVeJQwwTirX8qRd3QywYNLUryEZ5W9HIg1ksM+6cB
X-Gm-Gg: AR+sD11a898omIEtgxaN3MI44aUwwAqQN9WTyaIgEqZDKJ6SC3thF7lpob10ExbAeD8
	lArK9VNTaj4CGkouXnYIO5tHES8QAoANQr+LnNK9KzDCsdDzNsPtUyvPnGRgrF+mFIEyisiasnC
	jmptyqoP4OpTdj70OV4IwusKw/OtAj1xWNSFlj4LT5222Jmp5WtzTRi2q7FMx5w8hXB8Y5wYWcm
	WGCq9DodEkmZ+0rxsVjDN2E1A/HbkFe1o5yfaPej0pR+1nBF2WKmCWg6I7+i+JIaJFyCq9GlUxb
	gKpgc0VSB6Bd6xg+5Sk78fdRYfyK5AfESkRZ9MSsEhZuNWkTfkpBs0uhXveLiuz1CNV9Y6q/5Kz
	SjjhUxoxDLqa1dnvxJ6v0L6+pr6l2CzG04g==
X-Received: by 2002:a17:903:390c:b0:2ca:ce92:6e44 with SMTP id d9443c01a7336-2d05218984fmr89075945ad.8.1785750003667;
        Mon, 03 Aug 2026 02:40:03 -0700 (PDT)
X-Received: by 2002:a17:903:390c:b0:2ca:ce92:6e44 with SMTP id d9443c01a7336-2d05218984fmr89075775ad.8.1785750003264;
        Mon, 03 Aug 2026 02:40:03 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b15d27asm34889545ad.78.2026.08.03.02.39.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 02:40:02 -0700 (PDT)
Message-ID: <21e896fb-43e6-4681-a00f-9a2b666030ca@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 15:09:58 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] ASoC: qcom: add AudioReach TDM backend support
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260712134110.3306763-1-prasad.kumpatla@oss.qualcomm.com>
 <275c15b9-8a46-4e55-aff4-9e0aeb01b730@sirena.org.uk>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <275c15b9-8a46-4e55-aff4-9e0aeb01b730@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: n32NcSndqDneKycK-MxQM3-_3v6xx3Q4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4NSBTYWx0ZWRfX1xW2oHSK5x1G
 qcUrXCYF7aDIzcLH8KvWhqzuh+QOqrGQRptQMXIKrC5rs3rs19UKoBR1TYafJ6SsVMDhp6cVc7t
 difCpkHwMYIYJuv+wtXOTTc6jYLv4W/czw8b6pr1RU1GCtRLzb5GiAEcXl63zOXRPM+YDVtMYYb
 FoH+4lXffvx29HproVxDmbSSY9/JKZ3FvA4yXXByJfw96hAf+EQwE/xeVXLwhtigqit0eF5RW6G
 iMWe9o1MQT13bf2B2FsNRz5gqmXap+KJm9dpk//NOcL075PoVSlgIAIRAj1sP6OFeDhINZIvX7f
 yL+soV7kik+XjIoXjjOcZtTqvPR7UrMOvxZ4i2MBEE0iXtwmVhITI/weSssMciDGD+yPDKncNM/
 NedPI6SqqJEm5uUJF7tPWCR2ak/MTk5b4e1tCwC9KLddzVYFK0tPRmJArLKh9kMhrZAfoYIj6Ja
 bIiyeD4H6NNCdBVjowQ==
X-Proofpoint-ORIG-GUID: n32NcSndqDneKycK-MxQM3-_3v6xx3Q4
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4NSBTYWx0ZWRfXwKwVPMU6B2ua
 2Ua67aGjwUXM5SiDAzdChmD8wtZerQtwR8p3f5hTDo8WJkOAATkEUDu/PWkucaSNqk0c8DQxs8t
 zONvGyNJWP4LITk2Q83SepTBz+R3chU=
X-Authority-Analysis: v=2.4 cv=UIjt2ify c=1 sm=1 tr=0 ts=6a7061f4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=XciJB2WwQe-gzLjzgcsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030085


On 8/1/2026 5:35 AM, Mark Brown wrote:
> On Sun, Jul 12, 2026 at 07:11:03PM +0530, Prasad Kumpatla wrote:
>> Add AudioReach support for LPASS Audio IF based TDM backends and wire it
>> up for the sc8280xp machine driver.
>> This series depends on:
>> 	- https://lore.kernel.org/all/20260711125740.3083236-1-mohammad.rafi.shaik@oss.qualcomm.com/
> Please resend this once there are enough dependencies in to allow it to
> be applied.
>
> Please include human readable descriptions of things like commits and
> issues being discussed in e-mail in your mails, this makes them much
> easier for humans to read especially when they have no internet access.
> I do frequently catch up on my mail on flights or while otherwise
> travelling so this is even more pressing for me than just being about
> making things a bit easier to read.
Hi Mark,

Thank you for the feedback.

The dependencies have now been addressed, and I have already
sent the v5 series with the required prerequisite changes included.

Thanks,
Prasad
