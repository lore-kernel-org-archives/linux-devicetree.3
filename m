Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D3F47CA99
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 13:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787078; cv=none; b=dAlsw/2+769PJI3akIHK1igQyJt/wOSuPXRB6/e8YHw4iulqxSvVnZdQDY1Q/fyjv0DMjq+LJ8c8PoJudOSU2sACfYoUcO+sbhiRE49vvYlnMUaI5UxtQ/zNHMwJWbBgR38IxitCFnqKpU/jnaoaAtwJH29dNI3x3mTncwIrDpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787078; c=relaxed/simple;
	bh=LsKPSrSI05tc4shyDaPm9jPnbdrxcAeeHs5aSIQxobQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U0WyDtbFJ2p+ktmwbm+aWkd4y7D1wR6T2xamB60n4FnnmZWG8uGUedFmXl/rGdAQldK2k2se8AeMlSVxsGVXfYxzqyu3Te6cP6709ZggOrJJhYTHZ2j6r6OtdbPMw7WvA+eirAPCigygf5oFFGaAghoYAdAT3X3vhVaNA0ZzVDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nba1SI4O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dzFtLknQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nba1SI4O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dzFtLknQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687Amq6h2652031
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 13:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cv8iJBY4yRE1MEIJdzu8sg2CJmzOwiug90y4Wu/gBog=; b=nba1SI4Of8u2HXcj
	42GXLsEiahTBXSStCf/xp7kjPpEexL541KdjMrtG6IOPX/eqBsjTsgwU2gyxypKq
	UL+foWmbM1m8MBAJ/8RwkMud9gwIWXeQ+gSYb50GuQbhmCuI1NJXt6uc1dqJlK21
	ekjBBqo5vu6ELKq2TzR623ynEzIli0WzsvX126mo7NQc1S/ZAYH0s5UL4kggaN6Z
	S5DAZKM2o6TOlxvHVUzbYF02lXsi97y5AfWZ3uCW6+84sZAuxV9HNRBNuC7uzWBc
	nlFS1wLZex8W7QITEXNNXtDdHBzuovFaXZcfD2k2GToa55PoeBa3pi8z7WcbJS31
	Lg/D9w==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtty0suk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 13:17:51 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-785827e6073so401682137.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 06:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788787070; x=1789391870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cv8iJBY4yRE1MEIJdzu8sg2CJmzOwiug90y4Wu/gBog=;
        b=dzFtLknQsccb6xshoOPwnZ6lzxchCeg8gL67DJoQ+hnmI6tGUSpCHLAGn06xUchbxl
         BINQJ8OZeNm4J5XYlle7zSW27Nu2XazcU9A91+vE1ve7+NqFl2bMrXN6LSfzEA8aKW7+
         oUWJwHiXqhd6cyNrOtnsaVtzFm/fuMC25g2zquzEgle1f44fQNR4Gf1HODDVhmhGHhUg
         shArmMmi4JkvrPYzcJNTK6lZIlpyMzJpYUuvFnKej353Ed82vBwfLKMq/w6uVhq2hBDi
         uBuzKgtr5QVDpXCD4ulbYCB9FzeTul8FeqjCaYr4UNYuoZJUMjs/QzZCfbGOcqFwkih3
         /A4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787070; x=1789391870;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cv8iJBY4yRE1MEIJdzu8sg2CJmzOwiug90y4Wu/gBog=;
        b=A87sBLdqb5O5yGZm7wijzMVFEKq/LXl9U8bETfZ+RCow76C7/8bkXyusCXrgQ0hRZT
         rws3yZq/ek74UhH7MHkYJzDJKBfx6iBn+Dsx6OKGpEVNaPWCrxT8rr3yTErOoEwJIk8a
         0G/hNAG9laQdTedMPnMoJu7vILOHvvR6Z6kQdBd4+rDR8hTZQmf+9EZEqyJtJGPP3K0m
         y2EuhITeoMl0zjhLuzMG9EPHp5xjx8oqIqLgyQJBXRRs66zxXcge8mPAD+Xkx8w0Bl7t
         XMoSnAuSo7sCJoIsCAmXZ2itgPyzgThLfcDDIZvZtqtWMTdeLI1EKok/IEPghhjqzrDO
         Dkkw==
X-Gm-Message-State: AFuF++lVVxG+yUFQH7lF5jNEGlIJHM8Xk2bNRNc+mf2mPddi5o0Q8Nb1
	sLVS2ud822Q17LFEtkc74mNU9bzP/wgfTj5gcNWqvIQ9cNZbGBAldywiPcet6U+r+3piZIpUJmA
	+8E5MDcuEhrJLgvuO/jXZdqKs51fbZUb6+jN+3cHt7/yXg8ILIMvKg63UM9uXf1VX
X-Gm-Gg: AYBFou3eB/SNF3/Mu9MJqlhlSYh2yGQQlMhq9QbAChGyyQsHqksc5yHxyC6JebXSsf3
	CVh6TAJ2lrNQN2eAhZc/OI27mAv7CQ8SOgVN/nLuXoGoB8nfKO795U8ifRbjXivX+SUuhrjx2X9
	V7hrSoe815wV7uqQle/mj9nBZAPJhPkVjcIJiuDWRDxhmR/UReYldHkCe7uHqMoAXchTRBAYvyu
	3SE08FD+VotWqEeQAxBYhSjEvUqTfWaUaxMxxEzrlSLbhZoi2EO8golWggGQ39VLS8/ANOCg8+m
	BqoHdyeMBM7xXWZ5ejfReCXtOY80fJPEeeBVEJl//AG6UqdaNdpq0rjWlVUsH5XGbxyZasf3ybX
	CEIfyiznwJal2Kq+KOQFW8iSfGKUr
X-Received: by 2002:a05:6102:292b:b0:782:e19d:6f39 with SMTP id ada2fe7eead31-78a4a483c93mr6716236137.0.1788787070401;
        Mon, 07 Sep 2026 06:17:50 -0700 (PDT)
X-Received: by 2002:a05:6102:292b:b0:782:e19d:6f39 with SMTP id ada2fe7eead31-78a4a483c93mr6716221137.0.1788787069974;
        Mon, 07 Sep 2026 06:17:49 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee7febb4sm428999765e9.14.2026.09.07.06.17.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 06:17:49 -0700 (PDT)
Message-ID: <907b3c02-5487-4abe-9e4c-3053ab92cb7c@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 15:17:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] drm/msm/hdmi_phy: Cleanup after
 msm_hdmi_phy_resource_enable() failure
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        conor+dt@kernel.org, robh@kernel.org
References: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-0-b097cf1eac77@oss.qualcomm.com>
 <20260907-drm-msm-hdmi-fixes-before-eliza-v2-1-b097cf1eac77@oss.qualcomm.com>
 <20260907130633.E673D1F00A3A@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260907130633.E673D1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QNBYgALL c=1 sm=1 tr=0 ts=6a9eb97f cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=9ZkQsALANqwWZhioCQMA:9 a=QEXdDO2ut3YA:10 a=arBHhYMabMMA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: aaxEIUOmxdekJyrlKcW7bjrMW_M6uPq5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0NyBTYWx0ZWRfX/J5BgvQb338l
 xYsWMkEgoP/qq4b2FBsyS+zCVs3b6ErpPb74x9PUWGJ0lfF0a1HFgjLKVHHpIQT3oWiv/U1JeTH
 gKqP8cNGC5P/qaV/i3Cs9lJDoPF3w/M=
X-Proofpoint-GUID: aaxEIUOmxdekJyrlKcW7bjrMW_M6uPq5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0NyBTYWx0ZWRfX9ISfwBebnHft
 BU01olZTnr1QJ2gNIvDmuuwTshYxECq62/+2CsxxDYckIiwo1yL8i2X+xNImqhODLslGPXnwjsX
 IhRfFFbdbLuzhIPvdv2bMzF+8R/xFtdSid3k6ySvrYuEc0Vut7NinmzOAUn+w/28RH7IsNv8vT7
 W15E+lt1I6GmASqRpyqEfKVUkbXrzC+X5GREAxlrj5Jcm2eO+pSZPSiJXMJDNoQjsbKROiY43TK
 LFvdNOm6nwgMYELQWdUj17zDVKuIi6ZzDc0RDLjPOGx+ZbFqvyd/+UrMW7VLMd2Y96mvslKGhF5
 X04Ekx/EUzQmm2AG2kYmuA22/q+5Itn/fh8nVWnvz015OPIzZrb5L23xo82wxOvDhTwsnG5IqvO
 uUeHuxFlppohIbFmBUpTIK0fflTH6nkGvLoBf3S/EDMMnr5zXgs8XLZkH3snVCbjH6uLKjSSNmU
 OY1u+KIsXw+ON5/UUHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070147

On 07/09/2026 15:06, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Missing regulator disable on the newly added clock enablement error path.
> --
> 

ack

Best regards,
Krzysztof
