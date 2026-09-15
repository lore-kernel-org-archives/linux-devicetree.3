Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59A73BE179
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 08:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789460024; cv=none; b=DqqlEdqno8MfBmo2uGMBP8XRuxFQQdXaGG4EzbCGhk4v506tfWXydGPkm2/43Pj/6NrayYO/L1t987LwuyKDAKhcSmxW1MeZZRvgMW0Yp3hpD4RF4bitXby4Ln1i7LuyCYt82pQQjFxE9bZPUxa6gk1Chs4kosr/XOWX1vnFyu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789460024; c=relaxed/simple;
	bh=kyzw2pH+VqkjszrenFOZLwTMsFd+ulYHLHoNklEOK1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XQ9/jstLPQ2+5JpH8PTEZe2w3Sn9z+DIhkdNHkzWhefKPDrhi/feT1rG13yXotYwBkzaEX0Mw56UPxGobf1bFHIUvpIshQCvCWuhx1wF+zgbZzYgF8iVM5MjAs2ooOi9OJ+mWRkyCNOs4BJFPWSSYyN+7TDvUkuzfUwEnWQwta0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MYKEnq8q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ePTEKSvO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MYKEnq8q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ePTEKSvO"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Yxcn3485667
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 08:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OqwiqOE8S0VuS8HI72jUGtoqWeLsi10AOQc6npZJz18=; b=MYKEnq8qsSb8jyZ/
	m+RIQGaG5uRKIpXF0XBkYCtDdI5EWTacZYfR3arU74fXrfPwFgHlVkOeUwl3Vu7s
	A2V3+qmSpk2IfSOocU7I0fWXbgo+7kh0EdpDVXRWvaB6QcZq1DXGtOvlwmUFh64Y
	bM+aNgIqFAFyQIsIr+G7odSOrO2V9/t+4RLgSEDizU4+hozmN1yNH5mb0tM0ZOYI
	ntaYP5ZjtAdZclyhFXo4JAv8v/fjL/EW065z7owamN35XSIqErGi9HZ4xtlJsJsg
	N2WVIccXKEZwWsSCkdbsHxlazBKDEwItlWD/8aK4h1Z7QnAjmbAN9Jkk72vWOsGY
	H4CPew==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq0jerfy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 08:13:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e661ce1dcso76126385a.0
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 01:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789460020; x=1790064820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OqwiqOE8S0VuS8HI72jUGtoqWeLsi10AOQc6npZJz18=;
        b=ePTEKSvOpMl+ksn0OuKKz0eh7Djy9i+NIxoIZ9Aj7L5R01UBH+4tNy3NMJ1sqN7blS
         1vdFMhNTmgumnVCLEoIG9cMw6gAR6IAGhsiFhcNXRXAg2c2v5ejlaNbViv7ilsUBRJgR
         jFNZnoLYb9qjHdmQwqmjdfgeKWyY4D15+5/8lcfBgFcnwcDRm/hadxls+okxbc0lmpsT
         u7Kgk45TlRw2c/reJVT8nFtuCg0XB0VG5E/fCeCnUSFJ6TyoShvhIy9AgA+F613c1D8a
         2w/dB8+vjsrpofp6jT3t7MWFQ/3l8I/Q6Rs01RNMqnGun0RSTrByVqVMxsHYJfy0fN3n
         3pcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789460020; x=1790064820;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OqwiqOE8S0VuS8HI72jUGtoqWeLsi10AOQc6npZJz18=;
        b=x+3bEovfvoELRnMOKcbb+5ua3V0D7yOoTwkztWNfoFwKSYD+OrgaSzH5QafPBqi4v0
         pBYgiioXgX00dvxjsTOt8H39fiSzXzxBPtaD1AEDPvQ5ZgMYQ1/jw+Ha/7C/5GCfZb8X
         PfHT9zoz74YGZTsuyXoB4GPtsjBM15IcjhnBkRdP8ut8TiMiEY3zcpmBG4X7unWof85H
         WlpY0j/165IWmNHI95/DOD+rzk61WQMIHRPhIfKIcAqbEIlhTEWOVcoSAgRgIE7Mb8ra
         TiVdOllgXABBQ9KZMbMtGs5Q+Qfm/yXhHH9VhtEgsVOddVk6FdBbuzB8b8QiYeIXxczM
         UXGA==
X-Forwarded-Encrypted: i=1; AKwUvBz++Q2cOzEo9KCbD+GH6kx78QhBqA/IqTwKBe1t9h/2voSsBt8lOykzjF8p2EbmFIVDTnqfTshxczZ3@vger.kernel.org
X-Gm-Message-State: AFuF++lOMpgR1TWHQocoCtxCI4CqkedkmKvhCvXHYzgUSZBt9DavBwP0
	i3U/9/b2d1di1+f6RSWyphXYcuAkYpafeO4hPGgZTY+WvfMY8rveop4jT4aFJRy4ZWHO43TONK2
	ujbbHR5NKvI17mpV9ECsIjpCzp66NMkkizyeuMqvx1r1hnYgbTaw46EUbHrkgslvJ
X-Gm-Gg: AYBFou2XzS933KSUw+TqSPLKP+VKievqmuphkCYE5trzWYNh6Y3ch3PwBNf4+oCnq54
	XumxnR/iVNNJzFqb8apLENtnneA9Tv60timGizcDDAmtIVyV1zFvsKlvBJve8RPL4gu9jSSjgPR
	O/9sUmWS84wG8pRscg3n3IJdzbBMYnhuSGy3GyGm7AGskW6bL0fc6TdaZzbH9g2iqP7RtrhSQFI
	/T2u8CRNs3TjlrRNRyRftanHahKDkrSZ7z+jNTYDjhVoMNyD5mUmbozgMWGEORtuyJ4Yx40AXPr
	WRStvUOvg4TnJNzaNyejHuNqPbeIqDQfjkjUnrXADoB+CbNiNvQpxmzoIYX4KORrwJlg2ndNms2
	eGv/U2EXxOiwSlwdoB0Qj5w==
X-Received: by 2002:a05:620a:288d:b0:939:94c4:b799 with SMTP id af79cd13be357-93a29cc315fmr754972685a.5.1789460019675;
        Tue, 15 Sep 2026 01:13:39 -0700 (PDT)
X-Received: by 2002:a05:620a:288d:b0:939:94c4:b799 with SMTP id af79cd13be357-93a29cc315fmr754970385a.5.1789460019294;
        Tue, 15 Sep 2026 01:13:39 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966066b76sm38701966b.29.2026.09.15.01.13.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 01:13:38 -0700 (PDT)
Message-ID: <158d06a0-2e93-4300-bf96-eb8937ed28af@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 10:13:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8150: Use SM8150_MSS for the SDHC
 power domain
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sashiko-bot <sashiko-bot@kernel.org>
References: <20260915-dts-qcom-sm8150-sdhc-use-mss-for-pd-index-v1-1-c4f3857204fd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260915-dts-qcom-sm8150-sdhc-use-mss-for-pd-index-v1-1-c4f3857204fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX3WhdVPgseHeX
 Eu/TJU3EfdhKkAe7+PurZQy0XhO9hvbK18D0tXBBILzD/h0cX3bh2DhDHEY2CpLwkDqLepsrqXb
 5fFZ3oHJiUG5JcWQ1dxlN3Iz10uo0UE=
X-Authority-Analysis: v=2.4 cv=Kr/YSmWN c=1 sm=1 tr=0 ts=6aa8fe34 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=eAciQRwPYnktzpsGUZ4A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: ef-asGgxMCtMgBciJX2I0tJRbRVS-KD0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfXzMyn60LjrUb7
 4XEKzhYUfxv5dv83+S38VUjN8S9FLQCqp+qhPPGeRZhh7840saJBVYQ3TcDk8VTajVLOtB3stGm
 XO9qsmrRu6o6LOwM0rZ65Uidso2bH7cnR13Pv9BJ4w0hStypR4KWXmsBbIMYjKbqOkBK+f6DEt7
 zdwZ3AarvMv2nQRteuBwa9xs0hUfkmhxxvye7PzH3EhUz3f/5aVBLzKruVjLZliZWLw4pX21iS6
 dV+cLqg7qlKC9HPrkbc5WGUKdF1ddMpD/epNl2/O+5PjNPqwD4dHHQ+Y1BdGhV4ePC5rL7mdLgG
 R0yLxHafguK6CXNY92PDAJQQzgOahflLEQuXLUQqVzU2FfKpE2gR5s5iP+Qcjr6pDDuyHDiYqEN
 AVxEdDukeiXsZuadRyRXy5FKbLrxWWrhZaNNjM2tSgf9OKB2CCPruFMc5F0ZlGzvkgsJ7F3vcJw
 qM/cUqfbjEUK+wX/+GA==
X-Proofpoint-ORIG-GUID: ef-asGgxMCtMgBciJX2I0tJRbRVS-KD0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150116

On 9/15/26 10:02 AM, Abel Vesa wrote:
> Replace the raw power-domain index of SDHC2 with the SM8150_MSS binding
> constant. This documents the selected RPMh power domain and avoids using
> a magic value.
> 
> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/patchset/20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com?part=45
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

MSS is the modem power supply, this should be CX

Konrad
