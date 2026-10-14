Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B38354B1BF
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 16:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791994540; cv=none; b=uGI8+YZfjeA9Gv3YJ3bkD69RFHpX7XXsBNRmG99BzQKTn3inDfsayrRLHXa1Zb8IbqoyDwCI539+qI3QU+q6oukHMsr27TteXKOusB2x/20be8OljSLB+LT8/jd0/FfFiFFc5pxpwzctZb64P6UYaybTo69Pb7QkF7I9qx+/S68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791994540; c=relaxed/simple;
	bh=0RvKwl3q7hzuKdFg1I8BZo8T5YtSb4oa+XE58e6PUGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f9ZnHeWOHGaET+5MzEKDTIeBnG5hIlWoHfYATnnJgAcuMeYx4iP4yx6Ih202o+suJHZpmVvr1K/Ir0FzeBULg40pw2xLCJ7l3Wd/algzaVR7a6yOf5bW64cJv37r1p4U+CuApmZwib8rJI8UHFvaYVEt+FBJK+GJyNqGJf6PAoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J44F1Yqc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KoTM5Dlc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J44F1Yqc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KoTM5Dlc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEb3OG1013196
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 16:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1oOiNmlK64EmT5cyjjFMprTng+kmDl29DI+/5EipVSw=; b=J44F1Yqc/r1emx+k
	7GR+y/JVkcSutXHs9ow6pVoXG5pskbgimKiJoTwguQqtlwK+oTyJzVXa36l4O6Cw
	Pjh9q0qe/bwpr1wThklWKtcATryKqP40B18JZYVZK3IgHDjwL+EzSWydx1KGaN6u
	1dmIgNgU+K2nXi+cTJZuG7ygw5W6KdNvgRaNdBX68+3dyzHQ99ioDmRs6/Cc2kjo
	S2DHU1qD5sQ4Mx5c/Eb5G1VP0jeHhrUTi7aas2Gc5McOt9ej8u+sxCRRm0IcH8dI
	saXI89BztyJXg2+QMQkArMi5FT28PBF7oq40L/XV5q3jvLovfwLO18eVNdOjbxP0
	OwIW5g==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha80cscae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 16:15:30 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c100f6f8ffso160482137.3
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 09:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791994529; x=1792599329; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1oOiNmlK64EmT5cyjjFMprTng+kmDl29DI+/5EipVSw=;
        b=KoTM5DlcoQPVKQYxjjsJoxr074UzP22t0JcC022ZAcz0oFtSvRefdsPzXm3r2KK9In
         6h169TGJV6LMg5ctc4VmsGfWvx4hw0uqQ1s7Ce5PmDvvw/04GfUxqWH87K5uY+AfeLUq
         NpKvrWsgrqx5CTIbE9zNYYoboCbI42elHmgUUaFGCWB2aL9l/zGjYAggcE7h1lNVxyIQ
         GHBRSms75M7DPwtpSu11Aw9944ozY1e/GYQx7oTxas3o9ekcBLsNTU6SEC/wjowm5Uaq
         ijIMgGutB1+TZQcAzH7v7Ohm0Wuxw7uu2Lmq88zFXWvvqUX8bWVsrJ9t8KscbR+Vhdha
         lLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791994529; x=1792599329;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1oOiNmlK64EmT5cyjjFMprTng+kmDl29DI+/5EipVSw=;
        b=W3T3sVlRE685GcChRYPq65gP8Kn0t/6RMXxO6p6OhohYCPdbW4lud6V5BCBes0ZZT0
         3u/wkAEc2IG+7NeT22Fdi6TYgGXAoe7yT+RFnlwzbbKMvKZZE5Pqh7RQIjr19Qq/mEKF
         Ej0pBGmF+xJzID2UuDZ/KAu4ooOpCTyg+9M8dOSD+WRJrYA/F993SktqtFt4WL4Fh0km
         naevifRZ+73+G50M4cgU+nreuycWKR3HPRRhCWuuJ8FfdvvdkLqI8IuJPZEgmiI6qLf+
         Wwwh34IuA6DBih/b0akUglqWokqhzFN77JJoUMil3Z3fDwK16Us+nN8x3XyK4MyPK17s
         QFTA==
X-Forwarded-Encrypted: i=1; AKwUvByvIreKztjSSzR8D/ahkMX78ad86mJ23vCkfHU0frQ5ewlbZj7kVG/fUEWTbFwcWfoF8fKTziNgwYwh@vger.kernel.org
X-Gm-Message-State: AFq9FYKqp/0v9sJH45RMbDTdfvxAEHq4kFXIgx0M0QJTuQIwYrMTHwfL
	JAmHL6j83ZBQQf8pZmS369/YRjugw2cOjC399OGx178j9wNDPp6IuuJ99pIW1+UBigj8LjUGawV
	Y0/O4CSrhcIzhkJ5yubbDxTuXW9rhdLaW7nFVt+Go7OIX6zzWlcyXD5Jd1o228K29
X-Gm-Gg: AYBFou1lLsQM1Aw/jdsgPsQgdMXl90HgeK69KqJboZfIH+z67Z1oBvmoJIHdikkbZGQ
	/fXcwuawseEcjIv/6vVxu0um1xdaLWVkOENPLKPHr74IEbRkex+93fvqBFclgX5gDF3S0mYx3VU
	tOWAsSEpyyFqBZLqYK0h2WHn1IX1sJvo4S8gp3tcjC1kepEsb/hhalMzsvpQTZOLQbtypGyN8N3
	pTRWc2ujzsk5nL6FNQxiq0yyB+3dtwvcapKZrauBjKsYUk+/njPr8o9JIJhzqAayoMBI0iStiGh
	1Hg77rU71mw9WrpQXqNcdQxfSQlaKCrGJUzHACawKx7D2DXklexbVmGUXMWQmv14/DN9qk9dM+o
	eeHm0SwAmV2u8wVklXNR27g==
X-Received: by 2002:ac5:ce83:0:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5e91efe58e1mr3499669e0c.0.1791994529316;
        Wed, 14 Oct 2026 09:15:29 -0700 (PDT)
X-Received: by 2002:ac5:ce83:0:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5e91efe58e1mr3499620e0c.0.1791994528218;
        Wed, 14 Oct 2026 09:15:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed95478efsm2437166b.27.2026.10.14.09.15.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 09:15:26 -0700 (PDT)
Message-ID: <2df6ab05-4407-4cd1-855e-ebe07df2d53a@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 18:15:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/11] arm64: dts: qcom: ipq5210: Add ICE support to
 SDHCI
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-6-77bd3d68d850@oss.qualcomm.com>
 <a7f04052-37d1-452c-8755-013e6e16414b@oss.qualcomm.com>
 <as8NHH4j2SBkDYnC@hu-varada-blr.qualcomm.com>
 <35bebc3a-8172-4c55-94a5-18c4047f7090@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <35bebc3a-8172-4c55-94a5-18c4047f7090@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2NCBTYWx0ZWRfX0L0P8gmorNpY
 Mrce0vFcdvzDb0q0NU2GzBUB90IpPS6MoQwNWLN/x0v6ogTpuP/QYpK0mnLnA0si3xe9YCyfRnM
 8OlYlSMju93+tOfOMxbZsCR9YxYFg44=
X-Proofpoint-GUID: 4_FM2P2SUtEzQ0EilwsIwez4Aqbo03RZ
X-Proofpoint-ORIG-GUID: 4_FM2P2SUtEzQ0EilwsIwez4Aqbo03RZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2NCBTYWx0ZWRfX/unmwNjWNx82
 V6lW1O9Gl3MkVyX7ERUOFtYkzPhZ3uDUZ/+TRP4AvHT1wXryQ+qKPComdwESnyyX9YCIj5BAUhi
 Fa+5SBXtLkhhySHBKzWCTx8lBVGGfoxeXZ3x5eWmY+xVXUvf5kc/WGkY3vx6L8qFtaOqkXZeZuZ
 EXEMdtUnjueA5s91B0b/5TbKNC9HON4BcKH4vM9kkk4EoV3LAWmeyCuPqgqHP5gawBn8ydu1dwo
 ZdLNp7cprllKCsm0x/fpTTcul54bBkkZlPEkpfAA/hxUwy5f1fsz66Ct4loFIRoUXHRI9fnqJVE
 NJ5BxNI6dzcnzA0XmOmsWc9atUxjY1UBhFLOYKJ18rg7Ho+AWHP1GWF1OLBmaHqHYXJKvhm9BR6
 LFUZo0BAsS1zDGfDtiYClgJ8AM0eHLYXbKrZxBieezm5Z3IIsTzclEKCVSKWvm8hrCLm7ps9y/3
 Vigp3RAnea5jeP2bucw==
X-Authority-Analysis: v=2.4 cv=JegpPkKV c=1 sm=1 tr=0 ts=6acfaaa2 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hqTCWq6c7NOpW_cclCUA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140064

On 10/14/26 6:10 PM, Kathiravan Thirumoorthy wrote:
> 
> On 10/14/2026 10:33 AM, Varadarajan Narayanan wrote:
>> On Tue, Oct 13, 2026 at 04:43:36PM +0200, Konrad Dybcio wrote:
>>> On 10/12/26 9:23 AM, Varadarajan Narayanan wrote:
>>>> Describe the SDHCI ICE register region and clock, and enable CQE support
>>>> for the IPQ5210 SDHCI controller.
>>>>
>>>> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
>>>> ---

[...]

>> Can you please suggest an example, will follow that.
> 
> Kodiak [1], Monaco [2] has a separate ICE node. For the frequency scaling / OPP support, series is still under review [3].
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/kodiak.dtsi#n1085
> 
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/monaco.dtsi#n4883
> 
> [3] https://lore.kernel.org/linux-arm-msm/as9ksJKk55wYuoOS@hu-arakshit-hyd.qualcomm.com/T/#mf3a36cd811e7933bfa184366aa77b3f335c5a3ad
> 
> Konrad, I hope you are referring the same.

Yes

Konrad
