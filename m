Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8894D3C9888
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 21:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785618560; cv=none; b=ZgLbw9efg8yTgl1Ug2bpTIhJOddUta5eKCNb+5yzX7BWrHgKJpRD5IgqqDRw3jCFuKx23fbKomRopRoNBnKI0AGM+GqYn8cynRvhjQdEd47MKdy/4i/sVIngZErA5oCNJzXbzOqK++ltRkvykH2bD4rbbgVfsV1wmgw49YLt7jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785618560; c=relaxed/simple;
	bh=2MkiDQ4LR3v9Qggis8f5b96KMm5T+X1N0muAXGvlHhw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=I3Tb/adoRF9583a2lraCD5xj0O1Jkbp3yvuaJEpecqXzl5NGYWcJIAKIlZjluAnlQ0bJtyRL4AO1PYGuKWbEOTlogTacfLfDmhXfU24RJxhJcWgaDDWow2mM5hHeqWiRUVFIVMovFgPgK8h/slesBREV2/D9CbzuX54V60ms2+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TjFC8Fgx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QijU+WvH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TjFC8Fgx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QijU+WvH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671J0FnE3910531
	for <devicetree@vger.kernel.org>; Sat, 1 Aug 2026 21:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+QnrZ4/gBqFlKmDVWiKKlCYQOhkw0/cY20YHLWTsZcg=; b=TjFC8FgxcOufN75j
	lrBlnQz0MM2v9sHtA4O3iPYNi432rgEEkoDs9BYLNBE23EFR0LT4FRf0OK+7VKHL
	JRTn6HNuLGxSTjz1AlJ8tCeX4yC/nWFm3iVDTPF6HUAI16R+AZD3hvayAK08Tgzo
	Q6u+6VOoibIvaQcfVmFKreXp/+tI2RX7NLE2ieC7IKh3DzyKR0eaoCA04FCvp4/v
	EE2pNXAeHeFMF4MhyQ8PZij2udo5zu9H/DPJAPckJ8bH2Y1VlB5hM/K1mZQeFXdg
	vsebUPM2AzO3SCwCB9aLbrSgtvmF6XwToj1qc1Da6j6AeqZKeGvyB0X2gFKcIlWC
	3PERsw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9119nkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 21:09:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1c7f135bso37067061cf.0
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 14:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785618557; x=1786223357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+QnrZ4/gBqFlKmDVWiKKlCYQOhkw0/cY20YHLWTsZcg=;
        b=QijU+WvHsgeRDPROd7PKCIKjWuIMdgnMoFfssoKbwRtc7E6Y5gtNLNeqlEH3cQCBYc
         dU2MDpx6K/4QyMtyNIo1DSzOYX80RpTnIUNaX7yBDAc3AQXinseVIQCl4FN1nu8UGd/Q
         AUDq60JoWO3QYt9jqfqSkErHPi4c2VT6ITjbJ3cg26sZjx0++E1Xzw54GjaaSdjLEmCA
         Fu6voJDK1xx6xEP4ID8yUh8QVyHc9UmkytqH3yNK7mYHx6X6K2qs+5g77h8GhyZA15Kd
         5+k4YoERITES+PnFFSY8/yPbJjMG0VSQHwUKGzM8F+kTV0vfUfjWw2odiNaveJTmoi0q
         /2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785618557; x=1786223357;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+QnrZ4/gBqFlKmDVWiKKlCYQOhkw0/cY20YHLWTsZcg=;
        b=QyQuh9irQATLqJHiojt4HkjEfhIpzHV36BlVu9xIfrcr9r79ik8NfyMJM7GiGLzyeY
         8+V5VnjZ3VuzMqmcwdsM3toFicPfyzxZDVamYvTl2ZjbVXkLhPVNmf60BWSTU557XDAd
         EXl71dqLGTV/Iide3guoejzYaoEe8Tf6GC4LN2Tq4lYeU4zqR51EgtfI5zDp3LBvwH+A
         t3ili4KuDeEF3OGjww+M8l8STNFV/kNjsnH82rJKdkv7Hr2BKei97dbc0E6CxbWt4jB0
         E4EOiKC/Ipz1FwYyrkb7OOJbZiDRmypACf1q56VtfP76LQM6XMgX1shonlkTMNVmw0ZW
         dZqA==
X-Forwarded-Encrypted: i=1; AHgh+RpyPJKPhxawZ6r+XACEEKRhM6akKCWxBZx7k/zBBbsoIt5KIg951caE9LX6/pz3/+WKn9BiKq7EVgNK@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsfg+6UIqYHMezVqD186A195VM+GyrHSBCRiwbg/QxSLDUWrb7
	ee6T7X2xCiBbp5a1abhdfh1F5GbPQga4Aies8VKgKcoeG0yjkfgX0qfBlmpxQfmxL2wjjzIxdaa
	XiYflYRW4HODHXtzNOcGahuJnBkDEj0/e0nhfXbobk31AfOcvIt4q+zlVQmcNME6a
X-Gm-Gg: AR+sD106v5HWhMndNQkrEKarnCmU3dI0k2ZxUR7X1B9Y25mP6i3OYftg7fW/5Mvt+X0
	UayTGfFmkrPmVkBTMbe58Gpo5IKo3U8XKF+qBkVE/vk/jg0mLB5QNNE0gRfZX5hTg6kIGUrOQ3O
	jXEjSrcK50E5YnyX/XzCQFhji/HmuW22E4fefIISZwYNLAmU7phtG6YBibfePGmAKwrpYK4U1N1
	HDn69y5sSnJqd2CTG/rvgPUsbEoJkHvrtWKjd5aC3jcJDy+BJjMa3ZXmWjjgmUMo6XPYF+zWU+2
	Y7I+dTm9m9fyxcp3iEZQTfEx3qsxr8NWlUiA04pGd56JQmRHDLeLIMiTOVmC8QfHMEyYSIRlIM0
	vEaecyCojk1qFrQ3VXl46YTyCXYp6Og==
X-Received: by 2002:a05:622a:53c4:b0:519:5680:1b5 with SMTP id d75a77b69052e-52b5674be9cmr112045961cf.21.1785618557584;
        Sat, 01 Aug 2026 14:09:17 -0700 (PDT)
X-Received: by 2002:a05:622a:53c4:b0:519:5680:1b5 with SMTP id d75a77b69052e-52b5674be9cmr112045761cf.21.1785618557262;
        Sat, 01 Aug 2026 14:09:17 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd42d91bfsm18716122f8f.15.2026.08.01.14.09.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Aug 2026 14:09:16 -0700 (PDT)
Message-ID: <2d82022e-b7cc-4b73-a423-9ca24403a484@oss.qualcomm.com>
Date: Sat, 1 Aug 2026 23:09:13 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ARM: dts: ti: Correct white-space style
To: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
References: <20260801210404.383925-3-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260801210404.383925-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE3MCBTYWx0ZWRfX5s0hTjt5u2OG
 kgq8p6ttH5pyszlwOMjGHMnDJKIy+qZH7B1T5l962qReE56af+L+36RzuMd2Sdcvm1suz0HQHEX
 6NYQY9S/tlViEAS3+MKnnvxiuiews1o=
X-Authority-Analysis: v=2.4 cv=PvGjqQM3 c=1 sm=1 tr=0 ts=6a6e607e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=8u-3XouvhUw7l0pFq2gA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: uD9TTh8Sgte1awrJwgrt8zeuniDOsC-U
X-Proofpoint-ORIG-GUID: uD9TTh8Sgte1awrJwgrt8zeuniDOsC-U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE3MCBTYWx0ZWRfXxTCR7ynG2nkq
 sJPQCbxKSDNN+lR83DgAn215x6oyTjqZOJeKBGuTXznaHxznkGXy4rUdDt3nZmT8jgnAeDoIKmr
 hlD0pjM2W8SKfn7qDVYZkR2gqy6R6cHH8qZP+W5kukXw7mIKeqe7aolw2ApHpRZzHBm3P/pyfPJ
 AnM1IohQUsrO6+qhZnN2Oo0RTArXomPEwu2PEvQ7jwMdXmfo9Og40eseNyFk/fxpJ86up6ggBGl
 rx0o/KUUuKpdl82SqtT2Rdp4GjAFb4+a4uDBR7ZFPD+Yy2suHaRTkK3kwrUdIosLhdv30CQecvb
 AjHqYzCSzv6jurDkmk4S2MkFxfXjh6L/BYPPjp9DA8NGqxM+SFsbGhIpI8qnCO7IFQ6S46Ls+kL
 ozkh4umz5QbZ5LhSJTtgT+mQ1T/KfQCjroB7r5wIlihGsEfLKCrMslifuDFJoLpCuNqllVGTUbk
 hb4MjrEJPxI4//GH5xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010170

On 01/08/2026 23:04, Krzysztof Kozlowski wrote:
> diff --git a/arch/arm/boot/dts/ti/keystone/keystone.dtsi b/arch/arm/boot/dts/ti/keystone/keystone.dtsi
> index ff16428860a9..22c8b8b04340 100644
> --- a/arch/arm/boot/dts/ti/keystone/keystone.dtsi
> +++ b/arch/arm/boot/dts/ti/keystone/keystone.dtsi
> @@ -123,7 +123,7 @@ uart0: serial@2530c00 {
>  			interrupts = <GIC_SPI 277 IRQ_TYPE_EDGE_RISING>;
>  		};
>  
> -		uart1:	serial@2531000 {
> +		uart1:serial@2531000 {

This needs a fix...


Best regards,
Krzysztof
