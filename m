Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633D053CA93
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 11:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788953043; cv=none; b=OZAC3adq3cb532vevSsG5+UtCBALFQVs8/IUAIdlBDUDivEyXWDEKQo2cAEOaLsNp+450wfFRcP4fbeagrm1PldxexG53J1SN6j8VPzawGNBg8t8WZHrtY2svRPhM5jv9SPyRGFxvZvTb0Hd3LBnt7r7tF//oV0tYSGWZ1m+t2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788953043; c=relaxed/simple;
	bh=DWE8M30v1bz99kwMIXEjqNz+OAMhMFZrlkKR4L9XjpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oaRhA11jRbniiwKaOOOu79jOFOJJxv7VQlbICaAIA4a+wIQKWYwk8zJ980c84HSzNgJNQGdOwZ3Qj1O61+Jz+bEwK/W6r1deYDHIJmuLeUj0WPQ7jk+k5S3tUJEnm1tBzVSq8Q83aloeYxOPb2PqW25mD04PgSy7qoOeh5etAhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P8BVk2HZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y611NEZB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P8BVk2HZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y611NEZB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689AqENQ1936151
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 11:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CskMLjIGx5VAfoOYg5Gb98OLWfFaaV7A1gfjsZXCk8M=; b=P8BVk2HZm+8NaB6a
	2Yb1WhUvjntlhKtSCGglZBEpcD9l/Ed8gdn++IihAmIqhHX9pTDxjiq4sNhepaVV
	UWf+186NXeXtU3mKDASnDoFNofPnDzTlVQ67IozBXDc8J87RcM6Je2C41epiv4Bk
	ACU64hO/oPM7G03tw7ub6CgxPsxK+hbJBrrhOPJPh6pSmq3hmHV43Zf8HKJEldPz
	cosT/aHBx/yLgYkyAuDxAwPAajdrzx/zC0FETF0cCL5OtuMdOucs9D3WwdablH9H
	nGzlzrGyIrGPpELk06p7UxBJW+qJDWjMZPKWTDlRiKHFGcI4XlSv2+Zr7FPVitJY
	ZjHi1g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk62x83q2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 11:24:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e661ce1dcso72781785a.0
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 04:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788953039; x=1789557839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CskMLjIGx5VAfoOYg5Gb98OLWfFaaV7A1gfjsZXCk8M=;
        b=Y611NEZBiXcffcZeFn2w7r1oofGLs/kNoVyIGRBa1DxuNPLU9Mz71JUDmIIPXPj09J
         DypDGyU5zuagxBQL6kSAr9aDypJqCltX9qmClwcm/6NRng1NUxp/snrjsrTT6wqrrJE4
         1MKjfbFga7v+75SDsk4ay+yGukzCvXisBr0Cse6AKhz9rGlhkfeOcea/thia8Tqrq0MZ
         QqqnBiA56xn6BsUx7jEf72w70Xk8CUbjoDtxgINp8zOi5iHpsRHRkSTArHDsz0fGvw7w
         NtHzDB53ydLOrtu5xaynUdreDHXXC44tO8RWk3AF0E7QR2zloS2natSOFKZ/ExIdaTss
         Q6uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788953039; x=1789557839;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CskMLjIGx5VAfoOYg5Gb98OLWfFaaV7A1gfjsZXCk8M=;
        b=Zo8c2DrKpDCIpN4wRS59lqdeew7qB2W0SFGEXYYeSzLH27EAcj2bdZP3uRrEpWm5b1
         7HO+90859xj7P11ge0FleXkDZOoMh3cHg4kgjSoleVfXwKXB49X3SClB2uArMlf37n+J
         rTsKqIruLl5r5gB6onVuFVieSVU7EJrqPvDOd/Tqtqr74wjF9Okd2fEdQqsiqjkvODxQ
         vd5+vWH/yQgtno3nRMN5vTH0H/Z/ygMvSL8znaE3n+tN2qyUUCt1EBC39jAZV99vYovH
         pXGWGUtiBtWaIKuoTN0GN4WjtSl84YsTCuRAhHpKwI5q7xEY84VOp54zjuTnKQNGl/T7
         VONw==
X-Forwarded-Encrypted: i=1; AKwUvBz5zoUAOF3Cnkeh7EDKrhJUzIOIlCk9UPpR6G+9jNRL2a0HsB32clUidn3ucK/AGv47t0eWgd7u8xHt@vger.kernel.org
X-Gm-Message-State: AFuF++k8/gwRIJrM8T820A9OW9cPRmCzvjgJErk1BDDBBHk2O1+6Q3t0
	dKxZgq4Lbez+b14nyeXac5mkD7pMTveQjXGyEh8kp3gsBrFHTdfJA5wr+kpZ5+w18D6nOskYahU
	FeDBHObhhiKhqXGXz9986jjSgd2orjjb8DTOAp85ofL3cDcGV7cxtOLLAsbzbaxeV
X-Gm-Gg: AYBFou0G8BFxLcrM6bj4JZYuFBppyxC6W/+XNF5CV7VnyvpLv06jaiYOIE2DwwHWNk2
	EfTlMESh05Fk0AiQUGept0Ij0X0VYfp2FqM45nV9GJEDGPpth7wwFEP6Dh1seRTi9DBt/4x5nzt
	aiq3QkG0nAYiNDPZptY5piECSItZafBnhQESc2Nwq6nIW+rRSKsN5bzpCqRJV19vR9pUQnlhT8f
	O15hvUIHcY+Nfpd0gtwAAdL9qsIBdqobmwFJeGN2FPDjSDl6gL/nT3/nZsW5FrNRkSaZW9jjXGv
	KMEvyo+GwtXK7Uw0GFoBsRDe+VzzOoAFTgH3JHaEpB5OB/QpY8sS0JTiOQMZ2F9LJHkNxLuUAjI
	1bfeVWDcRwyfhL3IZFF53lg==
X-Received: by 2002:a05:620a:43a3:b0:939:b8da:1242 with SMTP id af79cd13be357-939b8da136dmr1146509185a.0.1788953039533;
        Wed, 09 Sep 2026 04:23:59 -0700 (PDT)
X-Received: by 2002:a05:620a:43a3:b0:939:b8da:1242 with SMTP id af79cd13be357-939b8da136dmr1146505485a.0.1788953039155;
        Wed, 09 Sep 2026 04:23:59 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c26204ecdbcsm671326266b.25.2026.09.09.04.23.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 04:23:58 -0700 (PDT)
Message-ID: <44e0cf74-93f8-458c-8374-a1de70b0f2c9@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 13:23:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: lemans-evk: Add LVDS display
 overlay
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
References: <20260905-lvds-support-v3-0-b40a1b03f63c@oss.qualcomm.com>
 <20260905-lvds-support-v3-1-b40a1b03f63c@oss.qualcomm.com>
 <5954fbc2-08c2-4509-8703-ab20d57be309@oss.qualcomm.com>
 <aqA4xy0XoXjLrgNN@hu-vishsain-blr.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aqA4xy0XoXjLrgNN@hu-vishsain-blr.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEyNyBTYWx0ZWRfX3RbqG5aM5dcr
 /vJAeN+7Yf0XHm2QjJZkBzlhN9pr83HSEa2QNTquqaJIRAfghoVE9JoORKngYoLnCyYcEr1ibVz
 X/fYU26lw3QfLcI5rPWKRPHRy2ybB9U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEyNyBTYWx0ZWRfX5tHXXMBH98OS
 K+6JyzpriLFksFzLQ4of71q6Ol8U9+4avKoLYmx1jECO1SAWwPEZspFKiOQCyKCtcZHFlsEwB9L
 Z2RE2Lx4zoBGoCpZyRPt8tYm6JWr528rqGdEU8mCW4LjR7O+2xfine6EcY58F2vRp9XAysXZwym
 dXnpjZeBYxe4uW7EGv0ufvoN/Uqd22jdUWzN60adTz1uOIVKOn4AjKas8hQt0fntoz4wvi9hdp5
 U8hebeHfmkcLqGvJJnmGLKGb94McIZb8MOax3++j0h2jTQHea6dDyN7cg9arFEergrR2FJ2jPsf
 FFm/xmLK0LwOXmoyt4q2JdwoIZMcYH0haiANYYXU0lgjRwTT+YMy8t5Mw23eIWYGKZUQaBAy/OA
 Wb++WISECwIiRlkUoCk9Eo4fcH/Du0k9geZfrRzdjT5gSOHxi8SMj6z8QtaGEIvFJOUCS+W8P8t
 SJJBoU42EQejv/T7ICA==
X-Authority-Analysis: v=2.4 cv=UeFhjqSN c=1 sm=1 tr=0 ts=6aa141d0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=AxN8k8jw1LNhRdHrB10A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Ry7BKPSuiDyVUB1_vrJMWqjJ_FbHXxS1
X-Proofpoint-GUID: Ry7BKPSuiDyVUB1_vrJMWqjJ_FbHXxS1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090127

On 9/8/26 6:33 PM, Vishnu Saini wrote:
> On Mon, Sep 07, 2026 at 01:40:52PM +0200, Konrad Dybcio wrote:
>> On 9/5/26 3:30 AM, Vishnu Saini wrote:
>>> The Lemans EVK IFP mezzanine supports LVDS display output using the
>>> Lontium LT9211C DSI-to-LVDS bridge. The bridge is connected to the
>>> DSI0 output and drives a dual-channel 1920x1080 LVDS panel in
>>> VESA-24 mapping.
>>>
>>> Add a DTBO overlay, lemans-evk-lvds-boe,dv215fhm-r01.dtso, that wires
>>> up the LT9211C bridge on I2C1 (address 0x2d) with reset on GPIO37,
>>> a panel-lvds node for the boe,dv215fhm-r01 panel (matched against the
>>> panel-simple-lvds-dual-ports binding, which supplies the panel's size
>>> and timing internally), and an LCD display bias regulator supplied
>>> through the GPIO expander. DSI power is provided by vreg_s4a.
>>
>> [...]
>>
>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>> @@ -58,6 +58,10 @@ lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
>>>  lemans-evk-ifp-mezzanine-dtbs	:= lemans-evk.dtb lemans-evk-ifp-mezzanine.dtbo
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-ifp-mezzanine.dtb
>>> +
>>> +lemans-evk-lvds-boe,dv215fhm-r01-dtbs := lemans-evk.dtb lemans-evk-ifp-mezzanine.dtbo lemans-evk-lvds-boe,dv215fhm-r01.dtbo
>>> +dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-lvds-boe,dv215fhm-r01.dtb
>>
>> I have very mixed feelings regarding putting a comma in the
>> filename..
> 
> I named it similar to "talos-evk-lvds-auo,g133han01.dtb", but let know if i need to remove comma.

Ah, I didn't know this is already in place. Then whoever would have issues
with it would probably harden their tooling against it, it's probably fine.

Konrad
