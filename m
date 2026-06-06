Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8042D3AB299
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 12:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780749684; cv=none; b=vBmK3rRZhirbrp213eBr2txhcyi1MetAEc+eAHZzJQctPJ7Slj5NQyOi8jZizozctMm67KxY5MJ9wEmOXXLi8GNQIh3+TiTL89auP80Jy24lzWAMOtcCkgtwcCf3z4ygLodP9ypc6SIeA8pk6usXXT8S+6Vot45pTlvx0QK8xFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780749684; c=relaxed/simple;
	bh=6uToLWIkhMVLVPs5bVfaOcvpcrTZrOqNSF1Bm7annfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uq8+0BM+AkIYg1gqBP/dUQ7If7E/cjCnbBmRaQ4LJ9YPdyZsacJnn66KUq/QfPkm6+4t2fkveM0QV3hswvV7wQiszzbeH8BF0jOtiRCOCtj6JvpNFINKxJD5Z4GaqE475+CKO/gaqOZE+CvXTHkdyF19uP5ONSx7W8EVEKWCGF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LIgNCPTK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TZjfWCs3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LIgNCPTK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TZjfWCs3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BDf6S1329102
	for <devicetree@vger.kernel.org>; Sat, 6 Jun 2026 12:41:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ojRmqHVzAY9ubyxt9hMVCKPiSD0rZfJdWLUlBw5lSJc=; b=LIgNCPTKnlPTSgSb
	CvI34d80M5q9qq/2h9651kVdt5wnHzR0rDNvy6DnetFDXQY8eWXBEJVsHt/BgnET
	5jy5zUbvK0UlubLyrsTpfYvfBei4XD+mU84+FPBBYqi+KDo67EW95nDUjjd3NkMY
	Kx3LzU93ncEVqWcOQXiUmKZNYrlpzKVIfoJMFwDyFWf6BU4K4la5IlrPgeQciobN
	K9GW+Rlelrixv4iUWkyrHp/JHtqCNIgMoNOFRY9W9Vddzer3gr7xUJ77tmRMlWyz
	Hsblm+NLYR+NKitIMVBmQED37LGtcOEcP5mH9V5Kiss3JvPikr68MhrPjyZG51rH
	/anPgQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1903a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 12:41:22 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-59eb9191180so2134083e0c.1
        for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 05:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780749682; x=1781354482; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ojRmqHVzAY9ubyxt9hMVCKPiSD0rZfJdWLUlBw5lSJc=;
        b=TZjfWCs3taNBpam4vBTQoYmIK7d4q9QK2pIgl4/ccaFdxsGzr/L94NBTQj7S+R4/aH
         2XL4P17mYXMR03qpXrd5Hxt0KDs7kHMP4ao5m9+SUqEOwCU69G7F4XnDHxjeR5qDKp+6
         uVKx9IPT28eo04HlT7x5bfSyksF+LSqUsDkx+rv6AonwH6EOKx/LAyqszfOVYFI2tjO5
         vi3kE5hgpSf7/kMP0QJgXsA6qr/IBtXJLWkFHMItuoYX/Jr3kFEBsFpUGAKsbuUwliPV
         j/mcv0llWVy1YJWPTdSSwU7t/ZDx3AiEcgwy5uvSogbL333cITk+2M9GYILPkBYFRVlV
         +CYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780749682; x=1781354482;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ojRmqHVzAY9ubyxt9hMVCKPiSD0rZfJdWLUlBw5lSJc=;
        b=ebM+n1Sme2+vjfLEic/xAYlKF+Hv8LOS4RTdXGBF1Pjo3Lb0FjzbapSzF4vlnuruZY
         FfhNVGygq1n1Xm4xRtwDzAphKDdvm4lFqoC81/dNhYMOnj/WtB7Gt1r9EHGrOYcn9onY
         vSKcBIjXJwTVOYkv2ldGnl0bXYKhjS5+gD/Z2LPn+neAdSJkop2JoKHgnYH7jjWqrUDk
         08jF9LW8jECSQMGMRr9v5lltA4Y5LaV6yaQSJ9oN2fqXVW5EJwpUCcQmWUG7xWJOy23z
         8ZGEh4+/39R9Y2qWvd6T57D5qWHvY711hVqOmghaf0mQTG6D43samFhSc1xF9p/1BSv1
         AE1w==
X-Forwarded-Encrypted: i=1; AFNElJ8ciV8vpFxmyEVl1GQ8SY4jtUzlTreI8pst6RmszOy+dDowqXHMtfIAVF23PV9FdPw5lkhd7WzCsNUb@vger.kernel.org
X-Gm-Message-State: AOJu0YxXMLgITNW2hkTiV2+WVQ3wNAxF7S6k1xcL+Iy6HxY7xbkPE8jN
	aaXMC52tVLhe5WH3gLFVYMtXxFHhz/FNsbsBU/Z+yLFMeM7iH6/EltyJTnvO91yczQRUVuimqv/
	VPYJOcMNASnHuxNTgimO5tvWipPHobwrwWf4vMKzyhYbxjOeWe1UdF4KiGjFYjh8q
X-Gm-Gg: Acq92OEYn5g7wnt+8pdZzS4nsH/ZneYjnA+1vkB1Fi2ofOo1h4FfFkuAqxxPoj9ANVl
	ZIGUt9dN3fInELU8l47lgBhiKU2JYCBj3JFBm45WAycvm9WsEWbSw043/Sh5OTShWF3y1SQ0ZJv
	AserG9wbJZbypZEVm9tmVGJE9FaSrTL93EncbyARFs8NAKtCDh4BOK92Vf86ITl0K8uC1gQwBYB
	dah5EP4ln9jqjNstyLg8mCzh4xd7qbrNyAxXhBBUnRa9z1m9l13gPHDJQo6vaB8bmHeVtItEjej
	+PVZShHWkLfodlU5CgTWKD7vx/cNQ/yShfdQ6yGC8zeWoDjibbBkvBjHVin4zAmlCKNWLO75m/y
	T9nsRP4aZWaOzJCYcscy17QNqj8+xCtrC2TmHYjtuwjWKSmOTXe8enHvbtdR/i0ilkVayM0S93z
	ak3AdVIy3JYDZPfza20ybkCBrlkdaEm81mpEfBF6abcNW5Ag==
X-Received: by 2002:a05:6102:3ec8:b0:6e7:5c89:3fb3 with SMTP id ada2fe7eead31-6feef48d3b0mr3910641137.3.1780749681732;
        Sat, 06 Jun 2026 05:41:21 -0700 (PDT)
X-Received: by 2002:a05:6102:3ec8:b0:6e7:5c89:3fb3 with SMTP id ada2fe7eead31-6feef48d3b0mr3910636137.3.1780749681305;
        Sat, 06 Jun 2026 05:41:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed74asm2416158e87.13.2026.06.06.05.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 05:41:20 -0700 (PDT)
Date: Sat, 6 Jun 2026 15:41:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH v3 09/10] arm64: dts: qcom: shikra: Enable TSENS and
 thermal zones
Message-ID: <nescd2gwgx6msrzsawljoktwaxtmyo4xdi5s4csy2na6pebcsy@ldzwnj6fxl7c>
References: <20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com>
 <20260601-shikra-dt-m1-v3-9-0fe3f8d9ec48@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260601-shikra-dt-m1-v3-9-0fe3f8d9ec48@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDEyNyBTYWx0ZWRfX/Nzjuak5GNaq
 W9+NWPCSWwORNV08VC1aiadl8nUYJbUDCTRDFfnVktGXshaumNu2HE7mJx8NUJWB78b911UF96Z
 fMJz1cuEqVwQ1VJ8BKEgVG7VsFbMM3UrutJ0MQ5YhHVAi33888mmkTOJqf+TaBDVqVFkvFk77sM
 RFgrs5X0S1J/wE1JdSYnf0UAbMP9v78JLhwtTEAvrhBK8zOu50A/mpKrWQcC8ARGSq/fjGJ16a/
 XAmcFdN/TlynuAj6ecWr4xNhd5HDzXEUO6Zd8EJ/uaYI1loL9UgvGsiL1xnrAbS4DWP5HkDMCXX
 HfquwBrDJIZoM3/02rY/ia2/uEjQ803VN+n5ffJwKX3ZrDhh9eTo80JwwT3FNNr9L+/ea7n7ri9
 NS52hgA/RAsgq0mgsxnz4iIAyGIxcjthgV9kRN0eu5TNdJmBk4IvKTF5LOiv6OULCF87ufoC7XZ
 CpaBgXTOd39qhU2Yalg==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a241572 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=6o-Bo2YM3VKyGZF6QcIA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: c6YsQnsKDNahFJqc4O6VPXOcO2ZDYrOF
X-Proofpoint-GUID: c6YsQnsKDNahFJqc4O6VPXOcO2ZDYrOF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606060127

On Mon, Jun 01, 2026 at 06:25:11PM +0530, Komal Bajaj wrote:
> From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> 
> The shikra includes one TSENS instance, with a total of 14 thermal
> sensors distributed across various locations on the SoC.
> 
> The TSENS max/reset threshold is configured to 120°C in the hardware.
> Enable all TSENS instances, and define the thermal zones with a hot trip
> at 110°C and critical trip at 115°C.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 267 +++++++++++++++++++++++++++++++++++
>  1 file changed, 267 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
