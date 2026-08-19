Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C179A3CCFAE
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 06:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787119498; cv=none; b=Ez47QheyRvyuGPur3n3v5XYzvS31sjw5GjYZcVggXSAmmvK2hY1r11Q+1R4c++0Ly4O655rlPu+DsHsUJsIzu4oamaPriMeW6YSDtzw3q7koxcxULPyjSqtKTY0vAp0OvqobAzkR8YqPiOpDZUD0yf421yPnR2kvsQxh9KhXUo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787119498; c=relaxed/simple;
	bh=apEfSzleh6zDP2MHvJsIoWS2iWfXWvwk8X2SVA8SWy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FiIG0ovX9jiOHZTZAYOT/jZ/OUVVk3MIOpDTiIMiI9Sm9K5lykKBGFvd9rOOZklvP+9OOnLFkapLeplLKKFg5fNIo2/sl1fv1m5KpJ6OxEN4CynD2XDU69V1BGeSdCRq7YvcRtRK4rddZzm/vmBxqUJ3FOx1myHqDhaN+ej4XCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U7u0nOL9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Stgnah5w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U7u0nOL9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Stgnah5w"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J5HwVT360731
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 06:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	apEfSzleh6zDP2MHvJsIoWS2iWfXWvwk8X2SVA8SWy4=; b=U7u0nOL9d5M9l64v
	c3zwvdQs83XfMqH3BtbVoeXRmPuQvDa1cRtiKpsYMLvUjpOTWhvCHZmKqy4O8YFr
	tUu9nmxADZMj5Z7qfeJge79S4J1cpljKld3yNRNmd9+Q5VzvBk3N9/RkgPN/JSBl
	IQsM4vl/2Dqu4u8zEJUmgYwN9aykvdHZ+k6MeNZD+E8dTj1BgcUh61Objw4GhVhI
	05w1QmwX/SCM7ndzse4gmLBUxyF9iXeJgKiXpspKjd/A487hSEc5KcUDLR8gQYuy
	w5W6wuxeRFUN8pveDXIqrd53/WWKrOshcJvk5NP0ggR+G1FGdi/ZzAdb22ExihOT
	Tb1vxw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm1m39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 06:04:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfa4e4684bso17900045ad.2
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 23:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787119494; x=1787724294; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=apEfSzleh6zDP2MHvJsIoWS2iWfXWvwk8X2SVA8SWy4=;
        b=Stgnah5wVhpY3A6cYJ6YyobY/aeFTt7Vy+LTr2t8RcY3+hEUAIcwRXUIl7GV3oVzps
         TBq94/rqdBd/lu6DoCOX2Kvpg4FTCF59xT6HwDyrLYR9r2Z/q4j1XPDIbPyApcmBxe0w
         a2HjYAq13v1d8Sr0JW94uQtJdvQTgNqxTePTtN3RIPSqkzQyODPa1D5bpeGZcMIKqp6l
         2mTEW/EPSKQfx8kkRy+E3KeygauhSh/KkMf2wV7zDKYM8LcaF8rnL1YPfbB52LynNnT5
         wjkqXGchZvDF2YEvOzrXgy7FUhJtRJZLy5OCDuzhhco8+fPP0EVq/hFW+tqoVhNQDeSO
         flzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787119494; x=1787724294;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=apEfSzleh6zDP2MHvJsIoWS2iWfXWvwk8X2SVA8SWy4=;
        b=OzlK92jLSE+5UAmEM/VAju+0iGjKuh+xT426RDPQ6XZOcSJYrw2GP/RBjJcNtyzevc
         0X4mCpDD3KfXnq5nAhJHZM++swt51ShvKX7Wo3wdiibD7xu7mxphnc/DE57uZqXof3rm
         piK9wigBLN8eXz189Rrxl/VIpjggEVyVnTlsIziCFU9gnFe/G94ankGlFWAN9tzaWTeX
         jp3fEwmCKzDs7gJU7fW78gxO29Pop6XbibetQ4bicG8/TPHV5TH16+YMq2JfImyjt/eB
         STAvKgZv/UEEy5GBt/0loetDcqjtwMiASB57Jgm8/WTyVaXCQShfZzvMgBGLVlYDsDwj
         uQaA==
X-Forwarded-Encrypted: i=1; AHgh+Rp5sNR0QO/W43+0A3xb4jHbW6FjU7h0YZwSvBOvrrnVCH7fz30ZT0/alHMYDN+0kpphME5+ETb3BjOS@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz5rhtZE+rQqxXE0VCIgfdq7by/cBScNamGRH+GOYV0TzFGsjr
	8S09urb1s2gKPXk6nPcXRVZWTA7w+H21wxAvMc5x0or/JraAuVpVwIJ8BqnKFnKhNDOc8Xrv7gR
	8Iub7RSayfQqejLqpSOBYw2SyTpIxblvhnAJ78YElvCwK4PFI84agRulIjWGlUGP/
X-Gm-Gg: AR+sD10F5KVqDwbfxKrfpqgeEs6WdAm5gCleCHdtFY6ym2a+K8iIOz0bcOZ373OYMq1
	5m1BphjKXnJ871oDL+NnAK7U0D7O9srWk03wQ9eud9AUQuvxpsl9ZvywN59hHGUKb30yCJd33y5
	k7AniYbQsOeDJdqdhQmQh9ukeyD1XqHbcr1ToCHxkzIyPzbhRxRNbrckY3kHkReVV4nPLWLVSNx
	+sqPQGLVDPr/n2yBUeOi/mVqS/rXIkYFpcza5zh4H+PDml+5Tu91Txq8m8W0VvUEoSrvo96oZhA
	d6nX9AOUi2fstTllx+aWNyik+VBTieMMQel4HHQ3hEuh0ppjRU/3rQD0ei2R02TG61r0xZtj6JC
	M8uiWkP5n20HHlJfwQ9cQp8OsCSNrVzbEuEY=
X-Received: by 2002:a17:903:2d0:b0:2ca:4f33:e86f with SMTP id d9443c01a7336-2d60197a2b9mr45806685ad.12.1787119494103;
        Tue, 18 Aug 2026 23:04:54 -0700 (PDT)
X-Received: by 2002:a17:903:2d0:b0:2ca:4f33:e86f with SMTP id d9443c01a7336-2d60197a2b9mr45805885ad.12.1787119493580;
        Tue, 18 Aug 2026 23:04:53 -0700 (PDT)
Received: from [192.168.0.104] ([49.204.17.188])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1e8dd30sm21530735ad.55.2026.08.18.23.04.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 23:04:52 -0700 (PDT)
Message-ID: <b62651f3-270f-4eaa-aad3-c71021d57f40@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 11:34:47 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] Add initial Maili SoC support
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yijie Yang <yijie.yang@oss.qualcomm.com>
References: <20260819054203.61385-1-prasad.kumpatla@oss.qualcomm.com>
 <aed5dcc4-8e7c-4f1c-96e1-9b423c053480@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <aed5dcc4-8e7c-4f1c-96e1-9b423c053480@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA0MyBTYWx0ZWRfXy4cvSjvwXc8k
 FtUtgD8ovEcI8D0Wk81sMGhNz6PtaG/TZk4JQc/6KAFbtNthxffUXHyHxJMN6fyhuNHC0aghtzu
 PZNStH81NyQfg9h+oLhRFoIcVUg2AgY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA0MyBTYWx0ZWRfXxjaY0umxKBbl
 IXC52U9ldkL5qHtUjZ35bEqdlH2+irE3KFlsKLoHJ/xvp39USL7A7kDMCgfVPceYuTUEmreIGu/
 D45GBEErE+E584Hhxp2HkrS/S2Zv2Mp18/HdrituSN/Uxxf7kw0lREpuBKfcR5NW291KphOfJbI
 S5vepzOAG2+3IXcpmzDXUi0/0XKyLaTiLSlKzuKQhYdhcuhXolfUA/4tdeMxOlxlhtJZzDoZlOp
 zX8rfhwE+L/XvpI7XjXEkiIWYOnNMguY0rN5iW153LFFVnrYt83e8INJo0u+IGqmLNZonnw6GJl
 BZI1fwpCll8BsVMOvF3u7JsZ/XUG3X8+z1Ml7AzfkwIIGFUq8a1RJzgoS562Aev+kKDWA+jVNNv
 0eoDyNHaK0G76i4Ru5k+ThnJiB+YVxYddELpXca9K6sSDpJwHpkWk2ohv9iv40lUSK0V9Hw/VcK
 d+upgc2EeILctqQv10A==
X-Proofpoint-ORIG-GUID: lKakS8UZVRqB4sVHpm-k-wG9dCnhEcC1
X-Authority-Analysis: v=2.4 cv=bN0m5v+Z c=1 sm=1 tr=0 ts=6a854786 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=/JTPBhwEQko7YaD0RKblyA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=6ALM1Nk-Pr6TOcMOiy4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: lKakS8UZVRqB4sVHpm-k-wG9dCnhEcC1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_01,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190043


On 8/19/2026 11:24 AM, Jingyi Wang wrote:
> I think it could be better to have a more specific title like
> "Add support for Qualcomm Maili pd-mapper?"

Sure, will Update.

Thanks,
Prasad

>
> Thanks,
> Jingyi
>
> On 8/19/2026 1:42 PM, Prasad Kumpatla wrote:
>> This series introduces the Maili SoC compatible string in the DT
>> bindings and adds the corresponding pd-mapper support required for the
>> platform.
>>
>> Prasad Kumpatla (1):
>>    soc: qcom: pd-mapper: Add support for Maili SoC
>>
>> Yijie Yang (1):
>>    dt-bindings: arm: qcom: Add Maili SoC compatible
>>
>>   Documentation/devicetree/bindings/arm/qcom.yaml | 3 +++
>>   drivers/soc/qcom/qcom_pd_mapper.c               | 1 +
>>   2 files changed, 4 insertions(+)
>>
>
