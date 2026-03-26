Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3EA2E54B6
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 18:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774551031; cv=none; b=ekt8CxLk0A4YzHyO5DaJntbx+afoUF8yUS3ua1f9MFz8Wn1qZuJN1sc/eE4GCwRriemPl1VCgAknx9GL3ePxxAE7sqsk9LxqeGQy9nzAxy/7PlP2VD23OwOkTu4aLnteV6pR7IyAzAk4yCTcapxIvD0TZnkTnuOkhhCkzd9+f3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774551031; c=relaxed/simple;
	bh=UeXvESmWG0Z4wemNV2lt5hHzVTotDtjZdPIXvEIiMl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZJx6rVZ6anFrbOm78PldNaot7GXZrdHeWsdBYtbJ+ytwWM/ofEVUDSJPlz4ffeJs5Z6aEFDjCzDZZ/sYQ4+AXiF6dbEovaXz0mocgMSppfBJHtBEcqwGBSLKfssapi+/JLWSv5t0KxBTqjB1U+fREoQtEJApq/1jSNsdSMB3Qio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nElMNEF0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sfk9pqEq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nElMNEF0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sfk9pqEq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QF9e0h334208
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 18:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dlg0qOfDWIznEr8L5Qx8BIu5HfoNV4hPGsRzjrJFlDY=; b=nElMNEF0xjYIi5IT
	zQSEQPrj1BJm+2feQ/InvrkfdraiMRRD5/+frnMNrwF3wzktvi1CMapxA4bawCd/
	q6EkCQpqf2WLLbSb+pqwv1FUu/Aky7m5RPriffj7gKEnJ8qOLO1MR2YZPDMCyRDy
	hKseCJ8CH5UP95tFzdKX2JggxYqJnZ2mZQ0RysRaDSn0VXx9ApSIwYx+dEKQQECH
	80kViTS2lfpjmWQJxzt+6fl5itE20jW8exTGX+XGf+4grgK0TyrfbJbs1VG91art
	No2b47UXufqPrfDX7BsnFV3og/e9vRH6mCVXzquowIrutysuqjsAz926YvHdBR7t
	JpVsAQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d527yt0g1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 18:50:29 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c1631e6189so9280528eec.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 11:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774551028; x=1775155828; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dlg0qOfDWIznEr8L5Qx8BIu5HfoNV4hPGsRzjrJFlDY=;
        b=Sfk9pqEqkV7oBUsykRCC3chK6BtGyAQvMz4lIU9zy3rfc5MY32hX8LG4irXkIlh1cn
         b+SWaOCDtU+w7FetnVkuCUyy1Rmq8Q3biUBE84QnvukfLSs+xXQh6KrTvAof4KF6ZxqY
         Yf9kPYsLOxEEct5ykUSECuicf50bs0oILvLSLTb824yyn3Ha2g8nQ06IzhQevi4+/8Ik
         /q5mMS+radm77skUVfZ1DzCmpZhtunAIAAppkNY2jbJBlikgsJWbgWd83x9gCnXBb+PE
         lOICi9qCxB2kX/D3YrMKwKdy1g5AB0IAd2d9d2YtjLwywL0heTYz1/3q5psDSt0MT4WU
         SsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774551028; x=1775155828;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dlg0qOfDWIznEr8L5Qx8BIu5HfoNV4hPGsRzjrJFlDY=;
        b=KeQpEAGaTOxdJHyCDdJoKWwiib/ihsYaYWTZWu+0gqt2Y9IPYMp1f7BtS08TbxzR+o
         24x7tn1DXSxg8SNXq6pmzpEEL+2/e93D/XFh2Q+++cRkq3SatRIUxBbo+9OG3b92gBYf
         /WUqnDdmnLk9dZOf8XACBfl1sLLtkOSJqoikbCn65dJ7x3czWT3vrFQxY0zTjeA1vRBF
         9NAHMUi6PcMSS9cqEp+9DSmmLj6lZxR3Uz7L8503Mvhi7+6Z0Tf0JIubDYawLuXou0I0
         o++lOJ/lKb1Sm0Ws0STDu+ax/Uzfl+N397tQlFVTPUeY9/nKtED/oruV+3w2ooEm0B4H
         k8sw==
X-Forwarded-Encrypted: i=1; AJvYcCV4uZdAg8IikwrAvqefqSxaH5tW5xPOU8UJde85aDS6ExH8ZsWbDJCMqA+oBF7xyVYi7zFQ8MbS8KH2@vger.kernel.org
X-Gm-Message-State: AOJu0YyIjCgsQvTuF8tkju7e3ravVZRHxY1tJpNG2hD1QsJnBahNmzkA
	EdCSczPH9AAFWNLcaAfjELciHSlncl5IgfNjxCd8mhBIdhjPwWBG6TcKk1m7N8Yz81Ny8nx6ePG
	QBaTAkBmleZ9nxM0+i4j+Rx69VHoqPlO3wSbg6PHuZOguNCZTSFbQo0tO8AAJP1Gm
X-Gm-Gg: ATEYQzwfctAamVMH3nd2bUvJZV9MKTFrhAr3EPTVYgKaEhkdzTY5qUlB3mx5Kb+so2V
	c2z0SGnWO0doz4Xfc8jnPzOWLUojDgFgVYVJG/cjz2MGIDTF9HurGdT26vsz00WBAklCYWOKKV/
	ODsDXy34Jx6cJREgpOH7c8uPM/oZx1leAoL6oOBIkO6wTmNpLXNYhrHv9RR8+TuOg70FWey4owk
	DI+BQ6Bbu56a7PCPa6Vh/oqbYyWGnYsb821k/+oeGJ9mUjxyqXT7GYnP6DhcTkO0xp5v/5wSP4M
	NcMVe0+FPw1gOg1AsCSjrpKb2CtBWTVLrRlsIIqNrMqCyCBgcU08jphT3S+qyvBBQsF2ounVfuA
	in7WbGllW2Owj+9o6SUYddTAWph4fYBjGT6GFnkdqmwAFMdikRB4=
X-Received: by 2002:a05:7301:60b:b0:2be:2f58:2ef5 with SMTP id 5a478bee46e88-2c15d2b54d1mr5059808eec.1.1774551028222;
        Thu, 26 Mar 2026 11:50:28 -0700 (PDT)
X-Received: by 2002:a05:7301:60b:b0:2be:2f58:2ef5 with SMTP id 5a478bee46e88-2c15d2b54d1mr5059785eec.1.1774551027587;
        Thu, 26 Mar 2026 11:50:27 -0700 (PDT)
Received: from [192.168.1.132] ([70.95.199.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ee29ff9sm2896643eec.29.2026.03.26.11.50.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 11:50:27 -0700 (PDT)
Message-ID: <a25ecdb4-1140-41e7-8007-8aadbe5c207c@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 11:50:26 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_v2_1/1=5D_dt-bindings=3A_connector=3A_Add_?=
 =?UTF-8?Q?role=E2=80=91switch_provider_phandle?=
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260324172916.804229-1-elson.serrao@oss.qualcomm.com>
 <20260324172916.804229-2-elson.serrao@oss.qualcomm.com>
 <CAO9ioeWxk_=HowH-FcEakL4EXFyAz=dyPwEpqSXPQfvmuvfPHg@mail.gmail.com>
 <fc406873-74bc-49f1-8be2-4b089d0c8010@oss.qualcomm.com>
 <CAO9ioeW7O+arR2VdAZboty_cAdtYm--ppMx9RT3nTQpJbTGccg@mail.gmail.com>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <CAO9ioeW7O+arR2VdAZboty_cAdtYm--ppMx9RT3nTQpJbTGccg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dLurWeZb c=1 sm=1 tr=0 ts=69c57ff5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=uHxescsG3rBdxcXwcPaeSg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=5KLPUuaC_9wA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vKePEPP4CPQ2KtXhb4YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: DD7VsZ1j1WrEVus1z6nSP3J8KSErm8Jh
X-Proofpoint-GUID: DD7VsZ1j1WrEVus1z6nSP3J8KSErm8Jh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDEzNSBTYWx0ZWRfXz7Yw5CpTnrBr
 WQe6avE+2SoOoW+mMT+YIZ6+j7r2MSgPEY8JpGgH8tujTn98BUCT7+Ya8GobogruysYnuFwhlVI
 FV6kJzGSkhfagrQJ6KJwl1JgqDDO4x4lt7XL2YwDHot0LfOBgjxvQPXuwZcMF5FV3xtQ+3HYrik
 lyUKPSsfI+x/tPdQuQE6jvw6PUp+IimSA9JyV+LLij4BX/BAFDiN4qHYGiMvzNMqXcPjN142OCf
 TBDLCvXDP1fw6yedPgJBNhHYDJsH/5anate4PCff1XNbMNgZI4aSlHOt5RoOkugKU/4fvWEbZqL
 lMCf6XsScc9/P4B4WKSDFnrBQ8c3otZJQJE9cJ566xtqD/mMbjihoSNyYpKc621C3JNcJonTE/y
 i09+BLQzyUIk5yX8bB+FGpbAf27+ciMfDIYTqVmAvoWnQ77GIsWpE36xa5XWbS6pZZAdcZmoPQl
 0AOrChb2BqeOnP9Z6Ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260135



On 3/25/2026 6:57 PM, Dmitry Baryshkov wrote:
> On Thu, 26 Mar 2026 at 03:49, Elson Serrao
> <elson.serrao@oss.qualcomm.com> wrote:
>>

[...]

>>>
>>> Previously we didn't have such an issue for the usb-role-switch,
>>> because there always have been a direct link between the USB connector
>>> (be it gpio-usb-b-connector or usb-c-connector) and the USB controller
>>> (implementing usb-role-switch). As with the EUD this is no longer a
>>> case, my suggestion would be to follow prior art and let EUD receive,
>>> interpret and resend usb-role-switch events.
>>>
>>
>> In this topology, the EUD hardware spans more than one independent
>> role-switch relationship, as a single EUD node is the direct neighbor of
>> multiple connectors. This introduces additional considerations around
>> role-switch discovery.
>>
>> One practical consideration if the EUD registers multiple role-switch
>> instances is that fwnode_usb_role_switch_get() ( which relies on
>> class_find_device_by_fwnode API), assumes a unique firmware node per
>> role-switch instance. If multiple role-switch instances are registered
>> against the same firmware node (the EUD fwnode), the lookup will return
>> only the first registered instance, making it difficult for a connector to
>> reliably bind to its intended role-switch provider.
>>
>> Supporting multiple role-switch instances in this model would therefore
>> require extending the lookup mechanism to allow additional disambiguation
>> (for example, associating role-switch instances with connector context).
>>
>> I want to make sure I clearly understand the intended modeling and whether
>> these USB role-switch framework implications are considered acceptable.
> 
> As far as I can see, you can register two usb-role-switches, one per
> the EUD path. then the connector will still be able to discover
> correct switch by following the chain from the connector. On the other
> hand, the EUD driver can use fwnode_usb_role_switch_get() passing the
> path's fwnode and find the next role-switch connected to the each of
> the EUD ports / paths.
> 

My earlier questions were primarily around a flattened ports representation.
I agree that modeling each EUD path as a distinct child node with its own
firmware node addresses those concerns cleanly.

For context, the existing EUD binding [1] models a single controller ↔
connector relationship using a flat top-level ports block. An earlier
attempt [2] to reinterpret that top-level structure to represent
multiple paths ran into DT ABI concerns, as it changed the meaning of
existing bindings.

Based on your example, my understanding is that the intended direction is
to keep the existing top-level `ports` semantics unchanged for backward
compatibility, and model multi-path hardware using explicit child nodes,
each representing one controller ↔ connector relationship and registering
a separate usb-role-switch instance.

Please let me know if this matches the intended direction.

For the purposes of the usb‑role‑switch discussion, the other feedback in
[2] around PHY handling is orthogonal and will be addressed in a follow‑up
revision.

Thanks,
Elson

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml?h=v7.0-rc5
[2] https://lore.kernel.org/all/20260126233830.2193816-2-elson.serrao@oss.qualcomm.com/

> Here I am assuming that EUD device structured in a way like:
> 
> eud {
>   compatible = "qcom,eud";
> 
>   path@0 {
>     ports {
>       port@0 {
>         endpoint {
>           remote-endpoint = <&usb_con_0_hs>;
>         };
>       };
>       port@1 {
>         endpoint {
>           remote-endpoint = <&usb0_hs>;
>         };
>       };
>     };
>   };
> 
>   path@1 {
>     ports {
>       port@0 {
>         endpoint {
>           remote-endpoint = <&usb_con_1_hs>;
>         };
>       };
>       port@1 {
>         endpoint {
>           remote-endpoint = <&usb1_hs>;
>         };
>       };
>     };
>   };
> 
> };
> 
