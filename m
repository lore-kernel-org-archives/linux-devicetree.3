Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102546;
	b=jaU7IkLFfGhN/AqOI1HUnZSNlXC0X3PR7JChDnyxRSUbDyLljpiFfCiiLA510JnKxZIb
	 4nG1+s3aDdLQYNhBbXb6mQOmPDKV/J2YwsPcau5vCLHkowWL0IPPMhk8m+UtfnycPpSP9
	 HredWxQgiqZh2XLZf4h39+l9hl918+e6OB6Ur3oh0oUGRmzDWSJ84b5UKlOuVcv+Cd22/
	 EoV1LoUByrcQEg54z3jk1HZLPB5ytOMSsWCYTywkmbx5ZZ1dMoa1/lSKMnAGXA3bNqMP+
	 +0fpR2aih8fMREap4zTUQ4hj08WpWku88AYtBn2SQjz/sDOIeaBDKJwPgbexm2jmDZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102546;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Kn1jCEHUW1d9uLWgsAlPA35l3RKW2fh4gEEZlZKSWDY=;
	b=GBOvVP8spA0mycjP4DC5+HOFy+Yr9WBQaEE7RoIos2ji230zM0KtZeLuMCnxJz+CiUKF
	 0LUvjUxjv8Js+o5T6mkGDJIS+e13lD4fqrPGmuuCOGv4LZryWPxMJmXdHw6jjPIaNTTKN
	 rln2y//pPL+jaUnzLy27jgEvbpQnBZaj4yspSwgz8WutYE4+i880tpeQigtvl6XvaHUiK
	 Ssklj+UH1olqs8xn/pQbzmGvMuRJD/CATWcxW0wrbotn6WFcSurNzW00UbavoAvWOgg6T
	 7JVDSIebVLimlE/HhFYZMr+FCXcn5dHdOTN1gx6vGVBYq6+POma/BVGF58ZA5k+7IZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="VY6nyYT/";
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="i1AI/301";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BCF606A329
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2BCF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VY6nyYT/;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i1AI/301
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeKXG1427437
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kn1jCEHUW1d9uLWgsAlPA35l3RKW2fh4gEEZlZKSWDY=; b=VY6nyYT/KRTbNCFC
	54PQYBA2zoc6U17Izq0U3o8/EyrgmiDpVBFpqS1Hog/UAm7o+P2JAfrf0RNEwfc4
	h0CT+6QhALItvX2cDGlPHVL0kFwsuzL1XKA6dhnehQzwXvYubi6ZffI8hSHBboVf
	25VyvhyY5eUjGXmw0HRZQtp4a0NY80F7y7sU79GfWdi+feJTSe42rJA+tSn5dqWs
	dB6jFsOrxd/MAQoV/vI7RIUOQ6kHGXlND2Ek0tMf3AO2R4rOiolhsTR0Rxrb1ppv
	gZyMSrh1GMofm2sNUgUDrSJCrgg6xd+o6vSELXd75cAaKKZ65Bxztt0TRlwYt1TZ
	FxOtdA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmmbf67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:02:20 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7ffe90b2cfdso2408730a34.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 05:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793102539; x=1793707339; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kn1jCEHUW1d9uLWgsAlPA35l3RKW2fh4gEEZlZKSWDY=;
        b=i1AI/301zX3heTMkN9c8ZZkb5Tscj40kcE1z85dn6Vnbx4Gdg+RkXhRiuyUrVzfHqf
         5735QFXK6gbAASSdhsQi9XDevQIaljA63li4tCXFZ+dOUKEO/d7+2rJ8KTJy8hYAwIwK
         l181Sv4IiDnqCfCa+QWaLs8d70mJkxzzGGOZFwFPiBvwcj6MhtoMvcPAGSuLcrE+kDdt
         BVhrFjbvYGwjCaBs2z92c//PLAYMh9I7qwHYgq4wB/HlVhORZQ5x62+/t8999CxpMMoL
         xzZWWcIUild2fBi8z0qu+/6k9Ro7gnM3BwSAA9JyIC+qR2BHzQRmdY3uGqOsW254DgAN
         8Csg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102539; x=1793707339;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kn1jCEHUW1d9uLWgsAlPA35l3RKW2fh4gEEZlZKSWDY=;
        b=buJKin240YgnypAf/Xh40Gn0XyyZrnTYHy47xG9pHg0B7RT0S0tmCbSSngM6zuXgF/
         4FnFC1K0D70eKge/sm+WiBZ4JxzpAqGBKPQ6Hp+5Ci0KEWrS6VVC5+16nQn9QB0qaB8d
         FWKAjCj1sYmiOAl1ouJpL8xgx8+7+hcSHpgDGVkZ83sjMZhSLxwQUusjGKWCjt083wYo
         I0v3X7SNQsZ5I+whanOZWJldUccKl50heSAfH2Jn5AWlnCu2bMEMI+rvvLlHBOZHQ6+a
         gTqh5yUIo3/p5JNEmKqFhTv4DytdSTPRjZEuK2eXjnRwvu2z+8hlxJ/epUz+ySIx6rHa
         mqcQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2pWmuVjneP4GJ5AtJLq8cTfuC9MWQ6CKCl7cE6/fCeAwmWabc9dokBmMvcE5WbrWAXT3oTVvgDBld@vger.kernel.org
X-Gm-Message-State: AFq9FYJU99swH6AWthiotR1sEM5sYeGyejMlXRRGz9PokmMrfvKRE1w+
	y3N/SF8MqfgUQSBHFhts6ivbKJSbyVwt9bsyUVm/w91qVayaB2gYHnYRekZ3yZmC9ilLpnx6A56
	Swe0WiBrVLeeUw7Vw80WJO1dSD6MFAZsEC1A1atTcJSvWl6EDS7bP3uvHgEhVoCfB
X-Gm-Gg: AYBFou08GOskqenp8FDv5li+Ye7qmKDQbs9cFjP2knoqgt1CqlYpvsFLfIrgoBi3U6D
	pOTmpeIR6tnBUVH+eUgeLA5M3ndJO52/wu6gtwPc2/NRMbEZK5XVmVlVMeXhhe5QVDAUQ41QoxR
	IxeBidn7oPjpCF2zz38KC+1O83hdEXRz4x7iSiErmJaE8zmtPvg2ptns4LgVwoztqBKMtl44UO4
	2manVX6rc35RTlAaGLR3Lbcu7nlx2ieXJqA60fEj83xdlXskV/JbDXlCNPMgdQZ17oLRt6qih8D
	G4AAoqbnt3kpuKX57+/zKnOKuOseoxQxKflx+6XG9e9IEr33qzOj3KeU6THBsOrx3t6PJv7oJrL
	csMUX/Hsm2mnEsq0zuEPYgA==
X-Received: by 2002:a05:6808:4f46:b0:4bd:73d9:85c7 with SMTP id 5614622812f47-55bffd42ee3mr10422856b6e.0.1793102538823;
        Tue, 27 Oct 2026 05:02:18 -0700 (PDT)
X-Received: by 2002:a05:6808:4f46:b0:4bd:73d9:85c7 with SMTP id 5614622812f47-55bffd42ee3mr10422778b6e.0.1793102538203;
        Tue, 27 Oct 2026 05:02:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445971383sm4756451a12.21.2026.10.27.05.02.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:02:17 -0700 (PDT)
Message-ID: <83abd085-b052-4cbd-87ab-8e882ac781b8@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:02:12 +0100
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
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: nord: Add display subsystem
 nodes
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260920091930.2215803-1-shengchao.guo@oss.qualcomm.com>
 <20260920091930.2215803-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260920091930.2215803-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX364fvt/IEsM2
 dC0qoMm6KTCmluz0KfYfZubeYS8wX1eVONuA1Kccbkcpww/VgezIm/oj/OaAslDuZ5wGy7FQrc5
 liaFheLA7Aw17NV/Ji6cjUGW+iYd8mY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX9HDV5fwvdT7Q
 RA79M5Dap1nR+2L2RTiPTLKKSVML3S6aRTGigEzNXkiJo2jCYvSf0jk69LO3KN380t++29E/aQL
 QNmNDICE+P/jrltbrQ8CGSJICdNQPQInqn4Pp+IXz7nguF9zcp1KjbbLQC7jTi3XK/vZmy+f8ZP
 UmWi+f/xVAyGR3M6cmuQmLztimw2In7oPfDW3t0pyF71S6F7ow7STMq7A5+1OJS3G1Is4mgtVvh
 Sm3fPwD/0cCFyNjPjP03avnv+Qd87eSODV4cej8t4//cMs23FZATISS9Kor6Rky+Pfs4zu5Jqsy
 PuBwEMMaD4rB01+BEivDERx1CAI//JJIorURkEf6E9ZtQ6f1EC4f7WvHb7VgzFcPw2PYkABlv7s
 3g4ALEeu4p2pk0eggQd9em8dmS9IsdVzEwYUr+xiZNQ0BQq0PlfR6pYCuZZA2Sh6xx16eDPSSZ2
 9U26NVtvgwAkzeonH2w==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae092cc cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=mY-c6RtcwyEVXP3PGRQA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-ORIG-GUID: 7UELwzij-qSlw9KN2CcrBVFUQ5PAI7wz
X-Proofpoint-GUID: 7UELwzij-qSlw9KN2CcrBVFUQ5PAI7wz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270047

On 9/20/26 11:19 AM, Shawn Guo wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Add the MDSS, DPU, DP controller and eDP PHY nodes for the Qualcomm Nord
> SoC. Nord has two independent display subsystems, MDSS0 at 0xae00000 and
> MDSS1 at 0x8c00000, each with two DP controllers and two eDP PHYs. Nord
> is DP-only, so no DSI nodes are added. Wire the DP PHY outputs into the
> dispcc0 and dispcc1 clock inputs, which were previously stubbed with
> zeroes, and add the eDP0-3 hot-plug-detect pinctrl states.

[...]

> +	dp0_phy: phy@fc3a00 {

Let's keep these labels mdss_-prefixed so that all the display
nodes are close by in device DTs

Konrad
