Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440643;
	b=LvEEVh7oGnCR6zLlZLnaWDBErv9wEjNugTEwrRc8YdjYN7XTNp4sSQrXqcRNalRQoC2C
	 nAB1vo3XiRI1py3qLWVE71Ba1KBPbmfZ9Fsatqd/FRDeqJn8WPC5Rbsc4X3O6PrI8n1nv
	 bjeVgtY74GOHipOkfwQ65YGsv7H+2zlpdn2FBXd+usypfcw11IxS1QyYD+QMl4qU65DOa
	 18AoHKbrjQrzk8wdNbGrWihybBVNVLzqHfoZwtLQLystVYYuQkoyv8dxPVY2fNUiatfms
	 ea2Z5Qe5C86OUY2PV/Nr//0pxZMQgXZ2Cyol1M2Quap/jYLM77WSOSyV79UeNBy3yHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440643;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6GW16cYLEXbLEKRxCLcZ/hm1ouVgqsdPZ8UneMsZf6M=;
	b=APrQc0bwPw9f7uT1ps37RNQwDzOP9OGuNje8YqX8AxVUbqp8qP4iNmB7+3B1k3PRxwpU
	 bMLeauI9tI03jPnhJU3VNM8OOKe7rUcppqczMNNxCXSeIPdBIOJYt6ugIzFuXFsMZ5E7G
	 BpRwJvUjDSuU6QetgS536llzweV03QpfipMWVzfPhaTk2lzPUmuaG0V3ghgVkiyzdNBO2
	 ENyCBkK6WiSiZPQB53r6viFV1EVUw3ncMw9ICNHLNq4K1lg7FAv28mogRInZAzILjJ6Qq
	 /zxp/hsE0FKtiIZjVEeA67oyXmWBpysV4virP0KxwmjBCJ6gCgkFt8nuuONrWCBG5AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c6TAGOg6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gEn7+k0A;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1100D606A327
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 13:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1100D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c6TAGOg6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gEn7+k0A
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLbj3446764
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 13:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6GW16cYLEXbLEKRxCLcZ/hm1
	ouVgqsdPZ8UneMsZf6M=; b=c6TAGOg6zi0O5kcLuEuN/zocBSDmqajGdyt5ZKdp
	JFQcnRh4jGqIi+JgJm8LtbWG776NhXnFYt8IBDEHEWhlq8tGnCAvG7N4gjx/fs0g
	RwHLHAQ0AzKISsPBHeN+T7sgGPzfp8mpNfUmyAahFVHjGEuOHoNy3R93Ypgji/1x
	n4pNZrIEt+skItajBuFA0fLd6AE16jE4U/KuS3s5WAa8MHKNEOwVSL6qotCUiUp3
	3+dwTPk3RXdaFMfmjEmBqkTy8QrljLtE7P+E4n+wCKsGj1qZTeLYJd9iiTnTunK+
	jzcavvfDiGJ0pRTcooPH0jqLoiD8wvpfK4VnnCpM48Fu8A==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g741je2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 13:30:41 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc01d48a1bso3116544137.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 05:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795440641; x=1796045441; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6GW16cYLEXbLEKRxCLcZ/hm1ouVgqsdPZ8UneMsZf6M=;
        b=gEn7+k0Ajaze1vGjd+9YvxrKbxZoK7CwlUziaxShMn1c1qP+qCqUtb/j1rm28nqQwA
         Y9G5KJT2NfLeCAnij2TdjEKJIlympH/oaHji3lp8qBvgVuVYWyChaRLZx3sgT9b/PTxc
         p8bet/RyeZCRyBoQfYzzX3DqVwMXDZem3ZR5VwaUFIOZrvkY/hFrNuGiwU2M2wVKEbI4
         wbiBBMC1OHIN9icmt0OZTzInNPheC04yokttgfMsx8FMab8/NfGzDw1lhVN2Xcg0uLJe
         xfggIo2sp9rX4uqV5FsyOO/MC8rRRT+p1B0R+FAdNWA5HjiqZ0ahuRMDE0XMy4DBiuxa
         i9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440641; x=1796045441;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GW16cYLEXbLEKRxCLcZ/hm1ouVgqsdPZ8UneMsZf6M=;
        b=cc+EPuMvYhtkvCVUOCIdFIdvJ+0coQDnwEQjgHPe9ewoVk13pq7nkPmi3HxT5IuLex
         uNLwmefQxwiy3Pyvg7ikb705RSU74IG+dO4uL2MKzKYdYK5qgDPsEZlTScr6QD1AT3OF
         b6jUtS/gInQ/pKK0iUK6+S1CvWFKPrBtAfOi4coEEW5Ew2lvrWDtglK/IJmzeLHVWWmw
         TaN61+dvtgi7inkokOwfjCynrYK23xyxH3lMZIgY2NK9LcG2U8PRZ43j+s0DlWZj4hXp
         Oz9DJ8mpuoZNQvbeMF8XgPLsBAnxPf66zpt4FU0rnRkIW0/imMhJXVz6XAR3XcWAWApZ
         kpJQ==
X-Forwarded-Encrypted: i=1; AL+hErEPtVmAihC3dXk8gPsRlze7MHzkz9fZqsi13hRXwiABRsvJ6vYNLQwh2imE13OAHKwZFhxL9Kd//ySy@vger.kernel.org
X-Gm-Message-State: APuU4Z9JlS0Ua22oaUO7zH/Lei5aKSzaZeZKdAYTlr5JdxoME4zidaNH
	Ul9t4dfS5AnESOA0c2oOJrK1VZxhPb4P1trlD9rzJKHyO6kITfQqK9yQ2uM317q3jwLvrZrYgcZ
	lQpsm6WollL1bv6V+a8leBRUffUoCzNznyDMQmB7TqNTDnCidWMDlF8gVzmJtQ2IM
X-Gm-Gg: AZFdTZdHw1jNaKz0SBNyMUqgMyNRWvTqX7uWVszNisxXZufjr/HnYCBgdr08+C6G5KC
	L4H5wG+81NrYf+KrajDJeMy79MJAwe8GbgIgjkHPK53bRZfzSt0c8EI1WlLOTMAHGw4zX8zXxWK
	wQ2Te+uZRNZWFaxAp33I4nBwBGOSAEB65vCfi4OyIEhQnfjsoZmPo1t6IeoQGmkAq3/5qIqy/Cl
	WZ0ByXsR2w4epBjwUQTJ/PQpe0stFSeXmFwoz2Qkd+gjhl1XUJwpBcfTrjnZxKrxxF+80sQfZB2
	5MtoR9BS5t6BMiHDABUZwMpCyQOgepZ00Km7+V6iD8Siu/XXmRA7+iJEX6Vm5lUOXK9ENeKSBJh
	gQLY6tiekESAcDEFA5lMvJYzgg4+LyMJMjHWvRhyH69b73yOa00lXg5ki2IoyCVZIBXPL/f62Ev
	rVAo/64zsRgJNOmrE=
X-Received: by 2002:a05:6102:580a:b0:7ce:a840:e736 with SMTP id ada2fe7eead31-7d739626308mr3388888137.13.1795440641119;
        Mon, 23 Nov 2026 05:30:41 -0800 (PST)
X-Received: by 2002:a05:6102:580a:b0:7ce:a840:e736 with SMTP id ada2fe7eead31-7d739626308mr3388860137.13.1795440640566;
        Mon, 23 Nov 2026 05:30:40 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7fa0467sm11903416137.6.2026.11.23.05.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:30:40 -0800 (PST)
Date: Mon, 23 Nov 2026 21:30:31 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/2] soc: qcom: socinfo: Copy new SoC IDs from bindings
Message-ID: <awQ_90R8_uGWm2Sz@QCOM-aGQu4IUr3Y>
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
 <20261122-qcom-socinfo-id-dt-bindings-v1-1-eeee0ffa25da@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122-qcom-socinfo-id-dt-bindings-v1-1-eeee0ffa25da@oss.qualcomm.com>
X-Proofpoint-GUID: TDhKp4Ex5xTxC5zZsT4l9QJShO-7fIev
X-Proofpoint-ORIG-GUID: TDhKp4Ex5xTxC5zZsT4l9QJShO-7fIev
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1MyBTYWx0ZWRfXyQOxYHwagcgy
 SzhZ1hF7eq3FF/0iCyqlNKRwMoSu0eAdJSH+8saZ/Rucnb6ypXj2OIgoc9kL1oSfTWeeP09+c5p
 BpRJ9XIA8lTbPVgayzs91jdiJUZe9FI=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b044001 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=votV42V3uHCFBabA7mkA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1MyBTYWx0ZWRfXynB9KHq7jBsj
 hc5E5s/RqT/Dqz6ioq7hvMfLzUsQa28+TI9FTkUZ8JDccb3NAshY+B4yERolG7W9zR7yg1oyrtB
 SWRkVcSGtUJOBub/LP4f49rLwtRmzC+5hqz3bomIczGhMct2Fi9aYNJCrraV5Zsgp92+hZK90fp
 zBfayu7UMyuda1R0y/nzPfnseFW6bsjAngSjeOjyUdRnYR/5Omo0eMItMudUPxodgJG32QgUUxY
 GcfVajsRfd7DolnMsGw3sc2/MMkg8GQ7jZRBnkI6xMwzBv3ZJsCgCVj6B+QybxPNcIbibJ8923Z
 Gh9Xzl2FHlIwcqbS8B42E3leRABq/FQuq7qiZjpSoPXShahg+FSTskNGU8/Jjnq3zwMnTjOFAGj
 qFJKiEEcYQ+iakjoXiho7Yg6qehHPoE22eLnbhUcBV3R4f6qMM5OV1b0k6jmW+pzbmF/uomoBOf
 och2J65Rff+EZhsbbNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230053

On Sun, Nov 22, 2026 at 06:46:20PM +0100, Krzysztof Kozlowski wrote:
> The IDs of newer Qualcomm SoCs, as reported by hardware or firmware, are
> currently used only in the socinfo.c driver.  There should no and there

s/should no/should be no/

> is no in-tree DTS user of these, so none of these constants are really
> proper Devicetree ABI.  IDs of older SoCs were being used in DTS, thus
> that part matches the concept behind DT bindings.

Not quite true for the start of the range. The constants themselves
are not referenced, but the values are used as raw numbers in
qcom,msm-id:

  qrb5165-rb5.dts:                    qcom,msm-id = <455 0x20001>;
  sm7225-fairphone-fp4.dts:           qcom,msm-id = <459 0x10000>;
  sm6350-sony-xperia-lena-pdx213.dts: qcom,msm-id = <434 0x10000>, <459 0x10000>;

So QRB5165 and SM7225 are still consumed by bootloaders through DTS,
which is the same category as the older IDs you keep.

> Copy arbitrarily chosen newer SoC IDs from DT bindings to the regular
> header of socinfo driver and use it when needed, so later they could be
> removed from the bindings.

I would suggest converting the boards above to QCOM_ID_QRB5165 and
QCOM_ID_SM7225, and keeping those two IDs in the bindings. Then
the in-tree DTS users become visible, and the cut is no longer arbitrary:
everything left in qcom,ids.h is an ID actually used by DTS.

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/apss-ipq6018.c      |  2 +-
>  drivers/cpufreq/qcom-cpufreq-nvmem.c |  1 +
>  include/linux/soc/qcom/socinfo.h     | 94 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 96 insertions(+), 1 deletion(-)

[...]

> diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
> index ba823a0013c5..cd2e8eddf3b5 100644
> --- a/include/linux/soc/qcom/socinfo.h
> +++ b/include/linux/soc/qcom/socinfo.h
> @@ -112,4 +112,98 @@ enum qcom_socinfo_feature_code {
>  #define SOCINFO_PCn(n)			((n) + 1)
>  #define SOCINFO_PC_RESERVE		(BIT(31) - 1)
>  
> +/* SoC IDs */
> +#define QCOM_ID_QRB5165			455
> +#define QCOM_ID_SM8450			457
> +#define QCOM_ID_SM7225			459
> +#define QCOM_ID_SA8295P			460
> +#define QCOM_ID_SA8540P			461
> +#define QCOM_ID_QCM4290			469
> +#define QCOM_ID_QCS4290			470
> +#define QCOM_ID_SM7325			475

[...]

> +#define QCOM_ID_IPQ5404			671
> +#define QCOM_ID_QCS9100			667

Since the list is being moved anyway, this might be a good moment to
fix the ordering.

Also, drivers/clk/qcom/apss-ipq5424.c includes qcom,ids.h without using
any QCOM_ID_* constant, so the include could be dropped while at it.

Shawn
