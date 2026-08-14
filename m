Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C50E46D09E
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 13:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786713269; cv=none; b=Zj4k143/FEcFhhLNr9YE4bh+92SxonZz/p40ln/VLJxXA3onG1k7o/zWB/lWM4jYIZP+pu4vImqNRhrxgOvvoSRr8cWGEkL3Iyaiam/C+/PXEAICsL2pBF023jls1j8cDHSo2J1wY0slXABJZHc0GMyQDPCJjvhAvM8Mjmr+/kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786713269; c=relaxed/simple;
	bh=DeXrYOF1Wymq7i6AG2t2RjGNTPwbswPu0A2UMnwWnG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mAhH0lfwg1wXsq4EsmoskHx7BtFxm2u4ZdaE3ZrJNqyn969ydhwsH8LmSAo2Lz3sJ5Iw34/fHinx3QnkW2l/ZrHXVpcChK1cYmNiFqW5C0D8nh0ElWqld3JipyBr5zk/hXSofnHGcuW4XB5KjXNahTjodkOt+jxL5OBkfjzzkyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kCE73+N1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UCCiupWE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kCE73+N1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UCCiupWE"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EAbCYj1099524
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 13:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vviloqTvq3WKiFKD7ZKd1dUGZvDqcy3SN6oDPTL/GUo=; b=kCE73+N1jcjwYL1v
	1NLH6kaopfSYnyiDAxEyMWBypQ5ncYrAPKVN9AFrxyyAQwikfI/TeXh0x5+c7e7N
	eEmpGdOR8dQ1w95X9jTl6sJikBQPiX8/yKS855k/QnU2Zk2LxuYeBziPeOrXn3cI
	uWMHlALQyGOyv1rBlCj792HvFYj7d03jLiEbZozTxIgYNEfSeUXi1SLWPbz99TkE
	3Ly2uaa8lpCCLrSABZSKx6B5YUtxb6mr7wZYnT8s8iWLjlIBySWB9Aegrrlds5P9
	P9uxd6rJG2g5zo6eRwyxCuJ8rdWhpzARbJaHr0QjafZ71u7UWvolQytNd1qX3Wj1
	DdpnAg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g20tr0rdh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 13:14:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c083f1818so12448741cf.0
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 06:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786713265; x=1787318065; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vviloqTvq3WKiFKD7ZKd1dUGZvDqcy3SN6oDPTL/GUo=;
        b=UCCiupWEMpt4O//wo9T+g2jnFt3EOXgcPluCmia+DBZ8DgwHrhAdfzGjtd6rWK3CH1
         Xm+aru+7rd9KbuI5WrXId9uqHM6joAz5OrQQqgLZAlEesyIZbxvpSnn8p9+VzcFOnuE4
         RMBa3IwRosaffBTthcpea3Sxq2eqcV51B/l9+EuyR5tGGfLXqqYLvzs8VYbSKzmW4weL
         EEL8+oHFqI0kXJPKkG/SSP0BH8Nz8arEbZPTPLevQrfGQIkMuZQ3RBfLVLghXatxxnH7
         pOWrjf+Z2naDc1GG8Xiw+QJ0W+4go1H0fVtf9W54YIUYkkAFG19dDi9dZabp5phuaBRU
         HjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786713265; x=1787318065;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vviloqTvq3WKiFKD7ZKd1dUGZvDqcy3SN6oDPTL/GUo=;
        b=flixiM4DAsIwTw+oP7U0ChGKbtF9hPFJalSTXo1snmVgcw02r1AmF9MAboI153k3zR
         gYD/gSddfmW3JsFgCO8HJYiDNcgRNJeHvWGaX0FAoDkF6nVgT7p5juIabwLsZnBxJfaI
         kT6f1dviATRxZG2UdnQShRr33MWGFTz39dZ1ETBh9kMZO9P7zY5Ge10IBoH29ZH2NqPz
         zylbJYdDmIO8VlmXwajn/NpdZKujmuUAZkDscR8PAhq7krM9jaVIbGHJI3DD774silKq
         /zf3mGw3Rkn7cB3DFStdb1GxlAdfY5TUp4CEfxGMRrIGdcfbHiawobmumorcreNgg3FZ
         Kg1A==
X-Forwarded-Encrypted: i=1; AHgh+RrsCaOLCCvO7lVYuktqawoscfbzCsuuJsL+Ih8pnAU09Osdpy+Z+ZxGRD7EWSanbVYOWYIk8BjxWyLc@vger.kernel.org
X-Gm-Message-State: AOJu0YyheF6N4UQxUvUoLgjMS9W+PHvhwAt3xUWJW1AkwC7wpwpLYFgk
	fVFV61kqmTLyM6wkA6pNa8YbVb6VO8asiUm9d1mGhMiCPb8U3ZwVTMuzaWuj3r3pn5J4ds2+6hp
	GPUjrFwoROOjf6y9RuKuZ5INcRrRAIl3MfYhmGcENJv0TWPVPH27C/Ypl2TfVktXR
X-Gm-Gg: AR+sD12gOeqtVICVcqprpoQyq7Xzd9nHrWpfl6WLVjQL5mTqFLvbZEwUZisYbqRPfgi
	wer99+vmInwIuIgcXKh5vfGJu/Qd8p1mAH0S9pc9iLIN3gl01oe9DlXkoUKapMg54z8fKqTu5oh
	ioBIUYTR3E0grA1Er1xECRCyC3IJ9GGJTv/1pcUqc/FPoyCTOVN7yhRCRm7L2A6gef2bWyBFZCH
	6fvE4hj+rKJ2kpELXDt3H0+F4dDYip3AaSoEeDT2e4XjohyzUhQB3Tt1CIm1YzNoqHB5GnvXyMY
	qnGkuwPpKf24JR4eCU/9pz+qzEkotjdmhCmuN9jLSZmTOFVymocEVrRXCOkxu0bOakJRtP6pAGV
	JkMRLMfoqU2K0yjc43ey+gBhP9V4wQOoSnBR8dPgH55BgWoFy0BhERG4xpqco
X-Received: by 2002:a05:622a:c6:b0:51c:15bb:b4f2 with SMTP id d75a77b69052e-52d85501022mr56159661cf.27.1786713265334;
        Fri, 14 Aug 2026 06:14:25 -0700 (PDT)
X-Received: by 2002:a05:622a:c6:b0:51c:15bb:b4f2 with SMTP id d75a77b69052e-52d85501022mr56158721cf.27.1786713264841;
        Fri, 14 Aug 2026 06:14:24 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:e4c:e833:9d1f:4e19? ([2a05:6e02:1041:c10:e4c:e833:9d1f:4e19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499899753ccsm32150965e9.0.2026.08.14.06.14.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 06:14:24 -0700 (PDT)
Message-ID: <8e82f564-be0a-4bcc-a9e1-72e0d26ca0f1@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 15:14:22 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] thermal: samsung: Add support for Google GS101 TMU
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
 <DKNSMR9KRFQH.3SQDYW46B42FV@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <DKNSMR9KRFQH.3SQDYW46B42FV@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mJn522fTHJ5U05RmMbaUFsqL-bjvfHW9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDEwMCBTYWx0ZWRfXysgqhAaQt6xL
 fZZrZh7dM46tEZYPJHeSfhqG4NlY99VRh7JF/CFlnXyFLUx09YT/dpLbREmDCaz+kaQYhwq8JFH
 KX89vcUHdyIFhQvCFMVekPDHFpdYijZ6Vediv82PGk12a34plIATBlq+XBgxfCysMTaGCTMEs5o
 bJVYnEJc6EokLgjZpwUkfKl5BDkOE2Lzev9jVnXE3wqY6LZjyE9IVH2mN2gxttGq/1zFAdTfsnb
 Rf6DEOIFRdJc3PpaHUDoiSteD+HUBepkPM3TM5uiTMrx2/c6v6MyT/LySWVihddfe9ov2RdCpAr
 TxvmyQzXCPeAPg6+U+r1KgsWl6rtSwQDrCda6b8TnG6hF1FR9WscoJP5RT1Cj6Gf+Dm0GU+cMxx
 frsgDjUWQQoSHcegK0DprNpXw/JuNuIzxmNzBztj/o2oJ/4BV+aM91p26+LUTQUPVT8VSAqPI4s
 w67eN7+9LKkXPNj2V4w==
X-Authority-Analysis: v=2.4 cv=UrdT8ewB c=1 sm=1 tr=0 ts=6a7f14b1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=z2-NpXgQeZIsa6yCj1MA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: mJn522fTHJ5U05RmMbaUFsqL-bjvfHW9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDEwMCBTYWx0ZWRfX+Y35jFo4py7c
 ZQwyXPQwBPR+WtaVq3fuEWQPY0/sDQdKsMyPRYMJ1SB96+LMCSwAos1QPpVAaH6PQO1ArqdX8IR
 fLXMts569mPvo596QCh/xQrK5cr25dI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140100

On 8/13/26 13:52, Alexey Klimov wrote:
> Hi all,
> 
> On Wed Jun 3, 2026 at 2:00 PM BST, Tudor Ambarus wrote:
>> Add support for the Thermal Management Unit (TMU) on the Google GS101
>> SoC.
> 
> AFAICS there are no new comments and no updates and Tudor said he is
> waiting on feedback from thermal maintainers (for 2 months now),
> what's the status of this?
> Apart from some required updates [1], [2], is there anything else should
> be updated here?
I did have enough bandwidth to review the series. I'll have a look 
whenever I can in the next weeks
