Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586EA3E9F93
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 10:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787653549; cv=none; b=dBqCNMnZyPlnOEiTIWZwORLLqpYW8RLh+sPSrkhEWSg5rutAH12YSwfAT+02eaUHWsbZU13ILgPDd4kLXXzaRnrydXmGybChspIxFj6qQQ1snwO3Tc8V7cIIf5XAnjceqtHEctYHtiO7Sl39/eR35ETfwUzfVIVPHtIv1r79f2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787653549; c=relaxed/simple;
	bh=pztsSdBFT/rsHTQlh1pVR3RI5X5inoPJLeKIjCKQvuE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jLGs45BDzZ20QfV1rXnR+JsuMCZNq2If8l3K9AgazDFG/8Ue6ZxIuKr3Wiep+qXPBEofVNTQ6EvE3TcMHyUOzbJSjrivpHvVwWuJx5EX0apngaVXwkNEMYzfzVlVx/1vAnq3CggDb+b5P5BQ1T/B1J4SVe8IRltiSRhSSHHUHNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=krA+tSXX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NpEARnYM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="krA+tSXX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NpEARnYM"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88QNm1707028
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 10:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y73xyKKVEUBxLF0cbi7X8bA0uKTGqzBiCSugQ4EZ0Jo=; b=krA+tSXXZUDEcZVi
	TUQINnQMF5kgyFSyTojLSCOHTuVQzqExwDiN5/ojC07sQGtKTOgaPH8CbbNKlgxP
	OzfK/ZJ97PV9tnYfOI1cOBbZjQVc911QiLYbrV7Tf+iHxrDqxm5IxHCudXwwfwfa
	5acoW1KGve6loCLyCKky7aAtbzYVF4GmPFCUOstYgBEwUyPWHD+EhgiqkZP/BkK/
	sVJTh7TSs1DOmqTegb9K165R9lwUs9BIvj/5oIOkpcbpqOmzl4UkM1S4Tj3gq2gB
	ngX74E1umzjjBNjGQeHsIXmHWEdpluQ19pBY6qNWtN5vm6nR3mmtWINB19SQBeRQ
	hD7Ldg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g93kvseur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 10:25:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52b4e315000so16807631cf.1
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 03:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787653546; x=1788258346; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y73xyKKVEUBxLF0cbi7X8bA0uKTGqzBiCSugQ4EZ0Jo=;
        b=NpEARnYMDfrwVusrUlnuJnapAhvG+fK91qBIRfjDAiVluVc6oZ49IcmElL7bQHvgof
         7zYwv3A1P/F1ezv+g9fCpokr6qbfsOsQH/FMTLhQgLQnZLdIu9mew84F4+jj9zyH8iRT
         /7qXV8hY261DnvaS3tzO4po694y7o6Y3eo7RVhFwKmvHGcxeUGOyY5uMpr6jxX7XxxSF
         ddV0OoHCWLiKHB8cr4hqcfTaDhlP1hRc1GADWXaYOF0M4o7xWfqCdcCUUkC/is8qcjje
         WYEYzmzGieOzTzO8G2RCGdywUZHF1Hv2fgSKjHCH6FzIawH9fv34Dselc2n0ui/hn+xC
         FDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787653546; x=1788258346;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y73xyKKVEUBxLF0cbi7X8bA0uKTGqzBiCSugQ4EZ0Jo=;
        b=CuuLjd4iwKrTYPtuYIXsPFytYHcg4zXSQcwFSE/L7V885YB9KcgXBYnCI1iEayu5+C
         GI4R5VIu8qB189DzvyL/fYXGHaFTD2VhiPVhyt9wgwAs6CWED216O1ze+jU5LfEN9C8P
         nzxq+MxZ5Zu2nk0y1/OUUiCb0L8gorsMv9aY6HHIegACIeeXGyr1Rcr20NIEgPkmtRng
         Mhi2c/JrICwZGE+9ElicY+FESEY9JSmTCQyw3NbHYJDuSdBNly7rNp8t9R60JKDu+Is0
         CdjaKVp1NSS7pg6DGfh0nrXHxDicLp8RCRU8ZIEpJZ3bghiG3iHsY4zAD+0gxJaSsoVv
         cqXQ==
X-Gm-Message-State: AFuF++nj4N5gMyemd5T/F2e60bJIQfafW9Jld4maD0onCucNmnXmYoip
	DHW+DWLSmK6foKBFFtvIi4yvQabSmKgmvNtVSOsdhNx3myVOFxOuxSNdar5rk09WRlZxNd0fcib
	77jHK/WC3OVHn2aYqB4iKPMDx/27/LwFxJCGjgSPPp9fCg4n5/ZMRiAuydnelNW7p
X-Gm-Gg: AR+sD13TJ/jHFC7yi4omSKhP6asKCNOC/JiQpKW7YEnG9yBh0PgAibxbuyAF3fpSfTW
	pZJ3vmDoOoVExuoX4jdUML6A6ixSIhw1vsW30gO+yfGYBWjw6VFwffrwnwQ3wtCptNoAPmnpcpu
	6RTfemJz5g+76tzeC49r00MNNIsVZ3Rxy+scX6JDvRvuNXJXEtiVs/8J0PThKFniNPaxGyBojeq
	GwZjX+si81edRFlM/aDoLtbmW3VgowrI0wkZ3aDu25Ukf+VATuBxVR+7E5PPZIr06Bkk91pOL2V
	t4vRfnPx2VdoWWDPp4wUUWxT6W5tbh2NGdmTBL+YWVL53EtbRqLsNG0eChSfVwD8IlwA+qk4/Zo
	RlKy5kOXL08zfwKWzMrD8XC0O
X-Received: by 2002:ac8:7f05:0:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-52e306cfca8mr35824041cf.0.1787653546632;
        Tue, 25 Aug 2026 03:25:46 -0700 (PDT)
X-Received: by 2002:ac8:7f05:0:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-52e306cfca8mr35823791cf.0.1787653546279;
        Tue, 25 Aug 2026 03:25:46 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249685ab3csm1765173766b.49.2026.08.25.03.25.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 03:25:45 -0700 (PDT)
Message-ID: <beaa6a82-12c7-49cc-b79b-b4db5819b95e@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 12:25:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: Add Retroid Pocket Nova
To: webgeek1234@gmail.com, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260820-rp-qcs8550-v2-0-d4ce78fe9385@gmail.com>
 <20260820-rp-qcs8550-v2-4-d4ce78fe9385@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820-rp-qcs8550-v2-4-d4ce78fe9385@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA4NyBTYWx0ZWRfXwkh/Sd7vrEFg
 M+ks5NX+DhdxAQpAGeLxL3262Qemwni8r8T2tQ/82NRpXaUTSSXGQsHGkWeCtXbF+zZAaKKQjbo
 yWp2xQc2w0c3WrUId8t99XejhAAWlOYKihxxzlrkV3JjJsiYTquuYz8EUfGgmkYzIgO3+/8Bq3X
 ASvT7MkPr4RxZ0K0PEtVBAMJh20FXdwLh51kv+oLWMvZqHxDUPWQ4+giC9quayxQElZmMjJ5ZoO
 UMK1Afmx+BmavQhU3rHBAGwM4zKyoos/lLBAXX7PooWB31XUfW4KrngGfH4G8u01ofmxEMuphQF
 YPMeTVBjXilPJM7GiKiNmgb0fzplZPhljFbyka1hb5xzQH32O7Xt7mjETYtn2EjEsocS/S0iniN
 2RVi/kHpJ7yerUPgaxy9uDCGiebyNoiDMziCmARkMVAbByg0+T4jhSXXKxa2DsPDM670rUHiiLq
 C2qgYWsLU1hStt6KqWQ==
X-Authority-Analysis: v=2.4 cv=aPHAb79m c=1 sm=1 tr=0 ts=6a8d6dab cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=blwB5C5By4wrLRVlGroA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA4NyBTYWx0ZWRfX6J5YmaiPTMVT
 ps8BwKPxOYHpp/dGNjCk8PfL3to4w2Wyw6J/a0Iv4afuvMr24BE5k5pn+Dn5T0A8TTvdQU43crv
 UMaUYu4qCyK+AskI7nfp2WSLpmTfask=
X-Proofpoint-ORIG-GUID: k-Y3vxN6s4yMDnbPeC4TuLC34fSnSglv
X-Proofpoint-GUID: k-Y3vxN6s4yMDnbPeC4TuLC34fSnSglv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250087

On 8/21/26 5:30 AM, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> The Retroid Pocket Nova is a high-performance Android-based handheld
> gaming console powered by the Qualcomm Snapdragon 8 Gen 2 processor
> featuring a 4.5-inch 4:3 AMOLED touchscreen.

[...]

> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pmk8550_pwm 0 860000>;
> +		brightness-levels = <1023 0>;
> +		num-interpolated-steps = <1023>;
> +		default-brightness-level = <600>;
> +		power-supply = <&vph_pwr>;
> +		enable-gpios = <&pmk8550_gpios 5 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&pwm_backlight_default>;
> +		pinctrl-names = "default";
> +
> +		status = "okay";

Likewise

Konrad
