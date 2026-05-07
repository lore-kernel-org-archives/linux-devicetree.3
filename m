Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A89D33A6F7
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 08:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778141275; cv=none; b=ddtm26icE/6dW93sAVVwk3ligMftlHZW5SqOzubnNLSFMAlaiFcqr3XO0KmQUk0mMGLneYWb9UDO80W6vR2Ip7M1q1HcawIFGcBE76l7/n3b/70GQL70Y4heGaWYxTH8MwtZlGyDHCZ25/qQQyWOSXaZ6KiakOkTNrXPEkDYHBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778141275; c=relaxed/simple;
	bh=WyCkyrNEjuVZW5BQJoIub2BHuGPo1VrjGxO6oiBvNrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EJNH1Qkcnygt3vyQUcaUbD4nacUaFdhcOqaA+E0aQcvFOujD4wYTP+8M4kR7j/8fnLaWsfWZ//E8fCXrmYhXwbf45bjzatW6dmYx+QIciZh6JoHIuHQyaD4rV9Ay3tU8z4+NCWl67aOuSlnUSM7Ldk8e/H5N7jrKYC2e0TtQ54A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BMpSvVg9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PoEfYBir; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BMpSvVg9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PoEfYBir"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64745ocx879575
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 08:07:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=y93/3WloE/R
	GkUE+4XCHfC/034RFCm1JXmGZaFIjsYc=; b=BMpSvVg9yEeIOkm8BDfvPL+HQCp
	84YjtP5JPRwfHPdxS1wjb1ylr+j3fNrbvGdoVup/YJX8ylZVyqRcL9jbO7gNj6PF
	ZPHSbt/07JIw/115rnjPyNhdAZymU7XTuN/5kYrodaO54EsbT/PazZzMD0cdRqxv
	Zwn+Pgji//RMQVS0C70+/TWF6o8bioPF7fDi5+YBYaPtLmPjkpP/gnO+QiSAFndB
	GxIBZYZDEsPdgTJLnIPE8obsc1yIRooZHtVKHva8l/tlNjnCdl52amHZbBsw2SMd
	Rr9T2sIWvRpnXzDARfXZTs2bNRaRg2lE/KKXh1bP5H8WQUE02BB6x9yL+wQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kdq0sjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 08:07:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36629e48023so54268a91.2
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 01:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778141272; x=1778746072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y93/3WloE/RGkUE+4XCHfC/034RFCm1JXmGZaFIjsYc=;
        b=PoEfYBirDyJTzra1EMzLMN8ARY7PHQzyN55p2W82UOfNzGjbqQarP0uD+etl789XER
         pOcbTTUUGu8IAssyZ+D1I6KGDsapfh+5avX3wi33o0PpoVZYSfSJ/1JxHrfV2CKEjv+C
         +/pmqJDeeuPpXESwkFVimcEEHHqTrBjThbo5TQwH1Olunzt9Sl5ZrO8mxWzHFMcGzAK1
         ZoleguR9uP/WA26zGGLWKJdkaeTD1Qu6TvND518PAWXDtw3WnHzmFJZD7hm/Z3rOlncO
         c6GgbK+I9A1MgasQnpSw4Rb6Q7DFvj7BDmn5UQqyX/q+4XEuDv1E9q9VX0EdW4sOA2HI
         MUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778141272; x=1778746072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y93/3WloE/RGkUE+4XCHfC/034RFCm1JXmGZaFIjsYc=;
        b=BNe+3Ql8wLmsFI+6KQ8lwTMnb+cGxDa0Ro6083jUdA1ImNQ/aKUFdznzsJN5tOctjN
         5fbCzwv63qgtUXmp8PI3BboBIcsakArdEMOIXKW1EozVywbSncqjrYAuV/T7ALz8aweC
         R0c65oDwyJnP0+BmTA3ITHH8zkVmqNbyV//e9NzEhnsWdfIGpkek8QWxCJXquHj5kd4W
         uI/q2xrwC3a4bBGQelW7Ixo9LRWwf2rUABAI7bqrGvVQ1YO1xo9ruQI4AKFT9LZwXf3u
         plit04Zx7SBJeg0P6a1mxF687AYV4gNStGLfnWbZfdaAZIr2hFn6v5nReyIs7Mu7xRC1
         ZmlQ==
X-Forwarded-Encrypted: i=1; AFNElJ9k3Ff2pGdO2eURmaO80DHR2Y1hhbJyNYZNAT5l2qCsc8mERCzJSP1YNe2+1I3nJKBIloEzJL4tJjfa@vger.kernel.org
X-Gm-Message-State: AOJu0YxfJ1+AkV5MmVZ9uCdOQi7EBJfpVAelcC2F7ZuQbWE//23gjRPj
	JEP4eZLkdVlQ5B4HH437kHFwG/oYKz06ZJMmcnLOcZE7IFNHqw7TUF3/WHFHtaW+w6WnHG5ZiDi
	lWn+cal5Y73ovLQfnNfU3KV6fcB4Fn7UQLOPHJzEXGw4EWYmvWmj7UKzXPEvJ8zcf
X-Gm-Gg: AeBDiesnkazP7c1F6gFDzrt2+/4bfrpEGyQlMAukkt1VfObG6Q0ur8UR2Kn+AhwXAPu
	fkemocjS1Up4edpK25zcZhWOcKDcHO1lOATX7k6wISfcUWcBAYsfIlG2zTnDqgWiQ7Tny2rlsA+
	hkhw6LPVP4rqjxG6EiD12H8fP//80BlhK3PiPCwVM/BpJ3X6QFTKzSGWfmfT2VlqXIJBSS4Gw45
	S3pWhEnwgb6z4MAncPiyFzU9id5ZTNQVM3CFUpWoBXr+Wx261TCOGXGOncMZaawxzp5A6NjBz3S
	pMwi4+viZgh2SAP4wuL+m/4cYvtc3Is+2oF9gv4aaNmJhzvGRL0f/p3GFuG05SI8x3Z7KQWz+wl
	ATPn/+mfkhqNvmD0qGp/QbU3nE3sbcDDg9uqlvWmYuBNJCbGdhMAIOcmfcDQ=
X-Received: by 2002:a17:90b:3c8f:b0:35d:9c43:57fe with SMTP id 98e67ed59e1d1-365abe8aff8mr6759058a91.13.1778141271987;
        Thu, 07 May 2026 01:07:51 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8f:b0:35d:9c43:57fe with SMTP id 98e67ed59e1d1-365abe8aff8mr6759031a91.13.1778141271434;
        Thu, 07 May 2026 01:07:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b0560fa8sm1986094a91.1.2026.05.07.01.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:07:51 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 4/4] arm64: dts: qcom: kaanapali: Add minidump SRAM config to SCM node
Date: Thu,  7 May 2026 13:37:20 +0530
Message-ID: <20260507080727.3227367-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
References: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=P6IKQCAu c=1 sm=1 tr=0 ts=69fc4859 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=f3Xkfw6nQM5srWygVXEA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: nyF02RBeain5TKXr7B6EAh6KzHL1Rwzx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA3OSBTYWx0ZWRfX4NmnS6T8O3dW
 eXDRM8IiGBdMEK0Id/qPBPzi4ilJLSu6/+WJmWEASkx7ZUh+gmVQYVWLPQX6+Eol6yNOYtLby/q
 YWdQyeX33hF9J6OO78hKUvMqpx7OZXnOYD8FtY3u7fKlEA2q4C0YBb6tE+gh6VZsOFtoaF8gXND
 J8CuBGV20CPiU3eo9TzdZrAdyOL4dqP0nUUnOeU+y+kT/oc7YadJ+YJGcQHIU7TMmzicfvYktp0
 9Imj8+orvlSRY6b9U7b6R7tCroT0ew3JIVKcAEXFcUgWHLl9Z+JEwzSYPO3T1b60p/dzXfE8+x9
 Rrakmm85pVhSrYaNqdgrDFYNm5ZLOQ+Lwu75LEJV5Kyk1YpYpnFdfSOifOJTEiFLlN83jkQbJxj
 rrMvvYveAAHbb8Byw+mk/tY2QZrUjtBtkMLr1pye7aIiDzWQBA5EBJn5qy48Q2R2sxyc5akfWn+
 UOJHVbEhIlIIqUbA/bw==
X-Proofpoint-GUID: nyF02RBeain5TKXr7B6EAh6KzHL1Rwzx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070079

Wire up the minidump destination word in the kaanapali always-on SRAM
to the SCM node. It is used for destination place for collection of
minidump whether it is via USB to the host PC or to on device
storage.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7cc326aa1a1a..06d6da6877f9 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -224,6 +224,8 @@ scm: scm {
 			qcom,dload-mode = <&tcsr 0x19000>;
 			interconnects = <&aggre_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			sram = <&minidump_config>;
+			sram-names = "minidump";
 		};
 
 		scmi: scmi {
@@ -5294,6 +5296,10 @@ sram@14680000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			minidump_config: minidump-config@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			pil-sram@94c {
 				compatible = "qcom,pil-reloc-info";
 				reg = <0x94c 0xc8>;
-- 
2.53.0

