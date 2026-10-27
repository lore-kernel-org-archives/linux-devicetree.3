Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793080416;
	b=nkDI83gn3sGz47cnUx79b44biF58Gcw3Gz0ASomf8o0MpMNVY5/8iqHOHBmkvYW0QiSO
	 wxlG3tw5tcFWAJL+QTGjNNVT1zwlxbai7aMi+wMxnJLzsAPsJda4WsH8+2JnebluK/cCM
	 rtxjICaN6aYgDBCuJbkPmisdMWY4pzK/cnO5QwerrqF8EU8a2Io9SgVpCcAdEn3+YnrO1
	 daiDNfYTgSmJXhAC/fO1xqzKbPKjgDYg7WA/LM4ePh4CCkDEmAZtwewU68f6dCDMm28Gd
	 6OTLcuwvIr7NGy0o8YmDS9R6Gb37cs7Yb7lUvkIOi8RSYrJO816Mq4SeTk5os52N+Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793080416;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jgYHmotmGu91u0ACrPhUo6ozUhf/4pr770wqlo4hPSs=;
	b=Pz/vEqO9S7KFsf+/xXwFnuVjLYI/+aw3WhJxE3cflwhnpTgMhfIENFvcusfj3iqO6O0S
	 vyypu3dJHYvpm3Fd/Rd9VZUsMVo8nT8WcCEaRCb9deZ69KlY1IPcQvO/DM+lVP/0JwOIk
	 LxvgtSQWXTcuV4TeC5grOgf1JIxjH+lQRS/K4Sxg8Ji8dTs0Yv83u254mIA4LEujnBbez
	 NLrDw8ulyhDl7ZHXoQb/A8w57Uz4byEWITi1LoOazNhvJIIAKHsueA0zPdw5fSmh7T3/3
	 IRkObZNRdsmaBDBolf4uJ9N3yxOf1FxGAn7iuT6Gx7mKyOoEWF/l2LP41FVjXNje3Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cyqEmaCh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j9aR+rRl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A955606A31B
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 05:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A955606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cyqEmaCh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j9aR+rRl
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5YvBI2349874
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 05:53:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jgYHmotmGu91u0ACrPhUo6ozUhf/4pr770wqlo4hPSs=; b=cyqEmaCh0aOI+N1/
	/pDcGlpWVdVeutex5VKS0y+znfue/nj9pQumOoDLWWOpn4DWYxPphMJqiROi+q5f
	9cZxyzwI3+gyBKsSpmp88LxvU1430K0LkZxKH+f+zJFu8PBNtk7agDYKvH1cL9io
	UIOz0XgCq75I3jaqE3nUjp3qV5afxAPdZZ7zqK5Rwf6ld0ZxQlsrgvTmiiQ7Bslc
	ec1vH5+SjCBzwsKg6+wxjTmBue2619fAngECyLoA2wzUUDAAEYyYNWlcVQQ+NyQw
	BS7PUuVMteEVWT1huXXaKQbbFdTTSkCFpxk1nvrqtpZzWawHu3yDFlYFhSR0KvzH
	6uVdyA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh918y3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 05:53:34 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36998507c13so3374467eec.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 22:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793080414; x=1793685214; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jgYHmotmGu91u0ACrPhUo6ozUhf/4pr770wqlo4hPSs=;
        b=j9aR+rRl8ciTvZ6BUIFowHccSHx5BDIK4rrKvqRztP7GtikmIOmrvfrhOiJ5AYeyhG
         icMX1/zjzwAlxXwoJ4NQeX8Utey1xc5GGvgehwaMAfe8WKoPmUl03KkkStsBIA9rtXEw
         zfloCEPou4LvauktiHTJooQKbs/+nBP2FP4fvpE1Xza+PoXduY6CZXigvufhUCupTVG+
         civfT2G5A8PwUdR1W27nmGUV1Zg962yebo1Yqeaaboj28CoPf19zVkC59w1WONu0QuvS
         vc+9dWcF2BQrDoWRgtAuK+Jh7aoxHvAGZjtt5EDlDnckDgmIEYA753CH2a54oIRkZbAq
         mzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793080414; x=1793685214;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jgYHmotmGu91u0ACrPhUo6ozUhf/4pr770wqlo4hPSs=;
        b=TeO8aVEmf0lbDIbdddXoUkXjb6/a4B+j5cvmdFmibe9RwMYbBxMk8uNMPprpHNcbfn
         9aqV1kje1UmbFTNW5L67P/utLE2SIGhJV/M7sjOmAlJie74/NJvPXX+1LVKXeyY2Njpu
         qgxihuTIQ4SlGA+QRAs0+Y5k6aIzm6l7mAje4om5vRUAOz2EXt/Njzcb4KAXa//UXvu9
         rUc7sUc5vDs/EWsiJmpBXVr900awIX4FQXDQtSr7yb86N9VbxinG6kJvyUn8aw6uRz5D
         8Q7RpEpyJ12oWWdesyR5f1Q0yj5E0KnTQZMFUuxSSwCoi+ies97l29clWGZ+syftaBLf
         g5Gw==
X-Forwarded-Encrypted: i=1; AKwUvByugL3yBLBV1EAoh/493UOJKLA6BOCUOk9Du6wR0dkyVyYnUWrJd3cyXByq71WFFoDdi2IiTBtpGFVk@vger.kernel.org
X-Gm-Message-State: AFq9FYJwhzi2SU3nVKESX4s/APBsjjK1zAkhw+KU5BuxX2XTWqGxCzV+
	Asq00Ub83oU0P9svZZqCKvdU67S7SG1Nlx6nSGqB7+vd9cUyDGDS9H5Tk01m8oGsC0eHDGFBp+m
	BH1LJxab3XNE5qXP8q1iQ4UXfDGUjMMUXcLr9P+bLt+BNvXsdc/DArbOUzEahqWG5
X-Gm-Gg: AYBFou0zGnsPRUB7XX3o7isO3Izjhwe7U1tI6YAo62zIRJV9KJYDpD3xBCZDEWCyty4
	jC/5Ta6lGBSQTcKVra5H7RlMixRGLEmEQEE8ffhkXqXyoo+PSaXk+cBNe05b61pnaWjghvtf+Sh
	Es4ToB3FijWdoGNWpw0IFQCJM+oDER1IseJd9WRFb/zBZoSvjgy4F+KGJFcJN9cuczZTlPlFbit
	UWQKFJC+Y7A+48rc4l9eAUa1NvdPG4E+qHYZvQI3qLDDqNuX7b7Y9/CN08msu3LvOzoMueAa6Ou
	jEYuafaoF2WXj3PC/ZSySs0xkBxRplvkamorU988g8zF2ySkSX6wQxoZK4FTUa1crP4AfLOMhfL
	Vsio2xKKsMGIPWHA/0LBt62SxhqmhssYry8RET1ylbjje26lqCXQm0eEiFPtzJUOGhDplSGhmfJ
	Y=
X-Received: by 2002:a05:7301:514a:b0:343:ff9f:26f3 with SMTP id 5a478bee46e88-369e842b597mr12692364eec.9.1793080413950;
        Mon, 26 Oct 2026 22:53:33 -0700 (PDT)
X-Received: by 2002:a05:7301:514a:b0:343:ff9f:26f3 with SMTP id 5a478bee46e88-369e842b597mr12692344eec.9.1793080413423;
        Mon, 26 Oct 2026 22:53:33 -0700 (PDT)
Received: from [10.218.2.197] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d8a690sm30226262eec.12.2026.10.26.22.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 22:53:33 -0700 (PDT)
Message-ID: <114418ab-dab6-4772-994e-5babeed72b65@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:23:25 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] arm64: dts: qcom: sm6375: Do not mark MPM as a
 power domain provider
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-6-ac7f1a0d5638@oss.qualcomm.com>
 <5ad62m2ix47ynkq2ikghkxdqpcyv2tjixtojdobpjpdwbkkab6@gjklpaosvpk7>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <5ad62m2ix47ynkq2ikghkxdqpcyv2tjixtojdobpjpdwbkkab6@gjklpaosvpk7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: y_ipSa3MWTN3vmS3RzSUmi7fddyvpgZZ
X-Proofpoint-GUID: y_ipSa3MWTN3vmS3RzSUmi7fddyvpgZZ
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae03c5e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=UnRI9tf91rfGD_JGq8UA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyMyBTYWx0ZWRfX1NFGCehHHu+V
 2+QyLCm0KDZgV+/4EM1ADysUaIcGVXRQj6OHtmyorNWK9h0CUjUOvoCy4wOU5uiNUEZ/y3CLshD
 xwtSv20FYA6A8tzAKe+Q8OGPlvzwdDeAJNc7V27ZgEWgdeOOKZdTuCRs6eJUyiur/TSD/muocnP
 IGV5sAEHs02tYVvZB6YaYxnpJCwx/c9AuLJ4ww4KZSe1+Foax3qNw1m5P5mZSIjjyB6XBDyR7AS
 hVr78E+D8ewyDQ8wMbAE1jjLYGxVhHXlE8QJ8Lu4Atjljf8/Ehtr4vMNg+pxBQNNL8AFy1EpC0N
 nuGuWNBWqWC0KRpSyFjvCLx+KV0YnRbGsAu/00CX8xV9OZHiUdvbXpJ54j69Ahuqz8Kfciu4mYt
 PStIssSa2qTLMnO3ydvK8lWwruKyQeUYhp1iVsEU8JVWc99oc86Hb+hj7TOLMVx5h3rGTHRVgHQ
 6pxGLMFND8x+V62zWog==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyMyBTYWx0ZWRfX9g+fJkX8B4MJ
 XrKrYaVxzpiSSUImNIK6TsWoacT+VeW/8ZnS1UJyKTW5ARHflMicJPT6FmzitGumG/AB/Zxu5CZ
 vb7d0J4eTQSd743O9Pw6HIDbWr3SUoA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270023

On 20-10-2026 18:30, Abel Vesa wrote:
> On 26-10-15 15:25:22, Sneh Mankad wrote:
>> To make the MPM design more logical and avoid probe dependencies, the RPM
>> notification is managed by registering for CPU_PM notifications.
>>
>> Remove #power-domain-cells property from MPM device.
> 
> Can you elaborate a bit on how the two phrases above are related?

The MPM driver now supports two ways to handle sending the RPM notification,
either in the genPD's power_off callback as power domain provider, or within
the CPU_PM notification framework. Removing #power-domain-cells instructs MPM
driver to follow the latter path, which as explained in cover letter would
help avoid probe dependencies.

Thanks,
Sneh

