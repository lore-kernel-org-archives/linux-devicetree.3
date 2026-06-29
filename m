Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAF03F0AA7
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742720; cv=none; b=fuflS157cLUuCvtNVWDatEbhGP1gUG370+BBn5hTArK1073MJJQDzsxjFPbgiYlXbFNWxi7gz0m3JV004Vog3QCOkiDIkhA/xnSBuxLgfppiGrWu+0TcUFz4/ISUj5RhrikYKkMBSLaV5iapgV25EhPaGhXgrGSv+EtCuaZ/BPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742720; c=relaxed/simple;
	bh=0bnGvHO0rg4OMO85F9ZInJ9e5FeYAfeKZbeYpeWqk+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gGVy75J6FFRp0ma6tObfATJ/gYdyyiC4vd7CX3UZIXv0CMaMvpeKPDQvX1i2R7P9cEKNQCbUoFtSXo0CyZSRVhBC151ix3IYRrSb904a9Ii2x5mDm+9061l+leDOlFqwoNS6UEtNAE4neCvpI8eQtYPMjqCTLFWY3Mcb8s5GGHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E0UPDdIA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Irf00Ot2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E0UPDdIA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Irf00Ot2"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATCwG2647686
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HtzV28mhl3/Uuzr/u/bbslNE/8t349o7WhdF8PQcBC8=; b=E0UPDdIAO5w4lV+w
	BhzfHarJ3Q7jTpWQF+9GNtQnrUPzztxeJmMgvK6QRNb1yRvOw0MlXQfgCtKHgoSC
	ivK/6TONPp7mFqp8peTKqyTtY+TZPiB0Ykkp8Su3VeehkphlyolXhoLBkfdG+437
	qMoXnw8GrAbvVXvvOAH65e3LRnrGNS6EYxjPpcJGlEAfJPzmkiTTV+QFe30fFJ65
	OuzPZym4bhSzJWVG+CjtycRw7+vY6siYBvTy48F9GdSVe5o/1Mlw1MhMnXtM9ZIf
	3mP1GlkwqcpW9PNqQOc9PgF39c3l0HA/aDEOtvLh8/eS0gx/eTpXrJrBaLX9UJuf
	B+KD1g==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kyjhpbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:18:38 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-734f7d8bb37so279626137.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742717; x=1783347517; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HtzV28mhl3/Uuzr/u/bbslNE/8t349o7WhdF8PQcBC8=;
        b=Irf00Ot2RxCFbU6TVCA9sp6WncGznh1dUglCJ4lnPReV5ip+tnJ6NcmK2T0+jSWybb
         raKLF+d5+RWonzCDDcyRr3nbGMu9dfrw7tATlsMuM5q6UIIlbuq/MhcF9C/co+kjOUbf
         S/V12pCWFpftViuVYZsAY2NqZE/hWoefsOJggiEzGOwA/od6havGs3hO9WESuysvO2ue
         EliVjUdiqbvujJ+3j+EWjo1N39ykm6ttpNo80diHToUI17bbGAp5VcB6Oj6EGASTXhxB
         9PVG+kGvg9c1hreCs6QpQ34bJi0ALHqOtYfpCIlGJD0N+USMAxLvDl4rm3puzwVCdxLg
         KTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742717; x=1783347517;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HtzV28mhl3/Uuzr/u/bbslNE/8t349o7WhdF8PQcBC8=;
        b=dlvxYIuXVddxS8ya3fakBgC3yNuW8nsviOFhq+MiMEefzSxTwmPHZqZY9+UyCOx1xE
         24kQLJy9ytHisugeg+n9JXRsYgcPKjKacALSy7mz+Wco1MXoQCUVM43HIDuLknSHq3Zf
         7A5XIGHTAffZkhSDOmbY/JqGX6h7VLgKZeX9U6+CQlzWgJ5WYFUeKevDYTUTFpgpv+YR
         8DHp1ztVoxMYzgADfMwidANtRAVG29WEl7nY61PGt/hjpR8yyHS4oTsQcqA6stMqn1Vb
         X2p/2SvDwZ2mxrTJSHkNBGtX/jSsxlIJSse8VID8JKVXonL11Dk1P/DCb4uGGGjl/UWv
         PMHg==
X-Forwarded-Encrypted: i=1; AHgh+RrLmJfxy93J2JrIZZrHqQ67OZHB70F6ONo9k0jEQMD4c5fV4XPACRn9jfEUUt4yjMLZkXid+Nv7WqVZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxTWBd562xz0ogHzLfyzCdOth20Oc9u6xFBatn7jCqqEuUfVyDK
	G8+nlxjzJGlt4LRrjiOMyDMAxTR1CbOccAK6dqoAgtq4YOvovJ1S54kTDteWB1r7eUKAVt9Doy1
	5L1fla7slRIlPRSZxSlAjLkKlIlzNuslgtEeFMTvyIiLeScGNw6Pb1hEzwdWPIDNl
X-Gm-Gg: AfdE7clVBMZeukgZ0ZTUMv7uUff1LBUgvHGJ1UbCxAU+E/wEB4d0XR8IWf2/ioZcIpW
	0jBG4JCOiNdase6tEa7zUuSW5MQ2ZoEMMI8b8p3Yi1mPmfkRZF1m1y+xyxv5h1V3DdR4F4ugMD4
	yf1RJJibpFLsD5o27A0PjfqYt5oY0PtJwaxmMYxd0Bipl/e9Wcn7dz8CiJ2xIqtwnBDlBf1EKdX
	BZsPcImSmlo/FXIFK/p1VcGN4Sw7PZE5qZ5U7qH015bRSOTwfUh9bV0RJThTZP1MHyN6ksvHbaL
	6vONFdmBgNxqcRvbQn0xk+IN2gb1d6274HKE/SMOBW+Ru2zOZZ2rKX0BI5oYIZEq5VCABNelEi1
	IiJ79AXeu+vZ3NpGk6lJrdZOlz9b6les6I8o=
X-Received: by 2002:a05:6102:440f:b0:633:3bf6:977c with SMTP id ada2fe7eead31-73433e2e7a8mr2478756137.1.1782742717552;
        Mon, 29 Jun 2026 07:18:37 -0700 (PDT)
X-Received: by 2002:a05:6102:440f:b0:633:3bf6:977c with SMTP id ada2fe7eead31-73433e2e7a8mr2478702137.1.1782742714984;
        Mon, 29 Jun 2026 07:18:34 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6986625efc1sm1884211a12.19.2026.06.29.07.18.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:18:34 -0700 (PDT)
Message-ID: <66330ed6-826a-431e-9e8e-f2998af55168@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 16:18:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm8450: Add IPA support
To: Esteban Urrutia <esteuwu@proton.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260622-sm8450-ipa-v1-0-532f0299f96e@proton.me>
 <20260622-sm8450-ipa-v1-1-532f0299f96e@proton.me>
 <806046b2-20ed-437e-a7e6-b3c0699f5a2d@oss.qualcomm.com>
 <b1f872f5-66cc-45fc-ad42-c308f8970691@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b1f872f5-66cc-45fc-ad42-c308f8970691@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BJ6pNKouXs2XUlhsAl7UQHm0wAGUs0Mk
X-Proofpoint-ORIG-GUID: BJ6pNKouXs2XUlhsAl7UQHm0wAGUs0Mk
X-Authority-Analysis: v=2.4 cv=Ftk1OWrq c=1 sm=1 tr=0 ts=6a427ebe cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=0dHVmNKhjX53LK_pQYIA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExOSBTYWx0ZWRfX86FB/M9/QA5Q
 oxTo0xsb2bcVehWh2kvg1zi+nOlqWs3bgQ5due7Usi6GXDD0DQvOct7Mnztzk3N+Ly9dziNDS0d
 L82Q9oXXdIoypEoTYHimjQe9YsJU0QQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExOSBTYWx0ZWRfXzdHAyOohoc06
 ezvLnnJ12609P8uAoQMzBxtYMm1ZiFYPIIhNkT7jDBAc9yVEmcO6GAXAV77lcdu0KmSY7y/V7aT
 St/B7o5Pv32a6t4up1ACQNXfV5cr6Gx3E9MRCABbUI6Brh2AuuEocn908PL2+b2h5do0CUTQFml
 rTVAdx2WFLJEHrHtX14aM8gUIH8NTmGtPWAnWGD9mWWwQZiy+1yHnpjsTGloe8qUWQZqoIzLT6d
 k9nmt0reP7YIj9va9SgIhVOjeVEjcO8IRSVLe0ZFxULwGOVVFmmGxQE6LpV8RIv6zA9EUrNR31l
 2fHI3GrxiOxiQ6ZpQcoQ04A6RjmdQ4FF2We8cHdjGd90483rPieaO/NwYWTb/tHip/VAaGGIeOL
 KXpAKbi75gZrVr5rtlXLEkKe1x4cIDUHPc3+s9d7LV4xig44PHaQdOYMXuRp+hBlGbzpUpcXgbb
 uxqUYMGkdExgo7cnyZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290119

On 6/24/26 3:52 AM, Esteban Urrutia wrote:
> On 6/23/26 5:37 AM, Konrad Dybcio wrote:
>> size = 0xb0000 for the RAM and uC regions that the driver seems
>> to poke at (at a glance anyway..)
> 
> Sorry, I don't quite understand. Could you please clarify?

Please alter the size of the register range that I mentioned this under,
as the range is wider than what you specified - the driver takes a big
offset from this base and accesses far outside the bounds of that range

Konrad
