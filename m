Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B034E73BD
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409529; cv=none; b=qPWfpYxaswSloEWxSPrPdv6AXQ4Q5F4SVcSuiWyQRUPyjJ4XAI+NixZr4UVpTGR1e35uurIwP66Bd9N6kA6v6ynhj3oe/AiIWJuczM+TWQ07JQhNJiAAeYLiZgnX+5YmqKXNlKF6dQeWWFg3u+wIvcHIgvo45/1QgksVoptslaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409529; c=relaxed/simple;
	bh=lwQQfEh9nOqhpblPlramWU10O82Qm2G3izaI5hHN9R0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pGpyBpWVJKYTdhXpoo2nuclqeMCs4YFr5/3PDk4ZIGDE5qpCKWQVDlbSQyw7feFb4VwYnJWrssQ+W4h9+3WHIDrXLa2A79xQ4O5/xAHp5WjDCCABFgM199H2mJuGw/82gr1XbbM6E52GbHv7YG40qsxWe2ewdjBK0ximwhEp6AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RTDo3FLr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iakHDYG4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RTDo3FLr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iakHDYG4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Oqkr1665414
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pohp5mV7y1QLZu3exMVa2FPIYN+bK5gJNyDuRfvMI3Q=; b=RTDo3FLrGhjc/gZy
	n9Glp4xGxq7EJQEmcX1CiiEZZxn9jiqfa6PgqNIScBlelsdwbI/OqFuP521zGQ24
	sPooiOe25IeGZvNevJlSmbfEBn3uP60wQcWomHSTfYosxV7WgnANn5YazYR4wCO/
	hwOcWMMaTHiZAMPdUdXZruWtjRujJhyks+dyQ0KvMnH7EQc4GTBEVJDHbWsUgmWI
	gU0QAVjU2any5x0K/exh2z4mCUoP1R/zW6MMJeWFSILCCAcAA+HMZ50SAvMnQjrN
	NbU7PqlKGXGPkCxB5ow1R920VeVDCryDIoWwoMPBWJ2UltbyoWArBcwDZRzsREsm
	e2qUow==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3n0uak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:32:07 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9901689384aso20748241.3
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 04:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792409526; x=1793014326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pohp5mV7y1QLZu3exMVa2FPIYN+bK5gJNyDuRfvMI3Q=;
        b=iakHDYG4vMtBHmj2yC3gRRWgIXMF/XTRCHP5bVs0GEXABg1GexTe05n/jui93hbWP+
         xKjHTm93XTF7jC1w7Ym9ohglRiFTJ21iLVFtC3XY6W2jDcwEOWsoXMfsbtHYrP5FPfze
         BidZdVKwP2Pz/0MNNjj1hzbH/98q3Vhjrw8bvmSdrFcQ+dtF5BK2/x6q/eSTtjAx+wnV
         tNBAhERoQSA1GzXQWA6LdaC/DXKKhKxLtbmeKsl+sphOa/PhhstbC7JjxzlqKdPxcXtS
         jbTzaB2pvGhMIsH7J25i7hb8o7Mv7sdCzSpgLum9cfIVEX7t7JXWgKWljcj8s6a8ljuz
         lI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792409526; x=1793014326;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pohp5mV7y1QLZu3exMVa2FPIYN+bK5gJNyDuRfvMI3Q=;
        b=Otnx95btqiUWcbvnpr3IIHuCC5J3Ysh+K/9KAUafD+3RECfQnbX87ERR+TfYc0d6Kj
         ffAMsW6+CA9RyCGXVEa+XV0E0JxaINse7Q1Cpsy3H1xT6wry/5JttTnRVSw5uSMoeOOS
         907UHbjvZ139Ykq3YZuGiBmFweLLXNQHzEHchRKvsEXookXlgliGY+sawZsUUy5OMcEn
         +0obv/EeAmmx7rWqrewVYjmbz+ShGH4V9zZDIqqd9Mbnk3Eu0sSN5GQYvdKiLWrK2ZoB
         92iGjcSUJ91qoD1XA5CtGsTFs1TEhk/ZaX4XHrOVIaDdpGx7KkO8QrZUWnkrPRa7JaVn
         pWZg==
X-Forwarded-Encrypted: i=1; AKwUvBxIRuUCP7cozezZgzdFx9g2Wrg7r/5rx6mrv4EInlFWrozU/VYmRnIBneQZ6HttPP7i0v9gNUna3glj@vger.kernel.org
X-Gm-Message-State: AFq9FYJSkok4DgVt9+hxfuRpYFQJNB04SvFDshcElVt3lk/ofEMO7SLD
	0tKa/anWjvprlSey3IrAvkE4cx2cXR/fWRXvujShh0hOP4l68TZ3SAsQ6ihPiJLxX6jfMruiW7P
	AW+dRMseH49rscvXkyU6OO96EJhllpYimFBKwANap3jlwK5UI0tAkFnfwYkws2Wdf
X-Gm-Gg: AYBFou2cd0hZDvG/Fby6GL5/6o0zA27q+7v5XIJF6I8DUx+6Pxlu3k2TRIaRSauH8/g
	9RE4iaHySXGsP3cp0d+I5X1imCOCgdZ75wob1kF3+GjpYYCx7+pmzAjcKFx0r6r9G3tdLsEmebz
	J19gizLnIzPc9tpgM/qN/4IyeMGdPxWzck5E3xdUKZjhXNMqy+EHSZMOTAmroXuxDeoZ50VnRWP
	rhUkEkJgv3bm3TW4vVmA34qn66pBHLioplTI/b752Glj7gGBT6n5rup/d3NM1yvSRwHqmG0l2vX
	UdSYrAvabhx5SzUnLI1mrWB2DtL0in6qpPzUsL0bPTY8C/A0a1N1qVXd6im6lfQa+ljEuhA2vwS
	24qbShELZEao0YWmSpCCLQQ==
X-Received: by 2002:a05:6102:dd1:b0:7cb:fef7:3763 with SMTP id ada2fe7eead31-7cc36973b47mr1277913137.3.1792409525978;
        Mon, 19 Oct 2026 04:32:05 -0700 (PDT)
X-Received: by 2002:a05:6102:dd1:b0:7cb:fef7:3763 with SMTP id ada2fe7eead31-7cc36973b47mr1277902137.3.1792409525489;
        Mon, 19 Oct 2026 04:32:05 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c42554cf6cesm217763566b.36.2026.10.19.04.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 04:32:04 -0700 (PDT)
Message-ID: <e91eb6ff-1d7a-4295-ad57-02ca2bd10411@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 13:32:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] arm64: qcom: enable display card support on SM8150
 HDK
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfXz4VO5DwL9vJs
 amC4oUZ1Z8P1jYyppcNfkJ5jKfSW9Sx1yRq97sN1Z0bigLtDBsm3ON+2yKgukuMmU5d7EdPILqp
 Njp/y13YvIOJLUFjh4jy9gvCuWTUniA=
X-Proofpoint-ORIG-GUID: 2X_Vrr4RGQmPalNMZF9ZUuKI8eMw7gBJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfX5vT/0iWV5Rh0
 G1I3MDaYxuOOLeXPwlW2sU714cek79ZSVylvwSrX5jsFttkyDKMW5srxx9KstN0Pot/XtMWVfl8
 KTz0rNuOEBo8jmqdd2UxA1azmDbes9rN/RGuc6IxIm2yoURyxqic8tTqswQZnVGd2Rm9JJFFwm6
 NWHxImmzWVURH2IYylKAQdNBx7xDmM8+m7Adns89Ottzey2Wm+7zQbRotT6CThDbp++EVEy4443
 AucuRLjoHH2mXRvtXWFlvOYHbhwBw+7aaSGALMoVK4h8MtopKcumzdSbuySZyyXy5sMW3pluL0D
 abjiKFZVBuYat3dGpujWSMELy+pnWN26FpEFq6vwsCFk63G5mI1Xc/lumIwM3elF+Gs3TnOm4nh
 BOioyw281+s2+bpeIdlJtH6vqwa9ZtqLH2pYN8U7mSnaekbOA8Soc0aFNmc+C2KC7y6bASPe0kS
 k/M1F3KUEF1xF5r6lbw==
X-Proofpoint-GUID: 2X_Vrr4RGQmPalNMZF9ZUuKI8eMw7gBJ
X-Authority-Analysis: v=2.4 cv=Zf2IpcVA c=1 sm=1 tr=0 ts=6ad5ffb7 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rzYBljbM_JLXBvC404AA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190045

On 10/19/26 1:25 PM, Dmitry Baryshkov wrote:
> The Qualcomm SM8150 HDK can be equipped with an optional display card
> having the same panel as the display card for SDM845 HDK. Reuse the
> driver submitted at [1] and enable display card support on this HDK.
> 
> Unlike SDM845, this also requires a new LCDB driver, providing voltage
> for the panel and several fixes in the WLED driver. The FSA4480 address
> fix is independent and can be applied earlier.
> 
> [1] https://lore.kernel.org/dri-devel/20261014-sdm845-hdk-v2-0-6d0b4b42f267@oss.qualcomm.com/
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v2:
> - Dropped WLED patch, duplicating one of the applied patches (Konrad)
> - Rework the WLED auto-calibration patch, also dropping the reviews.

The latter failed to complete

Konrad
