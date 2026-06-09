Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3F5346FA1
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 19:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781032861; cv=none; b=fOZIGX8kyFHWx524AkFbbI1pD7iAkAGFflfrsg3c6cICePGrjyI/8+bLlwIIGN7/FEd/uyoIre6TjFqrYsWdViLPrt22okz1xSKFOqwXUqAHvwKwJ1XjK/Mj48wURxmQkyMcj6FOaegDlNSMNxsNcy0N0Z35cZfcl55l3P5IMP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781032861; c=relaxed/simple;
	bh=DMkOdQJsj9Owrfi8I/943gcLvKi2KJWPp4ep4ABr01Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H8ilefz+6sbhx+b7wkLpLjZr56noXxXaY8qz3MA2ItRvy4Xjw4gNZijkezTsRVkx2WrUIrRdeEyIT1DXr/7+rAZj28HPg+ZvgV42eAcMESi92lnsSrAo9YZUs2WZhVr+RoncaLbvRnSum6LYv7c0iG1yj4tIbusClseIXxwQWUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cdfxPZ8L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dAD0qzW1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cdfxPZ8L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dAD0qzW1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659GOm422785589
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 19:20:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ny3CGQUHsR6Aa9iprwNBovoybcOVuDeB9t/uu0E5158=; b=cdfxPZ8Ly7A4SM9P
	71ksJT0jS9uDaZ2wrd2YFi4o6OkwwiJo8KRAUGtdAvCnAetZBlUDBnEzmaAIIieB
	hPJLr7/UKFfBurcUZ4F9Fr4X3f268F3YEP52JMQBQx2FdZQcYVKDXUX8IMeSs6zH
	kQ0wkTVUd9w4Vb4mYR9wIHn4v5imVIGHWQjQjSPkJOzulX+ZvFR/NwBuSJ3VXHQ1
	TCaruBsEcc1cemtD/RRNhlu5Q5HQwb64wQ6qVKtxn9JOrzXIr4W3b/FedqOK1sGO
	AnoidGzAh7XqO1Ax9pKmtrs5od6abmflzt27c6ZIzCJGNh2AMFtFwdIE0//BahC/
	9xrm6g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3jty94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 19:20:59 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30761ab3483so16234542eec.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 12:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781032859; x=1781637659; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ny3CGQUHsR6Aa9iprwNBovoybcOVuDeB9t/uu0E5158=;
        b=dAD0qzW1+j24QqWDX6t92l4KJadHplURbczHPDUewsazf2G6qgbCUkOjDXFkmrxMLu
         iQ4Xtdv0T3z6jyv96ZGP7T3poVmqi1pQUNAI1iKOAMms1HQMeJ0DlSAzUVKFibgV4Ikz
         HuFisrWJ9NNxw0aP9DvEsyIdCoY9tdv30tkq4TtupvBhYoLx1x9lxoFu6rhrdhTLo7Xa
         uxvzoAUXlvnfdPUo8OfmTYj2fCXzSJu3Cr6fE1n55OKzV7l6wYHcLv6WVQ6+bgtjEWni
         Uxsiiv6mID0sOObq/YgGjj2voNr1qSqXmj3V00nL1g5vigNaewOxI2DfftgZs64GXmJw
         +o/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781032859; x=1781637659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ny3CGQUHsR6Aa9iprwNBovoybcOVuDeB9t/uu0E5158=;
        b=ons84bRUGee8slKkkSv/exmYjXCBtbxc41ifiHUO3pu4Od/scm4K4z+W3BAPkUd/M1
         JLI4t/LEMJXOWZVJxqup/GXacMnu41o0WYnKvAh+9ff2PRh7o5DA6coBqo18PmbzzyOs
         EY9/iySH0kBRSqwS2mPXs5pBD83FCfJwSzLzsWYa77oGr/DLNg0xkv0dhsxwgnk0JWru
         xCtADDuGa1LrSYICDff7F2gx4D3rZhn8xXv0HhxZgEW5Ur3YhESnlf+Rtl/vey/dzYwn
         OhuRroODRarxcVK4HAiuh8dNcgCmfA+0yOvrLlwdmXJLJ8d7MCwfg3INPRDnhrnpqkaI
         IKdg==
X-Forwarded-Encrypted: i=1; AFNElJ8OXVj1aeAjj2MxfxWQ8irCoLMCHI/DPJCh04R9DbBbhJuhRkMj6DLTygj99UoEZFT/gCdjKTvZOBpT@vger.kernel.org
X-Gm-Message-State: AOJu0YyuTTCAVMBtXTTdyQvAoj0AF2diPLNW3ZAtsH221H0sXGGE+BUE
	Y/ZUtJdYGD1/K6Vkx96qnmQo1jHoY74gdcdtMa9mx+ThIbgSE3CjFOSPWGoQm9hOANPDmdKxyMZ
	XbzJxDjvbg997NvQF1ZJlmQMIegAZIuwyA364Du1KgriwqZ8QM1gvsfI4qP8ezUhI
X-Gm-Gg: Acq92OGc5YgH8o9vuGag2mKcCquHNKHCG8/82lET/6dlndKCo9iLIiGcX85EvFsSVlE
	2c1CHrXzb1k6bNRuJSBTL2S4WPWC+w6PLXex9o1XoZRmuzj1ImucFSzMFEmRtEohXRUkSQHE7RW
	l/buGW/yqwy33HWJUHS7QdSbO29mHaTR5Xqf6O9yknIiOvPK6Gohh0yRsc5ZqP8XAIbWzpoIcqp
	8xCD5zWjHdsBq3hMTgKO3HYDHoWLq3nRjHykShHpFkON9Vg0mUTop1t7qDnzyzGUtN5ceyps24z
	SuLJ3V9UV5MxRScgcv93JEH2Gm8KX8DEeM8boHnpQHUKB5wbIIqhUEzlFk+3qO7cGBRkBmkVjrH
	450qXkoLzDhl9Z9x7YzY4Q6UST3TS/NKde+dPUQqY2dUcovErFO76AUrRmlpnDmqOnYhlSx/Bgt
	t5Se7OsVJprIo=
X-Received: by 2002:a05:7300:8b9e:b0:307:d4e7:b16f with SMTP id 5a478bee46e88-307d63171f3mr3318295eec.23.1781032858620;
        Tue, 09 Jun 2026 12:20:58 -0700 (PDT)
X-Received: by 2002:a05:7300:8b9e:b0:307:d4e7:b16f with SMTP id 5a478bee46e88-307d63171f3mr3318260eec.23.1781032858046;
        Tue, 09 Jun 2026 12:20:58 -0700 (PDT)
Received: from [10.62.37.26] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074deaab1asm22261217eec.17.2026.06.09.12.20.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 12:20:57 -0700 (PDT)
Message-ID: <04479989-8aca-46bd-8153-1dd033f1fdd5@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 12:20:56 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
 <rpnNMsR9GY8gbynzeBO8Zm61JAOq3ubt6sp0x3WDPPwkMAJzlcofECD1kabN-IUoK6sSwP5P6l28UIZLFCOpjQ==@protonmail.internalid>
 <dda32577-04e0-4507-acaf-a5694f4f31b3@linaro.org>
 <478df3ed-d4ef-43aa-bb84-e2075798542b@kernel.org>
 <ec98ef2f-02b4-4086-8b4b-07b6953dbd20@oss.qualcomm.com>
 <514cf213-5778-45e1-8d70-d3fe27991fcc@oss.qualcomm.com>
 <7JNJ4dUNz4ennJ5dkzhfLSuVo72JpfZAbprICPRqlRYnSzVDJw6x3h-1nESd_PK-3us9f1V3qOiLiywsTqP8vQ==@protonmail.internalid>
 <f01c0e22-4e5c-44e7-9ea4-4bc8d53aea2e@linaro.org>
 <29e8491f-20e8-4082-8943-66bee7e3af1d@kernel.org>
 <5ca611b1-0663-4975-bd56-b1343851e5fd@linaro.org>
 <83c12dc5-fcb4-4089-9917-9f0fcc4f940d@linaro.org>
 <1b107aca-a857-4e58-a763-39c82af67747@linaro.org>
 <67b6f6ae-bfca-4afd-adfb-6ec1741105d8@linaro.org>
 <335238ae-c476-40e6-8639-44258fefe988@oss.qualcomm.com>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <335238ae-c476-40e6-8639-44258fefe988@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XEx57lrBhz8H-8GynHSeQOfIYsJVNJ3w
X-Authority-Analysis: v=2.4 cv=aa9RWxot c=1 sm=1 tr=0 ts=6a28679b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=qIjKha6TCTV6UgnzlqcA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE4MSBTYWx0ZWRfX7WXDC5qDnBl7
 IR8VgExanLasNvuTKPU47dF4Og0LE7wjXaCNC89O/1G7l71RIESTWhMnIi8rSptnvYFIHPzM3ae
 lya/lvPHHDdS121uaGgviVa5RlerMrTGD937zV++nknHCYV3Z5EaIVJ9T0GUuWFNU7IHs4HUEGK
 FMfMoMMoaFLKTQTCk+qUhUPGqBa2G3D4vxOYIyXI0lh2YilkWT1CH/ydCee1MK5eROnI1yvC8e7
 4Ve6h6atnierex9M8JSFYS0D9yeZw0jgITOggytueFeyhr6ji46yOr18jUCUqIeq7/rFgUBzx8h
 dWdGMa2u2peis9PMmRzZ6dyh7OPIPn8GbvKri3s6G9IkPq9Btm5GBCZ4Ee4VkBeVGkWJdbGKLe6
 rsOPOp4tv7cI5tyUbDxdTqvFaSRUe/a6PJ1yls2EEsAV4geIU11HTOC4wfP/JfAiU+XdOGDwCou
 fgFWb0KlmP030p5Fsdg==
X-Proofpoint-ORIG-GUID: XEx57lrBhz8H-8GynHSeQOfIYsJVNJ3w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090181



On 6/9/2026 6:56 AM, Konrad Dybcio wrote:
> On 6/4/26 11:06 AM, Bryan O'Donoghue wrote:
>> On 04/06/2026 09:46, Vladimir Zapolskiy wrote:
>>> On 6/4/26 03:30, Bryan O'Donoghue wrote:
>>>> On 04/06/2026 01:07, Vladimir Zapolskiy wrote:
>>>>> On 6/4/26 00:18, Bryan O'Donoghue wrote:
>>>>>> On 03/06/2026 21:51, Vladimir Zapolskiy wrote:
>>>>>>>> Actually, one more thing, Why isn't TITAN TOP GDSC here?>>>> +
>>>>>>> If CSIPHYs are true subdevices under the umbrella CAMSS device and well
>>>>>>> described as subnodes, then likely none of power domains are needed
> [...]
> 
>>> CCI is not described as a child of CAMSS, here the situation is different.
>> CCI probably_should_ be a child of CAMSS given the design we are going for here.
> Yes
As of now CCI is an independently usable device to configure any I2C 
slave that is connected to it. If it is to become a child of camss, it 
should be self contained, as it is now, and camss may have to become a 
simple-mfd to make the CCI independently probe-able? In which case, we 
may want to follow the same protocol for all other sub devices like PHY. 
However, if we do not have any requirement to use CCI independently (who 
can confirm this?), probably, we can stick with 
devm_of_platform_populate() model with common resources at the CAMSS TOP 
node and sub-device specific resources (only) in the child devices.

Thanks,
Vijay.
