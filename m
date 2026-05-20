Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C937F3769E8
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 07:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779263703; cv=none; b=Rkxa41HizDmNUDIn2IpkxqYYCoHSym9zNSMNNGSplGA7DyOFn99feApss+O0pIgwCtj6pzn54v4hIi0sIDEW5zfRKhFJILvfpFs+0u9Tv1wji/FsvDb35iwdNRX/4jBwTAFI2RYLChNUdJHqPxkzAypeqx9JW4tiz1baa668W50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779263703; c=relaxed/simple;
	bh=aoh+innGstPtXL4+Bt+0lxHkcZ0ylk7ryHmbDhKW6Jk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mBN3q64HpwSpXo6OCn2L4T5NcGzKht3uwYY/EeXosP99VVeAEnYSCVRStj6YMqnaMQrhlEEnKJIL4bkzVHitFKv0Q+Lx8GIkKW1ly90nlay8AFaGb3veH+u1I697ampbVvJML9Az1S6HTeSmXQYLfGLvAhtKo4q9mzhcQ6WXmt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=biiKYnVZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IDDRBtKu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="biiKYnVZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IDDRBtKu"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7qk1L2064625
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 07:55:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/fhMLuyQzIu5qdG02+whMf2PIVo3KhkuqRW
	4D1KGHH8=; b=biiKYnVZk8i+ZVw2cARiqxTdq+6DzrDKx35mnHxn/O5ZP8YHRfz
	zhApiY0WpmjZmA9lckSbbr75sh8ji191jVvAEf7wZRAxSSpnpWQLpsdLXmRHWtl0
	pIYruWR8lX5HMAR0oswxabvsD8s2cACFOGmzQUtEikKiDc73bBZxHIRKbY2jp5ET
	uEr/bYBpbYPdaPRYLta4XHNYB/jXB60knY2yu1HGCWBybiOkOMZIT/HXQzpf0/FA
	Li5V054hGbxAFU5ZHZVNKbdrcWuK2XP0jNl9B6AgwRPCdm7h9bKOFJiyat0XXQRQ
	w9ddcmNVFVgJzizBueAnj0pGNJq42iGzz+Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t3kj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 07:55:00 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8353fbc7ad5so2386780b3a.3
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 00:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779263700; x=1779868500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/fhMLuyQzIu5qdG02+whMf2PIVo3KhkuqRW4D1KGHH8=;
        b=IDDRBtKu2MJHWfmCsyEcGPw7rWDoxLqsBk5Q2xVmBvwRUR/JoLjKRVub5fXBpT8uo2
         TQMQeWaOouxJQzYDAJcPcRPmF9xDsmCvYrps9Zc0Xdt0ebn6eQxHVIs3TLqh/C9e3YV6
         JpKg5zhKkp01M5JsuocNhbe1ZCipNuCPGEkD0wqRsMOKDj+TWCS7AfRIf5L9YouWOocb
         IhAKt780vPe2q1QfUt1M42qpN++w68CxtDj5wMgfC7pnbnH98xvqKzJY/N5GBX6zCm5e
         KpG3ya2+ukMPp/7fp+12zufFS6gU8/1TS1NhNyzuAUOaca2hjUS4xAPoSdaIUmYCUfaA
         QrDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779263700; x=1779868500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fhMLuyQzIu5qdG02+whMf2PIVo3KhkuqRW4D1KGHH8=;
        b=KhaI9ofSuUhq8kEH9PcB5RNIgi7ojrySrOIMJt7GtarotY7KflJGQKxA8NoZ1AB9CO
         MyRAsPGJguFj7acv3CzEiAOoabkLCMiEjbuUNHio2ns09ph1rUwrwWHxyUJnNbVEW6Ev
         iDyBEPsw2KG0iRo3pa8DzK8WTAgCT4pcMZ1K7DZlE6n+D9z3oR6UQs0Hxpo2OnKP445E
         xonUHCnU/5i/jcQrgBE8+TW8RCtENWtTiXb5FcBpwyMTrMAb8p9mAMWq3seDIsQzNQ7i
         m22yVuP8ELONPRj640lSMH55E7FGvrOfYmah05tRk7Rtc266RT943f9txcjvbj7CGgNN
         pOPg==
X-Forwarded-Encrypted: i=1; AFNElJ+GmKdw0ViCIOs6wrdfTAk3BrkSYh6kZptYt0VX54eKZLR4PTMwTDosMGv8lMP+wcPsPFcUujHYRv9y@vger.kernel.org
X-Gm-Message-State: AOJu0YwdgvAVkICSsCPqruQwF8uqXLwWwZl8pgZVDANpuSN0s1pDrxtR
	lXDCkg7kg9UsVXrq9d13lCMq6+Ca8SECTpciZl8H7xn1urxe9mrt5DnCYzgI0LF4hA8jjU6ReLZ
	MwjdNx1iifGaoycUssLRNdTwlDWeWwzVp0cP8ifOKNK6GJfrIP4t52Gxu9d9C/l/l
X-Gm-Gg: Acq92OHVuPRqwIkjBBiNRrLKgP3/pUYQL2kTJMA68oUdYsPwHuNlzdGLceYFW79DnSH
	nppmNYrT28cS1oennkqZN3Pk+jNiLXXAe6k6C0JbDMZvRoLKR3//l0XKhhTKcE0b/ZLWrcp6lRx
	I/zwrGAiaW+JSMLpou4HebPGd1g5qqqqurKKLRJ7kCEP0PkNk0I8nuihETAu1V8h/+Xn7kftcO2
	I/NrGw3m3PIX7ryiNqpAaCQrTVVykPdSHqk81AUanT0zX+jeZjJrRgWcYM30Mmk/U+npkJ+ilWy
	8eZQUws+vIp36/GfXQSH4E5vYZFG0JGyRBc0/pMS8VP6Ewu+Oynf4Wcr8NNsBar7nC7PMgnbb8p
	P8dfvTo/QidqOQBPoONpmcSlT24GxIPsqtRKRYr4dqQvLN1Ae
X-Received: by 2002:a05:6a00:3028:b0:837:8c8f:8f51 with SMTP id d2e1a72fcca58-83f33db3f0dmr23589493b3a.47.1779263699436;
        Wed, 20 May 2026 00:54:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:3028:b0:837:8c8f:8f51 with SMTP id d2e1a72fcca58-83f33db3f0dmr23589464b3a.47.1779263698940;
        Wed, 20 May 2026 00:54:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5b296sm18827998b3a.32.2026.05.20.00.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 00:54:58 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: mmc: sdhci-msm: qcom: Add Hawi compatible
Date: Wed, 20 May 2026 13:24:45 +0530
Message-ID: <20260520075445.2146152-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -Z53r6wlVh8zrbL_DObgGf0t-UT8n426
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA3NCBTYWx0ZWRfX4d8+eqazNdav
 i2GJhXWMcsu1rIw9Wao5KOBCbGUSOV/RNAI+9pHPVMzf0GONRNZl9ZeplRc6zGgeKb4vSH0JOFf
 uk9/hMM1W3G7syvdCk6cBtqgSdQryXb+dRKtYs1bMyoTsH/fukU33Kizx1fipgIOr8NniLTqIoO
 X3S4fkkP65x+E4bytvAh1iVeK6gXgpFg3C4ATk6xDA4Fbrsq98GWtnO71UULUo3KSQmTgnp5fIS
 35jOvhc09xqIfdqUsbGIBGIXDX6pku/28Ns0Pce4r5HgdFQ5/wkiPOEXiFGda3EvB3g/H3WJ0nC
 lO++fzs6OnxZ+VxfX8yw360v/OvWznfw0KBI8lUVZCcrfi7xDsB6GD0BxIAEpC+BGvU2b7yk+Wp
 N6Qg84ReQuDOq5XaEkQTFp4A23A+miwja9q0Zg+6f/fQ4a0r/J6qgNek8Xbu3CyLrXC6WhWgUUC
 w3LnT6GTxM9q5WJCnZQ==
X-Proofpoint-ORIG-GUID: -Z53r6wlVh8zrbL_DObgGf0t-UT8n426
X-Authority-Analysis: v=2.4 cv=C4LZDwP+ c=1 sm=1 tr=0 ts=6a0d68d4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=2NBLM9u9rd1IYMrnCwYA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200074

From: Nitin Rawat <nitin.rawat@oss.qualcomm.com>

Document the compatible string for the SDHCI controller on the
Qualcomm Hawi platform.

Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index 695a95e8f35d..acbbbeb2be45 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -37,6 +37,7 @@ properties:
           - const: qcom,sdhci-msm-v4 # for sdcc versions less than 5.0
       - items:
           - enum:
+              - qcom,hawi-sdhci
               - qcom,ipq5018-sdhci
               - qcom,ipq5210-sdhci
               - qcom,ipq5332-sdhci
-- 
2.53.0

