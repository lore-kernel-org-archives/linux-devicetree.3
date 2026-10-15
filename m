Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078FB3C0601
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 21:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792100484; cv=none; b=XiUaa+2bTBDuzzHoXN0QbtLsz/6Ejy/xh64WNC4iWQpVjCs0oYtxt3cT5bAl+6mfbT5hLwdTEYLqgwY/zrEM0hYs/4DJtrFSfWmwzdnqFNS6IuPNYEr/mSSuGQt+bBKa9W7gLjpCpRaufuWjgFOtd7qGzHLPrXUIHgwIVGxKO+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792100484; c=relaxed/simple;
	bh=kdE/oL2qvaXHvtKxe2PNb2/c7DP0GEJRE2hGcp9ZR1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rapFIoQ0oHBbczt41MONyq9ekiFirQDqWE0KTX35a2NOM3Z37e6F9YLk6VHmVLzjMOXpFkJDVckkv6lpqu41jdvhsmjLel91k1gNc2MT93pkmylK5sdDWQi7JfbWpTe7/ig/4pHwYdqcng6a4YP959p1uxScNjc7bnQmyUqX2ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W/StAFFS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UG++uUUX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W/StAFFS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UG++uUUX"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FFDoHn2678060
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 21:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4a8omtOMUvQnoW/+es8xVBAFKUdGDbUKsFkbcORMiDo=; b=W/StAFFSUlaMH/gX
	bWP5VXvrGrIROnXbTGVO+AR1RJ+1y2mROeuPGaW3Fv2a4Xg9e52C37hD10AGP5ZV
	l8L9csl+Vnocq3pep9ta5lTtWO+K9jla/+t7/Kef1QS/kS6/BUhxmvsjOwP+KEyE
	h0J6DW6yXFjbnlsB7no0uwMvXp8bGz+iuJ2k6HKCVBmANtY1V2M5h7ZR9Fk6nxAK
	aoGIq/DXlxFw/QFgh0YVZQypqTDbe+3RgbErz0HhSSyq6KQMHG59SzSPL4KLv6SW
	1NQtADzCZdgqWh7LdaiSoBh+p60HxB0d2vTSOCCJdZb3UJulSUKImnUjvOF0feyk
	HhA8kw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19t9g3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 21:41:21 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso10122980eec.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792100481; x=1792705281; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4a8omtOMUvQnoW/+es8xVBAFKUdGDbUKsFkbcORMiDo=;
        b=UG++uUUX9sCsT5iXOcUipEb6SLXyWma/F2Ln1AmLZhpqbmBIwik2U3x+YLiSuvEmgW
         EwlEIDV6RQwbWNSFhSqJHd3pdqimhBNhjRJig+yMk1L9l5b2QxWf9NyWv6l5e+vXZoTR
         fd38umcEBSzRxqoE6KSqb4vSRrDrZkQDw9pygTqTg0M834gG4W42fixwa744sispcTgD
         rbtDxGpzTphTZXalZJaOWzrhjMnXGl1kdw8SrAYvA7rNHwO1CMrip+v4r1EsQ9q+xXTs
         BYO7ac98m8hywbtehwoTRRIxRqAEYmPzZpkYJ+C71WtVqdc8m++K2fHEcXfVFaVIksCr
         sF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792100481; x=1792705281;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4a8omtOMUvQnoW/+es8xVBAFKUdGDbUKsFkbcORMiDo=;
        b=wTFMU7XQINeRajtBrIYC9+EeI/UszzU/p02MctsuoQAS+pM2Nwn5xiTXI1penBaZnn
         +1AKEysif+g2BsOzJaoxDxbgTeu9CuSzxVapz5M/ljYD7yFgcICoMAf/V6o+Tbu2Zq6H
         EGexPYJDu+RIc0PQTeFL+BnE6kUbuUV84zvWDdjm+/NWiv+j9ZEvhGbD/bNLaAnYP3sw
         YQwW+Pwza49CgAk220lafDn06rkaK72YaVAg4mtA53J3ZxCX4lh3Rh07G4SV+VvSoDDI
         vwD9IImrmaeBQkmug8AI28FDTF0pz5n4LGfYDosay9+xJPdeLcLtB3aZ5jPOe1xWW5tv
         Lwbg==
X-Forwarded-Encrypted: i=1; AKwUvBxvuuD5lifV//s7OmKbBZP2JRjXl06GYmZxBzU0PBBjFFCbt4Dpnvh3lq0H9g4wsdDwOCjHFNTtQ4xP@vger.kernel.org
X-Gm-Message-State: AFq9FYIA9xrKos53+LUa9jSnGC8PK7BI+k2Z0QXgZTpLvyHPmDBC2+tl
	b3/GIOGybOIyajPFN2TqbAuBfueus4Gu/EsXumgvXRyUd2ifD7yK+/JrkfWRFBpPPern5UG882v
	+ZEVgfss1OQoeCjSUZnaJm8E8Tz5xnZrPA4pJ02bGX4azsdULd1V+1whvWrYNdoYKKahWrjRd
X-Gm-Gg: AYBFou0pLsbHfgDP2xrlFL/Kqfr+xLPG2B5tOitC+kODmKALIVoXFSVW4WgT0kXL5/Z
	Dj7WpIc+m8hNJ7gW92RSF9dUTUwV0xl4SJlklGCdG0wVoUIPs3iimxA74zPqhdHUvJG7g811nw5
	TYAa3ZH0FH2AyO6C4uie1T1NQFxo+mn/AhByC+ObZk2SSkbGxYfnTNRQD8kPGYiDwhxVX4SQ2+M
	dKWUbY6CM7icYzawUS145podvzxQ/CL5evHMqiPtEUWSfWz67kU19tARKpMJZxI2cONAQ/lx6m5
	HBI2U50k6IOTRfSFn8NtNpM2oeZqYXqWSMwPtOQRZeTwCwmvKwpIQTgKDwOEko0Mfc+T72ZF3lz
	0wo8IVUP6lmZcXBS9DjIchfEQFCG9kCzl0yD6V9uEaZpk7jP7Es5jBdifPw==
X-Received: by 2002:a05:701b:2411:b0:147:a685:9125 with SMTP id a92af1059eb24-16a56c9f443mr25855982c88.2.1792100480724;
        Thu, 15 Oct 2026 14:41:20 -0700 (PDT)
X-Received: by 2002:a05:701b:2411:b0:147:a685:9125 with SMTP id a92af1059eb24-16a56c9f443mr25855932c88.2.1792100479947;
        Thu, 15 Oct 2026 14:41:19 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b859142sm302156c88.18.2026.10.15.14.41.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 14:41:19 -0700 (PDT)
Message-ID: <8ed23bd7-f783-47c4-8a30-bfdf74e95015@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 14:41:17 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/5] nvmem: Add UEFI variable NVMEM provider
To: Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
References: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
 <20261014-b4-nvmem-efivar-v1-2-187c85f65018@oss.qualcomm.com>
 <CAMRc=McDsv0k0bD2LoaXfOh7uyFo=HRyO098H=N=QeMFDXsLKQ@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAMRc=McDsv0k0bD2LoaXfOh7uyFo=HRyO098H=N=QeMFDXsLKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hcaqNFlpnLSx0ZJoOklD7igirDW-hf4w
X-Proofpoint-ORIG-GUID: hcaqNFlpnLSx0ZJoOklD7igirDW-hf4w
X-Authority-Analysis: v=2.4 cv=NqZE4MdJ c=1 sm=1 tr=0 ts=6ad14881 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=S4S59HBQktVEhwL6IfYA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA4NiBTYWx0ZWRfX4mK5ohmcI9y5
 2jznmfcnoXfolf+M17a/9RMUObEYa1cvyDWag8SrPTM+zKpd0Y+MJ3hNkWPf2aiVPrJIV3gQySR
 c2GuS2/FcqPSCr2ROiYGjjkdNT+tEV8cYeNMI7zsgd3QA5sR+IDMHV4XVGDXtGkKePN5Dk4G3Ii
 6iLwBkKhTD3PxUvjc0tRrB2kJvSeX0WTcLXg24dzRdgzB50GPZ5txq5kIgJuQ4BRCJ4zbA8Z7oh
 hxNsKEPT5L0vWJwkdFFBmORhFqQljoQUMDMGYsXyfnoIfvjgQG854wlcCdCymdLxSiXCoCM6BQ3
 IgJsw5aSfbVGZfaUClWtFPxQKwNmpQvn30Jy89wKZ/viDx4TR9Jnu7MlSVxeTMm+/yB6qo9V13i
 ey7UnfzEUCSvSNq32BtiTQt1CrXpuj6WkTqtkkxIyabfAL3H5XGtcdW/bU9lST0dqHzBhODAIZQ
 CE8gvrECLqptMVxAhEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA4NiBTYWx0ZWRfX3fKKKAfz7mEV
 ByjKtE5+FzjJLJVrGZiLp5pR4AvUpfE8/tq9vwUvKKgBkeZfhjFiJRg10D8hgtfu65vn0cUPBD9
 PLvnvIRa7Ts2kMOxuv5fsMas34yFRs4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150086

On 10/15/2026 6:22 AM, Bartosz Golaszewski wrote:
> On Wed, 14 Oct 2026 15:02:40 +0200, Abel Vesa <abel.vesa@oss.qualcomm.com> said:
>> +static int efivar_nvmem_find_guid(const efi_char16_t *want, efi_guid_t *out)
>> +{
>> +	unsigned long max = 512; /* in UCS-2 chars; variable names are short */
>> +	efi_char16_t *name;
>> +	efi_guid_t vendor = {};
>> +	efi_status_t status;
>> +	int ret = -ENODEV;
>> +
>> +	name = kcalloc(max, sizeof(*name), GFP_KERNEL);
> 
> efi_char_16t *name __free(kfree) = kcalloc(...);

	= kzalloc_objs(*name, max); ??

