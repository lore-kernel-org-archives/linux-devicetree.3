Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DE43B2FD2
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 09:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776071825; cv=none; b=DcCSef56oMcbVQGCcRR8g7lGXk1Akza9a7EU5I1HLCSruBQnBrSspmBWSlP+VgHj+xfCbd6W/7paxpoKCkFyNKbq7hmEyxpwSzgVNLic8nnaTTADI3sfwurULK6+E0v3mWaX0zF/wz7zlkKYAQr1ZIpDoqGnDOgycqXzJd2rDzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776071825; c=relaxed/simple;
	bh=lqq2IfHlkFH+xqMsu2m/xGebIN7BMnOm/EZR6HzHe0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PzmQvKoubCy+mTNILnSiFnMkOBt/V95WZpOGAMjayCWyUkKylMUVd3NNYEfzg5Zm8H2z+Ud/yRUlTnyJxmHjMncLcUYyEaqAi6wxjSGM0zk6AnAL2Y43ozL318aWCoK09Gv9fgkN/LieSqzq3/tq1pyn37inO2Owzqf/G9QiHtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h5On11Il; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SXqQ2nvv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h5On11Il";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SXqQ2nvv"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D5CeiH3560421
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 09:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rtDg6wg+zXc
	8K3rv9TpWuQ9j/5nJjIGixceMJjhljqE=; b=h5On11IlkOUikTS7qiX7XptJwkr
	aazoPRWF4eu01m1SslcLMESAPQPtdI+x21KeTaLVIc/FqwQ/eaSIZaNHCziWVAda
	nsiD5ZxZtGbkVbDU7i8XRmv6AYbp1uMV7U3iI0DDoWeDrVzld0K0+luOhpq5ykmZ
	0aT5Ippo2vCvERHXtrAHUAATsfn2cjlS+cNYWTHfN91S8tuOPoEuHt61JNSLxs8R
	lp7VaTVUrdv/hwiVUZ8duSHdjue3ZTOF3LIerUtI54KC/hDxLZoQh6l46hYOzUo3
	gnEah2uRWoBD+WSEiVBKJllUZt6KGmKVGT2v2U9QoxAOMYEP4mGdt23HIMg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffb0mk62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 09:17:03 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2d8a677cdfaso1011287eec.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 02:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776071823; x=1776676623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtDg6wg+zXc8K3rv9TpWuQ9j/5nJjIGixceMJjhljqE=;
        b=SXqQ2nvv120yCDiDl2tRUWVd1zK+7Nx7nObRyjzBGJ23w9z+s6UpTib/DYy8LFS1xP
         V5xia9XkLQZfSL6WcZA9yhLPrVMeSM40S3r2dgtb9Xf0Gn/74dORLqufi1HLICCJz2aX
         Zu4f1AqzW4+bPxAvEVl10wXyzi0s8a6zVp74n8yh2EaO5nQraqQGdQRyQ7DwGMoj87Zg
         /AMdltd+PQQHl9Bjr74vnkw4Oggm7PL9K9Lt5mVI1X6ob/bNA8NbmCjIpjEpaoZEratQ
         cjvO94PpxgJ8xXvxdmHa8pWpGZ6o4leqv8BSh+WKisAwrWAJB1dmIq6H0ndnFWxRyuHP
         r+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776071823; x=1776676623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rtDg6wg+zXc8K3rv9TpWuQ9j/5nJjIGixceMJjhljqE=;
        b=p8GWX62ni/LuKHoHVglzTFRzmu3iU1bNf6H1xb3BSyO2umvZ3977qS0L/negY/wTOD
         pp1pRTFKN/ZFOuv7LuWUVFOFmW0SpNU2jtUztlaeRarlPC01sQlyQ6A1Qi99liUjaSYm
         E6ueT5aaXMcsUp9WdA40J8cDw37NXaDuQA6dMs5KUUUf46ouZZUzTcD9/RUA2MessmCO
         +ldXIPtIe42mvn7imbRfbjsG/D9oevSrzQMmEi8tSMozrOGwGd6UNVE4jmaBA5AhhZ8j
         InWTJ2Ey2rh2KqsbN1UD9lCuwrpwoLnnOxnLOse6aw8XwB8tlK53I1NSCjL5m07XxztC
         kI8A==
X-Forwarded-Encrypted: i=1; AFNElJ/y7/ohJQ43zpAiJ21xZXgUIGkTC1TwGM2U1a1hZ9Fn4PAvpigp4iAcX1Z9LzkYvLpfOqhNyxYpbb4z@vger.kernel.org
X-Gm-Message-State: AOJu0YxAAiwUphXGMnOnEkw3oK8RHzDR6EKi6BDRS4HEPUDdMgimhe79
	Pw4syLUYSuJgcd58wlWD0+9qqOhy7YNF8Ss5TIDC0izlXoiYr1utE7AmzCYWuFcSqMnSNFHLbrW
	iYwKS7bIvwg2M9MzdPIecpQgJ8yVqlcL8mGwMJyNgP/sHTnI5gC1CUuI8RrqDi2j/
X-Gm-Gg: AeBDies5z85QBmC9aXi/5n55vzhVlzlvc+VMC2PQy1udzco3c1TaioWzBmpuE64MjBE
	YjNLJI+wd+lVSdZnsnYqLxNYBgcmY2SZpVS0oDEqHi3WAgxML5WJfTD0VBXDmQqlYFpZZCcZQSd
	cThTr4aLagxcv0UuNI0HxyOw2wgPln47kbWQVgYqrule/sUgCpIQ92aSF5UMDSz/LC/FY15nPyZ
	ZoaK9zPP/M5Z8SoBHyA4jk0FOVDVEcjB51mA1VguFCgnBHrVWM/qhM0EfIGAygeclhZgX32NdZw
	9cfAGsvKZFvqaIIrjc1FgFv5DlysOJkZ6phuNbtTHCUqbIYmVFJnq4SKiImXrmlx6XtP/n4HxPu
	0LCWgdVWzHzQoDdFzwPTVzW8bctaHGIJO21TZt9CAI4bjJrEMjmNP2U1KmGEAc4Yj137aMtK4Bm
	/9/Cz0SQ==
X-Received: by 2002:a05:7300:1489:b0:2d9:9f55:25c8 with SMTP id 5a478bee46e88-2d99f5527d7mr1048985eec.0.1776071822747;
        Mon, 13 Apr 2026 02:17:02 -0700 (PDT)
X-Received: by 2002:a05:7300:1489:b0:2d9:9f55:25c8 with SMTP id 5a478bee46e88-2d99f5527d7mr1048971eec.0.1776071822244;
        Mon, 13 Apr 2026 02:17:02 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55faa571csm18349212eec.10.2026.04.13.02.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 02:17:01 -0700 (PDT)
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
Subject: [PATCH 2/2] dt-bindings: arm: cpus: Add compatible qcom,oryon-1-5
Date: Mon, 13 Apr 2026 17:16:25 +0800
Message-ID: <20260413091625.607976-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413091625.607976-1-shengchao.guo@oss.qualcomm.com>
References: <20260413091625.607976-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YfmNIQRf c=1 sm=1 tr=0 ts=69dcb48f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=qjHcU3mlnP7Z_ZZz7yIA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA5MCBTYWx0ZWRfX9XTcz7JO/prk
 TEuqOz5vtC/EkyPBOFWshdFacNowCOfN3DYrMxPpbfsBpDqGtHU/3+G1+T2OItxrZu0TbTWSooU
 hRZuIPaSGXl1rHIA1csxIGwP84+iSYAhnLgQrIsDkGm6eC8WTca5Q8TL4w3WoCowCkroq6H5aJE
 ogn4zghb8mXNYcc8ZlOc5bznxOYs7d7Eb1FQt245Sm5miqdgl1GXH4J2403JSRI96FIQOy3pk87
 8gKUd+E4Ibil/PMuE+UIx2t+TBd3w0yQJWZfDdsS2EBKPvAvTagqyNp+PIAgEtOQwO2HiumQP0M
 FHgE8Sb2ied00GNTEsdQPntV4H1HjU/OT/7qHqzYUBTmdMKDbHEph98ti3RS/Gts10BISeS2rM4
 FtcM+fHTMQHecFgVjDjornN7EukUvfNvucnxrREAmZ6pBbfRn4GgDQatG4CP7toUefdc71Xma9E
 Sio2FD/RNHTFcSQDe1g==
X-Proofpoint-ORIG-GUID: Dzxfvt4P8MjM7m4MESLogxw6Bg7WUXse
X-Proofpoint-GUID: Dzxfvt4P8MjM7m4MESLogxw6Bg7WUXse
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130090

Qualcomm Oryon 1-5 is found on Nord SoC.  Add compatible for it.

  $ cat /proc/cpuinfo
  ...
  CPU implementer : 0x51
  CPU architecture: 8
  CPU variant     : 0x5
  CPU part        : 0x001
  CPU revision    : 4

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 5f5ff5e51e51..5be89c584026 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -223,6 +223,7 @@ properties:
           - qcom,oryon-1-2
           - qcom,oryon-1-3
           - qcom,oryon-1-4
+          - qcom,oryon-1-5
           - qcom,oryon-2-1
           - qcom,oryon-2-2
           - qcom,oryon-2-3
-- 
2.43.0

