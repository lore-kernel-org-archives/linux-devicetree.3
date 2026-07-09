Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F993A2E28
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 18:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783621024; cv=none; b=CMlK9l6MoPM88UBAQ74kgRSJNs3hO9xSiW1uOTD7n+gokyvzy0sjuCmN8RuYR7dyBs1JLG9vzS96fYYQ38+P7x0qPe7ITCic0JkSejNn4MC+LNsXD6yZHJBUyP52YwftGV+qs1TB2cYyMWdT9shXHA3BmfYITQfHf4kw91KgpEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783621024; c=relaxed/simple;
	bh=1TwrHJALVemOdWqPWInxD1rzKRkbLpWIAC6sBRbz/54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eVg3XzIx2wWsC7UgOquvUx6g8mDzdw8WrJ8wMIYV1tx6KxpBZzUOjx2TOrIM3AwjoI0lufCEFOGgbfY0aaTcYv1xJspw4Zk90+b3HOsOPeC1x8eeVUiHTyVgCT+Sl0vGV/goLAyx5KiRraaKJkwmlqskAT0QmIfesifuBODrGEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eLRPVel3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XZtLc95s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eLRPVel3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XZtLc95s"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HWr532502308
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 18:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UGjdfApLUPZZEfiPZI9k22tEfoB4RKgXjIaUHpRLtfM=; b=eLRPVel3BG08+nQu
	8ORvn+sTGCeH+2/bd78WUotRqrv7lz1bSww8PsImzDnjWwn0Psw6+Df70rPuL+ES
	yyt79QsAPSLZ5gIMYMY8Lmv19XrjZKvePGIJHp7jxXZUz2rc+6vfucPGPwtRT3kc
	tvoMsxU/BNK1ut2O3bE5DAZIAgDQ3jv4YTqdopRCaNkIpllfHz+p5l/f77/YQG6l
	KlFGB3edkDr0dnQCWlcMiOmqf2q6JuLFwKSOCpyuciRyWVVTzIe5sdbOCh2NO8sY
	59HUYdJhTpCa1JzZZ0Q4GS01ZDSOhedYheuYr3Ieo6XbDKXcKDZgkwebWdXaVG9a
	yRuxfQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa6p3u98r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 18:17:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e566bae1bso2023985a.3
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 11:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783621022; x=1784225822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UGjdfApLUPZZEfiPZI9k22tEfoB4RKgXjIaUHpRLtfM=;
        b=XZtLc95s5KosYJYncHuLubOzNP0pFxmpABKr5OSGtoH3Nfeo58KuMmnRNgindVy0Fi
         rsy5ZwOzWCd/JS5MavAHiubejAbHNXLaqUivBtA7alQV5kh7zm+etclmugrx8FhsxhVu
         sPMSgXICxjI6/VoueMN3WU2MJkM7+FOWRf+C4kBnrkRJ8UWU2CptEbsjwoaTLZaz7L/A
         v9TaaMCvmX0ZV9ndKz4miC9IwJC4BmhKhjcOGd6ZH63iiuRmSn9yoRDVwc5/Uwrkz9fs
         /HsxXY+hftIrFzuryrR682mzxqG8C+g1k5J3aqdL5XZUVzVq0nXHFyHP7P9/LIT5a9np
         B81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783621022; x=1784225822;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UGjdfApLUPZZEfiPZI9k22tEfoB4RKgXjIaUHpRLtfM=;
        b=TMoriEajJy9FZqdpaCtKpEJ4Q90rsIa4Nif+Dxv/aEb23gVbkn3btbJedcvP6tvX46
         wXIN0IUiNHzj8kJjg8VMbdv2hgYUB6dsvAbjQqcTrcyF+EwBMf2rly9pCV0MeDU0mmZ5
         aXAL9AYYfLCK14+Gkpvr+Qqp1LxvQUiKhkTRtG16BDmzgArZnCe7XiWjNzr2GiUupi7s
         1BQ1KTOnJD3nfNlJEMAcWi/lNo6176MrO89DC4sVH43ytE2BBsxwb8t/P+QxYkmMCMCW
         G/TM0Jh1V/Ew/CAwdnEMPhjW+E8YVdUbGglYDDiFcKfrQujPzFNr8XsFTpLU1EdgPWou
         eOTQ==
X-Forwarded-Encrypted: i=1; AHgh+RqOM+dokA91fV3WAKVsc1ndI50YeRZ7I5PVKSEMUgQreG6nwpn3XE6RBkMsf1S4Mym/jZhb0w6cLpD1@vger.kernel.org
X-Gm-Message-State: AOJu0YzqHTNNWvyAOjIW3YZzscCW1Pt4uyI4HAWHuMCbuMIVOkPAoLj9
	h21eZVdEOCtYptwbzReofyRPKZNcZVKuWbBtz/uvhcagurg98oEytrxZ8ziM1fr5tOEV3wJEM3R
	DMU+CclcLyOdjg0umu3Gwks4O2y3675SbnN0mJH8WBEvi9Wac75RcGNtrmOzKHn43
X-Gm-Gg: AfdE7cm6Hb9WhlmHGT3DO+OoPyPznNUu4U5y4rUL34GX4LvD8wtau7ze8PLr1vpQHqG
	g02euqY6fkAWWuP43+ksOqazB7kdulSFt1V1rhqpv7wQQwbwddn+ggRIUvtJqjIwDtsDt5gLB6R
	PQy6pi5kC8/oMLWowCiF7BnSeoVYX9WqOGMR/6iu6hpG7Fmnr5BHx9uNnhlNZ5nVRm21sqAhBKv
	WrHlttm5kgAzRkI6Myyof1QzMI9ATMekTTAMgaG9aClsd5l21z2Q0PDCgIp3YNiXk4R7QMdoF0d
	vwM6JLFWdL9flFx+OeC8DZiwVEazKulzXDsV9uXO4qGQ7JJOCimD6AD4f2zo80NDRYlDCFg13we
	fx8/mNsw2wih5ghGtGFjAlQwoJbbvVNyIAwI=
X-Received: by 2002:a05:620a:1722:b0:92e:d1e1:8300 with SMTP id af79cd13be357-92ed7964e63mr433311085a.3.1783621021898;
        Thu, 09 Jul 2026 11:17:01 -0700 (PDT)
X-Received: by 2002:a05:620a:1722:b0:92e:d1e1:8300 with SMTP id af79cd13be357-92ed7964e63mr433308085a.3.1783621021398;
        Thu, 09 Jul 2026 11:17:01 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15bc428775sm441974366b.6.2026.07.09.11.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 11:17:00 -0700 (PDT)
Message-ID: <db6c35f7-b2d2-490b-b2ed-4805eb0a967b@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 20:16:57 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] arm64: dts: qcom: ipq5018: add node required for
 Bluetooth support
To: george.moussalem@outlook.com, Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260709-ipq5018-bluetooth-v5-0-e476c41f03b8@outlook.com>
 <20260709-ipq5018-bluetooth-v5-5-e476c41f03b8@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260709-ipq5018-bluetooth-v5-5-e476c41f03b8@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tkIW2yF-k2FSTp48nL8I6T7uYOsxe0Bz
X-Proofpoint-GUID: tkIW2yF-k2FSTp48nL8I6T7uYOsxe0Bz
X-Authority-Analysis: v=2.4 cv=TPh1jVla c=1 sm=1 tr=0 ts=6a4fe59f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=mz1jdwAY7f1nGK1u_T4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE3OSBTYWx0ZWRfX6tEzUkT1/U25
 do19X7CxQvfg8UykSWlyXK67NmYLrx0ownNPLV6tlbtJ9NCEH8uEOefnu7gMiSqQ1qfFjFnqGc4
 Wjd8zsD8vQpkM+nWuCO2IcC8B4HzbN8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE3OSBTYWx0ZWRfX9fEAgaJBu7Pt
 oCX/bANfQRehOYgUX7Lt6SQ7bRO/hHuWRU+0VVXwKf+HM9s8tqBE6aGM2X5D0Yp/ziTfHpdWZyZ
 rS67PG532xGKyLWK9zlGM9SE0TX4j2I6sebahpI6nO7LWXMX1P5h7ERXHLH9nNhM43q3mt5wGEM
 Jr4hhTZhehm2D4Ax88+wMEnxLnFF2WQ4yNR78CJczKnHS9KUoDxmRvzOAMWS6fyKjMpCs18MzOC
 Muz4bIjDtiGFp/i18sfbBHEReAngXEYrS9dGJ9wIaomAJumt9nj9Q4q681cfCvcFt1Di6YDJWTl
 +o/gAD6sDXElMK2as7OOYraBrFnFWVUml3hD8Sd9SwJJdxtr2MjjCoQQB/acOrCsbRS250CzDfn
 W6qaSNbdl1ZMtjAa6Zo0plFfbeOPopfh4tJocoVi+YouA9XX13HvQIB55yg2O+7p7d0rRqnLq90
 jFABDQ/07RKnMMpYYzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090179

On 7/9/26 11:18 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add node to enable Bluetooth support on the IPQ5018 platform.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> index 6f8004a22a1f..8c252fa3ff5b 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -453,6 +453,22 @@ tcsr: syscon@1937000 {
>  			reg = <0x01937000 0x21000>;
>  		};
>  
> +		bluetooth: bluetooth@7000000 {
> +			compatible = "qcom,ipq5018-bt";
> +			reg = <0x07000000 0x58000>;
> +
> +			firmware-name = "qca/bt_fw_patch.mbn";
> +
> +			clocks = <&gcc GCC_BTSS_LPO_CLK>;
> +			clock-names = "lpo";
> +			resets = <&gcc GCC_BTSS_BCR>;
> +
> +			qcom,ipc = <&apcs_glb 8 23>;
> +			interrupts = <GIC_SPI 162 IRQ_TYPE_EDGE_RISING>;
> +
> +			status = "disabled";

Since the firmware is unsigned, I think it could make sense to
enable this by default

any which way

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
