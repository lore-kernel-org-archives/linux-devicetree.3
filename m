Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088653;
	b=ENMUY/hh/rt/aE8PRLKAq7o+ImjGCQVeNERI68q85L/A7MMwX+YjdFFMz39jEcrI81f9
	 9hx2wvhRCROby/RNB0c8ajpRbHHEnrbXjd3EppP6A0qCtgS6W53M2zyZqs23/yEAiaaSQ
	 khZB9SR412KPs+uF/jkswH1C19zhF5QxCGQhqT/qdB3sqeorNacAbApXH+EMwdAu+6KPc
	 My+/zzgAgdBt3t0kqBmW4ax3vMyQz/WyUvEh3Vz+3y3WJTGrWM5Kz90nTtAFPUjObYrTa
	 8Acvk95+boSxQHD8/NVpQk4KATFyZSIzFYO14mhidHJl6CXjpXUfgn5GS0bRca8Qzgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088653;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=M8xRW69kBNQ8Kj0Rskt6puJpENL7w9NsJ+tqebELTsE=;
	b=L7CZsacfndrAUlgtZX1If/30A4y65orR2GPd5tpZfUTYyeGBhAsuT9mQecg4zp8xVYHY
	 59NOfk9ll6UKMt9ehGsxIBPuBlBUcMuUq66aDTgT4F1BsFVx+YpCWGlvR4lzZ4pTJVwSg
	 OOdBHhWJTLt4FYFR+IU1xL8HU1fdPRRNgRZuBihl/FitKi7mb5SgFaWidG3lI7cOR1hq5
	 LmJyvh2nQFLMFTSQP8MTu0uibqLgdVKQrD7b6h7q0pwDqE3rVakDtAJc464JZNWjxNOsT
	 89n8lo+eEOEcr7bz+OubRGi6w4vxwu4fL90NClJtEY8XX2SiLP5y42UXvvL3XNT6KNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WU26EFke;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WEP5syGt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3160606A325
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 11:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3160606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WU26EFke;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WEP5syGt
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJAuRAv3476459
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 11:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M8xRW69kBNQ8Kj0Rskt6puJpENL7w9NsJ+tqebELTsE=; b=WU26EFkemleH72Pp
	igpyMWtqi57bblLFZ72wUfDa3PdQMba/mixao4J8hdgOBGwZtfzuIYX/hOPkuCsi
	PI96vKLRXdCxoKYuukk2HdfAUdqliV+/JwZF2UJDrbwqkXPXql7FO+mlH+NXfYxW
	e+vvcCCPLIWXA4t3wbdtx/WrGT1acJOSQ1RKzXdgPTdCx6tIyCBSSes9pqVVfMMX
	fVZuuSYJe1dMCr24PDhfv6yuEh9Z8XJoqFDjXoZ09vcuxxGBTEw4A4GBfwtg8aem
	KSExzH+m1dlxk5fT/18smSZZs54rywbsWCzKrHnJRjZvpWgn/oQbMQPPTAmP5unb
	9n03yA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xymgcf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 11:44:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b3b4208826so619289a91.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 03:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795088651; x=1795693451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M8xRW69kBNQ8Kj0Rskt6puJpENL7w9NsJ+tqebELTsE=;
        b=WEP5syGtR5xCz4lSNAJqA9BS8aKZ4oVxRCzcyJVb3CEd4c+dEtw6tCBq8WFadRQFLU
         84ivkdZ3M+rho1EroHb8DyTE2nVfWtHWhVLzoKdbYQPXW5Ag5rIXJvlqx9hQQvx7owtl
         1GTp5SGxcukRVLnYJYjhP+w/GFDZX6tRvKFUCr7n4WkUunxo/NSomUiC9kRTR0O113bW
         rzUcEff4j/b/12ZXD/hFJxIH11DsYqnyoypX/aJD2YJo0KRQbCjRGa3ss4j4juJgVg/C
         /jt4AJa4aE3+NYMcLtPhCzNA8F+e4ZW7fjRxGCkB+1x+y4bbgJyl5nZyIanJKTCzzlPX
         0Aog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088651; x=1795693451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M8xRW69kBNQ8Kj0Rskt6puJpENL7w9NsJ+tqebELTsE=;
        b=fSgpAGMUf+nk4yYzCR6179VffIY6MKxRrP81v/T9ywGzmbynncSueyEWrb8NI3W2nc
         dCOg/Ye4KUzCnFRNkmpyRFJXBojl3KZ7v9A1PXLhbmsz3bwYFxrKkFOjIaNlTgKmUAiB
         EWGN/V10EVR8+9BMwJO2utVEym9m4WOdHTDsRYuEoGtCZkPVP8coAOLaarKD/A4UELSj
         4kGVNh/1IEdENa2hfImRPWpoqaaATmv7uq6OzX+0k+x+TYiqtCKxvoZXqGrpF2mbigxL
         fesRH91Y8JvTzIbjda12bO9R2DbUC3pF/izNRcMBusTOyExJPjnx8YgtS8wiMncRny1B
         z4eA==
X-Forwarded-Encrypted: i=1; AL+hErGvpgg23BBcyqcfqDZcxoFUL/NV/Z2OlZbW8oIxJj4A1RppOTEKgiZsDkfg/45VVEvQi2VfQyDc7b5k@vger.kernel.org
X-Gm-Message-State: APuU4Z9PBLyKZhpeKJd2SOVicsiilph7tE1r2iNJARKxsHnjSUyltbIq
	VIF2YT84DtavhAt9h1GPntAGRvRdiPNxg6sl5mgvD6pB0KrajRoBx+dxbowUwNi/aY7xEzExn0J
	x3OaXv4jgNS6eMFkfjF7jd3KtfJ8tjAJYIWxOQDxc8phvi0UU2BqVFD+ObI6zcO28
X-Gm-Gg: AZFdTZfDxJ4UcTuKbNdfNdn7J/Agv97DjlL4WNkJEpcGUlsE8C2jEd/yPf1Xcbodxty
	b4jREKEzOQ6Qj1W3Oh4nfKS/k2hJVTyz7IYWQxDhy3NeyRuYpKaoAwpVf3vyRHK98Nz7mtBtaIM
	R6Xl9499T4Uyge0c3RpfeTB56Y9YWKqfpPm3jmYPjLYF4nF9QiJ7PC007IJWj7oCLw1J+cNIlNy
	6Cz+qxRi1GP/Un5bGNAzK7OX8bJBzEICaFJ8ogjzzkiyzvrGklUCHKy1BgcrmmkdslGCmuRBois
	U9p3Y5SCQhESo6YxqwQok0RIHvVV1iD98f3MVkpVBTeWvWQ/A/dI2pIjXZD+uBOXMt1SgB77Frs
	06i2ZV68aTxEgN1nEvnUrW9at8FMjR5qlnd//41Y7AV1Ogq+uP/P/2gVr40kNkiie
X-Received: by 2002:a17:90b:21d5:b0:3ac:8741:e2ec with SMTP id 98e67ed59e1d1-3b409eb94demr499408a91.1.1795088651358;
        Thu, 19 Nov 2026 03:44:11 -0800 (PST)
X-Received: by 2002:a17:90b:21d5:b0:3ac:8741:e2ec with SMTP id 98e67ed59e1d1-3b409eb94demr499391a91.1.1795088650893;
        Thu, 19 Nov 2026 03:44:10 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde534854b1sm1613960a12.12.2026.11.19.03.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:44:10 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 17:13:46 +0530
Subject: [PATCH v6 3/5] dt-bindings: remoteproc: qcom,sm8550-pas: Allow 6
 iommus for SM8750 ADSP
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-shikra-el2-v6-3-0e91a1467e79@oss.qualcomm.com>
References: <20261119-shikra-el2-v6-0-0e91a1467e79@oss.qualcomm.com>
In-Reply-To: <20261119-shikra-el2-v6-0-0e91a1467e79@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795088627; l=1816;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=DfSqnikNSHzMY2hBFUqjQHSQRxokU/djZVzyyL26sSI=;
 b=pGu0zY1XyLxlrASpCoMqPSG83qmdxILDZDlB0yZoXwChYVIP96LNlsT+alnkitTg9GVioRKyA
 tdrnz9A8gORAgU8RX8G9//H1/y89nL0U2TqzFX/29VAaOjAk34JpA6X
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX1+WX7PG8fZNx
 quHny1j9UW6u060LqXI6LE6pmRGeXEag1EQkTGz5SUzi9AJSIhf98WSISc7ftzRenW37XlirKIN
 41YgmRH7CQzB1SVA5sKDkeu5nLMwi3s=
X-Proofpoint-GUID: H0BE9YxtEO-_29U9rVJKuDdsiWHxiG53
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfXzRczQHl2CrX+
 yAFOa8bek55JUAJLCjbDkwy0+1XXSkmRttKs1j4BzKrRNXmF6pNPfjE8cMcjg+kDf7sAwnkxgG4
 A4SCFouGQ522uLWk8UIUTYXEzR3VELSDP8J4flcrY6fYP5gQAf3U6WDVJCsmHTLfn6jYqkhm/1q
 9Ix0CQpgEkIGzl3BUUzx8twyP2GKakvBRGK/XJqgurIbnKrHwUrlbBPWnmPQqC8zwqEze0VFW0B
 nuRMZcbjXOGZc9iFpXgr52ShxduVYFsm1wfvOJPQK3Ws+BGJA1OCjRD/8jj8sIPu6EbFMG8zCKJ
 ZMpdgmbqKRzxr2VOTTHZKuRf7YF3qoD1B2w+DxNUF6Y2y5JIzRmjkyPoPIBv2T6KHwYRa6QX0zw
 piVlbZRKi1mUkDNzLH3U0yJbnL91399ftqUM1i7dl2qDJnfXuPRcLDA7E0ncKE4NRtHwnBz5mLq
 A6VhYY368y+nl5Qbnig==
X-Proofpoint-ORIG-GUID: H0BE9YxtEO-_29U9rVJKuDdsiWHxiG53
X-Authority-Analysis: v=2.4 cv=WKPqzXsR c=1 sm=1 tr=0 ts=6afee10c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=heRerMffL7N6zYf9F1AA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190046

Remote processors behind an IOMMU may use multiple firmware streams. On
SM8750, ADSP uses six IOMMU streams, which exceeds the single entry
currently allowed by the binding. CDSP uses a single stream, while MPSS
does not require any.

Allow up to six iommus entries in the binding. Require six entries for
qcom,sm8750-adsp-pas, disallow the property for qcom,sm8750-mpss-pas,
and retain the single-entry limit for the other compatibles.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 26 +++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index a3131e6417f5..45cc50d9c1b7 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -119,7 +119,8 @@ properties:
     description:
       IOMMU specifiers of the streams used by the remote processor
       firmware for its memory accesses.
-    maxItems: 1
+    minItems: 1
+    maxItems: 6
 
 required:
   - compatible
@@ -323,6 +324,29 @@ allOf:
             - const: mx
             - const: nsp
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8750-adsp-pas
+    then:
+      properties:
+        iommus:
+          minItems: 6
+    else:
+      properties:
+        iommus:
+          maxItems: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8750-mpss-pas
+    then:
+      properties:
+        iommus: false
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1

