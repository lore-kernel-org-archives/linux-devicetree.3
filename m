Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDFE3AF66D
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 08:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780907345; cv=none; b=bOEXDCOpjDwGTxXWFrEz1YfmJ4nudQLYOXSVWdiFM7elf+JaOP/Ds/dvNOhzmXw6dafCvCCT4R+mGq1HdP6/LRZCSBX71i7Zh7O1N3XcWPbja9g8Eh4csuGs08h1w3hXx41+SucI4WNDzDz+M5zOAnM6cFUxT0D1H3kluTFNerg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780907345; c=relaxed/simple;
	bh=nVHrZcHAyNhal2nEdl1wjK4UhN91S0YpmsgQ+Et2tzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QL183rxDQ3h1Vw9sDIegT/1JVfYfgf4ngxIQTQcW0lRWWXLtL04gJQsPyXfipj4c63MWxEBHCNVSG9WHlyM4U4MJ4+k1Rr9cuIn/pYtNsBwx3Grb3gmrp3/B3HFYOdY1WVZ09E/h1fFicE8fhwMIosQvIK7LQj7X6NMzTzFLlgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JbkQ/MMm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VSj6p1m1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JbkQ/MMm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VSj6p1m1"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Qrxb2771589
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 08:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nVHrZcHAyNhal2nEdl1wjK4UhN91S0YpmsgQ+Et2tzU=; b=JbkQ/MMmUTcM7MwF
	NK4abuDYYabD058wOwhyB3ZZ8ZTM2+FBtWPZD/4hjlYWgO1FUdxqJZ3uVUuxaZZb
	UbiVwAynVW9TxrKAVXqh6HleynTYmDAEw/Fy25gUn3OKtlTjLlhZEXbvjMeKrdlS
	d63PQ0Swd9GmVBcmcFJ2OL1mO5J5GOzJinOhTmK8/sqrcggWIH7kx4tng1Kf3pAD
	X31elUlmle1CSKDGaxLLv6/vdD4U0DiX3ARTegHvj5zABzzZlYGyUAfxt2xh7rvz
	spNweB4pvZr503yWF0J6Drd28ft5o+SVIN/LjB+zYQoWnjKFaBHF89Pj2hzfunxV
	4nhIKA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx6eqgt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 08:29:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51768e1d798so10351481cf.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 01:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780907342; x=1781512142; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nVHrZcHAyNhal2nEdl1wjK4UhN91S0YpmsgQ+Et2tzU=;
        b=VSj6p1m1+/J9ItHTkA5fEUjb4jHXy5DQrM9zlmK8D4DI2SDqvUQfGTKUkBzf0FnH5M
         +RvTNmYdIpa3pQUD+uSMdB1nyxX5I4yIAu0RHVPEwiCrgejLs1G6mMXHkxzk00zElc4h
         uLNT9z6YmB9+FEezB3+1M2ONUwodXOaS8v1NM2WO394z+/xY/fLO0nztWRLyV1OOWX83
         cYO3n5vin7tNkj+c6F9WngJMUCOg+nmGU0QInFkuC0UbnpiklMG88IcLcWJd4Bd44p4v
         GvygNHImz8KgrytflfVq080fQj86rBeAY8i367bkRlU/QWVeCI3P5ur9QDF5FKWJqYQy
         fzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780907342; x=1781512142;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nVHrZcHAyNhal2nEdl1wjK4UhN91S0YpmsgQ+Et2tzU=;
        b=q3RIFB60GCZOJOaHnUwo059lPRfbpAUYFr08ue05ZWq+bN39OVdlTU7yCQ/x0NKy7q
         3ULQmZr9yPD6FKRoY90NipTYXa7QOs0nFH3vWwrThidihA9HYf2opmLQDZQDRk6XYnYd
         RgVVnhSs/RwHlFy4o37BZYygK86QLhDEpEN4ufABnGtZ0C1YvIJHiUIvsJdiKtk/87UK
         xzX7V/Rka2CYIyF6DZPvGRsV46ysYitesvRdmDzsBJQN7Ei9H/7k09UaLmuU0jzZIuOG
         HssiPNF2XUa5NCMWIoSUcKq8omMOuDtz7nCWbnlxXVYDO3De7ypEBoFaDSMhcAfC0KWe
         FQ3w==
X-Forwarded-Encrypted: i=1; AFNElJ9/qQrzbTK417w+06ldTnL2qdJNWgmDTH4hnthUqDa+YGtXHyJ/G8NE4AJXQ7KReAeOQ4thtoKHWpx2@vger.kernel.org
X-Gm-Message-State: AOJu0YxkCWR6tHCG+7E47dmRQV2X/68B1ibKksjebWTX6jZPk2eV3Aph
	cr37AA1C5C7Sk643mMnKF9jD/TjJ1q/RpZV13FIHV0p7zEENnBcq9OPXW0hNZnYLu1EKMSFq44f
	CiGi+zUSZl7Zu3UVlMGX/4daQhZsmHXBmpzfZ5S33V19NQsCgynRxp+bSTLnhuQS4
X-Gm-Gg: Acq92OH8MO4sNHJcqk6UkCZyXZruiyvBZf7zhWoSVWrqrmbU+RXCMBNekzt9YZX8R9N
	w7Wkt9QvSZojziYz3ecEXb2p3IMzQj9pBpd7VV48s8pfGVXyla+4/T5QEQjKHQxQ3tTc8baT5hD
	2bQPykAzooaUzQ5h6fbw2jRZcBBRc7HbfaQeyuHGdUs2fs4GLiJ5ZSKeAefbu3CsgclIJKFJfvb
	wilelmah8cO0Djcelj4IxphG2VxeQzi9SasPgMbVUunOZTN+6f311t81Cq4xzGWV+fLcIqn5zGH
	bL23Uug24RqmvpQrU3zrEY3iLYdeBy4Y2tvhnyqfkACTv7danypmGOR0Cc8VEjV7pUof5tCB9Hw
	YgOEU8ZJmpGLD8sqFpgheiAQj+xDd2x/5CNvBxjdelsd3h8hJ57Vp48o+
X-Received: by 2002:a05:620a:1a18:b0:90d:11b2:80f3 with SMTP id af79cd13be357-915a9e00484mr1429224685a.7.1780907342576;
        Mon, 08 Jun 2026 01:29:02 -0700 (PDT)
X-Received: by 2002:a05:620a:1a18:b0:90d:11b2:80f3 with SMTP id af79cd13be357-915a9e00484mr1429222885a.7.1780907342126;
        Mon, 08 Jun 2026 01:29:02 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307ce3sm822366766b.43.2026.06.08.01.28.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 01:29:01 -0700 (PDT)
Message-ID: <4f0461e8-e277-4a6e-8c89-50bf04bf23dc@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 10:28:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Old patch version was applied accidently
To: Yedaya Katsman <yedaya.ka@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <CAHuF_ZpTvYmARzx2_be1foM6XUVCdE0bNmb+YcHkH7tFhrYF8w@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAHuF_ZpTvYmARzx2_be1foM6XUVCdE0bNmb+YcHkH7tFhrYF8w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a267d4f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=WZn9R-PGD3BZfLL3dosA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA3OCBTYWx0ZWRfX66VoiWf/v783
 9AvPqxx0hPu0gbde53Q2gpVMEq07sEaCD3KO7FErmDbvJF6NRJpnsv90UY1iksrcdWqKa/snLxF
 WR7maW+ehyfv46+JrfaD3WUFWi/qbnSLbpG2ebqHEYBpohFFYmX/eEl82Tv8fUmsH9TlzmJwbYd
 jeaIJ3MhrI3Sr820lbccy8ZST6Rp7AOZ2Hgj9VUqX4ntd3m7NRXQ0ysk+IkClE2XT3zcv0J57SQ
 qFhtgdW4r7+KSrJHwChvV+Dmn+fBfibP5DPZmcnyQHXyv4TkShH0maf+6ptXDRUpGwSbIpSW42k
 hn09jaQqWM0SH/6lHfpo1E40N+EenvYMCSn+f4Q+KNt8mI/bTsVexUAYx7a1u5sLe5+FSXfaoXV
 /UhK6xb6Bv7EQnZaDq+ZmfyiHhNA+cV2vQd/MRWirjWEchLBMKNBQDbEY7P/hFMA33kxly9nwBL
 Gr/i75JktlX65lW7dOA==
X-Proofpoint-GUID: IdJC5JuVjBNFeUy6IvYmHUDjG7nNzTP8
X-Proofpoint-ORIG-GUID: IdJC5JuVjBNFeUy6IvYmHUDjG7nNzTP8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080078

On 6/4/26 6:04 PM, Yedaya Katsman wrote:
> Hello, an old version of a patch I sent was applied, presumably since the patch
> series title changed between versions (learned for next time).
> Can the newest version be picked up?
> The patch that was picked up:
> https://lore.kernel.org/all/20260314-panel-patches-v4-3-1ecbb2c0c3c8@gmail.com/
> The up to date patch:
> https://lore.kernel.org/all/20260320-panel-patches-v7-3-3eaefc4b3878@gmail.com/
> The difference is only in the name of the compatible (O to zero), and
> the updated
> compatible in the driver is already applied in next.
> I don't want a release to come out with a wrong compatible.

Please send a fix-up

Konrad
