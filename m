Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866088;
	b=HJrs2W3DdhCXi/VBqC2kRcR8C3FEeEG9OSdjhqX2MtgUEcz4tIFwJZJs3GNSPeUu95EX
	 WYxHEwHS8qRnuvmkHquicMknQUtmLHzzHyWJOArReQ06/UNw01WDM8K/zfuaTdR5kFlxE
	 /L1fH7MxRAJocIg+V22VKOM5igTAJ5XMZXYDRLw0YH9kT3WppM1GzwcOirif8bU9tuKgN
	 8i1W+8Pcw1XqqyKNoSy9jdd7NbmlxQRu1UxlEvTsOd8X1y5xjqRSAlc2oN6v9CVnGGEpA
	 EJtTeHmf74o+epHVbgXeCFFOwG0H7LVzl8bBJa18/UMrAUJaepwAHEsSJOUmnZOC3Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866088;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=COqOviJVmIsmBngooW4OGwGHlGp+DN/R8J+T/Xc4pXA=;
	b=dO++CcReedGTidf28Pd+41sU2r7/7A+FQzu/T2PNmiHSPJtwc/11ImDBZZsDooj1LJ9R
	 2ARkcVeuVmYqvs8VbeM9vYXpkiwfTPBW0Zw0/3EghqkXbgqsNP1FGMvE5CNu4no5FxdTZ
	 7t9AUujlCL1yweZznrn5vOskWPNLiIeOx7v1m3UtF7Q6g3H+P8WrZ7o+qYY3ShusnMTyd
	 HaJ7S7q7rwRpjlt6qiqk9CrvKKNdNMzbNvT5l0kD/pkGaStM1KevPjYjfD1bHsCTmDQOL
	 +fnBgX1KStS1t3Caca+VFZluqbJnvxknOyGdWyDKIybGFEGHp/iyyUgORiTKKBSLiYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="O0uzeIW/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a8hgm+mi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB4D606A31B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 08:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFB4D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O0uzeIW/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a8hgm+mi
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56U2OO4169544
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 08:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	COqOviJVmIsmBngooW4OGwGHlGp+DN/R8J+T/Xc4pXA=; b=O0uzeIW/H/Hxv8pl
	hk3/YzfC8zsjqijXerhctPmjKCMNw+D2c67SMri2K9ANgekiJ054ZfM+ag9JW1zY
	r5Ny2pB1QUqKquZqkSpGotwg4XMwmOLNr5rT7MNXwPGBZLlilLr8EUp2jh+pKI3J
	8fpojhcixy3+LmAvf/zhMFoWghdx3go7oUnHTrZYFhrBDoZEsOrG1F7hIfYdRTdd
	SWp4GVrfUxHhCYH0oEtpMk5pnTBiOSafW591fdWnIeJLSg2DiHrUJm4UUSP2g+Jw
	kQKNQkdw1lVTbdd3yF1Elc0IU+2H8kq9H/U7y1mE//rZ85GY+FwtHWV6OPepHNNw
	g4pEFw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrmcd8day-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 08:08:06 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9906ce36960so87556241.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 00:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793866086; x=1794470886; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=COqOviJVmIsmBngooW4OGwGHlGp+DN/R8J+T/Xc4pXA=;
        b=a8hgm+mi9u9vdcrUinc15eD3LWeD9Qott1RVvZuzrXjel5JBtUq1drjApVdRFyJxIv
         AFW3CpBzPbWIzGoI1CfEWu+jun8Q9QGP5wQ94IsdUlqwcau4F318S/A/jO66gQsdLH8k
         IBkW0RcdXLippN4VaR5W0FBsbF1APA/AQIqDud1qljiI1TuiNHTBguhai2Roto2WTQuR
         ld8cTYOy1NcNQ9kWb9ZkyBPi+zp4hi78Cilv1Fz7wrrldqHnoT7fFY4vXUsqQENIMUSy
         mhSXCx/WKUSEZsp2jT3fcEqY8OAFG1+23d/1Wf9KGhQ2hcKGDgdBDEz1+4kXQwtRAErs
         rt+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793866086; x=1794470886;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=COqOviJVmIsmBngooW4OGwGHlGp+DN/R8J+T/Xc4pXA=;
        b=FRawl1gDpFzLhWoGOGlQ6eUvdgIxtWb4rNi7W/jFOq2j4GIxmQvpXwgALUxcjVaQTD
         2f/ZoKqIHzdlFFQAAW7qPh9Q0699BUpZYYZec7+IaYUWvaTKv+wOt0tmajyY54Dlcw67
         YkhnsMKiCSHGLqANRJjEtX0Yy+txHdJcULojWPEzwD9dmaL1zOML4h/GiqhG8N/Kttd8
         KEibWtMkCxgdkLMVwrV+J71WtHg5Ttc37+uT7mRcizxnjLEaaWAqOgaiuLtnOqscQVa/
         wWvnd3U3oqCbCq1+rd3JqwNHhOWlciFRdHL9oiH2QuN0EkJxx/NVcK2YvA12njKKOTbT
         ohBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdEOlw2sZEQmqxiI7Qjrpy79YBdynt63y1I9A4nG5I9DfPFqFMFQz8GLy3BmfzZPYwGGepSfnFtGmZ@vger.kernel.org
X-Gm-Message-State: APuU4Z8IMiryWqtPsn4TDA4PcSHu+AaqTIaFZP1ss/URGtSGeZ87Xuyw
	Kink+bsmiIs7QTzYpvijFNmxshVJwi74DIzG6Xi1PqIgVlS95xup6QURnyuGSUfli/ffiyi+/xv
	6CeCtAQ13N2DlC/aDUwVTPpq91IqTHKkJKAYt9LAZwZxyAjiCRfxxj4M7X/s09l1G
X-Gm-Gg: AYBFou1GIGkmXwJZaTi8u8A39QpVWaEp63WPq1wAfCUDEMwN8ueGV3yUW8DwQ+BbKuq
	NTDdCYZzxVZlJI7FRsY5cPJ62O9xXXW46wYGNucAvV1iYnoKpS2DFS8ndqP/JEXMCGAkycvf2tD
	8z75xzgrpORvNqcYRh221xQJgFTIzhoaoCz61GJriAyAEScWF9NZmW0HAulXCUHZkTYJYqSd190
	hOsuK4g9mTyQJOrmvtO5THg091AoIsKQB/pFSVPlXGajedT9abcwhOBOKtlMpVYFmKxMw8YMuBR
	IxXOrDK0lGySnunNKZKc9huESw6OX0rPvHkWIbmFtMX8hGdcFm9rzI3GQ7eMv92FLiop+CDyCXj
	uZxpxoDAGE2Ks99DssYU23DonGgie2uG56YpCxfwH5bF4zqenh8awPc91hmudlqF+XOFi
X-Received: by 2002:a05:6122:1aaf:b0:5ea:c3bc:c584 with SMTP id 71dfb90a1353d-5ec68514ea7mr8490418e0c.1.1793866085947;
        Thu, 05 Nov 2026 00:08:05 -0800 (PST)
X-Received: by 2002:a05:6122:1aaf:b0:5ea:c3bc:c584 with SMTP id 71dfb90a1353d-5ec68514ea7mr8490391e0c.1.1793866085487;
        Thu, 05 Nov 2026 00:08:05 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e140f93sm145620766b.6.2026.11.05.00.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:08:04 -0800 (PST)
Message-ID: <22d8f5c7-8226-4e8d-b67d-f6b4b1cbb487@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:08:01 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: eliza: Correct number of TLMM pins
 in gpio-ranges
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Gustave Monce
 <gustave.monce@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Sashiko <sashiko-bot@kernel.org>
References: <20261104191700.676773-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261104191700.676773-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104191700.676773-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EOGTQFZC c=1 sm=1 tr=0 ts=6aec3966 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EGeSfPnbYMIGY1KhdJMA:9
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: NZfeLYiN-B3LbHEIKc8clmzo7ZsTgRnD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfX8tiE8hdzK+EK
 HwXUMPsWdJFu6yyDcuT05yUxVC+RZf+C5C+X2qTO3nLYFBivvdHaRliUN3wDotuNj3147UQZ4UA
 5FjXYvWD08d50kNrc3ReGxQKz9Ql+l8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfX1/7KWrGXEaUj
 HMHERYXvY3wavbVpUIMWoH+C68vnn1rinMg1laA/QhOr8G9rjtdqSbIDNevgSu1PbX620EaYfHM
 mA4vaGFR4KKLADRuSxXcZDGMW7cJiaxz9O3IX/dBjC8BeK6zFsdXGvmMOi9kwsvT0C1uBNeIPml
 +5Kagsx36Loz0Tmijeq5o4tLKU1vyLy/aDxNOZ4sPiMjBArbGcqxyJsPeyshwjs+fKraACJ1x3c
 4bU3ed0bPoy+iZ4yjICGT0Jz38OYyEP3G+HdkzKJgRyLVcYqZvf2mTvYfpfd0nbrnIDJoiM6VFr
 MeMlq+Bmu9ds9qPz33T1n95puEW5ouspYwqZrertiR+/LgpE5H6n/3YUXwFGnZlIlSyOR+zUkjo
 l42q3kEjVCgzDYqkSrAvqm8PsSvw+CagcDbTuqFOtb20P+1QtV9Q86k4kEnnhasyOb2Vl4bG3qO
 GDgMr43oPE+64hA2gjQ==
X-Proofpoint-ORIG-GUID: NZfeLYiN-B3LbHEIKc8clmzo7ZsTgRnD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050032

On 11/4/26 8:17 PM, Krzysztof Kozlowski wrote:
> TLMM on Eliza SoC has 185 GPIOs and UFS_RESET line, thus the last number
> in gpio-ranges, representing the number of pins in pinctrl, should be
> 186 so the last pins can be configured in pinctrl.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-0e88535a-02d3-4a42-9f3c-ca4f9bdd3b11
> Fixes: af20af39fc09 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
