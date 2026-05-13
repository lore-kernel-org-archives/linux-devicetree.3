Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C196426D0D
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 13:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778677795; cv=none; b=GZpyiuOFyOw8Lv6ldqbmDL7/8POqC3IP/bD41ERKf8gOVi58cUV1EQ7RLuUW8e4JXVNVBaf1A61d978kSrT5ID0/6/ioQvrQ1zuJtmceS9apm3Ylpi6H25v3h6PanQqP7/tlYnDjnbyMNChLwUF6qUZE1Ytq9POVitkZzIb5s2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778677795; c=relaxed/simple;
	bh=pPhZN7nfhtHHRw6dhJOnhfHiyh5eQfG5r3IROqjHaUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UJj9MyJPTptiXameGjBh6v6//GLDO+pQPVGfNFqrm7Qw4an98qyw8x+gYHZfstbg33CsRbiBGvWzzJF7ylyY+aDOi4gyc//4mVmHnC2XLazF1EjrSeQu0BvtiVIWKlvTKNyWLfmmCrxXJjs2nF/xO3u3fXTqNdQCbzw+csntffY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lIHXbmdr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YZWUE6rO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lIHXbmdr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YZWUE6rO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8xZCh4161609
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 13:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B5SnseXY8gWAqnQpvJungSJKJ2vcNA0bRZgJ6p/nT8Q=; b=lIHXbmdryhAAdCL/
	HfbH5KgK0BohO3ARBAdjZHiUBA0hBdx/x3+IXo7NGxGPRtUrdxEWhE8jX7tSqslj
	FKkwMUezvxpmTSKUuUldw9iF4Vg4hk98A0M5RwAowegqejjQGylUj1sv1xbNHCn+
	2uWWbvJiJBYX8XiPRCtVQ6O9jnCCErdIseRLb5xrhO74OpCHxlNqpQy83AlUhbDI
	J4mueiqhd9sqtDcsAkezYjTVX4n84BkTvvJYwzkQp6mmqjldFo2/lDJ7uKLiK7kp
	94eQXYVtJaV3aOuvrj0uVvRvzjbVQ6/oJGwuTedS/LrfUGedIomGFaP5jIVO7DVC
	akOk5A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91rw18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 13:09:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b9fe2d6793so122224265ad.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 06:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778677793; x=1779282593; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B5SnseXY8gWAqnQpvJungSJKJ2vcNA0bRZgJ6p/nT8Q=;
        b=YZWUE6rOAwmrjSAkZz317QFUMWuWF3IfV1VCxRWwW60WI+Et49M+pbEpewpksR++7k
         moqABE6edxK4cKHl+N0H6yrZWIUZoiHSbaBP+ntuAEasHOQ1KJZr3xS7fRgj3eA7sOrY
         qpOrq68sBctZhrl0KML1OpocP+96SpW0hSWkxkd23SkyHq/Jm0BjW31dPoIk8XI6vuQl
         qYOreBVn6WoTJqHm3ZZ4109xmmxVl6X8g71FnktWmbZA7DW0THZfrlSa6X+5haIHITxS
         0Z65uL7Osu8aiNASY20m5myeBqHXwyYnV1dbX54JrvOhPVcRaTBYXiMxjbzTJ4ZIurVa
         KfQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778677793; x=1779282593;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B5SnseXY8gWAqnQpvJungSJKJ2vcNA0bRZgJ6p/nT8Q=;
        b=Pf3idIoSk8v4qQwiTTwZnooiL+V2RbzA8V+C1ol/YjgOPyliAUQuUpIQsgRPIsXx/t
         0KaCvtDfX8OuEiFwVdgp0zQvMWr9u3k5QirYfmulxp7+UqTGVY5pE9u9gk5HX5VIc9wc
         V6Pe9RmJQnmN5aktPqN6eocL4fHhUG08IrKHdIp1WjmtoK71mHQx0Bchj64KWkPayJJH
         1QJxCcPEx6C9n5yoar9PNpky5z0mmAsfBOTY5OtpG+Z9VVyq66O4n982QwiT+i06oJ2q
         imJYQTAszAek7+J+XkeTwaDlXht4vStrCXHZsBvPGUcplqVCzk+W7N0QNokyladwdIJq
         jCZA==
X-Forwarded-Encrypted: i=1; AFNElJ9n3nDPVrWktme3U29g+jcXiSMTLcHCl/dPbAk3Ln2zptNif7lE299KVCZ0/HSupZaxmi2Ifh37q8hn@vger.kernel.org
X-Gm-Message-State: AOJu0YzkIGBlaY7LAEN2nd0qtejDO7r7OgRCx8Jv0mis8vXJXa9tqxGI
	YhkC+vgxdeBWQP8o4sO3yd8y6vEKL0czMiZkRy4LSABAdwUS4fMmFrpwCUX6WzYNl8YQ2sRJQiR
	YPhx5pGTaszEtl9WnFhZ4qsQmdObM1vo1Wnm0nz6WB3ELJVcqcKEwABKZWLZ0wdxu
X-Gm-Gg: Acq92OGYSl/lA+KC8BXdWX55LKuQrKuomNxy2/pBoRjxGSwyklS44MJO58AL4kwvw+U
	NnOBgBi8vIFgGFFLOeVDtYTiF4lRnGLFx8EQus9rCCX+9ZfYDIwejTtBomjXtV8ovxY3XCmXnJU
	Mdy3toWYJ0KyczGN1mCwBnSGEEf5bBdEc755XCwgX2GxqsbLECbqoyMrCBjkxSpGOtWg3qDM1wh
	q2jr7DEJjtXDs9gV5A1lF9Xp4iSiWVg+gLZQhYKP3g2PCpAJD5RUk+6f4FfjAp7gvFzgNsGKgCO
	32+JRGicAEgBkY5eS+3hoACWODjjme8AKkS9sOaaYIwxu6MaSZzok/RGSyA18r8w7Mv7t+ueefe
	KoYXqzDgFkjvoCwRlgUw3Oboo1IkZuTZrkjX4KBCI2KD2yRI0DVWhz9M=
X-Received: by 2002:a17:903:f8e:b0:2b9:ff02:a14d with SMTP id d9443c01a7336-2bd275b9de9mr38165135ad.18.1778677792717;
        Wed, 13 May 2026 06:09:52 -0700 (PDT)
X-Received: by 2002:a17:903:f8e:b0:2b9:ff02:a14d with SMTP id d9443c01a7336-2bd275b9de9mr38164675ad.18.1778677792287;
        Wed, 13 May 2026 06:09:52 -0700 (PDT)
Received: from [10.204.101.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d52f27sm207675385ad.36.2026.05.13.06.09.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 06:09:51 -0700 (PDT)
Message-ID: <a1a38bf2-84b6-4e51-817b-b85ab6c65f08@oss.qualcomm.com>
Date: Wed, 13 May 2026 18:39:43 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/14] iommu: Add iris-vpu-bus to iommu_buses
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-2-7fbb340c5dbd@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260509-glymur-v5-2-7fbb340c5dbd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KNjPAElxayTitU4aPPTplzXlQ06G7Qyk
X-Proofpoint-GUID: KNjPAElxayTitU4aPPTplzXlQ06G7Qyk
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a047821 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=j9WNCELPX4ZUnkJ91WYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzNSBTYWx0ZWRfX/P4lnLvR8LSV
 2LBO+5MR2l9FQ2RHwlzYO6RXb2LelFDWsn8K7iVFK6Y57b2d59M/ru+9hIZ4LjHSXmPSe9iuB5k
 HEg6ozIig3F2v7B7OCGcz4QAPreKzNeNlT3XpG8KrZyLKpZmbzSTATcCL02g8AlrVSX/aaMAicR
 kmLaaUD2/0Sigif0LMiTyHB4nNUiCxCk+d4ksPQMBOIh/XptA4nHgh4Dx7rAneXC3bBqNCUVVd/
 RgLAXd6BqST56DMVBl2m2sUOLgIlgbYXVg3bs86E3xCAUJG3mZShJACMJMs95qBB/0Rynzo6YmT
 cVQim+y9vb7i+nDiufrA7dlf9xn/BxxbNT5Re4g7JxlCHFwxLLD/NcLCgbDeLWCsotf/7/OKXs9
 rEvqmLviH5vXtAzbZp5r3Dk3JAsHYKxQXySKCYOBt0O4RHspjwnKrEONXHSIc2JUqwjvZbwYgqQ
 czxAtefdM3D53t9e6AA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130135

Hi Rob, Robin,

On 5/9/2026 12:29 AM, Vishnu Reddy wrote:
> From: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
> 
> Add iris-vpu-bus to iommu_buses[] to register the bus notifier callbacks
> for device add and removal events. This ensures that when a device is
> registered on iris-vpu-bus, the notifier triggers dma_configure(),
> which sets up the IOMMU context for that device.
> 
> Reviewed-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/iommu/iommu.c | 4 ++++
>   1 file changed, 4 insertions(+)

We have added vpu platform bus as suggested by you earlier. Patches #1 
and #2 in this series adds the same. Please review and suggest if you 
have any comments.

Please provide an immutable tag by applying patch #1 and #2, we can then 
have that in media tree and apply remaining patches in this series.

If you have any other suggestion to land these patches, please suggest.

Regards,
Vikash
