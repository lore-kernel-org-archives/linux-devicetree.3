Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901294A1DEC
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 13:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788356983; cv=none; b=bsTK5LVSMu9/2w2PxiRzFmBqgS761JM/ImAWV3t2tRjnJuPq/JIhTS30i2wszbU5jmAgi7Q9UoQuwAhfTB0MGemS+ZHFND6CljOPF1UL1FEwpoDcFVFbKtvi5z2IbcA8AXCDiRNI4bsl5pHgv+kia4K4mEm1ZL3hXaT93VS2+9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788356983; c=relaxed/simple;
	bh=h38puJP55NohaqQoEAHKVmrRg09DfjV6DQi5WL725/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N4NJwpOQODc94hvBtaGOmZhTE1WQiseJ3vvUpViI4tOpuxFKO4mWUGOaBnWtYViF+hmN1HndjHh2Niy9z+8SW1ay+o0kOmqhku8kE9kPoLxLFCaY4xZlnbzh0i1k30GugxDXLLlEUd2r4An1gs+A6eci5OtfmoskQAFaeUAp0OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dMJtzfGd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GpSi2FTs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dMJtzfGd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GpSi2FTs"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682CRJe51491371
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 13:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zWjYJtIi6OZGoAo9l7Mi+iO1ntwmzaoC91XDg3XgiVY=; b=dMJtzfGd1Kr54bQu
	GD9fDz/rWV3mgwOWyiYN72VDTrGVMEAKxtKEQNq015+px8fvVGh0pD9Zm3rgxI8/
	QaggsYobxVfvXippqUDvaVE3K3KtQU3NVZG+XX5Sx1ZduUUtv2fNxbCkuVcl8g7Y
	0MHu0maN5SDeuRPy+MOsm40VBDEC4QzcfyhVd1v8nQmM23qmyywpJlMmpgV/RZha
	X0AIKDbNu0FGvDsScMD6Ri+liQO4i+9JAU2hJuVcVRbPOp/RWTxiyxEmLyBwIVie
	/KrvHxhyX/x3EazV6zlui2qQyDJY5ROgh195qMY5aCzt52rnF/gAIKt37oeNS+UR
	pMS5QA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geb562eee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 13:49:41 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7824ec38da4so39157137.0
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 06:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788356981; x=1788961781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zWjYJtIi6OZGoAo9l7Mi+iO1ntwmzaoC91XDg3XgiVY=;
        b=GpSi2FTsLoVwPlVPSosoTJAbKCAcjB3tgeIv06b4q4IwLzdwVglfK5FqkB2JhRMd3M
         lwNyFMVBe/UW6OVr42tq6D8ogmSsBvGAHpoaGXsnQy2jJ5Y3c3bOlOonEiSCsgbcbrGO
         yPbUuo9ymjSbHOnqXjM8V/4HQX+ytMWtgM8qcA9FWCp2LNpMouc8Xfp/LRAc3z51ddij
         IqpxbT/DOn1iCIR9vd2iXvnn1yPzcgwSm41H3RCgxZmpkmS1mXtwv9v4yFUxXksvlIEA
         dGTM+m3R9+zDcMXfpGCIaCzu/sPOcF8GfnlmnNDkFohK5oIlidajF8hdbkYytkBv+KvR
         MvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788356981; x=1788961781;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zWjYJtIi6OZGoAo9l7Mi+iO1ntwmzaoC91XDg3XgiVY=;
        b=Ufj4i8ASEWL+vAa+rAN7Y7CaIZ9XioVkz76JeMV0taMffpeImSrR2mVrzTcXrlqgcf
         eCigW/mJH8sg2q6VckWAyOhDSJm/e39+/iMgIHcVs+xrEo6/2FUtXB6/HWwm2zbRXYcK
         DAmmtHcQ7Y2rzhNxx+suWWSKMt8SIvouHTCeTntxcJC9bXJMpNmD+eZpE6pON79IeL2w
         vENsTAn6E611fOFC+NyGNgSXy74k/2Roj+nTi3TZcV3RkqCnxTrAb/QtVZqTsfWdwAgT
         5X7p1kWu4K5n8ZPScvL8DnbzZraq9zdxuYTbDljC3Bn8Sp2B/PAQMzESRNB2xInx0l2a
         qe9Q==
X-Forwarded-Encrypted: i=1; AKwUvBw2yAtyCCfekEtmuQzRTu2VHiTnLQFDAnZtFebQa+4HyeQ9vHR+Yw0Mmth4yNsjLL7JnZhtCt1/Y7ty@vger.kernel.org
X-Gm-Message-State: AFuF++k8YfjIsLp2J4AMhQcKdZtNOA7sKiSQAy4b+UItt8RFQVTDEmMg
	iFicpHI2bhkAAr/IQfpzOCDTiBZYVh8y6wwXhz78D2e46Yn4ZZgnSyoDDJLPA9oPRQghYo4MIDn
	laa2GE+U2tpqPoJ/EL1eq/n0ayrPmKOCxVgzzuuuUSqS5mueluTSGMYnZ79w8HQaO
X-Gm-Gg: AYBFou0kDg5oxG0X92caYAQClkchkprLHo8nLKfa5hc9GAlRSjWCy404jusPL4bZWgY
	ZV+fHjuxCw9HPRS5IPGEGrJMGcULLLqt/Wqn325VPogn26UAw0GdufAniaRWvZSgUnM0ByvCl6x
	KhGDqJj5T9NlQ+x50+yhmYIrNJVRKI2Met886DPbEVATCLnOLsIYnorBBqYwOQ+Jq9BQd26tOO+
	0SUmZls0ZnPobbi8haLKykGtt6ovZMKAqcQDOwLl2qln8cyg3K3pztrjXQ0jd3XjSN5k3zuPz1Y
	m77i2ydaXOeCf6mIgB24APkrnu3Yw6mrrHN61co0cyheoTkihmXXLSSnWhreTI4s8XpB9Bozy9m
	mqbn6UV+H2Pv96wO3MPIhGQ==
X-Received: by 2002:a05:6122:e006:10b0:5c1:24b6:a1e0 with SMTP id 71dfb90a1353d-5c7d2832ab9mr519691e0c.3.1788356980631;
        Wed, 02 Sep 2026 06:49:40 -0700 (PDT)
X-Received: by 2002:a05:6122:e006:10b0:5c1:24b6:a1e0 with SMTP id 71dfb90a1353d-5c7d2832ab9mr519675e0c.3.1788356979816;
        Wed, 02 Sep 2026 06:49:39 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a34ad015d1sm5649791fa.22.2026.09.02.06.49.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 06:49:38 -0700 (PDT)
Message-ID: <fc81b75c-a76a-43db-877d-1eca69da2736@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 15:49:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8750: Add Lenovo Legion Y700
 Gen4
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260726143048.130116-1-mitltlatltl@gmail.com>
 <20260726143048.130116-3-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260726143048.130116-3-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEyMiBTYWx0ZWRfX3oxbekgBKYV7
 +ny5nBjxVOex8ECDo7j1Gp+En0LMoukSoq3ovA+UPZ96ZBmwlLag7yFoVkvpze/c1KdK03zi7Fu
 ddHHxfErjyieP6lpqjZdw9qNSuSuClJk4ST/qIp9J9Y9+ROemLnOHqByHxXF3esfmlmc8INiSoE
 kgaNduQUZAIwdNfwrQ5Ho56Ip3TeGwuzaeGFpV1dKtBuOJVRQs5TOYU0svlfRoQPRtzy0YYjxsa
 /F2cyEM+I4Dlw4e6XlVn4ddUNpwZs4f+IobEpbaKTAH+tlGBREYJqKr3ZSAbSXEmr8X+kpTGLl3
 46LjYLvxfr7kMJgQgmTDefoAkQ7C16Cz6E8u+4eqKshfaSoFqGvfmkZ2or0K9pNCUqunZpS9KTn
 JbAVCrRg2cYvA4gtoarkk3EvLQv+H9glFSWFRapYHBbxezpKz/xFMM9OyGk0ep6GTg/3Rx53eTh
 BGc275R7IpTSk5tWB1Q==
X-Proofpoint-GUID: 3XvIuLa8lRJhf0yXEbe5U10i0sh469v6
X-Authority-Analysis: v=2.4 cv=D8N37PRj c=1 sm=1 tr=0 ts=6a982975 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EiTzJyzHe8GYNTRMAEEA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: 3XvIuLa8lRJhf0yXEbe5U10i0sh469v6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEyMiBTYWx0ZWRfX10mIdAZ+DNzu
 5cBL/QFnysVqK5z+SR+C9Ww1L82CcE64Rp4K/7i5d2VdXKnZsmkf0UTY5cmHUyxYVGimfNH1wSG
 Owzaq/G6RbOQY5FywyK5UrFrRkrlFbk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020122

On 7/26/26 4:30 PM, Pengyu Luo wrote:
> Add an initial devicetree for the Lenovo Legion Y700 Gen4, which is
> based on sm8750-qrd.
> 
> Supported features:
> - Altmode
> - Backlight
> - Battery & Charge (Full speed)
> - Buttons
> - Framebuffer (Require mdss and dispcc to be disabled)
> - USB (Two ports)
> 
> Downstream supported features:
> - Display (8/10 bits) (Nowadays DPU driver is broken for dual dsi panel)
> - GPU
> - Touchscreen

This paragraph is wholly irrelevant given the tree this is targetting

[...]


> +&tlmm {
> +	/* For CDT: <32 3> <37 2> <77 1>; */

What's CDT in this context?

[...]

> +&usb {
> +	dr_mode = "otg";
> +	maximum-speed = "super-speed-plus-gen2x1";

Neither property should be necessary

> +
> +	status = "okay";
> +
> +	ports {
> +		/*
> +		 * USB2.0 is shared for two ports, set pinctrl eusb_mux_default
> +		 * to select the repeter. Plugging out one of them will reset
> +		 * the DWC3, which causes both of them to be disconnected.
> +		 */

Is there a hub inbetween? Or can you only use one port at once for data?

Konrad
