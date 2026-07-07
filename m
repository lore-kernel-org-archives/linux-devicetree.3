Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCDF30E0E4
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 08:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783412413; cv=none; b=i98g3Xl6mtrQ/9PADmPqSJ6wWpeBtEwcMDjO2mipnZlhbiyU9iiRGLBY8H4OIpZsAdQj194u+JJpBG70ayocQqfeHi6TY5JtBlqJGcZ7fQhVES9FVc3HFPRTs/dconHZqkGKMwgpKVj7uuPhxhPak0OHJIRCCBhh9tnWdMxT/MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783412413; c=relaxed/simple;
	bh=n5OeMK1bQ8yHLqI/ZoKerpO3/6fLbnwqt2JRjj+RJ4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lsae1uC/GVb2W+kXMTMG/VkbcRT1/wJGa6Kq5fEUSfVqm+GLv/gINiIiPuDpb1j5M/jmHkskrR/x/TeW7sTWZEbhedP4eBLcjwChT/YyGTgyJi+KNUISkiYVZF6TdtQ4YYNsmdWDiliFn8yPDuMbps6Mn5WSDUq2FqTuHxKSm5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OwR7a2IU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DWupFSWi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OwR7a2IU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DWupFSWi"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DsRV3182768
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 08:20:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ajiWotAS1acnmFOssC6CEZcKuC/BL6UhgNsm6/8ZsA8=; b=OwR7a2IU4grZsFRg
	tJ10AyJ767+wHooZigQqyP7lwpzdi3QdLvIFSI4IvL3agnXL0xvBSDDMx7nbEbDe
	w046s+2s6XOJwzSDHgfaVnQDNoc/rmfbOQDjlje9RH1Ypz8ZJ5fSr4cEIzKCUtLP
	bEJiKt9Ysv42GJY9bXE/vKCxsfnAFfLK7UvWZ5Zjx20ZA1cmi6kdWRvE0MWwUQAo
	GlZaKUAFocOyJw1gCeyHUG9jpPzXc4tBApLe4hOpkB9ujldJD3nEAy30/fcub8k7
	x9Mc2WAvq+QuwW0j+jldxp+LNsSrO2+wBXd1+2MEmrkf5boAOistFdWg93RmPguL
	b9R5ig==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v3t8fjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 08:20:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c20762d21so47543921cf.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 01:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783412410; x=1784017210; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ajiWotAS1acnmFOssC6CEZcKuC/BL6UhgNsm6/8ZsA8=;
        b=DWupFSWi5kAwf/750V4ez4Qfn0FKacmv4GMhLlti/dNYGGJ4rQn3DqEKAnsTllxWej
         6d7bHVcMnO/ID4KhVnPxVQj1ZX6GcJ0TazJ6LyckjjdR3dIB1xyRDplpWMjgJLtkpZeh
         aL0fpszGEu067/XUDR4Ab0s0TonsfoBwObG0zGTT/esKHYg56uN5Sgoh3/mzmpesaunU
         8vOf7hoirmnmKxnDVNDM+JVCvsVauVegMcFkeeqxXAprzzH027zCnd/4ALvdsZqV/TYs
         kQgs6YP2yTrOu0ulwhRPE1F0xzo76gEz6CTgAiNTzsgD/rhoQu6cLkd7aoRrjC4fLDg0
         A8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783412410; x=1784017210;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ajiWotAS1acnmFOssC6CEZcKuC/BL6UhgNsm6/8ZsA8=;
        b=WMkTVhmnnd0eDI3sE6jbPHJ9SU1WS32jLIFz6YZQCxjD/IjYdv0aHMqqadlIFCnkp6
         CBWIWQi5a9v8H/BqBLEMynsmgrS7aDnv5jTMCBKFLjZt++HkVEtlKYZeyBUVvmJQHQO3
         DtXPYvbQJ3fUK4eVdIUSgsB1V8cxHan5FA0odOPvXWGgx0eqWfNxWHoZXbV9k7zJaPcZ
         1V7tAdiGCPVMT/bfZzWB2oVkk9DSb7ZK8PJV7Xk5QboOjIucBI9qNdDerVFVE7BQ6Cve
         gqzYKDzk2k8+7CJ4tAxTAM+lnxA1LM+8bm8l7ETuEm/uyukSaP1/N0HIfkJjw53K5nzC
         p7vA==
X-Forwarded-Encrypted: i=1; AHgh+RpN24MkzgexBWsXsPa+ZBD3ouUFwZyzcdWAiwBSxzSEp0Q0vuRyT9Q89wveUFs00wWGnWCfNI+u2Oug@vger.kernel.org
X-Gm-Message-State: AOJu0YzmY7KuAXCZaQFaeJEFXc6MSoRydxOyuCrY2pC6EnUjGBSml+po
	7pK6+XGtbQhAWNgSbrgieHPseGJheaXgZx3cCX4M8Aw1AdLuX7kXQWobMAc8fo1g7aCRo4Ahl8m
	IkKl+wuFuRkGfyp9t62KLzDtgxfUTsmtts/i595o3Gh8p/v2L1nxFR8uss6Z3cZoi
X-Gm-Gg: AfdE7clKm5wubtAIcIZ/KniIUxySAk/A58qEb1VO65KoXhtQZB99VhTQWliCzcbnxoR
	dQMghCT545EOwVH1/b6baw/quITeM4VONrHiM+bdto1YwOT8/XIDrVcL/ltuvMh9/GOUCYn1cnp
	5L4jD8CdsFSxxLwxQOlYf8OlG8j8knYcfN9V6thd0mS33uFMHnhyzkVT50WpWKfogvNWnHCin+v
	WI6DnGtaWwyKXEll3NxY8r8ygMVQrswBhp2qV33vvaINw36cZEjORKApFM6HMICivG70BPcEpox
	WItgDSL7RRS3AgwHtvUGekSEcTfRTwz1SrAmJU86cP09u5UqMhnch1XABKyPw7tBOY98CGOwDj/
	gNSgABWWQB8fPmc+zfxSWvkT0Am+EooBm2XdHXz+GGBcEectu/YVBZlyktLo4dG/ob4WOUUKk2Q
	==
X-Received: by 2002:ac8:7d0c:0:b0:51c:12bf:d4a6 with SMTP id d75a77b69052e-51c7487df08mr45476141cf.48.1783412409854;
        Tue, 07 Jul 2026 01:20:09 -0700 (PDT)
X-Received: by 2002:ac8:7d0c:0:b0:51c:12bf:d4a6 with SMTP id d75a77b69052e-51c7487df08mr45475921cf.48.1783412409444;
        Tue, 07 Jul 2026 01:20:09 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f32660sm37747195e9.2.2026.07.07.01.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 01:20:08 -0700 (PDT)
Message-ID: <38f5a2ec-ddc5-48d8-b76b-c2ed617392ca@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 10:20:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: embedded-controller: Add Lenovo
 ThinkPad T14s thermal sensor provider support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
References: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
 <20260706184648.35613-2-daniel.lezcano@oss.qualcomm.com>
 <20260707-armored-azure-terrier-4dc3d3@quoll>
 <8d579153-efa5-4c8e-acae-87f3bdfbfc24@oss.qualcomm.com>
 <457242e3-6a40-49a2-8d86-214f9167a928@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <457242e3-6a40-49a2-8d86-214f9167a928@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: epmpFQxe3ivcPPVRpmjzk87HUUI14yD3
X-Proofpoint-ORIG-GUID: epmpFQxe3ivcPPVRpmjzk87HUUI14yD3
X-Authority-Analysis: v=2.4 cv=HqVG3UTS c=1 sm=1 tr=0 ts=6a4cb6ba cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=qYa7bHtEPbO8xArO7mAA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA3OCBTYWx0ZWRfX2ov1izFZJdLV
 90ZoQZctwO6kO7Ggk6gOFBVXkvFhoAH37Uf2Em9IC3/QV0SEM2Zl0G5bNZO3FCXf1iLZkDPlwTB
 s98Y4jXje+5nhqVuUPvWhBOyoiA6nik2Re9U3DyevTPCfWt7yKAHgnkeZSGEDjKTVuUjPi3EBKr
 sjStGGkAraeaAR4o0FmD19+s0tZ8L3oAeSEJTHiy+nEl+w8mu9iIpTkSlzC02Rv+RHvC7s5hE2m
 CLhuw6WDmfFaJTkAUS+DxCLowme5SANUEo9YM1JI6MN0VFPRRMECzVJXDSccKjAmGYJ1MDl2tXn
 j/wu98MwwOLCU4AArKYLwwrDoRTQFRhaGRvV/ywVSDS9WNpGHX4OKhXwYGfFO2/9mdmKkisUH7e
 uDiXMScdAG/Nuok0sj60S7hUS4RN4ozrUze2cgsegnCtFGGmrH2RSO+C3WruoF4LVHfUgft0eEh
 E+BRWIpSSxuz3LjaNQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA3OCBTYWx0ZWRfX+ZPoKNsN9VUJ
 0lVDcjxBz03pZpWrJ/wduI0ALrQ3HsdlZ0jI7swOBv0q+plVWbUrdzteb8L4kNzofNNEDvsc5F+
 Zt3JQeed1UV/GkkBj9YfCHlo/OD65nk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070078

On 7/7/26 10:09, Krzysztof Kozlowski wrote:
> On 07/07/2026 10:08, Daniel Lezcano wrote:
>> On 7/7/26 08:38, Krzysztof Kozlowski wrote:
>>> On Mon, Jul 06, 2026 at 08:46:46PM +0200, Daniel Lezcano wrote:
>>>> Document the Lenovo ThinkPad T14s Embedded Controller as a thermal
>>>> sensor provider by adding the '#thermal-sensor-cells' property.
>>>>
>>>> This allows the EC temperature sensors to be referenced from thermal
>>>> zones in the device tree.
>>>>
>>>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>>>> ---
>>>>    .../embedded-controller/lenovo,thinkpad-t14s-ec.yaml         | 5 +++++
>>>>    1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
>>>> index c87ccb5b3086..0d049979e35b 100644
>>>> --- a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
>>>> +++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
>>>> @@ -26,10 +26,14 @@ properties:
>>>>    
>>>>      wakeup-source: true
>>>>    
>>>> +  "#thermal-sensor-cells":
>>>> +    const: 1
>>>> +
>>>>    required:
>>>>      - compatible
>>>>      - reg
>>>>      - interrupts
>>>> +  - "#thermal-sensor-cells"
>>>
>>> This looks like ABI break without explanation.
>>
>> What would you suggest ? explanation or removed from required properties?
> 
> I don't know what is the explanation. If this is actual ABI break as I
> read Linux code, what is the rationale behind breaking real users?

IIUC, if the DT has not #thermal-sensor-cells, but the code has the 
patch 2/3 then the hwmon fails to initialize as well as the EC 
controller, right ?
