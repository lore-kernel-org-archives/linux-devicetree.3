Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610951;
	b=UWfP+Er6IWLVnQl5NIl+ZJ37oECnN2xWkZVsqw3B3zQ+2UwIfDdrJAXSygeyRCmF6rHZ
	 atQYz9yDfrpoYnus7cayhSxGFtvDLmFmfepM6DIQCcnrwR1QxYlrX6x9b7l2j5fp/OjwH
	 hO+KRhw53P26Poslyg+vDhmJsIZkIWj5Zwke0cYDLLSomQ8Lf6yxJKyuVrY9zjJMIY627
	 /S5UlYpIn6i3icMflGfaiIkgUb5WCywAuNqDxQb7UH3u9n4GDUF2A3/GB5FfY2VK8qk95
	 E+1B4AXUgMtzG7mpaMWe0688EtxAYhNenx4xxF21vWL1Ce8dlw0X8SOFo9M/cOiruOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610951;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AEVL6MRXYsWUQLv2m76Ju9oh6r1L4lN+d8opj8HszTI=;
	b=b8r6jx4+J/+EAeaMoKTbX9CPvQQdGE3aHBCwUYPiYvyGav2elxrpOvyIchmcxQXEYoeH
	 NsRXTBDpm4sGou9LahvAySCGfOXj05bxIfEFLixC459XJQPzR+nhzfyWihK63v6oHlbnT
	 mEPBz/a/fwPO8pnwdoE4YElSp99YN2bdLq2KQrlo5agKPIUqFDMSxtkRyWgA1hDRkHhJa
	 b49U6G6hEgBxbtG38q/KEHCzFFrSouYS951yCNr34IUeYP8ViPq8eNTYeh1gFRxQpbjBH
	 mUZ1u14Yc7E8yPv3oKl6XFgepzu6gPt6ZGb9VcwuOLxvSAg5kc5iy4dKE4ZG0DoCfEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I7uTwWoL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SUhHrq3T;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1831606A326
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 09:15:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1831606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I7uTwWoL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SUhHrq3T
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AOwl3086551
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 09:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AEVL6MRXYsWUQLv2m76Ju9oh6r1L4lN+d8opj8HszTI=; b=I7uTwWoLS2R3vItJ
	6mMqX4yhEjdW4vB5H8U0w1FBr7abaQK3uOWKOeEmb6bhRQtDPH7rQd6WbYWK66H9
	kjT8Lxy6XzeaMNWHqOrjfhivIr7cppkwGiyQDTjQyDUKljgAMWcllBAy/sS6Ag7h
	e23SLG5HzDs/m4Mb91jcvS73OlCIoqQFQYN65ORXIsLne4UAH4MJQT+9zrdCbWY1
	IzlGBpkIFlgI4gNAW/id0TY0cZ5B/UnkXCt2SWRLN7TZGyjv9d3wlyeDttYTUsgN
	09GPkyjxKhaRCB70V0BmrMQ0ILZix0v44oNGKYMeF9hwPLlKnUxk+kWhd7i7sNK2
	9wLBPA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka6124y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 09:15:49 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a0592d4539so4046678b3a.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 01:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793610949; x=1794215749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AEVL6MRXYsWUQLv2m76Ju9oh6r1L4lN+d8opj8HszTI=;
        b=SUhHrq3TTvQYhpa5BgzXfksRmCaualRkAZXOhxMfu/gwcELB/Ks5H79mCGcJWLpUtu
         S+FhsLvh/ZZe2IOCO258msbkN1nXXqvBeC5JiBI3HSgrDpxiEwWh/adlVS9RuHSjRyF+
         8kIT3vsqyH165LiSbCZzj8mDe+cO8tS+QDlx8foGIM/FddRwFzNeoZdaGfpz7kDpPvZZ
         J8n0gFtCYJo9xS+oT9582nsKxyBVMheStD+H4OxMjsm986dmxN6k0TFdslakAwUktcbF
         x6sSTVHupcPQIU7+yknp/jkptpaX5bNqV0Lt8QWOJjtujeTBkv+ymiVEKnzndrhjkQ0s
         +BcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610949; x=1794215749;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AEVL6MRXYsWUQLv2m76Ju9oh6r1L4lN+d8opj8HszTI=;
        b=mA6QkQtW7Uv013RnN0YZae8tidykhPznP8g4g9NKrFlNjEEUP5B95ovZd1N3xENabD
         R40dDGB83UnktsypSa61FV034g8kFthBjgjiM0EfBpTKVrPMpBhXCr2mc+Qi6PyxBS8q
         MDFtqcdeGxTUcx+DSRo6/W07R+NpMkwYR/VF3X1WCJ32fCWaDf2FZybhAk28+epdbOzj
         p10qVy+c00LnFBrklcG2x+WnKWp1Dy9aQVzVYNdsyhvh1rhEkbOwfB9gXDE1n4h3uFLC
         AbnwASL57Nyvy2pI9IdM4Z/shQhV8xmh7JzrCnQhxWarHy7DMFa9ZlmLau+qun8PJJjG
         xJLA==
X-Forwarded-Encrypted: i=1; AKwUvByjFcmQtUEUfp4A+vk1RTc/LLHS3A7Yy6FBCz3mTiphsoWUMpTuwxsTyZht0sg9J8afKYgcDo4qMpFY@vger.kernel.org
X-Gm-Message-State: APuU4Z+7RujkIMQloPtog+XT7jsU6SyW9DPT5xxj6b8VWIGC+a4oJnXh
	vDK+l2QYZ7wl6yVcmgvEsCGoCWB3xbSH3QQQOxBLSJA2L2YuVLWwzJd9NLEhIH01YQi5sGWwLGT
	WSkRfQ2NtDnlmBAGPn4Vrq68uioGptvJ5RNwQ53sXo3AuLqw55rICN3frqO+Z3cn6
X-Gm-Gg: AYBFou2onD6/spje85VTIx4sqhgiVRki6Zh4cVqVXjKxccdahJ/hMHy6/QQdAXg6lgd
	aNud7gyd+x+cQI/8qlSdwnmx7O5/6NGHYngEPzTb/BEWWDkzjZJ+4m6YaZ8DUI7KhMlGLOc8jzw
	wLB3YXnOdPq+t5e31ZuT7DQbO4rKqCw0FFiv4u9+bsCIn8HZsIQzrJYvo6kfLqvJhWjFCjBTHA4
	km0aoIdOI+G+q3RCgARozyqNyC6Y6c8zratp9Kuk8A6MZaalhCtwlMV49jLUjICD3b70j/xFXtg
	1hmutpzN0Gu4GtHOUJ+/k1pt4K0wDGs6SGUS7gi8edsGuoSXh9Zj7z79QvSZqO4MLfttXuDejCr
	vvQms2gE7MvWyc//NysFD69OsU0i/vKOsbDTVrE4rM7wHHo/bYsvNKdhQnytsxtJ4aGQm5ggtxA
	u0OdOHAYBPVtImvXXgrt8pC8Rk+pYLZ/Bp
X-Received: by 2002:a05:6a00:2d04:b0:886:31d3:51a2 with SMTP id d2e1a72fcca58-8a9bec6107bmr7559096b3a.39.1793610948743;
        Mon, 02 Nov 2026 01:15:48 -0800 (PST)
X-Received: by 2002:a05:6a00:2d04:b0:886:31d3:51a2 with SMTP id d2e1a72fcca58-8a9bec6107bmr7559078b3a.39.1793610948253;
        Mon, 02 Nov 2026 01:15:48 -0800 (PST)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada6bfdbesm1745367b3a.42.2026.11.02.01.15.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:15:47 -0800 (PST)
Message-ID: <a4370991-0d91-43ac-b91c-c1c416cfbb91@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 17:15:41 +0800
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
Subject: Re: [PATCH v23 08/15] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
To: Vladimir Zapolskiy <vz@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-8-95f250b18612@oss.qualcomm.com>
 <dea88756-39d3-4c61-83d9-939ddb9336fa@kernel.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <dea88756-39d3-4c61-83d9-939ddb9336fa@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mvDibWBdlbWKbxRd-Gc3aBDAFb1FPxR6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX6+7uFGNsmROh
 W04UHnxCXV2sMhuV+xC7imiSs2CLNIBZAA4SEvr2qD26SLfyomegOSI2TuJvbRya7/EGFgiOfG6
 ycD+FnjUZXi4TvV0PaP3buMzQebGP+A=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae854c5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=xlR6tl6hVQPR--6jroAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfXwC4TulJ13+1B
 BeiD4fIGCfXMWhI8BnUBYZMdaU1PIVr3TkTHOLp+paKoAAecVLo8cJYsOFwQgN2R1z1ltAxxXEv
 74c1AY+B1/SXsEaMUfC8qtfllO87mE7Z6/ti96iV/a102UZ7atLbvX20eMEivfQQpI7JQCjaQTk
 s8Xl/XNpKQsF70a3PoUZFgT54dxldbYpWkdg4Kj1BKHPTToyiFftdHwcR3wJAwCmtp1V1woacki
 QMTqu8ouIO2bmhBwHzVRiuQbKE9+Yw/MbMBMwiMQIILcjnrxFusdWM1Zj3loAwNvZhCN7hKcFsW
 Kw4Qdn2el+S3iUKoRNs/xY4R35abVYP/k9vFPIMQtzgJQqtdyb/Stb4tvuZnnJQJf0bk1vj922u
 VmzQC61aWiFOky4h3lZ5NAHSJaIuBO2PiJY7Mt12nVPEe8kMtqPUvMCEJrZmCAAvUAiJww5gIKo
 f89I8pw+zCV7geP0KCA==
X-Proofpoint-GUID: mvDibWBdlbWKbxRd-Gc3aBDAFb1FPxR6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020036

On 10/31/2026 1:01 AM, Vladimir Zapolskiy wrote:
> Hello Hangxiang.
> 
> On 10/28/26 17:20, Hangxiang Ma wrote:
>> Add support for the v2.4.0 two-phase CSIPHY found on Kaanapali, where
>> the PHY is driven by the standalone phy-qcom-mipi-csi2 DPHY driver
>> rather than by CAMSS. Add the mipi_csi2_dphy_3nm_kaanapali configuration,
>> which reuses the x1e80100 lane sequence, clocks and supplies but selects
>> the v2.4.0 common status offset, adds Kaanapali power domain and register
>> the "qcom,kaanapali-csi2-phy" compatible.
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/camss/camss.c | 47 +++++++++++++++++++++ 
>> ++++++++++
>>   1 file changed, 47 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/ 
>> media/platform/qcom/camss/camss.c
>> index a64242c66cf0..b0b63dd3d958 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -38,6 +38,51 @@
>>   static const struct parent_dev_ops vfe_parent_dev_ops;
>> +static const struct camss_subdev_resources csiphy_res_kaanapali[] = {
>> +    /* CSIPHY0 */
>> +    {
>> +        .csiphy = {
>> +            .id = 0,
>> +            .formats = &csiphy_formats_sdm845
>> +        },
>> +    },
> It makes no sense to bloat the code for no good reason, especially if
> these empty tables are to be added for every new supported platform.
> 
> CSIPHYs is not a part of the CAMSS on this platform, hence resources
> shall not be statically allocated for CSIPHYs in the CAMSS driver.
> 
> See also https://lore.kernel.org/linux-arm-msm/20261026224957.1115370-1- 
> vz@kernel.org
> 

ACK. Will include this and refine this series.

---
Best Regards,
Hangxiang
