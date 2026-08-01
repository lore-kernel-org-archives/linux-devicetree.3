Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECCB388382
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 15:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785596820; cv=none; b=mWKgT70W8olQI4I3jaOdJk9XuCbjZJ0QgsKqIqP2zHx1U+dAi0FoiJOIuYYYNm4PYcdR+1Y0M9KbfS17AQ2zyK2eRK2BPz5vg2U1/61t9xYHfw8TF1YW2xNHAhS0XJF2CJ7YcXo/VsB16gtXScvUhvlciUWVpo91VOs9e5whUqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785596820; c=relaxed/simple;
	bh=2u8x7UM37nI4ga9Fvb2fN7gFkcZv1A/bdeDEVDvmmdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HyCRIoA421cAR58Q5UnoAxNmxm1mGK0Km4becVSFG9x/FkpHOPJF/A8GivQaiT6ztyB+xoq36M1NT6JfZH67/a7OWnBBZFoJ7U8eFrEHygJmLtF1X2qxe8wiYxX2XfI/Jy3mSAi/6jLGkBBShB2xGnuAVItxHpk9gfhB7JFe8ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tti3vt3T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kTq2ps6p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tti3vt3T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kTq2ps6p"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671CaaSG3121919
	for <devicetree@vger.kernel.org>; Sat, 1 Aug 2026 15:06:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3GtaqztfRAYNSQM0XYRe+ZXodkTMj3HkNZWs3vleHsc=; b=Tti3vt3TrlSHvkFd
	k5u3rXZ57tzo4U8XAz+AR4mSA1QRw5R008/lrAzdFOHOFZu1GchPRxKIJvYEOMHd
	Xn7j+jGpDqD9u77cEjywgUuYvQdt6RX5zeSYLl/8gO+sRHl51ZzzlZM/hr2d7gB2
	rvLm0TRFdKDIy3TyK1AL2tRsYxi12JThzlJArmUYEEGWVxNrqVmJ0jBm2dbie0Co
	SUJzpocYYFMMFfDmgI8lPpnHxPVoidtzvHAtQAFVv2tv8t88qj1y3tZ+0h1zYnTu
	VELJzj0sUpaDLyEBMzYDNIy/OBCM6jx2RfH00iN+AA+/KagS1OMA2PKF1r6Nk9HI
	ZXBbKA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs91193wq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 15:06:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5276aa86d00so20508541cf.2
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 08:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785596817; x=1786201617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3GtaqztfRAYNSQM0XYRe+ZXodkTMj3HkNZWs3vleHsc=;
        b=kTq2ps6pt/Be4TicKZBo0n8i9nwHMdQZkyCDEoAAdXs8DFLW3sapTM+o5LSRUg1HTY
         t4biN1m1vMFZVzmqoEH9gyoa8SqKYnk6IAkB293smGNfAZ9VwtXZiHbZcjG+YgNLgv2k
         JwI30Dml3kxTSqEFK59+O8icAFwcVMh5NeVt4KR5oIXXZ4AW7vU7V7Ti6QPXm7n71XCT
         +i/wS0OIO3mdrFdAxM80/dbGSQ5YxdDF6oQOAKVM1NWKAZ52oIOT2kLRbEenkXbe9T1Q
         S1QEzE4ldK16AOGDG0VrPNF7QcoXJOeA4isEmNw1eEX1qi3IHyipVArTKib8BSRBisex
         QYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785596817; x=1786201617;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3GtaqztfRAYNSQM0XYRe+ZXodkTMj3HkNZWs3vleHsc=;
        b=ELq+qpf39roI/SCvs2nYjRtoyvYgKRHUczeL2O5FbHDR45k3Mi+z1v5gujdVkeXwSC
         mzblKzmZ7AYff2/1056/eteO0MPc76Gh5yvBcEk4nX4ylxRTlvV0N1Gax8JQUUCP/NFT
         FJ5nKSXWNw4fZRlcdm1Dx3DDpde80x+baxiRRLxSNZQVOoKe58SMxV57yib3PDX5ye/+
         8bFaTQYkHtubr8fK+YbOSk7zLB3a6ES8tG+l2WLjNOi40sblSPL5A4pVMNURkfmaXZJo
         jOgbjhyju1w2UiVdq0REqJ4f5EwZfGODkSYe7BF214L2awove1PB1gtPW8eW5UKU/Vk6
         CAXw==
X-Forwarded-Encrypted: i=1; AHgh+RrG2itQ3L5RJYEeLo8edQ+9+AVR4G6d7AoEjJn7o/Yb+A5A3cITEQYpKVDJufbJ2NBBPwssfyZyQ1Hx@vger.kernel.org
X-Gm-Message-State: AOJu0YwYO7Lb+JMIZDFIyIlhqEs/LBFIZHrxWtifeUDNDHbLXS6sr4Sb
	6/cieXVdnr3HVoy14/6IpvZlc1a1AiGPXE2bMw5+NZkt4pSHWFix+bQrPezqudDfF57ZS0gdagu
	Ff4ml6PLqrJzp+DSii0MmFubu0xdIxUjq1ZY/RsI87ahqntVNCtP96IeJ0gP/LEo1
X-Gm-Gg: AR+sD11cz4XH8CFmGGp5WidIQjWSze4ynPjArCI/omzTGU4FxAuaR6X3H77MeJsQkvH
	px18dfOB03KVdov4nRxhT/os2L3tErkDoXHv/8FP1HeGg6q1qKMX7pN830pISo0g1MMKI0FAoTz
	2/T+KOYi0aW2ZFCIdaCRpazwUwR2Da/GRPxBztdcqF6nRg28c2bZUAyLmc/CHp9lzLHqC6O7jLF
	j0pE0sK+hNv7O9YdQqOihyf/35XbHlWgofD7NNsNe9S/0ze4BEdN85htJl8t8A1syR+VP3bP4K+
	KIC+zWvx3jl5nXkaJMPK5f4yqdW2hhdbx4SjIvEeoZi1OPUlAkBqWA+76wvj7D2xpnVfCuzIbXx
	u8F3R8i/qBp1l803YXZkSmlpK1j6y8A==
X-Received: by 2002:ac8:690e:0:b0:52b:4f1a:5ff0 with SMTP id d75a77b69052e-52b566db1abmr92401581cf.19.1785596816715;
        Sat, 01 Aug 2026 08:06:56 -0700 (PDT)
X-Received: by 2002:ac8:690e:0:b0:52b:4f1a:5ff0 with SMTP id d75a77b69052e-52b566db1abmr92401001cf.19.1785596816318;
        Sat, 01 Aug 2026 08:06:56 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41cf404sm15979352f8f.1.2026.08.01.08.06.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Aug 2026 08:06:55 -0700 (PDT)
Message-ID: <a5857cc5-ca3e-4adb-881f-912b6414c453@oss.qualcomm.com>
Date: Sat, 1 Aug 2026 17:06:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] arm64: dts: exynos/google/fsd: Trivial white-space
 changes to adjust to DTS coding style
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin
 <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-fsd@tesla.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20260801-b4-dts-coding-style-strict-v2-0-c0b4c68b2ba0@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260801-b4-dts-coding-style-strict-v2-0-c0b4c68b2ba0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDEyMiBTYWx0ZWRfX4awwJ1IlMkE5
 1jjqZmclZwHp6aQlBwaX04lHGt/mqeVwHiO30cPMppBOcO5AJMOnSR1H6SvsWYWIgPYkGh6MGyW
 fL3We4B506l4DTK6XH0+ZvA8vftN7Qw=
X-Authority-Analysis: v=2.4 cv=PvGjqQM3 c=1 sm=1 tr=0 ts=6a6e0b92 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=96pkp0ENnvQ_4pjiV9wA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: jr3qMedVsPI1wU_IyiTLAUau5EISkyKr
X-Proofpoint-ORIG-GUID: jr3qMedVsPI1wU_IyiTLAUau5EISkyKr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDEyMiBTYWx0ZWRfX6DIgXXTmfktO
 NH9nGg0XagPEz3mwAO55UoH9SsSkucHg9ISeHyt0BKBg9CyUknm21gH+ut/eIMktmR/IkV/UDKn
 jj4J1LWWik64G3xH1ixiFkVj2xgeWCG8zeUxwajY6jP5GW+pgHB/J52FL1xIfKrj68KfBqX+Z2U
 uJtha0jixHj1+JTBuswGdxH06AR+IOe3XVPBg6fb+Td/EKSgn/B6glaBoTb0NeiM5ntwBNF1WPu
 S2JNep84eg0z8BHepIk9TK6yg+xo0FKEW3TrJLCMoTTY8JOaM3ewjYP3OiKVMJO8BlBSvZ+7/lp
 RfbN5A9sArSW2dl+t89NZ8MzOUyTJNg+XTAEXG9ypQLg8JEC56WtOXsQSloNDajvj5dI37oIGFS
 aFJHYunSZwRKtWtGT62plkfU3v2+TkmgZRuTRuV5SNyT7Ml42WYf75D9bB/I0BlWEwctwleSYEj
 f5xHxlAM8NraOVOKpVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010122

On 01/08/2026 17:05, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Fix stray blank line
> - Collect tags
> 
> Fix a few obvious dt-check-style strict warnings.  No functional impact.
> 

Please ignore this one, that's a interrupted/wrong posting.

Best regards,
Krzysztof
