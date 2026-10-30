Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793374154;
	b=a8SRcyFLIH6YDTZcC0Z+lSOrVNqd7PgBkY4oplS+IxCLVs9T7qezhEuS2A+50Q6jSSWD
	 vdEGR2lQemK320GsltodATACZYNFA1dRlvOhfLnMIYzYg6pfKBZVoy2fiHcDV5ZcWSLVY
	 +BThFNwTmhvz1kcEL3Rm7beLfnB83R3ihA/fjZ3sQhZj8xtmML5JaZJwLQDhajUHCXYJa
	 PkSJrt3JBcbZuj9IOj8NsQ04Clhl44v3CXbD92uTHbiE+WlTygSMXqwWedq1Ms5zQaAb0
	 dl/c4KBHDF0IcGpojS2DXVwo23Xdwv7aKptZ/o/JqXP2um5ErjzB/vf/GsOPLduKHLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793374154;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lpfxxF1BXeKYsOQeqaWCrwdbveAmxjDzeY39sdHqnnY=;
	b=lT1/zPS4/WTfzNzx2j1xSweCbJt6oAXLCU1UpumbiMxL1q7rHzLg5m8zFq3G1tj/0HpS
	 qS6351fznFwBFyMqp3QMnEu0hF4bEYnIXfpVIo88WJHtM276fp813EoqqhIoj+vtyqYqQ
	 erYlyZL/n9iExeNaezohmiekqMpTtdeE/yXok5ij/EwIGWIFV9uA9GwUgXQAZU5oU/qml
	 3I/o5uPdFM6ddjICMzYI8x0FGH6wRFkJJuKjuce9yC/hatKTTQ4wEJIVjL4afFELF8CGd
	 eW3URUDkP+Lg67pFLNq1wEDVSSWSVSxBJoqJXdZxkc14j/smhSD6PpvtoFFuhHtlScg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bF2zeuvs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XjGU0fPd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8594606A324
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 15:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8594606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bF2zeuvs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XjGU0fPd
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERDXB4141542
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 15:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lpfxxF1BXeKYsOQeqaWCrwdbveAmxjDzeY39sdHqnnY=; b=bF2zeuvsw8xTU40d
	HT3A/yDe4WC9oljx4DKP+7HSiqoE9+lGkf+ymTN21QJD480GTyQ1CJtgBZB3qrHU
	ImLYsqEaLETN8Bf3czzoU4YN2cyGFE1+OuswgKdL3Wb17SXpYgb7UYpW14Lz/qxe
	yJK+863j/y17yMbvgKRvcWSZX/dvSVqxQpCk1aoFQGpm8WJqnFL13Xbj19Y4SZFF
	mK5KdJyby1L3t8TcdmxyONIf3mU+G0I984B4n4ksG+ySVoLL05k1v3iTvqXL56fe
	RflZcfEETNCUegj4fE3ge8WiWNvwtmiiKtTOX/I057m+pb0IojphXTVCyAxB3sOL
	USiJPQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6quq59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 15:29:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ea71803effso9888015ad.3
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 08:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793374152; x=1793978952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lpfxxF1BXeKYsOQeqaWCrwdbveAmxjDzeY39sdHqnnY=;
        b=XjGU0fPd/FoAjh95t5/VvQCDs+5TxtUzwmlg+vVR6Dpxf6XDog4JHmvr9vH4te1zW3
         6NJ1VUuC+jf8CbusDtfj0zFwmd/1PmAd/+qlSa7cpbmsDKR/Lw9XRyrka1TJ/tyRdWCx
         ZATq2yi2YyuSI2QUlFO4yINsS3HTRsnMTiM2qw4/XgitCmivYMn5LnoDdg7+J2vHWb6y
         kT+mYdgXV66stbpPUJ/hQzAHj2Mp3LA2aryyrKV1L8o37faDdaVDtOMsZ1YvboFy9Tym
         Cfg4LB8c4Z10Et12cQVkP3tIze7K/ab3efvtjqS6k+XcctVmPY/5TOt5wchMG074JAc9
         BGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793374152; x=1793978952;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lpfxxF1BXeKYsOQeqaWCrwdbveAmxjDzeY39sdHqnnY=;
        b=P1Gqt851xfpEKRD//BeOkxWIhtJXKEab+py++/9XwH9ZFK0ve6TmmbYPrmHixqeJU/
         /C/u8Sn8gCcKWWo8zVSjqTCd0nVSCuQKzVVfiBVxLkdLjFncJowuUb9u9uVs/MRJsC6J
         GoTF2XTibsKz8S4KDeZHFPYRyXnw46KyWxWshxH2sNwDAynh3F4mIT21QjgIVXLrOhL/
         LcX46iV6NT7Q9aV4KlFLziMGIGPdlmQywE8RyquS/ZlgVv2e8cdWtwic57Qmp5pTuYSq
         mCd/m7hw9A2YZ60fZxERxbBnvoXCceAi3MfxKAr8WFfmUM6dGFPM1dfAS+FKOHJL21kd
         VPvQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUI2Rv01MpZZEKE6iA9SPvKdW0kNZJryq2k+q0WTT2lenXSpFMuefubXTNgHNiK+AiX9hgz+qGZ6lX@vger.kernel.org
X-Gm-Message-State: AFq9FYI6JsScMnNemJgL8k3PCSraZBwE/QbjxSJ1dqTzYKKi/fpGjo+c
	cIRXadjbeyDSW5y8BWqDhxEnsVuCfkCji29EBNw0kvqNwlNUfyq/Yh5bSof2uAlvn8ipI8yJpBq
	tZbT6a7LInBtGnJR2n6ui//jZzVlx7bh3l/mDf7B3ficBLxiM7yiPu3YYf7zGFPaw
X-Gm-Gg: AYBFou0OHITza9+iersyYFk1BTXWptFOcbLlw9lA37diB2tdZorC8eXpNACoOBmvI42
	zeMIe/ljxYqlIGC6vKgDCm85fWSpKVF1r0K0Ef6DfnaOExj9QX9FPPJ1RC8R7Aa9p/SjSZuIY5a
	TJJepQ2WIsBBQEs/LDwu+Lw6TIlPtxtwSqH85Y1x/rcKROtC6ljSB2WQo6Rl6XZSxIhoMQPjpv/
	tqrZRzKA6OglxPW8tw8y4ffF+6OF1orwC8yGdmwM0fb2rpkLLCkeqUURqnIZGY6MLPCh2A1num+
	2/4sOTai9RjjtmkHCzkFsBPbfLvJqgK/Azek6Ok4aFgoulVsBs4obd/ARzPZ6ekaCADqqtOpu8t
	kf23GXaxliQbVOLipyc6s+sHD5DK5UM7hy5BjwkQcmTXsdFTHyKjiNOcTIYUPC5Ut24K9XFYBXe
	maZGIpq3aCyT3q4uvzKRvCOvjsqBC/cbSPXKYh
X-Received: by 2002:a17:903:3804:b0:2ea:fb8b:258d with SMTP id d9443c01a7336-2eb36401e95mr30024335ad.6.1793374151727;
        Fri, 30 Oct 2026 08:29:11 -0700 (PDT)
X-Received: by 2002:a17:903:3804:b0:2ea:fb8b:258d with SMTP id d9443c01a7336-2eb36401e95mr30024015ad.6.1793374151265;
        Fri, 30 Oct 2026 08:29:11 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.160.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392add5dsm9202195ad.68.2026.10.30.08.29.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 08:29:10 -0700 (PDT)
Message-ID: <7d443972-d4fe-4bb0-b758-49608bd27446@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 23:29:01 +0800
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
Subject: Re: [PATCH v3 5/5] media: qcom: camss: Add support for Hawi
To: Bryan O'Donoghue <bod@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
 <fFfGGWaoXA-LdO6s8Xh_kQWQfncXe9YNdpcj2yNkphWHAR_V69LdLOcuhXPsbg8dEUSN4j4yygq4wPre5cz79w==@protonmail.internalid>
 <20261030-hawi-maili-camss-v3-5-9742bca8cef2@oss.qualcomm.com>
 <23845ad3-dedd-4e24-803b-5abf3b030c4a@kernel.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <23845ad3-dedd-4e24-803b-5abf3b030c4a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bmx4Vckub1DDxh_95Wb_uv_SDSt-VlC1
X-Proofpoint-ORIG-GUID: bmx4Vckub1DDxh_95Wb_uv_SDSt-VlC1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfX94MsiU8tpU8e
 ETboApb193qwAXdpfqUZM434/zyc8wilMvPgIXOdCRQeKXNGHfiGBCm0kEG7d25oMCwQVwOrM2K
 ZR3fVvw4aIeNh5dZc0wstSS9W2RBp4CglgKgYPaYFSg5N05HbY1U0qDwgrPG1Im+G38NqJEFDp5
 NKbuz9kA00DEcludgr8oMsgHa9XHU9n4eafu7eRNxF+kDykmcHlC+BBg5Y5sUA7ACGgF6BszBts
 2YmStzDU3g7Y4HstDY94gSQD+VS5GYHJHdnckeEaz4HT3SnHaxqbxup+zQgQalNLoFSVHDA8+fe
 R5Cf+DvW2Pj+ol6bMUirlkejcv0HeP7RVkkm4yqUweF+IYbFTDugmTxAHWKcbhZDbjEfswXSRVj
 yGsYo57agVKiYDlUVbK5jTc32yoRqB+1seinH8j3bGbhEe2DffgYdEOko5QrrdlKGbEjgpRmTrM
 kzSLejxLwORfoLe9S3w==
X-Authority-Analysis: v=2.4 cv=dPgzC+Zb c=1 sm=1 tr=0 ts=6ae4b7c8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=6d0oVIyUxUng7TJeo7N4IA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=l-QsVsxeav8zdcdG2uYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfXz7ttD2yos0Ve
 opSbkHkPsapuiRlCVugBoxmm8ZK4NBUQRQ9j6ZkKye1mQwjfAR0Z21qKHi+87zfk/8t6EbxwZts
 adWiRCZMer3X0VzZ7QodkFFPE/jPFqA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300061

On 10/30/2026 11:05 PM, Bryan O'Donoghue wrote:
> On 30/10/2026 12:43, Nihal Kumar Gupta wrote:
>> @@ -6113,6 +6341,7 @@ static const struct of_device_id 
>> camss_dt_match[] = {
>>       { .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
>>       { .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
>>       { .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
>> +    { .compatible = "qcom,hawi-camss", .data = &hawi_resources },
>>       { .compatible = "qcom,x1e80100-camss", .data = 
>> &x1e80100_resources },
>>       { .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
> 
> this insertion makes no sense.
> 
> In fact glymur should have gone up the top with hawi underneath it.
> 
> Could you please remediate ?
> 
> ---
> bod

ACK. Thanks for pointing this out.

The compatible order should be checked carefully going forward. We will 
correct the order and make sure Glymur is placed above Hawi.

---
Best Regards,
Hangxiang
