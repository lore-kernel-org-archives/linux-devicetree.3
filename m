Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F653F7898
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 14:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791901911; cv=none; b=YnEQ+zVAEW3HeUJo/6kNaIfckfVtWclCuUAuUoG7xn3/57W9kBY276bjV1YVy9SxN1SP4iUtA4PY5vJq0jV2sNDDAq10EjU0QBMrEz+UGAg8sagQ25v+cHCM4uJMbANGvmOkhSYORgTjDlqNCSiVlhlGnHZIj3kT/1h1dgiR4iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791901911; c=relaxed/simple;
	bh=Xc6UXng5AfMa3Tdm3xgVuHWrr4sfMoltxMiAHnxmBU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e7it0au15pnF0/Vz5ZiBYa7Dm1E2liUDOBTSC6tBOhGZde3asxXtCzXWkcaD8lIao2vC+1umtlTaGRFTiZ0diAIU3Y6fFWK8wyLLABmtblSR0EKEKqvS3H+q1uHvPKlck90baTXLF3p/CXV/vD5JW8W8ygIidbkHfnKOxQsTGi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WLZIH1D4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hs0SHoxF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WLZIH1D4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hs0SHoxF"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE44q1009475
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 14:31:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/YOqxGlLfUnOc6Yx8cld+aJVHshZXI4bRKRZq6BJB5E=; b=WLZIH1D4gmyHOg/k
	cBYXf1jWGHJIcH9nlqKa/CSOjlWL6EDg0uiE6jPkwbcE2szL5VWIFy73EM8UDLdI
	Jkz8PVhdPQY2daA5dW2FHefgwewHjmh8PpVKN2aKgRQ/v/ObUCJSY8jwoN75aA08
	yw6tBPiJYpflQn+kXKugwDIjlU7OyrYDVWDG3ck7P0b0Cqs4uPkCORrC4iVlN/pm
	jqDoDj7eExStvPkiVWY2oE23F+oxOMIpK/PbYamPnvsNrvb3jk40vlq6b4ZXGkXw
	aOXpUnFV6JTuVgmg4OdpMM1TabUilDCXQthS/Y/68nALCHrizB1lF/WLEzIWpfWY
	07BOPg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9fgjhyga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 14:31:48 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5e5a0ad2e81so3808570e0c.2
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 07:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791901907; x=1792506707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/YOqxGlLfUnOc6Yx8cld+aJVHshZXI4bRKRZq6BJB5E=;
        b=hs0SHoxFoNZhCTr9ba7f9r0jw906VQhwQssz13Ur0/2z2kM0wg2i5Lx9Nq/GMZp1D6
         ovTKz4+DY4n5FDh2nbqACDDXRtyLI3PZ12ghFRqFxP44a6RIpU9njwtR3nUOethhAnz7
         6GYlpUGmNcoliIwPvs7Igroy9OKpYYm56RSzUnKQVQ6+gdxfulhvBLUZtpHCK+IFFOQV
         79iW9eg5iWdep5X8ZWVS7W5Z9kS0erEMUp40nnp5XBQY6AyM1C/xiceVbUWQbJUUhMHW
         QSZfBgGGDeI9rnnc4ikW6+scxJHTN/8Z8dCTiMpMK5rqWSzfYIhYf8P6SCEsrtNqxYIE
         /1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791901907; x=1792506707;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/YOqxGlLfUnOc6Yx8cld+aJVHshZXI4bRKRZq6BJB5E=;
        b=tNhpJVRbJINqWIBtcs1TXZ4oSeCF/q2LVMKt2EREz/n/eRksrMMaKa0oMgePB7knQ0
         f5WxQ0tLXmC8OuguYgQFEKPIL6wqg5iqmFE3uaSDrgUSmzOjz9amKuM8BDLQuGd78Rl7
         15lSWkSyZbzqhUkaEe+ICp+LdJLGbIVvrvwkw1jHRugp3LOwvv5PPzHwE+2pQQ6ayrR9
         MXvjDtOAjObQUTNr4pQq053cu5Ra39fQhgg5/R0jGiUzFI23BexPu7QwEn78GBsERgbZ
         8PfK4Yb2MGS1PsVW9PVTjC5oCvIw7cP1vph1weMpVo8e7ej9rrQg6nNdNJClnlQW3GqH
         eD7A==
X-Forwarded-Encrypted: i=1; AKwUvBwG70Y3hErPqALQxrjqcffYOLoEOdjEQHK0OUTWD+b4L74Clo1Xt4Kay1rxk1gfbD+IeVhMc5V2t6ri@vger.kernel.org
X-Gm-Message-State: AFq9FYJGcGRN7I3/+tyEYRV/09shcLg3LLv21wojH5Y5axPo4eLaQzq3
	Q8TSvCzvhB7ZeBEs0zd3FOEwwaHYgFv0gBV1X1hmWTIysis8nBG1URsK0mMGiuUP/VJA5VMuUts
	FdjEqrUvxe9fKVcv8S68f0c/NRnA84I+cwL6slL0BbMKbVYb/gUoKFqz5eTcZZAiD
X-Gm-Gg: AYBFou3QM1W011VxKvhN+gznqoqqU1U9UE1kYeAniO0JxIg3eYNMiK3QTxMo4FXBtZR
	cgRa70jrjx/OiUiCPz1+x4pFVJvUhGXQzDVdst7PBBaw0F/c7aAeiLlcgFy58MHub9BHGLSqPvt
	v5rSleimO5fpxwcIN0J5cw+g3AFbdCKLTv8iCopMLpTpAhusCZwZDykxVYnaW13pvlOk33Z4NBf
	PRh7CRUX43B5y62VZI8m4LG/C8RTV3HE16wqM8UWBBlN2FkAqgYa1g90o9qxOFqMUc2xrkciz9T
	w266fJoavMwwYlSLkhjt/0OfgprlwgQWP6vztd7k9pIomR/jtlSKw9VAVUHN0v6fIFDpw1uHAPY
	TVWCufgPZQrw4Nnjz
X-Received: by 2002:a05:6122:6161:b0:5c9:a60c:2732 with SMTP id 71dfb90a1353d-5e91f44e07cmr4248155e0c.10.1791901907065;
        Tue, 13 Oct 2026 07:31:47 -0700 (PDT)
X-Received: by 2002:a05:6122:6161:b0:5c9:a60c:2732 with SMTP id 71dfb90a1353d-5e91f44e07cmr4248001e0c.10.1791901905853;
        Tue, 13 Oct 2026 07:31:45 -0700 (PDT)
Received: from [192.168.10.46] ([37.167.4.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18beacd2csm401121635e9.14.2026.10.13.07.31.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:31:44 -0700 (PDT)
Message-ID: <04a1331f-1375-471e-a674-87039aeb0328@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:31:41 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] thermal: samsung: Add support for Google GS101 TMU
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
 <8142519a-0062-4f0f-b978-980e049f99c1@oss.qualcomm.com>
 <fe159792-c58a-46a9-950b-6c21d2172601@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <fe159792-c58a-46a9-950b-6c21d2172601@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QYKXnI8cqxXgTxZv8EBMjUMk4duTEyCl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1NyBTYWx0ZWRfX/7ztXCzcFFzc
 8FwYhI1i8xfJZVdnz4ZtncRxu8l+wDu2Km+oaLGdbbAClEDa8XXoeNM3R1WqY4HVJe0YCYlZwS5
 CHsYr620hV8ustkQdNJCfnwvf3MRHLoaXjtpQrwH2S0U6LcCU/yM4J47Bgdz76RUnbqFJN+KRll
 xlJHqogZPdvUu9NtHeAfrncu0Fehyw7gejvoAfbctuX8g41cBnRvZCGbsCg8sRI3JQ9aDxbP987
 hjRgKUy15lAyASTGexb/pcV50MbMquBsxsHVfLW8MPfiz9bAtAkElAMkT2m4fxtgg6GNoRiQOMT
 DxSyCQiP7y7t6R66zBYj1WEsBZzahmMqg8koOLT0etVtb7fAsG4PzJFBR4eedsqC4xkVzQ5FrMy
 RX01nHU5Yre9gUI6Emd3H5E9RtKam2P9Uj2jFJ/HkZBFZrI3ayWvHARMIH/CvUXMcARe9jkYplt
 md3IksQXGk6T8gYqgHg==
X-Proofpoint-ORIG-GUID: QYKXnI8cqxXgTxZv8EBMjUMk4duTEyCl
X-Authority-Analysis: v=2.4 cv=PedqFShd c=1 sm=1 tr=0 ts=6ace40d4 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=Pwpi88Ktxb2v7RWwfB9ReQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=GpSJM9idUVmPmik-TdoA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1NyBTYWx0ZWRfX98IIknaPcC7p
 T9q7vdtPCcfWfGM4jk7wotNLlfF6HUCKyYfZx5qWJwgIxgIwT9Jg/5tSzG/OphtcEvtoQbpnZYP
 kO45GSoX9HeDYCxOqHosRHHkJzHvHhg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130057

On 10/13/26 16:26, Tudor Ambarus wrote:
> 
> 
> On 10/13/26 4:33 PM, Daniel Lezcano wrote:
>> Hi Tudor,
> 
> Hi!
> 
>>
>> I noticed I picked up your series without notifying you
>>
>> However, I did not pay attention but picked also the dts files.
>>
>> Shall I drop them ? (AFAICS there is one comment) and let you handle them separately ?
>>
> 
> Yes, please. dts and defconfig patches shall go via the Samsung SoC tree.
> 
> About the driver itself, I was about to send a v9, where I addressed
> some issues sashiko spotted. Do you prefer to drop everything and wait
> for my v9? Otherwise I can do incremental patches.
Well the v8 is in my tree since a while now and I'm about to send a PR. 
The patches can be dropped but the v9 will have to wait for the next 
release. If you want this v8 in, it depends on the sashiko report. Is it 
minor or major ?
