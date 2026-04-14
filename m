Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92A23E717F
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 14:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776175946; cv=none; b=NM0NbQLnS14CkKF4Eh1ZxYEt+hVK0MV5CydPGOUM0wAOWHDTMGsiqfJcAzRAz/Lrsnc6+6m7Dy3xRfkXJ0tA3p1F9aUZqgovi0j8Xl9yobEgI5Zet+RkEXGEDAkWJuJQ4bQ3GQUwEVxMKmeBy6Z0/KJ/wkUvMzxZcjipFleI84o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776175946; c=relaxed/simple;
	bh=o3EVBk8mY+1bKgUj0lLzcwLTpgKFyLa2LJ1AJZKVGIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y/XnLxkX9YiekSBWP0z8oepIyU1IVVvex7NuEJV5+P5U2GlsQ/54BCYgqTlFuBb9XXn7yz6HbybTq2MGb6iXlSoYPrNWOKIt8XqI96RWdCKYOuo3Z6CFL4cjdXT5nHdOplLYzl5OUs7/pR/V87A/u5PSEy+CHzsP7a2CHGuniG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=go8QWPNO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SC6eJfWx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="go8QWPNO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SC6eJfWx"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBPv95362035
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 14:12:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ToFpVHJZk/lUK9UX1+SEAdhDulwgtbUtp6ILgHqAeZ4=; b=go8QWPNOH6CjlA7R
	IcndhXDMKBYnqA00x224TTRgRz0xrvXM8dsPV2vBEu0KLrD0YXPSptEdC/+inPoU
	yDdn8x7o2+wvebgEzQ5SwqtSpSqoSYdg3md0kHEooakQvON4eDKkhr9pBr0hAkhj
	gfUDyAw8EMgIkyjEhdqvQfuFPXO56mGntYePCP6MIM9UEy/SVFDob2o/LHXapIIF
	28/6yWRSTASvH7AwPXxqsMgUBC+QF5SGLtQi/JQnWQ9ZdOfyVIuoNeX7ficrFKL4
	9+aY0K/noHFqZXh7PfGRA93RiXmOCo5tRQXab3slEjjDU3Qk9+FlX7dbelrh3Ptw
	cbauSw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870u1bn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 14:12:24 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56e072ac05bso458756e0c.1
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 07:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776175944; x=1776780744; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ToFpVHJZk/lUK9UX1+SEAdhDulwgtbUtp6ILgHqAeZ4=;
        b=SC6eJfWxfsAa1C71EwP3l1Bu7+jt5BNk7VX2yAy77B7R/5bmEUkMtlgjA+6jEFct8W
         kSNiSBK9Tm2SMb6uKpiJvRmctC2X3L0Fo+peJlMDQzA2Wqj+o3XrfW6lB7jUE4gwnTt2
         hWj+rOnMaQrKnmoPbTX1evyB+tq5mzKk11/7vNYYwX4/lxeOm/UEfhrQHc9K/HN4QsxE
         cTWNVloMJ+gR0M+A6BXh1rLqeHmk88UwG0ePY7N/+KdsQT1pIdxIMA8RIqSBh324aGBf
         hI1KBjVBbsJ6OfPEIQdVvrQG9dFYCYhOnu/QEoAYlxnUPAwXND0SxvSW+KB3aHqL7u8s
         A2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776175944; x=1776780744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ToFpVHJZk/lUK9UX1+SEAdhDulwgtbUtp6ILgHqAeZ4=;
        b=iDUOuXsuqEnY3s3vOTYF1R64k/wIV2vqqj6y2UGGzhOBpEAESrm7u2HNhjuRUoQ4bX
         xTRevynpIiNZ16/E7PyWzQr2EAzAOJl+cSGouMh2gCN2wkGpqpymtC21kZYVTnuSNgC8
         +vGJV41Pqo8GgY6JYfIjLU2oh04y4JlTcBwkuO5WjJCGN+zBG97ChGVz9YJVeMZpv4mn
         LuGqVz/kQ8h8dMWEwPq+CTiHVeGi05HYZI8F6J7d9kZ1tsCChIWD6mo6ImnGJ4hinzOX
         MrP1Pk0xg5gD6kV+9vUMbHWhYsNzloRuKfVPqmFQBaXNpr/Onuf4iNSS3GIn9VJBOBDN
         kxRw==
X-Forwarded-Encrypted: i=1; AFNElJ+ZJWeBoEM4nzl3vDquLbNU3A6nBQ0jkXEzxFHQwkx7Ob/nJSaEoRo6tLBtpAMS03OTSJk7MLUGbqoL@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3iQld7+xHhLw9Dv4MbRtyH5/PgP4+7L1ygz48t0vlAPdNuoqh
	8DclePDqVv78G//qRvw3XWMz3bt48DozqDQXU4PSYrJ9P2ZMhqMoTcq6xX+MqrkhrFyT6SBsx+i
	jHehTfMG4lP3QrkYC0noJLGOB8mjmNiDRmuSlqt+DHCwdaJo/10qDvlTC05BYFj2U
X-Gm-Gg: AeBDietVwypwpqyPlKu/SMBWcPpmlVCrsG2GKW0bP1BHzaRzQb/CFMzwWm+dZkTSm8O
	5QpJ90RVFwy7zFyzc97Kkc/mNiU9CEsYw0W4EaDbjM1WVG90BtHP+RkiDLXM68EUz+kCktH0Tqc
	8+BcF2vGixn+kyyCPqm5fl/FPEkpezptNmdzepKy/sqXMjmL1mm+YlZ+R+4FIwLIVl1rALTQFji
	nj9xGVeIKankf0gz0AUeErWdyLN50mhcaga9bcMrrHI0o1X1wVYyAlh7jzYWzzREWdog8kCFvDe
	BP08Dy2/jGJ3d6pReXCirbL60XZNskJUs9JcYebdwYvhgFtVTbBv9FfgJ72LSMuFmvXWuYhpO3d
	CFqOmKpR6Z+EGo44j87RrK01NPzmQ6MFSGmi6wR3i3DCQ7NGe7smgffL1nK2kmdt3VLeCxEk1OI
	YgeSPhaBkdhpPKaQ==
X-Received: by 2002:a05:6122:84b:b0:56f:5b59:5226 with SMTP id 71dfb90a1353d-56f5b59611emr1685445e0c.3.1776175943758;
        Tue, 14 Apr 2026 07:12:23 -0700 (PDT)
X-Received: by 2002:a05:6122:84b:b0:56f:5b59:5226 with SMTP id 71dfb90a1353d-56f5b59611emr1685414e0c.3.1776175943213;
        Tue, 14 Apr 2026 07:12:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6db92792sm393171666b.0.2026.04.14.07.12.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 07:12:22 -0700 (PDT)
Message-ID: <38233a55-d313-4ad1-ad5b-b33011f2d345@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 16:12:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1e80100-dell-xps13-9345:
 introduce EC
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Tobias Heider <tobias.heider@canonical.com>,
        Val Packett <val@packett.cool>
References: <20260404-dell-xps-9345-ec-v2-0-c977c3caa81f@vinarskis.com>
 <20260404-dell-xps-9345-ec-v2-4-c977c3caa81f@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260404-dell-xps-9345-ec-v2-4-c977c3caa81f@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=C9vZDwP+ c=1 sm=1 tr=0 ts=69de4b48 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=I76Qk8w-AAAA:8 a=BDX-M9UYCxStvK4FQfUA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEzMyBTYWx0ZWRfX42PLuyVuDHSa
 J+uN3ahD0hInmBjrLqCMbqZ+SH4mtbORis2Tcph9HmTTDm7amM55oZPsyF8u9qVi/iTFnXDA9vP
 FfpswRWpfWlQ6lKhljfHPGz9z3m4xpjSV91uIwI+hNM7gVS6uejy+l9ZT1P2gDYoEjCye4H6FS9
 UJjsDdwCSO33EuPPAg5sH9kypsLJAe8RUFZADkyeuD0+s9M5yj74SV9Xn+O8g0EFVoy6/XSgPcb
 XhSmGKsYE+gjZ3BTggMWpf6LK2AmoHanVmAyNWBx34h8+vaT87o+elEdJ33MSIuI+Vp2C6efBl9
 3r/cZQNXoCY9PYnd+g54iGMOfd1ptyFTF5kpEM1xewhxgDmpGr0Ia+dZ5zRY99DhYw2XheCXYdx
 F4rk9xr9cuOi2tXbGCE9OEmtcTV44co4tks5e9v9/AfsVljDQrcdGdmZA7MGsphYLTY280PSoYB
 R2W5XcEuoyIWjGvWSFw==
X-Proofpoint-GUID: h1Q-YLLn2dR8JhUG8IpTTAZFzHSZ3ReX
X-Proofpoint-ORIG-GUID: h1Q-YLLn2dR8JhUG8IpTTAZFzHSZ3ReX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140133

On 4/4/26 2:55 PM, Aleksandrs Vinarskis wrote:
> Describe embedded controller, its interrupt and required thermal zones.
> Add EC's reset GPIO to reserved range, as triggering it during device
> operation leads to unrecoverable and unusable state.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---

[...]

> +	ec_int_n_default: ec-int-n-state {
> +		pins = "gpio66";
> +		function = "gpio";
> +		bias-disable;

Did you check what Windows configures here? bias-pull-up would be
customary for active-low interrupts (although there may be a
separate PU resistor connected too)

Konrad
