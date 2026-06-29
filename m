Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027BE3F9A01
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724893; cv=none; b=RYH1EbzAM6i631HIJx/8n6qzZG1RvVBahwtz4Ry483opXGljCxbFwDzCNNmVHNXqJlckoa7lsz3xBkfin/pN8iU9tzlBklemcj0WnsMc4+DHYBCgYbc1UGPYlyreFbYrQo+efUjZXKutveqVSxXJ6Yt5knDL60w4Dnjm9P0YW5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724893; c=relaxed/simple;
	bh=a9y3F15qQHEHXUPzxiXduiUBycO7pm9GPUedTNjBY6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SXxynV1v/fxG35TMyORPyMdxACyGRH83Wso8vDcarFEM9z+EoOA0ilTyGjVDDmOLujZgNFLTCXPU8TdLsWGr6p1kUhfh7f5pXwVVU6xOL0t05hNulvcSz+C5Lh3TsUROqKQxxxSELMOkf5YqdatyqBITp4yXudSmSub+FgSkO5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jGgCX84m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TqSBwr9B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jGgCX84m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TqSBwr9B"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6qxRA2076278
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kvKRqFaZT4QsqNsCb/8RdQNtvL3NSF6wNCLnxFXtedc=; b=jGgCX84mP/oiSZuj
	NBKhXtU5BgjMAyv99z/W3utzl6ISi8Ka6HBf9ORy8gT2aTNwRsjMcOmWBUXJjcnu
	I3XrB7lqN12oQ4E2vO4uN8tO3VuBlmR+n/RlyGD/WE4l30GLyXUYC+lorbF6+QlG
	0LjW69AYt7jbq4LUdgjigPOAh4LrpQQLFw4RXGngH9dJyAplDQq9yFgbmuMtLaJc
	T5F6R7aVf7apNKQL7hPtozbz3XwsrRpMAyh8YhxNKXFj/Helbr7y2vXIGCbNCnm6
	Py8hVCH1YEAfFZydPDpUAiBGMweilh3fszzIHg2eTGWm1jIRLeXi6mkh5oAxZhDg
	Y4TZTw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7gmwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:21:31 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9692160501cso72158241.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 02:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724890; x=1783329690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kvKRqFaZT4QsqNsCb/8RdQNtvL3NSF6wNCLnxFXtedc=;
        b=TqSBwr9BRvlpTc3NS7IuxBC/JpAu9krlmuUpFEPeNFNzpBcQzCmBOIiTSf981QRuCU
         60Pr5FuUPGz1pUsG1720wbAxpwNhsKOUWO811+HzFm50WnS4GrvCOQqIIJVLeLyW6GqK
         22GUx3QBN2Jdea7LOKuImaXeFUwFO/aN4V45d6YErEj98e1aEJy9QyFzUeSFkEeWmRA7
         XypNsvnNA6f/UYwUzpWc9RSxUS118JmFT/2wkl+6Frb+suCq1LDlbpGd8+ze8JT62T0W
         Vxq+B8++J6sWfDInmzwqgFVYkF/gyRm88+k80Yll+EknU+rq9TdwaGGvpKjx/dmO1yKE
         q+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724890; x=1783329690;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kvKRqFaZT4QsqNsCb/8RdQNtvL3NSF6wNCLnxFXtedc=;
        b=gHmcb4IHrSMWpLp7Kp4PEhqJiBWdRlHTdjBxk2bi0C9ZY8FScCvs69/rq8ndRGnpHw
         uytu9JnO/dHQ6vibbEAMtv+9DOXgCF9C6KQW2xV6ErCFvNo5QckrG8RpZUqXaHd6PUFM
         SWCDOwAeOnoReQgsHuqF+NMP7D5tnIFLXS6BdTCQchcVxI/3/emW8jHvAkK10eGNDr5G
         3QFFMLn78KvjYGch+kiE/y1uNafYjj+wmmttYTRrdcYR7CypOuzgKGNHlt6JMPIEb+yU
         bh0ZXO2J1Za4itwcJrfJeQX73S4ePLgcLsYd4k/UelCTBa/myP6TCrn5pAuNnEszWOae
         FbgA==
X-Forwarded-Encrypted: i=1; AHgh+RoKfqU26UjMeXOju3rNCMAm404ndoIG56fTY295VTxaFu7jTxfQOJDLVzSuBDda8g9N1hINJlD2AzBD@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ+6j5gY93jzoUGgTar9cwm40USyEm0iMeZVe9TsbT9DP4xSkw
	Td+j3HZWKXmQD9N37vw8lMCY+fTbbULJo74v6sxXLUWH+I1/7ly3W7lSD3wN4l5C9WwAXZxWUOq
	De4pcILGcmb8VKYAn5Ur8Fy9eav8Fo4Ii/+WlPIrWGaA7B2YHkVIWgXaWdiQAeDMm
X-Gm-Gg: AfdE7clRd5Jx+PLqAWRCyo2p51DCyIg1CaozSIwcavGJ3Jirf49wEODX19hdNtV6f9p
	0fi2K+dIdOqACdVxpOYryfafIQwCp2qIK69CNaa4lQa7EfO5Vinxw8Kx4ioHbNPe8xqs9tocG/U
	PNWXSUV21sSn1Rw86YznZlLxThComt6kDMpjh2gpQ9HLTm/P0bxYqKjobrMo9QZQ11+ho+qBTsk
	g3dCQm8oEFJD3nkwJszgezPZucuRKI2QnFPT4a0PyDKrxGi7d2YWedGIfK1sPyhJ5Cbf+bEyjtu
	AC8UUVaJwYsy76Wk6o7BTntzzGxanM63a0uGuYeelqhwOD9qm2VaUS4nC74vaHiua33RaWgEqq+
	thrQrbsRNhZq8VvDVl8PZXaEJlV1rBDaPz0g=
X-Received: by 2002:a05:6102:a4a:b0:738:b13a:c810 with SMTP id ada2fe7eead31-738b13af99bmr445058137.2.1782724889862;
        Mon, 29 Jun 2026 02:21:29 -0700 (PDT)
X-Received: by 2002:a05:6102:a4a:b0:738:b13a:c810 with SMTP id ada2fe7eead31-738b13af99bmr445045137.2.1782724889291;
        Mon, 29 Jun 2026 02:21:29 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6983a7f3989sm3836391a12.16.2026.06.29.02.21.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:21:28 -0700 (PDT)
Message-ID: <a99fb61e-b11a-4902-93f1-47c32c5f5b6f@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:21:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 2/9] dt-bindings: phy: qcom-qmp: Add PHY selector
 and Glymur link-mode macros
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-2-269cd73cc5d1@oss.qualcomm.com>
 <bb3dd1d0-af41-4ecf-b23a-3800aa5414ce@oss.qualcomm.com>
 <akIAPK7daXxPH5JO@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <akIAPK7daXxPH5JO@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfXzhuFpYjreENL
 2As1D+5zOiG0qgUMI6COlkMs+/4PrWwVc6m2WokCmL+YwnqoerzzwesA0MaGe+kWbQiQ49BOZ+i
 mLgfyKh53Mxoc1cQY9ih+RgIqurmFaI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX7MBeKA1KGxtF
 yPK/mAPt9YI5vyvI4jVmtS13K59Eh58u4R7T/Ohaxc2DKT6H71f13sbOiMzFD9KoEpJs7d8x4TZ
 No+8hef/cAamRTHKBFR4WQtgEM/G/WaUCVkK7hfi3k+BSzNFtDrcbIFW1R8y0unPqUrWuvbFWGr
 lB1bgrXubbK5aEW42ggl2XnAjo7hzhzGWKUnye3yMcw6Q5gLjmbfwZ0DyTwCYJjSGUjKRV41eaw
 F0pro2u3YM4CO+NBMMaMN4+UoSBLhKGbYEpYeWIcAHeqg99ZOqZ4ruwDqOEcbAroj6Al5vFz1hv
 0anjWzQClD/lSGsXvqyhMhe3aeuh/FjgTOuVXMiJ3S3Cr4KeLZiIVhK/ljvKW6dpIYvyQCEe9Ct
 p6rUV1ScMdQ0V0j2LfKqqlFNPx2IPSgbigYbrnqC4WYxBxaOFxNz7QmzS2ExSVmJsS2OZjwo3Tp
 UaZBaxWkVkEEabFyieQ==
X-Proofpoint-ORIG-GUID: x4Waz6Or0lMUkybHuE5y5Z6a363HX7c2
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a42391b cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=T8ljNkuw5NW2mJYCfz4A:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: x4Waz6Or0lMUkybHuE5y5Z6a363HX7c2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290074

On 6/29/26 7:18 AM, Qiang Yu wrote:
> On Tue, Jun 16, 2026 at 04:07:27PM +0200, Konrad Dybcio wrote:
>> On 5/19/26 7:47 AM, Qiang Yu wrote:
>>> Add two sets of constants to phy-qcom-qmp.h to support upcoming multiple
>>> link mode QMP PHY:
>>>
>>> - QMP_PHY_SELECTOR_0 / QMP_PHY_SELECTOR_1: generic logical PHY index
>>>   values for QMP providers that expose multiple PHY instances under a
>>>   single DT node (i.e. #phy-cells = <1>).
>>>
>>> - QMP_PCIE_GLYMUR_MODE_X8 / QMP_PCIE_GLYMUR_MODE_X4X4: link-mode
>>>   values for the Glymur Gen5x8 PCIe PHY "qcom,link-mode" syscon property,
>>>   selecting between the x8 single-PHY and x4+x4 dual-PHY topologies.
>>>
>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>> ---
>>>  include/dt-bindings/phy/phy-qcom-qmp.h | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/include/dt-bindings/phy/phy-qcom-qmp.h b/include/dt-bindings/phy/phy-qcom-qmp.h
>>> index 6b43ea9e0051..befa76f8392f 100644
>>> --- a/include/dt-bindings/phy/phy-qcom-qmp.h
>>> +++ b/include/dt-bindings/phy/phy-qcom-qmp.h
>>> @@ -21,4 +21,12 @@
>>>  #define QMP_PCIE_PIPE_CLK		0
>>>  #define QMP_PCIE_PHY_AUX_CLK		1
>>>  
>>> +/* Generic QMP logical PHY selectors */
>>> +#define QMP_PHY_SELECTOR_0		0
>>> +#define QMP_PHY_SELECTOR_1		1
>>
>> Is this for the second phy cell? FWIW I think it's fine to use raw
>> numbers as they're just indices (i.e. "nth bifurcated phy") anyway
> 
> I can't use lane numbers. In x4+x4 case, I need to tell phy the first 4
> lanes or second 4 lanes are required.

I didn't mean lane indices, but instead the same numbers you defined,
without the name. It's a minor difference though, and ultimately both
work for me.

Konrad
