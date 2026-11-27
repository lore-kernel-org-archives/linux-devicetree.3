Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777696;
	b=3NO4p+SN+Pu42+fldl331hPiOAzGW/cH8bPQd6chw9f636ICJnz3kRaNEdArKgTBb7eY
	 suhz/kz+8lnLHpR0lfC+nKLjs2eOHsxS0uJGAEX6h7NRoAF7/p0K3fqBedfxvtraSBqTi
	 /EPaVpihpLHVpgNXCdbliNmLdcYmNx1po4kwTmDCZGmSgH4phbICIAQTkHB1igTtpeWoY
	 BrWsoNkjCEhcgURUNMk5zqDClrt+5se/2Fay+W47Nz8/FMVsj8Yma/GCSfM5iMP+6YuRp
	 v+FXGvJcpoDSHvdJ9hfaUoadOK49G2xAYZ8f9xsvlICPydupy4mvBt2Je0r3ZzWlkPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777696;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=t2/83h8lh00oTjIIn4PMP2G9iHMfmfKr4RseRlVPFLc=;
	b=VjEc+liw0+efKQlA+CQjATp+4yPD/mSdg0a8RbpRPzBxjfrElguyM64h9yegngWTNx7i
	 Hs3FLEteh8O4EEQuC9CClJROFBcp2QqhL/lBgoy2SI7NWQgoDRuNRuxKDa+OfHacSWM9Q
	 Xs4/Vg1iO83ik8+/au5L1aX4NeA3JwdPi3QJYZfzZvFqLDimIvu6GMmjyaMwoOFz/TCnv
	 k9qaETCipth4GwBuiGZFpTmifO6wSDrDq+AO9ao9v/c2I8E5VjqmE/YTE7zZogQ90ngk1
	 HIH1tAMHLAqeljc3/lf3SvUhdIuosi0AV1C5lLAWlirG85zjzsO9gB2K2BRfLCc/3JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Mk/NcUkn";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Re2JXt87;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E58606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45E58606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mk/NcUkn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Re2JXt87
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApWvh1685569
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t2/83h8lh00oTjIIn4PMP2G9iHMfmfKr4RseRlVPFLc=; b=Mk/NcUknFvbAJciL
	KVFNmC/Sl9MXhBr3LJIDQahz1Iu386KoV8sgMhHA5KCReAgsWCAbUwdtWuStcuAU
	joCUFw6ejUyDz64zjMbtIUSOCSG1nneRZmKL9jEM48XOUFu1OCS9WugRU/BpOqda
	6NZr2OnVzJXBpvYqKvTBWyAi40cED5Ffgm4CD5SNnALivZc9dcF/xLAL1gKsPFEz
	L5TOHoYw7BKhresTCxqo+Dz3MD34c2FnVXxXy4pQi9+bI52Yc229D75c75YFL7uO
	bYzkTugdgh3kHyIxrY2cm6gnGboFIkGqZB2riylCLNOg6ftRNlJebdQ9gwTdBH1u
	T+Lc+w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j756k8y1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:08:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55d2d54356fso22327501cf.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 03:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795777694; x=1796382494; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t2/83h8lh00oTjIIn4PMP2G9iHMfmfKr4RseRlVPFLc=;
        b=Re2JXt87T04yN5fFPGcM70S8bRHw4L6eJNEEtbQ7Zf6J+N+i/baeIppkH0tUQZx2T1
         qmgwf93pC6Cqp0Ogw5T7hRiDDYIUSsZyZaSJYk1TOJPGusVNTyqI4CK0hOgvAalvjFW1
         ttHlT5yiBWwuhzyRBsa+OVRAQneb9OgNVO5axkG5XrIDatssHhMl4i0moa4tXah7Z6bi
         ZCp1/C4x+V5nv0IQ8H5oSaMnQMmUakGk5re2HtS65xQHo8OgWqHg1WVx0vOc4I4OaXYd
         BNF5ASesCeysbtzX9GvS8PSYT+jPAxQZBNtfw14uz/ma46XmkBFzVkf1BHAHbaX/Lg0O
         3SfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795777694; x=1796382494;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t2/83h8lh00oTjIIn4PMP2G9iHMfmfKr4RseRlVPFLc=;
        b=awKGjaHdcVAi2Rrfi5Ihk2+4ZM/a3iF3TeFp2JgnFmkHwjWi4MR4kx/bXU6W/egT4F
         hi0FDgN3g3CmjK/lNVnMcMEOGC49yWIyuOFgh/ov5E4Ov91FiD29Nw9C0eWSUaRGzk3/
         fUJbqJtdy9VIYxGp8fvF9KXqJVJCCRMFePmTyHKTnzz/qdvuUwqsh+YxL6zQAgVJwmFt
         1M64S++9rU/mej9RaOMvQJJ9FJ/NAdAgzVKv4kVYgew0S4/BnCPpVcAR0atCFsuKJ6BL
         2W8ddRGU8ExrZ4qhxcxjxTp6w297+HOylvNDdAtNiFSusVfC2VwL6vEU+W1oVxEmcfsB
         o4lA==
X-Forwarded-Encrypted: i=1; AL+hErGxQSi+2h8sF84b2z09OEokCgzupxya0Fke3eA4AuTsIZTa8AERgzgbBMXqQ19jF72o9MXK8q5KjxcH@vger.kernel.org
X-Gm-Message-State: APuU4Z84LJqk8+c/96EA5FW9FLxW3eBysCXndvzQKBKCtY+RKpe9/pWb
	02MAVu1xfkE9ig7L5QGpMTjddcZ7u1UfT3LNu840aq9rb810O1DkhSUCzE7ELhJ0ncFErJjmxs3
	v7MHeSppBXcCGXMsuNEgEK4XG/6JZQnfvoVKNxE6muEa9eo+Va1Gf1CEK1t3aX/T1
X-Gm-Gg: AZFdTZcVqyUDuGdqn0AqsmBlB1Rl/tPkJlNvrzUau4bIP3ObW5ikWvTaamjkvJbtGG+
	zViqSVmr8qGI+Jzs+JP/wFK1qfxCO+k24PFVKprVoWcY9TI89E5pLatFExDi73xRP1Vg32I3h8o
	4kzFvINisH1SZ1ERfxqq/DtA8dD2BYlE0r1tlKtMtaF7Btt5CQ1B91QMTdB8KVhLYDGFkf7Icmr
	7D/8dz+lPye87wKtOJQc/fRYLxtYJck1BBUWH3aV7dRbGagJSp9G5SgaKyk6p9dJKrDo2ClxRn1
	E4JKoR3lUtZdcLKPBXy4ZyqrMuutRYl3iWv4Lz1+V7ZRNBEVqgWm9q+MR/noG23Ad0U8KQiyMRL
	B0s7ElYmdxzgValmZIL0dAoOTCqaIdxPakCcA+6ttfO38z2jovO3+WcU4bpwxw+Bqvhocx6I=
X-Received: by 2002:a05:620a:5632:b0:949:a1be:c22a with SMTP id af79cd13be357-949ba9dfabamr3948533385a.3.1795777694369;
        Fri, 27 Nov 2026 03:08:14 -0800 (PST)
X-Received: by 2002:a05:620a:5632:b0:949:a1be:c22a with SMTP id af79cd13be357-949ba9dfabamr3948530485a.3.1795777693840;
        Fri, 27 Nov 2026 03:08:13 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afdf022sm849897666b.67.2026.11.27.03.08.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:08:13 -0800 (PST)
Message-ID: <1559dc51-b31c-48b2-8517-870b22cf81b9@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:08:11 +0100
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
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8650-valve-deckard: set BOB2 as
 always-on
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261125-topic-sm8650-deckard-tcpm-v1-0-4af33e89ea9e@linaro.org>
 <20261125-topic-sm8650-deckard-tcpm-v1-2-4af33e89ea9e@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261125-topic-sm8650-deckard-tcpm-v1-2-4af33e89ea9e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NCBTYWx0ZWRfX+PPu1gQtK0bj
 5EIFaG+Q5FprNnfe5Sd+F77B2xaACNu3/8m6X17tUaRSLNOz2CrqnoxhkeCDAuZfqqQsXX/0uvw
 Q/z0JxQqk/nunR/cc8QmYiXxK/pC9zomlXAs5QhUXXiuMJna0fSQYk1fLT8Dz0xdx0aX+2JBHzX
 et3FPV+VT+QLVLMNmzXdFgyMoRr9TY1PV++kGemzaXlgb+KPDlpIdlmSxF0erq2bO61GkhsnJg3
 CtQ/rCl2bI75DT7PvVoXexIpJEYizDckr19Ub/kyxVRJf+Z36USZepdbYkzGcmP5eKKR4vJEet2
 dlQeT+Rtf/YbIVhScebuo4ZC57385gIEHss0x8Y7zaLKQWG7XFzHZl2kRF5x7LeDZQH7986l0LA
 C438IcoEOufa52ELZL2w8DYv03k2iF+rqmbPQne+pYAAQcf4wvEHNKHw0h2Lg1XMliKmsT1QyQl
 XipmltkMYqF6yFjHc3A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NCBTYWx0ZWRfX+KnXYzn2LBTn
 LykENH7/zTMARUP10T1/qXXloZW6//qm1tB3HoH7Hrch/E0YQQlsvjyaw8RvH7zX34EbCWXHzsh
 428Oot3IkBjzErG1ZCM+Gx16qzl/uoE=
X-Authority-Analysis: v=2.4 cv=ebWo7LEH c=1 sm=1 tr=0 ts=6b09649f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=56Lg4We7l9Odd2N01V4A:9 a=QEXdDO2ut3YA:10
 a=3Q3lADbaBCgA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 81MzzJ_6t_ZeI6zynRwsMZtCkY-PZOJn
X-Proofpoint-ORIG-GUID: 81MzzJ_6t_ZeI6zynRwsMZtCkY-PZOJn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270044

On 11/25/26 12:54 PM, Neil Armstrong wrote:
> The BOB2 regulator powers some always-on USB components, keep
> it always-on and expect it to be enabled on boot.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
