Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516558;
	b=n5LEfMUhgbPX7oqcxUZ5kTi/GShl1bx7BGmjuZKKrlJ8CKEFNw1+GnHRhZ9ZsYkpC5sz
	 NH7k46oVd/xbalwRvgBLYnaQGObu8KjQP2CsPy83M6qhr64Y1mhdDzHfRHXPDXUq/29CJ
	 SJHVWFgXpzsn9THdDydXTTi2QbqojMvZEFkN3nY7zjBgeTc2WrEEfH3oVidSEdSwJ8nDJ
	 rFesyPpE54eXyTzCFw65l1uvLdyYwfABnKyYlonE1SZk/dcKsA38BqAreflMsetuqVQ1n
	 U0Abi5xaOXWYvWSkY0cj7LPejE305N5VEjvB3Z+g0y9wGFDF2HxqqZZandNj+zLR1aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516558;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=djjFySu0QO/8DVFv3YVS1YU4Dh4wupY7+DOoaSkvztw=;
	b=E15rVKCWCPSTasC5tnLTxWY1DkHzmgtQshpAoDo2Aq3tj6Jl9U6kmo/DbfTObywLAaII
	 dW/maIKevy/jIdmIzg2HBr0Esk4qCJChVYWhBHbCF6xgP+A807yWwNXAh53HncI4vnNjZ
	 VNmqjqkkAVrYz9XyhCaHMD6KdBUjyW0zKMCQcScXZ4+nOxRitMmHlUCsCy8TjSyAyjjkJ
	 55NLnbVi+BO14Om++oM5s7v4ueVDYbnijE9TQ7d2Y8YdotS+p4X22sK78yMSvTKNL8FyD
	 g9pwAtZlhDbqwFBzZ83VPwRzri/Flh8zejzXFMoDy7hx1QKx5S2XBvkbaytvvmxLRmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nd5VU569;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dnw1O8KE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFDB606A322
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FFDB606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nd5VU569;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dnw1O8KE
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8PtnL3701185
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	djjFySu0QO/8DVFv3YVS1YU4Dh4wupY7+DOoaSkvztw=; b=nd5VU569i6ST0NY0
	II1edUrFRr1iX2Q9D584qXkfV2Axjo7BIEniltgtR4mF3gjdfj1GdIZ9XTt8Lpaz
	OwrwvTklgA4zObqZFRA8DOxZvDQeYqdRVdwCLVnzO52jAytYcPk1xJiqsg2ezA19
	Z0RcYyl6kbMiAm6GZptYl83Z+1Gy2OR5N4SI6bg2bMF9S3mqFPYwMVbinIx2jP5M
	8f7RD9YMouxEgKHpuGV8m9dmbs4isXXlf2TIf/Wuy2a7KktqXSVfsvMxi+pVO1fs
	t1h0zrEk65U3mWDb72Y/5cV5o01g6mMgRogarZqttqGezeV6+FfkaGQhgAN05n+1
	7nQ8Cg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j50ky23m4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:35:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0c7ab2427so3395327a91.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795516556; x=1796121356; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=djjFySu0QO/8DVFv3YVS1YU4Dh4wupY7+DOoaSkvztw=;
        b=Dnw1O8KEhO3LdwQhTRgSEQ7Z/Auoo45QVOFkM2x2EZHWLD+XOZWuDPNlzGOcDOMYLT
         xpU2VfOMkUsUfbborFYwKNXCawwBSSioeGdAtO9ZYlyL7TYXXZ0CY0tvcRnCh8RnymGy
         nl/lclkjGNwIGujmWgK//JOOaUXmJucg1vtet+T5Al3Wv6Ku0Lr7yyteSEEeymD4i3YQ
         aWmsNigx6ZZdsZ1A3Z7R9ylFm7CWl6BgMQfhrxYNtMnUCbl6okjS/2AXQu0Lg4SElxpX
         2MgPPJ1vXLcGa7Aqoq5yiDOt0xGQMm2xK4tYSF8j6XAAq4tg6Z2hOb5GC/doickye98u
         j2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795516556; x=1796121356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=djjFySu0QO/8DVFv3YVS1YU4Dh4wupY7+DOoaSkvztw=;
        b=lxf++Ae9iSDd1OVBsp7xBUchkdooPHDv2lkr45U2W/KDGaGw6OG4EmzevX3wny3w7R
         KdK7LQNn48rlYCN7f7b0ZeDIBlk0y8eNwYVtpdzyHeDyh4yB1gWtfqyUcIxgTvWyBJ9y
         Us1qD1d9hjLw0dPAn/kNfgAmeJKeyqGXVessqJ0zEisp0Y23ZliE1uXpicOZRhDJRos4
         sQlyB1toxBzxYDQZio2bz65YGGWTfvvlgGKNiPauqSLQrAVLf2DOsAubFjIaTBHTa3Hg
         St3xqG6Bcpx578bx9ksAOR1l7gkINIoKdoeH3X0miDivj/RqPEquBuwqXgpIVYHAHJVx
         ai1g==
X-Forwarded-Encrypted: i=1; AL+hErEgSjhXxA19LfACAkiTQadeqRGXvfpkIXqVW35rVvZdNAbcmNh9N2ReiRc4jHpJbffxgJJoN0oZKTgd@vger.kernel.org
X-Gm-Message-State: APuU4Z84FO67ypNa23ZxfzXa/lcTqRs6f4bSc1rm5Y8qlvsFs2ALIqIS
	uq5BrGmtJTtnff3gZ8teOYPZdTCjs9ZA7jvMcZUD5bf+YYkPvZHz/ZYh0Qi+trjaQqhlumwJNUT
	pOYWrdFvahQt59lIIsaQDnNtxDI6N5KgyB0amutkRznX7DVo7a2jrNz+hOoLB/xo1
X-Gm-Gg: AZFdTZfZkVkPtZmwJVRwcL4u2JqlUjqKrNLH0SZNmeBQ6leXMje+i0BzWcT4yOLs56T
	Mn5e3GG7a1yOwBShzscsXG8MhFNYpF/W4PkqlJhuL2CnoyYtlHZN91YXWYu84OwT64IWoloURUr
	R/Poajjj3S9eDY6pAgRF4SqFNWVrT2+87K74XUqccRzniFIOApdO9GaWsQe+AVKOEms0K7GzUVT
	ZSOuBxK4xeQY15XmpPZ/NlBc/vSy6gVB5DKMz1Y2gkJI9B1c05yDK4PS7yK4v6YOzZyyMp3i271
	m6yyyaEgLeivr/vL482LLhXqHsXXD3oYXH07PLzVVH8U9XiE2A+92KdLjbIT/1+qYwkYEB08CjO
	5FkXIkjs7ecYO6zfZ/qMCRSLqoZ5AJoo1Q5VmMO+sKkdiWIg+HM1276pUunMlu2SzBCGn6H0RCi
	9iRcRogvKYhDNJyD6I61Z4wVy61IyLGV1P+tUz
X-Received: by 2002:a17:90b:1802:b0:3ab:de4:7fa5 with SMTP id 98e67ed59e1d1-3b41c95b11cmr12857505a91.56.1795516556142;
        Tue, 24 Nov 2026 02:35:56 -0800 (PST)
X-Received: by 2002:a17:90b:1802:b0:3ab:de4:7fa5 with SMTP id 98e67ed59e1d1-3b41c95b11cmr12857489a91.56.1795516555701;
        Tue, 24 Nov 2026 02:35:55 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b75f2a4sm9162295a91.2.2026.11.24.02.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:35:54 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 18:35:31 +0800
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom,coresight-ctcu: Add Eliza
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
Message-Id: <20261124-add-coresight-nodes-for-eliza-v2-1-48926f5a97ed@oss.qualcomm.com>
References: <20261124-add-coresight-nodes-for-eliza-v2-0-48926f5a97ed@oss.qualcomm.com>
In-Reply-To: <20261124-add-coresight-nodes-for-eliza-v2-0-48926f5a97ed@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795516545; l=884;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=vrGfhI/rONVr+SjVSKO84RzqNkfc3HgXrWPOpBP57L0=;
 b=0caFFdqMB0Cj5f06j5kjvuYYRRB9lDSECWCdXqZAUoJjs1ejhFw5J4Vpt0kBAudKlQ+GBnRh/
 EAsQXJjwKM8Cj+2qUCMpVKWU3zA96cA+6yxeb9RrduvwU9ZdPlWgJsn
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6b05688c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=iCxfB9uofQ-l6sdUC70A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 0vwZ2iIZZ6aNYVQ8mn4LQ9c9XX0E2lFF
X-Proofpoint-ORIG-GUID: 0vwZ2iIZZ6aNYVQ8mn4LQ9c9XX0E2lFF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MSBTYWx0ZWRfXzMTFfp3lc3IU
 uzLdqQsHeSUEkeDNiZcgFaBoQijIa6yxhZ+n/JkqcdIGOV/RupPQlyIRGFTObzbzDAm+dWeuZhl
 7vW4NR5VXmIJopepnftXeRMgQtAwfyQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MSBTYWx0ZWRfX+gQOzq+0Cxd0
 PwSpCcih5RtkwPvewhasr9ZZWtoRgoNj3qVu3+HWPCe7z7/4GeXtLXYXq3jOgHJsiFuU/9F2wDg
 XyYcBkV24+yFY8rZ+wPukpIUJexY9e2Br2iW/OTdVpZ01LqjZpbsgq1dBkXiurYEpvv+uW30avT
 8H2wF59vvWEFIRbKYjjOt00PS9kYu/XZJSXBWE0vO2KeHvAc2YU4jon1SONKYkIrvhKb+wOHRT1
 hT+KRWPzu2st98IzmOac7z3xC1w2xYUarXFMw3S8xu0cMLe1KCvKqumgv6CuE61FnHrfvsM1mhe
 gPkx4GFinra8BrPQMmljqSkoJ3iiGDciZGnCSqHuYuEp7PmcnomfvaJlj7HAWyWL2Ezsnd+0/W/
 zRxqb4JIAqpj1gSoGA8rM1/urxvJmhbKNexzhVveQduEIH3roll0UK+6uoIRHjzX4iUXNh/S6xY
 IrnC9+OO9G3OwTC42Iw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240041

The CTCU device for eliza shares the same configurations as SA8775p.
Add a fallback to enable the CTCU for eliza to utilize the compatible
of the SA8775p.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 335a8e1a5a9e..23b290c097f7 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -29,6 +29,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,eliza-ctcu
               - qcom,glymur-ctcu
               - qcom,kaanapali-ctcu
               - qcom,qcs8300-ctcu

-- 
2.34.1

