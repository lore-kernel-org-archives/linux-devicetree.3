Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098718;
	b=Nxh6JwLPBZh+WAZVvCtql6Mbg7efzGHwgoVX6fdje8ASMoa+fXX8ww9alHkGVIgeHYoX
	 mCQf1F6ggEqkTIVPabWXx7uMV9g8Vcq2AvbwZk0H/agQo9HjxlJWy84YLC1qQX+32DvCa
	 n4p779EItEwXtCxNW/dW1ycAQSryDOeN+Bdximu8spYD18CDCuUWfbjsrBZC2KAf5cmDX
	 GOUuOTrtfVYoqWy4AP55j3BjbX2lTtM569MhQsph3lR+OEHqEbB8GByTSDWcZK1Myu0Vv
	 I2q9kdyPa7Jr1Nh9BZgo+8NQlYHUvcrdhT5SAyZPuGIO+Ykp2QmEob/mu8z6l/uDidA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098718;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5EcasOAWbOKIUjjsy8ENhgR4jVwsHVMq/E+4MI5OtqI=;
	b=LCE/2ZNBHa4zZE6aVjSXGc2LRNkLhIGTJU5xJTinNQny79H7pyEWCVLag6yTvpYKuccF
	 diYkCuTXE6/S60RO+11B8WwTqi5F9CjBgVV9ZbRE1Rb3U5kYliB2IK61PBUIfXUKvD0qh
	 P0DdykQorg8knMNgju7stFEn7qhdnDVWw8hWVhs/k/423kS5AxbJ2Ujh1gdOYuiBmOTVx
	 7WbcSjWpKPVBs2F5Xk0SuQA1yMT0jM6URArO+78t9KafouXQAOBUUu3hBmczbkKSVmBAV
	 yJqZDZhaaydWK61ElZVHByidW3blj1pGyPCfCPhKtVseaSuOrNPcUmz1UajIHF+bi/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="oJZoJ0/9";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j62+lRRf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A64A606A323
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A64A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oJZoJ0/9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j62+lRRf
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeB1l3011975
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:58:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5EcasOAWbOKIUjjsy8ENhgR4jVwsHVMq/E+4MI5OtqI=; b=oJZoJ0/9L2pXvJCh
	+AVIw8DAlppSxDwqHmA+ztXhBrZicpi90xg0i4uVbavLGD4TxqfW4/8pnYY3uoLE
	5TP82RxR+ZdichJeAgtBHVgVVdPwmXGyAS/pnUYqaomZ6IifePzOnCZbZRUg3XNe
	BCmBU8fy1eqcFAxQJiHEF+L7WNzkD8Zlht1A5g4QCt7LAG8rnuk9D3ZttRD3x/hT
	uafdrht6QPuzHefl4I+tYtfovrcJ7XuYWfnNwZpjQk1s5jC+SXeh1f36cnBCBO+I
	LWTS6Uu1Od1RU+YjJTHo6AxspH1gZJxt+EyxXgUGQ+7YzUlFsgQDzuO4yoROlBo1
	p8fCng==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3danpd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:58:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-536540909e5so15744311cf.2
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 03:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793098715; x=1793703515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5EcasOAWbOKIUjjsy8ENhgR4jVwsHVMq/E+4MI5OtqI=;
        b=j62+lRRf67E/I/kvV45GEqo7UbYZ5EQ3iIjvRBxWGUuwEO0hEb8mmr+Aw0VOBoOYqy
         X6hbYf5m+7hoh55IaSidr6Tln0vtW10mr2D1f/FzatnQX4tC5PSKXtgZbluLVIBLd8SS
         3TgoED9ikyrdPZRkNe2QinS2wIX1Bm8KdeQGknHNmd/ncKT01NtgO1GcF7qkKURqWj0K
         b2xICjV/TZW0BfIvrzClhie4WPw0bBj6RbX/V7TRKHB7+vc24jloZxCM2SDX5Z3nhxqM
         JUN0zFwbI39rBQRWYuQvyXq27fn1SCrNKZhBK13YmKYo7B9RviStHV3Tq0CuYNMybxUu
         7GbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098715; x=1793703515;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5EcasOAWbOKIUjjsy8ENhgR4jVwsHVMq/E+4MI5OtqI=;
        b=tRtl2pDxQd5amAzGSVJwIARmQ2QhEdMcuA8IRAexeQkrmSCZhFnab2feSm1Dx2gmFs
         5z8jWQshOz4kR5VwSSYsuentutcwuu/I9L97D2pDFVoNmfmOKCJ7QR1EduoG7l9L/U8V
         tQ44hclzN9zeale6Yrnf1CLm7dtokwpoe8TYe18o3pJkRJdTT3qgUYTptafJQNETmDUC
         POA94PRAe9K6jA3bWX0+KI/q+7ff714e/Dqur4FWSTFAr+TtV5FuksLyXOY4M/OAplwx
         mYwD9EXdgDxkhh143AkMIgRPbJM5TE4OJfiBIfW/Ma781j88zxhL9AH4lZtlbDWse+Ns
         Bu4A==
X-Forwarded-Encrypted: i=1; AKwUvBwdk4+x3Iqt9nGT1M0rHg3+yGJOkIpqiiwWgMPgZskWOMvDheebq6MIGU0GosT+rjDyn6a2kzlyCR3Y@vger.kernel.org
X-Gm-Message-State: AFq9FYIw9fjK4024ZSciHOMI7MZDJ2c1H6a+DCZOde4t2WQjUCdZEy/C
	7pzJZpAlzbqpue1B1ng3hPsOSrcIEqJ8WqVZ/r5xJeAPbrhPYoAKioelssZ+x6mBnoYOlzVsHYB
	o5hdWCBGbdWjVHK17bFxowHpLpkBx2fPnrrcCeP1D1Eh+zHY1L7JgYvf4UaR4rSMT
X-Gm-Gg: AYBFou07+X/zYr9y7TYFUNlO8+agRteg2KYEts9bapvJkucbQlPxDZI4tpZMMuM6dJN
	N0YtQgV1+f5Ma+Ip8Hlpo+NIJ471/NukNl2dFaZPJo8spDgDIG45LZwiRNkfEvmx+CmU1R5FwGg
	aoydiLX5GDpFZRUlldFfPl2sblrPhhe0A5mR8+0eJcvQqIs3Vgumgf6i8YSPfX7+DtPEOnaBhlM
	mJa8yWwFxFWm447pHpRR5NUMVVNMPBRESbT6D/5F2e3Hqg7kofwFeja8GQme/sQrmqTjhWT/cwm
	doL9LsUucGueq3WEdkFKbm0uvQTdbWVSYCQzFr0Qh/z0+C97pdEUxAAY0NessNoMdo+bFG42n6b
	jQJGsrdyBlQmy3IjPMQMTkQ==
X-Received: by 2002:a05:622a:e0ca:20b0:538:40e2:bba3 with SMTP id d75a77b69052e-53840e30413mr134148731cf.0.1793098715625;
        Tue, 27 Oct 2026 03:58:35 -0700 (PDT)
X-Received: by 2002:a05:622a:e0ca:20b0:538:40e2:bba3 with SMTP id d75a77b69052e-53840e30413mr134148481cf.0.1793098715166;
        Tue, 27 Oct 2026 03:58:35 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7975b2sm438661566b.73.2026.10.27.03.58.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 03:58:34 -0700 (PDT)
Message-ID: <a0f82960-be24-4d57-b12a-b6f5078ac64d@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:58:31 +0100
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
Subject: Re: [PATCH v2 1/4] clk: qcom: ipq-cmn-pll: Correct IPQ8074 NSS NoC
 rate
To: Robert Marko <robimarko@gmail.com>, andersson@kernel.org,
        abelvesa@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, ansuelsmth@gmail.com, john@phrozen.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261026120920.1667982-1-robimarko@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261026120920.1667982-1-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX2AH8Y9U1I02l
 xtVrIQCI6AuNYF8Mq7XUqcUyweVLbjmfI/zQh2voF3/AsSBDhK5va1CpwJOdVex2/SmtaQgFUdD
 xpn8zUpJAO6VQm4kL4zgHDvGzq3ZaNg=
X-Proofpoint-GUID: Vq0lMa90630yPiYGuIMxXPNOX31rbQJW
X-Proofpoint-ORIG-GUID: Vq0lMa90630yPiYGuIMxXPNOX31rbQJW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfXzWkTdhzTMcAn
 iGG/2WvFVPY1e8kuudD29NSVxyQTO9q+zEPVclleNbmLPI1XAUGtfW2+Bb/OMdP8+YanpFSCOX6
 NoU9IE1aX/rpZrCtjUH6TtG8h4Kj9Vxm4wQCYtsk9/uGBCvGcjusr8/44Rz8+n1eUxRLgGFFcst
 ID6NBpixPSAgoFo3O9MM2sfh7JUJYvJYpqBRQfcJy0c0UT85izWF5euN8gvdoapa3WXN5Q2Oqae
 cUUJ9VDPDIpkMS7AgQR2NN2abSJv9ganqc5+cSvVtmPOyuswtQmm63Slp02ILbwWfTNSazS6zaz
 7QC9MXoqx/0yW8idD8eK1QqfeaoYfkfK/hrxCxmgLmtb9bQrYyl2nExXFB8jBi5iGczq8k/6qYN
 Cfskjt/9/iNahqiFAljEkQISrNgWMSvVaa6PJHnHzkAF9tIHf808+1whuqE1DkpcBIDa0tuU1L3
 Z1SaMU7i/Iy1civ1T1g==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6ae083dc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=tfqOdNywceuasvfARf4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270043

On 10/26/26 1:08 PM, Robert Marko wrote:
> The IPQ8074 NSS NoC bias output feeds the GCC NSS NoC clock without
> a divider.
> 
> GCC and SSDK (Qualcomm vendor switch driver from SDK) both configure that
> clock for 461.5 MHz, while the CMN PLL driver reports its parent at
> 416.5 MHz.
> 
> Report the 461.5 MHz output rate so consumers see the correct rate.
> 
> Fixes: 4e36f8ab45c4 ("clk: qcom: ipq-cmn-pll: Add IPQ8074 SoC support")
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
