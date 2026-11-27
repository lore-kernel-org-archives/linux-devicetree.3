Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795768279;
	b=3sY39XwIDgTBqPGUt9Zs0HZ+WT5psDdhIFoU93wQgDkuuSAnfWQwVxPZK46Zw7g7tXhA
	 AeRvdhQg4tXbvRBFQOpmz9clTwKhjyhsBg0DDDCHl4j8fVBeT39cBaOCntRebkA1g19sL
	 4+X44e1zgzSPHDckwIy9xOr5iF3TkC0lw5bC3vdzLKrLkSQyFCjl/wpbACQwGyhwqfDth
	 PrK0b2pzoBw+lsi8cNpZnCEsRDx8i2hOwEuYNtKJPy/kYY4CuT8Cg0huySonbXYzO43Ag
	 UFxBDwTHQG/uOXW4L8ovhZ8gzN+cpAQJbWZ8wzgn25oW43DlqpHqoqmuH8sNeiUI+MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768279;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1Eevaf7n6N6k8xB2plTgEkQDmf0Hy0f8uudkH9gmaLw=;
	b=Nb0yYV1m9OVKaeOch5oJmkCDZBwWhulRRou75yyVsG8K+88FSv1uesq7xw3zcV84/you
	 0UnhPFxV+ZInud64HNcI4iD4l4q0Js7y1t7PQt1q40hDFfRIb+BVl9xyAy50ttz5rGUPo
	 Mk2NWY849SXVscQ9+dZy2gwnsSoGIyp+ocKRwxvGkejnhqGNAzK98a30giUkYtKi2NphR
	 6BsIDCuW6dp3X+bjk2gwhLuZDJ6I4qTQcnxesxfx4VHkluf4OUtBXDW+NNG+TV2u41bhR
	 HuoUlPcZxhnzzXxCrgIR/A0K6LpqNNO2tsrylrt82fQXxfiI/vcMs58F/l+Iq/VrE/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="EL/6lRr7";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H+Z7kZz4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94479606A330
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94479606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EL/6lRr7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H+Z7kZz4
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7Gp64560400
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:31:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Eevaf7n6N6k8xB2plTgEkQDmf0Hy0f8uudkH9gmaLw=; b=EL/6lRr7BG4YS8+U
	bSliQzZbFY+qb8YC02tlw1DEaQiYcqMX+lgVH7cwk2lFe1tP0+zZnguMED4BJVl4
	BxAh/0+xye/+TB8GprjYVETz5pJuDClV3a/nO2s0K4XaOs4Qh04w2Kpqvg2n8zRW
	pu6a6zY1RiVtZJhQUR3g1+LAo5Ui8YrHRw1H7H/ZuClflVyKMTMDrSrJmDgPwbs4
	uBHDYlbxlwQBCmD1C8MeTwC9TnxXg5zutAvZ9l9VSQjXQJla2beE1rOjisPQFOL+
	BSHZv/BVaVCcVEU5M9DbOHcZYX1Fs6gapdPcyQ0DbgQ1gvzd28ZkqJr3UOtWeIR/
	6uNVwQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqk0tx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:31:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495a4540f2so53279585a.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 00:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795768277; x=1796373077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Eevaf7n6N6k8xB2plTgEkQDmf0Hy0f8uudkH9gmaLw=;
        b=H+Z7kZz4gxGStlfDXhL9Tu6VfX9ZGTVNrhBhNg/AxJKCTMaIKMUj2FQ68kBftHfSev
         SUp2uJNt956FWAhV2xyPhU+6g7OcELaekzpH9GUlI1xZwpC+R+WKUVxWvdUWf3vTh3+i
         XAGJMz84YOhvEJhPjIWCY5+fk7pEQy3WB2yPKZoY/QHPR4hoNsedzX4OlwcjPIs+vdev
         RyEvT9djX0b2OOTWAbQ6W9pCPB0gFrQ+JupqPTqJngjrWduQZFDXxkNqPQuozplSrZc1
         R4ycuWA2aknHJv3luKcoUXi8ikjWBsyCn3WO6sVuscg0sspvcamy9Pc42NiL2q4h7cHc
         BfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795768277; x=1796373077;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Eevaf7n6N6k8xB2plTgEkQDmf0Hy0f8uudkH9gmaLw=;
        b=XBSqj5ngnJ5AxjKqzetZgUZvngCDlBMnnanHq8fkVP0MotIARNkfFzJL2X75dzXhq+
         UHDyy2IGzyhNhobQdcVnDXonQ3PL0v2zzFNZTToQuX7qgHizJlFaO0uvvGk7FGZCGrvZ
         swduQCBZX/gZQLPVcEPqtL0fNvgd73n5eSAgSI0Ai41pqtKBFnVL/lwwAQWUZO0M6uAK
         716xy7sdzKGRDr9pzvvepUCYzZ6E1nZJfKhxy3JbLhDDJJRRjJwNYsaqyuZWd8NZVFx+
         rE4I7WLeVcqMxg+iou/MAVIpn69DKE+l6sKtEhE8CU2EZxKcYL+w0VmJT559CcjQKJus
         c5sA==
X-Forwarded-Encrypted: i=1; AL+hErGHPH1ZzN6MP17Fpb8EAQru51k2+rzV99ZWJwcYno+/3gdMfYjfXnW9TiEkGXZy5rkTwKJQ+QltEUxS@vger.kernel.org
X-Gm-Message-State: APuU4Z9lkm09QouX5IBnR78frQst1dEZ+ydxBWiVfj4myexpQUxpvwJ+
	/gultDNtyZIMmmFmGnr2Lh00q0Rk/67fFt+JKNl8EkfswuoPC61fxMLstrAsHKmQZML2Og+4jqF
	7QLynIOYahPlrtFDeg2mojcFfpNcrkuee897FwzAaXhsMAEI/PgpUChjqJ68qq0A3
X-Gm-Gg: AZFdTZdMAk+Qg8Ad4WzYm/8EAnAIYK77pgcQw9DTtftGrBOhNLoxPSaxpIhwdhkr2Zk
	/rJuoFV5g2QdKo75P/SyE+G8mZVF4TolGosYNhr0g3dNcficG5wVow9udveB6uUkBwwcL2xi17z
	cmoRRnd4JB8kwVBLfH1uF71fe02XADQX137iT0k/UBWL6nKCRZKDa1PYonnOwxkGqUqA5+8Q2qE
	nzB0BwReao0KoJihnh1wQCBVZgJKiNmv63inhYqBtCcP8reTn0Ar7yO1zutMueG37SkuZtXmfY2
	YED3kubNE1SGRdKXCh+vj1xE8xLXp5CkhJTq/EyV1KU371gTvmHmp4NXrnb1U44qAkdiqMoQPnN
	zTjvtumAqhHTROWIJpsY0GBpNEIObnOjA3etoK3Yg7FYFHD7Axs3sedW7YtTerhbW6eD6OaA=
X-Received: by 2002:a05:620a:870d:10b0:949:b7fe:6e47 with SMTP id af79cd13be357-949ba81fda1mr3989678785a.1.1795768276798;
        Fri, 27 Nov 2026 00:31:16 -0800 (PST)
X-Received: by 2002:a05:620a:870d:10b0:949:b7fe:6e47 with SMTP id af79cd13be357-949ba81fda1mr3989674685a.1.1795768276324;
        Fri, 27 Nov 2026 00:31:16 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba371072f6sm10890394a12.28.2026.11.27.00.31.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 00:31:14 -0800 (PST)
Message-ID: <e6821ce4-054d-488d-99cd-86853dffaba7@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 09:31:11 +0100
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
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: eliza-evk: Enable DisplayPort
 over USB Type-C
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
References: <20261127-eliza_evk_display-v2-0-e4223634aa2c@oss.qualcomm.com>
 <20261127-eliza_evk_display-v2-1-e4223634aa2c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261127-eliza_evk_display-v2-1-e4223634aa2c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: poMazywqKZEZsK_1wshiYzwp1_rTcOnP
X-Proofpoint-ORIG-GUID: poMazywqKZEZsK_1wshiYzwp1_rTcOnP
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b093fd5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=TshjLMacr8HRhQhMfUAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzMyBTYWx0ZWRfX1wxFCAWVGNm8
 MX6tWZfxwonUrsGvwu+rpjYn8brVK4vB/ofMdzq3r1MCHj9JsuZV6E4snLLyRH161LaxhccIr1U
 cML6DXYYRC1A42HJMmIUNzMd+edDI4I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzMyBTYWx0ZWRfX5Se+h75t0i/f
 bjzoBksdvye+IMwS5iE03nvTOfd29HLh+5lCBl1GF6WcDtlu6LkMeyre+UoElILcaP3URwkIABC
 V+7RpBbXtUTEfJdbe6zmg2n7Nz6sg8NDNK4raxatOsLznMcJPaXi2/z+v4xroKc0SL+tEgZZoi6
 FCDf1K3GCqLZx0ZPeDJLHj3QDHyFDgAQXECym/RdK0r5wl7Wo4GQ8piZHfBe5BD6W3E4tbgAr8u
 v1ZR9m514wk0xDv7zT2E8cGJsnE8W57c/NXIIpYnOmlx231FliVt/ZvJzTDlReFJkBExnKHlbKt
 y807B5Cu+VJSwtHDxPTExdJaHDkNHVw1z7Md6JxMCbm2rn87hN7/DcKMlTBOHdpuCKfV2+virC1
 s9XGORc/zQ96cqOCm6O9UhWOgx+ozbcBjGunNSu8jefElTBc3pw6exv6l9x05e/ITOrYWRymp99
 6CaIM6WnE+uZuvHRygQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270033

On 11/27/26 6:23 AM, Vishnu Saini wrote:
> The EVK routes DP0 to a USB Type-C connector driven by pmic_glink.
> Enable MDSS and DP0, and describe the SBU path needed for DP alt mode.
> 
> An onsemi FSUSB43L10X on the EVK board routes the DP AUX pair to the
> connector. Model it as a gpio-sbu-mux, with enable on TLMM 177, select
> on TLMM 178, and L17B as its supply.

[...]

> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dp0 {
> +	status = "okay";
>  };
> 

Please keep the label references sorted 


Konrad
