Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A2A30C142
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 15:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785252707; cv=none; b=rkFABkOR3XrBbIVflSbvbu1jZGbI/pmi5y0yJvNtlWap4chi45u30sjJc4zC3iG+1SFqhT8V0u2ZApIESCrVsAsjg5c9Q41eR7Botvle5DkuNRG9LVtivbQWJ9rCOF85GUo0U7TBQZPnjPm1CPt1V5gdMTgO4M59B9qiz04YaGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785252707; c=relaxed/simple;
	bh=8cLcnGV8rDedj0SINGa6J7pMzSq+K5IixnBHQ80jJMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jruHOZ+oQH3MG9wNy1M77pxVIkhuZ3QIERToTxN7vqfgf7rTzQnjq4J+4sYYj7lOq7gbsopr5iOMkfmjGX9cCIRePzZVe7jy9/354+w84foRTXjN38rvX6OiRNEeN9Hmek85Um6f3jHS0eO75w0RB1mXPZ72r6aGiJLxsQH/86E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cw1+KjPf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RNpLgQxC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cw1+KjPf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RNpLgQxC"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SEcnKW3288787
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 15:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	krbL3eNapeKc6BfGfOARbyhC8+TaCA/Y0QJVqg0lx1A=; b=Cw1+KjPfZYG/DVer
	FWXKoALR0Aj5UmdDQmJ21vhkfqUW35LQq7vELcB1BbZ8FhBavh/fDB+Liqd/Y8yq
	fXJKbMyJiJ9k/xLdLztA1hDun5HVlOTtmyLDkDRgu0YkwCj67FZnZyZ2jvW+3O71
	+pylT6qYiIdxbPjy3ccia9/O9yh4z2i9z1ffHll/1P/gnGlzDj7B47IEjEshngXL
	m76SJdB9RZcb9S0MLw9gYUxpNGo60zjgZc3/jNW2s4bxh3Bth07L2rpX7G8+9ygL
	vjXlEQSAv6qiUv9yPGjTU2ZkWn8HUoxm4Dt3AVUvQEibS3IuarJgGQLnu3XVFiLO
	5cphBg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpn3y2vf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 15:31:45 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-848662cd2a1so4625358b3a.2
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785252704; x=1785857504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=krbL3eNapeKc6BfGfOARbyhC8+TaCA/Y0QJVqg0lx1A=;
        b=RNpLgQxCuaX0hYx9bVHVPbg2UUooljcMH4pcYU31ygeN+9NFBv5WiG4sfv9sQ638S/
         Rjyk7EXClOgbghM+XATrtZV/bM9eZkUYx3XXVpPTDJm1VakY08KG5m3GucoFohyH0rk9
         BoMkZT/XhpPcCGUMmVoX4DJpbVBP9wm5AXfzYr2yTAmP/pyCTQlU2CJ5vcw+h26mBy7N
         OxtFsmVe2D06PH5INa2DdYsOKrJQGPIle/aFZB0uPWCg8oGGYQtmDSupW/n+sABRb0hy
         zm+zyuFvTCMBtTrB14Fc+rBEFrnwq6tT/OrSuhrjXXXsZztmkdsNlKOxDEP1cwM9/MUu
         p5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785252704; x=1785857504;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=krbL3eNapeKc6BfGfOARbyhC8+TaCA/Y0QJVqg0lx1A=;
        b=PIZ3fYNkrvkjfhzw7m1S4SSVeVQoabs7zRFEMpllnw+9M+O0ylRwnofZQGaWXpgi30
         yydcZUfImizQm5FhwtXKFkSadSsDoDdJrIsYJiCyS1NK7wK7XWtv74tslDqbCQ0i3xcy
         kn1lQnpQLboKKgcnPvgFtyBRtdNRCC8Dby3AzHvg5J/TXdGJDxl554YUvJ23yEpIJL39
         y6COe0bYKHzr8DH0WtZ7Bk3ORwiJJFF2RKrOGni01NMGjWo4Tdc6W4fQUoFiqg7COByO
         LAP4bZGw1ugJDUtD2tYR2AeewftTxfxTibX4Bk1o/dRne1ySLIU3Ro7M6EzeSg+BnK+X
         WM+Q==
X-Gm-Message-State: AOJu0Yyv2IpNmDKxe0NllDR/VljN8avufRllDDR3KbkN9xSsQwD1HBm6
	dnBeaFwSPBz/sfir17fpl4Y3IFD1XgLUoZbQaINxrYSJyWkBWnHou2dCOOd25nSNjEUg/Ok08+g
	7gOrs8Hh5jLNs2pFup9fqZLhmQhTNN6Qsa+UNCC/SEaH/iFY/Id6UlWY9X+Gv4KEYhvTbJS/h
X-Gm-Gg: AR+sD10QNyDJ2PrpFZuLGI6u3mP6R/DMJl7nXpPzFSHX3kdlHPGDFRuFc4nD59PCS54
	yNyI+YqNc6P82kiI8trLlGhsP1QFG/zKTXI1UbKCWtb6nwvalgG3aHLtCzGxSv5E0zOOzHpnisv
	215wWpVbu7v/lkvEu+F7D12cGJbQr1sf+uNyGTu5rMSRkEDbOANoLt1Hux6cFA18WT3RZLpH4b6
	nPc0cQD4qxrVMtaNs32//SMl//brk5HFvs46z5m1Nlk+zMpxln9qj8894WGjttkmgYCLKIKqMG0
	YlPUBJfMz8WhuWSorjYbpbl7A/FArLO8bDC2qaDt56TM6rWL6xF8T6ro0/JjY6haXn0+iap008d
	bKuwMwazyW4ntcH5UNiklcp2aejeTuE+jURw=
X-Received: by 2002:a05:6a21:398d:b0:3bf:c07b:a9ab with SMTP id adf61e73a8af0-3c8ba618024mr3596951637.55.1785252704138;
        Tue, 28 Jul 2026 08:31:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:398d:b0:3bf:c07b:a9ab with SMTP id adf61e73a8af0-3c8ba618024mr3596914637.55.1785252703660;
        Tue, 28 Jul 2026 08:31:43 -0700 (PDT)
Received: from [192.168.1.100] ([157.48.146.255])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb660daf6sm4764867a12.2.2026.07.28.08.31.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 08:31:43 -0700 (PDT)
Message-ID: <60785b9f-40cf-4b39-ba67-7dda43c7a304@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 21:01:39 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: hamoa-pmics: Add ADC support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260727-adc5_gen3_dt-v3-0-bc00223648f3@oss.qualcomm.com>
 <20260727-adc5_gen3_dt-v3-4-bc00223648f3@oss.qualcomm.com>
 <20260727173123.A1B4C1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20260727173123.A1B4C1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fbidDUQF c=1 sm=1 tr=0 ts=6a68cb61 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ivdcr2MBbwUSZV9J0j4ptA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-CxNEMdzEf_LT3fLqugA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEzOCBTYWx0ZWRfX0re+cUNFaurh
 j6BSlxgWFApKJXLBHUX7J47lFAypcukVWw2IdGqRjsc4vbpXnw+39YXJ1Q4bnKDymIgX7NtsvGo
 KRLnsX11iRBxgoXjSfOOQT/KGKDGmn8=
X-Proofpoint-ORIG-GUID: vor9qb5N6YYr1B6hORBYvvrNRZewV4e_
X-Proofpoint-GUID: vor9qb5N6YYr1B6hORBYvvrNRZewV4e_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEzOCBTYWx0ZWRfX45pB7PQ78yvr
 f7Hih2jn6B++8lOdWF9xErC5yCzWBvpFBGHOlYv43rYrRRc6MIr7T534mmyBQ4xPhXinVQPiI9h
 9l3QE4zcvWiB+MDN5a4qGw8V4V47ketU9KV3Wiu4zpEcMF/b6Gu1If0gZcbaTp23dYaqTKalXDq
 o5LvnUQCODSLIXI9CD7wympbnQziF0hra65jrEyeLeEHS3aqP90oh7Ckf0mQYYvtDMB3z4lS4xj
 Jq1lEi02AIkt9q1V1ddO+fQiAHNZLiN07Nqu3Ydv+XA6UBbmLeAkmjwrw1mdVzdCYRXcTw9X3g+
 bV1TOKPzKHXiGHLSV3ZF3ohAZfQyyZZ80C75Y7Hb37Ienr2704K9K0o5j8OAArJZkPglvow7Z+R
 tmZuVpvjR+s5E8HV90CUwWMgASSxkgbdYAlcQSTfQAlXG7p7ZmZiji/1BVpuHYLYdReKa7IK2d6
 mD/h8KxF6Mt/+VytKEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280138

On 7/27/2026 11:01 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The patch adds the `pmc8380_6_die_temp` ADC channel to `hamoa-pmics.dtsi`, but fails to delete it in several Purwa-based device trees that lack the PMC8380_6 PMIC.
> --
> 
> --- Patch [4]: [PATCH v3 4/4] arm64: dts: qcom: hamoa-pmics: Add ADC support ---
> commit 506a2efbee2639e175314a25d3b48970c6278e83
> Author: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
> 
> arm64: dts: qcom: hamoa-pmics: Add ADC support
> 
> Add ADC node and define channels for:
> - Die temperature for PMK8550, PM8550VE* and PMC8380* PMICs.
> - PM8550: Die temperature, VPH power, and system thermistors.
> 
> [ ... ]
> 
>> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
>> index 394e65518ac50..661dca4fbee34 100644
>> --- a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
>> @@ -10,6 +10,7 @@
>>  
>>  /delete-node/ &pmc8380_6;
>>  /delete-node/ &pmc8380_6_thermal;
>> +/delete-node/ &pmc8380_6_die_temp;
> 
> [Severity: Medium]
> Should &pmc8380_6_die_temp also be deleted for the other device trees that
> currently delete &pmc8380_6?
> 
> For example, these files also delete &pmc8380_6 and &pmc8380_6_thermal, but
> are missing the deletion for the newly added &pmc8380_6_die_temp channel:
> 
> - arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15.dts
> - arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi
> - arch/arm64/boot/dts/qcom/x1p42100-crd.dts
> - arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dts
> - arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts

Yes, that is true, the above files need the same modification. I'll
fix this in the next series.

Thanks,
Jishnu

> 
> Without deleting the die temp channel, the channel is registered with the ADC
> driver on these boards despite the PMC8380_6 PMIC not being present. Could
> this cause a timeout or bus error if userspace tries to read the dead IIO
> channel via sysfs?
> 

