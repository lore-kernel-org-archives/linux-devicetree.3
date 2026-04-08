Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F887226CF6
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 09:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775639083; cv=none; b=MNUYJ++sRcMcGfx7/jyHnOdr1vFY/TUg8NtlhpyBBQ+uSVm68x4aegP6hzjSNxwp0iH3NlEBNeP7iIXdYUC3RjF8D/MVffMKmHTrkDme8RYpZjaDOYEm4Gn6oekZda/fE/Qv2ZKkGMUWsze9gfkMhjJmfpfsiUpykFp4xqXr0n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775639083; c=relaxed/simple;
	bh=M6u+xr6VE/DbpW4Iixg2PfsnGpetn7BGbGNPST430WU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EdqHCQO0zIeNXQkl3Hj/bE47SJUmqOkey9Y7+JEaXCO9vVBM0INXgjUJFb7bcVDw/wBEtUsvjXCVWwdhmpXKXVIYdPIqTfO/5ecqxy2r0Rf3T57htG3/IVmXY8Nq1+T9PCzFL3JbWQACn/8aaSShfi11ItSUhwuJAbJylEbMuIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VDi6uJYu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kX+0hl7o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VDi6uJYu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kX+0hl7o"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6387Dghn1619682
	for <devicetree@vger.kernel.org>; Wed, 8 Apr 2026 09:04:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CL/X7uzXiaevgQvCOvX0lKJHBduMg+ZaTPP1JggjxpI=; b=VDi6uJYu+DG03dui
	taZIb3G9mMKZCRSYTv4Z1Xac+Z8DkU9lCFmaD6WAeVlkfZdAel0wWSpET+siuavh
	01NBbXG0Z4bkHcBd6GK7zRTKQ8Sf7sdznVb8xmr1pT5gsoE1JKb6u8DDAT3/ndCO
	cigShLlwElpJQdTNnoe4eXlrnrpIDRsN3ekG6WMHc/2xTPzZjHxbM44VxObFm+SX
	w27YGbGSgnqO0j73bsCnTDBsCWD5Rn5dW/HzUWqw+zwTtHWfd50HsX6ebh+XbG+J
	gKYqrki1zGrxLIb5vfvFZzzBUGEg4i3ybLr6JFI4YQQ1hH8KErftGa0Dr3EGDHSP
	yECZKQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddacrhyrs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 09:04:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d8c183c2eso30082911cf.0
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 02:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775639080; x=1776243880; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CL/X7uzXiaevgQvCOvX0lKJHBduMg+ZaTPP1JggjxpI=;
        b=kX+0hl7oDqXnGVmwXPPdw/gzUP4y6PsbxfSgXYGmJe5b2eMJPmsEanjob5IZp33ZAn
         n8kZSGQTJpU8zJU2qdKfd6l089H72YYVMj95/A0s0CnSwULEuqMcOrkXWvZx7yLD3doj
         fLi+7AUGAaaycyCslSvPSv/XeKjT3aabLjiv9tQ6/FHVc6knnpgiy/0HSxUblDcjxHJ2
         /D+Vx9JJTqlXaHFgAAE7YWDLFW9DLbB8jVNn3RWl6zP9vz11PEAN/e4JlNosuLcgBQQk
         X1phKyxzqfpMta7Le718vd9Dfz7Hdbnf2CjpkE21EoRSWi26COcLVmOCpwU3tTHgauct
         qXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775639080; x=1776243880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CL/X7uzXiaevgQvCOvX0lKJHBduMg+ZaTPP1JggjxpI=;
        b=Sh2A2H/lbKOW7pcOyfK+tL7GAKAd0addouEBlNCeSdCUWYtqX3TAsjTQ5aH/eMj2RR
         z4/dOZ30qFcqEN+BibEJOc5x8DHRk6HK+ReJ3GpVgMiDbs2BSo2q2gbA5EuL2wj2Lrie
         49CgLOJ9Vkx2C+dBJFq9IrhIQrq0oEzVLDJmk70YQDOxuF9KsGEfuxknQdmAwfXEU+PL
         qaezGDJGeOqwpn5mpngCi8YpoNc41f1uK57XzczLzZtCtoBHUwbNC3cmdu1jbbA/MF7L
         xJ7wv0HRup8SpWtB5RDOOTMB8ShxEopqqO1TivoxG8eb+KFhfSCMEzlQkStAp+yi21/b
         EKbw==
X-Forwarded-Encrypted: i=1; AJvYcCVTg7kfPL3VVazDf5eC7uRhDHpsXKgU/rHTb1mRdN/FoBDMmD709J7vz4mYbzdOazd+LAxUlTBBy2q4@vger.kernel.org
X-Gm-Message-State: AOJu0YytBHXkkhJwvm30T1rAgUodE+Kxuc3VC+4htaS06VAi6wrStwF2
	N7YYxtLU0s05t87XUtXiev5/VBA06RJEDZBoEPRHsO59V6cRz7sxGiHX+rejAfxTB7xhVAE5Qwu
	oOsmsJIwDCKi6V/WEzGeeL0CR+vl+sz2I4PcrejhSbe3TBvA8ejQw40b4MeTuYcIO
X-Gm-Gg: AeBDietAUikX2Y+/idSYRdlzwbCwkW/8WU7Y/xi8d760OAiMvIzEkm+6Dqtyh2iAl2L
	WqPYCzsJCk2BgCbIJRZBJlMrFgzi6c6dSu0lpjT7HO8Jjbnczr192RIFlmzDad8BqRezluhw5DO
	Y1f+F4SrI7XDdhE0nJTV+DMjYZ8aJ7svb8TxvnDJuziqY38TI6dH5LMdAKkdJkVw1V8pz6aXgbF
	GbmjkVJ1tTzHmQqTR583P/r+nGM+LFTKjd5Q6jwnfrKxWC7oPGND9O7Y3zYjC9gICkTb/ilIVmS
	smcgA/RrWlOq78UhaPR6TZRC8l0FBVlPtIapNHtbSFWctr4a9nWjEFtdnkUGloDuQFQfjM+k8kj
	2fjTP4hnZLWgorUTrda1eVoZDWJgjRG7LpR/4AmiACnPuGOcXFp9K5aDQikWSzMy3AhH/KCWeZz
	Nizls=
X-Received: by 2002:a05:622a:480c:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50d62c49d79mr217663851cf.4.1775639080022;
        Wed, 08 Apr 2026 02:04:40 -0700 (PDT)
X-Received: by 2002:a05:622a:480c:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50d62c49d79mr217663631cf.4.1775639079628;
        Wed, 08 Apr 2026 02:04:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e033a787fsm4910134a12.14.2026.04.08.02.04.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:04:38 -0700 (PDT)
Message-ID: <b788def6-a227-4807-ad3c-46515e83575e@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 11:04:35 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] arm64: dts: qcom: kodiak: Mark secondary USB
 controller as wakeup source
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Judy Hsiao <judyhsiao@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
 <20260407-dragon-q6a-feat-fixes-v1-8-14aca49dde3d@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-dragon-q6a-feat-fixes-v1-8-14aca49dde3d@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vrFDxg4hEWvESKqpFxbkePpokdreYOsD
X-Proofpoint-GUID: vrFDxg4hEWvESKqpFxbkePpokdreYOsD
X-Authority-Analysis: v=2.4 cv=WZs8rUhX c=1 sm=1 tr=0 ts=69d61a28 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=TkYFqX6U-2Zjo2NPXsUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4MSBTYWx0ZWRfX4kj5NEa6TZmq
 xiyUjuKBwehDVvUe7Fn7NRGC3aWcC8YsJS9GKkCVUTZItXSpHy7dHJjlqC+a0SOADTv0UQhG5um
 zoRkjUe8YLHoCR540tML9A9cdIaVE0k3H0ihv8DzMLMgCd9QSLuqzdntDwpeuQMuOLjzVhgDs1Y
 IhivFNbFHXorD/tUNGO/g/TeNR+1dFFKBsWu5YEN/OtFZWBzlwUsY7Uzxy5Xcpn7FasocZy5/T/
 g6AmMorUt6rC0fvhgLwOsrj64wMnuxegzL68ATKMzBwWSwqLYi/OV+34ydYJBaZir12Z1UtvjYf
 OyV4wYPdYR9lqZ5gTLDVb3FKT21o2bpNrwJKjpAwJ/NPU20AG1CDVidRuL2U7VbCQxNU+EwhC1J
 dFf4Q76soNSNwPdBuT7bpt/jWyv+dl46HBFH5Al+txb25bMq0/DD9gHtEqbtg1iE46d24Z6HnXh
 xt1zvj9TuI+sAkVMtmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080081

On 4/7/26 5:20 PM, Xilin Wu wrote:
> From: Stephen Chen <stephen@radxa.com>
> 
> Mark the secondary USB controller (usb_2) as a wakeup source so that it
> can be used to wake the system from suspend.
> 
> Signed-off-by: Stephen Chen <stephen@radxa.com>
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
