Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A407D3A5E64
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782715525; cv=none; b=uPX+TcFb3+SzoWZyHjZYh5jbuOBZXt6s2DRHW5D8zexRPY9kJgCA3j5PlnK4re1i7wDLNkGOvLyLUGDHe3JhJ3Oz5kJYu8dVa6N5hHhnr6s6vyWXZ8BZwHAgg9vV/x10nyBXlEUg7DQkc9PTXRYwrUNJDPES7DkV8YhswCyQfdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782715525; c=relaxed/simple;
	bh=xL/9qOPePtFeCrEvuk1rTnwRe+ZVfzTbrOhBn51jvoM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XdINIactMkdpBlLk41OgOioVyqg20bR0+5T/cOY0Cble9EyVQ96SQNmYVqMSfly15MnfYizsj5JsUcHW5mqBiaYX3ZgY5qjYX5qcXvgUc0/Tv0khTCAiJ7lcjpleh/Z8oDMb5WjEPwEqvhpJuYEF3EAF0qATS3g5SF7fLHR+sqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V5DLabKb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GTJi0KBw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V5DLabKb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GTJi0KBw"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NJIW1771515
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:45:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wVp9Zglg4dzVjkBcJglZFHQXwSqvRZ8fm9OhiCgGnT0=; b=V5DLabKbfoNwo7CI
	mwRJ5RlWHC8Nxx0k3rJwtkOIh/tf4YtR0cKK30QnezXRMt84jKUQE9PADCf/d4xU
	+eM62uiw8VoF9MtzLJBtv1cgYlqfUCKAK60DWE9qjaQbYa+y606PIKkL6qgV6Sn6
	fuIyIwGcUO5eeQ0WE6jeqiWIClp61eld2V6ORdKvqCIu9tWk0UKvS0QusiSxaqFS
	tTmOfR0rDDK6d+4M6B2sfSYHTMNi8eBjFQ+HV6ixH9LYFnWtfHLHtsq1wGi2sfG7
	XBaSzGQM4gcjv6rX833bJupIf/fAM52VhRWIg9rxuBEPMgcezHgjV6R/7PMorJ+y
	BkgwwQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tun011-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:45:23 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30e773699d6so1678455eec.0
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 23:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782715522; x=1783320322; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wVp9Zglg4dzVjkBcJglZFHQXwSqvRZ8fm9OhiCgGnT0=;
        b=GTJi0KBwdpDa09n4hja+asOA3q9HVf/BsEc36Z7ZZ/f85NZ+GVgwBMKMycT8wnBzh8
         aO+PGaMZ1YPyPM2KwNWJCDUZebymSGyJOB/j0hXM4PdYm1GUyTZ6ih0JcUKU9ZwuWaCy
         5nNpcSZsrbQcnhyy1ir083f0UQ4uauhfVITEpqCqQDnX2VDDiHDJuqq0s/u2owQOxjZW
         Gh+3mEx4JTnh0VNNbPbCf88BJtjOa5L6P4Kqzkde4ctm+9hGJ4uwtW0cy8j82VRNSZIU
         Lr1UVEtFReHSoYi7JGFm9c0RNLMoxY5DhU4a3gNohxwQzJ1NeZnZlfmzP8HlxyZrCCNz
         ewmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782715522; x=1783320322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wVp9Zglg4dzVjkBcJglZFHQXwSqvRZ8fm9OhiCgGnT0=;
        b=Fhb/evboGI6X22fh+G8vaojdKQX+WhvMDWLendHYPnUfDgkGoSkQgIsupOUbQ87HEy
         SSJDtwBWGhMLfhFST4aHf4hDBdA2eYwOwsh9LeCS/Bz8StgX1c6JA14GzFZ/NduUGajV
         RYUOe/tUMLE2huckqKvSgZy6MP3Y51W3tdRFk8IAfGzKIGVv8JziLFN4QK7vUCHJQ0ij
         0Cmu5nhFK1Isy2+Pt5CGgVuiaIOjB/ouOVKctIS75Bwon9OpO78aeCruInhXqeKtNnrB
         pfx2Tw6OZnRuie5QOkFydqMlLlZF7VwZHN7Ho9b+oCYSwDT5CLOzkZPhWSDD3FdqkbBz
         LTPQ==
X-Forwarded-Encrypted: i=1; AHgh+Rom3a18tmZrAcius3DPafZKEFGkn/1PbNmgV4JHTSdAAODjqHUitOs8TtFIcH9PlZMxFQtAVLxsCY0m@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg73dWLI+9zlo1pGoLZdNI4xo0UTgj2SLJNeBxDIBKubDzferu
	qeuVUPUwk+Sh5zQw4CT28wnzmbOYs084VwL2iv98XGeRdGqXXnH4yzXjUgVUNcuQQzTJm1U1oON
	+VMZ1exywRhI8RfuuiufAV1WwDKp2QFdvNIzXilozqgmbASvwLRevU2uS+PJMBe7K
X-Gm-Gg: AfdE7cn4fTCh1RYLg+3b2Y1gk5QzwkeZAfJE2OST4Yi12cTaA8SKhGSu7N6R6mmLQL3
	ykIhdSNyotqLFNS43zhsL0WTNUsGXM+JZU/748fTPaLEwV9fP+J+UPXW3QrMHJg+MLtFmgPVIoc
	R6jvf3FrDbUzuj6qvLvo5hdGfZV4GdFgM2uyWmP3S5PrrtR1r5btp2KKbne5sOgwe/Cq30c+kbl
	djESTzvEe5a4jmA96L3pK2714S/c7WBYWnmkThUWDgsDH/zM2ZOxOdarYciTaAN77Hgt6arXJrW
	7UXcKjceW4PQIMd9mO5n88Gq5MeHb4/5Nz8MglPph80WWOr/qYypWRQ+cP0zn5Nt6Np0gepLHYs
	6IIt0ztHxASK4nm8PYPkFdauglUJWBXcbeECIH325UFuukGgc0TbyZkJHbGkdxw==
X-Received: by 2002:a05:7300:8b85:b0:304:bce9:25fa with SMTP id 5a478bee46e88-30c84cf58edmr12861128eec.4.1782715522401;
        Sun, 28 Jun 2026 23:45:22 -0700 (PDT)
X-Received: by 2002:a05:7300:8b85:b0:304:bce9:25fa with SMTP id 5a478bee46e88-30c84cf58edmr12861114eec.4.1782715521911;
        Sun, 28 Jun 2026 23:45:21 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52d669sm43580424eec.11.2026.06.28.23.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 23:45:21 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 23:44:36 -0700
Subject: [PATCH v2 2/3] dt-bindings: crypto: qcom,inline-crypto-engine:
 Document Maili ICE
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-maili-crypto-v2-2-f8ce760f71d6@oss.qualcomm.com>
References: <20260628-maili-crypto-v2-0-f8ce760f71d6@oss.qualcomm.com>
In-Reply-To: <20260628-maili-crypto-v2-0-f8ce760f71d6@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782715519; l=1367;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=xL/9qOPePtFeCrEvuk1rTnwRe+ZVfzTbrOhBn51jvoM=;
 b=0MpAjM8hw4q/ldOQ0TH5cNJ2JAxqUeToo95zB99B+KCWU64b9qgQ44hAyQzx6ZDkMe8+ap+0c
 uzzRTu2iFtpD6jMhMwF/CKObBHSqSZHacOlBtTc0vyKPX1YtZcmFYer
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: jZrsdxunubCK2ny3XVllTQjuTc5ooYT6
X-Authority-Analysis: v=2.4 cv=A8Rc+aWG c=1 sm=1 tr=0 ts=6a421483 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=CB5EDt9iCFRIAeX0j-YA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: jZrsdxunubCK2ny3XVllTQjuTc5ooYT6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA1NSBTYWx0ZWRfXz9EJyvM00oY7
 d5qeztfS9zLORbt3fJ2IvqzWHvUeDPpw0XbsYRBgWeN191XGYDYLjKpbP0vnf/7LfLwzY2IxNDu
 Jvm+Jwuls846RdifDrZcXi7UO2/W6jRkJ1t1Rjw4r+7/kR6pFKj/4bdDuuYadjGR+1d0+79S+L0
 YoyUNdvfo0bUhNbL1HICrXxPWrzTtV4/U6EthPQu6b287WKS0LOZ6iVNdnFjbbZxvDXPvfV1lYH
 0j3rkc+PhVb4OTVEgABldrLzBseYx+dOKhMlZ7gTLoM+vriznSDZN6F4bY3PeAA8A8DWC9oafyw
 xNvazKLb9ZLoKjubxO8a59b/DdZZ0zkqjVo5kKIVqHO3z+3eJIfDM4R2dIpZWYMuJwsmEOfd+q4
 TLJ+g97fW6YeleZ8CZiLoAjVqw1zZBoYbBY1zIzcnV6iUrLtcpc/RPAEiOaLsHCZavVzsLjHUMM
 WEeg1KGjDopa+JKbwPw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA1NSBTYWx0ZWRfX73s1wgJuWrCc
 phloXbEjIGcGkJu8avJghELtG8TNhOfilpEXZ7ajwlRrvBJP3HO+oklOOX3RecnyQU+n62FGeLP
 O9vQFqf6dj4k6XDo31InbEai9tIl+og=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290055

The Inline Crypto Engine found on Maili SoC is compatible with the common
baseline IP 'qcom,inline-crypto-engine' and requires the UFS_PHY_GDSC
power-domain and iface clock. Hence, document the compatible as such.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index db895c50e2d2..d80f8445393b 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -16,6 +16,7 @@ properties:
           - qcom,eliza-inline-crypto-engine
           - qcom,hawi-inline-crypto-engine
           - qcom,kaanapali-inline-crypto-engine
+          - qcom,maili-inline-crypto-engine
           - qcom,milos-inline-crypto-engine
           - qcom,qcs8300-inline-crypto-engine
           - qcom,sa8775p-inline-crypto-engine
@@ -62,6 +63,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-inline-crypto-engine
+              - qcom,maili-inline-crypto-engine
               - qcom,milos-inline-crypto-engine
 
     then:

-- 
2.34.1

