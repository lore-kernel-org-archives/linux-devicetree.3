Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA15A3A9002
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774270562; cv=none; b=QtkNuKbDOQnQ84/96LQ62L7xF0RBxbHO5jlEDs4Hr+KTgy4ZY6Y+hQTkV6Chiypz+PBpF53Oq4lv7M3sU81gi/MnYeOdUELkCwryx8afAlpt027/ml0h206YB5qUgxrfPsiAKwjNVzNz9WOnCoyWIjCOaQJZCcMKON2u6nnudvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774270562; c=relaxed/simple;
	bh=XZmcl7C7XtUYL8BqnUMMdt6SmMs7aEtVdCXcv6D9UrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SHiimAHn8VQq4615FpBgBi81rapiNJHotRoonz9h4ioljPwGpH60q8q2TMbzeXGHUzAo1Rw/lc8l4zrH6R72w0LR6dF7jUZofyTbRkBl+Y7NCSsMaGiskhC7E2mq1Fw0q6YFN4iMf1/nRBXiijkMtkebbggsw273xNj0H/f0uKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PZmiaQgo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KG+vIgp/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PZmiaQgo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KG+vIgp/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7td1D1627218
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YK93z+qtexojF/sQzMohye/zyPAnplv9XAS1tCBDwZI=; b=PZmiaQgoaSE7SkXu
	vTWJmTkZlKVJh4LYVgQiJSMru93qVYmeV0PUyuT6gRF+i4fyC979kY5DFaVFOZwc
	1sBssrMYb7f4okCQ/elCoyV8afpROpzg5eL7/wvZTF7BZEEeMjSbIEXOZ7WRTbSr
	UuCFShAOC/cIQlI/3OURIxgWldXN/jMPOl6u0mQnEjtilfi+y8L8Upj25KxGY2nB
	VxfhE35+UShrjlD8WQDwcABEslS4pdpA2hFKAzHkW+dWNoVt1thcov54UcGI485a
	FyGeaeeSyCSgkDD/7N0YOQR96YiE9sexxdoSDDUHrxoG3Q+TAArGComu4UmUw0aV
	QkZpMg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc10yq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:56:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50947db2e97so37475111cf.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 05:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774270559; x=1774875359; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YK93z+qtexojF/sQzMohye/zyPAnplv9XAS1tCBDwZI=;
        b=KG+vIgp/4ZkogLtj72glW1xs7Z63Ccxo5Wh/o3AEc/L4CNMwR3j3A5sV59co/OZTk9
         SFuwdpQLpsalasfG2GBmE2zofgRVEyyPszyrQmjNqlHDsExyRWmKa2JFAdSbX7ulvBoq
         v5uz+kZruf6SjspwoCd1sg2fEgL4zzMjfH+UoO0XGLFYjfzc0L1pXifpTJRSJnackqj4
         qDziGp6/aw4mRYx1WeoxfPbEXcMccSjkv31UyAGmQSdPttKGFxBCBdlXoyTK66TLl6NI
         I5o7kOD7pOp2DH3EuVvNnNqTKSU9lrOQ2XYq0eGe7XVx1CG9uMug/TfcfvnL1Gyd5Wjq
         9LCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774270559; x=1774875359;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YK93z+qtexojF/sQzMohye/zyPAnplv9XAS1tCBDwZI=;
        b=iAqFy+p2x5TigUkpZtgZGd6jrxbceTFMp22Ddul0aLCQ8UEH5S69hXw1aGydXG2NhG
         4apoyUZfrruq06zNyypr3SkVtXDMz9NQRrNO8QuJ+j28XD9wVHWzZc9XFp1QCmi1qTdn
         ekQ5RhGnkiBGn6hMeSv8P1hmAHMUs5+1FcekJbd4/HqP9t9NafTwl3LZq5QYiOVpjGwr
         3e4gbw77IcaH38tdaLNaAQ0tXfmvBUAgHQG+bZoDUes6kTGRKP55+FC6W9eDUsGD6yJu
         pcjqUNx0ZVMjGO0tz9V6ELqiKLz3wnYyl36R1YMqQ2G5Vnn6rDApqe2X2MZyN42lBIaE
         kLRw==
X-Forwarded-Encrypted: i=1; AJvYcCUwNyRtSPMd8PtJIy9tfLZxM57CwiZfNiDSnVcjyYloW2+yipIjD13olf5TcyWR6CuQvXbFDOE/7Fgd@vger.kernel.org
X-Gm-Message-State: AOJu0YyZxyajrw8Tcb9XbWNmV4mFaPolWxpWuFJqKYLm73BotrD0P70j
	TyhvurcgWeMGMVooqwAuCzRJuyRAjmizNaDdgB5jQfWizMAOBeMevUIJxHboaOnF5qE+1RQMKPe
	EZKMVisdBDlvXJAfT9Wwbb0Tcxv64G41pxI5Rat5W54CT1UI7e3cnAPYEZA6D4evdsXpcse7T
X-Gm-Gg: ATEYQzy4bnOc9qi+lhQx37EvC1Tbr7GgLow0iyLq7vyKrym0x8MisCyIhCb5xEWYM7R
	UkrTuJL9a3h2eW9FBUtflR92T0ebe2FeVrBZM0Hgeju/KNNHbHZ3DfaZYA36fWc/d4KF2s086eM
	fAw3SlpezWIxKqg0g+pGrsxdZ6VApmiZ5l6h23lsFWKzKYp5SPAtoq0C3WAJC3o9qqAKNsO/tyW
	7U/4kq/XyeO+Daof+65hlNi8bMEWx9fatfCwer+5AdndID8CmjAUxybW4625lHlUWr3DFUMXnBD
	gXjhSv2Jz+CB90RYNH4kcusxy2zg6xVrziD4YLqSyD0k6m1CdlrSLwU2igsZAPf5VzxGmWtIuFI
	62gNA+dY8gcO3YUJpfo12l0pSabPG5trgZgriVYIELZ/lA8eMTb4EK34s957TuaoofwD8L+vRV/
	mr+2w=
X-Received: by 2002:a05:622a:188e:b0:509:38b0:c44b with SMTP id d75a77b69052e-50b37564ed4mr144788721cf.5.1774270559231;
        Mon, 23 Mar 2026 05:55:59 -0700 (PDT)
X-Received: by 2002:a05:622a:188e:b0:509:38b0:c44b with SMTP id d75a77b69052e-50b37564ed4mr144788361cf.5.1774270558773;
        Mon, 23 Mar 2026 05:55:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668cd050c4esm3679893a12.0.2026.03.23.05.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 05:55:57 -0700 (PDT)
Message-ID: <0794b29b-b999-47b8-a563-b29fa33a54f2@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 13:55:53 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: purwa-iot-evk: Enable UFS
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, nitin.rawat@oss.qualcomm.com
References: <20260323-purwa-ufs-v2-1-58fb2c168786@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-purwa-ufs-v2-1-58fb2c168786@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c13860 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aHjQBcVEZvKKP3e68BUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: B0jUQIpJ0xUaZcT52539Ec0ZhgTcuhmN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMCBTYWx0ZWRfX6yzUJldzKORU
 t2FYGYzk5LU9rLFCvq/Iq8TEX2qbBYiaGZC4vh+wcriqWzuG2DkakI5BrJANoavg6V7+OQBPLNW
 8dHkwTlOOe1VdIh0iSnYzgIeLamjfDf6zLgHpLLIhjUDtdj6h6IG/eppnndI8AiFgBjhwTbbKBZ
 pkwK5SX2wZhg0d+w9W+dGpzqpLEAtoZQHujJuzL99Sjb8dzMisa+bodMPxbKZ4doaMolkOQekec
 wl4vRDQMh4I1O0AjqK2JDIBkOSbY3d2gCx8CE5TkaaZIfG2bpq0aZDUzqTpmAVz5ibwFopzTaoJ
 H0oDw+BnOvbNFtaxek7zJkj121/3YrZKM1H+UK5E4Nm1u6uZdcA8UjTrVWPjZy0QIUIQtujj3WU
 1X+R/8gGyEmrdHayEwvB1C3I+ONXeTRVkv4HQDCgxgUlzqJbItZiM03qo8fs5THNvbBj4QaEMek
 /TMtTGUhG+atpN8igaQ==
X-Proofpoint-ORIG-GUID: B0jUQIpJ0xUaZcT52539Ec0ZhgTcuhmN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230100

On 3/23/26 1:47 PM, Pradeep P V K wrote:
> Enable UFS for purwa-iot-evk board.
> 
> This patch depends on [PATCH V5 2/3] arm64: dts: qcom: hamoa: Add UFS
> nodes for x1e80100 SoC
> https://lore.kernel.org/all/20260211132926.3716716-3-pradeep.pragallapati@oss.qualcomm.com/

This information should live below the --- line (in the ""cover letter""
for this single-patch case), as we don't really care about that once it
hits the git history

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
