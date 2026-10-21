Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792564807;
	b=Ly76wXTkBaSgVJ/RgvvUA4NrVWTTS0mtDWZllJ/P4HEzRo32ZdohZUYV0+03uoENv7yr
	 rUfj3NkDRSfofyKPKkVM1Ii/wmvRbkcWCqaoCzwR6wS1KSJ8x7JZFUBNvG5BFtYSuOurz
	 qFCb3RZif0NmVDxy6DRkJThM14OEXHYE9AEUmDndiELArJ5NQb0RGnXkzJ9blsKAopBxv
	 3n3tdQxrthccvqCdduoQRZm4QsjgIRrJD7bhrs+eQwd4uD3BmdaMdIXJGQCHglefc3NPj
	 OJlnfkUa6Rsn+ty20tN0zP//qfOfHPla5h8jXdMuVGyMVkdZWCYroFANJjgpjubS+nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792564807;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9xGaxJuBomS0ZcA/d6E32VSCGzfFIwUHw6NSEAEPgy4=;
	b=wz5kBDXUMHH3RmWANq61myhxFO1c/iaS56pbKi+32ka2yxB1/mvqT/wdojmVUzlTaRdU
	 DoyHGYzYbiyYE8nHgyf1D5dWXpwh3k4alRE8WgTZMq5wfOeLODwTF42sih8EYFAj6rwlJ
	 jz1zmxlG0XpKe/06WGz+pJU8ndMF5/SPf5GNBRI1vGx82mfN+xqzqgwen1I4AYkK/Evz2
	 lBHsKy0WHVQJz0Ph1QjRJ6PPvM4P6pkEJ1vhJoOGW+uHcUPNhlURZnqRnCtESFthLi3v4
	 QEKopemiRbBA/FP/9pSpHEzTBYIolvnfq6YArQ3JE98tpHp6tX2k0xyWVNiATQQua3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GzQVn2af;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FsQluqQl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99CC606A31F
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 06:40:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C99CC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GzQVn2af;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FsQluqQl
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j0Px165032
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 06:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9xGaxJuBomS0ZcA/d6E32VSCGzfFIwUHw6NSEAEPgy4=; b=GzQVn2af4SZ+1aG9
	YDNcPFj+QGm+2SeTuamJD9faEAL/7Qw4q7ddHKcXIFx2VCq4vQqu++2AKhn6gcHz
	HI0zgrwsPZTfPDdJmiYy1/xdfMhM3aMmZaipiPQMUZbIbclaAO3NkEnL8OUmHpZ3
	pXY3TcwW7/eFoDoJXeutKtMkD9NIpdjgQubDuMXqYSXGEwTTWdftjoW0v7/Zv1UD
	WQKMTyy1UczWCsHq4kY4se/4vyCblm6FppDfEQSQyNy7ny/VcB0NwQCyUiVWPgq9
	8URlvStwZuNqdio3TuJo+DitlsoLRF35DcU7pcF4pXg9iHy8AXe3EvoTe3MmR8IR
	9rPIDA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs01jdg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 06:40:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab868fe362so700612a91.2
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 23:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792564805; x=1793169605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9xGaxJuBomS0ZcA/d6E32VSCGzfFIwUHw6NSEAEPgy4=;
        b=FsQluqQlUeMEkHAWlgJXuDZKemNUyHyJcq/5NYZ/64Jx2muUJ/PUe3rcTLxbCyGIpy
         kV87oFtH7trN9M9OE8ug/1lMz0MycDmoqnemTBm774fcte0/XoA4RKCOu/o+0dj798vX
         nZohtbeIrrL+LQbzTszv4Zqk09EoZfLxokrYZFKWE8T/8RH8MaxgiN1ST1AdxvCAnyAJ
         HiSUR6iZFKTYcT4YkSQGxGV2ntsvua68xesJhVebTVBMY54SHsKP+9EqtV9h1+WfB400
         /7WMNl3/fmsfEXWaEJimZ3PBCUYNlf2YARnx659SM2YKrWOvwHB5oTGCZIJ6I7wPzs7i
         DMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792564805; x=1793169605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9xGaxJuBomS0ZcA/d6E32VSCGzfFIwUHw6NSEAEPgy4=;
        b=RTINl0C+ATOt+I9xULt4v5z8Jy1/JWZXH4dCae4UxtrbehqRjJpRqe+AG/45ruDcFk
         OH5cMdqz/CwghLDorTpaY9KvPtArPPMxpFYtUkm+CxO68Uu2vukZQYOqTw8m9D85jP21
         bvAu8gzpzNnVhA5aIcvbve6U7q7RMUxij4gkO2TgD4KV4TPXuLDacAHpWDs/3uKvg9jM
         3d9O55qX4AHqkVT3ixn1dt7urn6oisDMJgNoajnEblMl6HixSUXycgbj3qJbNn3I8Qwb
         tgnhYstlPjQS7cft3hcbOBeto5jV+GooAnI9u6RR6GSfExOEBYDIKAGYT2qmkOVCx8qF
         b+Ew==
X-Forwarded-Encrypted: i=1; AKwUvByxLtymNTs6hPdpe6/P3XD010k749n+rDAQdc2GZJEI82K5rIVgxK+mw9UiWcoXljgx+QI55VeaceAv@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7ftzfGgolsE8ne5A7iC6/P2h4Dhk0maHqJI3yp9co3o5d0xyY
	M2T0n4yTyL2gYGhWh+8bKAPwiq9yvyikxlGvNRA5hG800Zo7g8pv+tSwg/DHYFK1b+kuWxzC0YT
	a53tOu9y1MvJySg2jXsgZQXogb6dt2w8xkNUF3ZHawuyBPXGqj1QjMZKhb5rQKGfz
X-Gm-Gg: AYBFou0jEjdxixn5QPqbztFqqXPQdpaw32mQiZ0ec/Zuncu3SrNeI3drTlzN/WktZMA
	rfwztohnFBbyNg2a+E8lDdY9RhcAirH43WPuaI3gJ9fyFvwe9mgES3iu7WAz0AHnT81p3AiOIEm
	h09UWNvf7bhwcYoVMLEQRCB4tOrQmyp8OuuXdXyniPMc/czW8sJw3LlmoQwwUDtJBSH8ff52DEl
	nRk8F279g6UtvVYA2aPhDBzXg8vE5Uw4lN63N02xeJrEVvoCj2uv/FZm9ueD/zwFyN9fiEHF41K
	oPo2B7dlbE/QR5BFSr8YpV5Nat1UPwD+Qlwqz6Ph0lzlaJ82EgkcnelPBZJf38KzDKNeCs5g/lz
	xZrtnj1yxmEBEsVpPNOKlXg20My5lgsyOP8g=
X-Received: by 2002:a17:90b:2886:b0:3ac:7556:8eda with SMTP id 98e67ed59e1d1-3ad86ed22e0mr880875a91.26.1792564804671;
        Tue, 20 Oct 2026 23:40:04 -0700 (PDT)
X-Received: by 2002:a17:90b:2886:b0:3ac:7556:8eda with SMTP id 98e67ed59e1d1-3ad86ed22e0mr880851a91.26.1792564804142;
        Tue, 20 Oct 2026 23:40:04 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad82f0c0b1sm1163101a91.0.2026.10.20.23.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:40:03 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:09:43 +0530
Subject: [PATCH net-next v3 1/2] dt-bindings: net: qcom,bam-dmux: Add
 memory-region and qcom,vmid properties
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
Message-Id: <20261021-qcom-bam-dmux-vmid-ext-v3-1-cedd1f681102@oss.qualcomm.com>
References: <20261021-qcom-bam-dmux-vmid-ext-v3-0-cedd1f681102@oss.qualcomm.com>
In-Reply-To: <20261021-qcom-bam-dmux-vmid-ext-v3-0-cedd1f681102@oss.qualcomm.com>
To: Stephan Gerhold <stephan@gerhold.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Eric Dumazet <edumazet@kernel.org>, Eric Dumazet <edumazet@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792564791; l=2584;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=+H88cOWbCsr1Tojb6ZNHvvkjVXxKmA9tV/JYivC1jLI=;
 b=jvqnU06bPNXWGokvta/iNg5fJLjcazoX8uHlm/aUb/z/8bSBNChDA7YL3K1sf7iMBoDvfgFk4
 V3alficaPAhDo9Al8/f3faCfBrepXb06z+NeHUJUwuRMx7KtAcwJSqO
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad85e45 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=t_mNxi-BVxZHgpyDufwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyNiBTYWx0ZWRfX/0i4p/cAbeZT
 W88nCq43sTGWaap7H4ZNx0h1MzTv9k9dnvzmCRgSrZKKL2VBqKRmxPB38HW7YzfwFWWRUzw3yRA
 rqWsZIpTBhPvl86gT2RkDd4x6zewJ5w+FAA4wpF4LIHvFJ7ek9ImzU0zTmT8WsSbqnJjNalSY03
 TTEGHVmv/EQmQvPHJB22TSAMXHLmhnJqEBhVkubmY/1O65ytbtyaUrAYVOKcMllt9Ye9CcCudwU
 kRK6mG0xFbuNFd7A7vxXhhdYHf07dG+Uxn74cUc1qL5u1QBitP4dxio+oAvNMpfwq18gPcntjUl
 Mlkbuxqw5+zANZ18FqInN81nThLQIQawDwG35hDNtwC3Js6+Lcw1OcwllwDAQjr0Mu8C4lC2sFE
 P4qyhLwTH6fQ3DNgx4CmG0TZlJSytsMTcAeF+puqPB/X7NewdWkOXhk0MqVDRvIin3/3AeWzhI0
 3Gf5X0/pVhYb39i8uXg==
X-Proofpoint-ORIG-GUID: yyYqXUemHJGRZR9Hsv4rTlST-rJ71QJC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyNiBTYWx0ZWRfX6vGo/SLDgjwy
 yaSEp2nFmO2zljka1yCm/lC+tXsegBz9g0c5zh0gb3PUhUKkEXyrJY7tyL/Tz4V/VZ8sayxw3V7
 clkvU+WHp4Qv0SrczMJr0AfUqN/+Iq8=
X-Proofpoint-GUID: yyYqXUemHJGRZR9Hsv4rTlST-rJ71QJC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210026

Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
domain with restricted access to system memory. BAM-DMUX DMA mappings
must therefore be constrained to a designated region that can be shared
with the modem.

Add an optional memory-region property to reference a restricted DMA
pool used for BAM-DMUX mappings, and a qcom,vmid property to identify the
remote execution environment that is granted access to the pool through
SCM.

Require memory-region whenever qcom,vmid is specified.

Add the qcom,shikra-bam-dmux compatible, with qcom,bam-dmux as fallback,
and require both properties for it.

Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
 .../devicetree/bindings/net/qcom,bam-dmux.yaml     | 36 +++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
index 33746c238513d72366bc52359fb10f275475b331..f7388d24c8612b5a99d5d0e66cfbe2de3b1c9e0d 100644
--- a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
@@ -22,7 +22,11 @@ description: |
 
 properties:
   compatible:
-    const: qcom,bam-dmux
+    oneOf:
+      - const: qcom,bam-dmux
+      - items:
+          - const: qcom,shikra-bam-dmux
+          - const: qcom,bam-dmux
 
   interrupts:
     description:
@@ -72,6 +76,22 @@ properties:
       - const: tx
       - const: rx
 
+  memory-region:
+    maxItems: 1
+    description:
+      Phandle to a reserved-memory node compatible with restricted-dma-pool.
+      The BAM-DMUX device uses the pool for DMA mappings.
+
+  qcom,vmid:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    maxItems: 1
+    items:
+      minimum: 1
+      maximum: 63
+    description:
+      VMID of the remote execution environment that is granted access to the
+      restricted DMA pool through SCM.
+
 required:
   - compatible
   - interrupts
@@ -81,6 +101,20 @@ required:
   - dmas
   - dma-names
 
+dependencies:
+  qcom,vmid: [ memory-region ]
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-bam-dmux
+    then:
+      required:
+        - memory-region
+        - qcom,vmid
+
 additionalProperties: false
 
 examples:

-- 
2.34.1

