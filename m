Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC673EDE78
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 13:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782912166; cv=none; b=qo/C4l88U3ilPNu8H6XD9erYirrstSLqDA7Y59sa1ypBS851vmtKEhBEwqqlzI6iNl8foNgTCCXo7Y66Z2Zx+2KoRRfBq32e9BLo6zjMUNCvNZxHl6jq+hIXgk3IGc3eIjmek0hQfgVtNsYeU17zsThliUY+y1TbtpHoALiyUy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782912166; c=relaxed/simple;
	bh=DKQnqFgDvTrwaMpK+r+TY4JSM7zHMX+ITmDtTGd0feI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TQgNxneYjgsySS7mP89DPGsaEa7QQHPLDdkFCX6lXS6GnWMr6Cy+MizacWqRjEGMEC+QI9nX+ocxGR+c0fB2puDnE0uLowZbTZRgUpJQY0LNynra60R/npCmsqg/IRT0Otk6k2bDyXbifHzzAciKC4N9v7r8CGb3R0Hb5QwEeRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ldr70smB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bgM6bW39; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ldr70smB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bgM6bW39"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8jaa683280
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 13:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E4dsKuVZYr3H4pAciMqT4eU/Q+AiTF8aSmswDNKUQ1k=; b=ldr70smB7v8HWz+s
	6M2oD56++fE+l+JJJQ5PuQj3pV7sB8KcXw2JtelayEHPAx8AJL5ZILKUe4Jj1wIO
	i3Mg+1j53PHW+Tf2idkFoRnH/5gAAeEYfESZYe0krB0qVjsPL63A6OvCtaWNShTV
	dUC3YdicyPOBpkbedZeTIiQB+c11G3Pcn+t0mk/rPPALvIiX+YPZM9sQ9C+mQ2aD
	5HUXLJ5WLuTYUoU5IlREeqg1xfQaUEbenx77ED5A0ICEPdWJZNXx0bXubl0A0m0B
	svUa/v9BGL/FpkKYxxHYh1EnbKopjEbbnjLcTfkQ/E3HkywHaXsxdjZNj9K2pkth
	fAVTmA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jtqmf2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 13:22:44 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-734f7d8bb37so42625137.3
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 06:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782912164; x=1783516964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E4dsKuVZYr3H4pAciMqT4eU/Q+AiTF8aSmswDNKUQ1k=;
        b=bgM6bW39HX/8mxWNO9buiS//scRWzl4IYgj0goRLnyWNkbwMMPwhTq7jAfaYh4Ry8G
         7TDc1YdntmuEQPlnHTgLK8NMVhjBIRWNU4qIsujNkUdJ47wabgoF8ttcxpY6ao8KaBc2
         g763OPMwYZsGiCsir6ZNBXME2fxgyRUTWzxBP26NWfuxfD2eIv44d19lIzpDOqVE2/mr
         KxRa+RgmD/vhpUeweACYa7WcDGCD1Z1GTedk080Bl6ESXe1ui5YAcbBAySHESoKgnCPR
         J31/UyL3Ou3ttynqduE3nwRCXIPw9cWz27i6IzFo29RTYsml0huzjxecwBu7iY8yjo8k
         ejJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782912164; x=1783516964;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E4dsKuVZYr3H4pAciMqT4eU/Q+AiTF8aSmswDNKUQ1k=;
        b=C+uQTquWIztXaYTnCxWIUXhqB61CcrbS9o2SS+jip5t8e9Q3zlodqfdA+64CrvOxwV
         idMzB+QljmWx+krK8CL350ZZzYe71w5BRur5q76DIZrAjFqAo4hDWxYP36saOcz5wbqj
         xm/25NGPGXasi25zyRrs5TWC5VU9MUiI1lG29U6to1A3vaqWpnDFNAonqoA6lnX9+EQ/
         frESWEBxgf3X+JTXnbQ0dYvq07BmZkhlHf5Qm4Lyi8+jIVgwpCuPMqc/lp9xBk2KQzYf
         dA9lO480+eDpnAlFAydRPYe7SS66m4XzTMH/mzOw/mvogbkySG8UtqTLWpgvosWh9Pfp
         QxFw==
X-Forwarded-Encrypted: i=1; AHgh+RoHyUSVB/PYwBdzkWXxcEpxnjYh2V5wovkDqWgswVapGIhptIxDqPH+NjmtXvd58j27f2iCOyOCHvmk@vger.kernel.org
X-Gm-Message-State: AOJu0Yw174BFYHtRiQOw2ZsPli9tN5/ECZ0FyM/03gPFaPgJUG5DMgWO
	nLurIkG1c+7E5e1M48gRv/dxAeBaJn5NBGszYxqjFiuY3pLmXEAyCDKjqrBM2uiVOG0k2wf5B6v
	HgujqNjqmPutKnMWUU/MSCsyeaXc7ySIMoBK1To/jTqbkX9NHyWBTav9ogVvGeYte
X-Gm-Gg: AfdE7clQGIhR7ieLdb8KjaNaJ8T1pTrouEZG7J84yTWCWF6QD+Sz0wapxBY158fGeqS
	VgHkdcurQhYUIwtmP7QoFDTD1vv1QQeTKp8/xlHzGzScC7J+QcmG7OhdAWtyTguqLB2vgeLoA8B
	vpTKQOYc4Lp5HbTlZLQ1nF4n9pC6mkls2RC54nxnodyAr5avtNvA8i6G2QznSIOBT92Y0sNshq9
	BdiyNx2szJybDtN+jNH7lJwg4L9MHw8yB7a79N+zMXNf2K1hKubfc/UBkI8tPz4pBFVYhgLGYoN
	SjTQna9BluJTw+2FpnNNpWnNoUE4QAxoJWIZw9Nzzr0DSOY/D8olJORrnyFeP4mWWOs9yNTYoAO
	+6CtxgM7A7z1+2PYteGCH7ZCFyfQ/7ZMH6HU=
X-Received: by 2002:a05:6102:5088:b0:633:3bf6:977c with SMTP id ada2fe7eead31-73da7a92fbdmr184623137.1.1782912163704;
        Wed, 01 Jul 2026 06:22:43 -0700 (PDT)
X-Received: by 2002:a05:6102:5088:b0:633:3bf6:977c with SMTP id ada2fe7eead31-73da7a92fbdmr184616137.1.1782912163356;
        Wed, 01 Jul 2026 06:22:43 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12a1f0ebc3sm93612366b.18.2026.07.01.06.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 06:22:42 -0700 (PDT)
Message-ID: <504e7411-6cd5-4afc-80a8-e163894ca6b1@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 15:22:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] clk: qcom: gcc-glymur: Move EVA clocks to critical
 clock list
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260617-evacc_glymur-v2-0-905108dacaaa@oss.qualcomm.com>
 <20260617-evacc_glymur-v2-1-905108dacaaa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260617-evacc_glymur-v2-1-905108dacaaa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NqAI1QmffrOqoROLW6JdBsd7nrRYxc_l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE0MCBTYWx0ZWRfXwBFAZyTXFLp6
 yk1+k6o80naS7j8mq0tjTXpXijxCpsbt1v+YVu1KbzwSNz1MsEj+FK58bya1nfAOA9szCc9i0XN
 ke98XKPgbHcaZ/nrPRCq9ODIoa8MEbh6K6cpRbXjwtKOfASbDt79wVMjtiRBpQawfEu2R+WLK7C
 4uzMWqKHVY2cKCLiEAI0ZyxjNMhw9YByKFU8jvCQiATP7lerSU6HlSAOxQoGPob97sAcRktQfqV
 Ia4FY840Hb2uAlqGMEmmMUzUDGzQVprZTDjZtH20jTrBdXkwe1oK7ONtwVCwJ8ImvlMdK5RIX+/
 ZPhM4dduKgy+mceHz+lddmhmqWEEGZ4xOJIVq80/5tReR2W7ejSobJeB5HqSYNJfK9uBOU6Np9+
 SxDladsKcVh+xkeXxfBoF0aZIRl1yFVxDKei6TUbr4gIkwsRbdiE+Q2VG7m3vlb1mhArWxZTW5J
 gCOG4tGdT6I+exyYtGw==
X-Proofpoint-GUID: NqAI1QmffrOqoROLW6JdBsd7nrRYxc_l
X-Authority-Analysis: v=2.4 cv=LIZWhpW9 c=1 sm=1 tr=0 ts=6a4514a4 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=hAgpJja4_gNiCobD048A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE0MCBTYWx0ZWRfX1nAxJx0aAQlx
 XQpmiXcmJPm41dfBXfxihsjtnP/xHmnyWX6X+5Gb26dYc+h5dRe9KsMGxvHBXP9ldyp4tUx8ULh
 u6UzuR/Uf3WxAzYNrka5hWxLzYqljnQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010140

On 6/17/26 1:07 PM, Taniya Das wrote:
> The gcc_eva_ahb_clk and gcc_eva_xo_clk branch clocks should not be
> registered as standalone GCC branch clocks. Drop these clocks from
> the GCC clock list and instead add their CBCR registers to the GCC
> critical clocks list to ensure they remain enabled during early boot.
> 
> If these clocks are registered as normal branch clocks, they may be
> gated, which breaks access to the EVA clock controller during clock
> controller probe, thus leave them as critical clocks similar to other
> subsystem AHB and XO clocks.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
