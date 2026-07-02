Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C643E0C53
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 10:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782989550; cv=none; b=ExU9CfESRwT6t/1CJEQT7hLzKPbT1QJQmhG9e1k4R+Fn0wiyqTZF61E6GIsVjrdUrUYjU5PzJNEzROwz+mDCBNB17FUS9oYKZX6F25b3coqxB6VZ/w7U0N2xqF3EU9bONwGIanTCNfRdWadzfqaFo+KDGaTFv7Dx66ZOGTPrxBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782989550; c=relaxed/simple;
	bh=x1a/WF60VikYdwl//MNhB/EYefrJvwLfT61ha6bwqQg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LVeqJewo2Dw1U9L9kVJ0zq9M2OYZEhAGyfz+ClRKh93lU0fcxc5yApj20hbeq11QMXgywTxqJwts0thKO78ZYd1PspugQVWXEd4h8k0NuFsA2HtQ8BUplVf0USCQJjR3KvIkFs46JDw4wRGhhxafVK1z6H+1auE85FhAUQ1UNBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JfcXFdLU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hcfw+y17; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JfcXFdLU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hcfw+y17"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629KPnj4115627
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 10:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iQwnsq7k8nomKElwQsU9QAg5FkG7rYXbrxzfdk69Hcc=; b=JfcXFdLUed+DC3BV
	gX0FvnolvDly14j1VZxuAWNY9J/SMaoPpT21ZaTm3sCs+EwqvRY8C2gyXTQ1qoNA
	2vRny2B3M2NhgT7I94bGbJCtk2vthEm6paKYazBAS7ieIH9Vc2lNVt5zu5J4W+oG
	op6yL4S+r9WQlKFf8n8YSgWVY4ggn7hctPGvxj7muliLbt8/M1Dttt+aba8qero1
	v41J88II/igpZVZK9mf9mpl0eQzO4QtzE4OY4dKMqsy5g3yRpp53fmGK+EoJUpq8
	CBv3hUT9AUu4hr58pTAm2bu57aLfDUjluvphUCS9pRIEzJI//0DwytCgBzyC8K5Y
	eAr6iA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n940atj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 10:52:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e663c29f2so55338585a.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 03:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782989548; x=1783594348; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iQwnsq7k8nomKElwQsU9QAg5FkG7rYXbrxzfdk69Hcc=;
        b=hcfw+y17wt9fCvCAzb0H+75nl4UY0j5KUk3Dq31OHCZubW0ytEq5tMigRoSO21S4Jf
         2HW5NvmvSDi8YOLcm5gmHBpEFmmYUDkCcYrhemg2GzVuos4mjvzdR8hdNN598JzHYDr0
         8k64xbPJe5laHZZ5CGXnqmF7mZwVEmIj7EBaFDoxgVZ2Y4UvTI5lUGVvkD3KaVlLvWSf
         UUNyPS6WV44gTCxYXzS/R3+LzB1RL3ymu/WyiZvoHz53/hvxD9CFPfo/g05CeBDQS20m
         1HiX2+LJGsvVSXAcfwl3i4+x8hJJ+sL0CFNlSH9IXoiTkwxBKlZ5tm13wfmm1liMzrhp
         BGMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989548; x=1783594348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iQwnsq7k8nomKElwQsU9QAg5FkG7rYXbrxzfdk69Hcc=;
        b=P6nYiOTpMuVcI9EE4KBwMFc+h17MOtq1GeCwp7nzUSwSCasOyvt16mhqmbi5rhZjPQ
         dj9LRpixTc1eb3l/h8vr0apKWCJMXf6jWFUvSsp6K7iDYlbDHwDSlek16CO2eihkEbh7
         CLdBqy7xq+a+ll/WZ48dv8xS8iYvVrp/MPRU/f6ofsURO3gxWkdjMT/pqw7f9rFbi5fS
         xBD4PF7Bj18K+pgYIIMnEwzSuRFle2HcAore3ZCSSqm0mgfyNBYx2R62rnanRvaWZgML
         ZTqpUumYwVQU+e+kVBGdvuo8pi/I66Dq65vSA3u81Au/BXB4/G73c/KucpPWucLaLosQ
         ZlGw==
X-Forwarded-Encrypted: i=1; AFNElJ93L9JEYI0Z/ee+qUW/GwAfVd/uzoQXMwcg9o+9QmqlOexbeJrTgGunHK5E3aWWm1B1EiLU6T1JnN38@vger.kernel.org
X-Gm-Message-State: AOJu0YysghUxIdjnpGTbQAVDfnPUweVikuTM0ycyD4rGTLmwz7E17fRZ
	sU+KO/imz8AuOsse7m0eiWjS+cnSSRDnFWfnFrJidG4RNxtBCLicmvjT/acK2v2JJqjPxvMPzf1
	XpP7hbXbKyTT9iSEiwulMC6nHt+1NDix+dheEq8uuxavgYLLWQVZqg5iyeNHKd/ZY
X-Gm-Gg: AfdE7clcqb6hs+iJA4+9ebQE45SLqZ4AJ//oM5X9ErJu02tTsQq3WGLdIiBeRdG8wlu
	IYINDaa1xo26GCFmls9xXTijtwO/WMU8eYuyW8i7FaSwO3rNlFTxpL8FZFZD7hby/fv9v4GeM/I
	uz5lNs8nK0mkdB20ed/pfEWhRuI62Y9Ne611EEFjNX0pdX8Zj+2kRxZKsAODmN1VYmlQyVDGBuE
	K+PbNdC/UubqIPPX8AW/ptxvEggmi59986Zg39w9qGRbdgVX8P82s4meOtmkngW657CjoctfVhx
	BwqfkKecQ/7DPZRP8pEvbVjDLifmbE3aRtoO3EfosV66+bhzo3qrIZE1GD1UWr8XvVcOlGOBWyD
	iAjcY+dfM0Hd6jE0g2uapyLEzNx0jnoSHc14fvvVtZrJhP+5Hxvd0Xb12LoCpsolrwbCZDA9IaM
	ZMscY=
X-Received: by 2002:a05:620a:a71b:b0:92e:87a8:7014 with SMTP id af79cd13be357-92e87a87d17mr44152485a.10.1782989547571;
        Thu, 02 Jul 2026 03:52:27 -0700 (PDT)
X-Received: by 2002:a05:620a:a71b:b0:92e:87a8:7014 with SMTP id af79cd13be357-92e87a87d17mr44151085a.10.1782989547149;
        Thu, 02 Jul 2026 03:52:27 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e80025696sm193565185a.19.2026.07.02.03.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 03:52:26 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 18:52:06 +0800
Subject: [PATCH v2 1/3] dt-bindings: media: i2c: og0ve1b: Add OmniVision
 OG0VA1B camera sensor
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-og0va1b-v2-1-0071442caa2a@oss.qualcomm.com>
References: <20260702-og0va1b-v2-0-0071442caa2a@oss.qualcomm.com>
In-Reply-To: <20260702-og0va1b-v2-0-0071442caa2a@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782989539; l=1020;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=x1a/WF60VikYdwl//MNhB/EYefrJvwLfT61ha6bwqQg=;
 b=l/PTHF8bcs94oJhRxQxmAo8neAdEStEhdDYwjJkzeMqysdb4/ZS8H8TAH1Rtpe/dqLwL6v0tw
 R9t9dE5KEMzDcve4kqReGkZ0GB1wQpet2Nn2XfxwrlRiDMoNaZWp9Ht
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDExMiBTYWx0ZWRfX8pwcFb2qwx/f
 NREjQxpB49ofPBpf1Biy4OT46tOJqiIFaGqRYMo9nCmTYicqliAbx66e2N7gCALRlRr3z6NWhjX
 T/7ihws70VzQOVECM3khf40Xaw9IwDGp5RVkZr7j2wEB6k3Ku0sTQDDTOqynweexPsLR9t2YuCT
 EK09AlqnFQh61EwQbNC7ow6c0op1hBrTWXymqErPxXgCmMiSNf5sSL8MCssQ1CxBKNAFiyUVn2r
 dRV9kLxb6DK1fnfyeGDe4Q/58oOtGyNz0+1XM3yzE7gLaBoIU0/e14kayxh1mY5ZE1G6a1TEpKw
 LOm7Hf/eKfkfy0zjqVHggFw44en/hiW9aWzbmRXAL2wlkfIpXPZBOa9XW/IdeBYlJuZTB7IuFRR
 C6fRxSJR0pVdAarjxzxalCsfqVPTKI/v/zVpjy7CeNd5HUSxWeJDsy1NGGlWV7KR7mRP+OuUKCq
 pyOEI1qUouu5rstpUDQ==
X-Authority-Analysis: v=2.4 cv=Lv+iDHdc c=1 sm=1 tr=0 ts=6a4642ec cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Udpwn14VVy_YQTTuzqIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: gBiNTXDzvHYzR_au5vbW-ySGhOjm0OiB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDExMiBTYWx0ZWRfX9Hoy7/JjD3ld
 dRahuMyFARWrxCa7o2Yu1l+mup/Xo+tlh5b+nRYKWvCiebtkXiW7cC/wa6Z9ebts99SpUCAUWYA
 ekk4DZkdcfcglhcLVDr5pxca8rLfG5Q=
X-Proofpoint-GUID: gBiNTXDzvHYzR_au5vbW-ySGhOjm0OiB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020112

The OmniVision OG0VA1B is a monochrome image sensor closely related to
the already supported OG0VE1B. It shares the same SCCB control interface,
power supplies, clock and MIPI D-PHY description, but differs in its
chip ID, register programming and output format.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
index bd2f1ae23e6547032361924a6953000bab1129df..ae44ec2fa9035b4e19834888a41987ae9e25118f 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
@@ -21,7 +21,9 @@ allOf:
 
 properties:
   compatible:
-    const: ovti,og0ve1b
+    enum:
+      - ovti,og0va1b
+      - ovti,og0ve1b
 
   reg:
     maxItems: 1

-- 
2.34.1

