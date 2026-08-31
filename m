Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55A128488F
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788161451; cv=none; b=h8zVJ7Y1wkHgdC3lqDpLBKW66GZMFSP/rJZKnucQVZXpGJZHOGYzjkuPXI3FGx/2hrKL4yzVvn1fqZRKdOyxb4Ax6UVxUVLsJEugpTaCKHGKn/ukL+v70f20/ghv8x3dkQU6ChLqsBr1TQ3EMR8nN/2J8ANFmN3vhJEl17zmvKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788161451; c=relaxed/simple;
	bh=sYzfFNiHLOFe7rtHuV62LOf39HE9HO6aDIV2YjmJrn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QiBa/zbi0i8wJFQYOFev+X2S7aQNA/y8PdG6MkZsWdkqE/82MVqv1o985gkGzE+TBSQCZM3v6SNuLbX7hdHcSDDxtWN7Auklc3osGvEbxBMYqZoCRBxmeUo/1QlULYinPOjXQDAPaEAnPxNqt7eu3OH1K7aQVd6SqTEmzdwgx1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CNcyjGPL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U8SNfd5x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CNcyjGPL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U8SNfd5x"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52cnr2017703
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bWmFsCOLCfw9uVVhGr/yWEbonpRpgAOqxtw70nMw9ng=; b=CNcyjGPLSL3XwoLV
	LmYBVIT5YYGKzTf1I1o2Q15WSPWJaK76S/z8zPqm++OhVQ5oA+ImLH5SIizWY6wU
	Cw3hjEpiGJHNfhYOUGyrk6V/NFhsPY0TKs/RKXHyuXeHZezyDw9XhxAUtEKTX2EN
	+f/U6wlmoU/Ri+kAIMxRn6Fwq5P1qON4Z8NNTK1+cJAnGTUBmvOcqQnTnnDsh4dB
	4G8FMgczP9OYTIN4wIlwSwbtPAIejIaa68d8MXMU6f6L7Sk11Go6gY6BpiVWtHGU
	sqSZQOax8B68gKWOl5SX+5yf0AZMqurPfBoOZA/qBS3F4D3CdFjhlv0tcOlqWdWf
	AMQbhw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqt6n58x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:30:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52b4e315000so13698331cf.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 00:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788161448; x=1788766248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bWmFsCOLCfw9uVVhGr/yWEbonpRpgAOqxtw70nMw9ng=;
        b=U8SNfd5xMM+waE73YpIJaQOyl4N23Fvk4p20N9JwV8RcEdJ9ZmbiZaddc3z7KKhJE+
         1SQMzRz3jsyTcMUeTAivb+t7V6xgDgkBtfTY4ws+kr98ppsE8SajfuxjzQgo+eMxWIZn
         LfsnoPuyaJGVQzseWL6BqoDUa+sRYL8ovw14jhh+mFnN1bbx7NzwJMi8FOPuGa6Valti
         efEtox1sqeKGrnrxXlUZ/xW28kaqGt1JG6jyAjDJO57OdqQ0j/LK6sEOhL8N1KD/lMq1
         xoyyQSDSqXFo/19vGM7oDgtbv7Fi1YTdlrIx7bodeIWIYlG6m7scnx/6c3bJLfo443cJ
         cVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788161448; x=1788766248;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bWmFsCOLCfw9uVVhGr/yWEbonpRpgAOqxtw70nMw9ng=;
        b=NenF0l+1aUaawCPXe+KGxP3d3qE6ZO9OZjt40U5f2s2Bpr6p6EdtaGocIN/7X0A4M0
         MrA/L2C+DVuuiFa0NmIAUvnj0bjCHlUyNNSp8GIvc2uO2//SF0OS2ivkUtycaULzg1sS
         mw+7CUIejNYaIM2innSU1j1WUynS+El29XSTUBQ9ffoOMcHsgz6SmkC+w1P+N6srpu4s
         78XJv3mohjLZyLauA3xj2++RrGSGEMI8ibm8oBpCLTuQIvQKKDHJWMAhsXGbBTuxslo9
         TCsijC422IGupzATSCNRGmbz9pGSlPUzJLwP6JSrCzayj193FGhq2Z/4FL51La9TGexV
         LiEg==
X-Forwarded-Encrypted: i=1; AHgh+RoY1IS38kZQvL+FKJsltmk2s4ihHBfkdeXkwSbUvQo9yTO/1+LwDf+90YP2TabWOEmt0ToEKrZ+Gis3@vger.kernel.org
X-Gm-Message-State: AFuF++myjOasrY2T97eiMcuTnIlk7DjFhqz9BhCrbkmLC7zWNXas9aRn
	wNF0nS+GY1Nkjko3fbA7MB8KGoXA0WdbX7WIAoIYImrCin81ZtUjtsN5/1emPIIthdQL9I22anh
	Xvi9bcVsGPdHN//GEbteOfHj4a17JehETk9Kj+xKLpts94LDEMml09Iq1Zwvh1Wt6
X-Gm-Gg: AR+sD12OlHhBaVIhelvYnnI912eYRNsFRP8jcz+1z1Fi2iLessn3oynJplUZKo0ZQzd
	KxAtYLtUpXhtKwwkx16T5Qy0OvAAKPCL0YNon5TegmRTEVKSCf51Lxqvebovuib5xaVEBekNq+k
	n9KIRzwAPsC4EBYhq+hd0wfC9sFnY88ADDP1wCIhjr4AAb5q/n/POSxT1+vEyHGsRW1xMreEiru
	cZf2/lTK6583DVj5hFBANm1FM4dKwwyETZC4GhRPxBScR6bUVFG5FNkrXxXruCfMdLzfzP0Hnxa
	6z4T9WVnyCvKN8QEu/zC/prHZ5PJbdnk/xNG4oiO5dvwVywoJTPPyn80zj6D/DMZjQ+2FJxsCNO
	lySqXivMXRUx9z3Wtfly5ww==
X-Received: by 2002:ac8:7f15:0:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-52fb91e676emr189545571cf.0.1788161447761;
        Mon, 31 Aug 2026 00:30:47 -0700 (PDT)
X-Received: by 2002:ac8:7f15:0:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-52fb91e676emr189545001cf.0.1788161447226;
        Mon, 31 Aug 2026 00:30:47 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611b5c4a7sm3209414a12.3.2026.08.31.00.30.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 00:30:46 -0700 (PDT)
Message-ID: <c751ed46-03ee-49c1-ac73-06bf32963b0d@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 09:30:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: talos: Add RPi Touch Display 2 5-inch
 overlay
To: Abhishek Thomas Varghese <tessolveupstream@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260827-talos-rpi-touch-display-v1-1-911705fe6d6d@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-talos-rpi-touch-display-v1-1-911705fe6d6d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YhkiA5YVB5FpBvkrDlEyjm7ZyhoMZwIF
X-Proofpoint-GUID: YhkiA5YVB5FpBvkrDlEyjm7ZyhoMZwIF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA2MyBTYWx0ZWRfX4Ji+uybuCBtM
 aKM0OeGtipGitsOCAtukdajoRX92rkUHYenk+Eco4oH5TuNgX1mRCnKORlXCXgZRm/L/mb0w+PN
 cpbRmlSDRRC+RgyZhCyxU/h6SMkMlcZxH7ROAWyAl5TltpT9BHMPfNC2+LHAldNNJeMDVmUG1eU
 0pPUgzT8a/YlJy/amSLqQwALZyjExz/m1Bz9v5TkyCsDNXHsNzrjdFLNp1WOXFhfa/7QdcfADoH
 QYXVFSt6Te9xuSYyDgbHhEdztj6OURWhjqavoyACBfyUD0MZPkUlRroQWS+kuEzrRhzd/+H7t89
 iM2jhGW5x0Dkq3WZi6l8PWsBN9a/lFSTS+1KsidEf1Fs1ERghhiymyB3ohJ208iqrhHJfUlEAIz
 KPZNKWw41Nvc4lXms1dPEGEqCTRCZd5SS4eEoE/ljf1BatCuvzd2zMYrQcQcta3zYteWbWrwswZ
 MpRldyBNbP9fXDLI1hQ==
X-Authority-Analysis: v=2.4 cv=S8/pBosP c=1 sm=1 tr=0 ts=6a952da8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=7_uUrrCgaLEmoTQF1WEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA2MyBTYWx0ZWRfX6ajjj376z2o/
 wpB6BRNL67lF/f5+5lRgpnod/1XNendxXji/BsopOrK+tQeIjieaNa+h9L3KH7YxLxm3VvcLLH8
 jbSM3DL5zOtJToaoltQwWYbgi9J2OU0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310063

On 8/27/26 10:58 AM, Abhishek Thomas Varghese wrote:
> Add a DT overlay to connect the Raspberry Pi Touch Display 2 5-inch
> panel to DSI0 on the Qualcomm IQ615/QCS615 EVK.
> 
> The overlay describes the display controller, panel, touch
> controller, power supplies, and backlight. Disable the ADV7511
> bridge to avoid a conflicting device on DSI virtual channel 0.
> 
> Display output, touch input, backlight control, and concurrent
> DisplayPort operation have been tested.
> 
> Signed-off-by: Abhishek Thomas Varghese <tessolveupstream@gmail.com>
> ---
> This single-patch series adds support for the Raspberry Pi Touch
> Display 2 5-inch panel on the Qualcomm IQ615/QCS615 Talos EVK.
> 
> The overlay describes the ILI9881C-based panel, Goodix GT911
> touchscreen, display controller, power supplies, and backlight.
> It also disables the ADV7511 bridge to avoid a conflicting device
> on DSI virtual channel 0.

Copy-pasting the commit message yet again doesn't add value to the
email

[...]

> +&i2c1 {
> +	clock-frequency = <400000>;
> +	status = "okay";

Let's uniformly keep an \n before 'status', file-wide> +
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	hdmi_bridge: bridge@3d {
> +		reg = <0x3d>;
> +		status = "disabled";
> +	};

And let's not define new nodes with hopes that it will resolve to an existing
one. Let's just do:

&hdmi_bridge {
	status = "disabled";
};

Konrad
