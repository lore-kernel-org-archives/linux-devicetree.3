Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA6730DEA6
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818625; cv=none; b=Kf7+goCUyVa/WS/xqRvxT7EtBBvl9CiziEHYHQIrrNoCpDDejwcnsmbAZ1efOqZfv3gIyS6az05i/fqeYqytBJnB6lLEo75R2ArPqp5szGfgR5AKn64piwYJcWH8hTLOLmf9UTG2NmrhZrilUD6tqOLu3rRIbbvupxMcpnva2fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818625; c=relaxed/simple;
	bh=wFGnrgMxwXXzDsy//oXKrAKdhwnr6sL+OU/iMZYbOXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dhObkssMkAzFavYQ9e3qB8WLodCeDv9ROaH54gaGd/BH5wFvas6HeCBt3Nn7mT4bAiKPtfTlj9t15JD3bCFOwL0vleT6PgXsP///EB7grfvtQKXMqF7Ap/dLYD2BaIKeNG1aO5mPk3JQaSYhcQHFusWy+bqpF11PQghnoYIqFrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DZ+ApL/p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J3J9mdgk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DZ+ApL/p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J3J9mdgk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CBxwlP3364428
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:23:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8w2ECDVEZY7dWIZB+t4QsN90MTNAeJUXrKgTeEQYkeM=; b=DZ+ApL/p4rBoUsIL
	uj6PyeeMAGaV38C/zlrSkMjRp9Bvi3dxaZpQy2dI+PwGfiikwNYQa0dacIlahiDb
	Mn+GeIEdHejIJbyGUdb/8nR8QNP/1lPI973OpIS775k5c1UC3gLuD65AAbDBxZUm
	bIBC4Prm7tUAW20LM6cMHZG3HopynMgJVJEuUF00ncZyh01dHMF/9HEmA+52yCvB
	avS0ApT1fgFXGC8ltxeY8WhvGbpxpnsSpfVkdgKRiSNmR8G5K9L0c1yHWS3zBQC7
	0xVg/M0gDNJTJGfnmKXYhc7cnqwEkWCGd5Ky/MFZ+2fty+UbHM9oDXSJMswfeYTR
	94YdLw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wdr9dkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:23:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e661ce1dcso22038485a.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818622; x=1792423422; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8w2ECDVEZY7dWIZB+t4QsN90MTNAeJUXrKgTeEQYkeM=;
        b=J3J9mdgkqlRlnu664r9TCLXu7p1i4TrR00dVOwOVT1/Us3CTjxg0MJEmYxglUt9zHx
         cbiKwC0yqV1zRp8SWeNFFF9gbfqZ5tPkmOPvGK0N38nOMbMOJxmBN4PpyZds/kr7Evr0
         Znnpg0iylccaYzPdiZXoNxNERqgpTITNYb5aWtIhLfN0w4ctBXdXjIIniqaJ8I/tbS7T
         4CAkQHzOfJykW2Fn9HRJX6wx7q0i/9Uma6Fhl1ii/G2PntP7tbl56CJwMw8BY298tWBw
         F9bsm/M4tvw1EN/WC6VTqeiBvhAwE5kt50KW+iY2YrCPAK9+3dUtMlMD+OMnaBQyWPE3
         0nYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818622; x=1792423422;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8w2ECDVEZY7dWIZB+t4QsN90MTNAeJUXrKgTeEQYkeM=;
        b=o7EsnL+eZjlqHl/MH81s5ZmhNjx9H9cIqmfGZI6KAgrczbH/YuhGCOpl+Cw3Os+0iy
         weBjz7VErIIkAwbw+dYDOxIB0GXcZr99pymb8rp4Rbk2gBhIvPD55PI3DY3KcC4bU++h
         WBP1lzJ3O4UarMQKJowjrQfds5cfVgGfzFc7BkX2LXQKSzNcFkphnCSKHDv75zEQpVsa
         loXDIzRV9mb9WDysbhL3MlCejsQmQiHfghMmeR51Zirf3qjGHU2Z/vAqHReJ0v9LI5nb
         8PYCM20N9Zoswr8dzTtPDJKpqa5wauNgYAhFaRTx1JOPJwzck1Ayop293N8Ik8tjYGSH
         5r+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxtPOQMFivTLYYnKSNBLbOgIuoLeFnoD9pk0SthtyxhxQrdQP/Lq7k59WjmdDvXsm1DXs6DROgp2yi/@vger.kernel.org
X-Gm-Message-State: AFq9FYIB0ylei6EJG+thwfsbohUFkDeiqMtBENJMaA4rdXV6NZXXiUyn
	Ap9+MekSt3RdHIuVQm+o0lhyA52R6ADGZ8NqGIZYXudNoh/+E+D0aMNlgncdjS4Q6VKzQmrHHim
	gHTeCyUqaosh9Mf+Kl+83pQnIK/MFOydLb0uqnaB6mJvTp1zulU51Hkr0DThGiGxD
X-Gm-Gg: AYBFou3/lJ/SwDY3XZxsy4OIKU1gpvYgiG0DCmGs7nUGmZFkZ803m4R0bRxy5F+K2uz
	eHQwzuW13W891XK0jAt+CvNbb7pDafwEKy4f6aKMfv6TzvsWOrkCpjZbmFTEj3hpXZ7QThw3gqM
	CNjWQ8sCVEqFCTGe32fTOq8g08oK1IT8faBRTLJvrHlEG2QWHGj45m9Z7xao7j2pRbXfMwrgNXH
	KK6LOLK5qwVKCeZFNfZurRjsB9VXOlK7iP21FA/JEKAr/NH2nRgsHfDDXJU3i/3POOOe2WbbAfP
	QPnUkWYIQZpQ+8bRpranK6b/fMG9ehYD6dGzbe/s90xubJEFmGGKv5LHgbw5nO5eg+W7LbG4CTC
	1ub2NBVxcHShi65D3XW99dA==
X-Received: by 2002:a05:620a:3725:b0:939:94c4:b799 with SMTP id af79cd13be357-93ebd25945cmr1886094385a.5.1791818622205;
        Mon, 12 Oct 2026 08:23:42 -0700 (PDT)
X-Received: by 2002:a05:620a:3725:b0:939:94c4:b799 with SMTP id af79cd13be357-93ebd25945cmr1886087385a.5.1791818621624;
        Mon, 12 Oct 2026 08:23:41 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3527f0295asm115247166b.72.2026.10.12.08.23.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:23:40 -0700 (PDT)
Message-ID: <08bb76dd-6516-41b7-be5e-a67513997ad1@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:23:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/38] arm: dts: qcom: apq8064: Add newline between
 subnodes
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <b86dabaeeea3672a790fb5e8378f829bd616de78.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b86dabaeeea3672a790fb5e8378f829bd616de78.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX/uYSS5bX5NTQ
 S0tn60VzUyM+Cdz5CjN/RJPt+Gl12SUHsqv1z2MN1rOjpoa2IxAIbfWeyVbDV3J0widwTrbJ3VH
 bnqkhcZ7JLzNspbeATdn068TwnW2g2pe8KUCjOPvaNOk8YM6jUmaxHeYODjl/1dJyZxAOs5WSfp
 QXJTS6Ia/1QfgxAOwORfANdTgVq+cp/bn8IlT+MNkU6R5Fqd3xBzAE/wszf6CRTmUpfF3HbXBYm
 mWWV2LaVNksCvNBckad6+k8p03dT4DW8DSH5qRjsuv8qGjyUnBz7Tg/3BfDc4Hs1UC6lI0N8rQY
 ljCU9fDfuyV/JMpxMZwMTmC47jFJVo7YJ1UBbk82l58FMkolAa5haFW9PTstp+gVUDrxd4v9Vn8
 GFFGOfmtBehRZfdq4f5fH0+OelL/soIPcSats6CH/MaM6gnrC9PsfBmwqgtS2ZTv0XsBiO4QZNo
 uz2S8E+tIjJCstGTgOg==
X-Authority-Analysis: v=2.4 cv=SvAFe/O0 c=1 sm=1 tr=0 ts=6accfb7f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=BSc1TauVmqxuE-eLDIIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX9aK3BtyNhxUr
 hsgAwLn7Vir0oFUP41CgOL0KM9wIs1h1n0WcHEd5LW9HNNLsCUrG+R1eOYRLSalFOLbRW4Xj4o0
 VnQ0wGlqLST70LD4snRYBm+Dib41D9Y=
X-Proofpoint-ORIG-GUID: irBXSTu1pRRokpu620Bp4jMj3Rt24GaW
X-Proofpoint-GUID: irBXSTu1pRRokpu620Bp4jMj3Rt24GaW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There should be a newline (and only one) between subnodes. Found/fixed
> with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

There's some 'remove newlines' in there but the granularity on these
patches is already more than enough, so I don't mind!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
