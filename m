Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9C03BC680
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294570; cv=none; b=ggDxBKDNCZacnuW1wFHnDFs0B2KDNrH+UmP3G+owuoaDi8tYtCnN89noaAiXqmn0WST/LaD9SDafZeQUX800PknxxNou0QQ1lU6h9vrEt0QKUmkwIVDzixmL5OXOgnaDyjaUS/WeV5BvD86sq2Ghc3kTsg/J//8XUm7sJ6jVvdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294570; c=relaxed/simple;
	bh=vszQpynj8bogXIjt53OMrmpaaC7oK9NQMvMAHad9rc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L6gAf2NKpg4tbBX0g6C+BAe72FpRQ4f82UhipKRJ0Ii4QKY8Pq/7vg7h5KzuoEzploOwLCu8+xxWxc+bbbtbY1mUq1fSjRdz1XQ5iY/gnuS8v0FVu4IdxEzTv80VnWk4EApptbx4BNWU9eyMENcjaJ7Sy491NM7ycRV4AnVYEJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QDr3RaOW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PkL/dX6Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QDr3RaOW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PkL/dX6Q"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RB74u81237232
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:56:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BV7iu4QdBUebS566h1y5fdtOV7ddcUCBmPDbhAJ2XCE=; b=QDr3RaOWeS85NudY
	Qh/kAK98ECAgglsTiJLz2YSus1Yo7Mdi9jaHyfBxB/gzMAeE3ufVpgzS/8zv0pwQ
	PTkLGzQtA5aP5D+OOD4ZS53OrGdIjxznBVbEmrQ+DyEW/tkajLrLS35xhnaX6hbe
	tYAyFjGHREEL8AFj1v5W5Bp3Aon6xFRQEnHcpYHMC5jxrjZA+Rv2ZoKREOq0dC+F
	wK3ZE4kKelOT+GVAHL0BtEJYUc9KwvjSKWRvUoxA8MvmtNbkIJpwPKW/G/UwTOFd
	cO/OL8m5p5UYmNcAA9J+IDGtCOJbk8rW/P/3jTUCBJYWqZ/rKO6iuINYmxCVq+dx
	ZOCixg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt6n4gb4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:56:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d840206c3so19010111cf.3
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 05:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777294567; x=1777899367; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BV7iu4QdBUebS566h1y5fdtOV7ddcUCBmPDbhAJ2XCE=;
        b=PkL/dX6Q+i4fZlZtnoZ6LigofsobTgWJJrEf1Z0e6h6Ld5vNKeugX40GJabSxotRME
         7SCbzWMoQgVAsmWxIdBmi6rODfrfigPgMXjt6s+6tXxZ7Ay+VxJOqgzY+X0daA9bFD+l
         smQXCXcH+FCmJHNW5ZJmmo1sUcreTjwwSvI4lN/kc5TFTeyhMH7z4w8XISIYjzz5+dHA
         9W9BSELVC6TlrPXZobMfmyaTKiptctkeC9We1aqUI7x/drwkv5A82x8KMoeLxwWTcUSO
         cRDy5AzL66XWDK8+679vMqRHAh9JsK6e+QowKRqiRXFU35A5sqTQtdNh8WnvwqvuPjMC
         WJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777294567; x=1777899367;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BV7iu4QdBUebS566h1y5fdtOV7ddcUCBmPDbhAJ2XCE=;
        b=iVmJ9J+MRWqvTDYkQbe7WEFYzWSUqEmjDQiqyyUlIjWZKwOMNFdlBsAL53g2q75PkT
         d+q6b2Q8l2pUwJOEtUeYZM2IxrWZuTFfk2I3FZaI6V2AvxR5DZ2HhEX3SX34p6AkVBfL
         AArcuKFU9Xk5/k/3gXjWGyNMzUTS0HBd8M+AwiCpThF2/zmzhEWDwaXCnnN1Ssj1WQdJ
         xVJiKRnE8Eof2Eq4N9+0PmqeL2TH5DgE7S0kt9VPv77mTV6uUh7ib52dFpLX5FVJo1cX
         UzlDGtanqDGbxqgBXr0dKh8KVPnQ/kfj7nqZ3kXy61fqX+xj5/3lJV+4NlF7grtr0Fac
         s70w==
X-Forwarded-Encrypted: i=1; AFNElJ8NF6oKCWu1G11gPKYjRs2e2j4PliVBQxz7fsSU3dXs4W+I1/j2SV1BN2rgWZMPcE7iuropdPv6CZ4l@vger.kernel.org
X-Gm-Message-State: AOJu0YxMLk0ploRpwvnLvoUJ4pKwD3Q/jvlo5Epy1pabq9J2fBzBRpJo
	q/nAMilJiGj8iGlUAtKYqCzx+f3Qp67sFHOTlORwZg+ZA2+CpFtBHd4NQ7sJ8t13LpAANbm6xbx
	+2pihaUFR5cSgT1SG8iSyYoEAOuE9zTFI/Gm1R6EtLRl4XQdzGfpwf8Ut7qeCXwbI
X-Gm-Gg: AeBDieutFepkiXpZSDiDxGstjEq841P7FrwWtqXMrPU0cqTHck8WqRkSJ2wL1j32oCU
	nLjCk2yg1M5cbHx6VgmhtSRvrqrwvoixYeRDc8ICHJJvDQNkpcZ1iPd8zS5J6hBnuPpRgb18f+U
	NdVmuDNn4ZdAh9wZ4mAyXEbLOpyoWpLHBDSJoclaLdvmu0nRHOELaa4PLMGkQX7fRR17kSE2mIf
	f69CYVXBVug0HiTzgZkju1/xrIZpLaN9j9tL21jbL/pxWkuBZMIBrr4X5K3Y3p46D/tXGS1eNg5
	L818rmT8TK+w672oLto4sNtxjrenNGsU1FoCcViMlH4u7mv3SbEWMXA3pGgckVq3ocWpkpMVne3
	6N5RpPlvcuMAraHEgsbH7R+i4UMl+q+TFZkvio7DemDOzt89q9xWFtsKLE7f0Msb1aR9JERGr+r
	1u1yTQrEwgaJQp9g==
X-Received: by 2002:a05:622a:1918:b0:50f:a53b:9cf with SMTP id d75a77b69052e-50fa53b0c53mr284503771cf.1.1777294567194;
        Mon, 27 Apr 2026 05:56:07 -0700 (PDT)
X-Received: by 2002:a05:622a:1918:b0:50f:a53b:9cf with SMTP id d75a77b69052e-50fa53b0c53mr284503401cf.1.1777294566746;
        Mon, 27 Apr 2026 05:56:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c47fe874sm6386349a12.6.2026.04.27.05.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 05:56:04 -0700 (PDT)
Message-ID: <3e72d17c-e46c-42d3-9b17-54627f6e5e28@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:56:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/14] media: uapi: Add CAMSS ISP configuration
 definition
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <20260427-camss-isp-ope-v2-12-f430e7485009@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427-camss-isp-ope-v2-12-f430e7485009@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Cn0BYQIEpglLph_VhcYjR3TV77sfs6qb
X-Authority-Analysis: v=2.4 cv=Xba5Co55 c=1 sm=1 tr=0 ts=69ef5ce7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=KpaCYs1BneEYRrX5G8AA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Cn0BYQIEpglLph_VhcYjR3TV77sfs6qb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzNyBTYWx0ZWRfX3C0ZtlhxBYVd
 vxCZNG2cc+C7bfUj1JdDp0RjBKoU3mAnvID1MjTPPL+SGiyZoxNm5PFbqZhsIin9YpV4XBy3iuO
 CaVngfx3PpyH2Y2bo9bbEZZsQYvwP7BPF9QfcUv6knribF21cRCveMfPfBooj28LH/xPpqKAFsN
 9BVzRCilZVhvYLiM2j2yYcW0X0Q0KhBeUMp6K/2cblrrkr/fDbd8cFMxpZlimLx4bKZyI9uI0uB
 C4BxNrzvyspI0fhuoYwcCG+eESN5FNpjKgE8rtLZ8Z6sG2o76rudWS+zfDgufd5uHMnF86EAFdf
 nxkJ/zNf+tUa0tqKcDJj75vHp7mWJLKWWH0X1SnsEbR/h5XPPyeb62iveLerrEKON59w/U4eOzn
 vfsgLol95aAALp/x8AOb+Sbs5jAeK1i2nfkrke6KykDRfNPQcO8jI0q5T9HztXFOqcRuTdQoAiE
 bkfE6FZKZiRlOvZFI2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270137

On 4/27/26 2:43 PM, Loic Poulain wrote:
> Add the uapi header camss-config.h defining the ISP parameter
> structures used by the CAMSS Offline Processing Engine (OPE) driver.
> This includes structures for white balance, chroma enhancement and
> color correction configuration.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

[...]


> +/**
> + * struct camss_params_wb_gain - White Balance gains
> + *
> + * @header:   generic block header; @header.type = CAMSS_PARAMS_WB_GAIN
> + * @g_gain:   green channel gain (15uQ10)
> + * @b_gain:   blue channel gain (15uQ10)
> + * @r_gain:   red channel gain (15uQ10)
> + */
> +struct camss_params_wb_gain {
> +	struct v4l2_isp_params_block_header header;
> +	__u16 g_gain;
> +	__u16 b_gain;
> +	__u16 r_gain;
> +	__u16 _pad;
> +} __attribute__((aligned(8)));

Should this be __le for all of the related types?

Konrad
