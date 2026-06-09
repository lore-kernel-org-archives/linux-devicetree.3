Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265EE3E7BC7
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 08:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780993038; cv=none; b=CI3SqRmRtY9rmDeUzLtzquHVpLrqNqCK7cWYHmGAKQ/VS1qr8GA1HICqku5XCR1bCDe9qJ1HJN1zJ6S7kcd6pTCx9BCjTi/dpU+wzdvtnc9+wDZSVvGlFZFdvqqCLzpOhb6iPVqNyh8fqa+FyG4A42ZbhH2kpB8y8whdHgHrG/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780993038; c=relaxed/simple;
	bh=TV40QddrINlpCUTTEiKswMyWUvfxvxSh3PSqLXs8umc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YMi/Xz6rWlwO2dEc4wqWkU+YJuQ7TG8wMRElNUrDCBbmRXYQMwp13JG+Lncb+WZ+UHUp11SAirYUDEWWHN6pOpytHn+ksFaZqMKHPoytVKfYf8MEwOUoEhYeSRAeqGnFwIOoDkO/cCTY/Iq8tnTzr23lVTFZqxI9ILbGkO63D1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fJmc94Iy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eeh5VbQt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fJmc94Iy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Eeh5VbQt"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65985Sf4006861
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 08:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sxB2n01woV4QsbmdmcZOd7bbnfMgTW49Ubqboyavgc8=; b=fJmc94Iy3At4AoV/
	Z47ZM/mtQUlkKGRXsoFB6dhYp6T1Z1vPiPJwKq8+grs6Opk9Z6jNPuCmWEx8F5wY
	Gfip3d/qRnJMiUoPYtZT9RNzI6wMLxGSc3Pn1+/jH1g54+FOaZiyUKslW+HGvD0Z
	zF+4aruZzs5114jrAb22smC58B9/XW7Zy6jGsW+3IMv3+BXpCadbf3EMXcWoU4Gs
	69DWwXC+CjYjmLFu36Qn4ztGVoh7Qshfm3gvYbSXDRH1vwVq6ns8ezIFqT6ockT5
	ZJR1VdEQFwt8bI/D5lhpSqS0mhq4g9u6nkw+Qxno+ZNizgu6N3L4t/+UvfzUrMT6
	lJ59gQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epf0sr1n7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 08:17:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5176891d0a9so13530061cf.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 01:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780993035; x=1781597835; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sxB2n01woV4QsbmdmcZOd7bbnfMgTW49Ubqboyavgc8=;
        b=Eeh5VbQtCOTwSDO8YDMcCqitzVAu3uscZHY+CitwyNsGkR+TeSYwHiAJfvh2Y7IojI
         y7xdFgrU3Y/Si4L+O5/zMArS8Tq/XqAtV7ydrFPHIl5xIFVD/SlFp1R/8FKAW3ifvXqg
         +NVcwrS+iaVnHJLzQ+BU2XAV7wljbNg9cJVwia+Wu6ihgu7vHx35QWaR9sVkUXFYoZb4
         bInqgo0tT8a5bZpuObrJ2vaqBpeJdKGEBvvEUnDlz1ckxseWjflDDuKBZ9Qm9OQE9fAP
         sNYoKGvIZmHu6ER/1AH7wSeLo7vugWpUnavXsR0/zrwU0JFh07LPG4n1QzwhZlrBFUmu
         lUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780993035; x=1781597835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sxB2n01woV4QsbmdmcZOd7bbnfMgTW49Ubqboyavgc8=;
        b=ouOmQ1o1F8dmpsNUfAWAFKTFMmL3D3YRH0Jqk3u4aS1g4Nn+x1jQgeq/PF2kzkEehc
         6B9Bfkyp1wP1K+IgC/BvJ8deBn+dla5GsACds6PBdTZCsrLFMSEPBRxnNr9JJq/vatEN
         9c4M7hNkYq7w5Uc6hZdvTUDYIb3lRXuWN7S3qKFpZnP7O5W7qyDWM+5GS+V1MNndoXud
         ZFwcp3LNPizrXczu8mEPcx5HnMPTSjnNJ9xMha0RhKW0Np+J6KxQ6bXbd3WMEpnv2Txp
         vV54RVXaRMS63/qjnsBETPBZND2D+8CZv6+598W/rNSExeGJKpLWAcGCtp6NRmjBIuWe
         EaQA==
X-Forwarded-Encrypted: i=1; AFNElJ/PPAy4t+e+8s4R6TRG4KBTRs3uDzqcI2UStvo+IkWI61MsgQeO7+sifhEyYKqa/aiEIEEJUENHSzxo@vger.kernel.org
X-Gm-Message-State: AOJu0YwnYLqRfS3mUam2e+pwf3+3PX9uBAx6JIzSHP3LMdRcZ+mXAY3/
	qM7eaqxfcjxx1uSdB8OkK9652+O2om/epME0LhgqaKkHx+7bpBiqXyZw5o1STANbOKNgGkSHhP9
	MO/pMR2URSPGLOir0paPOHr8+7udMc8kWjs5woofT/tkbWBmohWDwlCWWIAUGRKK4
X-Gm-Gg: Acq92OEYmi7v1VeE6P/OHHT5stGgOjWmt+p9GYYlEjZUYKDw9+H+ww1+nhw/WLhJovR
	EFPn83fJvdYJS8iUe9PMELY9R/lAx/4+6enQ4TFsOm4WMG4nuXHoN/ec+CQdNU7sI5lwxrAAK+9
	b4WVKlo1fBuA9zWSSrw9SkD1wC0No3AZnt8BcXeY0OPxAo1szTqjGe9qCfbqwOEXrkvAjfDq5mH
	oTTvaYmmHd3+PCsZL31/OCdR+eYxgd0AggaeUz6UbmQxXNOsm/LUtLMsVSZiGbMndzm44wzlBRB
	2yJLG8kvdQLIYnb3Z2l/RGLaaXqlmXtP5BIx94UhUlwgsHqcGAIk+XvNk+32DG3836diUOUeZA2
	/1Dmdels+HYAGcohx7H37eiIbhakvR3RSG4DsNjg4MCpgeSknfu34GxUn
X-Received: by 2002:a05:620a:2985:b0:915:776d:52e4 with SMTP id af79cd13be357-915a9e04fdbmr1851615885a.8.1780993035553;
        Tue, 09 Jun 2026 01:17:15 -0700 (PDT)
X-Received: by 2002:a05:620a:2985:b0:915:776d:52e4 with SMTP id af79cd13be357-915a9e04fdbmr1851614185a.8.1780993035106;
        Tue, 09 Jun 2026 01:17:15 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65b55d81sm8262784a12.27.2026.06.09.01.17.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:17:13 -0700 (PDT)
Message-ID: <adc18723-a194-4e0b-81ff-6c90ec9bda9c@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 10:17:10 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] soundwire: qcom: add support for EE-aware register
 layout
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260608175345.3118060-1-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608175345.3118060-1-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3NyBTYWx0ZWRfX9tWcHjuHAMQP
 7Mil8uLPu068o38sGPy4TjF1NuT8HGR+VO4L5FUgMMA4YySi//d7HyyFsUIq3Bihxr+juB+i20V
 FDufhpegcTn+HaK6odhdOkTy5zckR+c6h/HKiRnhhMahPw0k4fuVP2mqlRHE4IMZEArxbmQtZcl
 hAnQdlsND8AMEp0ZqNgcl+fO3VwqabwUhqfu8McSJA5P/ftxJui5AQ4zyYR92mIcTd5xUXg806x
 Xx/S80WS0dSn4EmALIV2mUZI7TGz7mOKAzwBnqJGYTK/CTPjcoxApZbvS9LpZ1sD/S/UE1PuKLg
 yvKibe8UBNAzwViRxO511JAGu5F98DN7cLH1LiWXMc04X8lDRXM8s+7ON7xTRWZNFhPKB0/M5Iy
 UORlxDQOzr4jzBbsJr3wMAsX3wI+0GPKtJLEyoitVqFQIVuJPhDaJFESkUubhvNYWRATgO/NnR1
 rL7RppjBgp9pKjgSu0Q==
X-Proofpoint-ORIG-GUID: tmM4TwwlTCufDAchrVic2ZQ7NcME85Jx
X-Proofpoint-GUID: tmM4TwwlTCufDAchrVic2ZQ7NcME85Jx
X-Authority-Analysis: v=2.4 cv=GeonWwXL c=1 sm=1 tr=0 ts=6a27cc0c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=tO9HO6G7pjVgjP-kga8A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090077

On 6/8/26 7:53 PM, Mohammad Rafi Shaik wrote:
> This series adds support for execution environment (EE) aware register
> layouts in the Qualcomm SoundWire master controller driver.
> 
> On SoundWire v2.0+ hardware, some controllers bank the interrupt, FIFO, and
> status registers in EE-specific windows separated by a stride of 0x1000.
> Typically, the driver assumes EE1, but platforms like Shikra have the
> controller routed on EE0.

Do these EEs have any names associated with them, that would help
explain why the change is needed?

Konrad
