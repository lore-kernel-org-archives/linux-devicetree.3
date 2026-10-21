Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575217;
	b=YYdMiTPCap/7DMkJsky8v///kLScH/3wzahyJmVIPiv5sW9mIPhyZR49P/6WUxcMAe5J
	 Lp4AqQagjhEcrr2jDgo0nOccVg1xsdeeEPIJiADF6F4OaBa/vo3Gy/fsIuS6G4n1EZcQc
	 wlJB+JCOlvwwaVYd/aKh3FC8qptSzSW0ob0JGoHjfHv9IB5JT2o+1jU7llSst/kRIuK+w
	 0YEzEbU0ao88ZL1k1yPerzKcBiChpHltHoBmqi9FtrVpp50kJ8vHHGbOOFTfp4VlC5F/T
	 yzUsTjY/yi1q17rC4qXcNmPanA+gCkzf4pZNMdgPM/GHG7HO1Gon+utYK5DurfVOWkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575217;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UOxlMxCeeV3aWc5tsW//V2qhk9/BquEemWrF1Xo4tEg=;
	b=rHLjTco6E72bL9S9A580yFP5sCJ8n+KmACvIHLIb1yYOX98FqynrkPaDGwAGSfWJux4w
	 DrWESD5XEVQSa8BtYDz3AkO10nqk7pFdKd8zyyL9l9JrW9uaWTNUPOJseE/IEMZZB5Sls
	 kcya4Vt0/og51LY7lqm6XAK/5QONZPvKQqFBetpW2ncyK33i13jtkilH/O73Yj8teB+Rv
	 a7yjYqsjFTBG7NwusHuikWOI8cgdd9+yOreqm7sg0ftsZAWAhkykaEAFnm42hGTi9pfKu
	 uetqlUGqsdi8kcMBkAqgJRPnZ6/jQInAYwli0+hRmbBdNKBolG4CveT/Loo/rDxgrmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AUfvKoYY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hamLPNm6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4AF606A31E
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C4AF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AUfvKoYY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hamLPNm6
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L9UrH9203642
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UOxlMxCeeV3aWc5tsW//V2qhk9/BquEemWrF1Xo4tEg=; b=AUfvKoYYLuz/RiNj
	fU1JeE0ZX3dBvp0QOJ7aTeCslxnRypJW4z6rhGnRLYP2bfK8vtNbjBTJCuM6SACE
	MnRhIVpcac5AWC1PgE+1g2C6zPeQE+88VI/LYGT4CayKD5STdtkD4njtw9bLrmK2
	1Rv9En7HIksLlJmW8v2gwM5TOYlLpLAxserJsFppAktX5LlPcRjQ0VMFBzHe9IFR
	VyAMqD6wkbXQ+YGTm1PDgMyBbkkEDmgULpd5qEb+fKu8g9x7QOXtuV0W9+o97nNC
	qkmHMBdTjp5jwdekhrgcLBYGKkxCFq95Fvb6n67X7NGtyzMoTPMW+6w1xJF9LzWX
	/sgpyQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r2c5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:33:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea8a9cfe6so15131585a.2
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 02:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792575210; x=1793180010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UOxlMxCeeV3aWc5tsW//V2qhk9/BquEemWrF1Xo4tEg=;
        b=hamLPNm6h5U7OYSHnmXUcCqCWM3/B61WoKwDjGqpXpOx7+3PNTxh/DKJ7ariZUMwDU
         FqGKi/BF+5oGYa3S1XRPezVwFKUnsbjE+3KRUyBqHk0b0HIqV9L7R82YzhLqUIigogaH
         n6M/J+yMD3ff0qStBUSfvuf6NzhKnLYBlVL7CW6Pq0tX4ODyj/iDrXaMCAy3B71HXWSN
         07OcH5Eps3A59vEyy/RVIJu8TBKcCIg2XWU3DElLM/xpsb88Mh7Eyt8+/YtwV2n8pJoa
         bzYN2vVejuZWtumXxz3fiMkjMlXk2kMCdPZ0ryoupakCieTe99HAZWncPyCTzAbUqjvd
         b7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575210; x=1793180010;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UOxlMxCeeV3aWc5tsW//V2qhk9/BquEemWrF1Xo4tEg=;
        b=A5tTKVzfqK7DhB92yF8y9p0uwOU5Fu5w99qoPFduwnivvk9VVOaW1O6WS6z6D9DhvY
         LjxidhjKJCBZ8W4Qu+doX9gUccjSgnyRfnFctsgWvPpaAi8KECTsNnlbhL+qwBwBJhfi
         HH7AoZWXJSYwMW9rNo0OS39cq51v4gdgNQGFcVTvjsRhXxz/HbbdovxIO66+XSL3tKQA
         JSL5ikLGDvFNdso1jQZ2TOUNwJKVMW17L0NqS/e+Rjkaxdhe/ytmDT+JQz+6u4kKb54f
         5ZHcNzhh3n36BBSJ80QquyUkmOhp345LdBqD25lcs94oUCISyWqsdxNfa+7zT2kHLq6e
         7EsA==
X-Forwarded-Encrypted: i=1; AKwUvBxpHFubRpeCHfCZTw7B2SBdeXbtEfaoQBUf/RqE7kyyjh7PX11wNw2PpCobG6yEtZeQOprbwMItEL0P@vger.kernel.org
X-Gm-Message-State: AFq9FYLqXpvPIln4Zc9LLe+9aub/1P5UqVJc3d3vIE+3VG8QhPvqa63v
	JtW/vQHFnE45DeyGZ0yKc614jNJX16W1+wm9HNtbh++cr0sN3VecXpUSesrHdhYWQ4E8f+uspKB
	eYNZkIV7YVzOLKgeWI4TXgr5lcAAGJyfpDMjruFZM/pXv8yzYo1bAgxPf19PODYwp
X-Gm-Gg: AYBFou2dgD80ZFjphEh/gbrt+8wEVnAXyvdSfRSXOe1hdFkJs5AXszkMA52o+2PcRjC
	yu8efW3/KQfqGDsYgQAu9JprUKkRb2Lu1TxmkbBhf+6Cg02vsQz8YEhxzVlqC021/pMHFO45p2G
	dMYqP0vDaON5Xn+pzyAw0XVXO0t1uJDV6JJ1oHgSP8IBxm6vLVyzegkPU86DqNkOn9n8RNbuNTj
	kS8571Z/capTJSVWGWyBl9bdCHBV/8sDuY4NnZBjmWiIgmrP9H/KhWZgSM9eRt47J9VO3qnzknp
	SOWIHLRe7IQ0sSoMSU6LTEpoMykGJkb5xNRYGbB7lBkUn2SuuA9JGXeWg8F3yLFAi1u+eRNyZd6
	0hIrcL++cW4hPxKUC17b7GQ==
X-Received: by 2002:ac8:5f83:0:b0:536:27d7:abee with SMTP id d75a77b69052e-5369b4fd888mr26713251cf.2.1792575210504;
        Wed, 21 Oct 2026 02:33:30 -0700 (PDT)
X-Received: by 2002:ac8:5f83:0:b0:536:27d7:abee with SMTP id d75a77b69052e-5369b4fd888mr26712901cf.2.1792575210042;
        Wed, 21 Oct 2026 02:33:30 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4679037543sm59783766b.85.2026.10.21.02.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:33:29 -0700 (PDT)
Message-ID: <9981a633-4788-4b7c-975a-77c3a57c0352@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:33:25 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-google: Configure qup_i2c2 pins
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Joel Selvaraj <foss@joelselvaraj.com>, Vinod Koul <vkoul@kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Marco Mattiolo <marco.mattiolo@hotmail.it>
References: <20261016-pixel3-i2c2-fix-v1-1-6a527d52c865@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-pixel3-i2c2-fix-v1-1-6a527d52c865@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad886eb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=vbdGY0My6zaIDZyNjYwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Jo5ePM69rnRlqRnpG1iek1urDqweypop
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX9Li6yaGVe1rv
 uUuAHtTTg8JPAZohBfse6T56BoM1Tfeisj4aCRA5FGYcDHc6pEVdv4HH3uyYHK+FCX9xQDqODbV
 xNJXvGPd2Et+yme4hiPzCRTO6jnOSdVlSLTa9FlFSIBU+PiowHL/e67a2x0rs5tCbHI3y8JnR3h
 IFyeP/MY4/29Y6/LLanXijJkI/r2LXVluOJdQKTCatjz4QzRig8QwVnZhCqvtak884p/dM4VNtc
 LmREB01PqdTMTsQ588yCZo2zhqeCjn2rGXHO+f/ezosBGuWA03ohuA9IJ90pz5zHewDLmH29nQM
 639EEQvBVNIyK2C7aKxl2jXmZjew1SO+jAzk0DwTzxubq5H3YyA7ymiPY4z8hYew7VhITDw8URT
 h/+BvqXGi2uY8U+6pKuvig6Wl4AghRRPnuZVN+Hojqt5AQ12+wTSTL5LET7qw0k627HSexJu02m
 IhD6wg3UrB27WuYPIow==
X-Proofpoint-GUID: Jo5ePM69rnRlqRnpG1iek1urDqweypop
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfXzYDRtZiQLCB0
 p+odiy/ymtvjeFrG8/VPnks/laI1WhB72XJ5CVWoPOZ3ZZq4Koh0wkvan5u+JjZqeO8JcMaJICG
 UretJQC4IGmnFu+Y0pFLTsx/1xNoGa0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210037

On 10/16/26 9:37 PM, David Heidelberg via B4 Relay wrote:
> From: Marco Mattiolo <marco.mattiolo@hotmail.it>
> 
> Set drive strength and disable the pull on the touchscreen i2c pins by
> amending the qup_i2c2_default state from sdm845.dtsi, as the other QUP
> users on this board do, and drop the unused touchscreen_i2c_pins state
> that duplicated the pins with the gpio function.
> 
> Fixes: a678adbf2d22 ("arm64: dts: qcom: Add support for Pixel 3 and Pixel 3 XL")
> Suggested-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Marco Mattiolo <marco.mattiolo@hotmail.it>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
