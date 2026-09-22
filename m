Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695C53803F1
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 02:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790045498; cv=none; b=h2Q8YTBWroAHIB2jQ59eUX/Psk0H4F81pIKyDBIhIeyVe62nPHV7p9MDOlrvPQOF8eIopiTl7HZC1wnMg6i2i+AQDzsn/BTjgpeQGMuaJNuwmSqQg8+VMQdbOxiCUvDDOCrFuG0YZLbhvM67pmDQWZqc1bVWwvZOymz1cOQq/d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790045498; c=relaxed/simple;
	bh=k7WY88xtG/dMZrHKXCX+znIjVRIiI4rzbq+8jyS+OCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kelPNhcan4A7GIUXg36clynDrqi7mOESD79umoKrpOjakCI7a+QEosmj3fsL6zB3edbP9lEBDzckSGkZBjnb/Brl3KjP8yYph+LPKmFHcSX+btGDyOxuhwC0yhOm3llSNVLgbAPZJ6Ls1RLYetYupby4P2m3tqpzvocRKWWM1Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mVR1/yhD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kFypGFB+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mVR1/yhD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kFypGFB+"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M00FMO2824285
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 02:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dudJJoyUyotIf/gAM3eNUXI1
	9n6+S8WkBaQO92/4Yqg=; b=mVR1/yhD7zT0X6Z3YX1Qoz0IQ6sQdIzf8jNh43OV
	r3jHoTQuuF3CsMFTSVzULxzB/XOlEf640SvDQc89BffOQdYV+t2mX5QtWDcFbFGw
	31Hst+j4qePrJsZF/3D6nAI+mgbLYsS6W24zLa9wQzG+5M03SbnMPPyP4Du54/eJ
	QzNmOGDiizUyCmB+n/vZPDvOLv7Z9OdDLeWSKB13zBASsIberRYXQ/zqUpPhDPf6
	l3asoTH7ulsecJhQZ2kQezapcUrw7g5Qbj0FhAli2+4fcORAnl679k9HX1ZiUOHc
	v0xxUmA9U8u8ExfBPOxGl9Ktf2X3niIzF7BG1qS1lM1AUA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu3cskf77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 02:51:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2db3b126c9fso47796515ad.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 19:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790045495; x=1790650295; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dudJJoyUyotIf/gAM3eNUXI19n6+S8WkBaQO92/4Yqg=;
        b=kFypGFB+R5/tNjqUBvaxzuULs5LpJRklYWfZUnVFXwlTbOqgL26hjzhl5awnrQjOx4
         gUY4p5zPlE1AXqVzSwpvLJLI0+bKiglvo/jTZ4ulHQb7RW/lUGBQdTDiC1EpO+i7wnoH
         ra+8mkWHWRR6dTyanabaufMZHZiqhlGKW5MNnA1p1jCn/1pQ94EbkO38PnTewZJR1+0l
         VNYuBITYCIb5REv7udiNI6ylMdhFkrgqRvFhYA+X70l99fTY4Hblvwu30ZNuuT2WtTg3
         /GmS6jNSNmQKW5aGX13D4K/Q0EK+XmijV/jLHZwKFNPPfupt7coCs0JbTfOt6iovprxA
         fQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790045495; x=1790650295;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dudJJoyUyotIf/gAM3eNUXI19n6+S8WkBaQO92/4Yqg=;
        b=j9R46ujA0ZzzWp5iSPtI8oWX6CbYMtCATB6UlUX4YWNRZ0/CTbPbzcPnjk1xQzxhpK
         6j1jz+zWloTl4F+MFblA+XCpwiKMCAxdMlAxeiLtj9Bf7pPDL+s9AjFOSeXc4+0vZaGd
         znf9sROcU6r0ST0K503VQZxpGXwtTt4Y38IN8wUAAwWgDX7UCIP/8PbPNKlS9Pg+PD17
         Af+ptahKRfTb9n/Idgzr04Jq3ttN6LA1hBdbWWWPXVFzvV7sM1R93lFzZsLK2yM520I/
         tYsjfEpDQ0UF5cde50xcMNxtvmcDqUnfysYm1ycX8OmdfMfIuSXiKhbTGV1pjUXLVM3N
         +DbA==
X-Forwarded-Encrypted: i=1; AKwUvBziMETzBw8x6yfiV8+TOjyaK9h9frDRZ77io/Rksu6yNRMAgfz5pF22rmjeRQfF10ZtTGezpT2DpP5H@vger.kernel.org
X-Gm-Message-State: AFuF++neMx73T+xlLqp6p0StYIvNZ6TMsEvrDweI8FK2QkkToWwnkjaJ
	UYo7vVkdMhq6hrEnYZTHqdadYoAVbI2/wLoR0x3kwGwElnuzzEhLcEily2MNJUfJP9VNbsCaLvs
	wLnZ+juDLTLmqxzwGy5OcHmPfjwH+PfFSSGAbj0oZ1thPSp7kQZdN450QCscWSoBh
X-Gm-Gg: AYBFou3vNBc59h4BblWjxdwcHEALBCEhPBWTwzJJrhtPotsB59Do0jWS7uB9NEro2YK
	2I0D+0nrfxXjLqbNLc8j/O0fRK+6ezDobWa8gRpeXLicAu+6s7kE/BU4dqAPRJt5ExcehgfyrXG
	8xDCJ5Q1HyvAvlrjtxj83YVjZPxQk/8hutfJIJ3pB2fXC5YpQGmTA5gm6eQeY2sJdA8kHCuinOM
	u44dpNNJAXVmU6k3KB8lQSDDN7wB+CQpCtfEbvUSo6yKtpA4z4OZ2aMEi0V5dZJxGTUXgAtSMuY
	ecmEQdw9kHOm1WEtMc+AV9Bg7hVDoIBeZSZSQ/vOPK19uMNzxV1QpxcYhxJbYgjitYuCWQe1cFu
	ttPRX+wwSMcd16PO0IhNY/erYUIfvfWUV4LunxVdbug==
X-Received: by 2002:a17:902:d48e:b0:2dd:ad74:ac2e with SMTP id d9443c01a7336-2ddb1b9a0edmr187471215ad.23.1790045495086;
        Mon, 21 Sep 2026 19:51:35 -0700 (PDT)
X-Received: by 2002:a17:902:d48e:b0:2dd:ad74:ac2e with SMTP id d9443c01a7336-2ddb1b9a0edmr187470785ad.23.1790045494503;
        Mon, 21 Sep 2026 19:51:34 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e61311f86sm1158375eec.23.2026.09.21.19.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:51:34 -0700 (PDT)
Date: Tue, 22 Sep 2026 10:51:27 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: nord: add GPI DMA controller
 nodes
Message-ID: <arHtL8M9SL5WCX_q@QCOM-aGQu4IUr3Y>
References: <20260921-nord-gpi-dts-v2-0-4f297c983b94@oss.qualcomm.com>
 <20260921-nord-gpi-dts-v2-1-4f297c983b94@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-nord-gpi-dts-v2-1-4f297c983b94@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDAzNyBTYWx0ZWRfX3vngjxGn4eNp
 qSc9KUggsqQl80K2OBowIGuRinz9/13BlCSrfq3WXOsIc8CD7mMQeWxbc0Te9sKCelRF0jr0wAz
 /xoj1OagV+Oe5JdKM16VEiQyUgwU9Nc=
X-Proofpoint-GUID: 32W-evNvgtPXv_5bK63eTw2ikcG9Sh8w
X-Authority-Analysis: v=2.4 cv=QovLTlyd c=1 sm=1 tr=0 ts=6ab1ed37 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=svJ9ipqeD9EGsNKrb54A:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDAzNyBTYWx0ZWRfX3D7si71rjuR2
 zo1XO5eq/MBHT5WsHXgxB8HFAo8hBRQT+trmevjj+zELGZuT8Qc+qMxvFFVXusVPwXEZVbyU0Ic
 /joetxoTScLfX3P8w8x0ngOpudPSuV7ewIh0BHgMYmB0LazFj0/ZiGZ6UVnfpPk+KZ/7oDl+C/y
 rQVdjn/XDevEOmrPJ91IIJVY9iqho+Erhdj5yOfxKJ0JiWnI6gmCnSYieVBmL3IWbRZxecOvgQd
 beK+gn6NrTWMEgVG4FP6B2tn2+mBxWj8/c0yC1W44bTmvzbXv7XAwXRyH1QlaG5fcUdcwG0wa7+
 M0gg+v9pkrBkDTUotl4iiUsOiomNmn9hBOBpPki8xkUfDuVPI2qcm/JZe45ILTTV41BNmgY8sBp
 locS3KifmyBoWchu6pHKaUoaiETss4qlqOf5r4oHhC8v9QdXwtXv6O367xguqgl2yzY1rRSCtjd
 s69nHtKfYveiWDZmvag==
X-Proofpoint-ORIG-GUID: 32W-evNvgtPXv_5bK63eTw2ikcG9Sh8w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220037

On Mon, Sep 21, 2026 at 04:46:58PM +0200, Bartosz Golaszewski wrote:
> Add GPI DMA controller nodes for all three QUPv3 engines.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
