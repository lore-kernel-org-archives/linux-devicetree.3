Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D923749E2
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 07:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782373897; cv=none; b=gM308iYCl3JPClaMCk00zy64/ksw3LjzmUvXXgVqW3ZCng/dPHliqfHvO9PBCmhHzdOdLwHHRLimj34EakZR6ymUVFnQUTf4lQqdFewrqrYPPP8pEmHRYa2wej2YSFCrrZoaXV3+SF+1g5pTwwt/Pm8gpYwzFChG4tPUbLnVLDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782373897; c=relaxed/simple;
	bh=IhddJ8wJua/m+ug2p6DPU/19D/1A9Q5EUbXR5cH3xDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GHVkvySZ/V1qWQOTYcYBi1vzra1H/2mx5QKIWCGVzY5brCdBKctpT6KomV1AB9QEtcw39d7uAnA7+IKBvlJxpCujVZHit+RYSgjTbVmld/5kUGXlxxr03r2OU95/u87wQTcxGdhtVGXEuaEkO+hYpniGcUarHuUpxYi8ZWFKVZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A6UJJ4mc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K7uRlQAC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A6UJJ4mc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K7uRlQAC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P45v5U994173
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 07:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7LTkSUI+YJToHS8a4HwcpVIMbbMkUqrCKJ7kdKLzNKU=; b=A6UJJ4mcHbqUjDYf
	Eov29aBmQqnUI2JQSICLlh0i0+MV00o7JJvg9xvz5n1S6+aG7QBrZz41TdGOc/uF
	bJ4kdfCziNq1+LH5/CfpAihwd0FUY3CzWG3ECu76F5EckGc93d4Zn/uzRhvTE3Uj
	8w74YPmuvmcqRpXwzBjdSPkJ0KXQFVb0BN8azOgT9Fud6GRbLEjarsrS0esqTu3v
	qiY2Cmy862MhkpMmk+GkSzse58g+tIT4Qu4rt9PgOHHRyRCCLHRnlwQ5l90uRzGR
	5KM75Lw3bPNwe1Ki2vS3GvAu4iqTtWeKYmYI2EuHX3ixxnIS/u9EqNGdNOkWopr/
	AZwVLw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0w0q0qvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 07:51:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9214bfa3b98so325618285a.0
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 00:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782373895; x=1782978695; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7LTkSUI+YJToHS8a4HwcpVIMbbMkUqrCKJ7kdKLzNKU=;
        b=K7uRlQAC/ikvfan9mqqZUR34aLjwV0HLiIZIVI/aMmxcxrl5xiqNGWuNQNN6OhK5PM
         Be6FSHrKJs3a/miPD5noQBovGRrrdikJWZMuTFZsTYL0QR6fH+Ba3VeuDr1bXx97IkTh
         7/+BnE2LlSPvEZ6w0bQyKxaBa0EbJWknLE71lIYrQn6cGTE65IQZctaN1eVqO6GMzpEq
         evi077Q75vDtnmxsNXsyKEzRETqAKhKy66o/Vkub8VktpnqieNtxMDNCMe6gbhpwYbih
         mClxu5mydYimYOVspdeWMuPZsJue7T2CzcjRFS4W/Jj11fEPFR1c16ZgnpQWmi5IXObE
         A1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782373895; x=1782978695;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7LTkSUI+YJToHS8a4HwcpVIMbbMkUqrCKJ7kdKLzNKU=;
        b=EHSClUkVYY9ZrgVpI84B14K95wVtEXD4B1itE2VfS71ksgZJ2KK3rJNOGnwkDwoJ/3
         815owT0CW6CrpUP8gnHijjb8Wyeh4YhxMHrPREYL8tfkizbzPy93pDhs9hwrVutkyr6H
         wJ4BlwFPxCNqCLR8sTzNPH9ih8LzkIbpS5oXaAfAM7Lr9vRyTxKXn/hmLqTuztUWoJgt
         /a9YI53uBKM3b4LPagejJgemHP7iJwgizfxEQMAlvNmvsJmYfw2qP8ZXNNa0JYaNGEGD
         n2qo1BONsEwAMEO/v97uLUTGU7H+bKMEDWeyygCXW61rUpo4v8Ma8EY0LKds316nAHhd
         7+nQ==
X-Forwarded-Encrypted: i=1; AFNElJ/zc4aXxC6wSOcSs3N8L07CSs/zJv7XemYQtYrpFp5v2Dv/tEcO+bXSGrn3aKolkjGFQPmdeIZ7YRBY@vger.kernel.org
X-Gm-Message-State: AOJu0YxZeWPDup96SXgqdGlVlolEgjhFJ3WEy6+Tk9WNH1+29oYWVgtk
	Ar4nxUFYdySTFTCwzR+hvkjeVkDXSuK91bhnsy/NDA8e3Xer48BDNBWnb51DWyiAErXTNKPZaDd
	4+/bJZ+H8CfJ4gu4OWJT0xe3xhSShHqJxowF+dV3W037NkNEZxLrSUrYq7lAjhGU8
X-Gm-Gg: AfdE7clj8kJVkLpusEbGK9CP4UH6eK2WAn7boWdijfHVZIukY83njFWipgcmGMx3UkF
	J5U0b4GDOCOGX7mP8rP365R2Q5hTS0c6po5Uc2UuLf6GYPpfctaKAHlrUmtZCl2ISJZZGCBiK3r
	X6kBgRG3Ba6PjIKKhvyEGnTNHQq03ypQCsTY+VWcmTpykt/wafn3igzQHfV/zgAcYJTZ0zqtcKD
	FFhTef4wr+5ezn1N0fnBoWKFqGAyWHSxrjCDGBj2yLRcopMt3amUnpZkJqCMPYS14N7q60lEqKk
	CS/xpKuqsWeZUPFg0P12O6C2bcPVsxTW9DS4Fg1OrndoyThmQDNFGI6vgmW+tUXCSDadIcuFuVi
	ljgTnBEDoSjQ0vIpsbuWtC2ksq5+AwVbh72Ec3W6W44VwERGvpvVlTskWhvkark+BTHjHvYVntQ
	==
X-Received: by 2002:a05:620a:4106:b0:915:79c8:ec94 with SMTP id af79cd13be357-9293d8b33f1mr194383085a.39.1782373894616;
        Thu, 25 Jun 2026 00:51:34 -0700 (PDT)
X-Received: by 2002:a05:620a:4106:b0:915:79c8:ec94 with SMTP id af79cd13be357-9293d8b33f1mr194378785a.39.1782373894204;
        Thu, 25 Jun 2026 00:51:34 -0700 (PDT)
Received: from [192.168.10.101] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee01d9csm14999506f8f.12.2026.06.25.00.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 00:51:33 -0700 (PDT)
Message-ID: <af39bf37-4ab4-44d9-b91b-b8fa1784783a@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 09:51:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: remoteproc: qcom,pas: add thermal
 mitigation properties
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-1-291a2ff4c634@oss.qualcomm.com>
 <20260610-ocelot-of-stimulating-excellence-bcb0fe@quoll>
 <03d863ee-2caa-41f2-94b5-7332fc930b42@oss.qualcomm.com>
 <d81bc78e-2c1d-45fd-90c9-f7ec462183a0@kernel.org>
 <7f1e46fb-15e3-4638-9930-8abc1dd5a778@oss.qualcomm.com>
 <fcf93e0f-a2f0-4070-86ec-8a34e9344b76@kernel.org>
 <ec65893d-873a-4a62-b0e2-5008b2130545@oss.qualcomm.com>
 <3cbcaf8c-357e-42d2-91c1-9d1a32c55ed0@oss.qualcomm.com>
 <ae43a691-4879-4bfa-8c7c-1be16945480c@oss.qualcomm.com>
 <9a31bb29-75d7-42fa-b8a8-4155cf85cadf@oss.qualcomm.com>
 <c32e263c-ba4e-4899-a935-e129de0f1269@kernel.org>
 <61765401-3397-497d-a0ca-e9bf9d76cc6a@oss.qualcomm.com>
 <5b0f1f39-ddaa-4a2e-ab29-34aacc9ff672@kernel.org>
 <ae0ec05e-607b-4022-a006-2eb1a283144d@oss.qualcomm.com>
 <d9582027-8555-49e2-9a36-c3b952dc61d4@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <d9582027-8555-49e2-9a36-c3b952dc61d4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bzhpKeKXl6-FOzE-IZqes0rkCj8I2ZFd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA2NiBTYWx0ZWRfX9CFpUjcvkZa7
 0JZayYdTDl+rLegJT5CdW6x/lCphZMNzsvkGuGs/61+qfbr3PZ8L3HR0i+jG2q90abf4tSM5P2z
 MQbC9L4K1ekFhzIdy9920taWBWiU2XE=
X-Proofpoint-GUID: bzhpKeKXl6-FOzE-IZqes0rkCj8I2ZFd
X-Authority-Analysis: v=2.4 cv=R6Ez39RX c=1 sm=1 tr=0 ts=6a3cde07 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=RTo7OxITtARzf4XpFQgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA2NiBTYWx0ZWRfX+ua7fDehxv/C
 7z54eZTu9JTlOePepIct8pTZ9/73OziW5WcCRxpgQlrUSU9QcFFMZ1Q6datuOhh5yfUjlYkhOfL
 2taVX4j7p/yF0bmof3/o7azAFwuQs0EVkzZAxW6SiJVWLFE6QyIusNyWpJE1P0RhXgsJJOUw/s0
 UP8tisLApV8ss8f28NR5esAUfYywcEr938seBll48dDm4EC7bxRKtiXNHvJ7us5zHxMGN4Iadmd
 svIjju2oVqO1RU9qPrR2BLoNTew0stXXNpGGGTwy0xu58mL3u68nz90jGjOwV2uSAH16R/wBpOd
 hHpnMRCPqEbUaDnulidUynnOaWo84MaNxOAr3Q6m3rrGKI+DuH7OBbSdiTUxJBOhKdpjle4i8ks
 yRJuvcPNn0FXwHuexy3v6raqHprkGjyHCLTdf5MRPI/Jw4IrC9elyC7Sm5cMKT6VkuJ5nXFHCjh
 QgZxgPyG5saPaSYqFMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250066



Le 25/06/2026 à 08:48, Krzysztof Kozlowski a écrit :
> On 24/06/2026 17:56, Daniel Lezcano wrote:
>> On 6/24/26 12:42, Krzysztof Kozlowski wrote:
>>
>> [ ... ]
>>
>>> Therefore I still do not see the need of tmd-names. You know the name of
>>> cooling device, because you have strict one-to-one mapping.
>>
>>
>> There is one remote proc with one or multiple cooling devices attached.
>>
>> We describe those in the remoteproc node with the tmd-names.
>>
>> Anyway, we should be able to list the tmd names in the driver itself if
>> we ensure a consistency with the index by defining them in a shared
>> header eg. include/dt-bindings/firmware/qcom,cdsp.h
>>
>> #define HAMOA_TMD_CDSP_SW 0
>> #define HAMOA_TMD_CDSP_HW 1
>> #define HAMOA_TMD_CP0UV_RESTRICTION_COLD 2
>>
>> In the driver:
>>
>> struct tmd_name {
>> 	const char *name;
>> 	int id;
>> 	bool disabled;
>> };
>>
>> static struct tmd_name tmd_names[] = {
>> 	{ .name = "cdsp_sw", HAMOA_TMD_CDSP_SW },
>> 	{ .name = "cdsp_hw", HAMOA_TMD_CDSP_HW, .disabled = true },
>> 	{ .name = "cpuv_restriction_cold", HAMOA_TMD_CP0UV_RESTRICTION_COLD,
>> .disabled = true },
>> };
>>
>> ...
>> 	for (int i = 0; i < ARRAY_SIZE(tmd_names); i++) {
>>
>> 		if (tmd_names[i].disabled)
>> 			continue;
>> 		devm_cooling_of_device_register(rprocdev,
>> 			tmd_names[i].name, tmd_names[i].id, ...);
>> 	}
>>
>>
>> In the device tree:
>>
>> 	cooling-maps = <&rproc HAMOA_TMD_CDSP_SW min max>;
>>
>> I think that is somehow what Konrad and Dmitry were suggesting
>>
>> Does it sound better ?
> 
> Yes and I am surprised that it came now. So you had TMD index available
> thus the ID was defined. If device has unique and fixed ID, you should
> not have any more properties defining it, because that ID is enough. Any
> names could be only for users, e.g. label, but that is not the case here.
Yes indeed, having the constraint of cooling index and tmd(name, id) for 
the connection between the cooling device and the thermal zone was a bit 
confusing in our discussion.

Thanks for the review

