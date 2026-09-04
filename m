Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D552367B5
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 13:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788530390; cv=none; b=REVjmH8HZRwlL0b0FLj0NNKs+3EtQWFu/J54b9iwa5Wt+W1AmYxxwNj1+yB7e562dAhtWQ/yn9eFPnBV3GjP8PYpFRoC/ZWq4fadmPwTp7HSFgh3yPcmwUs4ZO1aSWyDKtiBrTMzR4KgXxSGhG8jRkLujsOoiHG31NWpnp+HHM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788530390; c=relaxed/simple;
	bh=rOqwJWlnCyLtEeUosqm01QDB1wq0VG+lLC+a/zLyXaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=slh9bfmQ9qZ/34EUpjDu35Sg0uq+AX6MkUtdfz5ua8iDG5TXEFvvSzFxe3Y7bQcFRKXiBjMwyaUrmphfbU7wbaArZK5ILOmjiWAeULDWSnBT2DWIV/tOcGLfQ0EFPbARTbMd5Rjt8L35zaZNDgO2CITCkMKHt0TFw4lDmS91cnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fY4xsw7H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ym979Y5S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fY4xsw7H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ym979Y5S"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684DgZGU311182
	for <devicetree@vger.kernel.org>; Fri, 4 Sep 2026 13:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jxs2oaGwNjggxYlTmrfnys1Rey8M2EkDDSrCRn43Mpc=; b=fY4xsw7HwR9/FMO3
	jOCQfqol95XN0fLUfd+N7N9h9PW9lOFV19GbCzojuA+I13RdKhzgtKmrd7n8dszf
	prafltu/5WW2i4NjouPgcSrgFodABKV5nC952ErfIgC43A9skmCRrCs5FOWzuWKz
	/HnqL4OULbe00I1oaZuoG9BpYT+Y1wQVIQBgKsE2AZDdPJ1usaoCjyFxPSWtwzmn
	KwjyRAJcfQsNFRuwcbQyCK0RuFnOsLqMyw3eg9yw9D3soWAOporGKiIyX8pCTcwq
	jjGbBEkZdiDzedjEcCrUG2ZeLiYaH31aRza3C6znRn8fK3ajtjc3A1OZUVX+R8XD
	nyKfwg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfbyvmvee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 13:59:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39af92138f9so1670763a91.0
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 06:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788530388; x=1789135188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jxs2oaGwNjggxYlTmrfnys1Rey8M2EkDDSrCRn43Mpc=;
        b=Ym979Y5Sojs3nZLzywopMzfjGhrHWn6CPG3kyR0Optgnb4dEXwKZRFxhN/F26OdwG1
         GN0r9Muo7Nt1OxTmEBOOtU/Z8716xAbfyxmeebtOLYWu3KlWT1EL83oEII9yXZfVKeJq
         CHlmS+PUnYRSlcGbzVAHT7VNePflpece/8iaB9M/9uAIqWNsEQb17vhL9k6F/qlcvaVK
         7ykhHZ7383qOQ6CO9n5hettz50g/MRuQPSFEM4W1ebJ9cdrXaw77QVG211fd4tcru8ML
         xVe7vFhIxAJ3zDtK7XlmS/L/oQ+asbSd3ppk8cj8lPNzeq6TxEBD34mbYERgKVJgvtJa
         mTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788530388; x=1789135188;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jxs2oaGwNjggxYlTmrfnys1Rey8M2EkDDSrCRn43Mpc=;
        b=eLDhWLBih3r9x3cuFsqNRLqs5hASVFqlHPt+fkP9Sd/YkKpEZa6NunMicCfJK+HDu0
         mIebSIz/exjPfLulGxHAvAO+sLEr28/JEiTItEGYlhPYXM2Y1/wr227vyS+5HeVIxGCy
         aRoC6XrLP7pL/3yZ7Cdg7L9EyHSL3HJBVu78tkMKsfXCIJRVvZ+QaRt81YtTkVB93y0l
         YriV+gktwATsgyRmiN+PLQFKIFT1V1yEqYX3duaEkwK4jXdHpAET7pQz04bxJRRHjpaY
         bdL42cCHMRWaxWV2QFwS56Tt9yfTwTwmAbqCwNEqjpyROvgt343CQukD6Cl8ogWDuPiv
         KGrQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/4Z0GzTuWetdaQXf5vwBOSLjGIX98zp22uueJ78Zpa5qKc1axmaNwdkiE35oji2QYNNm2yUM+Hg0z@vger.kernel.org
X-Gm-Message-State: AFuF++n5bSHgMl7496Ln4Hp1lzmC0uPn8GAjsyvIeIh7BOEL5i9FshUU
	ehsznLHHedW9EvXOsCfsTVJcxqCJeem4UmLaY0FFJuvQZnWNHEQyhw8S5g+cVdUqSYaPs1S3OuV
	fOmMhucSWn5ONwc6EzJTestJohRuIbZvvhSpLmhG9245l7JD+HOaNN0KnSUHXvjYB
X-Gm-Gg: AYBFou2iyE1tYJAUkxl8JkX2O/pDbe3pfb6+8ZEjkr0Q0t80NOr1QKTdPykBWWTEeqv
	I9+/Wi+OMkWjCPGyiW0O7yLoI5ePP1BZSJJf95fA7mTNpxlAAu3VBlSyn9Auowv9+mHVG+3Ypgh
	tplk8tg0yNsgFKztLkqzIFwSSdrQjaQt14xaTx93oDzjqzRUbhyt90dY3VghSo04GcwBdLYiCfK
	cDCpTiA2CoIXBUXwRmgJsNs5iETOzQSLoeciyOzBbwESmEfOCc9baEKWt4zDYOsBpeBdm6BdrX7
	wvtDKVaXkrSIbi5Cxq2wC/h2dLSjJ2EtBAQBwpI0Io59Fh2h00XQ5tQzSQM1Ytt3qZK+rhDiA3h
	r2mOquuhqwXB7Ih1lKbRzQOn0JaWnqefux3g=
X-Received: by 2002:a17:90b:4b90:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-39b07f2f31fmr14673335a91.6.1788530387600;
        Fri, 04 Sep 2026 06:59:47 -0700 (PDT)
X-Received: by 2002:a17:90b:4b90:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-39b07f2f31fmr14673267a91.6.1788530387149;
        Fri, 04 Sep 2026 06:59:47 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.235.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm10478642eec.16.2026.09.04.06.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:59:46 -0700 (PDT)
Message-ID: <8968c292-0613-4420-82f9-2e3fbf30d81e@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 19:29:33 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 00/12] Implement PSCI reboot mode driver for PSCI
 resets
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>, Lee Jones <lee@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260903160401.GV2133376@google.com>
 <CAPx+jO9Hi2R_UnCEhsXLwf74c3RTb+RodaJ6SOVXbQX_eHt++A@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAPx+jO9Hi2R_UnCEhsXLwf74c3RTb+RodaJ6SOVXbQX_eHt++A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 76UiIuzGz7uBr8ci6GNiIp1uQwVJU3zY
X-Proofpoint-GUID: 76UiIuzGz7uBr8ci6GNiIp1uQwVJU3zY
X-Authority-Analysis: v=2.4 cv=C8vZDwP+ c=1 sm=1 tr=0 ts=6a9aced4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=KLk5RGObiDQBJbYytlEIzQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=KpQgwA5mMx-DUpL1sGUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDEyNyBTYWx0ZWRfX4FJ3DnkG3evK
 APxm2wc5zEOAhHh2rIF6wdyOFIlcIbIxUZpEw/6/tG20xvZhVicbnwMwvdbZFbKCNIHG+0xII+O
 iupAP0oJZg9TZOJg22aEOKaLHFqT24qRk4SNrlPQ3jjR6t/JHqwY2o6g93W3ap4siNOgm1jHRdQ
 shru9oYzn6vQb0yAwtKOVuLcRR+20UWADQkmSwlHd7fTdvPOSSmuzjuihCsJaW8VFuZIhUIV+QW
 ZMCPB55L51t2/p8By8sYsIrpSsC6m5QFBmSAAscq7VVQxPd4RgCuecF88b41POy891sT0w57J+n
 wQF9aVVb4S74oZPV2kbVDvexbrKAlXY9wU3cRNAkygChQ5ZvWi3TwXGovvp4008EE6IOkz3OReN
 fefVKCC8pLMrrLnooBlUa+Iv8WKyyuo8Zy4gGNI19IOCwVsxhNFv84DEiUQiYMAZ2yAbfAHxLYi
 CtU1mz3wLUPCiV5TSOA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDEyNyBTYWx0ZWRfXyTYvMY9jTY+o
 MMzIZKsIq86Khct8yp3Cjx7oi79fSOHjAvoMqEWXn+mD7tU+omyxytFKwwMPwU6DlX85nwFOt5m
 vKKG1lOZ3vFVogO6Gh11imsXirJRv+A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040127



On 9/4/2026 12:47 PM, Ulf Hansson wrote:
> On Thu, Sep 3, 2026 at 6:04 PM Lee Jones <lee@kernel.org> wrote:
>>
>> On Mon, 03 Aug 2026, Shivendra Pratap wrote:
>>
>>> Userspace should be able to initiate device reboots using the various
>>> PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
>>> patch series introduces psci-reboot-mode driver that will induce
>>> command-based resets to psci driver for executing the device reset.
>>
>> The more I read through this submission, the more convinced I get that
>> it does not belong in MFD.  This is a potentially nice "architectural
>> workaround" if it a) didn't break some of MFD's fundamental "real
>> devices only" rules, of which cpuidle and reboot-mode certainly are not
>> and b) didn't require a massive expansion of what the MFD core is
>> designed to do.  I am more that a little uncomfortable with the 150
>> lines being added to MFD core support this workaround.
>>
>> My best suggestion so far would be to base these changes inside
>> drivers/firmware/psci and use the aux bus to communicate with the
>> various components.
> 
> We had some off list discussions about this as well and it seems like
> we are in agreement. What you are suggesting makes perfect sense to
> me.

Thanks for reviews. I will move this to Aux and re-post.

thanks,
Shivendra
