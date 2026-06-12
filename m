Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628442FE066
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 06:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781246468; cv=none; b=NS0M1uqZUYRrYh3uFzefSZBCTHY171eS/0JjBgIrbrjOlHU/mnKNrj4c94VcgC0M2exED9IoKlIRbz2+7Izx9ePdh6cRABxQStlJphM8whdKXoiYSK+yRpUGr9f8jOHFpjgy9c9+6eyig8G2za1hENIRkjVKMhKt3j7oGXGAPY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781246468; c=relaxed/simple;
	bh=SCwu4AmAYC2pEDH84RC3L97RW1JBqwpQeUoQyIgVd44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BB6xZwAn5iJKiq5pS99iS79ZAFm/741aqXka1iyuJoZCnZ7jrSPs6/ckvwPGD98tJKuL6LpYSROpVNvNK0G3Sl5awOLYfp2MlxplH3amVLsQHPy8opT84TICkxZwNnxK1h0PZfg7LqQoMIuL54h5DvUn6WtE8f22dTf+3G52dxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mv3ioiRm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BU+3mWTU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mv3ioiRm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BU+3mWTU"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3Bqm32451680
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 06:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OX0aUgrRa9G6MztTipGGrqcI
	ri5mfaFg+g0QKuO/wuU=; b=mv3ioiRmXXM4DC/Qfh2WvP/hPJgVoNzPaSmtO6/U
	Gta8kuhvS6UcTG+rYOqAzkv9ttIDpIuntTLYAdvSxK0aAMCvyvD3UJEfTTowX44x
	VtsVMvkFUW+bBAE1nWxqLu8WE+caR2xROU1Lnus0Z0NilDeHD7GkV4iNA4HoLwdi
	9G5mpbc2+F9ZdBCF7numg9FxJ4Gzaapizq0yKtNIpWDKRBxGA39eIz4MrvVr2cpD
	n45gdZJOuPDlUbMrTF8po7k7S7+cJiPrGokxN+ubXJxjrQuzAQatPGRgeiamwNSC
	9lIlE1s+jEImhtYz7Xw34dOce9P9s7Abc2o7zJjnpT7Q7Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1xcj6pv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 06:41:06 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963b07e2003so589023241.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 23:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781246465; x=1781851265; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OX0aUgrRa9G6MztTipGGrqcIri5mfaFg+g0QKuO/wuU=;
        b=BU+3mWTUXiJ4MQcmGto01GtK1Ze2Bvtjqa1dC4iLR98mA2pyevBWcq2YijcyqGdzqj
         MlSvctC1Z9JSmFSk3h2Lzej/ED7baoLPpVqMqKcBfWsUbleHJn0acLXvBXeq8QbAmDYo
         64eNKExP+N9N6tpLsajxOo7uWCiUR5EYOZITkYX0Br1HV5XNaWi0XgHkgSAknHYJ927y
         o+5o633lXTDKIvJLyX5Z0GD/NBGwyog9UjO/zJZBILU1NaqZX+8DaZHgbGbjRPUbDTcz
         lnOZWzdLS8Zi9+ItkT9EV6+R+t5m9S4Gzk1+0Yl+iP5rMJk/ShhEPnuTKOBzk1um/KQh
         Al9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781246465; x=1781851265;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OX0aUgrRa9G6MztTipGGrqcIri5mfaFg+g0QKuO/wuU=;
        b=CV/F6uJLk17/7gBf0fDhZSGKooK4aZkoHmi9TyUnOYle+Yjdlc22i9y6w0V6Zkxv9Y
         DU7uhDgYT2A46gmgQWbQjJzmv0qxEZbd9/mkSdiRAGBFsT6pg5AzMiwUU+awOLA1go5n
         /o58npA3NfhF1ot8w48rNG9LgvKiJWlrFHi/CcyCbevNAn1hklaDxwYBLkN7hhAAcjjy
         I0tPr4G+cKFeYH6GbLfCmlismx4bhYC4WmdeL91XOdoWe+As8w8Qkw8fkg13WZX2Z4M7
         p0brCEUHHsUF5noOFZsGu7maZH3CZ+s/8VVc7pyZXPD3XiOu6F0m/vRJLNPOBJdeFA+C
         M2VQ==
X-Forwarded-Encrypted: i=1; AFNElJ/DJGQ/2m0+hZJb6ItxlufAs2NI56zNKMtKJxv/CK/rvo7mBChSZiRN693VerPPid1YVFVCYyEn+Gs2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw92z4QxdFad6dmx2tbwukgihmtMukql1VmFuE1oGQVKvXYua8I
	OZ15OafkV/XOxCX6ILd4WA1Fjy4x4B3cF0IjWaJkreFjBDv+s1zbODR6Kj9AMiGtwXPvIJkRNqE
	g8ZyTDf295Kmgd/6ZAbcL4h5H931J+4h5CGrbsHMooZYHG/LtHTBNSN1tQHqXyIui
X-Gm-Gg: Acq92OF1jUOPzvYqon2kkY3pOfQIb4W/AQXcgxehy0dKm0ndR2yDD0VufPIZAoGsoVc
	wYfXAM5oQ12Dj6EDH5CVM7x8IBT8vMMM9WWS6+94eLnXlSs/D9hiKGZpJ087HQ+9j0bhJ/DHkfo
	dZCbSHNkp0p7H47zzRQsDi/tziASJ7aoGaINUFeRqN8E36liMuUbsMX2fYMCrtUrwDzb5w1ro+4
	xc996npWBUA7133tIlW1CveEybHrjlaQEbj1CC0nvoVjUSSTERjJmmN9BqCKIvxLxlKIZ9SGC0y
	YnA/zUvgNu9lwuWXwbg42P7uKcv1xtLEzZ4qWqhJGyttBSTPRB7CURLeZRBVH5TA8BsfYXaejUu
	YQxV20Lah6FbTNhfDdqb28UDHlbKk7dQQuu2nHGahW6Z9lc6fDF79dYEYWxLa8n4BwffxFDGBnV
	Zx1sAzSwxkug6wiIQPcuSo4r0iThLEEVb7A/w=
X-Received: by 2002:a05:6102:374f:b0:6cf:f288:f372 with SMTP id ada2fe7eead31-71e88fd0285mr603738137.28.1781246465625;
        Thu, 11 Jun 2026 23:41:05 -0700 (PDT)
X-Received: by 2002:a05:6102:374f:b0:6cf:f288:f372 with SMTP id ada2fe7eead31-71e88fd0285mr603725137.28.1781246465226;
        Thu, 11 Jun 2026 23:41:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161ef4sm271847e87.3.2026.06.11.23.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 23:41:04 -0700 (PDT)
Date: Fri, 12 Jun 2026 09:41:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: Update nominal max votes for qcom usb
Message-ID: <v5okvua6bnicuydjqy5pgha66gbpo46g7o45ejhezsgbae7k3r@wwqpqiu5k5e5>
References: <20260611081831.2743464-1-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611081831.2743464-1-akash.kumar@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA1OCBTYWx0ZWRfX8U7V7tAALoeh
 CgP1hvPm6jeyIb1iFFUTf7FfwGFPmeW2gW6nevQ0oxyWMXoJ/AbMKkJpqh8/yrtiPGCbhcb1Gyl
 gp89qmu3Vwpr07aPo4xM9U1Us4zvSlwYt2OfX7ScsgmczPnTfxqo77ga4M9XJeNaH/3l+Et7g5Y
 WR7tds9pRCxyuyq2XkAEUABC0pQAbvqr7pEVkIl7ebOrB7g2th676XIfzCjsZ5SwLj4mn1b4L6y
 FgXkDdPew+4d2Z4om9ByWLsqksywF4qGmcINRZDNcp3D87l2G4bm4id032jRRfPbDXucAF3Aqu5
 JcHjQGaU6ITtrbxGjIcMVSG+N+2OpE1x6WTd2i5Gw/eLXIbV3ItWOv9gduIfK2Z6asxgy3lY+zi
 LPeoXhPwDFvZf3Yglcp/Imt2gLBETy9wAePiaRbRl9VikiKKHsb+F/mGahE8ETOaO6BRIJ9xoJo
 bswtiMDthgGz9TfqgFw==
X-Proofpoint-GUID: CUSHuSyluQTgNhW_8iW0SFnuJRsp11vw
X-Proofpoint-ORIG-GUID: CUSHuSyluQTgNhW_8iW0SFnuJRsp11vw
X-Authority-Analysis: v=2.4 cv=NZPWEWD4 c=1 sm=1 tr=0 ts=6a2baa02 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=nxjr3CeA32HRPHoucToA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA1OCBTYWx0ZWRfX0LBg2nEHWSZU
 qEVMBtM9+4ls8JBynE/WXDna610Odio/yXCnUZzLXV7Rk0N2o15U49M6ppPh4f21+aNXcUy1h51
 EuIzw5SC+i9KbKGqcB2nZDP7EeL8YCE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120058

On Thu, Jun 11, 2026 at 01:48:21PM +0530, Akash Kumar wrote:
> Increase nominal max votes to improve DDR performance and USB audio
> use case handling.
> 
> Currently, Bandwidth vote for max nominal value is set to 2500,
> requiring DDR to run at 1GHz under normal load.

How comes? Please explain the math here.

> 
> DDR is allowed to run under nominal range at 1.5GHz, which is
> consistent across all targets. However, with the current nominal

Which targets? Does it cover Agatti? SDX55? IPQ8064?

> vote, glitches are observed during multiple audio use cases over USB.
> Update the nominal vote to allow DDR to run more
> efficiently, enabling simultaneous multiple USB audio use cases
> without glitches.
> 
> With the existing vote, throughput is around 125MB/s. The updated nominal
> value increases throughput to 145MB/s.
> 
> Benefits:
> 
> Enhanced performance and stability for multiple USB audio use cases.
> Improved overall system efficiency with higher throughput. Slight
> improvement in the audio KPI from 17.9ms to 16.6ms RTD-USBC.

What kind of KPI is this?

> By implementing this change, we expect to see significant improvements in

Expect or observe?

> both performance and stability, particularly for USB audio use cases,
> leading to a more efficient system overall.
> 
> Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index f43f73ac36ff..aa43a03f3c7f 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -46,9 +46,9 @@
>  #define USB_MEMORY_AVG_HS_BW MBps_to_icc(240)
>  #define USB_MEMORY_PEAK_HS_BW MBps_to_icc(700)
>  #define USB_MEMORY_AVG_SS_BW  MBps_to_icc(1000)
> -#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(2500)
> -#define APPS_USB_AVG_BW 0
> -#define APPS_USB_PEAK_BW MBps_to_icc(40)
> +#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(5500)
> +#define APPS_USB_AVG_BW 40

MBps_to_icc(40)

> +#define APPS_USB_PEAK_BW MBps_to_icc(80)

You've tried to explain, why we change USB_MEMORY_PEAK_SS_BW. Why are
you chahing APPS_USB_*_BW?

>  
>  /* Qualcomm SoCs with multiport support has up to 4 ports */
>  #define DWC3_QCOM_MAX_PORTS	4
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
