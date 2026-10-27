Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100056;
	b=ZcOEa3yLIId8LyP9RVuUzjF8geV5yDws26AGXy5gldXfMNewzGhJajdkFHZTx5oAhDyK
	 j962tPkhMVQgGCgkkIbH/x8e/YKS2TxKOO5x1csAwSbtnn5/K4cSYBBnKE7g9pmHGwAeW
	 VPGF9Bzv8+XsjeZEVg13SyqQnlmSUM5dRKP0/ZQyZFlRjRZb/PCDk3RuzpJxPBdeRZ65t
	 81v+01qP8lfUiT7J2NxFSOQqqCwUMmeWZmFjuATWFXubjhZL0bVXYLIuOLWjv3mlaR8Tc
	 VBxQEP6XgRWHZTOdcKCE17WH1z8PgJ6F7KrtBT+QHel7hgtq3w5K/4Vh2pWZB5jKBgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100056;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1kMGzQ7umpbZhrvqiHmJPKy9EhW/4CQ2ThLKi6xfv20=;
	b=0kq3MXjIlhoR8wDF01ss7hIcgZ97K0mmXXsaoxCe1D/mLS8Hs2cC8ELmVUhx8hvL4dBX
	 4iYTs/zZUkgZDGaAzvYxh6WiMAsYbzlBG6Bea3YNGsRANbZg42pyoRNWNAWqjBum8BIUw
	 Vb+RkMiMZfxst+DWM6CgExQawx76RM8tCJjO3yZbVRpTgEEULsNgn5iw+NxnNBbs2f+3B
	 A+FP2YiZNvbNHss9a+RBBZXIAxLyppql/tkUktyo5Qfi7F+TeROcyTf5rsut8/xcxD9/7
	 aEJg4J6oKjMVHGLeQ+Degw24VPOktC2ZhWdfYON9jxtR+0DCAUQnMO2g1kaexJZSg5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GydBJZbE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B3m+aza0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1C6606A31A
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B1C6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GydBJZbE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B3m+aza0
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeCJw3026391
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:20:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1kMGzQ7umpbZhrvqiHmJPKy9EhW/4CQ2ThLKi6xfv20=; b=GydBJZbEq4BUfEnm
	PuKstUjmpe7qii4HSSwD6luUGWze4l/IyQfFwPDhUncUKJNQfxWEnf4MjtAD2mGq
	Vhc4xGQetu0KXr/r2fNtgXSZ6WdQIeLVP7QvJo07XVqelpC229FZjBmMohnN00XQ
	umd3jtEIh4/DNYTOHPZpazWXc+C0+1c+nEL2W/llxcgsDyvy2hov77yHft1OWkLm
	RQUuZW7lxN7TdlT7uyOgvaUMNMa3KlBviM0yIUzGuKTfNMz/bfe/ANM0Fn5MHrdo
	oTautnUOF84EuKPtJwFZWHrGvYkqD9CLKtPmPCICvxYonzX7YPl+b/sSWxO4Vitm
	9fRDOQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh91a6e3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:20:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-536708d1a3eso15740601cf.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100054; x=1793704854; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1kMGzQ7umpbZhrvqiHmJPKy9EhW/4CQ2ThLKi6xfv20=;
        b=B3m+aza0r70wxN9PQnFJIUAtmhTCISIzE5yL7ARzvOGZNe0k3SeL5BM4K1TXB452of
         bL86Op9uxMIRpaFzNuXArwmrM5xeXxbQo5bGWKTZVbrTBFsbiWwtsK0g//69BBquk+nI
         7VKcg5tVbfOvHdqRIso5rBT/6eLJezZOtA16BuCHbleN5WabR4Gmd0mekK89QLDfXNFJ
         J+uZ9BcW5bE4YozrUDx1iPJ8WYab8mdRhel1qMc7mAjCxQzHakLsSkvXXbODVsyas1WH
         othj2/0Hp7iy2ObCeIwSiH6JWWkSNwJE6wQVrVv95R7F2HQv5QpRxW68IX50GpaNDlCH
         HBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100054; x=1793704854;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1kMGzQ7umpbZhrvqiHmJPKy9EhW/4CQ2ThLKi6xfv20=;
        b=nK1MDK6hFY4AS5BtZetI+xjVnvPVogKkZoPsJ1OQAXATrirBSOp2FYyVuEUuWZjAeu
         0iOqaC4DNkzK+IzY4QbTHmc62PG1eE86y5xXAdsWn0F6OuStt4fZyDRHOXy+y06vTaz3
         hLbxW87CVsGzMW+hBJvkf45SB/pdotJqhHC4Yradn+LR7x64KgBSQohWiAfrwzehCZiJ
         MVYYOVASw/SMQprttZTCIOvJ2N6JbRY82TQ3WTdlTsLeUWOGT8kVqWtlKyfxUXlvUt6P
         JWoJxAdLtsgfnTyyw3MU+/iH+OFYkX/dderWEquVcp2fEptzdNsp8sngtB4tNn4jmbcQ
         wOzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzik0JlQX1yYNfan4Po3b7JuLtxGnywHJ7+smvHIv5tMbr+OQga4q9FB5ew608CUkjGwAevoRcUCsfd@vger.kernel.org
X-Gm-Message-State: AFq9FYJuFBPxTJulV4dcnyNJ+wrut/DpKta8/DdrIKGAQPLLnWmj61KB
	SEdxcUuAUI8gWN5tzP2/Ist/TTVOT54ZYU/L+G+91uyytEGgLKx/taICOag9M3AoHU0qj4ODBsY
	jwz6h5AHLhGlR7hZQ7TQQY81FvKRaCFU8MVVKXjy5pZadcwuh2H6580TJpOWwOhP1
X-Gm-Gg: AYBFou1zprEzn003C7gzxq60mqh8UrREiBRAs8dorfmSyFEajwcQkuT1L4hJ+Be6Cjp
	ZR/r3QN5WPEfeBMV7+CfPgsy8dHqKMrVVA2frkKRDxvWczrmd7EGQbBmBAcmWmhKX1dhSsF6elE
	yWvImgeLRusTM9/TEwQorXt3DB5gmiOt7b5W0huuIcBKl3P28Ft140BxNubaQja1Rr+XBrhvX6d
	cuNoQLFCsLMzkgPsDhaeE7euHjxzGIsLirIxtoiHJrizvF0esXK54O7eYt4kaQHoxgFNyFmNP7v
	3BCD2VxvldAiDZQgFhGfqdGmOG0InKgDhvMYtkaMyDJqC8DvVq8d9pzMzYh3oeNPEN1H/6IlS3c
	neZHUa4iJBMJMzKOUiuAWyA==
X-Received: by 2002:a05:620a:8a0f:b0:940:f21a:eb64 with SMTP id af79cd13be357-940f21aef09mr1114250985a.5.1793100054240;
        Tue, 27 Oct 2026 04:20:54 -0700 (PDT)
X-Received: by 2002:a05:620a:8a0f:b0:940:f21a:eb64 with SMTP id af79cd13be357-940f21aef09mr1114248285a.5.1793100053788;
        Tue, 27 Oct 2026 04:20:53 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b45f7e6256sm3277505a12.31.2026.10.27.04.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 04:20:52 -0700 (PDT)
Message-ID: <a276db23-126c-4ac5-9cd1-5e6106925660@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:20:50 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: monaco-ac-evk: Describe the PCIe M.2
 Key E connector
To: Wei Deng <wei.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
References: <20261021104709.1428234-1-wei.deng@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021104709.1428234-1-wei.deng@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9C5uUdh7UUqdFpXeVdqh7mkVbm_RDoPs
X-Proofpoint-GUID: 9C5uUdh7UUqdFpXeVdqh7mkVbm_RDoPs
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae08917 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=1tuRgrbA9oXq7jUc8RoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfXzeEaDBXh/ixN
 CG4S8eSu2JHTwftf4PG7rjk3NlKW2DjGR6IcFtDEIgN3iA6rOayhsm18CV62sR32i0e3benwYr5
 yLlpYMwC54hSKwyAbOCENr3Ih13wrVVX++0AAArts9jU6KnImTd0x/ATIziKt11qoeSqwAIbRaw
 JCcHp7OQyekoc38+5Z/oWP3IhKUJGhR7NCupFfQo1KhzlCe6Dqo7NpEbMDwtuDfKvFgr7F5wcZF
 Ow7pa+aZHuJLub49JbWUksO4avqWGZgweQtnjKGv8JOU19DQXi0fZFBaRGoOTVGZ/4jCXjZr1bN
 5WgklTwclqVqaGSSL3zIiRHWCZdFPFrJr84mqGQ3dWBspmMNcLOl0d0goilEesqa9FT+dTv4Q3d
 85CnymEKDztVT+NoM7Qno4nZbmu8/yr1NJ9o7dASNxpVDzeDDy5unFrClEWvW5viWOssDj2aKNO
 VgB8kZ3lhvS/ljoHVQA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX8sDEIN3FhTY9
 SAewO2dt3AybgYskFVXaykrIduBx89k3jifS+ycO5tY1s6pyXD7bLTQPXsivNyDXzqF9culNEKJ
 Yh+/0UN9LTTrNt6qOfT1jBHr7wi3WaI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270045

On 10/21/26 12:47 PM, Wei Deng wrote:
> The Monaco AC EVK has a PCIe M.2 Mechanical Key E connector to
> connect wireless connectivity cards over PCIe and UART interfaces. Hence,
> describe the connector node and link it with the PCIe 0 Root Port and
> UART2 nodes through graph port/endpoint.
> 
> The port/endpoint nodes are defined inline in the board file rather
> than as empty anchor nodes in the SoC DTSI, so that
> of_graph_is_present() only returns true for boards that have an M.2
> Key E connector present, preventing unintended pwrseq probe on boards
> with soldered wireless chips (e.g. qcs8300-ride).
> 
> The connector's 3.3V supply is described as a fixed always-on regulator
> (vreg_wcn_3p3), which is required by the pcie-m2-e-connector binding.
> 
> Also add the serial1 = &uart2 alias, which is required for the
> Bluetooth serdev device to be enumerated on the UART2 interface.
> 
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
