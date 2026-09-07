Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881D549EC6E
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 12:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784072; cv=none; b=cx2rQiaaARfS4GVOEjGJ6SJEyxNcEqyDOix2UYk3Nra0Q7KETGMk/2NhCnbs4IxYA8EE0zB5s+2nhn3wLQN5tGMRsE7nfI/mizlc2hbBNTtZOaQCfeB6fZX+3x0vDHm/dJHXa4+VA2OKEsCKpdFjQneHCia8N7yHMzJGazcC7fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784072; c=relaxed/simple;
	bh=+J91eDr7kWpWxL2VErpxQSnatb/cbGe70zHEmvdVQEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tLpyT8F8rANUlFIXONYH4picnLRvA/Kd1iwYXXz8cdKPorcZ3zMScBkfJ9lahHM8CQVf9Z/0Njm+kaA2EytwkA/CJYRkvkY8txACyjgIiIHu8bwhdJil10tINNa132Z94llFoCB61OqC+XTxKB1LAE1+JaP2R4iS9vRFGOFPHEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DKOYizD4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RAqJiVca; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DKOYizD4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RAqJiVca"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnKGw3873703
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 12:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YGw+UONwD/1MsqquhuuqfV+vYDTZQZWhfcVMBBeRj7s=; b=DKOYizD4bBHncWGl
	CTB5/7gu5v6R12yd2UovTGFWcxBmw9uHBv4l8uH9gMjKWYlO2OlItU9DBI2kU3xg
	8WanJcPp/ikThYtLa82oP+h9bCpbq6UqdE1h0GVXbIg8bzqjVb7asvBEmlhSn1/S
	Vbtec5ggzkFjJk1qpN/rxiXYVcQge/eVGg7k9sFJMLMoQYaiK5zHOn8y/iH49ueg
	L2vy79wXrkfhePL4VJ6yduAVD7BHIBLbHw4wQMRlaRoTXUEChJ8ajwlIG+5NVv49
	3SxZeMoPaBL3jOsR5wTNyM4GfkSz8jqJ8AMIsx3gQuYQyr+XeZ2Nn2d4xD4wap9k
	/WyeOg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj1yt4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 12:27:50 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90cd9fe6336so10249046d6.3
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 05:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788784070; x=1789388870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YGw+UONwD/1MsqquhuuqfV+vYDTZQZWhfcVMBBeRj7s=;
        b=RAqJiVcaaeZLy17GIU/DH668v8F1QTDyjolb9htz98b9vjISR234mobIN/pPuZBT3N
         gYn2lnGwD/0LELSE4vUWSaNxGbLuWsSuL8Mk5+vYlUsq33Jvv8G6iOqgxMQ2pY+uWwiQ
         Ti/CSorYtCqNLGyIWG1+x/z12yzCT2U9eayj5JbprH8/V9AXEmbhHIZfzA6H1xKwrjoL
         8B0giV4cTMhoQNEg8SEfhkYHHIIUyP0B6XQVvegSUGeXvd7lVOlDpt5ls9rO0T7VHD2M
         rMXIHiTsZ8xzkdfs6qS7+Dm29a1Myit7akfMbNC0KgaB5JeCXOD16OnBgT76feY/2gwk
         j9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788784070; x=1789388870;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YGw+UONwD/1MsqquhuuqfV+vYDTZQZWhfcVMBBeRj7s=;
        b=q/g29F6cJBmwC6TtIBPIrRfxLgfFQbWxDrFWODG+TyCCpNq+Hl+Emr/pzuT9FjCwOG
         wfa2xx3no9zrsv3lfWjRtf1h440ovCAjbLTFTpptAUJh7wwYnhmBrcS5QMHFNS2QgIwa
         PQwqDexB1qgIsgC3EKXi1lzGb68VyJwLOXvH2hMOUlBoIgkodpGRU93OZK7JkvHzRWZf
         /lr2/90hYM990eXkY5EjBylRNXyO4Itd1/7ug7/wgjXw4Hu/JcuANSk87gGUGgsbfdjI
         c+Rv8LwFkW12D3yHTV9JRwnqdT8QIFGktP5jty1cHVyyhNq78hUCnKFW3F6pq+yIa7wE
         rdNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZICVCbJCkneRDf3+X6y7kuTNC4e8yaHrjRxO6j9C4TSL0fhWKo22PI/hUiB+gZbZkVQobPTbj4q3d@vger.kernel.org
X-Gm-Message-State: AFuF++nwjUn/Hasyg4gTCt/8d0CCHKJoPmdE9H504crV6uw3yorYFnos
	6BlNDW947HaI9C9qq12KQ4GGqfdNBLTzi2eeUe4fm513hD8HPylKkDyP1qoDBfvb2WPNpmm37H+
	QLj+/RowIEpiORSu8BddKZZBlfYrGCc8VG3ivNAkrRX39xzeA99WzDsYOz8kT3MiT
X-Gm-Gg: AYBFou1eut6mjy6e0le+4qrp1qmpL+LVCdcO/Iup5x+QbLHD8gY80vlWVBoMJe4/Csj
	splZ8shjxOO/qjhnsqtvHrs36oA/AW8Cdpd3MWTAxrjRXdUpwBflHO3303KxhqOfLluUT8A2nG3
	Xc7PvU8aDT0Zp9ON0asnCTpLCEhRRNb9z5/HXusvJA2qkQimWVm0F8iZi2itAhACh8RPWaoVOOF
	YacPnxx9YAwHjxtWGNJQAEKp5OL/Vt45Y36vVghHs9vY2c+fmFTqXCZtAF546Jxb1H8TkUxOo7K
	57slCZHa+x2bmNETUrD88j5xzI3FoLN3Yd0hP49arNn8P79jpZGCeQTYa0sIK5tJI659KoPje56
	maL9mFRbAQx8MosVbUb9csg==
X-Received: by 2002:a05:620a:7103:b0:939:9ef4:79eb with SMTP id af79cd13be357-9399ef47a04mr794478885a.6.1788784069817;
        Mon, 07 Sep 2026 05:27:49 -0700 (PDT)
X-Received: by 2002:a05:620a:7103:b0:939:9ef4:79eb with SMTP id af79cd13be357-9399ef47a04mr794473485a.6.1788784069191;
        Mon, 07 Sep 2026 05:27:49 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4aa01dsm467446066b.15.2026.09.07.05.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 05:27:48 -0700 (PDT)
Message-ID: <b4e0dbd4-f50b-4366-add5-e99cd4432aa8@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 14:27:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] arm64: dts: qcom: qcs6490-rubikpi3: Add audio
 support
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>,
        Katsuhiro Suzuki <katsuhiro@katsuster.net>,
        Matteo Martelli <matteomartelli3@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Srinivas Kandagatla
 <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Roger Shimizu <rosh@debian.org>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260904-rubikpi-next-20260605-v3-0-f49146d85af3@thundersoft.com>
 <20260904-rubikpi-next-20260605-v3-6-f49146d85af3@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260904-rubikpi-next-20260605-v3-6-f49146d85af3@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzOCBTYWx0ZWRfX6ILQsGi78A0i
 /mWUJKcQqbAqtkNeffBuha0riu6KvSGLXOjRyjCeH/unAWaBDr9GaXk65DmjwzxTUYIVr5B0neP
 hmkGIQ5d/u/cRl1SsPNuz7zN8oPEWXCMYVdvvMuiQxpGS5X/wAGpOWbI3NPWCLIdaZJMimlbOMy
 bY1wq3zvL7lcwudCXshz6tHNnpgyaFfz7M5j5+xAr0N8hGnwPDp/j7HtmuqrTtdntnCBn5zAnCy
 JaMwPWYEIdPlrLRwUOvoV1wLOamJmZCQHLOZxqrXanMu2QpaqXmAxtbWVu0kLOAAk6fWtMbwrvO
 pTn28XzESPDAselwFTwv5+Qf/scskdiwI7uulp+6x/LORPwM6xGABd2J5y0tOSQRAMvfKb03Kok
 pgeNRGgYfmVnvWH12IV4SiH5AgvXW3/79a359nurGMTfl29e00rJmuDcQt0VKAOKHY+P0A9fzTm
 weSRNHaYR91WQM6ccaA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzOCBTYWx0ZWRfX2ikNYReG7HN9
 S8aM2A8+wwCNc5sEHihqNS8VC60PzW/S3F9H6AhSaBe3Ss2a8O5UHvl+17pymwmv58oPGPiznzm
 YlU92dDobc9ZHfHeZaF1GcrKztgqGnQ=
X-Proofpoint-ORIG-GUID: v5Q0JK2ePjuq6oelzatprYVrg-OWVjd6
X-Proofpoint-GUID: v5Q0JK2ePjuq6oelzatprYVrg-OWVjd6
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9eadc6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=qEK3ycSJ6RxWlfFwZCkA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070138

On 9/4/26 12:02 PM, Hongyang Zhao wrote:
> RubikPi 3 uses the AudioReach firmware path for its external audio
> interfaces. Primary MI2S connects to an ES8316 codec for headset playback
> and capture, while quaternary MI2S feeds the LT9611 HDMI bridge.

[...]

> +&i2c0 {
> +	status = "okay";

This should have an explicitly set `clock-frequency`

with that fixed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
