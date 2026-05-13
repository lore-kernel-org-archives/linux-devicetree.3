Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7712A349AEC
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 16:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778688890; cv=none; b=X8bdFfnAxlUQZIHSPDk/h7MSBsJwOqD1Cv2WXhAk+FC8TBxlGFZNHVXdSwAgtrDn1qbOFsccJ9ilytGjrw+i26i9Ii4jEn9Dv5/hiWcDrfqzbkJAEiskm4Hljn3qvbIoKmQsRGiuLM6JxXB8B9fKi1VnCdJEKxO+LjPxIJVf3nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778688890; c=relaxed/simple;
	bh=tkCw0JpiAMvuNLOLVNlpio2ySq7EhIPl84jTnqzlnpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iI5iefH0hNXE/GXukDAuGCeoLtPHMIwvZx05QfveqMNY8+6oBKSbcJlPCr9qClWy738dDO88g6V46CHgKhxHMQ5nHE6JQHRw5/HEL8RwcfqLwBN2adLQLVfQ9jt3cQs1fmTIXFhxcJWZkzoEYOW5FGebc32iqXEqjArvC94BRq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pToALUVB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h4dFqPGM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pToALUVB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h4dFqPGM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAVQdL3430250
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 16:14:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RPWFEMF9L9ig+cq3Ah630zwHNnboGXlXmuygk2CCVVc=; b=pToALUVBz+0hc9T1
	B87a27PKliXyoeuOoHRmSLfHjBLET2HL2UI7f9XCVv+FJlIC4pe74n0LdNvsPjRc
	cP0icMfLLMTwijRlBDAqFD2Win0A/GRljrln9ca9lPH4n/XZ+fN5bbODJ0+3fbcq
	ymuWeApdiDDIYSDdUp2rXb2hEbFuyXgZiW00nl2zNP6HrxainKPVLDR6YJ0NQo5s
	D7nhmX8iUSZl1ostkdtT5S3TkfW2Wh++Rk/gRHGFas0dOmPMCmZWw/TJ73WLT4mr
	6OKKRvwo1ulVhzUMYNTPgQHG+DoOXySvpEjPNC95BpAeBlicIyzsX6fVTloi6Unm
	eLel6w==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4qmchb7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 16:14:48 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95d2ad5df14so9194690241.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 09:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778688888; x=1779293688; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RPWFEMF9L9ig+cq3Ah630zwHNnboGXlXmuygk2CCVVc=;
        b=h4dFqPGMG8YxbcO03fR8kKStHbvMS4+j2i7+cJHh0KDKdI5WVIHjyhdcVdinyrRqUc
         FVArMnJbeD9XUuTUNl0wcS3OjS6LBGZh6XzxghRc4oMJ4VuIQlAZ0tgFJr4RPnQx2sA8
         GPCDpyyAyqUaW7zXMAbhvh0JdXfyxSWfP9Js+2dlNBxRHmZhhGf3ZLD2zY6tuqORYwcM
         sS3AKplsyud9O47SUMKZiUu/j0UK0bfw0nhJfOeB1lp/1TjAVHQ0KKLsKkZt6NsiRpAW
         QkfHtQlFN5zZLWOSTJTicD4gB/PSbdDiLE1as2zuODqrCgy8E0ggyEKCK4tObcHu9THJ
         kr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778688888; x=1779293688;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RPWFEMF9L9ig+cq3Ah630zwHNnboGXlXmuygk2CCVVc=;
        b=haAarARvOqkUQOEagcgsV8G8/+5SBaIUk9OkH5Gw+nvQMtK/HOSNzutyrFgJLmC7/y
         JvvGi41Daiysyx1eMMxyeSWk5BCG/mW0qMTbHVvnQCkAC/WRaGHOwGH9nJEtEY5EDRQP
         1UuZ6g1G70USzjD5CT7Z2bDW+owZ/OTYuukfkt/682S1zBCmVIIzWAS5WLeG10yH+cLT
         JDb96gRX/uOQ+eapYkW84eT9+DMBeK3U+Jwl3K3GKbcds95pgV3xu4NXUNmlx9IrmoK6
         FMkXvnKHlU69Q9vO7KWphBZGwienbVLPCl7kI+gxKP+zDKsm7ia+15wPkc4HkW/QgRhU
         nOmA==
X-Forwarded-Encrypted: i=1; AFNElJ9GazETcpMzmJhVQhrazLdU2E1vEOEGDyz+rJfUeMUVJGJPs5DLtpCkFdsZVoXO016enyZfHuZr1EWj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6u7+Swf7nIxBV+OsTQ1jaedk5e5NRVtlqcvcg+N6hpWZd6Wrr
	KLWyXkU4n7QiEVFylz+T+9QsgZXOvc3alr7FVtHxwsuw23NqLdL3o+Rd5vmkL8052cjNPvq9yWe
	pRE3ZsgwZ4M0grJNqiVddUpaZUuWYILXuMlxn9dZspqAyCXX1vTnulsZrMcD/HoF8
X-Gm-Gg: Acq92OFF/OJjEg9YLUbD3Gwe6NNP2ZJi7nK3991C/s3UHjQIu5yfculh64nwJYolkGD
	5u9wSeeTBSiVMK0yDh1eB7OHQRVvGiZsc61O07RRuRxPeuT+9pqVmMd6lP2Oqm+U5WtndBoy1wU
	XHZ5KEx/U+KAIopfJ9QEuqHkClQe4x91NkIRzdb/+Qg1kLdS9rEkLX2sh2VdcSNeBkVdP8p8V4m
	HzGGNsEhcMauEJqvsxpfKHpl6mtfCF7HEzvRIT2pOHDdNdWut8JXISZ+7sLEOHzx4L1HzGnJgTt
	1geG9IVqnxZuLsj8HHLE9DUkcWiYIih1nUJUbDYR4s8r1qMBOtjoDdrsUPATVc5a4XmebK2WCSm
	2Eu5gjNEe/thTKSTPbSAbyvbaHZXzkuwA2iq/HrjseLqUTnZ5YqjWBy4/BrL4Ql7XXzOB/MCntX
	YaUbWt6ssMta93ZPpXS3+vBd608VVgvdGIxccTa0zj7qeNo8KfRLYK9a7dgPfBng==
X-Received: by 2002:a05:6102:5e89:b0:631:26f6:7022 with SMTP id ada2fe7eead31-637a96e4aabmr2271245137.23.1778688887549;
        Wed, 13 May 2026 09:14:47 -0700 (PDT)
X-Received: by 2002:a05:6102:5e89:b0:631:26f6:7022 with SMTP id ada2fe7eead31-637a96e4aabmr2271183137.23.1778688887084;
        Wed, 13 May 2026 09:14:47 -0700 (PDT)
Received: from ?IPV6:2001:99a:252:3300:d706:9b57:5996:15b4? (n2i9bzmlzk2z87merp0-1.v6.elisa-laajakaista.fi. [2001:99a:252:3300:d706:9b57:5996:15b4])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f625bd3bsm42816281fa.34.2026.05.13.09.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 09:14:46 -0700 (PDT)
Message-ID: <553c16d9-26f9-4702-9214-02e44502af58@oss.qualcomm.com>
Date: Wed, 13 May 2026 19:14:44 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/panel: simple: Add timings for Raspberry Pi 7"
 panel
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Marek Vasut <marex@nabladev.com>
Cc: Maxime Ripard <mripard@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260420-rpi-7inch-v1-0-e68d5c9c44bc@ideasonboard.com>
 <20260420-rpi-7inch-v1-2-e68d5c9c44bc@ideasonboard.com>
 <3z3u5mbngmbzsch3mzs3twlh3aec6r7jokstzv3ghxyusrzt6b@jqvdnuiapx6e>
 <af71183d-70b8-4a41-8466-67123e7aab02@ideasonboard.com>
 <20260423-kickass-fat-boa-209f68@houat>
 <72c2cd94-0a8b-46c8-981b-4ad4a3222e59@ideasonboard.com>
 <CAO9ioeVX6OChRTgUrUdgrPF+3s2_7vme7m0yb85pjYtH1MFskw@mail.gmail.com>
 <ced05a92-06b4-4f6f-95b6-c3dc104c35f3@ideasonboard.com>
 <b24c428f-5752-4544-a8b4-77e91d7bc158@ideasonboard.com>
 <da6bdb78-7fe8-4f51-b9e6-444748ebc319@nabladev.com>
 <103f94d0-2599-497d-ae37-d88922b9f669@ideasonboard.com>
 <faa20bc8-02d8-4715-a65d-2d8aa4102296@ideasonboard.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <faa20bc8-02d8-4715-a65d-2d8aa4102296@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: T0AUDT2KMXl-POHNfVQBgMoWO-cpX_sf
X-Authority-Analysis: v=2.4 cv=Hu5G3UTS c=1 sm=1 tr=0 ts=6a04a378 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=RF00TdSWAAAA:8
 a=lLZmtIKjAAAA:8 a=P1BnusSwAAAA:8 a=YvoeO6lhbD8J2Jc-U_EA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=_nx8FpPT0le-2JWwMI5O:22 a=q5Nj8NTjyn2D8kUwajRn:22
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE2NSBTYWx0ZWRfXwi/JlTPWgbOP
 fBQo1tZ0MsOQNZVn/E/1A+RmaZlLlP1YJow+DYD/nVE116QHt6tRwSHxJtatxjNxg/iejeO3QTg
 4tXGbOoBZbtIS4kdRk7Trj5YPznmzYRDoqQWHk0vFJRBNlumOjSD92ZmajTWmG/MH3/O4VOMnZj
 JOKFbhrq4K3rdJTd55oBUMIrIXwkDoam+yjoYliiWQ1XaUMSr9j+jIZaUu9Ob8hwoQkpEdr4jLS
 7KsoZyIUzXu/Wh4tBy3sgJo0SuJIUSe3usjQ8nKatfFxJWpphlfr8XdAmKZ9m3gzJ9yuVO7Vo3c
 XCE/SyFFipx7z0OtwtsD4vNWN3okjNON+HgZuMD7KB4dg6M0dhlDHyorVDJ+A//rz7x2bNb5puV
 6e0US8Dt9c4bqrv1gWNwJYniS0L30nXAr7EkkQ1Vp2ts1SfQKB+ryX2gwkyRBDidz3MBYlg8K/i
 ob2umauj2V/cg+H70+w==
X-Proofpoint-ORIG-GUID: T0AUDT2KMXl-POHNfVQBgMoWO-cpX_sf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130165

On 13/05/2026 14:52, Tomi Valkeinen wrote:
> Hi,
> 
> On 23/04/2026 18:01, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 23/04/2026 16:54, Marek Vasut wrote:
>>> On 4/23/26 3:16 PM, Tomi Valkeinen wrote:
>>>
>>> Hello Tomi,
>>>
>>>>>> In the past I used this panel compat instead of the
>>>>>> panel-raspberrypi-touchscreen.c and it worked.
>>>>>> IIRC Marek splitted the multi-function module into a regulator and 
>>>>>> the
>>>>>> panel description.
>>>>> Ok... Indeed https://pip.raspberrypi.com/categories/651-pcn lists 
>>>>> PH800480T013 as one of the panels used. Although two variants are 
>>>>> listed, and also a third panel model, possibly from another vendor.
>>>>>
>>>>> My module is v1.1, and I think it has the PH800480T013-IAC21 
>>>>> D/5624/ KIT- LC variant.
>>>> A question to Marek: Where did you get the timings for PH800480T013? 
>>>> Did you find a datasheet?
>>> Search engine first link:
>>>
>>> https://mm.digikey.com/Volume0/opasdata/d220001/medias/docus/5337/ 
>>> PH800480T013-IHC09.pdf
>>
>> I tested the "powertip,ph800480t013-idf02". I'm using BeagleY-AI here, 
>> and it didn't work at all. After some testing, I figured out these:
>>
>> HSW of 2 is much too small. But this could be an issue on the display 
>> controller or the DSI encoder side. HWS of around 8 starts to work ok. 
>> Below that, I don't get anything on the screen.
>>
>> The syncs are interesting. I set them to DISPLAY_FLAGS_VSYNC_HIGH | 
>> DISPLAY_FLAGS_HSYNC_HIGH, Marek to DRM_MODE_FLAG_NVSYNC | 
>> DRM_MODE_FLAG_NHSYNC. But I have sent the TC358762 series, which fixes 
>> the syncs that the bridge sends (20260327-tc358762-fixes- 
>> v2-0-3589d3c45f4a@ideasonboard.com).
>>
>> Flipping the syncs might explain why I used 46 and 23 as the 
>> backporches, Marked used 46-hsw and 23-vsw for backporches (well, 
>> Marek's vbp was off by one as I mentioned).
>>
>> But now I'm getting unsure if my TC358762 fixed the syncs correctly... 
>> I'm pretty sure I measured those with my scope, though.
> I did some digging.
> 
> The upstream TC358762 syncs are wrong, and inverse what they're supposed 
> to be. The upstream powertip,ph800480t013-idf02 timings are such that 
> the image still gets centered correctly, even with the wrong syncs, but 
> this makes the timings not match the datasheet.
> 
> With my TC358762 series, the syncs on the parallel bus are correct, and 
> thus powertip,ph800480t013-idf02 no longer works right. My 
> raspberrypi,7inch-dsi panel timings work right with the TC358762 series, 
> but those panel timings have the sync polarities wrong, and thus the 
> timings are also not according to the datasheet.
> 
> So: we can drop this series. I'll fix the timings for 
> powertip,ph800480t013-idf02, and then it'll work with the RaspberryPi 7" 
> DSI display module...

Ack, thanks for your updates.

-- 
With best wishes
Dmitry
