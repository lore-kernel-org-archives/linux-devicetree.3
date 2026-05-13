Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96843FADFE
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 11:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778670655; cv=none; b=Lx+yRIz4uGeFrEPTIaf68rwDKDB/V1dYOqpGL3WUzWFw7YqiRI5LGqARKkDZAvvlPZNFZfAFVBLee277BjHsgtQLm74vR5Tak0sTAGQ9BO1KCVFL1dn7r7KcdFKk/8mSKkc/c8xD5F7tiigGtXmYU3PETEyMiaMB2/xgpxLnnBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778670655; c=relaxed/simple;
	bh=bP3RoYWOF7L/X7Z8tT1VRk5bV9KNT5gecuU4Fmr+zoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cit/bd5Keo3D1P4eEdSwYJqZC/NL6unCS7Z0V8ngipH0dQxCuBywiFRgh3j+EsNm34HSlzJExWJw5iyouXe7673q46XTHF2PJjiQ/CdEierYwffuX45x1wpqIgitr30R9JlqZDWXRaePAGdkJKnFOiB7heneTiUyQaqCDXaOHOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WOl+l/WY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XOLgSM5W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WOl+l/WY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XOLgSM5W"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAWClD2321270
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 11:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KTnOsN1aNa26nsuPQvXFuQr8/FdfroaO4RQWoGorweY=; b=WOl+l/WYwwUflFCw
	7idcPFCq+EwdBra14lr6AiXdJ1aU2h4xLKd7QJzjqyiae22ZJCHk+PujH4rmXgef
	GsjUeWJ4zYwDJyZgswLnTvTjwqqob3LqAd17lRtV4fvXNeSC0IQTphAjwh7oOnhM
	Ndrr6Dvxe9KxY0zljqec1Eqssl8VHhWtRubw4etAnOPTY5KBrnLmrL2rg/H87U0O
	g4yZYYi+nblmousnlHDXEMCbd8YHaK7gVYwvXsvJIY0u5H4W47FU1D1RQuXz7FCe
	8ijFlzIAzyxDEFht8pTLtZsnUDqnJLHeZFdB5h6fcSX3XxDHQJX1fk5FkbZyFqbV
	13nJ7A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hgu9mwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 11:10:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514cbe73d00so59730141cf.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 04:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778670648; x=1779275448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KTnOsN1aNa26nsuPQvXFuQr8/FdfroaO4RQWoGorweY=;
        b=XOLgSM5WoS5NiL/ciCTvnQq5n9NAL8/F9HcPZcA/VsQcjhi7Vu/UDSBGJKWvOjxn/q
         yXw75PShU3YXwiR574vZ4u80CsCEEjSjy5CH/WfAvkfe5X9lmDJKAixLoE8SCZyDoaWi
         lWAxUtfpbuFAu5/dzHJdE6QrisZWEsa7/GlxV7iNFWmcV+Sfjtte/w/x1F6obhFwvioz
         HDetwGXUBILCMackBJboIFenwYgQLta1/Y5j3enbbXySr5fdYMpho8eoHreGgNNq+6Dj
         eg6iS5Z3k92bzq9hAYTgLE7DCUj8KthPjoPAzm7MYe90b2sI/t5SnczWPgaWQuWviXnr
         OukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778670648; x=1779275448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KTnOsN1aNa26nsuPQvXFuQr8/FdfroaO4RQWoGorweY=;
        b=G4LgTdyiNbNbcrnPaR8IS56skZKZOY34BZ/zRyIPNpZTE5z0b1VzcFIIlJ0EU4knas
         t1s2VaTTN5vb7BMKxai4dWS1uRVG+dDc6LV7oav0eZVNE8yJWf9xdx1Rdq1/CYws4nMg
         Lc1oi6VxT6SwOeVFl5bbBJk1APE/pCk2nes0LWiyljMQ+jUMVxFLi9Yr/I7pqVdUSNqw
         d1dCv+J9BBgO0iRk4cUvS/k1CoF26tbqKeBnQ5O7EDR+V7F3PlCMF9cZ3PkWu1jU6H7H
         aBlmJoh+XGu8F9A5c0mIxBGxKeVDoc9mXh5f208lGCSsLcDJQe1kApgHRcmlTMRlBUmu
         wZ0w==
X-Forwarded-Encrypted: i=1; AFNElJ8ZvGRhsYd/pjvMLwzrAyXo81KnXLLCdalxGcHM20A7ZSQJDhm5crbY9Sq3sqis5Wn68VbWaihvcyuw@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb4tJwGEReayhRJBXBdNALnReLXQzWZzYkENEO2iEJ9Ib7xbXD
	ESZ8ltaER7dnbKhFJIXdyWr8md9Qxq52f0E75z2fIQbSRLBny3MykZHABnztw2leqj/sJC4laYG
	OuUC8DoyUOhcELPawr/2uD8C9eALkjLKbRQ8ezzyq9r2JX7sNpOv5qe1Jxw0UHTrt
X-Gm-Gg: Acq92OGt6NazD9gP5DtmeMDBSNYyyOQOceBtFNhi76yHr4PvoMIkC6/wHkuXUV+K8mN
	DxJOhQYbA2X3ZcfGF3Q0IC1XIiY1QCwoIy2CogVWKYTDWYzHVNDCEEYmWoAwjjQFo8FhJCn8QRQ
	GYWE3uLt/7GvCV24DyHlucqfKWLMhmj+hn/1DF4tmb8F/SGDWyrcZs2UmW1GP/XKXAghOD3S/zA
	zTPYvBBeGB65AxfH2r+/YiCdSDk2zQStNbt+vxNqzYWTPp4nLSGSS1rcJ+0URKdG+r9fNADvc4V
	7Hghuhfy3C0cb/T9UZ1k3XcwopFdXgLBPjf6FDOD/r3zk4G6kI2I1cxQ80JXNcpDLNx0g1PMc4K
	oJEzluvSuItkM6nULtVa/ap4qwHdKxxeuVaEFXz+nlHcBjFVJ+ckJjLwNk5VXJo25NOC9dMVQUO
	wGA+GF1SD94K0XdcRvZx4iDEblXOdXaqWs1vmgIzBp6it+ok7JZebq+l+0NA3YVw==
X-Received: by 2002:ac8:5f85:0:b0:50f:b978:82e9 with SMTP id d75a77b69052e-5162f48880amr34365441cf.14.1778670647638;
        Wed, 13 May 2026 04:10:47 -0700 (PDT)
X-Received: by 2002:ac8:5f85:0:b0:50f:b978:82e9 with SMTP id d75a77b69052e-5162f48880amr34365091cf.14.1778670647149;
        Wed, 13 May 2026 04:10:47 -0700 (PDT)
Received: from ?IPV6:2001:99a:252:3300:d706:9b57:5996:15b4? (n2i9bzmlzk2z87merp0-1.v6.elisa-laajakaista.fi. [2001:99a:252:3300:d706:9b57:5996:15b4])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955e1fdsm3984374e87.47.2026.05.13.04.10.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 04:10:45 -0700 (PDT)
Message-ID: <0636aa3c-5240-44a7-a551-4740956ba5cd@oss.qualcomm.com>
Date: Wed, 13 May 2026 14:10:44 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] dt-bindings: bridge: Add Lontium LT9611C(EX/UXD)
 MIPI DSI to HDMI driver
To: Sunyun Yang <syyang@lontium.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andrzej.hajda@intel.com, neil.armstrong@linaro.org,
        maarten.lankhorst@linux.intel.com, rfoss@kernel.org,
        mripard@kernel.org, Laurent.pinchart@ideasonboard.com,
        tzimmermann@suse.de, jonas@kwiboo.se, jernej.skrabec@gmail.com,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, xmzhu@lontium.corp-partner.google.com,
        xmzhu@lontium.com, rlyu@lontium.com, xbpeng@lontium.com
References: <20260508142500.4922-1-syyang@lontium.com>
 <CAFQXuNYq5QYAXRzcUBnyvVh5ofPBVYONCs1dM6qPgK0BDja5Ow@mail.gmail.com>
 <vly3gbft3k76mrcztcn6vxuqadz647hsaz2q7qpmpofowofodb@nnxrr2cdueru>
 <CAFQXuNZKoahwq0zoWg860Z-amTKEefBFuen2fDG1htKjzE7ymw@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CAFQXuNZKoahwq0zoWg860Z-amTKEefBFuen2fDG1htKjzE7ymw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a045c38 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Kz8-B0t5AAAA:8 a=2kvw8oITFPD5c3g4VIoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-GUID: EZrZyt3mxhmUwVjDMgzKl43MlGeJZFtn
X-Proofpoint-ORIG-GUID: EZrZyt3mxhmUwVjDMgzKl43MlGeJZFtn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDExNyBTYWx0ZWRfX5h6Sj5swG8GW
 zdTbM89cafLb7F6CTHGk4nwCDkDwueYD9QLUw3Wlc3rZq+ER0BxH0BkF0nxp7scmfgJyBUEWICi
 k4VBmOJyVC4+LC3WH3hDpfxV5memWt35sirKydEcgFMnI7QhXVH6lcrqNu78+MDY1jI3j7KzgVv
 hqOMhB8dV9DaCgDXGhlk4uI0zQpaqyzPpheyvhn8Onmelv17SEoQJ+1VZ9er173P150s8GraSXa
 /R8wHE5MZybcHQFckrYsY/pIPtd/mFct/YlirXlRJ0PPmPYoLoYawkFKdBiOtmZ/wWVJsdayNgM
 gZRJf954rpViUSeQBjQdBcAD4BQCnbaDq9BJfMJyd12o0LzR4RDJQh5e7j6xzz+Isb01gkjeMhP
 Nq6xrjxNV/iKuQiPZxMwB66PWQhfSkwUfJjVvmqdze5NlX3bFXht0/2m4Y6NYhs8rILBoz7etFe
 8iwv3efHORjhicUuuVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130117

On 13/05/2026 14:07, Sunyun Yang wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年5月13日周三 18:24写道：
>>
>> On Mon, May 11, 2026 at 11:28:06AM +0800, Sunyun Yang wrote:
>>> <syyang@lontium.com> 于2026年5月8日周五 22:25写道：
>>>>
>>>> From: Sunyun Yang <syyang@lontium.com>
>>>
>>> Gentle ping.
>>> Thanks.
>>
>> You've posted the bindings on May 8th. Please give maintainers some time
>> to react. Not to mention that you posting the bindings 4 times in a row
>> (once together with the driver and other 3 times separately) doesn't
>> help maintainers.
>>
> Sorry, when I submitted the patch on May 8th, I received bounce
> notifications from devicetree@vger.kernel.org and conor+dt@kernel.org,
> which is why I sent the patch again.

And some patch trackers will now have incomplete series, others will 
have duplicate entries, etc.

In future please use `b4 --resend` to resend the whole series at once.

> 
>> See https://lore.kernel.org/dri-devel/?q=bindings+Lt9611c+v6
>>
>>>
>>>> 2.34.1
>>>>
>>
>> --
>> With best wishes
>> Dmitry


-- 
With best wishes
Dmitry
