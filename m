Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201DA313546
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784096537; cv=none; b=GTcMh3oE2etZOK+rnF9xU9pdhCVjKduYXBfQ6P+FBKsOxJnbXmu5bzWnsD11XOWmJb0ckubezmxo23NdagUsPLnosP24faB9dbZ/Gnj+lLfiqOlCzedBjU8C+kG3W2smcUiJ/oL3+k/jBTjxiCgwO7hlld/MCzta5rr8siZbaEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784096537; c=relaxed/simple;
	bh=+bo4RFif1gu/wGo6HC5YBl1wzRAY1rIbep+HIpYss5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pNVXUmr5Y9cYewgP3W2wPuH0LG9tqd8gq5Ixt2c8rY/ffxQ4eJ2o19OG7jRSp9BqmZs/nRgSvuWDD3OXjBc0/1EaADV0zbcvuU/j+o2LRaq8saVkfGy127ANKCuAp7c4voua2yhJjkWJO/C1D8BU6BTQZQdEsMybARc12ZjcoLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f7wPHOrk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=doVS7NL6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f7wPHOrk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="doVS7NL6"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3lGuL2555502
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PnZim5DOaYpiQZz5/Qs4xB+vmbZsDrFngCnriAgpVuE=; b=f7wPHOrkQEeqGkid
	C8CX445v8cZ6A86F9TYy45JgTKWXq2JEX4Q4XnxwY0/eHnpfhYwjxFv/x8Db6dXq
	vLfVjY+wI3JA9WC5gDiwWhivZ93mDTa5aGwioaNq1TUb2QEmeg9qvRozSeAn8ftr
	PLL9NJUr++bF2TzO1+6MOqHnMNrqhO40ErUP1bkU2VsizNvj88q68AVu2RM9DzJu
	HKk1haZ0KThJq9yplJhmrnJrdQDKs6QtsexrEHsI7wPb/cZ2kM/lf+7y+bdej5qA
	LBVfqwqXBCsHs/G0isd5Dd5KhYVZHN22BRFgjFYsPBOsSDX5vEAJ7S3BhRVonYL1
	STxIXA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9kt8sy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:22:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cefa1a2be6so14293175ad.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 23:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784096534; x=1784701334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PnZim5DOaYpiQZz5/Qs4xB+vmbZsDrFngCnriAgpVuE=;
        b=doVS7NL6uaFIjZANOY13v+wECpk1x+GX80QAa2WdVmKldXKl3EQPVkyqulgwZ3Y8/t
         7kcAU+lbHEsvfDVnIGj8IEp/fxss/A+K3R8XsmIy1viFYzNVLgFiPHYalXXnk2Q6PwHV
         BQgVaikxlqfUD58t9RLY9HG73S17S28tayWBxODptEiXUj6c7IDtaKDN81AxvTZK52Dk
         LYxGMl63pvVrNw8TQzYD4HDxqk3HrT022cOZ8EPkaJiA3q1HtdNPLjZ07jTZrPV8vWm0
         sloRKuUhl7ilrXRfbw7f//K3Msw7BS5BM/0BK8QajtxWqI29MD9ubcC4EcdrQssMiAET
         fW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784096534; x=1784701334;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PnZim5DOaYpiQZz5/Qs4xB+vmbZsDrFngCnriAgpVuE=;
        b=WEmSu7T6chv+OHpx7OG9Vom/uPrYo59mXbVxqRMnJHPYIUoq6pmfUH4jx1IYTRGqxP
         dHG22UrnBdjNhNRGMh0arqEyEB7IyGCCCMrdb5xrK0GP1ZIzzbbol4ct3V/pzSQcc8wv
         4Kx4P9fOoPo9xNZpHKt/Kwa5mUcUVaSs+ZR7/jR1Djr0OBG6i+hNjAgCINOsGWxeFk2r
         er4XdgejrA8gHyM77oio+OzJ8O7t6jXaLF7PCYyWnqdTR2bw7PPp+mS4FNInAadjjvnG
         eV5Khb4pC/H9DnKKtPscQ+TRIaRZSAEWJgyfG2Yhwx0cgYZLge4SDkZsDVV5LHhnOIfo
         696w==
X-Forwarded-Encrypted: i=1; AHgh+Ro9dDQ8CJtI3HX5BPzku/910K1B7tH1jsuXNmZUwDEUkeD6tmvp+rd+fsJggcHkhtMm91RBdvT9FATR@vger.kernel.org
X-Gm-Message-State: AOJu0YzDss/pqVK9QdRg+i+ePViZNqLHV4J8NLpSkWwZBkBc6dzohJez
	9pTt79xQUSFWkGX/jrc3SnfCFmnEGFixjA6vMnBH4IoyOXRZHKNKNZ3z8GulSx3VP5m4YNuldY6
	Y4Y6LBDEGVPr7eYD6Y+zGWOFPP1erUs5icuLPOnCT2+GMA0MHyvOlni0G6aefWMnxhwze40zG
X-Gm-Gg: AfdE7ckM8zIUvKBp9AZMwhF2nd53pJjGEwoXn4GX6MfdHaOj+UoS8YPyVB9sMXltbUE
	St/eF1BQkOPWXJ4SV9LzztWkzmWQtHWkdJ+fyPv9IQgcVLvMrHf1fYyD2g2bAJdYtzKki5kSLOL
	B+pWNMaqHJlEBBLgon4TsuPd5abxXdKD2t7fWeh7AqkJ9wtUcna4FEN2/pzhkOobQCiDCA5aCIW
	GfbQ+B3UFhm8fhrmBSGAtlNBR7lYnkMd2q3qn0dZoLb4305Oz1sflR7aHx+tixGx1xxFLPJ5Aj1
	5ppw8nOXqFXdl7n6ePQk8iz8Hj7ARpgihoGJ3/pKfMZJHFI7qTbzo+SeOIAncf+sQlvP32MeEZg
	NEu34SeL8LdlRrlWRnnKq9fgoEpns0GL5fEGA0mi8
X-Received: by 2002:a17:903:2a88:b0:2c9:d8c6:1db8 with SMTP id d9443c01a7336-2ce9f284e45mr158543255ad.28.1784096533779;
        Tue, 14 Jul 2026 23:22:13 -0700 (PDT)
X-Received: by 2002:a17:903:2a88:b0:2c9:d8c6:1db8 with SMTP id d9443c01a7336-2ce9f284e45mr158542975ad.28.1784096533314;
        Tue, 14 Jul 2026 23:22:13 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf08fd77dasm2386245ad.72.2026.07.14.23.22.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 23:22:12 -0700 (PDT)
Message-ID: <018990d8-2a6a-4725-8aee-af221057d664@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 11:52:07 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] arm64: dts: qcom: x1e80100: Add deepest idle state
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com>
 <20260707-hamoa_pdc_v3-v4-7-dfd1f4a3ae89@oss.qualcomm.com>
 <alKEUhRgyoPs0q0c@baldur>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <alKEUhRgyoPs0q0c@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Q63iJY2a c=1 sm=1 tr=0 ts=6a572716 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=pOI47-Q_PV5DkGHPJZYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: kc1seDwRToMFK4UAmo10bVqeNn_SF786
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA1NyBTYWx0ZWRfX7EBfGdbEMRRP
 Gv/URoqOBcRxjF+sMCaH1LA3ixzY+q6FptBRBegDzX7X0FKYYbFuZ5xAWa8Ja08zLOPQrEIwVGU
 Vajp931OsyDAc71UAYSg2SF6AUO6zIY=
X-Proofpoint-GUID: kc1seDwRToMFK4UAmo10bVqeNn_SF786
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA1NyBTYWx0ZWRfX6X2kHutKe7QB
 TBAi8rTOX21qCtnf6HDsplRDXDj5xpOocRe1rY4pdbDRHgqZJuJNo5Rxi2ASrZVYLItPY9+ZAN9
 E/lumwJFIqlLAeFKa6l8rnsYhaFXaXpMelJNuy4AW+uKIbnKDFP3o9ZqXZhfXjvl9IyMYMpsYX6
 n0RBEGuBrU+ZaST/1PVfrU0MUe/P8TedvG2TcBxmTOv4a9YwzxiLsp2UZljg+E2HE9YQB6NxVzP
 ft9oTQvJSFcKnKz9jJGXnOpeULu17FUFf4/7gXN+MQV1+oEN/2gsjajvdv2nbKccPv8pqrQJawt
 ZHCColW/gP5HWsTl7VvCQpPXWFRk0OuVfBB4SM1ybBX9IRwyRT6hNIgwT4hIEG+Xfq+DsP1F5kZ
 dCjUynYkTg3rw2Vicx4Mi80v0MregAFXlMXuUMLjXFCPmXcHwG5x8pyOfzfHC0+8WOkNZXAMHwv
 zuA8G+p0vnJPOnIH6Aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150057



On 7/11/2026 11:37 PM, Bjorn Andersson wrote:
> On Tue, Jul 07, 2026 at 02:51:39PM +0530, Maulik Shah wrote:
>> Add deepest idle state as GPIO IRQs can work as wakeup capable interrupts
>> in deepest idle state.
>>
> 
> There's a lot of implied background in this sentence. When you write
> commit messages, please intend for them to be read by someone who don't
> have your background insight to the problem. In fact, if someone asks
> you about this sentence in 5 years would you be able to retell exactly
> why we ended up with this patch?
> 
> Please rewrite this to start with a problem description, then describe
> the user-visible change.

Agree. Added in v5.

> 
> https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> 
>> Update entry/exit-latency-us to follow DSDT for cluster_cl5 idle state.
> 
> I don't have strong opinions about bundling this part of the change - it
> could be argued that it's a separate change, but I won't force it.
> 
> But as written I think any reasonable language parser would consider
> this to be related to the addition of the deepest idle state, not "While
> we're adding the new state, also adjust the cluster_cl5 latencies with
> values from production configuration."

Added in v5 commit message on why its bundled in same change, 

"The newly added domain_ss3 state has entry/exit latencies of 2500 us.
The shallower cluster_cl5 state had entry/exit latencies of 2200/4000 us
which are higher than the deeper state — an inconsistency that would
confuse the idle governor. Correct cluster_cl5 latencies to 2000 us each
to match production configuration values".

Thanks,
Maulik
