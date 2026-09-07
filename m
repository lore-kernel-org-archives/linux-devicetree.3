Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8706451D50D
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 18:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788804624; cv=none; b=ej6UJ4NKqKI/Sz2+Qp2ZN+Y7+FuFHeepDCDmFcP+VfCmkOvY9JEfIAsFekoNKs6Q12+joKuMQwKPMI8X6KRTbui7inxL2utHBFow3VOv75T/0F+cp2ngjEuuT3EvqmCEmE4fnJ7jDmsOXWEvqdxyMQb3ByA3hjupZD25A5POOHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788804624; c=relaxed/simple;
	bh=jlxOUHl8Z+6cQ6KUUMzQrWIH6s5N9CCDlKCO2Czi7h0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nMORymno97v1o7PqrlQBsIRjLqiEX7e29T4j95cOuOKmSOoyjDbmMnmUUO+esDDSSXzbB5uJgbb3nr/5qFIUWUDlznWM1yS37TGr6erj1IqYgNeFCq5uEuZ1NlmCL5uhnP7IBwH/W2orCZ4/LY38g9TmXmPN0wzmt7zhZXdpJZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EVJpk0D6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GnWsHLel; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EVJpk0D6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GnWsHLel"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687H7f8j1641974
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 18:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wm7XBRyValOtR/DNXwquyJcr3sdcTu6s4SvfRAV4KXk=; b=EVJpk0D6kLXd3y49
	bHvaL0cX4NexOL8q3od76NS5v+Xc0KoZO/zP8dByAr7jxhJt6HkcPZQgwauFstLK
	BJOGRTdPElCbsOBRd3PTlB4pWjaiwM3yTGAiIIk138c8KI7sw1FjhrSpon0N++1t
	yLK4GpiYjh7lkKGAf49O8L3qqRwetht60F12Pc4lR7jX/+Ak8uN4JVzCBhSe/t3U
	zv78VaJWyTCEZPOy7ZQcLMCve90O1gfUik03rg7UUnheTf5CRsqwAPOXSrYC6/ta
	KhfPA71ixJGkJxFxxk8mAcJ8onSGRDSt/dbLzIcfvEe4uG2TsEDmB1NxYbY4SlZw
	2KtWLA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghruaajy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 18:10:22 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso1707844a12.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 11:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788804622; x=1789409422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wm7XBRyValOtR/DNXwquyJcr3sdcTu6s4SvfRAV4KXk=;
        b=GnWsHLelW6tXR2FLvRG3002utrwy71nT8OGeaGya5ZwFY0bBUzB78HG2afpr4H8MYL
         vqmXc/mlVh3KjF6ge6bQCoiDfTJTz1CwdCSw744G3Gsj3f3Zp20rfqu3pHhYjtpuwwKU
         RundB5F4ZE1c9Q+dGq3oopCEwR4iy08IzQFnKiIIbzxIhEhPHJuOOmLUHCseD8AC7j3Y
         sXa0WDXNOG+g/ACm6eMyXSWaGLbEp+hyQXMUSXGzoMBRHt27MbqJx6Nfl6jZRcNGRXvc
         k/3Cv6rmlAoUp14eXDlF5LIZFcs8nsndye61sz4Mut9cbBxWGXREbjcMupDftGyutPl3
         P8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788804622; x=1789409422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wm7XBRyValOtR/DNXwquyJcr3sdcTu6s4SvfRAV4KXk=;
        b=pX6knCNC5PAX3/Z4FDVYkF7xO5+7EusZsYjk7aIrhXTZlQ4aIsNvM6Ht9h1WlaGlVl
         AZPAEf2j9cZxL9moST/CM7a/3bJLNp4/MBuetIyIYI8T2fp9vLJrUs7gXQMiLW1//iQ0
         eFLdbFyOtgledT1KFCNbJzPWbUHUqVjSBXqMqSSGMOrNQ46EHj5OOzJUJHBq605bK1TR
         7m542GgJsEgQ0KvSqNA0DlesBWBZN5mU8OhaMQVbQmxjqbdKDVbxX//UdXV21M5lNtB/
         ddsn7hgV6RvxGMnIrXg3u+mFZDs6ueTfgtomzfnTioA3xA5wdnoVoFKv2dzNqmoi7XZD
         y74g==
X-Forwarded-Encrypted: i=1; AKwUvBy+bBhCLE7DidO2OsWFYSyE/vqJcww/oJQphLXXyI8PK8zvhW9q0ps9yThTWmw3E7PfSMocB4t5/I1O@vger.kernel.org
X-Gm-Message-State: AFuF++l6SrENwrDhhsWEemqHfvIWVTq/T9yoigxgVUNwsF6lVLcodp1v
	uGY/AbcIwjx8bZi8BBM80SHeGSoQZ/+6lCZQa6S7o+chLK437rFdqzJQwYjeIVVNCcexOk8DYjn
	o1EoJkViKUFMxDMTFJgJ5qb1VP/3Bkc3m/mrLVx0YQFme447lEqWBYxEDEyAdaLIU
X-Gm-Gg: AYBFou1TyqYBpVq5rv9StkBTQgmtVsQbidEUHsPG1UKIdmVxC1bOLzR2v2C1ZaywobB
	T2xpdALUERd9F6IGFWwmhHUPeaYcKK9Shlm51EC2o3fuVrStUu0dWq1INJUiWEdgpOt97v0/vOQ
	nVWgGZsegDc5WvCZoU2C3BpHNp+JSxaoqh3tAwokWWammoz5s7GEbMb6U6hEwtNd+2b3faeN/Oc
	iM/I8IXkMtwsrZA3WSpPm7hXLlAPIc0dugxj8Xo8nwFbaFAge6wevi/kO0jCMX2H+007I331MdG
	HxwE7rzk9tMsXNwCwABLzMybmZbC4qf7rrNwIQKY+gzDEF5Tio/md9/6Ug0G71dPukmt89Aur+T
	BYEggKoWn+WFz9AqKVFmJ9rFiBSJjhYpPBRWx
X-Received: by 2002:a05:6a21:d84:b0:3d2:2011:d184 with SMTP id adf61e73a8af0-3da3a096045mr40659513637.14.1788804622003;
        Mon, 07 Sep 2026 11:10:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:d84:b0:3d2:2011:d184 with SMTP id adf61e73a8af0-3da3a096045mr40659436637.14.1788804621488;
        Mon, 07 Sep 2026 11:10:21 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm33961954eec.21.2026.09.07.11.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 11:10:21 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 23:39:43 +0530
Subject: [PATCH v1 2/5] ASoC: dt-bindings: ti,pcm1681: Document the
 optional SCK clock
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-nord-asoc-driver-support-v1-2-997d3b20cf43@oss.qualcomm.com>
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
In-Reply-To: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788804602; l=1142;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=jlxOUHl8Z+6cQ6KUUMzQrWIH6s5N9CCDlKCO2Czi7h0=;
 b=aF2MgbKwSLsaC1MnT7styy7HEQ36dddCkTkaKn/x9kG6ibS6e3skGyzxXO1UU/Hsx8N6LkFi3
 r+UBmxpwBjRCgia6osHUgwS258SxUEQXY7aL6DADe2UuohIn4OLepw3
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-ORIG-GUID: tx9cFEWjXT_6vPmx6gvklMYeOg6Ml0CW
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9efe0e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=T4irZKxI8lZzJthKl4MA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: tx9cFEWjXT_6vPmx6gvklMYeOg6Ml0CW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIwMSBTYWx0ZWRfX/S6OupF6DBun
 6lLMyHiI5nAfocXI+JPtcouo04lrVOemz+t8zKrkmQJnMkqy6a2KDQhWuFWZtIsJGW5UA7LgMBg
 pTsbrEbfVOG6pZXUkqmKaN54r3Aq4TU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIwMSBTYWx0ZWRfX/bmy7+3G49Qw
 Jq/Om57Vhw36CfHovKDAg8s9vdQvc1hfcpWmGmbor4xQKpKBHBJ+V+KYBQTVvEPVbABUkLqUv8i
 4+eFGBc8Oj4M24aMEQ3LXjr+FXzPykdU9GROpNLt2+dTUk5Ov5l9mCNf2JMWPQ6rSqKk+k0jLSC
 ZKjCjQDGQvXThKeLcRY4Jxy354luGqJfynGryuGYmETt4+pC5cCvhTtbKL4LbPmDSywg4R+cf1l
 hnDft089jdpAJ0PnzyQlVoSM6MPLIiiaDXKPcBhD7ieVU9Mp7MLrzETVvsNwqaztTa19jRcFPnd
 5ca/QzmXRR4u5RNlXk867XttXOqhKz8v6jXvCtHzkMoswwCdQFXzNUwdVKj8GdFhhp1SKg6E4cp
 b6avV5cthgi7V2dkwjyCN97EzCkTW2PDh+dYBnZZjRBNDn0cZLa6quDFERWsIHGMfMeFqjQjg6g
 FwwcivLydeh6XihZ6YA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070201

The PCM1681 can use an external system clock supplied on the SCK input
pin. Platforms that provide this clock need a way to describe the clock
connection in Device Tree.

Document the optional 'clocks' and 'clock-names' properties and define
the clock name as "sck" to represent the external system clock source.

This allows boards using an externally supplied SCK clock to accurately
describe the hardware configuration.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/ti,pcm1681.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml b/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
index 1f0e6787a746..1b38035189a0 100644
--- a/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
@@ -21,6 +21,13 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+    description: System clock (SCK)
+
+  clock-names:
+    const: sck
+
   "#sound-dai-cells":
     const: 0
 

-- 
2.34.1

