Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794960534;
	b=096YZW510jtZDze2sms4KOc0bWUJwDQOY/oXqRMd5aIzMKXguKZzk5pPQVU5RF8NMkdP
	 0TyQ3HK3KNCeeE9HVIeI2cjAb6aL+rcW00ra5/Y8gOhPUel7qxFPhe5Bz58rdNkfxT5Dc
	 p5PZTc0310qfEDzN6H8Yl4leYf9j23Bu8Ja37wzASTqvrSVKSTzsSG5yRiXF9KXs/58NA
	 HWNcbxxLWsvGP4A4sfG807IqmMr4dXWMRIS3L3hqx52CDczPU5iTLruoxOn9j31DaTWhv
	 HzjdkGY6SnK0r3Vg5aRE5y05Wi95c4SPKd+DZpRGAwhg8vyIR1UhDFBBMBxkehjHG0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794960534;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JuTLbTugfbF+YGTGMHC13Lp2sz+DJ69DPTAGTG1eCEQ=;
	b=dR+l1Sx8YjELVuCIRcEeCCHvEa132Jv7KJXxBufTcQ2dr5tqMq/eTsUa0a8lrlBYyBR8
	 cMhyWlnoPvAHv2r02YN1+uUCLto0DIMcyNzZPXv6SpSRTv/4p2N4k2BJ81LuIsNKRrV+u
	 tWJcREmSFlvAGS4oN6QcOV/BaAmgcZcbRtm2fut4+++AVi2h+v9gHOENgkGJardf1XSRi
	 mF1lyx3Y9cflYfZ6O3BhpAoF38boB8VPTEoZ1J4rAhxvsHZfnEW6Umbh5gAAM1/QgJIAN
	 hKqzD7cPDSp7d7+fB8s8zVf6ORmzZviM206TqSPfFIYKIQNZOEQOPJWqm3LklgRIRGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A4Q5O9bK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gsNbiDwW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E274606A330
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 00:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E274606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A4Q5O9bK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gsNbiDwW
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHMf3E72627562
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 00:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JuTLbTugfbF+YGTGMHC13Lp2sz+DJ69DPTAGTG1eCEQ=; b=A4Q5O9bKjDBiw6Yi
	ddl0tRxJT8Au6jdyHYTBtKwFCMqX85wHHAh1311Z/Vx9TGJ41gEJS8fvjPdMTTW8
	/+xIIRv/JWt3+wxPxfT+Rtg/T/wK25Q4pVDRMK8/LdHE6jqIMxJY0eIErib7DKwt
	PNPJbjzcWGf6U7M/DAEwA7pMlUse3e/O9h6NvV1lBJwyFsYeblw7map8t8xC4Zpy
	KtswgHyEXTKkYWs1km48IuQ6mx5wfumcaEmBSliVJMZPUyk6VYC1RmFbw+N74Yc+
	s6Kb5q4H/0C336WVhTuShkR+dklD7F1Ba8jzgxZeI54CPpok2Y1lYvJn1YVZQDl3
	C2LC3g==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9g97m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 00:08:52 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so1219011c88.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 16:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794960531; x=1795565331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JuTLbTugfbF+YGTGMHC13Lp2sz+DJ69DPTAGTG1eCEQ=;
        b=gsNbiDwW4SiyaA2zBIeeEmowwRKzz51IUMaJuGH1HqW5G+sUxCuscod5cwDDutsouV
         Jbs2RaeEx5kO9iM5c9jGJKo19avkZ8wD5tS27d9YRfZSWXEt+Ish7bCvr2wWDghWdB9+
         SO7LgSPkbszYIsLJGi+J0ATSsJeImNDt/g6sMGXd6Ro3CHcy7wDHp2nxsUhxm9ftAuJ0
         MvPooiE7mGzf38n2dp72q4HOvzaAde8cZj+h6BfOXLIkkR+0m0klH7yRs0WUaRDvLArr
         J3InNhleyJcGSQKkwExGms6TIBuu7W2Z46+eH7ZTfG5gLIgxb7G/nXn8T3PScWDjsMxX
         ZEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794960531; x=1795565331;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JuTLbTugfbF+YGTGMHC13Lp2sz+DJ69DPTAGTG1eCEQ=;
        b=bKS+TJiK8+lYpsOJVsr4c9LTvUFIr4xGufPz9n4yH0d8tbi5qvQzoRdbvoav4wkP/L
         9Eoklj0pFPR5mjahZ/FW5naGvjxUDb4fibQijFeSEYZvFwsVFdmU7zAvYpzzaLuhxcko
         vT4hn2ZWb0Vh34Od6XQQz4BfPGALyQkFMNMrIYBVERMH77084b2QsvEwEapdopmNNdAy
         vk39U6B7VTMHZPsHqrWfRzyx7NZYJO30FtS4zkjSLc+nu5NL6f1EpS+Gw/4dvk7Z4gji
         SV0PlcQUvVAsC6acRYjwOgqXQ/ciXwh1fXJER7E2sRBcatNdFsWRdkU5aVzM1bq1oZN7
         t5cg==
X-Forwarded-Encrypted: i=1; AL+hErFU/fSVGs6N3zlbZgTNo85zTk4Hh8QyJMcy87GB7e3jnO26cwTATfgkAMF619BfoIOyxRgewOpnAhg+@vger.kernel.org
X-Gm-Message-State: APuU4Z/x2cLAlq54cv2Oor/UVPL0Ilte+nkXOJv4wnn/iCyufiXmEJbU
	ht2JAJP4dMXL66qRrGLkJmG1MN1XssG/wg/nkar1oG5kJBkueXo4JLmSjvtpic9FLwMhf58TqW0
	q+Rnr31bRDyOjVvHd87nSFxAs/o2Qo080Wrx7/+oCAVA1QHj+yqxMWrql7JjR0bqmyw+25fAO
X-Gm-Gg: AYBFou2R6IC+fd3GiKoMkMZoVpOuiDUbqW0HNQokh1nDBo24PMpE1KMi+X4oZMJ35u1
	AvSZ1th/U7FsMboVzheoMMmW0kEpymJ2IBQ6CPfFKeclUFC/o3Ow/dJQV4hdvGYtuZx0vpx/R5a
	uF3XnpHwUmg7hdobR5Jq4H7izFtICix57xQqn9r/Lq13a29ycjHhwVOOeKeEVGFXxRs9XwuWVQI
	sOacMFv8zvmryBKY+iSEJomqkX7u61LmFSD0oCm7jTi1+0r5AVtQkVOq8pmPxPofNLutyA26dp3
	Oi5Mw4QCDy1E1FDjGVLvwGScftPTFCL0B0wrPLZln2UD5xJ7TSLoWjivzVDeQVv3FV8mfXtGVtc
	l3oCBUqDV9Tr54cnUa2R1Dxz0G8JZzeV0bnRDEGtoBim3e4fP/nKB3MkPW9ZSS0IgWWdzeQcn1n
	7VI2XzEp9lkQ17vdTiU7kpSDiX7R6TzQ==
X-Received: by 2002:a05:7022:7e83:b0:1b5:23c0:4f15 with SMTP id a92af1059eb24-1b543c3fd9amr1137360c88.39.1794960531453;
        Tue, 17 Nov 2026 16:08:51 -0800 (PST)
X-Received: by 2002:a05:7022:7e83:b0:1b5:23c0:4f15 with SMTP id a92af1059eb24-1b543c3fd9amr1137340c88.39.1794960530842;
        Tue, 17 Nov 2026 16:08:50 -0800 (PST)
Received: from [10.71.178.189] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447dc5e9sm2262069c88.11.2026.11.17.16.08.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 16:08:50 -0800 (PST)
Message-ID: <39bcdc68-1925-44f0-9958-e1253452c113@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 16:08:49 -0800
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
Subject: Re: [PATCH v9 0/8] Improve Qualcomm EUD driver and platform support
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
 <57c5aa78-a116-45d4-ab32-772cd970e6f6@oss.qualcomm.com>
 <2026111740-florist-conflict-eb96@gregkh>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <2026111740-florist-conflict-eb96@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DTuTuFXoAdY5J91EsPEoyAnvpBoZLXkM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAwMCBTYWx0ZWRfX9DPzk6DHLdLz
 Z0zrXACBvtxFHqX2thexxvF/moRbEMycQURwL17cvuJ5qnh5OxUhX9HUhph8riy8mrvVOZeLjYQ
 lXAZvPUdxrOWMUEawNVzdcA1qX0nigo=
X-Proofpoint-ORIG-GUID: DTuTuFXoAdY5J91EsPEoyAnvpBoZLXkM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAwMCBTYWx0ZWRfX1gYld5eg5cX5
 MU0xvabMOhwHyjraxtW/njMqxQri5mhJmTA7ZhCnKgfAhJUHmuzGnZNcBw8yCeqBpfGai25RyCH
 ABGqNB6sDv1ZuWj1PveY9HRKaAeNEjNSCn310uuGKNOa0yNHPfU3+jDg8/IXfyZMIZNVtPxG0P2
 qwi2HQz2X+E0mkxxpORVkwgiBwXzHIFrOt2cV+Rww1s05eZrfd8+8KK34TTt3s0JChH050dE0Cg
 uNHL30qP4WeZC8cNyzuoM+798rfclr/QHnfJVkJQMX9qi2ev9BGOLViUrEJ0PTKjk2KIazaBDdR
 z37V6Xvh53CS045e2D+A4tlDBtTtFiqHjOfeelJZgYyqhftcAzETf+2B0Gyk17wOCiCWhpixT6p
 7ymEuVjzX4Fo9HevDJgOMg1DsAf+Qcr1V2fYwX9+rb3UgwGDF4QBR9kOr9eTreQ0uTfsBJ9JfSO
 ZorMSWH+KWHnqh2MbMw==
X-Authority-Analysis: v=2.4 cv=RYIFmFtv c=1 sm=1 tr=0 ts=6afcec94 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VfwtAWXQdzgZiewqWO8A:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180000



On 11/16/2026 9:21 PM, Greg Kroah-Hartman wrote:
> On Mon, Nov 16, 2026 at 04:06:52PM -0800, Elson Serrao wrote:
>> Hi Greg,
>>
>> When you get a chance, could you please pick up patches 1-7 for the USB tree if everything looks good on your end? 
> 
> We do not just pick parts of patch series, our tools don't like that :(
> 
> And why top-post?
> 
Sorry about the earlier top-posting.

Understood. I will send a v10 consisting of patches 1-7 only.

Thanks,
Elson


