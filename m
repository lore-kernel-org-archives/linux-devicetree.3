Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6662F3F8245
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677007; cv=none; b=PoRHoxHtQLk0WUFtdDsgr8kbZzqmpHpbtgneQGDlbjH3MWcXUCaL9EEjbD2uImzcp7iXEA6hiY/ULNfbE8H6PKYV3Eo2PDshMUb9hL9xqwbPISBwwu6sX9sXwf65oHKSbzp8V7V66iKxKNjdlMui8Rf+vCi3whzVntFGSmKCxHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677007; c=relaxed/simple;
	bh=LcLvysn+yktuqmARlxJyynfMTIQ/qlu7hdCwU323+Hk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fuDAffoZOLiILlNui5zh7ZbO9+F4XD1bgdlPnBgwEyNwIMK4gcONnjBOgomUmGW+Q5Uh8dzJ3SdLe1WF/F3SoF1dTmx28cv4aTafP+RxqfCobc3BFu2ZWKHKaEJEpR0za4joKJqjltEOUz/vDUt+1iGSPG24SSjBlc7TNuMUBhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JHrwiu57; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iLzKRwRO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JHrwiu57";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iLzKRwRO"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dWnk4194179
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MDV19J10GNAY9F8x0cOrbQUm18dkq3n9hszCs0LdNhY=; b=JHrwiu57lKFsthki
	zJsUoa4pfGAq060Xsu7cyupua7vkdqYsyEDZeAMi2JxfUillZIqDvrg35sYqzR1m
	1+eg7gKKaI/mhpgfZ1+ve0M9sSowsViWDYtopvD9Pmw6yYvqRO0zap2eEt/mVbB+
	LTqGHDrcuT71adZduGExIL6++LhcpQ3jN00R891x/ROiCowZtAbEyz9zK+IZd9bf
	WDVpOO3R3gsq3iAfVfG1mU3bbGAdvnW4+LXMkxuYkgqzoG4rGnUhbbn8ABj3YWbp
	2Qz9le3nxTAhoFMEVd02EojzhuVkk1tRa4DUzbRxfSFBPOlIbfmW+XjwqkMqAQ5n
	gPOC0g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf24upge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:50:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c07313be5so2084151cf.2
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783677005; x=1784281805; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MDV19J10GNAY9F8x0cOrbQUm18dkq3n9hszCs0LdNhY=;
        b=iLzKRwRO5NtAaFzOr/J53K5iGZO/l9gVzBHZAIB3g+KTXCPFLteom/kG5N9rCM95tS
         qaDW/ZxB5r70bvWxiF3J7ewYAhsGk/7hs7d5rBc3D1R0jqSSF4CkYH42ncydgdBcGPOS
         NXwbKFlH5y9kYBIcGqlFM59Q/h1RI0D+0dSjR2Ty13gbjYL+sQRft0whQHtEL2JzATY+
         2HZZBeNXDaBR2p9ULu+dmPPGNZK+eUCKRDEcQT7xjlM8MnbaydQYFw1V+ki+kmGZ5kvk
         h8Km13fbj6tgvZh2pb467fwQL3gTzrDFllT8pSbfJKgbDVZJnWwfquuAa9vbRMwbzsiN
         6X2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677005; x=1784281805;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MDV19J10GNAY9F8x0cOrbQUm18dkq3n9hszCs0LdNhY=;
        b=WpvUJp8uTwzwJrhOotKReAhtUtnFy1nJqCgbVVTMW1AuizrXcq7nrzCONiUWebfLwc
         kBhAfMvuqxSbL+6Whsogxc6Dd2+cfAQ6jHCkml5FIFi9Ujn3w+FKg/uYaaxcE1g3u31J
         OXNktxbyBSWy/U4nYJoFS8jmE+JSO7Djh7HTb6rOvSucOOVG2oOlyXC/t6HWHjjz4qIu
         YIOSSJMuClCexM5tvAFruQjIQlW69lj6PX9E6NtyBZbr2IXJToIInYDpLKK9vS4EDNxr
         h4NE9uG67zw+atFMdYHB8b/bP7zTmZ5cTubnMtB9tWIU21r2esdz4IyQV+7FpwIkh9k3
         n+Og==
X-Forwarded-Encrypted: i=1; AHgh+RqRK5jXcOpF7cn5ZfDZ9VsfbSq/59WALvcWAWUcyiAZvG4F54ABiaakSdEqxiRrniiUR3VXQLmLvHX5@vger.kernel.org
X-Gm-Message-State: AOJu0Ywind2Rgl2HKnhn6RnVbdgQyEaeGkTwMEX1MjvbmYvcRqXuP9gS
	uaNSji7x03f+ztf40UD6+swRD6qnyeumyjjY0ZlcUiQoWAUAygNtghGENNMvmFmhDbHxXRViSbg
	c1eMmokwuin2biuaHwfFG095ugDfWn41vYZFaASyUQx377yHKpPyp8WU95Zeg6X+s
X-Gm-Gg: AfdE7clpRM6KZAinXu6a5WiE3BqKmd7g8alrdmlW6thTYM6Kp3jRDAhxLu4ipTrT3EY
	q6qKtWHcRnFthQ6KnSKz0TdjUwDaocGiPly+tCB6b3gKeKfKy1Q2DkFCSd2QR6hmMoBgGQRUdZ2
	GFHDotpdXeP3RYP9CKIDIGelz9saiu5ozWT06ihxt3SM2EmizJX28ZwhFmkUJ40L/C1FkOb+bZD
	+lOXEcQ37cKTv/32XMbZRfu0Jzst7XnQ6NZbAvDdgbBVgH1Fh31KtlnXTeqdiYCbjeHiHN/uoMr
	bkUMKk/NDToZ8N6g13FbqOyWkNPr7B02KObs7ZR37GfpciIEN4qWJ0dZjezVpthUIMXThiZL5Uq
	abldQuaPJD5c4D3isYW0K/bq102FATMGnKbU=
X-Received: by 2002:ac8:7dd2:0:b0:51c:f3e:781e with SMTP id d75a77b69052e-51c967ad1c5mr64466691cf.6.1783677004700;
        Fri, 10 Jul 2026 02:50:04 -0700 (PDT)
X-Received: by 2002:ac8:7dd2:0:b0:51c:f3e:781e with SMTP id d75a77b69052e-51c967ad1c5mr64466581cf.6.1783677004229;
        Fri, 10 Jul 2026 02:50:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4b4fsm10518512a12.10.2026.07.10.02.49.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 02:50:02 -0700 (PDT)
Message-ID: <8870479a-7ff9-40cf-8298-1cfb98d1b896@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:49:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] arm64: dts: qcom: sm8750: bind traceNoC on the
 platform bus
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
 <20260710-fix-tracenoc-probe-issue-v6-4-41eb36fef8d9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260710-fix-tracenoc-probe-issue-v6-4-41eb36fef8d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yr6ONxkYYmrgfLOwZwVleOWl30vAq7-v
X-Proofpoint-ORIG-GUID: yr6ONxkYYmrgfLOwZwVleOWl30vAq7-v
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5NiBTYWx0ZWRfX7oSNBB6o7hXz
 lHYSxBBAqCqSN2X28BhH6pu60knFYkepBgq4aXqytluQoaXHvIPAAk2sdY0ThVSwdkpeC1FQGKe
 1KU/VvbANUJqQQ+zN0DCvgWv3bxnd9s=
X-Authority-Analysis: v=2.4 cv=daKwG3Xe c=1 sm=1 tr=0 ts=6a50c04d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=gkVCdKvAZl3yu2NoW_gA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5NiBTYWx0ZWRfX8WLTveXSv7QP
 jF5gTNb9/YKG+YP9JOAXUTereXtXhxIhUzIAnU4a8U0KiDp0tTFIex37Yz5h1RQuOZsYwNZ0PHe
 ut3O2vv3Lt/AucIjapSgxO6SLHgRfG0Qby7p8gqm7wSv7RFSRiTiVub8VK9Oc8lWcyfqp7ZD4Zz
 /s24YIxYBZfA7JfCbo9GEpIaR8pXYOWocnR08I3de76pfr0NJYPo3YYPZwCD+FtpRJ1nR0n2wKr
 4CUf9Sk1UcWyKUGIANHWrjSUghDxDq/irmoWi4v6kKP70UfjfFV8C+8WQQ2zWR61PxXyePNGWYC
 ATfNCZgFXLi6YaE2tIlr1yqZ2m0LajIEqw8XRQkpNInKaKLu8w0eemU8maTb2ko53yOxOpL/Seq
 EMyXDByylSK0gJyhMp5OP8ca9PrWXXg+PieRFrmT4wmWN+zYbrLnMOKTVB82JNxYWwVebLJklRf
 hO7+f8rLedwmVth9+Kw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100096

On 7/10/26 4:39 AM, Jie Gan wrote:
> The traceNoC node used the "qcom,coresight-tnoc", "arm,primecell"
> compatible, which places the device on the AMBA bus. To bind an AMBA
> device, the bus reads the peripheral and component ID registers (PID/CID)
> at the top of the device's register block and matches them against the
> primecell ID. The traceNoC exposes the CID registers, but the Component ID
> value returned by the hardware is 0x00000000 instead of a valid AMBA
> Component ID, so the match never succeeds, the AMBA probe fails, and the
> device is left stuck in deferred probe indefinitely.
> 
> Drop the "arm,primecell" entry and use the standalone "qcom,coresight-tnoc"
> compatible, which binds via the platform driver by compatible string and
> does not rely on the component ID register at all. This lets the device
> probe on hardware that does not return a valid CID, while remaining an
> Aggregator TNOC that retains ATID functionality.
> 
> Fixes: ebd1eb365cae ("arm64: qcom: dts: sm8750: add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
