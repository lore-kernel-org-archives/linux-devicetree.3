Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6932403AF8
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 10:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787911550; cv=none; b=fG28NnXq3hRMAO5r6I9FWy7jIKBObzGAxJ8fDJQxOxOE4fgQXZa29tdb3vmJYU2W5QRpHvpiH+bAO/TFYpm+WMijCgALHVl+mV1jJ942Vf44zFV9bRN3kHQYmBkJfFwJpLCshq06VIzwWsEgFv/BSPWU6o9+eyTY5Eg35odUzeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787911550; c=relaxed/simple;
	bh=chbugp9BbdjYfMFORTUe3BmGD+r/f6qkAKRa0fMGPDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XwQWc1x7HmUe1684dsnDZS6qd5COYj03UjTBte0Mdidf1co84S7VJYVpyQ4yDrQyW4441LrS+GDAgMHaVZXdMsh0967GMOsvgtBrpCgRwBBqdWD2XTHNMLP8WVwidTxXC1ZeV+Bq9VbusyTJoniu6Spg6o3qQY+12bpd6dO4knY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=of57f2HI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TE4kE6P2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="of57f2HI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TE4kE6P2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S98NjI2592629
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 10:05:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gVOYC82fg9l28N1uNBDOjP8bWaYLW8uYJ9iMd/8YFdU=; b=of57f2HINh60/VBL
	tPHwrRpmEjeJlkbgDo9ZRCcQ4DccLWpY+HyE5Lyr13ChZKmUlhQMz+4PxrR9QcAS
	5z2MrLwbtRlHTQjlT4VIjySIKRnpNGLnxxtMqv3+RsUZ5VLYGbY1mu6u0PRw66Jj
	TLudpj3bB43AWFOuWRnTTCIKtwdRP1swmOcOEuiqcDh1/Lye8i/8nATM8QYZ/C1Q
	FuJv8ZPM72+uhWdQqzXJ/GGruWc5PubLNyluaOjNOd0/YdS/AKyTxF1/D3aGE+m0
	gIPfks3jK8fxUiUgbgb3bHZ4eXY/xEaRLAgMv8zuUt5AdWljQ3t7Rz13z6bPbcQM
	BiaPyw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb7eh06tu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 10:05:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfd1772d8so1819231cf.1
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 03:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787911548; x=1788516348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gVOYC82fg9l28N1uNBDOjP8bWaYLW8uYJ9iMd/8YFdU=;
        b=TE4kE6P25AUimivHoDPJkplDRisBFAMQLdpQ0ME38iL2Tez/7IYbpdCIjxAsN6Hjsj
         OwuFmG1xcnckatErXirGUUFzCrEC2fiWGWDpbF+0oNmDeCW5DFhtgBp4swCGsrJ/cJ1O
         mh79Fi335wqKcCciAd/HRgtA6XixnA6jpLVYYnES0b/JmYRRw/GI0P+8NllhsYdFfxqK
         w7dHzzzrWnnOCac5j+S7IpIQliYGE5AvZqP/ovJtiE56YgS3c+7evYEEnBTYtYAp88hQ
         RWCIedLjXoZkO8kCpNWjmn6u9+Km1mPcV5zKKA65GaZLCrlDjlO/8j/tw/AyOrJaaxgH
         AWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787911548; x=1788516348;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gVOYC82fg9l28N1uNBDOjP8bWaYLW8uYJ9iMd/8YFdU=;
        b=SyZtU/C8KIWpjWPFBT4iTY+bcuXgbgYCG4f6X8rVQSei3vHUnNond8nl0k+mlC/1iu
         gnVXh+g3q8xvOjd+SKN02D318y4+NEhVVL6JMlivQSbgg4bFG09OkVF9CUR/1YHmZ3/A
         H4OLk80rzjNul0Of1h1qN1hciO22NRrvwpK/KgZe92vzqz0lUNgp+ZfDg3+55egXfHi2
         k3NKbQCWewRh7FptKt0hR42Oj94K+grJcTpzoAL52SUj6mMFJygnjmjcPh6IZy456sh5
         xyH8eVgTExFtUwL4EJIRyL/KbBRb3LB/Vwe+KktN7dN6e2Uk4mJlNvdC/Td0jM2iO5Ee
         I7ng==
X-Forwarded-Encrypted: i=1; AHgh+Ro1AAsvvLrARDPWD2FawTWeF44GEzm6poT8Tlw5JhOT1Vtn6wMJxsJgAf5tShH3xTt1Obm1IONf2skQ@vger.kernel.org
X-Gm-Message-State: AFuF++mFeAkKQHXb9NqJ8lbuqfZqEMPoo5bN11VO83SufRzS9SjyQFYA
	BOFF5wug0XP8+LAw1/U6UfK7cQIIKsgcR5nFrrxx63DVxJ9YCGWxbYXEEpAmY1GLsO5DjPiQtJ/
	sgDhieg8uIq/RQZzTZHuADeqU0OrlKFI2vaOr0qWNHbyh4Lpln0TQmyUkPbw7j4o5
X-Gm-Gg: AR+sD11QM9GCpE7L0Pdh0a7mWeedIFH/sMZqQRFkXnOVgemdfswwTzP+YgJWIKXvK9s
	Mw+OUubCICvnAkJ66dJeE8Gvnl9BBiya1MhTSPA7rhssiomldXzoNAQrZwar4FQsvvqymJaalVK
	I3V9EEb7RKguombo3nEJSjhhTNFyPwsuAn8PN97tiMapnO1lZL5RnMLkEqq9oXalBuvAgzyqmxd
	NlWlGFCTfEnIees5Veynh3nye9C7ock7DatCiZ3hvITpmO6iWzKBrYLkRNvLLJDi+8qs/GyyR4y
	q5jnhnq+xgNOkq2qXKVJ2QZJKawWzELWgWaEVqw4vVF7zri7oAaLUzwrzntw6z8G4ep86gfD+dW
	Il3b1Md4yb8VNvW2b1/qdz6Q=
X-Received: by 2002:ac8:5e08:0:b0:51a:8079:795e with SMTP id d75a77b69052e-52fb9659843mr39871771cf.4.1787911547778;
        Fri, 28 Aug 2026 03:05:47 -0700 (PDT)
X-Received: by 2002:ac8:5e08:0:b0:51a:8079:795e with SMTP id d75a77b69052e-52fb9659843mr39871071cf.4.1787911547200;
        Fri, 28 Aug 2026 03:05:47 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611b5c3f7sm403382a12.6.2026.08.28.03.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 03:05:45 -0700 (PDT)
Message-ID: <60faed5e-8a19-4eea-8272-145aca3db2d9@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 12:05:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: fix fuel gauge
 compatible
To: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Caleb Connolly <caleb@connolly.tech>,
        Frederic Laing <dev@fredfunk.tech>
References: <20260826233818.124278-1-rinat.muhamedgaliev@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260826233818.124278-1-rinat.muhamedgaliev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rcvhnuhLikzktXQyEMMjO1ZgJVqkOq8n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA4NiBTYWx0ZWRfX7cjLnOVEFwUw
 Qb/VtUj2uvl3j4Hdczq4EBbMVjYtmk3ogTOtBzuzPT0XswGsCXs7nlMoEIwV2FXD5bKnSHFtqXU
 p+T4Vkg9VBL6iN1nZtYfyRuh6t30emgwjNJ2QwR4kI087u5YofJcgTL5WXLBIrujwBesyCejlmQ
 jxZ58MyDc0kB0lIM0iuhuHHm+An6QgLK3Y9tAjObm3ykHRj2Jx/0Kct868vSjTEtm8qXVeZTdeq
 LzXLDgKZPeEEiXmrwExW3xED/XouMDywymor6Qb3iqBvXT7cBEDTeWSz5a9zWfQSzSmH2Pk619T
 9+9ARChTQGjolhHW/lJo7P5F5SLUo351zgYKNMjRgP9ilG+bxmNN2OOUU2ZLzUeCX4T90pexV/3
 yPrllWaKTQ3cK0kbj+JOCKark8uNK8HzRz/hTjQMlmPZnWVDUfZiq6j2UAR/erq/pQIiP3V0k07
 uoKomxPdcpxOGPmv+Sg==
X-Proofpoint-ORIG-GUID: rcvhnuhLikzktXQyEMMjO1ZgJVqkOq8n
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA4NiBTYWx0ZWRfX14LhcC8WqvP7
 4OPZ2TuF9eW1flPCccdc5Ewc5+znpGCZ6iW5qRt1Gsl2JX5Euoyvu/58zfdDKfEqgWLZn4xIcI7
 m/Moq40X+I38ESeH0zDyf3dke0H/20U=
X-Authority-Analysis: v=2.4 cv=RoP16imK c=1 sm=1 tr=0 ts=6a915d7c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=p0WdMEafAAAA:8 a=G7tyanHNxTnsMBuu9n8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280086

On 8/27/26 1:38 AM, Rinat Muhamedgaliev wrote:
> The fuel gauge at I2C address 0x55 on OnePlus 6T (fajita) reports
> DeviceType 0x0541, identifying it as a TI bq27541 rather than bq27411.
> 
> Binding it as bq27411 selects the wrong register map and produces
> invalid voltage, state-of-charge, and temperature readings. Use the
> bq27541 compatible and rename the shared label along with its fajita
> and enchilada consumers.
> 
> Tested on OnePlus 6T (fajita): queried DeviceType directly over I2C,
> built the DTB, booted it once with fastboot boot, then installed a
> locally built postmarketOS kernel package. Before the change, readings
> included about 65 V, over 10000% SOC, and -273.1 C. Afterward, the
> bq27xxx driver bound as ti,bq27541 and reported 3.835 V, 42% SOC, and
> 33.3 C.
> 
> Fixes: 12dfb002ca01 ("arm64: dts: qcom: sdm845-oneplus-*: add fuel gauge")
> Closes: https://gitlab.com/sdm845-mainline/linux/-/issues/36
> Link: https://gitlab.com/sdm845-mainline/linux/-/merge_requests/148

If I'm reading that thread right, this IC is on the battery itself (?)
and it seems to differ across different units / suppliers, would that
be a good interpretation?

Konrad
