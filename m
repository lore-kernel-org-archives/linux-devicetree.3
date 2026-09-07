Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC7544238D
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 08:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771404; cv=none; b=opHC34fQrDwWfT2fQkO4saHYmx5XN3OcaEaIQg2oqsxyBOJiFn6GmX6B85orFWy+6VBpu4CQduoavFbYt/5iptvAxsBhyS7HcGnmpT7npeXQHzyTuqGHNQSGu8QAl8a2fLlrHB+Nrc3zOxCK6KbzyCiw5fwqYdTnYWvp4Ij24pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771404; c=relaxed/simple;
	bh=rovNXMTMW7lbCsTGUUmmAeYn+T8gnCE/wNxC/sOlh+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VYXnA4VSkAzG0g3TUblIMUfs6U1vnEuHDajmvfK972wBlHM8yQtPirqTdY+UNZzu0aeiEVqqijir3xDcLO4BW6qD7Bww0CvSxXwVYEUWRa3hVpeXXmQX0uuGq/RWMsCKv1WSkiyVT7qG8ac1bMjrV8Z+twzBERTbzINF0oSD8ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D1sdOoVT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OTrvjUBQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D1sdOoVT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OTrvjUBQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68787TV33411509
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 08:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W0TksTDHWCX56lBMxITiII7yWE3sq3r/nFftqOK9U68=; b=D1sdOoVT6IXp56Cn
	8sse56jyOix6Xe9pseziaIZVlNFZJk8fOVZ8brYZaRr0gSOycfHpqTxmExApL675
	cce7hESKqb3kk+A3yjp2q8tf6xN30w4OOgyDXVQoNP34DPfj9XGAesTGzmoN/wKm
	J8N59qMDPzXQA9LiF4In1jGp765cSQyl1fq9S/rzH/W3qzlLz3oeFpGaoGFeeF7m
	VODRw45nwaDl9h8TquFuSBHH51NmQb95IaIbEkWe4ewu3zYVM7Zv952Rtyhkw7Sz
	X4rLGUEU2ax/5QcY0N/886V0lc5FKorZagpjtB6oTrdWcBKditpFnXvwBrwdtr1k
	VsWgmg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsfyg6tk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 08:56:42 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9102fee9920so7007976d6.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 01:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788771402; x=1789376202; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W0TksTDHWCX56lBMxITiII7yWE3sq3r/nFftqOK9U68=;
        b=OTrvjUBQuvp1EU3X8E72WHXE+RwTpfKFtZTuf8NVEbz7D3UEDNeFovCXp24FdT7zxa
         XKposNaHjPfmmI0SCtGWsmnN2jBLBtpb+AQoTpX9qwDvfDCjnWIQaQkske6pCfmT6PVW
         62yFaGYVOKX8BgR2GDI/+EUeDVRzOF710zu/He2sJ7ynYAejHgYR2+itwJRPl8AOR5xj
         7oOAouZD0h6/9eJkSMtnpe0BgQduEzK7emspvVt4IA83cFdjON/VFFWOBfmEb3EgQ0vW
         NyT0S+6Lwq7BHKQRI4RJpGU7z1DIk/a6Ie+J0Cnu9RG5IdUVNOeo5hOgrxbtmBkVY8Tb
         aHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788771402; x=1789376202;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W0TksTDHWCX56lBMxITiII7yWE3sq3r/nFftqOK9U68=;
        b=iA/9bEqlruEGuwKAkP1LCRAg5xjphFhTw5mj7qZEvf1a8beNJed6GGmMjwwDQGwJbj
         Tc5Cw2sprZRMpV1HPaBU9E+Qhoen3RGAdQhU9djoj+GluGgLM7ESq8C3WN3HyFkY2n5t
         tKrKQ/rg55G0A+p8WLB/Agqi3WpGIFw6RNu4aNripn8zvCVYg7X3GI4DIoS0JAv/LaQZ
         2Sju9ivBKACPhvF/qUVrvF775qpwhjTFrv0rSikHEhAC/TUO+TkZu3S+MIIMjK3h8P6J
         c44EGwi2m4+UivqLuEdNBI7v6Lq1YHLwkz7itaTg8iYv4gi2MFZwtl6SHhjhrcopsQZx
         IRtA==
X-Forwarded-Encrypted: i=1; AKwUvBy1biOUbkGNmYo37GHiHRFZLgde4hU/0VzUJSwlT14/P+EemvL8Fch1O+l/BlUFi8t8qocA7OJ9a+rh@vger.kernel.org
X-Gm-Message-State: AFuF++l9GWwzZcHM3dvfdv1o4JU82b8HnCgeBYEi9TfPL2xI3EG0j7jT
	g7SK78T8KHi7zPvE+VI3ZmuVbj37w358EpEiVr/6sEos+1LVoHrEtfaP76BtvgKyKJbdLE5Nmbm
	ut2ZQHvUn9gHI123sEExXaIResxgbweNJe+My4/Nb7n1zWvhz5jWtqZmL3pakYSYO
X-Gm-Gg: AYBFou2b8XfnD7wi2CvVTacu0BP03Wy9vYdFY7b89LT/Of8BloroSG3T8aCLAWSH1NW
	9cUTtoDv7mDKYXHut68oa9bNK/oZqyr9YxSrtq3as4z8cAlTaEecw6bK/KqgmMPRJxEJoq9H2+N
	TENXEKsqEMEG+X6WjYR7p7UfoH7q6EB2gqGJfqRy4MUjSMtiO+08FBXc8aKw1ua2uB1J12D1sfS
	8Gx1tC8p77SpOwiX4KKJIGF2AIwhupu3Ws5+x1VUjXYlT9ezhOLARX+Ski8MpbIaRj2w2KIJrW8
	j91UOLo8WBhZteFtpwDOYP69GNmoTGUizN8g6jCfMQdEdgaNyrq29Y4f64MQ/AH+MN9WqUMk8gU
	/s6p1o7rEK3+NJRbpdzEX0A==
X-Received: by 2002:a05:620a:1a06:b0:934:95d9:85fe with SMTP id af79cd13be357-9399180ba67mr1024939585a.3.1788771401802;
        Mon, 07 Sep 2026 01:56:41 -0700 (PDT)
X-Received: by 2002:a05:620a:1a06:b0:934:95d9:85fe with SMTP id af79cd13be357-9399180ba67mr1024937185a.3.1788771401200;
        Mon, 07 Sep 2026 01:56:41 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4a8b7dsm431916666b.21.2026.09.07.01.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:56:40 -0700 (PDT)
Message-ID: <60638819-77e0-4d7e-84d0-00afa430b398@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:56:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: ideacentre-mini: Drop the unused
 USB MP port
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <20260905-x1-ideacentre-mini-prettify-v1-7-9a87882973bb@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905-x1-ideacentre-mini-prettify-v1-7-9a87882973bb@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LrBvkMCisDI7whGAbag0ccEvS7zKtHhr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5NyBTYWx0ZWRfX9f8YvoiOH4Lv
 V43IEmmEUvy0dxF840Jz9i7lzysR295XuqTfRZSAIIACFnyNYY31F4CXej0zYjU2f8IACjbN6tb
 IslgwtRl5PMioXR5eGaucZMwnfZJ/v5hJhJnKeDZ6oR28O08K9Y+1GkPtJmzHYcZu2f/beuSuDP
 uM8rZ1t+jTrYqt35md/fK/CKrbmc5Qxa7B2l5femFu+cisaTPjnZKwD0sAofe0OYY/rq6+IoxAh
 fawyQS6f8w/giYclcb4v4PUtfQFXr++jj7ne+OBd6vLFwmZ8tMnXCGWRfnUVHi0rY0t7028A/R0
 oDQwGeFiUo4JNQ+6P60HyFcLxaDS8c9xbug2pUaxwCRhttUyOBl1XKCvo4YXmsGnqtW/2zo+L8e
 HnKJ85s8EroF73UXuxbR/e+lH/VQiMs5ktDGFhVXHRRsnssBgLAd6547bF2XUqB55VOm+IG45/i
 S6+ixmIIANiE0xuYqAw==
X-Proofpoint-GUID: LrBvkMCisDI7whGAbag0ccEvS7zKtHhr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5NyBTYWx0ZWRfX8USEnnpFQe8P
 eQWJ6P3HPd8BY/wcFxqw+l7ZaPVObJWE7j/3JWLJfmSnVR8YdTWgcNRuYX1K17shCrHpR6miDuC
 VXo2xz6j8pJPcsQkhqHwKCzg6zAgLOo=
X-Authority-Analysis: v=2.4 cv=AduB2XXG c=1 sm=1 tr=0 ts=6a9e7c4a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gxl3bz0cAAAA:8 a=tblq76QRJd0Dn6ki9TUA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070097

On 9/5/26 11:29 AM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> usb_mp port 1 (hsphy1, qmpphy1, PTN3222 @ 0x4f, TLMM 184) is not
> populated. lsusb only shows two xHCI controllers: USB-C on usb_1_ss0
> and the rear ports behind a Genesys hub on usb_mp port 0.
> 
> Remove that repeater, its reset pin, and the second MP PHYs. Pin
> usb_mp to usb2-0 / usb3-0 so the controller does not claim empty
> PHYs.
> 
> Tested-on: IdeaCentre Mini 01Q8X10, Purwa (X1-26-100)
> 
> Assisted-by: Grok 4.5 (xAI)
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

So does the repeater exist on board, or not? Can you try to poke
it via i2cget?

[...]

> -&usb_mp_hsphy1 {
> -	vdd-supply = <&vreg_l2e>;
> -	vdda12-supply = <&vreg_l3e>;
> -
> -	phys = <&eusb6_repeater>;
> -
> -	status = "okay";
> -};

The PHYs can stay here, so Linux will safely park them

Konrad

> -
>  &usb_mp_qmpphy0 {
>  	vdda-phy-supply = <&vreg_l3c>;
>  	vdda-pll-supply = <&vreg_l3e>;
>  
>  	status = "okay";
>  };
> -
> -&usb_mp_qmpphy1 {
> -	vdda-phy-supply = <&vreg_l3c>;
> -	vdda-pll-supply = <&vreg_l3e>;
> -
> -	status = "okay";
> -};
> 
