Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73963C09F1
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787739924; cv=none; b=PJYht5LzxiLNPhKhvQw0IFKc6hrEaggLPjjADvviD2sLHu08a2C1s+LE/XxosyF/+1H6Jh+CdfT2uk275EW+64CV2cdtS7j7gqFchFxMDdV1JIVuzxbYqIHLPiiUL3c3ENKlhQlJcsElTcgzeuXBJcuaDBWECP2rIV+OgGs7io4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787739924; c=relaxed/simple;
	bh=I88GN/uYqwVC9eoo9jy4m+SRM8GxwidDpaTvvPqK1mw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GxEpuFTeY4gwu5JRzcGuybyPAd1GuA0IxmVgLmxLyp6eKB+1mhIvf+b20vJosPWXDdBdZ4buGcr0Y9GIy0sd4X96YWMC6hCe7myH35emLRf2eWUgy+XhTWzYv88rw2fBmXnQAyjRXrVr4JRK4EdaRpWB1SAlAHjgW8Btidm5tcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VB63ATLQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hy/uF9bT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VB63ATLQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hy/uF9bT"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAH8YL3648323
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HJO/trXKlZ/xBjAP/7wuREYwh1l8M0R1QYvRGNz9d3Q=; b=VB63ATLQh1rIxSTK
	34aWxsiZ6QQyZOXcCfvXu+ptD9QteLtPIarINOeBNbLNhF8cCKu6KviKlqJoy87z
	+yLzBqOKXLVdXbMlCUeS7xk0tjcB5brZTna7RM1bOXBpHiaM+8atqQTrksJtrJLZ
	6uMzb3t+Ym1kqQyFM9GkOZEq8VZdbc6nvnAmWZJ7Gvl7AZzeHa6Upp3bHokU4nUy
	smit6pykgqIh5gKKpyObaJAVRy78b6Wl/jpLNVsnh9pvASSsi/BKAYPtWltu1jca
	P6uWaZQGV3dp2M+3zNdUOneiu2UAdu9T4FaPssbiQdYiPe7ChK7xoxbZ9uuYtvmN
	pMAU9A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uthrp13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:25:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51e9d892f0dso2256461cf.2
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 03:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787739917; x=1788344717; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HJO/trXKlZ/xBjAP/7wuREYwh1l8M0R1QYvRGNz9d3Q=;
        b=hy/uF9bTJPryfH5Ly3S4GUcqFayEFSTjHBe9yeyWLZpACBFD26gqdE45R/y0hKYY8M
         vkcDwZE2z/hbFes3lU4oc4t5rds8OHTr4mJ2lvy3SCmQzACeBm6XjQnNH1NvEuN/0dNi
         wGDkOcOB1Qu/DAqWuCEkQqdx/4T7hoR7B4E7keub8ffJZyO3CUDa5ZsoskXWr1bxHJxh
         /WNuPYJBoxM98Ba3ySgIHpldNptAlfK8DuIal/moUbQsjSm9+9dj1CPGQ8fcdB+8RP3p
         R29wuOyoAcqMtiN67O8Rs0MVC3XuD4o9eUKfxNIDYUVnp8Z5DPAdHc64gWJdGpxHst/f
         Nbnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787739917; x=1788344717;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HJO/trXKlZ/xBjAP/7wuREYwh1l8M0R1QYvRGNz9d3Q=;
        b=OfMrDxt9tWVm8cSKxjySurQrm3lVjKFa0bvlEecIxQZJm3USRDBDfrjny9v05BHYef
         REjKpPyLegYbjQdJRSuKueLTH7Om40Ty4GqNtjZTKtg3j9Tnq3ayxwa6VMwQzl8DpJmw
         vXr90nVhhggBG2B7khIyBApyreaMFiW0k69iSKz64bjETaslQAaeNSlcjUGuulHl35im
         kb7XwzVRbOcj3/0/+Pb7WOzBJae76uiZ8pTwM7OByqXA0amT1Aebv6s8D7/CyXQKBd50
         9NGlt1xtBG6kpQ408uje8crn2D49V5CbUlW703Uh3hljtfIturVztxL0w/u3WJcdZThB
         zR5Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro3j+VTZ4hNId5dlj339MMXXUav+ekbnTZSo2ecmgGIsd9yrNM3nOVvl2qRH+W47LnyObur+aV5E161@vger.kernel.org
X-Gm-Message-State: AFuF++kOsycWwx3Mh/YQKeWBvOWmxuVB6Fc9UqNhLfoGRiOEwSupTBNw
	peb8/rWCAKusmrk7NWSjGN/U3VX++E/ptoq5l4MPYJ0glYUqpHj2ZU2AGt0ufmj11zgvTDwQ+UF
	GEzCCh0E2MmToA+FDNVnDD1S9aCr8ZmR52gIisrQkEACs56+Q6DEV4cFUbC2ukK94
X-Gm-Gg: AR+sD12MhJXNXEGuPVCX3RqKmCXu5tgkXMMVVBsPOwcD0IvrHdfYX+JtNAF119bRXKL
	9z2YXsqpkdXZJ48gsjhLEq0bNHOeB4JBeGzUfdw/BhhSqCa5JzWJsPhReEHkHUWxjTj74/Dj83I
	wp4ehFH4myXu2Lx3uF39xAejgvkSSZzsnApSDCGQ9e3L2XzJkBdMVUZH1kBq2AJZgfxLGsNvs1+
	kreElGXsRygz6JyxsGduL3RU0i9PZZ8sVHcemJIrKPJbaVSo6aT2iOsfOQ9AoePM9ATod7BLITV
	cIq3lin7b8ArTn+sLAjnVI/yJm+CcdII7WJPZQ4tpjFGvqPt2IsGCECHN2mKyIefUNHVzapP12m
	5bD0Nc1JkVeQQOK0/rtzlyEqg
X-Received: by 2002:ac8:5d14:0:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-52e42446072mr39442131cf.5.1787739916916;
        Wed, 26 Aug 2026 03:25:16 -0700 (PDT)
X-Received: by 2002:ac8:5d14:0:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-52e42446072mr39441781cf.5.1787739916424;
        Wed, 26 Aug 2026 03:25:16 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8b5e5esm3137249a12.4.2026.08.26.03.25.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 03:25:15 -0700 (PDT)
Message-ID: <c61f297e-3a42-4b23-b341-0f8d97d4b78f@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 12:25:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs6490-rubikpi3: Add IMX219
 camera overlays
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: Frank.Li@nxp.com, andersson@kernel.org, bryan.odonoghue@linaro.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org, festevam@gmail.com,
        imx@lists.linux.dev, kernel@pengutronix.de, konradybcio@kernel.org,
        krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org, rosh@debian.org, s.hauer@pengutronix.de
References: <1ef41a49-dcf8-4252-acdd-f7f3c1210c55@oss.qualcomm.com>
 <20260825111300.578054-1-hongyang.zhao@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825111300.578054-1-hongyang.zhao@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EMA2FVZC c=1 sm=1 tr=0 ts=6a8ebf0d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=RF00TdSWAAAA:8 a=CXY4OXtTAAAA:8 a=EUspDBNiAAAA:8 a=TEp5gEa_GWzzUIBBXKoA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=_nx8FpPT0le-2JWwMI5O:22
 a=-bjYFdKVujGyJWVmPOR4:22
X-Proofpoint-ORIG-GUID: 1PqzBJ-oCSZagq_pJLCrZRG9MJa7mvva
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NiBTYWx0ZWRfXyE6wYz/Hlx0N
 R+ZSZEuvUNScR8GDMEVikU8FU7Op4i2JFBlUbxwltESG1fYXLDCrjW3JbV3bh1OrE4Ensl0xgE/
 ZCvxMJITt7Gpb7vuxEe4Z1SJicpMOUrt8IZK5sY5fT3tnJvyEVAcxba8MDXM/dvkQsgQChaF7+u
 28fpdgKPlUsRdoY09/aEQCsDTPeB/G+/UDIV9r/aBsXkXsfOIheLSmizMOo5HqEI75vsFlz77z7
 adphw9xIvav4zUzW/S9eDkd2LT/wGsBHzLCJUFyAZ+oUE3aEU02uSjziOUza5s9KCMoTKGCsg7J
 mi3oG/mikoIRhUyQJh5YqNy6qwvEEAkZHv4XGgKuqaiWWGOzyoqvMZHr3w4I+Nc2XZ//dkCAwgh
 q3g+Yk8Wz2PAEqARlSCTMErfwX9i2UpTnsmRGghvT5sYGT7rEHRngrLxbnW7cPr8fDBOFUX00oU
 NRLdnIJTETigFFml1ww==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NiBTYWx0ZWRfXxSzz5oNJ655f
 8IuPys+GcZP3lwlKyUEOQBgXDTQ05mO9p8QTF08tOqGwg7LW3tCiO36CVFH9UcvY8bKXwbqyJ5c
 aurejXuhFw1Wd1sqy8QDaqCG5DIq5cw=
X-Proofpoint-GUID: 1PqzBJ-oCSZagq_pJLCrZRG9MJa7mvva
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260086

On 8/25/26 1:13 PM, Hongyang Zhao wrote:
> Hi Konrad,
> 
> Thanks for the review.

[...]

>> No reset GPIOs?
> 
> Yes. The RubikPi camera connector does not route a dedicated sensor reset
> signal. It exposes PWR_EN and CAMERA_GPIO, but neither is connected
> directly to the IMX219 reset input when using the official Raspberry Pi
> Camera Module 2.
> 
> PWR_EN is connected to the module's ENABLE signal and controls the
> module-local power supplies. CAMERA_GPIO corresponds to a pin that is
> not connected on Camera Module 2. The IMX219 /PWDN signal remains local
> to the camera module and is tied to its 1.8 V rail.
> 
> Therefore, there is no board-controllable reset GPIO to describe for
> this camera configuration.
> 
>>
>> You should also have a reference to the mclk pin state to make sure
>> the correct pin function kicks in
> 
> The Camera Module 2 provides its own 24 MHz oscillator, which is
> connected to the IMX219 MCLK input on the module. RubikPi does not route
> a SoC CAM_MCLK signal to this connector. The fixed-clock node represents
> that module-local oscillator, so there is no corresponding TLMM MCLK
> pin state.
> 
> The Camera Module 2 schematic shows both connections:
> https://datasheets.raspberrypi.com/camera/camera-module-2-schematics.pdf
> 
> RUBIK Pi 3 schematic (CSI connector, page 13):
> https://thundercomm.s3-accelerate.amazonaws.com/uploads/web/rubik-pi-3/RUBIKPI3-IOB-V02-RELEASE.pdf

Got it, thanks for the explanation

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
