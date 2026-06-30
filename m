Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B253F0ABD
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782814672; cv=none; b=loWtWJzrLw1Xt94nXUm1XZsNEHw8ui9dUug/qOv1CWDYJYK0aGjz7TbBaC4LFD3qRDdogGqX2LQgboep7EsfTF5Sh53ABbKZ53gC4LlGgwaM2FqC1jKWrBnGVl2JxSG1SiUOMzDm6+SIQ2z/s93lDrdYSlPr4bkTE540RHhg3Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782814672; c=relaxed/simple;
	bh=VUe8Fz1Splwj9CVltBTk3c3YxkM/R+Z8Y+y8+XBHRcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lNarU1dIxfw3CdB9ukrHR5wYwielt1/ca2p7TZfz3ctHZbuPYMEK+R1RcPREJg74wBJdA+ngd5F7V4B4T3cv2VSOZyvthK5VhwOKD1oRzVKMwL1KNTyF16zh8kUa2JGoCRC3WN0jPN0TH8gTNa8q7ggsn60+u2e7Nkoyajg9tfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Io7mnqVi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MwsmTTf/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Io7mnqVi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MwsmTTf/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mrBw1611698
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2xbza18XahaOGw+Ao1bzJ3dn1GuFQEjkCVDI/Xq0mfo=; b=Io7mnqViZA4cS9h5
	9rNevjy6OvVJVfTS+8iDxlvycBnvTzWaRbNIzS62GzxTNUrxFHLxwT5r9HOp+aGj
	bgiHGukHj0nkC5vNACbjNH1WM/w3IAhMJorrdbRotINU1zSO1qz5nLZUM503W7VK
	oZ/uCPE7s2OFKG4FsbIPJdItIqSwCy3RogkLwbKwg2CTuaDAYy0BoTZ7Gb+Ta/Qv
	fegXoWzJ5sF+ctB0jcDRT8DLroRFBpDvUzLZIWfNdLtJTJZojZEDOZo1JYhYRPjS
	E6PMQMIsDnSiqgcfISz1zgxwIGrGeUXwhRATISb15RMqZk2YhULNOkh635mhVSQH
	tCkBFg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f441gt1kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:17:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e68cbeb53so6657785a.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 03:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782814663; x=1783419463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2xbza18XahaOGw+Ao1bzJ3dn1GuFQEjkCVDI/Xq0mfo=;
        b=MwsmTTf/bmoDPWiiQRoYslwATRpTOWQ2mC6KDF2jHooiWD1ChiNhX8kS0p9LqH78KK
         zv224QR5DjpYQ+OCq+fRrri9b3UTMZaT+jAGukfd+flItfgWmr33GyP10vGnhnR2yIjE
         NadaUZstDVjztSmSATDfAC7Cv/qu7UdqT8fOlJuEQMw9/QUSl0h9dh6N0v9MNbjJvH7M
         HNxCXHaWsic9bh8YhFGwkPSr/Wkt3nJbopdc1eJGHhpQ2orgBjh0bL/U//cvN6ZuJfK4
         6tS7R3nLKUIH7Sb8RwDOPj+qwexdO706apmrdhpVAnRNIHfMs3xidnXtvC/7bn2ZJOdW
         cQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782814663; x=1783419463;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2xbza18XahaOGw+Ao1bzJ3dn1GuFQEjkCVDI/Xq0mfo=;
        b=D6ud7tzhbO0vlZkGyawusn3Tsp/zN5tpiYI4TAO9/UMlDo8MN8T8/rVUZmgkvnfTmz
         4MotNtU+E/gNsWx0n+/hznBYcZ+eXSuXWnj7tHYuwzeULBhde6qtFuw2DD8U2IK3wfiy
         gXiLBIFMeSPIecMU7RDzNS33tJ1iAG5k2UBAXD2RU4OyLjKaBhA058W1ayQ7QIRENSXe
         JfwOKENXGBhAOVZA0yIhSbQXWHLWVbYRP+0SgjaEfHanxqWmjbuZzo1IrzL0vyA50LAr
         ie23emwJW0HABbeDh+TwMAJKZeku3bxLjw9z8IkRvcPKSTA0hx4x+MT8AZ9JhOL9TF44
         Rbkg==
X-Forwarded-Encrypted: i=1; AFNElJ/Oo1K4wO7z4WTNtId7XugxEjIojAgssAg52WogPy08sKTUWeEuJADtmAMZxGagPKhXlD+5ziXLJxnZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxeH66IswhOnQcGGvTWfuhW5DKVoepcnWu+0Gl8YtaHDHtSsQ8J
	mU2tvbs2Ef2k17EIHV/ABnEben/Mc5pz1P0YJwxHcugYsnL2Ugyybc5b3xvhYQcSXOj0SPtpsqI
	VSBAPlQHYPhVo3Tn0YMSz9kdRpG0jV2QsWfP80J6WQfrxxXHSRu7rsF4Fd9V0vH3b
X-Gm-Gg: AfdE7cnQmISsXFm1pPEV2ogl6H4/ocYSojNwCUgcXrz0+BvUoclPBukpm289uV/6mJR
	Z3Zoc0oASE/aiZEYkc+asyozTo2vACGsGqnptTADiR2bNTCFOn2iN5LjeTDcudZCPApdCBaTz1B
	tdmoHXFv+ActPpY6AXgLFIJUpVr6H6K1oCDhsTiguQc/vzHSIKC6MRHlYRo/ur6ZIMdxlrhfBVt
	F2RDBNLtTr7PRE8vsReJUDLQD6k8qvHC/ljQ4dXQBgOTv7dAn8vF5b8Nh8+YPcdushhotjP4twm
	D/rN9G2bv7Mnhwbvi6Rs15CRB4NXEXaswCA+i1/+Ho+X1RTTNxMOBGZrBD2j3wOs0z/QsGTGJIG
	xIx1De8n7bqyZH/EK3P1l8rXm3sq97fLA7ug=
X-Received: by 2002:a05:620a:45a9:b0:92e:5272:4e3e with SMTP id af79cd13be357-92e622e393dmr334187185a.0.1782814662857;
        Tue, 30 Jun 2026 03:17:42 -0700 (PDT)
X-Received: by 2002:a05:620a:45a9:b0:92e:5272:4e3e with SMTP id af79cd13be357-92e622e393dmr334184085a.0.1782814662201;
        Tue, 30 Jun 2026 03:17:42 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f0cc1esm100192266b.41.2026.06.30.03.17.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 03:17:41 -0700 (PDT)
Message-ID: <f010cb9c-7e4d-4029-9f83-f9092545f87c@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 12:17:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] arm64: dts: qcom: Add HONOR MagicBook Art 14
 device tree
To: Konstantin Shabanov <mail@etehtsea.me>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, valentin.manea@mrs.ro
References: <20260629154812.9066-1-mail@etehtsea.me>
 <20260629154812.9066-4-mail@etehtsea.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629154812.9066-4-mail@etehtsea.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5MyBTYWx0ZWRfX+00lTtZBrLGb
 9nPnFkCZo9+GI7ugn+HFYuvPEOQl6MamhG0JGbiPT8dj/QfdlOmSCBgOpQeR1K69caCr3PLwZsU
 OcTW/bspY1y59NoLexcssbBB3IHguEs=
X-Proofpoint-ORIG-GUID: 3Ha2vsIr6KAEtDLsgbwC8lD0FQueVFwl
X-Authority-Analysis: v=2.4 cv=F8dnsKhN c=1 sm=1 tr=0 ts=6a4397c8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=4SG1UvOAAAAA:20 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=7CF_AJ1nNsKS5KTexvgA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5MyBTYWx0ZWRfX04c2CqHZpT9C
 avjsiMceZggL7US18B4Euk9cDT7i7REYhdHrNgCjcU5tkr1O/JTrHS0pVJu0cpa9K5rUniG9vnG
 OTrL3RmwNaUIGqMNjgHSow0R+Yr49ZAZxVxTNaEMEwCCNlHB2FPQtt+1n/WtCu8690P2PwpUCj+
 mFaqwvKXDLHFFH2oaevyJ8DKR0/GcVMg6PUXTjSO9WZTZ5oJXYDcE7UVOgaEQG4tDNrQAWj/uMJ
 a1lNGlUkn/s+Wyqtv9VCKnWvgvspEzJipI3kH+onhB/ue9Cc0FjoZbnbkL2YyCZ6oRJKfpcsuix
 l/FGDOrLD0nVERWOWFcOiRwzBhh7PBu6iaplB3QnENM7JkvB7a/zXcLx4ZCsaPLhegf9o7iNgL7
 KVNzpIAUQcmElieul2fIAiks9xEfbfd4qg2w/26/uvycWJ8kt+gpxOhjvc9nGvmAqLyPZEPaMVd
 LPIZGBBXw5v7mgUbVnA==
X-Proofpoint-GUID: 3Ha2vsIr6KAEtDLsgbwC8lD0FQueVFwl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300093

On 6/29/26 5:48 PM, Konstantin Shabanov wrote:
> Introduce support for the HONOR MagicBook Art 14 laptop.
> This version is based on the initial work by Kirill A. Korinsky [1]
> and Valentin Manea [2].
> 
> Supported:
> 
> - Sound (with alsa-ucm-conf config [3])
>   - Speakers
>   - Headphone jack
> - Bluetooth
> - Battery
> - HDMI
> - Touchpad
> - Keyboard (with backlight)
> - Touchscreen
> - WiFi
> - USB-C ports
> - USB-A port
> - UFS
> - H/W accel
> - DP over USB-C
> 
> Untested:
> 
> - Camera
> - Fingerprint reader
> - Sleep/Suspend
> 
> Broken:
> 
> - eDP
> 
> [1]: https://lore.kernel.org/all/871px910m1.wl-kirill@korins.ky/
> [2]: https://github.com/vamanea/linux-magicbook/blob/x1e80100-magicbook-6.19/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
> [3]: https://github.com/alsa-project/alsa-ucm-conf/pull/755
> 
> Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
