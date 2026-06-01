Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678823A7F45
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 13:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780320838; cv=none; b=JyxfJLFCRZuC1OaesKueJkV625vE7a7v4ubGV0h+8fUjn4jYHn3CX5TCmZTWhnUABarkkN6ehHKViQtwbqpek47J2SzZTWVi7oV4WL6Dk2MSY9IMJmHnTxwTBg4C0lc99waVwh3J+VYMw+2Gg+oI5GXVSl0EdJvtRvQm3ha0PRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780320838; c=relaxed/simple;
	bh=Cd+q+iCUJAhmTXk4ZiMFzYTOTF+0kJunESAfCcd5L58=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=On0Mevr3e6dH9G+ua7N0QGA5gpKlQXmWeZ+WKURE+/XEREQFCNA9eRikMoYhkV+4yzMSNQcZOJAQsJirAt/B8ww3yt+TNFSkTGGjQ7K91ZLqfj7y6ZBdN5lCa//URpSuCqTv6LCjmb3/UOO442mkxWS5D0/R25z49L0QBzpsvyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BAAJIuOE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QknbIr8G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BAAJIuOE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QknbIr8G"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518e7ZA1214110
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 13:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ynF+41OoJ/VJrScl6HizWfAx3cNJzrQbeh+TdIExzuk=; b=BAAJIuOEeaJVIFmx
	ZoiVb3vtn9PbdzSKpgtvXR0moCOicWe6066+2LSLxTW8Rq8tXTCiku8aqzBU6zcq
	coT3MOeIzgqWyMvz5er7qYoNqeesy1Q7ehnkLklB/7NTeB5erbWYgZOnCUhvqoNA
	C9Wg2NZo8Z4tXlxv00zRKu18X3zFdFhKX+eztLEE8+au54yjW0FSHvJKZmozGzUk
	LebgRQFYQm1zbOBvmX2b6m0dzj5pBpAtOQ0fkxeG/jGgixAVZKTq9TJIJiwAFoMb
	mOrT07X7pcuTJr3yLyiFQZYlcVOvttY1802+dYbltBhjje1AsdZwx27y0y8cTvU0
	LlXjpA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6s995kg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 13:33:56 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8423f424d5bso1017479b3a.3
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 06:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780320836; x=1780925636; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ynF+41OoJ/VJrScl6HizWfAx3cNJzrQbeh+TdIExzuk=;
        b=QknbIr8G7MRTABN9wJd7+9IBope5XkzzhedFJywxQ5inByGVJAZ0Aq5fWCDJDx6tyn
         VttpJe+plwrLDWdkngZiOIjRNz+YXloCLGyx2kFzLatMrK0m6JFSn3HtG2VcXnIJsiKd
         jAj3gLVHrvAeDcQoM2UxXHiIfXNqgrvAbedP9tJgt3JvQ3sDtCNzaA3h+vMzh2GvyivC
         dwySTEWvnYTdL95uR1+A4KY6OQYwyFV6MsNqaVKN2VGKqyw7dyabzMqSYsnJe+ypw5LS
         hkNV/sbSGfjozlWe1wLpq+JY8poELuTuwPNe4ApL+T+l6RvpG8iPIzGJx44MmSsSfNWQ
         HJ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780320836; x=1780925636;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ynF+41OoJ/VJrScl6HizWfAx3cNJzrQbeh+TdIExzuk=;
        b=SHTv08DS9GsTG8iYVsfgExZyyIXgEFFTDNd3EFwxM7Fr+7zjtDSQTFePMdoJ0tgPdS
         w1ZjZGCj8AjMLYJKssCpj0tra906uJr/N7qAmVdRCetWQ061RcmCK0FJGVwNskS2BjK9
         qjahMm1SMxfNO4nM6/s5T3Uzdn0SONJ7PcT46GEgEGwqw5ws3qs3JCSfChJT8hlGXO6Q
         ONAjo+K1UaIRdJrWT5E6b1C0Y7blVoRbCu3o9Z4BIT1GmviINJ6sN3pKZfnIw0fc4FLs
         gV5+8ZBFsgu49hUn00hgp9wH9LBF70ixhV8NwmFwigFcp4O5OIQeUfGUFWFLX9NpN072
         slGA==
X-Forwarded-Encrypted: i=1; AFNElJ96yDrsZ2qD45lsPBvg0zqvlpkX6mEfVJM0t/jraf0P9jTjJMSdnDTzeUZ7BYF39g6As7WVvxwhWUq0@vger.kernel.org
X-Gm-Message-State: AOJu0YyCSucXZ+HDd9sh1cjS2c2BNP1fRhefIM4jIqkGdAdeW6YpVL2J
	KuA8WrpMjM6vB1RihbusA1iPCZlCK5csyovivV3lL5xLMqpmIOv815I/ZK8g8TG+mfAtg7WD8rf
	QGAwpYIznJI8W6FaJQR8GzSLesSUtwHRwE/IicrbrnlZfCoyu9zRYR79DeJf+9UlI
X-Gm-Gg: Acq92OGPtBLvnhs5qIwgQjLO8MSYJ9P8YEJ39m6Pg3v9B33EezS7nl046+YQ3hCdK+n
	tPeKcU/hZJT+8Re0u1NqT1riJ/4Sf/iEKB4sfGrLBhj+E9OdOXAXNNFRustuLtdxASZr4wPVdVx
	UWo9I87Ukucl7+uLaING8R7WQahHR9XMMxI14ESi6UByoMD6mcjyEpMLSTgVZn9f+ucCv3q/R5I
	gdX+YwvQGrol4gpx8BHJBB+3Z53A88FZsNOITjeIPRuaNWg3vd1LrG2IEsp/rfg/8aP+EZFnvkA
	U9ANbPBeqvQo1Rh3nanHS6wBj89vaBFKXjMfVVPV16ZWUpEUI2RyNUNy878oism9lKJGy+FjLwM
	ed7tw06hHZnYN2t7GjJqZZs9ZSQ308kATSP4h2WUeTT8hFTaJsACBUjXbmDhr9w==
X-Received: by 2002:a05:6a00:749a:b0:842:5b66:3c7f with SMTP id d2e1a72fcca58-8425b664400mr2129410b3a.0.1780320836208;
        Mon, 01 Jun 2026 06:33:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:749a:b0:842:5b66:3c7f with SMTP id d2e1a72fcca58-8425b664400mr2129376b3a.0.1780320835731;
        Mon, 01 Jun 2026 06:33:55 -0700 (PDT)
Received: from [10.206.103.106] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214d018fcsm9858622b3a.60.2026.06.01.06.33.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 06:33:54 -0700 (PDT)
Message-ID: <b88ae6eb-6571-40bf-a668-b4d85418cb60@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 19:03:48 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH 6/6] media: qcom: camss: Enumerate resources for Glymur
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
References: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
 <20260529-glymur_camss-v1-6-bee535396d22@oss.qualcomm.com>
 <20260530-efficient-inscrutable-grasshopper-40cd21@quoll>
Content-Language: en-US
In-Reply-To: <20260530-efficient-inscrutable-grasshopper-40cd21@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uWFJmHPMfSipdYY95W2VsZVtv1adwNW3
X-Proofpoint-GUID: uWFJmHPMfSipdYY95W2VsZVtv1adwNW3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEzNSBTYWx0ZWRfX1iNp3yTCSufd
 ZFaeH9pC9Mymnpgde0YBHVx+ktHUfOtJKP7w67iI4aNIZoTEosZXctGMBHS/xkebUUyBGDIFwo+
 VY4aQRlkc5ELTCvzBp9hqx+J9Xz7NZgepR/YaO9hb0KjM0Te6Q0XhAjz1tgRngKlTJRBjSin6v5
 cHd0ov26NEDpyT52SiH/7yZM7Cp3ySJYohXxqctKCCSpssWftSChC2v2ObJkMm5lUh8zGHFZbST
 IYyBYlqkwlSbw1Tp+KigXXIHPMktytEUw7G+50VvCC609RykNIQ7Ng/xsJ4awkdaiWoj9KFvyK3
 EddLlG/Gu50u7T0RdzPbxpiJu91Y6U8VQIme9/exZc5K+RCDO2MqAurOCiHbb6J5zJHF3np8Vyn
 2MgQZGjwqDqARpBGVCRM9mIIPqAVu1pCt6E+EhpKrMYOogEqWlkSFmKtAYnCJ5ZM/Qp2DCOW9kE
 WTfcRB+FfdlwGKqkRKw==
X-Authority-Analysis: v=2.4 cv=Zo7d7d7G c=1 sm=1 tr=0 ts=6a1d8a44 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7s8xYYrCI25hbqUs75MA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010135



On 30-05-2026 17:57, Krzysztof Kozlowski wrote:
> NAK, this is getting ridicilous. You add incomplete "compatible"
> claiming that such change as adding a compatible is a complete work,
> complete change (as explained in submitting patches).
> 
> Then later you add missing description of what that compatible means.
> 
> I could not stress more how WRONG this approach is.
> 
> Stop inflating your patchcount.

Apologies for the poor patch split.
Will squash patches 3, 4, 5, and 6 into a single driver commit in v2.
