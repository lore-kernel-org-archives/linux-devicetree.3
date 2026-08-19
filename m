Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291793D3CFF
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 11:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787139599; cv=none; b=EFk8BLWmGW9HoVdN1HIq15yqNz+n01/dv1vb3ZaYq9DxyI95kVrjuk5vKtN7v7nCqW6BmFRwqJSLxhmGAbEP5K6xZco3ee2BbZeiD2luZ0bowi+HAKSFCnt1QtTyMppYb5ciZszgeyfSZ3hvBUvLNxUypr/Dl64QvIXCCr7ddxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787139599; c=relaxed/simple;
	bh=CsTuZONaAyeuKxRSACgHhfq5qOIK3Djua4qKrdXnoaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZnO3Dh/0yzXQ0JEoOsDg+w9vxUovJpJ5jkz0iVCQbOm9p8Ek7pTod9cT4yYhkc62lTuh7btF/5rEmR6WZnfZOLW4d6gZ+NT8LBr1ZEXS88T34MbHIyjtLyVK0vJLJwis9GwRtuCfIksD0uN2ythVerGaBUOIO7cEJlfclYRcCnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FUykGVGb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vvr+2RYX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FUykGVGb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vvr+2RYX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA7xPS3983908
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 11:39:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i2ThMck0OybkTkoB8TESZ2HY1tuZaWXzrY261QABM5I=; b=FUykGVGbBjegpaaD
	jV71XVZqpEe2ypqweCs+uDUwXTBa1WDcwxjOOC0mqwrPZN0WbfqKOf9mQReSNHbx
	D01Cn5jgH7QzzookIElpXprboeb1zM5zvqQXMxvkx9Tj1v50cMaTKOow3O6kLOUb
	juXRtZvN8PluWOOk7BXTcQPXjPBoeddHI8KTnxio6jxNSwRW4vUahqPKMAHrKwhE
	Lwoi/OlcWTH+MK3e+bInVdtFVZW3LPMdQ30BJFlEJGMY8/Lz43GyqK7QpEOKpyTc
	sRL8kMfbzGl4e6Cd6T7c1ANt2W5H/Rtzg70TUassUTvPSPnvaLMnRolomqANWIGp
	+c9QMw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfjk353-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 11:39:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5e21552dso5458685a.0
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 04:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787139595; x=1787744395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i2ThMck0OybkTkoB8TESZ2HY1tuZaWXzrY261QABM5I=;
        b=Vvr+2RYXOnMHX1Eo+CUFfbwLYCCODxfPO1lf3AfOYbG9cbojcYe9su5IwSKaQrj/Fd
         gzs5KaHXvrZIFF4ZhcUI1pRSPIW4WhoTT02lQgXykg+Z0qI45ZBqlGVV24ywUuUZ+FtF
         BAeEHYFZJEWkKRxF81ETcsGNYG0PYjCQ5Y98YkuXY13eGjilvMneMtmyJ+66yKakopwA
         wk0MCc87dhAUHZpIZ8kvlcdNvUyB8pQVg7tPrDIPCcfQy73hgpHZxomdxzqH+o3TJevE
         R0upHCh03IFFbqk9L7Jy1IzdyBj9EDtmK95fkIFReJBVjv9q+0gTZojPjHJk8MDhvccS
         RekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787139595; x=1787744395;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i2ThMck0OybkTkoB8TESZ2HY1tuZaWXzrY261QABM5I=;
        b=sBwJVR2D+Y2cPPL9japdVoLmXo9JsUzeS2xpP1m0Ixi/WGvpQPx8hD7hXTUNzgtoAa
         DwoHCF22bhJPCuPIw1s9V8mufy1ZKjCU6YoxxqKvJ8D1lpa2Dte4SGIoh+OHmcXeIjMX
         pSr+OKHF+lwXqXPljWFk+/BLp9EQp4eOppf23A1/CdrX9cr9jf/cYrYfdSsGl8RUr+CL
         x0ROlqaXxDjbPgNn/XGUTLP8ByNnjbS3MIQwrlNlfGW4vxwFzyLIR3X+9aPe5U/U9HYz
         s7aRjd4WYTtkfvacBWj0kh3isfyB/2PcT4LTlJgS4WSwVjpY3hQDl8m6r7VpRTyrQQhA
         pUNw==
X-Forwarded-Encrypted: i=1; AHgh+Rq8Vly9zUbvEH8rnhT4stOoUYUAzbrzvXgTT9fgUlrCfIVWBRvjuBS3xdwkm58GGWxwaS40nEzygYdB@vger.kernel.org
X-Gm-Message-State: AOJu0YzlIA733pjoUCVg+emDSQvcWvBdrI0dS6Qr2mua2YGFZc8H7iU5
	bma03UR/635Cziws4EUCJzsVHod6rdsGMOR3rj5Zs1SCZ1edvaborfGqWZpoCQUYOEFpIm2OCaV
	Fpe8JQ36M0lm/YJH/h04q6hNlNSuEwYseE0JWd5SnH2keWnKN8w/1d17bGDUwOzfW
X-Gm-Gg: AR+sD11xfvoE9FM/akwpSQBDUY5by87hsyR48VP9tCr27DIJFpSNqDu0G2PBsSZWM+/
	ZQfJGubwahT45miCu+WNmiiTyUWURRwtWW1bfMcj24S+7JPS8Ves2HkeRJzfYHTMo/NeUBn8Q0G
	WoaASQ7f3dbbXs2SG2ZjpALfESEZz82ZwuRTEjV2EAXJ4jcaMhCqboCVo0T411DLOXvUUrpwnRF
	PdYaYUlvTLDRKtqm1sIeNRzcdyguQoEUaqjpzvlG1GoBIG7mtRTfMlBOC8HAiDu8Lacfln/pEaW
	pOmAJMV0doh0GO5Kkw6yq+eI2HzENadvHrCPlQv4V6g9/4fkW9frTUEkFjbJE7pfpjhC/t+0a/J
	4ssjiQ1gBMMwaPi+B1UQLV5xU
X-Received: by 2002:a05:620a:a809:b0:937:2443:3434 with SMTP id af79cd13be357-93724434908mr51192685a.1.1787139595226;
        Wed, 19 Aug 2026 04:39:55 -0700 (PDT)
X-Received: by 2002:a05:620a:a809:b0:937:2443:3434 with SMTP id af79cd13be357-93724434908mr51189885a.1.1787139594816;
        Wed, 19 Aug 2026 04:39:54 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff177b1esm713807a12.29.2026.08.19.04.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 04:39:54 -0700 (PDT)
Message-ID: <befb87e4-3b29-4e97-be6d-7dcc5e826dbe@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 13:39:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] pinctrl: qcom: Add SM8475 pinctrl driver
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260802-sm8475-tlmm-v2-0-a93e1d1cb53b@proton.me>
 <20260802-sm8475-tlmm-v2-4-a93e1d1cb53b@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260802-sm8475-tlmm-v2-4-a93e1d1cb53b@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA5MCBTYWx0ZWRfXyqRqO9PW9L30
 eUlyN7Fg61y63XOETjlsSdzYBY9FWU9WedIa/1zfbSJbP89eem3rh5JRB7P2woeuVlw3rAAnbJw
 G4SCRkdZYI9NmqCt3mbgKuuQ90jUk/Kvlal/OzXwL0sdbkt8X+SwEJF/2bH9TvOjrGpMZfU7jhd
 UWIExDv81DriniXFa1RZaqfsJmpB9hSohwVtOFTcepCNAbXlBGcGxRxv6zU+82tudkX+aklN9ek
 5lkh7qPNZjiY29DQ/xMu9DeGfbK3eaSvjO6Ax7NZ7R7liIySaCj5hlhKXOE7Zi9x6VuR4KPp6av
 OEd+q6eRWVY+hXkztuU8GBQHWS6M7Fvf3qewR8ZnH7mUFWtGR8/CLhX3BzFoLGH1+rktIeF3mTE
 jU90qhoPe9JnP4kDKLfn3VpCz+BgtBsEHGOTNjWr4Sbx0ETyoEr3FgPL1EmsuvQMCRRlMFYMlHh
 MJHEkroRpEEFZxMnc1g==
X-Proofpoint-GUID: NzgAaXQHl1EuixN_oBeOLBIOUBfwhEHu
X-Proofpoint-ORIG-GUID: NzgAaXQHl1EuixN_oBeOLBIOUBfwhEHu
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA5MCBTYWx0ZWRfXygBT5oJoKk3d
 oo85HWa/SwQkCLjHHtFFGu1VWEjPWBT62Z6pZIO2vB00bP7h9Z4yejvKudwviYUinu5NQRLYEt+
 dCKlrDkxywn/bsOKdViH67s/NqM2kSs=
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a85960b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=iyVIhWazpKipxYJLXtoA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190090

On 8/2/26 9:30 AM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> When compared to SM8450, PLL clock groups differ on SM8475.
> Add a separate driver for SM8475 based on pinctrl-sm8450.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---

This is a whole new driver to accomodate a single change (removing
function3 - pll_clk_aux from pin 98). I would just add a comment
somewhere and not bother, especially since IIUC this is a debug
mux output that doesn't get used in practice

i.e. I believe this patchset is unnecessary

Konrad
