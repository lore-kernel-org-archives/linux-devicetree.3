Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0236379C39
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 03:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790565628; cv=none; b=Q1Z4FgL/nNIcyPd3vTR8DuVPBrTNgaLDkPRymnpB2vxGAu6s1dSYspT5j/eStPZSfDnqVzkVr5/YGrR3km8Wr/BS/MD2lzCXDNEHVqOmEErMcoXDKvhldqWizESHGIIvgtmZvXKIUwqNYScQYK32v4MMkKd/6hdO6i4LCZiVxcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790565628; c=relaxed/simple;
	bh=hhD/PLf1WNyf7Oqd7ppYYXw4cRp7PicoV7/GrXVlDSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=svnjlh/LHAPJCdHCTReyHMszf+ijrNdTcFeUakeaipG6L9r1aTRM6bYnJ45+HFxupeykbnyiZObZdepY2n0Lehf2MGq2jGcDYxobqSyAPJIgATDDAKaN60XJp/wNKLLEcLWD+d27ATNHQxnMKMrPYnuEzux+72lp9ALHYmLshdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lUwUuVpo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gisk1DqG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lUwUuVpo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gisk1DqG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S2UED31842936
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 03:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c4wGkX0ICnaMs4uJdvDonWd+721HAcvQUBVA36Y5520=; b=lUwUuVpoOvHJacgV
	rw/84A7U0jRHlBE9G30Mb9vROFTaFC58BsBnTzamA+nIywjyMBHV2/yae+WqBQDs
	NnrN36EiWKAZVUgww5mHrat7+ix8UFViQjAEQFpUawcp8DTCAecn5f3kmteJvB89
	S14sjahEhMif13nId1ldCl4pWxVJEtI7X4GeuntS1VH1IVwEeChdTea2boslCBFA
	axnfDWLgyk2wwlf7gGhEmvkOToFC73EljlHBx3KjnHYxK8UC74ERoOa7XTEufpul
	Vk6YttkFzMWS7YubA+o9rJgzNnhGTudzVvU1OkIX8orxf5+5J2MASiud8gvNF9uV
	3kcMbg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx64uve9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 03:20:25 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso4616042eec.0
        for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 20:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790565625; x=1791170425; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c4wGkX0ICnaMs4uJdvDonWd+721HAcvQUBVA36Y5520=;
        b=gisk1DqGj6iqDaRtryDBNy1XAfee/XQxrlMwgR0pWKxfzzKAIo8dICLqEjq2fz7Xyv
         nHQ4DWWk64BahOsC1BArqaKbjjj2NTfrYeTeFq9NkTDCQ/5rhc1y+vox8JldwftwbBFa
         TACIvtzNyfUuqJSCJReq9fpPwCNEGwBBTrYDrDFnKlsghkxaNOUveTYfywmWVJ599dG5
         LPDhPZbhAZ0eaqLfav9GfHeKBp9wHjMuGLJTXeEQ67Jr2+f54tyR0x8woay5d1RrK/p1
         DoTnabC3gPBVed4APhiIPpRAK/QszBHkxz7DFwi3Lwx6Q6nsizTYJL7k9Bue0ROjKmE8
         ORRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790565625; x=1791170425;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c4wGkX0ICnaMs4uJdvDonWd+721HAcvQUBVA36Y5520=;
        b=DYFVfreyZ23zrk+JWuacJbMv+kuWQBbSI9gcfzBvoTTW4wnVBENv7eKOePheN5wsJm
         JECGc6dBuFmhvFt9xLFkvg2AhHV5OqE8l6C68MOv1oUjZUjEt/vwBXxmKntXvISKaQ5L
         TzYAT7ioZUelBenIcNsVAfbUHD+gyWtBrHKRFkZwQJ/CFzA+QpKmCE+tCfRTCVzWPMu4
         QvU/BE7PG7Tm9WuddN26g7mr++AQDc/KtFfCyFeYgUqgQGK/o9ZEj4IxUuqNlMXZnOor
         pYxZEppBPuSdtb2M+1zBflhNkMzHsniMdd59WwdAHYW3WbiiNvyCsDsgWTHpOQ5tSTsR
         OS+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzmGnHROkO0IPqhKv5lDzn+tx85awEgAuk8Ixhc11JZBSlbS+MplSlv1jPu4dscToXYKeOc3gG1cqfu@vger.kernel.org
X-Gm-Message-State: AFq9FYLmLizZMJlQyRkxPeepATJAp3Rgi7oEXODh6483WcjgggK4ZX/n
	3lHr9AvdHO3eM5SSwfpu9YXe19DmaL6ZJ5XTdfhk/Rlbt126ACZrzLjQSl6e+TTf4HrkYc2cUTI
	IbxRHKxs+O6DY1gHMUeLN4ZwtiYa2/ukgd342qtsU9oTUv8140d5ztjFcp+UvH//G
X-Gm-Gg: AYBFou1S4cLkJ/g8OewIH6odKZGraMXHR1ebIdh/o19V3u86mR4fKYEh+e2OdtbTqsU
	PwUgmrTs2JkIFT1xnsB51X7dD7yPU2Ukw6MGR7XMtqQ/vkWPS1BVVNH3UTh4CVkYw0obBrcvY4d
	RIpYvzWHwUiShX8D8TNHsKAjQ3FSdqSwXa/bPuhxCJUsG1NywWptcDAKp6XdvZiDaLmIRnjg+UP
	daka3kPa1ozTjSYhl5x3lwMnOCfTssMAjvtrGV3ROYHqrpUkykKTTSlbyJFbdGhVjx2GCKOyn8S
	uOcwZoW5DU0cc46wnSRkodI/ppuqGHa/Qba0LXW2SPIsxglDRNce84ITuiPjwCPo8/cy6nrMM3F
	5ErDWtM9ivqC2dK8rtLawrGaSFczDlAwueCO3qdzpoW/PuqZIg9Qh
X-Received: by 2002:a05:7022:7f19:b0:147:cd15:3e2 with SMTP id a92af1059eb24-147cd150a91mr6364656c88.4.1790565624730;
        Sun, 27 Sep 2026 20:20:24 -0700 (PDT)
X-Received: by 2002:a05:7022:7f19:b0:147:cd15:3e2 with SMTP id a92af1059eb24-147cd150a91mr6364636c88.4.1790565624179;
        Sun, 27 Sep 2026 20:20:24 -0700 (PDT)
Received: from YUANJIEY2.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ac67c0ccsm21235372c88.4.2026.09.27.20.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 20:20:23 -0700 (PDT)
From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjie.yang@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/2] dt-bindings: arm: qcom: Add Advantech SOM-DB5830
Date: Mon, 28 Sep 2026 11:18:48 +0800
Message-ID: <20260928-b4-hamoa-come-v5-v5-1-05940cdca85b@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928-b4-hamoa-come-v5-v5-0-05940cdca85b@oss.qualcomm.com>
References: <20260928-b4-hamoa-come-v5-v5-0-05940cdca85b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxMyBTYWx0ZWRfXyNh9S2FOsHoM
 BH8HqEWdMpAF0mICtKH+a0YBawMPdyjPY07fUQtGBUG+Z1LCpBWS0whiVS7KIGdJCvLYoZPpF9d
 bF0r7DxNdnLV8aaTOR+e0cDTz/0D2dk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxMyBTYWx0ZWRfX7WNVFgyqqS/6
 ccVkQ5ky0Jd4yWpnQ+HmSk2l9n6axOFQWiJ/onI4czdte7p0Az+6LVl0p44AwRlIYqBnoPFYuBt
 krvOjnt58DK3V4FX4bqOaeYYTJqQWrouFW2TxpjrtYTrNiAlWnzDmChUdInzLrgjCcqmuHRdt4o
 FEu/SrPGNR+1uZ8rR7RMsKss/R4U7ZuNtTv5ujviD0zFRZl7NjjuiXGUgzSprCNnoMhBVQXM4xA
 zhAmTXh/s2drSBNWFcJ3Hx2rd2l+HQS8KSb/ahNb07F6oggXQZPlNGMOw3B9Mk7OIkF+em0aCqo
 ZwXGMkpZMmOUJkkj6NNnKQP1NyKk9wNnmJ7fgs/1bp34FbB47kOPgKx/IuywlbMsWxLVjnog3M7
 qxEgfYJO53EFkKKYGDNJxXULdebIew/EW5tRseAFTPhlC6V2bVRyWqmmgLoUt0ViseghVbXGSQ6
 72fRODEaS3gnc7kncHw==
X-Proofpoint-ORIG-GUID: cma8LPoyk9vwVMxS9Puj5nFHiyWTGa0B
X-Authority-Analysis: v=2.4 cv=E6xYNqdl c=1 sm=1 tr=0 ts=6ab9dcf9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=JItYRnRW4wSoxD4qVAwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: cma8LPoyk9vwVMxS9Puj5nFHiyWTGa0B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280013

Document the device tree binding for the Advantech SOM-DB5830 board based
on the Qualcomm X1E80100 SoC.

The platform consists of an Advantech SOM-6820 system-on-module (SoM)
mounted on an Advantech SOM-DB5830 carrier board. The SOM integrates an
IQ X7181 EVK SiP containing the Qualcomm X1E80100 SoC and its supporting
components.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index e6b123ad58c7..3ede967f23ea 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1239,6 +1239,13 @@ properties:
           - const: qcom,hamoa-iot-som
           - const: qcom,x1e80100
 
+      - items:
+          - enum:
+              - advantech,som-db5830
+          - const: advantech,som-6820
+          - const: qcom,iq-x7181-evk-som
+          - const: qcom,x1e80100
+
       - items:
           - const: microsoft,denali-oled
           - const: microsoft,denali

-- 
2.43.0
