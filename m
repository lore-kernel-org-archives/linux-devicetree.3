Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261195;
	b=ROXRwo9Jd2fjdOmK+L6q9ztOYA4AQM4u3E0GsWdk7vPMKoy2+zLWreAZyf43qQre76EA
	 ZV++LFOSCV0kQWdRw9N5iE7EJ1HNMtRrBwhORZXyuUNA1i7Ra5nYwAf5Zw6wIdIp1Dh9y
	 o9JUjdDbDHEhHzFa1sFwKGjiy5jBURltr8sCSYV7vvYxK4GKmg8Jb2poo1ohI5q9yNyyt
	 HOlz6Qs9l+7iqjutO5m35C8Hy+gZ7NwI/aB5zgQMaJwh5bWRFNfu2ZYSLqvwmloEVHdFC
	 sN4u9Nk30yLci7Vv90oePvFrhRIPH369//xsM7qCZ8Uth9HqbLWArcTN+SuRFwgM4/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261195;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m8DFKSCsdHugXNIGpAF5J7g+hIg6cjluBUQHPY3ZgJA=;
	b=0MnHEab4+Orb9FYZyhabzZhLngyR44lXwuUY9r3qfqn8lTtby4hnNWvNTvKCdLmoi3WL
	 sfkAJ0zxqQHBozAlBzG/G0LqKosOll8F/GGxK1Cs8jNVWDd9gWADm1+7ty4WR3wVH5k2x
	 +neaFec6XWQPeQv67SDLq/vUrFnVCWr3DkIiOlYDi+4YhC/+oKhRsMIgVK9dPsm/5Q5Sy
	 rsJAWptaOAbWie/ATRThhPkX952nfc/md2Zvk5g6Xx8m+5WLK7Vatnbwx8mWOkk1XNu2Y
	 dVi+xUBURFNO8O2xFTCJuidtjkEkRc5XMsltrKdDw0MrMzgbDFmkboDIph02bS7qaDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oHi105vQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QhDuiqLS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBB0606A325
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEBB0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oHi105vQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QhDuiqLS
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5H3EP2974835
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m8DFKSCsdHugXNIGpAF5J7g+hIg6cjluBUQHPY3ZgJA=; b=oHi105vQq5+kupfu
	nkq7DiBxKhWo3JDmC2j8eL7/8U+tz4p8Zw9W+sxL0IuzjHJ/0jZaAfZnKFTQ+B/c
	mZFBVpuxaKh8LVZaKjauwNrJyHs1sZG/VactDeU+xFAytxJOAOc19F5Ey17V4psq
	NEdcnixVx3y+XrZOhZnb3WhEO++31f/W+7h8rty2tzbQFPFWIv2cQUbOf6XiPPia
	4fJjCIsHFx1lfPOqqcnaFEycKMMkr4cp3S8ZWuSXvvCg+Mm18UAqA6WAXcuPawUO
	F/CIry2q5OWq12oAS5gHui+W3WMTONQIIQ86q0krZ0dFRtcb13sFE2YBSvUmqR5D
	xF6dow==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknkpaubr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:06:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2bdebfc5so45184985a.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 01:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793261192; x=1793865992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m8DFKSCsdHugXNIGpAF5J7g+hIg6cjluBUQHPY3ZgJA=;
        b=QhDuiqLSfXhXHNRwQhFoxjcmAPzJqb0vMmDNNFHdxCLXdJ4kR1mJi9roZo5ii1rJgh
         3rKAiCFZh8TVM/bID49J4pOLZCBjq/LvqxkThAS9/3el75Scc4TFtj1NdvKWoC0uJ1yv
         mkblcpoVwSs44fDG/6oBTGCnM0PnJ/N7AO52MowL0n6jeFQ1dD6LmuvXTZwMgM+SKVmq
         phvEmRHa0CqVKQIddING31lOy74Nr4jUckYNj0jhUqfRraF9ehCRAD8SRvKTvjr3KSa7
         h6WhrF06eq4JiAljJMC2pL4gj+AyOyBc0rcQ+uB2r1RGXYncsI1BYloOC8mNzqXA6Asf
         Aj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793261192; x=1793865992;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m8DFKSCsdHugXNIGpAF5J7g+hIg6cjluBUQHPY3ZgJA=;
        b=EZfSFEmKwboZmfLw6vHF3l+TIrRvo38teye4FKuU2fA+2xQVzgBDeCarzKuOjUAGF9
         yugj4U47VMWYZ5s3kFU7lX+SZnswnnRSVfX25j8Pehn7Ly99KFH479kW3vWUVwq39hX5
         swwP87zCgji5OrqsoJIzMyXWx+ZZYMn0e0uB0jRu6LqSKjH8OQGSHaZ/IbfT+AmBIOdf
         uKZPyml466D0h5XKpcCHlDyaNUZCq0su8xXBMtBk/V6xs7m/yuZPtDGVkWWtUHdpAgPs
         xrK6xeiynS4tF45V1gYfJ/sHkJEAJZnrQCTtsUl+LnWyPoSbup+qJu8JzqXh2rpeAm9W
         irVA==
X-Forwarded-Encrypted: i=1; AKwUvByiDCy+XzeRINoETcgjE/+khjrx/pWJY5qk+sOOtQpmyaz/jLEdyC1tDuy7xNXnUUvTvcJ8WcIeJvgV@vger.kernel.org
X-Gm-Message-State: AFq9FYKBnwQk7EcxuBgwap7EXIGyYzx13o5fXNJFirLbKFJO7DMzX5LK
	USA8F2+7owNOjgg7sYIZmHZSv5KVLa645VeAM4fnNQinW1GUJT6Gm/7xGqxegZYSQxctSPIV8CS
	ZzqX0At5TdNyNP++3o0MW+SiBvjWea+vgb3TXystTgWSrLWdA6bTPiaDrYWttUL1LQVN0lYX7
X-Gm-Gg: AYBFou3XZLz43eTiAxpaoJLJ9TZdMUOLm+NdD8UAhGfz3l1ovkuwoK0f/7mj+kHDElX
	j+OWn1ATq8teZEWjSo37GoLMnzJIKUJBuzMlkmfTd3zR9UAevWnqOM4LgSR3viODEbAwl6IaFZ5
	JMvNwqqomLBQ3dQKj5nlabscteAWir299/iXM1b9I4xD5LE5EwnivLkVQZgpCpEkYQ5FktX3x0q
	hp8zZViIx+8k/HRayQv0wBvfOeIGIE7RZuXTme38Q+Wep8MZU+s+WtPz9w43mIDnscB9KXFadWT
	y3mt1+Fabc5FMA3+dg3F12cK/9aReoUBFinSwzCOqP+OIdwd8hWuzL3Jw5pnXHLI5GoWckk3dVg
	xdH4MPqoQGErC9lcGDAyzkaormfsOacFRz5qQsNxgXwT2ahXCNYdfQZ7BAEKJJ10aOXjDGUI=
X-Received: by 2002:a05:620a:3bc9:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-94408d42cd1mr784406685a.6.1793261192144;
        Thu, 29 Oct 2026 01:06:32 -0700 (PDT)
X-Received: by 2002:a05:620a:3bc9:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-94408d42cd1mr784402285a.6.1793261191683;
        Thu, 29 Oct 2026 01:06:31 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b49644e029sm2428460a12.35.2026.10.29.01.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 01:06:30 -0700 (PDT)
Message-ID: <ca9f3883-247f-4cdd-a30d-847b0c3f5433@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 09:06:27 +0100
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
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm7325-motorola-dubai: Add
 vibrator support
To: Gergo Koteles <soyer@irl.hu>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <cover.1793218514.git.soyer@irl.hu>
 <89f7e6e9988c8744be37093777b0bc065a0e2ab8.1793218514.git.soyer@irl.hu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <89f7e6e9988c8744be37093777b0bc065a0e2ab8.1793218514.git.soyer@irl.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ju9kP84C c=1 sm=1 tr=0 ts=6ae2fe88 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=6KvQjkKwYJz4M-1xzI4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: wpcxZaB4peo8YI1TN56vphrmNACPuR0b
X-Proofpoint-GUID: wpcxZaB4peo8YI1TN56vphrmNACPuR0b
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfX8WiHKtNm1DCa
 m7unSgIp95Eljq3qfmMd3mCicASdcYx+khup/c7XhFsl/VsqyZal0iU7IWENZXp8SH15VSrRTgB
 hPVgQfOeuvaOkfN/Clnbl6LAD4QLf+8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfX6SgbyoDnjibQ
 3esR+9lWPLlc+B0kO9IRigIs1+3F0Mdj/f1gI+qTdmjLHASMvtiExypl/eix9Se7pcehKapjunY
 DyhTALZvSxP7v/0cF0F2sbOcub3HpYGqGBov+OM5MyCjQzojjbuLIe7W3XBUXHc/a1cbZW61Odx
 6C3ZnHllEgJ/6T3Ii6/fQX0EBhU3lYg2X7SNqYR8LeyKIkUwvG2ItLCb2prvUUCZpj3E/4pdVuY
 vjpG1q28h11rsNKJN5kQC0vnLGL1Jd2sD3KT/WUDAbUhp5vaeotBDpy906aTzNxbapZCze7yMys
 RVuQd5PRYPp5REG6M2Kl0ssBP2J0Gaxx166zfxbFct3hWL1R9U/+drMFGFHCYiJUgr2FXheR4bj
 YUcSBjClUAr++kYpxfbO2ssadT32+qayb4gVVVEctGC39YJTFc/z2rUaDrHrpQEOH1wx9YhA57y
 66LaRZpJWyX631mvS9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290031

On 10/28/26 9:37 PM, Gergo Koteles wrote:
> Add the required node for haptic playback (Awinic AW86224).
> 
> Signed-off-by: Gergo Koteles <soyer@irl.hu>
> ---
> Changes in v2:
>  - rebased on mainline (Krzysztof)
>  - order by address (Konrad)
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
