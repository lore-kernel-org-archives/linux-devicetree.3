Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795698;
	b=mz6QlFqFnkGIS+AfeGdq5NzeDyl/1kRO+3s6nStYyDxUO01rmK+OI49uEP/3fYZx8c87
	 Dfhu+qWEKkI49zYKRu6L3VDLiArf49p2vAAZO5jbeUAl7x96mGXtMQyHRTlCBcjqWqIWI
	 rB5DgcHKZQ7y3r7nmvkQmgz85Ft0nbKTunijaewdXMxCZNO7AUX+IF0YmdunQF1CTyPgm
	 mcdNyhSlipQVWiPUITBeYsqI45/m/A0+3oRwWMgAMnC1RFGO2dIlxNu890A75ohyjuGmA
	 2DzADeYuvocCnArYzf+Aezixbu+LgN8MSbdPudUkPPXg2N4pHxuU3lMpqUDb9EWz2sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795698;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sds1MGBA7G+Tt49HG3Xil58EHIRS9PXgqNLiElDB5ps=;
	b=EGOiT60r1XU2v8QstKkLE6lpPaft6a6uQ+JMlhetNggYaUrbYZHxQsbttWe1oV9aubJd
	 juwccW/DWE8DqINmJ9deZndkvIsXyPq+U/CX6jUC5gR4CBM2WvHhVwADvTkiTRPtdtInm
	 ZmzqpQtCzHkz4cU3/ZJ2oYN63ZT0cSmxFrgV9OU85072xJwwduuTVphDTmVxkXSNF4ohT
	 4VwLLwjGUearJT4N45zEiUXum0bJEVqfzoJ+Rr8M4ABqyzpiDFtxv95q7RIgTHCL7ISgw
	 I54bV7q1TG1XFgISfM9A7OQfXpC+mZ3Vj6BN73IUjUVkeBfPR16nHcKyq1MZYHtOHjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pOfqafgI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="dpGhNB/x";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA17F606A32E
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 12:34:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA17F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pOfqafgI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dpGhNB/x
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZuMW1667548
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 12:34:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sds1MGBA7G+Tt49HG3Xil58EHIRS9PXgqNLiElDB5ps=; b=pOfqafgIiyQ3bF1F
	wCGdEsEymDm2DhPxE86PtdcXoDmoWAokBuaB+EABu0eo7mt50FqVGPRqsTkHmgxn
	h66k/NByR5wpJeHuR7omk7Gdp+cUFNDikpZc2tmnTdbTH9GggWJO2n+Pd39qRvXf
	sc5te/+SfEZihjhJElibGAhEjxJCz5P8SfKBSc85bG+DnxIHgrMfWbbRZGloG2Hi
	s4bNDBAFsJoQf8qgcuU1CuRq2a/UxdsE2wBFL+cKkIUg/PWzjqE543GAy3BQnrh+
	MwLyEeMDsJcfk07SDFx3sjeyORqaWjK4ni3lxqj5y4CPYWTsJ5yBmLciC6tJtFVK
	zrV7YA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8nktns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 12:34:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eaf8ea208bso6292275ad.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 04:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793795696; x=1794400496; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sds1MGBA7G+Tt49HG3Xil58EHIRS9PXgqNLiElDB5ps=;
        b=dpGhNB/xfvSW4grebQtPj/ZQrkIen78I8JiGV92g/WX/oMcACV1GJ9fl965nHnQTp0
         JyN4/Qd3sNHUKhnboVUUZCQ7rehlIIwRLw9C6h9loCM+zCDRPmyJN2GU0Yl/L3Wxzkim
         EzPQnMw0xDB8OTYSkycL2PDelqiJOK8TJCrQrLWZv+24dYIoZzqaS8qKSWsvDMxSsRsR
         u/l/L2kRszEwQBNPcSJHNX+dtTp0I2ySbMo4Jpou8v2+E9oRJ2XF9xXYZEFFZgS2Fzih
         kUukyKBVwtlAYe7Mqs1BF/0mGCRc2Smw9t9X5c6MgvU2QMTgNn09/NNr3fdQGlI3mrrz
         eMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795696; x=1794400496;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sds1MGBA7G+Tt49HG3Xil58EHIRS9PXgqNLiElDB5ps=;
        b=GBiGNTLfYsgvBjK+KvZ0CRrroSWfS/AVZJ+5R1/o+B5DgCdDaBa7Sie6NL+EUhb8Pl
         b71FOVm+kZ/1uTzUw5oIupSqwCUUCgV55kg1KXkrjLiAdoZEol6J0qaX+XbPGX58Vs1X
         YP+HTyM+6wTRYgFf1/RpcnzCXdwZDCn3D0RKJEumFpaBPxWNi/4I7qf9BxjtH2oQoyfq
         yO4G+u8CiQubLIehCXAOZizMDWkhyRtUkrpeJvG3KOdlVUW7zm2y0FlNej5DiDOYaSi0
         EuXRMYOtRluP7nqzUXDWWHuq8ObrUDYlwyUi79G4LudiITvs2I8H2w7HoR4wsslFx7fB
         Wozw==
X-Forwarded-Encrypted: i=1; AKwUvBzmMY7vowO9qI6MgFiCKaMIg+zNDFHGBfOkP4BZvv7I2FyaMphvUWVgh6AUCd1ZbXC1PccoV3TzxeVr@vger.kernel.org
X-Gm-Message-State: APuU4Z8Wk8AE4/mewi93rEQNPrYZiV5wnRTMsqJYycLdVoikMpd4OuFD
	LrgFuTD+o0mSIZiL0/UhmrzCT24ChIZUlYRhZ3YY38rlcEbhYBpoYNInVGY+PnVn4Eg9VAEluOW
	L4XDBHgCArGRRuVndw4TouAzWG9RCCvSqtWWPulGXqtv9sRoipdGswAdLXy0eNNfq
X-Gm-Gg: AYBFou3UDHnQsJr/Akz7i5UxjQ21Nupf0v4f2uaQtTF8uwPkFgpeiSH83/4iS6dgCMu
	z2i0Prb5suKLbIU3obYBTc3eQssqJGxT0pbP936INzvje27mxT9p+voosuXhs3W38ASWbeS45Zy
	Ila7OsvdXcU+jWV1+BqIX90qteBCLs3bcIs8rm2hgRxGMz/wscB0KqFFkP5KUNPDmm0UEKBI0cE
	Z+BywVYLNup1vOSg8ta1EPgq7cadMAps5sGI/th5hiWEzu/p/Y4rQE0cnwvTwRQN01NJzUUC8yj
	kk++doI7hCMIqoOcQnWlOYG6vKtoJrYCgoGdoKn67hCNy8Gy+l5vi46H8oD4b1RGS9hXGTaY5LI
	fKhzuJ61mj4xE664GaZsifElVtfMx+N3Tazs54Uu8FZ/9wajE0dcutlZA5Z7NEEn27DmSKdqUop
	CS4wi7GQ==
X-Received: by 2002:a17:902:ec8d:b0:2e2:ffcb:87a9 with SMTP id d9443c01a7336-2eb3642fe66mr137002345ad.24.1793795696213;
        Wed, 04 Nov 2026 04:34:56 -0800 (PST)
X-Received: by 2002:a17:902:ec8d:b0:2e2:ffcb:87a9 with SMTP id d9443c01a7336-2eb3642fe66mr137002075ad.24.1793795695582;
        Wed, 04 Nov 2026 04:34:55 -0800 (PST)
Received: from [10.92.198.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe1e6asm7038525ad.22.2026.11.04.04.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 04:34:54 -0800 (PST)
Message-ID: <0face2f0-deaa-4a3b-9e81-de68f206d2d0@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 18:04:48 +0530
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
Subject: Re: [PATCH v4 02/12] hwmon: Add Qualcomm PMIC BCL driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-2-50b9a8c730b7@oss.qualcomm.com>
 <3a5ff85c-0629-493e-baa7-543958764219@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <3a5ff85c-0629-493e-baa7-543958764219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1MCBTYWx0ZWRfX1LTHaNF9Ddyb
 fCD8uyf6C5ioreHDnE3HQnYhw5Sz4XGZvd6OnNtx5vlXuu9rexUC0jMsC7XK7rg9q6bZHgFRaJ/
 IVAgLEuhGRkwU5nH13UASWs40vwqDBXJ7jvSB57Sozv6nX1QUNrrlBKejP4Dr4biSrXQ61Ayh9F
 K5T/7hmk0/oOCHd4KDZKYtFnGzRHsFSG+eHy4CXFayWK2u52teyK+o9ugQFTuFqkP16Losamrb3
 1ITbXDuOCt+PgoriDlqHUaMI6hWR8iSNGbL+8fB7LuL6eI6MBp2LtuADDs/w7pjmRlBoxAi1qSB
 Bh7TBX+ZEOqlV+2HC+BkLXC1WTaOYpUC42jctOMd9V++V6jR0YQrco/gMRSZ9Yi4vcL9XaebGIE
 7iTp65kuXxCiUhAuvIpwt9Nm4nwDeG5hXssqaQ0CBiIrkiR4RDXlwSuR5Zeyel4Qf6r3p6WMAv2
 MCEk6gPh459x+IqZRRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1MCBTYWx0ZWRfX9GacLMIlQX+Z
 lkqq4zqOPbmj/Gbx79fmYT8BDO9IDX+Gio7TF3U78ZhWEsOu6ULJ9p+xMPJrGxOR+4JUzyiRBic
 Bs0rYArAvzIhTLitFqeLK16r4y77TkI=
X-Proofpoint-GUID: mF-lUE9oVkAQdaw0yvK0M72u80i7ufyS
X-Proofpoint-ORIG-GUID: mF-lUE9oVkAQdaw0yvK0M72u80i7ufyS
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aeb2670 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ex46fzmS382XuAsv_c4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040050

Hi Konrad,

On 10/12/2026 5:01 PM, Konrad Dybcio wrote:
> On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
>> Add driver for Qualcomm SPMI PMIC Battery Current Limiting (BCL)
>> hardware monitor. The driver exposes battery voltage and current
>> monitoring through hwmon interface.
>>
>> The BCL driver provides
>> - Real-time voltage and current readings
>> - Configurable threshold-based alarms
>> - Interrupt-driven notifications when thresholds are exceeded
>> - Automatic threshold management with polling-based recovery
>> - Hardware-specific scaling factors and threshold representations
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +struct bcl_alarm_data {
>> +	int			irq;
>> +	bool			irq_enabled;
>> +	bool			irq_wake_enabled;
>> +	bool			shutting_down;
>> +	enum bcl_limit_alarm	type;
>> +	void			*device;
> 
> Why is this a voidptr?

There is circular dependency for struct bcl_alarm_data and struct 
bcl_device. To avoid forward declaration, used voidptr here

Thanks,
Manaf

> 
> Konrad

