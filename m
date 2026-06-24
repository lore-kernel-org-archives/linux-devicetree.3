Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D5230DEB8
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 11:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782302286; cv=none; b=a2T8/9jbuTSyoUVpWOYT0ap+R2cVRUbIIpPkoy+MJgzui4vjtg363zJSkYprV6CjzLpWaf1pqyM1Hd1ihw3rSikTgrUlNhWwNBjhtgEAxK3ah2aVjCiHtHnn1iVRWu8yoqQEL0u8iul2SD6e7AnPYQ+uDojJvoP+5q/FKnABCoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782302286; c=relaxed/simple;
	bh=bEfOfabZA+/qtQxV7AKZPy05UnFJONr702kxAbMxXOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NZvogNBf+qgQ46MgiUAK/NuypHqMHrkWgIHEQaOUS4OL+OVv7jZVT0FX6H0kU7/s+Yq2eJb74xP9psQrVZiA8cDEKTx1TNfunO8PegurGXz7wXpwviBB27XKHhFeRSwV8eUJRO921UxifkFKPBy/Ius/gRmlvl+WY9J+GFmgOtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QKC0rigO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cu+jLiuy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QKC0rigO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cu+jLiuy"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANVHn2582982
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 11:58:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ntsbvnXSjYdc95EwUdqEAAUmAKUq+3DroKE3kMSA6tU=; b=QKC0rigOFCItiJmA
	fVErRFoANKSkqDloe4YwzO48YCcnOhODyz9jPaDOj7ZfYFlVDpkfJHKDglMwhHap
	Go02khzu5QEQZHeDpMRKDUA+FDC4qEoa15mtHlsH9XL/n5WKcyjyYcSz1D6q1nhj
	0CeDzKS+SUhfH5eS01dEVf2i+KdDa9aolbC/OQyZs4MhCTbR32DaOmTpyOV7+Db5
	SGm9YLO2VU5k1oF+rLW3DlSxo8Fa1M4IB+qkUrJ3ZDWzP6dObLN7gJsoUAoNeFq7
	uaXJ0FkVHpqctqZd5yE077UDBP9edga9xZcGggLMu1D7ZWCbGo+rcgtvhOQ/vdww
	iPI79w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f00evaxnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 11:58:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517647fbff1so2744901cf.2
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 04:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782302282; x=1782907082; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ntsbvnXSjYdc95EwUdqEAAUmAKUq+3DroKE3kMSA6tU=;
        b=cu+jLiuyOPEanJr0fHbCw/K0YRmCscwrcmeQASh3OZStpI/r1Lnf1dn/wVXQg1nXPb
         xA+zw+GgX5JdOzfwX6+w7bQsMUZ61Q4wOiGhF/gIK3AEnwnxG9KR/kpFOSw1XVybS7bz
         xP1kWDvA+EWhW36LlLidVZ1j83OLTjid0d/NXr8WzJf7w8OEUw+i+5vaDRgTRB/jHmcK
         Zu2qfsm0MMGM6Z1Kg3cSLxBFduenZ8kHzFDoiN7UyYrAJTA4Ecoo2y9wK5fP4WIPqVA3
         P8Nmt3tSS4Nx7W1TL6kT7GMPbVmQiH/D5vnRd7KnpdeAuXS/f2zJaLWsb+IOY5MPSAui
         TFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782302282; x=1782907082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ntsbvnXSjYdc95EwUdqEAAUmAKUq+3DroKE3kMSA6tU=;
        b=XiTOcRaT7yNlPMN+hLccdtLZQPU4ABuI10J2pGqKckvMLMEqaQ6puaZATM8Rk8B04w
         AJRUvnj0PfsEvJd2UFA+VWbQnT5mXv397uhgYp1APDwWeOafAg4s8zUYg2K7DWoNZiU9
         FEUyOg4g9uiDcP73YTGWzULnfV0pDxkrdpT1KF5o2SeakOA0UZEBKoZsIoSpEJi40s+2
         tiyFNJG90U8StzkAWaQ2Syd4J5Rk0iNMdCNUWY85MJ8IGcBje2EhrFqY8YlfMTtqXnyZ
         aQDpDaPuxwF/twtRux4QtiD90nszrNTKkZRVdNzARu3NvwaG+wwf7+0V60VIqbW2b6je
         sU6w==
X-Forwarded-Encrypted: i=1; AFNElJ/j1W6QRinpUDXMW0G8rKYZ3WCCyuFSlkT7ACC2h/fonOertZHqUHtBXWjEZ7h2gGLUSuyKbhROt5tI@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Jw/YJnPk3KAAiHehH1TBcEaLQRfV44XXHtjjNSOx4MYPBWS9
	p+/Y3gBwcRo6gHQoRZcek/uaDqnfmIWuzqnnzdaqcX6kxQ077ubNqZ2YYJXEKFtzONMV/1/kwNX
	fbBYMPdKKjLrYBV8Fd0C+ZSGYcJ4ovJyz+JaKZQJs5FWwDfD8kSjN0pQMAEtKDaBk
X-Gm-Gg: AfdE7clwvBSbTv29CxDJVpdmD4Gch9oZ83164/Lfna+qx97EOn6sEGoRTNHdt4drm8d
	KFiibR+jQ5MMu99Llt4mPVrDXp6gDp0hBq0WJ78+3Ntbhlk2ElurrZ/C8+5JuGrZ13raNtpBwHo
	TONddA+Av+q04YuxlXjY0ZRXxXG1QhCT0HYtRAwlRG+a/Sn6k8lJX6RopL1NqQnfu1xLLY8RRU8
	JaRmEbjTKvf9AyVsWSLcHeeH7HsXYxfgzOsM39jVqd8HdFie3li/UhYoiHAGePTXbKjqvu7NjkJ
	6Cr1rFholuRiQf8EpGrsHrIl4FU3iOIyFo7LyHuzrdT8qbrLa1kxYOKlSbrrTuBmwsWDAZG3uRw
	Xw0Y48Ec9HpNjyugDB3X7v7fOJ560691/p4E=
X-Received: by 2002:a05:620a:460b:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-925c87e2572mr934603585a.6.1782302282419;
        Wed, 24 Jun 2026 04:58:02 -0700 (PDT)
X-Received: by 2002:a05:620a:460b:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-925c87e2572mr934600685a.6.1782302282032;
        Wed, 24 Jun 2026 04:58:02 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e49a9fbsm648644366b.12.2026.06.24.04.58.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 04:58:01 -0700 (PDT)
Message-ID: <67e22ad3-5ae6-464d-9f90-72f577d35d91@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 13:57:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sm8250-xiaomi-elish: Add pm8008
 PMIC
To: Xin Xu <xxsemail@qq.com>, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <tencent_A65CB41DCB0CA96634CF8883E1CF89059706@qq.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <tencent_A65CB41DCB0CA96634CF8883E1CF89059706@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA5OCBTYWx0ZWRfX08JPFhj2DGr3
 VcrHBHreJHvZCVUUdoMlQVDVvk/+LOKLOlZKS41Of0aOZe9kP3Einzrqq0LQMIytYsEwf9VHlVY
 KOOX+usaBwx8UxQPCG9p9XUNdTqfbeY=
X-Authority-Analysis: v=2.4 cv=JbaMa0KV c=1 sm=1 tr=0 ts=6a3bc64b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=dZbOZ2KzAAAA:8 a=EUspDBNiAAAA:8 a=32zDLpEgVwPJr79w7xIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA5OCBTYWx0ZWRfXyRJjVZrH32kK
 DOfW9Oje/RAGK46mUGJxsCTFI+u/9El7ZwpFPdynOR9s5CmgsWSw//cvRUwcRTFg0tz1uRuCRKF
 TFSWRCZnOV7OVvFrLp+iXWHDAhh00H5R7SizYqjpcd7fGTBo+Jwj2SG960VmbKryAQQLqB2dXZT
 /vPN9qipEB6zLIRNMPF3xA0mxk/gYi25dRVsf1KMm0DcJR3VYPob+URtHq77OvI7b9qwwn2/v1h
 ko0wJiLcGdhuDlY/GPjWBt95rsBqoocUtN5JZqq3CUJ8FSVCotf7vkaWdvmxaLHrPHOYV/hFdRj
 QRWnzbVK3drlDnJPi5jMYJebq/qoUwFenOjZ7lVbrp+cKOR4sw5wgMeQ7yABM74adtNC+vipJm3
 K8wImHZaFtd874nB+uow195Tu2jmwA==
X-Proofpoint-ORIG-GUID: AhP2AU7pQEvkOZ1lUJQuO3pp3yDxehdE
X-Proofpoint-GUID: AhP2AU7pQEvkOZ1lUJQuO3pp3yDxehdE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240098

On 6/22/26 8:46 PM, Xin Xu wrote:
> Add the pm8008 PMIC node on i2c15 with seven LDOs,
> using GPIO84 as interrupt and GPIO76 as reset.
> 
> Signed-off-by: Xin Xu <xxsemail@qq.com>
> ---

[...]

> +	pm8008_default: pm8008-default-state {
> +		int-pins {
> +			pins = "gpio84";
> +			function = "gpio";
> +			bias-disable;
> +			drive-strength = <2>;
> +			input-enable;
> +		};
> +
> +		reset-pins {
> +			pins = "gpio76";
> +			function = "gpio";
> +			bias-pull-up;
> +			drive-strength = <2>;

nit: bias properties after drive-strength (I now noticed that 8250 dtsi
has it ""wrong"", we'll mass-touch it up once we have a tool for that..
sorry for the trouble)

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
