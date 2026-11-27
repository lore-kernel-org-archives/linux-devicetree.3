Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795755519;
	b=EDZOiTk/1K3lblKyTcFzepUTVcKihmFRgyKkXLjVq3QdGiTLbSaKK85gg5QxExLrTTlD
	 k8VLDDqlf39MHq6ni1TbZd43WV+v+xPMdRmiWOeozNBY9oIxo17OJOcNUPADzdJodUlO6
	 LjnlTtkPSTjZChFzmgZ477hze88zDMNWW81trauTKm73NHR2EWzqsg9zGqmvVVLIrClLC
	 0Cy9LIMbeCaJyldcaTMYMLzLADZPP1WV6+foYjwIvrq089tuLjzJPRXs3hStV0pr9xUL6
	 k4lqXpI+wQdzL1wMYhgcXr9lbqxFqPmCEPTBa/KpfyLz8xHhqHEEhy1TLDmBzDFbklw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795755519;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 X-Google-Original-From:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4JR4pQFfNiYIOOdiiGpAjc21yV4RSSVFN7iI72ZS3r8=;
	b=00CF6njwtP60zwWcRHCAN2wtSgm4Kmozv7itDd24ekoD4R3aqhGE9uK66baYtfN0WT6G
	 0BRzYGHY4OR9gcDYYwGafaqPLB6ApHw/3WydHUy7XDyuUPilp51Gg/pghBOPYmYwhPOHe
	 Qn/ndJ0IKz9/BagKzV6Esj7CgkXyKHJpuTNpO7eERGe7lu1oiAhAU/TXvnOtc3wzWrUZT
	 0oCRMOp73iyXNcBKH3TkedKYWV3e6n5EsJwbXBWHiok19x/bifiOth56Fz6mdL9kLFwiq
	 RD/weNajoTtv77z+K9YRhJLLnV29xHts5UYgw222C8w3pTXANyl2EPtkcl0HtjTOqSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BUEnskkz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ClRwes9v;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01AD606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B01AD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BUEnskkz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ClRwes9v
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJwTZL3865275
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4JR4pQFfNiYIOOdiiGpAjc21yV4RSSVFN7iI72ZS3r8=; b=BUEnskkzvBDazavk
	7KHeSowFViWKLUZ5dgeOI3qjqhHp8oLy+qrLkAS6B1MktiA1VanIDymJKU2lyEnf
	+eGIkXnDokyqAvO4OIHWxJhbBwh0ktJodqpPAseFJa6OA+GVpOdEgq0g1we39VGu
	z8o6OwHp2k+7CORCauydVhlISrPzg1ZGunzcusmjX1A5tyjtu01+95tmMGsJy7oc
	k0iae/EpdP+XD50qw57AlnDPUeh40OL5GYNTEc2ypKPoyUsF7+BsvpJ9UbGbE2m0
	FPrThvu8JAHr1FoCvN3jl2EQ/fZyHUJRVU8AUatCRQI/fYRh01GmM0tIM2Dt5uE8
	obGZsQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55s7fb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:58:37 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b56c696405so11538454c88.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 20:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795755517; x=1796360317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4JR4pQFfNiYIOOdiiGpAjc21yV4RSSVFN7iI72ZS3r8=;
        b=ClRwes9vezWk/f9LCqw921Z5uzcpXvoOQQdP/ucejwG4IjnW023nPpav8BsV0Y8wRr
         4VPTlMRPR6kuxkw1ZJl2Lsa294rC5K7auBbNC21/PxmlvkAKo9ka6ZD0jOGzy7SqJJa2
         X96noKduyzbSAwCJgVg3UF+oD7iUz0XXebUrx6Lzzfua0zv/nKwlViw4QhDV93hOZHV9
         FSYeiWyEvmXcYS70rqJZ7rOtSWQ5mWR9boeKCgGgP83qeAd9lksrhT3qsYb7OHbXTk1b
         RmVXfuLwTres9IxMgrdM6YvmZTHCMUH2lYzgrIA5FWUgd3NMHdxyIsSa+9tKsJ2SKh0U
         XJbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795755517; x=1796360317;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4JR4pQFfNiYIOOdiiGpAjc21yV4RSSVFN7iI72ZS3r8=;
        b=HPUXl3uygMBVlJeaz1uJRDw16bM/+dvgfgP2HMhDQWmtv4bklHKyLchkh1myzAIJWJ
         n6iBubzBh9jILJ0s2d2lQ+7QFLNQqNm7vFF+dtlt1ezMju3zUGu65WXNKLB1964//liK
         nnjJlTSMlnmVTsaHNtA5I8As0V80sJ3o1IUwJaXSWPt3W+/6JXTlGOoJUNvu7fk0htc6
         gXmVmogjLqHIehcHHEP2iAuRt3gBDrMm07ewCNXzr5/JmgDutW/ZvCSC8/mRngsn35yJ
         GT7+l8Vt05Eojc4AcD7rUw5BOzBNrpJHGUMfE34KBwJ+FYZZS7MvUFiStd8QSPMsfhWY
         0EyQ==
X-Forwarded-Encrypted: i=1; AL+hErGkXNiKVutHuMlNLWs8kZfhbDB3JzQBmu4ClGds24Nmhi2ETbOXT9rWUlRqBg7XbJcQEPihyrBDI+lL@vger.kernel.org
X-Gm-Message-State: APuU4Z8q5R+F3yVgA4VOcrVBjSDHmGZvlQyI9qt/+rvQDd3E/AWFJua2
	h4zthgk3sRWi1WhWNiwppf+7JaZ/Fpl7fzrCshowx6Z79/GXgXIfhsk92Mgd0ACw6YbXJ1XZ/jW
	KYEH+digz7AI82kRLUbMx855qsgzpmyA0UWdFsNTcqyDnuEvROJSVL1nXT11GvL7z
X-Gm-Gg: AZFdTZdRj8x8+nndpxJgfFPmYr2EO4lPth+csRTctqS6ZNL3cuAQ5z5xfXm3+7YJl7I
	lCFDNNk2+oErOkPSGUxW1U7CpB+SB88v+BolZfdh0IIl0qJu5ixa5VfhrAmy3r0GGLVFK29WBvR
	EAeTceDwvvH4f976zPQIHuu3W172BhGs5qJgc2HxPK+C0cwNzH/2Nzz26+qD9MSpY1zmUbBdSv3
	ddUNTpYT3Ob3T6QgOrunDxL6slCBtECNLdPzG0BXjEBdfNQb9G599f6cPywvifW1Z9vLMmgsxuY
	QUcVdrmWWWfZOtgWCbxFoNh+4FxO4i+cbqZk0D0OKPu4vkedHUEoXvIkcXXRCcO6F11FWEh/eTQ
	jl3RHi1+9NRZN3kwxmNypHAfG9uLCEOiqgUSLO4hRQDutd3B/MfY2l4CcBwnPAg9D//Zd6ro8hS
	LX4HK9rrc=
X-Received: by 2002:a05:701b:450d:20b0:1b2:4378:3545 with SMTP id a92af1059eb24-1b5568e825emr25219034c88.21.1795755516419;
        Thu, 26 Nov 2026 20:58:36 -0800 (PST)
X-Received: by 2002:a05:701b:450d:20b0:1b2:4378:3545 with SMTP id a92af1059eb24-1b5568e825emr25219009c88.21.1795755515892;
        Thu, 26 Nov 2026 20:58:35 -0800 (PST)
Received: from [192.168.1.42] ([183.82.131.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm60891790c88.6.2026.11.26.20.58.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 20:58:35 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Google-Original-From: Jayant Shekhar <jshekhar.shekhar@oss.qualcomm.com>
Message-ID: <1e6971ec-41a1-4195-a46c-d267e1ced071@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 10:28:28 +0530
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
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Add Novatek NT37802
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jayant Shekhar <jshekhar@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261109-jshekhar-nt37802-v2-0-a8e9efdcabd7@oss.qualcomm.com>
 <20261109-jshekhar-nt37802-v2-1-a8e9efdcabd7@oss.qualcomm.com>
 <9b05fd08-7bfc-462b-81b8-a560350f4235@kernel.org>
 <c19f662d-8d04-47c9-a458-838e46521f2d@oss.qualcomm.com>
 <6f256993-24e5-457e-bcba-7bad2defc9ee@kernel.org>
Content-Language: en-US
In-Reply-To: <6f256993-24e5-457e-bcba-7bad2defc9ee@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAxOSBTYWx0ZWRfXzpy5P6UKsE3o
 SqIUu5rXc/fuMPXKkLfuhYh2rDad9ff+kJQEQpi/O+DNXaqSKALU67W+w5zN7SOod0XTZRr7zgc
 YlcvXuREu9nYoap3X0wiXSPz0FO97YI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAxOSBTYWx0ZWRfXwwY/xYBHskTZ
 alVcQ7FL5W69chSMNPNhBbDLdNbcjEwjq25VQIvAjdXzd/Wc29sSfX2AqNhiEmqpglZWsyheoJ5
 f6LHqXqFyU9VSij5BzKrDQUrQ9cyxg8MZvWKmLbtW6ssJbt8/DuEFwbK3wQ5MCElGLOl6sFSM5t
 p7O645kmCisChRnAZkoa4gBewL2Mhurq000CYJQ4giAmJo/OvNoYCkkizGkPdGc7xdcvXFP6Ty1
 TxxllYY606gPWM6jnM6jrUgCI5EC5dljKQmf/QfF2W7sNL8cxdQsK0sXLsmx72vtBkLXpV3NXBY
 Cx+viDAffO7hvt+H4wXsh58owL84AfN4b4XVO1x3HbGTXfy7tiCdNQOd/7Aer9UerzlvBl/0X3y
 srLiVlQMISrPSSDuTIKbjVga/dG8xfDLheO1HYf9n0IP0lsvQnNaWBaZsimOSl5qxekQb8KL5jT
 MFFrBDyC2iXVRxGRNsA==
X-Proofpoint-ORIG-GUID: UJREY6gJssXVkwghLrCznM0vWgmqQuxN
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b090dfd cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=i7XPzsavtsL+s9i5bvvXzg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=iiqVWuNAnhh-rcyhhn8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: UJREY6gJssXVkwghLrCznM0vWgmqQuxN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270019


On 13-11-2026 13:19, Krzysztof Kozlowski wrote:
> On 12/11/2026 10:37, Jayant Shekhar wrote:
>> On 09-11-2026 18:48, Krzysztof Kozlowski wrote:
>>> On 09/11/2026 07:27, Jayant Shekhar wrote:
>>>> Document the Novatek NT37802 AMOLED DSI command-mode panel.
>>>>
>>>> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
>>>> ---
>>>>    .../bindings/display/panel/novatek,nt37801.yaml    | 49 ++++++++++++++++++++--
>>>>    1 file changed, 45 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
>>>> index 1b38c1d0af68..be318cc84d52 100644
>>>> --- a/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
>>>> @@ -4,26 +4,30 @@
>>>>    $id: http://devicetree.org/schemas/display/panel/novatek,nt37801.yaml#
>>>>    $schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>    
>>>> -title: Novatek NT37801 AMOLED DSI Panel
>>>> +title: Novatek NT37801 and NT37802 AMOLED DSI Panels
>>>>    
>>>>    maintainers:
>>>>      - Krzysztof Kozlowski <krzk@kernel.org>
>>>>    
>>>>    description:
>>>> -  Naming is inconclusive and different sources claim this is either Novatek
>>>> -  NT37801 or NT37810 AMOLED DSI Panel.
>>>> +  Naming is inconclusive and different sources claim the NT37801 panel is
>>>> +  either Novatek NT37801 or NT37810. The NT37802 panel uses the same common
>>>> +  DSI interface and regulator supplies, and additionally requires EXVDD.
>>> What is EXVDD supply? The example DTS suggests it is something fake.
>>
>> Its not fake, it would be something like below:
> OK, how is the pin named on NT37802 side?
>
>>       display_panel_vdd: regulator-display-panel-vdd {
>>           compatible = "regulator-fixed";
>>           regulator-name = "display-panel-vdd";
>>           regulator-min-microvolt = <1100000>;
>>           regulator-max-microvolt = <1100000>;
>>           startup-delay-us = <233>;
>>           gpio = <&pmd8028_e1_gpios 2 GPIO_ACTIVE_HIGH>;
>>           enable-active-high;
>>           regulator-boot-on;
>>           pinctrl-0 = <&sde_disp0_vdd_active>;
>>           pinctrl-names = "default";
> Looks like something for backlight honestly.


  This is a panel power connection, not a backlight supply.

  Its purpose is to let the panel use a system-provided DVDD rail.


>
> Best regards,
> Krzysztof
