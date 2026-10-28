Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793182981;
	b=NHZppaxHWM8A/EdIWydXju0/6Fwab429UZT2YI0CvEz88LNPzdNluzrZJe1YOn+JxPFG
	 3WrobLc6TBNYjyRyDI29nUZqlpF0hs7UlInk+cgmeHn0o2ZRw0zOzNfLFeLJIdwMBo8ny
	 BNqwBWUEWNqtLYy5XAXKqYXrjYQwea3vB1ImQE3F04RjBZ9VgZnWqeBN8gF0u1zX6QsrG
	 4QK6ZGMy2rsmRc5EU3W+oSDLIkXQ622HcIB3AqlnjKyfuu7LaCRpnjAX+UFXJ1gsbeZDv
	 kKBEAaVDOBRDx82FgF7dGkzZIomBdRSY2Wx5lygUkI88o/FVQtvYZBlpMqGOHus4xOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793182981;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fJLqm9V4jsOFfA6wxHEcJun15GePDPlJxumBUvgqgGU=;
	b=tYdQ/O7gvajjPjXtODxtDpx6Ao3ianLkylkIKPwXucghcaZNZhQv8GKAQWoHNEjUjjMx
	 xPw4/4CpQYerbMQIAlF5RFWQl5VqsWwUd7KfHFGzerZY8TXpUNStDPTuHyecE8XQrDqsM
	 NdPSgOB/RQgnaatDfaCfLIZcZ4v84R6ynfunc8zzkxHU0OLDvDBQoP2OFGmLR+i/rBAVw
	 gpCxIww9SjiTpcrjnZx9VbU1rMKOuq2YypbKQ6J+HcwrjxsAA8tEriA1EkfX/GaMckgrm
	 mv9ZVsIJHsahizbG+rEOlHHcb4Zgtn2yJoUEgIN8L2wxVBtrtrFXFU7B+RvUWbtGu1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UqJ49b6j;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cEelwyrf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852B4606A31A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 10:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 852B4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UqJ49b6j;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cEelwyrf
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8hA7Y3768092
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 10:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fJLqm9V4jsOFfA6wxHEcJun15GePDPlJxumBUvgqgGU=; b=UqJ49b6jcBEGRk4N
	SMcg+4URhJJuhk3SeW8bv8F4v6ep04YNfItmRsT7kGdv+WqjQJKm8XECwY4SMr0l
	Cw/OBTIt6b7DBmuLNZWP8tSDKfneEmZ9lmTLN4s83EFFQ2wUGYRQgdk3Qmsx/Sqw
	HmjX8jCJG8Ku0powhzuVEZgUKBbyf+LRYDEpuzykx0+rHBLgnExjTCzLMLuaB5Nr
	NXwXvgaq8a8hJvmaBjuRP02xX3M8WljiBZQ84/2smhW8KyRJ9piZfexGD740N+Dd
	l3uF0WZOQ6TPpfwjtKiQUeG2pXrZB6HgovunNh649Zgzo8MWX738zXTzSIzmSdhS
	B5MMcA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp0bta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 10:22:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f6f4fe531so127536285a.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 03:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793182979; x=1793787779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fJLqm9V4jsOFfA6wxHEcJun15GePDPlJxumBUvgqgGU=;
        b=cEelwyrfGfmlt35tTqod9Uw9EXTfW+0PqqluJChECzfmxHszHmi524Yrh/sCXh9AxM
         sscjoDTAIjs8OQk7wTnXfZ7M5NlZeCrJpwDVRhAFMzml+X0uj2SZxOeeyS8lWbDlBZkd
         RjuhhLSANG4wmC+5ZN1LDpJPsaPpAmv8WKwEN6W4w9YRnv8fWmErGzyLGahakNw+u/6o
         VeqFM0/z0Xcrm2SHQhK4AuGpqs72lseYQJG8BQGDQ037Z11+GelEbTOBHx4Ehz8s0z6s
         6tRg2HpqWbzFXgAEFE4Fh8CyUp/GseaYCuDT8LtUzYpggWrPYOwhv/lxpukkZc3md7r4
         UJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793182979; x=1793787779;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fJLqm9V4jsOFfA6wxHEcJun15GePDPlJxumBUvgqgGU=;
        b=Y/Jo4F+7GJWb82CZbNO3GBSrTPONggGW9MJg6yrJkxWCjSyaGW7zIPiC9r9krtkB6y
         Ui3w6ghdZU0puyD+qL1FhLN1rSrmfxwGs2C0qYQvGEt/DSVuhznaqhWWTCri1IGDB0Ky
         oZoe06fLcwu14TsXhyfoBH0tCCZA+b85E8eZiMc8yn3I4e93Je5ZyAqY5Z+A/4D/M784
         vwIothcVBaM2hS6XJ9BIjcq90zDFlvxH4Kbrp49i69cs2cMFvDFBvLdmi6pD1tk+WBPP
         mvJHcAeoX6c7KyVmTJv9pETr6s282HvVvvYM16q28xS9cwj0XE/hUKw0hqN2Pck9lbwU
         0ESg==
X-Forwarded-Encrypted: i=1; AKwUvBx6x4fnIWzwIUTC/YPqSOZ7VtmucmG9KNX+Yb/ctlqo51gQli+1ozbBTd2S02fn7Hto55J58ZrEOwQf@vger.kernel.org
X-Gm-Message-State: AFq9FYJL7xa61/DaeZHgfoOWt1P/YM6DatazIawsmo00iWhlzaykMAx+
	kFhKyV9zlI3IopCrGeI0ybRgs2xcBo5C9iuYkxGiobCSTljWbWVHfnmnsIrgGQ9kt2txdjlPGWN
	nMDQaZYH55iyADgbiCktFPVDIr8S6co6VR3DO/uMxjp/1R9obcXmA4l8ihmja4QYq
X-Gm-Gg: AYBFou0aaAQm7DSJBGb01r3IlFxMDGMiRScBatmdjTKeCCV2ix6dio3J5Qh7n2SKxLM
	HnWXEQLi786znwmtIgdylqkMxQADXJSw216Rxfe+qgDFoasjZMhuZNYo+mQGu9CoR9tUqs/VUqB
	1Z1Sr7EOneF34XKTsar56AN9BRgDN321lwDL3Qtog4f8BafZaXdEjiBuFgS+xg2ohq29eRf7Okx
	FlWB+WSszCnINyIc7GXlB7RMkryut3WjTuAxeDn2hLKBf64FYoDqGQmoSEDj4Qv0epnpakoBnC8
	Iz3mHRr8XmnYF0AVcxwVLLdS4b015zC5+5MwTqqWCtMqZDQh54n2JPc1EajnngS6GxFrZWVRC7O
	WBbUmGLp/XppZ03g5QrxU2hniFasyW9EYDsOUT+HTmKPG225LUQoSMQZX66Uickta0UGcfc9RMa
	3r
X-Received: by 2002:a05:620a:4008:b0:93c:7d49:7b69 with SMTP id af79cd13be357-94408d42e06mr227997185a.60.1793182978714;
        Wed, 28 Oct 2026 03:22:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4008:b0:93c:7d49:7b69 with SMTP id af79cd13be357-94408d42e06mr227994285a.60.1793182978265;
        Wed, 28 Oct 2026 03:22:58 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a976010ca7sm36225665e9.1.2026.10.28.03.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:22:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: (subset) [PATCH 0/7] arm64: renesas: r8a78000: Enable GPIO support
Date: Wed, 28 Oct 2026 11:22:55 +0100
Message-ID: <179318297302.16022.6984836476337905961.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1792776697.git.geert+renesas@glider.be>
References: <cover.1792776697.git.geert+renesas@glider.be>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9_WPHMMF7_npOezOwZVagd1qQlMTs6tP
X-Proofpoint-ORIG-GUID: 9_WPHMMF7_npOezOwZVagd1qQlMTs6tP
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae1cd03 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=0_pEspLTn5AsfqPZqEwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MSBTYWx0ZWRfX21eTG8EqvlVl
 51ZtucV2gk882WZb4yTc3kKH/tmYusgbM51AQGs8ldCqdwc9iUEP244kGX06olQvDeFgTaNNREK
 QMdAZ/nWi8kLG/uO6zeCfwZHRVFX2cddR/UrxVhupi3OhpWspH5pzuUytbM/YYwbB8fMzUs0i1N
 s/dhnGAMiVAUAz3ZAXfpZMdCHJQnyIMikjdOGX8Sp51X4gfK7dU09Vkc3J60r94U+VNVeA85Qns
 rZ83m/b+SNGm/hmf/WeLI5d67Qe8MXlBvYWQUnxpV41tOIg3BMjGT4CfJHEC/Uakhote/SY/b3Z
 t96Yuebe+z4b/mYn1Fv6ckXPokv7ykZaClmq5njJwuqy4UgLi64VN+Yuu60L9atMOdwCzB2HPCy
 FzmhIjJYC4I2BVVHkor4F9jj80iGYkmyTVogeHLVI8rugjrl4QaMl/KTuFaKLHWReReaGwdJugS
 jEkJdO8syICP3CGHDgA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MSBTYWx0ZWRfX0g0j5OpBmdiO
 dPxf/cu7mGC1+cKDq7hvZf7WswpcVS3AWerGo/PTXTUj5jKO5KH4ai3xZy9jQasNYz7MKZ+2vj8
 UUNVIUabYCD9gYyTb0N6wLUY2husfnA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280041


On Fri, 23 Oct 2026 19:50:38 +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This patch series enables GPIO support for the Renesas R-Car X5H SoC, as
> found on the Renesas Ironhide development board.  On this board, clocks,
> power-domains, and resets must be accessed only through SCMI firmware.
> 
> The series is a bit special, in that most patches are not meant to be
> applied upstream yet:
>   1. The first patch, targeting the GPIO tree, restores the abily to use
>      the R-Car GPIO driver on a system that does not have pin control
>      support yet (pin control is not yet supported by SCMI on Ironhide),
>   2. The second patch, targeting a shared DT bindings branch, adds GPIO
>      clock definitions,
>   3. The third patch, targeting renesas-devel, adds GPIO device nodes to
>      the R-Car X5H .dtsi file,
>   4. The remaining patches are marked RFC or DNI; the latter depend on
>      code or DTS that is not yet upstream.  More detail can be found in
>      the individual patches.
> 
> [...]

Applied, thanks!

[1/7] gpio: rcar: Convert to gpiochip_generic_{request,free}()
      https://git.kernel.org/brgl/c/5e826d71d4839d8471784d968274823f1f492eb5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
