Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1BB3A3E60
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 09:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776071818; cv=none; b=RkzIvHf8ExKbcdK5V6wnEXhr7NRsplKlJKl/pbQa3Zo4Dk2qpa4ZL79ECSGxoIjRCt4HGsVqKtKahX+dd/p+gDEyYUeZkisGDj6UJoaH6tFFY0nDTgv+eu9WzV2rppS0Ge9basqQ2AsSI8zArVX1S3VwtJR1U4sDsIoBbr01U3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776071818; c=relaxed/simple;
	bh=YnftY9+ehUwSgclaGDxHKtysSDeKaKfz2pmZhieH4o8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kSnBzhMdPaT+iVjGcEaCZveBEVKLxQ7GqByy/chj+x5EdDJQattlx08WrOubHk0i1jDTboKZUozOUFLNitnaY+exVeX5Lszcv0WqI53bwsNqfUzsGzAsT3JfbrUcSoCXsSD0/C/sxjl9QQi8b89j0YnbLZwmjccUieCY4t7jLjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PjJfZ2XK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aDDpsBgN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PjJfZ2XK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aDDpsBgN"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7aXCG1679973
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 09:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9nPvxcQMAx//YrsAq7WIoTHxGfhB9nazCVh
	lwcfLYsk=; b=PjJfZ2XK2rGHUgzBcLjX/54SSoOtDVFu1cpyEZSpz/6FS75ytmD
	ZG4u0UYsV9WN6v+1Mcoa4qT4bdsnIh0+7NwE2g7IRorzY1M3UhhRyxa4bmYuv9Ox
	8xy72M0PhSd6XOHaQfUYqNvcJcuUXI6v/6xU5O2xyUY0x4CKWLhDm/h6cSzsnCUf
	7qcOJuhVu1KIWOWa3Xlb6iXc/sb1kTtCkLZ37HP3LP2d5/secWlA2PsqTAB0+kSx
	vOrvzWADvzAE+S6FnbEpliZCfsnC4jdkaEVFdN6qGm/AKXkM1EkoJSS1+UfnKeRN
	ALoH26k1Jd/QfgKeX5L20mCJavXsNBWyUSA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexfvmtu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 09:16:56 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2d889997495so3118644eec.0
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 02:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776071815; x=1776676615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9nPvxcQMAx//YrsAq7WIoTHxGfhB9nazCVhlwcfLYsk=;
        b=aDDpsBgNcry2cl0C5/PNwrj1VcDnfc/wIkuIneOYUIjwKJ4BcX4P0cD6c0Y7XMDZfj
         VvfW8vHmw9TC9vQh9sf8XhXRT2K5Yalna6xc562eoUNqC0YTy8lswOFcVEhVENyTxzM1
         Y+KUATd59VKsneIy4GtNyu+DhV4pLSi6FzeoBqpvKRQDx1ejpRcghDwWpq9kJVjzcFUS
         cn47gi6+jv2lA0dRY3uHkxOdXQ+MIKPk3tMbNsqkgKu25YgKevMNtweLeWIT/4k3d5JF
         fqVdl0CuAFmFmgYhpb+TG3/rqd3uggoj3cgtEm5TbC18dCW3g1teO/Dj+DYG4NwRHr1g
         CrxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776071815; x=1776676615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nPvxcQMAx//YrsAq7WIoTHxGfhB9nazCVhlwcfLYsk=;
        b=TGNVzlB5miapMAC7irTe8N9WUxdHgqFeO/D1BO5JRu7BJ5Tfy0bFM1mpgntfB0dwb2
         PRznFUi25o8CgO2ylLoE0yzawglvNjEkboLOwjl6nIqW5XDZE3U9kkibtEltVDFwTyEe
         AOQArGMRTd52j7QbOi37vS0L6F+/r5C7x/a8CtUo53+h5rSS7a14t5FWaCpnK3Hw0TPT
         Nv4hRlwaTK1WG6tEgawmsaBYuLGHHGb4V4ZZTpyY9ktP3QynLdlCUPV/nMzCoKOS2bT0
         FvgecpzMxRyj9XeMX5ta1WSoHjgGH+wywGwJn1luXm0HntvFg8t/tcOKC8hApj35mCbq
         Qg+A==
X-Forwarded-Encrypted: i=1; AFNElJ9XcYi1dbdghXe4pQJ0DvgNXuTYaHkuqVpQJ2XAGrkj9y/eJMJmWXwZJ1rOfbP0zkxmpvwtIq6PUZV4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7XdvKcFTyjy0PvhEdS5clhP7gXDnqbxSOpdp/BYJ25kA7Ngvv
	EUK4g5Qymhrc4zCtg2Ft43GkPxKkkf9i+p/4HewKcvpM7LZpXmg+eADkS8LOpViFWQn9q3V0acO
	34oS+k64Xpo/Vxasf8c6Y4lzQ7qYdYlOHXKRzCQ2u1Ejkmj5au4psnVTOTvp1Fw6Y
X-Gm-Gg: AeBDietD2upSPz+R/oIdO65iSM3RHpw18gzIfKEOSt3kfLeERmYAiUGQmDDqohaV2Fz
	fNk2kTK+TDsxMOJQ3xOLfd/mfEucJ0f3sNIyp0ehW4wPua2KZ3JNNk6QSKbRzaGdRABTqCNnuWa
	F6oZvmFUWNQPtDTBuFB+57QW6LXzfrwQnTTMK9eYzV/icbEs1U+ATgtvDCv8eB9o3XLLe0nx5w8
	lH20wa0uKlu890VCYw5nuzsSTH0+4VOl51MaZ/twuFBfNyegMAmHnfdEI1PyYNUEQhJGOJy3q/a
	+9GV+QIb5GCPUwJ8J9OJjH61d2LM6OnNTsiWR9Dz9gSsEe1SlUKbwaEiT5JljOSLg+/iYniOFDw
	Rj4WRsySpD+1AIkrMAEOdgLoB+y+TP31WGuk1tqkdxMevBlHA65hhQ0Xfo1BcuG1BLRv7WvRU8b
	wYrRFptA==
X-Received: by 2002:a05:7300:8609:b0:2c0:e404:8b08 with SMTP id 5a478bee46e88-2d589178770mr7841090eec.29.1776071815294;
        Mon, 13 Apr 2026 02:16:55 -0700 (PDT)
X-Received: by 2002:a05:7300:8609:b0:2c0:e404:8b08 with SMTP id 5a478bee46e88-2d589178770mr7841080eec.29.1776071814764;
        Mon, 13 Apr 2026 02:16:54 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55faa571csm18349212eec.10.2026.04.13.02.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 02:16:54 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/2] dt-bindings: arm: cpus: Fix and extend Qualcomm Oryon compatibles
Date: Mon, 13 Apr 2026 17:16:23 +0800
Message-ID: <20260413091625.607976-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YBbHj3Eh254DybQjuHp2iAk3Lkj25IEX
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69dcb488 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=ewe1H0Pqv3kREx5oh8cA:9
 a=UzISIztuOb4A:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: YBbHj3Eh254DybQjuHp2iAk3Lkj25IEX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA5MCBTYWx0ZWRfX+VJ/bsilhZ1P
 X11f/576b8uzZdt+Vrd/o+qujJEVji0Y8hZlgnfuN9GISmFT+TKSna/0VX6gyJ3zBy1HIpaLuAk
 9lW/WeSDiVeOz/wzKlasuWOVvE5KYTjjj0CHk9mSqnEa0fCDsr0QYqovebMHba6qz+BN/KUOUHn
 9vOoE0uXRLkdllH1ZlVx0mn+hFkMaGRSjD2Fs0oWv65s/uxOx+AYKuKegdWv3TsXe5D1kAVgy6V
 oxIAGZ+9tZUul70dOJ0BWfWhQNRzxIZI7NlEFRYBGJkHrM7p6rl/Ik3tBUsDq7VPdInS1fjxqkR
 Ozc2g2AOiQmdg4nTFJKLxXx7QscFp8jFKwFS3P30S09U7SKio46mtXPJh9zdAn1T/dA8Bhoqho8
 QdVzBWXF61HFC7U9vFhtkraModmvgqT6xBuyYkLI0mq0FjEbA4LSJQZMOzOVt98uaCcyXwLZRHl
 Afjd5OFsuL1hwbL1VYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130090

This series restores compatible qcom,oryon-1-4 which was accidentally
dropped by merge commit f6935ae6147b, and then adds qcom,oryon-1-5 which
is found on Nord SoC.

Shawn Guo (2):
  dt-bindings: arm: cpus: Restore qcom,oryon-1-4 compatible
  dt-bindings: arm: cpus: Add compatible qcom,oryon-1-5

 Documentation/devicetree/bindings/arm/cpus.yaml | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.43.0

