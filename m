Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FE635A3AF
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811103; cv=none; b=oWO6C8UBQp24yu9hq6qZyAB7FEQlesv7vvbH+4E6FB8WVtHo9t0HsbM7XKkYMPYhXKA+QxgK0XRuwbjeMedY/SMTF8CIxspYyUhTD+PlOgmf9+kY+wx02KjN/fCYHkcafGo8tWVnVmu37Mq+g9sQiCS3zo7hJh2uZnQnOp9aik0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811103; c=relaxed/simple;
	bh=coKWl9U4jQrOxE82TlyQmZMKy0BYmcR24iP4GqW3f8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kxn3yKQBwtj7AGRlAyLU4de04zP5OAlHZpUXc94a4CHU4XmHb0RGmi8wVrynKl7472BuYa79QF4+4zOF4zVTQCdHDs15lNhY43hwBRPPh6zqUX/3C/KS38ZPfUh+qiE6krxESkbP0ZoRzsR/fBvRLbHlumS8sZlURaTv5d9QJCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b0rUq6m7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VTUlOCy0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b0rUq6m7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VTUlOCy0"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CKPT1096360
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6AgS0xKWDmb8o/ux7R4eeyc7OOTqTfYTdbGCfGoEWUc=; b=b0rUq6m782QnUCNM
	rAQfQkJu5o56OMWibZjnZB1kvR7tCbrYsjMHwBsHv5QGxtNASCIsnhLmEK3xI6j+
	U48feRmn+ipxxzaPNitBe3LuCRHjiQGRkI7e0fkFjvPLFEdTwkXzsVyoydCbls8W
	L9pFVLsbwPXyPVy76Wf6CIsi+yjhmEss8l/3YhWYudEr9v+mlTyivN2dZcCVS368
	XyshNf3OtzLZElayp9XRF6/gGL+guioRemekyORTNmypopxxVd5NjIuC365vhCp4
	8k4V+9SLDeFg913wm/f292E86nx41ntolud9is7GtCKQSXO7URvkOJYY61qtWwuu
	5Z/xiw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f441gss23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:18:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e661ce1dcso11760985a.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 02:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782811101; x=1783415901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6AgS0xKWDmb8o/ux7R4eeyc7OOTqTfYTdbGCfGoEWUc=;
        b=VTUlOCy0PlKwF41TjNHFGLsPOcWdXOkNU0hp14joPCL92pE2BTzwmbxduIRvaLQYfx
         e84FF9vt0KYjU0PiwIrk8UZRbzxMwrD41PJTc0nXkJbh2c+yda+0HQCg0Wv6kG0bqgqJ
         nLdgb2RlmKK468w/+FGzNj78CEDsPPaalgWXgLbqVEo+kuk6+W3R43so1sQTksLJU154
         ix0JuUIhPugbv4prahoQ46L0vQuRRPPa/rpNcspmrMn2MjfM8J0yuhSB+zj6KZjHvur0
         2ThH3UFhAkVBTdlgROmOtXkoDdkjsnRVE/sp05B5YSL85EBpnxzbp0LyObOWeefvnpx3
         MSAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811101; x=1783415901;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6AgS0xKWDmb8o/ux7R4eeyc7OOTqTfYTdbGCfGoEWUc=;
        b=NvOjvpovNeZsTkxD+1oe9/PKUmr98A9yaMKiaWQPIpMjlk9AljTU13OT/GxvV551Q0
         P0GvkBAHEB66PgsNvezX9kEXGm9dc4vsQr5Nlsu3NN8j8RaT1lkdxMvSeVjySvdpKZa4
         p9DQ5RwWFqP34p2wuMlIH0sgCKH+2cl39EeR8A29dSKOVvG3OsHLqTtn4cGEJHyiGV6S
         5CfBGF/kUh7iNPCoG0Zn/PTiiz17W3JcTxHCC2f9JoSqY6269VoQGHWySYfzO03OeMkj
         kblBXzfhnQt5boIuLw+VEsMKtk7XmKWtvI0+GzKylOy9WSCAcbYKypMKKVIhwwN+bW3G
         rGOA==
X-Forwarded-Encrypted: i=1; AFNElJ9eZpQev+rKydLCgOzzmp7B3yjQqRBz1OmG0RbZFn+YiKCmazkR1h1m7KmCsQ4265ftACh/o9hEL6ez@vger.kernel.org
X-Gm-Message-State: AOJu0YxDaQvd+MAw4h5hcR58Bv/NnyGDwlHWgkNBaexp605LIrGE58HF
	1TG2ofEpgOhTPompR1m9aMJ1ytqyVgVb8Uw1pAlailyY6LL8jzEJT6CVX9Dxl0qbYBJ3e4hT5Nk
	Coq8w65szS2qnwIdHH/3U8xVlV480+yk5EySzMyOT/oXyAd1BJAm1Wz5CVeG10ZGN
X-Gm-Gg: AfdE7cn0EfMv/l5udbUVHyx4i/kCm+I8UrZslqiqwf/Zup1drUFfPtNMi5CoBS1B70+
	LOjYtpfqwlET9LwupqdiNwIE9aQSUYeXlevsCG/E3xCc4U7kZuwwxkAIfbSA3y9M2rwtNVQrnM+
	w/vjJYQ5IteAEFNK3Evmyxe17UC0pT/NU1Mscu79NkaVMThac+Uegnd/+DI7o+DdPl+r2YhH02J
	ukxaH4pttBArxFRCVGQSiHadoo/eoYn6MubaWOI6wJtq6yToWnbmMBXQc5Z/lcVUITQyS41TC4B
	Z0cGdEPrKPYnkGveobxzyQB5DVrS+xHjK2mP+QHWwzzmRfOl1IjXls8DTOcxOZpYvjUZiVVTzqI
	phwUAyXvSvpi/pa2bvbiPV14VF49y2BONN1c=
X-Received: by 2002:a05:620a:390e:b0:92b:55e5:864d with SMTP id af79cd13be357-92e627b0227mr288265485a.3.1782811100638;
        Tue, 30 Jun 2026 02:18:20 -0700 (PDT)
X-Received: by 2002:a05:620a:390e:b0:92b:55e5:864d with SMTP id af79cd13be357-92e627b0227mr288262985a.3.1782811100219;
        Tue, 30 Jun 2026 02:18:20 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1289176eb0sm90864266b.63.2026.06.30.02.18.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 02:18:19 -0700 (PDT)
Message-ID: <35f13ab2-cdba-426f-bf4b-36f53ce1d4bb@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 11:18:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-huawei-gaokun3: Add dsi panel
 DT node
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260630042229.277799-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260630042229.277799-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA4MyBTYWx0ZWRfX7gIeKmBXzFcK
 juwI1g1LAZpzfYVEi1fGN25V2uE22YI5Ky9jQdAdo/afY24mO4nJWfrk27UGRsaqO3aLLfEbYmR
 pCLFYY2wfrtZulwu4v7J62lX3+6gu1Q=
X-Proofpoint-ORIG-GUID: SJD3kczA2BhIQ5wzxNqLNqTA3I_W4-4v
X-Authority-Analysis: v=2.4 cv=F8dnsKhN c=1 sm=1 tr=0 ts=6a4389dd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=JXoQ1qKCfQLX0Yv1_mwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA4MyBTYWx0ZWRfX8OnW8C2U3/6f
 uMo8YkKoa1E4xX9aNUwQzrakTCK3J3GKsLXDNOoogUdoutrBppCARXrLghZfoBMYiffuUgWzqh2
 zGJfSgO4tx7VJP9YsMuILaUs9ovOdFzGwK4YXIcHANHpkCukojkbVlk8KZ09LKHGRDT9MgG+ijv
 /BH7PTKLALnoZwy1J7CjYrUeoptSYdgRvYImsxHbUEQ2eWSudsHddOA5Bz1zf8Jb8SwMueEE0xt
 L9YxhaDLLSiSpOEM8DVKEU+QpnJPK2aoyDPSYSsz2j1qFHOesC0xLQeTuA8/75tJ+lg2g+47yPO
 qw6M8H/R575jRyUuMQuekRKUw+nZFUY/lHjtFh1JtSBojT1qDSiilqvuItSRIhdQsmtch14Lao3
 qhf5oFmzZjK4lprJiwwK1lIf3YoeoinqQwT5lDwrRcFYBLGpvAaPTDZCI0rgzi+7N8IA91Pc0PS
 6/BeG387EkFuaqSZSQg==
X-Proofpoint-GUID: SJD3kczA2BhIQ5wzxNqLNqTA3I_W4-4v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300083

On 6/30/26 6:22 AM, Pengyu Luo wrote:
> DSI panel driver have been added for a while, so add the DT node to
> enable it. vdd{a,s}-supply for dsi, dsi_phy are blank since the DSDT
> describes the wrong, no impact after manual disabling these wrong
> supplies.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---

[...]

> +&mdss0_dsi0 {
> +	/* real vdda is unknown */
> +

L3B: DSI core 1.2 V (both?)
L6B: DSI0/1 PLL and core 0.9 V

Konrad
