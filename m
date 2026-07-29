Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B152459AC5
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 14:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785334585; cv=none; b=XezSxNTMjsKzO9NyL+WGWQ8fYtHi/x4Rqnk/CP9QLbWeIUjHxck/yGtUdxHJGo3hb8dCmG4HRCGExG5sh13QNdUbTDF1ADK/6tdMvpx8YkzUM2cYlV/ZgqVBcQFeJbrH7kYNDYfTLf5yBtKhGlTdEtfWC4lHZs8iQbnis6p0rTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785334585; c=relaxed/simple;
	bh=JMIBpb1ExvceHVp5GEsXb2xACewrO/rZ1p899xf1kgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fF6gD4Q0UDzaQxFnJvxsjiAi1/VkQApPw1ypnJKhYs52RsgEOhuNxZZi0p1fdxZ2fidLY16JHX7502iCI2Hk0qorgYz+hy9htZadwST4CJWt83h8XWRnGTJf8MHm2sVO7vwwgS/CIQhg3yX8WboFtnZy6/Zu937ZN726UWSMxDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LXQ9/lMZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZYbcuJ7D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LXQ9/lMZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZYbcuJ7D"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TD8B552061996
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 14:16:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/dM3LZtY2QW3bAxdQMQdlfK2xSOQdG1B50QWVPiIzAM=; b=LXQ9/lMZI7HFosOW
	4pIbkHrfv3c16Bb5yujlY4SCPRf9KbvswEI5Y7ucHd1/ym1WpRNCBuxvf3Xh5fg8
	Gqi4Y7v9BvTrnXNkfl0JRVTeSUQXQkv4weM4xbTt85nje78+/A4SiehjFgsP8uVU
	MEPK+KfNi2JP7dTPHt6lFxpX4hXdF7sOOt86E0XzOIBB5qF7DOFA0544wNoqSxbm
	gc/GkWBk81oYt+PL/y0MqvQOg0Zsh0Ao+YklyZiP/DCLalMUA1ko14rBachACiRH
	tQoXRlIIY9vTTB4Gg6oqOvbxCgLWUujbJkxzDhS1EQQonqA7AlFVCd0r8UGqyI5J
	y/6K+g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgrcgp7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 14:16:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c9d953b71so1514641cf.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 07:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785334583; x=1785939383; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/dM3LZtY2QW3bAxdQMQdlfK2xSOQdG1B50QWVPiIzAM=;
        b=ZYbcuJ7DXofT/3Mnb5V1dIOyAJCivaxVu2WmROCqRhrRzV8IjucY/rW9Oyl3oylXav
         gwzexuztD7rHUvaDgh3nd7ae7W8ccZGx3KZZaeusP31r+2Dv6e7LljgMTbKVkMXEnk2l
         kqXengwZHQJM8BeeL9E4VzJOE8Wt2ymID93j8HzYCV0lVytVA9Cs/V/1c6vBYto/ph6X
         PI1gHgV44h+WkHcJY0pAg2T0dsB/NdH2K8zm0ki17v+RvmIpTxbBPhHoBf5VXD1gt3xZ
         107Cu5dTzMN51k7R+5FX+ywesJuTOZb0OARTAkoeiP/JhKfENW7+Ke3Os62KXVhe67DU
         1ttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785334583; x=1785939383;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/dM3LZtY2QW3bAxdQMQdlfK2xSOQdG1B50QWVPiIzAM=;
        b=jT3DbOgf5W/bgGVedd2c4VxzwybcByws3eQdB8chXkAtmWKN4r7I/DVkeWXcGUBH3f
         yaT4ktFKeibnX4ULx5nFfuzKS0I8Z7f0DrA6k32zdVS5dqZ8HPb7aHa+2pjJSHXP6JAB
         UJRCT1a4ok2I/R4OAHuiJ1na+LnATkhL17YZJtWcLJMsZg8Px12+H8J6Gqn81hclF8Yn
         5oK/Cq63UJ494/JSZTfNteCjLzSrxQFGP72ayrQpdJ10QhIhd7I1bDHDv86h/LYOetH0
         oCX+ohUAquEGa+c22Sd0L/O+6FPCzLBmGsYs4slgjzilYZFNC2D/aqwAhojyKTHfCA0e
         mwmA==
X-Forwarded-Encrypted: i=1; AHgh+Rq4wririCrkGSCGhzCAqGfsSkePsG26dYinZ/95tVATsdEOdbngkYipahQztxHnIi/LJUEf42In2arE@vger.kernel.org
X-Gm-Message-State: AOJu0YwjdDgq7lydePtC7E2Uk44nB3IT4etGUfbPm1LTi+KR1MKkgvhw
	bytAFrt33zwuveZehZGEH+XrH8J91yDaPQD8buqMWgvURhSKppZxQ8TkjDUmmOeLoOu/gK0AM2t
	euuTyQgRYlUmIQuYsjbG5WeG8BEPlQ0T8cb45bRfGSxUOKkgMxOP8aADNXQXSH4H7
X-Gm-Gg: AR+sD10J0U40VWGyozOrVqChlqt7z7n+WMFCdWGkcoYi+OlGLJDswk1cW9jPXJwS2at
	Np99jr5N2TYMP0J+1E3H+bhgty2d/6SIQHBfS5xLj3u05SZFf5BW3k+dkSJoZahfiMnzHLKAnl2
	LB4B4JnO0DY0hAyGlHOaby8tZW/Lb3BS3tUIq2teLLwgofczvsX9Gtv6MyXCuNzEbEQ1/9VWX43
	vMEurq9BJqgq+NUTMliLVQ29kXv1MiJj3sB9F5e5pQbKB9npEK80y8K0aGDDZjzWT6dRFAYCMGa
	NrULTLeHiAAdZi1VKPzvcerJ+Vygp+ekVvKxdMHsVWGi5n3EFc2+tzhus5lzbguOnErNXTHMNVK
	PYvMbdwvoUfpeHffVaNFfsAld
X-Received: by 2002:ac8:6145:0:20b0:51c:10e9:ec47 with SMTP id d75a77b69052e-529d7152455mr47510691cf.5.1785334582569;
        Wed, 29 Jul 2026 07:16:22 -0700 (PDT)
X-Received: by 2002:ac8:6145:0:20b0:51c:10e9:ec47 with SMTP id d75a77b69052e-529d7152455mr47510261cf.5.1785334582093;
        Wed, 29 Jul 2026 07:16:22 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2d76a3029sm423087e87.18.2026.07.29.07.16.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 07:16:20 -0700 (PDT)
Message-ID: <1fda6197-b981-44d1-9dce-6650939e3f97@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 16:16:18 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/2] arm64: dts: qcom: kodiak: enable inline crypto
 engine for SDHC
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
References: <20260707-ice_emmc_support-v9-0-701c86f3c25b@oss.qualcomm.com>
 <20260707-ice_emmc_support-v9-1-701c86f3c25b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260707-ice_emmc_support-v9-1-701c86f3c25b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QQKfS8JLNNcSzxWRSIWwj9Ik7sO6SaYZ
X-Authority-Analysis: v=2.4 cv=Id+3n2qa c=1 sm=1 tr=0 ts=6a6a0b37 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ltHjZ47pji_ka9M4CCUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: QQKfS8JLNNcSzxWRSIWwj9Ik7sO6SaYZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDExNiBTYWx0ZWRfX7ajRS8wiXFfY
 Caomf6fIDnBsQYlOCB5JtJdDZA4xY4jHRTpWXw1YvUlahS2RqmSYyIvc5aZW+4JQ+CpdGOicQpe
 Nn1jNeRHM7DbQYbc8SXKWcDkgBZZRjs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDExNiBTYWx0ZWRfX3g2CniHiPK9F
 +CAdCWMtDs9n6mzCh+TUo9R2v/xM1YFCLRtslusNiI8vvtp+cppVhoxEND7xmVImYSPUMyg18ak
 KF+WP1LsgNf0s31AG9q6XG5rnOoqhfaId18qRck3d1tEnLdPyEMBxSOJGuQd8bXhFHEx8hHVxMB
 9pfr85nwqO+9R73+xnCx5V5NPvo2nnPvMQdGWiorwEbBUvUTE0wk3sOB4VmetNRvg23c1EjOYwx
 Vzn1pT3+L/3ifVYAHZ53Seulz9bRrD8qYcrw+1wIEZO2MBgKuatwqRWg+lzILqbtsWnsgquo5yv
 iEeBojC0O5j6XV3P7gq4k3o+7JWCLXiPHDfo+JTo/Qb2XwkAOJr631KRvWz5rS28eSBTBiTchr8
 00yVAHTmukhaxVnuNCRJQYVJU9sL6z5LuQjbE+NhSIvrsK7mi5Q1lTczrl6rBd22gSQ1zPXqYNN
 nnIrVUxtmCET0E1zGZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_05,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290116

On 7/7/26 9:11 AM, Kuldeep Singh wrote:
> From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
> 
> Add the dedicated ICE node for kodiak and reference it from the SDHC
> controller via qcom,ice.
> 
> Also, define power-domains and clocks properties similar to the UFS
> node.
> 
> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
> Co-developed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
