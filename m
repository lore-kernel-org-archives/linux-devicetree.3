Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6083E7621
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 13:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788269066; cv=none; b=ExkM48KpwE3p52zsIoc5uruiwH22UFHKlLdOstl7e4OU8Ro1U8+U37wVwuVYGhPlmq/0oZEjLkTFMW11Forn0psFfAWb7J2S+SdHxOvnVTjnZyNpMJHh5TTnzs5zf32MJIrbF2tTzNRZMEGtZYXaHOh8RmaH5c7mHlomOwaHJlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788269066; c=relaxed/simple;
	bh=doEy6iBYhjWO+1eu+FG4HEPb/8Dq/l4nV0w0yrASPyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r6wnePwvtzU5ES7dvISZIem+jfMERIvYYhs5oDGY8dAX75/W7Mvkqpxh4AxyGQjSRj238KTYuxZjgdU5aAN+nuVffPAbUHAtx0k8f3OiFWScDyd80elhbNlbpCWPLGGQkZZH0VW5lbo3Fk8JFyTmA7hv5WGHKTaKLVeSS7fZ7us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BtpLlFVC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DrmMa2fr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BtpLlFVC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DrmMa2fr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJePC2494589
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 13:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fK4hoq5TQDS3XikMTWs0aodegmSjlooccPriMdi6b7Y=; b=BtpLlFVCVUNzxEYI
	HgGZSJSdQOf5ayDt5hq+IOANbHz0Vn6pG9Vsq58d1AfZTSZiqYiuXyxygNGE3xQc
	lA+79Bw+n5jXcB4yipulo8IYpZfBSTTw5zcwqGhVdakj/DX98Vmiu3d4z+qO9kE+
	x2c/SHpr99RlfuLqxuZUCu9rWkkT4kUgd5+u8tfe7G8Jk7t4aWsPvApx3vW45Xba
	9Xv6iwLE5NUZrhOx52WIGQP0d785Wi7YfJStxsLwNoV5dJrJ6hQXKy1dYCU1dKLV
	dsx8pCQek6g1+g5gTB2F1gYPp65Rx0zxpVzPtIQxRzQego/2TRvjdA4SCH93liR7
	ESgwog==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdqbh286p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 13:24:24 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7570225606dso117976137.3
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 06:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788269064; x=1788873864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fK4hoq5TQDS3XikMTWs0aodegmSjlooccPriMdi6b7Y=;
        b=DrmMa2frw3EHHahTc1/8EMp2QTmLW0uSh463iIL65jIlJZh5v9W91oMV1gZf+9rbPw
         0hss4FVaHt5wwGb7+M+YEpWL79pGfTlxyXE1eigLMgjK1lV6FqasBi/PLEkglQ0v+mv4
         PbYxL8dY5T89ciMYkeIXHhlhTEAryQIVeH9u2UiT7EHUDIQEdjBYbtIyA1kMB9MSvzTT
         2Uk/FLg9BLiGUqIpui5rYpM3G0IW6lweonc9kR4EGP60JjwOsq1a0QNG6R792Z80yzhy
         WBLN+kZyxJIiYzH61irCsukKZm9IZZqgtKysqV5bWIqqR6yjvpvvfHN6H8wKit0apNj+
         kPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788269064; x=1788873864;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fK4hoq5TQDS3XikMTWs0aodegmSjlooccPriMdi6b7Y=;
        b=dBpig5PEtMcovhnvf57Y+A1suof7shnl4o8O8KDk6qa1N9EMszN2htjNVo1E0caueP
         TpOUeGADWv1G0FvwDIMvT4K/sBBk16KhIeT7lx9Wsg8NNYsMSU/y3/aiL+wDPR0yU3HV
         5t0sHlHpKm+YVCyCj+5imdOB/ZDwbMFe6iPB0X25fKn6o4xPsga3Mtsm84J7pdZxwSxq
         sUxMaorVlDIe/nqzIlzwLXHOnq2hiZERxgZCXicDPL0EZrjCUXyy/GZVJbQGG9KPklIn
         LnBGCzcKpQCMhVc50AuEkwCBUBJ1BVIlPLMoYun1vqPnTNj+9uFfKTAUxQ7VjV/wMjGW
         aPuA==
X-Forwarded-Encrypted: i=1; AHgh+Rp88Zo7S77VnNinnToRCAA5OuykjLG8SpVZ74Dr5Z/+D35nwIcCAckbCY+aewp5nbdsVRsSd9SxkfK6@vger.kernel.org
X-Gm-Message-State: AFuF++ltjrVC4Ql6ZfI7QigJmLrmBDWsO6q/Bf9vobHko8bcq/pazMXw
	5EibCgj80rBtDi0256B7nnv8R2ifpTluAXJW6ufdw2xL//BusFSNgLkgy1cVmLxOyn/HTQNdoqk
	HXjCGgdxxL7kv/xSqS4CFKDcpgZXw40LmqvsULe+uCOCcUZtcelsS+7gj5rnA2Vsr
X-Gm-Gg: AR+sD11mMi6wMFVEK0qC1P6WO0ER5fTY7m0J3Y61Wd83e9cLOWKGbE8t1pxQjzsq2aS
	bBE/NbWBlW/qcT8iZ6r/Ueq31BW8ia4HGUxke6fcau4OYha/MzuWsqAzG7GVetjMvAXUJLKKsvq
	W4NFg+qSgiXX+sJCq4skzDhAJcR3I+RjKKgfIuh6N7fVncusO1DKjccBZJ1slcqm91VZnDZXCh1
	OITT3Usg6OdeMe8N1vzi42r+Oo6z8GEUDZ/bcSLILRRLeugh53TbZ0Gq9RKv6/jbpZ4a6TufGe6
	Yhz0YBe7ogcg+6WT3qeY/YO+R/kYyn9cwJhbm0CZF0ohXTVVV5xJHoqmWxulg+hzTiIq2/CBBsl
	aMw9+WQZ03ZJTcyGRRU2DfA==
X-Received: by 2002:a05:6102:f84:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-78593425615mr4431829137.0.1788269063574;
        Tue, 01 Sep 2026 06:24:23 -0700 (PDT)
X-Received: by 2002:a05:6102:f84:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-78593425615mr4431799137.0.1788269062980;
        Tue, 01 Sep 2026 06:24:22 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e89c5a53sm2874355e87.8.2026.09.01.06.24.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 06:24:22 -0700 (PDT)
Message-ID: <3c34164f-08cb-4e33-af8d-c5d19012a1ff@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 15:24:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/12] arm64: dts: qcom: ipq5018: Enable USB
 Super-Speed PHY
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
 <20260825-ipq5018-usb3-v3-12-39be0955a6aa@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-12-39be0955a6aa@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX88e37jla8Pla
 naxwX/ASxoEjEfEQ54lKHFBNDRe6pPWGce7+dTVHk3HwvcEFsUnPHMXhO3Vgft9/moz2ROvebHx
 jI5GJobGwnZkqAGBezL+BrZli9IAKUw=
X-Authority-Analysis: v=2.4 cv=R9wz39RX c=1 sm=1 tr=0 ts=6a96d208 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=UqCG9HQmAAAA:8 a=_thwKDryVKp783wjlzwA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: ndD1Rk_Ay8zfz9Q0h7MWSwTdjce9PxaO
X-Proofpoint-ORIG-GUID: ndD1Rk_Ay8zfz9Q0h7MWSwTdjce9PxaO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfXyCWcCGPgRfMu
 DjmYus3ad04G8ns1nj93XNeqTXubCknf2uCfznFnWzQwJLCNILGn2YJVmkvB9eE7IqLVZC9DKVK
 wM1YE/wNB5Up5zlHbJkhQSExrkzEMvflxwNNs1NKoT7tlYgElA02FLb1ex3aPTqpiR1pCwYXVI2
 SL4FtBsIUVZnUS7Crz2nAkyInaqcOY3bFsQTGNaxDerMJMMdngMRWq5udKkzGoYBwmPOCsMSrMY
 Mg0iixxpeXusqjpqG/WHQ0tBlc741WqfTTpqNIZhh8u9zNJoIl+1IYTuOG5uyOWTGcj91NwuLZM
 kdVc4alN6rlmHfP+LKb+0fIbrgS7Bzl08j1PPmlVGPVNanomqTaoWSlo8xsu2/ZVhP5kDWYX6ua
 wd/WvaQMKtSfrvtUeNRFzTRxX1H7FZrT/redvG82N3G4bvDP7hcGisFVNcjvtHOkBNu16r8KTiG
 aB2STkWXX0Sc2UOPKgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010117

On 8/25/26 2:37 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add the 5V supply regulator and enable USB Super-Speed PHY support.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

subject:

arm64: dts: qcom: ipq5018-rdp432-c2: ...

please

Konrad
