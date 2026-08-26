Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA1A3F4DE1
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787742986; cv=none; b=j03UKoAZ7Rd6EIJnsy0Q+dnXPToRJN54iHEyLCyCzGmj2W5DNLjsurJuRi9U4BdJ6QIcrEQr1nCvDrfiyxYIvPDVWQ+Gw4QyXz8rGNpApfifyZRd/A+RyRa8sdEHciqEzNFml+xBfsDA5Ryc4wXx1VLRkJZUDLrsrp/NXE20LfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787742986; c=relaxed/simple;
	bh=0xthswX1q4vjtkGJ4bdNMPARQGYjWQFVq2U7aKzeU38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ukKVxBftifuaQ+g5NPvLEmcCC5ovEeWqBYNe7P0fU3C2qjCqMviF6KKchOcJT5CMeeiaz+HTA9D0I/NE5WpsIFzdHh8xPruQm1LJnz6riBvHhtlQul4dRg+yZQ3f23hULnZS+oMfnsESh3Z5jR+92FwnF0J3q2oTW0TV7VqE7fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OSso9VOJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fbVnT9jl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OSso9VOJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fbVnT9jl"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAHken109300
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:16:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	STHeb6B/4VhTrwbxAWebhCndsyoByaaPT7onxnl2wsM=; b=OSso9VOJfw9O1Qk2
	ZuK9wLgbKJQVjlA+e5T6SRWBP2LUVu5Y2zDF/BIe7deTheUNNS+UvjXvqiZKxOPP
	OZ8QWHEkhkpcow424cDoc7uM80dsPpd6D+9EuZQKN+BRTDdm/GUA5ooxz+9FHmWk
	x+O4WOClOlAwgTTr0tW6wQVF0wgjoglc9IAX+hpUBewMKaKg9j2sUizhQI6L32XC
	WV4uBN/vYK6oq4060ZubzhS1YwOutLBASML348FXtoIm9u3BQmPdJpSXeq7gE4t1
	Gwhjfu6/ATDtpZEtxD67kaxIQk5fVrzUe/KqAI/jhSxyjQK5TmFFNeFJMA/P4IX1
	friXRg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9s9g9hj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:16:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52769fc3f2eso11782311cf.0
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 04:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787742971; x=1788347771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=STHeb6B/4VhTrwbxAWebhCndsyoByaaPT7onxnl2wsM=;
        b=fbVnT9jlubLKvatCg8HnwBkZXvdMeRAvN6JEtWPBsdu09VN2owE7kFXcFCUCL40hq/
         eeAkJimVsZcmnJQWXyBIVXcakILlF8Twigctbcpeh1RF/fYjDo8BfL/2c1g7j5htCnHZ
         itwvx6SEc5ou8/rfKO8fBsveD1K2jNacxKKO6v2U0aHJ3I1gFic+6YqSKEn0ZxufMcFk
         ry5FJ3dtOvxGBZVJmSc3edf7tRX7ugPvOCIf9HyoCAj0GR7Hhc20xUjp87UQ4/QXCkMK
         uIl4veCrG7RbAMfnQKR6s5BdBVgwO4Z3Zi5benpvHeGqmTa/Omuywn2WVNg5Tg5CLO11
         FYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787742971; x=1788347771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=STHeb6B/4VhTrwbxAWebhCndsyoByaaPT7onxnl2wsM=;
        b=XC5wSLk/VREg58DjJosaCSTEwHBEcN4BUuN7gUs1Q9Bj+jT0Y9ZvRXFb161YAlEpp4
         j7kpjv2ewm/Nh0SfKAjjlYudPINmTi5QQR9E6J7OSwVn5DeEWDZk56MhdHfGga/qhxdi
         L7naxANVXnE9Jwp05cOMnjEv/HbSQE8z77ifviUjToaEabTAOVEHp5wT0Pht6ZZGvzYg
         PYnCT0njulPBrEiEQU/1lcMlsJk8UxkLAK1MIKPrskom0utiw8GSGsbZ28A4qCHMQEJD
         onCWsyFI7UMitvU4CjSdI3XLqzFwHHGgdsyR7xGVENrCLyS1nXJfGYvQyYgd46+iUAxi
         EVow==
X-Gm-Message-State: AFuF++mq4oDC8SjemYAGNQgatKTMcMhS473Y2+bL67NJp6xUXm2iSGVu
	uUCtqeFQHPevs1MVEuS2O1/UQFlVLzuVxrxtHFnXUnZh9I2hbx11F93Lxe5DnkbYTIF5xfI2Ppd
	g2I3yl89ushtUDK0iRhUTNtMCMd+YcYPAozebuHNKOF5L/ox9kFNrgcyzTwvWUvyv
X-Gm-Gg: AR+sD11rsZdEClA89Yg3zL3WEM3l1SHYZoDbqlMSDjIzKK7Zf+WrRCvJmmhF+BLoytA
	DKn5nZ2ZyvY7wSgWeHRyVTBWsjW9TyvwGGMXwcI0yoDLfTaJ87E0b4nuQLg/35Ce8lJOxpyqprL
	zQUsELyh3rZQY1SHZvFXGjYbc+1OGhDd7wQ21kMXd7lkDUTd9wO6XOjKyjLXQ+AG3k8kso4jxf/
	E89uzJeOTVHsCU1DUAK8gbd3DSxHSwupW9D/FSbE3f8eRu7pQi2oCtDBQrGIfdkZzhLCb7tSR8B
	YXbHJ7HAi1sXk0bwSb8+uGwsffWo823RL4vRzc58V4IIczpGNco7NebjL7qRsMAQO0wpoZpB8v8
	TiIp/puUY9Evith3F4dcJWEk=
X-Received: by 2002:a05:622a:8c02:b0:52f:64c4:8094 with SMTP id d75a77b69052e-52f64c48c14mr2740531cf.39.1787742970543;
        Wed, 26 Aug 2026 04:16:10 -0700 (PDT)
X-Received: by 2002:a05:622a:8c02:b0:52f:64c4:8094 with SMTP id d75a77b69052e-52f64c48c14mr2739541cf.39.1787742969604;
        Wed, 26 Aug 2026 04:16:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8ea6d0sm4577843a12.13.2026.08.26.04.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:16:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 13:15:53 +0200
Subject: [PATCH v6 01/10] dtc: dt-check-style: Handle sorting of top-level
 nodes and properties
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-n-dts-style-checker-continued-v6-1-f270b1e81f8e@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v6-0-f270b1e81f8e@oss.qualcomm.com>
In-Reply-To: <20260826-n-dts-style-checker-continued-v6-0-f270b1e81f8e@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=29299;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=0xthswX1q4vjtkGJ4bdNMPARQGYjWQFVq2U7aKzeU38=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqjsrs+zCTk56UfQiDtngF7l3uMbuokuwU8V1cR
 6mmDYsHLS6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCao7K7AAKCRDBN2bmhouD
 16ndD/90diJqLu8CI8Pz84bwU0cvAmo38t4zCz/lFtnIBGJuJdIO4ITJvyWhO90uWPzvMp+MGg7
 tPaNd6N/cUYm+GQeb4RO6rOwmXNGrlw9Fdsxa3Lqw+BSdSOkswWtAz9z+6NqLn4r192Tf0RFETM
 Y+kNL7mjYHXwMaoBOjcj22Jkt7fbZgKN9TEREdrEJEqCiJucj6U+2GYWZnUrAXN3qDqdIjYT2po
 mjVhfzD3OScz8M0QTQS2/XOR172GrYZdrVz1Jum+ufJb2G0Y5LDzNeQha0hUkmCBwR/FrY7CdBo
 vM1QxWTsyTmHnRxD802rPwf9DcfuKQHY/77jEjG08sn+tybWMVeECiHb2ryhQ0L64cj6rirl9k1
 DaS+d9wHdW/4XI2BbuczmG1TsaGivUPcuSJ9tLUTD/IN2j2KxafZRsmk9q74mPkFzl5z7am0whn
 ND83m1HW6ySuIk6ydQhglH853jLQfsq9NwCMOGUn27pytQ8dxqChyRfmOEikqy7xk/hJtaLN9sg
 99eEwDDKu7nIoBNXFBWTJOegQKmC07KdRCVfd/NHFfOLPNZBhrATKp1Ti5zpiXsobqO5VYwmQOR
 T8kW3e73NcJeMEIJsnHhlfo9VZ3GNVOjEnaoZTGBFDtozKc9J5d8UcZLyBBjn3QrxZ4gRfhQxUe
 XkRqS84oNziVJzA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: svxD_lyWS_3nRzRf2Q-0DfA2tw437iUn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5NCBTYWx0ZWRfX59mfeD57Yk/z
 yfaeH65qzjoxkX+2+ugz5WRJbfasa7yKLjG6PKbNXgnfHxrn44F3SwkxAKUMACugAQUc6jDtq8g
 S5MTDfmyQlp4dHvgbZUHZZE2W4IvWWc19bNnvOvHBZ31A6M/3rXKm6IbqId9x5VQtu8Mo+QWXmS
 +VpSKacOYrPD09mkEb9aVLD9kS3J8MyTLi+l7vMhE8UdlZZFrez3yUdh2+59aZW97dt+zNRctou
 CeHcKEAJlQ5tUXM2+DujgwG+XCXq9ng8NMbFHv7M7Skk2onYsfjHM7Dq6SLLH9Tu++Oza3MsEbc
 zjhWewZ9NEhVXDrFUJnOfHzGpS99VC1pBpYyT7q738P/Xt4Gd/w6cMhmyma/SlOhS+dfgz1buc1
 ZrQ+9YUWO80PFiIcLuHxsQvGo07/Rqa9gVksuTj+CQcjgHnNg3SGGAoICUuEnoMqC6OrlqP4Dc/
 sB4mbbL52IewpHLbOrg==
X-Authority-Analysis: v=2.4 cv=Xfq5Co55 c=1 sm=1 tr=0 ts=6a8ecafb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=QqLqwGzyZR2lWnMfL0oA:9 a=GdEP5y9prHww6-rp:21
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5NCBTYWx0ZWRfX3cDGvgYCjIDm
 0L4yyXXo+7bGHOUvn4eYLQcdVcafxgLND3l/g0y9ERHh2nSAPxe+5XRakp9vVm1s9HcGaSDzxeO
 7CVLiZGJ0wVPW6PQAHydLJK61F2uFZU=
X-Proofpoint-ORIG-GUID: svxD_lyWS_3nRzRf2Q-0DfA2tw437iUn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260094

Top-level DTS (but not example in the bindings) has only two nodes with
unit-addresses: memory@ and soc@.  There are two special cases here, in
terms of coding style:

1. The unit-address of memory is often not known thus set to @0, because
   it is filled up by bootloader.

2. There is mixture of non-unit-address and unit-address nodes.

Therefore usually the DTS chooses for the top-level part sorting by the
node name, not the unit address.

Also the properties have one exception: 'model' property is supposed to
be before the 'compatible'.  This cannot be applied to the entire DTS,
because sound cards have also 'model' where it is supposed to follow
standard rules (after the 'compatible').  Root node is just special.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                         | 70 ++++++++++++++++++----
 .../bad/dts-child-name-order.dtso                  | 33 ++++++++++
 .../dt-style-selftest/bad/dts-digit-node-order.dts | 40 +++++++++++++
 .../bad/dts-digit-node-order.dtso                  | 41 +++++++++++++
 .../bad/dts-extend-node-child-name-order.dtso      | 26 ++++++++
 .../bad/dts-extend-node-digit-node-order.dtso      | 34 +++++++++++
 .../dt-style-selftest/bad/dts-property-order.dts   | 15 +++++
 .../dt-style-selftest/bad/dts-property-order.dtso  | 59 ++++++++++++++++++
 .../expected/dts-child-name-order.dts.txt          |  1 +
 .../expected/dts-child-name-order.dtso.txt         |  3 +
 .../expected/dts-digit-node-order.dts.txt          |  2 +
 .../expected/dts-digit-node-order.dtso.txt         |  2 +
 .../dts-extend-node-child-name-order.dtso.txt      |  2 +
 .../dts-extend-node-digit-node-order.dtso.txt      |  2 +
 .../expected/dts-property-order.dts.txt            | 14 +++--
 .../expected/dts-property-order.dtso.txt           | 10 ++++
 .../good/dts-child-name-order.dtso                 | 44 ++++++++++++++
 .../good/dts-digit-node-order.dts                  |  3 -
 .../good/dts-digit-node-order.dtso                 | 59 ++++++++++++++++++
 .../good/dts-extend-node-child-name-order.dtso     | 26 ++++++++
 .../good/dts-extend-node-digit-node-order.dtso     | 34 +++++++++++
 .../dt-style-selftest/good/dts-property-order.dts  |  5 ++
 .../dt-style-selftest/good/dts-property-order.dtso | 47 +++++++++++++++
 23 files changed, 554 insertions(+), 18 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 96deffc0d8a7..5a9985baa051 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -77,24 +77,26 @@ def is_preprocessor(stripped):
 
 
 class DtsLine:
-    __slots__ = ('lineno', 'raw', 'linetype', 'indent_str', 'stripped',
+    __slots__ = ('lineno', 'raw', 'linetype', 'indent_str', 'stripped', 'is_root',
                  'prop_name', 'continuations',
-                 'node_name', 'node_addr', 'label', 'ref_name', 'depth',
+                 'node_name', 'node_addr', 'label', 'ref_name', 'parent', 'depth',
                  'closures')
 
-    def __init__(self, lineno, raw, linetype, depth, indent_str, stripped):
+    def __init__(self, lineno, raw, linetype, depth, indent_str, stripped, is_root = False):
         self.lineno = lineno      # 1-based within the block
         self.raw = raw
         self.linetype = linetype
         self.indent_str = indent_str  # leading whitespace as-is
         self.depth = depth
         self.stripped = stripped
+        self.is_root = is_root
         self.prop_name = None
         self.continuations = []
         self.node_name = None
         self.node_addr = None
         self.label = None
         self.ref_name = None
+        self.parent = None        # DtsLine of parent node
         self.closures = 1         # count of '}' on a NODE_CLOSE line
 
 
@@ -228,7 +230,10 @@ def classify_lines(text):
             continue
 
         if code.endswith('{'):
-            dl = DtsLine(i, raw, LineType.NODE_OPEN, depth, indent_str, code)
+            is_root = False
+            if re.search(r'&{/}\s*{', code) or re.search(r'^/\s*\{$', code):
+                is_root = True
+            dl = DtsLine(i, raw, LineType.NODE_OPEN, depth, indent_str, code, is_root=is_root)
             parse_node_header(dl)
             out.append(dl)
             depth += 1
@@ -491,16 +496,24 @@ def _walk_bodies(lines):
     """Yield lists of immediate-child NODE_OPEN lines for each node body
     in the input. Skips ref-nodes (&label) since those don't have an
     intrinsic ordering."""
+    # Array of stacked nodes (parent/child)
     body_stack = [[]]
+    # Current stack of nodes, purely to track parent relationship for each node
+    node_stack = []
+    parent_dl = None
     for dl in lines:
         if dl.linetype == LineType.NODE_OPEN:
+            dl.parent = parent_dl
+            node_stack.append(dl)
             body_stack[-1].append(dl)
             body_stack.append([])
+            parent_dl = dl
             continue
         if dl.linetype == LineType.NODE_CLOSE:
             if len(body_stack) <= 1:
                 # Unbalanced; ignore to avoid crashing on malformed input
                 continue
+            parent_dl = node_stack.pop().parent
             yield body_stack.pop()
             continue
     while body_stack:
@@ -521,12 +534,18 @@ def _natural_sort_key(s):
 
 def check_child_address_order(ctx):
     """Addressed siblings (foo@N) must appear in ascending address
-    order within their parent node body."""
+    order within their parent node body.
+    Exception: Top-level in DTS follows name order, regardless of unit address
+    in memory@N and soc@N nodes
+    """
     for children in _walk_bodies(ctx.lines):
         addressed = []
         for c in children:
             if c.node_addr is None:
                 continue
+            if c.parent and c.parent.is_root:
+                # Top-level does not use unit address sorting usually
+                continue
             try:
                 parts = tuple(int(p, 16) for p in c.node_addr.split(','))
             except ValueError:
@@ -544,12 +563,16 @@ def check_child_name_order(ctx):
     """Unaddressed siblings must appear in natural-sort order by node
     name within their parent node body. Addressed children are scoped
     by check_child_address_order; reference nodes (&label { ... }) and
-    the root node are skipped."""
+    the root node are skipped.
+    However root node has children with and without unit address, and
+    sorting should be only by name."""
     for children in _walk_bodies(ctx.lines):
         unaddressed = []
         for c in children:
             if c.node_addr is not None:
-                continue
+                # Skip nodes with unit address, except when sorting top-level
+                if not c.parent or not c.parent.is_root:
+                    continue
             if c.node_name in (None, '/'):
                 continue
             if c.ref_name is not None:
@@ -591,6 +614,30 @@ def _property_bucket(name):
     return (5 if ',' in stripped else 4, None)
 
 
+def _property_bucket_root(name):
+    """Return the canonical bucket index for a property:
+       0 model (for root nodes only)
+       1 compatible
+    Plus a sub-key inside the bucket for fixed slots (device_type, compatible,
+    reg, reg-names, ranges, status). 'standard' and 'vendor' return None for
+    the sub-key, signalling that the within-bucket key is computed by
+    the pairing rules."""
+    stripped = name.lstrip('#')
+    if name == 'model':
+        return (0, 0)
+    if name == 'compatible':
+        return (1, 0)
+    if name == 'reg':
+        return (2, 0)
+    if name == 'reg-names':
+        return (2, 1)
+    if name == 'ranges':
+        return (3, 0)
+    if name == 'status':
+        return (6, 0)
+    return (5 if ',' in stripped else 4, None)
+
+
 # Declarative pairing rules: each is a callable
 #   (name, all_names) -> anchor_name_or_None
 # If a rule returns an anchor, the property sorts immediately after the
@@ -627,13 +674,16 @@ def _pair_x_names(name, all_names):
 PAIRING_RULES = (_pair_pinctrl_names, _pair_x_names)
 
 
-def _property_sort_key(name, all_names):
+def _property_sort_key(dl, name, all_names):
     """Sort key for a property among its node-body siblings.
 
     Format: (bucket, within_key, tiebreak). 'within_key' for
     standard/vendor buckets follows pairing rules: a property paired
     with anchor X sorts as if it were X with a higher tiebreak."""
-    bucket, fixed_sub = _property_bucket(name)
+    if dl.is_root:
+        bucket, fixed_sub = _property_bucket_root(name)
+    else:
+        bucket, fixed_sub = _property_bucket(name)
     if fixed_sub is not None:
         return (bucket, (), fixed_sub)
 
@@ -668,7 +718,7 @@ def check_property_order(ctx):
         if len(props) < 2:
             continue
         all_names = [p.prop_name for p in props]
-        keyed = [(p, _property_sort_key(p.prop_name, all_names))
+        keyed = [(p, _property_sort_key(dl, p.prop_name, all_names))
                  for p in props]
         for k in range(1, len(keyed)):
             if keyed[k][1] < keyed[k - 1][1]:
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-child-name-order.dtso b/scripts/dtc/dt-style-selftest/bad/dts-child-name-order.dtso
new file mode 100644
index 000000000000..74b49be69e98
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-child-name-order.dtso
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	pmu {
+		compatible = "example,pmu";
+
+		/* Include labels to be sure they do not affect sorting */
+		foo: foo {
+			label = "foo";
+		};
+
+		label_bar: bar {
+			label = "bar";
+		};
+	};
+
+	memory@a0000000 {
+		device_type = "memory";
+		reg = <0x0 0xa0000000 0x0 0x0>;
+	};
+
+	pmu-2 {
+		compatible = "example,pmu";
+
+		/* Just reference labels to avoid strict warnings */
+		example,foo = <&foo>, <&label_bar>;
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-digit-node-order.dts b/scripts/dtc/dt-style-selftest/bad/dts-digit-node-order.dts
new file mode 100644
index 000000000000..74c956398324
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-digit-node-order.dts
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	memory@a0000000 {
+		device_type = "memory";
+		reg = <0x0 0xa0000000 0x0 0x0>;
+	};
+
+	pmu {
+		compatible = "example,pmu";
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0xc0000000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		serial@20000 {
+			compatible = "example,serial";
+			reg = <0x20000 0x1000>;
+		};
+
+		interrupt-controller@10000 {
+			compatible = "example,intc";
+			reg = <0x10000 0x1000>;
+			interrupts = <1 2 3>;
+		};
+
+		serial@30000 {
+			compatible = "example,serial";
+			reg = <0x30000 0x1000>;
+		};
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-digit-node-order.dtso b/scripts/dtc/dt-style-selftest/bad/dts-digit-node-order.dtso
new file mode 100644
index 000000000000..052c02935a45
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-digit-node-order.dtso
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	memory@a0000000 {
+		device_type = "memory";
+		reg = <0x0 0xa0000000 0x0 0x0>;
+	};
+
+	pmu {
+		compatible = "example,pmu";
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0xc0000000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		serial@20000 {
+			compatible = "example,serial";
+			reg = <0x20000 0x1000>;
+		};
+
+		interrupt-controller@10000 {
+			compatible = "example,intc";
+			reg = <0x10000 0x1000>;
+			interrupts = <1 2 3>;
+		};
+
+		serial@30000 {
+			compatible = "example,serial";
+			reg = <0x30000 0x1000>;
+		};
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-extend-node-child-name-order.dtso b/scripts/dtc/dt-style-selftest/bad/dts-extend-node-child-name-order.dtso
new file mode 100644
index 000000000000..d9cf670f19f6
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-extend-node-child-name-order.dtso
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	pmu {
+		compatible = "example,pmu";
+
+		/* Just reference labels to avoid strict warnings */
+		example,foo = <&foo>, <&label_bar>;
+	};
+};
+
+&pmu {
+	/* Include labels to be sure they do not affect sorting */
+	foo: foo {
+		label = "foo";
+	};
+
+	label_bar: bar {
+		label = "bar";
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-extend-node-digit-node-order.dtso b/scripts/dtc/dt-style-selftest/bad/dts-extend-node-digit-node-order.dtso
new file mode 100644
index 000000000000..4b2cf60e5a92
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-extend-node-digit-node-order.dtso
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0xc0000000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+};
+
+&soc {
+	serial@20000 {
+		compatible = "example,serial";
+		reg = <0x20000 0x1000>;
+	};
+
+	interrupt-controller@10000 {
+		compatible = "example,intc";
+		reg = <0x10000 0x1000>;
+		interrupts = <1 2 3>;
+	};
+
+	serial@30000 {
+		compatible = "example,serial";
+		reg = <0x30000 0x1000>;
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-property-order.dts b/scripts/dtc/dt-style-selftest/bad/dts-property-order.dts
index f31abb6ceae4..ebe561e38766 100644
--- a/scripts/dtc/dt-style-selftest/bad/dts-property-order.dts
+++ b/scripts/dtc/dt-style-selftest/bad/dts-property-order.dts
@@ -6,6 +6,11 @@
 /dts-v1/;
 
 / {
+	compatible = "example,test-board", "example,test-soc";
+	model = "DT style selftest";
+	qcom,board-id = <8 0>;
+	chassis-type = "handset";
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -41,3 +46,13 @@ interrupt-controller@10000 {
 		};
 	};
 };
+
+/  {
+	compatible = "example,test-board", "example,test-soc";
+	model = "DT style selftest";
+};
+
+/{
+	compatible = "example,test-board", "example,test-soc";
+	model = "DT style selftest";
+};
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-property-order.dtso b/scripts/dtc/dt-style-selftest/bad/dts-property-order.dtso
new file mode 100644
index 000000000000..64604fa6b8c3
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-property-order.dtso
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/*
+ * Test fixture: Incorrect property order
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	compatible = "example,test-board", "example,test-soc";
+	model = "DT style selftest";
+	qcom,board-id = <8 0>;
+	chassis-type = "handset";
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			reg = <0x0 0x0>;
+			compatible = "arm,cortex-a57";
+			device_type = "cpu";
+			enable-method = "psci";
+		};
+	};
+
+	pmu {
+		compatible = "example,pmu";
+
+		status = "disabled";
+		dma-coherent;
+	};
+
+	soc@0 {
+		ranges = <0 0 0 0xc0000000>;
+		compatible = "simple-bus";
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		interrupt-controller@10000 {
+			reg = <0x10000 0x1000>;
+			interrupts = <1 2 3>,
+				     <4 5 6>,
+				     <7 8 9>;
+			compatible = "example,intc";
+		};
+	};
+};
+
+&{/}  {
+	compatible = "example,test-board", "example,test-soc";
+	model = "DT style selftest";
+};
+
+&{/}{
+	compatible = "example,test-board", "example,test-soc";
+	model = "DT style selftest";
+};
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dts.txt
index e2eea0862102..312a45ed913a 100644
--- a/scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dts.txt
+++ b/scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dts.txt
@@ -1,2 +1,3 @@
 # mode=strict
 bad/dts-child-name-order.dts:16: [child-name-order] child node 'bar' out of name order
+bad/dts-child-name-order.dts:21: [child-name-order] child node 'memory' out of name order
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dtso.txt b/scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dtso.txt
new file mode 100644
index 000000000000..e44ceb24ece8
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dtso.txt
@@ -0,0 +1,3 @@
+# mode=strict
+bad/dts-child-name-order.dtso:17: [child-name-order] child node 'bar' out of name order
+bad/dts-child-name-order.dtso:22: [child-name-order] child node 'memory' out of name order
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-digit-node-order.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-digit-node-order.dts.txt
new file mode 100644
index 000000000000..1f41acdea0b0
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-digit-node-order.dts.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/dts-digit-node-order.dts:29: [child-address-order] child node @10000 out of address order
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-digit-node-order.dtso.txt b/scripts/dtc/dt-style-selftest/expected/dts-digit-node-order.dtso.txt
new file mode 100644
index 000000000000..21db32f6e639
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-digit-node-order.dtso.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/dts-digit-node-order.dtso:30: [child-address-order] child node @10000 out of address order
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-extend-node-child-name-order.dtso.txt b/scripts/dtc/dt-style-selftest/expected/dts-extend-node-child-name-order.dtso.txt
new file mode 100644
index 000000000000..d7941a891135
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-extend-node-child-name-order.dtso.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/dts-extend-node-child-name-order.dtso:23: [child-name-order] child node 'bar' out of name order
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-extend-node-digit-node-order.dtso.txt b/scripts/dtc/dt-style-selftest/expected/dts-extend-node-digit-node-order.dtso.txt
new file mode 100644
index 000000000000..408796d5bb03
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-extend-node-digit-node-order.dtso.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/dts-extend-node-digit-node-order.dtso:24: [child-address-order] child node @10000 out of address order
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt
index 4bc21328625f..aab048a0ba3b 100644
--- a/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt
+++ b/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt
@@ -1,6 +1,10 @@
 # mode=strict
-bad/dts-property-order.dts:15: [property-order] property 'compatible' out of canonical order (should sort before 'reg')
-bad/dts-property-order.dts:16: [property-order] property 'device_type' out of canonical order (should sort before 'compatible')
-bad/dts-property-order.dts:25: [property-order] property 'dma-coherent' out of canonical order (should sort before 'status')
-bad/dts-property-order.dts:30: [property-order] property 'compatible' out of canonical order (should sort before 'ranges')
-bad/dts-property-order.dts:40: [property-order] property 'compatible' out of canonical order (should sort before 'interrupts')
+bad/dts-property-order.dts:10: [property-order] property 'model' out of canonical order (should sort before 'compatible')
+bad/dts-property-order.dts:12: [property-order] property 'chassis-type' out of canonical order (should sort before 'qcom,board-id')
+bad/dts-property-order.dts:20: [property-order] property 'compatible' out of canonical order (should sort before 'reg')
+bad/dts-property-order.dts:21: [property-order] property 'device_type' out of canonical order (should sort before 'compatible')
+bad/dts-property-order.dts:30: [property-order] property 'dma-coherent' out of canonical order (should sort before 'status')
+bad/dts-property-order.dts:35: [property-order] property 'compatible' out of canonical order (should sort before 'ranges')
+bad/dts-property-order.dts:45: [property-order] property 'compatible' out of canonical order (should sort before 'interrupts')
+bad/dts-property-order.dts:52: [property-order] property 'model' out of canonical order (should sort before 'compatible')
+bad/dts-property-order.dts:57: [property-order] property 'model' out of canonical order (should sort before 'compatible')
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-property-order.dtso.txt b/scripts/dtc/dt-style-selftest/expected/dts-property-order.dtso.txt
new file mode 100644
index 000000000000..e9b3ac985718
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-property-order.dtso.txt
@@ -0,0 +1,10 @@
+# mode=strict
+bad/dts-property-order.dtso:11: [property-order] property 'model' out of canonical order (should sort before 'compatible')
+bad/dts-property-order.dtso:13: [property-order] property 'chassis-type' out of canonical order (should sort before 'qcom,board-id')
+bad/dts-property-order.dtso:21: [property-order] property 'compatible' out of canonical order (should sort before 'reg')
+bad/dts-property-order.dtso:22: [property-order] property 'device_type' out of canonical order (should sort before 'compatible')
+bad/dts-property-order.dtso:31: [property-order] property 'dma-coherent' out of canonical order (should sort before 'status')
+bad/dts-property-order.dtso:36: [property-order] property 'compatible' out of canonical order (should sort before 'ranges')
+bad/dts-property-order.dtso:46: [property-order] property 'compatible' out of canonical order (should sort before 'interrupts')
+bad/dts-property-order.dtso:53: [property-order] property 'model' out of canonical order (should sort before 'compatible')
+bad/dts-property-order.dtso:58: [property-order] property 'model' out of canonical order (should sort before 'compatible')
diff --git a/scripts/dtc/dt-style-selftest/good/dts-child-name-order.dtso b/scripts/dtc/dt-style-selftest/good/dts-child-name-order.dtso
new file mode 100644
index 000000000000..1fd75a6285ce
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/good/dts-child-name-order.dtso
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	memory@a0000000 {
+		device_type = "memory";
+		reg = <0x0 0xa0000000 0x0 0x0>;
+	};
+
+	pmu {
+		compatible = "example,pmu";
+
+		/* Include labels to be sure they do not affect sorting */
+		label_bar: bar {
+			label = "bar";
+		};
+
+		foo: foo {
+			label = "foo";
+		};
+	};
+
+	pmu-2 {
+		compatible = "example,pmu";
+
+		/* Just reference labels to avoid strict warnings */
+		example,foo = <&foo>, <&label_bar>;
+	};
+};
+
+&pmu {
+	/* Include labels to be sure they do not affect sorting */
+	label_bar_2: bar-2 {
+		label = "bar";
+	};
+
+	foo_2: foo-2 {
+		label = "foo";
+	};
+}
diff --git a/scripts/dtc/dt-style-selftest/good/dts-digit-node-order.dts b/scripts/dtc/dt-style-selftest/good/dts-digit-node-order.dts
index cdf3f91ebe01..2b21dde7f3c8 100644
--- a/scripts/dtc/dt-style-selftest/good/dts-digit-node-order.dts
+++ b/scripts/dtc/dt-style-selftest/good/dts-digit-node-order.dts
@@ -5,13 +5,10 @@ / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
-	/* TODO: uncomment when child-address-order is fixed for top-level */
-	/*
 	memory@a0000000 {
 		device_type = "memory";
 		reg = <0x0 0xa0000000 0x0 0x0>;
 	};
-	*/
 
 	pmu {
 		compatible = "example,pmu";
diff --git a/scripts/dtc/dt-style-selftest/good/dts-digit-node-order.dtso b/scripts/dtc/dt-style-selftest/good/dts-digit-node-order.dtso
new file mode 100644
index 000000000000..efafa1cccc15
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/good/dts-digit-node-order.dtso
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	memory@a0000000 {
+		device_type = "memory";
+		reg = <0x0 0xa0000000 0x0 0x0>;
+	};
+
+	pmu {
+		compatible = "example,pmu";
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0xc0000000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		interrupt-controller@10000 {
+			compatible = "example,intc";
+			reg = <0x10000 0x1000>;
+			interrupts = <1 2 3>;
+		};
+
+		serial@20000 {
+			compatible = "example,serial";
+			reg = <0x20000 0x1000>;
+		};
+
+		serial@30000 {
+			compatible = "example,serial";
+			reg = <0x30000 0x1000>;
+		};
+	};
+};
+
+&soc {
+	interrupt-controller@110000 {
+		compatible = "example,intc";
+		reg = <0x110000 0x1000>;
+		interrupts = <1 2 3>;
+	};
+
+	serial@120000 {
+		compatible = "example,serial";
+		reg = <0x120000 0x1000>;
+	};
+
+	serial@130000 {
+		compatible = "example,serial";
+		reg = <0x130000 0x1000>;
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/good/dts-extend-node-child-name-order.dtso b/scripts/dtc/dt-style-selftest/good/dts-extend-node-child-name-order.dtso
new file mode 100644
index 000000000000..b00c2a195179
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/good/dts-extend-node-child-name-order.dtso
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	pmu {
+		compatible = "example,pmu";
+
+		/* Just reference labels to avoid strict warnings */
+		example,foo = <&foo>, <&label_bar>;
+	};
+};
+
+&pmu {
+	/* Include labels to be sure they do not affect sorting */
+	label_bar: bar {
+		label = "bar";
+	};
+
+	foo: foo {
+		label = "foo";
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/good/dts-extend-node-digit-node-order.dtso b/scripts/dtc/dt-style-selftest/good/dts-extend-node-digit-node-order.dtso
new file mode 100644
index 000000000000..1ce18afb80de
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/good/dts-extend-node-digit-node-order.dtso
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0xc0000000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+};
+
+&soc {
+	interrupt-controller@10000 {
+		compatible = "example,intc";
+		reg = <0x10000 0x1000>;
+		interrupts = <1 2 3>;
+	};
+
+	serial@20000 {
+		compatible = "example,serial";
+		reg = <0x20000 0x1000>;
+	};
+
+	serial@30000 {
+		compatible = "example,serial";
+		reg = <0x30000 0x1000>;
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/good/dts-property-order.dts b/scripts/dtc/dt-style-selftest/good/dts-property-order.dts
index 0e183e3459cd..3d847cc9fa3e 100644
--- a/scripts/dtc/dt-style-selftest/good/dts-property-order.dts
+++ b/scripts/dtc/dt-style-selftest/good/dts-property-order.dts
@@ -6,6 +6,11 @@
 /dts-v1/;
 
 / {
+	model = "DT style selftest";
+	compatible = "example,test-board", "example,test-soc";
+	chassis-type = "handset";
+	qcom,board-id = <8 0>;
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/scripts/dtc/dt-style-selftest/good/dts-property-order.dtso b/scripts/dtc/dt-style-selftest/good/dts-property-order.dtso
new file mode 100644
index 000000000000..5ae78541f68b
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/good/dts-property-order.dtso
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/*
+ * Test fixture: Incorrect property order
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	model = "DT style selftest";
+	compatible = "example,test-board", "example,test-soc";
+	chassis-type = "handset";
+	qcom,board-id = <8 0>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a57";
+			reg = <0x0 0x0>;
+			enable-method = "psci";
+		};
+	};
+
+	pmu {
+		compatible = "example,pmu";
+		dma-coherent;
+
+		status = "disabled";
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0xc0000000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		interrupt-controller@10000 {
+			compatible = "example,intc";
+			reg = <0x10000 0x1000>;
+			interrupts = <1 2 3>;
+		};
+	};
+};

-- 
2.53.0

