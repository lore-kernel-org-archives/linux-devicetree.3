Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CCC47C11B
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 08:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942970; cv=none; b=d0QlPbCutefsDAvQPkLeusj5BZkYrmnHoCcUyZoJ1ANV3yrR4xn/E1uEU5PR10PvKVSHN9bs/cEv13jDU4ChArBEiHGR9teSzj6OoeKuJnRZAUJg8GHLPwRJlcU0EexObJdybWgjCRCFmZP85FysQEri0X4/tgak0xGk2EKT+so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942970; c=relaxed/simple;
	bh=Ue6midJSVmgV6ghv2VQrE9scJG+SviUg2vZbqL6/1Ok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hVxYUrUtezZRQCXUGeK6avC7Ik8a4cUzsf9zNFkrKf7oshXO3ot7wVecALYLtCJGmPEEZtL5zAIV6atqIJBfqApfaW944xVsZahpvqqaE62Bsv+ouJwy5kh1C95QYGealE6nFeaR/CNM95PaGdZVhugFkDkT2kO3NzZYQW6RPmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JygpqPOc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aEVKHqoN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JygpqPOc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aEVKHqoN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6893oxTR3771165
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 08:36:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A/C1tmOXI13kUzfS0ML+iY5IwGKaZltTvEDgs10XXe0=; b=JygpqPOcW0tBhoS2
	V2XHTFKqoUXPhi362XiURNVftOAZnWG/jQkS2q+hIojFk7SnKLG0cCkF1q3DlRTc
	xThnJs7GRoK3nQtinhAA8LyzVGAQ+c92u4DJhZwyA+OHhHw7VqnUDNT8EixiRqfe
	i8elLlCTQsfNENiXdWsXBXW6+5puAxde2kRcFXGQBtS9rUiYVZptexc5krgTrwaU
	zsxuvXWnZ32vEVAyKLY/XC20V7CqqzjeJI5vwkoOlyc3tIoxMPJMspK2STEEuR9n
	2kPrlty+1TZiH2L+42heI3SbAQr9K9L9a0uF15Zztw9O21Gqx1wDZMwHs4b+lwdh
	u9IudQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr1235-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 08:36:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5fc4c7e9so568051285a.3
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 01:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788942967; x=1789547767; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A/C1tmOXI13kUzfS0ML+iY5IwGKaZltTvEDgs10XXe0=;
        b=aEVKHqoN7bY8+9/PQFiV+HpRIEFmZACZoCE9iJtcgzDkinNLPnFKr79LvamYFSLA4X
         lw0RyGpDzCMNGfaVRGqDEnGxfTSex8ZLDm1uwzQJpa+wcyBm9cBw6ZO4Ab/GyFaFQusM
         +JYwwUl96e7PkIck7NE3bu1yzn2XH9H5JPpvzExXECuxU0LEGHQ68rez4Q3C8hWYrvr3
         RC7S98SINBNVktTMpc5tYOp2G85xef3AXTek0LSuRWWmzLnA6xfOAHc278u9Z01Owny0
         AqP5zFcYwZCg1GcyMVRdQZG81VCqHH+ApgubRTUUF67Bw/0fB3qgl7JgFz8ix1KHpGNc
         pe7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942967; x=1789547767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A/C1tmOXI13kUzfS0ML+iY5IwGKaZltTvEDgs10XXe0=;
        b=qG3bU1eI/GM5KAZ2E1kQS7J3s+iJjylsuKnEfEgFFTp+BF4Oj8tbjJNiFLj2ImsVXi
         b5+gGaNF7d9b4BN0PiPU3H8wJMNZ9va46ZA6Xhv+fyriCAL9ppV7xNZSqahAXJzYo6eK
         2MLSLR3c2P4afiX85lbJoIKL1ivyO0VU8FaqpRNczqE92vANTK1XJfh65R6YoA4DKjtT
         V1GVSW4LZt11tv2lVimirObZPtQyRiIPynhcUt6TGldzWbon/jXmRC6vdLt8Oc28vg4e
         CZP4V1XWXKfgv9/VXCGdqsgoefan/uq1BNiN4Q6rYGUY/UVPys3b36OyWrILm2OkxfFn
         8Z5Q==
X-Gm-Message-State: AFuF++nUnF6iQiob+hx1rozIdct90tr2Oj5ZR6oUigwGcwvyOgmk83yU
	vu0s2rrQzRHE/rCcLi5L7/tm4e9U2QKpEB92WbkYEAyryGjtaoA3rfsAHjU1pdrhBAiu4ykrECK
	itSnDFL4gPC8h7LBkwdC47aOcrWrF6q+ofEb5RzRyyxaWlcbtwv+IIyuZBcuSGids
X-Gm-Gg: AYBFou1DMP24Q6igMaM+ibFqolK2iB6a9Vp+dmXOHjqKN4WbNuPejj+Xkh25Z/FsxBf
	VUXGpnngGEJ9U0xJBgLaGDLFY8sogQz5hFl+bcWdSnbYRpIYHWoPZ+a3ZBST8Mc/jY1OMv9zw36
	t5aJOXd1uhE2ES3Iaf9xNoRIY8LeJUhAjubFZzZBd5lTeDmvjstIuQYXA8g6ZcVrM36eaKRM0RI
	ula2pArs3UBOBNi8I40sBU4PHRikWYAVUvxQZnz9xPcOkz1zTdS3Uun+/xiI00CRr2yCn2hExQf
	ExtEW1/ZULscDv0yi9Zd3sSS1idmESeR41McJ5hjAemIjCXB/OxSJNEz3iSV5RE9kPlZA3W7yui
	eeyLZ+pHLFGZYaiYS3JGsTLU=
X-Received: by 2002:a05:620a:2991:b0:92e:e559:fe6b with SMTP id af79cd13be357-939803b2bdemr3831189085a.7.1788942966975;
        Wed, 09 Sep 2026 01:36:06 -0700 (PDT)
X-Received: by 2002:a05:620a:2991:b0:92e:e559:fe6b with SMTP id af79cd13be357-939803b2bdemr3831184485a.7.1788942966509;
        Wed, 09 Sep 2026 01:36:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm43210269f8f.34.2026.09.09.01.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:36:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 10:35:48 +0200
Subject: [PATCH v2 5/6] dtc: dt-check-style: Right strip whitespaces,
 leftovers before comments
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-b4-dts-style-checker-continued-lines-v2-5-c5cb4c9d9b66@oss.qualcomm.com>
References: <20260909-b4-dts-style-checker-continued-lines-v2-0-c5cb4c9d9b66@oss.qualcomm.com>
In-Reply-To: <20260909-b4-dts-style-checker-continued-lines-v2-0-c5cb4c9d9b66@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1119;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ue6midJSVmgV6ghv2VQrE9scJG+SviUg2vZbqL6/1Ok=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqoRppQcrE0eiYhvd5qLuRdVja89WZiPRgwjPSX
 AA0rsvlEBSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqEaaQAKCRDBN2bmhouD
 17HSD/0Y65xNy9MMLalHIkW6/OlVvfWkqK9bu96E38bvxdQvfMMMos6oQlyOd9jU1rtedAahpAm
 H1vA81gPTlX+tM8Kn8zmeTJzMieG5f4kNhs0n78O1axOuIs+0O1hBRWPXzAGZq0q2+vI+n/gAxx
 nIKcS5R6NvXTknDfcxPFYhOkwBqxIGFazSMrrTUtyOf4j3NriXjAmhSjzdRGJZirTH5sp2UVo8E
 4q8CKXqNYiSiZ+6RpKAWWUn77LeUhV2nwfrG5joJTE3tXFnsmkOgGgPnNjTlmi+DDHcHa/rORrG
 0wAZYOA4+YQeja696XKDZHnAx4pMVWtrsZ4GNFM11/fQiGT1CpmPdyDRkUeXhz8y5Yw+wRo+1IN
 9h378i/HzlUTbUbBrWOWy3TlOF4QI3gW+I03vgsIIn0Ud2RWWEpkNsA0IQ11sITJI4RqM3J/jrW
 UgJlUMm9aNIN48oF37T74cBFg+SuiB3FGCQXtC6pEiP9eBeVNgCT+zOW2KTEY8d38KUT9w/JWYQ
 sHWAMU2XyeBqxSqGHZVcidy/woGBtsmNb9TRW6RXgsCm3euXNRtSDZA3mPlZrRUmaV6sngAJIZm
 E/TYedGSXVCb7sERA48jknGI72eeUdkQj3OvpTNNkoz8F+NNftOPYmc9Xc9QP/z7YZDhAA6pHNx
 +PPkwr+iLwrqX6g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa11a77 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=3nWb1Bopbj9nUPZVt68A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA5NCBTYWx0ZWRfX4udgg7ymYR3U
 ZP9D2ckZpjBk2IpjwvDlejxrjrPb/g63KbnvxC9Ujwy0kcSlPseyUGiGRYXXAc68gV6PvhVSjud
 JpHbftFECyfYVuiPADaqP+aX7eSkAHvFaU7xezvFX5IoNXyI5KVJM+k0sNDG4D5e0i7qbnZp8bK
 9BTWhgDZE9VizGEbYawxoiJ8HrQ/I55Kynh42bT/xO4rJaQKS2FHlW0r7iL3HXsmRwBaoSosUay
 CBpg/M6TO9o3msyl/hY6hMZcbd9cU9Q+hTyQW0WUjb61/wVxr5kw1oEPWap+rVRd+7G+WML8Bkx
 u/by0h1fKGnScXgd410LHEGYpKYD2BbPVWTU3P7RcMBi5E/b2qEHYoedEx1BNtCUp0tjtNiMlBs
 N/fgwxNNyD08o52Syjd7hP0W6Usp+LTm3j/BHZdrrAMXt1E09EM/XEsqa3yyLx7MO9cALM2phYy
 jGfIGKrkhF9jdp9v6aw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA5NCBTYWx0ZWRfX6HXB2JcAoBZg
 qpZQcxKWsQFtkQpX4uR5PrY6Ods4SbANl2mPo2wJFNxoJlL22jK7RDYpNXhHtZjIwUjQbexYS+B
 gIMvbbKgxXiIT6wvwIKraaggwBkb+U8=
X-Proofpoint-ORIG-GUID: ohhAO3tFcQMLQE40nFDte4tUrUcRSBuf
X-Proofpoint-GUID: ohhAO3tFcQMLQE40nFDte4tUrUcRSBuf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090094

Stripping a comment from a line to get the code leads trailing
whitespace (e.g. in  a line like "enable-active-high; /* comment */")
which will break DtsLine.code.endswith() checks.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 2ff9fdc50367..b10e30f9d5b9 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -91,7 +91,8 @@ class DtsLine:
         self.indent_str = indent_str  # leading whitespace as-is
         self.depth = depth
         self.stripped = stripped      # Code without indentation
-        self.code = _strip_strings_and_comments(stripped)    # Only the code, skipping trailing comments
+        # Only the code, skipping trailing comments and space between code and trailing comment
+        self.code = _strip_strings_and_comments(stripped).rstrip()
         self.is_root = is_root
         self.prop_name = None
         self.continuations = []

-- 
2.53.0

