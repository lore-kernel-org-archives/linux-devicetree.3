Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F83646AA9D
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 13:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787058409; cv=none; b=HBMcJV7ebzU1lmmSNzpls2T6GqCFQMOBqD5+K8RRem3bDVNNVF6I3LSJZHjQ4IXcfJml5KVzSq5zMFAZtNAew3IDavgNxJDXPXCxM8KqGxGtxKyRqKGbvTv54QuCAuTt4WK2iFBwmtx6h9Ahw1B+Ydr0gwcbduJfTtSeeDZBc/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787058409; c=relaxed/simple;
	bh=KYv5PL/TF+d76RiJqFNjvnmyTh4nizUzZ3HOo3pZhXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZlUC/3i4/H6EelkqmqxWy4gSU2kpTFoeqGriaUt9b6a2j9BTcWyLVkfHD/kD85IiTK3tim7woh6OyvrZCcaZwveXFs8DMHzwMnmNwhJ37EJOvsVQ6Or0TwZs0nEL/ZtIypIbz1t20g/Id84f4WXw8OExAOMTdeVaPuTgDyN7ksI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VvdPxaxC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i8Ps5oXN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VvdPxaxC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i8Ps5oXN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABfWV820115
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 13:06:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7e2FtV7p71m6bF85tuF07LQ6OZkylmUItn06kMAU0Bs=; b=VvdPxaxCKy6r/ZxM
	AH4+i+/ej09M7SW4xUbAnC+7O25p8UH8tKmXf8rUyMh65PLmjMdZM4ngRwMK97/Y
	xWy1aCvF1x5C7Q5PRmC6JMWg320cRLX2MYtQQHviwWUg5fYqn6cyZ998CDt9ngkE
	0Vlcex6uc6NhS/jyL5FBgrGxq1qVQhbaYfQALtF1JnEylR6vRQE0+tPO4n/cOa6K
	4Padp5OdZkvzlgN0lo1a3OZ0pjee3Z/qmKgqyIlVsCIPT6Y33Sc0h2c4rzGCvIwz
	7d6dPmog+JxguBEN+TGCZE4dBotSPwwWDJFpHF4ZDSQwz7TeP6fmwP0HIXSKl8cn
	7/75/g==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4g2p24ng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 13:06:45 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bfc08e95ebso72923e0c.1
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 06:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787058405; x=1787663205; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7e2FtV7p71m6bF85tuF07LQ6OZkylmUItn06kMAU0Bs=;
        b=i8Ps5oXNyxKe4E2FihFgv0U9wkPWCBE5JIP2PDMZnTGBUZ7JFariSfCW5yxG+H6F7O
         1rPdCYB7EpiicuEe6U1bEznhLtnMVT2k+X8DcST0fn46tkwunNNiFYkIY7YRUHsvmycd
         6ut4J2kB4LjCZsemyyWxSWBF8CmEU+IU82QVkukJzMIe3pL36F9nBuySkWJIqYVfb6Kt
         Ift2sS9vqoYbjomomsBRZbt8UVVizbY9XkUxHFSJB9+2lPBmIbXdSfMt75oXMTj0rvIf
         JNJuWYrdB+GIzDMsdRZhN3q4FSD4UgRhdQ2EYvv+x6U366hXcuUxEu2F+l45kmHn4dcR
         ejLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787058405; x=1787663205;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7e2FtV7p71m6bF85tuF07LQ6OZkylmUItn06kMAU0Bs=;
        b=rVSZcahfJ9JektltM/WJxMHLiVYNCgq7JjiUoqNPfXVI9CX23Y0wFKAZiYLGWTQa3f
         r094vly+XTn/DlGZa+oRkxy1rLNAbwMsTwiohsyHWOizj70lsiyCGMY2Mhp911kPT99P
         vQYysxaiCyQQSo7AFYzvv5I62DnnTN+oa/XuhakixPU3U1t4Qot4pg8ywaelpnWkxpwd
         x0Lt1V9QgnxuOcbzW7oWNOqJtxDxr3HX3Dvaz/+zA5ZeI6+Ij8RfsmaXzHSYARt0lbti
         sA3f9DOXzh72waZ7fIbIFdfhcw4b+T1KIrvpxYFAb2d+VBxe9PcOv3IMbvLVpp1DMgia
         ljbQ==
X-Forwarded-Encrypted: i=1; AHgh+RrAc1cTFF9elFNNGlnrNdcIn1V7/30U1H6/SRMGYS5W9nnfXzM9YBqtG/BOhEpVny4IFTRmzd0jPaO9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9kHhXzzOT6HxOseQh2/SwHtcYoVu9L+a0/AyA6XOOnTp//Cr+
	5BCDiQ2h2Reeh/Xcybe2/vY5nPPxSUcI0yrSblU7yH5a2priVWMWwwPWuo2k8VHd3gN5BUOYisT
	c/E5dXq2xwr6SQW93WW28CNThyyzJ9zvn0rxRhFAmcEU8dMqT7s2Zky5bmPFvpyoM
X-Gm-Gg: AR+sD12bFvsYeRD4T1KN7xEmyt+17b/9vmluZkROcrBMLeLYIXxBwrQkHagJjGoksrb
	14I5lr09C54gO07UMEVagD5KJTTy4T9QJcTxnmm7K2dmv6RmYPTn0mX9En92xaS+KmpCkF/UQ+0
	FvwGY84xlT8KD9EhKdgpasXuPM5vS1WYWnOf+CH+QY5R5rHs9FT55M+6++wgupdftHZBFRS4Ht7
	DQ6L/lq/qU0E/CFIBqerC7GQ0pVPO2JZmB3pHLFUMi4cC/StaVWgVOutyK7h9EkgDnlz/wZRsGK
	gb8KVrko0O3pESgBtYnQxV0J9qZ5U6KIObi1yaio+D7++XT9JijKHEnyw07dP0RWgfzSDzm8Ugf
	uTZEu5PuGdc0SSW4KNJ+mvxOf
X-Received: by 2002:a05:6123:4205:20b0:5c3:6e8a:4a22 with SMTP id 71dfb90a1353d-5c591f2c4afmr2346541e0c.3.1787058404940;
        Tue, 18 Aug 2026 06:06:44 -0700 (PDT)
X-Received: by 2002:a05:6123:4205:20b0:5c3:6e8a:4a22 with SMTP id 71dfb90a1353d-5c591f2c4afmr2346474e0c.3.1787058404495;
        Tue, 18 Aug 2026 06:06:44 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46d00ab3fsm1214108e87.59.2026.08.18.06.06.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 06:06:43 -0700 (PDT)
Message-ID: <ed39625a-5b38-426d-9cb5-a1e486d25ff3@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 15:06:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: x1e80100-dell-xps13-9345:
 introduce EC
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Tobias Heider <tobias.heider@canonical.com>,
        Val Packett <val@packett.cool>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-hardening@vger.kernel.org
References: <20260809-dell-xps-9345-ec-v4-0-88306dbbc7aa@vinarskis.com>
 <20260809-dell-xps-9345-ec-v4-3-88306dbbc7aa@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260809-dell-xps-9345-ec-v4-3-88306dbbc7aa@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HkyAEWoYSNyb6-mybNl1r7jEAK8bcLbd
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA5NyBTYWx0ZWRfX74lDHj+RWHHE
 nG71qjy5MwyPRbF8mZ6TtBJPZnACz6UC4C77s9ao42fW8bu02MCf70xNItAyaq52nLC1oUjCgQa
 gE4u42Q1SuOHiIzwkB79UXgupKQ5KJY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA5NyBTYWx0ZWRfX/23Ln5uK8IoY
 ZCzAb0RehnXcF+aBTgUSPHA9VS/1sd4RZKnYwnrT1q7LH7D/xd38FnUrH+sl6pScKJWr5rJuMoZ
 nRr7yFTUzxRi4dWPCBpGQtCWeKo6pyWmqlttBLioSAFWOpJ1RJllh+YrbzzHEGcmP++l1IVpZxN
 nL1KFn+j4i9kWXqJa/NZsHkQ5Nh4a4BcKRODxoy6JbLGGr2ECMjD+N4UWUovIXvA0LNLsHyjTDC
 h2KolGN7GKoSX6GgdMwsUnc4SjsxhFskkk3q6qVQnsUBurDNgsg7YKBVav0xQEvWVgufbUu4zso
 ByAwg847C09nuk7GDwjL0wI8nWkuZDq2xhyM4wthWHkzH5J6W+fM3S4otUCTiywriR5xD5wcJ/m
 u/jWPYE9r+2qbNHtAG+FThqZK0RAzrK455VBuhKTNN3oEEgOeKj+r2ZeYstIzs7444uo+H1K83a
 t6a+xuGMc0s53nbxrlg==
X-Proofpoint-ORIG-GUID: HkyAEWoYSNyb6-mybNl1r7jEAK8bcLbd
X-Authority-Analysis: v=2.4 cv=bfRbluPB c=1 sm=1 tr=0 ts=6a8458e5 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=I76Qk8w-AAAA:8 a=EUspDBNiAAAA:8 a=BDX-M9UYCxStvK4FQfUA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180097

On 8/9/26 3:32 PM, Aleksandrs Vinarskis wrote:
> Describe embedded controller, its interrupt and required thermal zones.
> Add EC's reset GPIO to reserved range, as triggering it during device
> operation leads to unrecoverable and unusable state.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
