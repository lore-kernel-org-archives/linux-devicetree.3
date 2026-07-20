Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DF2435510
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 15:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784562085; cv=none; b=Kxc30/5PYRNydHqxTX4eOcQJC+IpVaRxisLL6xqDkbwj8fS1i0n9z/aSqZHT7qTIKyQFEKxibTh8d7/9/yM7W5uLqVF5S35I897sr0vg4ZvHiYHK1fjne2aaWucjfd/rQpYYGOigqMaNG16gKKGJg9KmRgwraxeqWpvL2P7xuqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784562085; c=relaxed/simple;
	bh=CNLOjWawI2VKxfHb2tcXAh5kr3SIj1WJhdMdenh4GkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y2g8r1V5/Hraa2difIYr7PRkCOee0+uWgdFEoksf16ABnjFtqaNFnTwxcdp0NBT98R+de9PT6cGVBeFtNTYE8gd3kMYMld7aGwSyJ7/Qo/fJbHS5vUuTHVPBWKAsXcWdygy98Rzxnv6lAEs/lo6wVv369tfBx21mNHi/1Cv8OWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZxpY8J1d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GPplOJoK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZxpY8J1d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GPplOJoK"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KFLjRT3173949
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 15:41:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yEy+Ah5GVVlJqPvJHVYh8o9KlhPkytF/7x9Fj5BZ9CA=; b=ZxpY8J1ddysTSj7A
	JEC7imjESbrmcORyxyiCNgUN3Mwfy6COPq/Dg3p1UMuJV17uKiBJWv1vk5AN7LA6
	/hzXkrVUTTAEi+tTfKVHrEJi1R9+ANpqr39Z/wRG1ZMt4ocoCaIhE+KKEWXTu9hX
	o+AQ5KNtPGpuRNFAuZmSkBi1vH7vVjI9NrKqjabN/zQUQY4YqSvgP5Wibx9T6J4K
	qJPElBNQFkwN3RUQe8BPSSGyIX4T/smmOhiv4ql+DIpijU5Ian1WDW28KdcdReSM
	qDWtUdkE/K35gmqShbYD2iL7o6S4wSL5+GRZ3NLTyWCT6hm6xgD61jGidjCRbhcQ
	6DQVlg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfdcj541-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 15:41:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51ca37ce4c3so20045301cf.3
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784562082; x=1785166882; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yEy+Ah5GVVlJqPvJHVYh8o9KlhPkytF/7x9Fj5BZ9CA=;
        b=GPplOJoKofFEh6W6Foludq/vtXUeeSMai0ENPJtWYwLZ5jmEQ9qTE2I7+gK6FP+WvL
         xsXVfPeQhE4MKk1BqjWUiFPZF0f8miT2qKMHI4TH9sIqge8DanV11gYU5pHyBJpqtFl6
         sMwVD9pkTL2FIbWjG75/ENQYpCsL4qxt9EEPdGJ54vtscr4LMmH15zQXxWfeQ6+5RN00
         1IK+37625Umta/Xr10ramx4IDRCPizZDJ66PvcHPXILyVyjFPHWa+unoGs96Lb3PKsl0
         y9CFmLhB+VpUNwJVFVIaREcasMWuaLdkj6Q3FqsvbxdbdbY51hGCdQPBfsAlzmRVXPp3
         zixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562082; x=1785166882;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yEy+Ah5GVVlJqPvJHVYh8o9KlhPkytF/7x9Fj5BZ9CA=;
        b=YI2J9SPl36tR2NgZg8/Mx4CcJ8PG3urLNao09hi3PHw6xzSIi/jxe+cs4/iW6jy+rK
         NwdZYc5msp+/9URPPJTIIHDLOBoQf8ms+O4dWAt8nX7Aggdx+3W1iMifTtxAHYC456oI
         atoeF0R9KJ6LbE9CsGUa2qIS2w8BPweDt6bvaFqCNOL4ac3XhmZ10sW0y+O0IMY9ESeX
         0GLTbUjjOBksBkAFlMyMT3bNyz84gJHpwsDAVnCCfYBW+PhaC1U5oIlSsgIjG1ARafdX
         lQCTLm3PLmJUAwNB3JfnZMbU6+60KzeRBduNRbBR6wVnWzZ8zbh8J6uWhCda9BfPSslI
         iaHg==
X-Forwarded-Encrypted: i=1; AHgh+Rq7DKZarSmQzMKRK8ilCY1fwQ/wXmSfg16ttJ42ObzUziHnOeLM4x4u6cDb5i+39oRVmbS+ZCbEQqpg@vger.kernel.org
X-Gm-Message-State: AOJu0YyK8yaKjNHv6b/vGZpZLCMftfeZWq9YZTESUKcEaJAlET9g0BCj
	zJwLZ24iu050r1ufkXsFS0ky4CPx0PXnDcnc5CcWnZbTYjHgPAZEXqLYyQoq6LXz7IcwcqyqrBa
	ejHSBEYcbeAxH+sHyV67B/oUv87WXSgaP8yR6J8Cqv1rhkdw6lzzhit5tPC/VLd3S
X-Gm-Gg: AfdE7cm+/3xvYRy8OOTI38vdiufkofAaeQie85vUe5gB/EiEzxtWU+Axi9zVGt0TaVF
	EBVfhS1tYHTA4rwfkh4ykBEHleeBvWKoCuBZPpnazynCHqXWy0MET7gIX2+2MTttpxsR764+jbg
	fW48hLBRUdA50dW6poHwovX/yH3ILn4NnvT2OFoZW+y6v8cTgnjHXqurJUV3aWAQSbBZFFYVlUl
	Yz640j+iqQpC2b64vdX+0hZ/pz9IMjXV8dlIgTjcrNq4gBXu6URLIAFJWCWSkymzdPXCKX+lYSg
	OidqA8AGxKE8q5QmxKpNL/Wd2xEIgOvMaJSUyb3HPmBvVNa4ItKPnP0hGIMnMPh58lMuVdE8Vbo
	B1YTBcsMXiddRAEUV0jV1uA2A
X-Received: by 2002:ac8:59c4:0:b0:51c:2101:f0 with SMTP id d75a77b69052e-525f8a87285mr11148491cf.2.1784562082337;
        Mon, 20 Jul 2026 08:41:22 -0700 (PDT)
X-Received: by 2002:ac8:59c4:0:b0:51c:2101:f0 with SMTP id d75a77b69052e-525f8a87285mr11148131cf.2.1784562081669;
        Mon, 20 Jul 2026 08:41:21 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1724f50bddsm496481666b.47.2026.07.20.08.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 08:41:20 -0700 (PDT)
Message-ID: <7bcdd18d-a001-41c7-91bb-3b182859970b@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 17:41:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm64: dts: qcom: Add Kalambo SoC
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
 <20260718-b4-kalambo-crd-v1-2-a1069b5a2757@oss.qualcomm.com>
 <581659e3-9168-42b2-b715-943808d9ae2f@oss.qualcomm.com>
 <782d626c-2545-4719-9833-efbc9ba82871@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <782d626c-2545-4719-9833-efbc9ba82871@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: A4eulX8F2UdOM8BSAqpqjD7IWQN_zoej
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE3NCBTYWx0ZWRfX/7zFodz2y2W3
 H2pCYKqt9g2BtOMNry3wIWZ/XPLBtPzbTP1svQspaIcIE2c9CD9e7MIYCUxTWgG6vc9QXO2oAmO
 B5YZSUghfSkjdn5ffWAY3xDDXukkVyUPue6/UB1VN4fnTWiD8x8/28U73W70B91QkZoGZt87ji6
 aCwKsd2qlsrGOL0LR1oBEEo57bUMugGJC6TbnlGd2h+cstRn8e28N9yOgAEVgoOx97NO/4VdOdM
 I2BJY0K/h0kums0bp9fS5wqQyyY/x4bVMMbGoPiH+P8K362pHTO1xw160tnPj9GRyaDdj7W3TMZ
 Sx89ZzRjOPyBO/6j9ZxflsicuMwI0vt+emb+LMugIKhd44jp4vSazjiMqYgJk9Yp07224WWMoWm
 DTRI22Nn77d8dFsrmrPvplR+2OT4V1xg4+JupmWCNLPIFpKmKSRRJxxRk4/LAPZ99qOYFJgIEVN
 wcC86iyuoPkdGRjrlLg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE3NCBTYWx0ZWRfX09QUqh1gbZqt
 W306WO8J2OYmoafyZz6BZ1EJialPqta1h6BfB+DhMz+wbW+oVOEkJqchA/RzLhvU+Mbu4tm3Q8v
 Pr5JwRttTxGFKBhnpHnK15TRhNDMKX8=
X-Proofpoint-GUID: A4eulX8F2UdOM8BSAqpqjD7IWQN_zoej
X-Authority-Analysis: v=2.4 cv=bv58wkai c=1 sm=1 tr=0 ts=6a5e41a3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bKDKKj2xUS6g95CjhU4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200174

On 7/20/26 5:04 PM, Gopikrishna Garmidi wrote:
> 
> Hi Konrad,
> 
> Thanks a lot for the review and for catching these
>> On 7/18/26 2:06 PM, Gopikrishna Garmidi wrote:
>>> Introduce support for the Qualcomm Kalambo SoC. It is derived from Mahua
>>> with CPU cluster 0 removed, leaving it with just cluster 1. As a result,
>>> the PDP mailbox and SCP low-priority register windows are updated to
>>> match the reduced CPU complex. Everything else should work as-is.

[...]

> Does this look right to you, or would you prefer re-pointing cluster0's cores in place rather than delete + re-add?

Let's just delete the whole map and re-define it, I think
that's the least painful way to do it

> 
>>
>> [...]
>>
>>> +&pdp0_mbox {
>>> +    reg = <0 0x17610000 0 0x8000>, <0 0x1a980000 0 0x8000>;
>>> +};
>>
>> Are you sure about this change?
> 
> Yes — confirmed against the SoC memory map. The Tx window is the NCC0/NCC1 mailbox instance; dropping the former cluster0 moves the Tx base from NCC0 (0x19980000) to NCC1 (0x1a980000), while reg[0] (Rx) is shared and unchanged. I'll note this in the commit message.

Got it, I overlooked the 0/1 difference in the register name when
comparing

Konrad
