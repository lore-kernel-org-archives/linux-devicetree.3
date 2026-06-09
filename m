Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D8F40BCDD
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 12:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781007481; cv=none; b=mtUJRC+SaxOkr+h4hO6OY4Wn5IyKsLSYORpEc85Z25szbnii55RzWCbPLAQF2UN58QyTGRGY1ufmcta6VgS5s88zWhJPiVtKGtBOoSK0BYhnW8jNxUE9HnY/m5QhSzAJw94CN0W92Ad0aI+l2Syh9uMHRVTO4MPL9WY4wkUmN1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781007481; c=relaxed/simple;
	bh=PyCzR3+Nl25myzI1YfYkIcurS7/y1d4WJOtvOLFvhTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SCHAllFrZukAS3YTUc8QV2ESRUGCs747tpRaZF3AZqF6WfJzNRIyx2M5rA2mf1/4XhECdBYQCCYZBy1HE7hMKfprSOfJDMYjFs7kHNUIq6J9Uu4KkyPCwKV6x0OY+nL5SKjAAJnwlzlicKF4bd4Hh8eHwrzV0q1sQujRQy5XTBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jfOVLeVb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gpIXi3ZT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jfOVLeVb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gpIXi3ZT"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659BnZ4g2533261
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 12:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2tmxBapM7OGTGqduy8bsdDU1Gef3pqAKNCey8QFxRO8=; b=jfOVLeVbbSCq5BIf
	X17dCHliljGOUecJxnpv4FFFqC9Rlomrbjxt9Jic9IDKOCK/cJ/JvsLA5OPz67J8
	94+HbO6O18eZEqqCMimWp1Nwe5fgVRerKvM1WLAyWXGqPwH039xi6SErPQxFagu8
	WMAgA3asKhWzyJUcm2yy85uy6FTlR+PyNV2Pbpg6eXxepbH8bL3x3ThsRZQpT949
	FjPz0bMaHCjKvDJ/ZJaBriyo3N5CDKDw60Z3pSUSmCqmcNvX95OaGbcGDzZz6Hum
	6IAXArNohutCJvVRfVHoudN/xf/K0dc2PZLad2HOmo4ZFupSIp2tkTwY+y8xpeWB
	gKZZDg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epe25s90v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 12:17:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915737aaf0bso136341185a.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 05:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781007477; x=1781612277; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2tmxBapM7OGTGqduy8bsdDU1Gef3pqAKNCey8QFxRO8=;
        b=gpIXi3ZTqWL85LMj8AlD+fHIVgmSCnGgnnJ091D/1upFvlrpzF8EpMUiPTKMztbV+U
         gjUBzVHD7PIDr4yTznxujRYG6uEMNczdAQE89/eFSzzzoYp4m9OeGgOc/Wk3m187jmj6
         RvH50RXsLxBWTJ5jwBr0B1QFxNDuGqAujmTHCMJ5dN7072lAEkBipZOWj5H1c/b/vlqv
         n5CVMcwRbqmHr/QOQrGzsSoUP5Fh3MqOS2AFGw4UMjyP3BbYwvRcidVfjd4OxFf417y0
         6ylQykU/tPtS5t00+VWJVQuQ5DjoMqzMxkRvBilqTH7IgbHSf9kkVYvO4ttmCbH/9xFx
         2Mfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781007477; x=1781612277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tmxBapM7OGTGqduy8bsdDU1Gef3pqAKNCey8QFxRO8=;
        b=TPvqTpJGlhH4wtvvQvcD4+fkk+OAdb5fnvabSuyhn0gaBDInsplQ+ltd3YuzzddOKo
         PE/iqMsiIfgY2iqtYAzKwh6g6y/3byPUn2wgJOX7PBHhelakETdheAccHvbgHjLqVacT
         y78XaLzd8JPts4dIOacEmnv8YXERHd5Xsv6XoV7fK352dNYHFynnmv//oS8M9Wnm83tE
         Kbpj1CXgeaU3YQyLJ1SpZ3mS/oHzLS3FP1P1z3z7JfXNnfTora0BRhkwcy3aMJ/nhQ7A
         tziPvSha+FaKUAMtU0niZidIK8m4Di8+ruB1MFmj9gGf8N0EJA8XL9acfZfVnlmHGrS5
         dA2Q==
X-Forwarded-Encrypted: i=1; AFNElJ/RmnYiWF4IpP4Srp8uR/HirtftK7MizpgUXyqZ3PQ0NQJFpIpHbU5GpLxz2LW38LFptv4ZjKW2EQbL@vger.kernel.org
X-Gm-Message-State: AOJu0YyOMu+yzO+22bZ43fwbYmoZi1IPIgcJytcEG9KiGrVB/C8doQTP
	wKUFazCDtjZzWw49O4w0nthVwbBbSLlRouqove9UxK5bEGxXfQLBBz5NqukL79yqA9W5ICt1FSK
	/D3cL42+NX7zojB0ZCiWO6xxtXRU1mQw78aF1gxy7b1CpsGHCPObfm6KKgh/LL424
X-Gm-Gg: Acq92OGkGaAacn2NLaEq9xOB0KXk8R1FkUkLdK2XD6FWe2Tc2+VFQdUf1qaq5EFvCK2
	X7Rw3DoSZxhnaTl6HzwcL18+36dhiJPkp1rj6kwMhljtIgvzA0kEHG1YnWWNB7CbJk10fewnox5
	aJ86grkLkUTEOc+Fl/63I33GJeH9NbfjOQeWRcSdQW2eLGHVXCPZap4unfGy0T9Pp/YAVtH29le
	doS5mx5M5GpkUxQsiVF/3A2fG0cn9HbVYHMHGgRg8R8wsRb4s1eT+oUELjBAD1aIe35ueP6j8bo
	ycArlyW5F6YH7zXdRrEJHyxsg6Zb8kt7LfQxOrXbvhesLllWEECT3MdjFUY3YUZm7drsbFgDzEv
	YMUgUJC1wbq3PhXwI+WymcZc6Sqcoc6siQIHIZmISDoPTjyvh0iCAEplR
X-Received: by 2002:a05:620a:4694:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-915e6d7a074mr262374285a.4.1781007477515;
        Tue, 09 Jun 2026 05:17:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4694:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-915e6d7a074mr262369285a.4.1781007477008;
        Tue, 09 Jun 2026 05:17:57 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65868049sm8443619a12.24.2026.06.09.05.17.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 05:17:56 -0700 (PDT)
Message-ID: <280402c0-57bd-46a3-b95c-f9ae02122a09@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 14:17:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc8280xp: Add camera MCLK pinctrl
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260607160435.36546-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260607160435.36546-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Zz-yC6HFTrbC1KZtmjoA-ygvUJ6ugVUN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDExNiBTYWx0ZWRfX0TbH2OhA8HRo
 1y0UJZHWh4eYCExr8BiHeVImNNf9ZMWCiqt4Z13XNb50oFO58rnWXmR8EVT1JxdsXXu5eMcYc8+
 sV6Sdj7VS4/0dswNtSLtiYvpxTHXx18PhXbMNnT14DHO43nrWbtdTcom6g3AOaR7C2N9Z9lHyrd
 PCOa2phUPR445Th2IsjQJy/BMr+tY34aKn48eaZJUK9gbysae9R2GTVHGBoXVz3UU8oMwZkrFam
 s2H+Jw7VUNz7nWWze6fgQDUqPrC0+DCsaDmg+IDLIig7rux5+1BI7eKApw6aJxFzKS7QxRftpIG
 eNXLI7KaZtG/weD8EbTyY1XZ2f55Q+LEaL60UxCCL4fT6SS5Vg/SAKd7Y6PPKIy69YU6y23b+9u
 Rx+8njotX4nByPHF9dGWyH770FkIce/yQWvJzyN+Tcldgc1jH/PSWPLTbEt2OqNVS7QdoQD66xM
 Mgc+ncy9fbo4R6ieqnw==
X-Proofpoint-GUID: Zz-yC6HFTrbC1KZtmjoA-ygvUJ6ugVUN
X-Authority-Analysis: v=2.4 cv=LoqiDHdc c=1 sm=1 tr=0 ts=6a280476 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=DV1FWiXnHoQvedXQBQoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090116

On 6/7/26 6:04 PM, Pengyu Luo wrote:
> Define pinctrl definitions to enable camera master clocks on sc8280xp.
> 
> Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 56 ++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index a2bd6b10e475..0dbcd3069a3b 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -5484,6 +5484,62 @@ tlmm: pinctrl@f100000 {
>  			gpio-ranges = <&tlmm 0 0 230>;
>  			wakeup-parent = <&pdc>;
>  
> +			cam_mclk0_default: cam-mclk0-default-state {
> +				pins = "gpio119";
> +				function = "cam_mclk";
> +				drive-strength = <6>;

Other platforms set this to 2 by default.

What's the value set on Windows when the camera is in use?

Konrad
