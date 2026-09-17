Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BE24FECEF
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648379; cv=none; b=g2SiO2O68WgGNqqJuCI7KFcHGDzI2yg5M51cZamZj3xIrfdToGGcTbikrcRj/Ul+puYSkIUfJTzvoJn7xT2PzX6bQd+Gyh191mgGLXCZRLEni5fOWHXNYmEM86NlsiseNZ8J3QLS+8x1fXdpc7MSf9tA5dsMRkM5YtzzpJsUUtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648379; c=relaxed/simple;
	bh=8sUxg+Je5s2DK6+4hwFcHBwLu7qlbmqTBaeaUSsFpts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kXa/zoBbTddsc3zgbNlEYn9pVJyylrISdWGsfPSIvkVMMDQqzidjfvy3NtDg4eim77XpoHKIR9BAeblZPbMz3DxQ/P2DpxOLGsRBP0eofVabdy/UfJgQ3u+PAHtZ3peTbm8qJ2+B9tLAjJs+Zo0m4B24salaJF4ANFmqA0dvRJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XKcwq0Uh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YA/ZUFt9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XKcwq0Uh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YA/ZUFt9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zr3d1863444
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F/5rCNvs3x9emCltZKgKC8Nec86QM2LMIv2AvFBZi2E=; b=XKcwq0UhG/Ocw67g
	wmQC875wDBXmYTLIfLKDoUVOhLxaAisoWzvnJaVTH5nRVRJDxct9pq/8FO7SYFqn
	0CGm9rVWX4Fx7tUmIyOMtyYVAphOvF0hNWNdUrhgL+VJ8KyG6ZiEXl1rjjkCbvy3
	Hy91LG1kC3sx7lTB4vW4JJStZY+/upiPkuKsk8SE1e9TuidMdJmO/4eKpoXBGWxe
	w31W4QvjSgxRfr2H0TJEtCssWNi8uo3yFvqwuao154kfygfPVLRBJMY9mINLtKG6
	9jxqPhK6SsWNve+l+QRr+SKdfMKteOPVm87Qv4E8HYgpABE6lCD0isdEYfaqPZCn
	UtMZVA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy6av6yy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:32:52 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-86a43fc3527so1093393b3a.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 05:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789648371; x=1790253171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F/5rCNvs3x9emCltZKgKC8Nec86QM2LMIv2AvFBZi2E=;
        b=YA/ZUFt9aXDUD1kGb+oferF1io9H1X9aiUGLUWyiUv7HQ0/2Nrl4YyOoX1r+meQx1Y
         OmTe1Yg0NBmc2HN+485LE7PWYnEggn2jn07Iz+E7nRHosJlpZ+H406uPeYXcPnworc9x
         xu+XPQ55/GOiBz52HXx0qiu7fyF5WEGgOAGjCDlx76MsXdrM/1H9JDmLRq1Y7duWOAtq
         XSyl1uRgCuLobuJGTVbviapXBAlR4XnRRDNzXnn6Xzg5AtD3dz/YwOf/kt0mP0HL3Oww
         HIZ9Rbm/3Oici63Vhot5Au/xj7v2Cncdaumxgk+zT/r0JUiafJwJ0dyDms0YJm3Z5tVu
         zDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789648371; x=1790253171;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F/5rCNvs3x9emCltZKgKC8Nec86QM2LMIv2AvFBZi2E=;
        b=ZGzeaOw1aZyeiwQJzpGE2NJNjuLo2O8xX5WJk7lDDWwYB9u5Xd0d/s/5NRzPnwgOCn
         x7KXJw4IJGNI77SxRtoT2Y1f4mKiJLubGl02J8FeGtaKYVn3TkFZAZ/fz9eO6emMtGr0
         7rPxbAIVU//yrXI56CBda0qL/JALLYiXftA/TZ0z/2f8la8/gS1aTVhXitCFMSAFcVkP
         WuKjA0MvFH2Xo2bOVZK727yezClzeNRpLrq9NgDSwHU+omO0YoVRwEZDHtlEhaDmr0Zv
         G6qSD3pIdCZKN+AHoOoLrRqDQGpU9d1Gmq2lnMicDPRff2UBqwKRdRgp2viCiLYvZX+G
         +33w==
X-Forwarded-Encrypted: i=1; AKwUvBzV4aSRIqKdQDPOGvZbtinXiXjUmlJEeSlA0ExhmBW0UuH3jOG7lzzu2eNdFUeqIAkXv0l35ORKf85O@vger.kernel.org
X-Gm-Message-State: AFuF++nhd2mqDGyd0DASQHlVos1sdegToe45mEHaG6pmxe1LDMqSHt3J
	yMPlJ05Z0e9/Ys+2hL/BznJfz4maZdI662H7SXso61qR3ktrEzpjh6FFjKgRGeHCzyI7dvqg1dn
	wUXiIqhymyndeFVgrs+NG6Q0ugFDbvsYq8qf0TV8pUk5ggaA1h/f/sGqf/qUKObB7GDwH1D2o
X-Gm-Gg: AYBFou2zbkR+/VKiciDyak09SkqG51VJsPMwraLg35QAWE9/vXcYIaJnk/9hnEL8eE9
	fBVsZexuLJ8fgPXPxkLu/JG0KAi3FOigqtuTsLtklj6jxW3U0JsV1Lxr22VLjewjadxUX51NM/t
	ZQPDxT25nvzfl5l7MLYRubQgUENOaYBsTU2A2kUGXb9iq3nCiVETqZrsIy8uMWmElxp+pqBf6f9
	xN8JCX0pO9gMDjSWYwlzD+nShyRShjall9FbdwhdpHT2WFytDJbI4yYImdJGyYLM1/9Uy07rfec
	ZqZG7VgtIDVle8ndd5WkrhJxRT5D5ztkNWb/mNVGJya1J0MSoBAXfYKBXUmyLHX3AezKDK+OkVb
	ipruS0vM58P7KS8qZsy9mRg470qqHr6bTo259
X-Received: by 2002:a05:6a00:c350:20b0:874:72b6:7daa with SMTP id d2e1a72fcca58-87472b6811cmr66288b3a.37.1789648371519;
        Thu, 17 Sep 2026 05:32:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:c350:20b0:874:72b6:7daa with SMTP id d2e1a72fcca58-87472b6811cmr66259b3a.37.1789648370883;
        Thu, 17 Sep 2026 05:32:50 -0700 (PDT)
Received: from [10.217.240.248] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-872025db965sm2754276b3a.59.2026.09.17.05.32.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 05:32:50 -0700 (PDT)
Message-ID: <e893ae0f-d371-4056-867d-ee0cb4cf3ad7@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 18:02:46 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: Add Talos Lyra EVK board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
References: <20260901-lyra_upstreaming-v1-0-e3a76dc9e21c@oss.qualcomm.com>
 <20260901-lyra_upstreaming-v1-1-e3a76dc9e21c@oss.qualcomm.com>
 <20260903-enchanted-umber-beagle-ba4b7e@quoll>
Content-Language: en-US
From: "Avaneesh Kumar Dwivedi (avani)" <avaneesh.dwivedi@oss.qualcomm.com>
In-Reply-To: <20260903-enchanted-umber-beagle-ba4b7e@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JyYtDU0XsW8YyqrIFU9vJ65kM4IAhhES
X-Proofpoint-ORIG-GUID: JyYtDU0XsW8YyqrIFU9vJ65kM4IAhhES
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NSBTYWx0ZWRfX9cUnN1J+FydC
 mmt/yhzR+lxhXkjVN2sCJBFoGqEg1pJuzjtgT+IdXEBxfeIJ+JRDGE7YpGPLa/O/WCdQxLpw/JX
 n3cnViQZ8UUkabQ+q68Ym0Rx2rjImQ0AalPDAnd784byCkOW6Pwbbjbkos7KJgyVvjRhd+JyVer
 /vh7uoJ0NkrR4lehelhWsHjIK1gTKL0wiF1JmlXSPlmksSaC7IUwsyuLV6m53sbQv9wR8wYgulD
 wfDNfFBVuJ9umT/yKVk3crGnWGk2w7CzNHFL9A9rMKLOyeiZqYldYyJS3qBy8oyrBtvdAxk0h3k
 39NdxNlBulx3pGp/vw2jUtKhCxhuEgKPmI9L1RkshoGELTycBgwTOC8hbhkF0rmwgtpZ3O9U4R8
 UG03FEza53yFJZVS0PjTm/2P+BTvHvFp2PTtWFu4gZOYavyHahAOH1kLuDFLvxhIknNIUtccgNz
 NnU75azT6QOJoVi9STw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NSBTYWx0ZWRfX9an8LES0L8CW
 62zk32QQCMCNCXjGivyDJ0Tf6bqbWdULQBG91FEfRXtzh4k+0z9F6wNnq6IMnFH8iKEqsE/JZqg
 xuXnJawVJry7DP1FalNxz/rxhGP/tb0=
X-Authority-Analysis: v=2.4 cv=VIRIDNPX c=1 sm=1 tr=0 ts=6aabddf4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=ksfHMGAz2zuh8OjjW7sA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170175


On 9/3/2026 6:25 PM, Krzysztof Kozlowski wrote:
> On Tue, Sep 01, 2026 at 07:14:01PM +0530, Avaneesh Kumar Dwivedi wrote:
>> Add the qcom,talos-lyra-evk compatible string for the Talos Lyra EVK
>> board, which pairs the Talos Lyra EVK SoM with a common carrier board.
> EVK means Evalkit usually, so SoM rarely is EVK. Are you sure this is
> the correct name?
Agreed. The module itself is the Talos Lyra SoM, while the complete SoM 
and carrier-board combination is the Talos Lyra EVK. I will update the 
naming accordingly in v2.
>
> Best regards,
> Krzysztof
