Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794307152;
	b=j8bkDtA0TkVDByVThYbIXB1FXaaDeHM++w/v4/qWsa9nCgAI91uVqgJhdM+ukBbmiKBd
	 gEED/0I1atpHYeMQ0BrqIscZ/BlxHdg9OZLFQvm0lqcPaIZGP478t20m8oCJDjpLaUwog
	 ydF/4ywUcXjtYX8qvAUuHvhCfs326suxIX3EfVroA+GCv9ycLyAkQhzym4b5RLH7sSOrx
	 TFGEqOorNuQTsiXpVfqMYHbQuFoGNEtxE7qtpmRXfVCyxMH51aVbHUwNhkqmhq5u0Z7v3
	 ifPAA+hTmPidCNCmsU0Dg+aLV/TruoswMGaRxkJY43Ygc6hsBiGF/s6sWikRR/B1X9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307152;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZG386YuIEJ6iBTpDnR8DFXW4CBJWh4A+gyfmdTuSbgg=;
	b=F5No2KLa29vpjoH2KYXC3Oth48UeIhYEdIqWuqiVw0jCdr7mJhz4DmwaPq/fFwpdBIk3
	 UW19Rzx321eskwxIX7KnVgK+AULjpGzg6tL5bf7ET1mdUFKrGhu5TAK7W66J/wLzMVyQ+
	 pNTplPAtchUPssLGFFWl9xdp84Vt3ATZuqwbi59JEXzi/k3GVgvlZSJ5UPImIxdAgZCzp
	 rjMBC+PB3KGSrOSLiej/qL102O8Cxe+km707uH9kVlpb2fu9IDylhT+imrNShoPBgAYK0
	 oFsIC84ZrYWOohepCzTihyojmIjZBLgB7u+D1WJtd7B9YhZDJ8XwHb+cl266eQBHJMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="WsYM/0i0";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S8Avzhk8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B020B60A2601
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 10:39:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B020B60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WsYM/0i0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S8Avzhk8
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA8Z6Dg3849692
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 10:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZG386YuIEJ6iBTpDnR8DFXW4CBJWh4A+gyfmdTuSbgg=; b=WsYM/0i0nj6QVCNB
	LD+5ZXziGhs5DAXhRYtHyjhlhZn8/Gn2PQVVq6e6pDhepOv/Grzj/YaGYZZgzzYQ
	lsVoEtwjT8+/asdkQZ9DH+hD2KbDaXtyIIhFnQnhEMIdm8RVqSvh9CYYDKF9MoAB
	hGA2a0ugeA+7XaweJmxcumOyUKupX6b8wh5dKzKUCGhAgeQPhjDutaBaAUz9IoZK
	2zqxKbdlGREPrWUhXrIeLYCrAvSkpBFrMh8vlJXA/Zy6G1j0CqpNOlMCZN6y4oG+
	9hBEnroL8BeKOstRhhBrnVqxbrthJ3Oxs2uOfI39c3DWq2l5r67Oiyw8hoatb8pN
	dO17iA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyvwgedu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 10:39:10 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3944729eec.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 02:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794307150; x=1794911950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZG386YuIEJ6iBTpDnR8DFXW4CBJWh4A+gyfmdTuSbgg=;
        b=S8Avzhk8BQhS4V86f2YKIuF0MCy4TSBwVJHNILESf7NgW0w4h8hLRk2/UvhjKCoL6w
         wdC4NFyI5Sl5F4FCO1zZt1JK+9ccKNiXDmDcEWTQ2xAcUAgqbH8WyVJx07s6mZhIgv/e
         CR35LwYczwc8MXQtswGy7WwSHeEfF5tWP3B8djCC05wWsdgrK1rckmW68kTjABDW9W/q
         mc6nAl39IoXEd7Bzk1Y7A80MDNk3FPHL8ihMvh+NVOWntzu4XZzj/RfDorhLKS6eX+4J
         cSHQR+tEbfg4165AtzxspCll20XlQMYoEKilvNgfduaqpwmfltGjqZ7N5CYnUbra3sGw
         IkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794307150; x=1794911950;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZG386YuIEJ6iBTpDnR8DFXW4CBJWh4A+gyfmdTuSbgg=;
        b=XS3ybCCFGwN8mLbTPfEhcmi2worM+KWG+gM6lsEGgFBMHYjyrGDo13Rzb9J2ZmYRkJ
         tNIZAsTTVMHii9OgCu27cSfZIGhosec4nzSQJMkYxM4mV8BriXcmE6NABo9yaMlmJaJV
         zxm5eP8uhKEbQUF0tQn58bgHObE8i+Y8hyVUZtePT9MiGyqHm6x+hyraDZqT1BGbGIsq
         EFGzMjfxmTlYdeNxhDuhA0C5976/owgB9plLOEJBTBpJeuMwhGm3mh+YWHaTcdD4mWQA
         d4XOG1zpzSJXzA5epz/wy+p6IefyuuiVIAH7+SMTNlWTLHsKFJUW6dMSdd2BkzFxyZ2Y
         w/bw==
X-Forwarded-Encrypted: i=1; AL+hErF3rBJ+aX8s/4SJBG+xxck4ZQjeQrXSRsa385nuJyIQNekVwtT7duF1CEZLmJ1HgnSTyJ9ZaaYeTfLU@vger.kernel.org
X-Gm-Message-State: APuU4Z9q2ZGrPKhUNaCGl5jlbJR/4kFzhkgUWMqrlFqseI6U6GfNI+if
	5LnP2s3qcpSmy4lqEvwjRwBvELf1Ou8KzqGDFHc+ae/I+EvMO+jonAjHkD6qIuIMUf8sldrltL/
	IWiXIjtsxWRDA8Jzc0aEYgHtM1UTZLTmsgTnweNAHKPH1s0wedzWaDVAhSefpUVwc
X-Gm-Gg: AYBFou0xv4iwlfYUcTFd+L26u9pWU+3HeEWMrFFyPm1v6paawAqM1crcOoLEKUg/NjS
	pOgqE8EB+epeFia4sXte+mFejZdqB0pXTtHBs2DPQI1PaMU8p3PK+1XABBAhwklyadHEy7WsasO
	E2QCWjFQXHSSel3jKiYQFK63obeAA7K4zMLitouXtr6TQPhTy90OtiCXf/oZKxA9GtJE0jpP7wM
	3CyGOBCHiXTbmIqXTehYzPNTqJ2z1eRZnzyQU7pWIb7zGNbcHuDOkhej8j0LJj1Pnija3GY5w+r
	JQakNeAoXvoiEp2QWVQd8YVn+VT1+b7Ie1Yk8+ILEMe8rDYb2WN8m5OTuOHu2ZM3XGBnpm5kuwd
	AeqCsX1rXIWhyIzsqB/95hqBJ7oJQd/dow9xs+jgxm8Hh51NUFiJX1GkAPPxIz9TJXhW83DH1sk
	V/wIFXng==
X-Received: by 2002:a05:7301:4d05:b0:36f:14ef:ad08 with SMTP id 5a478bee46e88-3751e6ae405mr2608449eec.9.1794307150116;
        Tue, 10 Nov 2026 02:39:10 -0800 (PST)
X-Received: by 2002:a05:7301:4d05:b0:36f:14ef:ad08 with SMTP id 5a478bee46e88-3751e6ae405mr2608420eec.9.1794307149455;
        Tue, 10 Nov 2026 02:39:09 -0800 (PST)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9d78sm6411676eec.25.2026.11.10.02.39.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 02:39:08 -0800 (PST)
Message-ID: <69573381-2c8e-4744-bcad-0165de4b1406@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 16:09:03 +0530
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
Subject: Re: [PATCH v13 0/2] Add LPASS VA CSR HeartBeat pulse clock support
To: sarath.ganapathiraju@oss.qualcomm.com, andersson@kernel.org,
        abelvesa@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srinivas.kandagatla@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261105-master-v13-0-dbb43cdc60e5@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20261105-master-v13-0-dbb43cdc60e5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vMug5AuiE9XieefTGdvXEVP6fdiWq0Hj
X-Proofpoint-ORIG-GUID: vMug5AuiE9XieefTGdvXEVP6fdiWq0Hj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0MiBTYWx0ZWRfX9OOMpHskNDd2
 Ot5hYmRsdhwUvXP/RHvNv/fvOg2LqvvpYKmpo9oLz2plpEoyHqmCBsWgMljozStFqoAyTnIw0mF
 9r/vzPC1nU7mrFKqJqLZhChDPXLYbo0=
X-Authority-Analysis: v=2.4 cv=NNpAaE6g c=1 sm=1 tr=0 ts=6af2f44e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=4tIis3KsY0wH9TNJrrgA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0MiBTYWx0ZWRfX+iezsf6dzRk1
 2PnrgDpI5Ers0sPo4lOsS/biuHq8Ew+BNK/hvziAQB+KewcwF17Z1iG7byOvFI//8FuQBelv8qI
 ClJvrZmEez6SxjsmwsGfhLB8Vh3AiqAbVU1DErbrlxS9CYQ3rkfxY6CZgxAhsyzGGEJjv42Ltux
 vlQ4iXfjxwOpsN42zBrKf4xk48hdL2ZrZsbBygMgE0UWHb/Q1zvICH4oYYnPJQ1Dee4acGI3DNe
 6kf3oxDYmgcvpnVTuHMBVGYVKz/fbnNUEtYZLFz4gt4mwof/NcGqZ06+6adluIGWtA64Pj9GTLE
 1Qqd1COTv8w6oKnSk7Clr4Qd/Ms+/TUL6nwZu1qquI21IF1l9IPRHv/P1Hoa1rmLXUN4Kn8d7St
 a42stz55Mkc5PbjJ+uGy+a/doivZ4Ccrf5xiXLudqqKuyXzDjpr+P6ExY2boAXlVTwL06NAEOBM
 UAYiYcZpXsrpHxxooJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100042

> - Split the qcom,lpass-va-csr and qcom,lpass-va-macro bindings into
>    separate patches.
>
> Changes in v1:
> - Initial version
>
> Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> ---
> Sarath Ganapathiraju (2):
>        dt-bindings: clock: qcom: Add LPASS VA CSR HeartBeat pulse clock
>        clk: qcom: Add LPASS VA CSR heartbeat pulse clock
>
>   .../bindings/clock/qcom,hawi-lpass-va-csr.yaml     |  62 ++++++
>   drivers/clk/qcom/Kconfig                           |  15 ++
>   drivers/clk/qcom/Makefile                          |   1 +
>   drivers/clk/qcom/lpass-va-csr.c                    | 210 +++++++++++++++++++++
>   4 files changed, 288 insertions(+)
> ---
> base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
> change-id: 20260917-master-6c2778f57a9a
>
> Best regards,
> --
> Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>


Reviewed-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>
Tested-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>

Thanks,
Prasad

