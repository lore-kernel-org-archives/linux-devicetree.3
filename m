Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7373CB2E0
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 08:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774946297; cv=none; b=n/7vmwoH1hYqh+jioyBKtIiHE68aYOXQuVOj7SwvpjCbTjwUKOh3TyD/8oLpILtjsuG+jWc3WLnCg8FTMzfhGTRL/yyhWzYsRfITZKcAL4GkFyvevFmOJs5FDOnXdQI2WMgwHDfrTQjSBL/Hp72+mrbjGESA+iukBXaGe4IwMbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774946297; c=relaxed/simple;
	bh=1epn3NNU1vhd60UD1evNtQYmh+2DPzyxsy+mv4iH1Oo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=csZ+BGasY1uHoHaxLJhLtCfAACyAiceNgEr6wvkFIk24A6EpfVtJ7HfUlqPE17hjjIsmWKV+22UgAX98K7BPR2zErLGb8X8j4VVOM5sxgk836yKD0hgi2h0/AzAtc+AltkiVClfmam1jPlU7dHtnf2buR5FdUmO28XWzRtq1FJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=chtD5zRR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aMP1ns45; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="chtD5zRR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aMP1ns45"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V82uDv3174240
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 08:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AOgnzemfCyTApJGzFBsiPBJ1EfCJ5UuKses1fAbptrc=; b=chtD5zRR62hZ35zS
	cGCu9QLd5aQknNRs7wTRWNQMmzowtk1jKglCOlKmCXQ5VbTuFpMmKxeW9xMZo88/
	e34c9V8dZEIV7dUgf4ZH+mIA9J0K+4kMi43iy+1ZjOfevYd6hrh+WW2gVTFrPvpK
	YvJwnS7P9iPFTpdZjSA9M0IjxA7Kr05XKmHqSSMTd0LdNocVSSNzkC8+DLrwbuMq
	487ALjWaACDrAjldJnc4yVcHM6In5E9E6vp019wNNk0dM6dIbNJdLPO9PGE+JG5U
	A62HSgDmvQM//WQZ9Ld6CvsT8budf2DaLgMTxY3s+0s7ipx4bMtzlinawNSIewH2
	ZkDDJA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7q9h4j3x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 08:38:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd8dc8b434so161419785a.3
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 01:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774946294; x=1775551094; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AOgnzemfCyTApJGzFBsiPBJ1EfCJ5UuKses1fAbptrc=;
        b=aMP1ns454cd6aqPbmOKVvIh3k7GU0/KRCvY+6ijU/BK9kIRefenPVORswdQNYGuRtU
         QbKzI0WC1U1q+4823+jEMltUBvmQ1W2KG7uoDZLgcCnv7/ApAcUgMeh8mwhAKwwphvp/
         ddiivbwCDZoLb82SzKlAnyzg5oQOBxBufYhHrxin8SBq+zvKM7rDMiXPzaWa32GwwawF
         kh0PXIcqpmqbk8xuo/BZ1xRtIZu3gGaT90gjUPhM9Z1HD9rXyWdBL0flf8luaeogeWOV
         aC9M3v1ZPOKv7QWO5D/fvT3kex5KjhmNtX7ezwXTlDLNNegcX0PoymnuCVRwaWwoolFX
         WYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774946294; x=1775551094;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AOgnzemfCyTApJGzFBsiPBJ1EfCJ5UuKses1fAbptrc=;
        b=P6lEl9vYwrwdHd3w/yBR8vnv5x2KFXO9h+zayxy1QKbe3yx/NXoSGuxaldEKice9Fi
         cHAx19V1jKdNcU08rPbLcLw+3IukcJQMkC4VMv9wgkCSauNYuw0UMIikEsaoIMkuf4/E
         jOPKam/bWk/p7GwVus4FrQNRlLqQdIJ/WMUg1HHHCJQW1QysfTI/5A40iZJcOQzboTnV
         2kctPlqqGvhiI0qqI71BHq1YGNsfyihq/Yy3fsfCb4lYqN/Z39/hQJ6kCDVFC3rTwTtL
         iah7MmCXDEZExJV1zurZnmC9k+jL8nw8/Tvqb+6smTVT4TLOhkhRWh2lB5BHEsN9I2lO
         lnTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDYwI6at+Zk8QOZ14kxxmHJnKSyoEsPCNBV7KMklkfQ1gIxbTUj27Gbcr2nJ3vrpnbBBbhvonYkxJd@vger.kernel.org
X-Gm-Message-State: AOJu0YwaR9mh+fm9A2LrZV9lYgqeHJGTjeXb9H2gKuzWzaMolitDqfxa
	f/6Gv2knol7MRRs6yooBEuVUOoO6SVay/VUgelTRv3OlgOXgzgE+a8KA8hNkezKO+bjXKq2mWhp
	n4n0lEAGNPUHyW16RSX+gWt4aRDkjGkeq1Cq0IH+fUttE1yAQCzPuIGdniJe2zpyk
X-Gm-Gg: ATEYQzxPVu1g5rgh0NarGSZUtqNMj8UIanx7a7qsmMnv7TAI+EuZYXF3ekklmxENh4/
	EaRekmHiVr88DWTzhd7NcEBkLc49j9h4sCTMLczFhIKZF0fHWkmQZkPlEpaKiX3hMHe8R1Nkfhz
	6XDQOhu3QM0Nl4dpSzjPydJVWp3koOb4rETUdmtG6+gCcN8/TntnL/G2atFwYEEZK99HSRenY12
	5RUblA4DwrxRu2O93aICG93JB78z3LFwbgWEvIZEqrgfeYD71LIQfSuooCxvqdor2n5Rp+tX/4A
	Rof69fGAw0VGfPfV2/+pBWSWJR/igwwXdwakimywyvZYgRy81wSYYhD1u7WKXdsmWoVcwPFNvjn
	ma8OJMp+IgtgAlIQ3/dkdm0d+XSqEeghaPC4KNtq5tEES/KxRDUjTMaGi1vs2rv3s02T0PiLar5
	DFaMI=
X-Received: by 2002:a05:620a:2911:b0:8cf:df8b:1e6b with SMTP id af79cd13be357-8d01c5b666bmr1470464385a.1.1774946294265;
        Tue, 31 Mar 2026 01:38:14 -0700 (PDT)
X-Received: by 2002:a05:620a:2911:b0:8cf:df8b:1e6b with SMTP id af79cd13be357-8d01c5b666bmr1470462085a.1.1774946293831;
        Tue, 31 Mar 2026 01:38:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b76078a8bsm3305698a12.20.2026.03.31.01.38.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 01:38:13 -0700 (PDT)
Message-ID: <1cbaf52b-f978-4892-87bf-fe5d78a966c5@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:38:09 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: sdm670: add lpi pinctrl
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <20260330164707.87441-1-mailingradian@gmail.com>
 <20260330164707.87441-5-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260330164707.87441-5-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4MSBTYWx0ZWRfX8p0E8YAB9sMi
 sGTLCUXSMw1mAWgEntBhyXQa7jp3mB1Mgwq8jpa1PB5b+Fy5wRxFi7ZaUOWeFadL9vjIgrP+BVL
 OQPtWdxR8CS01aXifxI8MRc/85dfdM+cxU1G2HBg//2/Yy7IfLoqPKQ6R9kFqHZbo5CNbaMvR+H
 cn2sKPYQI3Zy/5YauANu88J6c3/EsRvT8TkFcJ1KmNmTP7qlesmCVbgtSCcoU1mnAVOWparD7nE
 ReXU+niP/daHMSFEywsPa9ynxtRvibXD7L8YMv74MhxLAJ7mNz3hJwf6FNIOLv4C5VJ/EIIxiqa
 t2QpSv5LeXVIBKlv8l3yUSUBb2JBUYnVA2GXr4rfUTT+oX+yR7Tq/XwDEfIxG8XDlUYtcXp6TUw
 nJS0DckYo9wdv3nB52NBsB4nFbO83Ftp0yt/wTkuTM3sLB0xKD2L2LPdFwJln9Ms+tl9XN6ItHE
 vodBPNFlP8Uh0IzFFkA==
X-Authority-Analysis: v=2.4 cv=AZS83nXG c=1 sm=1 tr=0 ts=69cb87f6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ezCydkNMFyUEMr7ESdIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 9B_-ZJ8bmlb353Ff5Iz5bQ0Ta83evjDW
X-Proofpoint-ORIG-GUID: 9B_-ZJ8bmlb353Ff5Iz5bQ0Ta83evjDW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310081

On 3/30/26 6:47 PM, Richard Acayan wrote:
> The Snapdragon 670 has a separate TLMM for audio pins. Add the device
> node for it.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
