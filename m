Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EB2383993
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 16:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789836489; cv=none; b=Hp8TOpU7fdD4ukqUeqOsDr712jMcZ9gaWuH2DXcUFAwD21K34S7crixWGYDkzD19zLkfHZdyuBuUIllcdvVXnoWQJgNv+x8NfqeLHUcTlAdcJ/PuWYVnUP2R5JgE3pPEzwel9Z6tXd0MyqlwfGrFZ+wzWI0rh/+SXDjwqmlLB3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789836489; c=relaxed/simple;
	bh=fnl3dUkFs7+q+6V0hzx11cv+IRpZStzDEBWzl1dyy5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JoGuHIBkAb9mAmsqieS0JaXl/9ZVd+crpBe2mEQ/NfKhkinolaOJkW/m66iZrVDTRWKy7KBiz47zVQSgfFmQ6eKviQkuxLMwOcfA+AVrQnIlXKL2b5Gj85ypeRS8xHyKLNe4i4IZPhY15zLDTTBDh6QTT+u67c/kl7aGtChKIVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E1EWFl7Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BXQyoA4n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E1EWFl7Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BXQyoA4n"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68JGJtDp3492446
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 16:48:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fnl3dUkFs7+q+6V0hzx11cv+IRpZStzDEBWzl1dyy5I=; b=E1EWFl7Q6/J2VyWq
	DV7F1RuXslQyuP4A1UIyYVpQNh9R+kSVKDustTRYbeWCAcdz+K9P14RIvyqUbkVZ
	ObrAS/PEWVs2kVZ13x6bJ3Ce+q1d6mleR34YUgdRQ016lR+Rwep9UzQ2BAmLOsDD
	yYtnFaa24c4z2iM0+vu28m6QPB/IfmzMn/pfPT/Oup3y4LKkZ9kLPvyckn3SJDvB
	5TfdktayQyjFJ/JsyJr2bFdpg8iI7BYVLTsUxZjO//O9QmbeBUgu0RHcyqaXN+ve
	oSjqlRsL9pzAfFfC3quP1ZrTbUiYfLnSWOf6GIxfk2ZRPAH2rdLHqHbp1AOJL/Yv
	x0GQ8w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjs817ue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 16:48:06 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso1306641a12.0
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 09:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789836483; x=1790441283; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fnl3dUkFs7+q+6V0hzx11cv+IRpZStzDEBWzl1dyy5I=;
        b=BXQyoA4n7hZn+Ack72QoXEcB50EkG0KeXsDww5HwjtLLeEMoubMN/oQtvT9dZPzF24
         aK9yZs2+0GfhHSVNIV87fv/g0EDCo4CMZifVya5kZepBGZJUfbirWwgPGzjesLwlXdcK
         Os8ywcV1u5bM/qfkZlLX9E9JM+4o+1QH8dMV/OiK1bQaguOWOWmMDheSn3T2KSi2K9eG
         AgFMoAiGpi0km6ws0c18B3YtnUMZIKUNwkhb/QhjWz5XY89KT6RUel0DsUat5keIvGiI
         SItUxg22g2SzV8zFEEngpn9mr8G5T4ce5lp1PLQHdpVMcRaJhf718w7XGhPVRqUpJIIr
         SoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789836483; x=1790441283;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fnl3dUkFs7+q+6V0hzx11cv+IRpZStzDEBWzl1dyy5I=;
        b=InLPYc6JTS6iTVsIMJELdEoXlqBLohrkp1WtoqvLlAb9mwP1WY7Cp1En4kwTwcDjk/
         k0ojSuSvosm5jMWIxl+oexk2m2Wz7lasU7QqJ7F+CQFleNoRgGcdGjAeGYIl0vXFsekM
         ojoy4SOlZ889yu+Zaz2h7JbWraYjLmHZx/oChqXJkij41Qv1/sP29/MmBVt0JsXpewV6
         UVRzIQ6n8MB3FJy0itA4/M92FtYgF6cXP7oUB0Op5BkahU6xRc/w2XiDEdVOhybV4Gyo
         dLmWW6cOy+y4pU16706LbEY+/OpN5+XIaWMej7GbIWxby5bmSZ6kFkToOL61opbIK79o
         agwQ==
X-Forwarded-Encrypted: i=1; AKwUvBy36ZYSP6u43HoeWh58jMhApIqIyJPNL/4FziLHzv0FtFW182fGI0h46G78opV29PhdPc6OcZtd9KyG@vger.kernel.org
X-Gm-Message-State: AFuF++kv4RIdNKqOroBaxoz4FaUCNCrDPsvhNm3QCMHBVDq9s1Odboxt
	XUypaC0YgJwceg7Dp/ooTL7GRn5uR2rdeiYloUUgugIKI90KOMhBlnH1+HjTKBXuEN676a20Daa
	pkwpsJYcLRQNVba8mIeEcv2ATLcDk2MSmnk39M7bYgTdqjmx+AI3U9Uz2yWVF1z5C
X-Gm-Gg: AYBFou0lyztnDXp5quhEHlT15B14Ta5D/ozeNCZQm2MMMDgOeICjLdOpyuODwLAKH5D
	w4yl/+OviUYuLOSsuJeh38loJsQJwpFIWWgyCQmZNxIfDEwCNSvUgj2IGWk13997iEuew1BztKn
	lEcsJ7Yrht1kQzlC+kERlRUNSy+HrMio3h0lBRDmgUphxT6uVZoj4tTksuELI+QFpHC75jS05Oh
	9aHJ5HPrI0ze4q6hid7oAeNQxYF+n47XgeINEYPAK48yHwAgoduzypPiu7vQJplhPr2LkHCcvC5
	kGC72L+Xc4Kxo2Oe4QMlGzkgvzGPCE7+JMEHnmgx5rnnYNF45huQunbCj5BeBvQCGKW+fgF62yV
	GyCHdsWDMyz1Un77DqFYIlqearjaArVI=
X-Received: by 2002:a05:6a20:6a28:b0:3d3:adbf:7782 with SMTP id adf61e73a8af0-3dd8c41a46cmr9475630637.23.1789836483413;
        Sat, 19 Sep 2026 09:48:03 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a28:b0:3d3:adbf:7782 with SMTP id adf61e73a8af0-3dd8c41a46cmr9475613637.23.1789836483017;
        Sat, 19 Sep 2026 09:48:03 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.227.249])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55bf843sm11231739c88.8.2026.09.19.09.47.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 09:48:02 -0700 (PDT)
Message-ID: <2ef85ab0-0efd-4a4c-bca2-370bedb36f8c@oss.qualcomm.com>
Date: Sat, 19 Sep 2026 22:17:55 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 9/9] arm64: defconfig: Enable CAMSS OPE driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
 <20260915-camss-isp-ope-v7-9-77b13d131d3d@oss.qualcomm.com>
 <20260917-modern-corgi-of-memory-6d9082@quoll>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20260917-modern-corgi-of-memory-6d9082@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VMMNmRQQTAKcBdiEIRvgW4_FwLLhrRey
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE5MDI0NCBTYWx0ZWRfXyxlg1pHodj/a
 5ywchDcoZkZXJD2l5SiSoLBBk+QctsA6PbHRjI0QkKuWNDyCkdxXm+XX2GNiuRzaWyeIL3L7mZt
 5/G8YgeVBC9KhBa1zxQ9tWgUD/X+KME=
X-Authority-Analysis: v=2.4 cv=YqWa1IYX c=1 sm=1 tr=0 ts=6aaebcc6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ISK6p04Y8w1qFYbiysbuaQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=AGB_TLOESQuI93QLNYYA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE5MDI0NCBTYWx0ZWRfX8kKywgteXICA
 IhZxbF5aHmzX/BcmsPt0nzhsk2Pzzsmnc/mvjK3U50hzVlP2lU4uxukFJB/zNzjiuo6aVnFKrqm
 p9PkO0QOXpTwWjxmZEg56/EpKnrmX7Qc/jsa+03U+5oYZ1HLdNGX2NfEhpycunQuBDVJfjfWCn5
 h6nNv8jrXupO3Dyk49xzYduCqXd5ZIWaJXHu5W8n/NN6SP3Q/Jv1O1sXjfDJ3iuuzovKTDOK8PF
 5gxfgk6F9f4sizR+M/G8lfuy6dN+eYncvgbwGrKtG9xqCGhXOC4kbRWyzw9dRZ1jfDottaZS3wO
 G1620zUtyy/jGudRV9tc3Xh4+BzF3MDn9vaQv3ZlnH7JZaNBQ7CTfzWzrAHSFM8kuuPup4Ki54R
 /GH7RgDIvUoeyEZg/35DfPl2igwdHxB6hvD1kldYldcgvXR1+fy59awmE/+2aO8X+OQXK1w3jR+
 SE4N9HqApuiAcUiz3aw==
X-Proofpoint-GUID: VMMNmRQQTAKcBdiEIRvgW4_FwLLhrRey
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-19_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609190244



On 17-09-2026 15:30, Krzysztof Kozlowski wrote:
>> Add CONFIG_VIDEO_QCOM_CAMSS_OPE=m to enable the Offline Processing Engine
>> driver for Agatti and Shikra platforms (e.g. Arduino UNO Q).
> Unfortunately same comment as usually... Samsung Agatti? How anyone
> outside Qualcomm can figure that out?

Ack, will address in next ver.

---
Regards,
Nihal Kumar Gupta
