Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9C44B4058
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405604; cv=none; b=IV2U+KI2JqQXwJCOfvY2kksRxwy984MxC0M90xb+cjYUg8GTl5WZ87E9WX4E4TxY8Pwn6t4xumpOieUF8J75GEGYHf49axFNwSt9jKzCZSprlnt/+P9f2ooSg2A/wWXdjYCTx4A3hJkhq2iMkYsKQjtAe7/43oX/zdHdPCm1Xxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405604; c=relaxed/simple;
	bh=aIWumpIRlPngpHB3nhh9eNSESlFAuJfAAYhkNH3HxMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vfmt8nKi0kT6NmUcobxaYil/fP+LjuceN55HaUDDfulVncDx9V4ig15tBWnisQEBuY/O6MTmh4LfpC12XyCnpfUvnmc9Cpb0owg7dB5xmFLdZKCNERn6vvtn2v/3RgfuyChFNbFT1+FOmHkt5jwSElhjWoRhf9EmSkh/ys8EROA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=foXBBE0C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=adVPKw5V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="foXBBE0C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="adVPKw5V"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8PI8r2754637
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	txws5LB2NbxpgvSkUMWlxM1nVW6O7uZH3iwQVXVS2Kc=; b=foXBBE0CNdHpNRfL
	bFJ4P5xetolMMZheLnLi4PL31OGI3ld1Ve81hbDo7GPwkVa2lMCGPZCiH6OVdJxg
	GG+4oz6SyRCkN9c+zOo/Y2R1XpbHzr1n5cVqwkBDjeFVXKQMqnlktj/mpOLoc2Q3
	OTN+ypoKyivWOzMjGs0twOlYBNf8/udvwlAUx9xHf644z/3pBvl8mBc8q7qzzLSu
	o8Xtgo5VpvnRuCz0U4fmracmiF7z97BYYZ+NC0sctzSTYeehhDQnjTRmwZpgEwaC
	wU49FyVw+05tCTImieq70TmAtjc4t1pPDmpWTH1+rfRzO+ddtVsXvL5bv7IsB0Bv
	PYf0bg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48gkpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:26:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc50fb0d2so54849485a.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 03:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792405601; x=1793010401; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=txws5LB2NbxpgvSkUMWlxM1nVW6O7uZH3iwQVXVS2Kc=;
        b=adVPKw5VFxvCHheyTNCyyNjldMDsZZmobTeIHFjr+MSiE6S7VyedqvsCwgQjOoaQPF
         JvOljKy5S4ESt2Pkb2y8AvcEB+CjQZaZiwVJOCXBr8U7VBJK3Foqs7FutcEOjXcESu4W
         iKM44OtAEXY72jTL0ch3qASOrqWFC8fDfmY5ehnYpwS5kOJchesyKacbb8doZAcLQHkV
         lW1+SsTzs8vxT119FATLxmpqlkpmEpWgm7dD67KX0InNafEGlFJsoSlddKBXcZRDFSFp
         rNVO2r7nvmJIl/9TarH0Xa7h0+68mCPx+8tV3SxQ1SUb25xSGNz1UqQu+WYgGInrADz2
         3dag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405601; x=1793010401;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=txws5LB2NbxpgvSkUMWlxM1nVW6O7uZH3iwQVXVS2Kc=;
        b=CXQKjoa6Czh9EcIAVTaFpJr9KLlUajPOE2RVfv/g3z5qNacMGV+43mqDaK7dgPbBhL
         sod70sRADCVPTQe34Ncv6i9hA4zQbwDjILZv7x9zq02/V8lbn5u4mKmj3DvPy1GCF5we
         SyU8Q3SEF3JR2BNMDKyy54ENU8m3uPCtcoDsasEt/RwB+0ma6B3mb5E0fgSX0bZ0J7Uk
         4Hn9yXONgOr1ZMoOLr/CH0EbuOv/+dVvKPp2bxgvWt5DknhGEDC3w8sf7kdfwtKYMdQC
         z2eZPU0ZyocPXutn7Gx+Qnh43vjELUKNbESG6zmU0AVNIjFBGUn5YTrB/MOBo2gtziHb
         WhOg==
X-Forwarded-Encrypted: i=1; AKwUvBzzEHQLxqANlAqlg1Gp2EaM3Y8HcQl1R3v2FEJLE78Z5MRuhGsePVQEfzOYn/Xcx37MVAqqsF7Pluyx@vger.kernel.org
X-Gm-Message-State: AFq9FYKaP0alX7WACGf3BsUSTpv0z8ZkJGt6rM/AC+FtkhAn2w4v6aIo
	tC6KOmsaMUEGmatKkV5FsZkQ5barhQi4YSE6No/R/B9ywDYflcZ2j25n4RMT45ny1ytoqKKL8nA
	M4lqWzrQbqMzM1ePpVhABGkUI+h1mSJcTrjIoRm86dmcdLKPbCIfaUOTBcQtT44VE
X-Gm-Gg: AYBFou3TyIPdebJqJCxboKxZNZCNmJGvcK9JeyKcGMs9MqSiMKPPOaL+vkDahHESnRN
	vR0tq65DfT5OCJ+vNbMlAHSawVpcY0SDgccWKD+7mxm2nRvXG8NMLR88nq8Fm3Au2xLwE7n/7IF
	frHZKdMGxDI4PvnKqcnb5N65RqtdziIVR4ksAvSdvL2KIBHM34jmMu6b1fsz0pjqIii3xFNSJWg
	PZPbwgK6WGDuggTixVYpDTXS99mGegKo61iur+9goHdoTgIDgH+r4mx6tB9/MPqo6/tfjcbqO+5
	R39cACb+v8EcvM2IyGaFI1TXcgdMtUyLxyRpJcnn5yoXYJgJO+cBGD2A9Qw1kHNUaK0f1fXjfK3
	oMIAvvdZwYanUFemtoHpw9g==
X-Received: by 2002:a05:620a:a99a:20b0:93f:43a4:a48f with SMTP id af79cd13be357-93f43a4a566mr95242585a.5.1792405600586;
        Mon, 19 Oct 2026 03:26:40 -0700 (PDT)
X-Received: by 2002:a05:620a:a99a:20b0:93f:43a4:a48f with SMTP id af79cd13be357-93f43a4a566mr95240785a.5.1792405600127;
        Mon, 19 Oct 2026 03:26:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1e9da2sm3935320a12.31.2026.10.19.03.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 03:26:38 -0700 (PDT)
Message-ID: <adfd320f-f253-4f13-9e76-3a2305948419@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 12:26:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1-denali: Add PWM backlight for
 LCD
To: Dale Whinham <daleyo@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Haipeng Lin <jimmie.lin@gmail.com>
References: <20261017-sp11-lcd-fixes-v1-0-0eb916c01a3d@gmail.com>
 <20261017-sp11-lcd-fixes-v1-2-0eb916c01a3d@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261017-sp11-lcd-fixes-v1-2-0eb916c01a3d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX4HeUpyk/IHcH
 bOspkVRQyhKmFa05xbKpm/I5YrWVLxUZgi7r3cZF1BGFRwmE/vaE3f3tU5+oMAKfKpf1c09AMYt
 rhN4bANETybYgdVZNBcJGV/9W1r1FxLOczyzkTCqyaEi36e2aRetLuA1/BIW3wwYblRYbuPDCuw
 HyoQY/8CCy2AsvAx7j+Rv7LBDHiN4l4lncItxDFZNyeB6htG2YSro4jeog+TPZktr5/N0wDCC1K
 qYvg4rA/wy5oORPtCh2yv9+TYB4O44ltXxqqqei8e7zgyhvoweQ9eszts0hA4z+bvBCjuGc7r6c
 A0cRVZ/0Q4w978Ep7p9537TbspCs9pQw7vzhTk1iduptw6RWgbWMo78Q6vxCbQggrK7KiiBpFH+
 5aG7BOzG5J/YXiVWU93TfpUxp7l/tTK1YH/u7Z+EZdINqSJesey/ezoQNlKzrhJY1DMas9IPF7E
 GajqzB96+5o13Q6fniA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfXwVz0t4hb/E9R
 X7ESvJb1mfNXcactL+g+W2PdYax6Av4JVXIxJM66gNBcwQ7Q646q1uq2HLfnfd+ZxHRhyqGord5
 naUqQ/1sjguIXdfNg5PTajDXP9rVWyg=
X-Proofpoint-ORIG-GUID: f-iljcMDtmlvpUhiiIg1Shxv0f_I4c_D
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad5f061 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=-uL8lm0AAZMNKrp0HWoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: f-iljcMDtmlvpUhiiIg1Shxv0f_I4c_D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190041

On 10/17/26 7:52 PM, Dale Whinham wrote:
> The LCD variant's backlight is PWM from the PMK8550 LPG on gpio5, with
> pmc8380_3 gpio10 enabling the supply and gpio4 the backlight, as on the
> T14s LCD and Surface Laptop 7.
> 
> On OLED gpio4 is the panel enable, so move it and the panel compatible
> out of the common dtsi.
> 
> Fixes: 0d72ccaa1e84 ("arm64: dts: qcom: Add support for X1-based Surface Pro 11")
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> Tested-by: Haipeng Lin <jimmie.lin@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
