Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364734;
	b=mJ6IP4smeGTc+tP7ijJAVAgcEZOaldbjre4VdijaLNOAt2IyZuTXmfLANQoxhGgtbBd5
	 cSgux9+gBt/iu8YW4L9gsYP6nHDWJD1yCoDAWGfH6atto/JMUVsHpHmTrbTUtn8boaJ2o
	 Q30ML8oj0wTY5lMNmqd+ssl44/3U2QcIwER9o3Tzo+h6cOadDFSxY1XuhAbobFp++F5nA
	 9oIZzO7w93Oe0rWW/fapTnVgXn5o0EF7p82vp9wofWwvklUcqEV2O6kOzC4Fnc0s8LmWg
	 x/s7ZsXL0Y8dv6HRvjPSZwdxrWBWP8R99zA3yImVJai3X3dBq5dJ9Ok1jAMqdupSg3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364734;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yXgN4VGBA+CqgwluaF0PyMeXWirAlkzjh0u5pMn2j/w=;
	b=RW9V2LQgIQjtr9sCSXa3j5Lm+T2804PKAFN8woWfy2f6djF3Ey+5L57ZDKuP/7yScIuh
	 6fi0NYq0tZhyhe1N8VedtA6Amb15VR4KSSn2xVK1LAtYxm6GxHSn54TC6RsQALxFOYLfr
	 4snp09u0yuF5Wm9avC0AfrHDynhy5mxn4JtrtV8RgWr2DqVjhz48LOr8zHNv57FKJwiSA
	 OTI8RhT3xqRJBQ3ZJeN90sv+fE1dq+ul9l3dtNV4wAoGRHn6eMHtGdJWNWTx2d7o/EFkt
	 0ooixt3HHUyBG+9m2JFcoU01zGZ+knxzfY/ZHAUkzW0x5NqK9xYeJtyHJvdBTDlEAbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lWUR43P1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bAaIp+51;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1AC606A32D
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:52:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C1AC606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lWUR43P1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bAaIp+51
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG84u3719553
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yXgN4VGBA+CqgwluaF0PyMeXWirAlkzjh0u5pMn2j/w=; b=lWUR43P1ZeIlVjK2
	ZmSo7UQW3RomfjXI+1t4RPr9mK+JvIKxVWkWa/OvIh8QCTchqU8Y7n8RxWIm0IXK
	cB0pH7uY/40livhE6OmRU15rWnO3xpa8fiYrJ/OCz+AgExMMpN9FyRGgWVvQdqJk
	+sX9Vv6Ju6iDz51mzXc2LGx5xCBL/FrWlsx01+n3BurSVU40cT99Ss5659ydJT/v
	tHX3I3XEsPhOcTeHmNoOWw+0T9Tql+EiWkXxxxh5spClLxlbBILggddVpRQO5uvX
	KfIQs4iEexSsVYwVomPzDd13dLYPWPkm0gFB9gvoRPYSNnlujKemx5OdQmRVE7/O
	Yj73JQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qu2bg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:52:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2bdebfc5so18521885a.1
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 05:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793364731; x=1793969531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yXgN4VGBA+CqgwluaF0PyMeXWirAlkzjh0u5pMn2j/w=;
        b=bAaIp+51QYPfhUTFtuDVwmRuHE1CHoepbTi3j2EDvCxhvEJAcsj20BY8eD+LIpgJGf
         rZGZ3GuC3AeVuYB59GyuVuBXeMApFWi3qMZT4IuLaO3YhrSduxT008a64o8fy7EMVIFQ
         vAZqJw652juOyJBUHpf9z7ed0P96gTf1okoIxg+wPVOH+7ccQQ9Ljj2LUUI2aTJWIu07
         WvYso7/S8BieLtX/6cov2XpTB4CVmmDbv5g/x8j8wdpqTn4+bQkQdBHwYNGLajp7f9b0
         JVj5EVdqpuncj9sqXDsB9R6zHBVqj5g5vC31F9SW5Cfnq0fAxkZURbnVfpEdW+g5s2Qs
         lWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364731; x=1793969531;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yXgN4VGBA+CqgwluaF0PyMeXWirAlkzjh0u5pMn2j/w=;
        b=FD6XlN964a9gBRiqLViF8/oITCZC1ZWjSojbSE2mVajl2auN7HA4/SyxLtNax0Euhv
         BdkZGIzTCUGIfi7WKpbdJOBak3aVVoWxFmcGWkp3NfgkqpgQf61Ax06+SaOoQziPGV1o
         osukearNwwCSf15/3mKxDSZd8QMVAakFMR6m817SYWviJjNRtXq4qS4cIXhFOWxFcUop
         w+FrsZczKca05yoOrup+W73j+cYA3ITUe1XfJSc533YS2HYOyWXMq7w8e2cd5IUFVDWi
         DlaFIPxl4n6s7g9wtLYEOCKVPwJKIGWdBiTzwCNf4AmRSPoxux4DxyJjtrnj/Di3NiK6
         AApQ==
X-Forwarded-Encrypted: i=1; AKwUvByySW+YQpX+svaJ9pyqkgLAX3FxWryXUh5isjhqRy8DfWIk3zBRRhy6Z0hkAl1p3b7qlQ8+E4plNQe1@vger.kernel.org
X-Gm-Message-State: AFq9FYJcO/7BfQ8XExYoxz64uJYkk2GdJdA3JwsDrHf0LNsMMqfdFu2e
	nADq/7eLcxvC+ZYjuCX1lgTaCpV4h/Qlg4Ek8rN2xtecyLt1KSytKl02+6J1QQUzBWJ2gom224a
	n7VL+PDpzoU6GAY8cHsHqyHonq3szGnrnbteKueYSLnCpOV+VikjXf25a1xVoQJgD
X-Gm-Gg: AYBFou2e1ifS1uN37W6z8NsoNo3sgYGhBlNasiASJmhjh+iH48lEb6wCnBUjGASpsaj
	l6O4KWJzfJHSTLazyxKbHiWnszscOxWN2R2FmS3ksR0HMIHvgzgwFqz62W7gHQhbZdqoB4xBnfa
	RG825yaM79nXvBiPgAuE5xDruFvYmtNAwnQ+PV9SYPTRWcBY5H96fUKasFLr/eIEUXhjj5T1QV+
	8BF0jrK1U4ndmHJmE8EBL6VEMrmQlY4cEmLoAkVkmoKrbZjbTyEd3Cb+LI0n01/LVhkq927op5V
	7wYNnNyHlpIgl7/Dhe9GJZgJSSuQHxtWYbp/gfGrRx/g1yqwfGTNv8yk7IJdoAf7/Zgo6DLbNRb
	OXWboK5TR7jOe5AHKEDUXsJhWY0Yqzv2BJPzIJrJ4MDK5xAu4CIOQxMZMUdpXWuuOxkQFT1I=
X-Received: by 2002:a05:620a:2004:b0:93f:a34:d9fa with SMTP id af79cd13be357-944215b51e5mr372729185a.1.1793364731281;
        Fri, 30 Oct 2026 05:52:11 -0700 (PDT)
X-Received: by 2002:a05:620a:2004:b0:93f:a34:d9fa with SMTP id af79cd13be357-944215b51e5mr372725785a.1.1793364730769;
        Fri, 30 Oct 2026 05:52:10 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfdc05sm62773966b.24.2026.10.30.05.52.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 05:52:09 -0700 (PDT)
Message-ID: <466f2126-4890-49f2-9e6e-679a4199f324@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 13:52:07 +0100
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
Subject: Re: [PATCH 5/5] arm64: dts: qcom: milos-nothing-asteroids: Enable
 panel
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261029-asteroids-dts-updates-v1-0-79351337d681@pm.me>
 <20261029-asteroids-dts-updates-v1-5-79351337d681@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-asteroids-dts-updates-v1-5-79351337d681@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gxdoqhLYsnVBLQ1DU_NoSwfTbDe17k8u
X-Proofpoint-ORIG-GUID: gxdoqhLYsnVBLQ1DU_NoSwfTbDe17k8u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX/AgeZUNBVW+B
 7uZy6vJDm6x0BhlYmVXqUnSC1Xi8h98hI2X1rVhvgNc/Cz2kI+XWfGqbQEMWEEfk5LTqSIqbmgR
 xNMBMCinDOOTFGR2tT0Dx0M194BcmHs9Z2mzO091db0rigOZqDuwIoYuIv+9mhqlcbPe+Tft63u
 /UVNReWxjciJKlj34z4B1zupl1aSA+wL9gLh+F89aBpHtzHs0fuwTv7m7wNU66opM1mToEzUWJz
 Vqwzf+rvoUoE31PCv0qUKx/jcvOgPWsw2x7Hlsn+To09DcaV7MRejoxcSn3CyI0+1gIDJiBntX2
 4yi61gD+VYLulno6ijayaKsxd5c88J69i+bKiaqNk0e1drE6R63FqU2hpDKPAj41IkS5Hom97s7
 4xBngS0Hw9dwQXHKOoRRDOtL5SvdUNV9iSI0eEo7I4oF8PMS1VD6Zlqj1E7Y5aP6kLe8YvWx6zD
 M3SNzbGXxuGXx9T53Pg==
X-Authority-Analysis: v=2.4 cv=dPgzC+Zb c=1 sm=1 tr=0 ts=6ae492fb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Q4YwZ6-Wyup7NEOylQYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX3JnTRh/Wyjua
 HpAqNsF0Zk2RvbHms65HFRsKq7SRsjUoJX3/zsFYuHp+M2mqMGPUIT13UOaSblkm8rWmKgu0n53
 f4GAym0epLujGGzBY98uvS054+9s+Gg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300051

On 10/29/26 11:34 PM, Alexander Koskovich wrote:
> Configure and enable the node for the BOE BF068MWM-TD0 display panel on
> the Nothing Phone (3a).
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
