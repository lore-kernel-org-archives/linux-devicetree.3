Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269471;
	b=iHDXc4TYaQuZiFfZ2OQXVO74u+iSqB837Xv13MWAAdwzFF9BCb3otSu3p44rfNu4TVGm
	 Filjodwo7Xo9Zk36o5dEfNskViYx1/vdyvCp15bi30nXqtxWWti805b7dP0iDLcDZnc9L
	 aX6skDK0bhYRzenDereTKXUh157MBA82ytYtQJaS8W8C2VFQfbFNx+l5FynUUg1gkogE9
	 DY60BaX7OYMNnia+mjdzzhNhhj2suwfaMBn4M8f96z+YisxlromMDbzj75BJ5ZDEo58uy
	 8XYiZG549NZP//Xsd3hKvCn02a+zFtQc0XrD8vgQEKoYZyis1rrAWj4HRPzD1ur9m+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269471;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GcPKgaoCuNaXXKfK7YHbVbvTQ8K5JkvfLVdxqmyckTc=;
	b=miNFJTTBBO2om8QilBLnWWQrHxiWbVx3HcHOK8hR9bpHvigxVMSymC02QaosvGvoc948
	 fnFaAR3eqmiHM5d3iPsimafxoYYucnnn+o7P4M0oSJYsCRCTupedTI1MNzGsv2+hzwRk0
	 JTen0c27s/0mjJSoKZ9dWCZXxJ3vL6FpWLcc5OZm2JNzSDUfOwbVkHsX8x2RCGB2ylVVv
	 xwVTOENnDxerceaulYZNCsp7UsbFMd5+I/VxpckLQMCseFRpRTm88B1pnaWfm9vcBk6EZ
	 4Mn+xZdnDnBEgY3dYoUSu5PqR2fW4jnf2LJ63sA973DPBK4Bhoq+uzZbNZllrx+/0iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OhntgV04;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fFTZJg6g;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F21606A335
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 10:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7F21606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OhntgV04;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fFTZJg6g
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vGvh3775355
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 10:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GcPKgaoCuNaXXKfK7YHbVbvT
	Q8K5JkvfLVdxqmyckTc=; b=OhntgV04JxTQ40rWyj5d2xZa7/6KHd5OJ6xHoU6H
	q3j5Z9X+YprB6mNk4SZ67s0eBct7rQJBF1geRSaXc/73dkP9z+SzEy6t8KOAhuH1
	r79VMzerhOJ/uJw4sI9xav+XuYdzAZi5NiwPch5lm8aDee8ghX90uYGxrgR8Ozy5
	1hjOMjEgP5deK2FIFH8OQjNOxvl5LlvrvKoO7z4IllkQ6bgQ/VIMKMdUrd11hPbo
	orkQuQs/1phdJYmIuW5GC19SUfQYaWZTb3jjfsUtXQyEwync+LIXT69OORa6UYX9
	mbn4kDS39NMOY//FSnO/4359DWFRkBnk2E9RmInl7JgSNQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkxshsacr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 10:24:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f3969a2a7so277353885a.2
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 03:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793269469; x=1793874269; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GcPKgaoCuNaXXKfK7YHbVbvTQ8K5JkvfLVdxqmyckTc=;
        b=fFTZJg6ga2GolbRvVDAuBD2jVBZK1wPFgk3JnbYjG9FUbzxtnIolUNLqDH7uTokc11
         Xvx8MoS3XyNmJZoP315S31fDQy3P/flmXbABWf8HOYJpKrexFUd98D/8w4rJ0O5wAFgi
         2q9siXuBzU0CVnXwTW4CwQZGg2Yud0dAET8cU0li9ucDAbSH8c0eP+oRWXEBprWfdEho
         W2lZXXskfGEmLYYBaHP+S6WdWDCCo644X5iBdB2TKv2kkz/fkXUbmsOhq91v2hkKvX0z
         JAt2XMrLASHQBzE4lzH/CltW2dGx/HfeyyxpN5wzn+hybZIVkiwbn95q12IFsy8q7Cvo
         IuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269469; x=1793874269;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GcPKgaoCuNaXXKfK7YHbVbvTQ8K5JkvfLVdxqmyckTc=;
        b=qXILSaPD2LlsBvmje6FniFe9IpFIB3SJXoLfSabU8/yFIB7ZF/BruHEjclihWTZqTF
         1Qh5+b/CDKkQFCy0Gt23aN0GYrSiCahOx8u8ovwycj1RC5XGteHgnJhVZKPhMGp3DIBi
         IupnW1YmI5lH/4aKmQ2s0mfIIQ9hIvEXAGcT/UW1fGU7cxUbQ7zwF4N7W4Tj+srYaJEG
         9vcJa7zGBX8oxP0qiVxkKDg0Fx7Mx0cTaUKbNhddelwrR+6IRX85jYzr0MdwNYyQrFOW
         Md6BUsoTlaZZz962tqJFbUflQlwmy4jUJkc0StIbeiL37EsRoNGUZ9TWnbuI8ZJj182c
         30Fg==
X-Forwarded-Encrypted: i=1; AKwUvBz9HpU8nQTNWR4p9YYDJnGJJh/tkgqpUhXZQ4yTJLk1z9HuyT+IhsHUN0/D+c+42xT/hzWVhhfLmuUU@vger.kernel.org
X-Gm-Message-State: AFq9FYKV12lh/4yxmkTM9WiN8Tw1TXKFmvVg2ba+ulP4SQTXgrmiohZY
	2Yo0WdGEwD6QbI1pZkCyao1evcaNohfRlJpi/RS2xsg/0prfd/i1mREK7gavyjErzNLbenU+BU4
	dbbhLxlIE0Bz/mJgcebVpXJ10X9/Bdg2QFpEJJA6+Q7XfHaOQVBu3N4W2EXT2TakRPCXFNtAZ
X-Gm-Gg: AYBFou3FtMA+2PBclTmnj2XZ0DzfqJizBqgVbRl7BA9Xh07FjutxBVwik8ZOJ7uG3jM
	PKH6WAL4A1c3soUPzbaNA7+zbOQBxRm7U3cpV5UXe/I2INjRrJg76SpdzhJW+D6u9pnN5hiIzin
	oGX4HcFh0AqxHik5VtloZvOGjSRPjXLAml8Xvro7FBgljoTeh+Z9S2BzJVo3w30x700aGc1Vu9C
	PH3nUiPCf1VYjIWQ29INm7B6o1LISoIbW2TM07OxTUw9jrg7H0DY0CrLLqcUM4iw1AwaaGoaN8t
	OQW4ff1mCAEXuBqexbx1yDzRHKTa6oVey6MFDvgkge/zrazzY1pGcRU/slCCPf8OSx4gHIe4/LH
	2P3kK1SAh4Z+UKAuB846oxfA7MSNeaCVqLuurlBouCjQbTn6/+Bh4g2Hq2pNaOk6m
X-Received: by 2002:a05:620a:400e:b0:942:a42a:78a2 with SMTP id af79cd13be357-94408a8cae4mr713124385a.31.1793269469033;
        Thu, 29 Oct 2026 03:24:29 -0700 (PDT)
X-Received: by 2002:a05:620a:400e:b0:942:a42a:78a2 with SMTP id af79cd13be357-94408a8cae4mr713118085a.31.1793269468363;
        Thu, 29 Oct 2026 03:24:28 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48e0sm33998692f8f.38.2026.10.29.03.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:24:27 -0700 (PDT)
Date: Thu, 29 Oct 2026 12:24:25 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
Subject: Re: [PATCH v27 10/10] arm64: dts: qcom: Add psci reboot-modes for
 talos boards
Message-ID: <25q4hk2nu5nd4udoof4tsslyktdned4bygrgyzuknhvvvh2stt@a67p3qh6ddch>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
 <20261029-arm-psci-system_reset2-vendor-reboots-v27-10-fa4b3ff1359b@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-10-fa4b3ff1359b@oss.qualcomm.com>
X-Proofpoint-GUID: 1JPBgsRIR5eeT5t9jMS7Rm-UXfE07sXZ
X-Authority-Analysis: v=2.4 cv=H6BOUOYi c=1 sm=1 tr=0 ts=6ae31edd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=1QY0aOnFgCSDOgRkrtMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0MCBTYWx0ZWRfX1JHyHZRlMaQF
 ibjalNw48WJeuXVU3begWWuC375NQ7yMls6KHKzM3Mw4bx4Ek4/hiHYzsa8VsXFya4cRo2rXkJl
 Ee2Yb89uQV8NMgeBe4cl5dzLrMS2r8A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0MCBTYWx0ZWRfX6m4QdNYbdWnx
 ZE9U99S3Zel+3alo834AxamkLqBWqGpJyRAIo3pdaqxbc0QdRylPM4FPUuXHlotuElllLc14A5F
 /cWrpDAzesIQGMxvzZFAOaOXHpRK8gE4/iizLB40SKBPBP2jvwNq9xX/SwmRE4RxS3X308YbgsL
 d124mgt4j16wbKPOLZEUj9zqoZA/ZHZ8ob2A6QFj2108pnGl27CaGrBN1cvMsSgzZow+EVrJPF4
 7zNcP7VKlfP6lXLNVAYb3JIQHfQD+1WmuKoIdbgu0e5owDJOdlckVAiFloB5IeJe2OfRPShGsj3
 WvjtcuAhMb6BqbUld53I68PG+XVPV2WRvLI6bh+ACsM210ySZapZze31TjnOIu0CMGbIWow2olN
 5mYUmxXcu77x/XKy//WEcx/E6/gj+o6dmhT4Y0WNCm9urScttCAYGm22TtzntVvmjOoC8uC0pll
 W8QyqjokX112q1eRRMw==
X-Proofpoint-ORIG-GUID: 1JPBgsRIR5eeT5t9jMS7Rm-UXfE07sXZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290040

On 26-10-29 14:31:04, Shivendra Pratap wrote:
> Add PSCI SYSTEM_RESET2 reboot-modes for qcs615-ride, for use by the
> psci-reboot-mode driver.
> 
> The following modes are defined:
> - bootloader: reboot into fastboot mode for fastboot flashing.
> - edl: reboot into emergency download mode for image loading via the
>   Firehose protocol.
> 
>   Support for these modes is firmware dependent.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Song Xue <quic_songxue@quicinc.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
