Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BE543CEE3
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 19:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792093679; cv=none; b=M0runMa53BwQr6zAqPKEiZVafPaYc70sCKxOpWIn/D/qaPjckfzI9RZAy+bKoYAxBUURtG8ECZ83WPd0sNA0DL320TFVB3KgielmqHqjGLHFnAVCN9PqwlKdHuRmXe1C/vAtksEKG21dTmj4D+vm/WLuOp/4f+JnFEXsBDNE7U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792093679; c=relaxed/simple;
	bh=a2eCj0h2ijL6N+sNo19p+jwZRN2ssbDrAbTTPwAG0o0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GHtLsGWcB52GJgWT6ndWOgc2PzDFsOdk1m3taMxuYNC8v+ZJS/faiF0SnI9wczeVRtpeqShY/UIsx/ScRS5wPw3f9EPrhPCEg5gmpp3VWY7Pfi1vx9Cs0kiJXQWQrnU/JtYZmfFGFNFf499uj5PchFIauy69osuCpZbiSUcrgqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xe84cgqm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Su5RFUgF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xe84cgqm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Su5RFUgF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FG5S9B3492964
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 19:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TGe9ukRyogLXaSFIz9AterLL9ZxnrCl5Pp0
	plLYdHlE=; b=Xe84cgqmIjAfum+WB4q1jdGsKoBgc+8VwLX1fmsmmRH+4cLyzDz
	MbP3VJkihytT32yXZJAz2RSJxAlgClVHh6Q2j5vQWDtUPdSf+BwUnROTtn5fU+uh
	i2jtshv7+b24VXMm/rngyt1ZXoF8wVrXN3BkuTrHGAntBrE1hcOcGV7rcukQiVCh
	LE6FzwUdp6ZkrmjkUbjsKK2NfYy1Kae+V7JnLgEA/6Hif2vrLbJTj+zJJy0CqJWl
	vQJS/2N2ETAOwTVQLGpLughDUCsh9aLBTh8WHTXm5UIUCI4yHYO/tx7Ok966WlCX
	MbZAt+o+s8xqoZPJpp7TgBeP6PW0JGD67Og==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb21wru0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 19:47:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f13c143c8so154843485a.3
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 12:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792093673; x=1792698473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TGe9ukRyogLXaSFIz9AterLL9ZxnrCl5Pp0plLYdHlE=;
        b=Su5RFUgFChwoY8NV6KlLd9rvk7DNGYvj4ARqGvuvY4HalzMGSp3pcWVsZjcc3qR38m
         NbSJtyb5DjdfV4GmvqWh7FUBUY1bgjXyrUF26i+7pXTMXOZJar9ykVuRjYqjMnKSZ9C3
         yDItPrWt07N+CiiT2IKiNFEEqO5ns0q9VbTW6L2G3Bhal+SRt9eFM9V7RtF9WuCaK8Af
         H53u3DxZ4+cSI+dQsQKtORHrY8PeTAGT6dRs8s50qtpKvS5yu3q9hveJOFfv4f0svvUG
         sJGarjtceBQzyfs2g/YjvdBwqamGykF60NDBE9aevDbgdUqUPNSCLUuo0MUeqHNOqgzg
         oOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792093673; x=1792698473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TGe9ukRyogLXaSFIz9AterLL9ZxnrCl5Pp0plLYdHlE=;
        b=j6auiwgfHYCA0MrdsBSNSn2201/LFI1Pj/GXFdjrgQJJ1ZBagQSeLtXRNk8B9BuxlI
         u9tXnhzS82qZP1ihRJ2mbc7uYQ7IBTwZYKc0kzP/ut1BwrFo4T1EUiVW1nXk0dauZNOw
         J9liWtBFGTHB5BZ0unqhZjDj2YwSJPlZrry0MQbx4l8mPbIKvaiw5OLnz5kvpxdDUhKY
         2vvNhyCsU/Jm2S5ItJx/oWLtPS2lGWYQ2Qbc6QzD4PROIvKW6XDuk4xsP8rC9Rq7lpid
         gvLzLSsAMGl16xNwN3IqT59K4xr/ndTz4UkdBgZpCeaXtP/YQpQ8xOfqMTFHYGY1tpFJ
         cfaw==
X-Forwarded-Encrypted: i=1; AKwUvBxG9K+AtuTbcBjOpywyjOPQlBvLNFrCS58tIH3CcBV03J1WAvG58Nw591BAk5A5CqC/12E90U4sETZq@vger.kernel.org
X-Gm-Message-State: AFq9FYJC9sszDwTZCz3xC+zQSoDh31MBD43hEd0zdNxHszWbpUfX6cIH
	elZYdC5eaSbYn63ZvaTFBKl+dMPL9Oo2sFhgT+HNqFVJ8+7sauq7FtgteSn/Yu4I+dmtHKPx54h
	KDmsOhNBgHBlYqFUObVNbbAB/ycp3tK3WMw4qAgI2e3b+18XF71AG2ATxvW4Bbqi1
X-Gm-Gg: AYBFou1izOgRcGPOuo6EYvd3DoIfep1Y0TZFfM2l0iPT4zM2sY3ozi0A1Vw/kMq7ORg
	w7wqupDu2NUm2Z65HNajxUWqKvVDWe7B6ib7jG4zPwyJyr8MZAriWDorf5Y43V43Err1w6pXpkh
	useAiFZG+IteHm5bRJ6z3vnOWf+3R9kuzZWwbfvontmrsIxABeCJhCfNjjiPVE9euYQgq63QBJf
	dGXtp+YMQS3a8m7vvmV9MrXe8BHh36XaJoqUYkiN79RYY8gU5c0ZDC4JVeg1zU6DqLMrdZCR2Vj
	5tl5/Xo3m+p8TavCqV8pXmgbz8cGYlk5w6VG/rhJkhrgOVs3acuxRJ49oJ6zzQqOCBGEyP9Z2hl
	ZIG/wXCGRawta
X-Received: by 2002:a05:620a:8012:b0:93a:1048:7d2f with SMTP id af79cd13be357-93ebd25a423mr3181566785a.41.1792093672689;
        Thu, 15 Oct 2026 12:47:52 -0700 (PDT)
X-Received: by 2002:a05:620a:8012:b0:93a:1048:7d2f with SMTP id af79cd13be357-93ebd25a423mr3181562985a.41.1792093672234;
        Thu, 15 Oct 2026 12:47:52 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c4fc4sm138027f8f.15.2026.10.15.12.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:47:51 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/4] Mahua T14s Gen 7 eDP backlight via PMK8850 LPG
Date: Thu, 15 Oct 2026 20:47:27 +0100
Message-ID: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: A7fZ52LuSo6mpu69ncr570onmnAicprz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA3OCBTYWx0ZWRfX1O4nfPiqSKn7
 /4Si+p7ZHObrG6CSPvGsIufEL8JJ97E5y96A1kVbs/3DsoOsiyjWfNlyIq4Ezip+kYCMu2zGgc8
 Lw799PH0vvY+KH1S/P0cDG7+JRAeicDJ4to5Yeriik9hDJKsT7Gu6mys68sytcmBfHK2Kr6U2OS
 ZjkRH7pbDg5lYWop9EDEPAKoSHA7ZCbl7Em/Kbfj6aw3sc/AfqVcA2fhgkwvZhcqqJGwqapmisf
 PrJGMBuPX/WyYlEu5ZutSdNRMTMxFWIEp5YnYMdys8RrW874ZSFCrSMNn+QEOXMEWi/Zf/maIMp
 tGRGGsKdxfUeqUzMAIR6CMvlyhsuPgshseffa2JL3IL7+MF/46OUeA1VjS6YnNlU7ufA0oJm1T1
 6930uSm51DihHnl2e/C5iKV/U6t15nB84eJ0dtVUbLE/jCJMlNBzjGVKWdzJXv9yeW1ahkzZmtT
 nizyz1weLcpfb7jaInA==
X-Proofpoint-GUID: A7fZ52LuSo6mpu69ncr570onmnAicprz
X-Authority-Analysis: v=2.4 cv=R5qWitRX c=1 sm=1 tr=0 ts=6ad12de9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=6d4XDeVx90xq0oCfjTwA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA3OCBTYWx0ZWRfX9PiNawu8EEka
 bw5jc295RyE0t430MEF/srUQmXxi49Mk7/x01RlaZdFVoggp3bBAiGo+wdGtemHSlruVmRser67
 zx1zDrDvFVLi1SEZGq2qNTzLUjGq/7M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150078

Enable brightness control for the Lenovo ThinkPad T14s Gen 7 (Mahua,
X2 Elite) eDP panel.

 - Add qcom,pmk8850-pwm to the LPG binding and driver; PMK8850 reuses
   the PMK8550 two-channel 0xe800/0xe900 layout.
 - Describe the PWM node in pmk8850.dtsi, left disabled.
 - Switch the Mahua T14s LCD overlay to a pwm-backlight.

Based on next-20261012. Tested on Lenovo ThinkPad T14s Gen 7.

Srinivas Kandagatla (4):
  dt-bindings: leds: qcom-lpg: add qcom,pmk8850-pwm compatible
  leds: rgb: qcom-lpg: add qcom,pmk8850-pwm compatible
  arm64: dts: qcom: pmk8850: add PWM node
  arm64: dts: qcom: mahua-t14s: wire backlight through pmk8850 pwm

 .../bindings/leds/leds-qcom-lpg.yaml          |  2 ++
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 26 ++++++++++++++++----
 arch/arm64/boot/dts/qcom/pmk8850.dtsi         | 10 +++++++++
 drivers/leds/rgb/leds-qcom-lpg.c              |  1 +
 4 files changed, 35 insertions(+), 4 deletions(-)


base-commit: f53c44783aacd8920469531e7c45f9f70afd291b
-- 
2.53.0

