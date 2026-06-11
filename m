Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7044A13BA
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 18:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781203045; cv=none; b=TkN6kJGMMXFihe1iYawOT9qvcaof9kXskRTg484IKYbTnUBP9Ek6JUuPEQOkrR7ALrPnTS9TFjqwg7OBQ+hpYCFyaCqIzOUP8avfnXgRUageLnnYS09KeA8PbhHK0+Oiiw6dX5HRNo5pbGNQo7VhS/t2N6gdw2C1wYvPQ0n/V6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781203045; c=relaxed/simple;
	bh=5T444QwrYmsTwO3v1gCqDgxdhU4Jck3L9IB07WNXPS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iLg8OmeBqpMS0W6UpDai17bXxwwaBnGCah+kqgsuQ/jQJzgZ6yreumxnWLmIMngPq2r5RoVzdhy/0q3lDQdCQ/LQ9aGZOkGvcXRsBrRvMdtJcvYvVVh/N7Y4TjBZZo08k03eKK/Fn9vQQtD5w3p5G8wAFfWRcHhDlFtDaMrV8Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y7RcbeXr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eJXIMIyL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y7RcbeXr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eJXIMIyL"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BIS4rM1433838
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 18:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AyxmGXU7tCETamEQ37pkjmBcE0pG+FwQBF/uCJxPNaQ=; b=Y7RcbeXrUvc6Z1/b
	nZ4FOXt/Ipi+MICJydJ5E7HgxkF/zc0pd36ESrMyQty/5HKx8rB8q90epNh9ZSTY
	s4IRDgyOn/teB7YqIPL/M//AxaBn7tfmitVTFt6o6wx11Ppq6KMvwa50tc7kdHEA
	PzCzNUlz5hvFg9OUNq7uk53/2GlIPXUNIhRdO8s2JhsN1z//Uz74bi+bIVgxfdPC
	kYqX2AtCmhkc4mPU+zdTDmf5Zq+Pmm+ahs2XZP2NMgzf/uCGh1BD9NIF66np6GWJ
	nrqB6KGLHPt54PAJGeLQidsD+ixDwDVOv+DQqKs97+feaM0mBX9DW6MEOrNOjfL6
	YT82+w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe7051js-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 18:37:22 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c857fa2706aso46449a12.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781203041; x=1781807841; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AyxmGXU7tCETamEQ37pkjmBcE0pG+FwQBF/uCJxPNaQ=;
        b=eJXIMIyLiZGVDS+i2IvKh8DWWRg27/1m4j0vJmuv5+ppQBRQCytpZwdARK35U9l3ut
         DP8uPUYjcJxeX36FbRImrc9329QsTyZ3SkocLrO6oLZGKo3qu0R5K8hKURznwj9hJ9WE
         v6fC9iGY7rH/J0EpJz6eM5Xi5ACbevZgUqV8FvmCRN+t0mjoavvVck9bztEJCkUMNXZZ
         qJpBtfqBLNSoyahrL7voX1c4h2wb99jOiCaFyQ/0gR3uvIodawFsYXtNRyWSd44UWnko
         Q/xY4bzVENjVhBcuTFvjq6dDAky04AqQtZyPFzqIZw9UKGKr1ukmKPJK4/H76n3aXnGa
         /iag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781203041; x=1781807841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AyxmGXU7tCETamEQ37pkjmBcE0pG+FwQBF/uCJxPNaQ=;
        b=pgoPPJMpx31gXeu+N2of6Lqmpf+p0GdACpABO518Emy41Sv3e4YJejkZOsLaVBsyQs
         ei6PiV9OuEjfr5TsHcz/z7WVZGKzciKkFG7nZAX91/N0HIn/irVcAMslB+3YHZVAr/Wm
         HojbVMgLKVjigKG9c70Wl5mX7qalcIxL8LjkC0+Gjg8bTfdSZXd8X2eGvYjKIfTFxkG4
         cHuH0E0WHDvoBJ4CFBg6mxrvnz1VYZjgX8dt4eJqcuKgtX5e8Ybo9flgBjbK+SuPQHCB
         mrrYBz2THAsFGFE+9alC6Y5aBPucQjED6/rLvWXVwJnAIN0480QtHygdDG199Oequh8b
         v5TQ==
X-Forwarded-Encrypted: i=1; AFNElJ8tCU6ybA8HKjK/nJ3HijgFu0U7HRSztuCm4+i4mzPbbbjra6pJ69P8B15CKtyFPKQNZFlyr80TosrM@vger.kernel.org
X-Gm-Message-State: AOJu0YycO2rkUccj6978ZtRL42+D/Zi2fnoA9Tvudq3QFVF7baFxsAUa
	DG/MXS4CEXP4B6DqVRyCbzxRe0XU0GjWX68k4Lqe+MdjCATV/F5sTLNQ4I4kgDhtdRQCoXZOAI7
	QpyxO7jR+SrZTfEZR4dxS+Wexarr+dONhw9MUZCn0SYl6qRLYRPA0BcZncV0t+2mx
X-Gm-Gg: Acq92OFwkYO7yzKN+x6i0AUaSlmgawjgcoOPHmm/Kj7pcRX4h6wHR/xO73N9mAadnpK
	fGVAqqZlzYRh53/MsummeiPJXZXP1bMlJjoeNWuFIq+08yW3lQVeyqmnhHQ+ucuSxzKS0WryW0F
	xVi1LYcryQKVawfHfEga3U2CUbtx/R+o7dd0ubfvgn9z+F75T7WDggqx+5/5bxDsVTGcWGHLbdI
	MaUqYapf0Hnc7PG/c0Ho7qBPZQ25zsx2LDrd/AG/jwPgXZwxCStbWlVwERCTZRoHX172bv9KV2S
	UapsHkZd5BQX/0/FoYBFDlodcZYmXkV218k1soEtcqJnWMEnPc4DG8rpG9T+gATH6YiP58yUyMn
	2ZwjWoZOx/WZCcc1sNt2nO/t52+CItOMmxoQQs1dLzipw8EfYfEI=
X-Received: by 2002:a05:6a00:414d:b0:842:732c:568b with SMTP id d2e1a72fcca58-84336bc69f3mr4345828b3a.22.1781203040956;
        Thu, 11 Jun 2026 11:37:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:414d:b0:842:732c:568b with SMTP id d2e1a72fcca58-84336bc69f3mr4345780b3a.22.1781203040445;
        Thu, 11 Jun 2026 11:37:20 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bbbfacsm2555666b3a.20.2026.06.11.11.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 11:37:20 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 00:06:57 +0530
Subject: [PATCH RFC 1/9] dt-bindings: net: qcom,ethqos: add
 qcom,shikra-ethqos compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-shikra_ethernet-v1-1-f0f4a1d19929@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
In-Reply-To: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781203027; l=2195;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=5T444QwrYmsTwO3v1gCqDgxdhU4Jck3L9IB07WNXPS8=;
 b=Y8TuyI8PC+fi6lUIQ3mPFu/M5131hg3c7XDWYgoxoDB1Fd/WfaGv9PKijnwpIL8ceTzv9YHRr
 3aHjmo3PKU6CzJz8jJBD+WK6JDJtkQlULNu5b5xAVGiJM0RbhvweZN9
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: NtyvgWrcU1W4F66oOVPrH_OLu39SRNjw
X-Authority-Analysis: v=2.4 cv=B9eJFutM c=1 sm=1 tr=0 ts=6a2b0062 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=w-NwtAtCphaO0WLdcGwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfX6AxOZ3+To4La
 n04gl98/C6pRTWWtI5pVRw+IO7a2K/bhW+gXWtSfxIipyhsar0cmvrHGiLxNYnCZPSlc92KiiX3
 mqUlNuhXXKfH1qMimwLjQF4MDZDnLZcQRIioY6WiYvvfiByJC6tSu4S7ZFuZ95JEZZYNR8JbsG0
 zjeqsAWMyLF39ZHQXJ9za7tNjwrs1naGO48Yd3Qxons4TnSiykz0DilaxQJMoVVDtt7G/BW2YSm
 FtHoutXBNOk9Et+Ywy+LnnMQZfuDDxk8r6zksc4JYhW9S+5WlhozF0SZgq/UxbOx4i7tKI5vayg
 PvAEZ+QeNxcAkLi7LkmJjEGOBIUgcBS53PCMIF9GWOCehAOF2o9i8Kjze8D3yJKdF43wodAyz9v
 WBqtRM3wlR0feUPm5DPmOxeon7Oi30i5Uh8co1YnXpKwPxC9drbTdpNR/5nkYcV0NhqS2rwPYQB
 g3kqlwaBKB+e0jlDTDQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfX/LdT9Cxzvt6P
 DHbcafjqOHpbPlUSNK3C6W7K6VJxme9+cVyn+xfHNw0v7Y4yXRtv+uny7OGx3P4XS6UPZ1JwUPK
 krC89+CuI9d65ybNm2qQXN+GyqnSZUk=
X-Proofpoint-ORIG-GUID: NtyvgWrcU1W4F66oOVPrH_OLu39SRNjw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110185

Shikra's EMAC requires three additional clocks beyond the standard four
(axi, axi-noc, pcie-tile-axi-noc) for NOC interconnect voting.  Add the
compatible string and extend clock-names with a oneOf variant for this
seven-clock configuration.

The AXI clock appears twice (as "stmmaceth" and "axi") because the
stmmac core and the driver's NOC bulk-clock array each consume one
reference; CCF refcounting makes this safe.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../devicetree/bindings/net/qcom,ethqos.yaml       | 31 ++++++++++++++++------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index 423959cb928d945aa3e758a3c803d12bd61ec42b..4528946856c8c6e33bc6ad4159ed111f35ec37d9 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -32,6 +32,7 @@ properties:
           - qcom,qcs404-ethqos
           - qcom,sa8775p-ethqos
           - qcom,sc8280xp-ethqos
+          - qcom,shikra-ethqos
           - qcom,sm8150-ethqos
 
   reg:
@@ -57,16 +58,30 @@ properties:
       - const: sfty
 
   clocks:
-    maxItems: 4
+    minItems: 4
+    maxItems: 7
 
   clock-names:
-    items:
-      - const: stmmaceth
-      - const: pclk
-      - const: ptp_ref
-      - enum:
-          - rgmii
-          - phyaux
+    oneOf:
+      - items:
+          - const: stmmaceth
+          - const: pclk
+          - const: ptp_ref
+          - enum:
+              - rgmii
+              - phyaux
+      - description: |
+          Extended clock list for platforms with AXI NOC clocks that require
+          explicit driver management (e.g. Shikra). GCC_EMAC0_AXI_CLK appears
+          as both "stmmaceth" and "axi"; CCF refcounting makes this safe.
+        items:
+          - const: stmmaceth
+          - const: pclk
+          - const: ptp_ref
+          - const: rgmii
+          - const: axi
+          - const: axi-noc
+          - const: pcie-tile-axi-noc
 
   iommus:
     maxItems: 1

-- 
2.34.1

