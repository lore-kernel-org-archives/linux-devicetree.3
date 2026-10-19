Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540FB49EC48
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 08:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792399787; cv=none; b=ffbK6pQTfbe6WwiVcT1U65q0ibWgDi4N1E/UxQ4C7Bvlq9uElIUsJ9I3kXDgLV3zu9k39T3lbe8RgZF/FTP0M899jq/KjYOciXTqtZP6o4KOzVZ4Mgu0pe4Q4ByaIlRIyVyMkYrlVTw3HxfqtLfRuu5wDSlLv0cA5/v6yXX2InA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792399787; c=relaxed/simple;
	bh=el2mIH0hwIB/4TcGc577stYSPzN1P7ttrLRnvliBgY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VSG60HfEIkbPwQ204AXy7HFrFUKHTUgQSyfk5fnJhQ5Ov0Wu+l0kCtTjIj6DJqJgfPLjsqjU/1P+TwRUMZM7EsZx52Yq8SRMPM26ZYpGymOc6cWa7W2Zbrs6GgaOAgCxy7Bjd9bsJmvhUsDapYGh01ta2jsDQV8jTF+4FQg2ods=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DnPTN1re; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T0YM/0lN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DnPTN1re";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T0YM/0lN"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OsEq1168031
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 08:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r1ZBQo4xN8AstRqTvSytS5D5nyrbvYomjv1K/zet3jM=; b=DnPTN1re09jbjf9j
	HZUbnBhqjb9lgARjDOSqcoAeDvxqOM8fn2VvH7wAGB9MGb6ER8b6+/vJEuHeVqVg
	n4c+rMyNTScGNoVDSofhXvhVBzYAQIs6vcTfYO+CagHhqhJXtel4iTawkrvNmlgc
	olugOrbyWQ4TOUW8kimxFEjme4ySKRPTXPkHB9Z5nJgb8ow3L/Cpr9J7mrJm/d+J
	aFq8QbyiYHz1/xyWMuujNY885sYyg6QsAl3dnnUASYVwwkp2kxs/ZdpE7Hl6jIqT
	xyMbgzVnZEcGAnz6WsEZGLxJdgEcBTHoMiA9cp1Du2neBw6TXbqs5yi4jWbW5iZY
	RIj3eQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf5c87eh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 08:49:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93edac58b24so69052185a.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 01:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792399783; x=1793004583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r1ZBQo4xN8AstRqTvSytS5D5nyrbvYomjv1K/zet3jM=;
        b=T0YM/0lNb+2IVdKhYG3gT2E0E2XbHgpjZeJ7Pmge2vagt22z2Mi7u/PWcQVx4UJbGe
         KiuB8OQ3tRyasT/sWiH1+vyfAa4j5fKSk9ENyMrk0yMdHdcpHBjHvLOnY7YL28YXkocH
         iQtJNGTj7fT/BMIaVqAwzI9IT2N219OvTyUuDiTBOBC81KT6prCH0CHuJvvoE4naMOte
         w9Naldet0J0cwHaMN1UiscWebfieYiuy0+NuTxwTK14UMiPPrAASAVsERfdBlJoEvfV5
         XwAwXzOdlyufX0h133htLW38pR/A7Dx1nUS1XfOLQRoAUEFYU2nSZUdXwQ3VQvBEycPA
         wW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792399783; x=1793004583;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1ZBQo4xN8AstRqTvSytS5D5nyrbvYomjv1K/zet3jM=;
        b=FQDO0vW9h8hCKFcqpKGwl9Da10Gw+KFyCmHldZEzZ3taFFgsCP+Wi8wnNI7UZsxcN3
         VBTiRBwLwwwIShuieKkDJyL9rSTH12b9inlWSRoZwtCIUEbqyZeoDogKRu6gkk5LoIFi
         VIvj7oQfEpKRAE6EQUjd1N8Hbkba5ueNSf5bUi5sh3OQds47AGHPT3vn6jvmrwNajIO3
         WjRLN4LENQHhGVI1M7N9x9xTlXfJy+OzYbcz1p+eW7TP6bgLcjoaLPXzw1vgRJzDAVbc
         RAYfR0bJHtEoURD3Za1fpIkrbarTjL+HumE/NI5EEG4ad68chGRo0SEENMh8G1IucxUw
         G+sQ==
X-Forwarded-Encrypted: i=1; AKwUvByIBYS7uZCj8nEevuNVAnSSlxI3hU1CDsGUjlKpDJBUpAQm1LTwjJvisC/yVbLsevPeLx4paZz80lWA@vger.kernel.org
X-Gm-Message-State: AFq9FYJRegaFkeUvLZrZsUix6OV1gjs7ll0xDM47g1JgXdbRsPgDbxHy
	pWRdSB738rOJ5ZrI4lpPOX1SDD3eFNLjHuupTyxXHVsmPaUGnTb9XrcOs/DXO/5gwd+JDIgXDTx
	+0Z9NL7Qi0OoxjtpAFjagOLqQExoz1rkDuOAFDtgYBcIvC49lTWJ5+5oP0VXTJStoxM4XFYBK
X-Gm-Gg: AYBFou245sHBAmoTvFC6S+zL4VRaxnQdHAFUiVW66qQWr5UljgFNkIx3aGyMxytQuoL
	Ibmtwq+39dGWn+wc2k3jz87vC0b4djTjuOIEimNnWDOwaYPWh2OrCr8BLqhk2e+cPf5mNdYUudQ
	e/duwu+LJweOdaNuO8Iqd/54XcIbheXKNiTHfXp/BSrejxdYShaFOBpigfKMxYjgRia2DdRk6oo
	zpHUZW/01TYKU9at+zCwYGGR009vXu0z0o8zAiFKUih+NlcbGLN1N+OzWdz1PM5eg7UQqS8N5dP
	rI8YYHVHuetoqZxWcfnaz1vyIr98eKQp1blgqwYGYkl7ucoP0spwxHfJzpY8iktFCZ2s299nBJw
	QTQpYVqwWWCpuaKn3B1H4DQ==
X-Received: by 2002:a05:620a:19a5:b0:93e:571e:94f0 with SMTP id af79cd13be357-93f29cf1c85mr1411377085a.3.1792399783472;
        Mon, 19 Oct 2026 01:49:43 -0700 (PDT)
X-Received: by 2002:a05:620a:19a5:b0:93e:571e:94f0 with SMTP id af79cd13be357-93f29cf1c85mr1411373785a.3.1792399782856;
        Mon, 19 Oct 2026 01:49:42 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dd3190sm347944066b.23.2026.10.19.01.49.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 01:49:41 -0700 (PDT)
Message-ID: <eb559119-4d52-41be-a954-2c26492d6a2e@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 10:49:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Hansson <newbyte@postmarketos.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        David Heidelberg <david@ixit.cz>, Abel Vesa <abelvesa@kernel.org>
References: <20261013-sm7125-samsung-v4-1-3233901b48bb@gmail.com>
 <5fb086d1-7725-4d8b-a2c9-7627f6da7cd9@oss.qualcomm.com>
 <b33efcca-eaed-4efe-99c6-035afd73dec5@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b33efcca-eaed-4efe-99c6-035afd73dec5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNCBTYWx0ZWRfXxk9BDeLnQoab
 aHSC6lBsN54CMkwoSI9pjMiZDOnGmhX2DdUbjXFHGPQ+Rl2Ap5Ii9WUY6EkeYm0AM2dIDqyt1sa
 9uXCSxQkNdZ3JrsdjGdBFvUH+nP6F94=
X-Proofpoint-ORIG-GUID: t--yHDShUssP9yD2xVCAHX60CUuHxIJ1
X-Proofpoint-GUID: t--yHDShUssP9yD2xVCAHX60CUuHxIJ1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNCBTYWx0ZWRfXz6zfAMRYATMj
 JCEGeUN87JW3kLYLJOg7dLIMIj3qXA3Q0sTzS/N1+JCiB3JprD941C3YK+AlOsN5lHg4JnirZX1
 DrVUEYHldfBnDKce4paPbq+eQWE1UQgM5ycV8X5uMrHeMwJT8crZAgfYFmu4TJs2+VkXxnBhUJM
 g8oBeNdn1uhRt7273V0dhX35SnGNA2kKx1jwHTjGD0PLpeUqOC0Sl3EE8zWcEjrquBmUAi6F1LG
 jiJYcHm4uVG2W8tD0V7Wk2xcREgg3pvcd0+FHieZ0hvW954btWaC/lDVOdv2HK2Dnn5wucImeRW
 AqVnTooIdIxWIofH4oH1UOQ0MpDhQCSmWb7RDPo7IJ9QTKXm7USbKawAOHyJWwkPEzbyKoYdLn0
 FomdPas5os0sIq713TFcm9K26hU+3DrLJ3I/6tjwwbWpGo/PBqWSwDKif076M/WMWBj3BQupBXz
 oQyKc1DgeE/7aQ2yrJA==
X-Authority-Analysis: v=2.4 cv=K6O3jCWI c=1 sm=1 tr=0 ts=6ad5d9a8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Rxtn_4jyFG-xpNbExEYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190034

On 10/17/26 3:29 PM, Erikas Bitovtas wrote:
> On 10/16/26 13:56, Konrad Dybcio wrote:
>> On 10/13/26 3:58 PM, Erikas Bitovtas wrote:
>>> Samsung Galaxy A52/A72 are devices released on atoll (SM7125) platform
>>> in 2021. Add initial device tree for SM7125 Samsung platform with
>>> +&soc {
>>> +	i2c_17: i2c-17 {
>>
>> This is not a MMIO device, so it doesn't belong under /soc
>>
> Will move it to / in v5.
>> Have you tried using the bus through the normal QUP driver path?
>>
> No, I haven't. GPI DMA support for this platform is not yet upstream.

It's a copy-paste job, try it out please.

>>> +		compatible = "i2c-gpio";
>>> +		sda-gpios = <&tlmm 51 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
>>> +		scl-gpios = <&tlmm 52 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
>>
>> style nit: (foo | bar) instead of (foor|bar), please
>>
> Will fix that in v5.
>>> +&usb_1 {
>>> +	qcom,select-utmi-as-pipe-clk;
>>
>> Is there no superspeed / DP altmode?
>>
> I could not find anything that confirms super-speed or DP altmode on
> these devices. Besides, ufshcd-qcom fails with "link startup failed 1"
> after setting super-speed and removing "qcom,select-utmi-as-pipe-clk".

On the stock firmware, if you plug in a display via the type-c port
(perhaps via a dock), does it show video output?

Konrad
