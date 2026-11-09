Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794190862;
	b=mfS+6SYM9bB/hy7/ZlbeNDqS9eUZTlRadrKFwVZJ23iJnp2ILbPwOTaBIA0hEgBs4cXX
	 6bvWAwbNv8gb1zB8xzQ4RgRljUbQWvkWXpcDqduKJFLMZVLHQPdZCRhOwKggdWaRpUsQI
	 Oj0jE+01qC+04Q65/ypSVi2c3b8gwPuvdScQKTSe0+jhgeo6fIeCFj29U7R3b/VOXsH/P
	 0pD8KNx0GIJX/avHuxwz4zPD9IIl7CrDEYEDwxvDT6byvB/fNxWGQvrBazzhBFPR4kxAj
	 6atPL7/0z4i6g551QPqoCMeMgJrGjs12UF0hCCt0SaGk2f6K+EyCayqJn01uHc/VsCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794190862;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vTHCJSTydXzyoZqC+6clQ/H8kutgx2FD4bqzC+SBHLQ=;
	b=pLMauAUEfWBeM7wroKDr8+tAXQZfzk7HWKHvD8q6GWyj+pXgRQREioOdpyYNIyLwCQiA
	 S4CIsb1/ySOwQ06pj4jN0D7aFl7Ja/NRC6E4jAsG+FaWPBH5O/Ni0sO23iIeHY+c9y/4w
	 eXsYOYVuNlNVdW0cJr7dyrK5w7jxtugM0S9PT2C4SVyJ9A2rNYeSI9yW/xlpgiTHGgXjB
	 dPCMT2iCTw2FJ6q0Fhwp3ZX231zM2hbk3urPwJUb3YlsrFhtjYyix0kZ0W9R35ScZvhfb
	 cCous5l/mR4JK2vFwqAOiJYT8J8g4yUCcHIUdZXAfUyai0/J0yo2Ejbrwq0s9tXHurg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xq4YDBbg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iBN0tSkT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C4A606A320
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 02:21:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0C4A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xq4YDBbg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iBN0tSkT
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A90H5pU3514088
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 02:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vTHCJSTydXzyoZqC+6clQ/H8kutgx2FD4bqzC+SBHLQ=; b=Xq4YDBbgOranx0+u
	WArNa9ZawxoY9HxYffDHwnZ+aN6p9hVwn/tSbbRi/E0PQBLz4UzNwokfi4UFpu6H
	CgG8kDSx4KUjuuQj/VzluU+ePM+0JJ1TTl9zwObGSrPYYNlZyKTabIApp6n1hIPS
	DOcHxxiGDwblZqf6TA2pAooDOHwR8N8fN+JrozW4MFB3ObLaKne3DGoU47TdFuo5
	q/HevaVpCn86rpqewqN/TR3u2pPIBzpREilS4A2FByUovbd9ixydMNYxL4SqQMPj
	XhlDThZWiEAw2jDAaZYoBCDHGfabnNciA/51OF7rdTn0mXI3URgdarXMuqYsa6AU
	L4XhsQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxcc89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 02:21:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ade5b3ae97so321879a91.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 18:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794190860; x=1794795660; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vTHCJSTydXzyoZqC+6clQ/H8kutgx2FD4bqzC+SBHLQ=;
        b=iBN0tSkT+58PBJIwCuhf5+bZv0DWG9Z2xe8K6VT0bDh56v7xR3emecC/nL7uDfgmml
         0jyP7ycnu93F+6xTMnEWW5AENB2tzpvkM355kNF7DngUFhND75UuhxD2RdCGAoz4BzB8
         +aHfXRsP/xdRgilVm6UCn+zLEXfYCj61XP1+xnIH7oJXKoJhExjjubKcY92cy5vI838l
         i+pSTmjdCk7mm6fskR5q+h24EDv3kedA1uuhoE7CxG5VCGk6gAIVSAdrgpC4kYXzaUKD
         Q7SRVUbaIDLan14+RTvIV5n8E0wEWUhl5dJZkpuVL7RWQP68BWRE92oW6Ei2Vl/LW8rl
         n+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794190860; x=1794795660;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vTHCJSTydXzyoZqC+6clQ/H8kutgx2FD4bqzC+SBHLQ=;
        b=t0fGFA6G3EKGI66Sjl6vziSsx8C8NnZsgk6FtaCddeNdQj2qx6mvAP7fSST8FZDyZ8
         r5KxjVLgJXa6DnsoM06SB70qOOp1kklA3K0O87PqC/DLe1gpLM+9kJWvyPuDNO259CpL
         1Gl71w2AEqib5UiqMKtBA7am8wap4aJp1PLVfF6njKjzBlydmXwNwpvjvYSjsfq1ghz8
         8kHBQiVEParRhl9s7WUIcWK5Zyz7dc3miT4Z6K+8WjrWh9pAJlRS9UXT0f6DVApMOMPj
         JSq6OV1p+OKDqoWa9dOs26Eu0HsDDVQUcbyuWlB0k6DlPE8YlWk+Z+Fb3eiBJNA2rH08
         kB5A==
X-Forwarded-Encrypted: i=1; AL+hErFGmC85Pe4dNfSN2fRwtTyMzg+h1vTlNV/FTo4SD20wzV8SzlG6FDsBghXDj54kw+PDqnvEsGVyGunO@vger.kernel.org
X-Gm-Message-State: APuU4Z/AIqqUZ6vfkn/k68IuPdXdpz0lBKte03cQx3S9EbdUBU9//C/u
	qauA51M7AoQF+8himKvkmx5Xom4l5cLNFT08+vvLCnRz/lnubGAx07lw85XmEOHBpcbkaMYRG/Q
	Nx6qAFR/tOAYQbeT6h3TqsJzLu9reGop3FUj9kd0NVlYKIlB2vB2kPoKF/l/s4GFz
X-Gm-Gg: AYBFou3gIwNCuv1/e/rl3lZDA5aEqxns2QFGUiK0AQiMaB2MT8EZbR8XnWRjodtcF4Z
	foAT7pXeqYK9TNVslastygrd/9C2dmDgZq88Kzf9utIMXLeqXxEyPupDH9UfMM/7yfml7S8uYiF
	5ihkJ7ViwKllGSeBLz+mD2Wa+W14YQ+KrTKd+IgYUVbDOWUlOd6jEfuHrBB6kOHZmonS22XlJYw
	7ELsNQUd2ZsOe5ti0EwH2Xgj8DEXMk7L3ODxem4iq4tlb9a9EtqP5SRV6wvz5DtXyRgvl2zRMf6
	qE5lK1tH9LIh0UbLT848dwvVcoZg7NUz2PdSq55Cqj7D13iLg7gtdhxavdp/Vo60Z0K4wVh6fe+
	ByE+qFFdgpDVG+UJ4y3qvvW/zNh2d0voM0KKMABOb4wEDx86CZvL7CJcN4Zua/tMusEi+AQQNp7
	2ol4KVk7K0TT9x2Z6s9tZr2DlQC24Uv5u7
X-Received: by 2002:a17:90b:2588:b0:3ae:3b3d:c617 with SMTP id 98e67ed59e1d1-3b12d54a316mr2013101a91.29.1794190859732;
        Sun, 08 Nov 2026 18:20:59 -0800 (PST)
X-Received: by 2002:a17:90b:2588:b0:3ae:3b3d:c617 with SMTP id 98e67ed59e1d1-3b12d54a316mr2013087a91.29.1794190859258;
        Sun, 08 Nov 2026 18:20:59 -0800 (PST)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1032b8c55sm4961050a91.2.2026.11.08.18.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 18:20:58 -0800 (PST)
Message-ID: <f5a3fbf4-a7fe-429a-89d2-7334a2375da4@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:20:54 +0800
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
Subject: Re: [PATCH v24 11/15] media: qcom: camss: tpg: Add support for v2.4.0
 TPG
To: bod@kernel.org, sashiko-reviews@lists.linux.dev
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org,
        neil.armstrong@linaro.org, olteanv@gmail.com
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
 <20261102-kaanapali-camss-v24-11-d6b8f3f6f66f@oss.qualcomm.com>
 <sashiko-outbox-193294@kernel.org>
 <179406416444.650304.12581893664974319470.b4-reply@b4>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <179406416444.650304.12581893664974319470.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3fFfYK_6KfrsbOwBVaJevCU4DnC1d87l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwOSBTYWx0ZWRfX0gsrCFyHSzLF
 a6ObJ5HJE/g7mHt66wrzjB4tuhAByp44R/IPhI3th16NIXvq0xdvJ5SjtF6M54P/mJK1PaDGAke
 xq0ahcnkXftH98B6bDTqDHn7eLR2GRzycN8YoorC3BfDGivodzup11UTBPSruusFTuyr1TIUcL4
 /HQcHXMcQ2S5rXYfssfDvMoCQGcCw6/oUOkg0CqksU4aNDZMvNUkfcE1wyKvwKrAbEweC5E797q
 /MCPsfJoMU6mLv4s9e5iNFEKeihzyNlbcs7X+oaeOyux89uLyZ41WZlCCCWyFIcYFLbsmQ9MuIl
 MaTG9hgJLm2M1e62qVznwZgpvl81X3p2Huxn2TLRqDEYiz/aLz3AUo9z17jke69o2UVp6PZj7L7
 3J7fedSjfyezy8nr59B/qtuygrHWdIDUAaPIu5+sqw62MqwP+7Q033DuCwOuRql84wrJ4ZETZlS
 qWHrK2UlY6pDADv+MrA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwOSBTYWx0ZWRfX0GkOaWra1mHO
 3ei2GCrfCA+7vj2FIat2J18zQOMGBOfK3janKL7xmTEn2+YohI37B0PQ0b/PvWsAlHwd3pfia0O
 2hINovJx0qBhefqeXnzf9rnp2OotpCo=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af12e0c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VNQ3AZqY8Cfn8RaTT-QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: 3fFfYK_6KfrsbOwBVaJevCU4DnC1d87l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090009

On 11/7/2026 11:09 PM, bod@kernel.org wrote:
> On 2026-11-02 10:52 +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [Medium] media: qcom: camss: uninitialized hw_version check in tpg_reset()
>> --
>>
>> commit ea18d39e5144ca1e8d628aa5ab708e84983e10a3
>> Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>
>> media: qcom: camss: tpg: Add support for v2.4.0 TPG
>>
>> This commit adds support for TPG hardware version 2.4.0 on Kaanapali,
>> controlling test-enable and hardware reset via the TPG_CTRL_CMD register and
>> routing the TPG output into CSID 1080 RX through the CSI2 TPG mux.
>>
>>> diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
>>> index d29de5f93c18e..cabbb2638cf38 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
>>
>> [ ... ]
>>
>>> @@ -164,18 +167,26 @@ static int tpg_stream_on(struct tpg_device *tpg)
>>
>> [ ... ]
>>
>>>   static int tpg_reset(struct tpg_device *tpg)
>>>   {
>>> -	writel(0, tpg->base + TPG_CTRL);
>>> -	writel(1, tpg->base + TPG_CLEAR);
>>> +	if (tpg->hw_version < TPG_HW_VER_2_4_0)
>>> +		writel(0, tpg->base + TPG_CTRL);
>>
>> [Severity: Medium]
>> As reported by Sashiko on v17 [1], is tpg->hw_version initialized when
>> tpg_reset() is called for the first time from tpg_set_power()?
>>
>> In drivers/media/platform/qcom/camss/camss-tpg.c, tpg_set_power() calls
>> reset() before hw_version() populates tpg->hw_version from the
>> TPG_HW_VERSION register:
>>
>> drivers/media/platform/qcom/camss/camss-tpg.c:tpg_set_power() {
>> 	...
>> 		tpg->res->hw_ops->reset(tpg);
>>
>> 		tpg->res->hw_ops->hw_version(tpg);
>> 	...
>> }
>>
>> On the first power-on after probe, tpg->hw_version is still 0, so
>> tpg->hw_version < TPG_HW_VER_2_4_0 evaluates to true and tpg_reset() writes
>> 0 to TPG_CTRL even on v2.4.0 hardware. Should tpg_set_power() call
>> hw_version(tpg) before reset(tpg), or should tpg_reset() read the version if
>> needed?
> 
> Hangxiang can you have a look at this, seems credible to me.
>   
>> [1] https://lore.kernel.org/r/20260929061248.E035C1F000FF@smtp.kernel.org
>>
>> -- 
>> Sashiko AI review · https://sashiko.dev/#/patchset/20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com?part=11
>>
> 
Hi Bryan, You're right. I had previously argued that the TPG_HW_VERSION 
register always resets to 0x20040000, but that doesn't help here. 
tpg->hw_version is only populated by hw_version(), which tpg_set_power() 
calls after reset(). So on the first power-on after probe, tpg_reset() 
still sees hw_version == 0 and takes the legacy path.

This went unnoticed in my local and E2E testing because the extra write 
to TPG_CTRL happens to be harmless on v2.4.0, but the logic is wrong 
regardless.

---
Best Regards,
Hangxiang
