Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F0438332C
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 12:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781871380; cv=none; b=OZ1Sed5m6ubGnyS9ShtCh/Sl0b5b33gf8SI/nuajZMtPAhnAtFFcXIfGfZ/hcsL/8pSIasIOhbj5ZWYpKR3y+gDeK0FPYrJg5Hmnn4ChvhILuFZX53aaMO/DXXj6qQn+rp895+IjZd7bZHwIMQV8qk1wrkLnfNbr2eIOzXi2d9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781871380; c=relaxed/simple;
	bh=ED8GY2Ql9zXP3sXEqoGNm6cmV3nxLywmPPhdP7ZpBdI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OlYW74HxiDiZ8JEClDlFGzKcYT6wVCugCfNCgPMmjpZKhNeiIzF0Q+mkH8Vmx61GC4GT1yGeU03XvjJZ/VbK+51Iw5Q28UaVZNVEHVTT9d9eueBEOceIbDxUaM/Te5DxWT3Z65r8d7gu9ePeyY+Gm/8lnHmGw1HTQt67TNsVUz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CXAgDelr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ILCjwc/l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CXAgDelr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ILCjwc/l"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JC7ZHi695374
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 12:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y/JFdbm3jFGcHEjdKpE6xYqBMxocBBsAJf8vwRLPtbg=; b=CXAgDelrpdtRYTnn
	37LM85PWEl4djNE+sjEqRNMcv7cPtFFuqZyljhFUH0JyepCxgZuZY+vI60GYQEbX
	trNf4ceUKely2K6FTFy29BowW0W/YVvyNH4cBGZ70gLrwoItszovcKFZUFOF+IG5
	y7l/ymQj89yXdUvAP1Gkd0R/rKmeIg4EskRwwBqrg57OiGaob4epi7vkGeSsL11k
	z+Ss++Rpd8+ELmPRbt8YF1sMghrIri+2MT96g/SdxyX5B/anSKNg49ro4opPkJSC
	D8BMwBggKQWEvpIvUM8/rpR0VZ+yT85S3jBICH2w0iP6Tj/8960PDRqAkRSFLmju
	WBg3zQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evm22bv34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 12:16:12 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4863a0c3105so3603851b6e.3
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 05:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781871372; x=1782476172; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y/JFdbm3jFGcHEjdKpE6xYqBMxocBBsAJf8vwRLPtbg=;
        b=ILCjwc/l9hROzu6FsDEhprFZiCS9xifMamX5BQlR1NXNZQgtda9PRXqSBzJFDif58b
         RsCcNiNYhZMaQCQ0qwz004m8rYakxzGWxIroWG4Fdt8CPG7H9wLLEwBRUmtF82g3grzf
         b9brPY+E0pKV5fHAE7wtwJD+exKg7nr8o4QKoP216DnnDd0PyvD2lUm6c8rpIFTKbJLM
         AYVmhxbo5j2IY0IB3kjbuNTA3UAo6d8aKUdAVyX7CI7GOYFG1Y4debj537AANMalrzXE
         UtakjTKgxFY54eqqS8tJ2lsPqxUdhDtmGjH7Wuh1UrlqTnjR1k3faZeJL7kG086ifBZ4
         0HQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781871372; x=1782476172;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y/JFdbm3jFGcHEjdKpE6xYqBMxocBBsAJf8vwRLPtbg=;
        b=TgrUX+CPiJfaVafcZikg8g3CJ0dIXsfnR8IY0nsJFTIXo+xTklH0mp/Kb93hFpiPNA
         cajgVgFgcUxLuySBG1lAGrkG04ycuAg0TwKUnZBrqEXZ7AJKaFF6arAldOI8BtMsyK8w
         FIwhIaZK02wcZj6Bo76NSUbzVjtRLknc5rrk8eCvWSCbhSQ97o6TLIkBmZpTXhXSbxRX
         qI+hVrHrPVa9DhKWBxijcoBGmTem8Y2oJ5edrSHzxjtQdrD0tbHYAOzEnGOE2lWJDvsd
         eGnCcy8w5UcdaK5H+EvDNDxyzJ91Bva+vzNBehz3sNebjRfUaern7lDoCx0i+WNa/E0E
         80tQ==
X-Forwarded-Encrypted: i=1; AFNElJ8BK/XDAJWswnZMvLFnoRSEyA37kox81PQiDWe35hAMb/A2zLNdDxj8EOvY0oOItU8gjxQy9PnZccZY@vger.kernel.org
X-Gm-Message-State: AOJu0YyjeqKT8HTEehwVkFFoH3JRAxcB9a1JepP0ZFCctPPBThRPYC+K
	xC73oHRGlyHXsAhjK6s8aEpXro4HlhOF0edZ58FMz60b7JXthbix+XZu8xHkQEA6fk+eNSEVo6S
	aQfGbZK0IUOHfIKR3y2jKVmfVxpzy/HXcEUBWS0/OX3oSdYN7qKnPz2ATWZeVdNBt
X-Gm-Gg: AfdE7clXNT5nEIU8SIrjb8jEoMPCox9LgOvtksrTAWXqKBLwenOMgVPesua3rLsjyNv
	jn03D/I9/QzmnJ5rQIoaCnwkiW4wHq6B+yWxdTdrEwSMNgMfiDPXYD6eim6+GVzf0+k73RVniEg
	cWBFXkgJazZNOgHxhx0BMHDehY8vCp6pSE+QQZPHCP61LLU2MveCLZ1H7WFzdfYU097KG+1IgoZ
	Mlts4+qfV0Lt5/NtceTdzhUMPfR3pueZ1mz59C/m3PxMgJSirO+P8fuduEZA90GG4hWuGzx2CT9
	SGb8zoqCEAGoNTK3uTHy5t0Q0ayqoFKaXFtBqUnoSIr3cSqRFoMjFkiwmSTqfMlXbuKg/jWG+9b
	/ni12c2eZ6dwT8bybb8Z+7g/KnAaZwB19n/wj0GqCh2vZG2ts4zI06uQPJ7l+2DJhzGJ04Qk=
X-Received: by 2002:a05:6808:10c2:b0:485:a99c:cfe3 with SMTP id 5614622812f47-4896acd3ea4mr2993190b6e.42.1781871372102;
        Fri, 19 Jun 2026 05:16:12 -0700 (PDT)
X-Received: by 2002:a05:6808:10c2:b0:485:a99c:cfe3 with SMTP id 5614622812f47-4896acd3ea4mr2993143b6e.42.1781871371612;
        Fri, 19 Jun 2026 05:16:11 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ebff:f04f:848:859b? ([2a05:6e02:1041:c10:ebff:f04f:848:859b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650bc428d9sm7619400f8f.27.2026.06.19.05.16.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 05:16:10 -0700 (PDT)
Message-ID: <05abd4cd-8ce8-4ef9-9dbf-4eeb9a940a1f@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 14:16:09 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: remoteproc: qcom,pas: add thermal
 mitigation properties
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <7f1e46fb-15e3-4638-9930-8abc1dd5a778@oss.qualcomm.com>
 <fcf93e0f-a2f0-4070-86ec-8a34e9344b76@kernel.org>
 <ec65893d-873a-4a62-b0e2-5008b2130545@oss.qualcomm.com>
 <3cbcaf8c-357e-42d2-91c1-9d1a32c55ed0@oss.qualcomm.com>
 <ae43a691-4879-4bfa-8c7c-1be16945480c@oss.qualcomm.com>
 <9a31bb29-75d7-42fa-b8a8-4155cf85cadf@oss.qualcomm.com>
 <hebyboondtxyyetwuwggoiysurz335xzn7asf6yit3qrexap3x@kngk2m5xum3x>
 <93e7251c-c75d-4e43-9ae2-bf485af58de3@oss.qualcomm.com>
 <mp2hl67rupxrssa43dcy36m3dwatlxsu7n27l7qdqsguo5i3bp@bo6sdzxglxt2>
 <dcdfe9f4-aeec-4d85-92a1-a42592fe11c8@oss.qualcomm.com>
 <4gs664zboaqgpok33x7bgorfmhh3f2fahjkt4jjl6fbzpwixnm@hxzz2xeogd4k>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <4gs664zboaqgpok33x7bgorfmhh3f2fahjkt4jjl6fbzpwixnm@hxzz2xeogd4k>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YN+vDxGx c=1 sm=1 tr=0 ts=6a35330c cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pTuXCbNxmSvcstPj0wYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: WcELNfTFvChuByorBhHcuYETXZXwDLxM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDExNCBTYWx0ZWRfX+Yon3Lu/ydpN
 w/24VM4uo3J0wXcjofPbmSC9hsQvuFIatCHFb3TLOYIXoKpTNyhNEyRtgY0rr1JZx9AFJV4gpZ3
 wfZ/UXlApS70JD6hIlrhAJFu+5uhv9g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDExNCBTYWx0ZWRfX1AfZLAUGwrg7
 pIlpE38Jap5E+lK5L7gXfSl5ByBo6IqIj1BZadZzgYvDoajsejBM1nlyymjE0CNPI3SCGQfp5tV
 6efKlh5Ab3s/Ie7KInb0fXTSmOzJ+3VRUG6/ROVgSJgJddGMkQ22grMloHZ5Dxhnsu5V7EoWINs
 MW/GR1xPGZ+e7y5VAgouzXTfcJLJRniyRtmJgkJm6hlp8+k8eyYjkBbiXeKcmRpDtRhu+tzQ+xF
 UDaaGBHnuvvNgEFSspXQUtCtllBGwiM4u/1qYw5/+681Sn0UisdZPgWOADj5YhVDfEccDnrDx/a
 ZTsPliolalTwB97CUD3todYLs2iLcVRP47vB8SGScIBAxfNJkH2saOAR/LIKn+c8sXVKv8hcR85
 Y6TOY9BORGtFBanlS10mbdLTTjPybOJmp/Ap9tr8LrNMZQYZN0S8IhS5kB5ACTHTzUGBiSPmErI
 ZfT8QWvGAH3n29lEizw==
X-Proofpoint-ORIG-GUID: WcELNfTFvChuByorBhHcuYETXZXwDLxM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190114

On 6/16/26 00:15, Dmitry Baryshkov wrote:
> On Mon, Jun 15, 2026 at 05:33:15PM +0200, Daniel Lezcano wrote:
>>
>>
>> Le 15/06/2026 à 17:14, Dmitry Baryshkov a écrit :
>>> On Mon, Jun 15, 2026 at 04:33:38PM +0200, Daniel Lezcano wrote:
>>>>
>>>>
>>>> Le 15/06/2026 à 16:11, Dmitry Baryshkov a écrit :
>>>>> On Mon, Jun 15, 2026 at 02:30:49PM +0200, Daniel Lezcano wrote:
>>>>>> Hi Gaurav,
>>>>>>
>>>>>> Le 15/06/2026 à 14:12, Gaurav Kohli a écrit :
>>>>>>>
>>>>>>>
>>>>>>> On 6/15/2026 4:04 PM, Daniel Lezcano wrote:
>>>>>>>> On 6/13/26 13:05, Gaurav Kohli wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 6/13/2026 1:11 PM, Krzysztof Kozlowski wrote:
>>>>>>>>>> On 12/06/2026 15:52, Gaurav Kohli wrote:
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> On 6/11/2026 5:53 PM, Krzysztof Kozlowski wrote:
>>>>>>>>>>>> On 11/06/2026 13:12, Gaurav Kohli wrote:
>>>>>>>>>>>>>> Why? And where is this generic property defined? You cannot just
>>>>>>>>>>>>>> sprinkle generic properties in random bindings.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> Ack, will add why part.
>>>>>>>>>>>>> These names are matched with the thermal
>>>>>>>>>>>>> mitigation device identifiers
>>>>>>>>>>>>> populated by remote firmware over QMI and define
>>>>>>>>>>>>> mitigation devices are
>>>>>>>>>>>>> exposed as cooling devices.
>>>>>>>>>>>>
>>>>>>>>>>>> No, -names correspond to values passed via DT, not
>>>>>>>>>>>> some remote firmware.
>>>>>>>>>>>> The remote firmware should give you interface which
>>>>>>>>>>>> is explicit and does
>>>>>>>>>>>> not need such properties.
>>>>>>>>>>>
>>>>>>>>>>> thanks Krzysztof for review, We need tmd-names because
>>>>>>>>>>> of following reasons:
>>>>>>>>>>>
>>>>>>>>>>> Following Daniel's series [1], the thermal framework supports
>>>>>>>>>>> mapping multiple cooling devices per remoteproc/device via indexed
>>>>>>>>>>> cooling-cells.
>>>>>>>>>>>
>>>>>>>>>>> 1) The thermal framework's cooling-maps reference
>>>>>>>>>>> cooling devices by index (for #cooling-cells = <3>).
>>>>>>>>>>> Without tmd- names,
>>>>>>>>>>> there's no way to know which index corresponds to which
>>>>>>>>>>> TMD, as firmware
>>>>>>>>>>> may return tmd-names in any order.
>>>>>>>>>>>
>>>>>>>>>>> below are the changes post new thermal mapping changes:
>>>>>>>>>>> DT: tmd-names = "cdsp_sw", "xyz";
>>>>>>>>>>> Firmware: ["cdsp_sw", "xyz1", "xyz2",]
>>>>>>>>>>> Driver registers: Only "cdsp_sw" (index 0) and "xyz" (index 1)
>>>>>>>>>>
>>>>>>>>>> names property are not to instruct drivers to register or not to
>>>>>>>>>> register something.
>>>>>>>>>>
>>>>>>>>>> I don't understand the problem and explanation in the binding is
>>>>>>>>>> basically non-existing.
>>>>>>>>>>
>>>>>>>>>> Remember that all lists and indices ARE FIXED, so driver knows exactly
>>>>>>>>>> which index means what.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> thanks for review, shall i use driver data, which is basically
>>>>>>>>> pas data structure like below:
>>>>>>>>>
>>>>>>>>> static const struct qcom_pas_data {
>>>>>>>>>         .crash_reason_smem = 601,
>>>>>>>>>         .firmware_name = "cdsp.mdt",
>>>>>>>>>         .tmd_names = (const char *[]){"xyz", NULL},
>>>>>>>>>         .num_tmds = 1,
>>>>>>>>>
>>>>>>>>> Is something like above acceptable? and this will also help to
>>>>>>>>> filter tmd names as well?
>>>>>>>>
>>>>>>>>
>>>>>>>> How the thermal framework will bind the thermal zone with the TMD ?
>>>>>>>> (node pointer, id) ?
>>>>>>>>
>>>>>>>
>>>>>>> Hi Daniel,
>>>>>>>
>>>>>>> thanks for review.
>>>>>>>
>>>>>>> With id only, in this case instead of taking tmd names from device tree,
>>>>>>> qmi_tmd will take tmd name from pas_data(driver) and register with the
>>>>>>> cooling framework with id only. Please let us know if this looks fine.
>>>>>> May be I'm missing something but:
>>>>>>
>>>>>>     - The QMI TMD returns a list of names, not ids
>>>>>>     - The QMI TMD may return the list in different order than assumed
>>>>>>     - The cooling map index points to the name of the TMD in the DT
>>>>>>     - This name is used to match the name in the aformentionned list
>>>>>>     - The index in the list and the id in the DT can differ
>>>>>
>>>>> Would it be better if we define standard indices for the standard names?
>>>>> This way we decouple the actual firmware strings from the DT.
>>>>
>>>> I don't think so, it seems to me too fragile and prone to error.
>>>>
>>>> It is a remote proc, an external subsystem. The contract between the client
>>>> and the server is the protocol. The protocol specifies the identifier as
>>>> named strings, the TMD names, not numerical identifiers.
>>>>
>>>> When asking for the list of TMDs, we get a list of strings. But as it is an
>>>> external subsystems, may be tomorrow someone decide to send list ordered
>>>> alphabetically, or per number of states, or whatever.
>>>>
>>>> With hardcoded id the QMI TMD clients break
>>>
>>> I was thinking about something like:
>>>
>>> #define QCOM_TMD_DSP	0
>>> #define QCOM_TMD_PA	1
>>
>> Ah ok, it is correct if:
>>
>> tmd-names = "dsp", "pa"
>>
>> Or
>>
>> #define QCOM_TMD_PA	0
>> #define QCOM_TMD_DSP	1
>>
>> tmd-names = "pa", "dsp"
> 
> I was more inclined about having the standard indices for the standard
> mitigations.
> 
> BTW, I checked, which mitigations are being returned by the DSPs. Few
> examples, just to provide some context.

I don't know if you are missing my point or if I'm missing yours :)

The QMI TMD protocol identifies the TMD with strings. There is no 
guarantee the ordering is kept if there is a firmware upgrade.

The ID is to connect the cooling map with the remote proc node index. 
Its only a thermal description not related to the TMD itself.

> SC8280XP, X13s:
> 
> TMD service: instance=0x01 (adsp) node=5 port=9
>    1 mitigation device(s):
>      [ 0] cpuv_restriction_cold    max_mitigation_level=1
> 
> TMD service: instance=0x53 (slpi) node=9 port=9
>    1 mitigation device(s):
>      [ 0] cpuv_restriction_cold    max_mitigation_level=1
> 
> TMD service: instance=0x43 (cdsp) node=10 port=8
>    3 mitigation device(s):
>      [ 0] cpuv_restriction_cold    max_mitigation_level=1
>      [ 1] cdsp_hw                  max_mitigation_level=1
>      [ 2] cdsp_sw                  max_mitigation_level=7
> 
> SM6115, RB2:
> 
> TMD service: instance=0x00 (modem) node=0 port=20
>    9 mitigation device(s):
>      [ 0] pa                       max_mitigation_level=3
>      [ 1] modem                    max_mitigation_level=3
>      [ 2] cpuv_restriction_cold    max_mitigation_level=1
>      [ 3] modem_current            max_mitigation_level=3
>      [ 4] vbatt_low                max_mitigation_level=3
>      [ 5] modem_skin               max_mitigation_level=3
>      [ 6] modem_bw                 max_mitigation_level=5
>      [ 7] wlan                     max_mitigation_level=1
>      [ 8] wlan_bw                  max_mitigation_level=1
> 
> TMD service: instance=0x01 (adsp) node=5 port=8
>    1 mitigation device(s):
>      [ 0] cpuv_restriction_cold    max_mitigation_level=1
> 
> TMD service: instance=0x43 (cdsp) node=10 port=8
>    3 mitigation device(s):
>      [ 0] cpuv_restriction_cold    max_mitigation_level=1
>      [ 1] cdsp_hw                  max_mitigation_level=1
>      [ 2] cdsp_sw                  max_mitigation_level=5
> 
> 
> SM8350, HDK:
> 
> TMD service: instance=0x00 (modem) node=0 port=22
>    28 mitigation device(s):
>      [ 0] pa                       max_mitigation_level=3
>      [ 1] pa_fr1                   max_mitigation_level=3
>      [ 2] modem                    max_mitigation_level=3
>      [ 3] cpuv_restriction_cold    max_mitigation_level=1
>      [ 4] modem_current            max_mitigation_level=3
>      [ 5] vbatt_low                max_mitigation_level=3
>      [ 6] charge_state             max_mitigation_level=3
>      [ 7] modem_skin               max_mitigation_level=3
>      [ 8] modem_bw                 max_mitigation_level=5
>      [ 9] mmw0                     max_mitigation_level=3
>      [10] mmw1                     max_mitigation_level=3
>      [11] mmw2                     max_mitigation_level=3
>      [12] mmw3                     max_mitigation_level=3
>      [13] mmw_skin0                max_mitigation_level=3
>      [14] mmw_skin1                max_mitigation_level=3
>      [15] mmw_skin2                max_mitigation_level=3
>      [16] mmw_skin3                max_mitigation_level=3
>      [17] mmw_skin0_dsc            max_mitigation_level=15
>      [18] mmw_skin1_dsc            max_mitigation_level=15
>      [19] mmw_skin2_dsc            max_mitigation_level=15
>      [20] mmw_skin3_dsc            max_mitigation_level=15
>      [21] wlan                     max_mitigation_level=4
>      [22] wlan_bw                  max_mitigation_level=1
>      [23] modem_skin_lte_dsc       max_mitigation_level=255
>      [24] modem_skin_nr_dsc        max_mitigation_level=255
>      [25] pa_dsc                   max_mitigation_level=255
>      [26] pa_fr1_dsc               max_mitigation_level=255
>      [27] cpr_cold                 max_mitigation_level=3
> 
> TMD service: instance=0x01 (adsp) node=5 port=9
>    1 mitigation device(s):
>      [ 0] cpuv_restriction_cold    max_mitigation_level=1
> 
> TMD service: instance=0x43 (cdsp) node=10 port=9
>    3 mitigation device(s):
>      [ 0] cpuv_restriction_cold    max_mitigation_level=1
>      [ 1] cdsp_hw                  max_mitigation_level=1
>      [ 2] cdsp_sw                  max_mitigation_level=7
> 
> SM8150, HDK:
> 
> TMD service: instance=0x00 (modem) node=0 port=21
>    6 mitigation device(s):
>      [ 0] pa                       max_mitigation_level=3
>      [ 1] modem                    max_mitigation_level=3
>      [ 2] cpuv_restriction_cold    max_mitigation_level=1
>      [ 3] modem_current            max_mitigation_level=3
>      [ 4] vbatt_low                max_mitigation_level=3
>      [ 5] modem_skin               max_mitigation_level=3
> 
> TMD service: instance=0x01 node=5 port=8
>    1 mitigation device(s):
>      [ 0] cpuv_restriction_cold    max_mitigation_level=1
> 
> TMD service: instance=0x53 node=9 port=8
>    1 mitigation device(s):
>      [ 0] cpuv_restriction_cold    max_mitigation_level=1
> 
> TMD service: instance=0x43 (cdsp) node=10 port=8
>    1 mitigation device(s):
>      [ 0] cpuv_restriction_cold    max_mitigation_level=1
> 
> 

