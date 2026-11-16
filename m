Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794811190;
	b=0OwRZNkMjsSaef+NZp0tsycP0f1UYE12VaZhc8hFtCv8422qNUDCz5raDb3x8IndgmfR
	 +j9Svhqtx0LLLNpMPlt68PvQ6Q6cnG6UTT5PyvfSwG5Fbqn+mYbY9G4b/xhNKTgMyMurR
	 L3fbIf7uWY1dvPpRf5aDYkWxBpqUrEKz2wqlttHSsW9a3Op129BPeQT2aIOM8QxRKoLqv
	 bJfDrvvq83e8IXvWAfE3C+iq4VxXWfwCg4orbIJEZSFR8O8l62xYjDNDPXlCrJxVsXPmJ
	 HAzMPIfgmPLRLei/CpnhbSJKyWFf+yRPiZikHDwgO0sLxKUXGx2oaE1DPX4Mlr8+1Zg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794811190;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Uwe1KYw1P29e1DCVb9MjyF+MXhbVXhW/CrTXu68G5dk=;
	b=zGsNpwqmTAeAlFbkZGvI1zf263Oxkv/IgpcYyK2FdotwF20jRAbjqSEFFMYPJyMJKmEK
	 y61eSjjGFeMiWJ/gU3hNZJ3pPQ/QnLOAPJnjS5dTAdcO54d8ba4YNpYTqTiVzqAL3AIXd
	 fUN0eTpyxi4vpyFd/WX4Cmoxe0zkDTJ2jk+x1E/ZiSu9nYFVxUQpc3uYRqM6DsWglqfQJ
	 bzSmBWaYzoZ4+WqOk40B2KesFSt67LC3CnA3/IvTbrfxZB0hxnZhj/enhDXjF5qkoi5Yj
	 Mgstv1NoYnjSFdnMbcnEk2a7jan43/9w+1sFjMcgY39Pt9heex3NdvTEB4v+B1v4j0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KccI8a23;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X91ZcNno;
	arc=fail smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE75B606A334
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE75B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KccI8a23;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X91ZcNno
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LF662879977
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Uwe1KYw1P29e1DCVb9MjyF+M
	XhbVXhW/CrTXu68G5dk=; b=KccI8a23szTMbu2QuoBOEIyxSw8xRhiQsWZt+YWM
	gJr6Q+7cDA0uZRq301gg1OcPsNktR35+u+olq64jhgCdcbhDhkUIM5q/1w3HSSzt
	mPN0wgGtpP7EvRPwgnpjAOcchvltQ5N9la0u+G4CBF6cb1eyAHkRX5gh5sZ2KbnC
	QUH75P9/8S+AXIv31PqwTDyQGYEVvAcasvcj68WpyMItV+kWSXiciVxGLg9h/ncE
	tat7c/WacjwGk+qYkFb+wyi+u3m/+q7o9V1yiaYpvYrhIsByvJtNKW1VvHe7hqic
	ViY+VwHU8wXZao42aj7krdea4owxpl6DVTuvXhZFMkn5hg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhj456h8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:39:48 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d2d60dcf2aso2731002137.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 22:39:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794811188; cv=none;
        d=google.com; s=arc-20260327;
        b=eDqianjeun886EG1MmUK0p6saD2m5wVXZwc+nDr271wbuewmu73FTOPPvTpn7p38VJ
         F+U5+bXwTsHhBznzXLVD2gKnsecuQJPZ/BFTT5YeYo777C7YyO1kr7FLI1NrqKnjujMK
         bwXiz2+k1A/nYXgcAciPsoNc097MMWoeSO9e6WGUxpSs8li8zShyREnHAoq8gIGUMWSO
         e/JG7TG6Rfurpq1UYf5s/Tnp3Hyu9lWITBpO+jI99MLqMz7TH2PQsn33QK4tEgJKjpME
         fFPOKEgDYn13zdcaqG3I0EZ3Ud76c/t4gTgj679gpjOOrz7eokjIsKatqUhgQnOqwoKB
         q1Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Uwe1KYw1P29e1DCVb9MjyF+MXhbVXhW/CrTXu68G5dk=;
        fh=0c4rP4RPsKJ8X47+22rZwK/t6i6buykcsUaAW5FqCdI=;
        b=eRIVaYzfmCoIb9btmkEAHvThUhM4w/NkhY1lx9cebWK3IEz5+x1c9apugsq4qLnOlI
         Npb0H1asx+QOfIfcv5VNnMdaBzVXrsN7hhlMHPWJ2CDBBEa0caV/5SNOcMDK+3fGXsiI
         OeasKxGeA8rR3hgd95+w4ALIcWMvYNsEGAdtebvI7YOiSmLEwj8XhlS/CsXr4jCl7Xvb
         BIrcaKoV0s25pzwDSYJ63uNGUeDIW/IBMNmsYktkQn/Kxltww6ewH81spbXJPr9JJvhe
         AKd3xSCgxez8ahQkoNVd/leS70CZu0hbslA8goxUYAo8IYUBvxHmWNn82IXmsARf04SL
         6BeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794811188; x=1795415988; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uwe1KYw1P29e1DCVb9MjyF+MXhbVXhW/CrTXu68G5dk=;
        b=X91ZcNnoqmYRaR9fw5AcAwuOTqOGF6u/nl4tfg7dMwf3ZOTioiNhtxpCfRSeYxxyXY
         NnqzdlC9fN0gDzml5e3FYrBKura426jYCnkYrtAmiBb7mR9ImRgf5kvi1qcgaYSTsNkn
         Ac3wZ9A1tYBfTj1hOgM03MUlro94ojHr7FeYTXJYlGoaFaaVc3Sz9Obb35VS5y+DWv2S
         O6cG7xuEbwlQt06LD3X+mmcWP9/UVqT/NOiwX8X8futD/Gewr4fIQSDM0Q4BxcbZnBVy
         voE63Rev9JBkIvQ5sANjv9+baXxXj7ggjTZgG/8jfNAdqtYBRY+uv1exOms8JsZ1JW/+
         UL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794811188; x=1795415988;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Uwe1KYw1P29e1DCVb9MjyF+MXhbVXhW/CrTXu68G5dk=;
        b=dm/b7VYexcu6DtzSGREKiJqx6vTUMBGXMHmPvCaq/8ot0LddGHzuMi39Dbbi/28KrJ
         lZ8RlzsNF/87LG1lJBf8CKWEBZJWkEAsYWxjXQRNuG4+x1apGAYWkEh+W9pfdIXcesDf
         V7TIceVTYKVOY2MX7SK4n//C+avQjAuMPV+iRUGkdYn9zGGgPRnptbaDJsYXA96M2zos
         0ZNuE+F4yvIxo656H9Se3APREaQrKDHpQJ96AQO0U5xA0xX1ibm//mMZoZq5q8UkxEdO
         G7IPCvLR52H+8gSw1lVZ3mcOXJad5cWphGQNzLvwumnmcCa2zHO7jZ+hHrOSR87Oz/Zb
         p6Rg==
X-Forwarded-Encrypted: i=1; AL+hErHsc8UNbhzytc4u+aTUIMVj6YBnYVQSxj2ADlRhwLyXWv4Jw3SNUacAFlkiule1o+my2nv422Rv4RWm@vger.kernel.org
X-Gm-Message-State: APuU4Z+rePyjch2jSAqnOYtDASgoKqVrfWhyBKI1hcYXJuTn+EOVFrFm
	2CY8liZburQt55ioCJCw5tnfTMSriprMcgwXLSPCqgL1d7xmUYqTJqhe9NcvopBZDCnwJQLen19
	PebfUpAuhP3IAhlAi7QmtBXd/sQXzTVVNGYXQJ+EWqI+vRmzWgxoV+sbfWYU5aZODG3ZHzl+Yz7
	XEYEcz/l4K1Tcl+OcXxYeanljxt24o1OHK3Ykjplc=
X-Gm-Gg: AYBFou1VtH1ZjHZvKbNK/LdEHfahG9JPHraIGGstbwcsCWEsNWUv0q+GzyAZBIeq7Jp
	QCod3n9h5i2morVVD1i4TxX4y/IsytdjWnWKMHe6KUQXOq4/0XindqfynzcO5AN4/aCOpynQFtI
	m7s6djS3/zo+9+JwaxSD8AI8cYtVvRBY0e24LNKIz4SPv90Beml0y8xvRVfbo2mIGJPV722B8L/
	jlowneRCNCvHXi45A==
X-Received: by 2002:a05:6102:c86:b0:7cc:2fd1:7122 with SMTP id ada2fe7eead31-7d64d76c2d5mr3162560137.18.1794811187998;
        Sun, 15 Nov 2026 22:39:47 -0800 (PST)
X-Received: by 2002:a05:6102:c86:b0:7cc:2fd1:7122 with SMTP id
 ada2fe7eead31-7d64d76c2d5mr3162538137.18.1794811187555; Sun, 15 Nov 2026
 22:39:47 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-10-8ff2a11835f6@oss.qualcomm.com>
 <130fecb6-5372-44d9-8261-c3ac88248631@linaro.org> <ea2dea8f-e696-4e86-be9f-248cb6ec86b9@linaro.org>
In-Reply-To: <ea2dea8f-e696-4e86-be9f-248cb6ec86b9@linaro.org>
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 14:39:36 +0800
X-Gm-Features: Aa3M54oy1Hdi3jJI0vYcKhvRYWOd_gLd_nvmiZaADn1RpRApqiz9QprVKg54Urc
Message-ID: <CACbMrhqnjEhFzu+Y4OUoNVv-XhZce=cjsuFnUJNQD6FMN_ikRA@mail.gmail.com>
Subject: Re: [PATCH v7 10/23] media: qcom: camss: csid: Add support for CSID 980
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNiBTYWx0ZWRfXzwYKDMQYJiK+
 2qbdSxawy5q1o70yWoX39AX+FORnEwrf6y24wACmtkHkYqEewv5ZcnEK8AqHcBKq8AiEMi+3IBx
 u/x1bK8EPieSYqCLGRficxWpQ3uPZczApsWA7CcyH4I1znTJCU7rXyRM2dtYhy1bYNrpSaCBe9S
 3zmQ1qyVo9XXIOYHPnhUavV97QhQ/B9iCeWFbcdMjxooSxSt3yFvebh5vvu6bj86f68dqu+Tdc9
 FByuh1NXYZbJY+xZ08navf4bqjSTICoL8kLQnSv5aERpcBTkKK3Xy/EE1nN5cnao5Y/RaGeBvYE
 sBavJecVmelK8nAxIKgoorUV6GLyk/80+6rdfnxL4+SJT8MoBXgQQuhsRyG72Rqv71E2sNMqv0A
 yHEoWxIk8JaWR7Wp1waM6JJv7FszsesHSxHDa95Hth/DSSe6nDgxKhVDrx4xU5HkWshRZVXXshY
 55Nt+t/328rFa2NhIRA==
X-Authority-Analysis: v=2.4 cv=av0nmiZV c=1 sm=1 tr=0 ts=6afaa534 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=f4uaJoA6WFbKVHIvzf4A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: yNnGL6UvegiLB1KC1X9P4YP3MTKHzNh2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNiBTYWx0ZWRfX7JKcEcUDchAB
 AxxuT3vx/eQ2O/9g06pmkF2DIcgj3zX7KBuT8xslOG+O1QTNhW8P3ZMzNK/tknSentoOH6z+qHZ
 7pHWtr5Za2RFPQJ53/DCHwI+HmEuGUs=
X-Proofpoint-ORIG-GUID: yNnGL6UvegiLB1KC1X9P4YP3MTKHzNh2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160026

On 11/15/2026 8:16 PM, Bryan O'Donoghue wrote:
> On 15/11/2026 12:14, Bryan O'Donoghue wrote:
>> On 14/11/2026 11:29, Wenmeng Liu wrote:
>>> +            for (k = 0; k < CAMSS_INIT_BUF_COUNT; k++) {
>>> +                __csid_addr_update(csid, i);
>>> +                __csid_reg_update(csid, i);
>>> +            }
>>
>> Why does this run twice for the same index ?
>>
>> ---
>> bod
>
> "run CAMSS_INIT_BUF_COUNT" for the same index ?
>
> You don't increment a buffer index. How can this be logical ?
>
> ---
> bod
Hi Bryan, CAMSS_INIT_BUF_COUNT is used in vfe_enable_output_v2() to
queue buffer addresses into the AUP FIFO.

Based on the hardware documentation and our local testing, each AUP FIFO
write needs a corresponding address update to take effect. Therefore, we
issue __csid_addr_update() twice for the same port.

You're right about __csid_reg_update(). It only needs to be called once
after the loop. Will fix that in the next revision.

---
Best regards,
Hangxiang
