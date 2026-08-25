Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9341C3DEFF6
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 10:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787653523; cv=none; b=SNjaElhM6YsHsUkE6tsSy+cHt2hxc8p7ENB1FnbAPHyuQuFfTaM9ObzkX5raoFsCsArDk/XpynGfeLN8v2TO7UMUhrhlDtVBNoaEUEnWx0mZH+IE2QAks3n7Q9eHWU5ycrICww0QgbyJ96iiwDzjvYYdQvaFWDt7qF5x+Bgb+6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787653523; c=relaxed/simple;
	bh=d/RoLuRFayLi9UoBRJoBxc4vA8VoZRRtLYJcVqgyTbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ssxkoUue2PdHGBTuXiKYx7NMKru1VMYjslVmpywq1hF9oJglSTCaV3qCCT0aDdeTLojeYPDiYsbDUdFyhfJgnLE0eeYGTgZkYerwW2LUsBrsHLm2cx4hBcRs4rtw6XEfxWzhJFvpJUhlQO62uynn6BeZvdSrZvhNatBJDtQVq3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XJsM6pHG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KrTcljbo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XJsM6pHG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KrTcljbo"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88SpL1163468
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 10:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	whpYNNZ3AyrGkoJfj4x42qutanZCF6mqPfJykpEIqQs=; b=XJsM6pHGBLhhfBXL
	nxgNMvcQWVe5VXe3nItYIONQ1ncv0esVuhBZQcdxVqobeXmZ6+jRAVOVPZveTTU+
	qyJCrrPO9jIjT+KdlhtQSYQctKxmb4RiSlrwf+O+/3tEa4kkQhn9g24+DFCe5kgz
	nk8KIghsFtXvV6AwRykdlvS1qg2lCe1IPSKl7qOwyuao8G5hwoGmmILlQ3BDabgM
	zJZU2mD4hUKgw3b6pG1MO8nO/oj+LigAjrE8zvK71EltbuK6ag3ye8tTJzu4EHtq
	aCVcMCjU5ZOJBcmK4rBfHyIkxb82TGRDpg2wz4TrN5wKY7Bnse1mchqlV++08a3s
	jGm7PQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8y5jj88g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 10:25:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c9e97b626so8169561cf.1
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 03:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787653521; x=1788258321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=whpYNNZ3AyrGkoJfj4x42qutanZCF6mqPfJykpEIqQs=;
        b=KrTcljboH+255MqkbuyRHzkVlPhn/2FMYn4d3L3FSqMNJFstU6kXyQphFXTHaoQ+pZ
         Kc96f7hKWe4JiN34ilBpDCXHQ85eXM7IpHUmaiZ/O3yMPM0GA5/8lVBY5toYFPubLDu7
         W90IewaAEKBP4rqneJFlnPvqTbqUfxNVAVCCQ204l+H+Rn1jdsK/1FlfCx/SgAj6b9xB
         D60R7fGE93cLRqgrrPCLO/NkhIu8MBpfN+zYk4X/Ijh5jssAutkxc0YGw9I/smmPWb4v
         WCutLZCICBZ9ECl5OWTsz+MEpYkPR4tx1SRDGZqHcSD0i2YtjUlrcvnzjALFmj1wV0E1
         ZGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787653521; x=1788258321;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=whpYNNZ3AyrGkoJfj4x42qutanZCF6mqPfJykpEIqQs=;
        b=mChMb7ldIzPibN9pSv2/fOXBN5/8Yl6PmWu5Zk6+zyXrK1GkThBYHEazW3JjURhAcv
         zCHkBlTxEile09GDmyDap89YH64zuw2xKLDwdWfruC54POGNLssFJnJrQzv8cH+U8sG/
         QXy5AC0uWOxkN42+YvFG3max4UoYh3Z5dmeniQQwZX8tyLCr/PQW3tU7yNuKvM4Lvy4X
         acJpwTAuJyrJvw3BJHQlXGBvP5eLe+gXQqTzRuUuu0UBfnNdV4x+qoVSKVVCUOPKSwPd
         5ZYF/5boByMDJ9MNU9ptIiYkBrdc/IflMhZ9Z+YZ8KmLsG2t2bhw4WZWTjsQwLpPx9LY
         OdyA==
X-Gm-Message-State: AFuF++nmkLDV5YVZqQZqpx4O7GS2GBxulq0hiciaq4Bl9OS8W2Q0R83K
	DQi7lBwgm1N0Us4+vwjSAamlPKZx3FQe4pJ4k3+OKZe9XCYTN1GRGZFvhmi7vucNCyRBseaSJT8
	04pyXI+ON7vmRi5i2DjPdw2FQGFuobQ1lWKDS/t2nmt8WrLr4PJQ2srCY/OJZad1QdSKOvU7v
X-Gm-Gg: AR+sD12HmxGNbqhDpGfPEVRuElks0PExabA963ZRXShRd9eZOTA6ETrK3xj8UvelXJU
	lphUBSJgpV4uCwt4+sHhvZVZnGBQYY/4PTLFS2wbWWVwF/n68Z/RuhpzDD1wwGBNO951hbOZWn4
	EIUJkCV5ucDwRkZ8vmSNUzkBhXQv3aEdJkbwvN2gizQCkJPBk7FZ7ODYlIDuCL0bgSrBks9pOCH
	He/6XuULp2WwPzgIs8cl8lCOfRktW4mU1GG42n9h9bRL6Ay7O0X9fnamDMJ6tIhG9zzFUXlBOAW
	YLCv9gY/FRPZmFHkNgW0QwCpR5Zu5gRY0Vleos9OZDLIBGWKJJ32qBZxAno0ApA0KgqounQnSQ8
	uUslXMP4sAHN8skBkZZSRFru+
X-Received: by 2002:a05:622a:1ba3:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52df567630bmr245367291cf.1.1787653520560;
        Tue, 25 Aug 2026 03:25:20 -0700 (PDT)
X-Received: by 2002:a05:622a:1ba3:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52df567630bmr245366941cf.1.1787653520087;
        Tue, 25 Aug 2026 03:25:20 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1770215866b.17.2026.08.25.03.25.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 03:25:19 -0700 (PDT)
Message-ID: <d0360954-4811-40d9-bc01-b5061cf615fc@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 12:25:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: Add Retroid Pocket 6
To: webgeek1234@gmail.com, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260820-rp-qcs8550-v2-0-d4ce78fe9385@gmail.com>
 <20260820-rp-qcs8550-v2-3-d4ce78fe9385@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820-rp-qcs8550-v2-3-d4ce78fe9385@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O5QJeh9W c=1 sm=1 tr=0 ts=6a8d6d91 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=blwB5C5By4wrLRVlGroA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA4NyBTYWx0ZWRfX9CcLs8xCOvRF
 3Lz1/1uk0QAkYdIDeAF0AbgbOpi7AAYY0NrerwgTHSI6ghaibVw7cbmqtezB0vTVAfjm0kN0GDY
 Yx2R8DDjk6l4j3sEkfW8jBU2lMU4tFz5EB1EciCXm3FA0g8d8gOJtrooXLrq4DS1cphk1JV9YNt
 RH8VbDAoqAAAgH6MivXMNsfDhhLm4vAAKuBBXo7pghnW2sD490pI0JZOE0Gaf2yoXsZmo8DsSvX
 gRaEh1ekySP4Lpert8LM5iBAE2jMAS8W+WwvAMUEllFPjyEypeEUJVxnb41Ufo8xDyKbUETs22/
 HA6qzZXI2oQxRGq4dS3orV9UnX6G/cm5gBhkJUAmQylqDmg9z+jduqfimK5F1bqrb+OHVewzKSL
 kqwpLggzP2hDZI918zijvCG6J9RxFasegL68jPYnVmwrHj157aEhmQI8j0FJDtz0P1CKIP3aWl3
 6mYv/0VQUXkQR9Vbe5w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA4NyBTYWx0ZWRfXxnBNsyT8Crui
 J99luI51KM7D04624a+/GIARaTX4iKX9xsXtPo6G1Hf5zQ/O2OAdESQsV4EUKpCIjxMPGW5z44Y
 R/pZx7/DJwuIucu/WZExv4WIwpVYPSU=
X-Proofpoint-GUID: 4HZIBYFxPZACVhEUTvt_fp0Fa21LIk6t
X-Proofpoint-ORIG-GUID: 4HZIBYFxPZACVhEUTvt_fp0Fa21LIk6t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250087

On 8/21/26 5:30 AM, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> The Retroid Pocket 6 is a high-performance Android-based handheld gaming
> console powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring a
> 5.5-inch AMOLED touchscreen.

[...]

> +&{/} {
> +	model = "Retroid Pocket 6";
> +	compatible = "retroidpocket,rp6", "qcom,qcs8550", "qcom,sm8550";
> +
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pmk8550_pwm 0 860000>;
> +		brightness-levels = <1023 0>;
> +		num-interpolated-steps = <1023>;
> +		default-brightness-level = <600>;
> +		power-supply = <&vph_pwr>;
> +		enable-gpios = <&pmk8550_gpios 5 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&pwm_backlight_default>;
> +		pinctrl-names = "default";
> +
> +		status = "okay";

Nodes are enabled by default unless explicitly disabled

Konrad
