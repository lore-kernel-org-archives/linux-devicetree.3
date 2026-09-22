Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3FB55199E
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 15:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092226; cv=none; b=S9CFwxtF9OpR2YapktCz+OorO7HLm33lobRNIisAYgPGkhcclFwpQNItMKx/o86W40F5m1VdzaqoKWhIZo3mefFxnR3cKlag4q6OD2lktAiq7aN4WjRnO+tT7xIQgPR6zd9IcQMjgstmHbt+7AFsFpJNURp4YYLIDoKXk/MnokU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092226; c=relaxed/simple;
	bh=0oJvheW/djXhg8/qTziYpmXK2mHsppGLBw1ADVXJEV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KDo6h/Bq1uXtTyHpG5Z9QkM6SFYnJ20LnfhiwZmyVcae6iH9DufSH7qqJSDs9RHsBssFXyL51j3PMhRXlxEiP93/eppR7z1uYFGWHKXRfXVQcY5MITMbbOpLiklfAUsgk1q7vyYuc5CJm7YhYcw9u8/6unwPdaOwtG24wxw5Fds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VDdWO0Ic; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VE3w7XKs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VDdWO0Ic";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VE3w7XKs"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEisra3924349
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 15:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0oJvheW/djXhg8/qTziYpmXK2mHsppGLBw1ADVXJEV4=; b=VDdWO0Ic7hA9Za6O
	IHoZeJ3rjcok56tXS59Jzh4iBsDlb5khUy68C3lUw6A4snHF9AYKwx70JjQl55AP
	VC7CFoRFVjlwDX+5ydi4AwGC+06upSK+9742XEEcz9BnnhzuPsyIziW+YWYjW1FA
	DTNZkdIwUSj81AVMv1B8EBtxIp0FXJd3QFumDGRU0tqL7wKbL4dMJmCfr4RtC9lk
	QV0jwfDMR41WhSmz8xELL6oC8paFwVGrRM+KyJZG+Ms+dtVGg/vs+buJ1G/aYKJC
	kmuZjYcd/h7mdkjK543GR1rEARtsw70ouyMgUIQGuwOtn4NaOEbqn7Tev30aZWfT
	afkhxw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guuec0err-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 15:50:24 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c9ea608ed0so69123e0c.3
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790092224; x=1790697024; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0oJvheW/djXhg8/qTziYpmXK2mHsppGLBw1ADVXJEV4=;
        b=VE3w7XKsjFuljv+iJWMeMD9wzhDJD+spPkf1hJCkxp6wXQJwdTWMtXunSVCMpOti+K
         8DoiATDRggO+Kls7/BmYrPIMaSOw+DPogvuDKQqW9rVzOU+38oJ+MVEjA3KPXWpWoPKb
         A3yjJevurvBTwpyNrVm+cQ371XLnRK3uLCDwcQvVYsyGK4m4q9htT4zdDeRqSUiMj9h1
         NczgYqKOQX7t/xabrILptslBMxtLOfPzXuR/63tgho7Gybq1EL9mfMsP3zHQpQ5Hr7Tv
         f9EahACGiINwgALyMbzNNIyF3+AWebnPKebxAzKDsNcLghEqdNlH4xWa2G5JaSSU5t5l
         XwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092224; x=1790697024;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0oJvheW/djXhg8/qTziYpmXK2mHsppGLBw1ADVXJEV4=;
        b=aA2Cokwyt43ToWJ/iDHsohlvVO1/nxLzZXfAVivrIdJ0oMkvczx95hMI4CHmRA17Lc
         ZhUVYfZ202R3Ru4Wm8Ykqy+3ovfaHI0BL2plx/SahDv7x5vIbmiyHtg2l1amKeH+bm5+
         SkllUBGc/YH2I1PZMChwIoQAZVuzxHmo9zLbxzdk1EwDgv32+GXNHObOgPCyL2hRBHXq
         g1Lr2CnXHmhlO9HXmX6n2SlYWuP9MyA0ENeFrjvi9Oh0WdoXHurNpuzcVPR/30znDUAO
         EfhzTu4htEHGRC+cXCKkFU6PjiXAlJlyRWCj2NDOZieNcKtSvQ4Qdp299JyKGmHAKn2Q
         W3fQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAyzjfz/Pk69DL4mFsG7zKEfZbYtTl/qZDn6cwdUB9OGp2SngsCgte8I/lSSojgWmlyfhNDfglYgsc@vger.kernel.org
X-Gm-Message-State: AFuF++mUgac2M1UFQVRr2vSRaLqsiuqw/HxL5iaq/PL9ebTolVXqgKom
	IcOE9/V7T+MxiCz3jPoMpEY05/m2Y+SJk7zsw0uvc95yWZUhkRPufrNL2cARDqeEx++SpPdXHBa
	fi2IgkH8sXgfen5cY+Y7bGs0iT4CCEauECW2cfvBkvGP01xP965mFjicjxDn2BsF9
X-Gm-Gg: AYBFou3yuBDviuosvxSZukUEoDH8ExHDmp8G7JSnTlcDUVGoe6Mj86N3xBVRNflIJPO
	FbEDk3wARR15Zsvj01Mp2Oxnjl2QpMUHFmbx9r7Yq1n76BNIfzGqWpVTUb1aHT9KY6Jgv0YDa3X
	Duw2FiPsQrEzMCwInNr6s4F3z9H9+a1EzP3CyBVNAwnL6JAmLDvwqj0uCHBNd7U4Ryw4MVAOS+0
	7XqyouI06t8sgtKIPdZZjVr5ah0zMayx4q0TOm9jWhgP2bqW88g0dXurzuFBiJ83wOtU5G3LVeU
	myCgK57VbNxX5mv5Vi3Ap6uCtf2Lo6C6iATg0+lvLxifOfqhj1dW4MB8emqFFKAp/wVTxb0mYFO
	woAPLZ96DMoDMYh3hdG7Ylw==
X-Received: by 2002:a05:6123:585:10b0:5c6:829a:c369 with SMTP id 71dfb90a1353d-5c9b8b29c32mr7575980e0c.2.1790092223925;
        Tue, 22 Sep 2026 08:50:23 -0700 (PDT)
X-Received: by 2002:a05:6123:585:10b0:5c6:829a:c369 with SMTP id 71dfb90a1353d-5c9b8b29c32mr7575932e0c.2.1790092223502;
        Tue, 22 Sep 2026 08:50:23 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa44d21fbsm1423207a12.5.2026.09.22.08.50.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:50:22 -0700 (PDT)
Message-ID: <3ae1124a-e070-4641-8a25-42cde4426f44@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 17:50:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra-iqs-som: Correct PM8150 L10
 voltage range
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
References: <20260922-fix_l10_max-v1-1-d0c99f063bf4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-fix_l10_max-v1-1-d0c99f063bf4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfX3/+86dFC2Qzm
 OP+YNinsdAllfyAo/6VXvX0SA068yJ8e7jlGNit8ci/VRua8D/AKdc9azwlgIzOzBz4JxoKMn/M
 AWP4+SoB7YzubVuijzpidv51ZmDWTep5K0BOpo9307k5CPallufnTDOplwggMstjw3CCpOtgoUs
 DCPVuGsBNOU3a2/DW8eKchyCNYUOr/Cep0NAZ3m3PdgUupukdBkQtwWVoXIT60KpvTVwDK7hKKX
 4BxbyZrpxQOCJlyTLuSz4yuH33dpCb+/40dpWnB2gaPv+oSNetYMsX/L8TMtr/3uz39v9WjzmyD
 DvKodXOSUxWlvs5xvdDCysshLLkw9igBpSGNwuOS5AqrO7NuZ/FdeNxLv8tAFkplIRPnpBR92WK
 4Nt1yBrZS69qDP89B8J4lBlPXeziUoRC/kTL0wBQ2ZNCdIikuFhzYucqK46vQfg5IThi7BOdJr7
 xh5AoJFmVI3cBqYDWzA==
X-Authority-Analysis: v=2.4 cv=VKdIDNPX c=1 sm=1 tr=0 ts=6ab2a3c0 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=vs6MQZ_DPklQwkS87yAA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: Inxf0DSkq7leYFgtjXCDSzviWxc_8IIn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfX6DtHdBh6iCeW
 jKiYIphCEmf5/XZMBqEB10fe6UVw2TM6y1RZLtZPUWXmgtcJCjsfxlPbxqgPqG8K23Qfg5XV7eO
 KUnqAfB8nptHemxfeu9oPfA/QsU17Cs=
X-Proofpoint-ORIG-GUID: Inxf0DSkq7leYFgtjXCDSzviWxc_8IIn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220231

On 9/22/26 2:39 PM, Rakesh Kota wrote:
> Update the PM8150 L10 regulator maximum voltage from 3.544 V to
> 3.3 V, matching the supported voltage range for the Shikra IQS SoM.

This is a good start, but please mention explicitly what
constitutes that range - is it e.g. because there are
peripherals on that rail that can only sustain 3v3?

Konrad
