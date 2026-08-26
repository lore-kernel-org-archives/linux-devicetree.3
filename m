Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A973B7B6E
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 08:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787734544; cv=none; b=NfHrS+iG9PCD/PsN3yo5o78Z8Igvdipu7XS3UFgaGVUnObTYH94JXkqK+0x1vxj4JTtYSbxorzmiL9OaAzMe3Km4pqzjuzqxecz22OjlJC7177TYXFAJdD0A2ap57u+iUF3t6bg8ka/ZVVnUfP0PT7t2CJjP+OQjeIgaBA6kpGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787734544; c=relaxed/simple;
	bh=jUBTa5V6MiiUVTdfxxQl8hrk26/+6hHOA0EmnRZKEnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cXn6fZGj8GSfdtauuiy4aQVMCNuDvT2SOGE8wy/pdiHIX6BtVZt2y4aWkvuMTK2kzCyqsyW47m0p9I/mU3yWr3Ie7LGYfcIej6uikqm9pwcbp7O0R5qZl2jbrIMiic2c8RzuMjJb63cGahmNE3s6dqWX1T0ckru3+1bSoZb+I+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JfEde3iI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WEsuC35B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JfEde3iI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WEsuC35B"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6RuRL451445
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 08:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pKUcKffH721xQ4fFLpjIIdKOL7fRy3HSldMJQVWs+VE=; b=JfEde3iIbZIZDlYe
	ZZK4OVdfVxgKPFjRZA/Sb0kAYsLsLDcsjQH/4qPGuJHtya+JG4G3giWYTaCOI7FI
	bedlm8aHutSlyPyH+y5HntxzpZXCRpV6yl0RbX6GgmQsnZwde33+u0e6hyMd1LMz
	I2wFVLOqwh9eUQ7kpVPcB2oXmg93VCWhPv4xLamOzFotuT8faRtOUzYdGzFS66g0
	YdnQWMynD3sFrK887yy/saNzXqZcKNztNzncoP2gWmvQyH/EgrIjL5/yIpP4vDRC
	0DwB7tFfjjQUTeNKNEXtI9LGzL3+azZGufOfbk7WDbTtht9kea7UwfL7p9h7zVvu
	iIjfHQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r1gh8wf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 08:55:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93821883e26so1577985a.2
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 01:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787734541; x=1788339341; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pKUcKffH721xQ4fFLpjIIdKOL7fRy3HSldMJQVWs+VE=;
        b=WEsuC35B4rlfbHVMx5hnhHP/tNWG1V0vxlcVPI1bQYC+gyb9Eqr3uiXvwdooaOZCWB
         24fYze8HvvxW/Gk51FvqpT+/q4aFA/Ceseu8ttALkmF3hYvyjql/tIxyKAvEpJ9Ji3dN
         3ZylpjVeO/vtjBmhZg61TTu076uwmkZeJQPOipUT5WIkkNmV1E77NeOz+i4l1w7+k870
         StFNOcXJdNtejBqeY4Qgbz9CkVWnVn4wC+1EeltPX30Ui3dRoGLfVdGHMAjbCRQCKoKu
         jmD4hUN7Gxk80KEZqF4qo+Z7YYnZjGhQiGsAFM5vwsv6v/I9YcDuBbJOxqm9P1mgVr2j
         FVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787734541; x=1788339341;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pKUcKffH721xQ4fFLpjIIdKOL7fRy3HSldMJQVWs+VE=;
        b=LuaRdg9GpiPgOEBzmA+VbNfjCwl6SekioZ5Iu9RKWnI/V934QOyKQhGD9d8equ0HNr
         qs4zAhUsHXWMDjLf8L/8AuXctA31F0hRwApwPxoocLXPVHlBLlCxw2ldYtFNVWEXoR1s
         NuSRAhMphnNIey4m9g1nEEDYwO2sG7Q8rWrfb0OP0TjQAjyNGW9+KrqHN2QzVWcoqNBS
         duX9vCNREVxaZ/2mO627mQ7bPqxzF1wsn9P2zr1D5AAAqxFjz0ggFNGt+PD/kMuko7rC
         SFy2DD9+G1BDK0c/c5iU1/GnwRyNv+12y4QVG02IntYjYxlXYXYWZzbjn4PlZKXN9uUd
         1bkg==
X-Forwarded-Encrypted: i=1; AHgh+Rr8X9Ck7wYlyNX3IgH28KD9wAnExzcyRs9r18ukqEyikfF3zpyRSVeEaIh0AXoKWB2g3VFsmYZ6meAP@vger.kernel.org
X-Gm-Message-State: AFuF++lRzEMbt/FaMDWNS8+3A6Gkaji37Wa97xGeayRz4Byh6dc+/00U
	nuZCwbpf6ECZh4Zbs0AK6pjnRlU0PshqeuBigrwh+H6oFkDn+ndgQmiKQrrmhFo2I9zgMp63Nit
	u5D0wFqIWSeW3SOIovbfx5ik0Fh4dcoc1LfwRS3FXDwiH3DstB7Qez0HjfBXQM5Yg
X-Gm-Gg: AR+sD103ra6QVMuD1SZlNuk3hpfE6RpZK+q1Qin1WtHrzDchjlHRdQN0yBJQoLyyiUH
	x/kKyhPRwtoQsRzwj1wqtPVs/fBJE0JJ4AlI9IS2HGb8CVJkLmKx1IoKqbvwKFwwnyTFH/2uURs
	0L7UxixNI+Aw6g3nYlpV1t4924tLY3UhVS+ChhwZQ6xKO9s6gG6tV4mA5PFTvPQf+lngceNyCI2
	u0jTbPoe6MqTBY8uqc2U5ruDDlK0O6TusRQTPN8OEdE2fpPhNtWcuf84/0nNmBjJoz60NY1Wh/+
	nr/LSzhFDHBGebA8cNEePjt7gotB/GpH1M2ELfKb5DA2BPgGPCavbEDWG1qAA1Di5Vj2Rxizb9U
	TkXqbzOoELWQBM4wigf6oRxnx
X-Received: by 2002:a05:622a:1b88:b0:52d:f626:a46c with SMTP id d75a77b69052e-52e42414888mr35396971cf.4.1787734540959;
        Wed, 26 Aug 2026 01:55:40 -0700 (PDT)
X-Received: by 2002:a05:622a:1b88:b0:52d:f626:a46c with SMTP id d75a77b69052e-52e42414888mr35396681cf.4.1787734540513;
        Wed, 26 Aug 2026 01:55:40 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5deae179fsm4804376a12.26.2026.08.26.01.55.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 01:55:39 -0700 (PDT)
Message-ID: <5339f035-e89a-4a8d-a7c2-fc934fd41990@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 10:55:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Drop redundant qcom-rpmpd.h includes
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260826085323.539860-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260826085323.539860-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9Geubx69B0TgkJGmiYavcF0xZYdYcLSH
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=6a8eaa0d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=N-HENkHhRrIbFrF0-YsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA3MyBTYWx0ZWRfX673UWIG2i1Lo
 kFdF4PIj30KGY4zJHFyks+eXtFYsk94Vq9oKJgI6XFdVnOAe5ad/zHPyXYM1SOMKJXxPvUNAaoz
 lqjRuK1nbhE0OoTOrPlUJEacMABagDg=
X-Proofpoint-ORIG-GUID: 9Geubx69B0TgkJGmiYavcF0xZYdYcLSH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA3MyBTYWx0ZWRfX0WmYljhF4Gvq
 uN0VTjPJciznfxJEd5Gm85on53vrfhjqY4XW76C+J1uZWBS6lNUJIHCHf2H/cfVKHbbTh6/F7iW
 OQwnIRt8ARl69E4cmtNw9nPGkPumR3+6X9aY3SwSeL9WhUPGOymyORwTHWOI2lUwWKLnl90UzvS
 LmCTwgCb439RTdtFgRQy8+gKex1m787n4MGlCJoW1t4wDyYAb3AlmbFPFpbUarz507kd5QpEc4L
 YeZHMbPQgt1uf53TMC4hEsL3BfI77y34nsgsy3nRB0LrCvjZe/fXeX4lGG5qaTnxs8Ei1cwJSVM
 6quVRSB6bNWrneEJmm/2juQNd8bNRq9S4mKp5s2FX6iTujvmb+YtTqE+I6V95Jlomq0TUFVrKBq
 6R60LzDRhYmmfEBvYktGF54U6W+WOtNo3tif2DdKVKM4i06zKNLyopPOIaxlsHntSSlLZZZ9ijY
 KKVoJdYnYBvxrLJuBhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260073

On 8/26/26 10:53 AM, Shawn Guo wrote:
> qcom-rpmpd.h already includes qcom,rpmhpd.h via its own #include
> directive, so any DTS file including both headers carries a redundant
> include.  All affected files only reference RPMH_* constants (defined
> in qcom,rpmhpd.h) and none use RPMPD_* constants, so drop the
> superfluous qcom-rpmpd.h includes.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
