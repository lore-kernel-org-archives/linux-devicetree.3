Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793173873;
	b=h+VwY1yhNIdrQ6cDHSak2EJtvg14G31mWIPl7jHPD8g4ZQoeMRnrmsU10tb49elRMkHi
	 GD5FpqA5yC1y4d4a9dTmFmkVSeJk6V2PKL37OAUX3nhAmWmGAdWUYUkFvFgIygQ+TcxEq
	 2Vt6gdsGaJN6zXczXM5G8W4N1LLqponS6th73zyhYNYRXIRuQk50HYEDherwhR5qGu4s1
	 kLp2d5qfV0s2Ipln1zKLAbqTGJzoyyuAg0aiHh6M2IKPvXvSvK/8q2BkzywG+NHfuHA9c
	 jfE8Bi1gBnEJpjQq1Vv3lbX43Y/6t2fgiNxhAKySJubgyznoexIBMrnkfEUtmidVh+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793173873;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k6VnyTbD/yiL2DBD+kHRnuIQXNKeJxunFe6GOLec2MU=;
	b=sveOz0s/gsX+m4Ik+LzwiGEf8YOg1If+F/EcjKOwvAfSzGsPLdbE/UOOq67Fkr0JvM5I
	 5cecrrhk3chBLHFbRODBkITjMJ6Y9A0uhGBPzyq1R0hB31ZPXcnsu5hycRb2EzFOpFoDN
	 NTEc3GKKBUXv6Xv9Ut09fKewobaP5a62Kn7Nk2BziEGsin116jLIw7+pw0I9Ww44B1xUd
	 IHvwzYqQtBI2bd8xe2EgN7KL9wBhkry0M/Igbhlrol6MF56Nuyno4yeJ///g1Nmi+/Yxu
	 BCdMWDg+fRHTo2WVRgZ/ua2GTy8K73stNrMni7bVVc8WqjBIjQnjV/M2jXicTGUu2hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cX6ynhjc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RHdPAH4o;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B83606A324
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 07:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17B83606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cX6ynhjc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RHdPAH4o
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4PdTC046827
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 07:51:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k6VnyTbD/yi
	L2DBD+kHRnuIQXNKeJxunFe6GOLec2MU=; b=cX6ynhjcWQLegGYqt2PlZxHrH/4
	33tLiKzsu5NI8l8hWf91JIPbMcZbate71X7kW417JsYBdbA1Dwt3d/n85n0HtBk7
	4DWUQ/SO7NBB9Li2zhALLDnTNWdbWoM4h1ybbaAFyoI+HssDW0CpVFpNFezxlpR5
	2lYyEF9GGAkfgoz49Pv9r6F6dZGwIcdJ5OSmhWJLRnsJXYsAVesh4MpI6I/c7L1Y
	uK7Rp1EXVu6Y3/rG6Wn9s3Gp8/AKE6pPkOpidebH+1huYVwHf3pgQLdf5x/osEv1
	WjYEXP4JBJPqOPzqhKoqaBMwGywFdCtXp/8zrG06V9li4MrJOqwhCejcysQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82ts1kh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 07:51:12 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-359b81ad4e8so946389eec.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 00:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793173871; x=1793778671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k6VnyTbD/yiL2DBD+kHRnuIQXNKeJxunFe6GOLec2MU=;
        b=RHdPAH4o+u3F2kiNstRsJulip4pqsDC/1bx00kRPSPnj71+n8uBVG9s/QQApn+g2Rw
         Un9odswaPGiRl5+GE4OD1ElZBZMsTAi9TNOy1K4HMbsS/HIGkVTvsZqeiCktKi/4rPVY
         X+b8ZW3iG8cn4EG4pHGTsgz4JHpjQcywkj+E20ntVH0it9x3r25N2GtRNA1Th+AHWR7X
         LGqi6FQXzrW1WNAMzhMYm7nCJnOFJTDNpwCVrAdv6PuQWgvGkRvoQhSJAvVP/pHzeo2x
         6TtEI8ORX7BdLJLWLpXT4Uj7wIR5Ic+nqht9Jauy4h0XXwihB+FsADs13PsEQE+qaTwm
         KAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793173871; x=1793778671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k6VnyTbD/yiL2DBD+kHRnuIQXNKeJxunFe6GOLec2MU=;
        b=RsFK8FwOn2jkw87oGPWT/Y8wPqQH/O/4QB6ql5t8LBKHZL5e5SSImPh8ZWktt4y/aS
         Gl0VEN51yUhf2PXlvFgYjN6wuZxVXhlTKjsRwqJXWjd1mWP520K2lcIBquPIpsrQMuwG
         e8YWJe25p1wLfYk0Khm3q4ALmI5RGYNzTY0O5fJX6/+Nz1Q2Bh0t81qOGYeFCha8zrmr
         LuuMpjmReH0OLoobFKv+ESPLPXrud5jBM6cbrxvB5NFccc5pvVkdPpUuhgMc1Eem9Wtd
         LMhWjhBUqbSb/mqixsEqLj7RLjZvEYbj0b88WSfPvIx+uls7fdtptifTUR+2KM+r+dr3
         JOgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjL5UlzanKPMhs0dS6JOQbMJvHhbEQmeBpuqwS/gc0ql9lMwrtsuaG9/yIEOEirUbDAwePOWW46q7E@vger.kernel.org
X-Gm-Message-State: AFq9FYK/22x/zjdf/vkCAAfgCu0G2ttnqIRKntAO38WCrzsrkpPF8Zdi
	pimr2dxOHAY0B5oQozQ8eRkoo52XxiSR9gbPIwffF/f6Lds8QtDTMiXYgSb2xCojFdYIbDN4NlX
	0ZZSEATvdSRGechC4YgnT/TiuQIhX9o03CCAfJHWNVZ+21rDkWyGTrOSxpV2Jgl8r
X-Gm-Gg: AYBFou3IJruFU83HvWtmKQ1LEf380atT7zOJNV6vBMYBtPKFwMqUsy6lOgXsjpMG0qY
	zf6VxP/hlq9epCjZiMiidr/SuoI2c2Hs0NcyI9TY6HGEoxHg0eigKefhHCPVP5nKFeCB7zCklJU
	19PHVnt9VsBN++NmSH4oENxtClUtFbgwFms/33UukycJa5Xl2BAw5BGjA0ZCMbpVPfp5tue3mFr
	umDDnAPoY0WP1DD3mOdzu74OHIF4ZLv4/Fti25Af7LvNOBwb5qkFnBdBIDbTImoYRNflusb4l0D
	jT6NVrayM83LM2jfYu1Z+vLUysY3EUM+a927woK2a/jgsVwt87c4QgPgUeszI5CyQyj09xdBwNY
	aV7uBG1xBtEpfj3hsq53fyS/61H8yqrkGTby/5f6knblbnp013X9v3HcNVmhSSgHaXkURtRzksC
	gsHxE53MbYS3QEDjbClT7Mg+A5+FtYh8da
X-Received: by 2002:a05:693c:808e:b0:36a:1434:c691 with SMTP id 5a478bee46e88-36a20054610mr2695944eec.14.1793173871109;
        Wed, 28 Oct 2026 00:51:11 -0700 (PDT)
X-Received: by 2002:a05:693c:808e:b0:36a:1434:c691 with SMTP id 5a478bee46e88-36a20054610mr2695900eec.14.1793173870461;
        Wed, 28 Oct 2026 00:51:10 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75c814917sm3430261c88.5.2026.10.28.00.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:51:10 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v2 1/2] dt-bindings: arm: qcom,coresight-ctcu: add Nord
Date: Wed, 28 Oct 2026 15:49:33 +0800
Message-ID: <20261028075044.431228-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028075044.431228-1-shengchao.guo@oss.qualcomm.com>
References: <20261028075044.431228-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4B8RxBHOwmQV6WtE6BDL7ggOpIB0ey1G
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzMSBTYWx0ZWRfXxFRrWTl+PlwB
 eKV1TiO9l0RMKyW5amI5N6jL5KTvi3YxswPJ3sM1QPvluVYFSGoBlH+jZDnwAHdPswJo580gmCF
 K8lq7237TotPqRQERbu4FVD8cPfQYIA=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae1a970 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Pbp3yVwj6iIoPtAh08QA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 4B8RxBHOwmQV6WtE6BDL7ggOpIB0ey1G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzMSBTYWx0ZWRfX3VRoPetMTqIz
 STdIfKoCDkaoDqODiwubQNWUoOjti5zywvFYbKYbHUdydKiNFKYpOCDRbMeHvVNJETum7LyMpR1
 TMS/y0DRb4Kbr4R/LvrsmIzu9LkIDm9nmR/4r6LCmVaERg8cRBMA4wPcBHcRKwleIVesPRWf3ea
 RSt4vVfrap6ffLEdQ1AR3hwA3sOaaIqIQSRaZ1FglfCg9HzJQexMu8RMgx2Ty78PPwGYiTqv01M
 abRJ/3svhWBHYb1DEhqhwTVOuPWQ0kvWjkmqEKwZfHbWLHpx/lQoYG7naN6Z/UQxRc4iPGpbKUQ
 Rl9gNAzqUApgmmioaso7xc4uLNl8hO3R0/JGpkw5B46Geqyx1r2zu7HtLKfdHQungo9Mi7kRsDF
 rdYe8JubyAZ4uimaoIlw7G4NRshi7EhyopGRtlX0qMscWF09LGlAzGJ4DR+NKXcvtdAvHxIG7Bu
 e598/FIQMouydJ8BA8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280031

From: Jie Gan <jie.gan@oss.qualcomm.com>

The CTCU device for nord shares the same configurations as SA8775p. Add
a fallback to enable the CTCU for nord to utilize the compatible of the
SA8775p.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 335a8e1a5a9e..1d5bf79f4984 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -31,6 +31,7 @@ properties:
           - enum:
               - qcom,glymur-ctcu
               - qcom,kaanapali-ctcu
+              - qcom,nord-ctcu
               - qcom,qcs8300-ctcu
               - qcom,shikra-ctcu
               - qcom,sm8750-ctcu
-- 
2.43.0

