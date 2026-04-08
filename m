Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FEE3D7D6A
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 17:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775669235; cv=none; b=E5aT8SJ/RZX6oR7MYE1qo/v/sVsCT4+X/+A35f0Z/w9LaE4J0I1YzmTa0MCjQ+IUBT/S6ms/rjLg3Iv77l+XX138LVqO2sx+GmDJP57/rZe5+2WIT/xVLUGi1z04IHf3tHzhWLLScaB7noGRUXWDVdVAeQghDC5Vgf35awmXi28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775669235; c=relaxed/simple;
	bh=YYbZBe0rumsW2vmNVvL6jqeAqaup3akyXA1RKKo5dcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uChyNBvlkutDavtA2M4l1WnVbx7fI+rm9s5kJZp8+R+YpnrzB0BoRSmBzF0kikYLrOOGifaV48cqD11aABHrYo9EE3QnvCE9K04o5r+ldTWIIh5dhufZpvKrTTmj9gXH13orF4W1F6JxWxllWa4nTubEAY/8GXZ1besq1VSsDOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J50gLstg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=edoI2wgt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J50gLstg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="edoI2wgt"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638GvnhW2412209
	for <devicetree@vger.kernel.org>; Wed, 8 Apr 2026 17:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PRHdJEFAz4Y2PwD53tIsM2jKn4k+iGIR20zLlJkpvAw=; b=J50gLstgP0fA/ciJ
	ewIGPNAE8wZOH1nGkgIZ4B9IGehpZoH4YqJO5/U/XeiPzqcWbER29r+PdzpciDLR
	S9ucj11HgcuRduSbzAvDP6MZQHFsu1LARrkcH2hG1CFqeF69SVYAuBdiGRrH66w7
	ogpojaBeYo8B9QLnjV5hva9EfpHNoCmrQVUyp2OUPsfy3jAuUIZWKqCGHPiCaoWb
	NX4CLvlvxY49StRSydOeZp7ANA6dlnrCJu6xp52Y/ki6BlZEf6YtxhuMzH9cYkXW
	KdpgFEIS8NcgAVGtOPR/WqGW5lo6fwpiBfW8gufQWemyZfmyXRgxpCOOAkk4hwi4
	Cb/2IA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd61vcvdy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 17:27:10 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c70dd30025fso235051a12.2
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 10:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775669230; x=1776274030; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PRHdJEFAz4Y2PwD53tIsM2jKn4k+iGIR20zLlJkpvAw=;
        b=edoI2wgtZfRQDW4PKanIq20lhY2lfrSXRhtZE/BK5UathWtqI8gmhXxNZd/15rPj7H
         1eeu3J4EM59rOmXhCLLs1bzFcNv59ROZstzjYL9kQ9q3BacWPINwOmLViGY0VctWEBVT
         xcU3aRHE0eAqYL+iH9fn2kKI78HTLWuK0QbyCMCfu6jrJ10yRlzHrv7joc4S7M1SI+5G
         +jYLU0VunXOpDBYRZIqq5puY4pE07MlnF334dqFhM3yGamEa/82XQrTiirGkVYP21M+y
         Ig2LC38bDEo2RWOUAB8IsblHpCQqTv7ivthrDyctSrjN4TgO3e+s4ixlPXS3de/uIbzX
         jpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775669230; x=1776274030;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PRHdJEFAz4Y2PwD53tIsM2jKn4k+iGIR20zLlJkpvAw=;
        b=JjXdnX4RvSf8kMEq/4bxoYnUMHVCH1brEG5lg40gisb7BW/UVCi13VO7cY84scjGxN
         iT9DR/0h+nRFSyHdY6dOYLbvGWGTGt/GRqC6aF4mDtTHofMKE84hEKRP+jmyluHHdkKl
         mBYlwBkCHy5rqbXfMOWcOv/MZpmxRZIFTeLnBbhZWkg7xAq3PWI4aEw3G0H056irySr3
         +oXzRHaebG4RizIxwnbP2HJ3ODhStgmbFFjWKN5whWHljkWAHPKksiX68ASCDGaIkJ7q
         UG90ZEUrtshYXijvYjFy+J8SwaW1hYU5ZvAABAc00z48XJvoVlsIApwyJagZH34Meayz
         OsVA==
X-Forwarded-Encrypted: i=1; AJvYcCWDIM9nRuuiNRnJ0SKVi/zWiovIzoNJzGuVv+PA2kvCGJc4P9WhQrabCyXxfYWFfduA924sTG2qkrlV@vger.kernel.org
X-Gm-Message-State: AOJu0YxGUYMNgIc8nVJ8o9liyplYocj8D1ocXuoq0UlSMcz7ZXFiopqH
	73yVoGLnmIwSQgvMDHjvGDBM1loayXcCif+vDbrpBhFeq3gukjD3yyWhHZ+BZSTKIy/wKGMg6/U
	3vbDJ/GmPNJvRLRoVjjFpSOgrnWNfpPQTAQsbyHFfNnxFUgeNqqMV8awdI9h6swAw
X-Gm-Gg: AeBDietwtPJMulhUC7DQK2ruKKTsfoZwxg5LLP3qJBiFearqolpHx5eTYlN4FLPJawL
	20d5T+cdmit+fHEpyo84CBh0u8ItMrrfhHpVKeel2ZQY/DbWGGPo5QwtKFc9sYQ1wO5KEwtR924
	jofcqVIJPnLQt0Zshza2C8fSr356kgaic5+rP2Ratuu/+AvGrLzmZsqOb7ug8NUDRLsfGoxZxqT
	2DscgL5AhPkt+qm8b+3cpd305D8VUUDrApPwP5mVNwtJ8HAFih4LxwMLV2wb+MCvz3DwK6OU6mC
	0Hw8sQC8OPmjsPYL5sp3xKvWCLzMgkki8xhoEUJQJNbumq5C3pEjMi0gsNU4n8rtWKiNFkD7niP
	LzROrTjAv0AFmqAhNpJ3nL4MBIcXaLsPVMCoTgYi0iQFJvtOpJ14tIYxe9qLKFBF3YMiuv2gFcC
	lkdRRTaQ==
X-Received: by 2002:a05:7022:ea28:b0:128:d4db:4478 with SMTP id a92af1059eb24-12c28c2437emr155899c88.24.1775669229601;
        Wed, 08 Apr 2026 10:27:09 -0700 (PDT)
X-Received: by 2002:a05:7022:ea28:b0:128:d4db:4478 with SMTP id a92af1059eb24-12c28c2437emr155884c88.24.1775669228903;
        Wed, 08 Apr 2026 10:27:08 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d3a941b6bdsm1705140eec.24.2026.04.08.10.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 10:27:08 -0700 (PDT)
Message-ID: <d822487c-519a-4028-bfb8-47a778d26b8a@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 10:27:07 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] ath10k: Introduce a devicetree quirk to skip host
 cap QMI requests
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>,
        David Heidelberg <david@ixit.cz>
Cc: Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
 <177566850912.1322920.17816533595535960130.b4-ty@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <177566850912.1322920.17816533595535960130.b4-ty@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDE2MiBTYWx0ZWRfX3qoJHC0gvb6H
 UTMm7SgN1NtH896ku9G3/Qbwdv/m93QaLnBepfhCyNxxD7MAnpXgxmK3qbGdd4MNRywEl/IogS0
 1StbemSmrFHtgywHBQdX7xB1fZAC+ErpNXWsR4rZOQ0SYe1v/iSOXNX3hBkEB30/kJjbAwv0Xbe
 8TZ/xD1GixWQVPHgD9jhf+vOsRtnx6h4Tm3rffrvqGS9ETZj6rNmXdvz/xRdI5SKqgHCA/EFulZ
 86c5maKUQULFA/d8S0+Q2Ykvj77vYI5L0I1XMbkwCjnMdnJit5bEYUd4YK3u/fyIa7IfRo0nqs+
 KLyG4E8yGQUGLQZZqOIKCkTwtATsiAlGqetpZcYk0xbVEIGem73yBmcufDU80uhsudQNmGe6WCe
 4V9uRTLqA8se6eiYF2sgE8Yfya+EyKyvesUD1K1LJ9YCqso4aar36hMBYwzEeKL+t/xRvmLKcDO
 Vxv9425YFr5Jl6Vtd6g==
X-Authority-Analysis: v=2.4 cv=FecHAp+6 c=1 sm=1 tr=0 ts=69d68fee cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=K_8wqBj_W9ihw6XZuEMA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 5s-2UxamJOsJ_T_fSNfgi7yJx_4U-U3S
X-Proofpoint-GUID: 5s-2UxamJOsJ_T_fSNfgi7yJx_4U-U3S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_05,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080162

On 4/8/2026 10:15 AM, Jeff Johnson wrote:
> 
> On Wed, 25 Mar 2026 18:57:14 +0100, David Heidelberg wrote:
>> This quirk is used so far used on:
>>  - LG G7 ThinQ
>>  - Xiaomi Poco F1
>>
>> I'm resending it after ~ 4 years since initial send due to Snapdragon
>> 845 being one of best supported platform for mobile phones running
>> Linux, so it would be shame to not have shiny support.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/3] dt-bindings: wireless: ath10k: Add quirk to skip host cap QMI requests
>       commit: 3d7640b6c371a1795e6d9580695d20caf16be9a4
> [2/3] ath10k: Add device-tree quirk to skip host cap QMI requests
>       (no commit info)
> [3/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable ath10k host-cap skip quirk
>       (no commit info)
> 
> Best regards,

Sigh, I did NOT take v4 of this series.
I did take the 1-2/3 subset of v5.

Note the self: actually look at the output from 'b4 ty --dry-run' before
removing the --dry-run

/jeff



